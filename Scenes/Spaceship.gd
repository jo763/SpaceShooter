extends KinematicBody2D

export (int) var speed = 1000

var velocity = Vector2.ZERO

func get_input():
	velocity.x = 0
	velocity.y = 0
	if Input.is_action_pressed("p1_right"):
		velocity.x += speed
	if Input.is_action_pressed("p1_left"):
		velocity.x -= speed
	if Input.is_action_pressed("p1_fwd"):
		velocity.y -= speed
	if Input.is_action_pressed("p1_back"):
		velocity.y += speed
	
	if Input.is_action_pressed("exit"):
		get_tree().quit()

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
