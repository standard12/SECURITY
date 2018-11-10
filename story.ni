"SECURITY" by Mikrokosmonaut

Section 1 - Setup

The story genre is "Crime".

[Create Scenes (Shopping Spree -> Escape -> Ending)]
Shopping Spree is a scene. Shopping Spree begins when play begins. Shopping Spree ends when the thief is satisfied.

Escape is a scene. Escape begins when Shopping Spree ends.

[Define People and Things]
A shopper is a kind of person. A shopper can be satisfied. A shopper has some text called an admission.
A man and a woman are kinds of shopper.
A thief is a shopper that varies.

An aisle is a kind of room. Every aisle has a table name called camera.

A screen is a kind of thing. Every screen has a table name called camera. The description of a screen is usually "The screen is blank.".

A grocery is a kind of thing. It is edible.

[Fresh Produce]
A box of apples is a kind of grocery. The plural of a box of apples is boxes of apples. Understand "apples" as a box of apples. The description of a box of apples is "A crate of fairly juicy-looking green apples.".
sliced carrot is a kind of grocery. The plural of sliced carrot is packets of sliced carrot. sliced carrot is plural-named. Understand "carrot" as sliced carrot. The description of sliced carrot is "A small letter V in a green circle indicates that this food is suitable for vegetarians. Makes you mad.".
A sack of potatoes is a kind of grocery. The plural of a sack of potatoes is sacks of potatoes. Understand "potatoes" as a sack of potatoes. The description of a sack of potatoes is "Now this is a vegetable you can get behind. All of your favourite foods are made of potato: french fries, potatoes... mashed potatoes.".

[Canned Goods]
A can of tomato soup is a kind of grocery. The plural of a can of tomato soup is cans of tomato soup. Understand "tomato soup" or "soup" as a can of tomato soup. The description of a can of tomato soup is "A can of own brand tomato soup. Lasts for up to 3 years when stored in a cool place.".
A tin of tuna is a kind of grocery. The plural of a tin of tuna is tins of tuna. Understand "tuna" as a tin of tuna. The description of a tin of tuna is "Hmm. This tuna looks a little fishy.".
A can of baked beans is a kind of grocery. The plural of a can of baked beans is cans of baked beans. Understand "beans" or "baked beans" as a can of baked beans. The description of a can of baked beans is "A can of own-brand baked beans. I might buy a pack of these letter when it quietens down. For guests of course. I wouldn't eat them.".

[Frozen Foods]
A kilo of mystery meat is a kind of grocery. The plural of a kilo of mystery meat is kilos of mystery meat. Understand "meat" or "mystery meat" as a kilo of mystery meat. The description of a kilo of mystery meat is "100% Meat!!! Yeah, but what kind of meat?".
A tub of ice-cream is a kind of grocery. The plural of a tub of ice-cream is tubs of ice-cream. Understand "ice-cream" as a tub of ice-cream. The description of a tub of ice-cream is "These particular tubs of ice-cream have been in there since before I started work here. You'd need a pick-axe to eat it with.".
A packet of frozen oven chips is a kind of grocery. The plural of a packet of frozen oven chips is packets of frozen oven chips. Understand "chips" or "oven chips" or "frozen chips" or "frozen oven chips" as a packet of frozen oven chips. The description of a packet of frozen oven chips is "Your second favourite form of potato.".

A coat is a kind of thing. A coat is always wearable.
Trousers are a kind of thing. Trousers are always wearable.
A dress is a kind of thing. A dress is always wearable.

A pocket is a kind of container. A pocket is a part of every coat. A pocket is a part of every trousers.

A basket is a kind of open container. Every shopper carries a basket.

[Initialisation]
When play begins:
	now the time of day is 8:00 PM;
	now right hand status line is "[time of day]";
	now the thief is a random shopper;
	now the player carries the security key;
	now the player carries the handcuffs;
	say "[bold type]The last two hours of your day are always the worst. You've already taken your toilet break, so there's nothing left to distract you. No thieves are getting past on your watch![roman type][line break]".

[Shopping Spree Events]
		
Every turn during Shopping Spree:
	Repeat with individual running through shoppers:
		if a random chance of 1 in 5 succeeds:
			let current place be the holder of the individual;
			let next place be a random room adjacent to the current place;
			let way be the best route from the current place to the next place;
			try the individual going the way.
	
