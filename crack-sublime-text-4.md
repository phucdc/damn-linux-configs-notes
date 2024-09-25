# "Crack" Sublime Text 4

> Well, it is safe to do this on your system

All actions must be done with root/sudo privileges

Backup your `sublime_text` file (on Linux, it usually on `/opt/sublime_text/` directory):

```bash
cd /opt/sublime_text/
cp sublime_text sublime_text.bak
```

Time to edit some hex!

- For Sublime Text 4 build 4152

```bash
xxd -p sublime_text | sed 's/807805000f94c1/c64005014885c9/' | xxd -p -r > sublime_text
chmod +x sublime_text
```

- For Sublime Text 4 build 4180

```bash
sed -i 's/\x80\x79\x05\x00\x0F\x94\xC2/\xC6\x41\x05\x01\xB2\x00\x90/' /opt/sublime_text/sublime_text
```
