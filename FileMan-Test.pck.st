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
	^FmFileIOAccessor defaultDirectoryPath! !

!FmFileIOAccessorTest methodsFor: 'testing' stamp: 'mu 3/15/2007 11:15'!
testDirectoryExists
	"FmFileIOAccessorTest debug: #testDirectoryExists"
	| subDirString dirString |
	subDirString := 99999 atRandom asString.
	dirString := self defaultDirectoryPath, FmFileIOAccessor default slash, subDirString.

	FmFileIOAccessor default createDirectory: dirString.

	self should: [FmFileIOAccessor default directoryExists: dirString].
	self should: [FmFileIOAccessor default directoryExists: subDirString in: self defaultDirectoryPath].

	FmFileIOAccessor default deleteDirectory: dirString.

	self shouldnt: [FmFileIOAccessor default directoryExists: dirString].
	self shouldnt: [FmFileIOAccessor default directoryExists: subDirString in: self defaultDirectoryPath].! !

!FmFileManTest methodsFor: 'private' stamp: 'mu 11/6/2006 20:35'!
directoryEntryForTest
	^'./fmTestDir' asDirectoryEntry! !

!FmFileManTest methodsFor: 'private' stamp: 'mu 11/6/2006 20:29'!
randomFileName
	^100000 atRandom asString, '.fmtst'! !

