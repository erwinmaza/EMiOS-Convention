//  EMiOS+Convention.m
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


#import "EMiOS+Convention.h"


@implementation NSEntityDescription (EMiOS_Convention)

+ (id)entityWithClass:(Class)class inContext:(NSManagedObjectContext*)context {
	return [NSEntityDescription entityForName:NSStringFromClass(class) inManagedObjectContext:context];
}

+ (id)insertEntityOfClass:(Class)class intoContext:(NSManagedObjectContext*)context {
	return [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass(class) inManagedObjectContext:context];
}

@end



#pragma mark UIViewController
@implementation UIViewController (EMiOS_Convention)

- (id)storyboardControllerWithClass:(Class)class {
	return [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass(class)];
}

- (id)initWithNib {
	return [self initWithNibName:NSStringFromClass([self class]) bundle:nil];
}

- (void)exit {
	[self performSegueWithIdentifier:@"ExitSegue" sender:NULL];
}

- (void)exitDoorNumber2 {
	[self performSegueWithIdentifier:@"AlternateExitSegue" sender:NULL];
}

- (void)showModal {
	[self performSegueWithIdentifier:@"ModalSegue" sender:NULL];
}

@end

#pragma mark UITableView
@implementation UITableView (EMiOS_Convention)

- (void)registerNibWithClass:(Class)class {
	[self registerNib:[UINib nibWithNibName:NSStringFromClass(class) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass(class)];
}

- (void)registerClass:(Class)class {
	[self registerClass:class forCellReuseIdentifier:NSStringFromClass(class)];
}

- (void)registerHeader:(Class)class {
	[self registerClass:class forHeaderFooterViewReuseIdentifier:NSStringFromClass(class)];
}

- (id)dequeueCellWithClass:(Class)class {
	return [self dequeueReusableCellWithIdentifier:NSStringFromClass(class)];
}

- (id)dequeueCellWithClass:(Class)class forIndexPath:(NSIndexPath*)path{
	return [self dequeueReusableCellWithIdentifier:NSStringFromClass(class) forIndexPath:path];
}

@end


#pragma mark UICollectionView
@implementation UICollectionView (EMiOS_Convention)

- (void)registerNibWithClass:(Class)class {
	[self registerNib:[UINib nibWithNibName:NSStringFromClass(class) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:NSStringFromClass(class)];
}

- (void)registerHeaderNibWithClass:(Class)class {
	[self registerNib:[UINib nibWithNibName:NSStringFromClass(class) bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass(class)];
}

- (void)registerFooterNibWithClass:(Class)class {
	[self registerNib:[UINib nibWithNibName:NSStringFromClass(class) bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass(class)];
}

- (void)registerHeaderWithClass:(Class)class {
	[self registerClass:class forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass(class)];
}

- (void)registerFooterWithClass:(Class)class {
	[self registerClass:class forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass(class)];
}

- (void)registerClass:(Class)class {
	[self registerClass:class forCellWithReuseIdentifier:NSStringFromClass(class)];
}

- (id)dequeueCellWithClass:(Class)class forIndexPath:(NSIndexPath*)indexPath {
	return [self dequeueReusableCellWithReuseIdentifier:NSStringFromClass(class) forIndexPath:indexPath];
}

- (id)dequeueHeaderWithClass:(Class)class forIndexPath:(NSIndexPath*)indexPath {
	return [self dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass(class) forIndexPath:indexPath];
}

- (id)dequeueFooterWithClass:(Class)class forIndexPath:(NSIndexPath*)indexPath {
	return [self dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass(class) forIndexPath:indexPath];
}

- (UICollectionReusableView*)getFooterForPath:(NSIndexPath*)path {
	return [[self dataSource] collectionView:self viewForSupplementaryElementOfKind:UICollectionElementKindSectionFooter atIndexPath:path];
}




@end
