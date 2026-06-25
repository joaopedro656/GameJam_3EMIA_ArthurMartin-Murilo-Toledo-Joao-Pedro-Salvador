extends Area2D

# Novo sinal criado, pois por padrão não existe o sinal "coletado"
signal collected

# Toda vez que um corpo entra na Area2D, a função _on_body_entered recebe
# automaticamente as informações do nó que entrou nessa área, registradas
# pelo parâmetro body
func _on_body_entered(body: Node2D) -> void:
		# Se o nome do nó que entrou na área for Player, execute as ações
	if body.name == "Player":
		# printe no console "+1"
			print("+1")
		  # Emita o sinal collected (criado no início do código)
			collected.emit()
	  # Remova a moeda da cena
			queue_free()
