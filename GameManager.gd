extends Node

################################################################################
# Viallain dialogue dictionaries
################################################################################
var introductions = {
	"intro1": "Welcome to the abyss, where your screams will echo for eternity.",
	"intro2": "Arise, and step into the shadows of your deepest fears.",
	"intro3": "Awaken, for your journey through torment has just begun.",
	"intro4": "Behold the darkness that will swallow your soul.",
	"intro5": "Rise, and embrace the nightmare that awaits you.",
	"intro6": "Your eyes open to a realm where despair reigns supreme.",
	"intro7": "Welcome to a world where pain is your constant companion.",
	"intro8": "Awaken, and face the horrors I have meticulously crafted for you.",
	"intro9": "Rise, and begin your descent into a never-ending night.",
	"intro10": "You step into my domain, where hope withers and dies.",
	"intro11": "Welcome, where every moment is a step closer to your doom.",
	"intro12": "Arise into the eternal anguish that will be your undoing.",
	"intro13": "Your awakening is the beginning of an endless cycle of despair.",
	"intro14": "Behold the realm of suffering into which you have fallen.",
	"intro15": "Awake, and tremble before the horrors that await you.",
	"intro16": "Step into my world, a labyrinth designed for your demise.",
	"intro17": "Welcome, where each breath you take is laced with fear.",
	"intro18": "Rise, and face the relentless darkness of my creation.",
	"intro19": "You enter a world where your nightmares become reality.",
	"intro20": "Awaken, and begin your hopeless struggle against fate.",
	"intro21": "Behold, a realm where your spirit will be shattered.",
	"intro22": "Arise, and feel the weight of your impending doom.",
	"intro23": "Welcome to the edge of oblivion, where your pain is infinite.",
	"intro24": "Step into my domain, where despair is the air you breathe.",
	"intro25": "Awake, into a world where the shadows consume the light.",
	"intro26": "Rise, and march towards the abyss that awaits you.",
	"intro27": "You have entered my realm, where terror is your only companion.",
	"intro28": "Welcome, to a dance with darkness that never ends.",
	"intro29": "Arise, and face a fate more harrowing than death.",
	"intro30": "Step forth into a world where each moment is a battle against despair."
}
var player_deaths = {
	"death1": "Your demise is a mere whisper in the chorus of your suffering.",
	"death2": "Down you go, a fleeting shadow in the dark.",
	"death3": "Again you fall, a pawn in the game of your torment.",
	"death4": "Defeated once more, a broken vessel of hope.",
	"death5": "Another fall, another crack in the facade of your resilience.",
	"death6": "Your end is but a moment in the eternal night.",
	"death7": "Down again, a leaf in the storm of my wrath.",
	"death8": "You crumble, a fleeting dream in a nightmare of my making.",
	"death9": "Your demise, a repeated echo in the void of your despair.",
	"death10": "Fallen once more, a fleeting spark in the darkness.",
	"death11": "Again you succumb, a mere ripple in the ocean of your agony.",
	"death12": "Defeated, a fading star in the sky of your failures.",
	"death13": "Another fall, a withered flower in the garden of your pain.",
	"death14": "You perish, a lost note in the symphony of your defeat.",
	"death15": "Down again, a forgotten memory in the annals of your suffering.",
	"death16": "You fade, a smothered flame in the fire of your torment.",
	"death17": "Another defeat, a crumbling pillar in the temple of your despair.",
	"death18": "You fall, a shattered mirror reflecting your broken spirit.",
	"death19": "Defeated again, a wilted petal in the bloom of your agony.",
	"death20": "Your end, a silent scream in the cacophony of your nightmare.",
	"death21": "Down once more, a shadow slipping into the abyss.",
	"death22": "You crumble, a brittle bone in the skeleton of your defeat.",
	"death23": "Another loss, a tear in the ocean of your misery.",
	"death24": "Defeated, a faint echo in the canyon of your despair.",
	"death25": "You fall, a fading echo in the halls of your torment.",
	"death26": "Another demise, a lost word in the story of your suffering.",
	"death27": "You perish, a dissolving cloud in the storm of your pain.",
	"death28": "Down again, a withering leaf in the autumn of your agony.",
	"death29": "You succumb, a broken chord in the melody of your defeat.",
	"death30": "Your end, a snuffed candle in the darkness of your despair."
}
var level_completed = {
	"complete1": "A fleeting victory in the vast darkness that envelops you.",
	"complete2": "You prevail, but each step forward is a plunge into deeper horror.",
	"complete3": "Your triumph is but a brief respite in a sea of terror.",
	"complete4": "You survive, only to face nightmares beyond your comprehension.",
	"complete5": "A momentary success, overshadowed by the looming dread.",
	"complete6": "You conquer, but the shadows of greater horrors loom.",
	"complete7": "This victory, a mere illusion in the face of inevitable defeat.",
	"complete8": "You emerge, only to be swallowed by deeper, darker trials.",
	"complete9": "A small win, a temporary light in the engulfing darkness.",
	"complete10": "Today's triumph pales in comparison to the horrors that await.",
	"complete11": "You rise, but the next fall will be even more crushing.",
	"complete12": "Your success, a fleeting joy in the eternal night.",
	"complete13": "You've bested this challenge, but your soul's trial has just begun.",
	"complete14": "A moment of victory, soon to be eclipsed by despair.",
	"complete15": "You prevail, yet the echo of your impending doom resounds.",
	"complete16": "This win, a small ripple in the ocean of your suffering.",
	"complete17": "You survive, but the abyss eagerly awaits your next step.",
	"complete18": "A brief success, soon to be smothered by unrelenting darkness.",
	"complete19": "You conquer, only to be met with more insidious trials.",
	"complete20": "Today you rise, but tomorrow, the darkness will claim you.",
	"complete21": "This victory, a mere pause in the symphony of your agony.",
	"complete22": "You emerge, stepping closer to the heart of your nightmare.",
	"complete23": "A small triumph, a brief candle in the wind of your despair.",
	"complete24": "You've won, but the next challenge will be your undoing.",
	"complete25": "This success, a fleeting moment before the storm of terror.",
	"complete26": "You prevail, but the shadows of despair grow ever darker.",
	"complete27": "A victory, but each step forward is a dance with doom.",
	"complete28": "You conquer, yet the specter of greater horrors looms.",
	"complete29": "This win, a brief respite in a relentless tide of terror.",
	"complete30": "You rise, only to face deeper, more treacherous paths ahead."
}

