extends Area2D
@onready var label = $Label6

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	

func _process(delta):
	Global.game_time += delta

# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		var minutes = int(Global.game_time / 60)
		var seconds = int(Global.game_time) % 60
		$Label6.text = "Time: %02d:%02d" % [minutes, seconds]
