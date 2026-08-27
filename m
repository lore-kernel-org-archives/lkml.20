Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020079.outbound.protection.outlook.com [52.101.195.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA0D481640
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 19:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787859639; cv=fail; b=C/9YZ7zFngzgm0soh5vBsu95xuKJNm4Zu6bGSqpiz7eR8JRWGamLfdYeMfC+ORJQASOqifzZNR0VvEN1vAQBBNehK2D+k5lqSMON2CohvuKUPWeI4CeEDYCTOK9FBS0mIobKYeNwao03Lct6cxBXu/lmVAo4HxezYV6V9YqdQgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787859639; c=relaxed/simple;
	bh=y6MiWKBceHhXNBb2r5mqbtQdVJTn2adJeW9frPJOohs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SQTk9hPUgAI4HRneWMaIplKKSJGk1rVtN6no7SoBFx4LKpkMW+82rOc6/fF1lCeXeYTLci9tR5k3v0KkwK5W4iYL3epQCU9KiZyRg0fgyA5uFdNPF5l74sTW0BcfnZszPOF5gZwFqZwVRm1OUbFNml6pOTt101i4wOFR991hXCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.195.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nTNyqCzWfm4ilt8QO/OXcvW8zY9OU86F+Pya5NlX5Apu6RVJ/ZxLQUP5MBIwe8C1RG4eRXBR0SzvVAhnBTgpDv61gaHxNXnYhreCoI54Ahgyd9fdVEyskVEnGV0MZSg1h4fE0ZvXu+sFnhACVotXBZEGpKglQDZiMl/dyWGJtmhoETVjawIATRG12X96Suo6n/xaN3gMos7dULChUgrT8USL/ufvXGLFywlfbUWehi3lHHFtu905gc+qwQg4pOx6WH63vDrCbu2okTYPHdHKaImJrh7p/MGbEybcmGppVZJve8lXlB6xTiigot7DCHBbHiJJXMCKkuEp3KWGjig8ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=LvAnsWnRqXMxWiwWBRsloVsQ7q2J4w1WAHQBfz0GL9o=;
 b=tl5uhcc8MwwQhK3EaQtNjhngEZxJ6GN8gv41Mve3G/t9hxOfyVGTCY5GqG2oxUiI9PjHFl8P1IpMbSVBs3Vlx9ZFIa394biMbRQzsiyV0k4vu8a2yFFoTtge1AQIxiZcmtpUSG+5Pnktx5wKezk8lBjIyEOkp/eUMjfeJBjqS8PyUPkcfg0GikTHFVVhJK8+blivIF8MqStYdHRf7dw63MOjfYwKcyDHjiNAKiJ15so8UhWjGtAn4tHMTkQ8MbRtCzTEDzEJtWejQ4DfUHNWBrBe7UffWPIEZfhrAh+g47bkj4kMdMh4W+v1Wt188KdRoFsbJPBt0laR6VPXa4c3+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by CW1P123MB7744.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:247::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 19:40:23 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 19:40:23 +0000
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
Subject: [PATCH v8 5/6] sched/fair: Use list_for_each_entry_rcu() in print_cfs_stats()
Date: Thu, 27 Aug 2026 15:40:13 -0400
Message-ID: <20260827194014.977758-6-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827194014.977758-1-atomlin@atomlin.com>
References: <20260827194014.977758-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0490.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::15) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|CW1P123MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: 724845be-d3a3-4400-acb4-08df0473092b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|6133799003|3023799007|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	abG/kAqsbOukhM801xn2PAOL+KTTuAFxxUAdM7x1+xOb1rvxOOEDUmEvN8cp2K4snSZLQ4EvC2xFw53ssvCaVjNxo0qPB/FV+hk5q9XgrMWRycO1P0MRY7+p53R0liibO/OFjVMGFYDIKO17SClxDQzlMozKtD6n+MqWnfMOXxyEbrbGXNkeSPazEwWNPFzr5SiJrS8Sk2akSNRGMCoFWYAwMAsfPEy1Gv7ujFLaSkNy+Nch9CuoJdq9iDH4SI7P+zLKNKP0vtYhUd8XuS9YPXmvrR8wAabomLDCrrus4bHb6VIUlUknU2zMLZoI7aR6DOJN+JbXZq2JRCPJ9/MY+dIYcgnk2hKtVqlU1Dpgl9UrXdDFc24Dvb/tZOzMHW6POgNN91Dz9OgHJ3iabwiNus2nkmRTBDZfpW2T5WmgM1AN6V4vitRVfgysq0EL1wqbr1pw9z3PIWskdRSpTEkx9XrzzkPA+ETmi01ZiOw2eCgDiZapfU1ADVIArIbigL3TgdS+XAxGbf0aEfIxmYgfcCMDqwuWx5ynI9kZvNZAHyiir+g2qlY8Yr7eNedIbEALCNBlWRQfcp0pIHTFHgPwfZWU1HMXUqBMHA3moeMWqkDj4FyxFcUWZ/MnMPqiQ06ws55a4xZcc4QEk9kJOueGtISYrsmHJIvS5Tj+pPy6a7Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(6133799003)(3023799007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aTy94cvvKZlXz86AcySMGoBC1Cz3FNiLPwg+K3TbAppQV55aD7kbDVqVXGlc?=
 =?us-ascii?Q?ZyglQmc3p3oB/Jw74rE6AyQ0GkvIQNIJM/7sxdZsU3Vm3DpsHehYGuYqlAyu?=
 =?us-ascii?Q?8f9eqY/UjY5jTTQwv/B67RFFksEpeLzi/waIpYA0O0IlyUkjGYLDCTU/mT8O?=
 =?us-ascii?Q?0mOhH9k73xZAV330s6X37ZbJnvTeNWS+erDm5LG58188qriOFxAtriMB8KUU?=
 =?us-ascii?Q?8966vo6SNseSKqNy7pnGj4/UqQUKWRsYQPJP0QJtx42EGHtRNoRsY0nrJ0li?=
 =?us-ascii?Q?OLEpwb+FE7ElutG3ihAHahhZumJViJ7WKAEmaoYiUc0aafsHI70TzyIqBdKZ?=
 =?us-ascii?Q?CIYqQha8Df5eDA2rzn+dysbt1wrsFN/sJy9V/WHS+W9wv9LYnKJI4Q6YQx67?=
 =?us-ascii?Q?RRGPb2EBZVqekRb6gzLoaJwJspsTASc6qoVHqGWj6a8zSpt/Jv3H8UjK7Ygj?=
 =?us-ascii?Q?vYbGh2qBh4qhnihXqf+b9indCJzuBQ7SVQnehXWElgeOM9sDbXztg+9yLJRa?=
 =?us-ascii?Q?KepDlsHtS8Olq2BXIqJkM2bslL0Abfakaujp4pe24QMxc8iDg4bdunrCnIYK?=
 =?us-ascii?Q?RpfG1RgmFUdzDgWp/+AqcnVGXkUGGQquZ2mjgZH7kK2o27Hf97Z/hKsESD4r?=
 =?us-ascii?Q?rPGhsyDJuC97L+JVzGmfdXWOgcdAitZUY8Si7KtVu0M2O6AJA6aZT7Wjgnr7?=
 =?us-ascii?Q?9MT4A9zvP9wpNPCsq+VV+7YpXszoEaDYlxGArgzgwkv1WUcnup3VJGQFDi/z?=
 =?us-ascii?Q?PrKrYjejVFelCoweA3ZuD89CB8KsMtGvx1i3uNg1kDnvYKTU6fiE1YDGJjtJ?=
 =?us-ascii?Q?4N1r6OMeeZ7OtTWFmrWjgRs5zreG1u4G4YCSQ3tErqMBojNAXwyfzhZ8440x?=
 =?us-ascii?Q?nQrZ3+aIK8tS5S4JzgJbQWvqWZQbl0Mt/c6XlTiazz1a4sDO3g58YgFrA4iE?=
 =?us-ascii?Q?zN6H2JP73unrzAqJwkLmwNmjJ3w/13ZLypYfRPH8+itmL26yK8H+rbtYouAt?=
 =?us-ascii?Q?lv28WrSRQ5PbGNxtFPsbsb2A9ToAcmOhIsl4r9yKv9xXLqzzV77HdcbRJUHk?=
 =?us-ascii?Q?IZiY7vxXgBkuVYVl/ci915VIj1f18WrAUxK9sx7ZNWxBbQFGHWj8xiKiwlv1?=
 =?us-ascii?Q?zcmfXM2IIOkIX8wC6JuYaKr6ImFmvxkEd8v65fW4tWc2tbUCFTK/K/QpfQyI?=
 =?us-ascii?Q?Kat7nhC5BIjbGUE8fVQHCV7SGvTMqD//M2NYR5faacuZEwrM2sHiR0dD/Iwr?=
 =?us-ascii?Q?LX567Hvp7Fn/TvAx494z5JIdSV9gIjIxDcRPIem0EcUjCJlTTlYTE9WwD+li?=
 =?us-ascii?Q?tg5RXT7iCBmAiaRb1UHlbVI59IZR1Z6U/G4vrBsmr8dzQmPK/s4NHk1Slsd6?=
 =?us-ascii?Q?RxPbS11Va8WK50jR5ryLCUodIM+RmP0m4gcmcjEdpKGEhfhN96SlheMhv0Is?=
 =?us-ascii?Q?TsJ5EI+2vYo6giB4Ppq0dtesY/Ro+OtDiHqX1SJOUVfWq4JKeRhmLYgr0tdU?=
 =?us-ascii?Q?rQQ90ggOttZQo2PEtTk9v4oBn7C2MH2KTCe1YSG2O4C8KfwqmJ32EmR8W5Mf?=
 =?us-ascii?Q?z/ILnclHEK1ZwSg2yjEl0szzgKLQLaduxiM9CzjdIAahKP11Uw7hMrBsrceP?=
 =?us-ascii?Q?aPEo9RPD8fufnFfeDfZ7H1e02v8oeIzXlKq0OAMpyowy4hISmEwkWEwZBVCi?=
 =?us-ascii?Q?plEJD2YOJ9us05GeR4vU2ymDdaFIDocFnjmVxyvam6AXSr3Y?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 724845be-d3a3-4400-acb4-08df0473092b
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 19:40:23.2516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Td2CdYq/nGOV7zyY/ZkjDRNnUTNvbsozvfJDHxjAYWHvmnZusSriuuoUOMERbzrAxx4StdxTVsGm54F1CSujCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P123MB7744

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
index 018e124f2d69..30f99d3917d7 100644
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

