extends KinematicBody2D

var input := Vector2.ZERO
var pull := Vector2.ZERO
var movement := Vector2.ZERO

const speed = 200

#Define o movimento do player
func _physics_process(_delta):
	if Input.get_action_strength("ui_right"):
		$AnimatedSprite.rotation_degrees = 90
	if Input.get_action_strength("ui_left"):
		$AnimatedSprite.rotation_degrees = -90
	if Input.get_action_strength("ui_up"):
		$AnimatedSprite.rotation_degrees = 0
	if Input.get_action_strength("ui_down"):
		$AnimatedSprite.rotation_degrees = 180
		
	input = Vector2.ZERO
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	movement = move_and_slide(input.normalized() * speed + pull)
