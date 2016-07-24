# ZUnzip 


`ZUnzip` is a one of a few framework that extracts zipped files from zip data.  To instantiate `ZUnzip` object, it can be initialized with either file path to the zip file, or `NSData` that represents its zip file itself.

## To instantiate

```.objc
- (id)initWithPath:(NSString *)path
```

Instantiate `ZUnzip` object with file path to zip file, and return `nil` if it failed to create.

```.objc
- (id)initWithZipData:(NSData *)data
```

Instantiate `ZUnzip` object with zip binary data.  It returns `nil` if it failed to create.


## To list files

```.objc
- (NSArray *)files
```

`files` methods returns all the file name in archive.

## To extract a file

```.objc
- (NSData *)dataForFile:(NSString *)file
```

This methods extracts binary data with given file name. It returns `nil` if file name does not exists.


## How to use?

You may extract a file by name as following code (Swift).


```.swift
import ZUnzip

let data = ...
if let unzip = ZUnzip(data: data) {
	if let imageData = unzip.dataForFile("sample/sample.jpg") {
		if let image = UIImage(data: imageData) {
			// ...
		}
	}
}
```

## libzip

`ZUnzip` is based on `libzip` C based library.  `libzip` can be obtained by following URL.

https://nih.at/libzip/index.html


## License

`ZUnzip` 自身は MIT ライセンスとなっています。 `libzip` のライセンスは [こちら](https://nih.at/libzip/LICENSE.html) を参考にしてください。

https://nih.at/libzip/LICENSE.html




