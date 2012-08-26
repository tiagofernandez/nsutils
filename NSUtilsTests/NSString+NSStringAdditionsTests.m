@interface NSString_NSStringAdditionsTests : SenTestCase
@end

@implementation NSString_NSStringAdditionsTests

- (void)test_should_detect_substring
{
  NSString *text = @"All your data are belong to US";
  
  STAssertTrue([text containsString:@"your data"], nil);
  STAssertTrue([text containsString:@"YOUR DATA" options:NSCaseInsensitiveSearch], nil);
  STAssertFalse([text containsString:@"base"], nil);
  STAssertFalse([text containsString:@""], nil);
  STAssertFalse([text containsString:nil], nil);
}

- (void)test_should_detect_empty_and_nonempty_strings
{
  STAssertTrue([@"" isEmpty], nil);
  STAssertTrue([@" " isEmpty], nil);
  STAssertTrue([@"foo" isNotEmpty], nil);
}

- (void)test_should_generate_md5_hash_for_string
{
  NSString *md5Hex = [@"All your base are belong to us" MD5Hex];
  STAssertTrue([md5Hex isEqualToString:@"a3cf7b45765338ab0b1edb742ac24cf6"], nil);
}

- (void)test_should_trim_whitespaces
{
  STAssertTrue([[@" your data " trim] isEqualToString:@"your data"], nil);
  STAssertTrue([[@"  " trim] isEqualToString:@""], nil);
}

- (void)test_should_generate_UUID
{
  STAssertTrue([[NSString uuid] length] > 0, nil);
  STAssertFalse([[NSString uuid] isEqualToString:[NSString uuid]], nil);
}

@end
