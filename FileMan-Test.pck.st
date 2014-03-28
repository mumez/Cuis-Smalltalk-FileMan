'From Cuis 4.2 of 25 July 2013 [latest update: #1969] on 26 March 2014 at 12:15:54.469578 pm'!
'Description Please enter a description for this package'!
!provides: 'FileMan-Test' 1 0!
!classDefinition: #FmFileIOAccessorTest category: #'FileMan-Test'!
TestCase subclass: #FmFileIOAccessorTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FileMan-Test'!
!classDefinition: 'FmFileIOAccessorTest class' category: #'FileMan-Test'!
FmFileIOAccessorTest class
	instanceVariableNames: ''!

!classDefinition: #FmFileManTest category: #'FileMan-Test'!
TestCase subclass: #FmFileManTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FileMan-Test'!
!classDefinition: 'FmFileManTest class' category: #'FileMan-Test'!
FmFileManTest class
	instanceVariableNames: ''!


!FmFileManTest commentStamp: 'mu 5/16/2007 21:01' prior: 0!
FmFileManTest suite run!

!FmFileIOAccessorTest methodsFor: 'private' stamp: 'mu 3/15/2007 11:10'!
defaultDirectoryPath

!FmFileIOAccessorTest methodsFor: 'testing' stamp: 'mu 3/15/2007 11:15'!
testDirectoryExists

!FmFileManTest methodsFor: 'private' stamp: 'mu 11/6/2006 20:35'!
directoryEntryForTest

!FmFileManTest methodsFor: 'private' stamp: 'mu 11/6/2006 20:29'!
randomFileName

!FmFileManTest methodsFor: 'testing' stamp: 'mu 3/15/2007 10:24'!
testAbsolutePath

!FmFileManTest methodsFor: 'testing' stamp: 'mu 11/6/2006 23:08'!
testAtPut

!FmFileManTest methodsFor: 'testing' stamp: 'mu 11/6/2006 23:17'!
testCopy

!FmFileManTest methodsFor: 'testing' stamp: 'mu 11/6/2006 20:33'!
testFileContents

!FmFileManTest methodsFor: 'testing' stamp: 'mu 11/6/2006 23:27'!
testPipe

!FmFileManTest methodsFor: 'testing' stamp: 'mu 3/19/2013 17:28'!
testRecursiveDelete

!FmFileManTest methodsFor: 'testing' stamp: 'mu 11/15/2006 20:22'!
testRefresh

!FmFileManTest methodsFor: 'testing' stamp: 'mu 11/15/2006 20:19'!
testRename

!FmFileManTest methodsFor: 'testing' stamp: 'mu 3/3/2007 18:38'!
testRoot

!FmFileManTest methodsFor: 'testing' stamp: 'mu 11/15/2006 20:15'!
testStream