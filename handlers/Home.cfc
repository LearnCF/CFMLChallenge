/**
 * A ColdBox Event Handler
 */
component{

	/**
	 * Home page
	 */
	function index( event, rc, prc ){

		prc.challenges = [{
			name: "Reverse String",
			runnerURL: "/modules/CFMLChallenge/modules_app/reverseString/tests/runner.cfm",
			description: "Learn how to reverse a string in CFML!",
			instructions: "Create a reverseString.cfc in your models folder, add reverseString() function which reverses a string..."
		}];

		var testURL = "http://#CGI.SERVER_NAME#:#CGI.SERVER_PORT#/modules/CFMLChallenge/tests/runner.cfm?reporter=json";
		var testResults = getInstance( "HyperBuilder@hyper" ).get( testURL );
		if ( testResults.isError() ){
			writeOutput( testResults.getData() );
			abort;
		}
		prc.testStats = DeSerializeJSON( testResults.getData() );

		event.setView( view = "home/index", layout = "Main" );
	}

}
