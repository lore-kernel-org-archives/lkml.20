Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022081.outbound.protection.outlook.com [52.101.96.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C921357D13
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 14:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788015213; cv=fail; b=QNPhP3fwDZalXNbg5yTneW9X3Q+5CiVW/cRMD48yJzg8ZDkLdaDAb6JuM23Ruqer8UTxgP0sO+BSd7nPXg6t7zy3QY6avX+RktCNO8O5jHR6VHvEzx8If0bBYZ1DYJWG7M+7XHK3b9MPBKNRZgJiLNFesaW0G8IF7pXLbVzVOm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788015213; c=relaxed/simple;
	bh=VeG1ewZN56oy78LJ6IpKwu9u2dtqXCejMCX7TS+d484=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ILUnOi9aOk331oW9qrJVWkJzrGpelYxPtMXobTVyC7uy/vac7DmgRTw/KcgC+Wzjs+RENUEKJ7WmdK1amGJijVqhmgzUAc625k0B6a39lW2B1MdPatUEE7MzPofb1ZxpUEGF+SXKM3YPz39liHh6509Em/oyixMv58B8O/5ZDxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.96.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hqk/iqr4sLKSH5klT/llAVtIQndxpGfVvi8XU7DmxIiiuXoL5GqplD+FQRFDEgbNrMOjVaJKEKIDyePuhQwzbJUPZuz75TrB5PGl+c7eR/A6vBRBCcNmaTL9pQ7BywEhmm5cijBMT+ypcGeQ+A70DdSBFlA7UpKiwnU9EDEy0FdY+A4YiE2j5RhrpH3AiI0lIzXfqC/mRN5+sTlemKabFtyZXNFOWGMxr685QKRrUkukcuThdECyb6kGZ959PG1dAA/sgPsfxcL2V/0Y8SuwioiRyevaQ62Oo8FOET1JdFXtead9duGsDMUEvwdqa/mW/EEZ0Qfit7mZDcfk+9mdfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=OOhAIw85+cAnV43onnUPAfU+DW/ZWnbjRyQkHrXtVy0=;
 b=KE0KOrD+dg/54WvCebUnDHDlyJC6Hur1I9vRnEX5UNr4teb6fL+mZ9e42tbQ4uC3MQ7LKL/O0P0cE+nmsoi++uYrW0t29o5mDRi/eHfIqRqNoqTqkBMPjNrYeRnwc1tdtEb50VAsuyTeVv5PXoHKOOZQ7VKNb0Bl3PwvScMuh03G0YAKzdjDC/sQ0TogWws3D69SrrAILDwhZZX8TEsseOmrzaCs8P313c8GgscEW9gOMy7hmQ+i1gOQsQvhoMIC0WKaeb50Eec5EekgmXM78IDAYr7fKPkDqm9bnT8kskLRd37o1Eg7hsDU9JWQroogsc5GoRVHejxjENJ+G/wDGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO0P123MB7197.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:333::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Sat, 29 Aug
 2026 14:53:29 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 14:53:29 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: akpm@linux-foundation.org,
	lance.yang@linux.dev,
	mhiramat@kernel.org,
	pmladek@suse.com
Cc: linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	atomlin@atomlin.com,
	neelx@suse.com,
	sean@ashe.io,
	chjohnst@gmail.com,
	steve@abita.co,
	mproche@gmail.com,
	nick.lange@gmail.com
Subject: [PATCH v10 1/2] hung_task: Reset warning budget when problem gets resolved
Date: Sat, 29 Aug 2026 10:53:20 -0400
Message-ID: <20260829145321.18423-2-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829145321.18423-1-atomlin@atomlin.com>
References: <20260829145321.18423-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0414.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::29) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO0P123MB7197:EE_
X-MS-Office365-Filtering-Correlation-Id: 829430b0-0b29-4d69-1afb-08df05dd49bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zxYHy+cGkvaCGSolveBDHqIFAWnxLsQl188PyJZisI+jJ1wvNByJHEyyguCaOiyb05VIB5eKeTqLskl6CZdlJqFmgJCv/wV/+PO4wJvoAsA1Jkm4fN5sRAYyNwOhIy4l2PviuFfzfOt6GmWBorkwmQwgl7HFt9psDbbqJlEfdQLSs4jTREm0hm1ZyBf+bAO3MV5p7GTRcCOKoUYA/XmrM//9czaleBjYO2tiS3zPM+02E+CL+FriAlt8gwx0at+y0g8yTUf5s0oiCJ3/xloMrfxmwySeuMhYcNzuP82gTqXEzCsWly9DoI37iUjgU1N5uPo6gFiIOwYldBvd0WjM6BR2EagFRAnZaBQEcrvtnZkerlSFIiROMFaLWMW5a862s+8bZgPvPMRn5L+M7VzItfxwQ4bAdNPYrUTnBBqBxiBxt9ctiAA3zIl6KjVuOCI1+NuVppwHo0sJYZl762Jkkbc3B0uH7xneYCoAIo2opLSbXjQN9zjQNUj+lB+ctY9hDm6yvvtsLV64W9n7qwxmZx2c45dpVoN1JDMeOywtQnCgzS3v4PxKfURzhktxZ/6fPvJzMRcyvLUcX7ckI4+gRLvPQf1x4/gKcS/xXMe/VOIg5T/v72B+XxuZYdBbtqwV4IJbq6VZWqpV5mdVJeu+BJ+RK5l+W9bMRYBZ0bbcnnI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dJPQac+8VXTurlzWglxd6f4bz/imUw8mtkWvGDram1WZnXb6GV1IihPp3yhU?=
 =?us-ascii?Q?PoM9Acv9lpfRtZIXzop0LA7c4QZctV/DCNWPhxuNU2AZEh5+rkkdmIqpK9MW?=
 =?us-ascii?Q?v3HOtn4i0clQZd0rjM8fZTYKPmeRME/XF7E/90rxBbVGU+EBj31EjTVItztv?=
 =?us-ascii?Q?KcEBAmqsObw8pWeKeUsNazNL02ath2mPEQcTfz7eCLfWNyhVqFaf5TqcCXXX?=
 =?us-ascii?Q?7HVMhcLQ8KOQdE3h1dT4kU4SpTErQagJsfnN8bYizHkYnkVtweHKy5oqBUUt?=
 =?us-ascii?Q?PMtLDU6LhJZ0TqPMy/Xk5RdwRhYCiT2juSBTBO77wI0JyzTN66JevO40ONwP?=
 =?us-ascii?Q?/xO7c8WC7jfzDEP4JedRGS67aY0Ii3BLN5VUZ/eW3VeY5wIHP+HNFDipckQA?=
 =?us-ascii?Q?181BB/CEnIAS2SHpI2qFvgkwIDtrqlyd83ik0aHPHS+fcV9mKftzyWLcT+8b?=
 =?us-ascii?Q?ecstN2M0Zo8u+pgA4pC2Ge4cwI1+aHmYYD2ejeQkbxMb6+3X8Dj1znK1VFsf?=
 =?us-ascii?Q?036dne45bgknOSRy6Io7YFv2NGoGXVEoet/cMoh8BognpuSRfw5LnaVorTwh?=
 =?us-ascii?Q?fGBZNWpSKY8n2SdThSf6lasXc4M0KGTY74tKounTzB73+dClF4eepNcxsfwI?=
 =?us-ascii?Q?PpKjdeUZfR3tFnpDg29Z9qkG1qs4yqzSlN+4wQK66cuDA7BFoON7tvRecVRR?=
 =?us-ascii?Q?MFElq0KINDAqgQHcqqkHrH4TYQVT+GUVUyBuKqruqQEGhKJQpy/0lH+lQz9f?=
 =?us-ascii?Q?AD3Sah7yGTHNDs+VonDFOWI0WQG2ylxNyEdVw7/mvONbyWiR1mYmCdsmCIKO?=
 =?us-ascii?Q?ZkIhsHc4s64yN4JkkN/JcFuUQjV7Us4tbYjAuUzXgEBKf6OJdYBlsdUJ/kml?=
 =?us-ascii?Q?wQQcQn64F43zTZ0qy6/5W+9iiwtrdlaGZEAmBXAV6xZGOpAAwJqH/Ovpt+/L?=
 =?us-ascii?Q?jBTTdkJlwBNvg1WGFOV43YuiFfCOOaPmTyIqbYfLx3yWagKsXnmHqj5G1MfP?=
 =?us-ascii?Q?0baXGkgvmAssuVaMVXLn0PjaxanCC0quOa5XOJiMHcttUXzEIx1u4vMh21fN?=
 =?us-ascii?Q?qKEaYcnmaHRCmAGxCdCLJQzCnF5M/rt8+Y7IYU6nyT9Hfv+qjNoloynqun0O?=
 =?us-ascii?Q?HvCUz/xeXlDKiX/5WgKXPKDT6xkUJWlJn5mvoBeVcqyW6Ut2wRX5H3uQ0dc0?=
 =?us-ascii?Q?A3gQPLd/4pKBf6+nYxBWLXyiIHlcrHyzCOnZOqsZph2giXEaDcfNslQYFVOv?=
 =?us-ascii?Q?Ht/DIvI9A1Pi+V6xUU1Yood5o5gIkuz+HNL1SzR6fs3ECWPMOYlIfFHwtaiN?=
 =?us-ascii?Q?VK5Qt1mWRL2C6etNnVuIsdckV9NJjR91ZQ7nO73GH+wVwOm+vTiV0XxCvJv5?=
 =?us-ascii?Q?2PTqQkfCkhfs2+k3lbFokdxy4+4RnJC8pxFL5F6ha8ODa51J4SiYVxGxMc7F?=
 =?us-ascii?Q?ifAomIonQO37bQi0rgLlwoAhuItb5FOJx8zYC82CY4ltnOHu+TbL926kjTVz?=
 =?us-ascii?Q?J45gx8dh1SvjaCIf+lbDX8E4xct2ahnXb1ur6BKAg6whqikMLGvPVyCWOl5q?=
 =?us-ascii?Q?JEwi2M4qp4c0ye5ANLp0EhPjEuUG35bnvroCFCFlPnsyeh7bggxjgd/0uLza?=
 =?us-ascii?Q?FSjf5TdNTL1iSt4q2cmwdC05OHa1zoxvUlCbStM6LzQjR5cI4zJ+KXSdBZvq?=
 =?us-ascii?Q?f5UGDh66dM3z0+fASQtW6agaW8K8FGbQgXBxygLF4NjFj33i4/C1IwEt0yga?=
 =?us-ascii?Q?KQ5h0ASzOg=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 829430b0-0b29-4d69-1afb-08df05dd49bf
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 14:53:29.4834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TysOcJBuVUy9oudiADytqsmyF2CxLScjk0z2nw7a10SOllV/3CEV6xMTdOTWhncc0bI3P+50WXFur3+sa3sYUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P123MB7197

