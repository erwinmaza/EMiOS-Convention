# EMiOS+Convention

Taking a page from the Rails philosophy, avoiding string identifiers in my code.

I've always thought using string identifiers was a bit fragile in Cocoa touch. Granted, I can't recall an instance where a mistyped identifier caused me grief, but the possibility always nagged at me.

So I decided to take a page from the Ruby-on-Rails framework philosophy of "convention over configuration" and see how many string identifiers I could purge from my code.

The result: EMiOS+Convention, a collection of class extensions that break the Objective-C convention of extending one class per code file. Oh well.

### Usage

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



