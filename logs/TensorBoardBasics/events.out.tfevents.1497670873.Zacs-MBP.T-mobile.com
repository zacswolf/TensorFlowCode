       ŁK"	  @6)QÖAbrain.Event:2ˇŹ
ü      q-Ť	NG}6)QÖA"ďĄ
`
truncated_normal/shapeConst*
dtype0*
valueB:d*
_output_shapes
:
Z
truncated_normal/meanConst*
dtype0*
valueB
 *    *
_output_shapes
: 
\
truncated_normal/stddevConst*
dtype0*
valueB
 *ÍĚĚ=*
_output_shapes
: 

 truncated_normal/TruncatedNormalTruncatedNormaltruncated_normal/shape*
dtype0*
seed2 *

seed *
T0*
_output_shapes
:d
{
truncated_normal/mulMul truncated_normal/TruncatedNormaltruncated_normal/stddev*
T0*
_output_shapes
:d
i
truncated_normalAddtruncated_normal/multruncated_normal/mean*
T0*
_output_shapes
:d
J
mul/yConst*
dtype0*
valueB
 *ÍĚĚ=*
_output_shapes
: 
H
mulMultruncated_normalmul/y*
T0*
_output_shapes
:d
J
add/yConst*
dtype0*
valueB
 *>*
_output_shapes
: 
;
addAddmuladd/y*
T0*
_output_shapes
:d

initNoOp
b
truncated_normal_1/shapeConst*
dtype0*
valueB:d*
_output_shapes
:
\
truncated_normal_1/meanConst*
dtype0*
valueB
 *    *
_output_shapes
: 
^
truncated_normal_1/stddevConst*
dtype0*
valueB
 *ÍĚĚ=*
_output_shapes
: 

"truncated_normal_1/TruncatedNormalTruncatedNormaltruncated_normal_1/shape*
dtype0*
seed2 *

seed *
T0*
_output_shapes
:d

truncated_normal_1/mulMul"truncated_normal_1/TruncatedNormaltruncated_normal_1/stddev*
T0*
_output_shapes
:d
o
truncated_normal_1Addtruncated_normal_1/multruncated_normal_1/mean*
T0*
_output_shapes
:d
L
mul_1/yConst*
dtype0*
valueB
 *ÍĚĚ=*
_output_shapes
: 
L
mul_1Multruncated_normalmul_1/y*
T0*
_output_shapes
:d
L
add_1/yConst*
dtype0*
valueB
 *>*
_output_shapes
: 
A
add_1Addmul_1add_1/y*
T0*
_output_shapes
:d
^
random_uniform/shapeConst*
dtype0*
valueB:*
_output_shapes
:
W
random_uniform/minConst*
dtype0*
valueB
 *  ż*
_output_shapes
: 
W
random_uniform/maxConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 

random_uniform/RandomUniformRandomUniformrandom_uniform/shape*
dtype0*
seed2 *

seed *
T0*
_output_shapes
:
b
random_uniform/subSubrandom_uniform/maxrandom_uniform/min*
T0*
_output_shapes
: 
p
random_uniform/mulMulrandom_uniform/RandomUniformrandom_uniform/sub*
T0*
_output_shapes
:
b
random_uniformAddrandom_uniform/mulrandom_uniform/min*
T0*
_output_shapes
:
t
Variable
VariableV2*
dtype0*
shape:*
	container *
shared_name *
_output_shapes
:

Variable/AssignAssignVariablerandom_uniform*
validate_shape(*
_class
loc:@Variable*
use_locking(*
T0*
_output_shapes
:
e
Variable/readIdentityVariable*
_class
loc:@Variable*
T0*
_output_shapes
:
R
zerosConst*
dtype0*
valueB*    *
_output_shapes
:
v

Variable_1
VariableV2*
dtype0*
shape:*
	container *
shared_name *
_output_shapes
:

Variable_1/AssignAssign
Variable_1zeros*
validate_shape(*
_class
loc:@Variable_1*
use_locking(*
T0*
_output_shapes
:
k
Variable_1/readIdentity
Variable_1*
_class
loc:@Variable_1*
T0*
_output_shapes
:
T
mul_2MulVariable/readtruncated_normal_1*
T0*
_output_shapes
:d
I
add_2Addmul_2Variable_1/read*
T0*
_output_shapes
:d
=
subSubadd_2add_1*
T0*
_output_shapes
:d
:
SquareSquaresub*
T0*
_output_shapes
:d
O
ConstConst*
dtype0*
valueB: *
_output_shapes
:
Y
MeanMeanSquareConst*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
?
sub_1Subadd_2add_1*
T0*
_output_shapes
:d
>
Square_1Squaresub_1*
T0*
_output_shapes
:d
Q
Const_1Const*
dtype0*
valueB: *
_output_shapes
:
_
Mean_1MeanSquare_1Const_1*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
?
sub_2Subadd_2add_1*
T0*
_output_shapes
:d
>
Square_2Squaresub_2*
T0*
_output_shapes
:d
Q
Const_2Const*
dtype0*
valueB: *
_output_shapes
:
_
Mean_2MeanSquare_2Const_2*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
R
gradients/ShapeConst*
dtype0*
valueB *
_output_shapes
: 
T
gradients/ConstConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 
Y
gradients/FillFillgradients/Shapegradients/Const*
T0*
_output_shapes
: 
m
#gradients/Mean_2_grad/Reshape/shapeConst*
dtype0*
valueB:*
_output_shapes
:

gradients/Mean_2_grad/ReshapeReshapegradients/Fill#gradients/Mean_2_grad/Reshape/shape*
_output_shapes
:*
T0*
Tshape0
n
$gradients/Mean_2_grad/Tile/multiplesConst*
dtype0*
valueB:d*
_output_shapes
:

gradients/Mean_2_grad/TileTilegradients/Mean_2_grad/Reshape$gradients/Mean_2_grad/Tile/multiples*

Tmultiples0*
T0*
_output_shapes
:d
e
gradients/Mean_2_grad/ShapeConst*
dtype0*
valueB:d*
_output_shapes
:
`
gradients/Mean_2_grad/Shape_1Const*
dtype0*
valueB *
_output_shapes
: 
e
gradients/Mean_2_grad/ConstConst*
dtype0*
valueB: *
_output_shapes
:

gradients/Mean_2_grad/ProdProdgradients/Mean_2_grad/Shapegradients/Mean_2_grad/Const*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
g
gradients/Mean_2_grad/Const_1Const*
dtype0*
valueB: *
_output_shapes
:
 
gradients/Mean_2_grad/Prod_1Prodgradients/Mean_2_grad/Shape_1gradients/Mean_2_grad/Const_1*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
a
gradients/Mean_2_grad/Maximum/yConst*
dtype0*
value	B :*
_output_shapes
: 

gradients/Mean_2_grad/MaximumMaximumgradients/Mean_2_grad/Prod_1gradients/Mean_2_grad/Maximum/y*
T0*
_output_shapes
: 

gradients/Mean_2_grad/floordivFloorDivgradients/Mean_2_grad/Prodgradients/Mean_2_grad/Maximum*
T0*
_output_shapes
: 
r
gradients/Mean_2_grad/CastCastgradients/Mean_2_grad/floordiv*

DstT0*

SrcT0*
_output_shapes
: 

gradients/Mean_2_grad/truedivRealDivgradients/Mean_2_grad/Tilegradients/Mean_2_grad/Cast*
T0*
_output_shapes
:d

gradients/Square_2_grad/mul/xConst^gradients/Mean_2_grad/truediv*
dtype0*
valueB
 *   @*
_output_shapes
: 
m
gradients/Square_2_grad/mulMulgradients/Square_2_grad/mul/xsub_2*
T0*
_output_shapes
:d

gradients/Square_2_grad/mul_1Mulgradients/Mean_2_grad/truedivgradients/Square_2_grad/mul*
T0*
_output_shapes
:d
d
gradients/sub_2_grad/ShapeConst*
dtype0*
valueB:d*
_output_shapes
:
f
gradients/sub_2_grad/Shape_1Const*
dtype0*
valueB:d*
_output_shapes
:
ş
*gradients/sub_2_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/sub_2_grad/Shapegradients/sub_2_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
Ş
gradients/sub_2_grad/SumSumgradients/Square_2_grad/mul_1*gradients/sub_2_grad/BroadcastGradientArgs*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0

gradients/sub_2_grad/ReshapeReshapegradients/sub_2_grad/Sumgradients/sub_2_grad/Shape*
_output_shapes
:d*
T0*
Tshape0
Ž
gradients/sub_2_grad/Sum_1Sumgradients/Square_2_grad/mul_1,gradients/sub_2_grad/BroadcastGradientArgs:1*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
^
gradients/sub_2_grad/NegNeggradients/sub_2_grad/Sum_1*
T0*
_output_shapes
:

gradients/sub_2_grad/Reshape_1Reshapegradients/sub_2_grad/Neggradients/sub_2_grad/Shape_1*
_output_shapes
:d*
T0*
Tshape0
m
%gradients/sub_2_grad/tuple/group_depsNoOp^gradients/sub_2_grad/Reshape^gradients/sub_2_grad/Reshape_1
Ő
-gradients/sub_2_grad/tuple/control_dependencyIdentitygradients/sub_2_grad/Reshape&^gradients/sub_2_grad/tuple/group_deps*/
_class%
#!loc:@gradients/sub_2_grad/Reshape*
T0*
_output_shapes
:d
Ű
/gradients/sub_2_grad/tuple/control_dependency_1Identitygradients/sub_2_grad/Reshape_1&^gradients/sub_2_grad/tuple/group_deps*1
_class'
%#loc:@gradients/sub_2_grad/Reshape_1*
T0*
_output_shapes
:d
d
gradients/add_2_grad/ShapeConst*
dtype0*
valueB:d*
_output_shapes
:
f
gradients/add_2_grad/Shape_1Const*
dtype0*
valueB:*
_output_shapes
:
ş
*gradients/add_2_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_2_grad/Shapegradients/add_2_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
ş
gradients/add_2_grad/SumSum-gradients/sub_2_grad/tuple/control_dependency*gradients/add_2_grad/BroadcastGradientArgs*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0

gradients/add_2_grad/ReshapeReshapegradients/add_2_grad/Sumgradients/add_2_grad/Shape*
_output_shapes
:d*
T0*
Tshape0
ž
gradients/add_2_grad/Sum_1Sum-gradients/sub_2_grad/tuple/control_dependency,gradients/add_2_grad/BroadcastGradientArgs:1*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0

