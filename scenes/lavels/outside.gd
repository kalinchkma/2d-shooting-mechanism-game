extends LevelParent

func _on_gate_player_entered_gate(_body):
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0.4)
	## Changing the scene
	get_tree().change_scene_to_file("res://scenes/lavels/inside.tscn")
