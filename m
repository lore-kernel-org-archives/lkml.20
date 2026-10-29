Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.90
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793280361;
	b=wNEewx3Lppdjh1WJ8/qBGJYyFIFjpgx3b3W5eSnuBctCCZBhdMExRPv5nut0pHdL/Khv
	 MR7CmDBYXn3iXpe9eg4jPi3CL5uQK4VLqXumQmwiaC7j0p4saQJ4463IKZhWHK34Dsknz
	 qNyMNh/im4p3eKzrQVcAGrcMsYOgAn77d+c9Mk8HjN/5kZGKMrBMR8jnHTy2uX44cVbVn
	 pKFgtWaijBujJ3O1BBITfcLkA5003MuJAlObvuyL21lVyml/9NE/SazvA0mbuWt3HLkO7
	 LUnaiF8Wr+kgU4lkt0TXLzWb8C8KLWnes3i3eYSmquGfq7gNvEho9r6CHOdoAgEd5QQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280361;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=mkpD0wIrDWEIDW62EulZFq8uH60gx2K0ZOG9dMVyDoA=;
	b=JWpgIiJ5UDw+E891scg3XgFhu4oU7fDB2gwfwmlGerTwC51v6RFnyxzYiOAz8IdCs4IZ
	 WIR0ge3hoRP7d49kXpTBQ4R9TmyBYukMOHqAiYwKxRaVa4sWFaZg8Q3RFff1lHuWy7Q3v
	 9PyzBUYR/LCKvfJSMjTd14ezDSpK7TP3ESamQvbzkQeU4rYgAs1QEjqBpGOEpU7NTSlxW
	 1CaKVY4s2BOEl5fJ0BaY7AvZ8eR3vrkV5HP2Ehdww1jA+ecgIhpU7rV7+UbyAW0j8gRsQ
	 ShOZs5BA1pGRNpEIiTo8BBV5cAxd9y8PBK2rv5pudaeLOLhoGgCiQG1VKmtwSFcJzrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=atomlin.com;
	spf=pass smtp.mailfrom=atomlin.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.90
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020090.outbound.protection.outlook.com [52.101.195.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B30B606A332
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B30B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WTl36UMrlpzgdYpF1CxYdRTghMkXvB845p0wyK5igYF4mHtc1r/8sBUzrhMKgKNQHv0mE2FQtB1yo5n2jDENblhyUta10neD36mtyxKcwqDwRLhN7uMCi1NtHQV9f2HIi73AzliH7gyRXSJ6qBF6lzlhDVlRLTTuSJQz9IUq19ePZKoLBHEoxFymocDG+s9AOIyXIgYZSR1vVNY6xU4jT1Xw51QidzmMIyRQ+uoUbhM3GnjuZuY5e1QuHYfl6lqfOIde8aKvcubeP4KtYOtF39g87KagoidQhDVXXyHz1tx6JmQsSSOB1vxxw3xC+e5BK4ztKF9PzW5cixn9SeYC7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=mkpD0wIrDWEIDW62EulZFq8uH60gx2K0ZOG9dMVyDoA=;
 b=SWscYX7g7pkpGVYsS3dcdi0eaR+V3Bk7QjcqsrNsNDgv96jy1VRe/ITEkV4H8BHSphHmlhM/H1D2mephZ49o23Mcv+dQwwTPeoQtgiXaUAPaqAx/dQV+WlYAaf23RSxOmDvSlRMKzSWc0KxdbMlncjwR3LjzavZxbCs9I2MkIiT7nlUTLWSPcOJW8TbrD861AWEA2jjJyTrZS3gTPn/PapyQJoPJ8f1Hok/3NW60g+KarbMKPVMHjcP6HmAcO/ICfRErbckjhu4gttExr6Za+ixmU/iA7WZm5RBI9WSPSfmglnmzxlCOBK/4BRcZ0P0ah3EfAvat2NsV+1lzd+/jBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO8P123MB7811.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:3d4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 13:25:56 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%5]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 13:25:56 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: paulmck@kernel.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	zhanxusheng1024@gmail.com,
	neelx@suse.com,
	atomlin@atomlin.com,
	chjohnst@mail.com,
	mproche@mail.com,
	sean@ashe.io,
	steve@abita.co,
	rishil1999@outlook.com,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v9 tip/sched/core 5/6] sched/fair: Use list_for_each_entry_rcu() in print_cfs_stats()
