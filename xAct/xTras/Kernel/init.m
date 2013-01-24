(*********************)
(*                   *)
(*    To-do list     *)
(*                   *)
(*********************)

(*

 * Undef hooks.
 * Switch Modules to With's where approriate.
 * Rewrite SolveTensors with Monomials?

*)


(*********************)
(*                   *)
(*   Package setup   *)
(*                   *)
(*********************)

xAct`xTras`$Version = "1.1.0pre";
xAct`xTras`$xTensorVersionExpected = {"1.0.5", {2013, 1, 27}};
xAct`xTras`$MathematicaVersionNeeded = 6.;

If[Unevaluated[xAct`xCore`Private`$LastPackage] === xAct`xCore`Private`$LastPackage, 
	xAct`xCore`Private`$LastPackage = "xAct`xTras`"
];

Get["xAct`xTras`xCore`"];
Get["xAct`xTras`xTensor`"];
Get["xAct`xTras`xPert`"];
Get["xAct`xTras`Invar`"];
Get["xAct`xTras`xCoba`"];
Get["xAct`xTras`Algebra`"];
Get["xAct`xTras`Combinatorics`"];

BeginPackage["xAct`xTras`"]


(* Check if we have the correct version of xAct. *)
If[Not@OrderedQ@Map[Last, {xAct`xTras`$xTensorVersionExpected, xAct`xTensor`$Version}], 
	Message[General::versions, "xTensor", xAct`xTensor`$Version, xAct`xTras`$xTensorVersionExpected];
	Abort[]
];

(* Check for MMA versions. *)
If[System`$VersionNumber < xAct`xTras`$MathematicaVersionNeeded,
	Message[General::versions, "Mathematica", System`$VersionNumber, xAct`xTras`$MathematicaVersionNeeded];
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

EndPackage[]