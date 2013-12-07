/*
     File: SearchBarController.m  
 */

#import "SearchBarController.h"
#import "UIImage+Color.h"
#import "BTSearchBar.h"

@interface SearchBarController () <UISearchBarDelegate>

@property (nonatomic, assign) BOOL up;
@property (nonatomic, strong) BTSearchBar *mySearchBar;
@property (nonatomic, strong) IBOutlet UISegmentedControl *contentOptions;

@end


#pragma mark -

@implementation SearchBarController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.title = NSLocalizedString(@"SearchBarTitle", @"");
    
    self.view.backgroundColor = [UIColor whiteColor];

	self.mySearchBar = [[BTSearchBar alloc] initWithFrame:CGRectMake(0.0, 0.0, CGRectGetWidth(self.view.bounds), 44.0)];
    self.mySearchBar.placeholder = @"搜索目的地、用户、旅程 ...";
	self.mySearchBar.delegate = self;
    self.mySearchBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;    
    // image background
    self.mySearchBar.backgroundImage = [UIImage imageWithColor:UIColorFromRGB(0x33cccc)];
    // hide search icon
    [self.mySearchBar setImage:[UIImage imageWithColor:[UIColor whiteColor]] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    // search text field background
    [self.mySearchBar setSearchFieldBackgroundImage:[UIImage imageNamed:@"TextFieldBg"] forState:UIControlStateNormal];
    self.mySearchBar.showsBookmarkButton = YES;
    self.up = NO;
	[self.view addSubview: self.mySearchBar];
}

- (void)setUp:(BOOL)up {
    _up = up;
    if(_up) {
        [self.mySearchBar setImage:[UIImage imageNamed:@"btn_up"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateNormal];
        [self.mySearchBar setImage:[UIImage imageNamed:@"btn_up_hl"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateHighlighted];
    } else {
        [self.mySearchBar setImage:[UIImage imageNamed:@"btn_down"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateNormal];
        [self.mySearchBar setImage:[UIImage imageNamed:@"btn_down_hl"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateHighlighted];
    }
}

#pragma mark - UISearchBarDelegate

// return NO to not become first responder
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    NSLog(@"%s,%d",__FUNCTION__,__LINE__);
    return YES;
}

// called when text starts editing
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    NSLog(@"%s,%d",__FUNCTION__,__LINE__);
	self.mySearchBar.showsCancelButton = YES;
}

// return NO to not resign first responder
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    NSLog(@"%s,%d",__FUNCTION__,__LINE__);
    return YES;
}

// called when text ends editing
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar;
{
    NSLog(@"%s,%d",__FUNCTION__,__LINE__);
}

// called when text changes (including clear)
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText;
{
    NSLog(@"%s,%d",__FUNCTION__,__LINE__);
}

// called before text changes
- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    NSLog(@"%s,%d",__FUNCTION__,__LINE__);
    return YES;
}

// called when the bookmark button inside the search bar is tapped
- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"%s,%d",__FUNCTION__,__LINE__);
    self.up = !self.up;
}

// called when keyboard search button pressed
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"%s,%d",__FUNCTION__,__LINE__);
	[self.mySearchBar resignFirstResponder];
}

// called when cancel button pressed
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"%s,%d",__FUNCTION__,__LINE__);
	[self.mySearchBar resignFirstResponder];
	self.mySearchBar.showsCancelButton = NO;
}

@end
