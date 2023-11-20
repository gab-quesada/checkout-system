## Checkout System

## Welcome! 👋

Thanks for checking out this back-end coding challenge.

## The challenge

Your challenge is to implement a checkout system for a local farmer's market.

We sell the following four products at the local farmer’s market every week.

```
+--------------|--------------|---------+
| Product Code |     Name     |  Price  |
+--------------|--------------|---------+
|     CH1      |   Chai       |  $3.11  |
|     AP1      |   Apples     |  $6.00  |
|     CF1      |   Coffee     | $11.23  |
|     MK1      |   Milk       |  $4.75  |
+--------------|--------------|---------+
```

This week, we’re celebrating our one year anniversary and would like to offer the following specials. To do so, we’ll need to update our checkout system to apply the following rules.

BOGO -- Buy-One-Get-One-Free Special on Coffee. (Unlimited)
APPL -- If you buy 3 or more bags of Apples, the price drops to $4.50.
CHMK -- Purchase a box of Chai and get milk free. (Limit 1)

Your users should be able to:

- Scan items
- At any time, we should be able to print out the current register to see what the state of the basket is.
- Checkout the basket to see the final price, this should include the price and the applied discount or special.

Using Ruby, implement a checkout system that allows us to fulfill the above requirements.

## Runnning the project 

To test the project I created a few TDD test in rspec

You simply have to clone the project. Then to install the dependencies run 
- `bundle install`

Then run rspec and see the tests pass

- `rspec`
