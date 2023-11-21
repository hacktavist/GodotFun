extends ColorRect

@onready var cpu_particles_2d = $CPUParticles2D

func _ready():
	cpu_particles_2d.emitting = true
	GameManager.is_player_input_disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://world.tscn")

	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
