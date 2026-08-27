Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020079.outbound.protection.outlook.com [52.101.195.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9E246C4BF
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 19:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787859627; cv=fail; b=kIZ/OxhfI+eqfc9dwP0L6lg2xiJufbdpxlkou/Pj+0yEKWCm9ZQMHA8NK77bjX5Y3AWz0RzgfvwPEKAN7p1zog5uAVyRVC75MD1VCGkABeMTxs2v2n4D6k0xrFcrNrfMHPP9YBEEfXdmxl8xtWrild1qpaG02/Xp3ctnA0O6Iag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787859627; c=relaxed/simple;
	bh=+XkfxlbpQKgMEeXYx5zk8rSq2o9H67LqImXVv43uosE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EzOQ/Yp6UdakbZozRDHfMoDMKCeq12AN4OTSXv8ywEsl25vNJBrYteL8y78/axf3i4+Ntd75AeJUg6kLKwD2KhL8sP8ehGcn7Ps3qc3EIZcN6M5+o7zJIth9e/vKIuf5fgH3Uf8S2UJEGhIDSUtYP/UWMG8k9dg0bmSH7jbxwGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.195.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtuAxP3nMAP1MkUanO5i/o8WjqBC+dwJNjmb7+2pez3HSDUz0XLYk51KDhiAAt18PspIRmepG4oyebZeNgDZZRH6AMase1H9RRZaedcPW/j4p05ULnHXJBOxq6aGfP2HLWcrvR1+wa9wNNb0Sf6TQus3evfMe5fcPiipDNS2t24A2lCoi1W2uUw6Fuqxnhv5kpLlWLWBIhSSoxW+dBEOv8F4R/1ctyl2RUCGhDxGiH4MRolg0OZfwKxQLggI34h/konDEB2pYSbKwZdHtNRRVaeMetSDXu9+Z5sJy4e8xPN07e/lbqAQ+j9OkXNqQ4NyGQ6Eu5Mupu63NzXw/jJ9cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=UYwraUWxnT9P+Xj2zx8xXWpCIPcqPzZxozbnwcWDgKA=;
 b=Zq4Z7WFIAyr3KhbogNiauPPJ0aa891jc7na70ZTmP8pNVT7WjvMjHxWNKynwDJftH2INaqtojzRK3X4PAl7MtajfALXcbTzLNuqPCtzjqTw9J+6kd8YB2AVajlqbIEcppqjspWxDPu/oiwDdJpSYHgU/cDfh8nz8Jfk7vWPga7AfacQEO1E7OKu+WoKKMva6ePZWqzVM8KyfVs1/+cB7QR3cpQRf7TPJcQm69ejSu8Z/YMFgiGGAsMrOW+50K6AZ/7wZW5ErCoSyam5w7gFZ9ZzaQHhrXNowizPsqUJdg4uGQVQufyYh2dKsEkLcIgxYabhn6nnM2mEZuUw+P5AIow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by CW1P123MB7744.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:247::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 19:40:19 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 19:40:19 +0000
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
Subject: [PATCH v8 2/6] sched/debug: Protect lockless rq->rd access in print_dl_rq()
Date: Thu, 27 Aug 2026 15:40:10 -0400
Message-ID: <20260827194014.977758-3-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827194014.977758-1-atomlin@atomlin.com>
References: <20260827194014.977758-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0104.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::19) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|CW1P123MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: e2eea241-052c-4279-5a5b-08df047306d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	96st++U5/vBLZE7YS88teJV9qE4/5GZu80fUoFBILhEEkECBVU5xTU/OM6XvJhah6rXN34EpFhDOVEWXMa2a1ju2p3St9UD7L0zGlNIVcfIbfZlliW6INzGRohk8i/NG6Affegm/sWYvsVIlZYMV+l1oqUrOiydqDDz8BVbq1dXdRhUSaEifWOFa+AIXFCnQVcDERvFCKvmCwRJ5D2LhDgMxirPfbvLpTZTybLp4TI0n6iP3BjTW50rVMXCH72lugq5OCEyPodBb2ZLWG+f2LgayKz++7dbZfjBioMqe9J6SWkrcFKFAN1TeOR9u40c0YCgrQMoV0spXVjLdTuPZy/ohtMXT9ovWdVpA8AWuBbbwy2s08nwhFl9smr+Nw4dwbroDBrZoG2ORcyL4U/Hn4A/9JLQB6xVmRHaWuq7LE5I9pgX1nd4wm8njGRHELgyAWJXIP8+c9tlDLoO+AODi5b8OXlCOnoV/0nQMJsBa5Q9LVL5L8nqkGIyKmoyhf4VPva5dNL49Ru5Q3gyvAjVbPgBQ+Ni+1kRS8KE+XuVsii58Ou+bJf5IEqMBUUz53cFcZbNQGI3uJb0NNNI6quyLcWJ9rWYWw77p48NyokutriP3LWdDdOSue4DZeJAASC47R0HWayeOiYp7d3pa6s+XpdkqzVI88qENq2wF9YqtsJo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xbqp+RcBGqkczj1n+oyk3XuOe1nMd3ENQxX/OOes1wFReoFj+ldsJ7o4MnGh?=
 =?us-ascii?Q?OYs6YgiH5PDbRmHFlXHyr5nphA+dxX3bXSkEOh4U+ansky4LqoY699NZhOo3?=
 =?us-ascii?Q?SJ0lQXgGZjKe13+lw96YtIN9Z3c/FT054x5XKQMTG50rWRcQ35rHPzVNkhvZ?=
 =?us-ascii?Q?DC+ZwFay3QPxEiJxgKit1M1rvfsCzq+zu5ntJkG36V6tjwOyCYAiqshKGnb0?=
 =?us-ascii?Q?QsTt2Q7fs5B/Vi4onXbuAsihdFFvJCV2vjyDRUM2t6MPzgtDhdd5dTTvAZ3K?=
 =?us-ascii?Q?chVGwwAqWg7hTzPmb7/Sovy5l6TVxvdV0//tYOaP0tTKPdUzeVTfZBqScYay?=
 =?us-ascii?Q?u/1SYTTkQw6Xm2d4C1SvySvF7NnjoBxpT8Nshxul1su8rsKUsZaAp57fFa/g?=
 =?us-ascii?Q?AHJD/bQOp7OpfBzCIkpF254ApStErt7fq5uuCjE7u7vh5nVm5RC/SDq8BSIs?=
 =?us-ascii?Q?BTMrzq1RRpNMdOygOTo1XM+qeggTxC7UdouJuAOnG1PmGO9LU/InBxIJwC/a?=
 =?us-ascii?Q?SgqruFjO01vsP0uBnHLjE68EeSR6faIENIpyVrorfg6qnUhe/tQgQIDlYqzT?=
 =?us-ascii?Q?MXPCH5MVdecOOcQNy9tvmnPL3q1F7rP3+pOq4HG1shv8LxHJNLi18xu1qqvN?=
 =?us-ascii?Q?S7wT09ny3JKbzRZCj+b/gheXR4RcfzvVfKU8vl6ISocZw+5KoGjwwxwsXAsA?=
 =?us-ascii?Q?Ny/ubet8f1IIQVYZeCiMGSj6Z3GWUFfqZDQiLBOAzJzeNHBLToStD9vIFV75?=
 =?us-ascii?Q?RZtysaVYBOPWPyMeqmFdZLpwN0N1Tbxk4qs/mz4pFUXXNKd0oUeHzkroBEUJ?=
 =?us-ascii?Q?YrvM//9njOgTj68CgO8lmTnl7jaXTfrR7QVgt8qqacbm8dH9vW8H9JiIEZiJ?=
 =?us-ascii?Q?sqnUyc14iFOPBQMGf987PLwX47gtS+eKSZsEMz2QtOUvyLbmv8zHyKAOR0q9?=
 =?us-ascii?Q?YH3DZkYMskSK3G/w9IcQ9/4VIgyPBU5XZFbwVc/gbJbM8UZsUHJMqC1iiPoo?=
 =?us-ascii?Q?vCcuyD4kWoiiNOnQxJQHS0uTRAr5TGZw05m2rQcazTKVS7w4wvTL73qQIegU?=
 =?us-ascii?Q?HX3/iwI3L95qOSDYUpiyBgOqK+bDTkchGc92wxOfF8LTCy1CnxfnBZ2gWEyh?=
 =?us-ascii?Q?O7v0V7DtnTplXjWLxa+U0RE1zcch5Rcog7K647c3vInD8GAZdSJopE/fvNra?=
 =?us-ascii?Q?l/J8vMmd3tJs4FF81HEvTlUDZPOdEhxDsu1X7WDEfm2bSRtIIGQEkYQ8Tk2H?=
 =?us-ascii?Q?MhpygLq8GAqXUJaQX4m/A+h+xmuVnir/Sc9HOMS0ZWdk7LYUKFrDjISoaMSf?=
 =?us-ascii?Q?aKSmE17RKC4bGn1TXJSA6EMnwcLIKqJcFDLq42WuVEBqEzO1XtldyLEqoX8U?=
 =?us-ascii?Q?3lOo2Blhuuz3gppPDDFPKALwDqkXgjmB3Lle/GCZhHyhjKv3x+FEr3v/LkoA?=
 =?us-ascii?Q?/Na1zLQFnNxagg8nrSXthT6do98yTTbsBblAK182oRkiE21hLg986NDLQqvt?=
 =?us-ascii?Q?lVaKL+sZ2jUFPOP9Dp3ws7FNMMUXyTajFaZZz49FxAqS/2TsBCBfp/yLejTO?=
 =?us-ascii?Q?y0jQKyoHWh9DZQKVmNNUyl0PfJLI4REe5iAu0zn1xwcK+KNN/ktiGevRupQd?=
 =?us-ascii?Q?PDC+FjjyeQ7VoZpH78HDRm59fbiKRdTj5osOBUeqE1/wPsXNhfBhDH4P1Fqv?=
 =?us-ascii?Q?rQzhPVU5xMHJhRDssg39VNaptcGIk62zVmGffd8OUSIvy3zz?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2eea241-052c-4279-5a5b-08df047306d4
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 19:40:19.3042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K/mpmYbflFmJbVMhY4nLyYpTNyo8zGkVc0bHSoSFQRq10UZ7GJpU/M0fRvyEoOa5Iiysz1kA1tllAZe+5Lfqww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P123MB7744

