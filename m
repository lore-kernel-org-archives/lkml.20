Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022122.outbound.protection.outlook.com [52.101.96.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4A730F526
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787784166; cv=fail; b=HNYzYoD8MDkCIPy7F7UsubKmK07BIiVOTTImZQolECPKWOMzQxSG+JDZKuZPZw8119fMZig/MNTnglF5aNkj/+8Y9B53bMVxYU5DXjDhqJwF7T6/FZrPR58O+8IyWOPcHVgoO5aJlSnej4ZZlWD9AtBDawZEmGoDMwWzYL49FnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787784166; c=relaxed/simple;
	bh=YXyZhHQNzyC1/4jECiw08a65rUqWVZC1U5leF7LIzDk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=caYvWZnHXR95Ie+lo/aLbXV6GcEONMuWFRJ8RGAWndpZZA5CYVH8I3Y+mQsfwUCVNhnc41NxbXF1OcBPLCtVG3s/rcKbjRsqPp6NhdDZh7sadoGsHFv3l8Gd5E9BoVeSFdFb4s6/JQfOM1W8tviidanQlJVNj00h/aaDh+BK9uk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.96.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gzORJ2rfjCnGbqrjZIB2YLtUIZH6DFoaYDYTH2sxX07+PXi6VTMes4KGjYBtJctD8uS0ExJ7YfZ6o4g9xV1aDn/M0feQp708fgJNCfX1nRHk/l8tK78HhpXPFn60GXyANqA5enuL1TlUU8nQoraNOyXSWMazyKccfB97P4b7Gqzhzru+zM5/TgqFOkO7CtduPX+ZRln1MB5IYgg9x8KF0M+iGu2PXiQW+4aXU6JkbEC9mC2cNJvsVp3C5qjbU1yHnp5Oqer+3Kl8/ilGKjHul7SvM/8Ub6BhX0F177buMN3N9sSYlyehRZ5J5WovG/mYd17pP+190SN53t9d7P6DYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=8pheETlkvaZV7FsNnRrLYosIXceHT5NGGcVRqWkLSTg=;
 b=h6SEaeLtp6jTrV1BtMWgheE68T0tbsjQJySREJbUiQr7dr/Roz04bdHY0Zrjj6ft8OW8lYmLIccEGR1yIdI5TNiazWkTv8w163gLXrjxQvVi6YLuxNYKSgp+U1ae+gC4f3K+Koy0R6cp0QjNxl0YLt+Lzfc1uzVKyATJ7vj0Asb/Xga2Reij3ZKwBL5hgBGBGzVEnFzZnV46AYsqMziNrKYy0lPzNH/7xXgKxKv1agXBlkVJQpe9wmgqLlCzuPEiMD6RW9EIUB3aGSnmCjFb4Xslt3SEGaRLqA8S5jyOCS2SDadZk8gdpjwIRYbrxNMVksRsUiO64aOwp0lYe+QB5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LOYP123MB2896.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:e8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Wed, 26 Aug
 2026 22:42:41 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Wed, 26 Aug 2026
 22:42:40 +0000
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
Subject: [PATCH v7 0/6] Introduce per-CPU debugfs files
Date: Wed, 26 Aug 2026 18:42:32 -0400
Message-ID: <20260826224238.936456-1-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0606.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::14) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LOYP123MB2896:EE_
X-MS-Office365-Filtering-Correlation-Id: aa09adf1-3325-46f2-67cb-08df03c3559e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|56012099006|10067099003|6133799003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	OoSuFh5jsNHGljghrK/zZcbfY+HouKNZEplLKUwh1gGC2BqC9gb7zURwElDc6ffywU7hXE+R+Y455msP92O4GVzXlqh2eNNxCv++JtyzL7bu7xY6Gj3taN2DtgAEBBzlqQBwl445sj0oy1EgxbZ7esLZw3BJVlie0kABZC7m8D6C7uRlF59aVToaIpr9p6w37aRL+Puq9Y/zS/0Q8EnEHIHhKjnWa4JHdLutlhKR/0sRoEtYoRECgQzFIbwJ/fG0SRF6pvsL0oKiOcurMKaqJrh2ZL3XpYzMBsKXz58ALT9uM5wePMILOW0BB0ET1bWtHNjT0qHDEcHFj3P9yjP8DycTn6XcNsmwREHAcbeUojFqC/TGq4UA8J9oI6YvrAgh1c61Pl+/1VJhG8P/KTHazE3XruYRX94Hi2gRBz9knWS8tuHrlzmVjFTRmYatUYGVPC3xic1faCfvR+hoRjtyIxozVR+/Ny1IQEPAfPOQ+tbfnSoE5sXB10dWDXNcnJ7BuP9MUTGOQogDDvVW0ifMxGfAYcUtAFToR6R5H3ZmilotOmtTKuXKUqhaYVOrzO4pGBxWdZEjIwlPROOr+jswX3S311FcG/ZHBCTZunmPH3Qd2zxXRCFtJfBNdK4xT48y0EM7pN7SLUTE5tZTNZ8ON7jky2TzNmdeThGjGexm5YE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(56012099006)(10067099003)(6133799003)(3023799007)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OpAPN8e3OWSftSJM/Oucl2PkK7+k4I8P5HB/vpuTvbUzJ8TYH6LYYgDmeV/N?=
 =?us-ascii?Q?1n4lKqYH1GIk6NkzqVaAlLq3/ZDAT+OCpVTO1O4OCZ6kQeNwsTmMQVhmNKM1?=
 =?us-ascii?Q?xl2pN3EvQVePpdv9nB/QLVdbDS8+3IcfIRHW//Vk747TCVGlZeXlv/g8i/jE?=
 =?us-ascii?Q?sNnZ8cPHBBlv8GBXJ3xdugft2b9Cmba3vhBMM5DckWM4GWj7h2EhHjyD25hZ?=
 =?us-ascii?Q?XMktSG3RH6CyIavhOghxnFt6kJwvCgqlzHgTq7DMga03YIy/jCFBA8lxkXqU?=
 =?us-ascii?Q?XvWtFoBzx2yEPDPepucxgFBpDWtMvXai7RdbIQ5UQLBffLBUJvTUY5zuujKh?=
 =?us-ascii?Q?MfaAg0oErhMYcOYUtvXEmj1JqnyBeeckjEP2xo/n3YKjH30KrQfnX0wzj+UW?=
 =?us-ascii?Q?khWpRlie0LXMWOgfmrjku44hG11aU7XkDH5YemSv+v4g5T7iI6vuHBPe7snn?=
 =?us-ascii?Q?sHLtigza8pWW/zNkxaKoJZuXACLvZoLVnOnf3FH9rAxqMmT3rL4TAosdiF+Q?=
 =?us-ascii?Q?s4oI0bcuBDLLMRD9WTOAl/zk0uxBK8ccIrxwwwXuRPUgq/cjl49NU5N/Z19I?=
 =?us-ascii?Q?ZIftEVyT00eBM7B+N4pN6j3ByX7GKf+pPdjxBKe+tVRJbW6qhu6J0ZDN2ggc?=
 =?us-ascii?Q?TICymUhYNn4DKUI+IWBx1WuU0DB65md5Lc+Bb1lIiND9R7KzVHI1q09Zzpnf?=
 =?us-ascii?Q?QhY5JiuDjCdOTTOv08yHAp8n4EcoFxMzSiAWcWC6P++1uVeZpwDH0Pt2jUUf?=
 =?us-ascii?Q?kjzYYOF8FiYJDH2qQlGU15S//FOi1E+W2RmsE5E2rifPA/t0nK7ozzO8J2tu?=
 =?us-ascii?Q?LThA0lzEUtFG2DCzvHMd0Uc+agaku5OULqCr3vjZGv/etykSqJJSc+xQrhIO?=
 =?us-ascii?Q?30GfmHLdspawhjpLwSrpMJWQdWqE1rq0RFE4y3v7fGX9UpXbegZzANy84sZF?=
 =?us-ascii?Q?AS2lizIa6ZzG2HAkjUWUA61uI8iQNgUZMYjhDK6L+GOzXfHYz/TyOkgU5oYy?=
 =?us-ascii?Q?NnhLvUBKfJPUZyMrfcdtPJVjP8XZaKDAkK30JkqevwaQ5acfcx/rySFjmJc9?=
 =?us-ascii?Q?juJxakC/v86rC2z704IpZLUtFnsswmTOGSFWI2feVhWY3WOpTc9MN4CFJeWz?=
 =?us-ascii?Q?X3k+/E6L1QVJ2l7urtFTEHT5rwP1D6yDB1zEUUkiTeRV7JbPyzI7yVH/Cbzq?=
 =?us-ascii?Q?Pd0i3RDdFVipQqD+EZHmTs+ARQn+MOoPC2BwHs4vyPmxygSCYK+zq1mTfc7L?=
 =?us-ascii?Q?yhJtqh/HVencvE5ON37uYg+2+WlxtM3GE4nB9cxhf2Lp2Ucnqse6ZCOxzH+M?=
 =?us-ascii?Q?a13dBhnDfwe21oh+C1X9EhiRxGIt1jYkjWHpGkmlPEq011eh/5CePLKwSuIn?=
 =?us-ascii?Q?DpqTGaBSzzcj66+tLEPgGuFZ4ILK651v3J20uceIRHEYRiP1scbd4Z6EWGpX?=
 =?us-ascii?Q?a42Sw1aSDYUPynWL9gndH6sF0FYYkTrwmUYGkXF9zo234SlbeTQxAKjUIF1l?=
 =?us-ascii?Q?WoyZo00Pzkh0o/hloUWT426lqRvhDN0FTaeetniSQ8oUEcG5zmaDX5Xg459T?=
 =?us-ascii?Q?Ji2Zv42YjM83+9/Hw+FSFnEL74GQNsTZ1Cgmd+iBN5hlOeyO27o8iOb2FsJ8?=
 =?us-ascii?Q?RJJXJMiAvRIzfTX0GgrOXPJBqwl+cjCiG0rVsEGX+zc9u9jtvqaihjPJ40Kc?=
 =?us-ascii?Q?yM1p4kwm7pey098InVu1m2MQZN54kqn2eiZ3u1XSgfREN/LK?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa09adf1-3325-46f2-67cb-08df03c3559e
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 22:42:40.3710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BvFJO4Mt3ZewlgCNdX+xVUfk3Gef73AjzCQkyXdIGcvHXkoGaRD8yUzFOq5S2Owppx9vFGAdWyys1U1yQcDYXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP123MB2896

