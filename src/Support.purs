

-- | <fullname>AWS Support</fullname> <p>The AWS Support API reference is intended for programmers who need detailed information about the AWS Support operations and data types. This service enables you to manage your AWS Support cases programmatically. It uses HTTP methods that return results in JSON format.</p> <p>The AWS Support service also exposes a set of <a href="http://aws.amazon.com/premiumsupport/trustedadvisor/">Trusted Advisor</a> features. You can retrieve a list of checks and their descriptions, get check results, specify checks to refresh, and get the refresh status of checks. </p> <p>The following list describes the AWS Support case management operations:</p> <ul> <li> <p> <b>Service names, issue categories, and available severity levels. </b>The <a>DescribeServices</a> and <a>DescribeSeverityLevels</a> operations return AWS service names, service codes, service categories, and problem severity levels. You use these values when you call the <a>CreateCase</a> operation. </p> </li> <li> <p> <b>Case creation, case details, and case resolution.</b> The <a>CreateCase</a>, <a>DescribeCases</a>, <a>DescribeAttachment</a>, and <a>ResolveCase</a> operations create AWS Support cases, retrieve information about cases, and resolve cases.</p> </li> <li> <p> <b>Case communication.</b> The <a>DescribeCommunications</a>, <a>AddCommunicationToCase</a>, and <a>AddAttachmentsToSet</a> operations retrieve and add communications and attachments to AWS Support cases. </p> </li> </ul> <p>The following list describes the operations available from the AWS Support service for Trusted Advisor:</p> <ul> <li> <p> <a>DescribeTrustedAdvisorChecks</a> returns the list of checks that run against your AWS resources.</p> </li> <li> <p>Using the <code>checkId</code> for a specific check returned by <a>DescribeTrustedAdvisorChecks</a>, you can call <a>DescribeTrustedAdvisorCheckResult</a> to obtain the results for the check you specified.</p> </li> <li> <p> <a>DescribeTrustedAdvisorCheckSummaries</a> returns summarized results for one or more Trusted Advisor checks.</p> </li> <li> <p> <a>RefreshTrustedAdvisorCheck</a> requests that Trusted Advisor rerun a specified check. </p> </li> <li> <p> <a>DescribeTrustedAdvisorCheckRefreshStatuses</a> reports the refresh status of one or more checks. </p> </li> </ul> <p>For authentication of requests, AWS Support uses <a href="http://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4 Signing Process</a>.</p> <p>See <a href="http://docs.aws.amazon.com/awssupport/latest/user/Welcome.html">About the AWS Support API</a> in the <i>AWS Support User Guide</i> for information about how to use this service to create and manage your support cases, and how to call Trusted Advisor for results of checks on your resources. </p>
module AWS.Support where

import Prelude
import Control.Monad.Aff (Aff)
import Control.Monad.Eff.Exception (EXCEPTION)
import Data.Foreign as Foreign
import Data.Foreign.NullOrUndefined (NullOrUndefined(..))
import Data.Foreign.Class (class Decode, class Encode)
import Data.Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Data.Foreign.NullOrUndefined as NullOrUndefined
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype)
import Data.StrMap as StrMap

import AWS.Request as Request
import AWS.Request.Types as Types


-- | <p>Adds one or more attachments to an attachment set. If an <code>attachmentSetId</code> is not specified, a new attachment set is created, and the ID of the set is returned in the response. If an <code>attachmentSetId</code> is specified, the attachments are added to the specified set, if it exists.</p> <p>An attachment set is a temporary container for attachments that are to be added to a case or case communication. The set is available for one hour after it is created; the <code>expiryTime</code> returned in the response indicates when the set expires. The maximum number of attachments in a set is 3, and the maximum size of any attachment in the set is 5 MB.</p>
addAttachmentsToSet :: forall eff. AddAttachmentsToSetRequest -> Aff (exception :: EXCEPTION | eff) AddAttachmentsToSetResponse
addAttachmentsToSet = Request.request service method  where
    service = Request.ServiceName "Support"
    method = Request.MethodName "addAttachmentsToSet"


-- | <p>Adds additional customer communication to an AWS Support case. You use the <code>caseId</code> value to identify the case to add communication to. You can list a set of email addresses to copy on the communication using the <code>ccEmailAddresses</code> value. The <code>communicationBody</code> value contains the text of the communication.</p> <p>The response indicates the success or failure of the request.</p> <p>This operation implements a subset of the features of the AWS Support Center.</p>
addCommunicationToCase :: forall eff. AddCommunicationToCaseRequest -> Aff (exception :: EXCEPTION | eff) AddCommunicationToCaseResponse
addCommunicationToCase = Request.request service method  where
    service = Request.ServiceName "Support"
    method = Request.MethodName "addCommunicationToCase"


-- | <p>Creates a new case in the AWS Support Center. This operation is modeled on the behavior of the AWS Support Center <a href="https://console.aws.amazon.com/support/home#/case/create">Create Case</a> page. Its parameters require you to specify the following information: </p> <ul> <li> <p> <b>issueType.</b> The type of issue for the case. You can specify either "customer-service" or "technical." If you do not indicate a value, the default is "technical." </p> </li> <li> <p> <b>serviceCode.</b> The code for an AWS service. You obtain the <code>serviceCode</code> by calling <a>DescribeServices</a>. </p> </li> <li> <p> <b>categoryCode.</b> The category for the service defined for the <code>serviceCode</code> value. You also obtain the category code for a service by calling <a>DescribeServices</a>. Each AWS service defines its own set of category codes. </p> </li> <li> <p> <b>severityCode.</b> A value that indicates the urgency of the case, which in turn determines the response time according to your service level agreement with AWS Support. You obtain the SeverityCode by calling <a>DescribeSeverityLevels</a>.</p> </li> <li> <p> <b>subject.</b> The <b>Subject</b> field on the AWS Support Center <a href="https://console.aws.amazon.com/support/home#/case/create">Create Case</a> page.</p> </li> <li> <p> <b>communicationBody.</b> The <b>Description</b> field on the AWS Support Center <a href="https://console.aws.amazon.com/support/home#/case/create">Create Case</a> page.</p> </li> <li> <p> <b>attachmentSetId.</b> The ID of a set of attachments that has been created by using <a>AddAttachmentsToSet</a>.</p> </li> <li> <p> <b>language.</b> The human language in which AWS Support handles the case. English and Japanese are currently supported.</p> </li> <li> <p> <b>ccEmailAddresses.</b> The AWS Support Center <b>CC</b> field on the <a href="https://console.aws.amazon.com/support/home#/case/create">Create Case</a> page. You can list email addresses to be copied on any correspondence about the case. The account that opens the case is already identified by passing the AWS Credentials in the HTTP POST method or in a method or function call from one of the programming languages supported by an <a href="http://aws.amazon.com/tools/">AWS SDK</a>. </p> </li> </ul> <note> <p>To add additional communication or attachments to an existing case, use <a>AddCommunicationToCase</a>.</p> </note> <p>A successful <a>CreateCase</a> request returns an AWS Support case number. Case numbers are used by the <a>DescribeCases</a> operation to retrieve existing AWS Support cases. </p>
createCase :: forall eff. CreateCaseRequest -> Aff (exception :: EXCEPTION | eff) CreateCaseResponse
createCase = Request.request service method  where
    service = Request.ServiceName "Support"
    method = Request.MethodName "createCase"


-- | <p>Returns the attachment that has the specified ID. Attachment IDs are generated by the case management system when you add an attachment to a case or case communication. Attachment IDs are returned in the <a>AttachmentDetails</a> objects that are returned by the <a>DescribeCommunications</a> operation.</p>
describeAttachment :: forall eff. DescribeAttachmentRequest -> Aff (exception :: EXCEPTION | eff) DescribeAttachmentResponse
describeAttachment = Request.request service method  where
    service = Request.ServiceName "Support"
    method = Request.MethodName "describeAttachment"


-- | <p>Returns a list of cases that you specify by passing one or more case IDs. In addition, you can filter the cases by date by setting values for the <code>afterTime</code> and <code>beforeTime</code> request parameters. You can set values for the <code>includeResolvedCases</code> and <code>includeCommunications</code> request parameters to control how much information is returned. </p> <p>Case data is available for 12 months after creation. If a case was created more than 12 months ago, a request for data might cause an error.</p> <p>The response returns the following in JSON format:</p> <ul> <li> <p>One or more <a>CaseDetails</a> data types. </p> </li> <li> <p>One or more <code>nextToken</code> values, which specify where to paginate the returned records represented by the <code>CaseDetails</code> objects.</p> </li> </ul>
describeCases :: forall eff. DescribeCasesRequest -> Aff (exception :: EXCEPTION | eff) DescribeCasesResponse
describeCases = Request.request service method  where
    service = Request.ServiceName "Support"
    method = Request.MethodName "describeCases"


-- | <p>Returns communications (and attachments) for one or more support cases. You can use the <code>afterTime</code> and <code>beforeTime</code> parameters to filter by date. You can use the <code>caseId</code> parameter to restrict the results to a particular case.</p> <p>Case data is available for 12 months after creation. If a case was created more than 12 months ago, a request for data might cause an error.</p> <p>You can use the <code>maxResults</code> and <code>nextToken</code> parameters to control the pagination of the result set. Set <code>maxResults</code> to the number of cases you want displayed on each page, and use <code>nextToken</code> to specify the resumption of pagination.</p>
describeCommunications :: forall eff. DescribeCommunicationsRequest -> Aff (exception :: EXCEPTION | eff) DescribeCommunicationsResponse
describeCommunications = Request.request service method  where
    service = Request.ServiceName "Support"
    method = Request.MethodName "describeCommunications"


-- | <p>Returns the current list of AWS services and a list of service categories that applies to each one. You then use service names and categories in your <a>CreateCase</a> requests. Each AWS service has its own set of categories.</p> <p>The service codes and category codes correspond to the values that are displayed in the <b>Service</b> and <b>Category</b> drop-down lists on the AWS Support Center <a href="https://console.aws.amazon.com/support/home#/case/create">Create Case</a> page. The values in those fields, however, do not necessarily match the service codes and categories returned by the <code>DescribeServices</code> request. Always use the service codes and categories obtained programmatically. This practice ensures that you always have the most recent set of service and category codes.</p>
describeServices :: forall eff. DescribeServicesRequest -> Aff (exception :: EXCEPTION | eff) DescribeServicesResponse
describeServices = Request.request service method  where
    service = Request.ServiceName "Support"
    method = Request.MethodName "describeServices"


-- | <p>Returns the list of severity levels that you can assign to an AWS Support case. The severity level for a case is also a field in the <a>CaseDetails</a> data type included in any <a>CreateCase</a> request. </p>
describeSeverityLevels :: forall eff. DescribeSeverityLevelsRequest -> Aff (exception :: EXCEPTION | eff) DescribeSeverityLevelsResponse
describeSeverityLevels = Request.request service method  where
    service = Request.ServiceName "Support"
    method = Request.MethodName "describeSeverityLevels"


-- | <p>Returns the refresh status of the Trusted Advisor checks that have the specified check IDs. Check IDs can be obtained by calling <a>DescribeTrustedAdvisorChecks</a>.</p> <note> <p>Some checks are refreshed automatically, and their refresh statuses cannot be retrieved by using this operation. Use of the <code>DescribeTrustedAdvisorCheckRefreshStatuses</code> operation for these checks causes an <code>InvalidParameterValue</code> error.</p> </note>
describeTrustedAdvisorCheckRefreshStatuses :: forall eff. DescribeTrustedAdvisorCheckRefreshStatusesRequest -> Aff (exception :: EXCEPTION | eff) DescribeTrustedAdvisorCheckRefreshStatusesResponse
describeTrustedAdvisorCheckRefreshStatuses = Request.request service method  where
    service = Request.ServiceName "Support"
    method = Request.MethodName "describeTrustedAdvisorCheckRefreshStatuses"


-- | <p>Returns the results of the Trusted Advisor check that has the specified check ID. Check IDs can be obtained by calling <a>DescribeTrustedAdvisorChecks</a>.</p> <p>The response contains a <a>TrustedAdvisorCheckResult</a> object, which contains these three objects:</p> <ul> <li> <p> <a>TrustedAdvisorCategorySpecificSummary</a> </p> </li> <li> <p> <a>TrustedAdvisorResourceDetail</a> </p> </li> <li> <p> <a>TrustedAdvisorResourcesSummary</a> </p> </li> </ul> <p>In addition, the response contains these fields:</p> <ul> <li> <p> <b>status.</b> The alert status of the check: "ok" (green), "warning" (yellow), "error" (red), or "not_available".</p> </li> <li> <p> <b>timestamp.</b> The time of the last refresh of the check.</p> </li> <li> <p> <b>checkId.</b> The unique identifier for the check.</p> </li> </ul>
describeTrustedAdvisorCheckResult :: forall eff. DescribeTrustedAdvisorCheckResultRequest -> Aff (exception :: EXCEPTION | eff) DescribeTrustedAdvisorCheckResultResponse
describeTrustedAdvisorCheckResult = Request.request service method  where
    service = Request.ServiceName "Support"
    method = Request.MethodName "describeTrustedAdvisorCheckResult"


-- | <p>Returns the summaries of the results of the Trusted Advisor checks that have the specified check IDs. Check IDs can be obtained by calling <a>DescribeTrustedAdvisorChecks</a>.</p> <p>The response contains an array of <a>TrustedAdvisorCheckSummary</a> objects.</p>
describeTrustedAdvisorCheckSummaries :: forall eff. DescribeTrustedAdvisorCheckSummariesRequest -> Aff (exception :: EXCEPTION | eff) DescribeTrustedAdvisorCheckSummariesResponse
describeTrustedAdvisorCheckSummaries = Request.request service method  where
    service = Request.ServiceName "Support"
    method = Request.MethodName "describeTrustedAdvisorCheckSummaries"


-- | <p>Returns information about all available Trusted Advisor checks, including name, ID, category, description, and metadata. You must specify a language code; English ("en") and Japanese ("ja") are currently supported. The response contains a <a>TrustedAdvisorCheckDescription</a> for each check.</p>
describeTrustedAdvisorChecks :: forall eff. DescribeTrustedAdvisorChecksRequest -> Aff (exception :: EXCEPTION | eff) DescribeTrustedAdvisorChecksResponse
describeTrustedAdvisorChecks = Request.request service method  where
    service = Request.ServiceName "Support"
    method = Request.MethodName "describeTrustedAdvisorChecks"


-- | <p>Requests a refresh of the Trusted Advisor check that has the specified check ID. Check IDs can be obtained by calling <a>DescribeTrustedAdvisorChecks</a>.</p> <note> <p>Some checks are refreshed automatically, and they cannot be refreshed by using this operation. Use of the <code>RefreshTrustedAdvisorCheck</code> operation for these checks causes an <code>InvalidParameterValue</code> error.</p> </note> <p>The response contains a <a>TrustedAdvisorCheckRefreshStatus</a> object, which contains these fields:</p> <ul> <li> <p> <b>status.</b> The refresh status of the check: "none", "enqueued", "processing", "success", or "abandoned".</p> </li> <li> <p> <b>millisUntilNextRefreshable.</b> The amount of time, in milliseconds, until the check is eligible for refresh.</p> </li> <li> <p> <b>checkId.</b> The unique identifier for the check.</p> </li> </ul>
refreshTrustedAdvisorCheck :: forall eff. RefreshTrustedAdvisorCheckRequest -> Aff (exception :: EXCEPTION | eff) RefreshTrustedAdvisorCheckResponse
refreshTrustedAdvisorCheck = Request.request service method  where
    service = Request.ServiceName "Support"
    method = Request.MethodName "refreshTrustedAdvisorCheck"


-- | <p>Takes a <code>caseId</code> and returns the initial state of the case along with the state of the case after the call to <a>ResolveCase</a> completed.</p>
resolveCase :: forall eff. ResolveCaseRequest -> Aff (exception :: EXCEPTION | eff) ResolveCaseResponse
resolveCase = Request.request service method  where
    service = Request.ServiceName "Support"
    method = Request.MethodName "resolveCase"


-- | <p/>
newtype AddAttachmentsToSetRequest = AddAttachmentsToSetRequest 
  { "attachmentSetId" :: NullOrUndefined.NullOrUndefined (AttachmentSetId)
  , "attachments" :: (Attachments)
  }
derive instance newtypeAddAttachmentsToSetRequest :: Newtype AddAttachmentsToSetRequest _
derive instance repGenericAddAttachmentsToSetRequest :: Generic AddAttachmentsToSetRequest _
instance showAddAttachmentsToSetRequest :: Show AddAttachmentsToSetRequest where
  show = genericShow
