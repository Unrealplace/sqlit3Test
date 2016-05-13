//
//  DataManager.h
//  sqlit3Test
//
//  Created by LiYang on 16/5/13.
//  Copyright © 2016年 LiYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DataManager : NSObject

+(instancetype)shared;
//打开数据库
-(void)openDataBase;
//关闭数据库
-(void)closeDataBase;
//创建数据表
-(void)createTable;
//插入数据
-(void)insertDataWith:(NSString*)name andInt:(int) age;
//更新数据
-(void)updateDataWith:(NSString*)name andInt:(int) age;
//删除数据
-(void)deleteDataWith:(NSString*)name;
//查询数据
-(void)select;

@end
