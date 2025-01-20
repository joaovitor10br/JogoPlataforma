extends Control

@onready var coins_counter = $container/coins_container/coins_icon/coins_counter as Label
@onready var timer_counter = $container/timer_container/timer_counter as Label
@onready var score_counter = $container/score_container/score_counter as Label
@onready var life_counter = $container/life_container/life_icon/life_counter as Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	coins_counter.text = str("%04d" % Globals.coins)
	score_counter.text = str("%06d" % Globals.score)
 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	coins_counter.text = str("%04d" % Globals.coins)
	score_counter.text = str("%06d" % Globals.score)
