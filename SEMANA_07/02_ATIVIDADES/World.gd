extends YSort

var bWin: bool = false
var rWin: bool = false


func _physics_process(delta: float) -> void:
	if bWin:
		$Player/CollisionShape2D.disabled = true
	if rWin:
		$Player2/CollisionShape2D.disabled = true
	if bWin and rWin:
		get_tree().change_scene("res://End.tscn")

#Ao encontrar a area vermelha desabilita o player 1
func _on_RedArea_body_entered(body: Node) -> void:
	if body == $Player2:
		rWin = true
		$Rope.linked = false
		$Rope.hide()
		$Player2.hide()
		$Player2.pull = Vector2.ZERO
		$Player.pull = Vector2.ZERO

#Ao encontrar a area vermelha desabilita o player 2
func _on_BlueArea_body_entered(body: Node) -> void:
	if body == $Player:
		bWin = true
		$Rope.linked = false
		$Rope.hide()
		$Player.hide()
		$Player2.pull = Vector2.ZERO
		$Player.pull = Vector2.ZERO



