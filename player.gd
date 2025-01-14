extends CharacterBody2D

@export var tile_size = Vector2(32, 32)  # Match your TileMap's tile size
@export var speed = 100  # Adjust as needed

var target_position: Vector2  # Where the character should move to

func _ready():
	target_position = position

func _process(delta):
	# Smoothly move towards the target position
	if position != target_position:
		velocity = (target_position - position).normalized() * speed
		move_and_slide()
	else:
		velocity = Vector2.ZERO

func _input(event):
	# Handle input for movement
	if position == target_position:
		if event.is_action_pressed("ui_up"):
			move_character(Vector2(0, -1))
		elif event.is_action_pressed("ui_down"):
			move_character(Vector2(0, 1))
		elif event.is_action_pressed("ui_left"):
			move_character(Vector2(-1, 0))
		elif event.is_action_pressed("ui_right"):
			move_character(Vector2(1, 0))

func move_character(direction: Vector2):
	# Calculate the new target position based on input
	var new_position = position + direction * tile_size
	if !is_tile_blocked(new_position):
		target_position = new_position

func is_tile_blocked(target_position: Vector2) -> bool:
	# Implement logic to check if the tile is walkable
	# For now, assume all tiles are walkable
	return false
