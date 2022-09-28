From Undecidability Require Import
  MinskyMachines.Reductions.L_computable_to_MMA_computable
  MinskyMachines.Reductions.MMA_computable_to_MMA_mon_computable
  TM.Reductions.MMA_mon_computable_to_TM_computable
  L.L TM.TM.

Lemma L_computable_to_TM_computable k (R : Vector.t nat k -> nat -> Prop) :
  L_computable R -> TM_computable R.
Proof.
  intros H.
  apply MMA_mon_computable_to_TM_computable.
  apply MMA_computable_to_MMA_mon_computable.
  apply L_computable_to_MMA_computable.
  exact H.
Qed.

(*
From Undecidability.TM.L.CompilerBoolFuns Require Import Compiler_spec Compiler_facts Compiler ClosedLAdmissible Compiler_nat_facts.

Lemma L_bool_computable_to_TM_bool_computable k (R : Vector.t (list bool) k -> list bool -> Prop) :
  L_bool_computable R -> TM_bool_computable R.
Proof.
  intros H. eapply TM_bool_computable_hoare'_spec.
  -now apply L_bool_computable_function.
  -now eapply compiler_correct, L_bool_computable_can_closed.
Qed.

Lemma L_computable_to_TM_computable k (R : Vector.t nat k -> nat -> Prop) :
  L_computable R -> TM_computable R.
Proof.
  intros.
  eapply TM_bool_computable_to_TM_computable.
  eapply L_bool_computable_to_TM_bool_computable.
  eapply L_computable_to_L_bool_computable.
  eapply H.
Qed.
*)