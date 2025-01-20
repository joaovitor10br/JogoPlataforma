extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		body.velocity = Vector2(0, -400)
		owner.anim.play("hurt")
		await get_tree().create_timer(1.0).timeout
		owner.queue_free()
