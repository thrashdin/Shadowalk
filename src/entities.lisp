;; This work is licensed under the Creative Commons Attribution 3.0 Unported License.
;; To view a copy of this license, visit http://creativecommons.org/licenses/by/3.0/
;; or send a letter to Creative Commons,
;;      PO Box 1866, Mountain View, CA 94042, USA.Copyright (C) 2003-2008 Shawn Betts
;;
;; This file is part of rpg.
;;
;; rpg is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.


;; Commentary:
;;
;; This file contains definitions of all entities.
;;
;; Code:


(in-package #:rpg)

(deftype races () `(member ,@*races*))

(defclass %animate ()
  ())

(defclass %inanimate ()
  ())

(defclass %skill ()
  ())


(defclass skill (%skill)
  ())

(defclass feat (%skill)
  ())

(defclass trait (%skill)
  ())

(defclass drawback (%skill)
  ())

(defclass item (%inanimate)
  ())


(defclass creature (%animate)
  ((name
    :type string
    :initarg :name
    :reader get-name
    :writer name)
   (race
    :type 'races
    :initarg :race
    :reader get-race
    :writer race)
   (size
    :type (integer -2 5)
    :initform 0
    :accessor size)
   (strength
    :type (integer 1 100)
    :initarg :str
    :initform 1
    :accessor get-str)
   (agility
    :type (integer 1 100)
    :initarg :agi
    :initform 1
    :accessor get-agi)
   (constitution
    :type (integer 1 100)
    :initarg :const
    :initform 1
    :accessor get-const)
   (charisma
    :type (integer 1 100)
    :initarg :chr
    :initform 1
    :accessor get-chr)
   (perception
    :type (integer 1 100)
    :initarg :per
    :initform 1
    :accessor get-per)
   (intuition
    :type (integer 1 100)
    :initarg :int
    :initform 1
    :accessor get-int)
   (will
    :type (integer 1 100)
    :initarg :will
    :initform 1
    :accessor get-will)
   (logic
    :type (integer 1 100)
    :initarg :logic
    :initform 1
    :accessor get-logic)
   (reaction
    :type (integer 1 100)
    :initarg :react
    :initform 1
    :accessor get-react)
   (fatigue
    :type (integer 0 200)
    :initarg :fat
    :initform 0
    :reader get-fat
    :writer fat)
   (max-health
    :type (integer 1 1000)
    :initarg :max-health
    :initform 1
    :reader get-max-health
    :writer max-health)
   (cur-health
    :type (integer -100 1000)
    :initarg :cur-health
    :initform 1
    :reader get-cur-health
    :writer cur-health)
   (initiative
    :type (integer 0 100)
    :initform 0
    :reader get-init
    :writer %init)
   (status-effects
    :type hash-table
    :initform (make-hash-table :test 'eq)
    :accessor status)
   (magic-levels
    :type list
    :initform '(:fire 0 :water 0 :air 0 :earth 0 :astral 0 :death 0 :nature 0 :blood 0 :holy 0)
    :accessor magic-levels)
   (skill-list
    :type hash-table
    :initform (%skill-list)
    :reader get-skill-list
    :writer skills)
   (feat-list
    :type (vector feat *)
    :initform (make-array 1 :element-type 'feat
                            :initial-element (make-instance 'feat)
                            :adjustable t :fill-pointer 0)
    :reader get-feat-list
    :writer feats)
   (trait-list
    :type (vector trait *)
    :initform (make-array 1 :element-type 'trait
                            :initial-element (make-instance 'trait)
                            :adjustable t :fill-pointer 0)
    :reader get-trait-list
    :writer traits)
   (drawback-list
    :type (vector drawback *)
    :initform (make-array 1 :element-type 'drawback
                            :initial-element (make-instance 'drawback)
                            :adjustable t :fill-pointer 0)
    :reader get-drawback-list
    :writer drawbacks)
   (inventory
    :type (vector item *)
    :initform (make-array 10 :element-type 'item
                            :initial-element (make-instance 'item)
                            :adjustable t :fill-pointer 0)
    :reader get-inv
    :writer items)))