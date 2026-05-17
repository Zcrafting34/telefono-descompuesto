extends Area2D
class_name hitbox

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.Healt -= 1
		print("lke")