instance decodeAddAttachmentsToSetRequest :: Decode AddAttachmentsToSetRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeAddAttachmentsToSetRequest :: Encode AddAttachmentsToSetRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs AddAttachmentsToSetRequest from required parameters
newAddAttachmentsToSetRequest :: Attachments -> AddAttachmentsToSetRequest
newAddAttachmentsToSetRequest _attachments = AddAttachmentsToSetRequest { "attachments": _attachments, "attachmentSetId": (NullOrUndefined Nothing) }

-- | Constructs AddAttachmentsToSetRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newAddAttachmentsToSetRequest' :: Attachments -> ( { "attachmentSetId" :: NullOrUndefined.NullOrUndefined (AttachmentSetId) , "attachments" :: (Attachments) } -> {"attachmentSetId" :: NullOrUndefined.NullOrUndefined (AttachmentSetId) , "attachments" :: (Attachments) } ) -> AddAttachmentsToSetRequest
newAddAttachmentsToSetRequest' _attachments customize = (AddAttachmentsToSetRequest <<< customize) { "attachments": _attachments, "attachmentSetId": (NullOrUndefined Nothing) }



-- | <p>The ID and expiry time of the attachment set returned by the <a>AddAttachmentsToSet</a> operation.</p>
newtype AddAttachmentsToSetResponse = AddAttachmentsToSetResponse 
  { "attachmentSetId" :: NullOrUndefined.NullOrUndefined (AttachmentSetId)
  , "expiryTime" :: NullOrUndefined.NullOrUndefined (ExpiryTime)
  }
derive instance newtypeAddAttachmentsToSetResponse :: Newtype AddAttachmentsToSetResponse _
derive instance repGenericAddAttachmentsToSetResponse :: Generic AddAttachmentsToSetResponse _
instance showAddAttachmentsToSetResponse :: Show AddAttachmentsToSetResponse where
  show = genericShow
instance decodeAddAttachmentsToSetResponse :: Decode AddAttachmentsToSetResponse where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeAddAttachmentsToSetResponse :: Encode AddAttachmentsToSetResponse where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs AddAttachmentsToSetResponse from required parameters
newAddAttachmentsToSetResponse :: AddAttachmentsToSetResponse
newAddAttachmentsToSetResponse  = AddAttachmentsToSetResponse { "attachmentSetId": (NullOrUndefined Nothing), "expiryTime": (NullOrUndefined Nothing) }

-- | Constructs AddAttachmentsToSetResponse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newAddAttachmentsToSetResponse' :: ( { "attachmentSetId" :: NullOrUndefined.NullOrUndefined (AttachmentSetId) , "expiryTime" :: NullOrUndefined.NullOrUndefined (ExpiryTime) } -> {"attachmentSetId" :: NullOrUndefined.NullOrUndefined (AttachmentSetId) , "expiryTime" :: NullOrUndefined.NullOrUndefined (ExpiryTime) } ) -> AddAttachmentsToSetResponse
newAddAttachmentsToSetResponse'  customize = (AddAttachmentsToSetResponse <<< customize) { "attachmentSetId": (NullOrUndefined Nothing), "expiryTime": (NullOrUndefined Nothing) }



-- | <p>To be written.</p>
newtype AddCommunicationToCaseRequest = AddCommunicationToCaseRequest 
  { "caseId" :: NullOrUndefined.NullOrUndefined (CaseId)
  , "communicationBody" :: (CommunicationBody)
  , "ccEmailAddresses" :: NullOrUndefined.NullOrUndefined (CcEmailAddressList)
  , "attachmentSetId" :: NullOrUndefined.NullOrUndefined (AttachmentSetId)
  }
derive instance newtypeAddCommunicationToCaseRequest :: Newtype AddCommunicationToCaseRequest _
derive instance repGenericAddCommunicationToCaseRequest :: Generic AddCommunicationToCaseRequest _
instance showAddCommunicationToCaseRequest :: Show AddCommunicationToCaseRequest where
  show = genericShow
instance decodeAddCommunicationToCaseRequest :: Decode AddCommunicationToCaseRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeAddCommunicationToCaseRequest :: Encode AddCommunicationToCaseRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs AddCommunicationToCaseRequest from required parameters
newAddCommunicationToCaseRequest :: CommunicationBody -> AddCommunicationToCaseRequest
newAddCommunicationToCaseRequest _communicationBody = AddCommunicationToCaseRequest { "communicationBody": _communicationBody, "attachmentSetId": (NullOrUndefined Nothing), "caseId": (NullOrUndefined Nothing), "ccEmailAddresses": (NullOrUndefined Nothing) }

-- | Constructs AddCommunicationToCaseRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newAddCommunicationToCaseRequest' :: CommunicationBody -> ( { "caseId" :: NullOrUndefined.NullOrUndefined (CaseId) , "communicationBody" :: (CommunicationBody) , "ccEmailAddresses" :: NullOrUndefined.NullOrUndefined (CcEmailAddressList) , "attachmentSetId" :: NullOrUndefined.NullOrUndefined (AttachmentSetId) } -> {"caseId" :: NullOrUndefined.NullOrUndefined (CaseId) , "communicationBody" :: (CommunicationBody) , "ccEmailAddresses" :: NullOrUndefined.NullOrUndefined (CcEmailAddressList) , "attachmentSetId" :: NullOrUndefined.NullOrUndefined (AttachmentSetId) } ) -> AddCommunicationToCaseRequest
newAddCommunicationToCaseRequest' _communicationBody customize = (AddCommunicationToCaseRequest <<< customize) { "communicationBody": _communicationBody, "attachmentSetId": (NullOrUndefined Nothing), "caseId": (NullOrUndefined Nothing), "ccEmailAddresses": (NullOrUndefined Nothing) }



-- | <p>The result of the <a>AddCommunicationToCase</a> operation.</p>
newtype AddCommunicationToCaseResponse = AddCommunicationToCaseResponse 
  { "result" :: NullOrUndefined.NullOrUndefined (Result)
  }
derive instance newtypeAddCommunicationToCaseResponse :: Newtype AddCommunicationToCaseResponse _
derive instance repGenericAddCommunicationToCaseResponse :: Generic AddCommunicationToCaseResponse _
instance showAddCommunicationToCaseResponse :: Show AddCommunicationToCaseResponse where
  show = genericShow
instance decodeAddCommunicationToCaseResponse :: Decode AddCommunicationToCaseResponse where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeAddCommunicationToCaseResponse :: Encode AddCommunicationToCaseResponse where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs AddCommunicationToCaseResponse from required parameters
newAddCommunicationToCaseResponse :: AddCommunicationToCaseResponse
newAddCommunicationToCaseResponse  = AddCommunicationToCaseResponse { "result": (NullOrUndefined Nothing) }

-- | Constructs AddCommunicationToCaseResponse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newAddCommunicationToCaseResponse' :: ( { "result" :: NullOrUndefined.NullOrUndefined (Result) } -> {"result" :: NullOrUndefined.NullOrUndefined (Result) } ) -> AddCommunicationToCaseResponse
newAddCommunicationToCaseResponse'  customize = (AddCommunicationToCaseResponse <<< customize) { "result": (NullOrUndefined Nothing) }



newtype AfterTime = AfterTime String
derive instance newtypeAfterTime :: Newtype AfterTime _
derive instance repGenericAfterTime :: Generic AfterTime _
instance showAfterTime :: Show AfterTime where
  show = genericShow
instance decodeAfterTime :: Decode AfterTime where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeAfterTime :: Encode AfterTime where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>An attachment to a case communication. The attachment consists of the file name and the content of the file.</p>
newtype Attachment = Attachment 
  { "fileName" :: NullOrUndefined.NullOrUndefined (FileName)
  , "data" :: NullOrUndefined.NullOrUndefined (Data)
  }
derive instance newtypeAttachment :: Newtype Attachment _
derive instance repGenericAttachment :: Generic Attachment _
instance showAttachment :: Show Attachment where
  show = genericShow
instance decodeAttachment :: Decode Attachment where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeAttachment :: Encode Attachment where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs Attachment from required parameters
newAttachment :: Attachment
newAttachment  = Attachment { "data": (NullOrUndefined Nothing), "fileName": (NullOrUndefined Nothing) }

-- | Constructs Attachment's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newAttachment' :: ( { "fileName" :: NullOrUndefined.NullOrUndefined (FileName) , "data" :: NullOrUndefined.NullOrUndefined (Data) } -> {"fileName" :: NullOrUndefined.NullOrUndefined (FileName) , "data" :: NullOrUndefined.NullOrUndefined (Data) } ) -> Attachment
newAttachment'  customize = (Attachment <<< customize) { "data": (NullOrUndefined Nothing), "fileName": (NullOrUndefined Nothing) }



-- | <p>The file name and ID of an attachment to a case communication. You can use the ID to retrieve the attachment with the <a>DescribeAttachment</a> operation.</p>
newtype AttachmentDetails = AttachmentDetails 
  { "attachmentId" :: NullOrUndefined.NullOrUndefined (AttachmentId)
  , "fileName" :: NullOrUndefined.NullOrUndefined (FileName)
  }
derive instance newtypeAttachmentDetails :: Newtype AttachmentDetails _
derive instance repGenericAttachmentDetails :: Generic AttachmentDetails _
instance showAttachmentDetails :: Show AttachmentDetails where
  show = genericShow
instance decodeAttachmentDetails :: Decode AttachmentDetails where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeAttachmentDetails :: Encode AttachmentDetails where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs AttachmentDetails from required parameters
newAttachmentDetails :: AttachmentDetails
newAttachmentDetails  = AttachmentDetails { "attachmentId": (NullOrUndefined Nothing), "fileName": (NullOrUndefined Nothing) }

-- | Constructs AttachmentDetails's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newAttachmentDetails' :: ( { "attachmentId" :: NullOrUndefined.NullOrUndefined (AttachmentId) , "fileName" :: NullOrUndefined.NullOrUndefined (FileName) } -> {"attachmentId" :: NullOrUndefined.NullOrUndefined (AttachmentId) , "fileName" :: NullOrUndefined.NullOrUndefined (FileName) } ) -> AttachmentDetails
newAttachmentDetails'  customize = (AttachmentDetails <<< customize) { "attachmentId": (NullOrUndefined Nothing), "fileName": (NullOrUndefined Nothing) }



newtype AttachmentId = AttachmentId String
derive instance newtypeAttachmentId :: Newtype AttachmentId _
derive instance repGenericAttachmentId :: Generic AttachmentId _
instance showAttachmentId :: Show AttachmentId where
  show = genericShow
instance decodeAttachmentId :: Decode AttachmentId where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeAttachmentId :: Encode AttachmentId where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>An attachment with the specified ID could not be found.</p>
newtype AttachmentIdNotFound = AttachmentIdNotFound 
  { "message" :: NullOrUndefined.NullOrUndefined (ErrorMessage)
  }
derive instance newtypeAttachmentIdNotFound :: Newtype AttachmentIdNotFound _
derive instance repGenericAttachmentIdNotFound :: Generic AttachmentIdNotFound _
instance showAttachmentIdNotFound :: Show AttachmentIdNotFound where
  show = genericShow
instance decodeAttachmentIdNotFound :: Decode AttachmentIdNotFound where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeAttachmentIdNotFound :: Encode AttachmentIdNotFound where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs AttachmentIdNotFound from required parameters
newAttachmentIdNotFound :: AttachmentIdNotFound
newAttachmentIdNotFound  = AttachmentIdNotFound { "message": (NullOrUndefined Nothing) }

-- | Constructs AttachmentIdNotFound's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newAttachmentIdNotFound' :: ( { "message" :: NullOrUndefined.NullOrUndefined (ErrorMessage) } -> {"message" :: NullOrUndefined.NullOrUndefined (ErrorMessage) } ) -> AttachmentIdNotFound
newAttachmentIdNotFound'  customize = (AttachmentIdNotFound <<< customize) { "message": (NullOrUndefined Nothing) }



-- | <p>The limit for the number of attachment sets created in a short period of time has been exceeded.</p>
newtype AttachmentLimitExceeded = AttachmentLimitExceeded 
  { "message" :: NullOrUndefined.NullOrUndefined (ErrorMessage)
  }
derive instance newtypeAttachmentLimitExceeded :: Newtype AttachmentLimitExceeded _
derive instance repGenericAttachmentLimitExceeded :: Generic AttachmentLimitExceeded _
instance showAttachmentLimitExceeded :: Show AttachmentLimitExceeded where
  show = genericShow
instance decodeAttachmentLimitExceeded :: Decode AttachmentLimitExceeded where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeAttachmentLimitExceeded :: Encode AttachmentLimitExceeded where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs AttachmentLimitExceeded from required parameters
newAttachmentLimitExceeded :: AttachmentLimitExceeded
newAttachmentLimitExceeded  = AttachmentLimitExceeded { "message": (NullOrUndefined Nothing) }

-- | Constructs AttachmentLimitExceeded's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newAttachmentLimitExceeded' :: ( { "message" :: NullOrUndefined.NullOrUndefined (ErrorMessage) } -> {"message" :: NullOrUndefined.NullOrUndefined (ErrorMessage) } ) -> AttachmentLimitExceeded
newAttachmentLimitExceeded'  customize = (AttachmentLimitExceeded <<< customize) { "message": (NullOrUndefined Nothing) }



newtype AttachmentSet = AttachmentSet (Array AttachmentDetails)
derive instance newtypeAttachmentSet :: Newtype AttachmentSet _
derive instance repGenericAttachmentSet :: Generic AttachmentSet _
instance showAttachmentSet :: Show AttachmentSet where
  show = genericShow
instance decodeAttachmentSet :: Decode AttachmentSet where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeAttachmentSet :: Encode AttachmentSet where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>The expiration time of the attachment set has passed. The set expires 1 hour after it is created.</p>
newtype AttachmentSetExpired = AttachmentSetExpired 
  { "message" :: NullOrUndefined.NullOrUndefined (ErrorMessage)
  }
derive instance newtypeAttachmentSetExpired :: Newtype AttachmentSetExpired _
derive instance repGenericAttachmentSetExpired :: Generic AttachmentSetExpired _
instance showAttachmentSetExpired :: Show AttachmentSetExpired where
  show = genericShow
instance decodeAttachmentSetExpired :: Decode AttachmentSetExpired where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeAttachmentSetExpired :: Encode AttachmentSetExpired where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs AttachmentSetExpired from required parameters
newAttachmentSetExpired :: AttachmentSetExpired
newAttachmentSetExpired  = AttachmentSetExpired { "message": (NullOrUndefined Nothing) }

-- | Constructs AttachmentSetExpired's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newAttachmentSetExpired' :: ( { "message" :: NullOrUndefined.NullOrUndefined (ErrorMessage) } -> {"message" :: NullOrUndefined.NullOrUndefined (ErrorMessage) } ) -> AttachmentSetExpired
newAttachmentSetExpired'  customize = (AttachmentSetExpired <<< customize) { "message": (NullOrUndefined Nothing) }



newtype AttachmentSetId = AttachmentSetId String
derive instance newtypeAttachmentSetId :: Newtype AttachmentSetId _
derive instance repGenericAttachmentSetId :: Generic AttachmentSetId _
instance showAttachmentSetId :: Show AttachmentSetId where
  show = genericShow
instance decodeAttachmentSetId :: Decode AttachmentSetId where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeAttachmentSetId :: Encode AttachmentSetId where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>An attachment set with the specified ID could not be found.</p>
newtype AttachmentSetIdNotFound = AttachmentSetIdNotFound 
  { "message" :: NullOrUndefined.NullOrUndefined (ErrorMessage)
  }
derive instance newtypeAttachmentSetIdNotFound :: Newtype AttachmentSetIdNotFound _
derive instance repGenericAttachmentSetIdNotFound :: Generic AttachmentSetIdNotFound _
instance showAttachmentSetIdNotFound :: Show AttachmentSetIdNotFound where
  show = genericShow
instance decodeAttachmentSetIdNotFound :: Decode AttachmentSetIdNotFound where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeAttachmentSetIdNotFound :: Encode AttachmentSetIdNotFound where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs AttachmentSetIdNotFound from required parameters
newAttachmentSetIdNotFound :: AttachmentSetIdNotFound
newAttachmentSetIdNotFound  = AttachmentSetIdNotFound { "message": (NullOrUndefined Nothing) }

-- | Constructs AttachmentSetIdNotFound's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newAttachmentSetIdNotFound' :: ( { "message" :: NullOrUndefined.NullOrUndefined (ErrorMessage) } -> {"message" :: NullOrUndefined.NullOrUndefined (ErrorMessage) } ) -> AttachmentSetIdNotFound
newAttachmentSetIdNotFound'  customize = (AttachmentSetIdNotFound <<< customize) { "message": (NullOrUndefined Nothing) }



-- | <p>A limit for the size of an attachment set has been exceeded. The limits are 3 attachments and 5 MB per attachment.</p>
newtype AttachmentSetSizeLimitExceeded = AttachmentSetSizeLimitExceeded 
  { "message" :: NullOrUndefined.NullOrUndefined (ErrorMessage)
  }
