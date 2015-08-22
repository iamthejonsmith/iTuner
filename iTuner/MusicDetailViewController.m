//
//  MusicDetailViewController.m
//  iTuner
//
//  Created by Jon Smith on 8/21/15.
//  Copyright (c) 2015 Jon Smith. All rights reserved.
//

#import "MusicDetailViewController.h"
#import "MBProgressHUD.h"

@interface MusicDetailViewController ()<UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *lyricWebView;
@property (strong, nonatomic) MBProgressHUD *hud;

@end

@implementation MusicDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _lyricWebView.delegate = self;
    
    self.navigationItem.title = _passedSong;
    [self lyricRequest];
    [self loadingOverlay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Loading Overlay methods

// loading progress overlay method
- (void)loadingOverlay
{
    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _hud.labelText = @"Loading Music List";
    [_hud show: YES];
    [_hud hide:YES afterDelay:10];
}

#pragma mark - Webview methods

-(void)lyricRequest
{
    [self loadingOverlay];
    
    NSString *artistString = [_passedArtist stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    NSString *songString = [_passedSong stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    NSString *urlString = [NSString stringWithFormat:@"http://lyrics.wikia.com/wiki/%@:%@", artistString, songString];
    NSLog(@"%@", urlString);
    NSURL *myURL = [NSURL URLWithString:urlString];
    [_lyricWebView loadRequest:[NSURLRequest requestWithURL:myURL]];
}

@end
