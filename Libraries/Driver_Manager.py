from robot.api.deco import keyword
from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.firefox import GeckoDriverManager
from webdriver_manager.microsoft import IEDriverManager, EdgeChromiumDriverManager
# funktioniert nicht auf Windows-Server, weil  cannot import name 'EdgeChromiumDriverManager' from 'webdriver_manager.microsoft' (C:\Users\WD10012\AppData\Roaming\Python\Python310\site-packages\webdriver_manager\microsoft.py)
# from webdriver_manager.microsoft import EdgeChromiumDriverManager
from webdriver_manager.opera import OperaDriverManager

@keyword
def Get_Driver_Path(browser):
    if browser == "Chrome":
        driver_path = ChromeDriverManager().install()
        print(driver_path)
        return driver_path
    elif browser == "Firefox":
        driver_path = GeckoDriverManager().install()
        return driver_path
    elif browser == "Edge":
        driver_path = EdgeChromiumDriverManager().install()
        return driver_path
    # @fixme
    elif browser == "Ie":
        driver_path = IEDriverManager().install()
        return driver_path
    # @fixme
    elif browser == "Opera":
        driver_path = OperaDriverManager().install()
        return driver_path