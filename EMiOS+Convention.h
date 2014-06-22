//  EMiOS+Convention.h
//  Created by erwin on 12/3/12.

/*
 
	Copyright (c) 2012 eMaza Mobile. All rights reserved.

	Permission is hereby granted, free of charge, to any person obtaining
	a copy of this software and associated documentation files (the
	"Software"), to deal in the Software without restriction, including
	without limitation the rights to use, copy, modify, merge, publish,
	distribute, sublicense, and/or sell copies of the Software, and to
	permit persons to whom the Software is furnished to do so, subject to
	the following conditions:

	The above copyright notice and this permission notice shall be
	included in all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
	EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
	NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
	LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
	OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
	WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
*/



@interface NSEntityDescription (EMiOS_Convention)

	+ (id)entityWithClass:(Class)aClass inContext:(NSManagedObjectContext*)context;
	+ (id)insertEntityOfClass:(Class)aClass intoContext:(NSManagedObjectContext*)context;

@end


@interface UIViewController (EMiOS_Convention)

	- (id)storyboardControllerWithClass:(Class)aClass;
	- (id)initWithNib;
	- (void)exit;
	- (void)exitDoorNumber2;
	- (void)showModal;

@end


@interface UITableView (EMiOS_Convention)

	- (void)registerNibWithClass:(Class)aClass;
	- (void)registerClass:(Class)aClass;
	- (void)registerHeader:(Class)aClass;
	- (id)dequeueCellWithClass:(Class)aClass;
	- (id)dequeueCellWithClass:(Class)aClass forIndexPath:(NSIndexPath*)path;

@end


@interface UICollectionView (EMiOS_Convention)

	- (void)registerNibWithClass:(Class)aClass;
	- (void)registerHeaderNibWithClass:(Class)aClass;
	- (void)registerFooterNibWithClass:(Class)aClass;
	- (void)registerHeaderWithClass:(Class)aClass;
	- (void)registerFooterWithClass:(Class)aClass;
	- (void)registerClass:(Class)aClass;
	- (id)dequeueCellWithClass:(Class)aClass forIndexPath:(NSIndexPath*)indexPath;
	- (id)dequeueHeaderWithClass:(Class)aClass forIndexPath:(NSIndexPath*)indexPath;
	- (id)dequeueFooterWithClass:(Class)aClass forIndexPath:(NSIndexPath*)indexPath;
	- (UICollectionReusableView*)getFooterForPath:(NSIndexPath*)path;

@end

