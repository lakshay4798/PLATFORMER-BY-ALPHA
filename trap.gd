#this is for when you want to jump the player by touching the jumnping system (like a jumping jack used in platform)

extends Area2D
@export var boost_amount: float = -1000.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		body.velocity.y = boost_amount
