//
//  GHTestSuite.h
//  GHUnit
//
//  Created by Gabriel Handford on 1/25/09.
//  Copyright 2009. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//

#import "GHTestGroup.h"

/*!
 Test suite is an alias for test group.
 */
@interface GHTestSuite : GHTestGroup {

}

/*! Create test suite with test cases.
 @param name
 @param testCases
 @param delegate
 */
- (id)initWithName:(NSString *)name testCases:(NSArray *)testCases delegate:(id<GHTestDelegate>)delegate;

/*!
 Creates a suite of all tests.
 Will load all classes that subclass from GHTestCase or SenTestCase.
 */
+ (GHTestSuite *)allTests;

// If flatten is YES, returns a test suite with all tests grouped here.
+ (GHTestSuite *)allTests:(BOOL)flatten;

@end
