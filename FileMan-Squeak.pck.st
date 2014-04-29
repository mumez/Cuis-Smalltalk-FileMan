'From Cuis 4.2 of 25 July 2013 [latest update: #1969] on 29 April 2014 at 10:43:06.230681 pm'!
'Description Please enter a description for this package'!
!provides: 'FileMan-Squeak' 1 2!
!requires: 'FileMan-Core' 1 3 nil!
!classDefinition: #FmSqPortableUtil category: #'FileMan-Squeak'!
FmPortableUtil subclass: #FmSqPortableUtil
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FileMan-Squeak'!
!classDefinition: 'FmSqPortableUtil class' category: #'FileMan-Squeak'!
FmSqPortableUtil class
	instanceVariableNames: ''!


!FmSqPortableUtil class methodsFor: 'actions' stamp: 'mu 3/24/2013 00:47'!
addToStartUpList: aClass
	Smalltalk addToStartUpList: aClass! !

!FmSqPortableUtil class methodsFor: 'accessing' stamp: 'mu 3/24/2013 00:47'!
fileDoesNotExistException
	^FileDoesNotExistException! !

!FmSqPortableUtil class methodsFor: 'actions' stamp: 'mu 3/24/2013 00:47'!
removeFromStartUpList: aClass
	Smalltalk removeFromStartUpList: aClass! !

!FmSqPortableUtil class methodsFor: 'startUp' stamp: 'mu 3/26/2013 01:30'!
startUp
	FmFileIOAccessor onSystemStartUp ! !
