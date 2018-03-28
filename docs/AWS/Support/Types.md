## Module AWS.Support.Types

#### `options`

``` purescript
options :: Options
```

#### `AddAttachmentsToSetRequest`

``` purescript
newtype AddAttachmentsToSetRequest
  = AddAttachmentsToSetRequest { attachmentSetId :: NullOrUndefined (AttachmentSetId), attachments :: Attachments }
```

<p/>

##### Instances
``` purescript
Newtype AddAttachmentsToSetRequest _
Generic AddAttachmentsToSetRequest _
Show AddAttachmentsToSetRequest
Decode AddAttachmentsToSetRequest
Encode AddAttachmentsToSetRequest
```

#### `newAddAttachmentsToSetRequest`

``` purescript
newAddAttachmentsToSetRequest :: Attachments -> AddAttachmentsToSetRequest
```

Constructs AddAttachmentsToSetRequest from required parameters

#### `newAddAttachmentsToSetRequest'`

``` purescript
newAddAttachmentsToSetRequest' :: Attachments -> ({ attachmentSetId :: NullOrUndefined (AttachmentSetId), attachments :: Attachments } -> { attachmentSetId :: NullOrUndefined (AttachmentSetId), attachments :: Attachments }) -> AddAttachmentsToSetRequest
```

Constructs AddAttachmentsToSetRequest's fields from required parameters

#### `AddAttachmentsToSetResponse`

``` purescript
newtype AddAttachmentsToSetResponse
  = AddAttachmentsToSetResponse { attachmentSetId :: NullOrUndefined (AttachmentSetId), expiryTime :: NullOrUndefined (ExpiryTime) }
```

<p>The ID and expiry time of the attachment set returned by the <a>AddAttachmentsToSet</a> operation.</p>

##### Instances
``` purescript
Newtype AddAttachmentsToSetResponse _
Generic AddAttachmentsToSetResponse _
Show AddAttachmentsToSetResponse
Decode AddAttachmentsToSetResponse
Encode AddAttachmentsToSetResponse
```

#### `newAddAttachmentsToSetResponse`

``` purescript
newAddAttachmentsToSetResponse :: AddAttachmentsToSetResponse
```

Constructs AddAttachmentsToSetResponse from required parameters

#### `newAddAttachmentsToSetResponse'`

``` purescript
newAddAttachmentsToSetResponse' :: ({ attachmentSetId :: NullOrUndefined (AttachmentSetId), expiryTime :: NullOrUndefined (ExpiryTime) } -> { attachmentSetId :: NullOrUndefined (AttachmentSetId), expiryTime :: NullOrUndefined (ExpiryTime) }) -> AddAttachmentsToSetResponse
```

Constructs AddAttachmentsToSetResponse's fields from required parameters

#### `AddCommunicationToCaseRequest`

``` purescript
newtype AddCommunicationToCaseRequest
  = AddCommunicationToCaseRequest { caseId :: NullOrUndefined (CaseId), communicationBody :: CommunicationBody, ccEmailAddresses :: NullOrUndefined (CcEmailAddressList), attachmentSetId :: NullOrUndefined (AttachmentSetId) }
```

<p>To be written.</p>

##### Instances
``` purescript
Newtype AddCommunicationToCaseRequest _
Generic AddCommunicationToCaseRequest _
Show AddCommunicationToCaseRequest
Decode AddCommunicationToCaseRequest
Encode AddCommunicationToCaseRequest
```

#### `newAddCommunicationToCaseRequest`

``` purescript
newAddCommunicationToCaseRequest :: CommunicationBody -> AddCommunicationToCaseRequest
```

Constructs AddCommunicationToCaseRequest from required parameters

#### `newAddCommunicationToCaseRequest'`

``` purescript
newAddCommunicationToCaseRequest' :: CommunicationBody -> ({ caseId :: NullOrUndefined (CaseId), communicationBody :: CommunicationBody, ccEmailAddresses :: NullOrUndefined (CcEmailAddressList), attachmentSetId :: NullOrUndefined (AttachmentSetId) } -> { caseId :: NullOrUndefined (CaseId), communicationBody :: CommunicationBody, ccEmailAddresses :: NullOrUndefined (CcEmailAddressList), attachmentSetId :: NullOrUndefined (AttachmentSetId) }) -> AddCommunicationToCaseRequest
```

Constructs AddCommunicationToCaseRequest's fields from required parameters

#### `AddCommunicationToCaseResponse`

``` purescript
newtype AddCommunicationToCaseResponse
  = AddCommunicationToCaseResponse { result :: NullOrUndefined (Result) }
```

<p>The result of the <a>AddCommunicationToCase</a> operation.</p>

##### Instances
``` purescript
Newtype AddCommunicationToCaseResponse _
Generic AddCommunicationToCaseResponse _
Show AddCommunicationToCaseResponse
Decode AddCommunicationToCaseResponse
Encode AddCommunicationToCaseResponse
```

#### `newAddCommunicationToCaseResponse`

``` purescript
newAddCommunicationToCaseResponse :: AddCommunicationToCaseResponse
```

Constructs AddCommunicationToCaseResponse from required parameters

#### `newAddCommunicationToCaseResponse'`

``` purescript
newAddCommunicationToCaseResponse' :: ({ result :: NullOrUndefined (Result) } -> { result :: NullOrUndefined (Result) }) -> AddCommunicationToCaseResponse
```

Constructs AddCommunicationToCaseResponse's fields from required parameters

#### `AfterTime`

``` purescript
newtype AfterTime
  = AfterTime String
```

##### Instances
``` purescript
Newtype AfterTime _
Generic AfterTime _
Show AfterTime
Decode AfterTime
Encode AfterTime
```

#### `Attachment`

``` purescript
newtype Attachment
  = Attachment { fileName :: NullOrUndefined (FileName), "data" :: NullOrUndefined (Data) }
```

<p>An attachment to a case communication. The attachment consists of the file name and the content of the file.</p>

##### Instances
``` purescript
Newtype Attachment _
Generic Attachment _
Show Attachment
Decode Attachment
Encode Attachment
```

#### `newAttachment`

``` purescript
newAttachment :: Attachment
```

Constructs Attachment from required parameters

#### `newAttachment'`

``` purescript
newAttachment' :: ({ fileName :: NullOrUndefined (FileName), "data" :: NullOrUndefined (Data) } -> { fileName :: NullOrUndefined (FileName), "data" :: NullOrUndefined (Data) }) -> Attachment
```

Constructs Attachment's fields from required parameters

#### `AttachmentDetails`

``` purescript
newtype AttachmentDetails
  = AttachmentDetails { attachmentId :: NullOrUndefined (AttachmentId), fileName :: NullOrUndefined (FileName) }
```

<p>The file name and ID of an attachment to a case communication. You can use the ID to retrieve the attachment with the <a>DescribeAttachment</a> operation.</p>

##### Instances
``` purescript
Newtype AttachmentDetails _
Generic AttachmentDetails _
Show AttachmentDetails
Decode AttachmentDetails
Encode AttachmentDetails
```

#### `newAttachmentDetails`

``` purescript
newAttachmentDetails :: AttachmentDetails
```

Constructs AttachmentDetails from required parameters

#### `newAttachmentDetails'`

``` purescript
newAttachmentDetails' :: ({ attachmentId :: NullOrUndefined (AttachmentId), fileName :: NullOrUndefined (FileName) } -> { attachmentId :: NullOrUndefined (AttachmentId), fileName :: NullOrUndefined (FileName) }) -> AttachmentDetails
```

Constructs AttachmentDetails's fields from required parameters

#### `AttachmentId`

``` purescript
newtype AttachmentId
  = AttachmentId String
```

##### Instances
``` purescript
Newtype AttachmentId _
Generic AttachmentId _
Show AttachmentId
Decode AttachmentId
Encode AttachmentId
```

#### `AttachmentIdNotFound`

``` purescript
newtype AttachmentIdNotFound
  = AttachmentIdNotFound { message :: NullOrUndefined (ErrorMessage) }
```

<p>An attachment with the specified ID could not be found.</p>

##### Instances
``` purescript
Newtype AttachmentIdNotFound _
Generic AttachmentIdNotFound _
Show AttachmentIdNotFound
Decode AttachmentIdNotFound
Encode AttachmentIdNotFound
```

#### `newAttachmentIdNotFound`

``` purescript
newAttachmentIdNotFound :: AttachmentIdNotFound
```

Constructs AttachmentIdNotFound from required parameters

#### `newAttachmentIdNotFound'`

``` purescript
newAttachmentIdNotFound' :: ({ message :: NullOrUndefined (ErrorMessage) } -> { message :: NullOrUndefined (ErrorMessage) }) -> AttachmentIdNotFound
```

Constructs AttachmentIdNotFound's fields from required parameters

#### `AttachmentLimitExceeded`

``` purescript
newtype AttachmentLimitExceeded
  = AttachmentLimitExceeded { message :: NullOrUndefined (ErrorMessage) }
```

<p>The limit for the number of attachment sets created in a short period of time has been exceeded.</p>

##### Instances
``` purescript
Newtype AttachmentLimitExceeded _
Generic AttachmentLimitExceeded _
Show AttachmentLimitExceeded
Decode AttachmentLimitExceeded
Encode AttachmentLimitExceeded
```

#### `newAttachmentLimitExceeded`

``` purescript
newAttachmentLimitExceeded :: AttachmentLimitExceeded
```

Constructs AttachmentLimitExceeded from required parameters

#### `newAttachmentLimitExceeded'`

``` purescript
newAttachmentLimitExceeded' :: ({ message :: NullOrUndefined (ErrorMessage) } -> { message :: NullOrUndefined (ErrorMessage) }) -> AttachmentLimitExceeded
```

Constructs AttachmentLimitExceeded's fields from required parameters

#### `AttachmentSet`

``` purescript
newtype AttachmentSet
  = AttachmentSet (Array AttachmentDetails)
```

##### Instances
``` purescript
Newtype AttachmentSet _
Generic AttachmentSet _
Show AttachmentSet
Decode AttachmentSet
Encode AttachmentSet
```

#### `AttachmentSetExpired`

``` purescript
newtype AttachmentSetExpired
  = AttachmentSetExpired { message :: NullOrUndefined (ErrorMessage) }
```

<p>The expiration time of the attachment set has passed. The set expires 1 hour after it is created.</p>