derive instance newtypeAttachmentSetSizeLimitExceeded :: Newtype AttachmentSetSizeLimitExceeded _
derive instance repGenericAttachmentSetSizeLimitExceeded :: Generic AttachmentSetSizeLimitExceeded _
instance showAttachmentSetSizeLimitExceeded :: Show AttachmentSetSizeLimitExceeded where
  show = genericShow
instance decodeAttachmentSetSizeLimitExceeded :: Decode AttachmentSetSizeLimitExceeded where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeAttachmentSetSizeLimitExceeded :: Encode AttachmentSetSizeLimitExceeded where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs AttachmentSetSizeLimitExceeded from required parameters
newAttachmentSetSizeLimitExceeded :: AttachmentSetSizeLimitExceeded
newAttachmentSetSizeLimitExceeded  = AttachmentSetSizeLimitExceeded { "message": (NullOrUndefined Nothing) }

-- | Constructs AttachmentSetSizeLimitExceeded's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newAttachmentSetSizeLimitExceeded' :: ( { "message" :: NullOrUndefined.NullOrUndefined (ErrorMessage) } -> {"message" :: NullOrUndefined.NullOrUndefined (ErrorMessage) } ) -> AttachmentSetSizeLimitExceeded
newAttachmentSetSizeLimitExceeded'  customize = (AttachmentSetSizeLimitExceeded <<< customize) { "message": (NullOrUndefined Nothing) }



newtype Attachments = Attachments (Array Attachment)
derive instance newtypeAttachments :: Newtype Attachments _
derive instance repGenericAttachments :: Generic Attachments _
instance showAttachments :: Show Attachments where
  show = genericShow
instance decodeAttachments :: Decode Attachments where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeAttachments :: Encode Attachments where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype BeforeTime = BeforeTime String
derive instance newtypeBeforeTime :: Newtype BeforeTime _
derive instance repGenericBeforeTime :: Generic BeforeTime _
instance showBeforeTime :: Show BeforeTime where
  show = genericShow
instance decodeBeforeTime :: Decode BeforeTime where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeBeforeTime :: Encode BeforeTime where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>The case creation limit for the account has been exceeded.</p>
newtype CaseCreationLimitExceeded = CaseCreationLimitExceeded 
  { "message" :: NullOrUndefined.NullOrUndefined (ErrorMessage)
  }
derive instance newtypeCaseCreationLimitExceeded :: Newtype CaseCreationLimitExceeded _
derive instance repGenericCaseCreationLimitExceeded :: Generic CaseCreationLimitExceeded _
instance showCaseCreationLimitExceeded :: Show CaseCreationLimitExceeded where
  show = genericShow
instance decodeCaseCreationLimitExceeded :: Decode CaseCreationLimitExceeded where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeCaseCreationLimitExceeded :: Encode CaseCreationLimitExceeded where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs CaseCreationLimitExceeded from required parameters
newCaseCreationLimitExceeded :: CaseCreationLimitExceeded
newCaseCreationLimitExceeded  = CaseCreationLimitExceeded { "message": (NullOrUndefined Nothing) }

-- | Constructs CaseCreationLimitExceeded's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newCaseCreationLimitExceeded' :: ( { "message" :: NullOrUndefined.NullOrUndefined (ErrorMessage) } -> {"message" :: NullOrUndefined.NullOrUndefined (ErrorMessage) } ) -> CaseCreationLimitExceeded
newCaseCreationLimitExceeded'  customize = (CaseCreationLimitExceeded <<< customize) { "message": (NullOrUndefined Nothing) }



-- | <p>A JSON-formatted object that contains the metadata for a support case. It is contained the response from a <a>DescribeCases</a> request. <b>CaseDetails</b> contains the following fields:</p> <ul> <li> <p> <b>caseId.</b> The AWS Support case ID requested or returned in the call. The case ID is an alphanumeric string formatted as shown in this example: case-<i>12345678910-2013-c4c1d2bf33c5cf47</i>.</p> </li> <li> <p> <b>categoryCode.</b> The category of problem for the AWS Support case. Corresponds to the CategoryCode values returned by a call to <a>DescribeServices</a>.</p> </li> <li> <p> <b>displayId.</b> The identifier for the case on pages in the AWS Support Center.</p> </li> <li> <p> <b>language.</b> The ISO 639-1 code for the language in which AWS provides support. AWS Support currently supports English ("en") and Japanese ("ja"). Language parameters must be passed explicitly for operations that take them.</p> </li> <li> <p> <b>recentCommunications.</b> One or more <a>Communication</a> objects. Fields of these objects are <code>attachments</code>, <code>body</code>, <code>caseId</code>, <code>submittedBy</code>, and <code>timeCreated</code>.</p> </li> <li> <p> <b>nextToken.</b> A resumption point for pagination.</p> </li> <li> <p> <b>serviceCode.</b> The identifier for the AWS service that corresponds to the service code defined in the call to <a>DescribeServices</a>.</p> </li> <li> <p> <b>severityCode. </b>The severity code assigned to the case. Contains one of the values returned by the call to <a>DescribeSeverityLevels</a>.</p> </li> <li> <p> <b>status.</b> The status of the case in the AWS Support Center.</p> </li> <li> <p> <b>subject.</b> The subject line of the case.</p> </li> <li> <p> <b>submittedBy.</b> The email address of the account that submitted the case.</p> </li> <li> <p> <b>timeCreated.</b> The time the case was created, in ISO-8601 format.</p> </li> </ul>
newtype CaseDetails = CaseDetails 
  { "caseId" :: NullOrUndefined.NullOrUndefined (CaseId)
  , "displayId" :: NullOrUndefined.NullOrUndefined (DisplayId)
  , "subject" :: NullOrUndefined.NullOrUndefined (Subject)
  , "status" :: NullOrUndefined.NullOrUndefined (Status)
  , "serviceCode" :: NullOrUndefined.NullOrUndefined (ServiceCode)
  , "categoryCode" :: NullOrUndefined.NullOrUndefined (CategoryCode)
  , "severityCode" :: NullOrUndefined.NullOrUndefined (SeverityCode)
  , "submittedBy" :: NullOrUndefined.NullOrUndefined (SubmittedBy)
  , "timeCreated" :: NullOrUndefined.NullOrUndefined (TimeCreated)
  , "recentCommunications" :: NullOrUndefined.NullOrUndefined (RecentCaseCommunications)
  , "ccEmailAddresses" :: NullOrUndefined.NullOrUndefined (CcEmailAddressList)
  , "language" :: NullOrUndefined.NullOrUndefined (Language)
  }
derive instance newtypeCaseDetails :: Newtype CaseDetails _
derive instance repGenericCaseDetails :: Generic CaseDetails _
instance showCaseDetails :: Show CaseDetails where
  show = genericShow
instance decodeCaseDetails :: Decode CaseDetails where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeCaseDetails :: Encode CaseDetails where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs CaseDetails from required parameters
newCaseDetails :: CaseDetails
newCaseDetails  = CaseDetails { "caseId": (NullOrUndefined Nothing), "categoryCode": (NullOrUndefined Nothing), "ccEmailAddresses": (NullOrUndefined Nothing), "displayId": (NullOrUndefined Nothing), "language": (NullOrUndefined Nothing), "recentCommunications": (NullOrUndefined Nothing), "serviceCode": (NullOrUndefined Nothing), "severityCode": (NullOrUndefined Nothing), "status": (NullOrUndefined Nothing), "subject": (NullOrUndefined Nothing), "submittedBy": (NullOrUndefined Nothing), "timeCreated": (NullOrUndefined Nothing) }

-- | Constructs CaseDetails's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newCaseDetails' :: ( { "caseId" :: NullOrUndefined.NullOrUndefined (CaseId) , "displayId" :: NullOrUndefined.NullOrUndefined (DisplayId) , "subject" :: NullOrUndefined.NullOrUndefined (Subject) , "status" :: NullOrUndefined.NullOrUndefined (Status) , "serviceCode" :: NullOrUndefined.NullOrUndefined (ServiceCode) , "categoryCode" :: NullOrUndefined.NullOrUndefined (CategoryCode) , "severityCode" :: NullOrUndefined.NullOrUndefined (SeverityCode) , "submittedBy" :: NullOrUndefined.NullOrUndefined (SubmittedBy) , "timeCreated" :: NullOrUndefined.NullOrUndefined (TimeCreated) , "recentCommunications" :: NullOrUndefined.NullOrUndefined (RecentCaseCommunications) , "ccEmailAddresses" :: NullOrUndefined.NullOrUndefined (CcEmailAddressList) , "language" :: NullOrUndefined.NullOrUndefined (Language) } -> {"caseId" :: NullOrUndefined.NullOrUndefined (CaseId) , "displayId" :: NullOrUndefined.NullOrUndefined (DisplayId) , "subject" :: NullOrUndefined.NullOrUndefined (Subject) , "status" :: NullOrUndefined.NullOrUndefined (Status) , "serviceCode" :: NullOrUndefined.NullOrUndefined (ServiceCode) , "categoryCode" :: NullOrUndefined.NullOrUndefined (CategoryCode) , "severityCode" :: NullOrUndefined.NullOrUndefined (SeverityCode) , "submittedBy" :: NullOrUndefined.NullOrUndefined (SubmittedBy) , "timeCreated" :: NullOrUndefined.NullOrUndefined (TimeCreated) , "recentCommunications" :: NullOrUndefined.NullOrUndefined (RecentCaseCommunications) , "ccEmailAddresses" :: NullOrUndefined.NullOrUndefined (CcEmailAddressList) , "language" :: NullOrUndefined.NullOrUndefined (Language) } ) -> CaseDetails
newCaseDetails'  customize = (CaseDetails <<< customize) { "caseId": (NullOrUndefined Nothing), "categoryCode": (NullOrUndefined Nothing), "ccEmailAddresses": (NullOrUndefined Nothing), "displayId": (NullOrUndefined Nothing), "language": (NullOrUndefined Nothing), "recentCommunications": (NullOrUndefined Nothing), "serviceCode": (NullOrUndefined Nothing), "severityCode": (NullOrUndefined Nothing), "status": (NullOrUndefined Nothing), "subject": (NullOrUndefined Nothing), "submittedBy": (NullOrUndefined Nothing), "timeCreated": (NullOrUndefined Nothing) }



newtype CaseId = CaseId String
derive instance newtypeCaseId :: Newtype CaseId _
derive instance repGenericCaseId :: Generic CaseId _
instance showCaseId :: Show CaseId where
  show = genericShow
instance decodeCaseId :: Decode CaseId where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeCaseId :: Encode CaseId where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype CaseIdList = CaseIdList (Array CaseId)
derive instance newtypeCaseIdList :: Newtype CaseIdList _
derive instance repGenericCaseIdList :: Generic CaseIdList _
instance showCaseIdList :: Show CaseIdList where
  show = genericShow
instance decodeCaseIdList :: Decode CaseIdList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeCaseIdList :: Encode CaseIdList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>The requested <code>caseId</code> could not be located.</p>
newtype CaseIdNotFound = CaseIdNotFound 
  { "message" :: NullOrUndefined.NullOrUndefined (ErrorMessage)
  }
derive instance newtypeCaseIdNotFound :: Newtype CaseIdNotFound _
derive instance repGenericCaseIdNotFound :: Generic CaseIdNotFound _
instance showCaseIdNotFound :: Show CaseIdNotFound where
  show = genericShow
instance decodeCaseIdNotFound :: Decode CaseIdNotFound where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeCaseIdNotFound :: Encode CaseIdNotFound where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs CaseIdNotFound from required parameters
newCaseIdNotFound :: CaseIdNotFound
newCaseIdNotFound  = CaseIdNotFound { "message": (NullOrUndefined Nothing) }

-- | Constructs CaseIdNotFound's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newCaseIdNotFound' :: ( { "message" :: NullOrUndefined.NullOrUndefined (ErrorMessage) } -> {"message" :: NullOrUndefined.NullOrUndefined (ErrorMessage) } ) -> CaseIdNotFound
newCaseIdNotFound'  customize = (CaseIdNotFound <<< customize) { "message": (NullOrUndefined Nothing) }



newtype CaseList = CaseList (Array CaseDetails)
derive instance newtypeCaseList :: Newtype CaseList _
derive instance repGenericCaseList :: Generic CaseList _
instance showCaseList :: Show CaseList where
  show = genericShow
instance decodeCaseList :: Decode CaseList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeCaseList :: Encode CaseList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype CaseStatus = CaseStatus String
derive instance newtypeCaseStatus :: Newtype CaseStatus _
derive instance repGenericCaseStatus :: Generic CaseStatus _
instance showCaseStatus :: Show CaseStatus where
  show = genericShow
instance decodeCaseStatus :: Decode CaseStatus where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeCaseStatus :: Encode CaseStatus where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>A JSON-formatted name/value pair that represents the category name and category code of the problem, selected from the <a>DescribeServices</a> response for each AWS service.</p>
newtype Category = Category 
  { "code" :: NullOrUndefined.NullOrUndefined (CategoryCode)
  , "name" :: NullOrUndefined.NullOrUndefined (CategoryName)
  }
derive instance newtypeCategory :: Newtype Category _
derive instance repGenericCategory :: Generic Category _
instance showCategory :: Show Category where
  show = genericShow
instance decodeCategory :: Decode Category where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeCategory :: Encode Category where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs Category from required parameters
newCategory :: Category
newCategory  = Category { "code": (NullOrUndefined Nothing), "name": (NullOrUndefined Nothing) }

-- | Constructs Category's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newCategory' :: ( { "code" :: NullOrUndefined.NullOrUndefined (CategoryCode) , "name" :: NullOrUndefined.NullOrUndefined (CategoryName) } -> {"code" :: NullOrUndefined.NullOrUndefined (CategoryCode) , "name" :: NullOrUndefined.NullOrUndefined (CategoryName) } ) -> Category
newCategory'  customize = (Category <<< customize) { "code": (NullOrUndefined Nothing), "name": (NullOrUndefined Nothing) }



newtype CategoryCode = CategoryCode String
derive instance newtypeCategoryCode :: Newtype CategoryCode _
derive instance repGenericCategoryCode :: Generic CategoryCode _
instance showCategoryCode :: Show CategoryCode where
  show = genericShow
instance decodeCategoryCode :: Decode CategoryCode where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeCategoryCode :: Encode CategoryCode where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype CategoryList = CategoryList (Array Category)
derive instance newtypeCategoryList :: Newtype CategoryList _
derive instance repGenericCategoryList :: Generic CategoryList _
instance showCategoryList :: Show CategoryList where
  show = genericShow
instance decodeCategoryList :: Decode CategoryList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeCategoryList :: Encode CategoryList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype CategoryName = CategoryName String
derive instance newtypeCategoryName :: Newtype CategoryName _
derive instance repGenericCategoryName :: Generic CategoryName _
instance showCategoryName :: Show CategoryName where
  show = genericShow
instance decodeCategoryName :: Decode CategoryName where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeCategoryName :: Encode CategoryName where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype CcEmailAddress = CcEmailAddress String
derive instance newtypeCcEmailAddress :: Newtype CcEmailAddress _
derive instance repGenericCcEmailAddress :: Generic CcEmailAddress _
instance showCcEmailAddress :: Show CcEmailAddress where
  show = genericShow
instance decodeCcEmailAddress :: Decode CcEmailAddress where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeCcEmailAddress :: Encode CcEmailAddress where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype CcEmailAddressList = CcEmailAddressList (Array CcEmailAddress)
derive instance newtypeCcEmailAddressList :: Newtype CcEmailAddressList _
derive instance repGenericCcEmailAddressList :: Generic CcEmailAddressList _
instance showCcEmailAddressList :: Show CcEmailAddressList where
  show = genericShow
instance decodeCcEmailAddressList :: Decode CcEmailAddressList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeCcEmailAddressList :: Encode CcEmailAddressList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>A communication associated with an AWS Support case. The communication consists of the case ID, the message body, attachment information, the account email address, and the date and time of the communication.</p>
newtype Communication = Communication 
  { "caseId" :: NullOrUndefined.NullOrUndefined (CaseId)
  , "body" :: NullOrUndefined.NullOrUndefined (CommunicationBody)
  , "submittedBy" :: NullOrUndefined.NullOrUndefined (SubmittedBy)
  , "timeCreated" :: NullOrUndefined.NullOrUndefined (TimeCreated)
  , "attachmentSet" :: NullOrUndefined.NullOrUndefined (AttachmentSet)
  }
derive instance newtypeCommunication :: Newtype Communication _
derive instance repGenericCommunication :: Generic Communication _
instance showCommunication :: Show Communication where
  show = genericShow
instance decodeCommunication :: Decode Communication where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeCommunication :: Encode Communication where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs Communication from required parameters
newCommunication :: Communication
newCommunication  = Communication { "attachmentSet": (NullOrUndefined Nothing), "body": (NullOrUndefined Nothing), "caseId": (NullOrUndefined Nothing), "submittedBy": (NullOrUndefined Nothing), "timeCreated": (NullOrUndefined Nothing) }

