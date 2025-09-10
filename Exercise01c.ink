/*
This was largely a "project" 

it was something and while it wasnt difficult, I just wanted to get it done lol. 

off to the unity game engine I go to leave this absolutely cursed programming language behind. Seriously, this language is a crime, and it makes me cry. 
*/



VAR strength = 0
VAR openedStrengthChese = false
VAR key = false
VAR northKeyOpen = false

-> cave_mouth

== cave_mouth ==
You are at the enterance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends in all cardinal directions.



+ [Take the north tunnel] -> north_tunnel
+ [Take the east tunnel] -> east_tunnel
+ [Take the south tunnel] -> south_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
+ {torch_pickup} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west tunnel.
+ [Go Back] -> cave_mouth
-> END

== north_tunnel ==
You are in the north tunnel. {not torch_pickup:It is very dark.}
+ {torch_pickup} [Use Torch] -> north_tunnel_lit
+ [Go back] -> cave_mouth


== north_tunnel_lit ==

{ northKeyOpen == true :
 -> north_tunnel_lit
}
You see a locked door which needs a key.
+ {key} [Use Key] -> north_tunnel_key 
+ [Go Back] -> north_tunnel

== north_tunnel_key ==
~ northKeyOpen = true
You use the key and find a dark and damp staircase going down.
+ [Go Downstairs] -> down_dungeon_staircase
+ [Go Back] -> north_tunnel

== south_tunnel ==
You are in the south tunnel. {not torch_pickup:It is very dark.}
+ {torch_pickup} [Use Torch] -> south_tunnel_key
[Go Back] -> north_tunnel

== south_tunnel_key ==
~ key = true

You find a skeleton key on the floor, it looks like it was dropped in a haste.
+ [Go Back] -> cave_mouth

=== torch_pickup ===
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of your torch glints off of the thousands of golden coins in the room.
* [Bask in glory] -> bask_in_glory
+ [Go back] -> cave_mouth

== bask_in_glory ==
You head inside the chambert and bathe in the mountain of golden coins in the room. You pack as many coins as you can in your bags, they are quite heavy. But the thought of endless wealth makes you push forward out of the cave.
-> END


// Dungeon Start

== down_dungeon_staircase ==
You make your way downstairs, its a dark, damp dungeon. Filled with cobwebs.
-> dungeon_middle

== dungeon_middle ==
You find yourself in a X shaped intersection, there are 4 ways you can travel
+ [Go North] -> dungeon_north
+ [Go East] -> dungeon_east
+ [Go South] -> dungeon_south
+ [Go West] -> dungeon_west
-> END

== dungeon_north ==
You head north and find a crack in the while, sun beams out of of the small cracks from behind the cracks, something is behind there.
+ [Break rubble] -> dungeon_north_rubble
+ [Go Back] -> dungeon_middle

== dungeon_north_rubble ==
{ 
- strength == 0:
 You try to break the wall, but are too weak to do so.
     + [Head Back] -> dungeon_north
 - else:
    You break through the wall with ease
    + [Head inside] -> dungeon_north_ending
 
}
-> DONE

== dungeon_north_ending ==
As you break through the wall, you are blinded for a moment, you feel the wind wrap around yourself. Once your eyes acclimate to the sun, you see a beautiful pool and waterfall. Looking up you see the sun, breaking through this one hole in the ground. The water is clear and reflective, it shines beautifully. You feel at peace here, and decide to rest.
-> END

== dungeon_east ==
You head east, and apart from a few skeletons, you find nothing interesting...
+ [Go Back] -> dungeon_middle
== dungeon_south ==
You head south
{strength == 0: and find a chest with a potion inside of it}
* [Drink The Potion] -> dungeon_south_potion
+ [Go Back] -> dungeon_middle

== dungeon_south_potion ==
You drink the potion, cautiously. You feel stronger than ever
~ strength = 1
-> dungeon_south

== dungeon_west ==
You head west, but there isnt anything to find here.
+ [Go Back] -> dungeon_middle