gradients/add_2_grad/Reshape_1Reshapegradients/add_2_grad/Sum_1gradients/add_2_grad/Shape_1*
_output_shapes
:*
T0*
Tshape0
m
%gradients/add_2_grad/tuple/group_depsNoOp^gradients/add_2_grad/Reshape^gradients/add_2_grad/Reshape_1
Ő
-gradients/add_2_grad/tuple/control_dependencyIdentitygradients/add_2_grad/Reshape&^gradients/add_2_grad/tuple/group_deps*/
_class%
#!loc:@gradients/add_2_grad/Reshape*
T0*
_output_shapes
:d
Ű
/gradients/add_2_grad/tuple/control_dependency_1Identitygradients/add_2_grad/Reshape_1&^gradients/add_2_grad/tuple/group_deps*1
_class'
%#loc:@gradients/add_2_grad/Reshape_1*
T0*
_output_shapes
:
d
gradients/mul_2_grad/ShapeConst*
dtype0*
valueB:*
_output_shapes
:
f
gradients/mul_2_grad/Shape_1Const*
dtype0*
valueB:d*
_output_shapes
:
ş
*gradients/mul_2_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/mul_2_grad/Shapegradients/mul_2_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙

gradients/mul_2_grad/mulMul-gradients/add_2_grad/tuple/control_dependencytruncated_normal_1*
T0*
_output_shapes
:d
Ľ
gradients/mul_2_grad/SumSumgradients/mul_2_grad/mul*gradients/mul_2_grad/BroadcastGradientArgs*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0

gradients/mul_2_grad/ReshapeReshapegradients/mul_2_grad/Sumgradients/mul_2_grad/Shape*
_output_shapes
:*
T0*
Tshape0

gradients/mul_2_grad/mul_1MulVariable/read-gradients/add_2_grad/tuple/control_dependency*
T0*
_output_shapes
:d
Ť
gradients/mul_2_grad/Sum_1Sumgradients/mul_2_grad/mul_1,gradients/mul_2_grad/BroadcastGradientArgs:1*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0

gradients/mul_2_grad/Reshape_1Reshapegradients/mul_2_grad/Sum_1gradients/mul_2_grad/Shape_1*
_output_shapes
:d*
T0*
Tshape0
m
%gradients/mul_2_grad/tuple/group_depsNoOp^gradients/mul_2_grad/Reshape^gradients/mul_2_grad/Reshape_1
Ő
-gradients/mul_2_grad/tuple/control_dependencyIdentitygradients/mul_2_grad/Reshape&^gradients/mul_2_grad/tuple/group_deps*/
_class%
#!loc:@gradients/mul_2_grad/Reshape*
T0*
_output_shapes
:
Ű
/gradients/mul_2_grad/tuple/control_dependency_1Identitygradients/mul_2_grad/Reshape_1&^gradients/mul_2_grad/tuple/group_deps*1
_class'
%#loc:@gradients/mul_2_grad/Reshape_1*
T0*
_output_shapes
:d
b
GradientDescent/learning_rateConst*
dtype0*
valueB
 *   ?*
