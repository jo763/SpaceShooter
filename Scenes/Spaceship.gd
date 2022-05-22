extends KinematicBody2D

onready var bullet = preload("res://Scenes/Bullet.tscn")
onready var pilot_shoot_Speed = $Pilot_shoot_speed

export (int) var speed = 30000

var velocity = Vector2.ZERO
var p1_pos = "pilot"
var p2_pos = "right_gunner"
var shields = 50
var max_health = 100

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
	Globals.p1_pos = p1_pos
	Globals.p2_pos = p2_pos

func get_input():
	velocity.x = 0
	velocity.y = 0
	get_pilot_input()
	get_shields_input()
	if Input.is_action_pressed("exit"):
		get_tree().quit()

func get_pilot_input():
	if Input.is_action_pressed("p1_right") and p1_pos == "pilot" or Input.is_action_pressed("p2_right") and p2_pos == "pilot":
		velocity.x += 1
	if Input.is_action_pressed("p1_left") and p1_pos == "pilot" or Input.is_action_pressed("p2_left") and p2_pos == "pilot":
		velocity.x -= 1
	if Input.is_action_pressed("p1_fwd") and p1_pos == "pilot" or Input.is_action_pressed("p2_fwd") and p2_pos == "pilot":
		velocity.y -= 1
	if Input.is_action_pressed("p1_back") and p1_pos == "pilot" or Input.is_action_pressed("p2_back") and p2_pos == "pilot":
		velocity.y += 1
	if Input.is_action_pressed("p1_primary") and p1_pos == "pilot" or Input.is_action_pressed("p2_primary") and p2_pos == "pilot":
		shoot()
	pass

func get_shields_input():
	if Input.is_action_just_pressed("p1_primary") and p1_pos == "shields" or Input.is_action_just_pressed("p2_primary") and p2_pos == "shields":
		Globals.shields +=1
	pass


	

func _physics_process(delta):
	change_roles()
	get_input()
	velocity = velocity.normalized() * speed * delta
	velocity = move_and_slide(velocity)

func shoot():
	if pilot_shoot_Speed.is_stopped():
		var b = bullet.instance()
		owner.add_child(b)
		b.transform = $Pilot_gun.global_transform
		pilot_shoot_Speed.start(.2)

func _on_Pilot_shoot_speed_timeout():
	pilot_shoot_Speed.stop()
	
func take_damage(damage):
	if damage <= Globals.shields:
		Globals.shields -= damage
	else:
		damage -= Globals.shields
		Globals.shields = 0
		Globals.health -= damage
	if Globals.health <= 0:
		queue_free()

func give_health(heal_amount):
	Globals.health += heal_amount
	if Globals.health > max_health:
		Globals.health = max_health



