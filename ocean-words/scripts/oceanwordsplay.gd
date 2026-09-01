extends Node2D

var words = []
var answer = ""
var guess = ""
var row1 = false
var row2 = false
var row3 = false
var row4 = false
var row5 = false
var row6 = false

var c1 = false
var c2 = false
var c3 = false
var c4 = false
var c5 = false

var won = false
var submit_answer = ""
var game_done = false
var request = HTTPRequest.new()

	
func load_words():
	var file = FileAccess.open("res://words.txt", FileAccess.READ)

	while not file.eof_reached():
		var word = file.get_line().strip_edges()

		if word != "":
			words.append(word)

	file.close()
	

func _ready():
	load_words()
	pick_word()
	print(answer)
	$Node2D/BgBlur/WordShow/Word.text = answer.capitalize()


func pick_word():
	answer = words.pick_random()

func game_over():
	c1 = false
	c2 = false
	c3 = false
	c4 = false
	c5 = false
	guess = ""
	row1 = true
	row2 = true
	row3 = true
	row4 = true
	row5 = true
	row6 = true
	$Node2D/BgBlur.visible = true
	$Node2D/BgBlur/WordShow.visible = true
	$Node2D
#game actually starting
func check():
	submit_answer = guess.to_lower()

	if submit_answer not in words:
		print("NOT A WORD")
		$AnimationPlayer.play("wrong")
		return

	print("VALID WORD")
	if row1 == false:
		row1 = true
		c1 = false
		c2 = false
		c3 = false
		c4 = false
		c5 = false
		if guess[0] == answer[0]:
			$"Node2D/Colored Boxes/Row1/BlackWord1".modulate = Color(0.157, 0.604, 0.157)
		elif guess[0] in answer:
			$"Node2D/Colored Boxes/Row1/BlackWord1".modulate = Color(0.808, 0.839, 0.275, 1.0)
		else:
			$"Node2D/Colored Boxes/Row1/BlackWord1".modulate = Color(0.49, 0.49, 0.49, 1.0)
			
		if guess[1] == answer[1]:
			$"Node2D/Colored Boxes/Row1/BlackWord2".modulate = Color(0.157, 0.604, 0.157)
		elif guess[1] in answer:
			$"Node2D/Colored Boxes/Row1/BlackWord2".modulate = Color(0.808, 0.839, 0.275, 1.0)
		else:
			$"Node2D/Colored Boxes/Row1/BlackWord2".modulate = Color(0.49, 0.49, 0.49, 1.0)

		if guess[2] == answer[2]:
			$"Node2D/Colored Boxes/Row1/BlackWord3".modulate = Color(0.157, 0.604, 0.157)
		elif guess[2] in answer:
			$"Node2D/Colored Boxes/Row1/BlackWord3".modulate = Color(0.808, 0.839, 0.275, 1.0)
		else:
			$"Node2D/Colored Boxes/Row1/BlackWord3".modulate = Color(0.49, 0.49, 0.49, 1.0)

		if guess[3] == answer[3]:
			$"Node2D/Colored Boxes/Row1/BlackWord4".modulate = Color(0.157, 0.604, 0.157)
		elif guess[3] in answer:
			$"Node2D/Colored Boxes/Row1/BlackWord4".modulate = Color(0.808, 0.839, 0.275, 1.0)
		else:
			$"Node2D/Colored Boxes/Row1/BlackWord4".modulate = Color(0.49, 0.49, 0.49, 1.0)
			
		if guess[4] == answer[4]:
			$"Node2D/Colored Boxes/Row1/BlackWord5".modulate = Color(0.157, 0.604, 0.157)
		elif guess[4] in answer:
			$"Node2D/Colored Boxes/Row1/BlackWord5".modulate = Color(0.808, 0.839, 0.275, 1.0)
		else:
			$"Node2D/Colored Boxes/Row1/BlackWord5".modulate = Color(0.49, 0.49, 0.49, 1.0)
		guess = ""
	elif row2 == false:
		row2 = true
		c1 = false
		c2 = false
		c3 = false
		c4 = false
		c5 = false
		if guess[0] == answer[0]:
			$"Node2D/Colored Boxes/Row2/BlackWord1".modulate = Color(0.157, 0.604, 0.157)
		elif guess[0] in answer:
			$"Node2D/Colored Boxes/Row2/BlackWord1".modulate = Color(0.808, 0.839, 0.275, 1.0)
		else:
			$"Node2D/Colored Boxes/Row2/BlackWord1".modulate = Color(0.49, 0.49, 0.49, 1.0)
			
		if guess[1] == answer[1]:
			$"Node2D/Colored Boxes/Row2/BlackWord2".modulate = Color(0.157, 0.604, 0.157)
		elif guess[1] in answer:
			$"Node2D/Colored Boxes/Row2/BlackWord2".modulate = Color(0.808, 0.839, 0.275, 1.0)
		else:
			$"Node2D/Colored Boxes/Row2/BlackWord2".modulate = Color(0.49, 0.49, 0.49, 1.0)

		if guess[2] == answer[2]:
			$"Node2D/Colored Boxes/Row2/BlackWord3".modulate = Color(0.157, 0.604, 0.157)
		elif guess[2] in answer:
			$"Node2D/Colored Boxes/Row2/BlackWord3".modulate = Color(0.808, 0.839, 0.275, 1.0)
		else:
			$"Node2D/Colored Boxes/Row2/BlackWord3".modulate = Color(0.49, 0.49, 0.49, 1.0)

		if guess[3] == answer[3]:
			$"Node2D/Colored Boxes/Row2/BlackWord4".modulate = Color(0.157, 0.604, 0.157)
		elif guess[3] in answer:
			$"Node2D/Colored Boxes/Row2/BlackWord4".modulate = Color(0.808, 0.839, 0.275, 1.0)
		else:
			$"Node2D/Colored Boxes/Row2/BlackWord4".modulate = Color(0.49, 0.49, 0.49, 1.0)
			
		if guess[4] == answer[4]:
			$"Node2D/Colored Boxes/Row2/BlackWord5".modulate = Color(0.157, 0.604, 0.157)
		elif guess[4] in answer:
			$"Node2D/Colored Boxes/Row2/BlackWord5".modulate = Color(0.808, 0.839, 0.275, 1.0)
		else:
			$"Node2D/Colored Boxes/Row2/BlackWord5".modulate = Color(0.49, 0.49, 0.49, 1.0)
		guess = ""
	elif row3 == false:
		row3 = true
		c1 = false
		c2 = false
		c3 = false
		c4 = false
		c5 = false
		if guess[0] == answer[0]:
			$"Node2D/Colored Boxes/Row3/BlackWord1".modulate = Color(0.157, 0.604, 0.157)
		elif guess[0] in answer:
			$"Node2D/Colored Boxes/Row3/BlackWord1".modulate = Color(0.808, 0.839, 0.275, 1.0)
		else:
			$"Node2D/Colored Boxes/Row3/BlackWord1".modulate = Color(0.49, 0.49, 0.49, 1.0)
			
		if guess[1] == answer[1]:
			$"Node2D/Colored Boxes/Row3/BlackWord2".modulate = Color(0.157, 0.604, 0.157)
		elif guess[1] in answer:
			$"Node2D/Colored Boxes/Row3/BlackWord2".modulate = Color(0.808, 0.839, 0.275, 1.0)
		else:
			$"Node2D/Colored Boxes/Row3/BlackWord2".modulate = Color(0.49, 0.49, 0.49, 1.0)

		if guess[2] == answer[2]:
			$"Node2D/Colored Boxes/Row3/BlackWord3".modulate = Color(0.157, 0.604, 0.157)
		elif guess[2] in answer:
			$"Node2D/Colored Boxes/Row3/BlackWord3".modulate = Color(0.808, 0.839, 0.275, 1.0)
		else:
			$"Node2D/Colored Boxes/Row3/BlackWord3".modulate = Color(0.49, 0.49, 0.49, 1.0)

		if guess[3] == answer[3]:
			$"Node2D/Colored Boxes/Row3/BlackWord4".modulate = Color(0.157, 0.604, 0.157)
		elif guess[3] in answer:
			$"Node2D/Colored Boxes/Row3/BlackWord4".modulate = Color(0.808, 0.839, 0.275, 1.0)
		else:
			$"Node2D/Colored Boxes/Row3/BlackWord4".modulate = Color(0.49, 0.49, 0.49, 1.0)
			
		if guess[4] == answer[4]:
			$"Node2D/Colored Boxes/Row3/BlackWord5".modulate = Color(0.157, 0.604, 0.157)
		elif guess[4] in answer:
			$"Node2D/Colored Boxes/Row3/BlackWord5".modulate = Color(0.808, 0.839, 0.275, 1.0)
		else:
			$"Node2D/Colored Boxes/Row3/BlackWord5".modulate = Color(0.49, 0.49, 0.49, 1.0)
		guess = ""
	elif row4 == false:
		row4 = true
		c1 = false
		c2 = false
		c3 = false
		c4 = false
		c5 = false
		if guess[0] == answer[0]:
			$"Node2D/Colored Boxes/Row4/BlackWord1".modulate = Color(0.157, 0.604, 0.157)
		elif guess[0] in answer:
			$"Node2D/Colored Boxes/Row4/BlackWord1".modulate = Color(0.808, 0.839, 0.275, 1.0)
		else:
			$"Node2D/Colored Boxes/Row4/BlackWord1".modulate = Color(0.49, 0.49, 0.49, 1.0)
			
		if guess[1] == answer[1]:
			$"Node2D/Colored Boxes/Row4/BlackWord2".modulate = Color(0.157, 0.604, 0.157)
		elif guess[1] in answer:
			$"Node2D/Colored Boxes/Row4/BlackWord2".modulate = Color(0.808, 0.839, 0.275, 1.0)
		else:
			$"Node2D/Colored Boxes/Row4/BlackWord2".modulate = Color(0.49, 0.49, 0.49, 1.0)

		if guess[2] == answer[2]:
			$"Node2D/Colored Boxes/Row4/BlackWord3".modulate = Color(0.157, 0.604, 0.157)
		elif guess[2] in answer:
			$"Node2D/Colored Boxes/Row4/BlackWord3".modulate = Color(0.808, 0.839, 0.275, 1.0)
		else:
			$"Node2D/Colored Boxes/Row4/BlackWord3".modulate = Color(0.49, 0.49, 0.49, 1.0)

		if guess[3] == answer[3]:
			$"Node2D/Colored Boxes/Row4/BlackWord4".modulate = Color(0.157, 0.604, 0.157)
		elif guess[3] in answer:
			$"Node2D/Colored Boxes/Row4/BlackWord4".modulate = Color(0.808, 0.839, 0.275, 1.0)
		else:
			$"Node2D/Colored Boxes/Row4/BlackWord4".modulate = Color(0.49, 0.49, 0.49, 1.0)
			
		if guess[4] == answer[4]:
			$"Node2D/Colored Boxes/Row4/BlackWord5".modulate = Color(0.157, 0.604, 0.157)
		elif guess[4] in answer:
			$"Node2D/Colored Boxes/Row4/BlackWord5".modulate = Color(0.808, 0.839, 0.275, 1.0)
		else:
			$"Node2D/Colored Boxes/Row4/BlackWord5".modulate = Color(0.49, 0.49, 0.49, 1.0)
		guess = ""
	elif row5 == false:
		row5 = true
		c1 = false
		c2 = false
		c3 = false
		c4 = false
		c5 = false
		if guess[0] == answer[0]:
			$"Node2D/Colored Boxes/Row5/BlackWord1".modulate = Color(0.157, 0.604, 0.157)
		elif guess[0] in answer:
			$"Node2D/Colored Boxes/Row5/BlackWord1".modulate = Color(0.808, 0.839, 0.275, 1.0)
		else:
			$"Node2D/Colored Boxes/Row5/BlackWord1".modulate = Color(0.49, 0.49, 0.49, 1.0)
			
		if guess[1] == answer[1]:
			$"Node2D/Colored Boxes/Row5/BlackWord2".modulate = Color(0.157, 0.604, 0.157)
		elif guess[1] in answer:
			$"Node2D/Colored Boxes/Row5/BlackWord2".modulate = Color(0.808, 0.839, 0.275, 1.0)
		else:
			$"Node2D/Colored Boxes/Row5/BlackWord2".modulate = Color(0.49, 0.49, 0.49, 1.0)

		if guess[2] == answer[2]:
			$"Node2D/Colored Boxes/Row5/BlackWord3".modulate = Color(0.157, 0.604, 0.157)
		elif guess[2] in answer:
			$"Node2D/Colored Boxes/Row5/BlackWord3".modulate = Color(0.808, 0.839, 0.275, 1.0)
		else:
			$"Node2D/Colored Boxes/Row5/BlackWord3".modulate = Color(0.49, 0.49, 0.49, 1.0)

		if guess[3] == answer[3]:
			$"Node2D/Colored Boxes/Row5/BlackWord4".modulate = Color(0.157, 0.604, 0.157)
		elif guess[3] in answer:
			$"Node2D/Colored Boxes/Row5/BlackWord4".modulate = Color(0.808, 0.839, 0.275, 1.0)
		else:
			$"Node2D/Colored Boxes/Row5/BlackWord4".modulate = Color(0.49, 0.49, 0.49, 1.0)
			
		if guess[4] == answer[4]:
			$"Node2D/Colored Boxes/Row5/BlackWord5".modulate = Color(0.157, 0.604, 0.157)
		elif guess[4] in answer:
			$"Node2D/Colored Boxes/Row5/BlackWord5".modulate = Color(0.808, 0.839, 0.275, 1.0)
		else:
			$"Node2D/Colored Boxes/Row5/BlackWord5".modulate = Color(0.49, 0.49, 0.49, 1.0)
		guess = ""

	elif row6 == false:
		row6 = true
		c1 = false
		c2 = false
		c3 = false
		c4 = false
		c5 = false
		if guess[0] == answer[0]:
			$"Node2D/Colored Boxes/Row6/BlackWord1".modulate = Color(0.157, 0.604, 0.157)
		elif guess[0] in answer:
			$"Node2D/Colored Boxes/Row6/BlackWord1".modulate = Color(0.808, 0.839, 0.275, 1.0)
		else:
			$"Node2D/Colored Boxes/Row6/BlackWord1".modulate = Color(0.49, 0.49, 0.49, 1.0)
			
		if guess[1] == answer[1]:
			$"Node2D/Colored Boxes/Row6/BlackWord2".modulate = Color(0.157, 0.604, 0.157)
		elif guess[1] in answer:
			$"Node2D/Colored Boxes/Row6/BlackWord2".modulate = Color(0.808, 0.839, 0.275, 1.0)
		else:
			$"Node2D/Colored Boxes/Row6/BlackWord2".modulate = Color(0.49, 0.49, 0.49, 1.0)

		if guess[2] == answer[2]:
			$"Node2D/Colored Boxes/Row6/BlackWord3".modulate = Color(0.157, 0.604, 0.157)
		elif guess[2] in answer:
			$"Node2D/Colored Boxes/Row6/BlackWord3".modulate = Color(0.808, 0.839, 0.275, 1.0)
		else:
			$"Node2D/Colored Boxes/Row6/BlackWord3".modulate = Color(0.49, 0.49, 0.49, 1.0)

		if guess[3] == answer[3]:
			$"Node2D/Colored Boxes/Row6/BlackWord4".modulate = Color(0.157, 0.604, 0.157)
		elif guess[3] in answer:
			$"Node2D/Colored Boxes/Row6/BlackWord4".modulate = Color(0.808, 0.839, 0.275, 1.0)
		else:
			$"Node2D/Colored Boxes/Row6/BlackWord4".modulate = Color(0.49, 0.49, 0.49, 1.0)
			
		if guess[4] == answer[4]:
			$"Node2D/Colored Boxes/Row6/BlackWord5".modulate = Color(0.157, 0.604, 0.157)
		elif guess[4] in answer:
			$"Node2D/Colored Boxes/Row6/BlackWord5".modulate = Color(0.808, 0.839, 0.275, 1.0)
		else:
			$"Node2D/Colored Boxes/Row6/BlackWord5".modulate = Color(0.49, 0.49, 0.49, 1.0)
		guess = ""
		game_over()
		
	if submit_answer == answer:
		won = true
		game_over()
	