################################################################################
# key value pairs of level arrays
################################################################################
var levels = {
				"intro":[
							preload("res://world.tscn"),
							preload("res://test_level_1.tscn"),
							preload("res://test_level_2.tscn")
						],
				"level_1":[],
				"level_2":[],
				"level_3":[],
				"level_4":[],
				"level_5":[],
			}

# place for character/enemy globals
var is_player_input_disabled : bool = true

# for making ai request
var url : String = "https://api.openai.com/v1/chat/completions"
var temperature : float = 0.5
var max_tokens : int = 1024
var your_key = ""
var headers_to_send = []
var model : String = "gpt-3.5-turbo-16k-0613"
var messages = []
var body = []
var openai_max_retries = 3
var openai_retry_delay = 2
var openai_current_retry = 0
var ai_request : HTTPRequest

# for api key request
var api_key_url = "https://emphasized-outrageous-tire.glitch.me/get_key"
var request : HTTPRequest
var max_retries = 5
var retry_delay = 2.0 # in seconds
var current_retry = 0
var retry_timer = Timer.new() # timer to set for retries of api_key_request

# Default villain dialogue in case we run into errors like rate limting
# or openai being down
@export_multiline var villain_dialogue : String = "Default Villain Text"



@export_multiline var dialogue_rules : String
@export_multiline var personality : String




func _ready ():
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")
#	request = HTTPRequest.new()
#	ai_request = HTTPRequest.new()
#	add_child(request)
#	add_child(retry_timer)
#	add_child(ai_request)
#	request.connect("request_completed", _on_request_completed)
#	retry_timer.connect("timeout", _on_timer_timeout)
#	ai_request.connect("request_completed", _on_ai_request_completed)
#	get_api_key()
#	random_intro_level()
	print("Game Manager")

################################################################################
# randomize intro level
################################################################################
func random_intro_level():
	var random_level = levels["intro"].pick_random()
	print("random intro: "+str(random_level))
	return random_level
################################################################################
# call this when level starts
################################################################################
func dialogue_request ():
	print("Dialogue function called")
	var prompt = ""
	
	if len(messages) == 0:
		var header_prompt = "As a character, you are " + personality + ". "
		
		prompt = dialogue_rules + "\n" + header_prompt + "\nWhat is your first line of dialogue?"
	
	# add a new message to the array
	messages.append({
		"role": "user",
		"content": prompt
		})
	
	# create the request body
	body = JSON.stringify({
		"messages": messages,
		"temperature": temperature,
		"max_tokens": max_tokens,
		"model": model
	})
	
	#send the request to the AI server
	var send_request = ai_request.request(url, headers_to_send, HTTPClient.METHOD_POST, body)
	#print(send_request)
	# if there was a problem, make it known
	if send_request != OK:
		print("Generic Villain Dialogue in case there is a server error")

func get_api_key():
	var _key = request.request(api_key_url)
	current_retry += 1

# for handling retries to the api key server
func _on_timer_timeout():
	get_api_key()
	
# called when we have received a response api key server
func _on_request_completed (result, response_code, headers, body):
	if response_code == 200:
		var json = JSON.new()
		json.parse(body.get_string_from_utf8())
		var response = json.get_data()
		print("response: " + str(response.key))
		headers_to_send = ["Content-type: application/json", "Authorization: Bearer " + response.key]
		dialogue_request()
	else:
		if current_retry <= max_retries:
			retry_timer.start(retry_delay)

# called when we receive response from open ai
func _on_ai_request_completed(result, response_code, headers, body):
	var json = JSON.new()
	json.parse(body.get_string_from_utf8())
	var response = json.get_data()
	print("AI Request Completed: " + str(response))
	if response_code == 200:
		villain_dialogue = response["choices"][0]["message"]["content"]
	else:
		if openai_max_retries <= openai_current_retry:
			ai_request.request(url, headers_to_send, HTTPClient.METHOD_POST, body)
			openai_current_retry += 1

	print(villain_dialogue)