##### Instances
``` purescript
Newtype AttachmentSetExpired _
Generic AttachmentSetExpired _
Show AttachmentSetExpired
Decode AttachmentSetExpired
Encode AttachmentSetExpired
```

#### `newAttachmentSetExpired`

``` purescript
newAttachmentSetExpired :: AttachmentSetExpired
```

Constructs AttachmentSetExpired from required parameters

#### `newAttachmentSetExpired'`

``` purescript
newAttachmentSetExpired' :: ({ message :: NullOrUndefined (ErrorMessage) } -> { message :: NullOrUndefined (ErrorMessage) }) -> AttachmentSetExpired
```

Constructs AttachmentSetExpired's fields from required parameters

#### `AttachmentSetId`

``` purescript
newtype AttachmentSetId
  = AttachmentSetId String
```

##### Instances
``` purescript
Newtype AttachmentSetId _
Generic AttachmentSetId _
Show AttachmentSetId
Decode AttachmentSetId
Encode AttachmentSetId
```

#### `AttachmentSetIdNotFound`

``` purescript
newtype AttachmentSetIdNotFound
  = AttachmentSetIdNotFound { message :: NullOrUndefined (ErrorMessage) }
```

<p>An attachment set with the specified ID could not be found.</p>

##### Instances
``` purescript
Newtype AttachmentSetIdNotFound _
Generic AttachmentSetIdNotFound _
Show AttachmentSetIdNotFound
Decode AttachmentSetIdNotFound
Encode AttachmentSetIdNotFound
```

#### `newAttachmentSetIdNotFound`

``` purescript
newAttachmentSetIdNotFound :: AttachmentSetIdNotFound
```

Constructs AttachmentSetIdNotFound from required parameters

#### `newAttachmentSetIdNotFound'`

``` purescript
newAttachmentSetIdNotFound' :: ({ message :: NullOrUndefined (ErrorMessage) } -> { message :: NullOrUndefined (ErrorMessage) }) -> AttachmentSetIdNotFound
```

Constructs AttachmentSetIdNotFound's fields from required parameters

#### `AttachmentSetSizeLimitExceeded`

``` purescript
newtype AttachmentSetSizeLimitExceeded
  = AttachmentSetSizeLimitExceeded { message :: NullOrUndefined (ErrorMessage) }
```

<p>A limit for the size of an attachment set has been exceeded. The limits are 3 attachments and 5 MB per attachment.</p>

##### Instances
``` purescript
Newtype AttachmentSetSizeLimitExceeded _
Generic AttachmentSetSizeLimitExceeded _
Show AttachmentSetSizeLimitExceeded
Decode AttachmentSetSizeLimitExceeded
Encode AttachmentSetSizeLimitExceeded
```

#### `newAttachmentSetSizeLimitExceeded`

``` purescript
newAttachmentSetSizeLimitExceeded :: AttachmentSetSizeLimitExceeded
```

Constructs AttachmentSetSizeLimitExceeded from required parameters

#### `newAttachmentSetSizeLimitExceeded'`

``` purescript
newAttachmentSetSizeLimitExceeded' :: ({ message :: NullOrUndefined (ErrorMessage) } -> { message :: NullOrUndefined (ErrorMessage) }) -> AttachmentSetSizeLimitExceeded
```

Constructs AttachmentSetSizeLimitExceeded's fields from required parameters

#### `Attachments`

``` purescript
newtype Attachments
  = Attachments (Array Attachment)
```

##### Instances
``` purescript
Newtype Attachments _
Generic Attachments _
Show Attachments
Decode Attachments
Encode Attachments
```

#### `BeforeTime`

``` purescript
newtype BeforeTime
  = BeforeTime String
```

##### Instances
``` purescript
Newtype BeforeTime _
Generic BeforeTime _
Show BeforeTime
Decode BeforeTime
Encode BeforeTime
```

#### `CaseCreationLimitExceeded`

``` purescript
newtype CaseCreationLimitExceeded
  = CaseCreationLimitExceeded { message :: NullOrUndefined (ErrorMessage) }
```

<p>The case creation limit for the account has been exceeded.</p>

##### Instances
``` purescript
Newtype CaseCreationLimitExceeded _
Generic CaseCreationLimitExceeded _
Show CaseCreationLimitExceeded
Decode CaseCreationLimitExceeded
Encode CaseCreationLimitExceeded
```

#### `newCaseCreationLimitExceeded`

``` purescript
newCaseCreationLimitExceeded :: CaseCreationLimitExceeded
```

Constructs CaseCreationLimitExceeded from required parameters

#### `newCaseCreationLimitExceeded'`

``` purescript
newCaseCreationLimitExceeded' :: ({ message :: NullOrUndefined (ErrorMessage) } -> { message :: NullOrUndefined (ErrorMessage) }) -> CaseCreationLimitExceeded
```

Constructs CaseCreationLimitExceeded's fields from required parameters

#### `CaseDetails`

``` purescript
newtype CaseDetails
  = CaseDetails { caseId :: NullOrUndefined (CaseId), displayId :: NullOrUndefined (DisplayId), subject :: NullOrUndefined (Subject), status :: NullOrUndefined (Status), serviceCode :: NullOrUndefined (ServiceCode), categoryCode :: NullOrUndefined (CategoryCode), severityCode :: NullOrUndefined (SeverityCode), submittedBy :: NullOrUndefined (SubmittedBy), timeCreated :: NullOrUndefined (TimeCreated), recentCommunications :: NullOrUndefined (RecentCaseCommunications), ccEmailAddresses :: NullOrUndefined (CcEmailAddressList), language :: NullOrUndefined (Language) }
```

<p>A JSON-formatted object that contains the metadata for a support case. It is contained the response from a <a>DescribeCases</a> request. <b>CaseDetails</b> contains the following fields:</p> <ul> <li> <p> <b>caseId.</b> The AWS Support case ID requested or returned in the call. The case ID is an alphanumeric string formatted as shown in this example: case-<i>12345678910-2013-c4c1d2bf33c5cf47</i>.</p> </li> <li> <p> <b>categoryCode.</b> The category of problem for the AWS Support case. Corresponds to the CategoryCode values returned by a call to <a>DescribeServices</a>.</p> </li> <li> <p> <b>displayId.</b> The identifier for the case on pages in the AWS Support Center.</p> </li> <li> <p> <b>language.</b> The ISO 639-1 code for the language in which AWS provides support. AWS Support currently supports English ("en") and Japanese ("ja"). Language parameters must be passed explicitly for operations that take them.</p> </li> <li> <p> <b>recentCommunications.</b> One or more <a>Communication</a> objects. Fields of these objects are <code>attachments</code>, <code>body</code>, <code>caseId</code>, <code>submittedBy</code>, and <code>timeCreated</code>.</p> </li> <li> <p> <b>nextToken.</b> A resumption point for pagination.</p> </li> <li> <p> <b>serviceCode.</b> The identifier for the AWS service that corresponds to the service code defined in the call to <a>DescribeServices</a>.</p> </li> <li> <p> <b>severityCode. </b>The severity code assigned to the case. Contains one of the values returned by the call to <a>DescribeSeverityLevels</a>.</p> </li> <li> <p> <b>status.</b> The status of the case in the AWS Support Center.</p> </li> <li> <p> <b>subject.</b> The subject line of the case.</p> </li> <li> <p> <b>submittedBy.</b> The email address of the account that submitted the case.</p> </li> <li> <p> <b>timeCreated.</b> The time the case was created, in ISO-8601 format.</p> </li> </ul>

##### Instances
``` purescript
Newtype CaseDetails _
Generic CaseDetails _
Show CaseDetails
Decode CaseDetails
Encode CaseDetails
```

#### `newCaseDetails`

``` purescript
newCaseDetails :: CaseDetails
```

Constructs CaseDetails from required parameters

#### `newCaseDetails'`

``` purescript
newCaseDetails' :: ({ caseId :: NullOrUndefined (CaseId), displayId :: NullOrUndefined (DisplayId), subject :: NullOrUndefined (Subject), status :: NullOrUndefined (Status), serviceCode :: NullOrUndefined (ServiceCode), categoryCode :: NullOrUndefined (CategoryCode), severityCode :: NullOrUndefined (SeverityCode), submittedBy :: NullOrUndefined (SubmittedBy), timeCreated :: NullOrUndefined (TimeCreated), recentCommunications :: NullOrUndefined (RecentCaseCommunications), ccEmailAddresses :: NullOrUndefined (CcEmailAddressList), language :: NullOrUndefined (Language) } -> { caseId :: NullOrUndefined (CaseId), displayId :: NullOrUndefined (DisplayId), subject :: NullOrUndefined (Subject), status :: NullOrUndefined (Status), serviceCode :: NullOrUndefined (ServiceCode), categoryCode :: NullOrUndefined (CategoryCode), severityCode :: NullOrUndefined (SeverityCode), submittedBy :: NullOrUndefined (SubmittedBy), timeCreated :: NullOrUndefined (TimeCreated), recentCommunications :: NullOrUndefined (RecentCaseCommunications), ccEmailAddresses :: NullOrUndefined (CcEmailAddressList), language :: NullOrUndefined (Language) }) -> CaseDetails
```

Constructs CaseDetails's fields from required parameters

#### `CaseId`

``` purescript
newtype CaseId
  = CaseId String
```

##### Instances
``` purescript
Newtype CaseId _
Generic CaseId _
Show CaseId
Decode CaseId
Encode CaseId
```

#### `CaseIdList`

``` purescript
newtype CaseIdList
  = CaseIdList (Array CaseId)
```

##### Instances
``` purescript
Newtype CaseIdList _
Generic CaseIdList _
Show CaseIdList
Decode CaseIdList
Encode CaseIdList
```

#### `CaseIdNotFound`

``` purescript
newtype CaseIdNotFound
  = CaseIdNotFound { message :: NullOrUndefined (ErrorMessage) }
```

<p>The requested <code>caseId</code> could not be located.</p>

##### Instances
``` purescript
Newtype CaseIdNotFound _
Generic CaseIdNotFound _
Show CaseIdNotFound
Decode CaseIdNotFound
Encode CaseIdNotFound
```

#### `newCaseIdNotFound`

``` purescript
newCaseIdNotFound :: CaseIdNotFound
```

Constructs CaseIdNotFound from required parameters

#### `newCaseIdNotFound'`

