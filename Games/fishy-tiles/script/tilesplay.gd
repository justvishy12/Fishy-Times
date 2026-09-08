extends Node2D
var tiles = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
var picked_tile = 0
var button_name = ""
var tile = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	choose_tiles()


func choose_tiles():
	for tile in range(1, 13):
		picked_tile = tiles.pick_random()
		tiles.erase(picked_tile)
		button_name = get_node("BaseTiles/T" + str(picked_tile) + "/Tile" + str(picked_tile))
		var item_tile = get_node("ItemTiles/Tile" + str(tile))
		item_tile.global_position = button_name.global_position

func check_tile_button():
	pass
