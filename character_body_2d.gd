extends CharacterBody2D
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -350.0
@export var run = 1.0
@export var move = 1.0
var is_running = false
func handle_run(direction):
	if direction != 0 and is_on_floor() and !is_running:
		is_running = true
		animation.play("animation_prepare")
		await animation.animation_finished
		animation.play("animation_walk")
	elif direction == 0:
		is_running = false
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("1", "2")
	if direction:
		velocity.x = direction * SPEED * move
	else:
		animation.play("animation_idle")

		velocity.x = move_toward(velocity.x, 0, SPEED)
	if Input.is_action_pressed("RUN"):
		velocity.x = direction * SPEED * move * run
		animation.play("animation_run")
		
	if direction > 0:
		animation.flip_h = false
	elif direction < 0:
		animation.flip_h = true
		
	move_and_slide()
	handle_run(direction)
	var vidas: int = 100
	

	