``` purescript
newCaseIdNotFound' :: ({ message :: NullOrUndefined (ErrorMessage) } -> { message :: NullOrUndefined (ErrorMessage) }) -> CaseIdNotFound
```

Constructs CaseIdNotFound's fields from required parameters

#### `CaseList`

``` purescript
newtype CaseList
  = CaseList (Array CaseDetails)
```

##### Instances
``` purescript
Newtype CaseList _
Generic CaseList _
Show CaseList
Decode CaseList
Encode CaseList
```

#### `CaseStatus`

``` purescript
newtype CaseStatus
  = CaseStatus String
```

##### Instances
``` purescript
Newtype CaseStatus _
Generic CaseStatus _
Show CaseStatus
Decode CaseStatus
Encode CaseStatus
```

#### `Category`

``` purescript
newtype Category
  = Category { code :: NullOrUndefined (CategoryCode), name :: NullOrUndefined (CategoryName) }
```

<p>A JSON-formatted name/value pair that represents the category name and category code of the problem, selected from the <a>DescribeServices</a> response for each AWS service.</p>

##### Instances
``` purescript
Newtype Category _
Generic Category _
Show Category
Decode Category
Encode Category
```

#### `newCategory`

``` purescript
newCategory :: Category
```

Constructs Category from required parameters

#### `newCategory'`

``` purescript
newCategory' :: ({ code :: NullOrUndefined (CategoryCode), name :: NullOrUndefined (CategoryName) } -> { code :: NullOrUndefined (CategoryCode), name :: NullOrUndefined (CategoryName) }) -> Category
```

Constructs Category's fields from required parameters

#### `CategoryCode`

``` purescript
newtype CategoryCode
  = CategoryCode String
```

##### Instances
``` purescript
Newtype CategoryCode _
Generic CategoryCode _
Show CategoryCode
Decode CategoryCode
Encode CategoryCode
```

#### `CategoryList`

``` purescript
newtype CategoryList
  = CategoryList (Array Category)
```

##### Instances
``` purescript
Newtype CategoryList _
Generic CategoryList _
Show CategoryList
Decode CategoryList
Encode CategoryList
```

#### `CategoryName`

``` purescript
newtype CategoryName
  = CategoryName String
```

##### Instances
``` purescript
Newtype CategoryName _
Generic CategoryName _
Show CategoryName
Decode CategoryName
Encode CategoryName
```

#### `CcEmailAddress`

``` purescript
newtype CcEmailAddress
  = CcEmailAddress String
```

##### Instances
``` purescript
Newtype CcEmailAddress _
Generic CcEmailAddress _
Show CcEmailAddress
Decode CcEmailAddress
Encode CcEmailAddress
```

#### `CcEmailAddressList`

``` purescript
newtype CcEmailAddressList
  = CcEmailAddressList (Array CcEmailAddress)
```

##### Instances
``` purescript
Newtype CcEmailAddressList _
Generic CcEmailAddressList _
Show CcEmailAddressList
Decode CcEmailAddressList
Encode CcEmailAddressList
```

#### `Communication`

``` purescript
newtype Communication
  = Communication { caseId :: NullOrUndefined (CaseId), body :: NullOrUndefined (CommunicationBody), submittedBy :: NullOrUndefined (SubmittedBy), timeCreated :: NullOrUndefined (TimeCreated), attachmentSet :: NullOrUndefined (AttachmentSet) }
```

<p>A communication associated with an AWS Support case. The communication consists of the case ID, the message body, attachment information, the account email address, and the date and time of the communication.</p>

##### Instances
``` purescript
Newtype Communication _
Generic Communication _
Show Communication
Decode Communication
Encode Communication
```

#### `newCommunication`

``` purescript
newCommunication :: Communication
```

Constructs Communication from required parameters

#### `newCommunication'`

``` purescript
newCommunication' :: ({ caseId :: NullOrUndefined (CaseId), body :: NullOrUndefined (CommunicationBody), submittedBy :: NullOrUndefined (SubmittedBy), timeCreated :: NullOrUndefined (TimeCreated), attachmentSet :: NullOrUndefined (AttachmentSet) } -> { caseId :: NullOrUndefined (CaseId), body :: NullOrUndefined (CommunicationBody), submittedBy :: NullOrUndefined (SubmittedBy), timeCreated :: NullOrUndefined (TimeCreated), attachmentSet :: NullOrUndefined (AttachmentSet) }) -> Communication
```

Constructs Communication's fields from required parameters

#### `CommunicationBody`

``` purescript
newtype CommunicationBody
  = CommunicationBody String
```

##### Instances
``` purescript
Newtype CommunicationBody _
Generic CommunicationBody _
Show CommunicationBody
Decode CommunicationBody
Encode CommunicationBody
```

#### `CommunicationList`

``` purescript
newtype CommunicationList
  = CommunicationList (Array Communication)
```

##### Instances
``` purescript
Newtype CommunicationList _
Generic CommunicationList _
Show CommunicationList
Decode CommunicationList
Encode CommunicationList
```

#### `CreateCaseRequest`

``` purescript
newtype CreateCaseRequest
  = CreateCaseRequest { subject :: Subject, serviceCode :: NullOrUndefined (ServiceCode), severityCode :: NullOrUndefined (SeverityCode), categoryCode :: NullOrUndefined (CategoryCode), communicationBody :: CommunicationBody, ccEmailAddresses :: NullOrUndefined (CcEmailAddressList), language :: NullOrUndefined (Language), issueType :: NullOrUndefined (IssueType), attachmentSetId :: NullOrUndefined (AttachmentSetId) }
```

<p/>

##### Instances
``` purescript
Newtype CreateCaseRequest _
Generic CreateCaseRequest _
Show CreateCaseRequest
Decode CreateCaseRequest
Encode CreateCaseRequest
```

#### `newCreateCaseRequest`

``` purescript
newCreateCaseRequest :: CommunicationBody -> Subject -> CreateCaseRequest
```

Constructs CreateCaseRequest from required parameters

#### `newCreateCaseRequest'`

``` purescript
newCreateCaseRequest' :: CommunicationBody -> Subject -> ({ subject :: Subject, serviceCode :: NullOrUndefined (ServiceCode), severityCode :: NullOrUndefined (SeverityCode), categoryCode :: NullOrUndefined (CategoryCode), communicationBody :: CommunicationBody, ccEmailAddresses :: NullOrUndefined (CcEmailAddressList), language :: NullOrUndefined (Language), issueType :: NullOrUndefined (IssueType), attachmentSetId :: NullOrUndefined (AttachmentSetId) } -> { subject :: Subject, serviceCode :: NullOrUndefined (ServiceCode), severityCode :: NullOrUndefined (SeverityCode), categoryCode :: NullOrUndefined (CategoryCode), communicationBody :: CommunicationBody, ccEmailAddresses :: NullOrUndefined (CcEmailAddressList), language :: NullOrUndefined (Language), issueType :: NullOrUndefined (IssueType), attachmentSetId :: NullOrUndefined (AttachmentSetId) }) -> CreateCaseRequest
```

Constructs CreateCaseRequest's fields from required parameters

#### `CreateCaseResponse`

``` purescript
newtype CreateCaseResponse
  = CreateCaseResponse { caseId :: NullOrUndefined (CaseId) }
```

<p>The AWS Support case ID returned by a successful completion of the <a>CreateCase</a> operation. </p>

##### Instances
``` purescript
Newtype CreateCaseResponse _
Generic CreateCaseResponse _
Show CreateCaseResponse
Decode CreateCaseResponse
Encode CreateCaseResponse
```

#### `newCreateCaseResponse`

``` purescript
newCreateCaseResponse :: CreateCaseResponse
```

Constructs CreateCaseResponse from required parameters

#### `newCreateCaseResponse'`

``` purescript
newCreateCaseResponse' :: ({ caseId :: NullOrUndefined (CaseId) } -> { caseId :: NullOrUndefined (CaseId) }) -> CreateCaseResponse
```

Constructs CreateCaseResponse's fields from required parameters

#### `Data`

``` purescript
newtype Data
  = Data String
```

##### Instances
``` purescript
Newtype Data _
Generic Data _
Show Data
Decode Data
Encode Data
```

#### `DescribeAttachmentLimitExceeded`

``` purescript
newtype DescribeAttachmentLimitExceeded
  = DescribeAttachmentLimitExceeded { message :: NullOrUndefined (ErrorMessage) }
```

<p>The limit for the number of <a>DescribeAttachment</a> requests in a short period of time has been exceeded.</p>

##### Instances
``` purescript
Newtype DescribeAttachmentLimitExceeded _
Generic DescribeAttachmentLimitExceeded _
Show DescribeAttachmentLimitExceeded
Decode DescribeAttachmentLimitExceeded
Encode DescribeAttachmentLimitExceeded
```

#### `newDescribeAttachmentLimitExceeded`

``` purescript
newDescribeAttachmentLimitExceeded :: DescribeAttachmentLimitExceeded
```

Constructs DescribeAttachmentLimitExceeded from required parameters

#### `newDescribeAttachmentLimitExceeded'`

``` purescript
newDescribeAttachmentLimitExceeded' :: ({ message :: NullOrUndefined (ErrorMessage) } -> { message :: NullOrUndefined (ErrorMessage) }) -> DescribeAttachmentLimitExceeded
```

Constructs DescribeAttachmentLimitExceeded's fields from required parameters

#### `DescribeAttachmentRequest`

``` purescript
newtype DescribeAttachmentRequest
  = DescribeAttachmentRequest { attachmentId :: AttachmentId }
```

##### Instances
``` purescript
Newtype DescribeAttachmentRequest _
Generic DescribeAttachmentRequest _
Show DescribeAttachmentRequest
Decode DescribeAttachmentRequest
Encode DescribeAttachmentRequest
```

#### `newDescribeAttachmentRequest`

``` purescript
newDescribeAttachmentRequest :: AttachmentId -> DescribeAttachmentRequest
```

Constructs DescribeAttachmentRequest from required parameters

#### `newDescribeAttachmentRequest'`

``` purescript
newDescribeAttachmentRequest' :: AttachmentId -> ({ attachmentId :: AttachmentId } -> { attachmentId :: AttachmentId }) -> DescribeAttachmentRequest
```

Constructs DescribeAttachmentRequest's fields from required parameters

#### `DescribeAttachmentResponse`

``` purescript
newtype DescribeAttachmentResponse
  = DescribeAttachmentResponse { attachment :: NullOrUndefined (Attachment) }
```

