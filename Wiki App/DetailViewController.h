//
//  DetailViewController.h
//  Wiki App
//
//  Created by Chloe Stars on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <Twitter/Twitter.h>
#import <MessageUI/MessageUI.h>
#import "WikipediaHelper.h"
#import "TableOfContentsAnchor.h"
#import "HistoryViewController.h"
#import "MasterViewController.h"
#import "ImageViewController.h"
#import "UIDownloadBar.h"

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate, UIWebViewDelegate, UIScrollViewDelegate, UIActionSheetDelegate, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate, UITextFieldDelegate, UIDownloadBarDelegate> {
    IBOutlet UITextField *articleSearchBox;
    IBOutlet UIWebView *articleView;
    IBOutlet UIView *bottomBar;
    IBOutlet UIView *searchView;
    IBOutlet UIButton *backButton;
    IBOutlet UIButton *forwardButton;
    IBOutlet UINavigationItem *detailItem;
    IBOutlet UIScrollView *scrollView;
    IBOutlet UIImageView *imageView;
    NSMutableArray *tableOfContents;
    HistoryViewController *_historyController;
    UIPopoverController *_historyControllerPopover;
    NSMutableArray *historyArray;
    NSMutableArray *previousHistoryArray;
    NSThread *loadingThread;
    UIView *overlay;
    int historyIndex;
    UIDownloadBar *imageBar;
    UILabel *titleLabel;
    NSMetadataQuery *metadataQuery;
}

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) IBOutlet UITextField *articleSearchBox;
@property (strong, nonatomic) IBOutlet UIWebView *articleView;
@property (strong, nonatomic) IBOutlet UIView *bottomBar;
@property (nonatomic, retain) HistoryViewController *historyController;
@property (nonatomic, retain) UIPopoverController *historyControllerPopover;
@property (retain) NSMutableArray *historyArray;
@property (retain) NSMutableArray *previousHistoryArray;
@property (retain) UILabel *titleLabel;
@property (retain) NSMutableArray *tableOfContents;

- (IBAction)selectArticleFromHistory:(id)sender;
- (IBAction)submitFeedback:(id)sender;
 
@end
