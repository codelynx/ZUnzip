//
//  ZUnzip.m
//  ZUnzip
//
//  Created by Kaz Yoshikawa on 14/2/10.
//  Copyright (c) 2014 Electricwoods LLC. All rights reserved.
//

#import <sys/mman.h>
//#import <sys/mbuf.h>
#import <stdio.h>
#import <stdlib.h>
#import "ZUnzip.h"
#import "zip.h"
#import "fmemopen.h"

//
//	external functions
//

extern struct zip *_zip_open(const char *fn, FILE *fp, unsigned int flags, int *zep);


//
//	ZUnzip ()
//

@interface ZUnzip ()
{
	struct zip *_zip;
	FILE *_file;
	NSDictionary *_fileToIndexDictionary;
}
@end


//
//	ZUnzip
//

@implementation ZUnzip

- (id)initWithPath:(NSString *)path
{

	if (self = [super init]) {
		int err = 0;
		_zip = zip_open([path fileSystemRepresentation], 0, &err);
	}
	return self;
}

- (id)initWithZipData:(NSData *)data
{
	if (self = [super init]) {
		int error;
		_file = fmemopen(data.bytes, data.length, "rb");
		_zip = _zip_open(NULL, _file, 0, &error);
	}
	return self;
}

- (NSDictionary *)fileToIndexDictionary
{
	if (!_fileToIndexDictionary) {
		NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
		zip_int64_t count = zip_get_num_entries(_zip, 0);
		for (zip_int64_t index = 0 ; index < count ; index++) {
			struct zip_stat stat;
			zip_stat_init(&stat);
			zip_stat_index(_zip, index, 0, &stat);
			NSString *file = [NSString stringWithUTF8String:stat.name];
			[dictionary setObject:[NSNumber numberWithInteger:(NSInteger)index] forKey:file];
		}
		_fileToIndexDictionary = dictionary;
	}
	return _fileToIndexDictionary;
}


- (NSArray *)files
{
	return self.fileToIndexDictionary.allKeys;
}

- (NSData *)dataForFile:(NSString *)file
{
	NSData *data = nil;
	if (_zip) {
		NSNumber *indexValue = [self.fileToIndexDictionary objectForKey:file];
		if (indexValue) {
			zip_int64_t index = [indexValue integerValue];
			struct zip_stat stat;
			zip_stat_init(&stat);
			zip_stat_index(_zip, index, 0, &stat);
			void *buffer = malloc((size_t)stat.size);
			struct zip_file *zipFile = zip_fopen_index(_zip, index, 0);
			zip_fread(zipFile, buffer, stat.size);
			data = [NSData dataWithBytesNoCopy:buffer length:(NSUInteger)stat.size freeWhenDone:YES];
			zip_fclose(zipFile);
		}
	}
	return data;
}

- (void)dealloc
{
	if (_zip) {
		zip_close(_zip), _zip = NULL;
	}
	if (_file) {
		fclose(_file), _file = NULL;
	}
}


@end