<p>The content and file name of the attachment returned by the <a>DescribeAttachment</a> operation.</p>

##### Instances
``` purescript
Newtype DescribeAttachmentResponse _
Generic DescribeAttachmentResponse _
Show DescribeAttachmentResponse
Decode DescribeAttachmentResponse
Encode DescribeAttachmentResponse
```

#### `newDescribeAttachmentResponse`

``` purescript
newDescribeAttachmentResponse :: DescribeAttachmentResponse
```

Constructs DescribeAttachmentResponse from required parameters

#### `newDescribeAttachmentResponse'`

``` purescript
newDescribeAttachmentResponse' :: ({ attachment :: NullOrUndefined (Attachment) } -> { attachment :: NullOrUndefined (Attachment) }) -> DescribeAttachmentResponse
```

Constructs DescribeAttachmentResponse's fields from required parameters

#### `DescribeCasesRequest`

``` purescript
newtype DescribeCasesRequest
  = DescribeCasesRequest { caseIdList :: NullOrUndefined (CaseIdList), displayId :: NullOrUndefined (DisplayId), afterTime :: NullOrUndefined (AfterTime), beforeTime :: NullOrUndefined (BeforeTime), includeResolvedCases :: NullOrUndefined (IncludeResolvedCases), nextToken :: NullOrUndefined (NextToken), maxResults :: NullOrUndefined (MaxResults), language :: NullOrUndefined (Language), includeCommunications :: NullOrUndefined (IncludeCommunications) }
```

<p/>

##### Instances
``` purescript
Newtype DescribeCasesRequest _
Generic DescribeCasesRequest _
Show DescribeCasesRequest
Decode DescribeCasesRequest
Encode DescribeCasesRequest
```

#### `newDescribeCasesRequest`

``` purescript
newDescribeCasesRequest :: DescribeCasesRequest
```

Constructs DescribeCasesRequest from required parameters

#### `newDescribeCasesRequest'`

``` purescript
newDescribeCasesRequest' :: ({ caseIdList :: NullOrUndefined (CaseIdList), displayId :: NullOrUndefined (DisplayId), afterTime :: NullOrUndefined (AfterTime), beforeTime :: NullOrUndefined (BeforeTime), includeResolvedCases :: NullOrUndefined (IncludeResolvedCases), nextToken :: NullOrUndefined (NextToken), maxResults :: NullOrUndefined (MaxResults), language :: NullOrUndefined (Language), includeCommunications :: NullOrUndefined (IncludeCommunications) } -> { caseIdList :: NullOrUndefined (CaseIdList), displayId :: NullOrUndefined (DisplayId), afterTime :: NullOrUndefined (AfterTime), beforeTime :: NullOrUndefined (BeforeTime), includeResolvedCases :: NullOrUndefined (IncludeResolvedCases), nextToken :: NullOrUndefined (NextToken), maxResults :: NullOrUndefined (MaxResults), language :: NullOrUndefined (Language), includeCommunications :: NullOrUndefined (IncludeCommunications) }) -> DescribeCasesRequest
```

Constructs DescribeCasesRequest's fields from required parameters

#### `DescribeCasesResponse`

``` purescript
newtype DescribeCasesResponse
  = DescribeCasesResponse { cases :: NullOrUndefined (CaseList), nextToken :: NullOrUndefined (NextToken) }
```

<p>Returns an array of <a>CaseDetails</a> objects and a <code>nextToken</code> that defines a point for pagination in the result set.</p>

##### Instances
``` purescript
Newtype DescribeCasesResponse _
Generic DescribeCasesResponse _
Show DescribeCasesResponse
Decode DescribeCasesResponse
Encode DescribeCasesResponse
```

#### `newDescribeCasesResponse`

``` purescript
newDescribeCasesResponse :: DescribeCasesResponse
```

Constructs DescribeCasesResponse from required parameters

#### `newDescribeCasesResponse'`

``` purescript
newDescribeCasesResponse' :: ({ cases :: NullOrUndefined (CaseList), nextToken :: NullOrUndefined (NextToken) } -> { cases :: NullOrUndefined (CaseList), nextToken :: NullOrUndefined (NextToken) }) -> DescribeCasesResponse
```

Constructs DescribeCasesResponse's fields from required parameters

#### `DescribeCommunicationsRequest`

``` purescript
newtype DescribeCommunicationsRequest
  = DescribeCommunicationsRequest { caseId :: CaseId, beforeTime :: NullOrUndefined (BeforeTime), afterTime :: NullOrUndefined (AfterTime), nextToken :: NullOrUndefined (NextToken), maxResults :: NullOrUndefined (MaxResults) }
```

<p/>

##### Instances
``` purescript
Newtype DescribeCommunicationsRequest _
Generic DescribeCommunicationsRequest _
Show DescribeCommunicationsRequest
Decode DescribeCommunicationsRequest
Encode DescribeCommunicationsRequest
```

#### `newDescribeCommunicationsRequest`

``` purescript
newDescribeCommunicationsRequest :: CaseId -> DescribeCommunicationsRequest
```

Constructs DescribeCommunicationsRequest from required parameters

#### `newDescribeCommunicationsRequest'`

``` purescript
newDescribeCommunicationsRequest' :: CaseId -> ({ caseId :: CaseId, beforeTime :: NullOrUndefined (BeforeTime), afterTime :: NullOrUndefined (AfterTime), nextToken :: NullOrUndefined (NextToken), maxResults :: NullOrUndefined (MaxResults) } -> { caseId :: CaseId, beforeTime :: NullOrUndefined (BeforeTime), afterTime :: NullOrUndefined (AfterTime), nextToken :: NullOrUndefined (NextToken), maxResults :: NullOrUndefined (MaxResults) }) -> DescribeCommunicationsRequest
```

Constructs DescribeCommunicationsRequest's fields from required parameters

#### `DescribeCommunicationsResponse`

``` purescript
newtype DescribeCommunicationsResponse
  = DescribeCommunicationsResponse { communications :: NullOrUndefined (CommunicationList), nextToken :: NullOrUndefined (NextToken) }
```

<p>The communications returned by the <a>DescribeCommunications</a> operation.</p>

##### Instances
``` purescript
Newtype DescribeCommunicationsResponse _
Generic DescribeCommunicationsResponse _
Show DescribeCommunicationsResponse
Decode DescribeCommunicationsResponse
Encode DescribeCommunicationsResponse
```

#### `newDescribeCommunicationsResponse`

``` purescript
newDescribeCommunicationsResponse :: DescribeCommunicationsResponse
```

Constructs DescribeCommunicationsResponse from required parameters

#### `newDescribeCommunicationsResponse'`

``` purescript
newDescribeCommunicationsResponse' :: ({ communications :: NullOrUndefined (CommunicationList), nextToken :: NullOrUndefined (NextToken) } -> { communications :: NullOrUndefined (CommunicationList), nextToken :: NullOrUndefined (NextToken) }) -> DescribeCommunicationsResponse
```

Constructs DescribeCommunicationsResponse's fields from required parameters

#### `DescribeServicesRequest`

``` purescript
newtype DescribeServicesRequest
  = DescribeServicesRequest { serviceCodeList :: NullOrUndefined (ServiceCodeList), language :: NullOrUndefined (Language) }
```

<p/>

##### Instances
``` purescript
Newtype DescribeServicesRequest _
Generic DescribeServicesRequest _
Show DescribeServicesRequest
Decode DescribeServicesRequest
Encode DescribeServicesRequest
```

#### `newDescribeServicesRequest`

``` purescript
newDescribeServicesRequest :: DescribeServicesRequest
```

Constructs DescribeServicesRequest from required parameters

#### `newDescribeServicesRequest'`

``` purescript
newDescribeServicesRequest' :: ({ serviceCodeList :: NullOrUndefined (ServiceCodeList), language :: NullOrUndefined (Language) } -> { serviceCodeList :: NullOrUndefined (ServiceCodeList), language :: NullOrUndefined (Language) }) -> DescribeServicesRequest
```

Constructs DescribeServicesRequest's fields from required parameters

#### `DescribeServicesResponse`

``` purescript
newtype DescribeServicesResponse
  = DescribeServicesResponse { services :: NullOrUndefined (ServiceList) }
```

<p>The list of AWS services returned by the <a>DescribeServices</a> operation.</p>

##### Instances
``` purescript
Newtype DescribeServicesResponse _
Generic DescribeServicesResponse _
Show DescribeServicesResponse
Decode DescribeServicesResponse
Encode DescribeServicesResponse
```

#### `newDescribeServicesResponse`

``` purescript
newDescribeServicesResponse :: DescribeServicesResponse
```

Constructs DescribeServicesResponse from required parameters

#### `newDescribeServicesResponse'`

``` purescript
newDescribeServicesResponse' :: ({ services :: NullOrUndefined (ServiceList) } -> { services :: NullOrUndefined (ServiceList) }) -> DescribeServicesResponse
```

Constructs DescribeServicesResponse's fields from required parameters

#### `DescribeSeverityLevelsRequest`

``` purescript
newtype DescribeSeverityLevelsRequest
  = DescribeSeverityLevelsRequest { language :: NullOrUndefined (Language) }
```

<p/>

##### Instances
``` purescript
Newtype DescribeSeverityLevelsRequest _
Generic DescribeSeverityLevelsRequest _
Show DescribeSeverityLevelsRequest
Decode DescribeSeverityLevelsRequest
Encode DescribeSeverityLevelsRequest
```

#### `newDescribeSeverityLevelsRequest`

``` purescript
newDescribeSeverityLevelsRequest :: DescribeSeverityLevelsRequest
```

Constructs DescribeSeverityLevelsRequest from required parameters

#### `newDescribeSeverityLevelsRequest'`

``` purescript
newDescribeSeverityLevelsRequest' :: ({ language :: NullOrUndefined (Language) } -> { language :: NullOrUndefined (Language) }) -> DescribeSeverityLevelsRequest
```

Constructs DescribeSeverityLevelsRequest's fields from required parameters

#### `DescribeSeverityLevelsResponse`

``` purescript
newtype DescribeSeverityLevelsResponse
  = DescribeSeverityLevelsResponse { severityLevels :: NullOrUndefined (SeverityLevelsList) }
```

<p>The list of severity levels returned by the <a>DescribeSeverityLevels</a> operation.</p>

