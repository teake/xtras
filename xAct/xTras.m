(*********************)
(*                   *)
(*   Package setup   *)
(*                   *)
(*********************)

xAct`xTras`$Version = "1.0.4pre";
xAct`xTras`$xTensorVersionExpected = {"1.0.4", {2012, 5, 5}};

If[Unevaluated[xAct`xCore`Private`$LastPackage] === xAct`xCore`Private`$LastPackage, 
	xAct`xCore`Private`$LastPackage = "xAct`xTras`"
];

BeginPackage["xAct`xTras`",{"xAct`xCore`","xAct`xPerm`","xAct`xTensor`","xAct`xPert`", "xAct`Invar`"}]

(* Check if we have the correct version of xAct. *)
If[Not@OrderedQ@Map[Last, {xAct`xTras`$xTensorVersionExpected, xAct`xTensor`$Version}], 
	Message[General::versions, "xTensor", xAct`xTensor`$Version, xAct`xTras`$xTensorVersionExpected];
	Abort[]
];

(* Print info *)
Print[xAct`xCore`Private`bars];
Print["Package xAct`xTras`  version ", xAct`xTras`$Version];
Print["Written by Teake Nutma."];
Print["https://code.google.com/p/xact-xtras/"];


If[xAct`xCore`Private`$LastPackage === "xAct`xTras`",
	Unset[xAct`xCore`Private`$LastPackage];
	Print[xAct`xCore`Private`bars];
	Print["These packages come with ABSOLUTELY NO WARRANTY; for details \
type Disclaimer[]. This is free software, and you are welcome to \
redistribute it under certain conditions. See the General Public \
License for details."];
	Print[xAct`xCore`Private`bars]
];

(*********************)
(*                   *)
(*  Public messages  *)
(*                   *)
(*********************)


(* MetricPermutations *)

AllContractions::usage =
	"AllContractions[metric,indices][expr] gives all possible contractions of \
expr (which can also be a list of expressions with the same free indices) \
with metrics with the given indices.";


MetricPermutations::usage =
	"MetricPermutations[metric,indices] gives a list of all possible \
permutations of indices distributed over n/2 metrics (n being the number of indices). \
Thus MetricPermutations[g][{a,b,c,d}] gives {g[a,b]g[c,d], g[a,c]g[b,d], g[a,d]g[b,c]}. \
\n\nNaively this gives n! combinations, but because the metric is symmetric and the \
ordering of the product is irrelevant, the number of permutations reduces to \
(n-1)!!, which is roughly the square root of n!. MetricPermutations takes \
this simplification into account.";

UnorderedPairsPermutations::usage =
	"UnorderPairsPermutations[list] gives all permutations of the elements of \
list that are unorder pairs. list has to have an even number of elements.";


(* ClearAutomaticRules et. al. *)

ClearAutomaticRules::usage = 
  "ClearAutomaticRules[symbol,rules] tries to remove rules from the \
upvalues and downvalues of symbol.";

ClearCurvatureRelations::usage = 
  "ClearCurvatureRelations[CD] removes the automatic curvature \
relations for the covariant derivative CD.";

SetCurvatureRelations::usage = 
  "SetCurvatureRelations[CD] sets the automatic curvature relations \
for the covariant derivative CD.";

CurvatureRelationsQ::usage = 
  "CurvatureRelationsQ[CD] returns True if all of the curvature \
relations for the covariant derivative CD have been set as automatic \
rules, and False otherwise.";


(* Invar extensions *)

EulerDensity::usage = 
  "EulerDensity[CD] give the Euler density of the curvature tensor of \
the covariant derivative CD. If the manifold has generic dimension, \
you can use EulerDensity[CD,dim] to specify a dimension.";

InvarWrapper::usage = 
  "InvarWrapper[invarFunction,g][expr,otherargs] wraps an Invar \
function specified by invarFunction s.t. you can use your own options \
for ToCanonical, ContractMetric, and CurvatureRelations.";

MyRiemannSimplify::usage = 
  "MyRiemannSimplify[metric,level][expr] works similarly to \
RiemannSimplify, except that it also works for generic options for \
ToCanonical etc, and works on more general expressions. \
\nNote that it only simplifies expression consisting of Riccis and Riemanns, \
and not of other curvature tensors.";

CurvatureTensors::usage = 
  "CurvatureTensors[CD] gives the list of all the curvature tensors \
of CD.";

IncludeDuals::usage = 
  "Option for SingleInvariants, ProductInvariants, RangeInvariants, \
and InvarLagrangian whether to include dual invariants or not.";

Coefficients::usage = "Option for InvarInvariants.";

OrderParameter::usage = "Options for InvarLagrangian.";

SingleInvariants::noduals = 
  "Omitting dual invariants because dimension is other than 4 (due to \
Invar limitation).";

SingleInvariants::oddorder = 
  "The order can only be even, not odd (due to Invar limitation).";

SingleInvariants::usage = 
  "SingleInvariants[metric,order] gives the single invariants of the \
Riemann tensor at that given order (which has the standard level \
specification)";

ProductInvariants::usage = 
  "ProductInvariants[metric,order] gives all product invariants of \
the Riemann tensor at that given order (which has the standard level \
specification)";

InvarLagrangian::usage = 
  "InvarLagrangian[metric, maxorder] gives the most general Lagrangian up to \
maxorder in derivatives of the metric, consisting solely of curvature tensors.";

OrderCoefficient::usage = 
  "OrderCoefficient[order,n] gives a constant symbol for InvarLagrangian.";


(* MapTimed *)

LevelSpecQ::usage = 
	"LevelSpecQ[levelspec] yields True if levelspec is a standard levelspec, and false otherwise.";

TimeString::usage = 
  "TimeString[seconds] nicely formats the amount of seconds as a \
string.";

Description::usage = "Option for MapTimed.";

MonitorSteps::usage = "Option for MapTimed.";

MapTimed::usage = 
  "MapTimed[func,expr] is similar to Map, except that it also prints \
the expected calculation time.";


(* TensorCollect et al *)

ConstantExprQ::usage = 
  "ConstantExprQ[expr] returns True if expr only contains contains \
constants (i.e. constant symbols and integers, fractions, etc), and \
False otherwise.";

TensorCollector::usage = 
  "TensorCollector[expr] wraps all tensors in expr in a head \
'TensorCollector'.";

RemoveConstants::usage = 
  "RemoveConstants[expr] removes all constants from the tensorial \
expression expr.";

RemoveTensors::usage = 
  "RemoveTensors[expr] removes all tensors from expr, and leaves just \
the constants.";

CollectMethod::usage =
	"CollectMethod is an option for TensorCollect.";

SimplifyMethod::usage =
	"SimplifyMethod is an option for TensorCollect.";

TensorCollect::usage = 
  "TensorCollect[expr] acts as Collect[expr,tensorsof[expr]]";

DoTensorCollect::usage = 
  "DoTensorCollect[func][expr] maps func on every collected tensor in \
expr. This is useful if you have an expression with one tensor object \
with lots of different constants.";

MakeEquationRule::usage = 
  "MakeEquationRule[{equation,pattern,cond}] returns rules for \
tensors matching pattern in the given equation.";

ToConstantSymbolEquations::usage =
	"ToConstantSymbolEquations[eq] takes the tensorial equation eq \
and turns it into equations for the constant symbols appearing eq.";

SolveConstants::usage =
	"SolveConstants[expr, vars] attempts to solve the tensorial expr for constant \
symbols vars. \nSolveConstants[expr] attempts to solve expr for all the constant \
symbols appearing in expr.";

(* Simplifying *)

PreferBoxOfRule::usage = 
  "PreferBoxOfRule[tensor,CD] gives rules for rewriting an expression \
with boxes on the given tensor with respect to the given CD.";

PreferDivOfRule::usage = 
  "PreferDivOfRule[tensor,CD] gives rules for rewriting an expression \
with divergences of the given tensor with respect to the given CD.";

DivFreeQ::usage = 
  "DivFreeQ[expr,tensor,CD] returns True if expr does not contain a \
divergence of the given tensor w.r.t. the given CD after arbritrary \
commutations of the covariant derivatives."; 

RicciDivRule::usage = 
  "RicciDivRule[CD] gives rules for rewriting the divergence of the \
Ricci tensor of the given covariant derivative in terms of the Ricci \
scalar.";

RiemannDivRule::usage = 
  "RiemannDivRule[CD] gives rules for rewriting the divergence of the \
Riemann tensor of the given covariant derivative in terms of the \
Ricci tensor.";

FS::usage = 
  "FS is an alias of FullSimplification. Kept for backwards compatibility.";

FullSimplification::usage =
	"FullSimplification[metric][expr] tries to simplify expr as much as possible, \
taking Bianchi identities into account and sorting covariant derivatives. \
It also uses to power of the Invar package to simplify scalar invariants of  \
Riccis and Riemanns (but not of other curvature tensors like the Weyl tensor).";

(* Variational calculus *)

DefVariation::usage =
	"DefVariation is an option for DefMetric. If True, DefMetric automatically \
defines a covariant metric variation.";

