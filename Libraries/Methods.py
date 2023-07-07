# this file contains methods, that can be used in all test-files.
# the methods should be written generic, to be re-used everywhere.
# it is like a collection of helpers.
# methods are defined with the "def" keyword. And the methodname must not contain spaces, but underscore instead.

# @fixme pywinauto funktioniert nicht auf macOS.
# from pywinauto.application import Application

from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn
from robot.utils import Application


@library
class Methods:
    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    # currently only required in eBGV/local_windows_notepad Suite. It will open Notepad.exe, write text in the window and close it.
    # See also https://github.com/microsoft/WinAppDriver/blob/master/Docs/AuthoringTestScripts.md
    @keyword
    def write_text_in_notepad_app(self, text):
        app = Application(backend="uia").start("notepad.exe").connect(title="Unbenannt - Editor", timeout=100)
        app.UnbenanntEditor.type_keys(text, with_spaces=True)
        closeButton = app.UnbenanntEditor.child_window(title="Schließen", control_type="Button")
        closeButton.click_input()
        nichtSpeichern = app.UnbenannteEditor.child_window(title="Nicht speichern", auto_id="CommandButton_7", control_type="Button")
        nichtSpeichern.click_input()


    # für eBGV DEV-Umgebung
    @keyword
    def login_with_username_and_password(self, username, password):
        self.selLib.input_text("id:j_username_form", username)
        self.selLib.input_text("id:j_password_form", password)
        self.selLib.click_element("xpath://*[@id='form-login-submit']/td[1]/input[4]")

    @keyword
    def User_fill_given_inputs_field_with_given_values_one_by_one(self, listInput, listValue):
        for i in range(len(listInput)):
            self.selLib.wait_until_element_is_visible("xpath://*[@id='id-input-" + listInput[i] + "']")
            self.selLib.clear_element_text("xpath://*[@id='id-input-" + listInput[i] + "']")
            self.selLib.input_text("xpath://*[@id='id-input-" + listInput[i] + "']", listValue[i])

    @keyword
    def select_from_dropdown_list_by_idName_and_value(self, idName, value):
        return self.selLib.select_from_list_by_value("id:" + idName + "", value)
        # return self.selLib.select_from_list_by_value("id:id-input-" + idName + "", value)

    @keyword
    def user_click_continue_button(self):
        self.selLib.wait_until_element_is_visible("id:default-button")
        self.selLib.click_button("id:default-button")

    # öffnet die Formular-Übersichtsseite
    @keyword
    def open_forms_live_page(self):
        self.selLib.wait_until_element_is_visible("id:default-button")
        self.selLib.click_button("id:default-button")


    # für FMS Test-Umgebung von aussen
    @keyword
    def login_fms_test_env(self, username, password):
        self.selLib.input_text("id:username", username)
        self.selLib.input_text("id:password", password)
        self.selLib.click_element("id:kc-login")

    @keyword
    def close_driver(self, text):
        self.write_text(text)

    @keyword
    def contains_text(self, text, subtext):
        return BuiltIn().should_contain(text, subtext)