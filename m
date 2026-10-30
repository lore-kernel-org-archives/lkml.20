Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.96.93
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793324308;
	b=o6bzKHrIp1lPg/gJWL54ZB3J7+IpONpsT9CSZwBJhHrrcSJ/k4diieinpkYzow9lcQ0P
	 RVg+MHHm2qxKNo1ND7wh9HxHnhX3nPEE1I5cWsNeF4FPe793nHyKuVFHI2mj5+I65MAg1
	 zfuWrmW4Abd+arp4RFVgjUPeQwZNsF9PmG99YFnSCaXrqqtMVLR+Oy4PC1RznAlvyLH0s
	 TIY/oCnUsrr1Ge8XUictr0VwA/AVHlQrA/Lz8mQnkXKi1UGRw+raKtTjVk9nS4Qfy+ktk
	 cDfMCpZgPtWXx9wL4Pm/ZYgHLMyJ8qqmVOwCm6Lj7Y+L8LC6K4uaAHNyE5QKFm+vU2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793324308;
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
	bh=x5fSExAIoQpwN2gXIuLOT6+OFsNGwht8tmfmRorWk98=;
	b=bRKGFRBpR7iKwvZyE56oboi8G0fLMHMemASJn5R9HfN0S8Phzt3HJ0WFElIMcBJ4MPwr
	 Oni7kRRAKoYIY53t9KZz9eVJj8G+spUnwp9KylCwDuhoDJWwvOBgWcoiw6xZGuIfqrnR2
	 oXikejQLjsHiyUf9ArByjF3VWzH9jVF9Zobzn9+gkwKn7ZXibPsNKLcnChhpnmAV0x8Dt
	 BpGtDllrvEUhYNOyCmVEAjpMkrbZen5MOf/tGRheFap93wtzu6ewGbm3za4R6SmR31CxN
	 UEpfxiU6q67taH5dCdIZT+ClvNUkvlMzxJJKvUqHADRLi4sNNTvumJZKErRJS3rPfEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=atomlin.com;
	spf=pass smtp.mailfrom=atomlin.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.96.93
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022093.outbound.protection.outlook.com [52.101.96.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD1A606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CD1A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oe6bl0o+Aai6noPKHhVmDhcAQPTzBMKh4+YGWZ3yWAjvuO7v4jmFLLjOXOKn3u6nw9vm6AzhE6zLyEeqRJDbxUb7AnFKjHuYd72WVdzKmLBEPiUr/V8Na4vlBmF2Vf/V8yHQYrWJuIvj+PEK9FRFinBBo+2Lx+WiDh7JrV21gNukSwBwd3flqUPHgl7usdBtigJQ/5nux146G73ZyR1BvMn3Ozy1SOgpAXIAscN58KspO4EDr5gpaR/y99qjy4pvItJT+lEwlAaS99HuVcKS4XUYyUCIt2+xxNOQXSN1euyktB4oPtMyKJwFqFe0Xh10FqV9wFCyWmbJ/RZbGHOiGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=x5fSExAIoQpwN2gXIuLOT6+OFsNGwht8tmfmRorWk98=;
 b=WToxvnQowOg5e5INIc3KxB71P2b40X61/t3kSIRQ/0iLQQXHoP18LG9SzJLBo04B2ARe9NiKaD9rCzUqB4oluFiborPLLTItO5ovX70MWChhE0PDzXDdvyh+Nut8vnvReMstMUKiPzymmJRMQflwqUqMLqEsHbuWrvlOQ4xZgyF2yARuy2Ok1TxFHFkDpf/XgNYTcOFrVje8Q1WDRehrk7JI0j1cj1GcTtb1pWMDrN/Qe6z7OmWlXTLgkT1NFIxnMQjp7ysvbbnoyaOfX5VYOlLFsp+mCSfYvlrmbxVnqHoYB+ler2uUadD9FxDAQl2Gmzl2mZVlLp14WtMbSnonNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO4P123MB6323.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:299::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 01:38:21 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%5]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 01:38:21 +0000
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
Subject: [PATCH v10 tip/sched/core 0/6] Introduce per-CPU debugfs files
Date: Thu, 29 Oct 2026 21:38:11 -0400
Message-ID: <20261030013817.753804-1-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR10CA0025.namprd10.prod.outlook.com
 (2603:10b6:408:143::22) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO4P123MB6323:EE_
