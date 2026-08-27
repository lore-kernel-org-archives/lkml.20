Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022130.outbound.protection.outlook.com [52.101.101.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF80357CFA
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787869100; cv=fail; b=GDaknsVLKnPJMHuzI9RpEn+99exxHnVwHice70Wi5SnnVh4gFIqLGqgKWKj6IFLj1s69870J2PWsVwsdvnIJSg56G5S4bs/fQWVlT1arXAcUw0NULbOuxqAzcBWocUfl+4tUmq1MpGeaC/Mx7X4LRGpSrl76inOGeSHP1p6jPNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787869100; c=relaxed/simple;
	bh=815+FbrzLetzxB6CWo+FiLYNhY1aeYztOE4hQdqOkbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RXf6gar4OQrVFAdqOfzqCkORW1jscF2L1j2g2Znu/FAFy0HeEYzagOTSaqp1C8q23pgrj6fwyfUUL5iH5KAYmSZ8PSxUsehKT01wYUEfj5CSOTMgI0qT7rBgQl/dq6lF2oUm8yT7g7HtDZms6JQhy6mLtVYKeDkNO+NCU/Nz1LI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.101.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KkbPKNZ5ZVQhfUU1xlv/15PwRvFYEZLKUzcKx3VPMn9W9IU8d4A+zhLQTA3n6FbKFw7Bcb3V9dBfVwudmzOF2+QM4sw4zTm/yB1JcmGRtw8vJK7RUUj8JY/YY1vk4BwMzvqXNPVpWh4ED7In7ikwrVHmB4F3QKBuADLYTpfBft0L5Yxr5oxyiIsaxsbi5k+yUghGCvoCM4YjunReb9qgwDiGYyvPb/zlpQOPXa+sX6NxqE43cL0ExLTw8flOi9o1LPRUiXDpHp04+DKfWEXJ8dxGfPMIEI7YLJBrILjs7b7E0VWwkmn7ILcBZZUkQw0H/wvV6rdD6api9i2Ew+NnxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=wl+LjtooGTK+RDvKbW+Yyc1ghdvCxgm/m4ErHJC7Atc=;
 b=ioT6MYGamHGVRQHu0DKURhkUDQGBftl1zJq/XS2mGCz2ij/pRaZMff+FYdKZAuOQzvx362dQkrDkR7Y3OvYpH/xhz5gJ8hQVcoPvuCuHhstJKRVyUvxX3rFjw1/F7yT4kL7ji6pZ+t6GAhKyOUUCK0hMDYFQ1u+Lpn0GE6tMo4LTTxL/3BEd2wtDLwk1xeHiMwe4VsFnvmXv7MA0ICXKq7cdBjtQh45gtSEjSRGI0EA1uk28TmKv75Bqs+cBy8Cfhv/8O/g7L+ZiuzaDba7cZYIBCE/B4qdV1YWR6SavRSgzrP/Rb4e2MjtNIQMcqfxngJ/oJaZFr0WiHHPSoB/xEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO6P123MB7095.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:342::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 22:18:12 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 22:18:12 +0000
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
Subject: [PATCH v9 1/6] sched: Annotate rq->rd with __rcu and update lockless readers
Date: Thu, 27 Aug 2026 18:18:03 -0400
Message-ID: <20260827221809.988394-2-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827221809.988394-1-atomlin@atomlin.com>
References: <20260827221809.988394-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0036.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::7) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO6P123MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: 75551f4c-e230-4e4d-f2c1-08df04891556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|10067099003|56012099006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ziYttlmd04/9zqDCyh3b3obvv68vs3+ybc8kx6apdnqWUr2gKnuMyEd6/uJOAz4QXA6bpAifEEOUJZyrZS1NZHe7TV2dTQzdMvEzo7d2hgEF7ow30+Da8M7VjYRxx7ka+DdbvMEs6MqNiPUJQFJ42vnx6vyIOWly6+OAgCwj1IDxi1mbBCAjOzsN1nSeJPPbVer2wFOusIu8iNsq7dFzdhTS5jrEPQ43MFyzj1wrEHeQK6u0gaxd4L1Obh1zZ4xgf3o7juFjBv2bNoqcIMLLbi9IcBl4OFue4s2aRm7UIiWAA/yEek9bJ1q+U6OL5UsCWXn728L/9XSKjNgu6fZPFUvh3GZaW5ZAif/JRwckuEO31J8/5P7fQvHi5XK45zeT9hSRJ/Qn/QDarbaD8aZnpdO+vhBtRvm8D5nuzG8tT43kpiHry2gZEEgW0+7GrpzvgRCZ1zBfxnvCTrnxRHt0dRLCrLCIgRgm9680rXQg+cyB7cwaFJDAAt/MswYP9pXfbzIgQHVbfS/NDsri3kuj8Atf4Ak/6l80RBwcE3xqHi2fSdzYrgCS2bjWtyVh1sOqucys5bfi2wg5LrVdp3zHJvsfwPC9FO8bytoebOTq3NtD0uBvYer9OuheJpMJdz/F/AGArcphAc5/wuGv2uwbCjZz2yB3H6KCRh5ItGggp7w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/ps//cNuAd2s7Oli2iJmwSRrwg+vbxdUW1zN2HbAPaV8mA7ZxHoIyM8aFCfX?=
 =?us-ascii?Q?FzUOX2F+liyPsXrsHZaadBYt0pHdOJKkoi4QwxEy4TJd9O4fy7v5ocaawWW8?=
 =?us-ascii?Q?Lcabk5MAdTTbjaRVvlawDPyHeG78VUuxSRDEddKmkurrDD/Pdf5VYAy7txFN?=
 =?us-ascii?Q?xo5qwQ4Xk8gCAXzM6ZcXUn06mQquLayjXo/2z/XZZlOJdKi+rcXCHB+Gb2wN?=
 =?us-ascii?Q?7CDJqV7Vk/dQ0mgav7zX2Bww++OU5QpNJXmv+Y+WKh4T0r1eDyPnLuZpBepu?=
 =?us-ascii?Q?wPdLbZfQDy4ztZEnmDdVFmUuW/zTG3QSDPIaA8pvCf9cDMpGsvX0qF4A6zni?=
 =?us-ascii?Q?bhOcagxwQABMSSGU2aix+CkbYGvq88YEE08x48lg253X7t2xgOyYGLwA3Azm?=
 =?us-ascii?Q?ELvjJ9tQWFCwggc9b940f/LouNh46Esa2jzd77ZgSMHE/yHz9ixYidLBV2a8?=
 =?us-ascii?Q?Njoh1GDikyeZIWWwVNkBo/JEst52FUjA4zdNcJ1vsEL6bvZbEGNj3ZnbWrKQ?=
 =?us-ascii?Q?spToG13+acMUCKdE34Hj1om7xweIUMMoe8o2LMX/XWtcYqR/GAGKja4kHYjF?=
 =?us-ascii?Q?Tr80G6K5HiT2jOgDWn0ADSBAKVjupGZpH6nJDm/WLaXEreRFUVLRE2WSUdZN?=
 =?us-ascii?Q?ZSKsN8gchoXjEjyzRm+y3tX6K6wT7CM3y52egsIApo+/fk5TME3Zu4bWg2UK?=
 =?us-ascii?Q?+E8+Tx7eZyvlNGe1KowBwGtZYelRGN/D/YJ38xtkt8U+3QG0T+kfcQCQiTnw?=
 =?us-ascii?Q?bO3r1oIJ6Y9lW29TpRAXDhTY95P/0Tmha2CtS5vQdIIuxTdQKzC5Ow1G6lJK?=
 =?us-ascii?Q?B+/s767TfPj/7953nPQDzJFG5y0dsEIWv+PAUpmKsZASGnpIPdX5Y4f0hHc8?=
 =?us-ascii?Q?bhw7wNa8e3TN1lsUofpI4J1iau2kY1xWDeVYUmq3sMCpR8DKi8caRRgbXBwe?=
 =?us-ascii?Q?npJpCeLTmU0WwylIPyB9rs1smx61eTbUDYlbCI/KUjuPo+F8zHYs8Z9G/wnD?=
 =?us-ascii?Q?/7eYKPf32p4ZOy2NDHecS77w3Cfd28J/3Nw4usUU1hyF74JMxEPI/wTwwgLD?=
 =?us-ascii?Q?I4dCsjCabMQj7FJjqkxQvKOdDFmZVgONY23zvd0fNocpdKeEMSi/LbKRQdMT?=
 =?us-ascii?Q?laAnbxuA2c47LLBqWmZPCP8M+SpKrXh25BBe3jf9f+9d6eVnyBIxJMQHeo/0?=
 =?us-ascii?Q?A7dEq+0VoV33Z4HeuywtfyKjulY52r+f9ED7SiOTURuap1NhxcsK6+rpP8sp?=
 =?us-ascii?Q?nfynZ6DfMlt0xldvyWPhcXDTmlH/5Nab8RJesW4MRiT+JUDZ0ZcWCSkjBouw?=
 =?us-ascii?Q?00ASuV2IiNM0Febb/+B+9yEs3lNR/iAPCrphslGfec6HHm9PUTGSImXZpv4W?=
 =?us-ascii?Q?7Hm55lnS53Xg4qtDfF4M1nK5E9Qd/Hny/9i/7WWC/tISJuMO3juQ4DkZ33Z0?=
 =?us-ascii?Q?fwpMTXpTfbnudfCWEsEp1yzkxm4lUHx3Zz5zPprh8c6h+YactyEOITyoc1Ez?=
 =?us-ascii?Q?pjSViZxWf5hwqpY3b/XTECdr21KlJh1kTB12OgdEpaO7SQIa68leWkz7wWP0?=
 =?us-ascii?Q?DM6AlyIcsDng1G407kkmQX3R/WiNPj4V5AXfRkG472VTkXEFt1d5IFgO/31L?=
 =?us-ascii?Q?Ck1mrBe1zrJqubPMHz7AgZKkDsUqB5SK1uc3CxKEP/0hx7R+AAfAQpXBsBuJ?=
 =?us-ascii?Q?F9hGFj1lXszLl/PoAoA+i3ggavZGf8FmJ150uR7HnDpiPREM?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75551f4c-e230-4e4d-f2c1-08df04891556
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 22:18:12.6338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oChetc7ogpVI/bEOw5OMQTTSDrTJAlXjnbUE02Od0UmSc7UZMEhOoUa30rxJy7oHFUivf00E4q1j0YBl1OFllw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P123MB7095

