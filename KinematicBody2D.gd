extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 0
const BOOST = 400 
const MAXSPEED = 200
const ACCELERATION = 100

var motion = Vector2()


func _ready():
	pass 
	

func _physics_process(delta):
	
	motion.x = clamp(motion.x, -MAXSPEED, MAXSPEED)
	motion.y = clamp(motion.x, -MAXSPEED, MAXSPEED)
	
	
	if Input.is_action_pressed("right"):
		motion.x += ACCELERATION
	elif Input.is_action_pressed("left"):
		motion.x -= ACCELERATION
	elif Input.is_action_pressed("up"):
		motion.y += ACCELERATION
	elif Input.is_action_pressed("boost"):
		motion.y += (ACCELERATION + BOOST)
	else:
		motion.x = lerp(motion.x, 0, 0.2)
		motion.y = lerp(motion.y, 0, 0.2)


