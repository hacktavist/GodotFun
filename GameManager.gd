extends Node

################################################################################
# TODO: create a "contacting servers" screen and disable input until we have
#       tried every attempt to set villain_dialogue before going with default
#       dialogue text
################################################################################

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
	request = HTTPRequest.new()
	ai_request = HTTPRequest.new()
	add_child(request)
	add_child(retry_timer)
	add_child(ai_request)
	request.connect("request_completed", _on_request_completed)
	retry_timer.connect("timeout", _on_timer_timeout)
	ai_request.connect("request_completed", _on_ai_request_completed)
	get_api_key()


	
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
