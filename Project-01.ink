/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/

VAR time = -1 // 0 Morning, 1 Noon, 2 Night 
VAR cabbage = 0
VAR carrot = 0
VAR golden_carrot = 0
-> Sunny_field


=== Sunny_field ===


You are a rabbit. It is sunny outside and you are sitting in an open field under a tree. Not even 5 min later, you realize that you are hungry and need to find some food. You decide to adventure forward up the hill. 
It is { advance_time() }


+[Explore foward] -> explore


=== explore ===
You make it to the top of the hill and you are surprised by how much you can see up here! You notice straight ahead down the hill that there is a fenced gated area that seems to have different gardens. You start to hop down the hill but realize that you feel too tired to continue further from hopping up the hill. You go back to the top of the hill and decide that you can wait till you feel rested to eat. 

+[Take a nap] -> nap

=== nap ===
You lay down in the grass at the top of the hill for some time. 

+[Some time later] -> time_passed

=== time_passed ===
You wake up feeling not tired anymore and ready to see what the fenced in area has to offer. You hop down the hill and make it to ground level.
+[ Continue on] -> go



=== go ===
In front of you is the gate and it has two entrances, one from the west and one from the east. The gate doors both have silver locks on them.{not key_pickup: There is something shiny in the grass.} 

+[look in the grass] -> key_pickup
+[Go to the east gate] -> east_gate
+[Go to the west gate] -> west_gate


=== east_gate ===
You are at the east gate.
* {key_pickup} [Open the lock with the key] -> east_gate_open
+[ Go back ] -> go
-> END

=== west_gate ===
You are at the west gate. 
+{key_pickup} [Open the lock with the key] ->Lock_wont_open
+[ GO back] ->go
-> END

=== Lock_wont_open ===
You try to open the lock but it doesn't seem to work.
*[Go back] ->go
-> END


=== key_pickup ===
You pick up the shiny object and it's a key! This can pontentially open a lock on the gate!
* [Go back] -> go
+ -> END

=== east_gate_open ===
 The key works and you go inside! You stop to look at the view and notice that this gated area has a ton of places to explore! (You are level 1)
 It is { advance_time() }
*{ time == 1 } [go forward] -> f
 
 === f ===
You hop forward and reveal a huge stash of freshly grown carrots in the ground ready to be eaten! You munch on the carrots and start to feel much better. You notice in the stash that there is a golden carrot, but decide to leave it not knowing if it was edible or not. 
+[Continue on] -> even_more
 === even_more ===
 You hop over to a basket next to the stash that seems to be unoccupied. As you try to open it, a bird comes out of no where and flaps it's wings at you. The bird accuses you of stealing the things inside the basket, but you tell him that you didn't know that this was his basket.{not carrot_pickup:The bird requests that you give him something to trade if you want the things that are in the basket.}
 
 *{carrot_pickup}[Give carrot] -> give
 
 -> END
 *[Pick up a carrot from the stash] -> carrot_pickup

=== carrot_pickup ===
You have 1 carrot.
* [Go Back] -> even_more
-> END

=== give ===
You offer the bird a carrot, which he hesitates for a second because he has never seen one before. He takes the offer and flys off. You now open the basket to reveal what's inside. 
+[Open basket] -> open_basket

=== open_basket ===
You open the basket and there are delicious red apples inside! You eat the apples. 

+[Eat apples] -> eat_apples

=== eat_apples ===
You finish eating the apples and decide to rest for the day. 
It is { advance_time() }
*{ time == 2 }[ The next day ]->next_day

=== next_day ===
You wake up energized and ready to continue with exploring. You look around the area.
It is { advance_time() }
+[look around] ->look

=== look ===
You look around the area some more and figured out that there are only two other places to go to. Where do you choose?
*[Left] -> left
* [Right] -> right

=== left ===
You go left and see a huge flower garden with the center of it having a flower bush with colorful flowers that have bloomed. The only problem is that there are bumble bees. They don't look like they want their flowers to be messed with.
+[Go back] -> look
=== right ===