VarL::usage = 
	"VarL[ metric[a,b] ][ L ] varies Sqrt[-Det[g]] * L with respect to metric[a,b], \ 
and then divides with Sqrt[-Det[g]].";

DefMetricVariation::usage = 
  "DefMetricVariation[metric, pert, param] first defines a metric \
perturbation with the same arguments, and then defines covariant VarD \
and VarL functions for the metric.";

ExpandPerturbationDer::usage = 
	"ExpandPerturbationDer expands the perturbations of derivatives. 
	It's similar to the private xAct function ExpandPerturbationDer, but not quite.";


(* Background perturbations *)

ExpandBackground::usage = 
  "ExpandBackground[expr,n] expands only the nth order perbutation of \
expr on an arbitrary background, without an expansion parameter or \
1/n! factor. The background is set with the option \
BackgroundSolution.";

PerturbBackground::usage = 
  "PerturbBackground[expr,n] does an (unexpanded) perturbation around \
an arbitrary background for only the order n. This is useful if you \
want to keep symbolic things like Perturbation[EinsteinCD[]] \
unexpanded. The background is set with the option BackgroundSolution.";

ToBackground::usage = 
  "ToBackground[expr] ensures expr is on some background. The \
background is set with the option BackgroundSolution.";

ExpandFlat::usage = 
  "ExpandFlat[expr,n] expands only the nth order perbutation of expr \
on a flat background, without an expansion parameter or 1/n! \
factor.";

PerturbFlat::usage = 
  "PerturbFlat[expr,n] does an (unexpanded) perturbation around a \
flat background for only the order n. This is useful if you want to \
keep symbolic things like Perturbation[EinsteinCD[]] unexpanded.";

ToFlat::usage = 
  "ToFlat[expr] ensures expr is on a flat background, i.e. it sets \
unperturbed curvature tensors to zero, etc.";

FlatRules::usage = 
  "FlatRules[expr] produces rules for a covariant derivative CD such \
that, when applied to an expression, the expression is effectively on \
a flat background.";

BackgroundSolution::usage = 
  "BackgroundSolution is an option for ToBackground. It should be (a list of) replacement rule(s).";

ExtraRules::usage = "ExtraRules is an option for ApplyBackground.";

SymmetricSpaceRules::usage = 
  "SymmetricSpaceRules[CD,K] produces replacement rules for the \
curvature tensors of CD on a symmetric space of constant curvature K.";

EinsteinSpaceRules::usage = 
  "EinsteinSpaceRules[CD,K] produces replacement rules for the \
curvature tensors of CD (except the Riemann) on an Einstein space of \
curvature K.";


(* Young tableaux *)

YoungTableauQ::usage = 
  "YoungTableauQ[tableau] returns True if tableau is a proper Young \
tableau, and False otherwhise. A proper Young tableau is a list of \
lists of integers or symbols, whose intersection is empty. \
Furthermore the length of the lists has to decrease monotonically.";

YoungSymmetrize::usage = 
  "YoungSymmetrize[expr,tableau] symmetrizes a tensorial expression \
according to tableau, where the entries of the tableau have to be the \
set of free indices of expr.\n
  YoungSymmetrize[tensor,tableau] symmetrizes the tensor (withouth \
the [] on tensor) according to tableau, where the entries of tableau \
are integers.";

YoungProject::usage = 
  "YoungProject[expr,tableau] projects a tensorial expression onto \
tableau, where the entries of the tableau have to be the set of free \
indices of expr. \nYoungProject[tensor,tableau] projects the tensor \
(withouth the [] on tensor) onto tableau, where the entries of \
tableau are integers. \n\nThe difference between projecting and \
symmetrizing is that the projection has a different overall factor, \
such that repeatedly projecting does not change the result.";

RiemannYoungRule::usage = 
  "RiemannYoungRule[CD,n] gives the projection rule of n'th covariant \
derivative of the Riemann tensor of the covariant derivative CD onto \
its Young tableau. n has the default levelspec form. The default for n is {0}.";


(* Other stuff *)

DerivativeOrder::usage =
	"DerivativeOrder[expr,CD] gives the order of derivatives of expr.";

SortedCovDsQ::usage =
	"SortedCovDsQ[expr] returns True if the expression has all its covariant \
derivatives sorted, and False otherwise. \
\n\nSortedCovDsQ[expr,CD] only checks the covariant derivative CD.";

(* Extra curvature tensors *)
	
Schouten::usage = 
  "Schouten is a reserved word in xTras. It is used to generate the \
name of the Schouten curvature tensor associated to a connection \
acting on a tangent bundle.";

SchoutenToRicci::usage = "SchoutenToRicci[expr,cd] converts Schouten tensors to Ricci tensors.";

RicciToSchouten::usage = "RicciToSchouten[expr,cd] converts Ricci tensors to Schouten tensors.";

SchoutenCC::usage = 
  "SchoutenCC is a reserved word in xTras. It is used to generate the \
name of the cosmological Schouten curvature tensor associated to a connection \
acting on a tangent bundle.";

SchoutenCCToRicci::usage = "SchoutenCCToRicci[expr,cd] converts cosmological Schouten tensors to Ricci tensors.";

RicciToSchoutenCC::usage = "RicciToSchoutenCC[expr,cd] converts Ricci tensors to cosmological Schouten tensors.";

EinsteinCC::usage = 
  "EinsteinCC is a reserved word in xTras. It is used to generate the \
name of the cosmological Einstein curvature tensor associated to a connection \
acting on a tangent bundle.";

EinsteinCCToRicci::usage = "EinsteinCCToRicci[expr,cd] converts cosmological Einstein tensors to Ricci tensors.";

RicciToEinsteinCC::usage = "RicciToEinsteinCC[K][expr,cd] converts Ricci tensors into cosmological Einstein tensors.";


(* Killing vectors *)

KillingVectorQ::usage = 
  "KillingVectorQ[tensor] return True if the tensor is defined to be a Killing vector";

KillingVectorOf::usage = 
  "Option for DefTensor. If the tensor is to be a Killing vector, the \
option should be a metric. (i.e. KillingVectorOf -> metric)";


(*********************)
(*                   *)
(*   Begin private   *)
(*                   *)
(*********************)


Begin["`Private`"]


(**************************)
(* Importing xAct symbols *)
(**************************)

slot := xAct`xTensor`Private`slot; 


(**********************)
(* Curvature tensors  *)
(**********************)

xTension["xTras`", DefMetric, "End"] := xTrasDefMetric;

