//
//  ZUnzip.h
//  ZUnzip
//
//  Created by dev on 7/20/16.
//  Copyright © 2016 Kaz Yoshikawa. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for ZUnzip.
FOUNDATION_EXPORT double ZUnzipVersionNumber;

//! Project version string for ZUnzip.
FOUNDATION_EXPORT const unsigned char ZUnzipVersionString[];

//
//	ZUnzip
//

@interface ZUnzip : NSObject

@property (readonly) NSDictionary *fileToIndexDictionary;
@property (readonly) NSArray *files;

- (id)initWithZipData:(NSData *)data;
- (id)initWithPath:(NSString *)path;
- (NSData *)dataForFile:(NSString *)file;

@end