Every turn during Shopping Spree:		
	Repeat with individual running through shoppers in the Product Area:
		let place be the holder of the individual;
		if a random chance of 1 in 8 succeeds:
			let purchase be a random grocery in the place;
			if the purchase is not nothing, move the purchase to a random basket carried by the individual;
				if the individual is visible, say "[the individual] puts [a purchase] into [if the individual is a man]his[otherwise]her[end if] basket.";
				if the CCTV is switched on, record "[the individual] puts [a purchase] into [if the individual is a man]his[otherwise]her[end if] basket." to camera of the place.
				
Every turn during Shopping Spree:
	if a random chance of 1 in 12 succeeds and the thief is not visible and the thief is in the Product Area:
		let place be the holder of the thief;
		let p be a random pocket enclosed by the thief;
		let loot be a random grocery in the place;
		unless loot is nothing:
			move loot to p;
			if the CCTV is switched on, record "[the thief] slides [a loot] into [if the thief is a man]his[otherwise]her[end if] [holder of p].[first time] (might be worth giving this one a [one of]patting down[or]searching[or]frisking[at random])[only]" to camera of the place;
			let N be the number of things contained by p;
			if N is 2, now the thief is satisfied.

[Escape Events]
When Escape begins:
	say "Your sixth sense is telling you to act fast! It's time to frisk someone.".
	
Every turn during Escape:
	Repeat with individual running through shoppers in the Product Area:
		if a random chance of 1 in 4 succeeds:
			try the individual going south.
		
Every turn during Escape:
	Repeat with individual running through shoppers in the Checkouts:
		if the individual is the thief:
			move a random basket carried by the individual to the Checkouts;
			say "[bold type][the individual] drops [if the individual is a man]his[otherwise]her[end if] basket and shoots out of the exit before you have time to do anything. [the thief] has gotten the better of you again![roman type]";
			now the individual is nowhere;
			end the story;
		otherwise:
			if the individual is visible:
				say "[the individual] pays for [if the individual is a man]his[otherwise]her[end if] groceries and leaves.";
			now the individual is nowhere.

[Specific Character Actions]	
Every turn when the thief is visible:
	if a random chance of 1 in 20 succeeds, say "[the thief] twitches nervously.".

Every turn when Lenny Henry is visible:
	if a random chance of 1 in 20 succeeds, say "Lenny Henry stares at you from across the aisle, his face ever so slowly breaking into a creepy smile!".

Every turn when Barbara Streisand is visible:
	if a random chance of 1 in 20 succeeds, say "Barbara Streisand eyes you up and down. Apparently she doesn't like what she sees.".
	
Every turn when Glenn Gould is visible:
	if a random chance of 1 in 20 succeeds, say "Glenn Gould adjusts his gloves, looking at you over his collar.".
	
Every turn when Ricky Martin is visible:
	if a random chance of 1 in 20 succeeds, say "Ricky Martin does a little spin right past you. [if Janet Jackson is visible]Janet does not like what she sees.[end if]".
	
Every turn when Janet Jackson is visible:
	if a random chance of 1 in 20 succeeds, say "Janet Jackson flashes a friendly smile at you. I wonder what she's listening to.".

Instead of examining a shopper carrying a basket (called the cart):
	say "[the noun] is wearing [a list of things worn by the noun]. [run paragraph on]";
	try examining the cart.

Instead of examining a basket (called the cart):
	say "[the holder of the cart]'s basket contains [a list of things in the cart].".
	
[CCTV]
Table of Screen One Recordings
time stamp	event
a time	some text
with 60 blank rows.

Table of Screen Two Recordings
time stamp	event
a time	some text
with 60 blank rows.

Table of Screen Three Recordings
time stamp	event
a time	some text
with 60 blank rows.

To record (occurence - some text) to (film - table name):
	if the number of blank rows in film is 0, rule succeeds;
	choose a blank row in film;
	now time stamp entry is the time of day;
	now event entry is occurence.

Instead of examining a screen when the CCTV is switched on:
	let film be the camera of the noun;
	if the number of filled rows in the film is 0, say "The recording shows nothing worth noting.";
	repeat through the film:
		if a random chance of 1 in 15 succeeds:
			say "[line break]I'm pretty sure something happened at [time stamp entry], but [one of]I must've drifted off[or]I was distracted by the overwhelming thought of catching the thief[or]I got lost in my thoughts[at random].[run paragraph on]";
		otherwise:
			say "[line break]At [time stamp entry], [event entry]";
	say paragraph break.

[Frisking]
Frisking is an action applying to one thing.

Understand "frisk [someone]" or "search [someone]" or "pat [someone] down" or "pat down [someone]" or "apprehend [someone]" or "arrest [someone]" as Frisking.

