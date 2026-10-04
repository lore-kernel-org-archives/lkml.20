Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021095.outbound.protection.outlook.com [52.101.95.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954293BB13F
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791131781; cv=fail; b=VSgnL49ziU5/7OV5C7HP8q5YyM7PqFVcfnNUhVEiQhfQE3AGOX2ZznYWG58DMbY+IgaSrAGihYaLfxVOjiiGK3yJSQZBToxLoIj4inn6S2AfuavZtKxEPR4cJvhEv1HGyCOyOnFGrGCWKVJk6OkxUpuPX+Ndg2LTGRyizzWyksQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791131781; c=relaxed/simple;
	bh=bRWQJPzRzBSRtjysUqZ3+8M+tOO1g0Oc2Ssh8C55KO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AMgiDGv6hrAXfXBs86kObk4AFLyOXMAmb6xPE6d09FyPa1eE1KETRwhxnryfIeatn0o9XLxXIkIIoxfxWJXr+G0ZPKFN1ldhke4uMVHEeQGBg8fs/EJyzBME4N1cbFsRJ1bAmKVPTpyRz/VL67cQlYGi0JMs2+HrJKglrD7n4a8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.95.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RsmFRzwMpF5ImImTCpSzWtXeJ7RVVAW5rNdYTGWGjjMm3mBpSaRsvp9RjUDDe00AqhJX6FGf1dinZ4ZVQ5hW46WuRo4lVL8T1pRVK5wc2HNLSvmJsEnQO53auqp/Ku9G/JqSflvh1ONuUBLMrpKdvGU42SIL/urKrN0fFyD2RYc0sXhaoZOzk4xYKVL91iEN9uGXzzkYqAiVEIslfwRMSH9FIfcrb0xrt9LU4VCxmABkaxkCjiJoNe8pTdDlXx5w0eqFyyRmuXF96B6fk0HxbkiLLsm7vfsBk2bBGdWWkXUaUv4SvdVLhyxqjVcpbayrSUa11+KlGueBoin4D8ATug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=u9BWUENPpa7yOufyd4KAUyfmXqVxFazoqkzfT8ZOusI=;
 b=SyO3UW7QtQ0p9/QJuvfPAwJ2LDrtuAUIE9oc/f/41ySOQ1F1AYaVG1N4zDHw07F9yKNDDh3kBvTZaXinZc2jhvVgo07aBnzHU5Ruihup+/U8r+AVmCTEeaku6IZgVK5ukbk/zCvJ2t8y2DM3Gje/qlTxnxWK6nzJ/7BDUwgCFNrgEKckG2Kp8M6s5r8KnseEcXBObMhlXw81uX9gi01nWuNOQZmo4zTbq9jcqoPgzZv6tvy3xvSkk+e+nv7pEaMvmxmbgv0FcIxTfKIwoR3cQH25nVUHRQTSzXvDgC7PdsfkUnyJt/AYw2SNtC+hWF5wDeI/9Ox1h9vd8DwW2p5+kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO6P123MB6439.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:2a4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sun, 4 Oct
 2026 16:36:15 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0472.016; Sun, 4 Oct 2026
 16:36:15 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: akpm@linux-foundation.org,
	lance.yang@linux.dev,
	mhiramat@kernel.org,
	pmladek@suse.com
Cc: linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	brads@mainlining.org,
	atomlin@atomlin.com,
	neelx@suse.com,
	sean@ashe.io,
	chjohnst@gmail.com,
	steve@abita.co,
	mproche@gmail.com,
	nick.lange@gmail.com
Subject: [PATCH v11 1/2] hung_task: Reset warning budget when problem gets resolved
Date: Sun,  4 Oct 2026 12:36:09 -0400
Message-ID: <20261004163610.413506-2-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261004163610.413506-1-atomlin@atomlin.com>
References: <20261004163610.413506-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VIUP296CA0112.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:351::18) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO6P123MB6439:EE_
X-MS-Office365-Filtering-Correlation-Id: e5fc8cbe-6418-4104-c185-08df22359b91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|18002099003|22082099003|10067099003|56012099006|260925021311599003|260925022911599003|260925021911599003;
X-Microsoft-Antispam-Message-Info:
	kTouMpVEe2l+92j93bhXIE6y6WooTLdYliZE9Az1lQ1+wEPH5rNGqMnEP5TK6/fIZ5bpaDc4VgDUKrE4DTi7eREcChjLSot0pLhrn0k+C5sohYaJFIAPIys5yChTHUjmOdHCR7hzUegg+ckaGaIiRwFikBFG1e5frQcUYf/R89B/allWbbgLBOssLnotmfypJRjEXkp9fIlnyvG5EswqcBx1ozfYbCFpT8hJ9IgHVg0+67D2N9kJ0q6pUPoq99fPXsOOkLDNsnzHUyjvjGZbezWiLo+1lXHT7nLNYHPT6l7yzfoheHUdChINMJr24XBkuXAHrP1cZutgKEsqSPPu31tDkLCOLQv3dTGbakVqZ+mISosqLY6xUbFgXpi4CHR5dOfoY4+rXJ9mgOOFlEx+QRLM+6qI4Pkl28uCj7pq+pziM/FHExxh9bkqK2e/NXzT56zOahqoNG/fPGRvppU3eg+Yqd2QlbTLILkmYykVz96OtLczQlZMU+gWd17b9yh59VlIp/6en3fWJQGlKSxMCJywU/XDXI9P8r+49LD2dY47haMoD8FyemzlZjLThIpJEX9PnijASD33+Et8yj/m4kzGXAYyNWaNsA/pJ8Nt3ce2qrJMd92v0Ueflj4GBYW4e3HvPc84jixAzyCEtscOgw970JZ5QO8SPrhYBlq2B28=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(56012099006)(260925021311599003)(260925022911599003)(260925021911599003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VqnM+tQQUKqgPgEqpeGz31HmghpteLaSDqw9dIzbGX6bZ6/MFg0MNBboZ3KP?=
 =?us-ascii?Q?HOAu1m9cd7xT2GJ7Se1FYdkFIVXPVceWKQzfifPbHzpy7ACr/nXA4Jf9cF6s?=
 =?us-ascii?Q?GOGuByUuc7p83dD0yfH1xPF+YrT1gNSFiVNaLwwjTUiOKT5RnJOPlxjOfl5/?=
 =?us-ascii?Q?Dw5FuXwmGIuwzTNipQT7IeYyP5/BACcwzxlhXUAQWUV+O7Tdw8PKifcllYSW?=
 =?us-ascii?Q?AskrGPCFhs1GIGVHEsyh7IJfYt5zPJfie5qAuUY4E13bPgPjvYHI6H8FsBEL?=
 =?us-ascii?Q?P0UMAXUMKwwKCrKToTGeOqi6lRC9qtAL+mez690P3VjrO6p0SauykN+HE9Du?=
 =?us-ascii?Q?bvf5VVisQ34bQ3puBwzErz9Wav9DO8k4xTz1/LZ8TuEwlvy5DwsGsPfEKUmY?=
 =?us-ascii?Q?lkqkBg721y5gdeiO5aXdl3AMKO1I8sVH+EB/38VGlqdVo/JHo1KvHH4mTRWP?=
 =?us-ascii?Q?FWMZ9JZF0dG5UwV6+gchwwtlbx4zY3GxMuyUb0xFw6PjvpT6ga9wOWodVzef?=
 =?us-ascii?Q?UbvbDai0dveCOQKnZ/UuoJWRPn3BVfNzl08GafBozbBtYkG11JYNwxcG+EMg?=
 =?us-ascii?Q?qKlWDg3+JC7d3Pbi0HXpxlTvyICVAp+fpiyx09sgGFVk+/3M9qjktg//PeFM?=
 =?us-ascii?Q?ugwUhAaFLciBXcCVhgOvG32BJLAbXmqVoLynI4wTIshcCtkvG6AIXPwFmFiG?=
 =?us-ascii?Q?sG/Y8WQakdOUlf5gg4VPleWFaF3BgPrZdOIGc850qEmCPyVcV29DuzK2ZjXj?=
 =?us-ascii?Q?G3Ox1kq1FFY1Odm9fyIHktd+67jGEI2tlT6eiBC2QPFQZ4QIF6RE9f+i2Wid?=
 =?us-ascii?Q?Us+t518aMW/igE+5051ZztbEaD4QrP/cl1OuFcMVnZF9KzC6Bx/q1urRjEUD?=
 =?us-ascii?Q?nSU0lbPtVfOjgyqB46q9PomYCpihdKOJIQV48QhiZ844nwRc3IMJbGWv8m0F?=
 =?us-ascii?Q?OIQkDwEk4kqbu/WHaInMbIgEw2JiYAYxQZfl8Dk6uG3EpDPeZG8jJQhbrIbg?=
 =?us-ascii?Q?X9AOy3R8oLtif1BVgH8+gva0Mt8O4zzopy2s2H6fhTN8pySyO3Po4k+mnC/e?=
 =?us-ascii?Q?k+hzaznKn1fLOGPxloRFVnTPJ6VzAvhsEFjowbz3b2yfFDHiKk4yhXOZdLl/?=
 =?us-ascii?Q?+ofO5zDWxQ7xuRAPhioVDO/pQw8MUmT4oAdYRXeYT/w/Y36a4D/96CKVstFt?=
 =?us-ascii?Q?tQgpHCdYDFTYFG/ngPuDMuLcP17EmrcJZK/ce+at8ymdpX0qqVEHVFDQeTbr?=
 =?us-ascii?Q?DxV1Wp1xu+yJQ00PztFT4YqcKStZjRWLjoxphsg2EHSZerrqSeyUJC7bU1uc?=
 =?us-ascii?Q?0jKAniCCmjd5UtvW0Ik2+lZ5Dj3v2yFDN8ijCtFFkWkCZqDNaR5Aoo7TpBjq?=
 =?us-ascii?Q?iKQK9t0OAJPJhOXavmXgSj4W6uk6cycLZ6ptroOfCsw/AeqKooIcaVXWE++g?=
 =?us-ascii?Q?8nFRbJsYYL8TS0j9cSuAlDWP1n5HsijpBYyObQP8sZgOwGlzE/O6bFSzPbuf?=
 =?us-ascii?Q?HOOmRRenUMzlt40lWkeilfWn5W0zZDLKpzsbrDw1hFgvNTaAzOcyrepCy+qY?=
 =?us-ascii?Q?K11E3995fcj2KMgYrcjLY17R54Chf1uiQhpKvQVjcAn3gQBYXUqVxHlfp6GW?=
 =?us-ascii?Q?Sxk2WpWkoM2HrZLsl1MGB6+iEFJZKK4TFQKKT+ILUVk6YURAtJrfB/L4hx85?=
 =?us-ascii?Q?O9AGplAbiYA6kgFcpjX2hwhGqveywR6omWHQQk8X+qmCtVu1ltIdcGr6HRm6?=
 =?us-ascii?Q?b2Pl0LrfTg=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5fc8cbe-6418-4104-c185-08df22359b91
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 16:36:14.9529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8O8Lr+UYuzDqpf3TIpbdSfdlU2iabS25Ok+v88bwob6CFcOVLyYBMMNvO3nifQNhDuSmw+deBzJD/qtHgv/+qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P123MB6439

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
index ffea61d448eb..c03369e234a9 100644
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

