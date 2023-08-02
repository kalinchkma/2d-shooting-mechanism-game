extends Area2D

var rotation_speed: int = 4
var available_options = ["laser","laser","laser","laser","laser", "grenade", "health"]
var type = available_options[randi()%len(available_options)]

var direction: Vector2
var distance: int =randi_range(150, 250)

func _ready():
	if type == "laser":
		$Sprite2D.modulate = Color(0.1,0.2,0.8)
	if type == "grenade":
		$Sprite2D.modulate = Color(0.8,0.2,0.1)
	if type == "health":
		$Sprite2D.modulate = Color(0.2,0.8,0.1)
	# tween
	var target_pos = position + direction * distance
	var movement_tween = create_tween()
	movement_tween.tween_property(self, "position", target_pos, 0.5)
		

func _physics_process(delta):
	rotation += rotation_speed * delta


func _on_body_entered(body):
	print("item box collide with", body)
	if type == "health":
		Globals.health += 10
	if type == "laser":
		Globals.laser_amount += 15
	if type == "grenade":
		Globals.grenade_amount += 1
	
	queue_free()
