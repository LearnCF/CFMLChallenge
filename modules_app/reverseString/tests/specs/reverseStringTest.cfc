/**
* The base model test case will use the 'model' annotation as the instantiation path
* and then create it, prepare it for mocking and then place it in the variables scope as 'model'. It is your
* responsibility to update the model annotation instantiation path and init your model.
*/
component extends="coldbox.system.testing.BaseModelTest" model="models.CFMLChallenge"{
	
	/*********************************** LIFE CYCLE Methods ***********************************/

	function beforeAll(){
		super.beforeAll();
		
		// setup the model
		super.setup();
		
		// init the model object
		model.init();
	}

	function afterAll(){
		super.afterAll();
	}

	/*********************************** BDD SUITES ***********************************/
	
	function run(){

		describe( "CFMLChallenge Suite", function(){

			it( "can be initialized", function() {
				expect( model ).toBeComponent( );
			});

			scenario( "Reverse Strings Challenge", function() {
				given( "that CFMLChallenge component exists", function(){
					when( "I call reverseString", function(){
						then( "the function will exist in the component", function() {
							expect( model ).toBeComponent();
							expect( structKeyExists( model, "reverseString" ) ).toBeTrue( "should have reverseString function" );
							// expect( function() { model.reverseString() } ).toNotThrow();
						});
					});

					when( "I fail to pass a string", function(){
						then( "I expect an error", function() {
							expect( function() { model.reverseString(); } ).toThrow( message = "should throw error because no argument defined." );
							expect( function() { model.reverseString( {} ); } ).toThrow( message ="should throw error because it's an invalid argument type." );
							expect( function() { model.reverseString( "cat" ); } ).notToThrow( message ="should not throw error because we passed a string!" );
						});
					});

					when( "I pass in a string", function(){
						then( "I will return the reverse of the string", function() {
							var myValues = [ {
								input = "bla",
								output = "alb"
							},{
								input = "cat",
								output = "tac"
							},{
								input = "Gavin",
								output = "nivag"
							},{
								input = "Michael",
								output = "leahcim"
							},{
								input = "✅😊🐙",
								output = "🐙😊✅"
							} ];

							for( var valueSet in myValues ){
								expect( model.reverseString( valueSet.input ) ).toBe( valueSet.output, "should return #valueSet.output# when #valueSet.input# is passed in" );
							}
						});
					});
				})
			});

		});

	}

}
