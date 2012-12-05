# EMiOS+Convention

Taking a page from the Rails philosophy, avoiding string identifiers in my code.

I've always thought using string identifiers was a bit fragile in Cocoa touch. Granted, I can't recall an instance where a mistyped identifier caused me grief, but the possibility always nagged at me.

	In truth, I took to using #define macros to minimize typos in identifiers, but that still required coordination between the code and the nib/storyboards. I was not satisfied with that approach.

So I decided to take a page from the Ruby-on-Rails framework philosophy of "convention over configuration" and see how many string identifiers I could purge from my code.

The result: EMiOS+Convention, a collection of class extensions that nevertheless break the Objective-C convention of extending one class per code file. 

These are just some of the generic categories I've found useful in apps I've built since I started this experiment, so by no means is this list intended to be comprehensive. If you have or can think of others, I'll be glad to add them to this collection.


## Usage

What follows are the rules you must follow to use each of these extensions:

	NSEntityDescription:
	+ (id)userEntityWithClass:(Class)class inContext:(NSManagedObjectContext*)context;

* The NSManagedObject subclass name must match the entity name

---
	UIViewController:
	- (id)storyboardControllerWithClass:(Class)class;
	- (id)initWithNib;
	- (void)exit;
	- (void)exitDoorNumber2;
	- (void)showModal;

* The Storyboard identifier for the view controller must match the view controller's class name
* The filename of the nib for the view controller must match the view controller's class name
* The Storyboard identifier for the *Primary* exit segue must be "ExitSegue"
* The Storyboard identifier for the *Alternate* exit segue must be "AlternateExitSegue"
* The Storyboard identifier for the *Modal* exit segue must be "ModalSegue"


---
	UITableView
	- (void)registerNibWithClass:(Class)class;
	- (id)dequeueCellWithClass:(Class)class;

* The filename of the nib for the custom UITableViewCell must match the cell subclass name


---
	UICollectionView
	- (void)registerNibWithClass:(Class)class;
	- (id)dequeueCellWithClass:(Class)class forIndexPath:(NSIndexPath*)indexPath;

* The filename of the nib for the custom UICollectionViewCell must match the cell subclass name


### Notes

The 3 exit segue conventions are not useful if you need to pass values to the destination view controllers. I may address that at some point as time allows.


## License

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

