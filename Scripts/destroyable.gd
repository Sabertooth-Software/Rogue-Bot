extends Node3D

class_name Destroyable

@export var POINTS: int
@export var mesh: MeshInstance3D
@onready var hitbox: Area3D = $Hitbox
@onready var explosion = load("res://Scenes/Assets/particles/parts_explode.tscn")


func _on_hitbox_body_entered(body):
	ChaosTracker.object_destroyed.emit(self)
	destroy()
	
func destroy():
	hitbox.visible = false
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	if mesh:
		tween.tween_property(mesh.mesh.surface_get_material(0),"albedo_color", Color.DARK_RED, 1)
		tween.tween_property(mesh.mesh.surface_get_material(1),"albedo_color", Color.DARK_RED, 1)
	var explode = explosion.instantiate() as Node3D
	add_child(explode)
	explode.global_position = global_position
	tween.tween_property(explode, "scale", Vector3(5,5,5), 1)
	tween.tween_interval(1)
	tween.set_parallel(false)
	
	tween.tween_callback(self.queue_free)