Hi Peter, Juri, Ingo, Vincent,

This patch series addresses a few pre-existing memory safety and list
traversal concurrency issues in scheduler debugfs handlers, and introduces
per-CPU debugfs files under /sys/kernel/debug/sched/cpu/cpu<N>/debug.

Patch 1 introduces a new prerequisite patch that annotates struct rq's rd
(root_domain) pointer with __rcu in kernel/sched/sched.h and updates
accessors across the scheduler subsystem to use rcu_dereference_sched() for
lockless readers and rcu_dereference_protected() for lock-held paths,
ensuring Sparse compliance, proper memory barriers, and clean Lockdep-RCU
validation.

Patch 2 fixes a use-after-free in print_dl_rq() where cpu_rq(cpu)->rd is
dereferenced locklessly to display deadline bandwidth statistics. During
CPU hot-unplug or cgroup cpuset repartitioning events,
partition_sched_domains() calls rq_attach_root() to detach the CPU from its
root_domain and schedules free_rootdomain() via call_rcu(). Without an RCU
read lock, an RCU grace period can resolve concurrently while debugfs reads
the file, allowing free_rootdomain() to execute kfree() and causing a
use-after-free when reading dl_bw->bw. This patch adds rcu_assign_pointer()
on the writer side in rq_attach_root() and uses guard(rcu)() with
rcu_dereference() in print_dl_rq().