Carry Out Frisking:
	if the noun is the thief:
		if the number of groceries in pockets enclosed by the thief is greater than 0:
			if the handcuffs are carried by the player:
				end the story finally saying "[bold type][admission of the thief][paragraph break]Well done! You've caught [the thief] trying to steal [a list of things in pockets enclosed by the thief]. Another day, another dollar![roman type]";
			otherwise:
				end the story saying "[bold type]Without the handcuffs to apprehend [the thief], you were powerless to do anything. Sensing weakness, [if the thief is a man]he[otherwise]she[end if] ran to the exit as quickly as [if the thief is a man]his[otherwise]her[end if] legs could carry [if the thief is a man]him[otherwise]her[end if] and successfully making [if the thief is a man]his[otherwise]her[end if] escape.[roman type]";
		otherwise:
			end the story saying "[bold type]You're certain that [the thief] has been up to no good, but you've got no evidence to prove it! Make sure you can prove it next time! You're fired![roman type]";
	otherwise:
		end the story saying "You've gone and frisked an innocent customer. Let's hope [the noun] doesn't press charges! You're fired!".
		
Instead of Frisking Gladys:
	say "Gladys would have your job for even suggesting such a thing!".
	
Instead of Frisking the player:
	say "Imagine what that would look like! You'd lose your job!".

[Dealing with possible non-actions]
Instead of eating a grocery:
	say "You're not hungry enough to eat anything from this dump.".
	
Before taking a grocery:
	say "You can pick up anything you need after you've caught this thief." instead.

Before examining a shopper for the first time:
	say "[bold type]Note to Player: [roman type]This particular security guard taken to calling the shoppers by the names of their celebrity look-a-likes. It's a tactic he first saw used to great effect in the remake of George Romero's 'Dawn of the Dead'.".
	
Understand "take all" or "take everything" as a mistake ("Are you kidding!? Where would you put it all?").

[Give approximate quantities]
Rule for printing a number of a grocery (called the purchase):
	if the listing group size is greater than 5:
		say "[one of]some[or]various[or]a selection of[or]an assortment of[at random] ";
	otherwise if the listing group size is 2:
		say "a couple of ";
	otherwise:
		say "a few ";
	 carry out the printing the plural name activity with the purchase.

Section 2 - Content

[Design the map]
The Product Area is a region.

The security camera is a backdrop. The security camera is in the Product Area. The description of the security camera is "The security camera glares at you. A [if the CCTV is switched on]green light flashes intermittently[otherwise]red light seems to indicate that CCTV is currently switched off[end if].".

The freezers are a backdrop. The freezers are in Frozen Foods. The description of the freezers is "The freezers give off an icy aura. Perhaps they are turned up too high.".

The shelves are a backdrop. The shelves are in the Product Area. The description of the shelves is "The shelves are neatly lined with all your favourite groceries.".

The Checkouts is a room. The player is in the Checkouts. The description of the checkouts is "Although there are four tills here, only one is currently. As always, it's occupied by [Gladys].[first time] In fact, now that you think about it, there's only one ever occupied.[only] A security door lies to the east hiding behind it the CCTV control station. To the north is the Fresh Produce aisle.[if the Checkouts contains a shopper] [list of shoppers in the Checkouts] [are] here considering whether or not to leave.[end if]".

The tills are a backdrop in the Checkouts. The description of the tills is "A short row of vacant tills.".

The conveyor belt, the till and the stool are things in the checkouts. The belt is a fixed in place supporter with carrying capacity 10. The till is scenery. The stool is a fixed in place enterable supporter with carrying capacity 1. Gladys is a person. Gladys is on the stool.

The description of Gladys is "The immortal demon-spawn known as Gladys. She's as efficient as a robot and twice as cold. Rumour has it she once made a thief cry just by staring at them.".

The description of the conveyor belt is "A rubber, intermittently jerking conveyor belt.".
The description of the till is "A relic from the 1980s.".
The description of the stool is "A small, wooden three-legged stool.". Understand "three-legged stool" as the stool.

The Security Room is a room. The description of the Security Room is "Your home from home. This is where you come to rewind. West of you are the checkouts.[if the Security Room contains a shopper] [list of shoppers in the Security Room] [are] here.[end if]".

CCTV is a device in the Security Room. The description of the CCTV is "Without this system you'd never catch anyone. The thieves tend not to risk stealing anything in eyeshot of you. The CCTV has 3 screens, referred to as screens 1, 2 and 3 respectively.[paragraph break]A little message, penned on to the screen in Tippex, reads:[line break]'1 Fresh Produce - 2 Canned Goods - 3 Frozen Foods'.". Screen One, Screen Two and Screen Three are screens. The camera of Screen One is Table of Screen One Recordings. The camera of Screen Two is Table of Screen Two Recordings. The camera of Screen Three is Table of Screen Three Recordings. Screen One, Screen Two and Screen Three are part of the CCTV. Understand "1" or "screen 1" as Screen One. Understand "2" or "screen 2" as Screen Two. Understand "3" or "screen 3" as Screen Three.

