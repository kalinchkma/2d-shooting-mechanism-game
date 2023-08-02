extends LevelParent

func _on_gate_player_entered_gate(_body):
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0.4)
	## Changing the scene
	TransitionLayer.change_scene("res://scenes/lavels/inside.tscn")
