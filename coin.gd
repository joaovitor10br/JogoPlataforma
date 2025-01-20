extends Area2D

var coins := 1
@onready var collision = $collision as CollisionShape2D
@onready var anim = $anim as AnimatedSprite2D

func _on_body_entered(body: Node2D) -> void:
	$anim.play("coleta")
	#await collision.call_deferred("queue_free")
	#Globals.coins += coins
	
func _on_anim_animation_finished() -> void:
	if anim == "coleta":
		Globals.coins += coins
		queue_free()
