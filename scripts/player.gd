extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -300.0


func _physics_process(delta: float) -> void:

	if not is_on_floor():
		$AnimatedSprite2D.play("fall")
		velocity += get_gravity() * delta


	if Input.is_action_just_pressed("jump") and is_on_floor():
		$jump.play()
		velocity.y = JUMP_VELOCITY

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

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("hit"):
		$detection.monitoring = true
		$cooldown.start()

func finish_attack(): pass
