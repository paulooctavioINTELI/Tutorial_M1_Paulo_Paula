extends Node2D

var finish = false

#Anima a exibição do texto
func _ready() -> void:
	$RichTextLabel.percent_visible = 0
	$Tween.interpolate_property(
		$RichTextLabel, "percent_visible", 0, 1, 5,
		Tween.TRANS_LINEAR, Tween.EASE_OUT
	)
	$Tween.start()

#Ao finalizar a animação exibe o tutorial
func _process(delta: float) -> void:
	if finish:
		$Label.show()
		$Setas.show()
		$Wasd.show()
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene("res://World.tscn")


func _on_Tween_tween_completed(object: Object, key: NodePath) -> void:
	finish = true
