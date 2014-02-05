InAppFeedback-Sample-Code
=========================

This is a simple example project showing how to send in-app user feedback via a PHP script located on your own webserver. 

In this example, we POST the following variables to the feedback.php file:

- Whether the user likes the app
- A user-written message
- User's e-mail address
- Version information

Once the feedback is sent, an e-mail is dispatched from your webserver via the php file. This example also prompts the user to review the app in the App Store if they like the app. 


## Things that have to be done

1. Change the e-mail address in the feedback.php file to match your own.
2. Upload the feedback.php to your own webserver.
3. Inside ViewController.m change the URL string to *your* own server.


    NSURL *url = [NSURL URLWithString:@"http://www.yourdomain.com/feedback.php"];