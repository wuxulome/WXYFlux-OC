//
//  WXYFluxDispatcher.h
//  FluxDemo
//
//  Created by wuxu on 16/7/1.
//  Copyright © 2016年 wuxu. All rights reserved.
//

#import "WXYFluxDispatcher.h"
#import "WXYFluxStore.h"
#import "WXYFluxAction.h"

@interface WXYFluxDispatcher ()
@property (nonatomic, strong) NSHashTable *storeHashTable;
@end

@implementation WXYFluxDispatcher

#pragma mark - init

+ (WXYFluxDispatcher *)dispatcher
{
    static WXYFluxDispatcher *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [WXYFluxDispatcher new];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _storeHashTable = [NSHashTable hashTableWithOptions:NSHashTableWeakMemory];
    }
    return self;
}

#pragma mark - public

+ (void)registerStore:(id<WXYFluxStore>)store
{
    NSParameterAssert(store);
    
    if (!store) {
        NSLog(@"register store can not be nil");
        return;
    }
    
    if (![[self dispatcher].storeHashTable containsObject:store]) {
        [[self dispatcher].storeHashTable addObject:store];
    }
}

+ (void)unregisterStore:(id<WXYFluxStore>)store
{
    NSParameterAssert(store);
    
    if (!store) {
        return;
    }
    
    if ([[self dispatcher].storeHashTable containsObject:store]) {
        [[self dispatcher].storeHashTable removeObject:store];
    }
}

+ (void)dispatchAction:(id<WXYFluxAction>)action
{
    NSParameterAssert(action);
    
    if (!action) {
        return;
    }
    
    NSEnumerator *enumeratorKey = [[self dispatcher].storeHashTable objectEnumerator];
    for (id<WXYFluxStore> store in enumeratorKey) {
        if ([self isStore:store shouldHandleAction:action]) {
            if ([store respondsToSelector:@selector(handleAction:)]) {
                [store handleAction:action];
            }
        }
    }
}

#pragma mark - private

/**
 *  检测identifier是否匹配:
 *  store有   +  action有    ->  isEqual?
 *  store有   +  action没有  ->   YES；
 *  store没有 +  action有    ->   NO；
 *  store没有 +  action没有  ->   YES；
 */
+ (BOOL)isStore:(id<WXYFluxStore>)store shouldHandleAction:(id<WXYFluxAction>)action
{
    if ([store identifier].length > 0 && [action identifier].length > 0) {
        return [[store identifier] isEqualToString:[action identifier]];
    } else if ([store identifier].length > 0) {
        return YES;
    } else if ([action identifier].length > 0) {
        return NO;
    } else {
        return YES;
    }
}

@end
