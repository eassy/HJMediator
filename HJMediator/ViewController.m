//
//  ViewController.m
//  HJMediator
//
//  Created by eassy on 2018/11/9.
//  Copyright © 2018年 eassy. All rights reserved.
//

#import "ViewController.h"
#import "HJMediatorManager.h"
#import "VCMediator.h"
#import "MediatorConfig.h"

@interface ViewController ()<UITableViewDelegate ,UITableViewDataSource>

@property (nonatomic ,strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (void)viewWillLayoutSubviews
{
    [self.tableView setFrame:self.view.bounds];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Delegate&DataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifityCell = @"identifityCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifityCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifityCell];
        
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = @"VC - A Push";
    }
    else
    {
        cell.textLabel.text = @"VC - A Present";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    VCMediator *mediator = [VCMediator VCMediatorWithName:@"A" parameters:nil];
    if (indexPath.row == 0) {
        [HJMediatorManager pushVCWithMediator:mediator navController:self.navigationController];
        
    }
    else
    {
        [HJMediatorManager presentVCWithMediator:mediator mainController:self];
    }
    
}

@end
