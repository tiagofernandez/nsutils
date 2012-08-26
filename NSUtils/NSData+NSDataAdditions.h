#import <Foundation/Foundation.h>

@interface NSData (NSDataAdditions)

// Encrypts this binary data using AES-256 with a key.
- (NSData *)AES256EncryptWithKey:(NSString *)key;

// Decrypts this binary data using AES-256 with a key.
- (NSData *)AES256DecryptWithKey:(NSString *)key;

// Decrypts this binary data to UTF-8 string using AES-256 with a key.
- (NSString *)AES256DecryptStringWithKey:(NSString *)key;

@end