##### Instances
``` purescript
Newtype DescribeSeverityLevelsResponse _
Generic DescribeSeverityLevelsResponse _
Show DescribeSeverityLevelsResponse
Decode DescribeSeverityLevelsResponse
Encode DescribeSeverityLevelsResponse
```

#### `newDescribeSeverityLevelsResponse`

``` purescript
newDescribeSeverityLevelsResponse :: DescribeSeverityLevelsResponse
```

Constructs DescribeSeverityLevelsResponse from required parameters

#### `newDescribeSeverityLevelsResponse'`

``` purescript
newDescribeSeverityLevelsResponse' :: ({ severityLevels :: NullOrUndefined (SeverityLevelsList) } -> { severityLevels :: NullOrUndefined (SeverityLevelsList) }) -> DescribeSeverityLevelsResponse
```

Constructs DescribeSeverityLevelsResponse's fields from required parameters

#### `DescribeTrustedAdvisorCheckRefreshStatusesRequest`

``` purescript
newtype DescribeTrustedAdvisorCheckRefreshStatusesRequest
  = DescribeTrustedAdvisorCheckRefreshStatusesRequest { checkIds :: StringList }
```

<p/>

##### Instances
``` purescript
Newtype DescribeTrustedAdvisorCheckRefreshStatusesRequest _
Generic DescribeTrustedAdvisorCheckRefreshStatusesRequest _
Show DescribeTrustedAdvisorCheckRefreshStatusesRequest
Decode DescribeTrustedAdvisorCheckRefreshStatusesRequest
Encode DescribeTrustedAdvisorCheckRefreshStatusesRequest
```

#### `newDescribeTrustedAdvisorCheckRefreshStatusesRequest`

``` purescript
newDescribeTrustedAdvisorCheckRefreshStatusesRequest :: StringList -> DescribeTrustedAdvisorCheckRefreshStatusesRequest
```

Constructs DescribeTrustedAdvisorCheckRefreshStatusesRequest from required parameters

#### `newDescribeTrustedAdvisorCheckRefreshStatusesRequest'`

``` purescript
newDescribeTrustedAdvisorCheckRefreshStatusesRequest' :: StringList -> ({ checkIds :: StringList } -> { checkIds :: StringList }) -> DescribeTrustedAdvisorCheckRefreshStatusesRequest
```

Constructs DescribeTrustedAdvisorCheckRefreshStatusesRequest's fields from required parameters

#### `DescribeTrustedAdvisorCheckRefreshStatusesResponse`

``` purescript
newtype DescribeTrustedAdvisorCheckRefreshStatusesResponse
  = DescribeTrustedAdvisorCheckRefreshStatusesResponse { statuses :: TrustedAdvisorCheckRefreshStatusList }
```

<p>The statuses of the Trusted Advisor checks returned by the <a>DescribeTrustedAdvisorCheckRefreshStatuses</a> operation.</p>

##### Instances
``` purescript
Newtype DescribeTrustedAdvisorCheckRefreshStatusesResponse _
Generic DescribeTrustedAdvisorCheckRefreshStatusesResponse _
Show DescribeTrustedAdvisorCheckRefreshStatusesResponse
Decode DescribeTrustedAdvisorCheckRefreshStatusesResponse
Encode DescribeTrustedAdvisorCheckRefreshStatusesResponse
```

#### `newDescribeTrustedAdvisorCheckRefreshStatusesResponse`

``` purescript
newDescribeTrustedAdvisorCheckRefreshStatusesResponse :: TrustedAdvisorCheckRefreshStatusList -> DescribeTrustedAdvisorCheckRefreshStatusesResponse
```

Constructs DescribeTrustedAdvisorCheckRefreshStatusesResponse from required parameters

#### `newDescribeTrustedAdvisorCheckRefreshStatusesResponse'`

``` purescript
newDescribeTrustedAdvisorCheckRefreshStatusesResponse' :: TrustedAdvisorCheckRefreshStatusList -> ({ statuses :: TrustedAdvisorCheckRefreshStatusList } -> { statuses :: TrustedAdvisorCheckRefreshStatusList }) -> DescribeTrustedAdvisorCheckRefreshStatusesResponse
```

Constructs DescribeTrustedAdvisorCheckRefreshStatusesResponse's fields from required parameters

#### `DescribeTrustedAdvisorCheckResultRequest`

``` purescript
newtype DescribeTrustedAdvisorCheckResultRequest
  = DescribeTrustedAdvisorCheckResultRequest { checkId :: String, language :: NullOrUndefined (String) }
```

<p/>

##### Instances
``` purescript
Newtype DescribeTrustedAdvisorCheckResultRequest _
Generic DescribeTrustedAdvisorCheckResultRequest _
Show DescribeTrustedAdvisorCheckResultRequest
Decode DescribeTrustedAdvisorCheckResultRequest
Encode DescribeTrustedAdvisorCheckResultRequest
```

#### `newDescribeTrustedAdvisorCheckResultRequest`

``` purescript
newDescribeTrustedAdvisorCheckResultRequest :: String -> DescribeTrustedAdvisorCheckResultRequest
```

Constructs DescribeTrustedAdvisorCheckResultRequest from required parameters

#### `newDescribeTrustedAdvisorCheckResultRequest'`

``` purescript
newDescribeTrustedAdvisorCheckResultRequest' :: String -> ({ checkId :: String, language :: NullOrUndefined (String) } -> { checkId :: String, language :: NullOrUndefined (String) }) -> DescribeTrustedAdvisorCheckResultRequest
```

Constructs DescribeTrustedAdvisorCheckResultRequest's fields from required parameters

#### `DescribeTrustedAdvisorCheckResultResponse`

``` purescript
newtype DescribeTrustedAdvisorCheckResultResponse
  = DescribeTrustedAdvisorCheckResultResponse { result :: NullOrUndefined (TrustedAdvisorCheckResult) }
```

<p>The result of the Trusted Advisor check returned by the <a>DescribeTrustedAdvisorCheckResult</a> operation.</p>

##### Instances
``` purescript
Newtype DescribeTrustedAdvisorCheckResultResponse _
Generic DescribeTrustedAdvisorCheckResultResponse _
Show DescribeTrustedAdvisorCheckResultResponse
Decode DescribeTrustedAdvisorCheckResultResponse
Encode DescribeTrustedAdvisorCheckResultResponse
```

#### `newDescribeTrustedAdvisorCheckResultResponse`

``` purescript
newDescribeTrustedAdvisorCheckResultResponse :: DescribeTrustedAdvisorCheckResultResponse
```

Constructs DescribeTrustedAdvisorCheckResultResponse from required parameters

#### `newDescribeTrustedAdvisorCheckResultResponse'`

``` purescript
newDescribeTrustedAdvisorCheckResultResponse' :: ({ result :: NullOrUndefined (TrustedAdvisorCheckResult) } -> { result :: NullOrUndefined (TrustedAdvisorCheckResult) }) -> DescribeTrustedAdvisorCheckResultResponse
```

Constructs DescribeTrustedAdvisorCheckResultResponse's fields from required parameters

#### `DescribeTrustedAdvisorCheckSummariesRequest`

``` purescript
newtype DescribeTrustedAdvisorCheckSummariesRequest
  = DescribeTrustedAdvisorCheckSummariesRequest { checkIds :: StringList }
```

<p/>

##### Instances
``` purescript
Newtype DescribeTrustedAdvisorCheckSummariesRequest _
Generic DescribeTrustedAdvisorCheckSummariesRequest _
Show DescribeTrustedAdvisorCheckSummariesRequest
Decode DescribeTrustedAdvisorCheckSummariesRequest
Encode DescribeTrustedAdvisorCheckSummariesRequest
```

#### `newDescribeTrustedAdvisorCheckSummariesRequest`

``` purescript
newDescribeTrustedAdvisorCheckSummariesRequest :: StringList -> DescribeTrustedAdvisorCheckSummariesRequest
```

Constructs DescribeTrustedAdvisorCheckSummariesRequest from required parameters

#### `newDescribeTrustedAdvisorCheckSummariesRequest'`

``` purescript
newDescribeTrustedAdvisorCheckSummariesRequest' :: StringList -> ({ checkIds :: StringList } -> { checkIds :: StringList }) -> DescribeTrustedAdvisorCheckSummariesRequest
```

Constructs DescribeTrustedAdvisorCheckSummariesRequest's fields from required parameters

#### `DescribeTrustedAdvisorCheckSummariesResponse`

``` purescript
newtype DescribeTrustedAdvisorCheckSummariesResponse
  = DescribeTrustedAdvisorCheckSummariesResponse { summaries :: TrustedAdvisorCheckSummaryList }
```

<p>The summaries of the Trusted Advisor checks returned by the <a>DescribeTrustedAdvisorCheckSummaries</a> operation.</p>

##### Instances
``` purescript
Newtype DescribeTrustedAdvisorCheckSummariesResponse _
Generic DescribeTrustedAdvisorCheckSummariesResponse _
Show DescribeTrustedAdvisorCheckSummariesResponse
Decode DescribeTrustedAdvisorCheckSummariesResponse
Encode DescribeTrustedAdvisorCheckSummariesResponse
```

#### `newDescribeTrustedAdvisorCheckSummariesResponse`

``` purescript
newDescribeTrustedAdvisorCheckSummariesResponse :: TrustedAdvisorCheckSummaryList -> DescribeTrustedAdvisorCheckSummariesResponse
```

Constructs DescribeTrustedAdvisorCheckSummariesResponse from required parameters

#### `newDescribeTrustedAdvisorCheckSummariesResponse'`

``` purescript
newDescribeTrustedAdvisorCheckSummariesResponse' :: TrustedAdvisorCheckSummaryList -> ({ summaries :: TrustedAdvisorCheckSummaryList } -> { summaries :: TrustedAdvisorCheckSummaryList }) -> DescribeTrustedAdvisorCheckSummariesResponse
```

Constructs DescribeTrustedAdvisorCheckSummariesResponse's fields from required parameters

#### `DescribeTrustedAdvisorChecksRequest`

``` purescript
newtype DescribeTrustedAdvisorChecksRequest
  = DescribeTrustedAdvisorChecksRequest { language :: String }
```

<p/>

##### Instances
``` purescript
Newtype DescribeTrustedAdvisorChecksRequest _
Generic DescribeTrustedAdvisorChecksRequest _
Show DescribeTrustedAdvisorChecksRequest
Decode DescribeTrustedAdvisorChecksRequest
Encode DescribeTrustedAdvisorChecksRequest
```

