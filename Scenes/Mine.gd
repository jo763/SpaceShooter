extends Area2D



func _on_Mine_body_entered(body):
	body.take_damage(52)
	queue_free()
	pass # Replace with function body.
