extends Node3D

@export_range(0.0, 1.0) var mouse_sensitivity := 0.01

func _ready() -> void:
	set_as_top_level(true)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotation.x -= event.relative.y * mouse_sensitivity
		rotation.x = clamp(rotation.x, -deg_to_rad(90.0), deg_to_rad(-10.0))

		rotation.y -= event.relative.x * mouse_sensitivity
		rotation.y = wrapf(rotation.y, 0.0, deg_to_rad(360.0))
