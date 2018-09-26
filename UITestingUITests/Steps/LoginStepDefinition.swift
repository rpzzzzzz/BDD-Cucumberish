//
//  LoginStepDefinetion.swift
//  UITestingUITests
//
//  Created by Suraphan 'Rawd' Laokondee on 26/9/18.
//  Copyright © 2018 kaidee. All rights reserved.
//

import XCTest
import Cucumberish

class LoginStepDefinition: NSObject {
  var application: XCUIApplication!

  func setup(_ application: XCUIApplication) {
    self.application = application

    Given("the user on login page") { (args, userInfo) -> Void in
    }

    When("the user logs in") { (args, userInfo) -> Void in
      LoginPage().login(userName: "gucode", password: "StrongestPasswordIntheWorld")
    }

    Then("the user should see Hi Gu Code!!!!!") { (args, userInfo) -> Void in
      MainPage().checkGreetingMessage()
    }
  }

  class func setup(_ application: XCUIApplication) {
    LoginStepDefinition().setup(application)
  }
}
