extends Node2D

@onready var player = $Player/player as CharacterBody2D
@onready var control = $HUD/control as Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	control.time_is_up.connect(game_over)
	player.player_has_died.connect(game_over)
	Globals.coins = 0
	Globals.score = 0
	Globals.player_life = 3
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func reload_game():
	await get_tree().create_timer(1.0).timeout
	get_tree().reload_current_scene()

func _on_time_is_up():
	reload_game()

func game_over():
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
