extends Area2D



func _on_Mine_body_entered(body):
	body.give_health(50)
	queue_free()
	pass # Replace with function body.
