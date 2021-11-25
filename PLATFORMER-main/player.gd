extends KinematicBody2D

var vert_move=0

var on_airtime = 0
const Floor=Vector2(0,-1)
var speed = 15

var jumpForce = 300
var gravity = Vector2(0,980)

var vel = Vector2()

onready var imagePlayer = get_node("player")

func _physics_process(delta):
	vel+=gravity*delta
	var target_vel=0
	on_airtime+=delta
	if is_on_floor():
		on_airtime = 0
	var on_floor = on_airtime<0.1

	
	if Input.is_action_pressed("left"):
		target_vel -= speed
	if  Input.is_action_pressed("right"):
		target_vel += speed
		
	#vert_move =- 300 if Input.is_action_pressed("up")else vert_move+9.6*delta
	
	target_vel *=speed
	
	vel = move_and_slide(vel, Vector2(0, -1), 25.0)
	#vert_move = vel.y
	
	vel.x = lerp(vel.x,target_vel, 0.3)
	if on_floor and Input.is_action_pressed("up"):
		vel.y -= jumpForce
	
	if vel.x < 0:
		imagePlayer.flip_h = false
	if vel.x > 0:
		imagePlayer.flip_h = true
