extends CharacterBody3D

@onready var _camera_pivot := $CameraPivot as Node3D

@export var speed := 32.0

func _physics_process(delta: float) -> void:
	var move_direction := Vector3.ZERO
	move_direction.x = Input.get_action_strength("turn_right") - Input.get_action_strength("turn_left")
	move_direction.z = Input.get_action_strength("backward") - Input.get_action_strength("forward")
	move_direction = move_direction.rotated(Vector3.UP, _camera_pivot.rotation.y).normalized()

	velocity.x = move_direction.x * speed
	velocity.z = move_direction.z * speed

	move_and_slide()

func _process(delta: float) -> void:
	_camera_pivot.position = position
