/*
     File: SearchBarController.m  
 */

#import "SearchBarController.h"
#import "UIImage+Color.h"
#import "BTSearchBar.h"
#import "OSVersionCheck.h"

@interface SearchBarController () <UISearchBarDelegate>

@property (nonatomic, assign) BOOL up;
@property (nonatomic, strong) BTSearchBar *searchBar;

@end


#pragma mark -

@implementation SearchBarController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.title = NSLocalizedString(@"SearchBarTitle", @"");
    
    self.view.backgroundColor = [UIColor whiteColor];

	self.searchBar = [[BTSearchBar alloc] initWithFrame:CGRectMake(0, iOS7?20:0, CGRectGetWidth(self.view.bounds), 44.0)];
    self.searchBar.placeholder = @"搜索目的地、用户、旅程 ...";
	self.searchBar.delegate = self;
    self.searchBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;    
    // image background
    self.searchBar.backgroundImage = [UIImage imageWithColor:UIColorFromRGB(0x33cccc)];
    // hide search icon
    [self.searchBar setImage:[UIImage imageWithColor:[UIColor whiteColor]] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    // search text field background
    [self.searchBar setSearchFieldBackgroundImage:[UIImage imageNamed:@"TextFieldBg"] forState:UIControlStateNormal];
    self.searchBar.showsBookmarkButton = YES;
    self.up = NO;
	[self.view addSubview: self.searchBar];
}

- (void)setUp:(BOOL)up {
    _up = up;
    if(_up) {
        [self.searchBar setImage:[UIImage imageNamed:@"btn_up"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateNormal];
        [self.searchBar setImage:[UIImage imageNamed:@"btn_up_hl"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateHighlighted];
    } else {
        [self.searchBar setImage:[UIImage imageNamed:@"btn_down"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateNormal];
        [self.searchBar setImage:[UIImage imageNamed:@"btn_down_hl"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateHighlighted];
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
	self.searchBar.showsCancelButton = YES;
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
	[self.searchBar resignFirstResponder];
}

// called when cancel button pressed
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"%s,%d",__FUNCTION__,__LINE__);
	[self.searchBar resignFirstResponder];
	self.searchBar.showsCancelButton = NO;
}

@end
