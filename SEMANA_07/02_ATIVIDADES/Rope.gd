extends Node2D

var player
var player2
var ppos
var p2pos
var linked := false
var pull : Vector2
var pull2 : Vector2



export(float, 1.0, 5.0) var pull_factor = 2.5
export(int, 1, 20) var minimum_distance = 15
export(float, 0.0, 1.0) var priority_percent = 1.3

func _ready():
	link_players()

func _physics_process(_delta):
	if linked:
		calc_pull()

#liga os players à corda
func link_players():
	
	#Previne que a corda enlouqueça
	yield(get_tree(), "idle_frame")
	
	player = get_parent().get_node("Player")
	ppos = $Player1_Joint.global_position 
	$Player1_Joint.node_b = player.get_path()
	
	player2 = get_parent().get_node("Player2")
	p2pos = player2.get_node("Position2D").position
	var p2seg = $Segments.get_child(0)
	var p2joint = p2seg.get_node("PinJoint2D")
	p2joint.node_b = player2.get_path()
	
	linked = true

#calcula a tração da corda
func calc_pull():
	
	# a tração da corda é a soma da distância entre o polo sul de cada segmento
	# e o pólo norte do vizinho (pense em ímãs)
	# segmentos 'relevantes' determinam a direção da atração,
	# Considerando que todos os segmentos juntos determinam a força total.
	# segmentos são considerados relevantes, se estiverem mais próximos do player atual,
	# do que o primeiro segmento em colisão (do ponto de vista do jogador atual)
		
	pull = Vector2.ZERO
	
	var direction = $Player1_Joint.global_position.direction_to(ppos)
	var force = direction * $Player1_Joint.global_position.distance_to(ppos)
	var relevant = find_relevant(true)
	
	pull2 = Vector2.ZERO
	var newp2pos = player2.global_position + p2pos
	var direction2 = $Segments.get_child(0).get_node("PinJoint2D").global_position.direction_to(newp2pos)
	var force2 = direction * $Segments.get_child(0).get_node("PinJoint2D").global_position.distance_to(newp2pos)
	var relevant2 = find_relevant(false)
	
	for i in $Segments.get_children():
		var p := Vector2.ZERO
		
		var next = null
		var next_idx = i.get_index() + 1
		if next_idx < $Segments.get_children().size():
			next = $Segments.get_child(next_idx)
		
		if next:
			var n = i.get_node("North_Pole").global_position
			var s = next.get_node("South_Pole").global_position
			p = s.direction_to(n) * s.distance_to(n)
			
			#add force percentage to p, so longer distances gain priority
			p *= (1 + p.length()/(1.0/priority_percent))
		
		force += p
		if relevant.has(i):
			direction += p
		
		force2 += p
		if relevant2.has(i):
			direction2 += p
	
	pull = direction.normalized() * force.length() * pull_factor
	pull2 = -1 * direction2.normalized() * force2.length() * pull_factor
	
	if pull.length() < minimum_distance:
		pull = Vector2.ZERO
	if pull2.length() < minimum_distance:
		pull2 = Vector2.ZERO
	
	player.pull = pull
	player2.pull = pull2


func find_relevant(var for_player1: bool) -> Array:
	var r = []
	
	var c = $Segments.get_children()
	
	# como o player1 está no final da cadeia, o Array deve ser repetido ao contrário.
	if for_player1:
		c.invert()
	
	for i in c:
		r.append(i)
		if i.colliding:
			break
	
	if for_player1:
		r.invert()
	return r