The sysctl hung_task_warnings currently holds both the configured warning
limit and the remaining budget. Each detailed report decrements the
sysctl, so once it reaches zero, the configured limit is lost and cannot
be restored automatically.

Keep sysctl_hung_task_warnings as the configured warning limit and make
khungtaskd the sole owner of the remaining budget. A check that finds no
hung tasks reloads the budget directly from the configured limit. A
successful sysctl write publishes an atomic reset request, which
khungtaskd consumes at the start of the next check.

Suggested-by: Petr Mladek <pmladek@suse.com>
Suggested-by: Lance Yang <lance.yang@linux.dev>
Tested-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 Documentation/admin-guide/sysctl/kernel.rst |  5 ++-
 kernel/hung_task.c                          | 49 +++++++++++++++++----
 2 files changed, 44 insertions(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index c6994e55d141..b0f8e55efc1a 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -459,8 +459,9 @@ hung_task_warnings
 ==================
 
 The maximum number of warnings to report. During a check interval
-if a hung task is detected, this value is decreased by 1.
-When this value reaches 0, no more warnings will be reported.
+if a hung task is detected, the internal warning budget is decreased by 1.
+When this budget reaches 0, no more detailed warnings will be reported. The
+warning budget is reset to the configured limit when no hung task is found.
 This file shows up if ``CONFIG_DETECT_HUNG_TASK`` is enabled.
 
 -1: report an infinite number of warnings.
diff --git a/kernel/hung_task.c b/kernel/hung_task.c
index 6fcc94ce4ca9..a5043188456d 100644
--- a/kernel/hung_task.c
+++ b/kernel/hung_task.c
@@ -57,8 +57,20 @@ unsigned long __read_mostly sysctl_hung_task_timeout_secs = CONFIG_DEFAULT_HUNG_
  */
 static unsigned long __read_mostly sysctl_hung_task_check_interval_secs;
 
+/*
+ * Limit the number of printed hung tasks to prevent printing
+ * the same or similar backtraces repeatedly.
+ */
 static int __read_mostly sysctl_hung_task_warnings = 10;
 
+/*
+ * The number of hung tasks which still can be reported.
+ * The budget gets restored to the original limit when
+ * the previous stall is resolved.
+ */
+static int hung_task_warnings_budget = 10;
+static atomic_t reset_hung_task_warnings = ATOMIC_INIT(0);
+
 static int __read_mostly did_panic;
 static bool hung_task_call_panic;
 
@@ -245,11 +257,11 @@ static void hung_task_info(struct task_struct *t, unsigned long timeout,
 	/*
 	 * The given task did not get scheduled for more than
 	 * CONFIG_DEFAULT_HUNG_TASK_TIMEOUT. Therefore, complain
-	 * accordingly
+	 * accordingly with full details if the budget is not exhausted.
 	 */
-	if (sysctl_hung_task_warnings || hung_task_call_panic) {
-		if (sysctl_hung_task_warnings > 0)
-			sysctl_hung_task_warnings--;
+	if (hung_task_warnings_budget || hung_task_call_panic) {
+		if (hung_task_warnings_budget > 0)
+			hung_task_warnings_budget--;
 		pr_err("INFO: task %s:%d blocked%s for more than %ld seconds.\n",
 		       t->comm, t->pid, t->in_iowait ? " in I/O wait" : "",
 		       (jiffies - t->last_switch_time) / HZ);
@@ -264,7 +276,7 @@ static void hung_task_info(struct task_struct *t, unsigned long timeout,
 		sched_show_task(t);
 		debug_show_blocker(t, timeout);
 
-		if (!sysctl_hung_task_warnings)
+		if (!hung_task_warnings_budget)
 			pr_info("Future hung task reports are suppressed, see sysctl kernel.hung_task_warnings\n");
 	}
 
@@ -304,7 +316,7 @@ static void check_hung_uninterruptible_tasks(unsigned long timeout)
 	unsigned long last_break = jiffies;
 	struct task_struct *g, *t;
 	unsigned long this_round_count;
-	int need_warning = sysctl_hung_task_warnings;
+	int need_warning;
 	unsigned long si_mask = hung_task_si_mask;
 
 	/*
@@ -314,6 +326,11 @@ static void check_hung_uninterruptible_tasks(unsigned long timeout)
 	if (test_taint(TAINT_DIE) || did_panic)
 		return;
 
+	if (atomic_xchg_acquire(&reset_hung_task_warnings, 0))
+		hung_task_warnings_budget =
+			READ_ONCE(sysctl_hung_task_warnings);
+	need_warning = hung_task_warnings_budget;
+
 	this_round_count = 0;
 	rcu_read_lock();
 	for_each_process_thread(g, t) {
@@ -340,8 +357,11 @@ static void check_hung_uninterruptible_tasks(unsigned long timeout)
  unlock:
 	rcu_read_unlock();
 
-	if (!this_round_count)
+	if (!this_round_count) {
+		hung_task_warnings_budget =
+			READ_ONCE(sysctl_hung_task_warnings);
 		return;
+	}
 
 	if (need_warning || hung_task_call_panic) {
 		si_mask |= SYS_INFO_LOCKS;
@@ -425,6 +445,19 @@ static int proc_dohung_task_timeout_secs(const struct ctl_table *table, int writ
 	return ret;
 }
 
+static int proc_dohung_task_warnings(const struct ctl_table *table, int write,
+				     void *buffer,
+				     size_t *lenp, loff_t *ppos)
+{
+	int ret;
+
+	ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
+	if (!ret && write)
+		atomic_set_release(&reset_hung_task_warnings, 1);
+
+	return ret;
+}
+
 /*
  * This is needed for proc_doulongvec_minmax of sysctl_hung_task_timeout_secs
  * and hung_task_check_interval_secs
@@ -480,7 +513,7 @@ static const struct ctl_table hung_task_sysctls[] = {
 		.data		= &sysctl_hung_task_warnings,
 		.maxlen		= sizeof(int),
 		.mode		= 0644,
-		.proc_handler	= proc_dointvec_minmax,
+		.proc_handler	= proc_dohung_task_warnings,
 		.extra1		= SYSCTL_NEG_ONE,
 	},
 	{
-- 
2.55.0

