Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022130.outbound.protection.outlook.com [52.101.101.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F273515D9
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787869097; cv=fail; b=N3CfhE52wM/GYE1fvZkMILY8QcJXBfrics0idcLI0ek3kdMAhcfqECzlr8NSf6C74msgPSiw9jT7lYw3wJ9GWiYX/mBHEmfglXNLb7NYWL+urpAVe2mHLeAyrHDrthsUUY6euDpid6fSIEtBWxp6k3gnAOC3NYLhh4alViI0amY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787869097; c=relaxed/simple;
	bh=ES9ErbrqKxUNa1TqdebCt1AwjnZ6/EXnqMKX37qKb3k=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=WzZuSN3SwAsliqOL5i35xZFZ6QGYh+EgmW8ebx1Vd39kZw6lczXQSufxmWcsQC7UiBiGlUt9zjiiCLKLs3CPY3xMa/P1fMi5HlziM188Osv+eoNVNEtDJ45Hxxq2BKQ/oV7jhboMb6CM+fwQjBLeu4kDkcrMpGqXTcyUfH7B/QQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.101.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I8fHfMVtkSLnfHB/Wt2nNR/AIAurRoFVVpVFtMtOKEucEOY2w05CzSpBoIvzHPF7ihUDaN3HWKu/vgw28F4uT7uVuhgg+wFcHqro5wtaCyXLUjq/Dt+61s4InLNPRMoaK1s1NxWeD4G7tp1mTo8WW5nM0qsYr281O6dmjjfaqSFHa9bmxxwZ8somxScCXIf4p93ws11ODiYtrooNz9uzbupMzFH0A7YDGeDrshb261f+LoV6L5bvpkifvAVBJAtEJlF8fTlJRrJr+KyVz5iZTBFcT2YFTYlMa8selEz/eTlUpIvw3n+0ZGlb6akHx6vHy4E5LMtWOFJZvy/vSgmqnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=KO1VMURaZJU78RS/eLk8ykfzvr4vM7aeXNhtUKfHyd4=;
 b=REeyR+AkPqPmpWRP4hZP6vOmNLeb5v1fRURdzOB+apRTmlRnF9x3hxxPvRNcv9MVdam4A8JAfwGC5hT1LEAHDNHgtaATiGz4gEZCKVTSUUGZWBfhl55izRKU4XKVIMVS87h1982tBYidPqzEdwUL/NBrH/Z+vs/hM31WbJM/dpNZtpN2xtG+CF+iQOHAFxMZmMXBoIBcVQTqF2ANh0xuGp9AWRw+q2FOeWcWD0QGcbu3HHT5N+PIhUJ7EqnMKHcME8maiyDBxCW9fL/cP7PW/golk9o3Mk1qrIxpVxo7PVEJWjBA4yqq7puFM5ij5oi7HdSJdYQYcv8oA+fWi8GywA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO6P123MB7095.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:342::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 22:18:11 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 22:18:10 +0000
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
Subject: [PATCH v9 0/6] Introduce per-CPU debugfs files
Date: Thu, 27 Aug 2026 18:18:02 -0400
Message-ID: <20260827221809.988394-1-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0029.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::16) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO6P123MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: be868935-dfac-49ef-40de-08df04891419
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|10067099003|56012099006|5023799004|6133799003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	rsn845bF7Uin5Y1rv0It8LhZgvwJxJwwXhGftHB0NM3knqXPclwWjlIaDd5lBWg5hylGL+ApyqF0zB5Y6b91Ir+ItMlvYa7k8PUej8vAw0rO+bQ/VaaiRrlAN+om4GJfHsQMBIdJSpXhC5JNQ0XEqfmjHC5ElPustqa5uRzZrr21BJ0mWOFdxD0k+fh5+ZCX+xIjZgmVFJFOzFLZkDuEJDg3RKPC7X9Q5x07tyntk7KcV04JsafnqephiaE5z0z31qYhdM3ujATHJVXf9QOupE9jZeEixr4IyB+AoEd5TMZSbDQxaa0YTgt83C7KfWPVPBQPmgmj8abT0CjakDEEYOK5roJC7J8ACpj2b8tv0Yd8bQ6p2ntwj1C2x7GDJRu8TxihbNirVfhz4N8WCZ/zPLL7EfDRU+S5ssodRiS0aOU+QKtT8OR6bO0VBL5NLls/B6Ect0VauR/37VhPq36atBVPyKrqasqzZyxrND4i7d2VElyuRP4V7HQ8Lnwo7c5XHhZNi812GsyqsdQX8fWe8Tynz4UNJmh2L5LAIYy82YE9qLh6M/lYvHl5LQI48z5enpdBL5kbz55Ez+SuN04wNQJUorqoe6CBW4Yp/NJ88ySVs0Xfm7DK2pneo9x5suV4Q2yohKMW6sh+vQszoR6yio//6jqy+aYMFWZJlp1nQ14=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(5023799004)(6133799003)(3023799007)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Pj4sJDp8zxsDzggztMcsQOfi5q46TCE0mSVWXafmhUgrxxHchAwbiYv9HPt7?=
 =?us-ascii?Q?UlCNaTsFcbvMHJXvZlMqrazkaPgjy5TDG/Ua1ZeitGcglWSPARJpXEncTz62?=
 =?us-ascii?Q?EBru+BBwP0E+fOcs5dXbh5aoafazBMbGlSwhim8pRkMN/PXRtefBEjCjH+mO?=
 =?us-ascii?Q?Wv4c1oTuWeSeimJRJsrwWAKZsfPiiDM43Nn8OClYKSfoR/gTx3f5rSnYSmln?=
 =?us-ascii?Q?sstBFtHWJrnQsCN6quZuZjmd3GIqkZ3wHQtqT1fgK9FzE549bGXqUdwX45Ym?=
 =?us-ascii?Q?c0VriK506s/v0+moZUtT+eI3Gq1UFN1YFrN04k/TG7SprLGGU7osW26NKLST?=
 =?us-ascii?Q?EIuZ9jIKzmMDtu0dIOIX368YQUFsWyQpbld5NbOhmUZ+kxpb5HMk29Szcnbz?=
 =?us-ascii?Q?f81wqIpvEdsIgHhQyf1QvbvcebihO8m5Cmeea5l0Gcw2sBsPOqpXWDjVQMmD?=
 =?us-ascii?Q?qm8ZaeW3cIGrfJFfLR6L9+irYErPHMzHOvbWlRZjQYJUrJL9RejyS1b4fbzL?=
 =?us-ascii?Q?sKtmBmEXVZ7rQ3S+BPIUO1ct7GVc8ktv0k8FiokWKo9XuV7GqCCnYXjmN/SR?=
 =?us-ascii?Q?hImc36J4yYoIdD0ubsrhgyp1MO9ti20KriJkMLGIKv+MQj8A6cf0PLL7miQ/?=
 =?us-ascii?Q?pKx5LyrL2nLsqkVlvzXKgU9vx/+B4Pwj16JfUFMni6fWJ6CLoK/p47XJZ9NB?=
 =?us-ascii?Q?9vc7GZe4d/YQWcCL/WmSOQDj8AV3f5Hsu80CHGHiJP5HWEPJ7t41W3oc1Cos?=
 =?us-ascii?Q?7PRyEOSOtcRkc/1h4RvDdXluv2ywTKMWvJR9WaDk+XHzkfk1jTfkzyLFxD17?=
 =?us-ascii?Q?tm/xU+i3PTjz+ybnkFmH7g+Ws2zJyaIJhV/DxoN5kUrbDxyHG/WmnJNE30sH?=
 =?us-ascii?Q?BiPtBxQzZB5jD5Jn28wUoxT7Pr4Cw+UhMkrzG7J5wZN1LMhPulekI4uLlSpf?=
 =?us-ascii?Q?3vg7o4vQOMOFvsTBNmdCBZoAjSsCUbNA9J49UORuF7+1k45CFOd1ikQhhxyf?=
 =?us-ascii?Q?EvHRWGxlEKC8xJMUWCZPyyOjNNCHw0Dxqht8kLGI+xUOwe+kHQTEAJwJwNGn?=
 =?us-ascii?Q?9L0uWpmgGAFlzrM2ckIK9Pbv8lrqBc5PXhB9XTiG7811lf0FblKo67w00V7r?=
 =?us-ascii?Q?O9iMloYvMO+CD9reUQpW055aI5UNBTTQfqlqIbxQG8JFDc2RVgOTLbkTwS3p?=
 =?us-ascii?Q?gq3dWiZQTAABw9tLCWA7lUoLpjQ7e69T7M+qWtPdhM9Iwx+jhfCkD322fCpd?=
 =?us-ascii?Q?awn7NsVEdMs4XQNRWtHVwDfErCMgbmKGt8BTfRFTR4lFUsUqnejMc1FBQ7fk?=
 =?us-ascii?Q?u7KJkGFSJRDiaY8RfO4GLvyI02Qh9yPwKezxnfP0f+6F5UoXQSca1buJhpIC?=
 =?us-ascii?Q?/OkQWYTIV3J5VYyXXZfJo1pud3LTCuQL0u3YjNYhUY3iSc3afffOZKu2wrh4?=
 =?us-ascii?Q?2PxnHs2KDdrtjsh5m1ke1gE73pZx91osPzl9H8pFywgpyh/XmSpY8Aw5GRHD?=
 =?us-ascii?Q?2pBwhIqSxSDc0cPdq/jJDyVkPQzwthhCdPheCj/odSUuXzNQsmJ9woKnHYda?=
 =?us-ascii?Q?Ng+T2fDPdUcA9I/6VJTE6tC3R2AeO5ExNaEN9w56fevSsNXVvM3qBjkCLI1Z?=
 =?us-ascii?Q?XYOh4NCXrAiIBiszXiNXUKLzJvZDbhm/NVNvPgK1WfjQW6RW49aE2pS2G8er?=
 =?us-ascii?Q?RrPiclAnsSUzbBj3TSe+vNjkNUfKLJM7MDmG4IKYtstwPfjv?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be868935-dfac-49ef-40de-08df04891419
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 22:18:10.6167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t0Nr79MSvB1rtPD70UpxEICxXJqfiSLzMyxD+JPHa7BYn9SwoJRsZYh0FdVtrqTDWNFOi0khceyezKMgFKI+pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P123MB7095

