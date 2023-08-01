extends LevelParent

var outside_level_scene: PackedScene = preload("res://scenes/lavels/outside.tscn")

func _on_exit_gate_area_body_entered(_body):
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 1)
	## change the scene from file
#	get_tree().change_scene_to_file("res://scenes/lavels/outside.tscn")
	get_tree().change_scene_to_packed(outside_level_scene)
