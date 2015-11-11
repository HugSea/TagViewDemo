//
//  MyFlowLayout.m
//  TagCollectionViewDemo
//
//  Created by 张庆杰 on 15/10/9.
//  Copyright © 2015年 QJ. All rights reserved.
//

#import "MyFlowLayout.h"

const NSInteger kMaxCellSpacing = 10 - 7.5;

@implementation MyFlowLayout

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray* attributesToReturn = [super layoutAttributesForElementsInRect:rect];
    for (UICollectionViewLayoutAttributes* attributes in attributesToReturn) {
        if (nil == attributes.representedElementKind) {
            NSIndexPath* indexPath = attributes.indexPath;
            attributes.frame = [self layoutAttributesForItemAtIndexPath:indexPath].frame;
        }
    }
    return attributesToReturn;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes* currentItemAttributes =
    [super layoutAttributesForItemAtIndexPath:indexPath];
    
    UIEdgeInsets sectionInset = [(UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout sectionInset];
    
    if (indexPath.item == 0) { // first item of section
        CGRect frame = currentItemAttributes.frame;
        frame.origin.x = sectionInset.left + 20; // first item of the section should always be left aligned
        frame.origin.y = sectionInset.top + 20 - 7.5;
        currentItemAttributes.frame = frame;
        
        return currentItemAttributes;
    }
    
    NSIndexPath* previousIndexPath = [NSIndexPath indexPathForItem:indexPath.item-1 inSection:indexPath.section];
    CGRect previousFrame = [self layoutAttributesForItemAtIndexPath:previousIndexPath].frame;
    CGFloat previousFrameRightPoint = previousFrame.origin.x + previousFrame.size.width + kMaxCellSpacing;
    
    CGRect currentFrame = currentItemAttributes.frame;
    CGRect strecthedCurrentFrame = CGRectMake(0, currentFrame.origin.y + 20 - 7.5,self.collectionView.frame.size.width, currentFrame.size.height);
    
    if (!CGRectIntersectsRect(previousFrame, strecthedCurrentFrame)) { // if current item is the first item on the line
        // the approach here is to take the current frame, left align it to the edge of the view
        // then stretch it the width of the collection view, if it intersects with the previous frame then that means it
        // is on the same line, otherwise it is on it's own new line
        CGRect frame = currentItemAttributes.frame;
        frame.origin.x = sectionInset.left + 20; // first item on the line should always be left aligned
        frame.origin.y = CGRectGetMaxY(previousFrame) + 10;
        currentItemAttributes.frame = frame;
        return currentItemAttributes;
    }
    
    CGRect frame = currentItemAttributes.frame;
    frame.origin.x = previousFrameRightPoint;
    frame.origin.y += 20 - 7.5;
    currentItemAttributes.frame = frame;
    return currentItemAttributes;
}

@end
