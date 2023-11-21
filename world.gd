extends Node2D

@onready var dialogue_box = $DialogueBox
@onready var intro_level_resource = []
@onready var second_level_resource = []
var test = preload("res://test_level_1.tscn")
@onready var level_resource = preload("res://test_level_1.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	dialogue_box.visible = true
	dialogue_box.get_child(0).get_child(0).text = GameManager.villain_dialogue
	print("World")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://ui/main_menu.tscn")
