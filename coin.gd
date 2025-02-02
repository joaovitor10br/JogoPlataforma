extends Area2D

var coins := 1

@onready var anim = $anim as AnimatedSprite2D
@onready var coin_sound = $coin_sound as AudioStreamPlayer

func _on_body_entered(_body: Node2D) -> void:
		$anim.play("coleta")
		# Evita colisão dupla de moedas
		await $collision.call_deferred("queue_free")
		coin_sound.play()
		Globals.coins += coins
		
func _on_anim_animation_finished() -> void:
	if $anim.animation == "coleta":
		queue_free()
