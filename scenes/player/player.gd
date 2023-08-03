extends CharacterBody2D

signal laser_shoot(pos, direction)
signal grenade_shoot(pos, direction)


@export var max_speed: int = 500
var speed: int = max_speed

var can_laser: bool = true
var can_grenade: bool = true

func hit():
	Globals.health -= 10

func _process(_delta):
	
	# moving input 
	# Input.get_vector() method is great for handling movement
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	Globals.player_pos = global_position
	
	# rotate with mouse 
	look_at(get_global_mouse_position())
	
	var player_direction = (get_global_mouse_position() - position).normalized()
	# laser shootng input
	if Input.is_action_pressed("primary action") and can_laser and Globals.laser_amount > 0:
		Globals.laser_amount -= 1
		# emit partical
		$GPUParticles2D.emitting = true
		
		# randomly selected a marker 2D for the laser start
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		can_laser = false
		$LaserTimer.start()
		# emit the position we selected
		laser_shoot.emit(selected_laser.global_position, player_direction)
		
	# grenade shooting input
	if Input.is_action_pressed("secondary action") and can_grenade and Globals.grenade_amount > 0:
		Globals.grenade_amount -= 1
		var laser_marker = $LaserStartPositions.get_children()
		var selected_marker = laser_marker[randi() % laser_marker.size()]
		can_grenade = false
		$GrenadeTimer.start()
		grenade_shoot.emit(selected_marker.global_position, player_direction)

func _on_grenade_timer_timeout():
	can_grenade = true


func _on_laser_timer_timeout():
	can_laser = true
	