Patch 3 fixes a potential use-after-free in print_cpu() where rq->curr is
dereferenced locklessly to output the running task's PID. If the task exits
concurrently and its reference count drops to zero, put_task_struct()
schedules __put_task_struct_rcu_cb() via call_rcu(). Without holding an RCU
read lock, an RCU grace period can elapse concurrently and free the task
structure via free_task(), leading to a use-after-free race condition. This
patch protects rq->curr access using rcu_dereference() inside an RCU
read-side critical section.

Patch 4 fixes both a time-of-check to time-of-use race condition and a
potential use-after-free in sched_show_numa(), where p->mm is checked
locklessly and then passed to P(mm->numa_scan_seq). If the task exits
concurrently via exit_mm(p), current->mm is set to NULL under task_lock(p)
before mmput() is called to free the struct mm_struct. Wrapping the p->mm
check and dereference in task_lock(p) eliminates both hazards.

Patch 5 fixes an RCU traversal violation in print_cfs_stats() where
rq->leaf_cfs_rq_list is traversed locklessly using
for_each_leaf_cfs_rq_safe(), which expands to list_for_each_entry_safe().
Although leaf_cfs_rq_list is modified using list_add_rcu(),
list_for_each_entry_safe() lacks READ_ONCE() and pre-fetches the next
pointer without memory barriers. Furthermore, because cfs_rq nodes are
re-linked on enqueue/dequeue without waiting for RCU grace periods,
concurrent list churn can cause backward jumps or infinite loops. This
patch introduces for_each_leaf_cfs_rq_rcu() using guard(rcu)(), bounds
traversal with a per-CPU circuit-breaker ceiling, and emits an explicit
truncation notice if the ceiling is reached.

Patch 6 introduces per-CPU debugfs entries under
/sys/kernel/debug/sched/cpu/cpu<N>/debug, allowing targeted inspection of
an individual CPU's runqueue on demand. If the target CPU is currently
offline, reading its file returns -ENODEV.

