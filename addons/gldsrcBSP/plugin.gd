@tool extends EditorPlugin


var pluginDock

var curSlectedNode = null

func _enter_tree():
	add_custom_type("GLDSRC_Map","Node3D", preload("res://addons/gldsrcBSP/src/BSP_Map.gd"), preload("res://icon.svg")) 
	pluginDock = preload("res://addons/gldsrcBSP/pluginToolbar.tscn").instantiate()
	add_control_to_container(CONTAINER_SPATIAL_EDITOR_MENU, pluginDock)
	
	pluginDock.pressed.connect(createMap)
	pluginDock.visible = false

func _exit_tree():
	remove_custom_type("createMapButton")
	remove_control_from_container(CONTAINER_SPATIAL_EDITOR_MENU, pluginDock)
#	pluginDock.free()

func _make_visible(visible: bool) -> void:
	if pluginDock:
		pluginDock.set_visible(visible)

func _handles(object):
	return object is GLDSRC_Map 
	
func _edit(object):
	curSlectedNode = object
	
func createMap():
	curSlectedNode.createMap()
	recursiveOwn(curSlectedNode,get_tree().edited_scene_root)
	

func recursiveOwn(node,newOwner):
	for i in node.get_children():
		if !i.has_meta("hidden"):
			recursiveOwn(i,newOwner)
	
	node.owner = newOwner
