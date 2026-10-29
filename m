Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.95.86
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793280337;
	b=0/0x8g4is4XxBE/2PBU9i+KImYcvq9AUcooYZrrAHuFPTCf8Kg2DL5KRzmvB+/CW9hiA
	 HEuum9KTSg6ec/u1luSdAavru38PNKf0fCT/M0jq0kW6XjC2augSYU+vaLjWHCc/iJm37
	 FjIeTy72gfRnJCGrz8+tELXMKlYsAkW//yFqGleAXakoZV6njwaGvF3W4cDBnPI68WJKz
	 AGM4hPfdfJltbJ6ny3DzGNhHc74iRnlIgBOWxR6MaBINnWDkOCNp9VpoLk+DiZBdc1O+b
	 860x1xunTbag3wjvvL7Q2/OcPoHqq8daBM1WnrRsufN1Rk36yDsnAzEgGq7FeXM+Q5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280337;
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
	bh=/bWXFT4eLfFgdrZo4karOs3P+nDfh1rGnjEEm0Z2p0U=;
	b=EYgD7N6E4PBlFZ6TLoDA+k3KqwIu3dA4M84ARfgulg7NoDjPpuGs90SMeQ3m7MUBiGie
	 6c4Q79GIqWZPdEMPlwDxO1GWbrS4TaBD2rLxsFQ+XccI4CnI0tjxY4A4WdZkKzRWEA8gB
	 yAGf5fh4PSsWq5DxO1QnarKF1CF9kk1YRC+yGqtbHKHnsBz5nv2rg94W1ADWZaPODTs6s
	 FqvZBiyLhkIetUcDFALobXiQ5iRBsY5e5lGPkA13hobxS2ODg3ZZi53Ba1Ttm7HgtQYFh
	 zyK1Cron0s975cd/i+ozK2EfFVbZuW/V7JCHo76L2mv8XTqsfiNbF1J40KSC+yeMQoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=atomlin.com;
	spf=pass smtp.mailfrom=atomlin.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.95.86
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021086.outbound.protection.outlook.com [52.101.95.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0D2606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E0D2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RvfK5hrEaDcRpvc4Um3+rtrVULkPSR2im3zMbKbnVTNYh1WFrEYemI89Y+kqCwkKflcXc1HtkfQ9o603W5WqeWzBpE404OXb9uzL2DCCD5IK0N9+5InPB5YeillptWwRNgO424IVnJB6SIFvlyQ3lDHJm31WJrnabkLipHukFq9U2jLWfyktxfWU2Wc01M8K2RQUguEQRQ2/bobk//eY8BmK7BJgn/bAfJkqc4lJyK+2i2vHcWVz3sxi8yLC2hWG3i/oJ4KpCRS/52CYIA+gmoadpU6FQLstenu0ZHgKzAQmNv0F2aMvcPG6TSB+uzi8qUyY6a0mMKXfIwBfTie7IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=/bWXFT4eLfFgdrZo4karOs3P+nDfh1rGnjEEm0Z2p0U=;
 b=ojogjQDIt6zj8VAIbtN9e0/9fDF3XZLa6Vv1l8VmIWwuJtpT0UGMQkjD0tq7hCEBWI6J2t0T4vRgPy8w2XRJISmZtOVTJbFk9MlmHopyECYbpFrWWAyb+KrnMyEXdy9/qmzYeYJoB+fc7Js/y2Cw27++k6+Popu+aezwbXOWyBLTy0ltC8zx+eC7sY8PQeYOEXT20SSr6q+WAScf3iOKt4oYHxtH4Q2g0TtRasTwBOKXEIHRN4VYhvIfZMLdb0ntTvODktKoq8gj4B6mlDbTI8fB5Y9t11eZY3CVEqrXq/xPRG/AWja4LD5b41mjZP4InrNbPRuEbhbpvWCGcvxm/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO8P123MB7811.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:3d4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 13:25:29 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%5]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 13:25:29 +0000
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
Subject: [RESEND PATCH v9 tip/sched/core 0/6] Introduce per-CPU debugfs files
Date: Thu, 29 Oct 2026 09:25:05 -0400
Message-ID: <20261029132511.712391-1-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: RO2P152CA0018.LAMP152.PROD.OUTLOOK.COM
 (2603:10d6:10:2c::23) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: 844bbe25-112d-43bd-4aa1-08df35c01957
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|5023799004|56012099006|261009221227099003|261009223027099003|261022075727099003|261026121527099003|261028144727099003|261026140227099003|10067099003|261021121427099003|261022105027099003|261021123027099003|3023799007|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Frp2XfDmAGWJjZIW7DWMNL6mgQrtjSjv+/+Uq8dt62Q8yQhHp+0hYSGUzH2R+x+QtSygyZrEPuVl39AKcIJozJCFVXiiKkwm1qRjtusvi9+XX4g7gDD6/tA5DDaXV9+eLYKAxGQ6ivAYzLOexVm7W42oacZiq70nu6tpRnwTVBDRjIAsEFnUDGoIK2cWSE09EwmkecONtPwbRCFxLHgWF2ntMuS6cV75SBtZqBhwTCE33J7M3b8i07Da9c8fwerfyGQ4YZZn3/UEvfYu6i7nVYxW+FtKjaz/3Y1sKqycLVWKPOosqkG88hN4oJ8dD4NyC6czfZYk2zxR3AJ51IHtSlPPCBTfVR7y8g4nb4OSeUzH0SGxYfYzNA6ua2NCl3zY4Vz83xKnPLYqZMR21bVAFyYkV8PQZG3LN7QBdWA4pY+5gBrP5eXmZRLIgLlxp2s2JUsx0qJWELUxbSX9CzNnEtE6ziIhsQTaaadI/bLxwJnBPKb+iZWX7gZVtDrVZwVHqjZOW8mxl54k2prQjOUkOPMWOWShS8oYC5+x/GcWHkKqkmzYlgga15S0mE+1OlF36E7/mt2ZcRgjBo5BEnD43D/du1kY3bla9VSfG3kUYrZ6q+GuFTHukeyT/AjeQeBZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(5023799004)(56012099006)(261009221227099003)(261009223027099003)(261022075727099003)(261026121527099003)(261028144727099003)(261026140227099003)(10067099003)(261021121427099003)(261022105027099003)(261021123027099003)(3023799007)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ha9Q9PdrenoAomA09nleNj3KAktwGETOkfUUYh4YDet+KyPdXfAeEWRy3M60?=
 =?us-ascii?Q?r9AupcEpVRYmBS9/JuKN0NKGFci+aALwpsghAl4OBWJ1JvQod5kux/k1soSE?=
 =?us-ascii?Q?BPPCuaUAS0I8KsfsUtyqmt5jn5IPWGU0Bpr+xLMU9Mx4pPdcFvbU41e5qThf?=
 =?us-ascii?Q?wIjMsXSiqM7r/qdSl+1WTWgjReVvz+lcKvWjAF5f8ZJkeesE5s3rZUp1mYjx?=
 =?us-ascii?Q?u0tYcYsy1hLl6j2IMEl9vokESkcIW91HMer+Gw/iLkhZy6BdQFBPf1KFkR/Z?=
 =?us-ascii?Q?AqlbBY0nfexRuixtTUDSWoOqMLcpxpskdFeGpZMRS4Ai6q8cXLJa//TbNbg4?=
 =?us-ascii?Q?Y9000KbQlH6iQagHrR+afZaC+VTqC2qWOOuucF2CvSG/+dn2nJ0fSbzQIp5h?=
 =?us-ascii?Q?jsr5h8xhm9HKaq54Vn1eS/Evrkjju+0R0Q++WyVRhK9PRqFKLtXGJXAjdobk?=
 =?us-ascii?Q?r0M9YsxV1AKeXU9YtPy5CQ1fz2sZjKl50ekGiFNDwYrfsPwrkvZShF9237eW?=
 =?us-ascii?Q?nieBBXGEoGkcY1LSD2FNOyWh6aem/gjPQnA/NW6mkjTojXO8a6jnx7TG46uj?=
 =?us-ascii?Q?5BFAKjVj3O3GfZ3+3tq3yFlCvuHqXiE/nt4jwcwU1KZbCzvUj+8XpQYj+8Fc?=
 =?us-ascii?Q?zUfRaxjYlY+LGXkeeUzKEd581n7Z2Kuqyqu5izYpHADEvs9GpmVlrW7Sloyx?=
 =?us-ascii?Q?Bxspqrs658AuRwRc9sJD3ivbPGw4L5kqjXwoMoQ6mTZIcf/bL/umxrXxf38b?=
 =?us-ascii?Q?syU2nM0LIqPWMQbtGPlaXvQjSw6oj18msPLMVLG+6Z5JumaS4EIKlm9S7vx6?=
 =?us-ascii?Q?vQEWQstNwL7Qcwx4y+/VRLgisnu5p7mttoUCtk6oDf7CmwzZyu8tj4YbSwt8?=
 =?us-ascii?Q?Osp3iOyJCknRlg8RJMhqhI3hqgxL5qAbHkM6TZxA0JKRAo4SuN9LzC4Zkzxz?=
 =?us-ascii?Q?rVnHrmuN5/IfJirQxymWw8w6cYVLqbV1fKicbrKcERbTelRD88xuTg0eKiEp?=
 =?us-ascii?Q?FZiOfvSc+QgXo63mGGAArmZsEpLmW6K5Vs8w695TMjV3UifsQkhUVuJjURUn?=
 =?us-ascii?Q?ZIQRhme9afCiD155SJik//4vCfif/25nI6xFU8LQR+yB37DTClg0YbPq69Hp?=
 =?us-ascii?Q?488bfMscbSmcDM4LTW+yXRqoQXMdMW2NGNx5huTPPgX4mzXo8aRFXXEwrZ+5?=
 =?us-ascii?Q?LE1QFQxBSjlKW3n+SztffIX8UFevE1bQ84iUBe6ljV8MAZjwhOTTZUO5JPV+?=
 =?us-ascii?Q?/GzZ94FlMcvvup6/EI7HT788KiAyRCZT6DuPu36iTSVSoV/LkTtVgEfVlxJt?=
 =?us-ascii?Q?/HVzIFHJaRphi7bc3KNCtOxkjRU1H2GJ261LA3BTyOSDPc8KKbdbFzRB3eGd?=
 =?us-ascii?Q?smioC8bFoYaEHNnYo5kfAULKMUyFoDy0ZOLjqi2NHUERKqPWxFkkOeJMWN71?=
 =?us-ascii?Q?otgrHG51HJf9D7BTOgOjOuWPwKlt0fNsJMZ7wcXNYFj1WHC1y7XtqJ793Phh?=
 =?us-ascii?Q?zYCqsTuMYPv/hbJ0baLxP0APr653XqR4DdwhpkaHWUvc6+ZmzWH11OMkxH6G?=
 =?us-ascii?Q?araups+qQ903A6oEQRYXJn1rlUI6je8gIVV+PzOYIL7+GK/UlPhX59Cpv/ZG?=
 =?us-ascii?Q?MtmosoKn7HZmpHU/QUzLTomin67ldQiQ5Bv7gRlaxxE6217xVQRfL451YH05?=
 =?us-ascii?Q?KzaLVsySYa7a4X20Xlv4l3eF7GfpyAnoPyBqlts2VDdivF3tfO3J9Qjg0eBr?=
 =?us-ascii?Q?ABVMfmIjJg=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 844bbe25-112d-43bd-4aa1-08df35c01957
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 13:25:28.8986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ACHW4m80Mx6BRbfMUnwdlR7IDxvpoy9+GYw8p4jjBVtwRvm8zByrs7WaWDgr9S0P5nk7AUED/8PWtB9EgYx7lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P123MB7811

Hi Peter, Juri, Ingo, Vincent,

The series has been re-verified and applies cleanly without conflict
against the current tip of tip/sched/core (commit b99b7f60c5b4).

No functional or semantic changes have been introduced relative to the
v9 submission posted on 27 August [1].

[1]: https://lore.kernel.org/lkml/20260827221809.988394-1-atomlin@atomlin.com/

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

-- 
2.55.0