#### `newDescribeTrustedAdvisorChecksRequest`

``` purescript
newDescribeTrustedAdvisorChecksRequest :: String -> DescribeTrustedAdvisorChecksRequest
```

Constructs DescribeTrustedAdvisorChecksRequest from required parameters

#### `newDescribeTrustedAdvisorChecksRequest'`

``` purescript
newDescribeTrustedAdvisorChecksRequest' :: String -> ({ language :: String } -> { language :: String }) -> DescribeTrustedAdvisorChecksRequest
```

Constructs DescribeTrustedAdvisorChecksRequest's fields from required parameters

#### `DescribeTrustedAdvisorChecksResponse`

``` purescript
newtype DescribeTrustedAdvisorChecksResponse
  = DescribeTrustedAdvisorChecksResponse { checks :: TrustedAdvisorCheckList }
```

<p>Information about the Trusted Advisor checks returned by the <a>DescribeTrustedAdvisorChecks</a> operation.</p>

##### Instances
``` purescript
Newtype DescribeTrustedAdvisorChecksResponse _
Generic DescribeTrustedAdvisorChecksResponse _
Show DescribeTrustedAdvisorChecksResponse
Decode DescribeTrustedAdvisorChecksResponse
Encode DescribeTrustedAdvisorChecksResponse
```

#### `newDescribeTrustedAdvisorChecksResponse`

``` purescript
newDescribeTrustedAdvisorChecksResponse :: TrustedAdvisorCheckList -> DescribeTrustedAdvisorChecksResponse
```

Constructs DescribeTrustedAdvisorChecksResponse from required parameters

#### `newDescribeTrustedAdvisorChecksResponse'`

``` purescript
newDescribeTrustedAdvisorChecksResponse' :: TrustedAdvisorCheckList -> ({ checks :: TrustedAdvisorCheckList } -> { checks :: TrustedAdvisorCheckList }) -> DescribeTrustedAdvisorChecksResponse
```

Constructs DescribeTrustedAdvisorChecksResponse's fields from required parameters

#### `DisplayId`

``` purescript
newtype DisplayId
  = DisplayId String
```

##### Instances
``` purescript
Newtype DisplayId _
Generic DisplayId _
Show DisplayId
Decode DisplayId
Encode DisplayId
```

#### `ErrorMessage`

``` purescript
newtype ErrorMessage
  = ErrorMessage String
```

##### Instances
``` purescript
Newtype ErrorMessage _
Generic ErrorMessage _
Show ErrorMessage
Decode ErrorMessage
Encode ErrorMessage
```

#### `ExpiryTime`

``` purescript
newtype ExpiryTime
  = ExpiryTime String
```

##### Instances
``` purescript
Newtype ExpiryTime _
Generic ExpiryTime _
Show ExpiryTime
Decode ExpiryTime
Encode ExpiryTime
```

#### `FileName`

``` purescript
newtype FileName
  = FileName String
```

##### Instances
``` purescript
Newtype FileName _
Generic FileName _
Show FileName
Decode FileName
Encode FileName
```

#### `IncludeCommunications`

``` purescript
newtype IncludeCommunications
  = IncludeCommunications Boolean
```

##### Instances
``` purescript
Newtype IncludeCommunications _
Generic IncludeCommunications _
Show IncludeCommunications
Decode IncludeCommunications
Encode IncludeCommunications
```

#### `IncludeResolvedCases`

``` purescript
newtype IncludeResolvedCases
  = IncludeResolvedCases Boolean
```

##### Instances
``` purescript
Newtype IncludeResolvedCases _
Generic IncludeResolvedCases _
Show IncludeResolvedCases
Decode IncludeResolvedCases
Encode IncludeResolvedCases
```

#### `InternalServerError`

``` purescript
newtype InternalServerError
  = InternalServerError { message :: NullOrUndefined (ErrorMessage) }
```

<p>An internal server error occurred.</p>

##### Instances
``` purescript
Newtype InternalServerError _
Generic InternalServerError _
Show InternalServerError
Decode InternalServerError
Encode InternalServerError
```

#### `newInternalServerError`

``` purescript
newInternalServerError :: InternalServerError
```

Constructs InternalServerError from required parameters

#### `newInternalServerError'`

``` purescript
newInternalServerError' :: ({ message :: NullOrUndefined (ErrorMessage) } -> { message :: NullOrUndefined (ErrorMessage) }) -> InternalServerError
```

Constructs InternalServerError's fields from required parameters

#### `IssueType`

``` purescript
newtype IssueType
  = IssueType String
```

##### Instances
``` purescript
Newtype IssueType _
Generic IssueType _
Show IssueType
Decode IssueType
Encode IssueType
```

#### `Language`

``` purescript
newtype Language
  = Language String
```

##### Instances
``` purescript
Newtype Language _
Generic Language _
Show Language
Decode Language
Encode Language
```

#### `MaxResults`

``` purescript
newtype MaxResults
  = MaxResults Int
```

##### Instances
``` purescript
Newtype MaxResults _
Generic MaxResults _
Show MaxResults
Decode MaxResults
Encode MaxResults
```

#### `NextToken`

``` purescript
newtype NextToken
  = NextToken String
```

##### Instances
``` purescript
Newtype NextToken _
Generic NextToken _
Show NextToken
Decode NextToken
Encode NextToken
```

#### `RecentCaseCommunications`

``` purescript
newtype RecentCaseCommunications
  = RecentCaseCommunications { communications :: NullOrUndefined (CommunicationList), nextToken :: NullOrUndefined (NextToken) }
```

<p>The five most recent communications associated with the case.</p>

##### Instances
``` purescript
Newtype RecentCaseCommunications _
Generic RecentCaseCommunications _
Show RecentCaseCommunications
Decode RecentCaseCommunications
Encode RecentCaseCommunications
```

#### `newRecentCaseCommunications`

``` purescript
newRecentCaseCommunications :: RecentCaseCommunications
```

Constructs RecentCaseCommunications from required parameters

#### `newRecentCaseCommunications'`

``` purescript
newRecentCaseCommunications' :: ({ communications :: NullOrUndefined (CommunicationList), nextToken :: NullOrUndefined (NextToken) } -> { communications :: NullOrUndefined (CommunicationList), nextToken :: NullOrUndefined (NextToken) }) -> RecentCaseCommunications
```

Constructs RecentCaseCommunications's fields from required parameters

#### `RefreshTrustedAdvisorCheckRequest`

``` purescript
newtype RefreshTrustedAdvisorCheckRequest
  = RefreshTrustedAdvisorCheckRequest { checkId :: String }
```

<p/>

##### Instances
``` purescript
Newtype RefreshTrustedAdvisorCheckRequest _
Generic RefreshTrustedAdvisorCheckRequest _
Show RefreshTrustedAdvisorCheckRequest
Decode RefreshTrustedAdvisorCheckRequest
Encode RefreshTrustedAdvisorCheckRequest
```

#### `newRefreshTrustedAdvisorCheckRequest`

``` purescript
newRefreshTrustedAdvisorCheckRequest :: String -> RefreshTrustedAdvisorCheckRequest
```

Constructs RefreshTrustedAdvisorCheckRequest from required parameters

#### `newRefreshTrustedAdvisorCheckRequest'`

``` purescript
newRefreshTrustedAdvisorCheckRequest' :: String -> ({ checkId :: String } -> { checkId :: String }) -> RefreshTrustedAdvisorCheckRequest
```

Constructs RefreshTrustedAdvisorCheckRequest's fields from required parameters

#### `RefreshTrustedAdvisorCheckResponse`

``` purescript
newtype RefreshTrustedAdvisorCheckResponse
  = RefreshTrustedAdvisorCheckResponse { status :: TrustedAdvisorCheckRefreshStatus }
```

<p>The current refresh status of a Trusted Advisor check.</p>

##### Instances
``` purescript
Newtype RefreshTrustedAdvisorCheckResponse _
Generic RefreshTrustedAdvisorCheckResponse _
Show RefreshTrustedAdvisorCheckResponse
Decode RefreshTrustedAdvisorCheckResponse
Encode RefreshTrustedAdvisorCheckResponse
```

#### `newRefreshTrustedAdvisorCheckResponse`

``` purescript
newRefreshTrustedAdvisorCheckResponse :: TrustedAdvisorCheckRefreshStatus -> RefreshTrustedAdvisorCheckResponse
```

Constructs RefreshTrustedAdvisorCheckResponse from required parameters

#### `newRefreshTrustedAdvisorCheckResponse'`

``` purescript
newRefreshTrustedAdvisorCheckResponse' :: TrustedAdvisorCheckRefreshStatus -> ({ status :: TrustedAdvisorCheckRefreshStatus } -> { status :: TrustedAdvisorCheckRefreshStatus }) -> RefreshTrustedAdvisorCheckResponse
```

Constructs RefreshTrustedAdvisorCheckResponse's fields from required parameters

#### `ResolveCaseRequest`

``` purescript
newtype ResolveCaseRequest
  = ResolveCaseRequest { caseId :: NullOrUndefined (CaseId) }
```

<p/>

##### Instances
``` purescript
Newtype ResolveCaseRequest _
Generic ResolveCaseRequest _
Show ResolveCaseRequest
Decode ResolveCaseRequest
Encode ResolveCaseRequest
```

#### `newResolveCaseRequest`

``` purescript
newResolveCaseRequest :: ResolveCaseRequest
```

Constructs ResolveCaseRequest from required parameters

#### `newResolveCaseRequest'`

``` purescript
newResolveCaseRequest' :: ({ caseId :: NullOrUndefined (CaseId) } -> { caseId :: NullOrUndefined (CaseId) }) -> ResolveCaseRequest
```

Constructs ResolveCaseRequest's fields from required parameters

#### `ResolveCaseResponse`

``` purescript
newtype ResolveCaseResponse
  = ResolveCaseResponse { initialCaseStatus :: NullOrUndefined (CaseStatus), finalCaseStatus :: NullOrUndefined (CaseStatus) }
```

<p>The status of the case returned by the <a>ResolveCase</a> operation.</p>

##### Instances
``` purescript
Newtype ResolveCaseResponse _
Generic ResolveCaseResponse _
Show ResolveCaseResponse
Decode ResolveCaseResponse
Encode ResolveCaseResponse
```

#### `newResolveCaseResponse`

