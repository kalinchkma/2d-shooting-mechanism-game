extends LevelParent

func _on_gate_player_entered_gate(_body):
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0.4)
	## Changing the scene
	TransitionLayer.change_scene("res://scenes/lavels/inside.tscn")
	

func _on_house_player_entered():
	## creating a tween
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(1,1), 1).set_trans(Tween.TRANS_QUART)

func _on_house_player_exited():
	## creating a tween
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.6, 0.6), 2)