-- | Constructs Communication's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newCommunication' :: ( { "caseId" :: NullOrUndefined.NullOrUndefined (CaseId) , "body" :: NullOrUndefined.NullOrUndefined (CommunicationBody) , "submittedBy" :: NullOrUndefined.NullOrUndefined (SubmittedBy) , "timeCreated" :: NullOrUndefined.NullOrUndefined (TimeCreated) , "attachmentSet" :: NullOrUndefined.NullOrUndefined (AttachmentSet) } -> {"caseId" :: NullOrUndefined.NullOrUndefined (CaseId) , "body" :: NullOrUndefined.NullOrUndefined (CommunicationBody) , "submittedBy" :: NullOrUndefined.NullOrUndefined (SubmittedBy) , "timeCreated" :: NullOrUndefined.NullOrUndefined (TimeCreated) , "attachmentSet" :: NullOrUndefined.NullOrUndefined (AttachmentSet) } ) -> Communication
newCommunication'  customize = (Communication <<< customize) { "attachmentSet": (NullOrUndefined Nothing), "body": (NullOrUndefined Nothing), "caseId": (NullOrUndefined Nothing), "submittedBy": (NullOrUndefined Nothing), "timeCreated": (NullOrUndefined Nothing) }



newtype CommunicationBody = CommunicationBody String
derive instance newtypeCommunicationBody :: Newtype CommunicationBody _
derive instance repGenericCommunicationBody :: Generic CommunicationBody _
instance showCommunicationBody :: Show CommunicationBody where
  show = genericShow
instance decodeCommunicationBody :: Decode CommunicationBody where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeCommunicationBody :: Encode CommunicationBody where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype CommunicationList = CommunicationList (Array Communication)
derive instance newtypeCommunicationList :: Newtype CommunicationList _
derive instance repGenericCommunicationList :: Generic CommunicationList _
instance showCommunicationList :: Show CommunicationList where
  show = genericShow
instance decodeCommunicationList :: Decode CommunicationList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeCommunicationList :: Encode CommunicationList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p/>
newtype CreateCaseRequest = CreateCaseRequest 
  { "subject" :: (Subject)
  , "serviceCode" :: NullOrUndefined.NullOrUndefined (ServiceCode)
  , "severityCode" :: NullOrUndefined.NullOrUndefined (SeverityCode)
  , "categoryCode" :: NullOrUndefined.NullOrUndefined (CategoryCode)
  , "communicationBody" :: (CommunicationBody)
  , "ccEmailAddresses" :: NullOrUndefined.NullOrUndefined (CcEmailAddressList)
  , "language" :: NullOrUndefined.NullOrUndefined (Language)
  , "issueType" :: NullOrUndefined.NullOrUndefined (IssueType)
  , "attachmentSetId" :: NullOrUndefined.NullOrUndefined (AttachmentSetId)
  }
derive instance newtypeCreateCaseRequest :: Newtype CreateCaseRequest _
derive instance repGenericCreateCaseRequest :: Generic CreateCaseRequest _
instance showCreateCaseRequest :: Show CreateCaseRequest where
  show = genericShow
instance decodeCreateCaseRequest :: Decode CreateCaseRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeCreateCaseRequest :: Encode CreateCaseRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs CreateCaseRequest from required parameters
newCreateCaseRequest :: CommunicationBody -> Subject -> CreateCaseRequest
newCreateCaseRequest _communicationBody _subject = CreateCaseRequest { "communicationBody": _communicationBody, "subject": _subject, "attachmentSetId": (NullOrUndefined Nothing), "categoryCode": (NullOrUndefined Nothing), "ccEmailAddresses": (NullOrUndefined Nothing), "issueType": (NullOrUndefined Nothing), "language": (NullOrUndefined Nothing), "serviceCode": (NullOrUndefined Nothing), "severityCode": (NullOrUndefined Nothing) }

-- | Constructs CreateCaseRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newCreateCaseRequest' :: CommunicationBody -> Subject -> ( { "subject" :: (Subject) , "serviceCode" :: NullOrUndefined.NullOrUndefined (ServiceCode) , "severityCode" :: NullOrUndefined.NullOrUndefined (SeverityCode) , "categoryCode" :: NullOrUndefined.NullOrUndefined (CategoryCode) , "communicationBody" :: (CommunicationBody) , "ccEmailAddresses" :: NullOrUndefined.NullOrUndefined (CcEmailAddressList) , "language" :: NullOrUndefined.NullOrUndefined (Language) , "issueType" :: NullOrUndefined.NullOrUndefined (IssueType) , "attachmentSetId" :: NullOrUndefined.NullOrUndefined (AttachmentSetId) } -> {"subject" :: (Subject) , "serviceCode" :: NullOrUndefined.NullOrUndefined (ServiceCode) , "severityCode" :: NullOrUndefined.NullOrUndefined (SeverityCode) , "categoryCode" :: NullOrUndefined.NullOrUndefined (CategoryCode) , "communicationBody" :: (CommunicationBody) , "ccEmailAddresses" :: NullOrUndefined.NullOrUndefined (CcEmailAddressList) , "language" :: NullOrUndefined.NullOrUndefined (Language) , "issueType" :: NullOrUndefined.NullOrUndefined (IssueType) , "attachmentSetId" :: NullOrUndefined.NullOrUndefined (AttachmentSetId) } ) -> CreateCaseRequest
newCreateCaseRequest' _communicationBody _subject customize = (CreateCaseRequest <<< customize) { "communicationBody": _communicationBody, "subject": _subject, "attachmentSetId": (NullOrUndefined Nothing), "categoryCode": (NullOrUndefined Nothing), "ccEmailAddresses": (NullOrUndefined Nothing), "issueType": (NullOrUndefined Nothing), "language": (NullOrUndefined Nothing), "serviceCode": (NullOrUndefined Nothing), "severityCode": (NullOrUndefined Nothing) }



-- | <p>The AWS Support case ID returned by a successful completion of the <a>CreateCase</a> operation. </p>
newtype CreateCaseResponse = CreateCaseResponse 
  { "caseId" :: NullOrUndefined.NullOrUndefined (CaseId)
  }
derive instance newtypeCreateCaseResponse :: Newtype CreateCaseResponse _
derive instance repGenericCreateCaseResponse :: Generic CreateCaseResponse _
instance showCreateCaseResponse :: Show CreateCaseResponse where
  show = genericShow
instance decodeCreateCaseResponse :: Decode CreateCaseResponse where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeCreateCaseResponse :: Encode CreateCaseResponse where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs CreateCaseResponse from required parameters
newCreateCaseResponse :: CreateCaseResponse
newCreateCaseResponse  = CreateCaseResponse { "caseId": (NullOrUndefined Nothing) }

-- | Constructs CreateCaseResponse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newCreateCaseResponse' :: ( { "caseId" :: NullOrUndefined.NullOrUndefined (CaseId) } -> {"caseId" :: NullOrUndefined.NullOrUndefined (CaseId) } ) -> CreateCaseResponse
newCreateCaseResponse'  customize = (CreateCaseResponse <<< customize) { "caseId": (NullOrUndefined Nothing) }



newtype Data = Data String
derive instance newtypeData :: Newtype Data _
derive instance repGenericData :: Generic Data _
instance showData :: Show Data where
  show = genericShow
instance decodeData :: Decode Data where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeData :: Encode Data where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>The limit for the number of <a>DescribeAttachment</a> requests in a short period of time has been exceeded.</p>
newtype DescribeAttachmentLimitExceeded = DescribeAttachmentLimitExceeded 
  { "message" :: NullOrUndefined.NullOrUndefined (ErrorMessage)
  }
derive instance newtypeDescribeAttachmentLimitExceeded :: Newtype DescribeAttachmentLimitExceeded _
derive instance repGenericDescribeAttachmentLimitExceeded :: Generic DescribeAttachmentLimitExceeded _
instance showDescribeAttachmentLimitExceeded :: Show DescribeAttachmentLimitExceeded where
  show = genericShow
instance decodeDescribeAttachmentLimitExceeded :: Decode DescribeAttachmentLimitExceeded where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDescribeAttachmentLimitExceeded :: Encode DescribeAttachmentLimitExceeded where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DescribeAttachmentLimitExceeded from required parameters
newDescribeAttachmentLimitExceeded :: DescribeAttachmentLimitExceeded
newDescribeAttachmentLimitExceeded  = DescribeAttachmentLimitExceeded { "message": (NullOrUndefined Nothing) }

-- | Constructs DescribeAttachmentLimitExceeded's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeAttachmentLimitExceeded' :: ( { "message" :: NullOrUndefined.NullOrUndefined (ErrorMessage) } -> {"message" :: NullOrUndefined.NullOrUndefined (ErrorMessage) } ) -> DescribeAttachmentLimitExceeded
newDescribeAttachmentLimitExceeded'  customize = (DescribeAttachmentLimitExceeded <<< customize) { "message": (NullOrUndefined Nothing) }



newtype DescribeAttachmentRequest = DescribeAttachmentRequest 
  { "attachmentId" :: (AttachmentId)
  }
derive instance newtypeDescribeAttachmentRequest :: Newtype DescribeAttachmentRequest _
derive instance repGenericDescribeAttachmentRequest :: Generic DescribeAttachmentRequest _
instance showDescribeAttachmentRequest :: Show DescribeAttachmentRequest where
  show = genericShow
instance decodeDescribeAttachmentRequest :: Decode DescribeAttachmentRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDescribeAttachmentRequest :: Encode DescribeAttachmentRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DescribeAttachmentRequest from required parameters
newDescribeAttachmentRequest :: AttachmentId -> DescribeAttachmentRequest
newDescribeAttachmentRequest _attachmentId = DescribeAttachmentRequest { "attachmentId": _attachmentId }

-- | Constructs DescribeAttachmentRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeAttachmentRequest' :: AttachmentId -> ( { "attachmentId" :: (AttachmentId) } -> {"attachmentId" :: (AttachmentId) } ) -> DescribeAttachmentRequest
newDescribeAttachmentRequest' _attachmentId customize = (DescribeAttachmentRequest <<< customize) { "attachmentId": _attachmentId }



-- | <p>The content and file name of the attachment returned by the <a>DescribeAttachment</a> operation.</p>
newtype DescribeAttachmentResponse = DescribeAttachmentResponse 
  { "attachment" :: NullOrUndefined.NullOrUndefined (Attachment)
  }
derive instance newtypeDescribeAttachmentResponse :: Newtype DescribeAttachmentResponse _
derive instance repGenericDescribeAttachmentResponse :: Generic DescribeAttachmentResponse _
instance showDescribeAttachmentResponse :: Show DescribeAttachmentResponse where
  show = genericShow
instance decodeDescribeAttachmentResponse :: Decode DescribeAttachmentResponse where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDescribeAttachmentResponse :: Encode DescribeAttachmentResponse where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DescribeAttachmentResponse from required parameters
newDescribeAttachmentResponse :: DescribeAttachmentResponse
newDescribeAttachmentResponse  = DescribeAttachmentResponse { "attachment": (NullOrUndefined Nothing) }

-- | Constructs DescribeAttachmentResponse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeAttachmentResponse' :: ( { "attachment" :: NullOrUndefined.NullOrUndefined (Attachment) } -> {"attachment" :: NullOrUndefined.NullOrUndefined (Attachment) } ) -> DescribeAttachmentResponse
newDescribeAttachmentResponse'  customize = (DescribeAttachmentResponse <<< customize) { "attachment": (NullOrUndefined Nothing) }



-- | <p/>
newtype DescribeCasesRequest = DescribeCasesRequest 
  { "caseIdList" :: NullOrUndefined.NullOrUndefined (CaseIdList)
  , "displayId" :: NullOrUndefined.NullOrUndefined (DisplayId)
  , "afterTime" :: NullOrUndefined.NullOrUndefined (AfterTime)
  , "beforeTime" :: NullOrUndefined.NullOrUndefined (BeforeTime)
  , "includeResolvedCases" :: NullOrUndefined.NullOrUndefined (IncludeResolvedCases)
  , "nextToken" :: NullOrUndefined.NullOrUndefined (NextToken)
  , "maxResults" :: NullOrUndefined.NullOrUndefined (MaxResults)
  , "language" :: NullOrUndefined.NullOrUndefined (Language)
  , "includeCommunications" :: NullOrUndefined.NullOrUndefined (IncludeCommunications)
  }
derive instance newtypeDescribeCasesRequest :: Newtype DescribeCasesRequest _
derive instance repGenericDescribeCasesRequest :: Generic DescribeCasesRequest _
instance showDescribeCasesRequest :: Show DescribeCasesRequest where
  show = genericShow
instance decodeDescribeCasesRequest :: Decode DescribeCasesRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDescribeCasesRequest :: Encode DescribeCasesRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DescribeCasesRequest from required parameters
newDescribeCasesRequest :: DescribeCasesRequest
newDescribeCasesRequest  = DescribeCasesRequest { "afterTime": (NullOrUndefined Nothing), "beforeTime": (NullOrUndefined Nothing), "caseIdList": (NullOrUndefined Nothing), "displayId": (NullOrUndefined Nothing), "includeCommunications": (NullOrUndefined Nothing), "includeResolvedCases": (NullOrUndefined Nothing), "language": (NullOrUndefined Nothing), "maxResults": (NullOrUndefined Nothing), "nextToken": (NullOrUndefined Nothing) }

-- | Constructs DescribeCasesRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeCasesRequest' :: ( { "caseIdList" :: NullOrUndefined.NullOrUndefined (CaseIdList) , "displayId" :: NullOrUndefined.NullOrUndefined (DisplayId) , "afterTime" :: NullOrUndefined.NullOrUndefined (AfterTime) , "beforeTime" :: NullOrUndefined.NullOrUndefined (BeforeTime) , "includeResolvedCases" :: NullOrUndefined.NullOrUndefined (IncludeResolvedCases) , "nextToken" :: NullOrUndefined.NullOrUndefined (NextToken) , "maxResults" :: NullOrUndefined.NullOrUndefined (MaxResults) , "language" :: NullOrUndefined.NullOrUndefined (Language) , "includeCommunications" :: NullOrUndefined.NullOrUndefined (IncludeCommunications) } -> {"caseIdList" :: NullOrUndefined.NullOrUndefined (CaseIdList) , "displayId" :: NullOrUndefined.NullOrUndefined (DisplayId) , "afterTime" :: NullOrUndefined.NullOrUndefined (AfterTime) , "beforeTime" :: NullOrUndefined.NullOrUndefined (BeforeTime) , "includeResolvedCases" :: NullOrUndefined.NullOrUndefined (IncludeResolvedCases) , "nextToken" :: NullOrUndefined.NullOrUndefined (NextToken) , "maxResults" :: NullOrUndefined.NullOrUndefined (MaxResults) , "language" :: NullOrUndefined.NullOrUndefined (Language) , "includeCommunications" :: NullOrUndefined.NullOrUndefined (IncludeCommunications) } ) -> DescribeCasesRequest
newDescribeCasesRequest'  customize = (DescribeCasesRequest <<< customize) { "afterTime": (NullOrUndefined Nothing), "beforeTime": (NullOrUndefined Nothing), "caseIdList": (NullOrUndefined Nothing), "displayId": (NullOrUndefined Nothing), "includeCommunications": (NullOrUndefined Nothing), "includeResolvedCases": (NullOrUndefined Nothing), "language": (NullOrUndefined Nothing), "maxResults": (NullOrUndefined Nothing), "nextToken": (NullOrUndefined Nothing) }



-- | <p>Returns an array of <a>CaseDetails</a> objects and a <code>nextToken</code> that defines a point for pagination in the result set.</p>
newtype DescribeCasesResponse = DescribeCasesResponse 
  { "cases" :: NullOrUndefined.NullOrUndefined (CaseList)
  , "nextToken" :: NullOrUndefined.NullOrUndefined (NextToken)
  }
derive instance newtypeDescribeCasesResponse :: Newtype DescribeCasesResponse _
derive instance repGenericDescribeCasesResponse :: Generic DescribeCasesResponse _
instance showDescribeCasesResponse :: Show DescribeCasesResponse where
  show = genericShow
instance decodeDescribeCasesResponse :: Decode DescribeCasesResponse where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDescribeCasesResponse :: Encode DescribeCasesResponse where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DescribeCasesResponse from required parameters
newDescribeCasesResponse :: DescribeCasesResponse
newDescribeCasesResponse  = DescribeCasesResponse { "cases": (NullOrUndefined Nothing), "nextToken": (NullOrUndefined Nothing) }

