//
//  ViewController.m
//  BFCollectionViewDemo
//
//  Created by Readboy_BFAlex on 16/10/27.
//  Copyright © 2016年 BF. All rights reserved.
//

#import "ViewController.h"

#define kCollectionViewCellID @"CollectionViewCellID"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupCollectionView];
}

#pragma mark - custom methods

- (void)setupCollectionView {
    // 创建一个layout布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // 设置布局方向为垂直布局
//    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 设置每个item的大小为100*100
    layout.itemSize = CGSizeMake(100, 100);
    
    // 创建UICollectionView,并制定一个布局策略layout
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    // 设置代理
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    // 注册item类型（这里使用系统类型）
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kCollectionViewCellID];
    
    [self.view addSubview:collectionView];
}

#pragma mark - delegate && data source methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 32;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCollectionViewCellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    
    return cell;
}

@end
