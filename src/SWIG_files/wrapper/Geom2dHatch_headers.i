/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


This file is part of pythonOCC.
pythonOCC is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
    
pythonOCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

*/
%{
#include<Geom2dHatch_ClassifierOfHatcher.hxx>
#include<Geom2dHatch_DataMapIteratorOfHatchingsOfHatcher.hxx>
#include<Geom2dHatch_DataMapIteratorOfMapOfElementsOfElementsOfHatcher.hxx>
#include<Geom2dHatch_DataMapNodeOfHatchingsOfHatcher.hxx>
#include<Geom2dHatch_DataMapNodeOfMapOfElementsOfElementsOfHatcher.hxx>
#include<Geom2dHatch_ElementOfHatcher.hxx>
#include<Geom2dHatch_ElementsOfHatcher.hxx>
#include<Geom2dHatch_FClass2dOfClassifierOfHatcher.hxx>
#include<Geom2dHatch_Hatcher.hxx>
#include<Geom2dHatch_HatchingOfHatcher.hxx>
#include<Geom2dHatch_HatchingsOfHatcher.hxx>
#include<Geom2dHatch_Intersector.hxx>
#include<Geom2dHatch_MapOfElementsOfElementsOfHatcher.hxx>
#include<gp.hxx>
#include<gp_Ax1.hxx>
#include<gp_Ax2.hxx>
#include<gp_Ax22d.hxx>
#include<gp_Ax2d.hxx>
#include<gp_Ax3.hxx>
#include<gp_Circ.hxx>
#include<gp_Circ2d.hxx>
#include<gp_Cone.hxx>
#include<gp_Cylinder.hxx>
#include<gp_Dir.hxx>
#include<gp_Dir2d.hxx>
#include<gp_Elips.hxx>
#include<gp_Elips2d.hxx>
#include<gp_EulerSequence.hxx>
#include<gp_GTrsf.hxx>
#include<gp_GTrsf2d.hxx>
#include<gp_Hypr.hxx>
#include<gp_Hypr2d.hxx>
#include<gp_Lin.hxx>
#include<gp_Lin2d.hxx>
#include<gp_Mat.hxx>
#include<gp_Mat2d.hxx>
#include<gp_Parab.hxx>
#include<gp_Parab2d.hxx>
#include<gp_Pln.hxx>
#include<gp_Pnt.hxx>
#include<gp_Pnt2d.hxx>
#include<gp_Quaternion.hxx>
#include<gp_QuaternionNLerp.hxx>
#include<gp_QuaternionSLerp.hxx>
#include<gp_Sphere.hxx>
#include<gp_Torus.hxx>
#include<gp_Trsf.hxx>
#include<gp_Trsf2d.hxx>
#include<gp_TrsfForm.hxx>
#include<gp_Vec.hxx>
#include<gp_Vec2d.hxx>
#include<gp_VectorWithNullMagnitude.hxx>
#include<gp_XY.hxx>
#include<gp_XYZ.hxx>
#include<Standard.hxx>
#include<Standard_AbortiveTransaction.hxx>
#include<Standard_Address.hxx>
#include<Standard_AncestorIterator.hxx>
#include<Standard_Assert.hxx>
#include<Standard_Atomic.hxx>
#include<Standard_Boolean.hxx>
#include<Standard_Byte.hxx>
#include<Standard_Character.hxx>
#include<Standard_CLocaleSentry.hxx>
#include<Standard_ConstructionError.hxx>
#include<Standard_CString.hxx>
#include<Standard_DefineAlloc.hxx>
#include<Standard_DefineException.hxx>
#include<Standard_DefineHandle.hxx>
#include<Standard_DimensionError.hxx>
#include<Standard_DimensionMismatch.hxx>
#include<Standard_DivideByZero.hxx>
#include<Standard_DomainError.hxx>
#include<Standard_ErrorHandler.hxx>
#include<Standard_ErrorHandlerCallback.hxx>
#include<Standard_ExtCharacter.hxx>
#include<Standard_ExtString.hxx>
#include<Standard_Failure.hxx>
#include<Standard_GUID.hxx>
#include<Standard_HandlerStatus.hxx>
#include<Standard_ImmutableObject.hxx>
#include<Standard_Integer.hxx>
#include<Standard_InternalType.hxx>
#include<Standard_IStream.hxx>
#include<Standard_JmpBuf.hxx>
#include<Standard_KindOfType.hxx>
#include<Standard_LicenseError.hxx>
#include<Standard_LicenseNotFound.hxx>
#include<Standard_Macro.hxx>
#include<Standard_math.hxx>
#include<Standard_MMgrOpt.hxx>
#include<Standard_MMgrRaw.hxx>
#include<Standard_MMgrRoot.hxx>
#include<Standard_MMgrTBBalloc.hxx>
#include<Standard_MultiplyDefined.hxx>
#include<Standard_Mutex.hxx>
#include<Standard_NegativeValue.hxx>
#include<Standard_NoMoreObject.hxx>
#include<Standard_NoSuchObject.hxx>
#include<Standard_NotImplemented.hxx>
#include<Standard_NullObject.hxx>
#include<Standard_NullValue.hxx>
#include<Standard_NumericError.hxx>
#include<Standard_OId.hxx>
#include<Standard_OStream.hxx>
#include<Standard_OutOfMemory.hxx>
#include<Standard_OutOfRange.hxx>
#include<Standard_Overflow.hxx>
#include<Standard_PByte.hxx>
#include<Standard_PCharacter.hxx>
#include<Standard_PErrorHandler.hxx>
#include<Standard_Persistent.hxx>
#include<Standard_Persistent_proto.hxx>
#include<Standard_PExtCharacter.hxx>
#include<Standard_PrimitiveTypes.hxx>
#include<Standard_ProgramError.hxx>
#include<Standard_RangeError.hxx>
#include<Standard_Real.hxx>
#include<Standard_ShortReal.hxx>
#include<Standard_Size.hxx>
#include<Standard_SStream.hxx>
#include<Standard_Storable.hxx>
#include<Standard_Stream.hxx>
#include<Standard_ThreadId.hxx>
#include<Standard_Time.hxx>
#include<Standard_TooManyUsers.hxx>
#include<Standard_Transient.hxx>
#include<Standard_Transient_proto.hxx>
#include<Standard_Type.hxx>
#include<Standard_TypeDef.hxx>
#include<Standard_TypeMismatch.hxx>
#include<Standard_Underflow.hxx>
#include<Standard_UUID.hxx>
#include<Standard_Version.hxx>
#include<Standard_WayOfLife.hxx>
#include<Standard_values.h>
#include<TopAbs.hxx>
#include<TopAbs_Orientation.hxx>
#include<TopAbs_ShapeEnum.hxx>
#include<TopAbs_State.hxx>
#include<Geom2dAdaptor.hxx>
#include<Geom2dAdaptor_Curve.hxx>
#include<Geom2dAdaptor_GHCurve.hxx>
#include<Geom2dAdaptor_HCurve.hxx>
#include<IntRes2d_Domain.hxx>
#include<IntRes2d_Intersection.hxx>
#include<IntRes2d_IntersectionPoint.hxx>
#include<IntRes2d_IntersectionSegment.hxx>
#include<IntRes2d_Position.hxx>
#include<IntRes2d_SequenceNodeOfSequenceOfIntersectionPoint.hxx>
#include<IntRes2d_SequenceNodeOfSequenceOfIntersectionSegment.hxx>
#include<IntRes2d_SequenceOfIntersectionPoint.hxx>
#include<IntRes2d_SequenceOfIntersectionSegment.hxx>
#include<IntRes2d_Situation.hxx>
#include<IntRes2d_Transition.hxx>
#include<IntRes2d_TypeTrans.hxx>
#include<TCollection.hxx>
#include<TCollection_Array1Descriptor.hxx>
#include<TCollection_Array2Descriptor.hxx>
#include<TCollection_AsciiString.hxx>
#include<TCollection_AVLBaseNode.hxx>
#include<TCollection_AVLBaseNodePtr.hxx>
#include<TCollection_BaseSequence.hxx>
#include<TCollection_BasicMap.hxx>
#include<TCollection_BasicMapIterator.hxx>
#include<TCollection_CompareOfInteger.hxx>
#include<TCollection_CompareOfReal.hxx>
#include<TCollection_ExtendedString.hxx>
#include<TCollection_HAsciiString.hxx>
#include<TCollection_HExtendedString.hxx>
#include<TCollection_MapNode.hxx>
#include<TCollection_MapNodePtr.hxx>
#include<TCollection_PrivCompareOfInteger.hxx>
#include<TCollection_PrivCompareOfReal.hxx>
#include<TCollection_SeqNode.hxx>
#include<TCollection_SeqNodePtr.hxx>
#include<TCollection_Side.hxx>
#include<HatchGen_Domain.hxx>
#include<HatchGen_Domains.hxx>
#include<HatchGen_ErrorStatus.hxx>
#include<HatchGen_IntersectionPoint.hxx>
#include<HatchGen_IntersectionType.hxx>
#include<HatchGen_PointOnElement.hxx>
#include<HatchGen_PointOnHatching.hxx>
#include<HatchGen_PointsOnElement.hxx>
#include<HatchGen_PointsOnHatching.hxx>
#include<HatchGen_SequenceNodeOfDomains.hxx>
#include<HatchGen_SequenceNodeOfPointsOnElement.hxx>
#include<HatchGen_SequenceNodeOfPointsOnHatching.hxx>
#include<Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter.hxx>
#include<Geom2dInt_Geom2dCurveTool.hxx>
#include<Geom2dInt_GInter.hxx>
#include<Geom2dInt_IntConicCurveOfGInter.hxx>
#include<Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter.hxx>
#include<Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter.hxx>
#include<Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter.hxx>
#include<Geom2dInt_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter.hxx>
#include<Geom2dInt_TheCurveLocatorOfTheProjPCurOfGInter.hxx>
#include<Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter.hxx>
#include<Geom2dInt_TheIntConicCurveOfGInter.hxx>
#include<Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter.hxx>
#include<Geom2dInt_TheIntPCurvePCurveOfGInter.hxx>
#include<Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter.hxx>
#include<Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter.hxx>
#include<Geom2dInt_TheProjPCurOfGInter.hxx>
#include<Adaptor3d_Curve.hxx>
#include<Adaptor3d_CurveOnSurface.hxx>
#include<Adaptor3d_CurveOnSurfacePtr.hxx>
#include<Adaptor3d_CurvePtr.hxx>
#include<Adaptor3d_HCurve.hxx>
#include<Adaptor3d_HCurveOnSurface.hxx>
#include<Adaptor3d_HIsoCurve.hxx>
#include<Adaptor3d_HOffsetCurve.hxx>
#include<Adaptor3d_HSurface.hxx>
#include<Adaptor3d_HSurfaceOfLinearExtrusion.hxx>
#include<Adaptor3d_HSurfaceOfRevolution.hxx>
#include<Adaptor3d_HSurfaceTool.hxx>
#include<Adaptor3d_HVertex.hxx>
#include<Adaptor3d_InterFunc.hxx>
#include<Adaptor3d_IsoCurve.hxx>
#include<Adaptor3d_OffsetCurve.hxx>
#include<Adaptor3d_Surface.hxx>
#include<Adaptor3d_SurfaceOfLinearExtrusion.hxx>
#include<Adaptor3d_SurfaceOfRevolution.hxx>
#include<Adaptor3d_SurfacePtr.hxx>
#include<Adaptor3d_TopolTool.hxx>
#include<Geom2d_AxisPlacement.hxx>
#include<Geom2d_BezierCurve.hxx>
#include<Geom2d_BoundedCurve.hxx>
#include<Geom2d_BSplineCurve.hxx>
#include<Geom2d_CartesianPoint.hxx>
#include<Geom2d_Circle.hxx>
#include<Geom2d_Conic.hxx>
#include<Geom2d_Curve.hxx>
#include<Geom2d_Direction.hxx>
#include<Geom2d_Ellipse.hxx>
#include<Geom2d_Geometry.hxx>
#include<Geom2d_Hyperbola.hxx>
#include<Geom2d_Line.hxx>
#include<Geom2d_OffsetCurve.hxx>
#include<Geom2d_Parabola.hxx>
#include<Geom2d_Point.hxx>
#include<Geom2d_Transformation.hxx>
#include<Geom2d_TrimmedCurve.hxx>
#include<Geom2d_UndefinedDerivative.hxx>
#include<Geom2d_UndefinedValue.hxx>
#include<Geom2d_Vector.hxx>
#include<Geom2d_VectorWithMagnitude.hxx>
#include<Intf.hxx>
#include<Intf_Array1OfLin.hxx>
#include<Intf_Interference.hxx>
#include<Intf_InterferencePolygon2d.hxx>
#include<Intf_PIType.hxx>
#include<Intf_Polygon2d.hxx>
#include<Intf_SectionLine.hxx>
#include<Intf_SectionPoint.hxx>
#include<Intf_SeqOfSectionLine.hxx>
#include<Intf_SeqOfSectionPoint.hxx>
#include<Intf_SeqOfTangentZone.hxx>
#include<Intf_SequenceNodeOfSeqOfSectionLine.hxx>
#include<Intf_SequenceNodeOfSeqOfSectionPoint.hxx>
#include<Intf_SequenceNodeOfSeqOfTangentZone.hxx>
#include<Intf_TangentZone.hxx>
#include<Intf_Tool.hxx>
#include<Extrema_Array1OfPOnCurv.hxx>
#include<Extrema_Array1OfPOnCurv2d.hxx>
#include<Extrema_Array1OfPOnSurf.hxx>
#include<Extrema_Array2OfPOnCurv.hxx>
#include<Extrema_Array2OfPOnCurv2d.hxx>
#include<Extrema_Array2OfPOnSurf.hxx>
#include<Extrema_Array2OfPOnSurfParams.hxx>
#include<Extrema_CCache2dOfExtCC2d.hxx>
#include<Extrema_CCacheOfExtCC.hxx>
#include<Extrema_CCFOfECC2dOfExtCC2d.hxx>
#include<Extrema_CCFOfECCOfExtCC.hxx>
#include<Extrema_CCFOfELCC2dOfLocateExtCC2d.hxx>
#include<Extrema_CCFOfELCCOfLocateExtCC.hxx>
#include<Extrema_CCLocFOfLocECC2dOfLocateExtCC2d.hxx>
#include<Extrema_CCLocFOfLocECCOfLocateExtCC.hxx>
#include<Extrema_Curve2dTool.hxx>
#include<Extrema_CurveTool.hxx>
#include<Extrema_ECC2dOfExtCC2d.hxx>
#include<Extrema_ECCOfExtCC.hxx>
#include<Extrema_ELCC2dOfLocateExtCC2d.hxx>
#include<Extrema_ELCCOfLocateExtCC.hxx>
#include<Extrema_ElementType.hxx>
#include<Extrema_ELPCOfLocateExtPC.hxx>
#include<Extrema_ELPCOfLocateExtPC2d.hxx>
#include<Extrema_EPCOfELPCOfLocateExtPC.hxx>
#include<Extrema_EPCOfELPCOfLocateExtPC2d.hxx>
#include<Extrema_EPCOfExtPC.hxx>
#include<Extrema_EPCOfExtPC2d.hxx>
#include<Extrema_ExtAlgo.hxx>
#include<Extrema_ExtCC.hxx>
#include<Extrema_ExtCC2d.hxx>
#include<Extrema_ExtCS.hxx>
#include<Extrema_ExtElC.hxx>
#include<Extrema_ExtElC2d.hxx>
#include<Extrema_ExtElCS.hxx>
#include<Extrema_ExtElSS.hxx>
#include<Extrema_ExtFlag.hxx>
#include<Extrema_ExtPC.hxx>
#include<Extrema_ExtPC2d.hxx>
#include<Extrema_ExtPElC.hxx>
#include<Extrema_ExtPElC2d.hxx>
#include<Extrema_ExtPElS.hxx>
#include<Extrema_ExtPExtS.hxx>
#include<Extrema_ExtPRevS.hxx>
#include<Extrema_ExtPS.hxx>
#include<Extrema_ExtSS.hxx>
#include<Extrema_FuncExtCS.hxx>
#include<Extrema_FuncExtPS.hxx>
#include<Extrema_FuncExtSS.hxx>
#include<Extrema_GenExtCS.hxx>
#include<Extrema_GenExtPS.hxx>
#include<Extrema_GenExtSS.hxx>
#include<Extrema_GenLocateExtCS.hxx>
#include<Extrema_GenLocateExtPS.hxx>
#include<Extrema_GenLocateExtSS.hxx>
#include<Extrema_HArray1OfPOnCurv.hxx>
#include<Extrema_HArray1OfPOnCurv2d.hxx>
#include<Extrema_HArray1OfPOnSurf.hxx>
#include<Extrema_HArray2OfPOnCurv.hxx>
#include<Extrema_HArray2OfPOnCurv2d.hxx>
#include<Extrema_HArray2OfPOnSurf.hxx>
#include<Extrema_HArray2OfPOnSurfParams.hxx>
#include<Extrema_HUBTreeOfSphere.hxx>
#include<Extrema_LCCache2dOfLocateExtCC2d.hxx>
#include<Extrema_LCCacheOfLocateExtCC.hxx>
#include<Extrema_LocateExtCC.hxx>
#include<Extrema_LocateExtCC2d.hxx>
#include<Extrema_LocateExtPC.hxx>
#include<Extrema_LocateExtPC2d.hxx>
#include<Extrema_LocECC2dOfLocateExtCC2d.hxx>
#include<Extrema_LocECCOfLocateExtCC.hxx>
#include<Extrema_LocEPCOfLocateExtPC.hxx>
#include<Extrema_LocEPCOfLocateExtPC2d.hxx>
#include<Extrema_PCFOfEPCOfELPCOfLocateExtPC.hxx>
#include<Extrema_PCFOfEPCOfELPCOfLocateExtPC2d.hxx>
#include<Extrema_PCFOfEPCOfExtPC.hxx>
#include<Extrema_PCFOfEPCOfExtPC2d.hxx>
#include<Extrema_PCLocFOfLocEPCOfLocateExtPC.hxx>
#include<Extrema_PCLocFOfLocEPCOfLocateExtPC2d.hxx>
#include<Extrema_POnCurv.hxx>
#include<Extrema_POnCurv2d.hxx>
#include<Extrema_POnSurf.hxx>
#include<Extrema_POnSurfParams.hxx>
#include<Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC.hxx>
#include<Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d.hxx>
#include<Extrema_SeqPCOfPCFOfEPCOfExtPC.hxx>
#include<Extrema_SeqPCOfPCFOfEPCOfExtPC2d.hxx>
#include<Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC.hxx>
#include<Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d.hxx>
#include<Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d.hxx>
#include<Extrema_SeqPOnCOfCCFOfECCOfExtCC.hxx>
#include<Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d.hxx>
#include<Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC.hxx>
#include<Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d.hxx>
#include<Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC.hxx>
#include<Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC.hxx>
#include<Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d.hxx>
#include<Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC.hxx>
#include<Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d.hxx>
#include<Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC.hxx>
#include<Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d.hxx>
#include<Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d.hxx>
#include<Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC.hxx>
#include<Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d.hxx>
#include<Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC.hxx>
#include<Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d.hxx>
#include<Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC.hxx>
#include<Extrema_SequenceNodeOfSequenceOfPOnCurv.hxx>
#include<Extrema_SequenceNodeOfSequenceOfPOnCurv2d.hxx>
#include<Extrema_SequenceNodeOfSequenceOfPOnSurf.hxx>
#include<Extrema_SequenceOfPOnCurv.hxx>
#include<Extrema_SequenceOfPOnCurv2d.hxx>
#include<Extrema_SequenceOfPOnSurf.hxx>
#include<Bnd_Array1OfBox.hxx>
#include<Bnd_Array1OfBox2d.hxx>
#include<Bnd_Array1OfSphere.hxx>
#include<Bnd_B2d.hxx>
#include<Bnd_B2f.hxx>
#include<Bnd_B3d.hxx>
#include<Bnd_B3f.hxx>
#include<Bnd_BoundSortBox.hxx>
#include<Bnd_BoundSortBox2d.hxx>
#include<Bnd_Box.hxx>
#include<Bnd_Box2d.hxx>
#include<Bnd_HArray1OfBox.hxx>
#include<Bnd_HArray1OfBox2d.hxx>
#include<Bnd_HArray1OfSphere.hxx>
#include<Bnd_SeqOfBox.hxx>
#include<Bnd_SequenceNodeOfSeqOfBox.hxx>
#include<Bnd_Sphere.hxx>
#include<Geom_Axis1Placement.hxx>
#include<Geom_Axis2Placement.hxx>
#include<Geom_AxisPlacement.hxx>
#include<Geom_BezierCurve.hxx>
#include<Geom_BezierSurface.hxx>
#include<Geom_BoundedCurve.hxx>
#include<Geom_BoundedSurface.hxx>
#include<Geom_BSplineCurve.hxx>
#include<Geom_BSplineSurface.hxx>
#include<Geom_CartesianPoint.hxx>
#include<Geom_Circle.hxx>
#include<Geom_Conic.hxx>
#include<Geom_ConicalSurface.hxx>
#include<Geom_Curve.hxx>
#include<Geom_CylindricalSurface.hxx>
#include<Geom_Direction.hxx>
#include<Geom_ElementarySurface.hxx>
#include<Geom_Ellipse.hxx>
#include<Geom_Geometry.hxx>
#include<Geom_HSequenceOfBSplineSurface.hxx>
#include<Geom_HSequenceOfSurface.hxx>
#include<Geom_Hyperbola.hxx>
#include<Geom_Line.hxx>
#include<Geom_OffsetCurve.hxx>
#include<Geom_OffsetSurface.hxx>
#include<Geom_OsculatingSurface.hxx>
#include<Geom_Parabola.hxx>
#include<Geom_Plane.hxx>
#include<Geom_Point.hxx>
#include<Geom_RectangularTrimmedSurface.hxx>
#include<Geom_SequenceNodeOfSequenceOfBSplineSurface.hxx>
#include<Geom_SequenceNodeOfSequenceOfSurface.hxx>
#include<Geom_SequenceOfBSplineSurface.hxx>
#include<Geom_SequenceOfSurface.hxx>
#include<Geom_SphericalSurface.hxx>
#include<Geom_Surface.hxx>
#include<Geom_SurfaceOfLinearExtrusion.hxx>
#include<Geom_SurfaceOfRevolution.hxx>
#include<Geom_SweptSurface.hxx>
#include<Geom_ToroidalSurface.hxx>
#include<Geom_Transformation.hxx>
#include<Geom_TrimmedCurve.hxx>
#include<Geom_UndefinedDerivative.hxx>
#include<Geom_UndefinedValue.hxx>
#include<Geom_Vector.hxx>
#include<Geom_VectorWithMagnitude.hxx>
#include<TColgp_Array1OfCirc2d.hxx>
#include<TColgp_Array1OfDir.hxx>
#include<TColgp_Array1OfDir2d.hxx>
#include<TColgp_Array1OfLin2d.hxx>
#include<TColgp_Array1OfPnt.hxx>
#include<TColgp_Array1OfPnt2d.hxx>
#include<TColgp_Array1OfVec.hxx>
#include<TColgp_Array1OfVec2d.hxx>
#include<TColgp_Array1OfXY.hxx>
#include<TColgp_Array1OfXYZ.hxx>
#include<TColgp_Array2OfCirc2d.hxx>
#include<TColgp_Array2OfDir.hxx>
#include<TColgp_Array2OfDir2d.hxx>
#include<TColgp_Array2OfLin2d.hxx>
#include<TColgp_Array2OfPnt.hxx>
#include<TColgp_Array2OfPnt2d.hxx>
#include<TColgp_Array2OfVec.hxx>
#include<TColgp_Array2OfVec2d.hxx>
#include<TColgp_Array2OfXY.hxx>
#include<TColgp_Array2OfXYZ.hxx>
#include<TColgp_DataMapIteratorOfDataMapOfIntegerCirc2d.hxx>
#include<TColgp_DataMapNodeOfDataMapOfIntegerCirc2d.hxx>
#include<TColgp_DataMapOfIntegerCirc2d.hxx>
#include<TColgp_HArray1OfCirc2d.hxx>
#include<TColgp_HArray1OfDir.hxx>
#include<TColgp_HArray1OfDir2d.hxx>
#include<TColgp_HArray1OfLin2d.hxx>
#include<TColgp_HArray1OfPnt.hxx>
#include<TColgp_HArray1OfPnt2d.hxx>
#include<TColgp_HArray1OfVec.hxx>
#include<TColgp_HArray1OfVec2d.hxx>
#include<TColgp_HArray1OfXY.hxx>
#include<TColgp_HArray1OfXYZ.hxx>
#include<TColgp_HArray2OfCirc2d.hxx>
#include<TColgp_HArray2OfDir.hxx>
#include<TColgp_HArray2OfDir2d.hxx>
#include<TColgp_HArray2OfLin2d.hxx>
#include<TColgp_HArray2OfPnt.hxx>
#include<TColgp_HArray2OfPnt2d.hxx>
#include<TColgp_HArray2OfVec.hxx>
#include<TColgp_HArray2OfVec2d.hxx>
#include<TColgp_HArray2OfXY.hxx>
#include<TColgp_HArray2OfXYZ.hxx>
#include<TColgp_HSequenceOfDir.hxx>
#include<TColgp_HSequenceOfDir2d.hxx>
#include<TColgp_HSequenceOfPnt.hxx>
#include<TColgp_HSequenceOfPnt2d.hxx>
#include<TColgp_HSequenceOfVec.hxx>
#include<TColgp_HSequenceOfVec2d.hxx>
#include<TColgp_HSequenceOfXY.hxx>
#include<TColgp_HSequenceOfXYZ.hxx>
#include<TColgp_SequenceNodeOfSequenceOfArray1OfPnt2d.hxx>
#include<TColgp_SequenceNodeOfSequenceOfDir.hxx>
#include<TColgp_SequenceNodeOfSequenceOfDir2d.hxx>
#include<TColgp_SequenceNodeOfSequenceOfPnt.hxx>
#include<TColgp_SequenceNodeOfSequenceOfPnt2d.hxx>
#include<TColgp_SequenceNodeOfSequenceOfVec.hxx>
#include<TColgp_SequenceNodeOfSequenceOfVec2d.hxx>
#include<TColgp_SequenceNodeOfSequenceOfXY.hxx>
#include<TColgp_SequenceNodeOfSequenceOfXYZ.hxx>
#include<TColgp_SequenceOfArray1OfPnt2d.hxx>
#include<TColgp_SequenceOfDir.hxx>
#include<TColgp_SequenceOfDir2d.hxx>
#include<TColgp_SequenceOfPnt.hxx>
#include<TColgp_SequenceOfPnt2d.hxx>
#include<TColgp_SequenceOfVec.hxx>
#include<TColgp_SequenceOfVec2d.hxx>
#include<TColgp_SequenceOfXY.hxx>
#include<TColgp_SequenceOfXYZ.hxx>
#include<TColStd_Array1OfAsciiString.hxx>
#include<TColStd_Array1OfBoolean.hxx>
#include<TColStd_Array1OfByte.hxx>
#include<TColStd_Array1OfCharacter.hxx>
#include<TColStd_Array1OfExtendedString.hxx>
#include<TColStd_Array1OfInteger.hxx>
#include<TColStd_Array1OfListOfInteger.hxx>
#include<TColStd_Array1OfReal.hxx>
#include<TColStd_Array1OfTransient.hxx>
#include<TColStd_Array2OfBoolean.hxx>
#include<TColStd_Array2OfCharacter.hxx>
#include<TColStd_Array2OfInteger.hxx>
#include<TColStd_Array2OfReal.hxx>
#include<TColStd_Array2OfTransient.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfAsciiStringInteger.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfIntegerInteger.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfIntegerListOfInteger.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfIntegerReal.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfIntegerTransient.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfStringInteger.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfTransientTransient.hxx>
#include<TColStd_DataMapNodeOfDataMapOfAsciiStringInteger.hxx>
#include<TColStd_DataMapNodeOfDataMapOfIntegerInteger.hxx>
#include<TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger.hxx>
#include<TColStd_DataMapNodeOfDataMapOfIntegerReal.hxx>
#include<TColStd_DataMapNodeOfDataMapOfIntegerTransient.hxx>
#include<TColStd_DataMapNodeOfDataMapOfStringInteger.hxx>
#include<TColStd_DataMapNodeOfDataMapOfTransientTransient.hxx>
#include<TColStd_DataMapOfAsciiStringInteger.hxx>
#include<TColStd_DataMapOfIntegerInteger.hxx>
#include<TColStd_DataMapOfIntegerListOfInteger.hxx>
#include<TColStd_DataMapOfIntegerReal.hxx>
#include<TColStd_DataMapOfIntegerTransient.hxx>
#include<TColStd_DataMapOfStringInteger.hxx>
#include<TColStd_DataMapOfTransientTransient.hxx>
#include<TColStd_HArray1OfAsciiString.hxx>
#include<TColStd_HArray1OfBoolean.hxx>
#include<TColStd_HArray1OfByte.hxx>
#include<TColStd_HArray1OfCharacter.hxx>
#include<TColStd_HArray1OfExtendedString.hxx>
#include<TColStd_HArray1OfInteger.hxx>
#include<TColStd_HArray1OfListOfInteger.hxx>
#include<TColStd_HArray1OfReal.hxx>
#include<TColStd_HArray1OfTransient.hxx>
#include<TColStd_HArray2OfBoolean.hxx>
#include<TColStd_HArray2OfCharacter.hxx>
#include<TColStd_HArray2OfInteger.hxx>
#include<TColStd_HArray2OfReal.hxx>
#include<TColStd_HArray2OfTransient.hxx>
#include<TColStd_HPackedMapOfInteger.hxx>
#include<TColStd_HSequenceOfAsciiString.hxx>
#include<TColStd_HSequenceOfExtendedString.hxx>
#include<TColStd_HSequenceOfHAsciiString.hxx>
#include<TColStd_HSequenceOfHExtendedString.hxx>
#include<TColStd_HSequenceOfInteger.hxx>
#include<TColStd_HSequenceOfReal.hxx>
#include<TColStd_HSequenceOfTransient.hxx>
#include<TColStd_HSetOfInteger.hxx>
#include<TColStd_HSetOfReal.hxx>
#include<TColStd_HSetOfTransient.hxx>
#include<TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient.hxx>
#include<TColStd_IndexedDataMapOfTransientTransient.hxx>
#include<TColStd_IndexedMapNodeOfIndexedMapOfInteger.hxx>
#include<TColStd_IndexedMapNodeOfIndexedMapOfReal.hxx>
#include<TColStd_IndexedMapNodeOfIndexedMapOfTransient.hxx>
#include<TColStd_IndexedMapOfInteger.hxx>
#include<TColStd_IndexedMapOfReal.hxx>
#include<TColStd_IndexedMapOfTransient.hxx>
#include<TColStd_ListIteratorOfListOfAsciiString.hxx>
#include<TColStd_ListIteratorOfListOfInteger.hxx>
#include<TColStd_ListIteratorOfListOfReal.hxx>
#include<TColStd_ListIteratorOfListOfTransient.hxx>
#include<TColStd_ListIteratorOfSetListOfSetOfInteger.hxx>
#include<TColStd_ListIteratorOfSetListOfSetOfReal.hxx>
#include<TColStd_ListIteratorOfSetListOfSetOfTransient.hxx>
#include<TColStd_ListNodeOfListOfAsciiString.hxx>
#include<TColStd_ListNodeOfListOfInteger.hxx>
#include<TColStd_ListNodeOfListOfReal.hxx>
#include<TColStd_ListNodeOfListOfTransient.hxx>
#include<TColStd_ListNodeOfSetListOfSetOfInteger.hxx>
#include<TColStd_ListNodeOfSetListOfSetOfReal.hxx>
#include<TColStd_ListNodeOfSetListOfSetOfTransient.hxx>
#include<TColStd_ListOfAsciiString.hxx>
#include<TColStd_ListOfInteger.hxx>
#include<TColStd_ListOfReal.hxx>
#include<TColStd_ListOfTransient.hxx>
#include<TColStd_MapIntegerHasher.hxx>
#include<TColStd_MapIteratorOfMapOfAsciiString.hxx>
#include<TColStd_MapIteratorOfMapOfInteger.hxx>
#include<TColStd_MapIteratorOfMapOfReal.hxx>
#include<TColStd_MapIteratorOfMapOfTransient.hxx>
#include<TColStd_MapIteratorOfPackedMapOfInteger.hxx>
#include<TColStd_MapOfAsciiString.hxx>
#include<TColStd_MapOfInteger.hxx>
#include<TColStd_MapOfReal.hxx>
#include<TColStd_MapOfTransient.hxx>
#include<TColStd_MapRealHasher.hxx>
#include<TColStd_MapTransientHasher.hxx>
#include<TColStd_PackedMapOfInteger.hxx>
#include<TColStd_QueueNodeOfQueueOfInteger.hxx>
#include<TColStd_QueueNodeOfQueueOfReal.hxx>
#include<TColStd_QueueNodeOfQueueOfTransient.hxx>
#include<TColStd_QueueOfInteger.hxx>
#include<TColStd_QueueOfReal.hxx>
#include<TColStd_QueueOfTransient.hxx>
#include<TColStd_SequenceNodeOfSequenceOfAddress.hxx>
#include<TColStd_SequenceNodeOfSequenceOfAsciiString.hxx>
#include<TColStd_SequenceNodeOfSequenceOfBoolean.hxx>
#include<TColStd_SequenceNodeOfSequenceOfExtendedString.hxx>
#include<TColStd_SequenceNodeOfSequenceOfHAsciiString.hxx>
#include<TColStd_SequenceNodeOfSequenceOfHExtendedString.hxx>
#include<TColStd_SequenceNodeOfSequenceOfInteger.hxx>
#include<TColStd_SequenceNodeOfSequenceOfReal.hxx>
#include<TColStd_SequenceNodeOfSequenceOfTransient.hxx>
#include<TColStd_SequenceOfAddress.hxx>
#include<TColStd_SequenceOfAsciiString.hxx>
#include<TColStd_SequenceOfBoolean.hxx>
#include<TColStd_SequenceOfExtendedString.hxx>
#include<TColStd_SequenceOfHAsciiString.hxx>
#include<TColStd_SequenceOfHExtendedString.hxx>
#include<TColStd_SequenceOfInteger.hxx>
#include<TColStd_SequenceOfReal.hxx>
#include<TColStd_SequenceOfTransient.hxx>
#include<TColStd_SetIteratorOfSetOfInteger.hxx>
#include<TColStd_SetIteratorOfSetOfReal.hxx>
#include<TColStd_SetIteratorOfSetOfTransient.hxx>
#include<TColStd_SetListOfSetOfInteger.hxx>
#include<TColStd_SetListOfSetOfReal.hxx>
#include<TColStd_SetListOfSetOfTransient.hxx>
#include<TColStd_SetOfInteger.hxx>
#include<TColStd_SetOfReal.hxx>
#include<TColStd_SetOfTransient.hxx>
#include<TColStd_StackIteratorOfStackOfInteger.hxx>
#include<TColStd_StackIteratorOfStackOfReal.hxx>
#include<TColStd_StackIteratorOfStackOfTransient.hxx>
#include<TColStd_StackNodeOfStackOfInteger.hxx>
#include<TColStd_StackNodeOfStackOfReal.hxx>
#include<TColStd_StackNodeOfStackOfTransient.hxx>
#include<TColStd_StackOfInteger.hxx>
#include<TColStd_StackOfReal.hxx>
#include<TColStd_StackOfTransient.hxx>
#include<TColStd_StdMapNodeOfMapOfAsciiString.hxx>
#include<TColStd_StdMapNodeOfMapOfInteger.hxx>
#include<TColStd_StdMapNodeOfMapOfReal.hxx>
#include<TColStd_StdMapNodeOfMapOfTransient.hxx>
#include<TCollection.hxx>
#include<TCollection_Array1Descriptor.hxx>
#include<TCollection_Array2Descriptor.hxx>
#include<TCollection_AsciiString.hxx>
#include<TCollection_AVLBaseNode.hxx>
#include<TCollection_AVLBaseNodePtr.hxx>
#include<TCollection_BaseSequence.hxx>
#include<TCollection_BasicMap.hxx>
#include<TCollection_BasicMapIterator.hxx>
#include<TCollection_CompareOfInteger.hxx>
#include<TCollection_CompareOfReal.hxx>
#include<TCollection_ExtendedString.hxx>
#include<TCollection_HAsciiString.hxx>
#include<TCollection_HExtendedString.hxx>
#include<TCollection_MapNode.hxx>
#include<TCollection_MapNodePtr.hxx>
#include<TCollection_PrivCompareOfInteger.hxx>
#include<TCollection_PrivCompareOfReal.hxx>
#include<TCollection_SeqNode.hxx>
#include<TCollection_SeqNodePtr.hxx>
#include<TCollection_Side.hxx>
#include<Storage.hxx>
#include<Storage_ArrayOfCallBack.hxx>
#include<Storage_ArrayOfSchema.hxx>
#include<Storage_BaseDriver.hxx>
#include<Storage_BucketOfPersistent.hxx>
#include<Storage_CallBack.hxx>
#include<Storage_Container.hxx>
#include<Storage_Data.hxx>
#include<Storage_DataMapIteratorOfMapOfCallBack.hxx>
#include<Storage_DataMapIteratorOfMapOfPers.hxx>
#include<Storage_DataMapNodeOfMapOfCallBack.hxx>
#include<Storage_DataMapNodeOfMapOfPers.hxx>
#include<Storage_DefaultCallBack.hxx>
#include<Storage_Error.hxx>
#include<Storage_HArrayOfCallBack.hxx>
#include<Storage_HArrayOfSchema.hxx>
#include<Storage_HeaderData.hxx>
#include<Storage_HPArray.hxx>
#include<Storage_HSeqOfCallBack.hxx>
#include<Storage_HSeqOfPersistent.hxx>
#include<Storage_HSeqOfRoot.hxx>
#include<Storage_IndexedDataMapNodeOfPType.hxx>
#include<Storage_InternalData.hxx>
#include<Storage_Macros.hxx>
#include<Storage_MapOfCallBack.hxx>
#include<Storage_MapOfPers.hxx>
#include<Storage_MapPSDHasher.hxx>
#include<Storage_OpenMode.hxx>
#include<Storage_PArray.hxx>
#include<Storage_Position.hxx>
#include<Storage_PType.hxx>
#include<Storage_Root.hxx>
#include<Storage_RootData.hxx>
#include<Storage_Schema.hxx>
#include<Storage_SeqOfCallBack.hxx>
#include<Storage_SeqOfPersistent.hxx>
#include<Storage_SeqOfRoot.hxx>
#include<Storage_SequenceNodeOfSeqOfCallBack.hxx>
#include<Storage_SequenceNodeOfSeqOfPersistent.hxx>
#include<Storage_SequenceNodeOfSeqOfRoot.hxx>
#include<Storage_SolveMode.hxx>
#include<Storage_stCONSTclCOM.hxx>
#include<Storage_StreamExtCharParityError.hxx>
#include<Storage_StreamFormatError.hxx>
#include<Storage_StreamModeError.hxx>
#include<Storage_StreamReadError.hxx>
#include<Storage_StreamTypeMismatchError.hxx>
#include<Storage_StreamWriteError.hxx>
#include<Storage_TypeData.hxx>
#include<Storage_TypedCallBack.hxx>
%};
%import gp.i
%import Standard.i
%import TopAbs.i
%import Geom2dAdaptor.i
%import IntRes2d.i
%import TCollection.i
%import HatchGen.i
%import Geom2dInt.i
