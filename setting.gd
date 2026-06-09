extends Control
@onready var click_sound: AudioStreamPlayer2D = $Button/click

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	click_sound.play()
	
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://start.tscn")
	