``` purescript
newResolveCaseResponse :: ResolveCaseResponse
```

Constructs ResolveCaseResponse from required parameters

#### `newResolveCaseResponse'`

``` purescript
newResolveCaseResponse' :: ({ initialCaseStatus :: NullOrUndefined (CaseStatus), finalCaseStatus :: NullOrUndefined (CaseStatus) } -> { initialCaseStatus :: NullOrUndefined (CaseStatus), finalCaseStatus :: NullOrUndefined (CaseStatus) }) -> ResolveCaseResponse
```

Constructs ResolveCaseResponse's fields from required parameters

#### `Result`

``` purescript
newtype Result
  = Result Boolean
```

##### Instances
``` purescript
Newtype Result _
Generic Result _
Show Result
Decode Result
Encode Result
```

#### `Service`

``` purescript
newtype Service
  = Service { code :: NullOrUndefined (ServiceCode), name :: NullOrUndefined (ServiceName), categories :: NullOrUndefined (CategoryList) }
```

<p>Information about an AWS service returned by the <a>DescribeServices</a> operation. </p>

##### Instances
``` purescript
Newtype Service _
Generic Service _
Show Service
Decode Service
Encode Service
```

#### `newService`

``` purescript
newService :: Service
```

Constructs Service from required parameters

#### `newService'`

``` purescript
newService' :: ({ code :: NullOrUndefined (ServiceCode), name :: NullOrUndefined (ServiceName), categories :: NullOrUndefined (CategoryList) } -> { code :: NullOrUndefined (ServiceCode), name :: NullOrUndefined (ServiceName), categories :: NullOrUndefined (CategoryList) }) -> Service
```

Constructs Service's fields from required parameters

#### `ServiceCode`

``` purescript
newtype ServiceCode
  = ServiceCode String
```

##### Instances
``` purescript
Newtype ServiceCode _
Generic ServiceCode _
Show ServiceCode
Decode ServiceCode
Encode ServiceCode
```

#### `ServiceCodeList`

``` purescript
newtype ServiceCodeList
  = ServiceCodeList (Array ServiceCode)
```

##### Instances
``` purescript
Newtype ServiceCodeList _
Generic ServiceCodeList _
Show ServiceCodeList
Decode ServiceCodeList
Encode ServiceCodeList
```

#### `ServiceList`

``` purescript
newtype ServiceList
  = ServiceList (Array Service)
```

##### Instances
``` purescript
Newtype ServiceList _
Generic ServiceList _
Show ServiceList
Decode ServiceList
Encode ServiceList
```

#### `ServiceName`

``` purescript
newtype ServiceName
  = ServiceName String
```

##### Instances
``` purescript
Newtype ServiceName _
Generic ServiceName _
Show ServiceName
Decode ServiceName
Encode ServiceName
```

#### `SeverityCode`

``` purescript
newtype SeverityCode
  = SeverityCode String
```

##### Instances
``` purescript
Newtype SeverityCode _
Generic SeverityCode _
Show SeverityCode
Decode SeverityCode
Encode SeverityCode
```

#### `SeverityLevel`

``` purescript
newtype SeverityLevel
  = SeverityLevel { code :: NullOrUndefined (SeverityLevelCode), name :: NullOrUndefined (SeverityLevelName) }
```

<p>A code and name pair that represent a severity level that can be applied to a support case.</p>

##### Instances
``` purescript
Newtype SeverityLevel _
Generic SeverityLevel _
Show SeverityLevel
Decode SeverityLevel
Encode SeverityLevel
```

#### `newSeverityLevel`

``` purescript
newSeverityLevel :: SeverityLevel
```

Constructs SeverityLevel from required parameters

#### `newSeverityLevel'`

``` purescript
newSeverityLevel' :: ({ code :: NullOrUndefined (SeverityLevelCode), name :: NullOrUndefined (SeverityLevelName) } -> { code :: NullOrUndefined (SeverityLevelCode), name :: NullOrUndefined (SeverityLevelName) }) -> SeverityLevel
```

Constructs SeverityLevel's fields from required parameters

#### `SeverityLevelCode`

``` purescript
newtype SeverityLevelCode
  = SeverityLevelCode String
```

##### Instances
``` purescript
Newtype SeverityLevelCode _
Generic SeverityLevelCode _
Show SeverityLevelCode
Decode SeverityLevelCode
Encode SeverityLevelCode
```

#### `SeverityLevelName`

``` purescript
newtype SeverityLevelName
  = SeverityLevelName String
```

##### Instances
``` purescript
Newtype SeverityLevelName _
Generic SeverityLevelName _
Show SeverityLevelName
Decode SeverityLevelName
Encode SeverityLevelName
```

#### `SeverityLevelsList`

``` purescript
newtype SeverityLevelsList
  = SeverityLevelsList (Array SeverityLevel)
```

##### Instances
``` purescript
Newtype SeverityLevelsList _
Generic SeverityLevelsList _
Show SeverityLevelsList
Decode SeverityLevelsList
Encode SeverityLevelsList
```

#### `Status`

``` purescript
newtype Status
  = Status String
```

##### Instances
``` purescript
Newtype Status _
Generic Status _
Show Status
Decode Status
Encode Status
```

#### `StringList`

``` purescript
newtype StringList
  = StringList (Array String)
```

##### Instances
``` purescript
Newtype StringList _
Generic StringList _
Show StringList
Decode StringList
Encode StringList
```

#### `Subject`

``` purescript
newtype Subject
  = Subject String
```

##### Instances
``` purescript
Newtype Subject _
Generic Subject _
Show Subject
Decode Subject
Encode Subject
```

#### `SubmittedBy`

``` purescript
newtype SubmittedBy
  = SubmittedBy String
```

##### Instances
``` purescript
Newtype SubmittedBy _
Generic SubmittedBy _
Show SubmittedBy
Decode SubmittedBy
Encode SubmittedBy
```

#### `TimeCreated`

``` purescript
newtype TimeCreated
  = TimeCreated String
```

##### Instances
``` purescript
Newtype TimeCreated _
Generic TimeCreated _
Show TimeCreated
Decode TimeCreated
Encode TimeCreated
```

#### `TrustedAdvisorCategorySpecificSummary`

``` purescript
newtype TrustedAdvisorCategorySpecificSummary
  = TrustedAdvisorCategorySpecificSummary { costOptimizing :: NullOrUndefined (TrustedAdvisorCostOptimizingSummary) }
```

<p>The container for summary information that relates to the category of the Trusted Advisor check.</p>

##### Instances
``` purescript
Newtype TrustedAdvisorCategorySpecificSummary _
Generic TrustedAdvisorCategorySpecificSummary _
Show TrustedAdvisorCategorySpecificSummary
Decode TrustedAdvisorCategorySpecificSummary
Encode TrustedAdvisorCategorySpecificSummary
```

#### `newTrustedAdvisorCategorySpecificSummary`

``` purescript
newTrustedAdvisorCategorySpecificSummary :: TrustedAdvisorCategorySpecificSummary
```

Constructs TrustedAdvisorCategorySpecificSummary from required parameters

#### `newTrustedAdvisorCategorySpecificSummary'`

``` purescript
newTrustedAdvisorCategorySpecificSummary' :: ({ costOptimizing :: NullOrUndefined (TrustedAdvisorCostOptimizingSummary) } -> { costOptimizing :: NullOrUndefined (TrustedAdvisorCostOptimizingSummary) }) -> TrustedAdvisorCategorySpecificSummary
```

Constructs TrustedAdvisorCategorySpecificSummary's fields from required parameters

#### `TrustedAdvisorCheckDescription`

``` purescript
newtype TrustedAdvisorCheckDescription
  = TrustedAdvisorCheckDescription { id :: String, name :: String, description :: String, category :: String, metadata :: StringList }
```

<p>The description and metadata for a Trusted Advisor check.</p>

##### Instances
``` purescript
Newtype TrustedAdvisorCheckDescription _
Generic TrustedAdvisorCheckDescription _
Show TrustedAdvisorCheckDescription
Decode TrustedAdvisorCheckDescription
Encode TrustedAdvisorCheckDescription
```

#### `newTrustedAdvisorCheckDescription`

``` purescript
newTrustedAdvisorCheckDescription :: String -> String -> String -> StringList -> String -> TrustedAdvisorCheckDescription
```

Constructs TrustedAdvisorCheckDescription from required parameters

#### `newTrustedAdvisorCheckDescription'`

``` purescript
newTrustedAdvisorCheckDescription' :: String -> String -> String -> StringList -> String -> ({ id :: String, name :: String, description :: String, category :: String, metadata :: StringList } -> { id :: String, name :: String, description :: String, category :: String, metadata :: StringList }) -> TrustedAdvisorCheckDescription
```

Constructs TrustedAdvisorCheckDescription's fields from required parameters

#### `TrustedAdvisorCheckList`

``` purescript
newtype TrustedAdvisorCheckList
  = TrustedAdvisorCheckList (Array TrustedAdvisorCheckDescription)
```

##### Instances
``` purescript
Newtype TrustedAdvisorCheckList _
Generic TrustedAdvisorCheckList _
Show TrustedAdvisorCheckList
Decode TrustedAdvisorCheckList
Encode TrustedAdvisorCheckList
```

#### `TrustedAdvisorCheckRefreshStatus`

``` purescript
newtype TrustedAdvisorCheckRefreshStatus
  = TrustedAdvisorCheckRefreshStatus { checkId :: String, status :: String, millisUntilNextRefreshable :: Number }
```

<p>The refresh status of a Trusted Advisor check.</p>

##### Instances
``` purescript
Newtype TrustedAdvisorCheckRefreshStatus _
Generic TrustedAdvisorCheckRefreshStatus _
Show TrustedAdvisorCheckRefreshStatus
Decode TrustedAdvisorCheckRefreshStatus
Encode TrustedAdvisorCheckRefreshStatus
```

#### `newTrustedAdvisorCheckRefreshStatus`

``` purescript
newTrustedAdvisorCheckRefreshStatus :: String -> Number -> String -> TrustedAdvisorCheckRefreshStatus
```

Constructs TrustedAdvisorCheckRefreshStatus from required parameters

#### `newTrustedAdvisorCheckRefreshStatus'`

``` purescript
newTrustedAdvisorCheckRefreshStatus' :: String -> Number -> String -> ({ checkId :: String, status :: String, millisUntilNextRefreshable :: Number } -> { checkId :: String, status :: String, millisUntilNextRefreshable :: Number }) -> TrustedAdvisorCheckRefreshStatus
```

