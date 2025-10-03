extends Node3D
@onready var Anim = $"AudioStreamPlayer3D/Running Arc/AnimationPlayer2"
func _ready() -> void:
	Anim.play("Sitting/Site")


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_quite_pressed() -> void:
	get_tree().quit()
