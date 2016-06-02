//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

-(NSArray *)arrayBySortingArrayAscending:(NSArray *)array{
    NSSortDescriptor *sortedAscending =[NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    NSArray *arrayAscending =[array sortedArrayUsingDescriptors:@[sortedAscending]];
    
    return arrayAscending;
}

-(NSArray *)arrayBySortingArrayDescending:(NSArray *)array{
    NSSortDescriptor *sortedDescending =[NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
    NSArray *arrayDescending =[array sortedArrayUsingDescriptors:@[sortedDescending]];
    
    return arrayDescending;
    
}

-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array{
    NSMutableArray *mutArray = [array mutableCopy];
    [mutArray exchangeObjectAtIndex:0 withObjectAtIndex:[mutArray count]-1];
    
    return mutArray;
}

-(NSArray *)arrayByReversingArray:(NSArray *)array{
    NSMutableArray *mutArray = [array mutableCopy];
    NSInteger secondExchangePositionDecrement = 1;
    for (NSUInteger i = 0; i < [mutArray count]/2; i++) {
        [mutArray exchangeObjectAtIndex:i withObjectAtIndex:[mutArray count]-secondExchangePositionDecrement];
        secondExchangePositionDecrement++;
    }
    return mutArray;
}

-(NSString *)stringInBasicLeetFromString:(NSString *)string{
    NSDictionary *leetDictionary =@{@"a" : @"4",
                                    @"s" : @"5",
                                    @"i" : @"1",
                                    @"l" : @"1",
                                    @"e" : @"3",
                                    @"t" : @"7"};
    NSArray *leetKeys = [leetDictionary allKeys];
    NSMutableString *leetString = [string mutableCopy];
    for (NSInteger i = 0; i<[leetDictionary count]; i++) {
        [leetString replaceOccurrencesOfString:leetKeys[i] withString:leetDictionary[leetKeys[i]] options:NSCaseInsensitiveSearch range:NSMakeRange(0, [string length])];
       }
    return leetString;
}

-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array{
    NSMutableArray *negativesArray = [[NSMutableArray alloc]init];
    NSMutableArray *PositivesArray = [[NSMutableArray alloc]init];
    NSMutableArray *splitArray = [[NSMutableArray alloc]init];
    for (NSNumber *numberToEval in array) {
        if ([numberToEval integerValue] < 0) {
            [negativesArray addObject:numberToEval];
        } else {
            [PositivesArray addObject:numberToEval];
        }
    }
    [splitArray addObject:negativesArray];
    [splitArray addObject:PositivesArray];
    
    return splitArray;
}

-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dictionary{
    NSArray *fellowshipNames = [dictionary allKeys];
    NSMutableArray *hobbitsOnly = [[NSMutableArray alloc]init];
    for (NSUInteger i = 0; i < [dictionary count]; i++) {
        if ([dictionary[fellowshipNames[i]] isEqualToString:@"hobbit"]) {
            [hobbitsOnly addObject:fellowshipNames[i]];
        }
    }
    return hobbitsOnly;
}

-(NSArray *)stringsBeginningWithAInArray:(NSArray *)array{
    NSPredicate *findThoseWithA = [NSPredicate predicateWithFormat:@"self BEGINSWITH[c] 'a'"];
    NSArray *beginsWithAArray = [array filteredArrayUsingPredicate:findThoseWithA];
    return beginsWithAArray;
}

-(NSInteger)sumOfIntegersInArray:(NSArray *)array{
    NSInteger currentSum = 0;
    for (NSNumber *numberToAdd in array) {
        currentSum += [numberToAdd integerValue];
    }
    return currentSum;
}

-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array{
    NSDictionary *singularToPlural = @{@"hand" : @"hands",
                                       @"foot" : @"feet",
                                       @"knee" : @"knees",
                                       @"table" : @"tables",
                                       @"box" : @"boxes",
                                       @"ox" : @"oxen",
                                       @"axle" : @"axles",
                                       @"radius" : @"radii",
                                       @"trivium" : @"trivia"};
    NSMutableArray *pluralizedArray = [[NSMutableArray alloc]init];
    for (NSUInteger i=0; i < [array count]; i++) {
        NSArray *singularKeys = [singularToPlural allKeys];
        if ([singularKeys containsObject:array[i]]) {
            [pluralizedArray addObject:singularToPlural[array[i]]];
        }
    }
    return pluralizedArray;
}

-(NSDictionary *)countsOfWordsInString:(NSString *)string{
    NSMutableDictionary *mobyCounts = [[NSMutableDictionary alloc]init];
    NSString *lowercaseStr = [string lowercaseString];
    NSMutableString *mutMoby = [lowercaseStr mutableCopy];
    NSArray *punctToRemove = @[@".", @",", @"-", @";"];
    NSArray *subsAsArray = @[];
    for (NSString *punct in punctToRemove) {
        [mutMoby replaceOccurrencesOfString:punct withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0,[mutMoby length])];
        subsAsArray = [mutMoby componentsSeparatedByString:@" "];
    }
    for (NSString *str in subsAsArray) {
        
        if (mobyCounts[str]) {
            NSInteger valueUnwrap = [mobyCounts[str]integerValue];
            valueUnwrap++;
            NSNumber *valueRewrap = @(valueUnwrap);
            mobyCounts[str] = valueRewrap;
        }else{
          mobyCounts[str] = @(1);  
        }

    }
    return mobyCounts;
}

-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array{
    NSMutableArray *storageArray = [[NSMutableArray alloc]init];
    NSArray *artistSongArray = @[];
    NSMutableDictionary *musicLibrary = [[NSMutableDictionary alloc]init];
    NSArray *alphabetizedArray = @[];
    NSSortDescriptor *artistSorter = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    alphabetizedArray = [array sortedArrayUsingDescriptors:@[artistSorter]];
    for (NSString *str in alphabetizedArray) {
        artistSongArray = [str componentsSeparatedByString:@" - "];
        [storageArray addObjectsFromArray:artistSongArray];
    }
    for (NSUInteger i = 0; i < [storageArray count]; i+=2) {
        if (musicLibrary[storageArray[i]]) {
            [musicLibrary[storageArray[i]]addObject:storageArray[i+1]];
        }else{
            musicLibrary[storageArray[i]] = [@[storageArray[i+1]]mutableCopy];
        }
    }
    return musicLibrary;
}



@end