In print_dl_rq(), cpu_rq(cpu)->rd is dereferenced locklessly to display
deadline bandwidth statistics.

During CPU hot-unplug or cgroup cpuset repartitioning events,
partition_sched_domains() calls cpu_attach_domain(), which executes
rq_attach_root() to detach the CPU from its root_domain. When the
reference count of the detached root_domain drops to zero,
rq_attach_root() calls call_rcu(&old_rd->rcu, free_rootdomain) to
schedule memory teardown after an RCU grace period.

However, rq_attach_root() previously updated rq->rd using a plain C store
without an RCU publication barrier (i.e., rcu_assign_pointer()). Without a
release memory barrier on the writer side, CPU or compiler reordering could
allow the new rq->rd pointer store to become visible to other CPUs before
the initialization writes to rd->dl_bw are committed.

Furthermore, because print_dl_rq() did not hold an RCU read lock while
dereferencing cpu_rq(cpu)->rd, an RCU grace period could elapse
concurrently while debugfs is reading the file, allowing
free_rootdomain() to execute kfree(old_rd) and causing a use-after-free
race condition when print_dl_rq() reads dl_bw->bw.

Resolve this by using rcu_assign_pointer(rq->rd, rd) in rq_attach_root() to
guarantee a release memory barrier when publishing a root_domain.
Finally, fetch rq->rd using guard(rcu)() and rcu_dereference() in print_dl_rq().

