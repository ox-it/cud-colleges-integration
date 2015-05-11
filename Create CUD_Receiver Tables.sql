USE [CUD_Receiver]

CREATE TABLE [dbo].[Addresses](
	[cudid] [nvarchar](255) NULL,
	[AddressSeq] [nvarchar](255) NULL,
	[AddressTyp] [nvarchar](255) NULL,
	[Line1] [nvarchar](255) NULL,
	[Line2] [nvarchar](255) NULL,
	[Line3] [nvarchar](255) NULL,
	[Line4] [nvarchar](255) NULL,
	[Line5] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[PostCode] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[County] [nvarchar](255) NULL,
	[AddressCtryCd] [nvarchar](255) NULL,
	[AddressCtryDesc] [nvarchar](255) NULL,
	[PrimaryFlag] [nvarchar](255) NULL,
	[AddressEmail] [nvarchar](255) NULL,
	[TelNo] [nvarchar](255) NULL,
	[MobileNo] [nvarchar](255) NULL,
	[Confirmed] [nvarchar](255) NULL,
	[LastUpdateDt] [nvarchar](255) NULL,
	[AddressEntity] [nvarchar](255) NULL)
	;
	
	CREATE TABLE [dbo].[Applications](
	[cudid] [nvarchar](255) NULL,
	[ApplicantCode] [nvarchar](255) NULL,
	[ApplicantNumber] [nvarchar](255) NULL,
	[OSSCourseCd] [nvarchar](255) NULL,
	[ApplyCollCd] [nvarchar](255) NULL,
	[ApplyCollName] [nvarchar](255) NULL,
	[StartDt] [nvarchar](255) NULL,
	[EndDt] [nvarchar](255) NULL,
	[YearOfProg] [nvarchar](255) NULL,
	[OutComeStatus] [nvarchar](255) NULL,
	[OfferResponse] [nvarchar](255) NULL,
	[ApplyAttendModeCd] [nvarchar](255) NULL,
	[ApplyAttendTypeCd] [nvarchar](255) NULL,
	[ApplyFeeStatusCd] [nvarchar](255) NULL,
	[FeeStatusName] [nvarchar](255) NULL,
	[AcademicCalendar] [nvarchar](255) NULL,
	[CollegeOffer] [nvarchar](255) NULL,
	[ApplyStatus] [nvarchar](255) NULL,
	[ProgAttmptStatus] [nvarchar](255) NULL,
	[AwdCd] [nvarchar](255) NULL,
	[AwdName] [nvarchar](255) NULL,
	[CrsCd] [nvarchar](255) NULL,
	[CrsName] [nvarchar](255) NULL,
	[RoutCd] [nvarchar](255) NULL,
	[RoutName] [nvarchar](255) NULL,
	[OSSCode] [nvarchar](255) NULL,
	[PrgCd] [nvarchar](255) NULL,
	[PrgName] [nvarchar](255) NULL,
	[CrsLevel] [nvarchar](255) NULL,
	[AdminDeptCd] [nvarchar](255) NULL,
	[AdminDeptName] [nvarchar](255) NULL,
	[AdminDivCd] [nvarchar](255) NULL,
	[AdminDivName] [nvarchar](255) NULL)
	;
	
	CREATE TABLE [dbo].[AppliedCollDept](
	[cudid] [nvarchar](255) NULL,
	[application_dept_code] [nvarchar](255) NULL,
	[application_college_code] [nvarchar](255) NULL)
	;
	
	CREATE TABLE [dbo].[ContactDetails](
	[cudid] [nvarchar](255) NULL,
	[Type] [nvarchar](255) NULL,
	[SubType] [nvarchar](255) NULL,
	[Value] [nvarchar](255) NULL)
	;
	
	CREATE TABLE [dbo].[CoOwningDepartments](
	[cudid] [nvarchar](255) NULL,
	[CoOwnDptCd] [nvarchar](255) NULL,
	[CoOwnDptDesc] [nvarchar](255) NULL)
	;
	
	CREATE TABLE [dbo].[EnrolAwdProg](
	[cudid] [nvarchar](255) NULL,
	[code] [nvarchar](255) NULL,
	[AwdCd] [nvarchar](255) NULL,
	[AwdName] [nvarchar](255) NULL,
	[UCASCode] [nvarchar](255) NULL,
	[CrsCd] [nvarchar](255) NULL,
	[CrsName] [nvarchar](255) NULL,
	[CrsShortName] [nvarchar](255) NULL,
	[RoutCd] [nvarchar](255) NULL,
	[RoutName] [nvarchar](255) NULL,
	[OSSCode] [nvarchar](255) NULL,
	[PrgCd] [nvarchar](255) NULL,
	[Finalist] [nvarchar](255) NULL,
	[DateAwdConferred] [nvarchar](255) NULL,
	[CrsLevel] [nvarchar](255) NULL,
	[DegreeCeremonyCd] [nvarchar](255) NULL,
	[DegreeCeremonyDt] [nvarchar](255) NULL,
	[DegreeCeremonyCollegeCd] [nvarchar](255) NULL,
	[DegreeCeremonyCourseCd] [nvarchar](255) NULL,
	[DegreeCeremonyAwardCd] [nvarchar](255) NULL,
	[DegreeCeremonyStatusName] [nvarchar](255) NULL)
	
	CREATE TABLE [dbo].[Enrolments](
	[cudid] [nvarchar](255) NULL,
	[Code] [nvarchar](255) NULL,
	[Status] [nvarchar](255) NULL,
	[SCJStage] [nvarchar](255) NULL,
	[SCJSequence] [nvarchar](255) NULL,
	[SCJStatusCd] [nvarchar](255) NULL,
	[SCJStatusName] [nvarchar](255) NULL,
	[SprStatusCd] [nvarchar](255) NULL,
	[SprStatusName] [nvarchar](255) NULL,
	[CrsStartDt] [nvarchar](255) NULL,
	[CrsEndDt] [nvarchar](255) NULL,
	[CrsExpEndDt] [nvarchar](255) NULL,
	[CrsLength] [nvarchar](255) NULL,
	[CrsTotalYears] [nvarchar](255) NULL,
	[StartTerm] [nvarchar](255) NULL,
	[ExpEndTerm] [nvarchar](255) NULL,
	[EntryYear] [nvarchar](255) NULL,
	[FinalYear] [nvarchar](255) NULL,
	[HESAStartDate] [nvarchar](255) NULL,
	[ModeOfAttendance] [nvarchar](255) NULL,
	[Progress] [nvarchar](255) NULL,
	[AwardAim] [nvarchar](255) NULL,
	[DiscontinReasonCd] [nvarchar](255) NULL,
	[TrnsfFromSCJCd] [nvarchar](255) NULL,
	[TrnsfToSCJCd] [nvarchar](255) NULL,
	[TrnsfFromCrsCd] [nvarchar](255) NULL,
	[TrnsfFromCrsName] [nvarchar](255) NULL,
	[TrnsfToCrsCd] [nvarchar](255) NULL,
	[TrnsfToCrsName] [nvarchar](255) NULL,
	[TrnsfToDt] [nvarchar](255) NULL,
	[AltnFeeEntryYear] [nvarchar](255) NULL,
	[CollegeCd] [nvarchar] (255) NULL)
	;
	
	CREATE TABLE [dbo].[ExternalIds](
	[cudid] [nvarchar](255) NULL,
	[ExtId] [nvarchar](255) NULL,
	[ExtIdType] [nvarchar](255) NULL,
	[ExtIdStartDt] [nvarchar](255) NULL,
	[ExtIdEndDt] [nvarchar](255) NULL)
	;
	
	CREATE TABLE [dbo].[Nationalities](
	[cudid] [nvarchar](255) NULL,
	[NatCd] [nvarchar](255) NULL,
	[NatName] [nvarchar](255) NULL,
	[NatStartDt] [nvarchar](255) NULL)
	;
	
	CREATE TABLE [dbo].[Person](
	[cudid] [nvarchar](255) NULL,
	[sits_student_code] [nvarchar](255) NULL,
	[oss_student_number] [nvarchar](255) NULL,
	[firstname] [nvarchar](255) NULL,
	[middlenames] [nvarchar](255) NULL,
	[lastname] [nvarchar](255) NULL,
	[FullName] [nvarchar](255) NULL,
	[known_as] [nvarchar](255) NULL,
	[prev_surnm] [nvarchar](255) NULL,
	[titl_cd] [nvarchar](255) NULL,
	[initials] [nvarchar](255) NULL,
	[gnd] [nvarchar](255) NULL,
	[dob] [nvarchar](255) NULL,
	[dom_cd] [nvarchar](255) NULL,
	[dom_hesa_cd] [nvarchar](255) NULL,
	[dom_name] [nvarchar](255) NULL,
	[birth_ctry_cd] [nvarchar](255) NULL,
	[birth_ctry_name] [nvarchar](255) NULL,
	[alt_email] [nvarchar](255) NULL,
	[oxford_email] [nvarchar](255) NULL,
	[sso_username] [nvarchar](255) NULL,
	[university_card_status] [nvarchar](255) NULL,
	[university_card_sysis] [nvarchar](255) NULL,
	[university_card_type] [nvarchar](255) NULL,
	[barcode] [nvarchar](255) NULL,
	[barcode7] [nvarchar](255) NULL,
	[University_Card_Start_Dt] [nvarchar](255) NULL,
	[University_Card_End_Dt] [nvarchar](255) NULL,
	[MiFareID] [nvarchar](255) NULL,
	[PaxonID] [nvarchar](255) NULL,
	[dept_cd] [nvarchar](255) NULL,
	[co_owning_dept_code] [nvarchar](255) NULL,
	[div_cd] [nvarchar](255) NULL,
	[div_desc] [nvarchar](255) NULL,
	[rout_cd] [nvarchar](255) NULL,
	[rout_name] [nvarchar](255) NULL,
	[course_join_status] [nvarchar](255) NULL,
	[course_status] [nvarchar](255) NULL,
	[course_block] [nvarchar](255) NULL,
	[crs_start_dt] [nvarchar](255) NULL,
	[crs_exp_end_dt] [nvarchar](255) NULL,
	[mode_of_attendance] [nvarchar](255) NULL,
	[unit_set_cd] [nvarchar](255) NULL,
	[award_aim] [nvarchar](255) NULL)
	;
	
	CREATE TABLE [dbo].[Qualifications](
	[cudid] [nvarchar](255) NULL,
	[QualCode] [nvarchar](255) NULL,
	[QualDesc] [nvarchar](255) NULL,
	[ApprovedResult] [nvarchar](255) NULL,
	[ClaimedResult] [nvarchar](255) NULL,
	[PredictedResult] [nvarchar](255) NULL,
	[QualYear] [nvarchar](255) NULL,
	[QualSitting] [nvarchar](255) NULL,
	[AwdBody] [nvarchar](255) NULL,
	[AwdBodyDesc] [nvarchar](255) NULL,
	[AwdBodyDescUCAS] [nvarchar](255) NULL,
	[QualificationID] [nvarchar](255) NULL)
	;
	
	CREATE TABLE [dbo].[reassessments](
	[cudid] [nvarchar](255) NULL,
	[Code] [nvarchar](255) NULL,
	[ReAssessment] [nvarchar](255) NULL)
	;
	
	CREATE TABLE [dbo].[Student](
	[cudid] [nvarchar](255) NULL,
	[Student_Id] [nvarchar](255) NULL,
	[StudentNumber] [nvarchar](255) NULL,
	[LastInstit] [nvarchar](255) NULL,
	[StudentEndDt] [nvarchar](255) NULL,
	[MatricDt] [nvarchar](255) NULL,
	[ProvMatricDt] [nvarchar](255) NULL,
	[Fresher] [nvarchar](255) NULL)
	;
	
	CREATE TABLE [dbo].[Subjects](
	[Qualification_Id] [nvarchar](255) NULL,
	[Subjects_Id] [nvarchar](255) NULL,
	[SubjCode] [nvarchar](255) NULL,
	[SubjDesc] [nvarchar](255) NULL)
	;
	
	CREATE TABLE [dbo].[supervisors](
	[cudid] [nvarchar](255) NULL,
	[PersonCode] [nvarchar](255) NULL,
	[SuperTitlCd] [nvarchar](255) NULL,
	[SuperTitlDesc] [nvarchar](255) NULL,
	[SuperFrnm1] [nvarchar](255) NULL,
	[SuperFrnm2] [nvarchar](255) NULL,
	[SuperSrnm] [nvarchar](255) NULL,
	[SuperFullName] [nvarchar](255) NULL,
	[SuperSrtDt] [nvarchar](255) NULL,
	[SuperEndDt] [nvarchar](255) NULL,
	[SuperSupCode] [nvarchar](255) NULL,
	[SuperExtId] [nvarchar](255) NULL,
	[SuperDeptCd] [nvarchar](255) NULL,
	[SuperDeptName] [nvarchar](255) NULL,
	[SuperDeptShortName] [nvarchar](255) NULL,
	[SuperTypeCd] [nvarchar](255) NULL,
	[SuperTypeName] [nvarchar](255) NULL,
	[SuperEmail] [nvarchar](255) NULL)
	;
	
	CREATE TABLE [dbo].[suspensions](
	[cudid] [nvarchar](255) NULL,
	[student_id] [nvarchar](255) NULL,
	[SuspendStrDt] [nvarchar](255) NULL,
	[SuspendEndDt] [nvarchar](255) NULL,
	[SuspendSeq] [nvarchar](255) NULL)
	;
	
	CREATE TABLE [dbo].[TheResDeg](
	[cudid] [nvarchar](255) NULL,
	[ResCouncilId] [nvarchar](255) NULL,
	[ResearchTitle] [nvarchar](255) NULL,
	[ThesisStatus] [nvarchar](255) NULL,
	[ThesisFinalInd] [nvarchar](255) NULL,
	[ThesisRsltCd] [nvarchar](255) NULL,
	[ThesisRsltDesc] [nvarchar](255) NULL,
	[ThesisRsltDt] [nvarchar](255) NULL,
	[ThesisSubmitDt] [nvarchar](255) NULL,
	[ThesisResubmissionDt] [nvarchar](255) NULL,
	[ThesisMaxSubmitDt] [nvarchar](255) NULL,
	[YearOutcome] [nvarchar](255) NULL,
	[DegreeClassCd] [nvarchar](255) NULL,
	[DegreeClassName] [nvarchar](255) NULL)
	;
	
	CREATE TABLE [dbo].[YearsOfAwdProg](
	[cudid] [nvarchar](255) NULL,
	[code] [nvarchar](255) NULL,
	[SCESequence] [nvarchar](255) NULL,
	[SCEStatusCd] [nvarchar](255) NULL,
	[SCEStatusDesc] [nvarchar](255) NULL,
	[SCEStatusUpdateDt] [nvarchar](255) NULL,
	[Occur] [nvarchar](255) NULL,
	[AttendModeCd] [nvarchar](255) NULL,
	[AttendModeDesc] [nvarchar](255) NULL,
	[DeptCd] [nvarchar](255) NULL,
	[DeptName] [nvarchar](255) NULL,
	[DeptShortName] [nvarchar](255) NULL,
	[FeeStatusCd] [nvarchar](255) NULL,
	[DivCd] [nvarchar](255) NULL,
	[UnitSetCd] [nvarchar](255) NULL,
	[FeesDesc] [nvarchar](255) NULL,
	[ExternalLocCd] [nvarchar](255) NULL,
	[ExternalLocDesc] [nvarchar](255) NULL,
	[Block] [nvarchar](255) NULL,
	[DivDesc] [nvarchar](255) NULL,
	[TuitionFeeValue] [nvarchar](255) NULL,
	[FeeDueDt] [nvarchar](255) NULL,
	[AcademicYear] [nvarchar](255) NULL,
	[FundingType] [nvarchar](255) NULL)
	;