Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022130.outbound.protection.outlook.com [52.101.101.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095F337268C
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787869114; cv=fail; b=RFbUEz2Dypx9CdBxc49T5BKOGIHbKYfm+J8lzrSYTaSOzBEpGFiEf2ZufKGLE68FU2Gqle9nafTNujbCM7ibQWa89qWf0F3/qKFsOOOoGbbk9sd7dwLCL4y1Nc/6nDlnK8L7NxJDAHwng6xMkWIRS9ysdpU4NYTS2nReeXw+RTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787869114; c=relaxed/simple;
	bh=I6UnR6/cucTJl+cQyspHyYbEHqlSglcT4O8dqtZ8eDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oeyD9Dk/wpg2HnBBhtbSJIkq9fG0ls1z/IUM+kgwZPakdFySB4cIJ1GUGfCDXiidwyWtA1+r0opqVmaMIa9Y4cy8i6MdAwdIRMU767Mf/i/xHEl65OEAvlkJBAYsdYdWGqnEsyuaeX+0hSUlPmCtoM7k98nq/hc8JTyoBveTqI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.101.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pAlg4sIciTzaSKZj5Z1ntr8f+fo9xaldJ1EVyeG47TkE+/XvabTopoRjuyiU3G/Jn88v9sXzWz9bU2n2yucLg227h4beRVwwC+X7UnwPTaEfjKcPeBCywQqPmVeDx+8GHbSjZUNa1N6/25/TI26bdkVC9IBSnbd9kj5ZWOGZF/L9VhD5B3/7oau5gkiSAJEhfh/fWrJu6hN5nODROn4gNVjxP8SZgMSAnYqxIXurrBtzN23C7Lw2z5PAjpiWM7on4XIq36zis/zZWk2x+MQthcdyXOJF0OXWmuLOMeCAuS2BBTZEqYCxMWFj4wnDFSZ/tPWPPrt3bwxAMvnkqeZsOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=A7/SgoIeLjemO3i865rgZpto0uVuDj9N+2XbLdcG0so=;
 b=KzmgZLsbch5Exd+8J5fmFo2D4fuQskMeD7KVgQX6y6AGxEOS/ybxiTx19VK6wbHwMZVgmryqtEDcAkJBwzsEJFhjSzwCtRFFp/ryzR6CWt+UXTJtZOgDXfFRM05OZG6XnzxLy6tFoXbQUk3Mi1SQHifcStxuRl7CCCW3GxI7YCXIe5BOrz/svS0t2w+EsMkqd35qGK7gesP24SHhWYXCE5bCm6QsUwqTNCsHSKg8XkDfQ+FXxcsPMuCBwZPYbEboKyBV+f0x1gm0TdUhkEls8BT9phqEfPKiGebGrGC6mSdW7E2UgfLfT9L2NAvJwmvjLcHTvnVUa3+fsQ0+qAi5gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO6P123MB7095.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:342::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 22:18:18 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 22:18:18 +0000
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
Subject: [PATCH v9 5/6] sched/fair: Use list_for_each_entry_rcu() in print_cfs_stats()
Date: Thu, 27 Aug 2026 18:18:07 -0400
Message-ID: <20260827221809.988394-6-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827221809.988394-1-atomlin@atomlin.com>
References: <20260827221809.988394-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0039.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::12) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO6P123MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: 28a78688-27cf-47c2-e6eb-08df04891887
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|10067099003|56012099006|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	94kDyjob8R30W08QpWPjDKjsmL6cutp9tam13FHD3fYq6LiSprnfCq8FoWu4TW6shyPh/M5v+wk/QFP3jZkWXDW3UNtc6H1ELEA7FeT+9I8STjLNHQMHqhP0sc7YVXNQokb70twtsZWFllqLif/4WF72aRjBFzB+zWlSDPuHX2zw52IS3kv5a36HhCGIu3ob9CFGgw64XhO2nShWhQpEWl7g/n/tWg1SqoiqYBwkzUAuKZWvrDoY3a0R3DwiR10rmRPaAAxZ+dfZ1feFkM3Pe1qbjJA7X7uPIz6QSCKABPPgrLFCAn6CYKN+aNhyKtjhasJ2oPbFxwPLXT1atiHqjqcpGWiZBBNDaGLbRsBDgRjuoh2JfOtWlKBkL5JAUWUM/W0kQlIssIXA/TK/ppkQTkZlcKBvIvHSZqWyOsfFa6ex2YN74ZZfxbhkciFuY3NuMfF8N/fggoX7AZstV7j6mmNhlw+NxKfsORt8aiIQ0U2H2y7Qc0aZxbgHvM7eKA8x8WV+k2fofgtgSyb6GyCgDetr02aOfQMKDgMFu9j7lmd6Hg3iFB2NeoTykRMqJz6twYUca4DRmj02ayrpytrQF+oaimKLPvY67eJiTdSXADUjGZwLbIk7mHDAp8CZ1ySPAFJj5Aacdh+/RJFKPxm9vCIMmCC40fnhDKp3x2pKjJA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(6133799003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RvZ38U16pCG/yb+OAIKBPVzGuZbdzBFvaoNZ9tHEiiK4f2uAtg44QZqzqsMN?=
 =?us-ascii?Q?u5BCC6Bjzp6k27XV4q5dSzrnrjgqMvMEviSKBnTfStCqO/JRaSmU8hUiOjIl?=
 =?us-ascii?Q?hh5uVhnbeW4JxuQIdkMik5KuIBaEQGC4vTXjhmbrUVnq8IgfTmmHU1KC4H3O?=
 =?us-ascii?Q?s8yhdcgmOtL9/eLqHYflTUMFcd5DyjA0xXeJIlYu1nnry0MLhXbw+tnCC0cc?=
 =?us-ascii?Q?0w/zhEoC6wWbiD0bNbrfZw4L6GRqIhj/ohzvXapXU96HNnYIPD1+mMpIiuyK?=
 =?us-ascii?Q?Qe9+KaANiyIGIjCvMsJb2DyWj84REfcwi2oko+OwuZAMKq+2WqbLi/oBuf+4?=
 =?us-ascii?Q?Yskvrqj9j3V/77grNBW6j7S03yuXd4H4pdDeYR9n7tbDBPUAqzfzkdxPVbOI?=
 =?us-ascii?Q?4szSV2EK+T8VrSXk3v/mfhqqZB33e12PWApVXR0paxrXNNSoox7fX/t0Qj5g?=
 =?us-ascii?Q?M0Z81oQiuElfXN8ehzPmkiKnBleYnOCT1JJnBi+u7I5tPxO4L56kztrrUT2o?=
 =?us-ascii?Q?++04OCKrqCx8WC+7b0uq1tr+hrC3+HfGJMS7MFcem62KgwgAbctVm8D0+cN3?=
 =?us-ascii?Q?TjfTvYLasdtxFb1qFh22mAUInbPSHSk9dHCyy29x6fsoUAwJaHBWSN3jik05?=
 =?us-ascii?Q?uczE9OYnlfQZtzvYBCa/ibHVqYKlzcd6298sWgYKMKmmln4troBHqYen3/mo?=
 =?us-ascii?Q?d7nkIKjMesfZbb2aEpJl68J6M60+W2NmAYIm1gv5SiXsgeEXy+fQ82ffvgNg?=
 =?us-ascii?Q?b9CJr4zrRNX/d157CAZ1pNHa3vPBDoPft4Ubv/1hr9IzGkDciQQn1wq1R9b8?=
 =?us-ascii?Q?CxaS8rl3SOs+udUXda/Cl9QZDGBh4QM3bKA4ei06CaVMlFsEuPlOdj1oOwYG?=
 =?us-ascii?Q?qf5VKZQS7VnrpyENrIcmQdssX5L/+be9FFFxUfgjtlkqGfMfehICY5p72k3i?=
 =?us-ascii?Q?nS1Xn2LvJa8DDLIuGq13rsNfvuO3UClaxjLP0hJC6/7Wghaj3WWImum2s9bK?=
 =?us-ascii?Q?t2QKT4BWNtOR/ZsB93zaDfTBfcwPVlEQW4YTiRnznUianII6Esw+703ZT16e?=
 =?us-ascii?Q?MA6Q/0mX7w+modALQFP5KZ/UbowRLaBoqeQLfjw1cVoe8gjQwIw9hOFMBMf6?=
 =?us-ascii?Q?IVtFhw+yWkHbg8FWnIr1Y3Gh+noqVreKwHoWWa0//9kn0ZpsJBQ+96veOHFf?=
 =?us-ascii?Q?Ghx61TEsjnL+ysclQDK2F1Ty1ZaVcK+r/3uehZYJCrpW7Tr1QAcL+i2wORBX?=
 =?us-ascii?Q?34t0sU6CgvlnO4Of4LOvTmWATX/LqECFPL/001Ycgob1nLCLhhLca3sJXNiv?=
 =?us-ascii?Q?sTtJ8YNFWE1AuZ0G/9efYRNH5Yq8QUe4ekgddAtv2I1XMHvfBl7JUmK2azHH?=
 =?us-ascii?Q?P3ApgO0d767Y00ZY77ecEJPl4Dq0g796cil1WZVTVm4JpLCye4yRwqHie7if?=
 =?us-ascii?Q?rQjvXgB7EhphRb9JEdx2AHwjfCtG0f6PtkPjrzn6Se6eydHlFRa5j7JAXikF?=
 =?us-ascii?Q?3ppoP0VPzza2oj3iJ+00K0iz3vkwbrNiMUugi72JNNEp8BIgfq4kBQySwh3Q?=
 =?us-ascii?Q?iztA76f+Qfa9hrOSeNXh5et0uwuKWtazItiL8KJrI+mivAQHU14XjyPCEuPf?=
 =?us-ascii?Q?lG9rZ9c8dWywt0e8AWhdPk6+lQaok2SXC1Vpq0MXvYhcHrtbNiHaWypVoLFk?=
 =?us-ascii?Q?p+RbEAT7GwoFQ9V1VaVGwDqaSpP2ZNfdxjuTHgZG2LgTPOrT?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a78688-27cf-47c2-e6eb-08df04891887
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 22:18:17.9439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FXrU4Qd6IEGrjFBDQa914uZLeapYwaGgy+1HBxLLCqSuOIiY8gZ/pHo1IzWNAFL7/Jamg+zF4VUIh0hP5B5nVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P123MB7095

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
index 1b6d2a83d50f..ffc55b89801a 100644
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
@@ -933,38 +922,16 @@ static void print_cfs_group_stats(struct seq_file *m, int cpu, struct task_group
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
index 687999312a7d..c6b25ac2b844 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -416,6 +416,10 @@ static inline void assert_list_leaf_cfs_rq(struct rq *rq)
 	list_for_each_entry_safe(cfs_rq, pos, &rq->leaf_cfs_rq_list,	\
 				 leaf_cfs_rq_list)
 
+#define for_each_leaf_cfs_rq_rcu(rq, cfs_rq)				\
+	list_for_each_entry_rcu(cfs_rq, &(rq)->leaf_cfs_rq_list,	\
+				leaf_cfs_rq_list)
+
 /* Do the two (enqueued) entities belong to the same group ? */
 static inline struct cfs_rq *
 is_same_group(struct sched_entity *se, struct sched_entity *pse)
@@ -469,6 +473,9 @@ static inline void assert_list_leaf_cfs_rq(struct rq *rq)
 #define for_each_leaf_cfs_rq_safe(rq, cfs_rq, pos)	\
 		for (cfs_rq = &rq->cfs, pos = NULL; cfs_rq; cfs_rq = pos)
 
+#define for_each_leaf_cfs_rq_rcu(rq, cfs_rq)	\
+		for (cfs_rq = &rq->cfs; cfs_rq; cfs_rq = NULL)
+
 static inline struct sched_entity *parent_entity(struct sched_entity *se)
 {
 	return NULL;
@@ -15580,14 +15587,32 @@ DEFINE_SCHED_CLASS(fair) = {
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
index 6d45e67bcdc3..c70807f17104 100644
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
@@ -3413,6 +3425,45 @@ extern struct sched_entity *__pick_root_entity(struct cfs_rq *cfs_rq);
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

