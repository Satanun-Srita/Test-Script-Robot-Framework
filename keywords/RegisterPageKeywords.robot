*** Settings ***
Library     SeleniumLibrary
Resource    CommonKeywords.robot

*** Variables ***
# คลังเก็บพิกัด (Locators) ของหน้าสมัครสมาชิก
${REG_HOME_REGISTER_BTN}       xpath=//button[contains(text(), 'สมัครสมาชิก')]
${REG_EMAIL_INPUT}             xpath=//input[@name='email']
${REG_FIRSTNAME_INPUT}         xpath=//input[@name='firstName']
${REG_LASTNAME_INPUT}          xpath=//input[@name='lastName']
${REG_PHONE_INPUT}             xpath=//input[@name='phoneNumber']
${REG_PASSWORD_INPUT}          xpath=//input[@name='newPassword']
${REG_CONFIRM_PASSWORD}        xpath=//input[@name='confirmPassword']
${REG_ACCEPT_TERM_CHKBX}       xpath=//input[@type='checkbox']
${REG_SUBMIT_BUTTON}           xpath=//button[@type='submit' and contains(text(), 'สมัครสมาชิก')]

*** Keywords ***
Click Register Button On Home Page
    Wait until element is ready then click element    ${REG_HOME_REGISTER_BTN}

Fill Registration Form
    [Arguments]    ${email}    ${firstname}    ${lastname}    ${phone}    ${password}                
    CommonKeywords.Wait until element is ready then input text    ${REG_EMAIL_INPUT}    ${email}
    CommonKeywords.Wait until element is ready then input text    ${REG_FIRSTNAME_INPUT}    ${firstname}
    CommonKeywords.Wait until element is ready then input text    ${REG_LASTNAME_INPUT}    ${lastname}
    CommonKeywords.Wait until element is ready then input text    ${REG_PHONE_INPUT}    ${phone}
    CommonKeywords.Wait until element is ready then input text    ${REG_PASSWORD_INPUT}    ${password}
    CommonKeywords.Wait until element is ready then input text    ${REG_CONFIRM_PASSWORD}    ${password}

Accept FutureSkill Terms And Conditions
    CommonKeywords.Wait until element is ready then click element    ${REG_ACCEPT_TERM_CHKBX}

Submit Registration Form
    CommonKeywords.Wait until element is ready then click element    ${REG_SUBMIT_BUTTON}

Verify OTP Message Is Displayed
    [Arguments]    ${message}
    CommonKeywords.Wait until page contains element then verify text    ${message}