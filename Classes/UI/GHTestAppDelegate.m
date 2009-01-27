//
//  GHTestAppDelegate.m
//
//  Created by Gabriel Handford on 11/28/08.
//  Copyright 2008. All rights reserved.
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

#import "GHTestAppDelegate.h"


@interface GHTestAppDelegate (Private)
- (void)_runTests:(GHTestRunner *)runner;
@end

@implementation GHTestAppDelegate

- (void)awakeFromNib {
	windowController_ = [[GHTestWindowController alloc] init];
	[windowController_ showWindow:nil];	
	[self runTests];
}

- (void)runTests {	
	[NSThread detachNewThreadSelector:@selector(_runTests) toTarget:self withObject:nil];	
}

- (void)_runTests {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];		
	GHTestRunner *runner = [[[GHTestRunner runnerForAllTests] retain] autorelease];
	runner.delegate = self;
	runner.delegateOnMainThread = YES;
	// To allow exceptions to raise into the debugger, uncomment below
	//runner.raiseExceptions = YES;
	
	[runner run];
	[pool release];
}

#pragma mark Delegates (GHTestRunner)

- (void)testRunner:(GHTestRunner *)runner didLog:(NSString *)message {
	[windowController_.viewController log:message];
}

- (void)testRunner:(GHTestRunner *)runner didStartTest:(id<GHTest>)test {
	[windowController_.viewController updateTest:test];
}

- (void)testRunner:(GHTestRunner *)runner didFinishTest:(id<GHTest>)test {
	[windowController_.viewController updateTest:test];
}

- (void)testRunnerDidStart:(GHTestRunner *)runner { 
	[windowController_.viewController setRoot:(id<GHTestGroup>)runner.test];
	[windowController_.viewController updateTest:runner.test];
}

- (void)testRunnerDidFinish:(GHTestRunner *)runner {
	[windowController_.viewController selectFirstFailure];
	//[[NSApplication sharedApplication] terminate:nil];
}

@end
