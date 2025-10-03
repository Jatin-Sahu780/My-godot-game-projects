extends CharacterBody3D

@onready var Anim = $"Running Arc/AnimationPlayer2"

@onready var hit_detector = $"Running Arc/1"
@onready var ray2 = $"Running Arc/RayCast3D"
var start_pos:Vector2
@export var swipe_distance := 100
@onready var play = $"../.."
@onready var Defeat:CanvasLayer = $"../../CanvasLayer"
@onready var Defeat_Manu :CanvasLayer= $"../../Defeat"
@onready var Char = $"."
@onready var Main_Manu:CanvasLayer=$"../../CanvasLayer"
@onready var lvl :Node3D=$"../level"

func _physics_process(delta: float) -> void:
	Manu()
	if !Anim.is_playing():
		Anim.play("Ninja/Running_Ninja")
	
	
func _input(event: InputEvent) -> void:
	if Defeat_Manu.visible == false and Main_Manu.visible ==false:
		if event is InputEventScreenTouch or event is InputEventMouseButton:
			if event.is_pressed(): start_pos = event.position
		else:
			var delta = event.position - start_pos
			if delta.length() < swipe_distance: return
			if abs(delta.x) < abs(delta.y):
				if delta.y <0:
					Anim.play("Up/Jump")
				else:
					Anim.play("Slide/slide")
				
		
	

func Manu():
	
	if hit_detector.is_colliding() or ray2.is_colliding():
		Global.SPEED = 0
		Defeat_Manu.visible = true
		Char.visible = false
		Global.Save()
		await Global.Save()
		Global.load_Score()
	
	
func _on_quit_pressed() -> void:
	Global.Save()
	await Global.Save()
	Global.load_Score()
	await Global.load_Score()
	get_tree().quit()




func _on_x_2_pressed() -> void:
	Global.Save()
	await Global.Save()
	Global.load_Score()
	await Global.load_Score()
	get_tree().reload_current_scene()


func _on_play_pressed() -> void:
	# Replace with function body.
	Global.SPEED = 15
	Char.visible = true
	Defeat.visible = false
	
	
