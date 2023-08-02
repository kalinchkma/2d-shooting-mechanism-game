extends Node2D
class_name LevelParent

# Load the scene
var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")
var item_scene: PackedScene = preload("res://scenes/items/item.tscn")

func _ready():
	for container in get_tree().get_nodes_in_group('Container'):
		container.connect("open", _on_container_opened)

func _on_container_opened(pos, direction):
	var item = item_scene.instantiate()
	item.position = pos
	item.direction = direction
	$Items.call_deferred("add_child",item)

func _on_gate_player_exited_gate(body):
	print("Player has exited the gate", body)


func _on_player_grenade_shoot(pos, direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)
	$UI.update_grenade_text()

func _on_player_laser_shoot(pos, direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	laser.direction = direction
	$Projectiles.add_child(laser)
	$UI.update_laser_text()

func _on_house_player_entered():
	## creating a tween
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
#	tween.tween_property($Player, "modulate:a", 0, 2).from(0.7)
	tween.tween_property($Player/Camera2D, "zoom", Vector2(1,1), 1).set_trans(Tween.TRANS_QUART)

func _on_house_player_exited():
	## creating a tween
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.6, 0.6), 2)

