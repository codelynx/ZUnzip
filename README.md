# ZUnzip 


`ZUnzip` is a one of a few framework that extracts zipped files from zip data.  To instantiate `ZUnzip` object, it can be initialized with either file path to the zip file, or `NSData` that represents its zip file itself.

## To instantiate

```.swift
	init(path: String) throws
```

Instantiate `ZUnzip` object with file path to zip file. It throws an error, when it failed to create.

```.swift
	let path = ...
	let unzip = try! ZUnzip(path: path)
```

```
	let data = ...
	let unzip = try!  ZUnzip(data: data)
```

Instantiate `ZUnzip` object with zip binary data.  It throws an error, when it failed to create.


## To list files

```.swift
	let files: [String] = unzip.files
```

`files` methods returns all the file name in archive.

## To extract a file

```.swift
	let data = unzip(forFile: "sample/sample.jpg") // optional
```

```.swift
	let data = unzip["sample/sample.jpg"] // optional
```

These methods extract binary data from given file name. And it returns `nil` if file name does not exists.


## How to use?

You may extract a file by name as following code (Swift).


```.swift
import ZUnzip

do {
    let data = ...
    let unzip = do ZUnzip(data: data) {
	if let imageData = unzip.data(forFile: "sample/sample.jpg") {
		if let image = UIImage(data: imageData) {
			// ...
		}
	}
}
catch { ... }
```

## Sub Components


ZUnzip is based on following two subcomponents.

### libzip

`libzip` is C based library to create and modify zip archives. 
https://nih.at/libzip/index.html


### fmemopen

`fmemopen` is forked from Jeff Verkoeyen's code.  It provides memory based file descriptor, and C based code is able to read and write data to memory storage instead of file storage.

## Special thanks

@moriturus gave me a great feetback about swiftication about this ZUnzip. I like to show great application for this.  Thanks!!

https://github.com/moriturus/ZUnzip/tree/swiftized


## License

* `ZUnzip` - MIT License
* `fmemopen` - Apache 2.0 License
* `libzip` - zlib license




