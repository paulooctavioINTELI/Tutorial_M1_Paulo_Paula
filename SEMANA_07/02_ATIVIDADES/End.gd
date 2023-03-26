extends Node2D

#Anima a exibição do texto
func _ready() -> void:
	$RichTextLabel.percent_visible = 0
	$Tween.interpolate_property(
		$RichTextLabel, "percent_visible", 0, 1, 5,
		Tween.TRANS_LINEAR, Tween.EASE_OUT
	)
	$Tween.start()