Date: Thu, 29 Oct 2026 09:25:10 -0400
Message-ID: <20261029132511.712391-6-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029132511.712391-1-atomlin@atomlin.com>
References: <20261029132511.712391-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH5P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:1ef::27) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO8P123MB7811:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fe218b2-1d71-4126-6dde-08df35c029f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|56012099006|261009223027099003|261022075727099003|261026121527099003|261028144727099003|261026140227099003|10067099003|261021121427099003|261022105027099003|261021123027099003|3023799007|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	RaAwRGbUWpoIDgu3o/3IV2aqueUv6wq5Rx28Gn7mzCe3wGT5c6Ue9VqBSjD6zQD0nxneIOtkqLjIDJ4GnzxTJW2oyCQNJa9T5cQyZK1gGKegyNEg9CG7x9sWzUW3KBGvlM0JFnAMP2q/UIyNiH2LbI+GDJvH+VpakKaoiEOeYEpLHzqY1QQzZgp8pj2kE6IKyoX9B5rLaeS0BACu8ZYdFDoH7ADWE51KX9V1XvnZyxFgn1ugxvR2xWMVSFsQtm2nNHZ/FSHmsY/u/aPcC5x61UqTCDMxJhnJ6NLQo8bEMpesqJPgSMKBsvpB6qxR+gsjzlKJJg3+MS/QgHLrFORAIs+NNxNjouO9zv2JX5NOzg/LDKgky/yzaDEA43QG3HF5LCMlqOsmesv+keyxMaDsPnBxqrNXNf4ORyxfd64g4gLbpzmS1yzkMyeavMH8jaGR4oNQyAXvj1NAB1NeZSQmXfde2lldLxZEh3Igg2TiNwLeuckWfCOpX9gvSiPUq6nV8PeMYXFRDTO4WgOcYJZnH086leMXey1bmHBQOUhvxk99Ru5U6geyXh1GZFtDQmLWxhK2ZFG66qfeb/u4u66YF2c7Qx0dwI1aPo+8OVaOB2He8KHlAlFRKRFPdxt1xbCj2WPcTt5ucK3qChXt7+G1goFRpaA1LTN0WvkwVOYqpUU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(56012099006)(261009223027099003)(261022075727099003)(261026121527099003)(261028144727099003)(261026140227099003)(10067099003)(261021121427099003)(261022105027099003)(261021123027099003)(3023799007)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lblBEM8tmqdairoFJVsF8190CQQuF5Rs0bHIntqRO1dMgC4H7wMT0595RKJs?=
 =?us-ascii?Q?OltSk3X53gUhyaNBrIwdWPv9av0aecrnvgJnlQXbJ4DY6Gt6lyOuNMPl5v8h?=
 =?us-ascii?Q?95glxqjYJGCjNnorvvqw7UUIB5SBAsLud9Ydn/5BHlJyktD/S+k8IIYBMpQh?=
 =?us-ascii?Q?ZAcJ8NoU2bxd8/rrNLJ7g8qvnk4/ouakLBqjFtFUfPtzacRNzfV+pqqVdzxr?=
 =?us-ascii?Q?tv4dRExdMXYZXCO6EC8DfMndha7NUTdtW2SA/B7/gz5dJ0Kh42NoSoFZ0//W?=
 =?us-ascii?Q?r16Zc1i7tQwFKUA8aIQPxjVD2XNmh4cPg2u61tWJ7owgEk37zis8xmo/iPSd?=
 =?us-ascii?Q?6lNVE1TiwX3xIKbpM0H4dcx9KAxviBfbYwTLeFId52ZCZ/KHTBSKGZ6Zoq1a?=
 =?us-ascii?Q?kAds+fY0MlLvdelPdpnoexGIaG+0XXtfOmZyQvDAHh1tjk2ObXSBaPVH4hFk?=
 =?us-ascii?Q?54nZpibkMhHDE4K+J+b0xPOsqgvTpYZ6N3/ugtaoImxIDg6cjicpSFn605Gq?=
 =?us-ascii?Q?1B/RdUQMYf0rqG9arUPiIvqr67blzpEtX7wqlZCthRypJqEboj+bdK1sjXkP?=
 =?us-ascii?Q?bazaOSnUZ0yQV9CpRsKE5xxj/JgHB482XDXuaOeUz/bN+yUq0YVoPVosYBnC?=
 =?us-ascii?Q?dZd89SMIPRS8VFLPZ6DPF/faOfUN+a5ZfPpx/hk88TqS2s2PXwv6TdJs01sN?=
 =?us-ascii?Q?K3Yu/gKpsFhayfwDQWHwHrk8KPSjEhaquEHDXKeZ6himuo4u6xmz45aw53it?=
 =?us-ascii?Q?uw3B4SzgSf7xlh+NlLJ7zGnm3UaaU8fUYdHh9bCQX1ZmV0B0afkZDX7K2kQB?=
 =?us-ascii?Q?bSrra/H7tqrLjEK/83AgY5vDwXeLpuvn6PRCkFzwJHxaa3+Kxn+rwnMY+11w?=
 =?us-ascii?Q?F/I6+ZI0AMCUm8+wRFfzkB57wg6aCQ0QiQrgcO2eXMEDtV7wfwNv/IRyIxgi?=
 =?us-ascii?Q?MIIXHi9Ytnuhcaojy3NvJ235H+WM3VIdYr+VN7w7tWDbd7wZTYXeCojgvq8q?=
 =?us-ascii?Q?mtdAQNluhXc9rvIddu4kUhK3z/b/IRcN9dzAWdxoD9YWaXRX4HdCzcM31ZZh?=
 =?us-ascii?Q?j3+dugHnWx6jcwqSIcDZUlUCRQzQV8Qvi0ZKA3VsjHorgeu587PJMMahsV5h?=
 =?us-ascii?Q?gowwIXPrgEFEqm/GkJB+nbWX6twn+d1iPpNHe+XWtOggrrw12E2xm9cP8Pyg?=
 =?us-ascii?Q?gWLTH45yoOFDPIyj8HPoUdUWkFDuR3ZFaAddSzYaApSa0o0T8qOyLl5vYc9j?=
 =?us-ascii?Q?gZgc54ybavGVvnbiSCuymdgKuaN/wAnJ8sG44CICosz6KhYPfX5r3mcReXDC?=
 =?us-ascii?Q?mUKcmRonvNs8ifWjBOz11t4icjVwDSUCoiQhTvhocF8+Uo8yRvEEIIPrPg8R?=
 =?us-ascii?Q?SJ6/LdNohKAnB5WM/gmftiUD+G/+1YyRWAibt0lAmeqbQjOktngm+Qlyzwrz?=
 =?us-ascii?Q?pSlb8rfW2PCebmhFybIRbow7DXvfPC083bm/dUSidpmJCeObW9p1gEZygFKS?=
 =?us-ascii?Q?Wp9iakzkeWwYZO0WFBW9ww1XLC0zV4J/biuIPgMLxCjLpHm2oIG7lJEClRvW?=
 =?us-ascii?Q?UKZPvU/pN+9bi2DgMuDa1RJD2AHYkqB24V6/JN47XedXiu0Qaz5TXZw9M0in?=
 =?us-ascii?Q?GMpfeVBSQUgBfTR/PMQ6yM9th8DJLXDtQyyATy6/yJIKDO+6FW/b7wbx+XkJ?=
 =?us-ascii?Q?e4zUWhygrVegaeIbxv+e4rmS5P+UAYOjL7yTbS/pUiT+xEJt1PWyGk7CHGaw?=
 =?us-ascii?Q?BKowXRk9CQ=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fe218b2-1d71-4126-6dde-08df35c029f7
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 13:25:56.5462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oOKkHtE4jdzhL4BeRxgGsRIfUd7fmjDVOjllOp9OHYl1fshBeROvQoVl+h5uBhRU16rJF6Iwxf7flaiYRcmT6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P123MB7811

