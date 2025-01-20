extends CharacterBody2D

var grav = 10
var speed = 400

@onready var texture = $texture as Sprite2D
@onready var camera = $camera as Camera2D
@onready var audio_jump = $Audio_Jump as AudioStreamPlayer
@onready var animation = $anim as AnimatedSprite2D
var player_life = 10
var knockback_vector = Vector2.ZERO
 
func _process(delta):
	
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
	
func _on_hurtbox_body_entered(body: Node2D) -> void:
	#if body.is_in_group("enemies"):
		#queue_free()
	if player_life < 0:
		queue_free()
	else:
		if animation.scale.x == 1:
			take_damage(Vector2(-1000, -1000))
		elif animation.scale.x == -1:
			take_damage(Vector2(1000, -1000))

func take_damage(knockback_force = Vector2.ZERO, duration = 0.25):
	player_life -= 1
	
	if knockback_force != Vector2.ZERO:
		knockback_vector = knockback_force
		
		var knockback_tween = get_tree().create_tween()
		knockback_tween.tween_property(self, "knockback_vector", Vector2.ZERO, duration)
