*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      chrome
${url}      https://www.google.com/
*** Test Cases ***
Open Main Page
    open browser    ${url}     ${browser}
    maximize browser window
    click button  xpath://button[@id='L2AGLb']
    input text  xpath://input[@class='gLFyf gsfi']  Best restaurant in lahti
    press keys  xpath://input[@class='gLFyf gsfi']  ENTER
    ${text1}=   get text  xpath:(//div[@class='dbg0pd'])[1]
    ${text2}=   get text  xpath:(//div[@class='dbg0pd'])[2]
    ${text3}=   get text  xpath:(//div[@class='dbg0pd'])[3]
    log to console  ${text1}
    log to console  ${text2}
    log to console  ${text3}
    close all browsers