X-MS-Office365-Filtering-Correlation-Id: c163ba18-9bff-4abd-a7ba-08df36267b20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|5023799004|56012099006|261009223027099003|261009221227099003|261026140227099003|261026121527099003|261028144727099003|261022105027099003|261022075727099003|261021121427099003|261021123027099003|10067099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	bL/0iPiZ6o+bvgKYyltrj2ER4m7cOwclFxhT8hCFkV7NtTWPJDEA9u/HvPxMc7qK6Uf79afXbORjBKGzLkZgKpG2npW8oK9M6+vL6Jag5WxCwfgV882U9Ka0/2pxqgJbUlQGync4cm3he5yM2F1sQsU616Hm4uV2TiDnJPfGowhE21eIbw9B920e1mkoTr9GtCiLs1hDJPh3KqnuK56PrRF8miECK94M/wc6wF48usao8sNUEAs7q5M2qPTyH74pBcMlxVcgTYgxTFcHySE6wIav+J2bcuj0miOY9v6+BpgHfK6lbKm/8nq/9bEabvyRBca+caAGvgFyaJ+/ohRMgqpZ6WJ5GPhh0F4yMWvSDgyUMleNPIk5Pd2tnXCq52awKEFR/H93jRNsd1PrHHOLDvNEaoCaK4ts6aPGqSeoZwMQxFHPTZ/i3uY/ExXAGDbkSzN82wkw83r9r57lC5sPL5KSQo3EUBydTFBud5O2KYpxThGzQd/9ok4V1nanCezfgHC55ZUcwvYYHfPbYjERK5KKCjB+xbnGA9UWd2FNLdEdocgyfhT8VJ3Yz/YwW6jhiqUAhB+lwnoZ5M9z5tAdFUN47cfOWlzZV1ojMtveNW6NFm1U4ojjpmP7PJ+K+b9F
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(5023799004)(56012099006)(261009223027099003)(261009221227099003)(261026140227099003)(261026121527099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(10067099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4y59Rcjf9+Qh2mtedQLqqZNqrIcj0O6H9MfiUEsuKnRUpWXycwl3KuzdknTN?=
 =?us-ascii?Q?w7pwkXn81ikw+TAuZcrIPTe1A3Q3lesteSUbZB9TE+Gn81Qczq1iw1q8F03Y?=
 =?us-ascii?Q?yrx3H4wsE7b/pXfLfxLnAoidLnTZ3BzBitGDuLc7+Zt+hJSCmGP2C6iGDKFd?=
 =?us-ascii?Q?bjXlgkNtTcAkStHsL7T1qSsuq6AGQYC6Hd9PGLxLoehLxpcodJx9MqCo23WC?=
 =?us-ascii?Q?rii8byUq9pBR1wt7vlmabh84mwvz0rpvfxVaQ0RkrFLypIZC6JKt0mF8WpJ1?=
 =?us-ascii?Q?m0Klu5f5D3q4SGZPQrpxfTjfewbDpucIiLP5z+orClk2NdL7iK9NReInR5yW?=
 =?us-ascii?Q?eVZ45lLGCu0BB9LD0KHMD8szFG+QzB3Q3Dr9a16d+9BJUoyWFmEwqcbCD5KM?=
 =?us-ascii?Q?/38RIUkRI8UcNRnIlDczSuj8v76ov8fuQpFjMlGC9TNuFNfW1d1oYJQIkdx5?=
 =?us-ascii?Q?BL44Q+JDcUpSIv9Wvl69bidi7xMiI6dOM3jkZongIp6lYbxrZKdp1i7zZznx?=
 =?us-ascii?Q?+Rcq9eRPA4tulqCHWeOsEN8Tm7T3HfPcdE3yK7ynvT/t/koSS/6eUDkwC+WM?=
 =?us-ascii?Q?PTL9m7hvmu0iW9v6lv3KPHUvUuMzw8PiPlNrsnmkV8T59sGZACLhiPQHXk/1?=
 =?us-ascii?Q?cg//D6KJs65BYcLsbRxGMQGIyGC95a0wvdNnAAY1NlIxtNMELL4kGdrIQbzU?=
 =?us-ascii?Q?vQxuJZZ4L58Qt9tMl9IxX478F34aLvkXKaVSarW+gccbGneRmWVFIT9cE+VF?=
 =?us-ascii?Q?T91/sOprFunxOBvyJw5yrrpKW+HqNbvHm51wxGJ1n68vjMjkh5KqsaCyIbMm?=
 =?us-ascii?Q?XjT2zZQr3LQOEeUBgjgxbkCvM8iy9E4pJzbobMAIUBhJc9d4I9qzbPPeRv5U?=
 =?us-ascii?Q?CU/S6A+igUETMIIwyMIW5NuqQMQx463DV1bFqQZl1UXXmjpP3P/4P7ODBz5V?=
 =?us-ascii?Q?0h8OdErQgoARDZTk++ogsKJZO1YcSROpQKbv0bt5h2t+IUxOzbS9ZTzYCyzu?=
 =?us-ascii?Q?CcTMWT451Gl8SRJXliU94FS8qsdCY2LCR23edzHHCwY1wrBjirtlL5yWbqtv?=
 =?us-ascii?Q?p2JFqjLS4wcxW45Xb3WULiNUlSFqhvajx30LwR76QFtMFx989P/4msblHcOm?=
 =?us-ascii?Q?ZtMeq3Kbci9MVSKUCA9F8ENABG1x1UcwM8bZdy2FE3hAyLD4U6phCv28E7MH?=
 =?us-ascii?Q?5i/HmqH9+I8yIvRI+f3h8EtC5WSyRLMym+Kt4Ttrj6idjI//NSCyW3RmnW2w?=
 =?us-ascii?Q?wY0Ma1+2FDIpQj0wviBeDz2ceO+hnFbQ0Gd2nDMLEGXkF7VgjEmsP0yb0zt+?=
 =?us-ascii?Q?nwEL85CHJ6PiDcvwxGk8JrMn5FbJr7/jJGFyaYYRx/H7OM3ksXWWVqU6n6fL?=
 =?us-ascii?Q?mFl5204Bhc10NQiDSfPtdoxZDJA4XIngq56RIFLG+iJHjLQJrFbWQFDl4pBU?=
 =?us-ascii?Q?RxEbe1mdv4BwCNDYEWbgwCYUH0dY3JWgbUmen7W92aYqpecUhxUZwMOErbYN?=
 =?us-ascii?Q?Qa5dTiZwD+JxZY+CnTZP+yxiCdldSjji0m9goJBp9BCmgLfSstvZgIvrUVk7?=
 =?us-ascii?Q?Wn3iebhdacsA7ICUqxSwzzyCjowN9CIengJuW4F1B40U7vbcxIhNPDYC6jjM?=
 =?us-ascii?Q?jCt1PoB9WrNOkBgKMw+FYbHNknlYoOCImD9iah5d4S62Gs+EeYAqPee2H1KA?=
 =?us-ascii?Q?7IyYYUjhz1MxtHAj7A23qmAnkAwDecVysz8XYmhIuAtxY0J5t015xtQh3I2Y?=
 =?us-ascii?Q?6xIPgK7Tyw=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c163ba18-9bff-4abd-a7ba-08df36267b20
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 01:38:21.4298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RsGp9BercpCaCLhKQBYY7XCdCtWtTMeJqFqX7lWyNsA4ZapdOU0vWXTamyY7S5wRTxniR8PeY6VN8za/dp+mMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P123MB6323

Hi Peter, Juri, Ingo, Vincent,

The series has been re-verified and applies cleanly without conflict
against the current tip of tip/sched/core (commit b99b7f60c5b4).

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

