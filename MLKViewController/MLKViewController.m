//
//  MLKViewController.m
//  MLKMenuPopover
//
//  Created by NagaMalleswar on 20/11/14.
//  Copyright (c) 2014 NagaMalleswar. All rights reserved.
//

#import "MLKViewController.h"
#import "MLKMenuPopover.h"

#define MENU_POPOVER_FRAME  CGRectMake(8, 0, 140, 88)


@interface MLKViewController () <MLKMenuPopoverDelegate>

@property(nonatomic,strong) MLKMenuPopover *menuPopover;
@property(nonatomic,strong) NSArray *menuItems;

@end

@implementation MLKViewController

#pragma mark -
#pragma mark UIViewController Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Menu Popover";
    
    self.menuItems = [NSArray arrayWithObjects:@"Menu Item 1", @"Menu Item 2", nil];
}

#pragma mark -
#pragma mark Actions

- (IBAction)showMenuPopOver:(id)sender
{
    // Hide already showing popover
    [self.menuPopover dismissMenuPopover];
    
    self.menuPopover = [[MLKMenuPopover alloc] initWithFrame:MENU_POPOVER_FRAME menuItems:self.menuItems];
    
    self.menuPopover.menuPopoverDelegate = self;
    [self.menuPopover showInView:self.view];
}

#pragma mark -
#pragma mark MLKMenuPopoverDelegate

- (void)menuPopover:(MLKMenuPopover *)menuPopover didSelectMenuItemAtIndex:(NSInteger)selectedIndex
{
    [self.menuPopover dismissMenuPopover];
    
    NSString *title = [NSString stringWithFormat:@"%@ selected.",[self.menuItems objectAtIndex:selectedIndex]];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alertView show];
}

@end
