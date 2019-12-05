<?php
 
//Change the e-mail address (Line 24) & place this file on your webserver.
//For example: http://test/feedback.php
//Then post data to it.
 
// Retrieve variables
$feedbackResult = $_POST['feedbackResult'];
$feedbackMessage = $_POST['feedbackMessage'];
$feedbackSender = $_POST['feedbackSender'];
$feedbackIsPRO = $_POST['feedbackIsPRO'];
$feedbackVersion = $_POST['feedbackVersion'];
 
// Trim 'em
$feedbackResult = trim($feedbackResult);
$feedbackMessage = trim($feedbackMessage);
$feedbackSender = trim($feedbackSender);
$feedbackIsPRO = trim($feedbackIsPRO);
$feedbackVersion  = trim($feedbackVersion);
 
// Prepare the subject line and message
$subject = "In-app Feedback"; 
$message = "Rating: $feedbackResult \r Sender: $feedbackSender \r Message: $feedbackMessage \r Pro User: $feedbackIsPRO \r Version: $feedbackVersion";
  mail('contact@your-email-here.com', $subject,$message) or "bad";
 
?>