func add_letter():
	if row1 == false:
		if c1 == false:
			c1 = true 
			$"Node2D/Row Letters/Row1/L1".text = guess[0].to_upper()
		elif c2 == false:
			c2 = true
			$"Node2D/Row Letters/Row1/L2".text = guess[1].to_upper()
		elif c3 == false:
			c3 = true
			$"Node2D/Row Letters/Row1/L5".text = guess[2].to_upper()
		elif c4 == false:
			c4 = true
			$"Node2D/Row Letters/Row1/L3".text = guess[3].to_upper()
		elif c5 == false:
			c5 = true
			$"Node2D/Row Letters/Row1/L4".text = guess[4].to_upper()
	elif row2 == false:
		if c1 == false:
			c1 = true
			$"Node2D/Row Letters/Row2/L1".text = guess[0].to_upper()
		elif c2 == false:
			c2 = true
			$"Node2D/Row Letters/Row2/L2".text = guess[1].to_upper()
		elif c3 == false:
			c3 = true
			$"Node2D/Row Letters/Row2/L5".text = guess[2].to_upper()
		elif c4 == false:
			c4 = true
			$"Node2D/Row Letters/Row2/L3".text = guess[3].to_upper()
		elif c5 == false:
			c5 = true
			$"Node2D/Row Letters/Row2/L4".text = guess[4].to_upper()
	elif row3 == false:
		if c1 == false:
			c1 = true
			$"Node2D/Row Letters/Row3/L1".text = guess[0].to_upper()
		elif c2 == false:
			c2 = true
			$"Node2D/Row Letters/Row3/L2".text = guess[1].to_upper()
		elif c3 == false:
			c3 = true
			$"Node2D/Row Letters/Row3/L5".text = guess[2].to_upper()
		elif c4 == false:
			c4 = true
			$"Node2D/Row Letters/Row3/L3".text = guess[3].to_upper()
		elif c5 == false:
			c5 = true
			$"Node2D/Row Letters/Row3/L4".text = guess[4].to_upper()
	elif row4 == false:
		if c1 == false:
			c1 = true
			$"Node2D/Row Letters/Row4/L1".text = guess[0].to_upper()
		elif c2 == false:
			c2 = true
			$"Node2D/Row Letters/Row4/L2".text = guess[1].to_upper()
		elif c3 == false:
			c3 = true
			$"Node2D/Row Letters/Row4/L5".text = guess[2].to_upper()
		elif c4 == false:
			c4 = true
			$"Node2D/Row Letters/Row4/L3".text = guess[3].to_upper()
		elif c5 == false:
			c5 = true
			$"Node2D/Row Letters/Row4/L4".text = guess[4].to_upper()
	elif row5 == false:
		if c1 == false:
			c1 = true
			$"Node2D/Row Letters/Row5/L1".text = guess[0].to_upper()
		elif c2 == false:
			c2 = true
			$"Node2D/Row Letters/Row5/L2".text = guess[1].to_upper()
		elif c3 == false:
			c3 = true
			$"Node2D/Row Letters/Row5/L5".text = guess[2].to_upper()
		elif c4 == false:
			c4 = true
			$"Node2D/Row Letters/Row5/L3".text = guess[3].to_upper()
		elif c5 == false:
			c5 = true
			$"Node2D/Row Letters/Row5/L4".text = guess[4].to_upper()
	elif row6 == false:
		if c1 == false:
			c1 = true
			$"Node2D/Row Letters/Row6/L1".text = guess[0].to_upper()
		elif c2 == false:
			c2 = true
			$"Node2D/Row Letters/Row6/L2".text = guess[1].to_upper()
		elif c3 == false:
			c3 = true
			$"Node2D/Row Letters/Row6/L5".text = guess[2].to_upper()
		elif c4 == false:
			c4 = true
			$"Node2D/Row Letters/Row6/L3".text = guess[3].to_upper()
		elif c5 == false:
			c5 = true
			$"Node2D/Row Letters/Row6/L4".text = guess[4].to_upper()

			