Fixes: 02968ccf7b80 ("sched: add /proc/sched_debug file")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 kernel/sched/debug.c    | 3 ++-
 kernel/sched/topology.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 72236db67983..61932ef7ec4f 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1172,7 +1172,8 @@ void print_dl_rq(struct seq_file *m, int cpu, struct dl_rq *dl_rq)
 	SEQ_printf(m, "  .%-30s: %lu\n", #x, (unsigned long)(dl_rq->x))
 
 	PU(dl_nr_running);
-	dl_bw = &cpu_rq(cpu)->rd->dl_bw;
+	guard(rcu)();
+	dl_bw = &rcu_dereference_root_domain(cpu_rq(cpu)->rd)->dl_bw;
 	SEQ_printf(m, "  .%-30s: %lld\n", "dl_bw->bw", dl_bw->bw);
 	SEQ_printf(m, "  .%-30s: %lld\n", "dl_bw->total_bw", dl_bw->total_bw);
 
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index bf83ceee23e9..58913dc3a8f2 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -495,7 +495,7 @@ void rq_attach_root(struct rq *rq, struct root_domain *rd)
 	}
 
 	atomic_inc(&rd->refcount);
-	rq->rd = rd;
+	rcu_assign_pointer(rq->rd, rd);
 
 	cpumask_set_cpu(rq->cpu, rd->span);
 	if (cpumask_test_cpu(rq->cpu, cpu_active_mask))
-- 
2.55.0

