//
//  IntroViewController.m
//  RLDictionary
//
//  Created by Rio on 17/02/2017.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

#import "IntroViewController.h"
#import "DictionaryManager.h"

@interface IntroViewController ()

@property IBOutlet UITableView *tableView;
@property (nonatomic, strong) DictionaryManager *dictionaryManager;
@property id forceTouchPreviewingContext;

@end

@implementation IntroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dictionaryManager = [[DictionaryManager alloc] init];
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(wordDataDidChanged:)
//                                                 name:@"WordDataDidChangedNotification"
//                                               object:nil];
//    
    UIBarButtonItem *addWordButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addWordButtonItemAction:)];
    self.navigationItem.rightBarButtonItem = addWordButtonItem;
    
    [self testWords];
}

- (void)addWordButtonItemAction:(id)sender {
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dictionaryManager.wordbook.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"wordbookCell"];
    NSString *word = [self.dictionaryManager.wordbook objectAtIndex:indexPath.row];
    [cell.textLabel setText:word];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *term = [self.dictionaryManager.wordbook objectAtIndex:indexPath.row];
    [self findDefinitionFromDictionaryForTerm:term];
    [self.tableView reloadData];
}

- (void)findDefinitionFromDictionaryForTerm:(NSString *)term {
    [self.dictionaryManager findDefinitionFromDictionaryForTerm:term completionHandler:^(UIReferenceLibraryViewController *libarayViewController, NSError *error) {
        
        if(error) {
            [self.view makeToast:error.domain];
            return ;
        }
        
        if(libarayViewController) {
            [self presentViewController:libarayViewController animated:YES completion:nil];
        }
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
}

- (void)testWords {
    [self.dictionaryManager.wordbook addObject:@"bonjour"];
    [self.dictionaryManager.wordbook addObject:@"hello"];
    [self.dictionaryManager.wordbook addObject:@"안녕하세요"];
}

@end
