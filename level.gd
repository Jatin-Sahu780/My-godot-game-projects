extends Node3D
@onready var label = $"../../CanvasLayer2/Panel/Label"
@export var module: Array[PackedScene] = []
@export var plat:PackedScene
var amount = 10
var rag = RandomNumberGenerator.new()
var offset :int= 6
var instabs :int= 0
var Score :int= -1000
var diff : int = 6
var lvl:int=10
var lvl2 : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	for n in amount:
		spawn(n*offset)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.text = "\nScore: " + str(Score)+"\nHIGH SCORE:"+str(Global.High_Score)+"\nSPEED : "+str(Global.SPEED)+"\nFPS : "+str(Engine.get_frames_per_second())
	if(Score>=Global.High_Score):
		Global.High_Score = Score
	
	

func spawn(n):
	if instabs > 15:
		rag.randomize()
		var num = rag.randi_range(0,module.size()-1)
		var instance = module[num].instantiate()
		instance.position.x = n
		add_child(instance)
		Score += 100
		if instabs==16:
			instabs=diff
			
			diff+=1
			if diff>15:
				diff=lvl
				lvl+=1
				Global.SPEED+=1
				if Global.SPEED >24:
					Global.SPEED=23
				if lvl>12:
					lvl =10
	else:
		var instancee = plat.instantiate()
		instancee.position.x = n
		add_child(instancee)
		instabs += 1
		Score += 100
