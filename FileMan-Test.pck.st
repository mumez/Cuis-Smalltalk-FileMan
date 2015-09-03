'From Cuis 4.2 of 25 July 2013 [latest update: #2463] on 4 September 2015 at 12:48:23.058005 am'!
'Description Please enter a description for this package'!
!provides: 'FileMan-Test' 1 4!
!requires: 'FileMan-Core' 1 3 nil!
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

!FmFileManTest methodsFor: 'testing' stamp: 'jmv 6/6/2015 23:23'!
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

	dirEntry3 := 'C:/temp/b' asDirectoryEntry.
	self should: [dirEntry3 = 'C:\temp\b' asDirectoryEntry].
	self should: [dirEntry3 = 'C::temp:b' asDirectoryEntry].

	"Platform specific path tests"
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

!FmFileManTest methodsFor: 'testing' stamp: 'jmv 6/6/2015 19:49'!
testConcatenation
	"
	FmFileManTest debug: #testConcatenation
	"
	| dir |
	dir := ('./subDir' asDirectoryEntry / 'aaa/bbb' / 'ccc' / 'ddd\eee' / 'fff:ggg').
	dir at: 'test1' put: 'RecursiveDeleted!!'.

	self assert: dir name = 'ggg'.
	self assert: dir parent name = 'fff'.
	self assert: dir parent parent name = 'eee'.
	self assert: dir parent parent parent name = 'ddd'.
	self assert: dir parent parent parent parent name = 'ccc'.
	self assert: dir parent parent parent parent parent name = 'bbb'.
	self assert: dir parent parent parent parent parent parent name = 'aaa'.

	'./subDir' asDirectoryEntry recursiveDelete.
	self shouldnt: [dir exists].
	self shouldnt: ['./subDir' asDirectoryEntry exists].! !

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

!FmFileManTest methodsFor: 'testing' stamp: 'jmv 6/6/2015 23:05'!
testDefaultDirectory
	"
	FmFileManTest debug: #testDefaultDirectory
	"
	
	| pathComponents |

	self assert: '' asDirectoryEntry =  FmDirectoryEntry default.

	pathComponents := '' asDirectoryEntry pathComponents.
	self assert: pathComponents = FmDirectoryEntry default pathComponents! !

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

!FmFileManTest methodsFor: 'testing' stamp: 'jmv 6/6/2015 23:21'!
testIsAbsolutePathName
	"
	FmFileManTest debug: #testIsAbsolutePathName
	"
	self assert: '/' isAbsolutePathName.
	self assert: '/temp/' isAbsolutePathName.
	self assert: '/temp/a' isAbsolutePathName.
	self assert: 'C:/temp/b' isAbsolutePathName.
"	self assert: 'Macintosh HD/tmp' isAbsolutePathName."
	
	self deny: './' isAbsolutePathName.
	self deny: '../' isAbsolutePathName.
	self deny: 'afile' isAbsolutePathName.! !

!FmFileManTest methodsFor: 'testing' stamp: 'jmv 6/6/2015 23:20'!
testIsRelativePathName
	"
	FmFileManTest debug: #testIsRelativePathName
	"
	self assert: './' isRelativePathName.
	self assert: '../' isRelativePathName.
"	self assert: 'afile' isRelativePathName."
	self deny: '/' isRelativePathName.
	self deny: '/temp/' isRelativePathName.
	self deny: '/temp/a' isRelativePathName.
	self deny: 'C:/temp/b' isRelativePathName.
	self deny: 'Macintosh HD/tmp' isRelativePathName.! !

!FmFileManTest methodsFor: 'testing' stamp: 'jmv 6/6/2015 22:03'!
testPathComponents
	"
	FmFileManTest debug: #testPathComponents
	"
	| pathComponents |

	pathComponents := './aaa/bbb\ccc:ddd' asDirectoryEntry pathComponents.
	pathComponents := pathComponents last: 4.
	self assert: pathComponents asArray = #('aaa' 'bbb' 'ccc' 'ddd').

	pathComponents := '/aaa/bbb\ccc:ddd' asDirectoryEntry pathComponents.
	pathComponents := pathComponents last: 4.
	self assert: pathComponents asArray = #('aaa' 'bbb' 'ccc' 'ddd').

	pathComponents := 'aaa/bbb\ccc:ddd' asDirectoryEntry pathComponents.
	pathComponents := pathComponents last: 4.
	self assert: pathComponents asArray = #('aaa' 'bbb' 'ccc' 'ddd')! !

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

!FmFileManTest methodsFor: 'testing' stamp: 'mu 9/4/2015 00:46'!
testTryReadStream
	"FmFileManTest debug: #testTryReadStream" 
	| file1 readStream |
	file1 := self randomFileName asFileEntry.
	self deny: (file1 exists).

	self should: [readStream := file1 tryReadStream] raise: FmFileIOAccessor fileDoesNotExistException.
	self deny: (file1 exists).
	self assert: (readStream isNil).
	
	readStream := file1 readStreamIfError: [:ex | 'NotExist'].
	
	self assert: (readStream = 'NotExist').
	self deny: (file1 exists).

	file1 assureExistence.
	self assert: (file1 exists).
	
	readStream := file1 readStreamIfError: [:ex | 'NotExist'].
	self deny: (readStream = 'NotExist').
	
	self assert: (readStream contents isEmpty).
	readStream close.
	
	file1 delete.
	self deny: (file1 exists).
	
	
	! !

!FmFileManTest methodsFor: 'testing' stamp: 'mu 9/4/2015 00:44'!
testTryWriteStream
	"FmFileManTest debug: #testTryWriteStream" 
	| file1 writeStream |
	file1 := self randomFileName asFileEntry assureExistence.
	self assert: (file1 exists).

	self should: [writeStream := file1 tryWriteStream] raise: FmFileIOAccessor fileExistsException.
	self assert: (file1 exists).
	self assert: (writeStream isNil).
	
	writeStream := file1 writeStreamIfError: [:ex | 'Exists'].
	
	self assert: (writeStream = 'Exists').
	self assert: (file1 exists).
	
	file1 delete.
	self deny: (file1 exists).
	
	writeStream := file1 writeStreamIfError: [:ex | 'Exists'].
	self deny: (writeStream = 'Exists').
	writeStream nextPutAll: 'Test'; close.
	
	self assert: (file1 textContents = 'Test').
	
	file1 delete.
	self deny: (file1 exists).
	
	
	! !
