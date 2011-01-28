@interface SetupTests : GHTestCase {}
@end

@implementation SetupTests

- (void) testFirstUT {
	GHAssertEquals(1, 2, @"Should Fail");
}

- (void) testSecondUT {
	GHAssertEquals(1, 1, @"Should Pass");
}

@end
