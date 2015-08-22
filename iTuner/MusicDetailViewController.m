//
//  MusicDetailViewController.m
//  iTuner
//
//  Created by Jon Smith on 8/21/15.
//  Copyright (c) 2015 Jon Smith. All rights reserved.
//

#import "MusicDetailViewController.h"

@interface MusicDetailViewController ()<UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *lyricWebView;
@property (strong, nonatomic) IBOutlet UIImageView *albumImage;
@property (strong, nonatomic) IBOutlet UILabel *artistLabel;
@property (strong, nonatomic) IBOutlet UILabel *songTitleLabel;

@end

@implementation MusicDetailViewController

- (void)viewDidLoad {
    
    // Do any additional setup after loading the view.
    _lyricWebView.delegate = self;
    
   self.navigationItem.title = @"iTuner Lyric Page";
    _albumImage.image = _passedImage;
    _artistLabel.text = _passedArtist;
    _songTitleLabel.text = _passedSong;
    
    [self lyricRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

\

#pragma mark - Webview methods

-(void)lyricRequest
{
    [super viewDidLoad];
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    indicator.center = self.view.center;
    [self.view addSubview:indicator];
    [indicator bringSubviewToFront:self.view];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = TRUE;
    
    [indicator startAnimating];
    NSString *artistString = [_passedArtist stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    NSString *songString = [_passedSong stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    NSString *urlString = [NSString stringWithFormat:@"http://lyrics.wikia.com/wiki/%@:%@", artistString, songString];
    NSLog(@"%@", urlString);
    NSURL *myURL = [NSURL URLWithString:urlString];
    [_lyricWebView loadRequest:[NSURLRequest requestWithURL:myURL]];
    
    [indicator stopAnimating];
}

@end
