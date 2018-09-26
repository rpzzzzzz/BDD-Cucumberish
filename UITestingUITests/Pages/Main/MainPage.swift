//
//  MainPage.swift
//  UITestingUITests
//
//  Created by Suraphan 'Rawd' Laokondee on 26/9/18.
//  Copyright © 2018 kaidee. All rights reserved.
//

import XCTest
import Cucumberish

class MainPage: Page {
  private lazy var greetingLabel = findElement(.staticText)["Hi Gu Code!!!!!"]

  required init() {
  }

  @discardableResult func checkGreetingMessage() -> MainPage {
    CCISAssert(greetingLabel.exists, "Greeting Message should be displayed")
    return self
  }
}