Changes since v6:

 - Updated rq->rd accessors across kernel/sched/ to use
   rcu_dereference_sched() for lockless readers and
   rcu_dereference_protected() for lock-held paths, eliminating false
   Lockdep-RCU warnings under CONFIG_PROVE_RCU and all Sparse noderef
   warnings

 - Removed the __printf(3, 4) attribute from the !CONFIG_CGROUP_SCHED
   fallback stub of SEQ_printf_task_group_path() in kernel/sched/sched.h to
   prevent -Wformat build errors when CONFIG_CGROUP_SCHED is disabled
  
 - Expanded the commit changelog to clarify the per-CPU scope of
   SCHED_DEBUG_MAX_ITER and the RCU memory safety guarantees for recycled
   cfs_rq nodes

 - Linked to v6: https://lore.kernel.org/lkml/20260825184637.888364-1-atomlin@atomlin.com/

Changes since v5:

 - Rebased against tip/sched/core (sched-core-2026-08-17)

 - Linked to v5: https://lore.kernel.org/lkml/20260825141413.868997-1-atomlin@atomlin.com/

Changes since v4:

 - Added a new prerequisite patch to annotate struct rq's rd field with
   __rcu and updated lockless readers to use
   rcu_dereference()/rcu_dereference_sched()

 - Updated print_dl_rq() to use guard(rcu)() and rcu_dereference() on
   rq->rd (Daniel Vacek and K Prateek Nayak)

 - Replaced READ_ONCE(p->mm) with task_lock(p)/task_unlock(p) in
   sched_show_numa() to prevent use-after-free against concurrent exit_mm()
   and mmput()

 - Updated print_cfs_stats() to use guard(rcu)()

 - Increased SCHED_DEBUG_MAX_ITER from 1024 to 4096 and added an explicit
   truncation notice

 - Moved SEQ_printf() and SEQ_printf_task_group_path() to
   kernel/sched/sched.h, replaced strcpy() with strscpy(), and used
   IS_ENABLED(CONFIG_FAIR_GROUP_SCHED) with a typed static inline fallback
   stub

 - Corrected the "Fixes:" commit tag in Patch 5 to 039ae8bcf7a5 ("sched/fair:
   Fix O(nr_cgroups) in the load balancing path")

 - Linked to v4: https://lore.kernel.org/lkml/20260810015812.428999-1-atomlin@atomlin.com/

Changes since v3:

 - Updated Patch 1 to use rcu_dereference(rq->curr) instead of READ_ONCE()
   to preserve __rcu

 - Added missing writer-side RCU publication barrier (rcu_assign_pointer())
   in rq_attach_root() for Patch 2

 - Added Patch 3 to fix a TOCTOU condition in sched_show_numa() using
   READ_ONCE(p->mm)

 - Added a safety iteration ceiling in print_cfs_stats() for Patch 4 to
   prevent unbounded list iteration and RCU stalls under heavy
   leaf_cfs_rq_list churn

 - Linked to v3: https://lore.kernel.org/lkml/20260808235522.380038-1-atomlin@atomlin.com/

Changes since v2:

 - Protected lockless rq->curr dereferencing in print_cpu() with
   rcu_read_lock() and READ_ONCE()

 - Protected lockless rq->rd dereferencing in print_dl_rq() against CPU
   hot-unplug and cgroup cpuset repartitioning races

 - Introduced for_each_leaf_cfs_rq_rcu() using list_for_each_entry_rcu()
   for lockless leaf_cfs_rq_list iteration

 - Linked to v2: https://lore.kernel.org/lkml/20260728205238.18447-1-atomlin@atomlin.com/

Changes since v1:

 - Reframed commit message motivation around targeted interactive
   debugging on large SMP topologies (Peter Zijlstra and Zhan Xusheng)

 - Gated sched_debug_cpu_show() with a cpu_online(cpu) check
   returning -ENODEV when target CPU is offline (Zhan Xusheng)

 - Linked to v1: https://lore.kernel.org/lkml/20260728020309.6169-1-atomlin@atomlin.com/

Aaron Tomlin (6):
  sched: Annotate rq->rd with __rcu and update lockless readers
  sched/debug: Protect lockless rq->rd access in print_dl_rq()
  sched/debug: Protect lockless rq->curr access in print_cpu()
  sched/debug: Protect p->mm access in sched_show_numa()
  sched/fair: Use list_for_each_entry_rcu() in print_cfs_stats()
  sched/debug: Introduce per-CPU debugfs files

 kernel/sched/core.c     | 24 +++++++----
 kernel/sched/deadline.c | 67 +++++++++++++++++-------------
 kernel/sched/debug.c    | 92 ++++++++++++++++++++++++-----------------
 kernel/sched/fair.c     | 62 +++++++++++++++++++--------
 kernel/sched/rt.c       | 64 ++++++++++++++++------------
 kernel/sched/sched.h    | 53 +++++++++++++++++++++++-
 kernel/sched/topology.c | 13 +++---
 7 files changed, 248 insertions(+), 127 deletions(-)


base-commit: 68e37487810a3da43c48340fab7a55b3b6efdae3
-- 
2.55.0

