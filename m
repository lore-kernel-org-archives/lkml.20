Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.96.118
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793373197;
	b=SlM2TD6+K1EC4NBFMJaMNb/VXUXDmYEW3zBNV+pQQYdJjudRXtaU7UpTlOmvhBtDMvex
	 +mTdBLmXrler3qesAkznYd63Kv8lkcifufiHrEQg0uchy/f36Gig6vsZbGLXGOjirJ3VD
	 yKMdqPStBWDo/jYoW9xmublbJlf+as9FEp7cHWon+/tY3YNqfLjrs5XOBq8WwgTfJC64Q
	 E4n4tjh0BOD4v0N449YvYz/gRCgJKZA+poDhphyBr1HnHQANLjuNPssmeP0iGpvx9rovP
	 iPQA+TOrLWLLqCYnWS9IUdGiih6/cFfI26Da5+mOlspKF2jwfblgU8uekEUngkjId3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373197;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=gIQxPQpFSXnfxK5UmxP3N9VAVeCkGpX8mp20aTvhvuI=;
	b=TTJ50MmrHAQdL41QZlxdQktdlUDK09svOirldDSRMhEuo85r/YXiukmFHJjKYTs8XDrv
	 PKSDUq/AVccg9pQS8Sq6gONqVCS8qMbHzwhZCtzRn/3QXkXtxm9WfPvJoz3+kjoQuq4Rh
	 fEQY/4q7ESimMIU4JE2rQxxTKXjBRQtKRt92m3tZOk05H0TJYHiql/nDnZJc9/Z8e/YgE
	 uPN4ibzpBmi0D96ZgehmpWfGrZbp4o7NIch1tOclrxRWi4qgs9bZumDVrQqodRqZwbSSg
	 qn+OAqWyaALUdQ+4ubbJZpuLBcgM7kn9ndj2Ni8/8IY6ExYcSTq5MaMbvFwGF9HbhwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=atomlin.com;
	spf=pass smtp.mailfrom=atomlin.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.96.118
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022118.outbound.protection.outlook.com [52.101.96.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2F3606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:13:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E2F3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ah8GgTI2auofhnl9x4QGahNDYDziE1ygU+eQZPHDmjcT/QfJpVPXmeTzMUCiRiFVTu5Y3l2O2xaiM91NVSImQ/Z7M2ZibTD5i8DDn1MZNcKdJl2svcsGOgoqwsTZ/TZwwIFnlhtEQxz5xfCzsluW7Vd86lLdhwCiisTnQqHAYwg+OjdP2G13R6ZcVHmjdK7JBod2+ZS357QjpvKb8Nf9ONSsxsKX+K+mvlGvKlI9ZC1qq1FLCT+/gCWQvpX71IYghoFx91fnF38aiZa8KvsFxa6uTDtFzHJbiquszAtCD8Ua4WFQ6lV0tsNFUk9n8w0j/HIMJfekzqgJd+sW5fy2xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=gIQxPQpFSXnfxK5UmxP3N9VAVeCkGpX8mp20aTvhvuI=;
 b=s0cUgGONl4G04xRfoHNUszqf/1/003315EFX055RdGG44CjetPx18PX63nQ2JoaN4emqcfw1Y8BjY4LZinKDR45jbK4oQYbrg2Bz9XwPDY9ahYpgh3472MmvNLwTDZcVIQX4Q/94i2STN/ArOaG3PBB1pcFkOgISLN2X1qB2lApjQeK0EfT+cq+1xZDTclW9jcW/ANSjd68P6fstNKEiVesSCK6q401WsdC/1897YDw8wFntywbx5imZ8g5QtLYSDW1AfIUQZPzZ625fDH/l7Q/FJck09Aslfz69bXZOa5qH2Qd71FqdUx+m+VNZ2KNbS+2wv2VPo8cln9zlb+TivQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO6P123MB6488.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:2b0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 15:13:12 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 15:13:12 +0000
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
Subject: [PATCH v11 tip/sched/core 0/6] Introduce per-CPU debugfs files
Date: Fri, 30 Oct 2026 11:13:01 -0400
Message-ID: <20261030151307.768523-1-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9P221CA0011.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:408:10a::31) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: a55d7be2-7ff8-4d58-fb63-08df3698505d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|261028144727099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003|261009223027099003|261009221227099003|261026121527099003|261026140227099003|10067099003|5023799004|3023799007|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	dnOGKUFT+pOc6yuOz0NQ1KzRVPLD7b8mJd9P0pJq9MciCRkKQhl9F8sfqYkyoo3RUDBx8PRJ2cNhT0V9lSPhRnBIqgOOLSSa3haqdFC/ZK9L9WxRPVaoD/kGvVKD9lS8soRWiCAFkJtZmoJ5ZlZWyBmi09iiEWW/NuTaWgPmW0KgNdHS3pAtxFqnqXAftsHCMo5Mv33pezzQcuvY7PqZgmrLA15v+9VMii+S87m4bK7DrwLTyk6qrKvS0DGwf0iCLtBSHf1gS9hEGiRlTqwbDwEWkkDGZ9nrwGNgFDS50tRumZKQw4ILbQD3mNPh9zXtNizPWaoN36JqRlsS+bMSe/9FkVEpzO1B/j8XtMRkGnXMxmZ+advjVV5WdS3OZRK7QQWCxmC5yt7J1d+0GkIU+R/8/96lbA3ViHo1uhJF3bMhEd7YV1iXc7CW2aZhFBCqXFY1M81XZwfcRybDupM0t9BnHFsNlr9PQeM/l/bRLMyAhafBCHwkjPkZRcDAT9dWoMnE5UrHYrYlmTl1W/Knj1WEtNOtitpJDRzbvmapR3OFdzPA+uhIA7Aiq2vyz7HP5mI4BvZ9U3hAqtKJyHQ15mBgglMGNGE6FjV2RU2U9UDFgGVHAzalR8iRA/mJkKym
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(261009223027099003)(261009221227099003)(261026121527099003)(261026140227099003)(10067099003)(5023799004)(3023799007)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5+2MrbnyRFBnv2z5U2Po/1i0CSjM3K8UDr6ZuPA8a+GIrtxmtia/KMzcQ2G+?=
 =?us-ascii?Q?bOz/OJfIYxgR1cnIcJ78pe+8uvmxB+rny0jkyk0FxWfVbX4cXiBXN12HEbty?=
 =?us-ascii?Q?DLLS2+FMMcN6dzNGaqpY55lhZVJpFzB7M6QcJlQJlmMgbwCjKMNBo9gtLLKc?=
 =?us-ascii?Q?oxLYkDATymANSePG7xjr1PwZhxfpqin/PPdkcKUoDUx3bJyOiRNg8KEkv287?=
 =?us-ascii?Q?YKtlpD7c0tH3s7UPa0hWjkuwGhc9nw2iTG5J5dYSix2aOJKxgfwMsbL7JUZy?=
 =?us-ascii?Q?+qRIsy4zO/zIqKA2X5HAVNeO6wocOShNiqtFxlQR9IuBjYRrsMYe0BxOrzii?=
 =?us-ascii?Q?G8jdZxNnAfFc5dycgdjsPM9sr4RsshzXjXJ2AkKTW8zx086RMJPU2afiZlHk?=
 =?us-ascii?Q?J8yjawBPMK42Q45CxxfvII6Wn2qyGXnMBqaNrBN9lJkKNF2rQQM1+2jhIE8u?=
 =?us-ascii?Q?Y7Cooo1qLCzRgEjDa2K8hXQuLiJwtQGAhjeDdYYB+pdUwtTlby9WFM1589ir?=
 =?us-ascii?Q?0opz40jp58cRb+HkEIFeNsVXyxiRfJpJ0x1PD0QPvZFSLCSNN/mwdUFo5krO?=
 =?us-ascii?Q?q8tGL62vloaAnksNLiO5A3xoi0u7l9t2MTJ2UbBCac/AF1I942pgHnaubnGu?=
 =?us-ascii?Q?f5vLwTotHA2dgoUB9a15v5+5eNCcXz8t5RXlYSwzM/L2/RrXMDsaLO/gYdCa?=
 =?us-ascii?Q?a7kh+ijmjEz7vgh+/2Dd6elwHQUbz1gbYsS2jw+aBUeHlHRxDctufUjy5ige?=
 =?us-ascii?Q?R9Xgv75OJ00ozIoOe5krLCrwv+/HmnpZl2TKyhxOKpo4NJQAuzyRwDjBphpA?=
 =?us-ascii?Q?gTXpiLL3mOHHiotw/GCHbUwsby0oX8xM3FonYP1LNCR0QKwAZZOp0vRobSg2?=
 =?us-ascii?Q?ZBSfcayPV8e+UG6o0pMVY0Vp4JUHjsPPWdsvBZdhbCDZmpDrXEJogl9nhtZ9?=
 =?us-ascii?Q?NZz24YD+uAIm8C2yop0OWWSjwWw4P183rvpmY4+wvKzyrJpqz4TmqjvnlFYe?=
 =?us-ascii?Q?xIQ0C+rgjGhc7SWJwbCb9cKGgquh/+2NcHj4/DgYJr3hwBP0LRQIfF3urx7T?=
 =?us-ascii?Q?HEQOCHmB4LKVz+B0w8P1++ebANbAsy/tekFfsZcMJgMACNrXFB37dUbyIl/i?=
 =?us-ascii?Q?zOFLd1fk5Z2ZgtgQaoPeoJfjCKskEyBNBB9O/vjuwSjLqjDYcWHYfFF8/a7N?=
 =?us-ascii?Q?wosuDZ6kHaYOCFhikMQMNNnD+FbVazfjgpx5pWIpTcQWdGm436MQdc2H3r5a?=
 =?us-ascii?Q?MREgkOouC7AC4iPOE0Wd23wMOUOYOLj94s7LORcyeHBPspt92kDs9vy1gKHN?=
 =?us-ascii?Q?/cf2E5U0WpH1lwkByh2auihU8zWVZ1hzHJrnQ2YxmWcbu1WzTQ/rc2WhL92d?=
 =?us-ascii?Q?+80gvNTs4o3VH/8J7AB/UDk636obY7vhK/qP8PSWqspwC5f3/rLB9pGVYgZt?=
 =?us-ascii?Q?puo3z6+2vboweHCI5rfAdPypOzJYYuHxc4Wuv8wyZ7ursjU/UjtZZJxgd8SI?=
 =?us-ascii?Q?GrBq0qT8tyC1lQijD+ikdDFaydyjkONDnfj+Zw9KyEoKwylQVg/t/77IndR0?=
 =?us-ascii?Q?4OtCOdhq8VcWbSvxCkpuGuCgecTfLmnTrwcumAD6XRFke2aRenOpgI1HZIuh?=
 =?us-ascii?Q?sdv+NVLOHO6m5XL30zcmt8V3YFItPL8gQ1HCLu0Pud+dM74KyviHkqhkooC3?=
 =?us-ascii?Q?KgJNOBMQPw2jM4jwyWRixAwfl4DsIZCIR2Y0KSaqjavyi4tU0qGi29HxPx/3?=
 =?us-ascii?Q?6svqsXy4Tg=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a55d7be2-7ff8-4d58-fb63-08df3698505d
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 15:13:12.2735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q6pVx7fe7tBXSTvGRnQ08TlkeVEF3AIt82kAFzGws9XzpiIBT++nOjduVzDTO2tNqLUrW0TM45mkHqCbOMnMkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P123MB6488

