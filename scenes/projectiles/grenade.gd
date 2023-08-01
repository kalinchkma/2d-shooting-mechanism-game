extends RigidBody2D

const speed = 750.0


func explode():
	$AnimationPlayer.play("Explosion")
