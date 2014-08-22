devsign-trackingAndCharacterSpacing
===================================

A look at getting typography tracking built out in iOS.

This article was originally posted [here](http://www.devsign.co/notes/tracking-and-character-spacing).

In tools like Photoshop and InDesign, "tracking" is the term that describes the relative amount of spacing between characters in a string of text.

A wonderful bit about tracking: pick a value, and your text will have that same visual style, regardless of the size. It scales:
![Tracking](http://clrk.it/image/3j1e2B0m053N/Tracking.png)

Unfortunately, tracking doesn't exist in iOS. What we *do* have available is character spacing:

![Character Spacing](http://clrk.it/image/2X383o333S3s/character-spacing.png)

See how character spacing doesn't stay the same when you change type size? Sketch is a great help with this - when you change a label's text size, the character spacing scales - but this isn't necessarily helpful to your development team: if there are 8 different type sizes in your app, then they've got 8 character spacing values to worry about, rather than just a single tracking value.

So: we need a way to represent tracking in code, and when we came up against this problem, I couldn't find a single implementation of this on the web. So: we made one up.

I made lots of PSD files and Sketch files, comping up different tracking values and character spacing values, and doing pixel comparisons to figure out what lined up. Once I found a match between tracking, character spacing, and font size, I put it in the spreadsheet. I came up with some theories as to how the two were related - and after a lot of digging, I found that it was actually a *very* simple relationship:

```
characterSpacing = fontSize * tracking / 1000
```

At first, I thought, "1000? Really? That's the magic number?" - but then this hypothesis totally worked on other yet-untested scenarios, so that's where we landed.

Here's how you can use this in practice:

If you want an easy way to convert between character spacing and tracking, I have a handy Soulver document here. 

If you're a dev, and you want a nice category method that'll return a properly-tracked attributed string, you can find my code over on GitHub.
```objectivec
+ (instancetype) dvs_attributedStringWithString:(NSString *)string
                                       tracking:(CGFloat)tracking
                                           font:(UIFont *)font
{
    CGFloat fontSize = font.pointSize;
    CGFloat characterSpacing = tracking * fontSize / 1000;
    
    NSDictionary *attributes = @{NSFontAttributeName: font,
                                 NSKernAttributeName: [NSNumber numberWithFloat:characterSpacing]};
    
    return [[NSAttributedString alloc] initWithString:string attributes:attributes];
}
```

Here's how you'd use it in practice:
```objectivec
    self.label.attributedText = [NSAttributedString dvs_attributedStringWithString:@"DEVSIGN"
                                                                          tracking:sender.value
                                                                              font:[UIFont systemFontOfSize:17.f]];
```

In the included sample app, you can see it in action:
![Sample App](http://clrk.it/image/302q1m0k2y2x/tracking.gif)
