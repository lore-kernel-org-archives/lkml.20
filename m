Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021095.outbound.protection.outlook.com [52.101.95.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CC1495020
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787784178; cv=fail; b=AykU/ikv70k0r90XhfE9AyNr6Uf7rasyPW912P3t7DBYb45FeSNAIzhDy1JtfA6gdbX0ggqVymsUfX+6oPBHDft+UcMro7XF5I4rmlB2buQ3nvXfa1G6owPdQE+WWqzoKfQkfOVo5QYxIgmstXYcyBpA0B4Xp28zV/XuQAPQq+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787784178; c=relaxed/simple;
	bh=Oa1G3RU1BDKDaSq1dIOYkSjopoxZUTLMp1qL92eGiFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=stkXvVVpEYReFOTWgTpVXPFFFTGAd4vMFg1MlCnF9hv0hnB+6W78BEWieTJ3eAbfFUdAm6AHL9BUlmZNy0Y2TJDDvtmXoi28foFpQvxXM8PUyiMMOuZx0sAuDGsmhWwQgnXihobvi6cr0/My1li7KFMPvo0dfHPInTX2oa1MGvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.95.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NzpYzBV3q7e1Ik0m6bPvaDDmxwcP6RwivRXY/jPdBcvQXH7Q4OeJNBsH2KfIa7N1CPxeMFyxz3ETAkLNmZ1SWDHplFWTy01/aD9Zc7xFRhwN9q+0eNV2uzVVa4ZsMdNiw+yecpIa9+U3Dl8adXvhj+popeZp+iKxTGVEDWk9JWFWWU6x4k6thzSQmhkUMMHtNhEJXpLAGl5i8mlhOYaKwVSGuss7HEg7izT9b0Q86JDOTuMs95GuOouhqmwwCCymFAqZNXy0pbcJpBftS0f76DPbJYReBy8SQ+hymwY9rjPWNnsqXVTZKQMujIbd7R/fqz+KFYa9yUC2fPW9mCwgGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=Pz7oFwmepajycl244iD2BqUh4m5KH4ukGu1ali543bU=;
 b=xUVkn4ocyHw5wn6oE6yggD33vFu2/qOFTtRVaaEPNa/1nhUX9cfffizycgCJrDoRK/1Y325QaLZRNL7vNNM8t8AfxjLjMmDKSPPwepxRRBqvCkxFk16iS4YXRi7lJ75LejAg1zyIto8cLoEeIntYbsiemmJIkSbyXJdfHoKiGSp7zxDUEOtwF7A+4x+4RzC5ZydDwNxvROn51UfbOeqcTIsXGmYrm+ccg+AeacZS4A3zMVrPmGphKXEDxz5ZJ8JRzMhLxJUAa3QdSZ5KGVw5FnRY3qKBGwVlK88XocJ25zdOeTaWdxRrmbk16SlpctGHDssFKHLwpSKpb+V4SQcAwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LOYP123MB2896.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:e8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Wed, 26 Aug
 2026 22:42:47 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Wed, 26 Aug 2026
 22:42:47 +0000
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
Subject: [PATCH v7 5/6] sched/fair: Use list_for_each_entry_rcu() in print_cfs_stats()
Date: Wed, 26 Aug 2026 18:42:37 -0400
Message-ID: <20260826224238.936456-6-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826224238.936456-1-atomlin@atomlin.com>
References: <20260826224238.936456-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0666.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::17) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LOYP123MB2896:EE_
X-MS-Office365-Filtering-Correlation-Id: 270b009f-b027-424f-edac-08df03c359e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|56012099006|10067099003|6133799003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	A1rPrn+SiqOG3w42aPvDOxz3fWe83JYDb//MxDCjN99xDyVrl+wpARE68arXzgVHrC77s6K9rx9rYn2fZ5/za+wCmikeAQC0iYzu+7GlSI8k3G80Nh6/LUW9pkmWSfGM7OmzyldVewHNNYTeJaotRul0QyMkQyIyt2EGmtR4szh9tuY2F1hc57a1II9vo3xGeMJNZY6A7WbFfUmungr5CAFO1rW7nA+z3/V0bA/UzqPMsY3vM+EarOlHI5a7I55/76xWe6LU82XNVymJxcyrTsARA6HnC6Vo0TC5RBwzuyzd9jqUSLaXSen79kFbL8p+pH4lfqjCNQYLnPg3DCkfcDEol3J7axMYiNrnn8abhc7ZJdMwu3hnjl4A5SkfLETXkDarC52iL/F4jad7tC/muYpEwG32AF2pF5igAtDIT2JyT/FssKZiLpOPQMEQcAkP88xlVqh/xns4K6ZMba1Fqx8VC2JKpWeML7KkK4KNWFF5yWPEPlCGgMW1QwCwe+gmbLhkc3V8wYjpc/A9dXpB7c9iNHK0xHyW1xCSZKFGMRCUaViJir1IkU8Q7KuJ35kWTxO8EyOtgEZ2tNHP6T6Cd72yiiI4kva1A1LRC5lFRjBAf9lH+LSqMrVRY0y2bL6IT1OFv1LvibvzXXIwdg5uEQJqOwLsevWN23R/KxkLQE4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(56012099006)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TNHCsuXtXcpQAXbAdodf+DbZ5okl6tu/gBi2eqOD0xmalqu+ck1tD5cXvo5E?=
 =?us-ascii?Q?xxd99PCGJqi/1xNlz2EstPX9RZtEj/aqOBJme+2oDxmGXi2DF2ZGsyFcqKR0?=
 =?us-ascii?Q?y16rvvkfCdX0VUVkT5eAupKN3fIHhiDttlpktScFArN7Er0fSq2No4wPKg4Q?=
 =?us-ascii?Q?4OmIi3ybGBxbtbFbH4DSPYY5Lxm1NtHVkz+4F61BQU7aMTBst8EpEKkZiNCt?=
 =?us-ascii?Q?OsQ/lLqvvEOWYRG4bU1h3TzUty7B9eQwH9QWIvEI/4GFvAVE7dHOnTfEG5P7?=
 =?us-ascii?Q?v6tnAtvI7mtZ9YbElmqaLMKMo36zhB3R5im6dNEobuh00CK4lkEPZOnASRe4?=
 =?us-ascii?Q?fd+qlFyXO54hsrTLoetiDq1tu63k12qxVhBBFPDEAFpgzn53clwEG5z+q+m7?=
 =?us-ascii?Q?+o5WcFogBEolcOAtVKa7WVtPDr//uoXQv0Q8MPZbLBL4ye5OG+KZjCeqLQ3o?=
 =?us-ascii?Q?BAWsTMoiQ+diLl55GkTeQPoAGC7MhAWrJvPoP2irAkk8E3QV3BwULPtHBU9z?=
 =?us-ascii?Q?RPJqW5p2VH0xpaEjD0pPl8OKL2Mt0KUnxUVMXqVaRYj3fjmpGvB7JOM/inP2?=
 =?us-ascii?Q?RI9F5hHRsH36EIuI1aCLX+06wTIiCa0MTUTRJ2Xxcxtu+IdKwtlwAMa1IcOC?=
 =?us-ascii?Q?tUoT62dxZNb344jkMvJBQt6KMeUh/o3pxi6UqRnMYhaDxjZukic48f+m3vfg?=
 =?us-ascii?Q?YyksfyDaNHiMb9pyhxzudbmla6sAB3ojkB77jdFxW+OZSiZLwYxsrW/mZG/z?=
 =?us-ascii?Q?WG40f3xuC+ekFd6Cw7UbNri9gS/du03Qc2dEqBekW1A0Zu1d7zRanuS6D+Hy?=
 =?us-ascii?Q?w/muiwsSFsCT+NAiElIsXyS7nT9mzB20A3nJRr5TTgN/1pMX4GBZkugkae8U?=
 =?us-ascii?Q?Tp4khbJCTPj2Dxs/IvZ2il1pwW7n9ZUyHAkwuOsdKwMjHC0j87XVNLU/tjZ4?=
 =?us-ascii?Q?M5lt4EtO/Wb38B+/c+tNeo5C5q1r7WbUcNxxHL4+uIt+pweG8NzAADYgClS2?=
 =?us-ascii?Q?JTkMNLQsBXA6J/yH2qmgX3nPz4Pk+t0REbxmJdLykQORvta/GKIjFtIco6Vr?=
 =?us-ascii?Q?bDz89ZnJGZry1iy2UWm2E0npqh5a5c6mXUWQHAGhbMcw1jSGH0bs+lqicegv?=
 =?us-ascii?Q?aFgoQB41b1hghhEaBW9JWGm3aATAY45n2jvINwYJcW6Qvdq9L0N5YNC0Xg7T?=
 =?us-ascii?Q?kuFE2MOY+EvJuVWIwdT7WyM3TPlmKtvUrZPCANIFs7abA5307/fNBXZwi8qK?=
 =?us-ascii?Q?g1CeASJD4mXfyt5DdQzib0wP0yBQ6e3ok5csIKe/xUlh4f0uw4hmco7z6N3G?=
 =?us-ascii?Q?N3rx1zkuCCICXRAUjCJXaDMB9K2/EHp03p1IBRmC0Oxdpj6vdryjvEeFzOk1?=
 =?us-ascii?Q?pXW4SOLWSyIsKf1pIi4cXtkichixlX94B/3HID5lMpH6fg4UB8Il3y1nsg1X?=
 =?us-ascii?Q?nLc51+zSIGo1BQveueU0LbhYRl6jOlY/W0ewjKeT+cy7ppC6hIi8oky7Bje1?=
 =?us-ascii?Q?7e0CuBNqtOP3KHx7XbCLeoilvuqo0UDqYtO5CUKGy+MVseUdVka1mOViCF86?=
 =?us-ascii?Q?eVfQMxfGbrfGz5M06AmRRyfhIDpwC6TvdzFBz4uf4JMZfL9cMmEtjrMe24gb?=
 =?us-ascii?Q?FHAa6tzLGruJmtJly/R+FJuOdvbO/s+wAc0GSo8xwb4qi2yhdoTG4cOra6qc?=
 =?us-ascii?Q?euRp+5sUgZ/+JiJ7MdVpkSdrU7G/Kbral7mJjBx656wOiS6Q?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 270b009f-b027-424f-edac-08df03c359e9
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 22:42:47.2919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HGb9vIclF8UNtDRFh++HQ6q03uarRAnkQLaL7IdqG7KfPOw19ak4inOeAPRbuyOlp+Qb9ILotnIeCKxeEtzB9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP123MB2896

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
index 2a01854f0f1c..de453342481c 100644
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
index 51b28440d05d..0d3c11d2d809 100644
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
@@ -15576,14 +15583,32 @@ DEFINE_SCHED_CLASS(fair) = {
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
index 13a437032855..04ea253312f2 100644
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
@@ -3410,6 +3422,45 @@ extern struct sched_entity *__pick_root_entity(struct cfs_rq *cfs_rq);
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

