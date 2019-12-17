---
layout: post
title:  "Guessing all dice"
date:   2019-12-01 12:00:00 -0800
categories: puzzles
comments: true
---
Welcome to the blog! I've yet to figure out most things here, but preliminarily I hope to use it to compile three categories of things I delight in occasionally coming across: puzzles/brainteasers, little snippets of math, and (aspirationally) creative writing. I'll expound on these in a forthcoming ["About" section]({% link about.markdown %}), but for now, enjoy one of my all-time favorite probability puzzles!

### Puzzle: Guessing all dice
\\(100\\) statisticians will play a game in which each simultaneously rolls a fair \\(6\\)-sided dice, but each sees only the result of the \\(99\\) other dice rolls (and not their own). Simultaneously and without further communication, each guesses their own roll, and the group wins iff every guess is correct. What strategy maximizes the group's chance of success (and what is that chance)?

{% capture hintheader %}A hint{% endcapture %}
{% capture hint %}
In the 2-statistician case, randomly guessing yields a \\(\tfrac{1}{36}\\) chance of success, as each player's individual chances are independent. Is there a way they could more closely correlate their chances, so that when one is right the other is more likely to also be right?
{% endcapture %}

{% capture solutionheader %}A solution{% endcapture %}
{% capture solution %}
Astonishingly, regardless of how many statisticians there are, the group can win with probability \\(\tfrac{1}{6}\\)!

A simple strategy that does this: all of the statisticians agree to guess a number for their own dice which results in a sum congruent to \\(0\\) modulo \\(6\\), an event which occurs with probability \\(\tfrac{1}{6}\\). When one is right/wrong, they all are!

We can see that this probability is maximal since the group's success entails any individual success, so its probability is upper-bounded by \\(\tfrac{1}{6}\\).
{% endcapture %}

{% include puzzlehint.html %}

{% include puzzlesolution.html %}
