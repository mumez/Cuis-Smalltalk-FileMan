'From Cuis 4.2 of 25 July 2013 [latest update: #1969] on 26 March 2014 at 12:15:52.190578 pm'!
'Description Please enter a description for this package'!
!provides: 'FileMan-Example' 1 0!
!classDefinition: #FmBackgroundDirectoryEntry category: #'FileMan-Example'!
FmDirectoryEntry subclass: #FmBackgroundDirectoryEntry
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FileMan-Example'!
!classDefinition: 'FmBackgroundDirectoryEntry class' category: #'FileMan-Example'!
FmBackgroundDirectoryEntry class
	instanceVariableNames: ''!

!classDefinition: #FmBackupDirectoryEntry category: #'FileMan-Example'!
FmDirectoryEntry subclass: #FmBackupDirectoryEntry
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FileMan-Example'!
!classDefinition: 'FmBackupDirectoryEntry class' category: #'FileMan-Example'!
FmBackupDirectoryEntry class
	instanceVariableNames: ''!

!classDefinition: #FmGZipDirectoryEntry category: #'FileMan-Example'!
FmDirectoryEntry subclass: #FmGZipDirectoryEntry
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FileMan-Example'!
!classDefinition: 'FmGZipDirectoryEntry class' category: #'FileMan-Example'!
FmGZipDirectoryEntry class
	instanceVariableNames: ''!


!FmBackgroundDirectoryEntry commentStamp: '<historical>' prior: 0!
This is a simple example for adding special behaviors to FmDirectoryEntry.

!FmBackupDirectoryEntry commentStamp: 'mu 5/4/2007 23:26' prior: 0!
This is a simple example for adding special behaviors to FmDirectoryEntry.

!FmGZipDirectoryEntry commentStamp: 'mu 3/29/2009 23:56' prior: 0!
This is a simple example for adding special behaviors to FmDirectoryEntry.

!FmBackgroundDirectoryEntry methodsFor: 'dictionary-like' stamp: 'mu 3/10/2008 15:29'!
at: localFileName put: contents 

!FmBackgroundDirectoryEntry methodsFor: 'dictionary-like' stamp: 'mu 3/27/2007 15:53'!
at: localFileName putBackground: contents 

!FmBackupDirectoryEntry methodsFor: 'dictionary-like' stamp: 'mu 5/4/2007 19:06'!
at: localFileName put: contents 

!FmBackupDirectoryEntry methodsFor: 'dictionary-like-backup' stamp: 'mu 5/4/2007 19:08'!
backupAt: localFileName

!FmBackupDirectoryEntry methodsFor: 'dictionary-like-backup' stamp: 'mu 5/4/2007 19:09'!
backupBinaryAt: localFileName

!FmBackupDirectoryEntry methodsFor: 'dictionary-like' stamp: 'mu 5/4/2007 19:07'!
binaryAt: localFileName put: contents 

!FmBackupDirectoryEntry class methodsFor: 'factory' stamp: 'mu 5/4/2007 19:04'!
directoryEntryClass

!FmBackupDirectoryEntry class methodsFor: 'factory' stamp: 'mu 5/4/2007 23:16'!
fileEntryClass

!FmGZipDirectoryEntry methodsFor: 'private' stamp: 'mu 5/4/2007 17:04'!
asSuffixedName: localFileName

!FmGZipDirectoryEntry methodsFor: 'dictionary-like' stamp: 'mu 5/4/2007 17:05'!
at: localFileName

!FmGZipDirectoryEntry methodsFor: 'dictionary-like' stamp: 'mu 5/4/2007 17:05'!
at: localFileName put: contents 

!FmGZipDirectoryEntry methodsFor: 'dictionary-like' stamp: 'mu 5/4/2007 17:06'!
binaryAt: localFileName

!FmGZipDirectoryEntry methodsFor: 'dictionary-like' stamp: 'mu 5/4/2007 17:06'!
binaryAt: localFileName put: contents 

!FmGZipDirectoryEntry methodsFor: 'private' stamp: 'mu 3/29/2009 23:55'!
contentsOf: aStream by: ignore

!FmGZipDirectoryEntry methodsFor: 'dictionary-like' stamp: 'mu 5/4/2007 17:31'!
includesKey: fileName

!FmGZipDirectoryEntry methodsFor: 'dictionary-like' stamp: 'mu 5/4/2007 17:31'!
removeKey: localFileName ifAbsent: failBlock

!FmGZipDirectoryEntry methodsFor: 'private' stamp: 'mu 3/29/2009 23:55'!
setContentsOf: aStream to: aStringOrBytes by: ignore

!FmGZipDirectoryEntry methodsFor: 'defaults' stamp: 'mu 5/4/2007 16:49'!
textConverterClass

!FmGZipDirectoryEntry class methodsFor: 'factory' stamp: 'mu 5/4/2007 18:58'!
directoryEntryClass

!FmGZipDirectoryEntry class methodsFor: 'factory' stamp: 'mu 5/4/2007 23:22'!
fileEntryClass