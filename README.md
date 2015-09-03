# FileMan for Cuis #

FileMan is a thin wrapper for various Smalltalk file libraries. It provides simple, portable interfaces for manipulating files and directories.

For more info, please see the Cypress repository:
[https://github.com/mumez/FileMan](https://github.com/mumez/FileMan)

## Installation ##

Note: From update 2353, FileMan has already been installed in Cuis-Smalltalk-Dev image.

Assuming Cuis 4.2 or higher.

Copy the 'Cuis-Smalltalk-FileMan' folder to your Cuis root folder.

Open the workspace, then do it:
````Smalltalk
	Feature require: 'FileMan-Core'.
	Feature require: 'FileMan-Squeak'.
	Feature require: 'FileMan-Adaptor-FileDirectory'.
	Feature require: 'FileMan-Test'. "optional"
	Feature require: 'FileMan-Example'. "optional"
````

If you've installed FileMan-Test, you can open "SUnit Test Runner" and see all-grean results.

## Limitation ##

FileMan originally provides text encode/decode API. Since Cuis currently only supports Latin-9, this API is disabled.


Enjoy!
___
Masashi Umezawa

