//
//  DataManager.m
//  sqlit3Test
//
//  Created by LiYang on 16/5/13.
//  Copyright © 2016年 LiYang. All rights reserved.
//

#import "DataManager.h"

@interface DataManager (){

    sqlite3 * db;
    
}

@end
@implementation DataManager

+(instancetype)shared{

    static DataManager * manager = nil;
    
    @synchronized(self) {
        if (!manager) {
            manager = [[DataManager alloc]init];
        }
    }
    return manager;
    
}
//打开数据库
-(void)openDataBase{

    NSString * documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) firstObject];
    //sqlite 路径
    NSString *sqlitePath = [documentPath stringByAppendingString:@"db.sqlite"];
    //打开数据库
  int back =  sqlite3_open(sqlitePath.UTF8String, &db);
    
    if (back == SQLITE_OK) {
        
        NSLog(@"open success");
    }else{
    
        NSLog(@"open falied");
    }
    
}
//关闭数据库
-(void)closeDataBase{

    int result = sqlite3_close(db);
    
    if (result == SQLITE_OK) {
        NSLog(@"close success");
    }else{
    
        NSLog(@"close falied");
    }
}
//创建数据表
-(void)createTable{

    NSString * sqlString = @"create table person(name text,age integer)";
    //
    char * error  = nil;
    //执行语句
    sqlite3_exec(db, sqlString.UTF8String, nil, nil, &error);
    
    if (error == nil) {
        
        NSLog(@"create success");
        
    }else{
        NSLog(@"create falied");
    }
    
}
//插入数据
-(void)insertDataWith:(NSString*)name andInt:(int) age{

 //
    NSString * sqlString = [NSString stringWithFormat:@"insert into person('name','age') values('%@','%d')",name,age];
   // NSString * sqlString = @"insert into person('name','age')values('liyang','24')";
    
    //执行语句
    char * error = nil;
    sqlite3_exec(db, sqlString.UTF8String, nil, nil, &error);
    
    if (error == nil) {
        NSLog(@"insert success");
    }else{
    
        NSLog(@"insert falied %s",error);
    }

}
 //更新数据
-(void)updateDataWith:(NSString*)name andInt:(int) age{

    NSString * sqlString = [NSString stringWithFormat:@"update person set name = '%@' where age = '%d'",name,age];
     //执行语句
    char * error = nil;
    sqlite3_exec(db, sqlString.UTF8String, nil, nil, &error);
    if (error == nil) {
        NSLog(@"update success");
    }else{
        
        NSLog(@"update falied");
    }
}
 //删除数据
-(void)deleteDataWith:(NSString*)name{

    NSString * sqlString = [NSString stringWithFormat:@"delete from person where name = '%@'",name];
    //执行语句
    char * error = nil;
    sqlite3_exec(db, sqlString.UTF8String, nil, nil, &error);
    if (error == nil) {
        NSLog(@"delete success");
    }else{
        
        NSLog(@"delete falied");
    }

}
-(void)select{

    NSString * sqlString = @"select * from person";
    
    //准备sql语句
    sqlite3_stmt * stmt = nil;
    sqlite3_prepare(db, sqlString.UTF8String, -1, &stmt, nil);
    //单步执行语句
    while (sqlite3_step(stmt) == SQLITE_ROW) {
        const unsigned char * name = sqlite3_column_text(stmt, 0);
        NSString * nameStr = [NSString stringWithUTF8String:(const char*)name];
        int age = sqlite3_column_int(stmt, 1);
        
        NSLog(@"name:::%@ and age:::%d",nameStr,age);
        
    }
    //释放
    sqlite3_finalize(stmt);
    
}
@end