In print_cfs_stats(), rq->leaf_cfs_rq_list is traversed locklessly under
RCU using for_each_leaf_cfs_rq_safe(), which expands to
list_for_each_entry_safe(). Although rq->leaf_cfs_rq_list is modified
using list_add_rcu(), list_for_each_entry_safe() is a non-RCU iteration
macro that dereferences pointer links without READ_ONCE() and pre-fetches
the next pointer without memory ordering guarantees.

Without READ_ONCE(), the compiler is free to re-fetch pointers or reorder
instructions. As a result, a lockless reader can observe a newly inserted
cfs_rq's pointer before its internal fields are fully visible, leading to
reading uninitialised data or dereferencing invalid pointers.

Furthermore, in the core scheduler, cfs_rq structures are embedded in
struct task_group and are enqueued/dequeued dynamically on each CPU's
leaf_cfs_rq_list during task wakeups and throttling. Because this occurs
in atomic fast paths under rq->lock, deferring list deletion with an RCU
grace period or allocating dynamic proxy nodes is not feasible. While the
underlying task_group/cfs_rq memory backing each node is safely reclaimed
via call_rcu() (i.e., sched_free_group_rcu()), immediate node
re-insertion can modify cfs_rq->next while print_cfs_stats() is
executing locklessly. Under continuous list churn, lockless readers
could experience backward jumps, resulting in unbounded list traversal
inside the RCU read-side critical section and triggering an RCU CPU
stall warning.

