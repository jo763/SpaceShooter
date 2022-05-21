extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var displayMessage = $Score_Box/HBoxContainer/Health_Level

func _process(delta):
	displayMessage.set_text(str(Globals.health))