-- | Constructs DescribeCasesResponse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeCasesResponse' :: ( { "cases" :: NullOrUndefined.NullOrUndefined (CaseList) , "nextToken" :: NullOrUndefined.NullOrUndefined (NextToken) } -> {"cases" :: NullOrUndefined.NullOrUndefined (CaseList) , "nextToken" :: NullOrUndefined.NullOrUndefined (NextToken) } ) -> DescribeCasesResponse
newDescribeCasesResponse'  customize = (DescribeCasesResponse <<< customize) { "cases": (NullOrUndefined Nothing), "nextToken": (NullOrUndefined Nothing) }



-- | <p/>
newtype DescribeCommunicationsRequest = DescribeCommunicationsRequest 
  { "caseId" :: (CaseId)
  , "beforeTime" :: NullOrUndefined.NullOrUndefined (BeforeTime)
  , "afterTime" :: NullOrUndefined.NullOrUndefined (AfterTime)
  , "nextToken" :: NullOrUndefined.NullOrUndefined (NextToken)
  , "maxResults" :: NullOrUndefined.NullOrUndefined (MaxResults)
  }
derive instance newtypeDescribeCommunicationsRequest :: Newtype DescribeCommunicationsRequest _
derive instance repGenericDescribeCommunicationsRequest :: Generic DescribeCommunicationsRequest _
instance showDescribeCommunicationsRequest :: Show DescribeCommunicationsRequest where
  show = genericShow
instance decodeDescribeCommunicationsRequest :: Decode DescribeCommunicationsRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDescribeCommunicationsRequest :: Encode DescribeCommunicationsRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DescribeCommunicationsRequest from required parameters
newDescribeCommunicationsRequest :: CaseId -> DescribeCommunicationsRequest
newDescribeCommunicationsRequest _caseId = DescribeCommunicationsRequest { "caseId": _caseId, "afterTime": (NullOrUndefined Nothing), "beforeTime": (NullOrUndefined Nothing), "maxResults": (NullOrUndefined Nothing), "nextToken": (NullOrUndefined Nothing) }

-- | Constructs DescribeCommunicationsRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeCommunicationsRequest' :: CaseId -> ( { "caseId" :: (CaseId) , "beforeTime" :: NullOrUndefined.NullOrUndefined (BeforeTime) , "afterTime" :: NullOrUndefined.NullOrUndefined (AfterTime) , "nextToken" :: NullOrUndefined.NullOrUndefined (NextToken) , "maxResults" :: NullOrUndefined.NullOrUndefined (MaxResults) } -> {"caseId" :: (CaseId) , "beforeTime" :: NullOrUndefined.NullOrUndefined (BeforeTime) , "afterTime" :: NullOrUndefined.NullOrUndefined (AfterTime) , "nextToken" :: NullOrUndefined.NullOrUndefined (NextToken) , "maxResults" :: NullOrUndefined.NullOrUndefined (MaxResults) } ) -> DescribeCommunicationsRequest
newDescribeCommunicationsRequest' _caseId customize = (DescribeCommunicationsRequest <<< customize) { "caseId": _caseId, "afterTime": (NullOrUndefined Nothing), "beforeTime": (NullOrUndefined Nothing), "maxResults": (NullOrUndefined Nothing), "nextToken": (NullOrUndefined Nothing) }



-- | <p>The communications returned by the <a>DescribeCommunications</a> operation.</p>
newtype DescribeCommunicationsResponse = DescribeCommunicationsResponse 
  { "communications" :: NullOrUndefined.NullOrUndefined (CommunicationList)
  , "nextToken" :: NullOrUndefined.NullOrUndefined (NextToken)
  }
derive instance newtypeDescribeCommunicationsResponse :: Newtype DescribeCommunicationsResponse _
derive instance repGenericDescribeCommunicationsResponse :: Generic DescribeCommunicationsResponse _
instance showDescribeCommunicationsResponse :: Show DescribeCommunicationsResponse where
  show = genericShow
instance decodeDescribeCommunicationsResponse :: Decode DescribeCommunicationsResponse where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDescribeCommunicationsResponse :: Encode DescribeCommunicationsResponse where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DescribeCommunicationsResponse from required parameters
newDescribeCommunicationsResponse :: DescribeCommunicationsResponse
newDescribeCommunicationsResponse  = DescribeCommunicationsResponse { "communications": (NullOrUndefined Nothing), "nextToken": (NullOrUndefined Nothing) }

-- | Constructs DescribeCommunicationsResponse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeCommunicationsResponse' :: ( { "communications" :: NullOrUndefined.NullOrUndefined (CommunicationList) , "nextToken" :: NullOrUndefined.NullOrUndefined (NextToken) } -> {"communications" :: NullOrUndefined.NullOrUndefined (CommunicationList) , "nextToken" :: NullOrUndefined.NullOrUndefined (NextToken) } ) -> DescribeCommunicationsResponse
newDescribeCommunicationsResponse'  customize = (DescribeCommunicationsResponse <<< customize) { "communications": (NullOrUndefined Nothing), "nextToken": (NullOrUndefined Nothing) }



-- | <p/>
newtype DescribeServicesRequest = DescribeServicesRequest 
  { "serviceCodeList" :: NullOrUndefined.NullOrUndefined (ServiceCodeList)
  , "language" :: NullOrUndefined.NullOrUndefined (Language)
  }
derive instance newtypeDescribeServicesRequest :: Newtype DescribeServicesRequest _
derive instance repGenericDescribeServicesRequest :: Generic DescribeServicesRequest _
instance showDescribeServicesRequest :: Show DescribeServicesRequest where
  show = genericShow
instance decodeDescribeServicesRequest :: Decode DescribeServicesRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDescribeServicesRequest :: Encode DescribeServicesRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DescribeServicesRequest from required parameters
newDescribeServicesRequest :: DescribeServicesRequest
newDescribeServicesRequest  = DescribeServicesRequest { "language": (NullOrUndefined Nothing), "serviceCodeList": (NullOrUndefined Nothing) }

-- | Constructs DescribeServicesRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeServicesRequest' :: ( { "serviceCodeList" :: NullOrUndefined.NullOrUndefined (ServiceCodeList) , "language" :: NullOrUndefined.NullOrUndefined (Language) } -> {"serviceCodeList" :: NullOrUndefined.NullOrUndefined (ServiceCodeList) , "language" :: NullOrUndefined.NullOrUndefined (Language) } ) -> DescribeServicesRequest
newDescribeServicesRequest'  customize = (DescribeServicesRequest <<< customize) { "language": (NullOrUndefined Nothing), "serviceCodeList": (NullOrUndefined Nothing) }



-- | <p>The list of AWS services returned by the <a>DescribeServices</a> operation.</p>
newtype DescribeServicesResponse = DescribeServicesResponse 
  { "services" :: NullOrUndefined.NullOrUndefined (ServiceList)
  }
derive instance newtypeDescribeServicesResponse :: Newtype DescribeServicesResponse _
derive instance repGenericDescribeServicesResponse :: Generic DescribeServicesResponse _
instance showDescribeServicesResponse :: Show DescribeServicesResponse where
  show = genericShow
instance decodeDescribeServicesResponse :: Decode DescribeServicesResponse where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDescribeServicesResponse :: Encode DescribeServicesResponse where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DescribeServicesResponse from required parameters
newDescribeServicesResponse :: DescribeServicesResponse
newDescribeServicesResponse  = DescribeServicesResponse { "services": (NullOrUndefined Nothing) }

-- | Constructs DescribeServicesResponse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeServicesResponse' :: ( { "services" :: NullOrUndefined.NullOrUndefined (ServiceList) } -> {"services" :: NullOrUndefined.NullOrUndefined (ServiceList) } ) -> DescribeServicesResponse
newDescribeServicesResponse'  customize = (DescribeServicesResponse <<< customize) { "services": (NullOrUndefined Nothing) }



-- | <p/>
newtype DescribeSeverityLevelsRequest = DescribeSeverityLevelsRequest 
  { "language" :: NullOrUndefined.NullOrUndefined (Language)
  }
derive instance newtypeDescribeSeverityLevelsRequest :: Newtype DescribeSeverityLevelsRequest _
derive instance repGenericDescribeSeverityLevelsRequest :: Generic DescribeSeverityLevelsRequest _
instance showDescribeSeverityLevelsRequest :: Show DescribeSeverityLevelsRequest where
  show = genericShow
instance decodeDescribeSeverityLevelsRequest :: Decode DescribeSeverityLevelsRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDescribeSeverityLevelsRequest :: Encode DescribeSeverityLevelsRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DescribeSeverityLevelsRequest from required parameters
newDescribeSeverityLevelsRequest :: DescribeSeverityLevelsRequest
newDescribeSeverityLevelsRequest  = DescribeSeverityLevelsRequest { "language": (NullOrUndefined Nothing) }

-- | Constructs DescribeSeverityLevelsRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeSeverityLevelsRequest' :: ( { "language" :: NullOrUndefined.NullOrUndefined (Language) } -> {"language" :: NullOrUndefined.NullOrUndefined (Language) } ) -> DescribeSeverityLevelsRequest
newDescribeSeverityLevelsRequest'  customize = (DescribeSeverityLevelsRequest <<< customize) { "language": (NullOrUndefined Nothing) }



-- | <p>The list of severity levels returned by the <a>DescribeSeverityLevels</a> operation.</p>
newtype DescribeSeverityLevelsResponse = DescribeSeverityLevelsResponse 
  { "severityLevels" :: NullOrUndefined.NullOrUndefined (SeverityLevelsList)
  }
derive instance newtypeDescribeSeverityLevelsResponse :: Newtype DescribeSeverityLevelsResponse _
derive instance repGenericDescribeSeverityLevelsResponse :: Generic DescribeSeverityLevelsResponse _
instance showDescribeSeverityLevelsResponse :: Show DescribeSeverityLevelsResponse where
  show = genericShow
instance decodeDescribeSeverityLevelsResponse :: Decode DescribeSeverityLevelsResponse where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDescribeSeverityLevelsResponse :: Encode DescribeSeverityLevelsResponse where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DescribeSeverityLevelsResponse from required parameters
newDescribeSeverityLevelsResponse :: DescribeSeverityLevelsResponse
newDescribeSeverityLevelsResponse  = DescribeSeverityLevelsResponse { "severityLevels": (NullOrUndefined Nothing) }

-- | Constructs DescribeSeverityLevelsResponse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeSeverityLevelsResponse' :: ( { "severityLevels" :: NullOrUndefined.NullOrUndefined (SeverityLevelsList) } -> {"severityLevels" :: NullOrUndefined.NullOrUndefined (SeverityLevelsList) } ) -> DescribeSeverityLevelsResponse
newDescribeSeverityLevelsResponse'  customize = (DescribeSeverityLevelsResponse <<< customize) { "severityLevels": (NullOrUndefined Nothing) }



-- | <p/>
newtype DescribeTrustedAdvisorCheckRefreshStatusesRequest = DescribeTrustedAdvisorCheckRefreshStatusesRequest 
  { "checkIds" :: (StringList)
  }
derive instance newtypeDescribeTrustedAdvisorCheckRefreshStatusesRequest :: Newtype DescribeTrustedAdvisorCheckRefreshStatusesRequest _
derive instance repGenericDescribeTrustedAdvisorCheckRefreshStatusesRequest :: Generic DescribeTrustedAdvisorCheckRefreshStatusesRequest _
instance showDescribeTrustedAdvisorCheckRefreshStatusesRequest :: Show DescribeTrustedAdvisorCheckRefreshStatusesRequest where
  show = genericShow
instance decodeDescribeTrustedAdvisorCheckRefreshStatusesRequest :: Decode DescribeTrustedAdvisorCheckRefreshStatusesRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDescribeTrustedAdvisorCheckRefreshStatusesRequest :: Encode DescribeTrustedAdvisorCheckRefreshStatusesRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DescribeTrustedAdvisorCheckRefreshStatusesRequest from required parameters
newDescribeTrustedAdvisorCheckRefreshStatusesRequest :: StringList -> DescribeTrustedAdvisorCheckRefreshStatusesRequest
newDescribeTrustedAdvisorCheckRefreshStatusesRequest _checkIds = DescribeTrustedAdvisorCheckRefreshStatusesRequest { "checkIds": _checkIds }

-- | Constructs DescribeTrustedAdvisorCheckRefreshStatusesRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeTrustedAdvisorCheckRefreshStatusesRequest' :: StringList -> ( { "checkIds" :: (StringList) } -> {"checkIds" :: (StringList) } ) -> DescribeTrustedAdvisorCheckRefreshStatusesRequest
newDescribeTrustedAdvisorCheckRefreshStatusesRequest' _checkIds customize = (DescribeTrustedAdvisorCheckRefreshStatusesRequest <<< customize) { "checkIds": _checkIds }



-- | <p>The statuses of the Trusted Advisor checks returned by the <a>DescribeTrustedAdvisorCheckRefreshStatuses</a> operation.</p>
newtype DescribeTrustedAdvisorCheckRefreshStatusesResponse = DescribeTrustedAdvisorCheckRefreshStatusesResponse 
  { "statuses" :: (TrustedAdvisorCheckRefreshStatusList)
  }
derive instance newtypeDescribeTrustedAdvisorCheckRefreshStatusesResponse :: Newtype DescribeTrustedAdvisorCheckRefreshStatusesResponse _
derive instance repGenericDescribeTrustedAdvisorCheckRefreshStatusesResponse :: Generic DescribeTrustedAdvisorCheckRefreshStatusesResponse _
instance showDescribeTrustedAdvisorCheckRefreshStatusesResponse :: Show DescribeTrustedAdvisorCheckRefreshStatusesResponse where
  show = genericShow
instance decodeDescribeTrustedAdvisorCheckRefreshStatusesResponse :: Decode DescribeTrustedAdvisorCheckRefreshStatusesResponse where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDescribeTrustedAdvisorCheckRefreshStatusesResponse :: Encode DescribeTrustedAdvisorCheckRefreshStatusesResponse where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DescribeTrustedAdvisorCheckRefreshStatusesResponse from required parameters
newDescribeTrustedAdvisorCheckRefreshStatusesResponse :: TrustedAdvisorCheckRefreshStatusList -> DescribeTrustedAdvisorCheckRefreshStatusesResponse
newDescribeTrustedAdvisorCheckRefreshStatusesResponse _statuses = DescribeTrustedAdvisorCheckRefreshStatusesResponse { "statuses": _statuses }

-- | Constructs DescribeTrustedAdvisorCheckRefreshStatusesResponse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeTrustedAdvisorCheckRefreshStatusesResponse' :: TrustedAdvisorCheckRefreshStatusList -> ( { "statuses" :: (TrustedAdvisorCheckRefreshStatusList) } -> {"statuses" :: (TrustedAdvisorCheckRefreshStatusList) } ) -> DescribeTrustedAdvisorCheckRefreshStatusesResponse
newDescribeTrustedAdvisorCheckRefreshStatusesResponse' _statuses customize = (DescribeTrustedAdvisorCheckRefreshStatusesResponse <<< customize) { "statuses": _statuses }



-- | <p/>
newtype DescribeTrustedAdvisorCheckResultRequest = DescribeTrustedAdvisorCheckResultRequest 
  { "checkId" :: (String)
  , "language" :: NullOrUndefined.NullOrUndefined (String)
  }
derive instance newtypeDescribeTrustedAdvisorCheckResultRequest :: Newtype DescribeTrustedAdvisorCheckResultRequest _
derive instance repGenericDescribeTrustedAdvisorCheckResultRequest :: Generic DescribeTrustedAdvisorCheckResultRequest _
instance showDescribeTrustedAdvisorCheckResultRequest :: Show DescribeTrustedAdvisorCheckResultRequest where
  show = genericShow
instance decodeDescribeTrustedAdvisorCheckResultRequest :: Decode DescribeTrustedAdvisorCheckResultRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDescribeTrustedAdvisorCheckResultRequest :: Encode DescribeTrustedAdvisorCheckResultRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DescribeTrustedAdvisorCheckResultRequest from required parameters
newDescribeTrustedAdvisorCheckResultRequest :: String -> DescribeTrustedAdvisorCheckResultRequest
newDescribeTrustedAdvisorCheckResultRequest _checkId = DescribeTrustedAdvisorCheckResultRequest { "checkId": _checkId, "language": (NullOrUndefined Nothing) }

-- | Constructs DescribeTrustedAdvisorCheckResultRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeTrustedAdvisorCheckResultRequest' :: String -> ( { "checkId" :: (String) , "language" :: NullOrUndefined.NullOrUndefined (String) } -> {"checkId" :: (String) , "language" :: NullOrUndefined.NullOrUndefined (String) } ) -> DescribeTrustedAdvisorCheckResultRequest
newDescribeTrustedAdvisorCheckResultRequest' _checkId customize = (DescribeTrustedAdvisorCheckResultRequest <<< customize) { "checkId": _checkId, "language": (NullOrUndefined Nothing) }



