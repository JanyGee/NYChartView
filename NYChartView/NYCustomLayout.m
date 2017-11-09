//
//  NYCustomLayout.m
//  TestChart
//
//  Created by Jany on 2017/11/8.
//  Copyright © 2017年 MillionConcept. All rights reserved.
//

#import "NYCustomLayout.h"

@implementation NYCustomLayout
- (instancetype)init
{
    self = [super init];
    if (self) {
       [self prepareLayout];
    }
    return self;
}

- (void)prepareLayout
{
    [super prepareLayout];
    self.minimumLineSpacing = 0.f;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.sectionInset = UIEdgeInsetsMake(0.f, self.collectionView.bounds.size.width / 2.f - self.itemSize.width / 2.f, 0.f, self.collectionView.bounds.size.width / 2.f - self.itemSize.width / 2.f);//每一个item都能偏移到中间
}
@end
