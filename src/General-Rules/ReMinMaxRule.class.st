"
The use of the messages #min: and #max: improves code readability and avoids heavily nested conditionals.

For example 

[[[ 
	a < b ifTrue: [a] ifFalse: [b]
]]]			

is transformed into 

[[[  
a min: b
]]]
			
		
"
Class {
	#name : 'ReMinMaxRule',
	#superclass : 'ReNodeRewriteRule',
	#category : 'General-Rules-Coding Idiom Violation',
	#package : 'General-Rules',
	#tag : 'Coding Idiom Violation'
}

{ #category : 'accessing' }
ReMinMaxRule class >> group [
	^ 'Coding Idiom Violation'
]

{ #category : 'accessing' }
ReMinMaxRule class >> rationale [
	^ 'The use of the messages #min: and #max: improves code readability and avoids heavily nested conditionals.'
]

{ #category : 'accessing' }
ReMinMaxRule class >> ruleName [
	^ 'Rewrite ifTrue:ifFalse: using min:/max:'
]

{ #category : 'accessing' }
ReMinMaxRule class >> uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"

	^'MinMaxRule'
]

{ #category : 'initialization' }
ReMinMaxRule >> initialize [
	super initialize.
	self
		replace: '``@a < ``@b ifTrue: [``@a] ifFalse: [``@b]' with: '``@a min: ``@b';
		replace: '``@a <= ``@b ifTrue: [``@a] ifFalse: [``@b]' with: '``@a min: ``@b';
		replace: '``@a > ``@b ifTrue: [``@a] ifFalse: [``@b]' with: '``@a max: ``@b';
		replace: '``@a >= ``@b ifTrue: [``@a] ifFalse: [``@b]' with: '``@a max: ``@b';
		replace: '``@a < ``@b ifTrue: [``@b] ifFalse: [``@a]' with: '``@a max: ``@b';
		replace: '``@a <= ``@b ifTrue: [``@b] ifFalse: [``@a]' with: '``@a max: ``@b';
		replace: '``@a > ``@b ifTrue: [``@b] ifFalse: [``@a]' with: '``@a min: ``@b';
		replace:  '``@a >= ``@b ifTrue: [``@b] ifFalse: [``@a]' with: '``@a min: ``@b';
		replace: '`a < ``@b ifTrue: [`a := ``@b]' with: '`a := `a max: ``@b';
		replace: '`a <= ``@b ifTrue: [`a := ``@b]' with: '`a := `a max: ``@b';
		replace: '`a < ``@b ifFalse: [`a := ``@b]' with: '`a := `a min: ``@b';
		replace: '`a <= ``@b ifFalse: [`a := ``@b]' with: '`a := `a min: ``@b';
		replace: '`a > ``@b ifTrue: [`a := ``@b]' with: '`a := `a min: ``@b';
		replace: '`a >= ``@b ifTrue: [`a := ``@b]' with: '`a := `a min: ``@b';
		replace: '`a > ``@b ifFalse: [`a := ``@b]' with: '`a := `a max: ``@b';
		replace: '`a >= ``@b ifFalse: [`a := ``@b]' with: '`a := `a max: ``@b';
		replace: '``@b < `a ifTrue: [`a := ``@b]' with: '`a := `a min: ``@b';
		replace: '``@b <= `a ifTrue: [`a := ``@b]' with: '`a := `a min: ``@b';
		replace: '``@b < `a ifFalse: [`a := ``@b]' with: '`a := `a max: ``@b';
		replace: '``@b <= `a ifFalse: [`a := ``@b]' with: '`a := `a max: ``@b';
		replace: '``@b > `a ifTrue: [`a := ``@b]' with: '`a := `a max: ``@b';
		replace: '``@b >= `a ifTrue: [`a := ``@b]' with: '`a := `a max: ``@b';
		replace: '``@b > `a ifFalse: [`a := ``@b]' with: '`a := `a min: ``@b';
		replace: '``@b >= `a ifFalse: [`a := ``@b]' with: '`a := `a min: ``@b'
]