func _input(event):
	if event.is_action_pressed("enter") and guess.length() == 5:
		check()

	if event.is_action_pressed("a") and guess.length() < 5:
		guess += "a"
		add_letter()
	if event.is_action_pressed("b") and guess.length() < 5:
		guess += "b"
		add_letter()
	if event.is_action_pressed("c") and guess.length() < 5:
		guess += "c"
		add_letter()
	if event.is_action_pressed("d") and guess.length() < 5:
		guess += "d"
		add_letter()
	if event.is_action_pressed("e") and guess.length() < 5:
		guess += "e"
		add_letter()
	if event.is_action_pressed("f") and guess.length() < 5:
		guess += "f"
		add_letter()
	if event.is_action_pressed("g") and guess.length() < 5:
		guess += "g"
		add_letter()
	if event.is_action_pressed("h") and guess.length() < 5:
		guess += "h"
		add_letter()
	if event.is_action_pressed("i") and guess.length() < 5:
		guess += "i"
		add_letter()
	if event.is_action_pressed("j") and guess.length() < 5:
		guess += "j"
		add_letter()
	if event.is_action_pressed("k") and guess.length() < 5:
		guess += "k"
		add_letter()
	if event.is_action_pressed("l") and guess.length() < 5:
		guess += "l"
		add_letter()
	if event.is_action_pressed("m") and guess.length() < 5:
		guess += "m"
		add_letter()
	if event.is_action_pressed("n") and guess.length() < 5:
		guess += "n"
		add_letter()
	if event.is_action_pressed("o") and guess.length() < 5:
		guess += "o"
		add_letter()
	if event.is_action_pressed("p") and guess.length() < 5:
		guess += "p"
		add_letter()
	if event.is_action_pressed("q") and guess.length() < 5:
		guess += "q"
		add_letter()
	if event.is_action_pressed("r") and guess.length() < 5:
		guess += "r"
		add_letter()
	if event.is_action_pressed("s") and guess.length() < 5:
		guess += "s"
		add_letter()
	if event.is_action_pressed("t") and guess.length() < 5:
		guess += "t"
		add_letter()
	if event.is_action_pressed("u") and guess.length() < 5:
		guess += "u"
		add_letter()
	if event.is_action_pressed("v") and guess.length() < 5:
		guess += "v"
		add_letter()
	if event.is_action_pressed("w") and guess.length() < 5:
		guess += "w"
		add_letter()
	if event.is_action_pressed("x") and guess.length() < 5:
		guess += "x"
		add_letter()
	if event.is_action_pressed("y") and guess.length() < 5:
		guess += "y"
		add_letter()
	if event.is_action_pressed("z") and guess.length() < 5:
		guess += "z"
		add_letter()
	if event.is_action_pressed("delete"):
		if guess.length() > 0:
			guess = guess.left(guess.length() - 1)
			if row1 == false:
				if c5 == true:
					c5 = false
					$"Node2D/Row Letters/Row1/L4".text = ""
				elif c4 == true:
					c4 = false
					$"Node2D/Row Letters/Row1/L3".text = ""
				elif c3 == true:
					c3 = false
					$"Node2D/Row Letters/Row1/L5".text = ""
				elif c2 == true:
					c2 = false
					$"Node2D/Row Letters/Row1/L2".text = ""
				elif c1 == true:
					c1 = false
					$"Node2D/Row Letters/Row1/L1".text = ""
			elif row2 == false:
				if c5 == true:
					c5 = false
					$"Node2D/Row Letters/Row2/L4".text = ""
				elif c4 == true:
					c4 = false
					$"Node2D/Row Letters/Row2/L3".text = ""
				elif c3 == true:
					c3 = false
					$"Node2D/Row Letters/Row2/L5".text = ""
				elif c2 == true:
					c2 = false
					$"Node2D/Row Letters/Row2/L2".text = ""
				elif c1 == true:
					c1 = false
					$"Node2D/Row Letters/Row2/L1".text = ""
			elif row3 == false:
				if c5 == true:
					c5 = false
					$"Node2D/Row Letters/Row3/L4".text = ""
				elif c4 == true:
					c4 = false
					$"Node2D/Row Letters/Row3/L3".text = ""
				elif c3 == true:
					c3 = false
					$"Node2D/Row Letters/Row3/L5".text = ""
				elif c2 == true:
					c2 = false
					$"Node2D/Row Letters/Row3/L2".text = ""
				elif c1 == true:
					c1 = false
					$"Node2D/Row Letters/Row3/L1".text = ""
			elif row4 == false:
				if c5 == true:
					c5 = false
					$"Node2D/Row Letters/Row4/L4".text = ""
				elif c4 == true:
					c4 = false
					$"Node2D/Row Letters/Row4/L3".text = ""
				elif c3 == true:
					c3 = false
					$"Node2D/Row Letters/Row4/L5".text = ""
				elif c2 == true:
					c2 = false
					$"Node2D/Row Letters/Row4/L2".text = ""
				elif c1 == true:
					c1 = false
					$"Node2D/Row Letters/Row4/L1".text = ""
			elif row5 == false:
				if c5 == true:
					c5 = false
					$"Node2D/Row Letters/Row5/L4".text = ""
				elif c4 == true:
					c4 = false
					$"Node2D/Row Letters/Row5/L3".text = ""
				elif c3 == true:
					c3 = false
					$"Node2D/Row Letters/Row5/L5".text = ""
				elif c2 == true:
					c2 = false
					$"Node2D/Row Letters/Row5/L2".text = ""
				elif c1 == true:
					c1 = false
					$"Node2D/Row Letters/Row5/L1".text = ""
			elif row6 == false:
				if c5 == true:
					c5 = false
					$"Node2D/Row Letters/Row6/L4".text = ""
				elif c4 == true:
					c4 = false
					$"Node2D/Row Letters/Row6/L3".text = ""
				elif c3 == true:
					c3 = false
					$"Node2D/Row Letters/Row6/L5".text = ""
				elif c2 == true:
					c2 = false
					$"Node2D/Row Letters/Row6/L2".text = ""
				elif c1 == true:
					c1 = false
					$"Node2D/Row Letters/Row6/L1".text = ""
				


