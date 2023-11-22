extends Area2D


################################################################################
# TODO: setup logical functions to switch player between random scenes based
#       on where they are in the game right now ie lvl1,lvl2,lvl3 etc
################################################################################
func _on_body_entered(body):
	GameManager.is_player_input_disabled = true
	get_tree().change_scene_to_packed(GameManager.random_intro_level())
