# Game over logic script
extends Control
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
#func _ready():
	#$CenterContainer/VBoxContainer/Button.pressed.connect(_on_try_again)



#func _on_try_again():
	#get_tree().paused = false
	#get_tree().change_scene_to_file("res://Level1.tscn")



func _on_button_pressed() -> void:
	get_tree().change_scene_to_file(("res://main.tscn"))
