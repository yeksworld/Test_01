*** Settings ***
Library     RPA.Email.ImapSmtp   smtp_server=smtp.gmail.com  smtp_port=587


*** Variables ***
${GMAIL_ACCOUNT}        ricardoyek@gmail.com
${GMAIL_PASSWORD}       19941903
${RECIPIENT_ADDRESS}    yunus.kilinc@etteplan.com
${BODY_IMG1}            ${IMAGEDIR}${/}approved.png
${BODY_IMG2}            ${IMAGEDIR}${/}invoice.png
${EMAIL_BODY}     <h1>Heading</h1><p>Status: <img src='approved.png' alt='approved image'/></p>
...               <p>INVOICE: <img src='invoice.png' alt='invoice image'/></p>

*** Tasks ***
Sending email
    Authorize  account=${GMAIL_ACCOUNT} and password=${GMAIL_PASSWORD}
    Send Message  sender=${GMAIL_ACCOUNT}
    ...           recipients=${RECIPIENT_ADDRESS}
    ...           subject=Message from RPA Robot
    ...           body=RPA Robot message body

Sending HTML Email With Image
    [Documentation]     Sending email with HTML content and attachment
    Send Message
    ...                 sender=${GMAIL_ACCOUNT}
    ...                 recipients=${RECIPIENT_ADDRESS}
    ...                 subject=HTML email with body images (2) plus one attachment
    ...                 body=${EMAIL_BODY}
    ...                 html=${TRUE}
    ...                 images=${BODY_IMG1}, ${BODY_IMG2}
    ...                 attachments=example.png