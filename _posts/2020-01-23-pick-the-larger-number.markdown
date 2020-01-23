---
layout: post
title:  "Pick the larger number!"
date:   2020-01-23 11:30:00 -0800
categories: puzzles
comments: true
---
Happy New Year! Today's puzzle is courtesy of Juanhe again. Hope you like it!

### Puzzle: Pick the larger number!
I (somewhow) write two real numbers on slips of paper which I present to you facedown. You choose one at random and, looking at the number, get the option to switch. The goal is to end up with the larger written number.

Does there exist a strategy that does better than 50%?

{% capture solutionheader %}A solution{% endcapture %}
{% capture solution %}

Indeed there is! Consider the following strategy: draw from a standard Gaussian (or *any* distribution with support over the reals), a random number \\(x\\). Then whatever number is revealed, simply compare it to \\(x\\)! If \\(x\\) is larger, switch.

How does it work? In the case where both written numbers are larger than \\(x\\), then the strategy does the right thing exactly when you have chosen the larger written number to begin with, which occurs with probability 50%. Similarly, the strategy wins with 50% probability when both written numbers are smaller than \\(x\\). However, in the event that \\(x\\) is between the two written numbers, the strategy is guaranteed to win!

Hence as long as your distribution for \\(x\\) contains positive support over every interval, there's nothing I can do to prevent you from winning with strictly better than 50% probability!
{% endcapture %}
{% include puzzlesolution.html %}