_output_shapes
: 
ů
4GradientDescent/update_Variable/ApplyGradientDescentApplyGradientDescentVariableGradientDescent/learning_rate-gradients/mul_2_grad/tuple/control_dependency*
_class
loc:@Variable*
use_locking( *
T0*
_output_shapes
:

6GradientDescent/update_Variable_1/ApplyGradientDescentApplyGradientDescent
Variable_1GradientDescent/learning_rate/gradients/add_2_grad/tuple/control_dependency_1*
_class
loc:@Variable_1*
use_locking( *
T0*
_output_shapes
:

GradientDescentNoOp5^GradientDescent/update_Variable/ApplyGradientDescent7^GradientDescent/update_Variable_1/ApplyGradientDescent
4
init_1NoOp^Variable/Assign^Variable_1/Assign
4
init_2NoOp^Variable/Assign^Variable_1/Assign
b
truncated_normal_2/shapeConst*
dtype0*
valueB:d*
_output_shapes
:
\
truncated_normal_2/meanConst*
dtype0*
valueB
 *    *
_output_shapes
: 
^
truncated_normal_2/stddevConst*
dtype0*
valueB
 *ÍĚĚ=*
_output_shapes
: 

"truncated_normal_2/TruncatedNormalTruncatedNormaltruncated_normal_2/shape*
dtype0*
seed2 *

seed *
T0*
_output_shapes
:d

truncated_normal_2/mulMul"truncated_normal_2/TruncatedNormaltruncated_normal_2/stddev*
T0*
_output_shapes
:d
o
truncated_normal_2Addtruncated_normal_2/multruncated_normal_2/mean*
T0*
_output_shapes
:d
L
mul_3/yConst*
dtype0*
valueB
 *ÍĚĚ=*
_output_shapes
: 
L
mul_3Multruncated_normalmul_3/y*
T0*
_output_shapes
:d
L
add_3/yConst*
dtype0*
valueB
 *>*
_output_shapes
: 
A
add_3Addmul_3add_3/y*
T0*
_output_shapes
:d
`
random_uniform_1/shapeConst*
dtype0*
valueB:*
_output_shapes
:
Y
random_uniform_1/minConst*
dtype0*
valueB
 *  ż*
_output_shapes
: 
Y
random_uniform_1/maxConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 

random_uniform_1/RandomUniformRandomUniformrandom_uniform_1/shape*
dtype0*
seed2 *

seed *
T0*
_output_shapes
:
h
random_uniform_1/subSubrandom_uniform_1/maxrandom_uniform_1/min*
T0*
_output_shapes
: 
v
random_uniform_1/mulMulrandom_uniform_1/RandomUniformrandom_uniform_1/sub*
T0*
_output_shapes
:
h
random_uniform_1Addrandom_uniform_1/mulrandom_uniform_1/min*
T0*
_output_shapes
:
v

Variable_2
VariableV2*
dtype0*
shape:*
	container *
shared_name *
_output_shapes
:
Ś
Variable_2/AssignAssign
Variable_2random_uniform_1*
validate_shape(*
_class
loc:@Variable_2*
use_locking(*
T0*
_output_shapes
:
k
Variable_2/readIdentity
Variable_2*
_class
loc:@Variable_2*
T0*
_output_shapes
:
T
zeros_1Const*
dtype0*
valueB*    *
_output_shapes
:
v

Variable_3
VariableV2*
dtype0*
shape:*
	container *
shared_name *
_output_shapes
:

Variable_3/AssignAssign
Variable_3zeros_1*
validate_shape(*
_class
loc:@Variable_3*
use_locking(*
T0*
_output_shapes
:
k
Variable_3/readIdentity
Variable_3*
_class
loc:@Variable_3*
T0*
_output_shapes
:
V
mul_4MulVariable_2/readtruncated_normal_2*
T0*
_output_shapes
:d
I
add_4Addmul_4Variable_3/read*
T0*
_output_shapes
:d
?
sub_3Subadd_4add_3*
T0*
_output_shapes
:d
>
Square_3Squaresub_3*
T0*
_output_shapes
:d
Q
Const_3Const*
dtype0*
valueB: *
_output_shapes
:
_
Mean_3MeanSquare_3Const_3*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
T
gradients_1/ShapeConst*
dtype0*
valueB *
_output_shapes
: 
V
gradients_1/ConstConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 
_
gradients_1/FillFillgradients_1/Shapegradients_1/Const*
T0*
_output_shapes
: 
o
%gradients_1/Mean_3_grad/Reshape/shapeConst*
dtype0*
valueB:*
_output_shapes
:

gradients_1/Mean_3_grad/ReshapeReshapegradients_1/Fill%gradients_1/Mean_3_grad/Reshape/shape*
_output_shapes
:*
T0*
Tshape0
p
&gradients_1/Mean_3_grad/Tile/multiplesConst*
dtype0*
valueB:d*
_output_shapes
:
¤
gradients_1/Mean_3_grad/TileTilegradients_1/Mean_3_grad/Reshape&gradients_1/Mean_3_grad/Tile/multiples*

Tmultiples0*
T0*
_output_shapes
:d
g
gradients_1/Mean_3_grad/ShapeConst*
dtype0*
valueB:d*
_output_shapes
:
b
gradients_1/Mean_3_grad/Shape_1Const*
dtype0*
valueB *
_output_shapes
: 
g
gradients_1/Mean_3_grad/ConstConst*
dtype0*
valueB: *
_output_shapes
:
 
gradients_1/Mean_3_grad/ProdProdgradients_1/Mean_3_grad/Shapegradients_1/Mean_3_grad/Const*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
i
gradients_1/Mean_3_grad/Const_1Const*
dtype0*
valueB: *
_output_shapes
:
Ś
gradients_1/Mean_3_grad/Prod_1Prodgradients_1/Mean_3_grad/Shape_1gradients_1/Mean_3_grad/Const_1*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
c
!gradients_1/Mean_3_grad/Maximum/yConst*
dtype0*
value	B :*
_output_shapes
: 

gradients_1/Mean_3_grad/MaximumMaximumgradients_1/Mean_3_grad/Prod_1!gradients_1/Mean_3_grad/Maximum/y*
T0*
_output_shapes
: 

 gradients_1/Mean_3_grad/floordivFloorDivgradients_1/Mean_3_grad/Prodgradients_1/Mean_3_grad/Maximum*
T0*
_output_shapes
: 
v
gradients_1/Mean_3_grad/CastCast gradients_1/Mean_3_grad/floordiv*

DstT0*

SrcT0*
_output_shapes
: 

gradients_1/Mean_3_grad/truedivRealDivgradients_1/Mean_3_grad/Tilegradients_1/Mean_3_grad/Cast*
T0*
_output_shapes
:d

gradients_1/Square_3_grad/mul/xConst ^gradients_1/Mean_3_grad/truediv*
dtype0*
valueB
 *   @*
_output_shapes
: 
q
gradients_1/Square_3_grad/mulMulgradients_1/Square_3_grad/mul/xsub_3*
T0*
_output_shapes
:d

gradients_1/Square_3_grad/mul_1Mulgradients_1/Mean_3_grad/truedivgradients_1/Square_3_grad/mul*
T0*
_output_shapes
:d
f
gradients_1/sub_3_grad/ShapeConst*
dtype0*
valueB:d*
_output_shapes
:
h
gradients_1/sub_3_grad/Shape_1Const*
dtype0*
valueB:d*
_output_shapes
:
Ŕ
,gradients_1/sub_3_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/sub_3_grad/Shapegradients_1/sub_3_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
°
gradients_1/sub_3_grad/SumSumgradients_1/Square_3_grad/mul_1,gradients_1/sub_3_grad/BroadcastGradientArgs*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0

gradients_1/sub_3_grad/ReshapeReshapegradients_1/sub_3_grad/Sumgradients_1/sub_3_grad/Shape*
_output_shapes
:d*
T0*
Tshape0
´
gradients_1/sub_3_grad/Sum_1Sumgradients_1/Square_3_grad/mul_1.gradients_1/sub_3_grad/BroadcastGradientArgs:1*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
b
gradients_1/sub_3_grad/NegNeggradients_1/sub_3_grad/Sum_1*
T0*
_output_shapes
:

 gradients_1/sub_3_grad/Reshape_1Reshapegradients_1/sub_3_grad/Neggradients_1/sub_3_grad/Shape_1*
_output_shapes
:d*
T0*
Tshape0
s
'gradients_1/sub_3_grad/tuple/group_depsNoOp^gradients_1/sub_3_grad/Reshape!^gradients_1/sub_3_grad/Reshape_1
Ý
/gradients_1/sub_3_grad/tuple/control_dependencyIdentitygradients_1/sub_3_grad/Reshape(^gradients_1/sub_3_grad/tuple/group_deps*1
_class'
%#loc:@gradients_1/sub_3_grad/Reshape*
T0*
_output_shapes
:d
ă
1gradients_1/sub_3_grad/tuple/control_dependency_1Identity gradients_1/sub_3_grad/Reshape_1(^gradients_1/sub_3_grad/tuple/group_deps*3
_class)
'%loc:@gradients_1/sub_3_grad/Reshape_1*
T0*
_output_shapes
:d
f
gradients_1/add_4_grad/ShapeConst*
dtype0*
valueB:d*
_output_shapes
:
h
gradients_1/add_4_grad/Shape_1Const*
dtype0*
valueB:*
_output_shapes
:
Ŕ
,gradients_1/add_4_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/add_4_grad/Shapegradients_1/add_4_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
Ŕ
gradients_1/add_4_grad/SumSum/gradients_1/sub_3_grad/tuple/control_dependency,gradients_1/add_4_grad/BroadcastGradientArgs*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0

gradients_1/add_4_grad/ReshapeReshapegradients_1/add_4_grad/Sumgradients_1/add_4_grad/Shape*
_output_shapes
:d*
T0*
Tshape0
Ä
gradients_1/add_4_grad/Sum_1Sum/gradients_1/sub_3_grad/tuple/control_dependency.gradients_1/add_4_grad/BroadcastGradientArgs:1*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0

 gradients_1/add_4_grad/Reshape_1Reshapegradients_1/add_4_grad/Sum_1gradients_1/add_4_grad/Shape_1*
_output_shapes
:*
T0*
Tshape0
s
'gradients_1/add_4_grad/tuple/group_depsNoOp^gradients_1/add_4_grad/Reshape!^gradients_1/add_4_grad/Reshape_1
Ý
/gradients_1/add_4_grad/tuple/control_dependencyIdentitygradients_1/add_4_grad/Reshape(^gradients_1/add_4_grad/tuple/group_deps*1
_class'
%#loc:@gradients_1/add_4_grad/Reshape*
T0*
_output_shapes
:d
ă
1gradients_1/add_4_grad/tuple/control_dependency_1Identity gradients_1/add_4_grad/Reshape_1(^gradients_1/add_4_grad/tuple/group_deps*3
_class)
'%loc:@gradients_1/add_4_grad/Reshape_1*
T0*
_output_shapes
:
f
gradients_1/mul_4_grad/ShapeConst*
dtype0*
valueB:*
_output_shapes
:
h
gradients_1/mul_4_grad/Shape_1Const*
dtype0*
valueB:d*
_output_shapes
:
Ŕ
,gradients_1/mul_4_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/mul_4_grad/Shapegradients_1/mul_4_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙

gradients_1/mul_4_grad/mulMul/gradients_1/add_4_grad/tuple/control_dependencytruncated_normal_2*
T0*
_output_shapes
:d
Ť
gradients_1/mul_4_grad/SumSumgradients_1/mul_4_grad/mul,gradients_1/mul_4_grad/BroadcastGradientArgs*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0

gradients_1/mul_4_grad/ReshapeReshapegradients_1/mul_4_grad/Sumgradients_1/mul_4_grad/Shape*
_output_shapes
:*
T0*
Tshape0

gradients_1/mul_4_grad/mul_1MulVariable_2/read/gradients_1/add_4_grad/tuple/control_dependency*
T0*
_output_shapes
:d
ą
gradients_1/mul_4_grad/Sum_1Sumgradients_1/mul_4_grad/mul_1.gradients_1/mul_4_grad/BroadcastGradientArgs:1*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0

 gradients_1/mul_4_grad/Reshape_1Reshapegradients_1/mul_4_grad/Sum_1gradients_1/mul_4_grad/Shape_1*
_output_shapes
:d*
T0*
Tshape0
s
'gradients_1/mul_4_grad/tuple/group_depsNoOp^gradients_1/mul_4_grad/Reshape!^gradients_1/mul_4_grad/Reshape_1
Ý
/gradients_1/mul_4_grad/tuple/control_dependencyIdentitygradients_1/mul_4_grad/Reshape(^gradients_1/mul_4_grad/tuple/group_deps*1
_class'
%#loc:@gradients_1/mul_4_grad/Reshape*
T0*
_output_shapes
:
ă
1gradients_1/mul_4_grad/tuple/control_dependency_1Identity gradients_1/mul_4_grad/Reshape_1(^gradients_1/mul_4_grad/tuple/group_deps*3
_class)
'%loc:@gradients_1/mul_4_grad/Reshape_1*
T0*
_output_shapes
:d
d
GradientDescent_1/learning_rateConst*
dtype0*
valueB
 *   ?*
_output_shapes
: 

8GradientDescent_1/update_Variable_2/ApplyGradientDescentApplyGradientDescent
Variable_2GradientDescent_1/learning_rate/gradients_1/mul_4_grad/tuple/control_dependency*
_class
loc:@Variable_2*
use_locking( *
T0*
_output_shapes
:

8GradientDescent_1/update_Variable_3/ApplyGradientDescentApplyGradientDescent
Variable_3GradientDescent_1/learning_rate1gradients_1/add_4_grad/tuple/control_dependency_1*
_class
loc:@Variable_3*
use_locking( *
T0*
_output_shapes
:

GradientDescent_1NoOp9^GradientDescent_1/update_Variable_2/ApplyGradientDescent9^GradientDescent_1/update_Variable_3/ApplyGradientDescent
\
init_3NoOp^Variable/Assign^Variable_1/Assign^Variable_2/Assign^Variable_3/Assign
b
truncated_normal_3/shapeConst*
dtype0*
valueB:d*
_output_shapes
:
\
truncated_normal_3/meanConst*
dtype0*
valueB
 *    *
_output_shapes
: 
^
truncated_normal_3/stddevConst*
dtype0*
valueB
 *ÍĚĚ=*
_output_shapes
: 

"truncated_normal_3/TruncatedNormalTruncatedNormaltruncated_normal_3/shape*
dtype0*
seed2 *

seed *
T0*
_output_shapes
:d

truncated_normal_3/mulMul"truncated_normal_3/TruncatedNormaltruncated_normal_3/stddev*
T0*
_output_shapes
:d
o
truncated_normal_3Addtruncated_normal_3/multruncated_normal_3/mean*
T0*
_output_shapes
:d
L
mul_5/yConst*
dtype0*
valueB
 *ÍĚĚ=*
_output_shapes
: 
L
mul_5Multruncated_normalmul_5/y*
T0*
_output_shapes
:d
L
add_5/yConst*
dtype0*
valueB
 *>*
_output_shapes
: 
A
add_5Addmul_5add_5/y*
T0*
_output_shapes
:d
`
random_uniform_2/shapeConst*
dtype0*
valueB:*
_output_shapes
:
Y
random_uniform_2/minConst*
dtype0*
valueB
 *  ż*
_output_shapes
: 
Y
random_uniform_2/maxConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 

random_uniform_2/RandomUniformRandomUniformrandom_uniform_2/shape*
dtype0*
seed2 *

seed *
T0*
_output_shapes
:
h
random_uniform_2/subSubrandom_uniform_2/maxrandom_uniform_2/min*
T0*
_output_shapes
: 
v
random_uniform_2/mulMulrandom_uniform_2/RandomUniformrandom_uniform_2/sub*
T0*
_output_shapes
:
h
random_uniform_2Addrandom_uniform_2/mulrandom_uniform_2/min*
T0*
_output_shapes
:
v

Variable_4
VariableV2*
dtype0*
shape:*
	container *
shared_name *
_output_shapes
:
Ś
Variable_4/AssignAssign
Variable_4random_uniform_2*
validate_shape(*
_class
loc:@Variable_4*
use_locking(*
T0*
_output_shapes
:
k
Variable_4/readIdentity
Variable_4*
_class
loc:@Variable_4*
T0*
_output_shapes
:
T
zeros_2Const*
dtype0*
valueB*    *
_output_shapes
:
v

Variable_5
VariableV2*
dtype0*
shape:*
	container *
shared_name *
_output_shapes
:

Variable_5/AssignAssign
Variable_5zeros_2*
validate_shape(*
_class
loc:@Variable_5*
use_locking(*
T0*
_output_shapes
:
k
Variable_5/readIdentity
Variable_5*
_class
loc:@Variable_5*
T0*
_output_shapes
:
V
mul_6MulVariable_4/readtruncated_normal_3*
T0*
_output_shapes
:d
I
add_6Addmul_6Variable_5/read*
T0*
_output_shapes
:d
?
sub_4Subadd_6add_5*
T0*
_output_shapes
:d
>
Square_4Squaresub_4*
T0*
_output_shapes
:d
Q
Const_4Const*
dtype0*
valueB: *
_output_shapes
:
_
Mean_4MeanSquare_4Const_4*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
T
gradients_2/ShapeConst*
dtype0*
valueB *
_output_shapes
: 
V
gradients_2/ConstConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 
_
gradients_2/FillFillgradients_2/Shapegradients_2/Const*
T0*
_output_shapes
: 
o
%gradients_2/Mean_4_grad/Reshape/shapeConst*
dtype0*
valueB:*
_output_shapes
:

gradients_2/Mean_4_grad/ReshapeReshapegradients_2/Fill%gradients_2/Mean_4_grad/Reshape/shape*
_output_shapes
:*
T0*
Tshape0
p
&gradients_2/Mean_4_grad/Tile/multiplesConst*
dtype0*
valueB:d*
_output_shapes
:
¤
gradients_2/Mean_4_grad/TileTilegradients_2/Mean_4_grad/Reshape&gradients_2/Mean_4_grad/Tile/multiples*

Tmultiples0*
T0*
_output_shapes
:d
g
gradients_2/Mean_4_grad/ShapeConst*
dtype0*
valueB:d*
_output_shapes
:
b
gradients_2/Mean_4_grad/Shape_1Const*
dtype0*
valueB *
_output_shapes
: 
g
gradients_2/Mean_4_grad/ConstConst*
dtype0*
valueB: *
_output_shapes
:
 
gradients_2/Mean_4_grad/ProdProdgradients_2/Mean_4_grad/Shapegradients_2/Mean_4_grad/Const*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
i
gradients_2/Mean_4_grad/Const_1Const*
dtype0*
valueB: *
_output_shapes
:
Ś
gradients_2/Mean_4_grad/Prod_1Prodgradients_2/Mean_4_grad/Shape_1gradients_2/Mean_4_grad/Const_1*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
c
!gradients_2/Mean_4_grad/Maximum/yConst*
dtype0*
value	B :*
_output_shapes
: 

gradients_2/Mean_4_grad/MaximumMaximumgradients_2/Mean_4_grad/Prod_1!gradients_2/Mean_4_grad/Maximum/y*
T0*
_output_shapes
: 

 gradients_2/Mean_4_grad/floordivFloorDivgradients_2/Mean_4_grad/Prodgradients_2/Mean_4_grad/Maximum*
T0*
_output_shapes
: 
v
gradients_2/Mean_4_grad/CastCast gradients_2/Mean_4_grad/floordiv*

DstT0*

SrcT0*
_output_shapes
: 

gradients_2/Mean_4_grad/truedivRealDivgradients_2/Mean_4_grad/Tilegradients_2/Mean_4_grad/Cast*
T0*
_output_shapes
:d

gradients_2/Square_4_grad/mul/xConst ^gradients_2/Mean_4_grad/truediv*
dtype0*
valueB
 *   @*
_output_shapes
: 
q
gradients_2/Square_4_grad/mulMulgradients_2/Square_4_grad/mul/xsub_4*
T0*
_output_shapes
:d

gradients_2/Square_4_grad/mul_1Mulgradients_2/Mean_4_grad/truedivgradients_2/Square_4_grad/mul*
T0*
_output_shapes
:d
f
gradients_2/sub_4_grad/ShapeConst*
dtype0*
valueB:d*
_output_shapes
:
h
gradients_2/sub_4_grad/Shape_1Const*
dtype0*
valueB:d*
_output_shapes
:
Ŕ
,gradients_2/sub_4_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_2/sub_4_grad/Shapegradients_2/sub_4_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
°
gradients_2/sub_4_grad/SumSumgradients_2/Square_4_grad/mul_1,gradients_2/sub_4_grad/BroadcastGradientArgs*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0

gradients_2/sub_4_grad/ReshapeReshapegradients_2/sub_4_grad/Sumgradients_2/sub_4_grad/Shape*
_output_shapes
:d*
T0*
Tshape0
´
gradients_2/sub_4_grad/Sum_1Sumgradients_2/Square_4_grad/mul_1.gradients_2/sub_4_grad/BroadcastGradientArgs:1*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
b
gradients_2/sub_4_grad/NegNeggradients_2/sub_4_grad/Sum_1*
T0*
_output_shapes
:

 gradients_2/sub_4_grad/Reshape_1Reshapegradients_2/sub_4_grad/Neggradients_2/sub_4_grad/Shape_1*
_output_shapes
:d*
T0*
Tshape0
s
'gradients_2/sub_4_grad/tuple/group_depsNoOp^gradients_2/sub_4_grad/Reshape!^gradients_2/sub_4_grad/Reshape_1
Ý
/gradients_2/sub_4_grad/tuple/control_dependencyIdentitygradients_2/sub_4_grad/Reshape(^gradients_2/sub_4_grad/tuple/group_deps*1
_class'
%#loc:@gradients_2/sub_4_grad/Reshape*
T0*
_output_shapes
:d
ă
1gradients_2/sub_4_grad/tuple/control_dependency_1Identity gradients_2/sub_4_grad/Reshape_1(^gradients_2/sub_4_grad/tuple/group_deps*3
_class)
'%loc:@gradients_2/sub_4_grad/Reshape_1*
T0*
_output_shapes
:d
f
gradients_2/add_6_grad/ShapeConst*
dtype0*
valueB:d*
_output_shapes
:
h
gradients_2/add_6_grad/Shape_1Const*
dtype0*
valueB:*
_output_shapes
:
Ŕ
,gradients_2/add_6_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_2/add_6_grad/Shapegradients_2/add_6_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
Ŕ
gradients_2/add_6_grad/SumSum/gradients_2/sub_4_grad/tuple/control_dependency,gradients_2/add_6_grad/BroadcastGradientArgs*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0

gradients_2/add_6_grad/ReshapeReshapegradients_2/add_6_grad/Sumgradients_2/add_6_grad/Shape*
_output_shapes
:d*
T0*
Tshape0
Ä
gradients_2/add_6_grad/Sum_1Sum/gradients_2/sub_4_grad/tuple/control_dependency.gradients_2/add_6_grad/BroadcastGradientArgs:1*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0

 gradients_2/add_6_grad/Reshape_1Reshapegradients_2/add_6_grad/Sum_1gradients_2/add_6_grad/Shape_1*
_output_shapes
:*
T0*
Tshape0
s
'gradients_2/add_6_grad/tuple/group_depsNoOp^gradients_2/add_6_grad/Reshape!^gradients_2/add_6_grad/Reshape_1
Ý
/gradients_2/add_6_grad/tuple/control_dependencyIdentitygradients_2/add_6_grad/Reshape(^gradients_2/add_6_grad/tuple/group_deps*1
_class'
%#loc:@gradients_2/add_6_grad/Reshape*
T0*
_output_shapes
:d
ă
1gradients_2/add_6_grad/tuple/control_dependency_1Identity gradients_2/add_6_grad/Reshape_1(^gradients_2/add_6_grad/tuple/group_deps*3
_class)
'%loc:@gradients_2/add_6_grad/Reshape_1*
T0*
_output_shapes
:
f
gradients_2/mul_6_grad/ShapeConst*
dtype0*
valueB:*
_output_shapes
:
h
gradients_2/mul_6_grad/Shape_1Const*
dtype0*
valueB:d*
_output_shapes
:
Ŕ
,gradients_2/mul_6_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_2/mul_6_grad/Shapegradients_2/mul_6_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙

gradients_2/mul_6_grad/mulMul/gradients_2/add_6_grad/tuple/control_dependencytruncated_normal_3*
T0*
_output_shapes
:d
Ť
gradients_2/mul_6_grad/SumSumgradients_2/mul_6_grad/mul,gradients_2/mul_6_grad/BroadcastGradientArgs*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0

gradients_2/mul_6_grad/ReshapeReshapegradients_2/mul_6_grad/Sumgradients_2/mul_6_grad/Shape*
_output_shapes
:*
T0*
Tshape0

gradients_2/mul_6_grad/mul_1MulVariable_4/read/gradients_2/add_6_grad/tuple/control_dependency*
T0*
_output_shapes
:d
ą
gradients_2/mul_6_grad/Sum_1Sumgradients_2/mul_6_grad/mul_1.gradients_2/mul_6_grad/BroadcastGradientArgs:1*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0

 gradients_2/mul_6_grad/Reshape_1Reshapegradients_2/mul_6_grad/Sum_1gradients_2/mul_6_grad/Shape_1*
_output_shapes
:d*
T0*
Tshape0
s
'gradients_2/mul_6_grad/tuple/group_depsNoOp^gradients_2/mul_6_grad/Reshape!^gradients_2/mul_6_grad/Reshape_1
Ý
/gradients_2/mul_6_grad/tuple/control_dependencyIdentitygradients_2/mul_6_grad/Reshape(^gradients_2/mul_6_grad/tuple/group_deps*1
_class'
%#loc:@gradients_2/mul_6_grad/Reshape*
T0*
_output_shapes
:
ă
1gradients_2/mul_6_grad/tuple/control_dependency_1Identity gradients_2/mul_6_grad/Reshape_1(^gradients_2/mul_6_grad/tuple/group_deps*3
_class)
'%loc:@gradients_2/mul_6_grad/Reshape_1*
T0*
_output_shapes
:d
d
GradientDescent_2/learning_rateConst*
dtype0*
valueB
 *   ?*
_output_shapes
: 

8GradientDescent_2/update_Variable_4/ApplyGradientDescentApplyGradientDescent
Variable_4GradientDescent_2/learning_rate/gradients_2/mul_6_grad/tuple/control_dependency*
_class
loc:@Variable_4*
use_locking( *
T0*
_output_shapes
:

8GradientDescent_2/update_Variable_5/ApplyGradientDescentApplyGradientDescent
Variable_5GradientDescent_2/learning_rate1gradients_2/add_6_grad/tuple/control_dependency_1*
_class
loc:@Variable_5*
use_locking( *
T0*
_output_shapes
:

GradientDescent_2NoOp9^GradientDescent_2/update_Variable_4/ApplyGradientDescent9^GradientDescent_2/update_Variable_5/ApplyGradientDescent

init_4NoOp^Variable/Assign^Variable_1/Assign^Variable_2/Assign^Variable_3/Assign^Variable_4/Assign^Variable_5/Assign"*§ŘŹö      'ůą	T66)QÖAJéˇ
ţÜ
9
Add
x"T
y"T
z"T"
Ttype:
2	

ApplyGradientDescent
var"T

alpha"T

delta"T
out"T"
Ttype:
2	"
use_lockingbool( 
x
Assign
ref"T

value"T

output_ref"T"	
Ttype"
validate_shapebool("
use_lockingbool(
R
BroadcastGradientArgs
s0"T
s1"T
r0"T
r1"T"
Ttype0:
2	
8
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype
8
Const
output"dtype"
valuetensor"
dtypetype
4
Fill
dims

value"T
output"T"	
Ttype
>
FloorDiv
x"T
y"T
z"T"
Ttype:
2	
.
Identity

input"T
output"T"	
Ttype
:
Maximum
x"T
y"T
z"T"
Ttype:	
2	

Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
<
Mul
x"T
y"T
z"T"
Ttype:
2	
-
Neg
x"T
y"T"
Ttype:
	2	

NoOp

Prod

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
}
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	
=
RealDiv
x"T
y"T
z"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
0
Square
x"T
y"T"
Ttype:
	2	
5
Sub
x"T
y"T
z"T"
Ttype:
	2	

Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	

TruncatedNormal

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	
s

VariableV2
ref"dtype"
shapeshape"
dtypetype"
	containerstring "
shared_namestring *1.1.02v1.1.0-rc0-61-g1ec6ed5ďĄ
`
truncated_normal/shapeConst*
dtype0*
valueB:d*
_output_shapes
:
Z
truncated_normal/meanConst*
dtype0*
valueB
 *    *
_output_shapes
: 
\
truncated_normal/stddevConst*
dtype0*
valueB
 *ÍĚĚ=*
_output_shapes
: 

 truncated_normal/TruncatedNormalTruncatedNormaltruncated_normal/shape*
dtype0*
seed2 *

seed *
T0*
_output_shapes
:d
{
truncated_normal/mulMul truncated_normal/TruncatedNormaltruncated_normal/stddev*
T0*
_output_shapes
:d
i
truncated_normalAddtruncated_normal/multruncated_normal/mean*
T0*
_output_shapes
:d
J
mul/yConst*
dtype0*
valueB
 *ÍĚĚ=*
_output_shapes
: 
H
mulMultruncated_normalmul/y*
T0*
_output_shapes
:d
J
add/yConst*
dtype0*
valueB
 *>*
_output_shapes
: 
;
addAddmuladd/y*
T0*
_output_shapes
:d

initNoOp
b
truncated_normal_1/shapeConst*
dtype0*
valueB:d*
_output_shapes
:
\
truncated_normal_1/meanConst*
dtype0*
valueB
 *    *
_output_shapes
: 
^
truncated_normal_1/stddevConst*
dtype0*
valueB
 *ÍĚĚ=*
_output_shapes
: 

"truncated_normal_1/TruncatedNormalTruncatedNormaltruncated_normal_1/shape*
dtype0*
seed2 *

seed *
T0*
_output_shapes
:d

truncated_normal_1/mulMul"truncated_normal_1/TruncatedNormaltruncated_normal_1/stddev*
T0*
_output_shapes
:d
o
truncated_normal_1Addtruncated_normal_1/multruncated_normal_1/mean*
T0*
_output_shapes
:d
L
mul_1/yConst*
dtype0*
valueB
 *ÍĚĚ=*
_output_shapes
: 
L
mul_1Multruncated_normalmul_1/y*
T0*
_output_shapes
:d
L
add_1/yConst*
dtype0*
valueB
 *>*
_output_shapes
: 
A
add_1Addmul_1add_1/y*
T0*
_output_shapes
:d
^
random_uniform/shapeConst*
dtype0*
valueB:*
_output_shapes
:
W
random_uniform/minConst*
dtype0*
valueB
 *  ż*
_output_shapes
: 
W
random_uniform/maxConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 

random_uniform/RandomUniformRandomUniformrandom_uniform/shape*
dtype0*
seed2 *

seed *
T0*
_output_shapes
:
b
random_uniform/subSubrandom_uniform/maxrandom_uniform/min*
T0*
_output_shapes
: 
p
random_uniform/mulMulrandom_uniform/RandomUniformrandom_uniform/sub*
T0*
_output_shapes
:
b
random_uniformAddrandom_uniform/mulrandom_uniform/min*
T0*
_output_shapes
:
t
Variable
VariableV2*
dtype0*
shape:*
shared_name *
	container *
_output_shapes
:

Variable/AssignAssignVariablerandom_uniform*
validate_shape(*
_class
loc:@Variable*
use_locking(*
T0*
_output_shapes
:
e
Variable/readIdentityVariable*
_class
loc:@Variable*
T0*
_output_shapes
:
R
zerosConst*
dtype0*
valueB*    *
_output_shapes
:
v

Variable_1
VariableV2*
dtype0*
shape:*
shared_name *
	container *
_output_shapes
:

Variable_1/AssignAssign
Variable_1zeros*
validate_shape(*
_class
loc:@Variable_1*
use_locking(*
T0*
_output_shapes
:
k
Variable_1/readIdentity
Variable_1*
_class
loc:@Variable_1*
T0*
_output_shapes
:
T
mul_2MulVariable/readtruncated_normal_1*
T0*
_output_shapes
:d
I
add_2Addmul_2Variable_1/read*
T0*
_output_shapes
:d
=
subSubadd_2add_1*
T0*
_output_shapes
:d
:
SquareSquaresub*
T0*
_output_shapes
:d
O
ConstConst*
dtype0*
valueB: *
_output_shapes
:
Y
MeanMeanSquareConst*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 
?
sub_1Subadd_2add_1*
T0*
_output_shapes
:d
>
Square_1Squaresub_1*
T0*
_output_shapes
:d
Q
Const_1Const*
dtype0*
valueB: *
_output_shapes
:
_
Mean_1MeanSquare_1Const_1*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 
?
sub_2Subadd_2add_1*
T0*
_output_shapes
:d
>
Square_2Squaresub_2*
T0*
_output_shapes
:d
Q
Const_2Const*
dtype0*
valueB: *
_output_shapes
:
_
Mean_2MeanSquare_2Const_2*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 
R
gradients/ShapeConst*
dtype0*
valueB *
_output_shapes
: 
T
gradients/ConstConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 
Y
gradients/FillFillgradients/Shapegradients/Const*
T0*
_output_shapes
: 
m
#gradients/Mean_2_grad/Reshape/shapeConst*
dtype0*
valueB:*
_output_shapes
:

gradients/Mean_2_grad/ReshapeReshapegradients/Fill#gradients/Mean_2_grad/Reshape/shape*
Tshape0*
T0*
_output_shapes
:
n
$gradients/Mean_2_grad/Tile/multiplesConst*
dtype0*
valueB:d*
_output_shapes
:

gradients/Mean_2_grad/TileTilegradients/Mean_2_grad/Reshape$gradients/Mean_2_grad/Tile/multiples*

Tmultiples0*
T0*
_output_shapes
:d
e
gradients/Mean_2_grad/ShapeConst*
dtype0*
valueB:d*
_output_shapes
:
`
gradients/Mean_2_grad/Shape_1Const*
dtype0*
valueB *
_output_shapes
: 
e
gradients/Mean_2_grad/ConstConst*
dtype0*
valueB: *
_output_shapes
:

gradients/Mean_2_grad/ProdProdgradients/Mean_2_grad/Shapegradients/Mean_2_grad/Const*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 
g
gradients/Mean_2_grad/Const_1Const*
dtype0*
valueB: *
_output_shapes
:
 
gradients/Mean_2_grad/Prod_1Prodgradients/Mean_2_grad/Shape_1gradients/Mean_2_grad/Const_1*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 
a
gradients/Mean_2_grad/Maximum/yConst*
dtype0*
value	B :*
_output_shapes
: 

gradients/Mean_2_grad/MaximumMaximumgradients/Mean_2_grad/Prod_1gradients/Mean_2_grad/Maximum/y*
T0*
_output_shapes
: 

gradients/Mean_2_grad/floordivFloorDivgradients/Mean_2_grad/Prodgradients/Mean_2_grad/Maximum*
T0*
_output_shapes
: 
r
gradients/Mean_2_grad/CastCastgradients/Mean_2_grad/floordiv*

DstT0*

SrcT0*
_output_shapes
: 

gradients/Mean_2_grad/truedivRealDivgradients/Mean_2_grad/Tilegradients/Mean_2_grad/Cast*
T0*
_output_shapes
:d

gradients/Square_2_grad/mul/xConst^gradients/Mean_2_grad/truediv*
dtype0*
valueB
 *   @*
_output_shapes
: 
m
gradients/Square_2_grad/mulMulgradients/Square_2_grad/mul/xsub_2*
T0*
_output_shapes
:d

gradients/Square_2_grad/mul_1Mulgradients/Mean_2_grad/truedivgradients/Square_2_grad/mul*
T0*
_output_shapes
:d
d
gradients/sub_2_grad/ShapeConst*
dtype0*
valueB:d*
_output_shapes
:
f
gradients/sub_2_grad/Shape_1Const*
dtype0*
valueB:d*
_output_shapes
:
ş
*gradients/sub_2_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/sub_2_grad/Shapegradients/sub_2_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
Ş
gradients/sub_2_grad/SumSumgradients/Square_2_grad/mul_1*gradients/sub_2_grad/BroadcastGradientArgs*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:

gradients/sub_2_grad/ReshapeReshapegradients/sub_2_grad/Sumgradients/sub_2_grad/Shape*
Tshape0*
T0*
_output_shapes
:d
Ž
gradients/sub_2_grad/Sum_1Sumgradients/Square_2_grad/mul_1,gradients/sub_2_grad/BroadcastGradientArgs:1*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:
^
gradients/sub_2_grad/NegNeggradients/sub_2_grad/Sum_1*
T0*
_output_shapes
:

gradients/sub_2_grad/Reshape_1Reshapegradients/sub_2_grad/Neggradients/sub_2_grad/Shape_1*
Tshape0*
T0*
_output_shapes
:d
m
%gradients/sub_2_grad/tuple/group_depsNoOp^gradients/sub_2_grad/Reshape^gradients/sub_2_grad/Reshape_1
Ő
-gradients/sub_2_grad/tuple/control_dependencyIdentitygradients/sub_2_grad/Reshape&^gradients/sub_2_grad/tuple/group_deps*/
_class%
#!loc:@gradients/sub_2_grad/Reshape*
T0*
_output_shapes
:d
Ű
/gradients/sub_2_grad/tuple/control_dependency_1Identitygradients/sub_2_grad/Reshape_1&^gradients/sub_2_grad/tuple/group_deps*1
_class'
%#loc:@gradients/sub_2_grad/Reshape_1*
T0*
_output_shapes
:d
d
gradients/add_2_grad/ShapeConst*
dtype0*
valueB:d*
_output_shapes
:
f
gradients/add_2_grad/Shape_1Const*
dtype0*
valueB:*
_output_shapes
:
ş
*gradients/add_2_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_2_grad/Shapegradients/add_2_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
ş
gradients/add_2_grad/SumSum-gradients/sub_2_grad/tuple/control_dependency*gradients/add_2_grad/BroadcastGradientArgs*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:

gradients/add_2_grad/ReshapeReshapegradients/add_2_grad/Sumgradients/add_2_grad/Shape*
Tshape0*
T0*
_output_shapes
:d
ž
gradients/add_2_grad/Sum_1Sum-gradients/sub_2_grad/tuple/control_dependency,gradients/add_2_grad/BroadcastGradientArgs:1*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:

gradients/add_2_grad/Reshape_1Reshapegradients/add_2_grad/Sum_1gradients/add_2_grad/Shape_1*
Tshape0*
T0*
_output_shapes
:
m
%gradients/add_2_grad/tuple/group_depsNoOp^gradients/add_2_grad/Reshape^gradients/add_2_grad/Reshape_1
Ő
-gradients/add_2_grad/tuple/control_dependencyIdentitygradients/add_2_grad/Reshape&^gradients/add_2_grad/tuple/group_deps*/
_class%
#!loc:@gradients/add_2_grad/Reshape*
T0*
_output_shapes
:d
Ű
/gradients/add_2_grad/tuple/control_dependency_1Identitygradients/add_2_grad/Reshape_1&^gradients/add_2_grad/tuple/group_deps*1
_class'
%#loc:@gradients/add_2_grad/Reshape_1*
T0*
_output_shapes
:
d
gradients/mul_2_grad/ShapeConst*
dtype0*
valueB:*
_output_shapes
:
f
gradients/mul_2_grad/Shape_1Const*
dtype0*
valueB:d*
_output_shapes
:
ş
*gradients/mul_2_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/mul_2_grad/Shapegradients/mul_2_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙

gradients/mul_2_grad/mulMul-gradients/add_2_grad/tuple/control_dependencytruncated_normal_1*
T0*
_output_shapes
:d
Ľ
gradients/mul_2_grad/SumSumgradients/mul_2_grad/mul*gradients/mul_2_grad/BroadcastGradientArgs*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:

gradients/mul_2_grad/ReshapeReshapegradients/mul_2_grad/Sumgradients/mul_2_grad/Shape*
Tshape0*
T0*
_output_shapes
:

gradients/mul_2_grad/mul_1MulVariable/read-gradients/add_2_grad/tuple/control_dependency*
T0*
_output_shapes
:d
Ť
gradients/mul_2_grad/Sum_1Sumgradients/mul_2_grad/mul_1,gradients/mul_2_grad/BroadcastGradientArgs:1*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:

gradients/mul_2_grad/Reshape_1Reshapegradients/mul_2_grad/Sum_1gradients/mul_2_grad/Shape_1*
Tshape0*
T0*
_output_shapes
:d
m
%gradients/mul_2_grad/tuple/group_depsNoOp^gradients/mul_2_grad/Reshape^gradients/mul_2_grad/Reshape_1
Ő
-gradients/mul_2_grad/tuple/control_dependencyIdentitygradients/mul_2_grad/Reshape&^gradients/mul_2_grad/tuple/group_deps*/
_class%
#!loc:@gradients/mul_2_grad/Reshape*
T0*
_output_shapes
:
Ű
/gradients/mul_2_grad/tuple/control_dependency_1Identitygradients/mul_2_grad/Reshape_1&^gradients/mul_2_grad/tuple/group_deps*1
_class'
%#loc:@gradients/mul_2_grad/Reshape_1*
T0*
_output_shapes
:d
b
GradientDescent/learning_rateConst*
dtype0*
valueB
 *   ?*
_output_shapes
: 
ů
4GradientDescent/update_Variable/ApplyGradientDescentApplyGradientDescentVariableGradientDescent/learning_rate-gradients/mul_2_grad/tuple/control_dependency*
_class
loc:@Variable*
use_locking( *
T0*
_output_shapes
:

6GradientDescent/update_Variable_1/ApplyGradientDescentApplyGradientDescent
Variable_1GradientDescent/learning_rate/gradients/add_2_grad/tuple/control_dependency_1*
_class
loc:@Variable_1*
use_locking( *
T0*
_output_shapes
:

GradientDescentNoOp5^GradientDescent/update_Variable/ApplyGradientDescent7^GradientDescent/update_Variable_1/ApplyGradientDescent
4
init_1NoOp^Variable/Assign^Variable_1/Assign
4
init_2NoOp^Variable/Assign^Variable_1/Assign
b
truncated_normal_2/shapeConst*
dtype0*
valueB:d*
_output_shapes
:
\
truncated_normal_2/meanConst*
dtype0*
valueB
 *    *
_output_shapes
: 
^
truncated_normal_2/stddevConst*
dtype0*
valueB
 *ÍĚĚ=*
_output_shapes
: 

"truncated_normal_2/TruncatedNormalTruncatedNormaltruncated_normal_2/shape*
dtype0*
seed2 *

seed *
T0*
_output_shapes
:d

truncated_normal_2/mulMul"truncated_normal_2/TruncatedNormaltruncated_normal_2/stddev*
T0*
_output_shapes
:d
o
truncated_normal_2Addtruncated_normal_2/multruncated_normal_2/mean*
T0*
_output_shapes
:d
L
mul_3/yConst*
dtype0*
valueB
 *ÍĚĚ=*
_output_shapes
: 
L
mul_3Multruncated_normalmul_3/y*
T0*
_output_shapes
:d
L
add_3/yConst*
dtype0*
valueB
 *>*
_output_shapes
: 
A
add_3Addmul_3add_3/y*
T0*
_output_shapes
:d
`
random_uniform_1/shapeConst*
dtype0*
valueB:*
_output_shapes
:
Y
random_uniform_1/minConst*
dtype0*
valueB
 *  ż*
_output_shapes
: 
Y
random_uniform_1/maxConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 

random_uniform_1/RandomUniformRandomUniformrandom_uniform_1/shape*
dtype0*
seed2 *

seed *
T0*
_output_shapes
:
h
random_uniform_1/subSubrandom_uniform_1/maxrandom_uniform_1/min*
T0*
_output_shapes
: 
v
random_uniform_1/mulMulrandom_uniform_1/RandomUniformrandom_uniform_1/sub*
T0*
_output_shapes
:
h
random_uniform_1Addrandom_uniform_1/mulrandom_uniform_1/min*
T0*
_output_shapes
:
v

Variable_2
VariableV2*
dtype0*
shape:*
shared_name *
	container *
_output_shapes
:
Ś
Variable_2/AssignAssign
Variable_2random_uniform_1*
validate_shape(*
_class
loc:@Variable_2*
use_locking(*
T0*
_output_shapes
:
k
Variable_2/readIdentity
Variable_2*
_class
loc:@Variable_2*
T0*
_output_shapes
:
T
zeros_1Const*
dtype0*
valueB*    *
_output_shapes
:
v

Variable_3
VariableV2*
dtype0*
shape:*
shared_name *
	container *
_output_shapes
:

Variable_3/AssignAssign
Variable_3zeros_1*
validate_shape(*
_class
loc:@Variable_3*
use_locking(*
T0*
_output_shapes
:
k
Variable_3/readIdentity
Variable_3*
_class
loc:@Variable_3*
T0*
_output_shapes
:
V
mul_4MulVariable_2/readtruncated_normal_2*
T0*
_output_shapes
:d
I
add_4Addmul_4Variable_3/read*
T0*
_output_shapes
:d
?
sub_3Subadd_4add_3*
T0*
_output_shapes
:d
>
Square_3Squaresub_3*
T0*
_output_shapes
:d
Q
Const_3Const*
dtype0*
valueB: *
_output_shapes
:
_
Mean_3MeanSquare_3Const_3*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 
T
gradients_1/ShapeConst*
dtype0*
valueB *
_output_shapes
: 
V
gradients_1/ConstConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 
_
gradients_1/FillFillgradients_1/Shapegradients_1/Const*
T0*
_output_shapes
: 
o
%gradients_1/Mean_3_grad/Reshape/shapeConst*
dtype0*
valueB:*
_output_shapes
:

gradients_1/Mean_3_grad/ReshapeReshapegradients_1/Fill%gradients_1/Mean_3_grad/Reshape/shape*
Tshape0*
T0*
_output_shapes
:
p
&gradients_1/Mean_3_grad/Tile/multiplesConst*
dtype0*
valueB:d*
_output_shapes
:
¤
gradients_1/Mean_3_grad/TileTilegradients_1/Mean_3_grad/Reshape&gradients_1/Mean_3_grad/Tile/multiples*

Tmultiples0*
T0*
_output_shapes
:d
g
gradients_1/Mean_3_grad/ShapeConst*
dtype0*
valueB:d*
_output_shapes
:
b
gradients_1/Mean_3_grad/Shape_1Const*
dtype0*
valueB *
_output_shapes
: 
g
gradients_1/Mean_3_grad/ConstConst*
dtype0*
valueB: *
_output_shapes
:
 
gradients_1/Mean_3_grad/ProdProdgradients_1/Mean_3_grad/Shapegradients_1/Mean_3_grad/Const*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 
i
gradients_1/Mean_3_grad/Const_1Const*
dtype0*
valueB: *
_output_shapes
:
Ś
gradients_1/Mean_3_grad/Prod_1Prodgradients_1/Mean_3_grad/Shape_1gradients_1/Mean_3_grad/Const_1*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 
c
!gradients_1/Mean_3_grad/Maximum/yConst*
dtype0*
value	B :*
_output_shapes
: 

gradients_1/Mean_3_grad/MaximumMaximumgradients_1/Mean_3_grad/Prod_1!gradients_1/Mean_3_grad/Maximum/y*
T0*
_output_shapes
: 

 gradients_1/Mean_3_grad/floordivFloorDivgradients_1/Mean_3_grad/Prodgradients_1/Mean_3_grad/Maximum*
T0*
_output_shapes
: 
v
gradients_1/Mean_3_grad/CastCast gradients_1/Mean_3_grad/floordiv*

DstT0*

SrcT0*
_output_shapes
: 

gradients_1/Mean_3_grad/truedivRealDivgradients_1/Mean_3_grad/Tilegradients_1/Mean_3_grad/Cast*
T0*
_output_shapes
:d

gradients_1/Square_3_grad/mul/xConst ^gradients_1/Mean_3_grad/truediv*
dtype0*
valueB
 *   @*
_output_shapes
: 
q
gradients_1/Square_3_grad/mulMulgradients_1/Square_3_grad/mul/xsub_3*
T0*
_output_shapes
:d

gradients_1/Square_3_grad/mul_1Mulgradients_1/Mean_3_grad/truedivgradients_1/Square_3_grad/mul*
T0*
_output_shapes
:d
f
gradients_1/sub_3_grad/ShapeConst*
dtype0*
valueB:d*
_output_shapes
:
h
gradients_1/sub_3_grad/Shape_1Const*
dtype0*
valueB:d*
_output_shapes
:
Ŕ
,gradients_1/sub_3_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/sub_3_grad/Shapegradients_1/sub_3_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
°
gradients_1/sub_3_grad/SumSumgradients_1/Square_3_grad/mul_1,gradients_1/sub_3_grad/BroadcastGradientArgs*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:

gradients_1/sub_3_grad/ReshapeReshapegradients_1/sub_3_grad/Sumgradients_1/sub_3_grad/Shape*
Tshape0*
T0*
_output_shapes
:d
´
gradients_1/sub_3_grad/Sum_1Sumgradients_1/Square_3_grad/mul_1.gradients_1/sub_3_grad/BroadcastGradientArgs:1*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:
b
gradients_1/sub_3_grad/NegNeggradients_1/sub_3_grad/Sum_1*
T0*
_output_shapes
:

 gradients_1/sub_3_grad/Reshape_1Reshapegradients_1/sub_3_grad/Neggradients_1/sub_3_grad/Shape_1*
Tshape0*
T0*
_output_shapes
:d
s
'gradients_1/sub_3_grad/tuple/group_depsNoOp^gradients_1/sub_3_grad/Reshape!^gradients_1/sub_3_grad/Reshape_1
Ý
/gradients_1/sub_3_grad/tuple/control_dependencyIdentitygradients_1/sub_3_grad/Reshape(^gradients_1/sub_3_grad/tuple/group_deps*1
_class'
%#loc:@gradients_1/sub_3_grad/Reshape*
T0*
_output_shapes
:d
ă
1gradients_1/sub_3_grad/tuple/control_dependency_1Identity gradients_1/sub_3_grad/Reshape_1(^gradients_1/sub_3_grad/tuple/group_deps*3
_class)
'%loc:@gradients_1/sub_3_grad/Reshape_1*
T0*
_output_shapes
:d
f
gradients_1/add_4_grad/ShapeConst*
dtype0*
valueB:d*
_output_shapes
:
h
gradients_1/add_4_grad/Shape_1Const*
dtype0*
valueB:*
_output_shapes
:
Ŕ
,gradients_1/add_4_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/add_4_grad/Shapegradients_1/add_4_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
Ŕ
gradients_1/add_4_grad/SumSum/gradients_1/sub_3_grad/tuple/control_dependency,gradients_1/add_4_grad/BroadcastGradientArgs*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:

gradients_1/add_4_grad/ReshapeReshapegradients_1/add_4_grad/Sumgradients_1/add_4_grad/Shape*
Tshape0*
T0*
_output_shapes
:d
Ä
gradients_1/add_4_grad/Sum_1Sum/gradients_1/sub_3_grad/tuple/control_dependency.gradients_1/add_4_grad/BroadcastGradientArgs:1*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:

 gradients_1/add_4_grad/Reshape_1Reshapegradients_1/add_4_grad/Sum_1gradients_1/add_4_grad/Shape_1*
Tshape0*
T0*
_output_shapes
:
s
'gradients_1/add_4_grad/tuple/group_depsNoOp^gradients_1/add_4_grad/Reshape!^gradients_1/add_4_grad/Reshape_1
Ý
/gradients_1/add_4_grad/tuple/control_dependencyIdentitygradients_1/add_4_grad/Reshape(^gradients_1/add_4_grad/tuple/group_deps*1
_class'
%#loc:@gradients_1/add_4_grad/Reshape*
T0*
_output_shapes
:d
ă
1gradients_1/add_4_grad/tuple/control_dependency_1Identity gradients_1/add_4_grad/Reshape_1(^gradients_1/add_4_grad/tuple/group_deps*3
_class)
'%loc:@gradients_1/add_4_grad/Reshape_1*
T0*
_output_shapes
:
f
gradients_1/mul_4_grad/ShapeConst*
dtype0*
valueB:*
_output_shapes
:
h
gradients_1/mul_4_grad/Shape_1Const*
dtype0*
valueB:d*
_output_shapes
:
Ŕ
,gradients_1/mul_4_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/mul_4_grad/Shapegradients_1/mul_4_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙

gradients_1/mul_4_grad/mulMul/gradients_1/add_4_grad/tuple/control_dependencytruncated_normal_2*
T0*
_output_shapes
:d
Ť
gradients_1/mul_4_grad/SumSumgradients_1/mul_4_grad/mul,gradients_1/mul_4_grad/BroadcastGradientArgs*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:

gradients_1/mul_4_grad/ReshapeReshapegradients_1/mul_4_grad/Sumgradients_1/mul_4_grad/Shape*
Tshape0*
T0*
_output_shapes
:

gradients_1/mul_4_grad/mul_1MulVariable_2/read/gradients_1/add_4_grad/tuple/control_dependency*
T0*
_output_shapes
:d
ą
gradients_1/mul_4_grad/Sum_1Sumgradients_1/mul_4_grad/mul_1.gradients_1/mul_4_grad/BroadcastGradientArgs:1*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:

 gradients_1/mul_4_grad/Reshape_1Reshapegradients_1/mul_4_grad/Sum_1gradients_1/mul_4_grad/Shape_1*
Tshape0*
T0*
_output_shapes
:d
s
'gradients_1/mul_4_grad/tuple/group_depsNoOp^gradients_1/mul_4_grad/Reshape!^gradients_1/mul_4_grad/Reshape_1
Ý
/gradients_1/mul_4_grad/tuple/control_dependencyIdentitygradients_1/mul_4_grad/Reshape(^gradients_1/mul_4_grad/tuple/group_deps*1
_class'
%#loc:@gradients_1/mul_4_grad/Reshape*
T0*
_output_shapes
:
ă
1gradients_1/mul_4_grad/tuple/control_dependency_1Identity gradients_1/mul_4_grad/Reshape_1(^gradients_1/mul_4_grad/tuple/group_deps*3
_class)
'%loc:@gradients_1/mul_4_grad/Reshape_1*
T0*
_output_shapes
:d
d
GradientDescent_1/learning_rateConst*
dtype0*
valueB
 *   ?*
_output_shapes
: 

8GradientDescent_1/update_Variable_2/ApplyGradientDescentApplyGradientDescent
Variable_2GradientDescent_1/learning_rate/gradients_1/mul_4_grad/tuple/control_dependency*
_class
loc:@Variable_2*
use_locking( *
T0*
_output_shapes
:

8GradientDescent_1/update_Variable_3/ApplyGradientDescentApplyGradientDescent
Variable_3GradientDescent_1/learning_rate1gradients_1/add_4_grad/tuple/control_dependency_1*
_class
loc:@Variable_3*
use_locking( *
T0*
_output_shapes
:

GradientDescent_1NoOp9^GradientDescent_1/update_Variable_2/ApplyGradientDescent9^GradientDescent_1/update_Variable_3/ApplyGradientDescent
\
init_3NoOp^Variable/Assign^Variable_1/Assign^Variable_2/Assign^Variable_3/Assign
b
truncated_normal_3/shapeConst*
dtype0*
valueB:d*
_output_shapes
:
\
truncated_normal_3/meanConst*
dtype0*
valueB
 *    *
_output_shapes
: 
^
truncated_normal_3/stddevConst*
dtype0*
valueB
 *ÍĚĚ=*
_output_shapes
: 

"truncated_normal_3/TruncatedNormalTruncatedNormaltruncated_normal_3/shape*
dtype0*
seed2 *

seed *
T0*
_output_shapes
:d

truncated_normal_3/mulMul"truncated_normal_3/TruncatedNormaltruncated_normal_3/stddev*
T0*
_output_shapes
:d
o
truncated_normal_3Addtruncated_normal_3/multruncated_normal_3/mean*
T0*
_output_shapes
:d
L
mul_5/yConst*
dtype0*
valueB
 *ÍĚĚ=*
_output_shapes
: 
L
mul_5Multruncated_normalmul_5/y*
T0*
_output_shapes
:d
L
add_5/yConst*
dtype0*
valueB
 *>*
_output_shapes
: 
A
add_5Addmul_5add_5/y*
T0*
_output_shapes
:d
`
random_uniform_2/shapeConst*
dtype0*
valueB:*
_output_shapes
:
Y
random_uniform_2/minConst*
dtype0*
valueB
 *  ż*
_output_shapes
: 
Y
random_uniform_2/maxConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 

random_uniform_2/RandomUniformRandomUniformrandom_uniform_2/shape*
dtype0*
seed2 *

seed *
T0*
_output_shapes
:
h
random_uniform_2/subSubrandom_uniform_2/maxrandom_uniform_2/min*
T0*
_output_shapes
: 
v
random_uniform_2/mulMulrandom_uniform_2/RandomUniformrandom_uniform_2/sub*
T0*
_output_shapes
:
h
random_uniform_2Addrandom_uniform_2/mulrandom_uniform_2/min*
T0*
_output_shapes
:
v

Variable_4
VariableV2*
dtype0*
shape:*
shared_name *
	container *
_output_shapes
:
Ś
Variable_4/AssignAssign
Variable_4random_uniform_2*
validate_shape(*
_class
loc:@Variable_4*
use_locking(*
T0*
_output_shapes
:
k
Variable_4/readIdentity
Variable_4*
_class
loc:@Variable_4*
T0*
_output_shapes
:
T
zeros_2Const*
dtype0*
valueB*    *
_output_shapes
:
v

Variable_5
VariableV2*
dtype0*
shape:*
shared_name *
	container *
_output_shapes
:

Variable_5/AssignAssign
Variable_5zeros_2*
validate_shape(*
_class
loc:@Variable_5*
use_locking(*
T0*
_output_shapes
:
k
Variable_5/readIdentity
Variable_5*
_class
loc:@Variable_5*
T0*
_output_shapes
:
V
mul_6MulVariable_4/readtruncated_normal_3*
T0*
_output_shapes
:d
I
add_6Addmul_6Variable_5/read*
T0*
_output_shapes
:d
?
sub_4Subadd_6add_5*
T0*
_output_shapes
:d
>
Square_4Squaresub_4*
T0*
_output_shapes
:d
Q
Const_4Const*
dtype0*
valueB: *
_output_shapes
:
_
Mean_4MeanSquare_4Const_4*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 
T
gradients_2/ShapeConst*
dtype0*
valueB *
_output_shapes
: 
V
gradients_2/ConstConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 
_
gradients_2/FillFillgradients_2/Shapegradients_2/Const*
T0*
_output_shapes
: 
o
%gradients_2/Mean_4_grad/Reshape/shapeConst*
dtype0*
valueB:*
_output_shapes
:

gradients_2/Mean_4_grad/ReshapeReshapegradients_2/Fill%gradients_2/Mean_4_grad/Reshape/shape*
Tshape0*
T0*
_output_shapes
:
p
&gradients_2/Mean_4_grad/Tile/multiplesConst*
dtype0*
valueB:d*
_output_shapes
:
¤
gradients_2/Mean_4_grad/TileTilegradients_2/Mean_4_grad/Reshape&gradients_2/Mean_4_grad/Tile/multiples*

Tmultiples0*
T0*
_output_shapes
:d
g
gradients_2/Mean_4_grad/ShapeConst*
dtype0*
valueB:d*
_output_shapes
:
b
gradients_2/Mean_4_grad/Shape_1Const*
dtype0*
valueB *
_output_shapes
: 
g
gradients_2/Mean_4_grad/ConstConst*
dtype0*
valueB: *
_output_shapes
:
 
gradients_2/Mean_4_grad/ProdProdgradients_2/Mean_4_grad/Shapegradients_2/Mean_4_grad/Const*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 
i
gradients_2/Mean_4_grad/Const_1Const*
dtype0*
valueB: *
_output_shapes
:
Ś
gradients_2/Mean_4_grad/Prod_1Prodgradients_2/Mean_4_grad/Shape_1gradients_2/Mean_4_grad/Const_1*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 
c
!gradients_2/Mean_4_grad/Maximum/yConst*
dtype0*
value	B :*
_output_shapes
: 

gradients_2/Mean_4_grad/MaximumMaximumgradients_2/Mean_4_grad/Prod_1!gradients_2/Mean_4_grad/Maximum/y*
T0*
_output_shapes
: 

 gradients_2/Mean_4_grad/floordivFloorDivgradients_2/Mean_4_grad/Prodgradients_2/Mean_4_grad/Maximum*
T0*
_output_shapes
: 
v
gradients_2/Mean_4_grad/CastCast gradients_2/Mean_4_grad/floordiv*

DstT0*

SrcT0*
_output_shapes
: 

gradients_2/Mean_4_grad/truedivRealDivgradients_2/Mean_4_grad/Tilegradients_2/Mean_4_grad/Cast*
T0*
_output_shapes
:d

gradients_2/Square_4_grad/mul/xConst ^gradients_2/Mean_4_grad/truediv*
dtype0*
valueB
 *   @*
_output_shapes
: 
q
gradients_2/Square_4_grad/mulMulgradients_2/Square_4_grad/mul/xsub_4*
T0*
_output_shapes
:d

gradients_2/Square_4_grad/mul_1Mulgradients_2/Mean_4_grad/truedivgradients_2/Square_4_grad/mul*
T0*
_output_shapes
:d
f
gradients_2/sub_4_grad/ShapeConst*
dtype0*
valueB:d*
_output_shapes
:
h
gradients_2/sub_4_grad/Shape_1Const*
dtype0*
valueB:d*
_output_shapes
:
Ŕ
,gradients_2/sub_4_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_2/sub_4_grad/Shapegradients_2/sub_4_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
°
gradients_2/sub_4_grad/SumSumgradients_2/Square_4_grad/mul_1,gradients_2/sub_4_grad/BroadcastGradientArgs*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:

gradients_2/sub_4_grad/ReshapeReshapegradients_2/sub_4_grad/Sumgradients_2/sub_4_grad/Shape*
Tshape0*
T0*
_output_shapes
:d
´
gradients_2/sub_4_grad/Sum_1Sumgradients_2/Square_4_grad/mul_1.gradients_2/sub_4_grad/BroadcastGradientArgs:1*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:
b
gradients_2/sub_4_grad/NegNeggradients_2/sub_4_grad/Sum_1*
T0*
_output_shapes
:

 gradients_2/sub_4_grad/Reshape_1Reshapegradients_2/sub_4_grad/Neggradients_2/sub_4_grad/Shape_1*
Tshape0*
T0*
_output_shapes
:d
s
'gradients_2/sub_4_grad/tuple/group_depsNoOp^gradients_2/sub_4_grad/Reshape!^gradients_2/sub_4_grad/Reshape_1
Ý
/gradients_2/sub_4_grad/tuple/control_dependencyIdentitygradients_2/sub_4_grad/Reshape(^gradients_2/sub_4_grad/tuple/group_deps*1
_class'
%#loc:@gradients_2/sub_4_grad/Reshape*
T0*
_output_shapes
:d
ă
1gradients_2/sub_4_grad/tuple/control_dependency_1Identity gradients_2/sub_4_grad/Reshape_1(^gradients_2/sub_4_grad/tuple/group_deps*3
_class)
'%loc:@gradients_2/sub_4_grad/Reshape_1*
T0*
_output_shapes
:d
f
gradients_2/add_6_grad/ShapeConst*
dtype0*
valueB:d*
_output_shapes
:
h
gradients_2/add_6_grad/Shape_1Const*
dtype0*
valueB:*
_output_shapes
:
Ŕ
,gradients_2/add_6_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_2/add_6_grad/Shapegradients_2/add_6_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
Ŕ
gradients_2/add_6_grad/SumSum/gradients_2/sub_4_grad/tuple/control_dependency,gradients_2/add_6_grad/BroadcastGradientArgs*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:

gradients_2/add_6_grad/ReshapeReshapegradients_2/add_6_grad/Sumgradients_2/add_6_grad/Shape*
Tshape0*
T0*
_output_shapes
:d
Ä
gradients_2/add_6_grad/Sum_1Sum/gradients_2/sub_4_grad/tuple/control_dependency.gradients_2/add_6_grad/BroadcastGradientArgs:1*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:

 gradients_2/add_6_grad/Reshape_1Reshapegradients_2/add_6_grad/Sum_1gradients_2/add_6_grad/Shape_1*
Tshape0*
T0*
_output_shapes
:
s
'gradients_2/add_6_grad/tuple/group_depsNoOp^gradients_2/add_6_grad/Reshape!^gradients_2/add_6_grad/Reshape_1
Ý
/gradients_2/add_6_grad/tuple/control_dependencyIdentitygradients_2/add_6_grad/Reshape(^gradients_2/add_6_grad/tuple/group_deps*1
_class'
%#loc:@gradients_2/add_6_grad/Reshape*
T0*
_output_shapes
:d
ă
1gradients_2/add_6_grad/tuple/control_dependency_1Identity gradients_2/add_6_grad/Reshape_1(^gradients_2/add_6_grad/tuple/group_deps*3
_class)
'%loc:@gradients_2/add_6_grad/Reshape_1*
T0*
_output_shapes
:
f
gradients_2/mul_6_grad/ShapeConst*
dtype0*
valueB:*
_output_shapes
:
h
gradients_2/mul_6_grad/Shape_1Const*
dtype0*
valueB:d*
_output_shapes
:
Ŕ
,gradients_2/mul_6_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_2/mul_6_grad/Shapegradients_2/mul_6_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙

gradients_2/mul_6_grad/mulMul/gradients_2/add_6_grad/tuple/control_dependencytruncated_normal_3*
T0*
_output_shapes
:d
Ť
gradients_2/mul_6_grad/SumSumgradients_2/mul_6_grad/mul,gradients_2/mul_6_grad/BroadcastGradientArgs*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:

gradients_2/mul_6_grad/ReshapeReshapegradients_2/mul_6_grad/Sumgradients_2/mul_6_grad/Shape*
Tshape0*
T0*
_output_shapes
:

gradients_2/mul_6_grad/mul_1MulVariable_4/read/gradients_2/add_6_grad/tuple/control_dependency*
T0*
_output_shapes
:d
ą
gradients_2/mul_6_grad/Sum_1Sumgradients_2/mul_6_grad/mul_1.gradients_2/mul_6_grad/BroadcastGradientArgs:1*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:

 gradients_2/mul_6_grad/Reshape_1Reshapegradients_2/mul_6_grad/Sum_1gradients_2/mul_6_grad/Shape_1*
Tshape0*
T0*
_output_shapes
:d
s
'gradients_2/mul_6_grad/tuple/group_depsNoOp^gradients_2/mul_6_grad/Reshape!^gradients_2/mul_6_grad/Reshape_1
Ý
/gradients_2/mul_6_grad/tuple/control_dependencyIdentitygradients_2/mul_6_grad/Reshape(^gradients_2/mul_6_grad/tuple/group_deps*1
_class'
%#loc:@gradients_2/mul_6_grad/Reshape*
T0*
_output_shapes
:
ă
1gradients_2/mul_6_grad/tuple/control_dependency_1Identity gradients_2/mul_6_grad/Reshape_1(^gradients_2/mul_6_grad/tuple/group_deps*3
_class)
'%loc:@gradients_2/mul_6_grad/Reshape_1*
T0*
_output_shapes
:d
d
GradientDescent_2/learning_rateConst*
dtype0*
valueB
 *   ?*
_output_shapes
: 

8GradientDescent_2/update_Variable_4/ApplyGradientDescentApplyGradientDescent
Variable_4GradientDescent_2/learning_rate/gradients_2/mul_6_grad/tuple/control_dependency*
_class
loc:@Variable_4*
use_locking( *
T0*
_output_shapes
:

8GradientDescent_2/update_Variable_5/ApplyGradientDescentApplyGradientDescent
Variable_5GradientDescent_2/learning_rate1gradients_2/add_6_grad/tuple/control_dependency_1*
_class
loc:@Variable_5*
use_locking( *
T0*
_output_shapes
:

GradientDescent_2NoOp9^GradientDescent_2/update_Variable_4/ApplyGradientDescent9^GradientDescent_2/update_Variable_5/ApplyGradientDescent

init_4NoOp^Variable/Assign^Variable_1/Assign^Variable_2/Assign^Variable_3/Assign^Variable_4/Assign^Variable_5/Assign""E
train_op9
7
GradientDescent
GradientDescent_1
GradientDescent_2"Ď
	variablesÁž
.

Variable:0Variable/AssignVariable/read:0
4
Variable_1:0Variable_1/AssignVariable_1/read:0
4
Variable_2:0Variable_2/AssignVariable_2/read:0
4
Variable_3:0Variable_3/AssignVariable_3/read:0
4
Variable_4:0Variable_4/AssignVariable_4/read:0
4
Variable_5:0Variable_5/AssignVariable_5/read:0"Ů
trainable_variablesÁž
.

Variable:0Variable/AssignVariable/read:0
4
Variable_1:0Variable_1/AssignVariable_1/read:0
4
Variable_2:0Variable_2/AssignVariable_2/read:0
4
Variable_3:0Variable_3/AssignVariable_3/read:0
4
Variable_4:0Variable_4/AssignVariable_4/read:0
4
Variable_5:0Variable_5/AssignVariable_5/read:0oa