Address this by:
    1.  Introducing for_each_leaf_cfs_rq_rcu(), which expands to
        list_for_each_entry_rcu(). This enforces READ_ONCE() and proper
        data-dependency ordering on all architectures during list
        traversal

    2.  Using guard(rcu)() to ensure the backing task_group/cfs_rq
        memory remains valid throughout traversal

    3.  Capping the lockless list traversal with a per-CPU
        circuit-breaker ceiling. This represents a generous upper bound
        for active leaf cfs_rqs on an individual core while guaranteeing
        loop termination and preventing RCU stalls under list churn

    4.  Emitting an explicit truncation notice if the ceiling is ever
        reached, ensuring transparency in debugfs

Fixes: 039ae8bcf7a5 ("sched/fair: Fix O(nr_cgroups) in the load balancing path")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 kernel/sched/debug.c | 39 +++------------------------------
 kernel/sched/fair.c  | 33 ++++++++++++++++++++++++----
 kernel/sched/sched.h | 51 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 83 insertions(+), 40 deletions(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index a22d64647bbf..b29159513e2a 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -11,17 +11,6 @@
 #include <linux/log2.h>
 #include "sched.h"
 
-/*
- * This allows printing both to /sys/kernel/debug/sched/debug and
- * to the console
- */
-#define SEQ_printf(m, x...)			\
- do {						\
-	if (m)					\
-		seq_printf(m, x);		\
-	else					\
-		pr_cont(x);			\
- } while (0)
 
 /*
  * Ease the printing of nsec fields:
@@ -927,38 +916,16 @@ static void print_cfs_group_stats(struct seq_file *m, int cpu, struct task_group
 #endif /* CONFIG_FAIR_GROUP_SCHED */
 
 #ifdef CONFIG_CGROUP_SCHED
-static DEFINE_SPINLOCK(sched_debug_lock);
-static char group_path[PATH_MAX];
+DEFINE_SPINLOCK(sched_debug_lock);
+char sched_debug_group_path[PATH_MAX];
 
-static void task_group_path(struct task_group *tg, char *path, int plen)
+void task_group_path(struct task_group *tg, char *path, int plen)
 {
 	if (autogroup_path(tg, path, plen))
 		return;
 
 	cgroup_path(tg->css.cgroup, path, plen);
 }
-
-/*
- * Only 1 SEQ_printf_task_group_path() caller can use the full length
- * group_path[] for cgroup path. Other simultaneous callers will have
- * to use a shorter stack buffer. A "..." suffix is appended at the end
- * of the stack buffer so that it will show up in case the output length
- * matches the given buffer size to indicate possible path name truncation.
- */
-#define SEQ_printf_task_group_path(m, tg, fmt...)			\
-{									\
-	if (spin_trylock(&sched_debug_lock)) {				\
-		task_group_path(tg, group_path, sizeof(group_path));	\
-		SEQ_printf(m, fmt, group_path);				\
-		spin_unlock(&sched_debug_lock);				\
-	} else {							\
-		char buf[128];						\
-		char *bufend = buf + sizeof(buf) - 3;			\
-		task_group_path(tg, buf, bufend - buf);			\
-		strcpy(bufend - 1, "...");				\
-		SEQ_printf(m, fmt, buf);				\
-	}								\
-}
 #endif
 
 static void
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 201864ef8c61..860a04ab060c 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -419,6 +419,10 @@ static inline void assert_list_leaf_cfs_rq(struct rq *rq)
 	list_for_each_entry_safe(cfs_rq, pos, &rq->leaf_cfs_rq_list,	\
 				 leaf_cfs_rq_list)
 
+#define for_each_leaf_cfs_rq_rcu(rq, cfs_rq)				\
+	list_for_each_entry_rcu(cfs_rq, &(rq)->leaf_cfs_rq_list,	\
+				leaf_cfs_rq_list)
+
 /* Do the two (enqueued) entities belong to the same group ? */
 static inline struct cfs_rq *
 is_same_group(struct sched_entity *se, struct sched_entity *pse)
@@ -472,6 +476,9 @@ static inline void assert_list_leaf_cfs_rq(struct rq *rq)
 #define for_each_leaf_cfs_rq_safe(rq, cfs_rq, pos)	\
 		for (cfs_rq = &rq->cfs, pos = NULL; cfs_rq; cfs_rq = pos)
 
+#define for_each_leaf_cfs_rq_rcu(rq, cfs_rq)	\
+		for (cfs_rq = &rq->cfs; cfs_rq; cfs_rq = NULL)
+
 static inline struct sched_entity *parent_entity(struct sched_entity *se)
 {
 	return NULL;
@@ -15897,14 +15904,32 @@ DEFINE_SCHED_CLASS(fair) = {
 #endif
 };
 
+#define SCHED_DEBUG_MAX_ITER 4096
+#define SCHED_DEBUG_TRUNCATED_MSG \
+	"stats truncated at " __stringify(SCHED_DEBUG_MAX_ITER) " iterations\n"
+
 void print_cfs_stats(struct seq_file *m, int cpu)
 {
-	struct cfs_rq *cfs_rq, *pos;
+	struct cfs_rq *cfs_rq;
+	int max_iter = SCHED_DEBUG_MAX_ITER;
 
-	rcu_read_lock();
-	for_each_leaf_cfs_rq_safe(cpu_rq(cpu), cfs_rq, pos)
+	guard(rcu)();
+	for_each_leaf_cfs_rq_rcu(cpu_rq(cpu), cfs_rq) {
+		if (--max_iter < 0) {
+			SEQ_printf(m, "\n");
+			if (IS_ENABLED(CONFIG_FAIR_GROUP_SCHED)) {
+				SEQ_printf_task_group_path(m, cfs_rq_tg(cfs_rq),
+							   "cfs_rq[%d]:%s ... "
+							   SCHED_DEBUG_TRUNCATED_MSG,
+							   cpu);
+			} else {
+				SEQ_printf(m, "cfs_rq[%d]: "
+					   SCHED_DEBUG_TRUNCATED_MSG, cpu);
+			}
+			break;
+		}
 		print_cfs_rq(m, cpu, cfs_rq);
-	rcu_read_unlock();
+	}
 }
 
 #ifdef CONFIG_NUMA_BALANCING
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 6607963efa30..93c1f4399a23 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -777,6 +777,18 @@ struct cfs_rq {
 #endif /* CONFIG_FAIR_GROUP_SCHED */
 };
 
+#ifdef CONFIG_FAIR_GROUP_SCHED
+static inline struct task_group *cfs_rq_tg(struct cfs_rq *cfs_rq)
+{
+	return cfs_rq->tg;
+}
+#else
+static inline struct task_group *cfs_rq_tg(struct cfs_rq *cfs_rq)
+{
+	return NULL;
+}
+#endif
+
 #ifdef CONFIG_SCHED_CLASS_EXT
 /* scx_rq->flags, protected by the rq lock */
 enum scx_rq_flags {
@@ -3485,6 +3497,45 @@ extern struct sched_entity *__pick_root_entity(struct cfs_rq *cfs_rq);
 extern struct sched_entity *__pick_first_entity(struct cfs_rq *cfs_rq);
 extern struct sched_entity *__pick_last_entity(struct cfs_rq *cfs_rq);
 
+/*
+ * This allows printing both to /sys/kernel/debug/sched/debug and
+ * to the console
+ */
+#define SEQ_printf(m, x...)			\
+do {						\
+	if (m)					\
+		seq_printf(m, x);		\
+	else					\
+		pr_cont(x);			\
+} while (0)
+
+#ifdef CONFIG_CGROUP_SCHED
+extern spinlock_t sched_debug_lock;
+extern char sched_debug_group_path[PATH_MAX];
+extern void task_group_path(struct task_group *tg, char *path, int plen);
+
+#define SEQ_printf_task_group_path(m, tg, fmt...)			\
+{									\
+	if (spin_trylock(&sched_debug_lock)) {				\
+		task_group_path(tg, sched_debug_group_path, sizeof(sched_debug_group_path)); \
+		SEQ_printf(m, fmt, sched_debug_group_path);		\
+		spin_unlock(&sched_debug_lock);				\
+	} else {							\
+		char buf[128];						\
+		char *bufend = buf + sizeof(buf) - 3;			\
+		task_group_path(tg, buf, bufend - buf);			\
+		strscpy(bufend - 1, "...", sizeof("..."));		\
+		SEQ_printf(m, fmt, buf);				\
+	}								\
+}
+#else
+static inline void
+SEQ_printf_task_group_path(struct seq_file *m, struct task_group *tg,
+			   const char *fmt, ...)
+{
+}
+#endif
+
 extern bool sched_debug_verbose;
 
 extern void print_cfs_stats(struct seq_file *m, int cpu);
-- 
2.55.0

