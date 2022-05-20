extends KinematicBody2D

export (int) var speed = 50000

var velocity = Vector2.ZERO
var p1_pos = "pilot"
var p2_pos = "right_gunner"

func change_roles():
	if Input.is_action_pressed("p1_pilot") and p2_pos != "pilot":
		p1_pos = "pilot"
	elif Input.is_action_pressed("p2_pilot") and p1_pos != "pilot":
		p2_pos = "pilot"
	elif Input.is_action_pressed("p1_left_gunner") and p2_pos != "left_gunner":
		p1_pos = "left_gunner"
	elif Input.is_action_pressed("p2_left_gunner") and p1_pos != "left_gunner":
		p2_pos = "left_gunner"
	elif Input.is_action_pressed("p1_right_gunner") and p2_pos != "right_gunner":
		p1_pos = "right_gunner"
	elif Input.is_action_pressed("p2_right_gunner") and p1_pos != "right_gunner":
		p2_pos = "right_gunner"
	elif Input.is_action_pressed("p1_shields") and p2_pos != "shields":
		p1_pos = "shields"
	elif Input.is_action_pressed("p2_shields") and p1_pos != "shields":
		p2_pos = "shields"
	print(p1_pos, p2_pos)

func get_input():
	velocity.x = 0
	velocity.y = 0
	if Input.is_action_pressed("p1_right") and p1_pos == "pilot" or Input.is_action_pressed("p2_right") and p2_pos == "pilot":
		velocity.x += 1
	if Input.is_action_pressed("p1_left") and p1_pos == "pilot" or Input.is_action_pressed("p2_left") and p2_pos == "pilot":
		velocity.x -= 1
	if Input.is_action_pressed("p1_fwd") and p1_pos == "pilot" or Input.is_action_pressed("p2_fwd") and p2_pos == "pilot":
		velocity.y -= 1
	if Input.is_action_pressed("p1_back") and p1_pos == "pilot" or Input.is_action_pressed("p2_back") and p2_pos == "pilot":
		velocity.y += 1
	
	if Input.is_action_pressed("exit"):
		get_tree().quit()

func _physics_process(delta):
	change_roles()
	get_input()
	velocity = velocity.normalized() * speed * delta
	velocity = move_and_slide(velocity)