The root_domain pointer rd field in struct rq is updated dynamically
using RCU, and its memory reclamation is deferred via call_rcu() in
rq_attach_root(). However, struct rq's rd field was missing the __rcu
compiler annotation, and several lockless readers across the scheduler
subsystem accessed rq->rd directly without using RCU dereference
primitives.

Add the __rcu annotation to struct rq's rd field. For code clarity,
introduce the rcu_dereference_root_domain() helper macro to validate
access under sched_domains_mutex or active RCU-sched read-side critical
sections. While mechanically identical to
rcu_dereference_sched_domain(), defining rcu_dereference_root_domain()
preserves the natural symmetry of rq->rd and rq->sd in struct rq, while
keeping grep-ability straightforward. Update readers and accessors
across kernel/sched/ to use rcu_dereference_root_domain().

This ensures proper memory ordering, enables Sparse static analysis
validation, and avoids false Lockdep warnings under CONFIG_PROVE_RCU.

Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 kernel/sched/core.c     | 24 ++++++++-----
 kernel/sched/deadline.c | 77 ++++++++++++++++++++++-------------------
 kernel/sched/fair.c     | 27 +++++++++------
 kernel/sched/rt.c       | 64 +++++++++++++++++++---------------
 kernel/sched/sched.h    |  7 ++--
 kernel/sched/syscalls.c |  8 ++---
 kernel/sched/topology.c | 11 +++---
 7 files changed, 126 insertions(+), 92 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 2e7cde033a31..9a12601d8c54 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8547,8 +8547,10 @@ void set_rq_online(struct rq *rq)
 {
 	if (!rq->online) {
 		const struct sched_class *class;
+		struct root_domain *rd;
 
-		cpumask_set_cpu(rq->cpu, rq->rd->online);
+		rd = rcu_dereference_root_domain(rq->rd);
+		cpumask_set_cpu(rq->cpu, rd->online);
 		rq->online = 1;
 
 		for_each_class(class) {
@@ -8562,6 +8564,7 @@ void set_rq_offline(struct rq *rq)
 {
 	if (rq->online) {
 		const struct sched_class *class;
+		struct root_domain *rd;
 
 		update_rq_clock(rq);
 		for_each_class(class) {
@@ -8569,7 +8572,8 @@ void set_rq_offline(struct rq *rq)
 				class->rq_offline(rq);
 		}
 
-		cpumask_clear_cpu(rq->cpu, rq->rd->online);
+		rd = rcu_dereference_root_domain(rq->rd);
+		cpumask_clear_cpu(rq->cpu, rd->online);
 		rq->online = 0;
 	}
 }
@@ -8577,10 +8581,12 @@ void set_rq_offline(struct rq *rq)
 static inline void sched_set_rq_online(struct rq *rq, int cpu)
 {
 	struct rq_flags rf;
+	struct root_domain *rd;
 
 	rq_lock_irqsave(rq, &rf);
-	if (rq->rd) {
-		BUG_ON(!cpumask_test_cpu(cpu, rq->rd->span));
+	rd = rcu_dereference_root_domain(rq->rd);
+	if (rd) {
+		BUG_ON(!cpumask_test_cpu(cpu, rd->span));
 		set_rq_online(rq);
 	}
 	rq_unlock_irqrestore(rq, &rf);
@@ -8589,10 +8595,12 @@ static inline void sched_set_rq_online(struct rq *rq, int cpu)
 static inline void sched_set_rq_offline(struct rq *rq, int cpu)
 {
 	struct rq_flags rf;
+	struct root_domain *rd;
 
 	rq_lock_irqsave(rq, &rf);
-	if (rq->rd) {
-		BUG_ON(!cpumask_test_cpu(cpu, rq->rd->span));
+	rd = rcu_dereference_root_domain(rq->rd);
+	if (rd) {
+		BUG_ON(!cpumask_test_cpu(cpu, rd->span));
 		set_rq_offline(rq);
 	}
 	rq_unlock_irqrestore(rq, &rf);
@@ -9009,8 +9017,8 @@ void __init sched_init(void)
 #endif
 		rq->next_class = &idle_sched_class;
 
-		rq->sd = NULL;
-		rq->rd = NULL;
+		RCU_INIT_POINTER(rq->sd, NULL);
+		RCU_INIT_POINTER(rq->rd, NULL);
 		rq->cpu_capacity = SCHED_CAPACITY_SCALE;
 		rq->balance_callback = &balance_push_callback;
 		rq->active_balance = 0;
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 857dbe3519a8..507f056084bf 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -122,12 +122,12 @@ static inline struct dl_bw *dl_bw_of(int i)
 {
 	RCU_LOCKDEP_WARN(!rcu_read_lock_sched_held(),
 			 "sched RCU must be held");
-	return &cpu_rq(i)->rd->dl_bw;
+	return &rcu_dereference_root_domain(cpu_rq(i)->rd)->dl_bw;
 }
 
 static inline int dl_bw_cpus(int i)
 {
-	struct root_domain *rd = cpu_rq(i)->rd;
+	struct root_domain *rd = rcu_dereference_root_domain(cpu_rq(i)->rd);
 
 	RCU_LOCKDEP_WARN(!rcu_read_lock_sched_held(),
 			 "sched RCU must be held");
@@ -156,16 +156,13 @@ static inline unsigned long dl_bw_capacity(int i)
 	    arch_scale_cpu_capacity(i) == SCHED_CAPACITY_SCALE) {
 		return dl_bw_cpus(i) << SCHED_CAPACITY_SHIFT;
 	} else {
-		RCU_LOCKDEP_WARN(!rcu_read_lock_sched_held(),
-				 "sched RCU must be held");
-
-		return __dl_bw_capacity(cpu_rq(i)->rd->span);
+		return __dl_bw_capacity(rcu_dereference_root_domain(cpu_rq(i)->rd)->span);
 	}
 }
 
 bool dl_bw_visited(int cpu, u64 cookie)
 {
-	struct root_domain *rd = cpu_rq(cpu)->rd;
+	struct root_domain *rd = rcu_dereference_root_domain(cpu_rq(cpu)->rd);
 
 	if (rd->visit_cookie == cookie)
 		return true;
@@ -533,15 +530,18 @@ void init_dl_rq(struct dl_rq *dl_rq)
 
 static inline int dl_overloaded(struct rq *rq)
 {
-	return atomic_read(&rq->rd->dlo_count);
+	return atomic_read(&rcu_dereference_root_domain(rq->rd)->dlo_count);
 }
 
 static inline void dl_set_overload(struct rq *rq)
 {
+	struct root_domain *rd;
+
 	if (!rq->online)
 		return;
 
-	cpumask_set_cpu(rq->cpu, rq->rd->dlo_mask);
+	rd = rcu_dereference_root_domain(rq->rd);
+	cpumask_set_cpu(rq->cpu, rd->dlo_mask);
 	/*
 	 * Must be visible before the overload count is
 	 * set (as in sched_rt.c).
@@ -549,16 +549,19 @@ static inline void dl_set_overload(struct rq *rq)
 	 * Matched by the barrier in pull_dl_task().
 	 */
 	smp_wmb();
-	atomic_inc(&rq->rd->dlo_count);
+	atomic_inc(&rd->dlo_count);
 }
 
 static inline void dl_clear_overload(struct rq *rq)
 {
+	struct root_domain *rd;
+
 	if (!rq->online)
 		return;
 
-	atomic_dec(&rq->rd->dlo_count);
-	cpumask_clear_cpu(rq->cpu, rq->rd->dlo_mask);
+	rd = rcu_dereference_root_domain(rq->rd);
+	atomic_dec(&rd->dlo_count);
+	cpumask_clear_cpu(rq->cpu, rd->dlo_mask);
 }
 
 #define __node_2_pdl(node) \
@@ -699,14 +702,15 @@ static struct rq *dl_task_offline_migration(struct rq *rq, struct task_struct *p
 	 * since p is still hanging out in the old (now moved to default) root
 	 * domain.
 	 */
-	dl_b = &rq->rd->dl_bw;
+	dl_b = &rcu_dereference_root_domain(rq->rd)->dl_bw;
 	raw_spin_lock(&dl_b->lock);
-	__dl_sub(dl_b, p->dl.dl_bw, cpumask_weight(rq->rd->span));
+	__dl_sub(dl_b, p->dl.dl_bw, cpumask_weight(rcu_dereference_root_domain(rq->rd)->span));
 	raw_spin_unlock(&dl_b->lock);
 
-	dl_b = &later_rq->rd->dl_bw;
+	dl_b = &rcu_dereference_root_domain(later_rq->rd)->dl_bw;
 	raw_spin_lock(&dl_b->lock);
-	__dl_add(dl_b, p->dl.dl_bw, cpumask_weight(later_rq->rd->span));
+	__dl_add(dl_b, p->dl.dl_bw,
+		 cpumask_weight(rcu_dereference_root_domain(later_rq->rd)->span));
 	raw_spin_unlock(&dl_b->lock);
 
 	set_task_cpu(p, later_rq->cpu);
@@ -2222,9 +2226,10 @@ static void inc_dl_deadline(struct dl_rq *dl_rq, u64 deadline)
 	if (dl_rq->earliest_dl.curr == 0 ||
 	    dl_time_before(deadline, dl_rq->earliest_dl.curr)) {
 		if (dl_rq->earliest_dl.curr == 0)
-			cpupri_set(&rq->rd->cpupri, rq->cpu, CPUPRI_HIGHER);
+			cpupri_set(&rcu_dereference_root_domain(rq->rd)->cpupri, rq->cpu,
+				   CPUPRI_HIGHER);
 		dl_rq->earliest_dl.curr = deadline;
-		cpudl_set(&rq->rd->cpudl, rq->cpu, deadline);
+		cpudl_set(&rcu_dereference_root_domain(rq->rd)->cpudl, rq->cpu, deadline);
 	}
 }
 
@@ -2239,14 +2244,15 @@ static void dec_dl_deadline(struct dl_rq *dl_rq, u64 deadline)
 	if (!dl_rq->dl_nr_running) {
 		dl_rq->earliest_dl.curr = 0;
 		dl_rq->earliest_dl.next = 0;
-		cpudl_clear(&rq->rd->cpudl, rq->cpu, rq->online);
-		cpupri_set(&rq->rd->cpupri, rq->cpu, rq->rt.highest_prio.curr);
+		cpudl_clear(&rcu_dereference_root_domain(rq->rd)->cpudl, rq->cpu, rq->online);
+		cpupri_set(&rcu_dereference_root_domain(rq->rd)->cpupri, rq->cpu,
+			   rq->rt.highest_prio.curr);
 	} else {
 		struct rb_node *leftmost = rb_first_cached(&dl_rq->root);
 		struct sched_dl_entity *entry = __node_2_dle(leftmost);
 
 		dl_rq->earliest_dl.curr = entry->deadline;
-		cpudl_set(&rq->rd->cpudl, rq->cpu, entry->deadline);
+		cpudl_set(&rcu_dereference_root_domain(rq->rd)->cpudl, rq->cpu, entry->deadline);
 	}
 }
 
@@ -2686,12 +2692,14 @@ static void migrate_task_rq_dl(struct task_struct *p, int new_cpu __maybe_unused
 
 static void check_preempt_equal_dl(struct rq *rq, struct task_struct *p)
 {
+	struct root_domain *rd = rcu_dereference_root_domain(rq->rd);
+
 	/*
 	 * Current can't be migrated, useless to reschedule,
 	 * let's hope p can move out.
 	 */
 	if (rq->curr->nr_cpus_allowed == 1 ||
-	    !cpudl_find(&rq->rd->cpudl, rq->donor, NULL))
+	    !cpudl_find(&rd->cpudl, rq->donor, NULL))
 		return;
 
 	/*
@@ -2699,7 +2707,7 @@ static void check_preempt_equal_dl(struct rq *rq, struct task_struct *p)
 	 * see if it is pushed or pulled somewhere else.
 	 */
 	if (p->nr_cpus_allowed != 1 &&
-	    cpudl_find(&rq->rd->cpudl, p, NULL))
+	    cpudl_find(&rd->cpudl, p, NULL))
 		return;
 
 	resched_curr(rq);
@@ -2948,7 +2956,7 @@ static int find_later_rq(struct task_struct *task)
 	 * We have to consider system topology and task affinity
 	 * first, then we can look for a suitable CPU.
 	 */
-	if (!cpudl_find(&task_rq(task)->rd->cpudl, task, later_mask))
+	if (!cpudl_find(&rcu_dereference_root_domain(task_rq(task)->rd)->cpudl, task, later_mask))
 		return -1;
 
 	/*
@@ -3232,7 +3240,7 @@ static void pull_dl_task(struct rq *this_rq)
 	 */
 	smp_rmb();
 
-	for_each_cpu(cpu, this_rq->rd->dlo_mask) {
+	for_each_cpu(cpu, rcu_dereference_root_domain(this_rq->rd)->dlo_mask) {
 		if (this_cpu == cpu)
 			continue;
 
@@ -3355,10 +3363,8 @@ static void set_cpus_allowed_dl(struct task_struct *p,
 bool dl_task_needs_bw_move(struct task_struct *p,
 			   const struct cpumask *new_mask)
 {
-	if (!dl_task(p))
-		return false;
-
-	return !cpumask_intersects(task_rq(p)->rd->span, new_mask);
+	guard(rcu)();
+	return !cpumask_intersects(rcu_dereference_root_domain(task_rq(p)->rd)->span, new_mask);
 }
 
 /* Assumes rq->lock is held */
@@ -3368,9 +3374,10 @@ static void rq_online_dl(struct rq *rq)
 		dl_set_overload(rq);
 
 	if (rq->dl.dl_nr_running > 0)
-		cpudl_set(&rq->rd->cpudl, rq->cpu, rq->dl.earliest_dl.curr);
+		cpudl_set(&rcu_dereference_root_domain(rq->rd)->cpudl, rq->cpu,
+			  rq->dl.earliest_dl.curr);
 	else
-		cpudl_clear(&rq->rd->cpudl, rq->cpu, true);
+		cpudl_clear(&rcu_dereference_root_domain(rq->rd)->cpudl, rq->cpu, true);
 }
 
 /* Assumes rq->lock is held */
@@ -3379,7 +3386,7 @@ static void rq_offline_dl(struct rq *rq)
 	if (rq->dl.overloaded)
 		dl_clear_overload(rq);
 
-	cpudl_clear(&rq->rd->cpudl, rq->cpu, false);
+	cpudl_clear(&rcu_dereference_root_domain(rq->rd)->cpudl, rq->cpu, false);
 }
 
 void __init init_sched_dl_class(void)
@@ -3440,10 +3447,10 @@ void dl_add_task_root_domain(struct task_struct *p)
 	cpu = cpumask_first_and(cpu_active_mask, msk);
 	BUG_ON(cpu >= nr_cpu_ids);
 	rq = cpu_rq(cpu);
-	dl_b = &rq->rd->dl_bw;
+	dl_b = &rcu_dereference_root_domain(rq->rd)->dl_bw;
 
 	raw_spin_lock(&dl_b->lock);
-	__dl_add(dl_b, p->dl.dl_bw, cpumask_weight(rq->rd->span));
+	__dl_add(dl_b, p->dl.dl_bw, cpumask_weight(rcu_dereference_root_domain(rq->rd)->span));
 	raw_spin_unlock(&dl_b->lock);
 	raw_spin_unlock_irqrestore(&p->pi_lock, rf.flags);
 }
@@ -3504,7 +3511,7 @@ void dl_clear_root_domain(struct root_domain *rd)
 
 void dl_clear_root_domain_cpu(int cpu)
 {
-	dl_clear_root_domain(cpu_rq(cpu)->rd);
+	dl_clear_root_domain(rcu_dereference_root_domain(cpu_rq(cpu)->rd));
 }
 
 static void switched_from_dl(struct rq *rq, struct task_struct *p)
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index f79fcba4afec..687999312a7d 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -7865,13 +7865,14 @@ static inline void set_rd_overutilized(struct root_domain *rd, bool flag)
 
 static inline void check_update_overutilized_status(struct rq *rq)
 {
+	struct root_domain *rd = rcu_dereference_root_domain(rq->rd);
+
 	/*
 	 * overutilized field is used for load balancing decisions only
 	 * if energy aware scheduler is being used
 	 */
-
-	if (!is_rd_overutilized(rq->rd) && cpu_overutilized(rq->cpu))
-		set_rd_overutilized(rq->rd, 1);
+	if (rd && !is_rd_overutilized(rd) && cpu_overutilized(rq->cpu))
+		set_rd_overutilized(rd, 1);
 }
 
 /* Runqueue only has SCHED_IDLE tasks enqueued */
@@ -9500,7 +9501,7 @@ static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
 	unsigned long prev_delta = ULONG_MAX, best_delta = ULONG_MAX;
 	unsigned long p_util_min = uclamp_is_used() ? uclamp_eff_value(p, UCLAMP_MIN) : 0;
 	unsigned long p_util_max = uclamp_is_used() ? uclamp_eff_value(p, UCLAMP_MAX) : 1024;
-	struct root_domain *rd = this_rq()->rd;
+	struct root_domain *rd = rcu_dereference_root_domain(this_rq()->rd);
 	int cpu, best_energy_cpu, target = -1;
 	int prev_fits = -1, best_fits = -1;
 	unsigned long best_actual_cap = 0;
@@ -9704,7 +9705,7 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
 		    cpumask_test_cpu(cpu, p->cpus_ptr))
 			return cpu;
 
-		if (!is_rd_overutilized(this_rq()->rd)) {
+		if (!is_rd_overutilized(rcu_dereference_root_domain(this_rq()->rd))) {
 			new_cpu = find_energy_efficient_cpu(p, prev_cpu);
 			if (new_cpu >= 0)
 				return new_cpu;
@@ -12690,13 +12691,15 @@ static inline void update_sd_lb_stats(struct lb_env *env, struct sd_lb_stats *sd
 		env->fbq_type = fbq_classify_group(&sds->busiest_stat);
 
 	if (!env->sd->parent) {
+		struct root_domain *rd = rcu_dereference_root_domain(env->dst_rq->rd);
+
 		/* update overload indicator if we are at root domain */
-		set_rd_overloaded(env->dst_rq->rd, sg_overloaded);
+		set_rd_overloaded(rd, sg_overloaded);
 
 		/* Update over-utilization (tipping point, U >= 0) indicator */
-		set_rd_overutilized(env->dst_rq->rd, sg_overutilized);
+		set_rd_overutilized(rd, sg_overutilized);
 	} else if (sg_overutilized) {
-		set_rd_overutilized(env->dst_rq->rd, sg_overutilized);
+		set_rd_overutilized(rcu_dereference_root_domain(env->dst_rq->rd), sg_overutilized);
 	}
 
 	update_idle_cpu_scan(env, sum_util);
@@ -12942,8 +12945,10 @@ static struct sched_group *sched_balance_find_src_group(struct lb_env *env)
 	if (busiest->group_type == group_misfit_task)
 		goto force_balance;
 
-	if (!is_rd_overutilized(env->dst_rq->rd) &&
-	    rcu_dereference_all(env->dst_rq->rd->pd))
+	struct root_domain *rd = rcu_dereference_root_domain(env->dst_rq->rd);
+
+	if (rd && !is_rd_overutilized(rd) &&
+	    rcu_dereference_all(rd->pd))
 		goto out_balanced;
 
 	/* ASYM feature bypasses nice load balance check */
@@ -14573,7 +14578,7 @@ static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
 	if (!sd)
 		goto out;
 
-	if (!get_rd_overloaded(this_rq->rd) ||
+	if (!get_rd_overloaded(rcu_dereference_root_domain(this_rq->rd)) ||
 	    this_rq->avg_idle < sd->max_newidle_lb_cost) {
 
 		update_next_balance(sd, &next_balance);
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index e6e5f8a2caaf..0bf3ea1e9957 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -338,15 +338,18 @@ static inline bool need_pull_rt_task(struct rq *rq, struct task_struct *prev)
 
 static inline int rt_overloaded(struct rq *rq)
 {
-	return atomic_read(&rq->rd->rto_count);
+	return atomic_read(&rcu_dereference_root_domain(rq->rd)->rto_count);
 }
 
 static inline void rt_set_overload(struct rq *rq)
 {
+	struct root_domain *rd;
+
 	if (!rq->online)
 		return;
 
-	cpumask_set_cpu(rq->cpu, rq->rd->rto_mask);
+	rd = rcu_dereference_root_domain(rq->rd);
+	cpumask_set_cpu(rq->cpu, rd->rto_mask);
 	/*
 	 * Make sure the mask is visible before we set
 	 * the overload count. That is checked to determine
@@ -357,17 +360,20 @@ static inline void rt_set_overload(struct rq *rq)
 	 * Matched by the barrier in pull_rt_task().
 	 */
 	smp_wmb();
-	atomic_inc(&rq->rd->rto_count);
+	atomic_inc(&rd->rto_count);
 }
 
 static inline void rt_clear_overload(struct rq *rq)
 {
+	struct root_domain *rd;
+
 	if (!rq->online)
 		return;
 
+	rd = rcu_dereference_root_domain(rq->rd);
 	/* the order here really doesn't matter */
-	atomic_dec(&rq->rd->rto_count);
-	cpumask_clear_cpu(rq->cpu, rq->rd->rto_mask);
+	atomic_dec(&rd->rto_count);
+	cpumask_clear_cpu(rq->cpu, rd->rto_mask);
 }
 
 static inline int has_pushable_tasks(struct rq *rq)
@@ -580,7 +586,7 @@ static int rt_se_boosted(struct sched_rt_entity *rt_se)
 
 static inline const struct cpumask *sched_rt_period_mask(void)
 {
-	return this_rq()->rd->span;
+	return rcu_dereference_root_domain(this_rq()->rd)->span;
 }
 
 static inline
@@ -608,7 +614,7 @@ bool sched_rt_bandwidth_account(struct rt_rq *rt_rq)
 static void do_balance_runtime(struct rt_rq *rt_rq)
 {
 	struct rt_bandwidth *rt_b = sched_rt_bandwidth(rt_rq);
-	struct root_domain *rd = rq_of_rt_rq(rt_rq)->rd;
+	struct root_domain *rd = rcu_dereference_root_domain(rq_of_rt_rq(rt_rq)->rd);
 	int i, weight;
 	u64 rt_period;
 
@@ -659,7 +665,7 @@ static void do_balance_runtime(struct rt_rq *rt_rq)
  */
 static void __disable_runtime(struct rq *rq)
 {
-	struct root_domain *rd = rq->rd;
+	struct root_domain *rd = rcu_dereference_root_domain(rq->rd);
 	rt_rq_iter_t iter;
 	struct rt_rq *rt_rq;
 
@@ -1058,7 +1064,7 @@ inc_rt_prio_smp(struct rt_rq *rt_rq, int prio, int prev_prio)
 		return;
 
 	if (rq->online && prio < prev_prio)
-		cpupri_set(&rq->rd->cpupri, rq->cpu, prio);
+		cpupri_set(&rcu_dereference_root_domain(rq->rd)->cpupri, rq->cpu, prio);
 }
 
 static void
@@ -1073,7 +1079,8 @@ dec_rt_prio_smp(struct rt_rq *rt_rq, int prio, int prev_prio)
 		return;
 
 	if (rq->online && rt_rq->highest_prio.curr != prev_prio)
-		cpupri_set(&rq->rd->cpupri, rq->cpu, rt_rq->highest_prio.curr);
+		cpupri_set(&rcu_dereference_root_domain(rq->rd)->cpupri, rq->cpu,
+			   rt_rq->highest_prio.curr);
 }
 
 static void
@@ -1575,8 +1582,10 @@ select_task_rq_rt(struct task_struct *p, int cpu, int flags)
 
 static void check_preempt_equal_prio(struct rq *rq, struct task_struct *p)
 {
+	struct root_domain *rd = rcu_dereference_root_domain(rq->rd);
+
 	if (rq->curr->nr_cpus_allowed == 1 ||
-	    !cpupri_find(&rq->rd->cpupri, rq->donor, NULL))
+	    !cpupri_find(&rd->cpupri, rq->donor, NULL))
 		return;
 
 	/*
@@ -1584,7 +1593,7 @@ static void check_preempt_equal_prio(struct rq *rq, struct task_struct *p)
 	 * see if it is pushed or pulled somewhere else.
 	 */
 	if (p->nr_cpus_allowed != 1 &&
-	    cpupri_find(&rq->rd->cpupri, p, NULL))
+	    cpupri_find(&rd->cpupri, p, NULL))
 		return;
 
 	/*
@@ -1793,12 +1802,12 @@ static int find_lowest_rq(struct task_struct *task)
 	 */
 	if (sched_asym_cpucap_active()) {
 
-		ret = cpupri_find_fitness(&task_rq(task)->rd->cpupri,
+		ret = cpupri_find_fitness(&rcu_dereference_root_domain(task_rq(task)->rd)->cpupri,
 					  task, lowest_mask,
 					  rt_task_fits_capacity);
 	} else {
 
-		ret = cpupri_find(&task_rq(task)->rd->cpupri,
+		ret = cpupri_find(&rcu_dereference_root_domain(task_rq(task)->rd)->cpupri,
 				  task, lowest_mask);
 	}
 
@@ -2189,16 +2198,17 @@ static inline void rto_start_unlock(atomic_t *v)
 
 static void tell_cpu_to_push(struct rq *rq)
 {
+	struct root_domain *rd = rcu_dereference_root_domain(rq->rd);
 	int cpu = -1;
 
 	/* Keep the loop going if the IPI is currently active */
-	atomic_inc(&rq->rd->rto_loop_next);
+	atomic_inc(&rd->rto_loop_next);
 
 	/* Only one CPU can initiate a loop at a time */
-	if (!rto_start_trylock(&rq->rd->rto_loop_start))
+	if (!rto_start_trylock(&rd->rto_loop_start))
 		return;
 
-	raw_spin_lock(&rq->rd->rto_lock);
+	raw_spin_lock(&rd->rto_lock);
 
 	/*
 	 * The rto_cpu is updated under the lock, if it has a valid CPU
@@ -2206,17 +2216,17 @@ static void tell_cpu_to_push(struct rq *rq)
 	 * update to loop_next, and nothing needs to be done here.
 	 * Otherwise it is finishing up and an IPI needs to be sent.
 	 */
-	if (rq->rd->rto_cpu < 0)
-		cpu = rto_next_cpu(rq->rd);
+	if (rd->rto_cpu < 0)
+		cpu = rto_next_cpu(rd);
 
-	raw_spin_unlock(&rq->rd->rto_lock);
+	raw_spin_unlock(&rd->rto_lock);
 
-	rto_start_unlock(&rq->rd->rto_loop_start);
+	rto_start_unlock(&rd->rto_loop_start);
 
 	if (cpu >= 0) {
 		/* Make sure the rd does not get freed while pushing */
-		sched_get_rd(rq->rd);
-		irq_work_queue_on(&rq->rd->rto_push_work, cpu);
+		sched_get_rd(rd);
+		irq_work_queue_on(&rd->rto_push_work, cpu);
 	}
 }
 
@@ -2277,7 +2287,7 @@ static void pull_rt_task(struct rq *this_rq)
 
 	/* If we are the only overloaded CPU do nothing */
 	if (rt_overload_count == 1 &&
-	    cpumask_test_cpu(this_rq->cpu, this_rq->rd->rto_mask))
+	    cpumask_test_cpu(this_rq->cpu, rcu_dereference_root_domain(this_rq->rd)->rto_mask))
 		return;
 
 #ifdef HAVE_RT_PUSH_IPI
@@ -2287,7 +2297,7 @@ static void pull_rt_task(struct rq *this_rq)
 	}
 #endif
 
-	for_each_cpu(cpu, this_rq->rd->rto_mask) {
+	for_each_cpu(cpu, rcu_dereference_root_domain(this_rq->rd)->rto_mask) {
 		if (this_cpu == cpu)
 			continue;
 
@@ -2392,7 +2402,7 @@ static void rq_online_rt(struct rq *rq)
 
 	__enable_runtime(rq);
 
-	cpupri_set(&rq->rd->cpupri, rq->cpu, rq->rt.highest_prio.curr);
+	cpupri_set(&rcu_dereference_root_domain(rq->rd)->cpupri, rq->cpu, rq->rt.highest_prio.curr);
 }
 
 /* Assumes rq->lock is held */
@@ -2403,7 +2413,7 @@ static void rq_offline_rt(struct rq *rq)
 
 	__disable_runtime(rq);
 
-	cpupri_set(&rq->rd->cpupri, rq->cpu, CPUPRI_INVALID);
+	cpupri_set(&rcu_dereference_root_domain(rq->rd)->cpupri, rq->cpu, CPUPRI_INVALID);
 }
 
 /*
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 26ae13c86b69..6d45e67bcdc3 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1256,7 +1256,7 @@ struct rq {
 	int membarrier_state;
 #endif
 
-	struct root_domain		*rd;
+	struct root_domain __rcu	*rd;
 	struct sched_domain __rcu	*sd;
 
 	struct balance_callback *balance_callback;
@@ -2143,6 +2143,9 @@ queue_balance_callback(struct rq *rq,
 	rq->balance_callback = head;
 }
 
+#define rcu_dereference_root_domain(p) \
+	rcu_dereference_all_check((p), lockdep_is_held(&sched_domains_mutex))
+
 #define rcu_dereference_sched_domain(p) \
 	rcu_dereference_all_check((p), lockdep_is_held(&sched_domains_mutex))
 
@@ -3030,7 +3033,7 @@ static inline void add_nr_running(struct rq *rq, unsigned count)
 	}
 
 	if (prev_nr < 2 && rq->nr_running >= 2)
-		set_rd_overloaded(rq->rd, 1);
+		set_rd_overloaded(rcu_dereference_root_domain(rq->rd), 1);
 
 	sched_update_tick_dependency(rq);
 }
diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index b215b0ead9a6..89a2465727fd 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -621,15 +621,15 @@ int __sched_setscheduler(struct task_struct *p,
 #endif /* CONFIG_RT_GROUP_SCHED */
 		if (dl_bandwidth_enabled() && dl_policy(policy) &&
 				!(attr->sched_flags & SCHED_FLAG_SUGOV)) {
-			cpumask_t *span = rq->rd->span;
+			struct root_domain *rd = rcu_dereference_root_domain(rq->rd);
 
 			/*
 			 * Don't allow tasks with an affinity mask smaller than
 			 * the entire root_domain to become SCHED_DEADLINE. We
 			 * will also fail if there's no bandwidth available.
 			 */
-			if (!cpumask_subset(span, p->cpus_ptr) ||
-			    rq->rd->dl_bw.bw == 0) {
+			if (!cpumask_subset(rd->span, p->cpus_ptr) ||
+			    rd->dl_bw.bw == 0) {
 				retval = -EPERM;
 				goto unlock;
 			}
@@ -1127,7 +1127,7 @@ int dl_task_check_affinity(struct task_struct *p, const struct cpumask *mask)
 	 * root_domain.
 	 */
 	guard(rcu)();
-	if (!cpumask_subset(task_rq(p)->rd->span, mask))
+	if (!cpumask_subset(rcu_dereference_root_domain(task_rq(p)->rd)->span, mask))
 		return -EBUSY;
 
 	return 0;
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 21e816ad23ee..bf83ceee23e9 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -413,7 +413,7 @@ static bool build_perf_domains(const struct cpumask *cpu_map)
 	int i;
 	struct perf_domain *pd = NULL, *tmp;
 	int cpu = cpumask_first(cpu_map);
-	struct root_domain *rd = cpu_rq(cpu)->rd;
+	struct root_domain *rd = rcu_dereference_root_domain(cpu_rq(cpu)->rd);
 
 	if (!sysctl_sched_energy_aware)
 		goto free;
@@ -478,9 +478,8 @@ void rq_attach_root(struct rq *rq, struct root_domain *rd)
 
 	rq_lock_irqsave(rq, &rf);
 
-	if (rq->rd) {
-		old_rd = rq->rd;
-
+	old_rd = rcu_dereference_root_domain(rq->rd);
+	if (old_rd) {
 		if (cpumask_test_cpu(rq->cpu, old_rd->online))
 			set_rq_offline(rq);
 
@@ -3461,8 +3460,10 @@ static void partition_sched_domains_locked(int ndoms_new, cpumask_var_t doms_new
 	/* Build perf domains: */
 	for (i = 0; i < ndoms_new; i++) {
 		for (j = 0; j < n && !sched_energy_update; j++) {
+			int cpu = cpumask_first(doms_cur[j]);
+
 			if (cpumask_equal(doms_new[i], doms_cur[j]) &&
-			    cpu_rq(cpumask_first(doms_cur[j]))->rd->pd) {
+			    rcu_dereference_root_domain(cpu_rq(cpu)->rd)->pd) {
 				has_eas = true;
 				goto match3;
 			}
-- 
2.55.0

