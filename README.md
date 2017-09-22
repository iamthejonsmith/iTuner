# iTuner
Final Commit

This is a simple iTunes music search application.

User is presented with a initial view utilizing a pickerView for Type of Search to be completed
User is presented with text field to enter search string

Once search is initiated on button press, Album Names, Track Names, Artist Names, and Album Artwork is retrieved using
iTunes API and displayed in a list view on the next page.

User is able to select a Song from the list view and the app will navigate to the next page where a Webview displays the lyrics.
Originally the app was designed to make use of the wikia.com lyric API, but this API is no longer available for loading lyrics. To circumvent this unforseen problem, and due to time constraints for a more elegant solution, the user is simply navigated to a web view displaying the lyrics from wikia.com for the selected song/artist

The iTunes data is retrieved using NSURLSession as a JSon Object and parsed using JSonSerialization.

Most color schemes are implemented in the appDelegate to ensure a solid design pattern and consistency through the application
