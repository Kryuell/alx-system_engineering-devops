Postmortem: Web Stack Outage Incident

Issue Summary:

Duration:
Start Time: 2024-05-10 15:00 (UTC)
End Time: 2024-05-10 18:30 (UTC)
Impact:
The outage affected the main authentication service, rendering it inaccessible for all users.
Users experienced login failures and were unable to access the platform's features.
Approximately 80% of users were affected during the peak hours.
Root Cause:

The root cause of the outage was identified as a misconfiguration in the load balancer settings, causing it to incorrectly route traffic away from the authentication service.

Timeline:

15:00 (UTC):
Issue detected through monitoring alerts indicating a spike in login failures.
15:10 (UTC):
Engineering team notified of the issue.
15:20 (UTC):
Initial investigation focused on the authentication service logs to identify any anomalies.
15:45 (UTC):
Misleading assumption made regarding database performance issues leading to further investigation in that area.
16:30 (UTC):
Upon escalation to the network team, load balancer configurations were scrutinized, revealing the misconfiguration.
17:00 (UTC):
Load balancer settings rectified to correctly route traffic to the authentication service.
18:30 (UTC):
Service fully restored, and users regained access to the platform.
Root Cause and Resolution:

Root Cause:
Misconfiguration in the load balancer settings caused traffic redirection away from the authentication service.
Resolution:
Load balancer settings were corrected to ensure proper routing of traffic to the authentication service.
Corrective and Preventative Measures:

Improvements/Fixes:
Strengthen monitoring systems to promptly detect and alert for load balancer misconfigurations.
Implement automated configuration validation checks for critical components like the load balancer.
Tasks:
Conduct a thorough review of load balancer configurations to identify and rectify any additional misconfigurations.
Enhance internal documentation regarding load balancer setup and maintenance procedures.
Implement automated tests for load balancer configurations as part of the continuous integration pipeline.
Conduct a post-mortem review with the engineering team to discuss lessons learned and areas for further improvement.