Hi Peter, Juri, Ingo, Vincent,

The series has been re-verified and applies cleanly without conflict
against the current tip of tip/sched/core (commit b99b7f60c5b4).

This patch series addresses a few pre-existing memory safety and list
traversal concurrency issues in scheduler debugfs handlers, and introduces
per-CPU debugfs files under /sys/kernel/debug/sched/cpu/cpu<N>/debug.

Patch 1 introduces a prerequisite patch that annotates struct rq's rd
(root_domain) pointer with __rcu in kernel/sched/sched.h and introduces the
rcu_dereference_root_domain() helper macro (i.e. mirroring
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

Changes since v10:

 - Removed redundant RCU_LOCKDEP_WARN() assertions from dl_bw_of() and
   dl_bw_cpus() in kernel/sched/deadline.c, as rcu_dereference_all_check()
   already validates RCU-sched and sched_domains_mutex lockdep state
   (K Prateek Nayak)

 - Reordered variable declarations in sched_set_rq_online() and
   sched_set_rq_offline() in kernel/sched/core.c (K Prateek Nayak)

 - Initialised struct root_domain *rd at declaration inside if (rq->online)
   in set_rq_offline() in kernel/sched/core.c (K Prateek Nayak)

 - Linked to v10: https://lore.kernel.org/lkml/20261030013817.753804-1-atomlin@atomlin.com/

Changes since v9:

 - Updated rq_attach_root() to use rcu_assign_pointer() when assigning
   rq->rd

 - Linked to v9: https://lore.kernel.org/lkml/20261029132511.712391-1-atomlin@atomlin.com/

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

 kernel/sched/core.c     | 23 ++++++++-----
 kernel/sched/deadline.c | 82 ++++++++++++++++++++++---------------------
 kernel/sched/debug.c    | 92 +++++++++++++++++++++++++++++--------------------
 kernel/sched/fair.c     | 60 ++++++++++++++++++++++++--------
 kernel/sched/rt.c       | 64 +++++++++++++++++++---------------
 kernel/sched/sched.h    | 58 +++++++++++++++++++++++++++++--
 kernel/sched/syscalls.c |  8 ++---
 kernel/sched/topology.c | 13 +++----
 8 files changed, 260 insertions(+), 140 deletions(-)

-- 
2.55.0
