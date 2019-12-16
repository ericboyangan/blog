---
layout: post
title:  "Randomly boarding an airplane"
date:   2019-12-16 12:44:00 -0800
categories: puzzles
---
Another puzzle today! This one is particularly special to me: I remember hearing it as a little kid on [CarTalk](https://www.cartalk.com/) with my dad and spending an entire afternoon together trying to figure it out.

### Puzzle: Randomly boarding an airplane
A full flight with \\(100\\) numbered and ticketed seats is supposed to board in order. However, passenger #\\(1\\) disregards the number on their ticket and sits in a (uniformly) random seat. Starting with the next passenger (who holds ticket #\\(2\\)), each other passenger goes to their allocated seat, and if it is unoccupied, sits down; otherwise, they also choose from among the available seats uniformly at random.

You are ticketed #\\(100\\). What is the probability that you sit in your own seat?

{% capture solutionheader %}A solution{% endcapture %}
{% capture solution %}
It's \\(\tfrac{1}{2}\\)! You can prove this via induction (that's how my dad taught me how to do it), or via the nifty realization that you will either sit in your own seat, or seat #\\(1\\) - no other seats are possible - and the boarding process is entirely symmetric with respect to these two seats.
{% endcapture %}
{% include puzzlesolution.html %}
