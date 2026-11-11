/-
Copyright (c) 2026 Sepideh Nasseri. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Sepideh Nasseri
-/

module

public import Mathlib.Algebra.Group.Basic

/-!
# Group Theory Foundations

Introductory formal proofs of basic group-theoretic results.

This file proves:
* Uniqueness of the identity element.
* Uniqueness of the inverse of an element.
-/

public section

namespace GroupTheoryFoundations

variable {G : Type*} [Group G]

/-- Any left identity in a group equals its identity element. -/
theorem identity_unique
    (e : G) (h : ∀ a : G, e * a = a) :
    e = 1 := by
  calc
    e = e * 1 := (mul_one e).symm
    _ = 1 := h 1

/-- Any right inverse of an element equals its inverse. -/
theorem inverse_unique
    (a b : G) (h : a * b = 1) :
    b = a⁻¹ := by
  calc
    b = 1 * b := (one_mul b).symm
    _ = (a⁻¹ * a) * b := by rw [inv_mul_cancel]
    _ = a⁻¹ * (a * b) := mul_assoc _ _ _
    _ = a⁻¹ * 1 := by rw [h]
    _ = a⁻¹ := mul_one _
/-- Multiplication on the left by a group element is cancellative. -/
theorem left_cancellation
    (a b c : G) (h : a * b = a * c) :
    b = c := by
  calc
    b = 1 * b := (one_mul b).symm
    _ = (a⁻¹ * a) * b := by rw [inv_mul_cancel]
    _ = a⁻¹ * (a * b) := mul_assoc _ _ _
    _ = a⁻¹ * (a * c) := by rw [h]
    _ = (a⁻¹ * a) * c := (mul_assoc _ _ _).symm
    _ = 1 * c := by rw [inv_mul_cancel]
    _ = c := one_mul c
/-- Multiplication on the right by a group element is cancellative. -/
theorem right_cancellation
    (a b c : G) (h : b * a = c * a) :
    b = c := by
  calc
    b = b * 1 := (mul_one b).symm
    _ = b * (a * a⁻¹) := by rw [mul_inv_cancel]
    _ = (b * a) * a⁻¹ := (mul_assoc _ _ _).symm
    _ = (c * a) * a⁻¹ := by rw [h]
    _ = c * (a * a⁻¹) := mul_assoc _ _ _
    _ = c * 1 := by rw [mul_inv_cancel]
    _ = c := mul_one c
end GroupTheoryFoundations