Constructs TrustedAdvisorCheckRefreshStatus's fields from required parameters

#### `TrustedAdvisorCheckRefreshStatusList`

``` purescript
newtype TrustedAdvisorCheckRefreshStatusList
  = TrustedAdvisorCheckRefreshStatusList (Array TrustedAdvisorCheckRefreshStatus)
```

##### Instances
``` purescript
Newtype TrustedAdvisorCheckRefreshStatusList _
Generic TrustedAdvisorCheckRefreshStatusList _
Show TrustedAdvisorCheckRefreshStatusList
Decode TrustedAdvisorCheckRefreshStatusList
Encode TrustedAdvisorCheckRefreshStatusList
```

#### `TrustedAdvisorCheckResult`

``` purescript
newtype TrustedAdvisorCheckResult
  = TrustedAdvisorCheckResult { checkId :: String, timestamp :: String, status :: String, resourcesSummary :: TrustedAdvisorResourcesSummary, categorySpecificSummary :: TrustedAdvisorCategorySpecificSummary, flaggedResources :: TrustedAdvisorResourceDetailList }
```

<p>The results of a Trusted Advisor check returned by <a>DescribeTrustedAdvisorCheckResult</a>.</p>

##### Instances
``` purescript
Newtype TrustedAdvisorCheckResult _
Generic TrustedAdvisorCheckResult _
Show TrustedAdvisorCheckResult
Decode TrustedAdvisorCheckResult
Encode TrustedAdvisorCheckResult
```

#### `newTrustedAdvisorCheckResult`

``` purescript
newTrustedAdvisorCheckResult :: TrustedAdvisorCategorySpecificSummary -> String -> TrustedAdvisorResourceDetailList -> TrustedAdvisorResourcesSummary -> String -> String -> TrustedAdvisorCheckResult
```

Constructs TrustedAdvisorCheckResult from required parameters

#### `newTrustedAdvisorCheckResult'`

``` purescript
newTrustedAdvisorCheckResult' :: TrustedAdvisorCategorySpecificSummary -> String -> TrustedAdvisorResourceDetailList -> TrustedAdvisorResourcesSummary -> String -> String -> ({ checkId :: String, timestamp :: String, status :: String, resourcesSummary :: TrustedAdvisorResourcesSummary, categorySpecificSummary :: TrustedAdvisorCategorySpecificSummary, flaggedResources :: TrustedAdvisorResourceDetailList } -> { checkId :: String, timestamp :: String, status :: String, resourcesSummary :: TrustedAdvisorResourcesSummary, categorySpecificSummary :: TrustedAdvisorCategorySpecificSummary, flaggedResources :: TrustedAdvisorResourceDetailList }) -> TrustedAdvisorCheckResult
```

Constructs TrustedAdvisorCheckResult's fields from required parameters

#### `TrustedAdvisorCheckSummary`

``` purescript
newtype TrustedAdvisorCheckSummary
  = TrustedAdvisorCheckSummary { checkId :: String, timestamp :: String, status :: String, hasFlaggedResources :: NullOrUndefined (Boolean), resourcesSummary :: TrustedAdvisorResourcesSummary, categorySpecificSummary :: TrustedAdvisorCategorySpecificSummary }
```

<p>A summary of a Trusted Advisor check result, including the alert status, last refresh, and number of resources examined.</p>

##### Instances
``` purescript
Newtype TrustedAdvisorCheckSummary _
Generic TrustedAdvisorCheckSummary _
Show TrustedAdvisorCheckSummary
Decode TrustedAdvisorCheckSummary
Encode TrustedAdvisorCheckSummary
```

#### `newTrustedAdvisorCheckSummary`

``` purescript
newTrustedAdvisorCheckSummary :: TrustedAdvisorCategorySpecificSummary -> String -> TrustedAdvisorResourcesSummary -> String -> String -> TrustedAdvisorCheckSummary
```

Constructs TrustedAdvisorCheckSummary from required parameters

#### `newTrustedAdvisorCheckSummary'`

``` purescript
newTrustedAdvisorCheckSummary' :: TrustedAdvisorCategorySpecificSummary -> String -> TrustedAdvisorResourcesSummary -> String -> String -> ({ checkId :: String, timestamp :: String, status :: String, hasFlaggedResources :: NullOrUndefined (Boolean), resourcesSummary :: TrustedAdvisorResourcesSummary, categorySpecificSummary :: TrustedAdvisorCategorySpecificSummary } -> { checkId :: String, timestamp :: String, status :: String, hasFlaggedResources :: NullOrUndefined (Boolean), resourcesSummary :: TrustedAdvisorResourcesSummary, categorySpecificSummary :: TrustedAdvisorCategorySpecificSummary }) -> TrustedAdvisorCheckSummary
```

Constructs TrustedAdvisorCheckSummary's fields from required parameters

#### `TrustedAdvisorCheckSummaryList`

``` purescript
newtype TrustedAdvisorCheckSummaryList
  = TrustedAdvisorCheckSummaryList (Array TrustedAdvisorCheckSummary)
```

##### Instances
``` purescript
Newtype TrustedAdvisorCheckSummaryList _
Generic TrustedAdvisorCheckSummaryList _
Show TrustedAdvisorCheckSummaryList
Decode TrustedAdvisorCheckSummaryList
Encode TrustedAdvisorCheckSummaryList
```

#### `TrustedAdvisorCostOptimizingSummary`

``` purescript
newtype TrustedAdvisorCostOptimizingSummary
  = TrustedAdvisorCostOptimizingSummary { estimatedMonthlySavings :: Number, estimatedPercentMonthlySavings :: Number }
```

<p>The estimated cost savings that might be realized if the recommended actions are taken.</p>

##### Instances
``` purescript
Newtype TrustedAdvisorCostOptimizingSummary _
Generic TrustedAdvisorCostOptimizingSummary _
Show TrustedAdvisorCostOptimizingSummary
Decode TrustedAdvisorCostOptimizingSummary
Encode TrustedAdvisorCostOptimizingSummary
```

#### `newTrustedAdvisorCostOptimizingSummary`

``` purescript
newTrustedAdvisorCostOptimizingSummary :: Number -> Number -> TrustedAdvisorCostOptimizingSummary
```

Constructs TrustedAdvisorCostOptimizingSummary from required parameters

#### `newTrustedAdvisorCostOptimizingSummary'`

``` purescript
newTrustedAdvisorCostOptimizingSummary' :: Number -> Number -> ({ estimatedMonthlySavings :: Number, estimatedPercentMonthlySavings :: Number } -> { estimatedMonthlySavings :: Number, estimatedPercentMonthlySavings :: Number }) -> TrustedAdvisorCostOptimizingSummary
```

Constructs TrustedAdvisorCostOptimizingSummary's fields from required parameters

#### `TrustedAdvisorResourceDetail`

``` purescript
newtype TrustedAdvisorResourceDetail
  = TrustedAdvisorResourceDetail { status :: String, region :: NullOrUndefined (String), resourceId :: String, isSuppressed :: NullOrUndefined (Boolean), metadata :: StringList }
```

<p>Contains information about a resource identified by a Trusted Advisor check.</p>

##### Instances
``` purescript
Newtype TrustedAdvisorResourceDetail _
Generic TrustedAdvisorResourceDetail _
Show TrustedAdvisorResourceDetail
Decode TrustedAdvisorResourceDetail
Encode TrustedAdvisorResourceDetail
```

#### `newTrustedAdvisorResourceDetail`

``` purescript
newTrustedAdvisorResourceDetail :: StringList -> String -> String -> TrustedAdvisorResourceDetail
```

Constructs TrustedAdvisorResourceDetail from required parameters

#### `newTrustedAdvisorResourceDetail'`

``` purescript
newTrustedAdvisorResourceDetail' :: StringList -> String -> String -> ({ status :: String, region :: NullOrUndefined (String), resourceId :: String, isSuppressed :: NullOrUndefined (Boolean), metadata :: StringList } -> { status :: String, region :: NullOrUndefined (String), resourceId :: String, isSuppressed :: NullOrUndefined (Boolean), metadata :: StringList }) -> TrustedAdvisorResourceDetail
```

Constructs TrustedAdvisorResourceDetail's fields from required parameters

#### `TrustedAdvisorResourceDetailList`

``` purescript
newtype TrustedAdvisorResourceDetailList
  = TrustedAdvisorResourceDetailList (Array TrustedAdvisorResourceDetail)
```

##### Instances
``` purescript
Newtype TrustedAdvisorResourceDetailList _
Generic TrustedAdvisorResourceDetailList _
Show TrustedAdvisorResourceDetailList
Decode TrustedAdvisorResourceDetailList
Encode TrustedAdvisorResourceDetailList
```

#### `TrustedAdvisorResourcesSummary`

``` purescript
newtype TrustedAdvisorResourcesSummary
  = TrustedAdvisorResourcesSummary { resourcesProcessed :: Number, resourcesFlagged :: Number, resourcesIgnored :: Number, resourcesSuppressed :: Number }
```

<p>Details about AWS resources that were analyzed in a call to Trusted Advisor <a>DescribeTrustedAdvisorCheckSummaries</a>. </p>

##### Instances
``` purescript
Newtype TrustedAdvisorResourcesSummary _
Generic TrustedAdvisorResourcesSummary _
Show TrustedAdvisorResourcesSummary
Decode TrustedAdvisorResourcesSummary
Encode TrustedAdvisorResourcesSummary
```

#### `newTrustedAdvisorResourcesSummary`

``` purescript
newTrustedAdvisorResourcesSummary :: Number -> Number -> Number -> Number -> TrustedAdvisorResourcesSummary
```

Constructs TrustedAdvisorResourcesSummary from required parameters

#### `newTrustedAdvisorResourcesSummary'`

``` purescript
newTrustedAdvisorResourcesSummary' :: Number -> Number -> Number -> Number -> ({ resourcesProcessed :: Number, resourcesFlagged :: Number, resourcesIgnored :: Number, resourcesSuppressed :: Number } -> { resourcesProcessed :: Number, resourcesFlagged :: Number, resourcesIgnored :: Number, resourcesSuppressed :: Number }) -> TrustedAdvisorResourcesSummary
```

Constructs TrustedAdvisorResourcesSummary's fields from required parameters


