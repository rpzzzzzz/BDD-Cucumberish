//
//  CucumberishLoader.m
//  UITestingUITests
//
//  Created by Suraphan 'Rawd' Laokondee on 15/8/2561 BE.
//  Copyright © 2561 kaidee. All rights reserved.
//

//Replace CucumberishExampleUITests with the name of your swift test target
#import "UITestingUITests-Swift.h"

__attribute__((constructor))
void CucumberishInit() {
  [CucumberishInitializer CucumberishSwiftInit];
}
