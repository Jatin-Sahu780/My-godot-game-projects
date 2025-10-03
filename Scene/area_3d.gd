extends Area3D

@onready var Anim = $AnimationPlayer2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input(event: InputEvent) -> void:
	if !InputEventScreenDrag:
		if !Anim.is_playing():
			Anim.play("Ninja/Running_Ninja")
			
	elif InputEventScreenDrag:
		if !Anim.is_playing():
			Anim.play("Up/Jump")


func _on_body_entered(body: Node3D) -> void:
	get_tree().reload_current_scene()
