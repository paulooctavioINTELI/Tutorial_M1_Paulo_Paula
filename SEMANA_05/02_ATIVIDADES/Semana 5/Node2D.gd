extends Node2D

var teste = false
var valor = 0
#var número = 0
var numero: int = 0
#lista = []
var lista = []
# Variavel nome não havia sido declarada
var nome = ""

func _on_Button_pressed():
	#Coletando dados inseridos pelo usuário
	#número = int(LineEdit.text)
	numero = int($LineEdit.text)
	#Estava sendo definido que LineEdit deveria receber o valor da variavel nome
	#$LineEdit.text = nome
	nome = $LineEdit.text.split(" ")[1]
	print(nome)


func _on_Button2_pressed():
	#Incrementando o número inserido pelo usuário
	for i in range(10):
		#Numero+=i
		numero += i
		#lista.append(Numero)
		lista.append(numero)
	#$Label.text = numero
	$Label.text = str(numero)


func _on_Button3_pressed():
	#Mudando o nome do usuário de acordo com os dados da lista
	#Se houver algum número ímpar o nome deve adicionar "baldo" ao final
	
	#A variavel cont não havia sido declarada
	var cont = 0
	#A variavel cont não havia sido declarada
	var i = 0
	
	while(i < len(lista)):
		#cont=0
		#i=0
		if(lista[i]%2==1):
			cont+=1
		i += 1
	if(cont != 1):
		nome = nome+" baldo"
	$Label2.text = nome
