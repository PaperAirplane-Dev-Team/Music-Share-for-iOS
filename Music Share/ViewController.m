//
//  ViewController.m
//  Music Share
//
//  Created by Yao Xavier on 13-2-12.
//  Copyright (c) 2013年 Paper Airplane Dev Team. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)sb_pressed:(id)sender{
    MPMusicPlayerController *mpmpc;
    mpmpc = [MPMusicPlayerController iPodMusicPlayer];
    NSString *player;
    NSString *title;
    NSString *album;
    UIImage *artwork;
    MPMediaItemArtwork *mpArtwork = [mpmpc.nowPlayingItem valueForProperty: MPMediaItemPropertyArtwork];
    if([mpmpc.nowPlayingItem valueForProperty: MPMediaItemPropertyAlbumTitle] == nil){
        album = @"null";
    }else{
        album = [mpmpc.nowPlayingItem valueForProperty: MPMediaItemPropertyAlbumTitle];
    }
    if([mpmpc.nowPlayingItem valueForProperty: MPMediaItemPropertyTitle] == nil){
        title = @"null";
    }else{
        title = [mpmpc.nowPlayingItem valueForProperty: MPMediaItemPropertyTitle];
    }
    if([mpmpc.nowPlayingItem valueForProperty: MPMediaItemPropertyArtist] == nil){
        player = @"null";
    }else{
        player = [mpmpc.nowPlayingItem valueForProperty: MPMediaItemPropertyArtist];
    }
    if(mpArtwork != nil){
        artwork = [mpArtwork imageWithSize: mpArtwork.bounds.size];
    }else{
        artwork = nil;
    }
    NSMutableString *string = [NSMutableString stringWithCapacity:140];
    [string appendString: @"我用@纸飞机音乐分享 （for iOS）分享了"];
    [string appendString:player];
    [string appendString:@"的音乐"];
    [string appendString:title];
    [string appendString:@"来自专辑"];
    [string appendString:album];
    
    NSArray *activityItems;
    if (artwork != nil){
        activityItems = [NSArray arrayWithObjects:string,artwork,nil];
    }else{
        activityItems = [NSArray arrayWithObject:string]; 
    }
    UIActivityViewController *activityController =
    [[UIActivityViewController alloc] initWithActivityItems:activityItems  applicationActivities:nil];    
    [self presentViewController:activityController  animated:YES completion:nil];
}
@end
