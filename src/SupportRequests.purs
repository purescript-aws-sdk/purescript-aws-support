
module AWS.Support.Requests where

import Prelude
import Control.Monad.Aff (Aff)
import Control.Monad.Eff.Exception (EXCEPTION)

import AWS.Request (MethodName(..), request) as AWS
import AWS.Request.Types as Types

import AWS.Support as Support
import AWS.Support.Types as SupportTypes


-- | <p>Adds one or more attachments to an attachment set. If an <code>attachmentSetId</code> is not specified, a new attachment set is created, and the ID of the set is returned in the response. If an <code>attachmentSetId</code> is specified, the attachments are added to the specified set, if it exists.</p> <p>An attachment set is a temporary container for attachments that are to be added to a case or case communication. The set is available for one hour after it is created; the <code>expiryTime</code> returned in the response indicates when the set expires. The maximum number of attachments in a set is 3, and the maximum size of any attachment in the set is 5 MB.</p>
addAttachmentsToSet :: forall eff. Support.Service -> SupportTypes.AddAttachmentsToSetRequest -> Aff (exception :: EXCEPTION | eff) SupportTypes.AddAttachmentsToSetResponse
addAttachmentsToSet (Support.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "addAttachmentsToSet"


-- | <p>Adds additional customer communication to an AWS Support case. You use the <code>caseId</code> value to identify the case to add communication to. You can list a set of email addresses to copy on the communication using the <code>ccEmailAddresses</code> value. The <code>communicationBody</code> value contains the text of the communication.</p> <p>The response indicates the success or failure of the request.</p> <p>This operation implements a subset of the features of the AWS Support Center.</p>
addCommunicationToCase :: forall eff. Support.Service -> SupportTypes.AddCommunicationToCaseRequest -> Aff (exception :: EXCEPTION | eff) SupportTypes.AddCommunicationToCaseResponse
addCommunicationToCase (Support.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "addCommunicationToCase"


-- | <p>Creates a new case in the AWS Support Center. This operation is modeled on the behavior of the AWS Support Center <a href="https://console.aws.amazon.com/support/home#/case/create">Create Case</a> page. Its parameters require you to specify the following information: </p> <ul> <li> <p> <b>issueType.</b> The type of issue for the case. You can specify either "customer-service" or "technical." If you do not indicate a value, the default is "technical." </p> </li> <li> <p> <b>serviceCode.</b> The code for an AWS service. You obtain the <code>serviceCode</code> by calling <a>DescribeServices</a>. </p> </li> <li> <p> <b>categoryCode.</b> The category for the service defined for the <code>serviceCode</code> value. You also obtain the category code for a service by calling <a>DescribeServices</a>. Each AWS service defines its own set of category codes. </p> </li> <li> <p> <b>severityCode.</b> A value that indicates the urgency of the case, which in turn determines the response time according to your service level agreement with AWS Support. You obtain the SeverityCode by calling <a>DescribeSeverityLevels</a>.</p> </li> <li> <p> <b>subject.</b> The <b>Subject</b> field on the AWS Support Center <a href="https://console.aws.amazon.com/support/home#/case/create">Create Case</a> page.</p> </li> <li> <p> <b>communicationBody.</b> The <b>Description</b> field on the AWS Support Center <a href="https://console.aws.amazon.com/support/home#/case/create">Create Case</a> page.</p> </li> <li> <p> <b>attachmentSetId.</b> The ID of a set of attachments that has been created by using <a>AddAttachmentsToSet</a>.</p> </li> <li> <p> <b>language.</b> The human language in which AWS Support handles the case. English and Japanese are currently supported.</p> </li> <li> <p> <b>ccEmailAddresses.</b> The AWS Support Center <b>CC</b> field on the <a href="https://console.aws.amazon.com/support/home#/case/create">Create Case</a> page. You can list email addresses to be copied on any correspondence about the case. The account that opens the case is already identified by passing the AWS Credentials in the HTTP POST method or in a method or function call from one of the programming languages supported by an <a href="http://aws.amazon.com/tools/">AWS SDK</a>. </p> </li> </ul> <note> <p>To add additional communication or attachments to an existing case, use <a>AddCommunicationToCase</a>.</p> </note> <p>A successful <a>CreateCase</a> request returns an AWS Support case number. Case numbers are used by the <a>DescribeCases</a> operation to retrieve existing AWS Support cases. </p>
createCase :: forall eff. Support.Service -> SupportTypes.CreateCaseRequest -> Aff (exception :: EXCEPTION | eff) SupportTypes.CreateCaseResponse
createCase (Support.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "createCase"


-- | <p>Returns the attachment that has the specified ID. Attachment IDs are generated by the case management system when you add an attachment to a case or case communication. Attachment IDs are returned in the <a>AttachmentDetails</a> objects that are returned by the <a>DescribeCommunications</a> operation.</p>
describeAttachment :: forall eff. Support.Service -> SupportTypes.DescribeAttachmentRequest -> Aff (exception :: EXCEPTION | eff) SupportTypes.DescribeAttachmentResponse
describeAttachment (Support.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "describeAttachment"


-- | <p>Returns a list of cases that you specify by passing one or more case IDs. In addition, you can filter the cases by date by setting values for the <code>afterTime</code> and <code>beforeTime</code> request parameters. You can set values for the <code>includeResolvedCases</code> and <code>includeCommunications</code> request parameters to control how much information is returned. </p> <p>Case data is available for 12 months after creation. If a case was created more than 12 months ago, a request for data might cause an error.</p> <p>The response returns the following in JSON format:</p> <ul> <li> <p>One or more <a>CaseDetails</a> data types. </p> </li> <li> <p>One or more <code>nextToken</code> values, which specify where to paginate the returned records represented by the <code>CaseDetails</code> objects.</p> </li> </ul>
describeCases :: forall eff. Support.Service -> SupportTypes.DescribeCasesRequest -> Aff (exception :: EXCEPTION | eff) SupportTypes.DescribeCasesResponse
describeCases (Support.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "describeCases"


-- | <p>Returns communications (and attachments) for one or more support cases. You can use the <code>afterTime</code> and <code>beforeTime</code> parameters to filter by date. You can use the <code>caseId</code> parameter to restrict the results to a particular case.</p> <p>Case data is available for 12 months after creation. If a case was created more than 12 months ago, a request for data might cause an error.</p> <p>You can use the <code>maxResults</code> and <code>nextToken</code> parameters to control the pagination of the result set. Set <code>maxResults</code> to the number of cases you want displayed on each page, and use <code>nextToken</code> to specify the resumption of pagination.</p>
describeCommunications :: forall eff. Support.Service -> SupportTypes.DescribeCommunicationsRequest -> Aff (exception :: EXCEPTION | eff) SupportTypes.DescribeCommunicationsResponse
describeCommunications (Support.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "describeCommunications"


-- | <p>Returns the current list of AWS services and a list of service categories that applies to each one. You then use service names and categories in your <a>CreateCase</a> requests. Each AWS service has its own set of categories.</p> <p>The service codes and category codes correspond to the values that are displayed in the <b>Service</b> and <b>Category</b> drop-down lists on the AWS Support Center <a href="https://console.aws.amazon.com/support/home#/case/create">Create Case</a> page. The values in those fields, however, do not necessarily match the service codes and categories returned by the <code>DescribeServices</code> request. Always use the service codes and categories obtained programmatically. This practice ensures that you always have the most recent set of service and category codes.</p>
describeServices :: forall eff. Support.Service -> SupportTypes.DescribeServicesRequest -> Aff (exception :: EXCEPTION | eff) SupportTypes.DescribeServicesResponse
describeServices (Support.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "describeServices"


-- | <p>Returns the list of severity levels that you can assign to an AWS Support case. The severity level for a case is also a field in the <a>CaseDetails</a> data type included in any <a>CreateCase</a> request. </p>
describeSeverityLevels :: forall eff. Support.Service -> SupportTypes.DescribeSeverityLevelsRequest -> Aff (exception :: EXCEPTION | eff) SupportTypes.DescribeSeverityLevelsResponse
describeSeverityLevels (Support.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "describeSeverityLevels"


-- | <p>Returns the refresh status of the Trusted Advisor checks that have the specified check IDs. Check IDs can be obtained by calling <a>DescribeTrustedAdvisorChecks</a>.</p> <note> <p>Some checks are refreshed automatically, and their refresh statuses cannot be retrieved by using this operation. Use of the <code>DescribeTrustedAdvisorCheckRefreshStatuses</code> operation for these checks causes an <code>InvalidParameterValue</code> error.</p> </note>
describeTrustedAdvisorCheckRefreshStatuses :: forall eff. Support.Service -> SupportTypes.DescribeTrustedAdvisorCheckRefreshStatusesRequest -> Aff (exception :: EXCEPTION | eff) SupportTypes.DescribeTrustedAdvisorCheckRefreshStatusesResponse
describeTrustedAdvisorCheckRefreshStatuses (Support.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "describeTrustedAdvisorCheckRefreshStatuses"


-- | <p>Returns the results of the Trusted Advisor check that has the specified check ID. Check IDs can be obtained by calling <a>DescribeTrustedAdvisorChecks</a>.</p> <p>The response contains a <a>TrustedAdvisorCheckResult</a> object, which contains these three objects:</p> <ul> <li> <p> <a>TrustedAdvisorCategorySpecificSummary</a> </p> </li> <li> <p> <a>TrustedAdvisorResourceDetail</a> </p> </li> <li> <p> <a>TrustedAdvisorResourcesSummary</a> </p> </li> </ul> <p>In addition, the response contains these fields:</p> <ul> <li> <p> <b>status.</b> The alert status of the check: "ok" (green), "warning" (yellow), "error" (red), or "not_available".</p> </li> <li> <p> <b>timestamp.</b> The time of the last refresh of the check.</p> </li> <li> <p> <b>checkId.</b> The unique identifier for the check.</p> </li> </ul>
describeTrustedAdvisorCheckResult :: forall eff. Support.Service -> SupportTypes.DescribeTrustedAdvisorCheckResultRequest -> Aff (exception :: EXCEPTION | eff) SupportTypes.DescribeTrustedAdvisorCheckResultResponse
describeTrustedAdvisorCheckResult (Support.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "describeTrustedAdvisorCheckResult"


-- | <p>Returns the summaries of the results of the Trusted Advisor checks that have the specified check IDs. Check IDs can be obtained by calling <a>DescribeTrustedAdvisorChecks</a>.</p> <p>The response contains an array of <a>TrustedAdvisorCheckSummary</a> objects.</p>
describeTrustedAdvisorCheckSummaries :: forall eff. Support.Service -> SupportTypes.DescribeTrustedAdvisorCheckSummariesRequest -> Aff (exception :: EXCEPTION | eff) SupportTypes.DescribeTrustedAdvisorCheckSummariesResponse
describeTrustedAdvisorCheckSummaries (Support.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "describeTrustedAdvisorCheckSummaries"


-- | <p>Returns information about all available Trusted Advisor checks, including name, ID, category, description, and metadata. You must specify a language code; English ("en") and Japanese ("ja") are currently supported. The response contains a <a>TrustedAdvisorCheckDescription</a> for each check.</p>
describeTrustedAdvisorChecks :: forall eff. Support.Service -> SupportTypes.DescribeTrustedAdvisorChecksRequest -> Aff (exception :: EXCEPTION | eff) SupportTypes.DescribeTrustedAdvisorChecksResponse
describeTrustedAdvisorChecks (Support.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "describeTrustedAdvisorChecks"


-- | <p>Requests a refresh of the Trusted Advisor check that has the specified check ID. Check IDs can be obtained by calling <a>DescribeTrustedAdvisorChecks</a>.</p> <note> <p>Some checks are refreshed automatically, and they cannot be refreshed by using this operation. Use of the <code>RefreshTrustedAdvisorCheck</code> operation for these checks causes an <code>InvalidParameterValue</code> error.</p> </note> <p>The response contains a <a>TrustedAdvisorCheckRefreshStatus</a> object, which contains these fields:</p> <ul> <li> <p> <b>status.</b> The refresh status of the check: "none", "enqueued", "processing", "success", or "abandoned".</p> </li> <li> <p> <b>millisUntilNextRefreshable.</b> The amount of time, in milliseconds, until the check is eligible for refresh.</p> </li> <li> <p> <b>checkId.</b> The unique identifier for the check.</p> </li> </ul>
refreshTrustedAdvisorCheck :: forall eff. Support.Service -> SupportTypes.RefreshTrustedAdvisorCheckRequest -> Aff (exception :: EXCEPTION | eff) SupportTypes.RefreshTrustedAdvisorCheckResponse
refreshTrustedAdvisorCheck (Support.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "refreshTrustedAdvisorCheck"


-- | <p>Takes a <code>caseId</code> and returns the initial state of the case along with the state of the case after the call to <a>ResolveCase</a> completed.</p>
resolveCase :: forall eff. Support.Service -> SupportTypes.ResolveCaseRequest -> Aff (exception :: EXCEPTION | eff) SupportTypes.ResolveCaseResponse
resolveCase (Support.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "resolveCase"
