extends KinematicBody2D

var input := Vector2.ZERO
var pull := Vector2.ZERO
var movement := Vector2.ZERO

const speed = 200

#Define o movimentpo do player 2
func _physics_process(_delta):	
	if Input.get_action_strength("ui_right2"):
		$AnimatedSprite.rotation_degrees = 90
	if Input.get_action_strength("ui_left2"):
		$AnimatedSprite.rotation_degrees = -90
	if Input.get_action_strength("ui_up2"):
		$AnimatedSprite.rotation_degrees = 0
	if Input.get_action_strength("ui_down2"):
		$AnimatedSprite.rotation_degrees = 180

	input = Vector2.ZERO
	input.x = Input.get_action_strength("ui_right2") - Input.get_action_strength("ui_left2")
	input.y = Input.get_action_strength("ui_down2") - Input.get_action_strength("ui_up2")
	
	movement = move_and_slide(input.normalized() * speed + pull)

