//
//  NYScrollChartView.m
//  TestChart
//
//  Created by Jany on 2017/11/8.
//  Copyright © 2017年 MillionConcept. All rights reserved.
//

#import "NYScrollChartView.h"
#import "NYCustomLayout.h"
#import "NYCollectionViewCell.h"

@interface NYScrollChartView ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSArray *_stepDataArr;
    NSArray *_timeDataArr;
    NSInteger _maxValue;
}
@property (nonatomic, strong)UICollectionView *myCollectionView;
@property (nonatomic, strong)NYCollectionViewCell *changeCell;
@property (nonatomic, strong)UIView *bottomView;
@end

@implementation NYScrollChartView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor darkGrayColor]];
        [self addSubview:self.bottomView];
        [self addSubview:self.myCollectionView];
        
    }
    return self;
}

- (void)setDataArr:(NSArray *)dataArr
{
    if (_changeCell) {
        
        _changeCell.barView.color = [UIColor lightGrayColor];
        _changeCell.bottomLabel.textColor = [UIColor lightGrayColor];
        _changeCell = nil;
    }
    _dataArr = dataArr;
    _stepDataArr = [NSArray arrayWithArray:_dataArr[0]];
    _timeDataArr = [NSArray arrayWithArray:_dataArr[1]];
    _maxValue = [[_stepDataArr valueForKeyPath:@"@max.intValue"] intValue];
    
    [_myCollectionView reloadData];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:_stepDataArr.count - 1 inSection:0];
    [_myCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    
}
#pragma mark==================================setUp UI==================================
- (UIView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0.f, self.frame.size.height - 25.f, self.frame.size.width, 25.f)];
        [_bottomView setBackgroundColor:[UIColor whiteColor]];
    }
    return _bottomView;
}
- (UICollectionView *)myCollectionView
{
    if (!_myCollectionView) {
        _myCollectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:[[NYCustomLayout alloc]init]];
        [_myCollectionView registerClass:[NYCollectionViewCell class] forCellWithReuseIdentifier:@"myCell"];
        [_myCollectionView setBackgroundColor:[UIColor clearColor]];
        [_myCollectionView setDelegate:self];
        [_myCollectionView setDataSource:self];
        [_myCollectionView setShowsHorizontalScrollIndicator:NO];
    }
    
    return _myCollectionView;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _stepDataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"myCell";
    
    NYCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    cell.barView.value = [_stepDataArr[indexPath.row] intValue];
    cell.bottomLabel.text = _timeDataArr[indexPath.row];
    cell.barView.maxValue = _maxValue;
    
    if (indexPath.row == _stepDataArr.count -1) {
        cell.bottomLabel.textColor = [UIColor orangeColor];
        cell.barView.color = [UIColor orangeColor];
        _changeCell = cell;
    }else{
        cell.bottomLabel.textColor = [UIColor lightGrayColor];
        cell.barView.color = [UIColor lightGrayColor];
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(60.f, collectionView.bounds.size.height);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //滚动到中间
    [_myCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    
    [_changeCell.barView changeBarColor:[UIColor lightGrayColor]];
    _changeCell.bottomLabel.textColor = [UIColor lightGrayColor];
    
    NYCollectionViewCell *cell = (NYCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell.barView changeBarColor:[UIColor orangeColor]];
    cell.bottomLabel.textColor = [UIColor orangeColor];
    _changeCell = cell;
    
    if (_delegate && [_delegate respondsToSelector:@selector(selectedIndex:)]) {
        [_delegate selectedIndex:indexPath.row];
    }
}

#pragma mark==================================ScrollViewDelegate==================================
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    BOOL scrollToScrollStop = !scrollView.tracking && !scrollView.dragging && !scrollView.decelerating;
    if (scrollToScrollStop) {
        [self scrollViewDidEndScroll:scrollView];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    BOOL dragToDragStop = scrollView.tracking && !scrollView.dragging && !scrollView.decelerating;
    if (dragToDragStop) {
        [self scrollViewDidEndScroll:scrollView];
    }
}

- (void)scrollViewDidEndScroll:(UIScrollView *)scrollView {
    
    CGFloat offsetX = scrollView.contentOffset.x;
    CGFloat temp = offsetX / (self.frame.size.width/6);
    NSInteger tempNum = [self getRoundValueWithFloat:temp roundingMode:NSRoundPlain scale:0];
    
    if (tempNum > _stepDataArr.count - 1) {
        
        tempNum = _stepDataArr.count - 1;
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:tempNum inSection:0];
        [_myCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        [_changeCell.barView changeBarColor:[UIColor lightGrayColor]];
        _changeCell.bottomLabel.textColor = [UIColor lightGrayColor];
        
        NYCollectionViewCell *cell = (NYCollectionViewCell *)[_myCollectionView cellForItemAtIndexPath:indexPath];
        [cell.barView changeBarColor:[UIColor orangeColor]];
        cell.bottomLabel.textColor = [UIColor orangeColor];
        _changeCell = cell;
        
    }else{
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:tempNum inSection:0];
        [_myCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        [_changeCell.barView changeBarColor:[UIColor lightGrayColor]];
        _changeCell.bottomLabel.textColor = [UIColor lightGrayColor];
        
        NYCollectionViewCell *cell = (NYCollectionViewCell *)[_myCollectionView cellForItemAtIndexPath:indexPath];
        [cell.barView changeBarColor:[UIColor orangeColor]];
        cell.bottomLabel.textColor = [UIColor orangeColor];
        _changeCell = cell;
    }
    
    if (_delegate && [_delegate respondsToSelector:@selector(selectedIndex:)]) {
        [_delegate selectedIndex:tempNum];
    }
}

#pragma mark==================================停止滑动相关算法==================================
- (CGFloat)getRoundValueWithFloat:(CGFloat)value roundingMode:(NSRoundingMode)roundingMode scale:(NSInteger)scale
{
    NSDecimalNumberHandler * handler = [[NSDecimalNumberHandler alloc]initWithRoundingMode:roundingMode scale:scale raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSDecimalNumber * outNum = [[[NSDecimalNumber alloc]initWithFloat:value] decimalNumberByRoundingAccordingToBehavior:handler];
    return [outNum floatValue];
}

- (CGPoint)nearestContentOffsetForOffset:(CGPoint)offset
{
    CGFloat pageSize = self.frame.size.width/7;
    NSInteger page = round(offset.y / pageSize);
    CGFloat targetY = pageSize * page;
    return CGPointMake(offset.x,targetY);
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    CGPoint point = [self nearestContentOffsetForOffset:*targetContentOffset];
    targetContentOffset->x = point.x;
    targetContentOffset->y = point.y;
}

@end

