extends CharacterBody2D

var grav = 12
var speed = 350
const JUMP_FORCE = -350.0


@onready var texture = $texture as Sprite2D
@onready var camera = $camera as Camera2D
@onready var audio_jump = $Audio_Jump as AudioStreamPlayer
@onready var animation = $animation as AnimatedSprite2D

var knockback_vector := Vector2.ZERO

signal player_has_died
 
func _process(_delta):
	
	if !is_on_floor():
		velocity.y += grav
		
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		texture.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		texture.flip_h = true
	else:
		velocity.x = 0
		
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y -= 400
		audio_jump.play()
		
	if knockback_vector != Vector2.ZERO:
		velocity = knockback_vector
		
	move_and_slide()
	


func _on_hurtbox_body_entered(_body: Node2D) -> void:
	#if body.is_in_group("enemies"):
		#queue_free()
	if $ray_right.is_colliding():
			take_damage(Vector2(-200, -200))
	elif $ray_left.is_colliding():
			take_damage(Vector2(200, -200))

func take_damage(knockback_force := Vector2.ZERO, duration := 0.25):
	if Globals.player_life > 0:
		Globals.player_life -= 1
	else:
		emit_signal("player_has_died")
		await player_has_died
		queue_free()
	
	if knockback_force != Vector2.ZERO:
		knockback_vector = knockback_force
		
		var knockback_tween := get_tree().create_tween()
		knockback_tween.parallel().tween_property(self, "knockback_vector", Vector2.ZERO, duration)
		animation.modulate = Color(1,0,0,1)
		knockback_tween.parallel().tween_property(animation, "modulate", Color(1,1,1,1), duration)
		
