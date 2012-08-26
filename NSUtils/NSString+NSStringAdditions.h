#import <Foundation/Foundation.h>

@interface NSString (NSStringAdditions)

// Checks whether this string contains another one.
- (BOOL)containsString:(NSString *)string;

// Checks whether this string contains another one, with custom comparison options.
- (BOOL)containsString:(NSString *)string options:(NSStringCompareOptions)options;

// Checks whether this string has at zero or only blank characters.
- (BOOL)isEmpty;

// Checks whether this string has at least one not blank character.
- (BOOL)isNotEmpty;

// Generates an MD5 hex string from this string.
- (NSString *)MD5Hex;

// Removes leading and trailing whitespaces.
- (NSString *)trim;

// Generates an universally unique identifier as string.
+ (NSString *)uuid;

@end
