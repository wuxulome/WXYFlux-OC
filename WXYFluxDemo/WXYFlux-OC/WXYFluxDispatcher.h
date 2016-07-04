//
//  WXYFluxDispatcher.h
//  FluxDemo
//
//  Created by wuxu on 16/7/1.
//  Copyright © 2016年 wuxu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WXYFluxAction;
@protocol WXYFluxStore;

@interface WXYFluxDispatcher : NSObject

/*!
 *  @brief 向Dispatcher注册Store，用于接收Action
 *
 *  @param store 数据存储和处理类
 */
+ (void)registerStore:(id<WXYFluxStore>)store;

/*!
 *  @brief 向Dispatcher注销Store
 *
 *  @param store 数据存储和处理类
 */
+ (void)unregisterStore:(id<WXYFluxStore>)store;

/*!
 *  @brief 向Dispatcher发送一个Action
 *
 *  @param action 信息流
 */
+ (void)dispatchAction:(id<WXYFluxAction>)action;

@end

NS_ASSUME_NONNULL_END
