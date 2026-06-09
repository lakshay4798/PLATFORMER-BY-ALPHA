# Player movement and physics script
extends CharacterBody2D
@onready var animated_sprite_2d:AnimatedSprite2D = $AnimatedSprite2D
@onready var jump_sound:AudioStreamPlayer2D = $jumpsound
@onready var hayato_sound : AudioStreamPlayer2D = $hayato
@onready var abhijeet_sound : AudioStreamPlayer2D = $abhijeet_sound
@onready var death_sound : AudioStreamPlayer2D = $death_sound
@onready var GAMEOVER_SOUND : AudioStreamPlayer2D = $GAMEOVER_SOUND
@onready var TOLD_SOUND : AudioStreamPlayer2D = $TOLD_SOUND
@onready var GAME_END_SOUND : AudioStreamPlayer2D = $GAME_END_SOUND

var starting_position : Vector2
const SPEED = 300.0
const JUMP_VELOCITY = -700.0
var can_move = true

#func death():
	


func _ready() -> void:
	starting_position = self.global_position


func respawn():
	global_position = starting_position
	#self.global_position = Vector2(324, 618)
	death_sound.play()
	#GAMEOVER_SOUND.play()
	#

	
#func _autoload
func _physics_process(delta: float) -> void:
	#jump_sound.play()
	#add animation
	if velocity.x> 1 or velocity.x <-1:
		animated_sprite_2d.animation = "running"
	else:
		animated_sprite_2d.animation = "idle"
	
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		animated_sprite_2d.animation = "jumping"

	if can_move:
		

	# Handle jump.
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			jump_sound.play()
			#hayato_sound.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
		var direction := Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()
		if direction == 1.0:
			animated_sprite_2d.flip_h = false
		elif direction == -1.0:
			animated_sprite_2d.flip_h = true
		

	#if get_mu ltiplayer_authority():
	



#sound by pressing KEY
func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_X:
			$hayato_sound.play()
		elif event.keycode == KEY_V:
			abhijeet_sound.play()
		elif event.keycode == KEY_R:
			get_tree().change_scene_to_file("res://main.tscn")
		#else:
			#$hayato_sound.play()
