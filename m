Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.96.120
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793373213;
	b=ZPzWlQSfw69Be0aAnmTFuVlzMvx9X7oC/b/fKSMvUPRPY+Kdr2myHAUzGLfGgdxByX+Z
	 ql+euaC4jdXAVilaRRobvuQ/f+GvIPfAx3gwPUDyRQ/Qx7173r6PKl+huQQJj3A0gR6Kz
	 i4D5g1OPPWsNNDwasEkexwkb1TQjlpjLEOJniEH/8BoJSD6uAVzSxO5GFBds5Wsl62Ua6
	 QEHQ7ocgvr/XWRHNNISCLpTU1brm7lDbnv99FNRNWi91SJg5C1UvroM24nuZ0vVllBQw2
	 29HUOv3ht8Z/LX9+od0zCdc7xlZLGewON32kzS6vLImJnBd2gNWH7/JXjHGF3YOhRIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373213;
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
	b=H0MpenwYt70BSwVnuuEKjl8MrpYLinpQtB3cU5pf15rPaq4qqLuFwkJfLESvVkUy3C4r
	 rdn0ylfmTZxDz6+K+n7dfwp1TRt+YweQA9dVtuw61fT6OI0aB7gI9VW1Z96y4UAolJZdg
	 jPeTHoCm3yWCQ00yy2UgsA0PKZUaG+PV0eZuJOGPTpdrU/bBVt8dSW3Jj42wBkTMqi3lM
	 Adx41ChkTu/VXnW01fqDRxMt++J66OLGr5jpk4cNDO/BkCX3tGJ2HiVlY7j0MmAZuRqY+
	 Wyh+SR1jWT3pwELH8UTWGrHngAPe2OVGtSiOL/cGkuhSXz1Q8kRlaxWlRNhIassTcUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=atomlin.com;
	spf=pass smtp.mailfrom=atomlin.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.96.120
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022120.outbound.protection.outlook.com [52.101.96.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EEB60A2600
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:13:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2EEB60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPi5SoeeAuc5dCRj4CkJ0Wkd8BTdKNYzVcAEiKl8qiQAsSigc+bDubcKkR5j7qduiGXExUrEpc+2MpLnkUpimv1O2wI083JN+273LOi1DctbbrD2xDL6RF/lj+dXUy6O0tCe4GtAz1QBnmIuHhgfpvnZI9rHRpbH626QU3Jv1gfgTH3agdZz8hVga4Yz9QO2eK3rCcg5ORYyO8V+Af03OI06Q3cmjwtxdiSVnXUAACfvAqGyUtR4wDQEUMlYHlLS83xUkZ3yYM7ARfB6383D6v3KsGLY3LUf7/KWEiF58wmtgkOzTKhTZMcXaSvZrGd+/3DzNNhsB6cLf+72e0x5fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=mkpD0wIrDWEIDW62EulZFq8uH60gx2K0ZOG9dMVyDoA=;
 b=SElcu9VW3dvBZcLodaEvQAKvxkThOWMZ2fg9V7glr0jUNKzDRC7KsoJx7nontlrJfI31mCRF262TRj7kZk5iGw2bcTTNhWvtQRp6jVrqLMUJFSfzjgYpDdV+QLiXyAy6azs6Vxo8SevznCz6UIykyiMDFIhvBGtOVBBNUwMM/9F/zwN4t7FoJy5RcFXrYQC8YGhjfbsjheJkyvUXJz3aheYvX4LJverTNk6/Dk1lxNmzPc+PhsJ1sMqwhG2L3oQFHO/yEsxz0wlQYnDjG6Q/P2Cd2pjccFCb+1tnWR9MNtZQS9WB7woelmOuy8aX7B3OH92jSju9kmQhx0SFCGnKsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO6P123MB6488.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:2b0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 15:13:30 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 15:13:30 +0000
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
Subject: [PATCH v11 tip/sched/core 5/6] sched/fair: Use list_for_each_entry_rcu() in print_cfs_stats()
Date: Fri, 30 Oct 2026 11:13:06 -0400
Message-ID: <20261030151307.768523-6-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030151307.768523-1-atomlin@atomlin.com>
References: <20261030151307.768523-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR22CA0016.namprd22.prod.outlook.com
 (2603:10b6:208:238::21) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO6P123MB6488:EE_
X-MS-Office365-Filtering-Correlation-Id: faaba41b-67f8-473d-bf33-08df36985b6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|261028144727099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003|261009223027099003|261026121527099003|261026140227099003|10067099003|3023799007|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	QB+vvQltwoyTnfSACMg1e6KZTtNJaxDJrlpESx7VyEaEVslY8zKFPkn7DtfKOyhVfhgrpZ1jodYTqosXPpx7u+kEeLTW4RQgXJJa6NmrBZ8JUF92JrgqXr4flk7U7lzx2D6ZzRxkF6926+KvrLD17iE2WDZWOB6/sb8Hx/mb400ZFWsfwDQZTDuf/Qfj2shtw5yTgQIpd2CWIz2VefvhnBZOexMRz3wTXXKhnu71vayxqkyGNK1cBni7JVIT5XeotydBCADUkDIFZCBoTTraiwGmbmzsN7R2tlKPLrbZnu6v7wjtVQOCGo/XFYBJ385kC09DqUT5bSjI8UWoiUqjJwJCLbdbxdydtiNueJbZtZJWMHFk2Ol+Qsid9w2QNxTyvsFz2ps+ufdAIt3xzwV67R30TtPOxywBiGLSJ1/eZTRau8YcuNCcGwwwEuOO0f4uwZHFrn+OLZ6a05I5m19dLiMRnTcMIVB9I1XlgLtS+752ETMxX5N7UFaUIgJ3Qw7jLb3Q2AUSGkGj9d15A5Itz30UW6EbhelfPahFO10HV7DWfoXZJxll6/IS/kgF2iSWEsEI6aUuLx19l131u438e0Mf5zYhElXguPnug7Px1PAmJm0HR4wOGsAiE9XEcF0Vr+iHTqRR8YxWyYZ9xW9JNPTvaJm0G+zG4Uv65di4rXc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(261009223027099003)(261026121527099003)(261026140227099003)(10067099003)(3023799007)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jTy/mwdFnYfFTCCUW8YfNDCTxDau1eihOL+sZceJbnMrnsY3HprKGr5gyS5q?=
 =?us-ascii?Q?bVLz/8a2qUQFcVRSO4XoF7WiRfSrv5BJvtNXBv//7M7Kg2Evmy4Oja6fcdma?=
 =?us-ascii?Q?jnW0Kj36+QZei6hKRRoaf+EhwU/J75DClTclLWPOU5hjlBdR671Z1LPhQPcR?=
 =?us-ascii?Q?q6XIPm2kkTlbtcqXSKQHoRqog8uz+Y0eEcaYUwac0t0o9yjgnIhcF0eQdFx7?=
 =?us-ascii?Q?HDyXh4MHVazd98Sl03BEyUahl2IlAIQtwSN6Wvp9X6zqDD5ZlXtAQl5Q7/b+?=
 =?us-ascii?Q?R4rh2d5S4f99YtwuJxCR1tBrU8/maQX2CN8HlSzsU8CXS3MS3et6T8ocIfDd?=
 =?us-ascii?Q?Fvzw1s9y4OuQnVn6a4QxCApRnLs13SU6C8xPt91a7eNLan0PbA6t2s+NgO7f?=
 =?us-ascii?Q?+SGNaHoy90XdnfG4ytEzIYo692O3WsR0hKd7OaHioeveoiW/RYNOkIsLZ6WA?=
 =?us-ascii?Q?AvTduikYLbdEImxriNlw1E2lp/hngEGKf40xxeeap1jGnwJIaBRVL7Lj2WAb?=
 =?us-ascii?Q?oiKAX7LWz4CDMObmE4C1XblXr0RD+Mq53DiP92Sf/kCpbJ5azjmYbovKtA3I?=
 =?us-ascii?Q?5Vs4KKzxk2jOfNvqYPPUvIpPgUamfBxhx8le1GEOKcy+RJdYafX8FV+Zs7jB?=
 =?us-ascii?Q?lT3a4pX+i+jJRE8TjC5ZbU6zpBorH7S13AU3fn3Yy/zSn9ursVo1dOaInxV/?=
 =?us-ascii?Q?DPIQkbWBWYJ8KeoqF9v7tNrHgxo2LaVKHibzR2jF4+WX7lBa8pEEB68EnkCZ?=
 =?us-ascii?Q?SZzWmmx1kvqg36NeD3qClIkTdcXvA63wDTpxSM85jOC3VDww34r2eVGIedIR?=
 =?us-ascii?Q?WTcSKBWCQpa/A1y8WOUhd6073qGMKeeMEZm3U1RO93UxjOZZBXzJI77nIxyk?=
 =?us-ascii?Q?hNEWjepwHsXsUqxRtIC62VF9otzzQwVwY1BN3wjW4SWuxwGm39ynLg9S4l16?=
 =?us-ascii?Q?BUVIQOKTSmudBa8Yl1ZGkbk1gyX+VOxgcDuPe+VLTPs4ziJYNE8aMxTEP0LN?=
 =?us-ascii?Q?ouecGD6Fopr4pFP7+q3u/2Je5tvSOQ0cjlWk7cP5GPlmIhvVsl7OqXnX2sMR?=
 =?us-ascii?Q?31jgocEms1WTXU7+sTar9dL9t6G3BNAPQqOf2xWDniB/voB1eV4Eps6wZf0F?=
 =?us-ascii?Q?+APbXE+OdZ9nMO2leDHaMr8Qf9/6+LHeqY3Glrgf930gjK27xrOUgqAzP5VZ?=
 =?us-ascii?Q?DiEFLSYpLmGoNQEZmUk0Xv60ishuVCTnOV4IGBpgpgNEjywSYgJGGOLVrFMq?=
 =?us-ascii?Q?2T49sisE4P37RWAYR+ygZLKnmhrdRxxKihu0Zb4yK3Ols+EXz4khtrdhYF1l?=
 =?us-ascii?Q?LDjXt/B1mOEVkhJDWpgJBdrpmUndxVLPBwaThHZPGA9Pr72CMo92c2/dvESf?=
 =?us-ascii?Q?Iny/O34qYdZOBSMY8NYXAFzjXqHvdAFe4T5aexwg90ex+braJlp8HiAQMlH/?=
 =?us-ascii?Q?2jNHzPa8IYFUZcx3Us2bhuy+114dQNfvhtXwOtVPIFlrYJnXEy5QjLNY9uKv?=
 =?us-ascii?Q?juCyiO7NHZZDEuVFtD/E5XJvr45bFyoRHZg7z3MijziPHFDi5mPHJsSTK9RZ?=
 =?us-ascii?Q?fJdWD9gTTFDsFjPJpJD6lneclWn5bcvmg2XnckhxWqzE2YdbBffdkNyozFPe?=
 =?us-ascii?Q?XSmI8XXKTYGyoXW+d1jqfgk1s8UlwvMg6B5JJZMWxM+EM8jgjhvCfiFrZzjW?=
 =?us-ascii?Q?5V6f/gDC1sprACRi3gu40eQ/SjYl99DC63qTQlKdxLCfrDmkvxaSKOY/m3gB?=
 =?us-ascii?Q?RlzjRuRvhA=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faaba41b-67f8-473d-bf33-08df36985b6c
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 15:13:30.7891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z1VGalb548M729lzskVAXi7anPTPph3DpQbzt2ClQX40DTEMbdtfNxw3/WEX1pCqMDFQVLcWaY7YdU0fidp/Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P123MB6488

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

