extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		get_tree().change_scene_to_file("res://scenes/world4.tscn")
	pass # Replace with function body.
