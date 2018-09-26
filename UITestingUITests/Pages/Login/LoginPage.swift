//
//  LoginPage.swift
//  UITestingUITests
//
//  Created by Suraphan 'Rawd' Laokondee on 26/9/18.
//  Copyright © 2018 kaidee. All rights reserved.
//

import XCTest

class LoginPage: Page {

  // Find by ID
  private let usernameTextFieldID = "login.usernameTextField"
  private let passwordTextFieldID = "login.passwordTextField"

  private lazy var usernameTextField = findElement(.textField)[usernameTextFieldID]
  private lazy var passwordTextField = findElement(.secureTextField)[passwordTextFieldID]

  // Find by Text
  private lazy var loginButton = findElement(.button)["Login"]

  required init() {
  }

  @discardableResult func login(userName: String, password: String) -> LoginPage {
    tapElementAndWaitForKeyboardToAppear(element: usernameTextField)
    usernameTextField.typeText(userName)
    tapElementAndWaitForKeyboardToAppear(element: passwordTextField)
    passwordTextField.typeText(password)

    loginButton.tap()
    return self
  }

  func tapElementAndWaitForKeyboardToAppear(element: XCUIElement) {
    let keyboard = XCUIApplication().keyboards.element
    while (true) {
      element.tap()
      if keyboard.exists {
        break
      }
      RunLoop.current.run(until: NSDate(timeIntervalSinceNow: 0.5) as Date)
    }
  }
}
