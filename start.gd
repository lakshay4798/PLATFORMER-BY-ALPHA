# Start menu script
extends Control
@onready var click_sound: AudioStreamPlayer2D = $VBoxContainer/Button/click
var muted = false

		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	click_sound.play()
	
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://main.tscn")

func _on_button_2_pressed() -> void:
	click_sound.play()
	
	await get_tree().create_timer(0.3).timeout
	#click_sound.play
	get_tree().change_scene_to_file("res://setting.tscn")



func _on_button_3_pressed():
	click_sound.play()
	await get_tree().create_timer(0.3).timeout
	####
	#on /off
	#muted = !muted
#
	#AudioServer.set_bus_mute(
		#AudioServer.get_bus_index("Master"),
		#muted
	#)
#
	#if muted:
		#$VBoxContainer/Button3.text = "VOLUME: OFF"
	#else:
		#$VBoxContainer/Button3.text = "VOLUME: ON"
	#pass
	$VBoxContainer/HSlider.visible = !$VBoxContainer/HSlider.visible
	



func _on_h_slider_value_changed(value: float) -> void:
	if value == 0:
		AudioServer.set_bus_mute(
			AudioServer.get_bus_index("Master"),
			true
		)
	else:
		AudioServer.set_bus_mute(
			AudioServer.get_bus_index("Master"),
			false
		)

		AudioServer.set_bus_volume_db(
			AudioServer.get_bus_index("Master"),
			linear_to_db(value / 100.0)
		)