You go right and see a huge patch of romaine lettuce in a garden ready to be munched on! You eat the lettuce and notice that near by is a cabbage patch.

+[ Go to cabbage patch] -> cabbages

=== cabbages ===
{ not cabbage_pickup: When you arrive, the cabbages are in a patch sitting there.} Beside you is a deer and she is also interested in the cabbages. She is willing to share them with you if you are. 

+[Share with the deer] -> share
+[Don't share with the deer] -> no_share



=== share ===
You decide to be kind and share with the deer which makes her very happy!She then gives you some berries she found for you to try, as a thank you for sharing with her. :)

* {cabbage_pickup} [Pick up the cabbage] -> cabbage_pickup
+[Pick up cabbage] ->cabbage1

=== no_share ===
Due to your actions of not sharing, the deer gets upset and stomps on most of the cabbages and takes some for herself to another area. Now you are stuck nibbling on destroyed dirty cabbages.

* {cabbage_pickup} [Pick up the cabbage] -> cabbage_pickup
+[Pick up cabbage] ->cabbage1


=== cabbage1 ===
You try to pick up the cabbage but it is too heavy. You remeber seeing a golden carrot, maybe this could help you?
*[Go back to cabbage patch] -> cabbage_patch


=== cabbage_patch ===
+[Go back to basket] -> basket_spot


=== basket_spot ===
+[Go back to carrot stash] ->Carrot_stash
-> END

=== Carrot_stash ===
*{golden_carrot_pickup} [Pick up the golden carrot] -> golden_carrot_pickup
 +[Pick up golden carrot] -> golden_carrot_pickup





=== golden_carrot_pickup ===
~ golden_carrot = golden_carrot +1
You have the golden carrot and you decide to eat it. All of a sudden you feel much stronger. (You are level 2) 
*[Teleport to the cabbage patch and pick up the cabbage] -> cabbage_pickup

=== cabbage_pickup ===
~ cabbage = cabbage +1
You now have a cabbage. This could be used as a good distraction!
+[Go back ]-> cabbages2
-> END
=== cabbages2 ===
Now that you feel stronger you have an idea of how to see what the flower bush is hiding, but first you decide to take a little nap till nightime arrives. 
It is { advance_time() }
*{ time == 1 }[Night time] ->night_time

=== night_time ===
You wake up and it is dark outside. The deer is gone and there are stars in the sky. You use your powers to teleport to the flower garden.
It is { advance_time() }
*{ time == 2 }[Teleport to flower garden] -> teleport_to_flowers


=== teleport_to_flowers ===
You are back at the flowers. There are fewer bees around the bush then there were this morning and there are less flowers with petals showing. You slowly approach the flower bush and when the bees are not looking you use your strength from the golden carrot to prepare to throw the cabbage the other direction.

+[ Throw the cabbage] -> throw

=== throw ===
Throwing the cabbage was a success! The startled bees rush over to the direction the cabbage was thrown to. You hop as fast as you can to the bush and crawl in it. 

+[Inside the bush] -> inside_the_bush

=== inside_the_bush ===
Inside the bush you see wooden crate. 

+[Open the crate] -> open_crate

=== open_crate ===
You karate chop the crate and inside there are parsnips! You quickly eat up all the parnsips and crawl out the same way of the bush as you did before. You run to the edge of the gate which the bees notice you. In a panic, you quickly dig a hole to use. 

+[ Dig hole] -> dig

=== dig ===
You use the hole to make a entrance for your escape. You hop away from the gated area and found another shady tree far away from that place to sleep under for the night. You lay down under the tree and close your eyes to dream about what adventure you might go on next time!


-> END


=== function advance_time ===

    ~time = time +1
    
    {
            - time >2:
                ~ time = 0
    }
    
    {
        - time == 0:
            ~ return "Morning"
            
        - time == 1:
            ~return "Noon"
            
        -time == 2:
            ~return "Night"
            
        }
        
        
        
        ~ return time
        
        
        
        
        
        
        
        
