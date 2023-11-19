extends Node2D

@onready var tilemap = $TileMap

@export var MAP_WIDTH = 512  # Width of the map
@export var MAP_HEIGHT = 20  # Height of the map, smaller than a top-down map
@export var PLATFORM_CHANCE = 0.3  # Chance to place a platform tile

func _ready():
	generate_level()

func generate_level():
	var noise = FastNoiseLite.new()
	noise.seed = randi()  # Randomize the seed for different levels each time
	tilemap.map_to_local(Vector2(0,0))#set_cell(0,Vector2(0,0),0,Vector2(1,0),0)
	# Loop through the map width and a smaller height
	for x in range(MAP_WIDTH):
		for y in range(MAP_HEIGHT):
			var noise_value = noise.get_noise_2d(x, y)
			print("Coordinate: " + str(tilemap.map_to_local(Vector2(x,y))))
			# Decide whether to place a platform tile
			if noise_value < PLATFORM_CHANCE:
				# The tile ID here should correspond to your platform tile
				tilemap.map_to_local(Vector2(x,y))#set_cell(0,Vector2(x,y),0,Vector2(1,0),0)
			else:
				pass
				# Clear the cell or set it to a background tile if necessary
				#tilemap.set_cell(x, y, -1)  # -1 clears the cell