xTrasDefMetric[signdet_, metric_[-a_, -b_], cd_, options___]:= Module[{M,D,einsteincc,rs,defvar,metricPert,metricPar},
	
	defvar = TrueQ[DefVariation /. CheckOptions[options] /. Options[DefMetric]];
	
	M 			= ManifoldOfCovD[cd];
	D 			= DimOfManifold[M];
	einsteincc 	= GiveSymbol[EinsteinCC,cd];
	rs 			= GiveSymbol[RicciScalar,cd];
	
	(* Define the new curvature tensors. *)
	DefTensor[GiveSymbol[Schouten,cd][-a, -b], 
		M, Symmetric[{-a, -b}], PrintAs -> GiveOutputString[Schouten,cd], Master->cd];
	DefTensor[GiveSymbol[SchoutenCC,cd][LI[_],-a, -b], 
		M, Symmetric[{-a, -b}], PrintAs -> GiveOutputString[Schouten,cd], Master->cd];	
	DefTensor[einsteincc[LI[_],-a, -b], 
		M, Symmetric[{-a, -b}], PrintAs -> GiveOutputString[Einstein,cd], Master->cd];
	
	(* Teach xPert how to expand the new curvature tensors. *)
	xAct`xPert`Private`ExpandPerturbation1[Perturbation[s:GiveSymbol[Schouten,cd][__],n_.],opts___] := 
		ExpandPerturbation[Perturbation[SchoutenToRicci@s, n], opts];
	xAct`xPert`Private`ExpandPerturbation1[Perturbation[s:GiveSymbol[SchoutenCC,cd][__],n_.],opts___] := 
		ExpandPerturbation[Perturbation[SchoutenCCToRicci@s, n], opts];
	xAct`xPert`Private`ExpandPerturbation1[Perturbation[s:GiveSymbol[EinsteinCC,cd][__],n_.],opts___] := 
		ExpandPerturbation[Perturbation[EinsteinCCToRicci@s, n], opts];
	
	(* Some identities for the cosmological Einstein tensor. *)
	cd[c_]@einsteincc[LI[_],___,d_,___] /; c === ChangeIndex[d] ^= 0;
	einsteincc[LI[K_], c_, d_] /; c === ChangeIndex[d] := (1/ 2 (D-2)(D-1) D K + (1-D/2) rs[]);
	
	If[defvar,
		metricPert = GiveSymbol[metric,Perturbation];
		metricPar  = GiveSymbol[metric,"\[Epsilon]"];
		DefMetricVariation[metric,metricPert,metricPar];
	];

];

(* TODO: undefmetric hook *)

GiveOutputString[Schouten, covd_] := StringJoin["S", "[", SymbolOfCovD[covd][[2]], "]"];

SchoutenToRicci[expr_, cd_?CovDQ] := Module[{d, ricci, rs, schouten, metric},
	ricci 		= GiveSymbol[Ricci, cd];
	rs 			= GiveSymbol[RicciScalar, cd];
	schouten 	= GiveSymbol[Schouten, cd];
	metric 		= MetricOfCovD@cd;
	d 			= DimOfManifold@ManifoldOfCovD@cd;
	expr /. schouten[inds__] :> ricci[inds]/(d - 2) - metric[inds] rs[] / (2 (d - 1) (d - 2))
];

SchoutenToRicci[expr_] := Fold[SchoutenToRicci, expr, DeleteCases[$CovDs, PD]];

RicciToSchouten[expr_, cd_?CovDQ] := Module[{d, ricci, rs, schouten, metric},
	ricci 		= GiveSymbol[Ricci, cd];
	rs 			= GiveSymbol[RicciScalar, cd];
	schouten	= GiveSymbol[Schouten, cd];
	metric 		= MetricOfCovD@cd;
	d 			= DimOfManifold@ManifoldOfCovD@cd;
	expr /. ricci[inds__] :> schouten[inds] (d - 2) + metric[inds] rs[] /(2 (d - 1))
];

RicciToSchouten[expr_] := Fold[RicciToSchouten, expr, DeleteCases[$CovDs, PD]];

SchoutenCCToRicci[expr_, cd_?CovDQ] := Module[{d, ricci, rs, schouten, metric},
	ricci 		= GiveSymbol[Ricci, cd];
	rs 			= GiveSymbol[RicciScalar, cd];
	schouten 	= GiveSymbol[SchoutenCC, cd];
	metric 		= MetricOfCovD@cd;
	d 			= DimOfManifold@ManifoldOfCovD@cd;
	expr /. schouten[LI[K_],inds__] :> ricci[inds]/(d - 2) - metric[inds] rs[] / (2 (d - 1) (d - 2)) - 1/2 K  metric[inds]
];

SchoutenCCToRicci[expr_] := Fold[SchoutenCCToRicci, expr, DeleteCases[$CovDs, PD]];

RicciToSchoutenCC[K_][expr_, cd_?CovDQ] := Module[{d, ricci, rs, schouten, metric},
	ricci 		= GiveSymbol[Ricci, cd];
	rs 			= GiveSymbol[RicciScalar, cd];
	schouten 	= GiveSymbol[SchoutenCC, cd];
	metric 		= MetricOfCovD@cd;
	d 			= DimOfManifold@ManifoldOfCovD@cd;
	expr /. ricci[inds__] :> schouten[LI[K],inds] (d - 2) + metric[inds] rs[] /(2 (d - 1)) + 1/2 (d-2) K metric[inds]
];

RicciToSchoutenCC[K_][expr_] := Fold[RicciToSchoutenCC[K], expr, DeleteCases[$CovDs, PD]];

EinsteinCCToRicci[expr_, cd_?CovDQ] := Module[{ricci, rs, einsteincc, d, metric},
	d 			= DimOfManifold@ManifoldOfCovD@cd;
	metric 		= MetricOfCovD[cd];
	ricci 		= GiveSymbol[Ricci, cd];
	rs 			= GiveSymbol[RicciScalar, cd];
	einsteincc 	= GiveSymbol[EinsteinCC, cd];
	expr /. einsteincc[LI[K_], inds__] :> (ricci[inds] + 1/2 metric[inds] (-rs[] + (d - 2) (d - 1) K))
];

EinsteinCCToRicci[expr_] := Fold[EinsteinCCToRicci, expr, DeleteCases[$CovDs, PD]];

RicciToEinsteinCC[K_][expr_, cd_?CovDQ] := Module[{ricci, rs, einsteincc, d, metric},
	d 			= DimOfManifold@ManifoldOfCovD@cd;
	metric 		= MetricOfCovD[cd];
	ricci 		= GiveSymbol[Ricci, cd];
	rs 			= GiveSymbol[RicciScalar, cd];
	einsteincc 	= GiveSymbol[EinsteinCC, cd];
	expr /. ricci[inds__] :> (einsteincc[LI[K], inds] - 1/2 metric[inds] (-rs[] + (d - 2) (d - 1) K))
];

RicciToEinsteinCC[K_][expr_] := Fold[RicciToEinsteinCC[K], expr, DeleteCases[$CovDs, PD]];


(*************************)
(* Clear automatic rules *)
(*************************)


SetAttributes[ClearAutomaticRules, HoldFirst];

ClearAutomaticRules[symbol_Symbol, rules_List, options___?OptionQ] := Module[{
	pos, upvs, downvs, othervs, unknownvs, up, down, other, 
    verbose = Verbose /. CheckOptions[options] /. Options[AutomaticRules]
}, 
	pos[list1_, list2_] := Position[Map[Intersection[list1, {#}] =!= {} &, list2], True];

	(* Get the positions for verbose info. *)
	downvs 		= Flatten@pos[DownValues[symbol], rules];
	upvs 		= Flatten@pos[UpValues[symbol], rules];
	othervs 	= Flatten@pos[$Rules, rules];
	unknownvs 	= Complement[Range[Length[rules]], downvs, upvs, othervs];

	(* Get the positions for deleting rules. *)
	down 	= pos[rules, DownValues[symbol]];
	up 		= pos[rules, UpValues[symbol]];
	other 	= pos[rules, $Rules];
	
	(* The actual work. *)
	DownValues[symbol] 	= Delete[DownValues[symbol], down];
	UpValues[symbol] 	= Delete[UpValues[symbol], up];
	$Rules 				= Delete[$Rules, other];

	(*Verbose output*)
	If[Length[downvs] > 0 && verbose, 
		Print["   Rules ", Shallow[downvs], " have been removed as DownValues for ", symbol, "."]];
	If[Length[upvs] > 0 && verbose, 
		Print["   Rules ", Shallow[upvs], " have been removed as UpValues for ", symbol, "."]];
	If[Length[othervs] > 0 && verbose, 
		Print["   Rules ", Shallow[othervs], " have been removed as generic rules."]];
	If[Length[unknownvs] > 0 && verbose, 
		Print["   Rules ", Shallow[unknownvs], " were not automatic rules for ", symbol, "."]];

];

ClearCurvatureRelations[cd_?CovDQ, options___?OptionQ] := (
	ClearAutomaticRules[Evaluate[GiveSymbol[Ricci, cd]], CurvatureRelations[cd, Ricci], options];
	ClearAutomaticRules[Evaluate[GiveSymbol[Riemann, cd]], CurvatureRelations[cd, Riemann], options];
);

SetCurvatureRelations[cd_?CovDQ, options___?OptionQ] := (
	AutomaticRules[Evaluate[GiveSymbol[Ricci, cd]], CurvatureRelations[cd, Ricci], options];
	AutomaticRules[Evaluate[GiveSymbol[Riemann, cd]], CurvatureRelations[cd, Riemann], options];
);

CurvatureRelationsQ[cd_?CovDQ] := Module[
	{
		ricci 	= GiveSymbol[Ricci, cd], 
		riemann	= GiveSymbol[Riemann, cd]
	},
	Complement[
		CurvatureRelations[cd, Ricci], 
		DownValues[Evaluate[ricci]], UpValues[Evaluate[ricci]]
	] === {} &&	Complement[
		CurvatureRelations[cd, Riemann], 
		DownValues[Evaluate[riemann]], 
		UpValues[Evaluate[riemann]]
	] === {}
];



(********************)
(* Invar extensions *)
(********************)


EulerDensity[cd_?CovDQ] := EulerDensity[cd, DimOfManifold[ManifoldOfCovD[cd]]];

EulerDensity[cd_?CovDQ, D_?EvenQ] := Module[{indices, e1, e2, riemann, n, e},
	indices 	= Table[DummyIn@VBundleOfMetric@MetricOfCovD@cd, {2 D}];
	e 			= GiveSymbol[epsilon, MetricOfCovD[cd]];
	e1 			= e @@ (-indices[[1 ;; D]]);
	e2 			= e @@ (-indices[[D + 1 ;; 2 D]]);
	riemann[i_] := GiveSymbol[Riemann, cd][
		indices[[2 i - 1]],
		indices[[2 i]],
		indices[[2 i + D - 1]],
		indices[[2 i + D]]
	];
	1/2^(D/2) e1 e2 Product[riemann[n], {n, 1, D/2}] // ContractMetric // ToCanonical // Expand
];

InvarWrapper[invarFunction_, g_?MetricQ][expr_, otherargs___] := 
  Module[{cd, tangent, i1, i2, i3, ricciscalar, ricci, riemann, rules,
     result, curvrel, monvb, uppder,commutescalars},
   (* Initialize *)
   cd = CovDOfMetric[g];
   tangent = VBundleOfMetric[g];
   i1 = DummyIn[tangent];
   i2 = DummyIn[tangent];
   i3 = DummyIn[tangent];
   ricci = GiveSymbol[Ricci, cd];
   ricciscalar = GiveSymbol[RicciScalar, cd];
   riemann = GiveSymbol[Riemann, cd];
   
   (* Store old config values *)
   curvrel = CurvatureRelationsQ[cd];
   monvb = Options[ToCanonical, UseMetricOnVBundle];
   uppder = Options[ContractMetric, AllowUpperDerivatives];
   commutescalars = xAct`xTensor`$CommuteCovDsOnScalars;
   
   (* Set config values to Invar compatible settings *)
   SetOptions[ToCanonical, UseMetricOnVBundle -> All];
   SetOptions[ContractMetric, AllowUpperDerivatives -> True];
   ClearCurvatureRelations[cd, Verbose -> False];
   xAct`xTensor`$CommuteCovDsOnScalars = False;
   
   (* Make rules to convert the Ricci scalar and Ricci tensor to Riemanns *)
   rules = Join[
     MakeRule[
      Evaluate[{ricciscalar[], Scalar[riemann[i1, i2, -i1, -i2]]}], 
      MetricOn -> All],
     MakeRule[Evaluate[{ricci[i1, i2], riemann[i1, i3, i2, -i3]}], 
      MetricOn -> All]
     ];
   (* Apply them to the expression and run RiemannSimplify *)
   result = invarFunction[g, expr /. rules, otherargs];
   
   (* Reapply the settings as they were before *)
   xAct`xTensor`$CommuteCovDsOnScalars = commutescalars;
   SetOptions[ToCanonical, monvb // First];
   SetOptions[ContractMetric, uppder // First];
   If[curvrel, SetCurvatureRelations[cd, Verbose -> False]];
   (* Return *)
   result
   ];

MyRiemannSimplify[level_Integer][expr_] := 
  Fold[MyRiemannSimplify[#2,level][#1] &, expr, $Metrics];
MyRiemannSimplify[][expr_] := 
  Fold[MyRiemannSimplify[#2][#1] &, expr, $Metrics];
MyRiemannSimplify[metric_?MetricQ][expr_] := 
	If[MemberQ[Range[6],$InvSimplifyLevel] && !(DimOfManifold@ManifoldOfCovD@CovDOfMetric@metric =!= 4 && $InvSimplifyLevel > 4),
		MyRiemannSimplify[metric, $InvSimplifyLevel][expr],
		MyRiemannSimplify[metric, 4][expr]
	]; 
MyRiemannSimplify[metric_?MetricQ, level_Integer][expr_] := 
 Module[{scalar, curvatureTensors,cd},
  cd = CovDOfMetric@metric;
  curvatureTensors = {
  	metric,
  	GiveSymbol[Ricci,cd],
  	GiveSymbol[RicciScalar,cd],
  	GiveSymbol[Riemann,cd]
  };
  scalar = PutScalar[expr];
  (* TODO: if the result contains Cycles something went wrong, and we should return the original expression. *)
  NoScalar[
   scalar /. 
    Scalar[subexpr_] /; (Complement[
         FindAllOfType[subexpr, Tensor] /. t_?xTensorQ[___] :> t, 
         curvatureTensors] === {}) :> 
     InvarWrapper[RiemannSimplify[#2, Release[level], True, #1] &, 
       metric][ContractMetric[subexpr]]
   ]
  ];


CurvatureTensors[cd_?CovDQ] := 
  Flatten[{MetricOfCovD[cd], ServantsOf[cd]}] /. Null -> Sequence[];
CurvatureTensors[] := Flatten[CurvatureTensors /@ $CovDs];

Options[SingleInvariants] ^= {IncludeDuals -> False};

SingleInvariants[metric_?MetricQ, maxOrder_Integer, 
   options___?OptionQ] := 
  SingleInvariants[metric, {0, maxOrder}, options];
SingleInvariants[
    metric_?MetricQ, {minOrder_Integer, maxOrder_Integer}, 
    options___?OptionQ] /; minOrder <= maxOrder := 
  SingleInvariants[metric, {#}, options] & /@ 
   Range[minOrder, maxOrder];
SingleInvariants[metric_?MetricQ, {order_Integer}, 
    options___?OptionQ] /; order > 0 := 
  Module[{duals, dim, cases, steps, dcases, invs, dinvs},
   duals = 
    IncludeDuals /. CheckOptions[options] /. Options[SingleInvariants];
   If[OddQ[order],
    Message[SingleInvariants::oddorder];
    Return[{}];
    ];
   dim = DimOfManifold /@ Select[HostsOf[metric], ManifoldQ] // 
     First;
   steps = If[dim === 4, 6, 4];
   cases = InvarCases[order];
   invs = RInvs[metric][4, #] & /@ cases;
   If[duals,
    If[dim === 4,
     dcases = InvarDualCases[order];
     dinvs = DualRInvs[metric][steps, #] & /@ dcases;
     invs = Join[invs, dinvs];
     ,
     Message[SingleInvariants::noduals];
     ]
    ];
   Flatten[InvToRiemann[invs]]
   ];
SingleInvariants[_?MetricQ, {0}, ___?OptionQ] := {1};

ProductInvariants[metric_?MetricQ, maxOrder_Integer, 
   options___?OptionQ] := 
  ProductInvariants[metric, {0, maxOrder}, options];
ProductInvariants[
    metric_?MetricQ, {minOrder_Integer, maxOrder_Integer}, 
    options___?OptionQ] /; minOrder <= maxOrder := 
  ProductInvariants[metric, {#}, options] & /@ 
   Range[minOrder, maxOrder];
ProductInvariants[metric_?MetricQ, {order_Integer}, 
    options___?OptionQ] /; order > 0 := 
  Module[{partitions, npinvs, combine},
   (* note we can only partition into even integers, 
   because the Invar package does not give odd invariants *)
   
   partitions = IntegerPartitions[order];
   npinvs = 
    Quiet[SingleInvariants[metric, {#}, options] & /@ 
      Range[order], {SingleInvariants::oddorder}];
   
   combine[partition_] := 
    Flatten[Outer[Times, Sequence @@ npinvs[[partition]]], 1] // 
     DeleteDuplicates;
   combine /@ partitions // Flatten // DeleteDuplicates // Sort
   ];
ProductInvariants[_?MetricQ, {0}, ___?OptionQ] := {1};

Options[InvarLagrangian] ^= {Coefficients -> OrderCoefficient, 
   OrderParameter -> 1};

InvarLagrangian[metric_?MetricQ, maxOrder_Integer, 
   options___?OptionQ] := 
  InvarLagrangian[metric, {0, maxOrder}, options];
InvarLagrangian[metric_?MetricQ, {minOrder_Integer, maxOrder_Integer},
     options___?OptionQ] /; minOrder <= maxOrder := Module[{i},
   Sum[InvarLagrangian[metric, {i}, options], {i, minOrder, 
     maxOrder}]
   ];
InvarLagrangian[metric_?MetricQ, {order_Integer}, 
   options___?OptionQ] := 
  Module[{coefPar, orderPar, NoCoeff, invariants, q, Defconstant},
   {orderPar, 
     coefPar} = {OrderParameter, Coefficients} /. 
      CheckOptions[options] /. Options[InvarLagrangian];
   If[coefPar === None,
    coefPar = NoCoeff
    ];
   NoCoeff[__] := 1;
   
   Defconstant[par_Symbol] := 
    If[! ConstantSymbolQ[#], DefConstantSymbol[#]] & /@ Variables[par];
   Defconstant[orderPar];
   
   invariants = ProductInvariants[metric, {order}, options];
   q = Flatten[Array[coefPar, {1, Length[invariants]}, {order, 1}]];
   Defconstant /@ q;
   orderPar^order * 
     q.Sort[invariants //. CurvatureRelations[CovDOfMetric[metric]]] //
     NoScalar   
   ];

OrderCoefficientString[o_, n_] := \!\(\*
TagBox[
StyleBox[
RowBox[{"\"\<\\!\\(\\*SubsuperscriptBox[\\(c\\), \\(\>\"", "<>", 
RowBox[{"ToString", "[", "n", "]"}], "<>", "\"\<\\), \\(\>\"", "<>", 
RowBox[{"ToString", "[", "o", "]"}], "<>", "\"\<\\)]\\)\>\""}],
ShowSpecialCharacters->False,
ShowStringCharacters->True,
NumberMarks->True],
FullForm]\)

OrderCoefficient[o_, n_] := Module[{symbol},
   symbol = GiveSymbol["o", o/2, "n", n];
   If[! ConstantSymbolQ[symbol],
    DefConstantSymbol[symbol]
    ];
   PrintAs[symbol] ^= OrderCoefficientString[o/2, n];
   symbol
   ];



(************)
(* MapTimed *)
(************)

TimeString[0] = "0 seconds";
TimeString[seconds_] := Module[{s, m, h, d, M, y, list},
   s = Ceiling[seconds];
   y = Floor[s/31536000];
   s = s - y*31536000;
   M = Floor[s/2628000];
   s = s - M*2628000;
   d = Floor[s/86400];
   s = s - d*86400;
   h = Floor[s/3600];
   s = s - h*3600;
   m = Floor[s/60];
   s = s - m*60;
   list = Transpose[{
      {y, M, d, h, m, s},
      {"year", "month", "day", "hour", "minute", "second"}
      }];
   StringJoin[Riffle[ReleaseHold /@ Map[
       If[First@# > 0,
         ToString@First@#  <> " " <> Last@# <> 
          If[First@# > 1, "s", ""],
         HoldComplete[Sequence[]]
         ] &,
       list
       ], ", "]]
   ];

LevelSpecQ[{x_Integer, y_Integer}] /; x >= 0 && y >= x := True
LevelSpecQ[x_Integer] /; x >= 0 := True
LevelSpecQ[{x_Integer}] /; x >= 0 := True
LevelSpecQ[Infinity] := True
LevelSpecQ[___] := False


Options[MapTimed] ^= {
	Description -> "", 
	MonitorSteps -> All,
	DoTensorCollect -> False 
};

MapTimed[func_, expr_, levelspec_: {1}, options___?OptionQ] /; 
   LevelSpecQ[levelspec] := 
  Module[{begintime, desc, ms, length, stringlength, timer, mon, ETA, steps, dtc, position}, 
   (* Determine the options *)
   {desc, ms, dtc} = {Description, MonitorSteps, DoTensorCollect} /. CheckOptions[options] /. Options[MapTimed];
   desc = ToString[desc];
   (* Initialize variables *)
   length = 0;
   position = 0;
   (* Do a test run to determine the length of the map. *)
   Map[(length++) &, expr, levelspec];
   stringlength = ToString[length];
   steps = If[ms === All, 1, Ceiling[length/ms]];
   begintime = AbsoluteTime[];
   mon = desc <> " " <> stringlength <> " parts.";
   ETA[pos_] := 
    Ceiling[(AbsoluteTime[] - begintime)*(length - pos)/pos];
   timer[part_] := Module[{result},
     result = If[dtc, DoTensorCollect[func][part], func@part];
     position++;
     If[ms === All || Mod[position, steps] == 0, 
      mon = desc <> " Parts " <> ToString@position <> "/" <> 
        stringlength <> " done. ETA in " <> TimeString@ETA@position <>
         "."];
     result
   ];
   Monitor[Map[timer, expr, levelspec], mon]
];



(************************)
(* TensorCollet et. al. *)
(************************)

(* ConstantExprQ simply checks if there are no tensors or parameters in the expression,
   and returns true if there are none. A better way would be to list all variables
   in the expression and then check if they are all constants, but the built-in
   function Variables only works on polynomials (alas). *)

ConstantExprQ[expr_] /; FreeQ[expr, List] :=
 FreeQ[expr, _?xTensorQ | _?ParameterQ] 
 (*And @@ (ConstantQ /@ Variables[expr])*)
ConstantExprQ[expr_] := False

TensorCollector[x_List] := TensorCollector /@ x;
TensorCollector[x_ + y_] := TensorCollector[x] + TensorCollector[y];
TensorCollector[x_?ConstantExprQ * y_] := x TensorCollector[y];
TensorCollector[x_?ConstantExprQ] := x;

RemoveConstants[expr_] := 
 expr /. x_?ConstantExprQ *y_ /; ! FreeQ[y, _?xTensorQ] :> y
SetAttributes[RemoveConstants, Listable]

RemoveTensors[expr_] := 
 TensorCollector[expr] /. HoldPattern[TensorCollector[___]] -> 1
SetAttributes[RemoveTensors, Listable]

Options[TensorCollect] ^= {CollectMethod -> Default, SimplifyMethod -> Simplify};

TensorCollect[expr_, options___?OptionQ] := expr;
TensorCollect[expr_, options___?OptionQ] /; !FreeQ[expr, Plus | _?xTensorQ] := 
Module[{method, simplify, mod, notensormod, tensormod, tensors},
	{method,simplify} = {CollectMethod, SimplifyMethod} /. CheckOptions[options] /. Options[TensorCollect];
	(* If we have perturbations in the expression don't contract metrics etc. *)
	If[!FreeQ[expr,Perturbation],
		method = Identity;
	];
	If[method === Default,
		method = ToCanonical@ContractMetric@NoScalar@#&;
	];
	
	mod = SameDummies@Expand@expr;
	
	(* Because we have used Expand, and expr contains a Plus, the head should be plus.
	   To be on the safe side, return if it isn't the case. *)
	If[Head[mod]=!=Plus,
		Return[mod];
	];
	(* Map of the expanded sum, and apply the tensorcollector. *)
	mod = SameDummies[method /@ mod];
	mod = Block[{$RecursionLimit = 4096},
		TensorCollector@mod
	];
	notensormod = mod /. HoldPattern[TensorCollector[___]]->0;
	tensormod 	= mod - notensormod;
	tensors = Select[Variables[tensormod], ! ConstantQ[#] &];
	simplify[notensormod] + (Collect[tensormod, tensors] 
		/. x_*y_TensorCollector :> simplify[x] y 
		/. TensorCollector -> Sequence
	)
];

DoTensorCollect[func_][expr_] := Module[{collected, map},
   collected = TensorCollector[expr];
   map[subexpr_] := If[FreeQ[subexpr, TensorCollector],
     func[subexpr],
     subexpr /. HoldPattern[TensorCollector[p___]] :> func[p]
     ];
   MapIfPlus[map,collected]
];


ToConstantSymbolEquations[eq:Equal[lhs_,rhs_]] /; FreeQ[eq,List] := Module[{collected,list,freeT,withT},
	collected = TensorCollect[lhs - rhs, 
		CollectMethod->Default, 
		SimplifyMethod->Identity
	];
	list = TensorCollector /@ If[Head[#] === Plus, 
			List@@#, 
			List@#
		]& @ collected;
	freeT = Select[list,FreeQ[#,TensorCollector]&];
	withT = Select[list,!FreeQ[#,TensorCollector]&]  /. HoldPattern[TensorCollector[___]] -> 1;
	
	Apply[And, Equal[#,0]& /@ Append[withT, Plus@@freeT] ] 
];

SolveConstants[expr_,varsdoms__] := 
	Solve[expr /. equation_Equal :> ToConstantSymbolEquations[equation], varsdoms];

(* This is a handy shortcut *)
SolveConstants[expr_] := SolveConstants[expr, Select[Variables[expr],ConstantSymbolQ] ];

MakeEquationRule[{Equal[LHS_,RHS_], pattern_, cond___}, options___?OptionQ]:=
  Module[{expanded, list, terms, coefficient, lhs, rhs},
	expanded	= TensorCollect[LHS - RHS, CollectMethod->Default, SimplifyMethod->Identity];
	list		= If[Head[expanded] === Plus, List@@expanded, List@expanded];
	terms = Cases[list, (Optional[c_] * t_) /; ConstantExprQ[c] && MatchQ[t, HoldPattern@pattern] :> {t, c}];
	If[Length[terms] =!=1, Return[{}]];
	coefficient	= terms[[1,2]];
	lhs			= terms[[1,1]];
	rhs			= Simplification[lhs - (expanded/coefficient)];
	If[Length[IndicesOf[][lhs]] === 0, rhs = PutScalar[rhs]];
	MakeRule[Evaluate[{lhs, rhs, cond}], options]
];

SetAttributes[MakeEquationRule,HoldFirst];

(********************************)
(* Metric determinant varations *)
(********************************)


(* This code comes from JMM. See http://groups.google.com/group/xact/browse_thread/thread/8d687342a34e033c/7d79f11620a7d866 *)

xAct`xPert`Private`DefGenPertDet[vbundle_, metric_, pert_] := 
  With[{dim = DimOfVBundle[vbundle], metricepsilon = epsilon[metric], 
    mdet = Determinant[metric][]},
   
   If[IntegerQ[dim],
    (* Old xPert code, works only for non-generic dimensions *)
    
    xAct`xPert`Private`ExpandPerturbation1[
      Perturbation[mdet, order_.]] := 
     With[{inds = Table[DummyIn[vbundle], {2 dim}]},
      With[{inds1 = inds[[Range[dim]]], 
        inds2 = inds[[Range[dim + 1, 2 dim]]]}, 
       ContractMetric[
        mdet/dim! SignDetOfMetric[metric] metricepsilon @@ 
          inds1 metricepsilon @@ inds2 Perturbation[
          Times @@ Apply[metric, Transpose[-{inds1, inds2}], {1}], 
          order]]
       ]
      ],
    (* 'New' code, works for any dimension, but is slower. *)
    
    xAct`xPert`Private`ExpandPerturbation1[
       Perturbation[mdet, order_.]] := Module[{ind},
       If[order === 1,
        ind = DummyIn[vbundle]; mdet pert[LI[1], ind, -ind],
        Perturbation[ExpandPerturbation[Perturbation[mdet]], 
          order - 1] /. expr_Perturbation :> ExpandPerturbation[expr]
        ]
       ];
    ];
   
   xAct`xPert`Private`ExpandPerturbation1[
     Perturbation[metricepsilon[superinds__?UpIndexQ], order_.]] := 
    metricepsilon[superinds] Sqrt[mdet] ExpandPerturbation[
      Perturbation[1/Sqrt[mdet], order]];
   xAct`xPert`Private`ExpandPerturbation1[
     Perturbation[metricepsilon[subinds__?DownIndexQ], order_.]] := 
    metricepsilon[subinds]/Sqrt[mdet] ExpandPerturbation[
      Perturbation[Sqrt[mdet], order]];
   
   ];



(***************)
(* Simplifying *)
(***************)

PreferBoxOfRule[tensor_] := 
  Flatten[PreferBoxOfRule[tensor, #] & /@ $CovDs];
PreferBoxOfRule[tensor_, CD_?CovDQ] := {
  bigexpr : 
     CD[-b_]@CD[b_]@CD[a_][expr_] /; (! FreeQ[expr, tensor] && 
      FreeQ[expr, CD[ChangeIndex[a]][_]]) :> 
   CommuteCovDs[bigexpr, CD, {a, b}],
  bigexpr : 
     CD[b_]@CD[-b_]@CD[a_][expr_] /; (! FreeQ[expr, tensor] && 
      FreeQ[expr, CD[ChangeIndex[a]][_]]) :> 
   CommuteCovDs[bigexpr, CD, {a, -b}],
  bigexpr : 
     CD[b_]@CD[a_][expr_] /; (! FreeQ[expr, tensor] && 
      FreeQ[expr, CD[ChangeIndex[a]][_]] && !FreeQ[expr, CD[ChangeIndex[b]][_]]) :> 
   CommuteCovDs[bigexpr, CD, {a, b}]
  }


(* The next bit is thanks to Leo Stein, see http://groups.google.com/group/xact/browse_thread/thread/31e959cbee8d1848/690def9618ff519c *)
PreferDivOfRule[tens_] := Flatten[PreferDivOfRule[tens, #] &/$CovDs];
PreferDivOfRule[tens_, 
   CD_?CovDQ] := (bigexpr : (CD[b_]@
        CD[a_][expr_] /; (!FreeQ[expr, tens[___, ChangeIndex[b], ___]] && 
         FreeQ[expr, tens[___, ChangeIndex[a], ___]]))) :> 
   CommuteCovDs[bigexpr, CD, {a, b}];

DivFreeQ[expr_, tens_] := And @@ (DivFreeQ[expr, tens, #] & /@ $CovDs);
DivFreeQ[expr_, tens_, CD_?CovDQ] := FreeQ[expr, CD[a_][inner_] /; ! FreeQ[inner, tens[___, ChangeIndex[a], ___]]];

RicciDivRule[cd_?CovDQ] := Module[{ricci, rs, a, b},
   ricci = GiveSymbol[Ricci, cd];
   rs = GiveSymbol[RicciScalar, cd];
   {a, b} = Table[DummyIn@First@VBundlesOfCovD@cd, {2}];
   
    FoldedRule[
    PreferDivOfRule[ricci, cd],
    MakeRule[Evaluate[{cd[a]@ricci[-a, -b], 1/2 cd[-b]@rs[]}], 
     MetricOn -> All, UseSymmetries -> True]
    ]
   ];

RiemannDivRule[cd_?CovDQ] := Module[{ricci, riemann, a, b, c, d},
   ricci = GiveSymbol[Ricci, cd];
   riemann = GiveSymbol[Riemann, cd];
   {a, b, c, d} = Table[DummyIn@First@VBundlesOfCovD@cd, {4}];
   
    FoldedRule[
    PreferDivOfRule[riemann, cd],
    MakeRule[
     Evaluate[{cd[-d]@riemann[d, -a, -b, -c], 
       cd[-b]@ricci[-a, -c] - cd[-c]@ricci[-a, -b]}], MetricOn -> All,
      UseSymmetries -> True]
    ]
   ];

FS = FullSimplification;

Options[FullSimplification] ^= {SortCovDs -> True};

FullSimplification[options___?OptionQ][expr_] := 
  Fold[FullSimplification[#2, options][#1] &, expr, $Metrics];
FullSimplification[metric_?MetricQ, options___?OptionQ][expr_] := 
  Module[{cd, oldmonv, olduppder, tmp, sortcd, riemannDivRule, 
    ricciDivRule},
   {sortcd} = {SortCovDs} /. CheckOptions[options] /. Options[FullSimplification];
   
   cd = CovDOfMetric[metric];
   
   oldmonv = Options[ToCanonical, UseMetricOnVBundle];
   olduppder = Options[ContractMetric, AllowUpperDerivatives];
   SetOptions[ToCanonical, 
    UseMetricOnVBundle -> If[FreeQ[expr, PD], All, None]];
   SetOptions[ContractMetric, AllowUpperDerivatives -> True];
   
   tmp = expr // ContractMetric // ToCanonical;
   tmp = MyRiemannSimplify[metric][tmp];
   
   (* TODO: Apply dimensional dependent identities *)
   
   (* Sort covariant derivatives *)
   If[sortcd,
    (* TODO: cache these rules one way or another *)
    
    riemannDivRule = RiemannDivRule[cd];
    ricciDivRule = RicciDivRule[cd];
    While[! DivFreeQ[tmp, GiveSymbol[Riemann, cd]], 
     tmp = ContractMetric[tmp //. riemannDivRule]];
    While[! DivFreeQ[tmp, GiveSymbol[Ricci, cd]], 
     tmp = ContractMetric[tmp //. ricciDivRule]];
    tmp = tmp // SortCovDs;
    ];
   
   (* TODO: Apply dimensional dependent identities again *)
   
   (* TODO: Apply bianchi identities *)
   
   SetOptions[ToCanonical, oldmonv // First];
   SetOptions[ContractMetric, olduppder // First];
   TensorCollect[tmp]
   ];

(**************)
(* Variations *)
(**************)

ExpandPerturbationDer[expr_] := 
 SeparateMetric[][expr] //. 
  subexpr : 
    Perturbation[_Symbol?CovDQ[_][_] | LieD[_][_] | 
      Bracket[_][_, _], _.] :> 
   xAct`xPert`Private`ExpandPerturbationDer[subexpr]


(* 
	The xTensor VarD works fine, but there's a better method using the xPert 
	package. This is due to Cyril Pitrou. See
	http://groups.google.com/group/xact/browse_thread/thread/46f3ae4cbae14ea8/22c9e238d0869271
*)

Unprotect[xAct`xTensor`DefMetric];
If[FreeQ[Options[xAct`xTensor`DefMetric], DefVariation], 
 Options[xAct`xTensor`DefMetric] ^= Append[Options[xAct`xTensor`DefMetric], DefVariation -> True];
];
Protect[xAct`xTensor`DefMetric];

Options[DefMetricVariation] ^= {PrintAs -> ""};

DefMetricVariation[metric_?MetricQ, per_, param_, options___?OptionQ] := Module[{var, M, vb, a, b, print, def},
   
   {print} = {PrintAs} /. CheckOptions[options] /. Options[DefMetricVariation];
   
   M = First@Select[HostsOf[metric], ManifoldQ];
   vb = VBundleOfMetric[metric];
   a = DummyIn[vb];
   b = DummyIn[vb];
   
   (* First we define a metric perturbation for the xPert package and \
      a tensor that represents an infinitessimal variation of the metric. *)
   DefMetricPerturbation[metric, per, param];
   Block[{$DefInfoQ = False},
   	DefTensor[var[-a, -b], M, Symmetric[{-a, -b}]];
   ];
   
   If[print =!= "", PrintAs[per] ^= print];
   
   (* The stuff below is wrapped in a function because SetDelayed has \
      the HoldAll attribute. *)
   def[cd_, sqrt_] := (
   
     (* We can now define a total variation (w.r.t.to metric) as \
        follows.Note that we're only varying the metric and hence set \
        variations of any other tensors to zero. *)
     VarDt[metric, expr_] := Module[{mod},
     	mod = MapIfPlus[ContractMetric,Expand@Perturbation[expr]];
     	ExpandPerturbation@SameDummies@mod /. {
        	per[LI[1], inds__] :> var[inds],
        	p:(tensor_[LI[1], ___]) /; (xTensorQ[tensor] && tensor =!= per && PerturbationOrder[p]===1) -> 0
        }
     ];
     
     (* The functional derivation is then defined as ... *)
     VarD[metric[-c_Symbol, -d_Symbol], cd][expr_] := Module[{mod,withvar,novar},
       mod = TensorCollect@VarDt[metric, expr];
       novar = mod /. var[__]->0;
       withvar = mod - novar;
       VarD[var[-c, -d], cd][withvar]
     ];
     VarD[metric[+c_Symbol, +d_Symbol], cd][expr_] := Module[{mod,withvar,novar},
       mod = TensorCollect@VarDt[metric, expr];
       novar = mod /. var[__]->0;
       withvar = mod - novar;
       -VarD[var[c, d], cd][withvar]
     ];
       
     (* And one handy function that varies Lagrangians, 
     and thus takes care of the square root of the determinant. *)
     VarL[metric[inds__]][L_] := VarL[metric[inds], cd][L];
     VarL[metric[inds__], cd][L_] := VarD[metric[inds], cd][sqrt L]/sqrt;
   
   );
   
   def[CovDOfMetric[metric],Sqrt[SignDetOfMetric[metric] Determinant[metric][]]];
];



(*************************)
(* Background expansions *)
(*************************)


Options[ToBackground] ^= {BackgroundSolution -> {}, 
   ExtraRules -> {}};

ExpandBackground[expr_, order_Integer: 1, options___?OptionQ] := 
  ToBackground[
   ExpandPerturbation@PerturbBackground[expr, order, options], 
   options];

PerturbBackground[expr_, order_Integer: 1, options___?OptionQ] := 
  ToBackground[Perturbation[expr, order], options];

ToBackground[expr_, options___?OptionQ] := 
  Module[{bgRules, extraRules, temp, temprules, CreateSymbol, modexpr},
   {bgRules, 
     extraRules} = {BackgroundSolution, ExtraRules} /. 
      CheckOptions[options] /. Options[ToBackground];
   
   (* This stores the unexpanded perturbations in the expression. *)
 
     temprules = {};
   
   CreateSymbol[p_] := Module[{symbol},
     symbol = Unique[temp];
     AppendTo[temprules, symbol -> p];
     symbol
     ];
   
   (* Replace the unexpanded perturbations in the expression, 
   such that we won't set unexpanded perturbation of curvature \
tensors to background values later on. *)
   
   modexpr = expr /. p : Perturbation[___] :> CreateSymbol[p];
   (* Set curvature tensors to zero and apply optional extra rules. *)

      modexpr = modexpr /. bgRules /. extraRules;
   (* Re-insert the unexpanded pertubations. *)
   
   modexpr = modexpr /. temprules 
   ];

ExpandFlat[expr_, order_Integer: 1, options___?OptionQ] := 
  ExpandBackground[expr, order, BackgroundSolution -> FlatRules[expr],
    options];

PerturbFlat[expr_, order_Integer: 1, options___?OptionQ] := 
  PerturbBackground[expr, order, 
   BackgroundSolution -> FlatRules[expr], options];

ToFlat[expr_, order_Integer: 1, options___?OptionQ] := 
  ToBackground[expr, BackgroundSolution -> FlatRules[expr], options];

FlatRules[expr_] := 
  Module[{tensors, manifolds, vbundles, metrics, cds},
   (* First determine what all the covariant derivatives of the \
expression are. *)
   
   tensors = 
    DeleteDuplicates[
     FindAllOfType[expr, Tensor] /. t_[___] /; xTensorQ[t] :> t];
   manifolds = 
    Flatten[Select[HostsOf[#], ManifoldQ] & /@ tensors] // 
     DeleteDuplicates;
   vbundles = 
    Union[Flatten[Select[HostsOf[#], VBundleQ] & /@ tensors], 
     Flatten[TangentBundleOfManifold /@ manifolds]];
   metrics = 
    Union[Flatten[MetricsOfVBundle /@ vbundles], 
     Flatten[Select[MasterOf /@ tensors, MetricQ]]];
   cds = CovDOfMetric /@ metrics;
   (* Create rules that set the curvature tensors of the CDs to zero. \
*)
   Flatten[FlatRules /@ cds]
   ];

FlatRules[CD_?CovDQ] := Module[{metric},
  metric = MetricOfCovD[CD];
  {
   GiveSymbol[Christoffel, CD][__] -> 0,
   GiveSymbol[Riemann, CD][__] -> 0,
   GiveSymbol[Ricci, CD][__] -> 0,
   GiveSymbol[RicciScalar, CD][] -> 0,
   GiveSymbol[Einstein, CD][__] -> 0,
   CD -> PD,
   PD[_][metric[__]] -> 0,
   GiveSymbol[Det, metric][] -> SignDetOfMetric[metric]
   }
  ]

SymmetricSpaceRules[CD_?CovDQ, K_?ConstantExprQ] := 
  Module[{MR, D, vb, metric, a, b, c, d, rules,L,LL},
   MR[lhs_, rhs_] := MakeRule[Evaluate[{lhs, rhs}], MetricOn -> All];
   
   D = DimOfManifold[ManifoldOfCovD[CD]];
   vb = First@VBundlesOfCovD[CD];
   metric = MetricOfCovD[CD];
   a = DummyIn[vb];
   b = DummyIn[vb];
   d = DummyIn[vb];
   c = DummyIn[vb];
   
   rules = Join[
     MR[GiveSymbol[Riemann, CD][a, b, c, d], 
      K (metric[a, c] metric[b, d] - 
         metric[a, d] metric[b, c])],
     MR[GiveSymbol[Ricci, CD][a, b], K (D-1) metric[a, b]],
     MR[GiveSymbol[RicciScalar, CD][], D*(D-1) K ],
     MR[GiveSymbol[TFRicci, CD][a,b], 0],
     If[xTensorQ@GiveSymbol[Schouten, CD],
     	MR[GiveSymbol[Schouten, CD][a,b], 1/2 K metric[a,b]],
     	{}
     ],
     If[xTensorQ@GiveSymbol[SchoutenCC, CD],
     	 MR[GiveSymbol[SchoutenCC,CD][LI[L],a,b], 1/2 (K-LL)metric[a,b]]/.L->L_/.LL->L,
     	{}
     ]
   ];
   If[D =!= 2, 
    rules = Join[rules, 
      MR[GiveSymbol[Einstein, CD][a, b], K (D-1) (1 - D/2) metric[a, b]],
      If[xTensorQ@GiveSymbol[EinsteinCC, CD],
     	MR[GiveSymbol[EinsteinCC,CD][LI[L],a,b], 1/2 (D-2)(D-1)(LL-K)metric[a,b]]/.L->L_/.LL->L,
     	{}
      ]      
    ];
   ];
   If[D =!= 3 && D =!= 2, 
    rules = Join[rules, MR[GiveSymbol[Weyl, CD][a, b, c, d], 0]]];
   rules
   ];

(* TODO: remove duplicate code *)
EinsteinSpaceRules[CD_?CovDQ, K_?ConstantExprQ] := 
  Module[{MR, D, vb, metric, a, b, c, d, rules,L,LL},
   MR[lhs_, rhs_] := MakeRule[Evaluate[{lhs, rhs}], MetricOn -> All];
   
   D = DimOfManifold[ManifoldOfCovD[CD]];
   vb = First@VBundlesOfCovD[CD];
   metric = MetricOfCovD[CD];
   a = DummyIn[vb];
   b = DummyIn[vb];
   d = DummyIn[vb];
   c = DummyIn[vb];
   
   rules = Join[
     MR[GiveSymbol[Ricci, CD][a, b], K (D-1) metric[a, b]],
     MR[GiveSymbol[RicciScalar, CD][], D*(D-1)  K ],
     MR[GiveSymbol[TFRicci, CD][a,b], 0],
     If[xTensorQ@GiveSymbol[Schouten, CD],
     	MR[GiveSymbol[Schouten, CD][a,b], 1/2 K metric[a,b]],
     	{}
     ],
     If[xTensorQ@GiveSymbol[SchoutenCC, CD],
     	 MR[GiveSymbol[SchoutenCC,CD][LI[L],a,b], 1/2 (K-LL)metric[a,b]]/.L->L_/.LL->L,
     	{}
     ]
   ];
   If[D =!= 2, 
    rules = Join[rules, 
      MR[GiveSymbol[Einstein, CD][a, b], K (D-1) (1 - D/2) metric[a, b]],
      If[xTensorQ@GiveSymbol[EinsteinCC, CD],
     	MR[GiveSymbol[EinsteinCC,CD][LI[L],a,b], 1/2 (D-2)(D-1)(LL-K)metric[a,b]]/.L->L_/.LL->L,
     	{}
      ]      
    ];
   ];
   If[D =!= 3 && D =!= 2, 
    rules = Join[rules, 
      MR[GiveSymbol[Weyl, CD][a, b, c, d], 
       GiveSymbol[Riemann, CD][a, b, c, d] - 
        K (metric[a, c] metric[b, d] - 
           metric[a, d] metric[b, c])]
      ]];
   rules
   ];



(*************************)
(* Young projects et al. *)
(*************************)

(* 
	I got the idea of using Young projectors from Guillaume Faye and Kaspar Peeters.
 	See http://groups.google.com/group/xact/browse_thread/thread/d19247526163ed62/986a5b04d4fa19f4 .
*)

YoungTableauQ[tableau:{{___Integer}...}|{{(-_Symbol|_Symbol)...}...}] := 
 Reverse[Length /@ tableau] === Sort[Length /@ tableau] && 
  If[Length@tableau > 1, Intersection @@ tableau === {}, True]
YoungTableauQ[_] := False


YoungSymmetrize[expr_, tableau_?YoungTableauQ] /; 
  Sort@IndicesOf[Free][expr] === IndexList @@ Sort@Flatten[tableau] :=
  Module[{transpose, sym},
  transpose = Transpose@PadRight@tableau /. 0 -> Sequence[];
  sym   = Fold[ToCanonical[Symmetrize[#1, #2]] &, expr, tableau];
  Fold[ToCanonical[Antisymmetrize[#1, #2]] &, sym, transpose]
  ]

YoungSymmetrize[tensor_?xTensorQ, 
    tableau : {{___Integer} ...}] /; (YoungTableauQ[
      tableau] && (Total[Length /@ tableau] === 
       Length[SlotsOfTensor@tensor])) := Module[{indices},
   indices = DummyIn /@ SlotsOfTensor@tensor;
   YoungSymmetrize[tensor @@ indices, indices[[#]] & /@ tableau]
   ];

YoungSymmetrize[tensor_?xTensorQ] := 
 Total[YoungSymmetrize[tensor, #] & /@ 
   SymmetryTableauxOfTensor[tensor]]

YoungProject[expr_, tableau_?YoungTableauQ] /; 
   Sort@IndicesOf[Free][expr] === IndexList @@ Sort@Flatten[tableau] :=
   Module[{sym1, sym2, n, result},
   Block[{$DefInfoQ = False, $UndefInfoQ = False},
   (* TODO: compute the overall factor n from group-theoretical arguments instead of symmetrizing twice *)
   DefConstantSymbol[n];
   sym1 = YoungSymmetrize[expr, tableau];
   sym2 = YoungSymmetrize[sym1, tableau];
   result = 
    n sym1 /. First@SolveConstants[sym1 == n sym2, n] //
      ToCanonical;
   UndefConstantSymbol[n];
   ];
   result
   ];

YoungProject[tensor_?xTensorQ, 
    tableau : {{___Integer} ...}] /; (YoungTableauQ[
      tableau] && (Total[Length /@ tableau] === 
       Length[SlotsOfTensor@tensor])) := Module[{indices},
   indices = DummyIn /@ SlotsOfTensor@tensor;
   YoungProject[tensor @@ indices, indices[[#]] & /@ tableau]
   ];


RiemannYoungRule[cd_?CovDQ] := RiemannYoungRule[cd,{0}];

RiemannYoungRule[cd_?CovDQ, numcds_Integer] /; numcds >= 0 :=
	RiemannYoungRule[cd,{0,numcds}];

RiemannYoungRule[cd_?CovDQ, {min_Integer,max_Integer}] /; max >= min && min >=0 :=
	Flatten[RiemannYoungRule[cd,{#}]&/@Range[min,max]];

RiemannYoungRule[cd_?CovDQ, {numcds_Integer}] /; numcds >= 0 := 
 Module[{riemann, indrie, indcds, tableau, expr},
  riemann = GiveSymbol[Riemann, cd];
  indrie = DummyIn /@ SlotsOfTensor@riemann;
  indcds = -Table[DummyIn@First@VBundlesOfCovD[cd], {numcds}];
  tableau = {Join[indrie[[{1, 3}]], indcds], indrie[[{2, 4}]]};
  expr = Fold[cd[#2][#1] &, riemann @@ indrie, indcds];
  MakeRule[Evaluate[{expr, YoungProject[expr, tableau]}]]
  ]



(****************)
(* Other stuff  *)
(****************)

SortedCovDsQ[expr_,cd_?CovDQ] := 
 FreeQ[expr, cd[b_]@cd[a_]@_ /; DisorderedPairQ[a, b]];

SortedCovDsQ[expr_] := And @@ ( SortedCovDsQ[expr, #]& /@ DeleteCases[$CovDs,PD] );


DerivativeOrder[expr_] := 
 Total[DerivativeOrder[expr, #] & /@ $CovDs];

DerivativeOrder[expr_,cd_?CovDQ] /; FreeQ[expr, Plus | Power] :=
Module[{ordertwo,christoffel},
	ordertwo 		= GiveSymbol[#,cd]& /@ {Riemann,Ricci,RicciScalar,Einstein,Weyl,Schouten,EinsteinCC,SchoutenCC};
	christoffel 	= GiveSymbol[Christoffel,cd];
	
 	2 Count[expr, (Alternatives@@ordertwo)[___], {0, Infinity}, Heads -> True] 
 		+ Count[expr, (cd[_][_])|(christoffel[___]), {0, Infinity}, Heads -> True]
];

DerivativeOrder[Power[y_, z_Integer],cd_?CovDQ] := z DerivativeOrder[y,cd];

DerivativeOrder[x_ * y_,cd_?CovDQ] := DerivativeOrder[x,cd] + DerivativeOrder[y,cd];

DerivativeOrder[x_?ConstantExprQ,cd_?CovDQ] := 0



(*******************)
(* Killing vectors *)
(*******************)


KillingVectorQ[expr_] := False
KillingVectorOf[expr_] := None

Unprotect[xAct`xTensor`DefTensor];
If[FreeQ[Options[xAct`xTensor`DefTensor], KillingVectorOf], 
 Options[xAct`xTensor`DefTensor] ^= Append[Options[xAct`xTensor`DefTensor], KillingVectorOf -> None];
 , 
 Null;
];
Protect[xAct`xTensor`DefTensor];


xTension["xTras`", DefTensor, "End"] := xTrasDefTensor;


xTrasDefTensor[head_[indices___], dependencies_, sym_, options___] :=
    DefKillingVector[head[indices], KillingVectorOf /. CheckOptions[options] /. Options[DefTensor]];

(* The pattern only matches if the index belongs to the correct tangent bundle. *)
DefKillingVector[xi_[L1:(-LI[___]|LI[___])...,ind_,L2:(-LI[___]|LI[___])...], metric_?MetricQ] /; AIndexQ[ind, VBundleOfMetric@metric] :=
  Module[{vb, cd,riemann,l1patt,l2patt},
  	
  	If[$DefInfoQ,Print["** Defining " <> PrintAs@xi <> " to be a Killing vector of the metric " <> PrintAs@metric <> "."]];
   
   (* Set up some variables. *)
   vb = VBundleOfMetric@metric;
   cd = CovDOfMetric[metric];
   riemann = GiveSymbol[Riemann, cd];
   l1patt = PatternSequence[L1]/.LI[___]->LI[___];
   l2patt = PatternSequence[L2]/.LI[___]->LI[___];
   
   (* Set the symmetry. Thanks to JMM for pointing out of this works. *)
   SymmetryOf[cd[x_][xi[l1:l1patt,y_,l2:l2patt]]] ^:= Symmetry[2, cd[slot[2]][xi[l1,slot[1],l2]], {slot[1] -> y, slot[2] -> x}, Antisymmetric[{1, 2}]]; 
    
   (* Attach the rules and the rest. *)
   cd[c_]@cd[b_]@xi[l1:l1patt,a_,l2:l2patt] := Module[{d = DummyIn@vb}, riemann[a,b,c,d] xi[l1,-d,l2]];
   Unprotect[xAct`xTensor`LieD];
   LieD[xi[l1patt,_,l2patt]][metric[__]] = 0;
   LieD[xi[l1patt,_,l2patt],_][metric[__]] = 0;
   Protect[xAct`xTensor`LieD];
   
   KillingVectorOf[xi] ^= metric;
   KillingVectorQ[xi] ^= True;
];

(***********************)
(* Metric permutations *)
(***********************)


AllContractions[metric_?MetricQ, indexList_][expr_] /; 
   FreeQ[expr, List] := AllContractions[metric, indexList][{expr}];
AllContractions[metric_?MetricQ, indexList_][exprs_List] := 
  Module[{metrics, dummies},
   metrics = MetricPermutations[metric,indexList];
   dummies = Intersection[
   	UpIndex /@ (IndexList@@indexList), 
    UpIndex /@ (IndicesOf[Free][First@exprs])
   ];
   DeleteDuplicates@MapTimed[
     ReplaceDummies[ToCanonical@ContractMetric[# ], dummies]&, 
     Flatten@Outer[Times[#1, #2] &, exprs, metrics], 
     Description -> "Contracting indices."]
   ];

MetricPermutations[metric_?MetricQ, list_] /; EvenQ@Length@list := 
 Map[Times @@ Map[metric @@ # &, #] &, UnorderedPairsPermutations[list]];

UnorderedPairsPermutations[list_] /; EvenQ@Length@list := 
 Partition[#, 2] & /@ UnorderedPairsPermutations1[list];

(* The actual workhorse. *)
UnorderedPairsPermutations1[list_] /; Length[list] == 2 := {list}
UnorderedPairsPermutations1[list_] /; Length[list] > 2 && EvenQ[Length[list]] := 
  Module[{previous, last},
   last = list[[-2 ;; -1]];
   previous = UnorderedPairsPermutations1[list[[1 ;; -3]]];
   Flatten[Map[PairPermuteJoin[#, last] &, previous], 1]
];

(* Internal function. *)
PairPermuteJoin[list_, newPair_] := 
  Module[{joined1, joined2, cycles, positions},
   joined1 = Join[list, newPair];
   joined2 = Join[list, Reverse@newPair];
   positions = 2 Range[Length[list]/2]; 
   cycles = xAct`xPerm`Cycles[{#, Length[list] + 1}] & /@ positions;
   Join[
    {joined1},
    xAct`xPerm`PermuteList[joined1, #] & /@ cycles,
    xAct`xPerm`PermuteList[joined2, #] & /@ cycles
    ]
];



(*********************)
(*                   *)
(*    End package    *)
(*                   *)
(*********************)

End[]

EndPackage[]
