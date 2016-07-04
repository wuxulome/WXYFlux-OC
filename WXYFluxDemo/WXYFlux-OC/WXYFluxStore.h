//
//  WXYFluxStore.h
//  FluxDemo
//
//  Created by wuxu on 16/7/1.
//  Copyright © 2016年 wuxu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WXYFluxAction;

@protocol WXYFluxStore <NSObject>

/*!
 *  @brief Store的标识
 */
- (nullable NSString *)identifier;

/*!
 *  @brief 处理一个action的入口
 *
 *  @param action 信息流
 */
- (void)handleAction:(id<WXYFluxAction>)action;

/*!
 *  @brief 处理多个action的入口
 *
 *  @param actions 信息流
 */
- (void)handleActions:(NSArray<id<WXYFluxAction>> *)actions;

@end

NS_ASSUME_NONNULL_END
