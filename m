Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020079.outbound.protection.outlook.com [52.101.195.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C417427FB9
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 19:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787859625; cv=fail; b=uGC8b6NCm3yKaCVUN/pqWYr0KgAzzZwHMFOVDfTJMGK94Voxqan7X63Y8NUV9IIjeqcYgZAbZLWv+CAI0r84TaJTpyzTawle+qrpIgw9SKciLNq1HMU8ZfhBXUG30Antz8/IjLVyu2LHEOVBzqvZJXQ4QcpKOhlLkQm7+lHaufA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787859625; c=relaxed/simple;
	bh=zhJasRDeDGRyQfePCe5SabkL+/Jdftnm/K0mWAlhh5c=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=tGa5JT1pjaXFRF0gKad3bM+3LpMRe/q9nH3dUI/PPdv63j0dWNZhuZclyb+oxuY1ry8UgmbfAyhphLLd0Fr8kkXgvNK59+3/vkwIMN8UjBc9LLSYP7KJNgbfY7H2tE5A/27vFWkY+iaAdQKeun6DY9gzQJZX3A0tsQNITe0ut28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.195.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a7q0lBSkhqjbNBdtQz8A/0yOo/v4aTN0wx3uvESX3e8lX2NuPRG90e9Gfsgvvosp1q4UyresVpXAdxCHcYq3+0LQ4ik+yxNJGTYN6t5AyowKPXhQQPNyfvMa3q+5LN5JkaHjcoQrfelyu3oCVM/6ducDCoubo0l0qwH2Jwm4fSiD2M31SmGABXddgWFesJqL6AZFHldKShMsftTRnLb+fw6kfq5U9rZcWAHZTtBmLntM/ZgsD8fCgwdT7ZBBF0GlM3qRoKvVe7b7YoZi2LioY5fykv3soNZx4Pas3oCucH3TTySv+w8va6woRne/JXH2TOL/+kNeycNdOpl7HvAbXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=AkzT0NQEmoMyW0GY9tLLl/9RUJXDraEWhQpzbpK5abg=;
 b=sm/pBnTWJVe+UqYyoTrmnXvSBE4PZoeLE9knVHPbSyoUHkG/dghVr0LffJpvdvzLNeN5td21d6oyPC65jAyBLmdJfZPrz5hayiVk3FKkxKtmdJrcnrloti+ZDEGVF/XFzii6Sr0yrfpEErlPPIWhXi08FsZacCdbE9LvmY5r6sIFbz/tircaiKWgjdkZmLCstRtAp3RMxA3SfPXO66/km7WK9d3S5lvICmJ5+JoCCQMx/BP8m6gSCv725Ube7RFfM5/CHdtg8WHfK1oSgJXspjeykQr/KxzoqNtYzphOtJMCCMXP6GsksUN1phivfNG/VAoW4WHfaqf1QPQoWE4a+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by CW1P123MB7744.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:247::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 19:40:17 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 19:40:16 +0000
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
Subject: [PATCH v8 0/6] Introduce per-CPU debugfs files
Date: Thu, 27 Aug 2026 15:40:08 -0400
Message-ID: <20260827194014.977758-1-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0097.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::12) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|CW1P123MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: ffdabfd5-4d48-409a-f526-08df0473051a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|6133799003|3023799007|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	iH3LlOxNDbZkWihxqQUFMluQnsQEGf7mo8yzw8mylM7R7EPKrG5VKXul2GYKO2Yrt5Ly/ojSTSfQ6xJhrMfCX1fu27fMv0osJDlCJtYlg8y2FCD1G6eZZBxG+SqlyI+OUfwWtFJijHSh6gihaHg2wpyPIo2EHhkYso8qqcbmEnmfTOKMwxW1VViTSrZpjezRGvvRyyGMf0bCNRCYlLoE/04IyNo3zKYpZahgcvi6GM16hMM03Jjc3ojdkga3Sk3IIHpKQKOcKVbI+YAXHFZEmqPx9xUcyeBidXffydSWVxaWU7NHChs/shoSx/ZyeVhYHZwOKX8ppZAjRIHI5E+E31b7GGWZc8NPpwOIjEdcTq+u6wkWbotEe+5/CBENQJQSEN6dVXJ8MFvkSIbPQ9+ZVbV/03sTzbG/TwqyqtNi0zDnR4DIo5i1NZX+RhTDjQc0Bd+KMX/8E8qhhd56Y9Csm0VbECmmckw571KI3Jyt1VoyVbnBZMIA6vlun8kp3oAwZ7XoU94vJOYBCZKXbtaCFz4In5Z/0MISWzOELOP1sTMHIy0gboO2dOBTxw88rF694QkQucYnmyH7Bq3x69dZzETrj4PL3tLRQUPx67uegMphEWxtsqSlbJ/6h96t9/AVJUSOMAK8vxb2oNUyKEtOmdWFyl82nApu257xmXtn0Tg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(6133799003)(3023799007)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?99CvBpeSqtzqug/ZmMcl2rVzm7z4L1ImcVneHJnls1Fx0vIjKVWyUCcrPZ6P?=
 =?us-ascii?Q?wiHmFhcMNaT5FdxQ939GaBRNYoTo+PTh9SjTUmM7XrgcP3SR+kNpj5H1aqu/?=
 =?us-ascii?Q?o7YfLXXoZkZSnqegy6MQ+CA4Q+18G5BRxDVe4Y8QKKoskjFnMks2YNoLdTd0?=
 =?us-ascii?Q?KBEY5jRyvq8sitmndUyqZpm314giV9DOEuDfjqlMObuxVLu8WCn9a6Andw80?=
 =?us-ascii?Q?1pfvWGKS445GzxMdAGyzVD0E2q7QCYe+5womoULIRMQmJ6988YeFtYbco/2p?=
 =?us-ascii?Q?tsD4aQGi06ApF7Mnalud0EwxzdlpdjbgIy9N0QHlx4ZWha6XBb3HkK1APJEI?=
 =?us-ascii?Q?c0q7OhyWDqaAapOU0jEk9en3UoBNeulOSv54miJ5BcX8ZMTgGzSDU0Cosb7k?=
 =?us-ascii?Q?e/VaJyR5Aj4PLi/C8X4Ydur8wollAa6Nm7KPTu19TQVPNj78B9/XNn1PzUtz?=
 =?us-ascii?Q?ogm0nRZwwSGbScMlNn9yFI31DID3HkGOY/cTIRKssXKcEZ9GMqTyewIUxCvO?=
 =?us-ascii?Q?dVVY+nS2dydtXc+DCXhMTa0yMn1eRNJpv27TFr026KzlwZltaOE/EYojZzm0?=
 =?us-ascii?Q?W04M8CcrB5spD344SUS0cmGXwd7uYHHTWGreWNe+MqCgW4p9HTLlvkEVnvic?=
 =?us-ascii?Q?PUm01Ln8NDncrRLgPtrrdmVkJfTDNEwv2nKrMk5wLKRxbvTzgI5fSzFOT6Re?=
 =?us-ascii?Q?Gp13XPuT9VKKWSRArUm6E5j9dcdKhMlOFdLcbV6ebWYEollfv3Wgzjzz2HmE?=
 =?us-ascii?Q?zhAVvoN7wsiHo1UfDcLNcGviYAUMetBdvoR2+bPrZzg9IGKW1Ex7HjmJb+k7?=
 =?us-ascii?Q?L3ZJfdIcnMK0WZdN2/yWl8BsmONdccP3gKwkOSEMz9cwvlYijYkvI1mvqr75?=
 =?us-ascii?Q?2tbHT3s0d2caw+IWXERTnjp9OtvvECCjeewReGd7YMxSxKldOL/10goy8F4T?=
 =?us-ascii?Q?pNx8SOtjwHzT6TGN9/WZA2bcAgAVCa9JfsN+OzA61xh6yeyRgjWARjwaFi0q?=
 =?us-ascii?Q?kVkf4ynnC+pUEAMrY/AzIsPqkw9qb9KLfs8zLyQJOtnkkm7MpFbq8nJmkAL0?=
 =?us-ascii?Q?u/BINtYNEnmQHSrvkoXi41h8RWNoaSQnUAXWkUzFcaXYybdSNuN9yuxr+3qS?=
 =?us-ascii?Q?I9mdD9jC2ZUFI9iLV6q1C15x8hfFidw52RMFHV5MlnviZ8pIlFooGb6QBlm7?=
 =?us-ascii?Q?s4jUnQBoV4gdO1nTGBNrubtaW8CIf4qOy6Zm6vOpuhXbrREgcim9XtWtfWof?=
 =?us-ascii?Q?U9KLIp3MyThy1seslOo6b4L5sbAs6IjpjMuvDGLgIax9meTG0/LE2Px7Q+FY?=
 =?us-ascii?Q?ri0o8owtIrqtdnS25hq9tKHrp/xmOg+BRU7+md0oG+oKuSQcxo9iAcbSeheN?=
 =?us-ascii?Q?nbCIlmpq6r1zIJCWMXlgdEMzEj14dLxCP4dG7rJaPZKNeWKQcGZn67AIMfRN?=
 =?us-ascii?Q?O+PqME1cXJ4kmFrd2+Kxa4NHgKX9fs0r1/fB/p81VRQ/w4EI5Seb7KcmvmRQ?=
 =?us-ascii?Q?+X03LetrbjHLT0ydAhAU5x1NgvKnV5pkCZ7naSMJCKsJUYlrUD5WKe7XAGgP?=
 =?us-ascii?Q?gvaiqn7PPGX+lwMPM0Z7ugXdpiz/1b/0H0a4bgb7/bLC6mQmGmpRVbU4hFS8?=
 =?us-ascii?Q?zrsTj6uD5+/dKdjcpNKKHlfFRN4Ui40nv4y2xbaK9XUMIZnOa0RgriVk6o3x?=
 =?us-ascii?Q?Q560Zxg3kO86fgrMJAiQ9tKj6s4hsis+QijUYADEwsEnUYHR1u1GxmIBRtdG?=
 =?us-ascii?Q?Uzcwq7gl7w=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffdabfd5-4d48-409a-f526-08df0473051a
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 19:40:16.5530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQ+oa8kxUF55CYbNsO4Mjj2heHoJfrU3ZwvcN4xWpRsHCGM+Vf/gGqyRyQbj0YsjMAusGntc8/mS5aDgF6OjmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P123MB7744

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
 kernel/sched/deadline.c | 76 ++++++++++++++++++----------------
 kernel/sched/debug.c    | 92 ++++++++++++++++++++++++-----------------
 kernel/sched/fair.c     | 60 ++++++++++++++++++++-------
 kernel/sched/rt.c       | 64 ++++++++++++++++------------
 kernel/sched/sched.h    | 56 ++++++++++++++++++++++++-
 kernel/sched/topology.c | 13 +++---
 7 files changed, 255 insertions(+), 130 deletions(-)


base-commit: 68e37487810a3da43c48340fab7a55b3b6efdae3
-- 
2.55.0

