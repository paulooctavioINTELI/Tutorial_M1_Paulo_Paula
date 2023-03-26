extends RigidBody2D

var colliding : bool


func _ready():
	friction = 1.0

func _physics_process(_delta):
	colliding = get_colliding_bodies().size() > 0
	deform()

#Calcula a deformação do sprite do segmento da corda
func deform():
	var scale_x = 0.05
	var scale_y = 0.059
	var scale_range = 20
	var force = get_parent().get_parent().pull.length()
	var deform = clamp((scale_range / 60) * force, 0, scale_range)
	
	$Sprite.scale = Vector2((scale_x), (scale_y + deform))
