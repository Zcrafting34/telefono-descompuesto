extends Area2D
class_name hitbox

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.TakeDamage(1)
