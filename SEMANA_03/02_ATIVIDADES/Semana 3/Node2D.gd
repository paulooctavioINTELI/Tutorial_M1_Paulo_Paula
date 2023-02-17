extends Node2D


var list1: Array = [
	"Lapis",
	"Caneta",
	"Borracha"
] #lista preenchida 

var list2: Array = [] #lista vázia

func _on_Button_pressed() -> void:
	for i in list1:
		$RichTextLabel.bbcode_text = $RichTextLabel.bbcode_text + i + "\n"

func showEditableList(): # função que retorna o texto na tela
	$RichTextLabel2.bbcode_text = ""
	for i in list2:
		$RichTextLabel2.bbcode_text = $RichTextLabel2.bbcode_text + i + "\n"

func showText(): #função que retorna texto na tela
	$Label.text = "Paulo Octavio é o cara mais incrivel"

func _on_Button2_pressed() -> void: # reçebe o valor inserido pelo usuário e retorna na tela.
	list2.insert(0, $TextEdit.text)
	showEditableList()




func _on_Button3_pressed() -> void:
	list2 = []
	$RichTextLabel2.bbcode_text = ""
	$TextEdit.text = ""


func _on_Button4_pressed() -> void:
	showText()
	pass # Replace with function body.
