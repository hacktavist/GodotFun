extends CharacterBody2D

const DustEffectScene = preload("res://effects/dust_effect.tscn")

@export var acceleration = 512
@export var max_speed = 64
@export var friction = 256
@export var gravity = 200
@export var jump_force = -128
@export var max_fall_speed = 80
@export var pushback = 200

@onready var animation_player = $AnimationPlayer
@onready var sprite_2d = $Sprite2D
@onready var extend_jump_timer = $ExtendJumpTimer

func _ready():
	set_process_input(true)

func _physics_process(delta):

	var input_axis = Input.get_axis("ui_left", "ui_right")
	apply_gravity(delta)
	move(delta, input_axis)
	apply_friction(delta, input_axis)
	jump()
	update_animations(input_axis)
	var was_on_floor = is_on_floor()
	move_and_slide()
	var just_left_edge = was_on_floor and not is_on_floor()
	if just_left_edge:
		extend_jump_timer.start()
		
		
func create_dust_effect():
	var dust_effect = DustEffectScene.instantiate()
	var main = get_tree().current_scene
	main.add_child(dust_effect)
	dust_effect.global_position = global_position

func is_moving(input_axis):
	return input_axis != 0
func apply_gravity(delta):
		if not is_on_floor():
			velocity.y = move_toward(velocity.y, max_fall_speed, gravity * delta)
	
func move(delta, input_axis):
		if is_moving(input_axis):
			velocity.x = move_toward(velocity.x, input_axis * max_speed, acceleration * delta)

func apply_friction(delta, input_axis):
		if not is_moving(input_axis):
			velocity.x = move_toward(velocity.x, 0, friction * delta)

func jump():
		var wall_normal = get_wall_normal()
		if Input.is_action_just_pressed("ui_accept") and (is_on_floor() or extend_jump_timer.time_left > 0.0):
			velocity.y = jump_force
		elif Input.is_action_just_released("ui_accept") and velocity.y < jump_force / 2:
			velocity.y = jump_force / 2
		elif not is_on_floor() and $RayRight.is_colliding()  and Input.is_action_just_pressed("ui_left"):

			velocity.y = jump_force
			velocity.x = pushback * wall_normal.x
		elif not is_on_floor() and $RayLeft.is_colliding()   and Input.is_action_just_pressed("ui_right"):
			
			velocity.y = jump_force
			velocity.x = pushback * wall_normal.x
			
			


func update_animations(input_axis):
	if is_moving(input_axis):
		animation_player.play("run")
		sprite_2d.scale.x = sign(input_axis)
	else:
		animation_player.play("idle")
		
	if not is_on_floor():
		animation_player.play("fall")
