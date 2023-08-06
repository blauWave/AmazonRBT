from robot.api.deco import keyword
from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.firefox import GeckoDriverManager
from webdriver_manager.microsoft import IEDriverManager, EdgeChromiumDriverManager
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