#region KeyButs
func _on_bq_pressed() -> void:
	guess += "q"
	add_letter()

func _on_bw_pressed() -> void:
	guess += "w"
	add_letter()

func _on_be_pressed() -> void:
	guess += "e"
	add_letter()

func _on_br_pressed() -> void:
	guess += "r"
	add_letter()

func _on_bt_pressed() -> void:
	
	guess += "t"
	add_letter()

func _on_by_pressed() -> void:
	guess += "y"
	add_letter()

func _on_bu_pressed() -> void:
	guess += "u"
	add_letter()

func _on_bi_pressed() -> void:
	guess += "i"
	add_letter()

func _on_bo_pressed() -> void:
	guess += "o"
	add_letter()

func _on_bp_pressed() -> void:
	guess += "p"
	add_letter()

func _on_ba_pressed() -> void:
	guess += "a"
	add_letter()

func _on_bs_pressed() -> void:
	guess += "s"
	add_letter()

func _on_bd_pressed() -> void:
	guess += "d"
	add_letter()

func _on_bf_pressed() -> void:
	guess += "f"
	add_letter()

func _on_bg_pressed() -> void:
	guess += "g"
	add_letter()

func _on_bh_pressed() -> void:
	guess += "h"
	add_letter()

func _on_bj_pressed() -> void:
	guess += "j"
	add_letter()

