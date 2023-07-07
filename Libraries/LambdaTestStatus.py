# File is required to get the Status from LAMBDATEST and do something with it programmatically
# for example: Send an Email, when status==failes.
# see https://automation.lambdatest.com/


from robot.libraries.BuiltIn import BuiltIn

# to update test cases and names
# should be called from TearDown/close_browser
def report_lambdatest_status(name, status):
    selenium = BuiltIn().get_library_instance('SeleniumLibrary')
    # Mark test status pass/failed
    lambda_status = "passed"  if status=="PASS" else "failed"
    lambda_status_script = 'lambda-status={}'.format(lambda_status)
    selenium.execute_javascript(lambda_status_script)
    # Update test name
    lambda_status_script = 'lambda-name={}'.format(name)
    selenium.execute_javascript(lambda_status_script)