-- | <p>The result of the Trusted Advisor check returned by the <a>DescribeTrustedAdvisorCheckResult</a> operation.</p>
newtype DescribeTrustedAdvisorCheckResultResponse = DescribeTrustedAdvisorCheckResultResponse 
  { "result" :: NullOrUndefined.NullOrUndefined (TrustedAdvisorCheckResult)
  }
derive instance newtypeDescribeTrustedAdvisorCheckResultResponse :: Newtype DescribeTrustedAdvisorCheckResultResponse _
derive instance repGenericDescribeTrustedAdvisorCheckResultResponse :: Generic DescribeTrustedAdvisorCheckResultResponse _
instance showDescribeTrustedAdvisorCheckResultResponse :: Show DescribeTrustedAdvisorCheckResultResponse where
  show = genericShow
instance decodeDescribeTrustedAdvisorCheckResultResponse :: Decode DescribeTrustedAdvisorCheckResultResponse where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDescribeTrustedAdvisorCheckResultResponse :: Encode DescribeTrustedAdvisorCheckResultResponse where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DescribeTrustedAdvisorCheckResultResponse from required parameters
newDescribeTrustedAdvisorCheckResultResponse :: DescribeTrustedAdvisorCheckResultResponse
newDescribeTrustedAdvisorCheckResultResponse  = DescribeTrustedAdvisorCheckResultResponse { "result": (NullOrUndefined Nothing) }

-- | Constructs DescribeTrustedAdvisorCheckResultResponse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeTrustedAdvisorCheckResultResponse' :: ( { "result" :: NullOrUndefined.NullOrUndefined (TrustedAdvisorCheckResult) } -> {"result" :: NullOrUndefined.NullOrUndefined (TrustedAdvisorCheckResult) } ) -> DescribeTrustedAdvisorCheckResultResponse
newDescribeTrustedAdvisorCheckResultResponse'  customize = (DescribeTrustedAdvisorCheckResultResponse <<< customize) { "result": (NullOrUndefined Nothing) }



-- | <p/>
newtype DescribeTrustedAdvisorCheckSummariesRequest = DescribeTrustedAdvisorCheckSummariesRequest 
  { "checkIds" :: (StringList)
  }
derive instance newtypeDescribeTrustedAdvisorCheckSummariesRequest :: Newtype DescribeTrustedAdvisorCheckSummariesRequest _
derive instance repGenericDescribeTrustedAdvisorCheckSummariesRequest :: Generic DescribeTrustedAdvisorCheckSummariesRequest _
instance showDescribeTrustedAdvisorCheckSummariesRequest :: Show DescribeTrustedAdvisorCheckSummariesRequest where
  show = genericShow
instance decodeDescribeTrustedAdvisorCheckSummariesRequest :: Decode DescribeTrustedAdvisorCheckSummariesRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDescribeTrustedAdvisorCheckSummariesRequest :: Encode DescribeTrustedAdvisorCheckSummariesRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DescribeTrustedAdvisorCheckSummariesRequest from required parameters
newDescribeTrustedAdvisorCheckSummariesRequest :: StringList -> DescribeTrustedAdvisorCheckSummariesRequest
newDescribeTrustedAdvisorCheckSummariesRequest _checkIds = DescribeTrustedAdvisorCheckSummariesRequest { "checkIds": _checkIds }

-- | Constructs DescribeTrustedAdvisorCheckSummariesRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeTrustedAdvisorCheckSummariesRequest' :: StringList -> ( { "checkIds" :: (StringList) } -> {"checkIds" :: (StringList) } ) -> DescribeTrustedAdvisorCheckSummariesRequest
newDescribeTrustedAdvisorCheckSummariesRequest' _checkIds customize = (DescribeTrustedAdvisorCheckSummariesRequest <<< customize) { "checkIds": _checkIds }



-- | <p>The summaries of the Trusted Advisor checks returned by the <a>DescribeTrustedAdvisorCheckSummaries</a> operation.</p>
newtype DescribeTrustedAdvisorCheckSummariesResponse = DescribeTrustedAdvisorCheckSummariesResponse 
  { "summaries" :: (TrustedAdvisorCheckSummaryList)
  }
derive instance newtypeDescribeTrustedAdvisorCheckSummariesResponse :: Newtype DescribeTrustedAdvisorCheckSummariesResponse _
derive instance repGenericDescribeTrustedAdvisorCheckSummariesResponse :: Generic DescribeTrustedAdvisorCheckSummariesResponse _
instance showDescribeTrustedAdvisorCheckSummariesResponse :: Show DescribeTrustedAdvisorCheckSummariesResponse where
  show = genericShow
instance decodeDescribeTrustedAdvisorCheckSummariesResponse :: Decode DescribeTrustedAdvisorCheckSummariesResponse where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDescribeTrustedAdvisorCheckSummariesResponse :: Encode DescribeTrustedAdvisorCheckSummariesResponse where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DescribeTrustedAdvisorCheckSummariesResponse from required parameters
newDescribeTrustedAdvisorCheckSummariesResponse :: TrustedAdvisorCheckSummaryList -> DescribeTrustedAdvisorCheckSummariesResponse
newDescribeTrustedAdvisorCheckSummariesResponse _summaries = DescribeTrustedAdvisorCheckSummariesResponse { "summaries": _summaries }

-- | Constructs DescribeTrustedAdvisorCheckSummariesResponse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeTrustedAdvisorCheckSummariesResponse' :: TrustedAdvisorCheckSummaryList -> ( { "summaries" :: (TrustedAdvisorCheckSummaryList) } -> {"summaries" :: (TrustedAdvisorCheckSummaryList) } ) -> DescribeTrustedAdvisorCheckSummariesResponse
newDescribeTrustedAdvisorCheckSummariesResponse' _summaries customize = (DescribeTrustedAdvisorCheckSummariesResponse <<< customize) { "summaries": _summaries }



-- | <p/>
newtype DescribeTrustedAdvisorChecksRequest = DescribeTrustedAdvisorChecksRequest 
  { "language" :: (String)
  }
derive instance newtypeDescribeTrustedAdvisorChecksRequest :: Newtype DescribeTrustedAdvisorChecksRequest _
derive instance repGenericDescribeTrustedAdvisorChecksRequest :: Generic DescribeTrustedAdvisorChecksRequest _
instance showDescribeTrustedAdvisorChecksRequest :: Show DescribeTrustedAdvisorChecksRequest where
  show = genericShow
instance decodeDescribeTrustedAdvisorChecksRequest :: Decode DescribeTrustedAdvisorChecksRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDescribeTrustedAdvisorChecksRequest :: Encode DescribeTrustedAdvisorChecksRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DescribeTrustedAdvisorChecksRequest from required parameters
newDescribeTrustedAdvisorChecksRequest :: String -> DescribeTrustedAdvisorChecksRequest
newDescribeTrustedAdvisorChecksRequest _language = DescribeTrustedAdvisorChecksRequest { "language": _language }

-- | Constructs DescribeTrustedAdvisorChecksRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeTrustedAdvisorChecksRequest' :: String -> ( { "language" :: (String) } -> {"language" :: (String) } ) -> DescribeTrustedAdvisorChecksRequest
newDescribeTrustedAdvisorChecksRequest' _language customize = (DescribeTrustedAdvisorChecksRequest <<< customize) { "language": _language }



-- | <p>Information about the Trusted Advisor checks returned by the <a>DescribeTrustedAdvisorChecks</a> operation.</p>
newtype DescribeTrustedAdvisorChecksResponse = DescribeTrustedAdvisorChecksResponse 
  { "checks" :: (TrustedAdvisorCheckList)
  }
derive instance newtypeDescribeTrustedAdvisorChecksResponse :: Newtype DescribeTrustedAdvisorChecksResponse _
derive instance repGenericDescribeTrustedAdvisorChecksResponse :: Generic DescribeTrustedAdvisorChecksResponse _
instance showDescribeTrustedAdvisorChecksResponse :: Show DescribeTrustedAdvisorChecksResponse where
  show = genericShow
instance decodeDescribeTrustedAdvisorChecksResponse :: Decode DescribeTrustedAdvisorChecksResponse where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDescribeTrustedAdvisorChecksResponse :: Encode DescribeTrustedAdvisorChecksResponse where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DescribeTrustedAdvisorChecksResponse from required parameters
newDescribeTrustedAdvisorChecksResponse :: TrustedAdvisorCheckList -> DescribeTrustedAdvisorChecksResponse
newDescribeTrustedAdvisorChecksResponse _checks = DescribeTrustedAdvisorChecksResponse { "checks": _checks }

-- | Constructs DescribeTrustedAdvisorChecksResponse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeTrustedAdvisorChecksResponse' :: TrustedAdvisorCheckList -> ( { "checks" :: (TrustedAdvisorCheckList) } -> {"checks" :: (TrustedAdvisorCheckList) } ) -> DescribeTrustedAdvisorChecksResponse
newDescribeTrustedAdvisorChecksResponse' _checks customize = (DescribeTrustedAdvisorChecksResponse <<< customize) { "checks": _checks }



newtype DisplayId = DisplayId String
derive instance newtypeDisplayId :: Newtype DisplayId _
derive instance repGenericDisplayId :: Generic DisplayId _
instance showDisplayId :: Show DisplayId where
  show = genericShow
instance decodeDisplayId :: Decode DisplayId where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDisplayId :: Encode DisplayId where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype ErrorMessage = ErrorMessage String
derive instance newtypeErrorMessage :: Newtype ErrorMessage _
derive instance repGenericErrorMessage :: Generic ErrorMessage _
instance showErrorMessage :: Show ErrorMessage where
  show = genericShow
instance decodeErrorMessage :: Decode ErrorMessage where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeErrorMessage :: Encode ErrorMessage where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype ExpiryTime = ExpiryTime String
derive instance newtypeExpiryTime :: Newtype ExpiryTime _
derive instance repGenericExpiryTime :: Generic ExpiryTime _
instance showExpiryTime :: Show ExpiryTime where
  show = genericShow
instance decodeExpiryTime :: Decode ExpiryTime where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeExpiryTime :: Encode ExpiryTime where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype FileName = FileName String
derive instance newtypeFileName :: Newtype FileName _
derive instance repGenericFileName :: Generic FileName _
instance showFileName :: Show FileName where
  show = genericShow
instance decodeFileName :: Decode FileName where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeFileName :: Encode FileName where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype IncludeCommunications = IncludeCommunications Boolean
derive instance newtypeIncludeCommunications :: Newtype IncludeCommunications _
derive instance repGenericIncludeCommunications :: Generic IncludeCommunications _
instance showIncludeCommunications :: Show IncludeCommunications where
  show = genericShow
instance decodeIncludeCommunications :: Decode IncludeCommunications where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeIncludeCommunications :: Encode IncludeCommunications where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype IncludeResolvedCases = IncludeResolvedCases Boolean
derive instance newtypeIncludeResolvedCases :: Newtype IncludeResolvedCases _
derive instance repGenericIncludeResolvedCases :: Generic IncludeResolvedCases _
instance showIncludeResolvedCases :: Show IncludeResolvedCases where
  show = genericShow
instance decodeIncludeResolvedCases :: Decode IncludeResolvedCases where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeIncludeResolvedCases :: Encode IncludeResolvedCases where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>An internal server error occurred.</p>
newtype InternalServerError = InternalServerError 
  { "message" :: NullOrUndefined.NullOrUndefined (ErrorMessage)
  }
derive instance newtypeInternalServerError :: Newtype InternalServerError _
derive instance repGenericInternalServerError :: Generic InternalServerError _
instance showInternalServerError :: Show InternalServerError where
  show = genericShow
instance decodeInternalServerError :: Decode InternalServerError where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeInternalServerError :: Encode InternalServerError where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs InternalServerError from required parameters
newInternalServerError :: InternalServerError
newInternalServerError  = InternalServerError { "message": (NullOrUndefined Nothing) }

-- | Constructs InternalServerError's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newInternalServerError' :: ( { "message" :: NullOrUndefined.NullOrUndefined (ErrorMessage) } -> {"message" :: NullOrUndefined.NullOrUndefined (ErrorMessage) } ) -> InternalServerError
newInternalServerError'  customize = (InternalServerError <<< customize) { "message": (NullOrUndefined Nothing) }



newtype IssueType = IssueType String
derive instance newtypeIssueType :: Newtype IssueType _
derive instance repGenericIssueType :: Generic IssueType _
instance showIssueType :: Show IssueType where
  show = genericShow
instance decodeIssueType :: Decode IssueType where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeIssueType :: Encode IssueType where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype Language = Language String
derive instance newtypeLanguage :: Newtype Language _
derive instance repGenericLanguage :: Generic Language _
instance showLanguage :: Show Language where
  show = genericShow
instance decodeLanguage :: Decode Language where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeLanguage :: Encode Language where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype MaxResults = MaxResults Int
derive instance newtypeMaxResults :: Newtype MaxResults _
derive instance repGenericMaxResults :: Generic MaxResults _
instance showMaxResults :: Show MaxResults where
  show = genericShow
instance decodeMaxResults :: Decode MaxResults where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeMaxResults :: Encode MaxResults where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype NextToken = NextToken String
derive instance newtypeNextToken :: Newtype NextToken _
derive instance repGenericNextToken :: Generic NextToken _
instance showNextToken :: Show NextToken where
  show = genericShow
instance decodeNextToken :: Decode NextToken where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeNextToken :: Encode NextToken where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>The five most recent communications associated with the case.</p>
newtype RecentCaseCommunications = RecentCaseCommunications 
  { "communications" :: NullOrUndefined.NullOrUndefined (CommunicationList)
  , "nextToken" :: NullOrUndefined.NullOrUndefined (NextToken)
  }
derive instance newtypeRecentCaseCommunications :: Newtype RecentCaseCommunications _
derive instance repGenericRecentCaseCommunications :: Generic RecentCaseCommunications _
instance showRecentCaseCommunications :: Show RecentCaseCommunications where
  show = genericShow
instance decodeRecentCaseCommunications :: Decode RecentCaseCommunications where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeRecentCaseCommunications :: Encode RecentCaseCommunications where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs RecentCaseCommunications from required parameters
newRecentCaseCommunications :: RecentCaseCommunications
newRecentCaseCommunications  = RecentCaseCommunications { "communications": (NullOrUndefined Nothing), "nextToken": (NullOrUndefined Nothing) }

-- | Constructs RecentCaseCommunications's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newRecentCaseCommunications' :: ( { "communications" :: NullOrUndefined.NullOrUndefined (CommunicationList) , "nextToken" :: NullOrUndefined.NullOrUndefined (NextToken) } -> {"communications" :: NullOrUndefined.NullOrUndefined (CommunicationList) , "nextToken" :: NullOrUndefined.NullOrUndefined (NextToken) } ) -> RecentCaseCommunications
newRecentCaseCommunications'  customize = (RecentCaseCommunications <<< customize) { "communications": (NullOrUndefined Nothing), "nextToken": (NullOrUndefined Nothing) }



-- | <p/>
newtype RefreshTrustedAdvisorCheckRequest = RefreshTrustedAdvisorCheckRequest 
  { "checkId" :: (String)
  }
derive instance newtypeRefreshTrustedAdvisorCheckRequest :: Newtype RefreshTrustedAdvisorCheckRequest _
derive instance repGenericRefreshTrustedAdvisorCheckRequest :: Generic RefreshTrustedAdvisorCheckRequest _
instance showRefreshTrustedAdvisorCheckRequest :: Show RefreshTrustedAdvisorCheckRequest where
  show = genericShow
instance decodeRefreshTrustedAdvisorCheckRequest :: Decode RefreshTrustedAdvisorCheckRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeRefreshTrustedAdvisorCheckRequest :: Encode RefreshTrustedAdvisorCheckRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs RefreshTrustedAdvisorCheckRequest from required parameters
newRefreshTrustedAdvisorCheckRequest :: String -> RefreshTrustedAdvisorCheckRequest
newRefreshTrustedAdvisorCheckRequest _checkId = RefreshTrustedAdvisorCheckRequest { "checkId": _checkId }

-- | Constructs RefreshTrustedAdvisorCheckRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newRefreshTrustedAdvisorCheckRequest' :: String -> ( { "checkId" :: (String) } -> {"checkId" :: (String) } ) -> RefreshTrustedAdvisorCheckRequest
newRefreshTrustedAdvisorCheckRequest' _checkId customize = (RefreshTrustedAdvisorCheckRequest <<< customize) { "checkId": _checkId }



-- | <p>The current refresh status of a Trusted Advisor check.</p>
newtype RefreshTrustedAdvisorCheckResponse = RefreshTrustedAdvisorCheckResponse 
  { "status" :: (TrustedAdvisorCheckRefreshStatus)
  }
derive instance newtypeRefreshTrustedAdvisorCheckResponse :: Newtype RefreshTrustedAdvisorCheckResponse _
derive instance repGenericRefreshTrustedAdvisorCheckResponse :: Generic RefreshTrustedAdvisorCheckResponse _
instance showRefreshTrustedAdvisorCheckResponse :: Show RefreshTrustedAdvisorCheckResponse where
  show = genericShow
