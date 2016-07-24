# ZUnzip 

`ZUnzip` は zip ファイルまたはデータを解凍するができるフレームワークです。オンメモリで解凍できる数少ないフレームワークです。ZUnzip をインスタンス化するには、zipファイル上のパスを与えるか、zipのバイナリを与えまて初期化します。

## 初期化

```.objc
- (id)initWithPath:(NSString *)path
```

パスを指定して初期化します。初期化に失敗すれば、nil を戻します。

```.objc
- (id)initWithZipData:(NSData *)data
```

`NSData` を与えて初期化します。初期化に失敗すれば nil を戻します。

## ファイル一覧

```.objc
- (NSArray *)files
```

同zipファイル内のファイルを NSArray として戻します。

## ファイルの解凍及び抽出

```.objc
- (NSData *)dataForFile:(NSString *)file
```

## 使い方

zip から取り出すファイルがわかっている場合は、以下のようにコードから特定のファイルを解凍及び抽出する事ができます。

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

`ZUnzip` は C ベースのライブラリ `libzip` を利用しています。`libzip`は以下のURLより入手可能です。

https://nih.at/libzip/index.html

## License

`libzip`'s license can be found at [https://nih.at/libzip/LICENSE.html](https://nih.at/libzip/LICENSE.html).  `ZUnzip` itself can be distributed under MIT license. 


