extends CharacterBody2D
class_name Enemy
@onready var Player_ = $"../player"
@onready var timer =$Timer
var Speed = 50

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		$AnimationPlayer.play("Salto")
		velocity.x = Speed * (global_position.direction_to(Player_.global_position).x)
	else:
		velocity.x = 0
		
	if is_on_floor():
		$AnimationPlayer.play("Idle")
		
	move_and_slide()


func _on_timer_timeout() -> void:
	velocity.y = -300