!FmFileManTest methodsFor: 'testing' stamp: 'mu 3/15/2007 10:24'!
testAbsolutePath
	"FmFileManTest debug: #testAbsolutePath"
	| dirEntry dirEntry1 dirEntry2 dirEntry3 dirEntry4 |
	dirEntry := '/' asDirectoryEntry.
	self should: [dirEntry = ':' asDirectoryEntry].
	self should: [dirEntry = '\' asDirectoryEntry].
	
	dirEntry1 := '/temp/' asDirectoryEntry.
	self should: [dirEntry1 = ':temp' asDirectoryEntry].
	self should: [dirEntry1 = '\temp' asDirectoryEntry].

	dirEntry2 := '/temp/a' asDirectoryEntry.
	self should: [dirEntry2 = ':temp:a' asDirectoryEntry].
	self should: [dirEntry2 = '\temp\a' asDirectoryEntry].

	"Platform specific path tests"
	FmFileIOAccessor default onWindows ifTrue: [
	dirEntry3 := 'C:/temp/b' asDirectoryEntry.
	self should: [dirEntry3 = 'C:\temp\b' asDirectoryEntry].
	self should: [dirEntry3 = 'C::temp:b' asDirectoryEntry].
	].

	FmFileIOAccessor default onMac ifTrue: [
	dirEntry4 := 'Macintosh HD:tmp' asDirectoryEntry.
	self should: [dirEntry4 = 'Macintosh HD/tmp' asDirectoryEntry].
	self should: [dirEntry4 = 'Macintosh HD\tmp' asDirectoryEntry].
	].
	
	
	
	! !

!FmFileManTest methodsFor: 'testing' stamp: 'mu 11/6/2006 23:08'!
testAtPut
	"FmFileManTest debug: #testAtPut" 
	| dir bytes |
	dir := self directoryEntryForTest.
	dir at: 'test1' put: 'Hello'.
	self should: [(dir at: 'test1') = 'Hello'].
	self should: [dir includesKey: 'test1'].

	bytes := #(1 2 3 4 5 6) asByteArray.
	dir binaryAt: 'test2' put: bytes.
	self should: [(dir binaryAt: 'test2') = bytes].
	self should: [dir includesKey: 'test2'].

	dir removeKey: 'test1'.

	self shouldnt: [dir includesKey: 'test1'].

	dir recursiveDelete.
	self should: [dir exists not]! !

!FmFileManTest methodsFor: 'testing' stamp: 'mu 11/6/2006 23:17'!
testCopy
	"FmFileManTest debug: #testCopy" 
	| file1 file2 |
	file1 := self randomFileName asFileEntry.
	file2 := (file1 parent / self randomFileName) asFileEntry.

	file1 fileContents: 'This is a test'.

	self should: [file2 fileContents isEmpty].

	file1 copyTo: file2.

	self should: [file2 fileContents = 'This is a test'].

	file1 delete.
	file2 delete.
	self should: [file1 exists not].
	self should: [file2 exists not]
	
	
	! !

!FmFileManTest methodsFor: 'testing' stamp: 'mu 11/6/2006 20:33'!
testFileContents
	"FmFileManTest debug: #testFileContents" 
	| file1 file2 bytes |
	file1 := self randomFileName asFileEntry.
	file1 fileContents: 'This is a test'.
	self should: [file1 fileContents = 'This is a test'].
	file1 delete.
	self should: [file1 exists not].

	file2 := self randomFileName asFileEntry.
	bytes := #(1 2 3 4 5 6) asByteArray.
	file2 fileContents: bytes.
	self should: [file2 fileContents = bytes asString].
	self should: [file2 binaryContents = bytes].
	file2 delete.
	self should: [file2 exists not]! !

!FmFileManTest methodsFor: 'testing' stamp: 'mu 11/6/2006 23:27'!
testPipe
	"FmFileManTest debug: #testPipe" 
	| reverseFilter file1 file2 file3 |

	reverseFilter := [:in :out | out nextPutAll: (in upToEnd reverse)].

	file1 := self randomFileName asFileEntry.
	file2 := self randomFileName asFileEntry.
	file3 := self randomFileName asFileEntry.

	file1 fileContents: 'This is a pipe test'.

	file1 pipe: reverseFilter to: file2.

	self should: [('.' asDirectoryEntry at: file1 name) = 'This is a pipe test'].	
	self should: [(file2 fileContents) = 'tset epip a si sihT'].	
	self should: [(file3 fileContents) isEmpty].	

	file2 pipe: reverseFilter to: file3.
	self should: [(file3 fileContents) = 'This is a pipe test'].	

	file1 delete.
	file2 delete.
	file3 delete.
	self should: [file1 exists not].
	self should: [file2 exists not].
	self should: [file3 exists not]
	
	
	! !

!FmFileManTest methodsFor: 'testing' stamp: 'mu 3/19/2013 17:28'!
testRecursiveDelete
	"FmFileManTest debug: #testRecursiveDelete" 
	| dir |
	dir := ('./subDir' asDirectoryEntry / 'aaa\bbb' / 'ccc' / 'ddd\eee' / 'fff:ggg').
	dir at: 'test1' put: 'RecursiveDelete!!'.
	self should: [(dir at: 'test1') = 'RecursiveDelete!!'].

	dir removeKey: 'test1'.

	self shouldnt: [(dir / 'test1') exists].

	'./subDir' asDirectoryEntry recursiveDelete.
	self shouldnt: [dir exists].
	self shouldnt: ['./subDir' asDirectoryEntry exists].

	! !

!FmFileManTest methodsFor: 'testing' stamp: 'mu 11/15/2006 20:22'!
testRefresh
	"FmFileManTest debug: #testRefresh" 
	| file1 |
	file1 := self randomFileName asFileEntry.

	file1 fileContents: '1234567890'.
	self should: [file1 fileSize = 10].

	file1 fileContents: '123'.
	self should: [file1 fileSize = 3].
	

	file1 delete.
	self should: [file1 exists not].
	! !

!FmFileManTest methodsFor: 'testing' stamp: 'mu 11/15/2006 20:19'!
testRename
	"FmFileManTest debug: #testRename" 
	| file1 |
	file1 := self randomFileName asFileEntry.
	file1 fileContents: 'ToBeRenamed'.

	self shouldnt: [file1 name = 'newName1'].

	file1 rename: 'newName1'.

	self should: [file1 name = 'newName1'].
	self should: [file1 exists].

	self should: [file1 fileContents = 'ToBeRenamed'].

	file1 delete.
	self should: [file1 exists not].
	! !

!FmFileManTest methodsFor: 'testing' stamp: 'mu 3/3/2007 18:38'!
testRoot
	"FmFileManTest debug: #testRoot"
	| root |
	root := FmDirectoryEntry root.
	self should: [root pathComponents isEmpty].
	self should: [root = '\' asDirectoryEntry]. 
	self should: [root = ':' asDirectoryEntry]. 
	self should: [root = '/' asDirectoryEntry]. 
	
	! !

!FmFileManTest methodsFor: 'testing' stamp: 'mu 11/15/2006 20:15'!
testStream
	"FmFileManTest debug: #testStream" 
	| file1 contents formerContents allContents |
	file1 := self randomFileName asFileEntry.
	file1 writeStreamContents: [:str | str nextPutAll: 'HELLO!!'].
	contents := file1 readStreamContents: [:str | str upToEnd].
	self should: [contents = 'HELLO!!'].

	file1 appendStreamContents: [:str | str nextPutAll: 'AGAIN!!'].

	formerContents := file1 readStreamContents: [:str | str upTo:$!!].
	self should: [formerContents = 'HELLO'].

	allContents := file1 readStreamContents: [:str | str upToEnd].
	self should: [allContents = 'HELLO!!AGAIN!!'].

	file1 delete.
	self should: [file1 exists not].
	! !
