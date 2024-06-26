#import <CommonCrypto/CommonDigest.h>

#import "NSString+NSStringAdditions.h"
#import "NSData+NSDataAdditions.h"

@implementation NSString (NSStringAditions)

- (BOOL) containsString:(NSString *)string
{
  return string ? [self containsString:string options:0] : NO;
}

- (BOOL)containsString:(NSString *)string options:(NSStringCompareOptions)options
{
  NSRange range = [self rangeOfString:string options:options];
  return range.location != NSNotFound;
}

- (BOOL)isEmpty
{
  return [[self trim] length] == 0;
}

- (BOOL)isNotEmpty
{
  return ![self isEmpty];
}

- (NSString *)MD5Hex
{
  const char* str = [self UTF8String];
  unsigned char result[CC_MD5_DIGEST_LENGTH];
  
  CC_MD5(str, strlen(str), result);
  
  NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
  
  for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
    [ret appendFormat:@"%02x", result[i]];
  }
  return ret;
}

- (NSString *)trim
{
  return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+ (NSString *)uuid
{
  NSUUID  *uuid = [NSUUID UUID];
  return [uuid UUIDString];
}

@end