instance decodeRefreshTrustedAdvisorCheckResponse :: Decode RefreshTrustedAdvisorCheckResponse where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeRefreshTrustedAdvisorCheckResponse :: Encode RefreshTrustedAdvisorCheckResponse where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs RefreshTrustedAdvisorCheckResponse from required parameters
newRefreshTrustedAdvisorCheckResponse :: TrustedAdvisorCheckRefreshStatus -> RefreshTrustedAdvisorCheckResponse
newRefreshTrustedAdvisorCheckResponse _status = RefreshTrustedAdvisorCheckResponse { "status": _status }

-- | Constructs RefreshTrustedAdvisorCheckResponse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newRefreshTrustedAdvisorCheckResponse' :: TrustedAdvisorCheckRefreshStatus -> ( { "status" :: (TrustedAdvisorCheckRefreshStatus) } -> {"status" :: (TrustedAdvisorCheckRefreshStatus) } ) -> RefreshTrustedAdvisorCheckResponse
newRefreshTrustedAdvisorCheckResponse' _status customize = (RefreshTrustedAdvisorCheckResponse <<< customize) { "status": _status }



-- | <p/>
newtype ResolveCaseRequest = ResolveCaseRequest 
  { "caseId" :: NullOrUndefined.NullOrUndefined (CaseId)
  }
derive instance newtypeResolveCaseRequest :: Newtype ResolveCaseRequest _
derive instance repGenericResolveCaseRequest :: Generic ResolveCaseRequest _
instance showResolveCaseRequest :: Show ResolveCaseRequest where
  show = genericShow
instance decodeResolveCaseRequest :: Decode ResolveCaseRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeResolveCaseRequest :: Encode ResolveCaseRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs ResolveCaseRequest from required parameters
newResolveCaseRequest :: ResolveCaseRequest
newResolveCaseRequest  = ResolveCaseRequest { "caseId": (NullOrUndefined Nothing) }

-- | Constructs ResolveCaseRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newResolveCaseRequest' :: ( { "caseId" :: NullOrUndefined.NullOrUndefined (CaseId) } -> {"caseId" :: NullOrUndefined.NullOrUndefined (CaseId) } ) -> ResolveCaseRequest
newResolveCaseRequest'  customize = (ResolveCaseRequest <<< customize) { "caseId": (NullOrUndefined Nothing) }



-- | <p>The status of the case returned by the <a>ResolveCase</a> operation.</p>
newtype ResolveCaseResponse = ResolveCaseResponse 
  { "initialCaseStatus" :: NullOrUndefined.NullOrUndefined (CaseStatus)
  , "finalCaseStatus" :: NullOrUndefined.NullOrUndefined (CaseStatus)
  }
derive instance newtypeResolveCaseResponse :: Newtype ResolveCaseResponse _
derive instance repGenericResolveCaseResponse :: Generic ResolveCaseResponse _
instance showResolveCaseResponse :: Show ResolveCaseResponse where
  show = genericShow
instance decodeResolveCaseResponse :: Decode ResolveCaseResponse where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeResolveCaseResponse :: Encode ResolveCaseResponse where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs ResolveCaseResponse from required parameters
newResolveCaseResponse :: ResolveCaseResponse
newResolveCaseResponse  = ResolveCaseResponse { "finalCaseStatus": (NullOrUndefined Nothing), "initialCaseStatus": (NullOrUndefined Nothing) }

-- | Constructs ResolveCaseResponse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newResolveCaseResponse' :: ( { "initialCaseStatus" :: NullOrUndefined.NullOrUndefined (CaseStatus) , "finalCaseStatus" :: NullOrUndefined.NullOrUndefined (CaseStatus) } -> {"initialCaseStatus" :: NullOrUndefined.NullOrUndefined (CaseStatus) , "finalCaseStatus" :: NullOrUndefined.NullOrUndefined (CaseStatus) } ) -> ResolveCaseResponse
newResolveCaseResponse'  customize = (ResolveCaseResponse <<< customize) { "finalCaseStatus": (NullOrUndefined Nothing), "initialCaseStatus": (NullOrUndefined Nothing) }



newtype Result = Result Boolean
derive instance newtypeResult :: Newtype Result _
derive instance repGenericResult :: Generic Result _
instance showResult :: Show Result where
  show = genericShow
instance decodeResult :: Decode Result where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeResult :: Encode Result where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>Information about an AWS service returned by the <a>DescribeServices</a> operation. </p>
newtype Service = Service 
  { "code" :: NullOrUndefined.NullOrUndefined (ServiceCode)
  , "name" :: NullOrUndefined.NullOrUndefined (ServiceName)
  , "categories" :: NullOrUndefined.NullOrUndefined (CategoryList)
  }
derive instance newtypeService :: Newtype Service _
derive instance repGenericService :: Generic Service _
instance showService :: Show Service where
  show = genericShow
instance decodeService :: Decode Service where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeService :: Encode Service where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs Service from required parameters
newService :: Service
newService  = Service { "categories": (NullOrUndefined Nothing), "code": (NullOrUndefined Nothing), "name": (NullOrUndefined Nothing) }

-- | Constructs Service's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newService' :: ( { "code" :: NullOrUndefined.NullOrUndefined (ServiceCode) , "name" :: NullOrUndefined.NullOrUndefined (ServiceName) , "categories" :: NullOrUndefined.NullOrUndefined (CategoryList) } -> {"code" :: NullOrUndefined.NullOrUndefined (ServiceCode) , "name" :: NullOrUndefined.NullOrUndefined (ServiceName) , "categories" :: NullOrUndefined.NullOrUndefined (CategoryList) } ) -> Service
newService'  customize = (Service <<< customize) { "categories": (NullOrUndefined Nothing), "code": (NullOrUndefined Nothing), "name": (NullOrUndefined Nothing) }



newtype ServiceCode = ServiceCode String
derive instance newtypeServiceCode :: Newtype ServiceCode _
derive instance repGenericServiceCode :: Generic ServiceCode _
instance showServiceCode :: Show ServiceCode where
  show = genericShow
instance decodeServiceCode :: Decode ServiceCode where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeServiceCode :: Encode ServiceCode where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype ServiceCodeList = ServiceCodeList (Array ServiceCode)
derive instance newtypeServiceCodeList :: Newtype ServiceCodeList _
derive instance repGenericServiceCodeList :: Generic ServiceCodeList _
instance showServiceCodeList :: Show ServiceCodeList where
  show = genericShow
instance decodeServiceCodeList :: Decode ServiceCodeList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeServiceCodeList :: Encode ServiceCodeList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype ServiceList = ServiceList (Array Service)
derive instance newtypeServiceList :: Newtype ServiceList _
derive instance repGenericServiceList :: Generic ServiceList _
instance showServiceList :: Show ServiceList where
  show = genericShow
instance decodeServiceList :: Decode ServiceList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeServiceList :: Encode ServiceList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype ServiceName = ServiceName String
derive instance newtypeServiceName :: Newtype ServiceName _
derive instance repGenericServiceName :: Generic ServiceName _
instance showServiceName :: Show ServiceName where
  show = genericShow
instance decodeServiceName :: Decode ServiceName where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeServiceName :: Encode ServiceName where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype SeverityCode = SeverityCode String
derive instance newtypeSeverityCode :: Newtype SeverityCode _
derive instance repGenericSeverityCode :: Generic SeverityCode _
instance showSeverityCode :: Show SeverityCode where
  show = genericShow
instance decodeSeverityCode :: Decode SeverityCode where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeSeverityCode :: Encode SeverityCode where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>A code and name pair that represent a severity level that can be applied to a support case.</p>
newtype SeverityLevel = SeverityLevel 
  { "code" :: NullOrUndefined.NullOrUndefined (SeverityLevelCode)
  , "name" :: NullOrUndefined.NullOrUndefined (SeverityLevelName)
  }
derive instance newtypeSeverityLevel :: Newtype SeverityLevel _
derive instance repGenericSeverityLevel :: Generic SeverityLevel _
instance showSeverityLevel :: Show SeverityLevel where
  show = genericShow
instance decodeSeverityLevel :: Decode SeverityLevel where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeSeverityLevel :: Encode SeverityLevel where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs SeverityLevel from required parameters
newSeverityLevel :: SeverityLevel
newSeverityLevel  = SeverityLevel { "code": (NullOrUndefined Nothing), "name": (NullOrUndefined Nothing) }

-- | Constructs SeverityLevel's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newSeverityLevel' :: ( { "code" :: NullOrUndefined.NullOrUndefined (SeverityLevelCode) , "name" :: NullOrUndefined.NullOrUndefined (SeverityLevelName) } -> {"code" :: NullOrUndefined.NullOrUndefined (SeverityLevelCode) , "name" :: NullOrUndefined.NullOrUndefined (SeverityLevelName) } ) -> SeverityLevel
newSeverityLevel'  customize = (SeverityLevel <<< customize) { "code": (NullOrUndefined Nothing), "name": (NullOrUndefined Nothing) }



newtype SeverityLevelCode = SeverityLevelCode String
derive instance newtypeSeverityLevelCode :: Newtype SeverityLevelCode _
derive instance repGenericSeverityLevelCode :: Generic SeverityLevelCode _
instance showSeverityLevelCode :: Show SeverityLevelCode where
  show = genericShow
instance decodeSeverityLevelCode :: Decode SeverityLevelCode where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeSeverityLevelCode :: Encode SeverityLevelCode where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype SeverityLevelName = SeverityLevelName String
derive instance newtypeSeverityLevelName :: Newtype SeverityLevelName _
derive instance repGenericSeverityLevelName :: Generic SeverityLevelName _
instance showSeverityLevelName :: Show SeverityLevelName where
  show = genericShow
instance decodeSeverityLevelName :: Decode SeverityLevelName where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeSeverityLevelName :: Encode SeverityLevelName where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype SeverityLevelsList = SeverityLevelsList (Array SeverityLevel)
derive instance newtypeSeverityLevelsList :: Newtype SeverityLevelsList _
derive instance repGenericSeverityLevelsList :: Generic SeverityLevelsList _
instance showSeverityLevelsList :: Show SeverityLevelsList where
  show = genericShow
instance decodeSeverityLevelsList :: Decode SeverityLevelsList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeSeverityLevelsList :: Encode SeverityLevelsList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype Status = Status String
derive instance newtypeStatus :: Newtype Status _
derive instance repGenericStatus :: Generic Status _
instance showStatus :: Show Status where
  show = genericShow
instance decodeStatus :: Decode Status where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeStatus :: Encode Status where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype StringList = StringList (Array String)
derive instance newtypeStringList :: Newtype StringList _
derive instance repGenericStringList :: Generic StringList _
instance showStringList :: Show StringList where
  show = genericShow
instance decodeStringList :: Decode StringList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeStringList :: Encode StringList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype Subject = Subject String
derive instance newtypeSubject :: Newtype Subject _
derive instance repGenericSubject :: Generic Subject _
instance showSubject :: Show Subject where
  show = genericShow
instance decodeSubject :: Decode Subject where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeSubject :: Encode Subject where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype SubmittedBy = SubmittedBy String
derive instance newtypeSubmittedBy :: Newtype SubmittedBy _
derive instance repGenericSubmittedBy :: Generic SubmittedBy _
instance showSubmittedBy :: Show SubmittedBy where
  show = genericShow
instance decodeSubmittedBy :: Decode SubmittedBy where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeSubmittedBy :: Encode SubmittedBy where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype TimeCreated = TimeCreated String
derive instance newtypeTimeCreated :: Newtype TimeCreated _
derive instance repGenericTimeCreated :: Generic TimeCreated _
instance showTimeCreated :: Show TimeCreated where
  show = genericShow
instance decodeTimeCreated :: Decode TimeCreated where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTimeCreated :: Encode TimeCreated where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>The container for summary information that relates to the category of the Trusted Advisor check.</p>
newtype TrustedAdvisorCategorySpecificSummary = TrustedAdvisorCategorySpecificSummary 
  { "costOptimizing" :: NullOrUndefined.NullOrUndefined (TrustedAdvisorCostOptimizingSummary)
  }
derive instance newtypeTrustedAdvisorCategorySpecificSummary :: Newtype TrustedAdvisorCategorySpecificSummary _
derive instance repGenericTrustedAdvisorCategorySpecificSummary :: Generic TrustedAdvisorCategorySpecificSummary _
instance showTrustedAdvisorCategorySpecificSummary :: Show TrustedAdvisorCategorySpecificSummary where
  show = genericShow
instance decodeTrustedAdvisorCategorySpecificSummary :: Decode TrustedAdvisorCategorySpecificSummary where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTrustedAdvisorCategorySpecificSummary :: Encode TrustedAdvisorCategorySpecificSummary where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs TrustedAdvisorCategorySpecificSummary from required parameters
newTrustedAdvisorCategorySpecificSummary :: TrustedAdvisorCategorySpecificSummary
newTrustedAdvisorCategorySpecificSummary  = TrustedAdvisorCategorySpecificSummary { "costOptimizing": (NullOrUndefined Nothing) }

-- | Constructs TrustedAdvisorCategorySpecificSummary's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newTrustedAdvisorCategorySpecificSummary' :: ( { "costOptimizing" :: NullOrUndefined.NullOrUndefined (TrustedAdvisorCostOptimizingSummary) } -> {"costOptimizing" :: NullOrUndefined.NullOrUndefined (TrustedAdvisorCostOptimizingSummary) } ) -> TrustedAdvisorCategorySpecificSummary
newTrustedAdvisorCategorySpecificSummary'  customize = (TrustedAdvisorCategorySpecificSummary <<< customize) { "costOptimizing": (NullOrUndefined Nothing) }



-- | <p>The description and metadata for a Trusted Advisor check.</p>
newtype TrustedAdvisorCheckDescription = TrustedAdvisorCheckDescription 
  { "id" :: (String)
  , "name" :: (String)
  , "description" :: (String)
  , "category" :: (String)
  , "metadata" :: (StringList)
  }
derive instance newtypeTrustedAdvisorCheckDescription :: Newtype TrustedAdvisorCheckDescription _
derive instance repGenericTrustedAdvisorCheckDescription :: Generic TrustedAdvisorCheckDescription _
instance showTrustedAdvisorCheckDescription :: Show TrustedAdvisorCheckDescription where
  show = genericShow
instance decodeTrustedAdvisorCheckDescription :: Decode TrustedAdvisorCheckDescription where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTrustedAdvisorCheckDescription :: Encode TrustedAdvisorCheckDescription where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs TrustedAdvisorCheckDescription from required parameters
newTrustedAdvisorCheckDescription :: String -> String -> String -> StringList -> String -> TrustedAdvisorCheckDescription
newTrustedAdvisorCheckDescription _category _description _id _metadata _name = TrustedAdvisorCheckDescription { "category": _category, "description": _description, "id": _id, "metadata": _metadata, "name": _name }

-- | Constructs TrustedAdvisorCheckDescription's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newTrustedAdvisorCheckDescription' :: String -> String -> String -> StringList -> String -> ( { "id" :: (String) , "name" :: (String) , "description" :: (String) , "category" :: (String) , "metadata" :: (StringList) } -> {"id" :: (String) , "name" :: (String) , "description" :: (String) , "category" :: (String) , "metadata" :: (StringList) } ) -> TrustedAdvisorCheckDescription
newTrustedAdvisorCheckDescription' _category _description _id _metadata _name customize = (TrustedAdvisorCheckDescription <<< customize) { "category": _category, "description": _description, "id": _id, "metadata": _metadata, "name": _name }



newtype TrustedAdvisorCheckList = TrustedAdvisorCheckList (Array TrustedAdvisorCheckDescription)
derive instance newtypeTrustedAdvisorCheckList :: Newtype TrustedAdvisorCheckList _
derive instance repGenericTrustedAdvisorCheckList :: Generic TrustedAdvisorCheckList _
instance showTrustedAdvisorCheckList :: Show TrustedAdvisorCheckList where
  show = genericShow
instance decodeTrustedAdvisorCheckList :: Decode TrustedAdvisorCheckList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTrustedAdvisorCheckList :: Encode TrustedAdvisorCheckList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>The refresh status of a Trusted Advisor check.</p>
newtype TrustedAdvisorCheckRefreshStatus = TrustedAdvisorCheckRefreshStatus 
  { "checkId" :: (String)
  , "status" :: (String)
  , "millisUntilNextRefreshable" :: (Number)
  }
derive instance newtypeTrustedAdvisorCheckRefreshStatus :: Newtype TrustedAdvisorCheckRefreshStatus _
derive instance repGenericTrustedAdvisorCheckRefreshStatus :: Generic TrustedAdvisorCheckRefreshStatus _
instance showTrustedAdvisorCheckRefreshStatus :: Show TrustedAdvisorCheckRefreshStatus where
  show = genericShow
