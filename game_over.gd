extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_restart_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")

func _on_quit_btn_pressed():
	get_tree().quit()
