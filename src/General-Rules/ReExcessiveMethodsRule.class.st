"
This smell arises when a large class is found (with 40 or more methods). Large classes are indications that it has too much responsibility. Try to break it down, and reduce the size to something manageable. The defined number of methods can be edit in RBExcessiveMethodsRule>>methodsCount.

A good design assigns one responsibility to a class. Ask yourself, ""what is the key responsibility of this class?"" Using the strategy design pattern may be a solution to structure and delegate some behavior. 

An indication that a class may have too many responsibilities is when different groups of methods access a subpart of the instance variables. In a large system, having some large classes is often inevitable; but when there are more than a couple of large classes, you should really reconsider your design. 
	
The defined number of methods can be edited in #methodsCount.
"
Class {
	#name : 'ReExcessiveMethodsRule',
	#superclass : 'ReAbstractRule',
	#category : 'General-Rules-Design Flaws',
	#package : 'General-Rules',
	#tag : 'Design Flaws'
}

{ #category : 'testing' }
ReExcessiveMethodsRule class >> checksClass [
	^ true
]

{ #category : 'accessing' }
ReExcessiveMethodsRule class >> group [
	^ 'Design Flaws'
]

{ #category : 'accessing' }
ReExcessiveMethodsRule class >> rationale [
	^ 'Large classes are indications that the class may be trying to do too much.'
]

{ #category : 'accessing' }
ReExcessiveMethodsRule class >> ruleName [
	^ 'Excessive number of methods'
]

{ #category : 'accessing' }
ReExcessiveMethodsRule class >> uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"

	^'ExcessiveMethodsRule'
]

{ #category : 'running' }
ReExcessiveMethodsRule >> basicCheck: aClass [
	^ aClass selectors size >= self methodsCount
]

{ #category : 'private' }
ReExcessiveMethodsRule >> methodsCount [
	^ 60
]
