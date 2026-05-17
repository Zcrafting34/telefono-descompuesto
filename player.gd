extends CharacterBody2D
class_name Player

var Healt = 2
const SPEED = 100.0
const JUMP_VELOCITY = -300.0

var jumps_left = 2


func _physics_process(delta: float) -> void:
	if Healt <= 0:
		get_tree().reload_current_scene()
	if not is_on_floor():
		$AnimatedSprite2D.play("fall")
		velocity += get_gravity() * delta
	else:
		jumps_left = 2


	if Input.is_action_just_pressed("jump") and jumps_left > 0:
		$jump.play()
		velocity.y = JUMP_VELOCITY
		jumps_left -= 1

	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		if $footsteps.is_stopped() and is_on_floor():
			$run.play()
			$footsteps.start()
		if is_on_floor():
			$AnimatedSprite2D.play("run")
		if direction >= 0:
			$AnimatedSprite2D.flip_h=false
		else:
			$AnimatedSprite2D.flip_h=true
		velocity.x = direction * SPEED
	else:
		if is_on_floor():
			$AnimatedSprite2D.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