Hi Peter, Juri, Ingo, Vincent,

This patch series addresses a few pre-existing memory safety and list
traversal concurrency issues in scheduler debugfs handlers, and introduces
per-CPU debugfs files under /sys/kernel/debug/sched/cpu/cpu<N>/debug.

Patch 1 introduces a prerequisite patch that annotates struct rq's rd
(root_domain) pointer with __rcu in kernel/sched/sched.h and introduces the
rcu_dereference_root_domain() helper macro (i.e., mirroring
rcu_dereference_sched_domain()), updating readers across the scheduler
subsystem to ensure Sparse compliance, correct memory ordering, and clean
Lockdep-RCU validation under both sched_domains_mutex and RCU-sched
contexts.

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

Changes since v8:

 - Added guard(rcu)() to dl_task_needs_bw_move() to prevent false-positive
   warnings under CONFIG_PROVE_RCU when invoked from cpuset_can_attach()

 - Converted remaining direct rq->rd accessors across in add_nr_running(),
   __sched_setscheduler(), and dl_task_check_affinity() to use
   rcu_dereference_root_domain()

 - Linked to v8: https://lore.kernel.org/lkml/20260827194014.977758-1-atomlin@atomlin.com/

Changes since v7:

 - Removed incorrect rcu_dereference_protected() usages with
   lockdep_is_held(&rq->__lock) in favour of a newly introduced
   rcu_dereference_root_domain() helper, properly validating access under
   either sched_domains_mutex or RCU-sched read-side critical sections
   (Peter Zijlstra)

 - Restored the comment in check_update_overutilized_status() in
   kernel/sched/fair.c (Vincent Guittot)

 - Linked to v7: https://lore.kernel.org/lkml/20260826224238.936456-1-atomlin@atomlin.com/

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
 kernel/sched/deadline.c | 77 ++++++++++++++++++----------------
 kernel/sched/debug.c    | 92 ++++++++++++++++++++++++-----------------
 kernel/sched/fair.c     | 60 ++++++++++++++++++++-------
 kernel/sched/rt.c       | 64 ++++++++++++++++------------
 kernel/sched/sched.h    | 58 +++++++++++++++++++++++++-
 kernel/sched/syscalls.c |  8 ++--
 kernel/sched/topology.c | 13 +++---
 8 files changed, 261 insertions(+), 135 deletions(-)


base-commit: 68e37487810a3da43c48340fab7a55b3b6efdae3
-- 
2.55.0

