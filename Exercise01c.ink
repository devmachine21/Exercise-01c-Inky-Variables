/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/

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
The light of your torch glints off of the thousands of coins in the room.
* [Bask in glory] -> END
+ [Go back] -> cave_mouth

// Dungeon Start

== down_dungeon_staircase ==
You make your way downstairs, its a dark, damp dungeon. Filled with cobwebs.
-> END