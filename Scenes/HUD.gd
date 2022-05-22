extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var health_message = $Score_Box/VBoxContainer/Health/Health_Level
onready var shields_message = $Score_Box/VBoxContainer/Shields/Shields_Level
onready var player_1_message = $Score_Box/VBoxContainer/Player_1/Player_1_Level
onready var player_2_message = $Score_Box/VBoxContainer/Player_2/Player_2_Level


func _process(delta):
	health_message.set_text(str(Globals.health))
	shields_message.set_text(str(Globals.shields))
	player_1_message.set_text(str(Globals.p1_pos))
	player_2_message.set_text(str(Globals.p2_pos))