The security door is a lockable locked door. It is east of the checkouts and west of the security room. The matching key of the security door is the security key. The description of the security door is "It's called a security door, but it's really nothing more than a flimsy wooden door.[if locked] It's currently locked.[end if]". Understand "wooden door" or "flimsy wooden door" or "flimsy door" as the security door.

The description of the security key is "A small mortis-type key.".
The handcuffs are plural-named. The description of the handcuffs is "[first time]Note: If you want to use these, try 'arrest (someone)'. [paragraph break][only]The handcuffs are made of stainless steel.".

Frozen Foods is an aisle. It is in the Product Area. The camera of Frozen Foods is Table of Screen Three Recordings. 5 kilos of mystery meat, 7 tubs of ice-cream and 9 packets of frozen oven chips are in Frozen Foods. The description of Frozen Foods is "Freezers line the back wall and shelves line the walls. A security camera watches you from the corner. There's a deal on 'Mystery meat' apparently. To the south is the Canned Goods aisle.[if Frozen Foods contains a shopper] [list of shoppers in Frozen Foods] [are] here, opening and closing the freezers.[end if]".

Canned Goods is an aisle. It is in the Product Area. The camera of Canned Goods is Table of Screen Two Recordings. It is south of Frozen Foods. 3 cans of tomato soup, 5 cans of baked beans and 6 tins of tuna are in Canned Goods. The description of Canned Goods is "Shelves stand to the left and right of you holding a meagre offering of canned goods. A security camera perched above the beans watches over you. To the north is the Frozen Foods aisle. To the south is the Fresh Produce aisle.[if Canned Goods contains a shopper] [list of shoppers in Canned Goods] [are] here, browsing the various cans and tins.[end if]".

Fresh Produce is an aisle. It is in the Product Area. The camera of Fresh Produce is Table of Screen One Recordings. It is north of the checkouts and south of Canned Goods. 7 boxes of apples, 8 packets of sliced carrot and 4 sacks of potatoes are in Fresh Produce. The description of Fresh Produce is "Shelves stand either side of you displaying a paltry selection of fresh produce. A security camera peeks out at you from between the apples. To the south are the checkouts. To the north is the Canned Goods aisle.[if Fresh Produce contains a shopper] [list of shoppers in Fresh Produce] [are] here, eyeing up the produce.[end if]".

[Create some clothes for the shoppers to wear]
A tweed jacket is a coat.
cords are trousers. cords are plural-named.
A leather jacket is a coat.
A summer dress is a dress.
A waistcoat is a coat.
torn jeans are trousers. torn jeans are plural-named.
A hawaiian shirt is a coat.
wacky shorts are trousers. wacky shorts are plural-named.
An overcoat is a coat.
white flares are trousers. white flares are plural-named.

[Define the shoppers]
Glenn Gould is a man in Frozen Foods. Glenn Gould wears leather gloves, the tweed jacket and the cords. The admission of Glenn Gould is "'Drat! I've been foiled!' Glenn mutters as if to himself. You cuff him anyway.".
Janet Jackson is a woman in Canned Goods. Janet Jackson wears headphones, the leather jacket and the summer dress. The admission of Janet Jackson is "'A girl just can not get a break!' exclaims Janet as you put the cuffs on her.".
Ricky Martin is a man in Fresh Produce. Ricky Martin wears the waistcoat and the torn jeans. The admission of Ricky Martin is "'What are you trying to say, man?' exclaims Ricky as you take him in.".
Lenny Henry is a man in Canned Goods. Lenny Henry wears a hawaiian shirt and the wacky shorts. The admission of Lenny Henry is "'Oh, fiddlesticks! He he he!' sings Lenny as you cuff him.".
Barbara Streisand is a woman in Frozen Foods. Barbara Streisand wears sunglasses, the overcoat and the white flares. Understand "Babs" as Barbara Streisand. The admission of Barbara is "'I don't think you know who you're messing with, young man!' threatens Barbara, as she reaches for her phone. You intercept her right arm with your cuffs and place her under arrest.".

Section 3 - Testing

test me with "unlock door with key / e / close door / x screen 1 / switch on cctv / z / z / z / z / z / x screen 1 / x screen 2 / x screen 3 / z / z / z / z / z / x 1 / x 2 / x 3".