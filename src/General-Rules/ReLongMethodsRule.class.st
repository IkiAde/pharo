"
This smell arises when a long method is found with meny statements. Note that, it counts statements, not lines. Long methods should often be split into several smaller ones. 

Long methods should often be split into several smaller ones. When you start to need an empty line to separate groups of statements, this is an indication that you should probably define a new method. 
	
Do not forget that methods are points of extension in an object-oriented language. It means that each time you define a method, a subclass may override and extend it while taking advantage and reusing the calling context of your method. This is the basis for the Hook and Template Design Pattern and central to good object-oriented design. So keep your methods short. 

Use the extract method refactoring, which even checks whether the method you are extracting already exists in the class. 
	
The defined number of statements can be edited in #longMethodSize. In the future such rule should hold state and not be based on method redefinition for its customization. 
"
Class {
	#name : 'ReLongMethodsRule',
	#superclass : 'ReAbstractRule',
	#category : 'General-Rules-Design Flaws',
	#package : 'General-Rules',
	#tag : 'Design Flaws'
}

{ #category : 'testing' }
ReLongMethodsRule class >> checksMethod [
	^ true
]

{ #category : 'accessing' }
ReLongMethodsRule class >> group [
	^ 'Design Flaws'
]

{ #category : 'private' }
ReLongMethodsRule class >> longMethodSize [
	^ 20
]

{ #category : 'accessing' }
ReLongMethodsRule class >> rationale [
	^ 'This smell arises when a long method is found (with {1} or more statements). Note that, it counts statements, not lines. Long methods should often be split into several smaller ones.

Long methods should often be split into several smaller ones. When you start to need an empty line to separate groups of statements, this is an indication that you should probably define a new method.

Do not forget that methods are points of extension in an object-oriented language. It means that each time you define a method, a subclass may override and extend it while taking advantage and reusing the calling context of your method. This is the basis for the Hook and Template Design Pattern and central to good object-oriented design. So keep your methods short.

Use the extract method refactoring, which even checks whether the method you are extracting already exists in the class.

The defined number of statements can be edited in #longMethodSize. In the future such rule should hold state and not be based on method redefinition for its customization. '
	format: { self longMethodSize }
]

{ #category : 'accessing' }
ReLongMethodsRule class >> ruleName [
	^ 'Long methods'
]

{ #category : 'accessing' }
ReLongMethodsRule class >> uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"

	^'LongMethodsRule'
]

{ #category : 'running' }
ReLongMethodsRule >> basicCheck: aMethod [
	| numberOfStatements |
	"long methods are no problem for tests"
	aMethod isTestMethod ifTrue: [ ^false ].
	numberOfStatements := 0.

	aMethod ast
		nodesDo: [ :node |
			node isSequence
				ifTrue: [ numberOfStatements := numberOfStatements + node statements size.
					numberOfStatements >= self longMethodSize ifTrue: [ ^ true ] ] ].
	^ false
]

{ #category : 'private' }
ReLongMethodsRule >> longMethodSize [
	^ self class longMethodSize
]
