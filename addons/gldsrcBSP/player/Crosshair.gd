@tool
extends Node2D


@export var gap = 5
@export var length = 5
@export var thickness = 1
@export_color_no_alpha var color = Color(1,1,0,1) # TODOV4

@onready var right = $"right"
@onready var left = $"left"
@onready var up = $"up"
@onready var down = $"down"
# Called when the node enters the scene tree for the first time.


func _ready():
	apply_gap()
	position = get_viewport_rect().size / 2


func _physics_process(delta):
	#apply_gap()
	apply_color()
	apply_thickness()

func apply_gap():

	right.points[0].x =  gap
	right.points[1].x =  gap+length
	
	left.points[0].x =  -gap
	left.points[1].x =  -(gap+length)
	
	up.points[1].y = -gap
	up.points[0].y = -(gap+length)
	
	down.points[1].y =  gap
	down.points[0].y = gap+length
	
func apply_color():
	right.default_color = color
	left.default_color = color
	down.default_color = color
	up.default_color = color

func apply_thickness():
	right.width = thickness
	left.width = thickness
	down.width = thickness
	up.width = thickness
