extends CharacterBody3D

@onready var _camera_pivot := $CameraPivot as Node3D

@export var speed := 32.0
@export var rotation_speed := 1

func _physics_process(delta: float) -> void:
	var move_direction := Vector3.ZERO
	rotation.y -= (
		(Input.get_action_strength("turn_right") - Input.get_action_strength("turn_left"))
		* delta * rotation_speed)
	rotation.y = wrapf(rotation.y, 0.0, deg_to_rad(360.0))
	move_direction.z = Input.get_action_strength("backward") - Input.get_action_strength("forward")
	move_direction = move_direction.rotated(Vector3.UP, rotation.y).normalized()

	velocity.x = move_direction.x * speed
	velocity.z = move_direction.z * speed

	move_and_slide()

func _process(delta: float) -> void:
	_camera_pivot.position = position
