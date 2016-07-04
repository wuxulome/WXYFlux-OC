//
//  WXYFluxAction.h
//  FluxDemo
//
//  Created by wuxu on 16/7/1.
//  Copyright © 2016年 wuxu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WXYFluxAction <NSObject>

/*!
 *  @brief Action的标识
 */
- (nullable NSString *)identifier;

@end

NS_ASSUME_NONNULL_END
