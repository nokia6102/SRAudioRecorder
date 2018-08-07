//
//  ViewController.m
//  SRAudioRecorderDemo
//
//  Created by https://github.com/guowilling on 2018/8/2.
//  Copyright © 2018年 SR. All rights reserved.
//

#import "ViewController.h"
#import "SRAudioRecorderManager.h"
#import "SRRecordingAudioPlayerManager.h"
#import "SRAudioRecordButton.h"
#import "SRAudioRecordToastManager.h"

@interface ViewController () <SRAudioRecorderManagerDelegate>

@property (weak, nonatomic) IBOutlet SRAudioRecordButton *audioRecordBtn;

@property (nonatomic, copy) NSString *audioFilePath;

@end

@implementation ViewController

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (IBAction)playRecordAudio:(id)sender {
    [[SRRecordingAudioPlayerManager sharedManager] playerWithFilePath:self.audioFilePath];
    [[SRRecordingAudioPlayerManager sharedManager] play];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [SRAudioRecorderManager sharedManager].delegate = self;
    [SRAudioRecorderManager sharedManager].maxDuration = 20;
    [SRAudioRecorderManager sharedManager].minDuration = 10;
    [SRAudioRecorderManager sharedManager].showCountdownPoint = 5;
}

- (void)audioRecorderManagerAVAuthorizationStatusDenied {
    NSLog(@"audioRecorderManagerAVAuthorizationStatusDenied");
}

- (void)audioRecorderManagerDidFinishRecordingSuccess:(NSString *)audioFilePath {
    NSLog(@"audioRecorderManagerDidFinishRecordingSuccess audioFilePath: %@", audioFilePath);
    
    self.audioFilePath = audioFilePath;
}

- (void)audioRecorderManagerDidFinishRecordingFailed {
    NSLog(@"audioRecorderManagerDidFinishRecordingFailed");
}

@end