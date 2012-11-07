Set UAC = CreateObject("Shell.Application")
UAC.ShellExecute "perl", "AdBlockUpdate.pl", "", "runas", 1