extends CharacterBody2D


const SPEED: float = 100.0


func _process(_delta):
	
	# direction
	var direction = Vector2.RIGHT
	
	# velocity
	velocity = SPEED * direction
	# move and slide
	move_and_slide()

func hit():
	print("damage")
