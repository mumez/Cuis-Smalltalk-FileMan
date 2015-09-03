'From Cuis 4.2 of 25 July 2013 [latest update: #2463] on 3 September 2015 at 10:27:57.268306 pm'!
'Description Please enter a description for this package'!
!provides: 'FileMan-Squeak' 1 4!
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

!FmSqPortableUtil class methodsFor: 'startUp' stamp: 'mu 9/3/2015 22:27'!
startUp
	FmFileIOAccessor onSystemStartUp! !