func _on_bk_pressed() -> void:
	guess += "k"
	add_letter()

func _on_bl_button_up() -> void:
	guess += "l"
	add_letter()

func _on_bz_pressed() -> void:
	guess += "z"
	add_letter()

func _on_bx_pressed() -> void:
	guess += "x"
	add_letter()

func _on_bc_pressed() -> void:
	guess += "c"
	add_letter()

func _on_bv_pressed() -> void:
	guess += "v"
	add_letter()

func _on_bb_pressed() -> void:
	guess += "b"
	add_letter()

func _on_bn_pressed() -> void:
	guess += "n"
	add_letter()

func _on_bm_pressed() -> void:
	guess += "m"
	add_letter()

func _on_enter_pressed() -> void:
	if guess.length() == 5:
		check()


func _on_delete_pressed() -> void:
	if guess.length() > 0:
		guess = guess.left(guess.length() - 1)
		if row1 == false:
			if c5 == true:
				c5 = false
				$"Node2D/Row Letters/Row1/L4".text = ""
			elif c4 == true:
				c4 = false
				$"Node2D/Row Letters/Row1/L3".text = ""
			elif c3 == true:
				c3 = false
				$"Node2D/Row Letters/Row1/L5".text = ""
			elif c2 == true:
				c2 = false
				$"Node2D/Row Letters/Row1/L2".text = ""
			elif c1 == true:
				c1 = false
				$"Node2D/Row Letters/Row1/L1".text = ""
		elif row2 == false:
			if c5 == true:
				c5 = false
				$"Node2D/Row Letters/Row2/L4".text = ""
			elif c4 == true:
				c4 = false
				$"Node2D/Row Letters/Row2/L3".text = ""
			elif c3 == true:
				c3 = false
				$"Node2D/Row Letters/Row2/L5".text = ""
			elif c2 == true:
				c2 = false
				$"Node2D/Row Letters/Row2/L2".text = ""
			elif c1 == true:
				c1 = false
				$"Node2D/Row Letters/Row2/L1".text = ""
		elif row3 == false:
			if c5 == true:
				c5 = false
				$"Node2D/Row Letters/Row3/L4".text = ""
			elif c4 == true:
				c4 = false
				$"Node2D/Row Letters/Row3/L3".text = ""
			elif c3 == true:
				c3 = false
				$"Node2D/Row Letters/Row3/L5".text = ""
			elif c2 == true:
				c2 = false
				$"Node2D/Row Letters/Row3/L2".text = ""
			elif c1 == true:
				c1 = false
				$"Node2D/Row Letters/Row3/L1".text = ""
		elif row4 == false:
			if c5 == true:
				c5 = false
				$"Node2D/Row Letters/Row4/L4".text = ""
			elif c4 == true:
				c4 = false
				$"Node2D/Row Letters/Row4/L3".text = ""
			elif c3 == true:
				c3 = false
				$"Node2D/Row Letters/Row4/L5".text = ""
			elif c2 == true:
				c2 = false
				$"Node2D/Row Letters/Row4/L2".text = ""
			elif c1 == true:
				c1 = false
				$"Node2D/Row Letters/Row4/L1".text = ""
		elif row5 == false:
			if c5 == true:
				c5 = false
				$"Node2D/Row Letters/Row5/L4".text = ""
			elif c4 == true:
				c4 = false
				$"Node2D/Row Letters/Row5/L3".text = ""
			elif c3 == true:
				c3 = false
				$"Node2D/Row Letters/Row5/L5".text = ""
			elif c2 == true:
				c2 = false
				$"Node2D/Row Letters/Row5/L2".text = ""
			elif c1 == true:
				c1 = false
				$"Node2D/Row Letters/Row5/L1".text = ""
		elif row6 == false:
			if c5 == true:
				c5 = false
				$"Node2D/Row Letters/Row6/L4".text = ""
			elif c4 == true:
				c4 = false
				$"Node2D/Row Letters/Row6/L3".text = ""
			elif c3 == true:
				c3 = false
				$"Node2D/Row Letters/Row6/L5".text = ""
			elif c2 == true:
				c2 = false
				$"Node2D/Row Letters/Row6/L2".text = ""
			elif c1 == true:
				c1 = false
				$"Node2D/Row Letters/Row6/L1".text = ""
#endregion


func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()


func _on_c_lose_pressed() -> void:
	$Node2D/BgBlur/HelpNeed.visible = false
	$Node2D/BgBlur.visible = false
	


func _on_info_but_pressed() -> void:
	$Node2D/BgBlur.visible = true
	$Node2D/BgBlur/HelpNeed.visible = true
