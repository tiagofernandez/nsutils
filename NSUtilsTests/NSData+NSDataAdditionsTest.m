@interface NSData_NSDataAdditionsTest : SenTestCase
@end

@implementation NSData_NSDataAdditionsTest

- (void)test_should_encrypt_and_decrypt_plain_text
{
  NSString *encryptionKey = @"3ncrypt10nk3y";
  NSString *plainText = @"secret";
  
  NSData *data = [@"secret" dataUsingEncoding:NSUTF8StringEncoding];
  
  NSData *encryptedData = [data AES256EncryptWithKey:encryptionKey];
  STAssertNotNil(encryptedData, nil);
  
  NSData *decryptedData = [encryptedData AES256DecryptWithKey:encryptionKey];
  STAssertNotNil(decryptedData, nil);
  
  NSString *decryptedText = [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
  STAssertTrue([plainText isEqualToString:decryptedText], nil);
  
  decryptedText = [encryptedData AES256DecryptStringWithKey:encryptionKey];
  STAssertTrue([plainText isEqualToString:decryptedText], nil);
}

@end
