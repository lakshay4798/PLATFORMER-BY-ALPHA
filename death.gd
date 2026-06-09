extends Area2D

@onready var timer = $Timer
#@onready var label = $"../CanvasLayer/Label"
@onready var GAMEOVER_SOUND : AudioStreamPlayer2D = $GAMEOVER
#@onready var death_sound : AudioStreamPlayer2D =$death_sound
@onready var player = $"../player"
@onready var spawnpoint = $"../Spawnpoint"

func _on_body_entered(body):
	if body.name == "player":
		Global.deaths += 1
		#label.text = str(3 - Global.deaths) + " Lives Remaining"
		#label.visible = true
		#death_sound.play()
		GAMEOVER_SOUND.play()
		timer.start(1.0)

func _on_timer_timeout():
	timer.stop()

	if Global.deaths >= 3:
		Global.deaths = 0
		get_tree().change_scene_to_file("res://main.tscn")
	else:
		player.global_position = spawnpoint.global_position