instance decodeTrustedAdvisorCheckRefreshStatus :: Decode TrustedAdvisorCheckRefreshStatus where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTrustedAdvisorCheckRefreshStatus :: Encode TrustedAdvisorCheckRefreshStatus where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs TrustedAdvisorCheckRefreshStatus from required parameters
newTrustedAdvisorCheckRefreshStatus :: String -> Number -> String -> TrustedAdvisorCheckRefreshStatus
newTrustedAdvisorCheckRefreshStatus _checkId _millisUntilNextRefreshable _status = TrustedAdvisorCheckRefreshStatus { "checkId": _checkId, "millisUntilNextRefreshable": _millisUntilNextRefreshable, "status": _status }

-- | Constructs TrustedAdvisorCheckRefreshStatus's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newTrustedAdvisorCheckRefreshStatus' :: String -> Number -> String -> ( { "checkId" :: (String) , "status" :: (String) , "millisUntilNextRefreshable" :: (Number) } -> {"checkId" :: (String) , "status" :: (String) , "millisUntilNextRefreshable" :: (Number) } ) -> TrustedAdvisorCheckRefreshStatus
newTrustedAdvisorCheckRefreshStatus' _checkId _millisUntilNextRefreshable _status customize = (TrustedAdvisorCheckRefreshStatus <<< customize) { "checkId": _checkId, "millisUntilNextRefreshable": _millisUntilNextRefreshable, "status": _status }



newtype TrustedAdvisorCheckRefreshStatusList = TrustedAdvisorCheckRefreshStatusList (Array TrustedAdvisorCheckRefreshStatus)
derive instance newtypeTrustedAdvisorCheckRefreshStatusList :: Newtype TrustedAdvisorCheckRefreshStatusList _
derive instance repGenericTrustedAdvisorCheckRefreshStatusList :: Generic TrustedAdvisorCheckRefreshStatusList _
instance showTrustedAdvisorCheckRefreshStatusList :: Show TrustedAdvisorCheckRefreshStatusList where
  show = genericShow
instance decodeTrustedAdvisorCheckRefreshStatusList :: Decode TrustedAdvisorCheckRefreshStatusList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTrustedAdvisorCheckRefreshStatusList :: Encode TrustedAdvisorCheckRefreshStatusList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>The results of a Trusted Advisor check returned by <a>DescribeTrustedAdvisorCheckResult</a>.</p>
newtype TrustedAdvisorCheckResult = TrustedAdvisorCheckResult 
  { "checkId" :: (String)
  , "timestamp" :: (String)
  , "status" :: (String)
  , "resourcesSummary" :: (TrustedAdvisorResourcesSummary)
  , "categorySpecificSummary" :: (TrustedAdvisorCategorySpecificSummary)
  , "flaggedResources" :: (TrustedAdvisorResourceDetailList)
  }
derive instance newtypeTrustedAdvisorCheckResult :: Newtype TrustedAdvisorCheckResult _
derive instance repGenericTrustedAdvisorCheckResult :: Generic TrustedAdvisorCheckResult _
instance showTrustedAdvisorCheckResult :: Show TrustedAdvisorCheckResult where
  show = genericShow
instance decodeTrustedAdvisorCheckResult :: Decode TrustedAdvisorCheckResult where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTrustedAdvisorCheckResult :: Encode TrustedAdvisorCheckResult where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs TrustedAdvisorCheckResult from required parameters
newTrustedAdvisorCheckResult :: TrustedAdvisorCategorySpecificSummary -> String -> TrustedAdvisorResourceDetailList -> TrustedAdvisorResourcesSummary -> String -> String -> TrustedAdvisorCheckResult
newTrustedAdvisorCheckResult _categorySpecificSummary _checkId _flaggedResources _resourcesSummary _status _timestamp = TrustedAdvisorCheckResult { "categorySpecificSummary": _categorySpecificSummary, "checkId": _checkId, "flaggedResources": _flaggedResources, "resourcesSummary": _resourcesSummary, "status": _status, "timestamp": _timestamp }

-- | Constructs TrustedAdvisorCheckResult's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newTrustedAdvisorCheckResult' :: TrustedAdvisorCategorySpecificSummary -> String -> TrustedAdvisorResourceDetailList -> TrustedAdvisorResourcesSummary -> String -> String -> ( { "checkId" :: (String) , "timestamp" :: (String) , "status" :: (String) , "resourcesSummary" :: (TrustedAdvisorResourcesSummary) , "categorySpecificSummary" :: (TrustedAdvisorCategorySpecificSummary) , "flaggedResources" :: (TrustedAdvisorResourceDetailList) } -> {"checkId" :: (String) , "timestamp" :: (String) , "status" :: (String) , "resourcesSummary" :: (TrustedAdvisorResourcesSummary) , "categorySpecificSummary" :: (TrustedAdvisorCategorySpecificSummary) , "flaggedResources" :: (TrustedAdvisorResourceDetailList) } ) -> TrustedAdvisorCheckResult
newTrustedAdvisorCheckResult' _categorySpecificSummary _checkId _flaggedResources _resourcesSummary _status _timestamp customize = (TrustedAdvisorCheckResult <<< customize) { "categorySpecificSummary": _categorySpecificSummary, "checkId": _checkId, "flaggedResources": _flaggedResources, "resourcesSummary": _resourcesSummary, "status": _status, "timestamp": _timestamp }



-- | <p>A summary of a Trusted Advisor check result, including the alert status, last refresh, and number of resources examined.</p>
newtype TrustedAdvisorCheckSummary = TrustedAdvisorCheckSummary 
  { "checkId" :: (String)
  , "timestamp" :: (String)
  , "status" :: (String)
  , "hasFlaggedResources" :: NullOrUndefined.NullOrUndefined (Boolean)
  , "resourcesSummary" :: (TrustedAdvisorResourcesSummary)
  , "categorySpecificSummary" :: (TrustedAdvisorCategorySpecificSummary)
  }
derive instance newtypeTrustedAdvisorCheckSummary :: Newtype TrustedAdvisorCheckSummary _
derive instance repGenericTrustedAdvisorCheckSummary :: Generic TrustedAdvisorCheckSummary _
instance showTrustedAdvisorCheckSummary :: Show TrustedAdvisorCheckSummary where
  show = genericShow
instance decodeTrustedAdvisorCheckSummary :: Decode TrustedAdvisorCheckSummary where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTrustedAdvisorCheckSummary :: Encode TrustedAdvisorCheckSummary where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs TrustedAdvisorCheckSummary from required parameters
newTrustedAdvisorCheckSummary :: TrustedAdvisorCategorySpecificSummary -> String -> TrustedAdvisorResourcesSummary -> String -> String -> TrustedAdvisorCheckSummary
newTrustedAdvisorCheckSummary _categorySpecificSummary _checkId _resourcesSummary _status _timestamp = TrustedAdvisorCheckSummary { "categorySpecificSummary": _categorySpecificSummary, "checkId": _checkId, "resourcesSummary": _resourcesSummary, "status": _status, "timestamp": _timestamp, "hasFlaggedResources": (NullOrUndefined Nothing) }

-- | Constructs TrustedAdvisorCheckSummary's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newTrustedAdvisorCheckSummary' :: TrustedAdvisorCategorySpecificSummary -> String -> TrustedAdvisorResourcesSummary -> String -> String -> ( { "checkId" :: (String) , "timestamp" :: (String) , "status" :: (String) , "hasFlaggedResources" :: NullOrUndefined.NullOrUndefined (Boolean) , "resourcesSummary" :: (TrustedAdvisorResourcesSummary) , "categorySpecificSummary" :: (TrustedAdvisorCategorySpecificSummary) } -> {"checkId" :: (String) , "timestamp" :: (String) , "status" :: (String) , "hasFlaggedResources" :: NullOrUndefined.NullOrUndefined (Boolean) , "resourcesSummary" :: (TrustedAdvisorResourcesSummary) , "categorySpecificSummary" :: (TrustedAdvisorCategorySpecificSummary) } ) -> TrustedAdvisorCheckSummary
newTrustedAdvisorCheckSummary' _categorySpecificSummary _checkId _resourcesSummary _status _timestamp customize = (TrustedAdvisorCheckSummary <<< customize) { "categorySpecificSummary": _categorySpecificSummary, "checkId": _checkId, "resourcesSummary": _resourcesSummary, "status": _status, "timestamp": _timestamp, "hasFlaggedResources": (NullOrUndefined Nothing) }



newtype TrustedAdvisorCheckSummaryList = TrustedAdvisorCheckSummaryList (Array TrustedAdvisorCheckSummary)
derive instance newtypeTrustedAdvisorCheckSummaryList :: Newtype TrustedAdvisorCheckSummaryList _
derive instance repGenericTrustedAdvisorCheckSummaryList :: Generic TrustedAdvisorCheckSummaryList _
instance showTrustedAdvisorCheckSummaryList :: Show TrustedAdvisorCheckSummaryList where
  show = genericShow
instance decodeTrustedAdvisorCheckSummaryList :: Decode TrustedAdvisorCheckSummaryList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTrustedAdvisorCheckSummaryList :: Encode TrustedAdvisorCheckSummaryList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>The estimated cost savings that might be realized if the recommended actions are taken.</p>
newtype TrustedAdvisorCostOptimizingSummary = TrustedAdvisorCostOptimizingSummary 
  { "estimatedMonthlySavings" :: (Number)
  , "estimatedPercentMonthlySavings" :: (Number)
  }
derive instance newtypeTrustedAdvisorCostOptimizingSummary :: Newtype TrustedAdvisorCostOptimizingSummary _
derive instance repGenericTrustedAdvisorCostOptimizingSummary :: Generic TrustedAdvisorCostOptimizingSummary _
instance showTrustedAdvisorCostOptimizingSummary :: Show TrustedAdvisorCostOptimizingSummary where
  show = genericShow
instance decodeTrustedAdvisorCostOptimizingSummary :: Decode TrustedAdvisorCostOptimizingSummary where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTrustedAdvisorCostOptimizingSummary :: Encode TrustedAdvisorCostOptimizingSummary where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs TrustedAdvisorCostOptimizingSummary from required parameters
newTrustedAdvisorCostOptimizingSummary :: Number -> Number -> TrustedAdvisorCostOptimizingSummary
newTrustedAdvisorCostOptimizingSummary _estimatedMonthlySavings _estimatedPercentMonthlySavings = TrustedAdvisorCostOptimizingSummary { "estimatedMonthlySavings": _estimatedMonthlySavings, "estimatedPercentMonthlySavings": _estimatedPercentMonthlySavings }

-- | Constructs TrustedAdvisorCostOptimizingSummary's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newTrustedAdvisorCostOptimizingSummary' :: Number -> Number -> ( { "estimatedMonthlySavings" :: (Number) , "estimatedPercentMonthlySavings" :: (Number) } -> {"estimatedMonthlySavings" :: (Number) , "estimatedPercentMonthlySavings" :: (Number) } ) -> TrustedAdvisorCostOptimizingSummary
newTrustedAdvisorCostOptimizingSummary' _estimatedMonthlySavings _estimatedPercentMonthlySavings customize = (TrustedAdvisorCostOptimizingSummary <<< customize) { "estimatedMonthlySavings": _estimatedMonthlySavings, "estimatedPercentMonthlySavings": _estimatedPercentMonthlySavings }



-- | <p>Contains information about a resource identified by a Trusted Advisor check.</p>
newtype TrustedAdvisorResourceDetail = TrustedAdvisorResourceDetail 
  { "status" :: (String)
  , "region" :: NullOrUndefined.NullOrUndefined (String)
  , "resourceId" :: (String)
  , "isSuppressed" :: NullOrUndefined.NullOrUndefined (Boolean)
  , "metadata" :: (StringList)
  }
derive instance newtypeTrustedAdvisorResourceDetail :: Newtype TrustedAdvisorResourceDetail _
derive instance repGenericTrustedAdvisorResourceDetail :: Generic TrustedAdvisorResourceDetail _
instance showTrustedAdvisorResourceDetail :: Show TrustedAdvisorResourceDetail where
  show = genericShow
instance decodeTrustedAdvisorResourceDetail :: Decode TrustedAdvisorResourceDetail where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTrustedAdvisorResourceDetail :: Encode TrustedAdvisorResourceDetail where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs TrustedAdvisorResourceDetail from required parameters
newTrustedAdvisorResourceDetail :: StringList -> String -> String -> TrustedAdvisorResourceDetail
newTrustedAdvisorResourceDetail _metadata _resourceId _status = TrustedAdvisorResourceDetail { "metadata": _metadata, "resourceId": _resourceId, "status": _status, "isSuppressed": (NullOrUndefined Nothing), "region": (NullOrUndefined Nothing) }

-- | Constructs TrustedAdvisorResourceDetail's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newTrustedAdvisorResourceDetail' :: StringList -> String -> String -> ( { "status" :: (String) , "region" :: NullOrUndefined.NullOrUndefined (String) , "resourceId" :: (String) , "isSuppressed" :: NullOrUndefined.NullOrUndefined (Boolean) , "metadata" :: (StringList) } -> {"status" :: (String) , "region" :: NullOrUndefined.NullOrUndefined (String) , "resourceId" :: (String) , "isSuppressed" :: NullOrUndefined.NullOrUndefined (Boolean) , "metadata" :: (StringList) } ) -> TrustedAdvisorResourceDetail
newTrustedAdvisorResourceDetail' _metadata _resourceId _status customize = (TrustedAdvisorResourceDetail <<< customize) { "metadata": _metadata, "resourceId": _resourceId, "status": _status, "isSuppressed": (NullOrUndefined Nothing), "region": (NullOrUndefined Nothing) }



newtype TrustedAdvisorResourceDetailList = TrustedAdvisorResourceDetailList (Array TrustedAdvisorResourceDetail)
derive instance newtypeTrustedAdvisorResourceDetailList :: Newtype TrustedAdvisorResourceDetailList _
derive instance repGenericTrustedAdvisorResourceDetailList :: Generic TrustedAdvisorResourceDetailList _
instance showTrustedAdvisorResourceDetailList :: Show TrustedAdvisorResourceDetailList where
  show = genericShow
instance decodeTrustedAdvisorResourceDetailList :: Decode TrustedAdvisorResourceDetailList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTrustedAdvisorResourceDetailList :: Encode TrustedAdvisorResourceDetailList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>Details about AWS resources that were analyzed in a call to Trusted Advisor <a>DescribeTrustedAdvisorCheckSummaries</a>. </p>
newtype TrustedAdvisorResourcesSummary = TrustedAdvisorResourcesSummary 
  { "resourcesProcessed" :: (Number)
  , "resourcesFlagged" :: (Number)
  , "resourcesIgnored" :: (Number)
  , "resourcesSuppressed" :: (Number)
  }
derive instance newtypeTrustedAdvisorResourcesSummary :: Newtype TrustedAdvisorResourcesSummary _
derive instance repGenericTrustedAdvisorResourcesSummary :: Generic TrustedAdvisorResourcesSummary _
instance showTrustedAdvisorResourcesSummary :: Show TrustedAdvisorResourcesSummary where
  show = genericShow
instance decodeTrustedAdvisorResourcesSummary :: Decode TrustedAdvisorResourcesSummary where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTrustedAdvisorResourcesSummary :: Encode TrustedAdvisorResourcesSummary where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs TrustedAdvisorResourcesSummary from required parameters
newTrustedAdvisorResourcesSummary :: Number -> Number -> Number -> Number -> TrustedAdvisorResourcesSummary
newTrustedAdvisorResourcesSummary _resourcesFlagged _resourcesIgnored _resourcesProcessed _resourcesSuppressed = TrustedAdvisorResourcesSummary { "resourcesFlagged": _resourcesFlagged, "resourcesIgnored": _resourcesIgnored, "resourcesProcessed": _resourcesProcessed, "resourcesSuppressed": _resourcesSuppressed }

-- | Constructs TrustedAdvisorResourcesSummary's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newTrustedAdvisorResourcesSummary' :: Number -> Number -> Number -> Number -> ( { "resourcesProcessed" :: (Number) , "resourcesFlagged" :: (Number) , "resourcesIgnored" :: (Number) , "resourcesSuppressed" :: (Number) } -> {"resourcesProcessed" :: (Number) , "resourcesFlagged" :: (Number) , "resourcesIgnored" :: (Number) , "resourcesSuppressed" :: (Number) } ) -> TrustedAdvisorResourcesSummary
newTrustedAdvisorResourcesSummary' _resourcesFlagged _resourcesIgnored _resourcesProcessed _resourcesSuppressed customize = (TrustedAdvisorResourcesSummary <<< customize) { "resourcesFlagged": _resourcesFlagged, "resourcesIgnored": _resourcesIgnored, "resourcesProcessed": _resourcesProcessed, "resourcesSuppressed": _resourcesSuppressed }

