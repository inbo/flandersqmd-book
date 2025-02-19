# Equations

## Inline equations

Inline equation fit within the paragraph. 
E.g. $P(y < Y|\theta) = \alpha$. 
This works OK with short equations.
More complex, taller equation will altered to minimize their height, e.g. $\bar{X} = \sum_{i = 1}^NX_i$. 
$i = 1$ and $N$ are placed beside $\sum$ instead of above it. 
This doesn't work with even taller equations like breaks, e.g. $\frac{X}{Y}$. 
In this case the font size is decreased.
Complex equations like $\frac{\sum_{i = 1}^NX_i}{\frac{\sum_{j = 1}^NY_j}{N}}$ require a larger interline distance.
A stand alone equations is a better solution for complex equations.

## Stand alone equations

$$P(y < Y|\theta) = \alpha$$

$$\bar{X} = \sum_{i = 1}^NX_i$$

$$\frac{X}{Y}$$

$$\frac{\sum_{i = 1}^NX_i}{\frac{\sum_{j = 1}^NY_i}{N}}$$

## Numbered equations {#sec-numbered}

$$\bar{X} = \sum_{i = 1}^NX_i$${#eq-som}

$$\frac{X}{Y}$${#eq-frac}

$$\frac{\sum_{i = 1}^NX_i}{\frac{\sum_{j = 1}^NY_j}{N}}$${#eq-avg}
