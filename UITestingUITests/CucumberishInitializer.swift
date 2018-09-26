//
//  UITestingUITests.swift
//  UITestingUITests
//
//  Created by Suraphan 'Rawd' Laokondee on 15/8/2561 BE.
//  Copyright © 2561 kaidee. All rights reserved.
//

import Foundation
import Cucumberish

public class CucumberishInitializer: NSObject {
  @objc public class func CucumberishSwiftInit() {
    var application: XCUIApplication!

    beforeStart { () -> Void in
      //Any global initialization can go here
      application = XCUIApplication()
      LoginStepDefinition().setup(application)
    }

    before { (scenario) in
      application.launchArguments = ["--BypassOnboarding",
                                     "--BypassCoachMark",
                                     "--UITesting"]
      application.launch()
    }

    let bundle = Bundle(for: CucumberishInitializer.self)
    Cucumberish.executeFeatures(inDirectory: "Features", from: bundle, includeTags: nil, excludeTags: nil)
  }

  fileprivate class func getTags() -> [String]? {
    var itemsTags: [String]? = nil
    for i in ProcessInfo.processInfo.arguments {
      if i.hasPrefix("-Tags:") {
        let newItems = i.replacingOccurrences(of: "-Tags:", with: "")
        itemsTags = newItems.components(separatedBy: ",")
      }
    }
    return itemsTags
  }
}
