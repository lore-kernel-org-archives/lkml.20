Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794552078;
	b=X/r88UmQtHnYPWSpv28W99Ejcalq5Xj2DtY15F3AiVdqpUx+929gjlk1Ws1bGynz5CUY
	 hjjzTHXdaoeNLUXjPoHdCCx3zOsw/6svJKjk5MbwT/cDLclnlf5S/RJlmxv+iMqGEzEZ2
	 JyHoCgC63s53AO66y5ttCbjpOQonDX6fn20dTplgWmvpyRR3+7L+/OH+TAbYftT7FJ+ZP
	 1kg+gnLb83HqEoMy64Az4qeu6VVQ8NB8iPAfE7apnsf/0C0CXBpboHvxMVzq4RhNPwQTU
	 mE+wtRIClDf3d9uOd1LDO8TfNuhV6Ao6bPq+r+0KucVIr8A67n0bfOqJCAiFVNQGQ6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794552078;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=+/3MakG7SgK7BiXWr8rX03NDLrybrQdPeaHt/8esvaA=;
	b=uWJODrf2q2097Xsqultnf95iLv54y9aiAMUQL4F45ILzOlei9tz4+kzTtOEWZM1r4YMx
	 4MLJoKLAZwU8hR1sXOin5OtRYI6J9pae+/Sesh4vJVh8GbzS5EM1qWrUsZ8QtplT2VW32
	 HxKtp3r1+XUfzJ+GdGP5WXL7HxhapXU6AlnTUNEe89K6Zah58XP30NRZSFiQmB5vuOLos
	 hnrfTvztp92WMZz+ZJVEk+CLtFxV0IlTNZOaOlwLTA5fsMFX2dUM0y330xS6etK0LNcfm
	 kZtK8j2+AR+NEwKz6wxVahOL9acRC5YDdrsoTrqU1MTnDi28cbZHH7A2YjEKSYOy/UQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=WB4450bn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.59
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013059.outbound.protection.outlook.com [40.107.201.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E20606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19E20606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=WB4450bn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ADcLXwUTBw8saKsylZZ358lCwr+l2QurxC8l37ybuqGJMaSdGXfmM/uBdMjHFoXzJwJXEykk007WVHFldY1BrK1DGT4sqiesZ4Y5p2sBvtM88QFZYMfljAPqkKXXslg2bjmui+5FE1nfUdTXRjJju4tZ7fJHorewMD/VSEJtbd4F+7wSF2BCJe4JmGyX8YcOC5SGyUl5U3BVNZpx57YFmGPylBVzEqWaeOoKiglElmztcfS0nCrXxXG/Rz44AEhRbhoCp9FQ7Wx/gA01hF8bfcKKhfDtPh5TEwUu4wEQkXEPlHwCyrRCGICH72Qvjrbn9MaopZswNxRvn+u+5ydOXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/3MakG7SgK7BiXWr8rX03NDLrybrQdPeaHt/8esvaA=;
 b=LMmOhxwTeuZnXd3owpXutyYLm/VVOFUOiZeHWdodrxloIPMd06uxAxD1nFx/iZlsPfkkQoFe1Yfbts/bpKKYKG5zRr/5W6DB88agJEoq1IxuCHxjQ0qsuWgr0K8qJ3R6tE7YLqpMloGXwZwUNlDEr/FsWxV0lV7l1MZgUJu7vytdOQcs0l1WpNaaly3RBqntDvJQoR1m015wvhQKTFv6Q6IbHUku7KaqhWfgS2JtjVmBBdyfTcTG8EvdQ5/SI+9ADMR1fudazkeD7u9BmSDdZLP8qpiHhUd2oXbOzf/JX3TWeXJjP9W46YOkdNCNp50JZFrPz0syUhJJv4B5jnGR+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/3MakG7SgK7BiXWr8rX03NDLrybrQdPeaHt/8esvaA=;
 b=WB4450bnCIuer/t5NivIGAcS3pAMSjJpgfoxZzjKWm9BzptdK9OvCTdB3acWSvSAk3l7oHAslyZBEaZp6IavU81MxaNtlR/ouxIdAUPKQfb43XuTUD9pmnTG4CTTV0A05QLJySojZko/Hz8xZO4spe6ySWOwOsYLJE8of+wr4oo=
Received: from PH7P220CA0086.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::15)
 by SJ0PR12MB7034.namprd12.prod.outlook.com (2603:10b6:a03:449::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Fri, 13 Nov
 2026 06:39:29 +0000
Received: from BY1PEPF0002695A.namprd05.prod.outlook.com
 (2603:10b6:510:32c:cafe::6d) by PH7P220CA0086.outlook.office365.com
 (2603:10b6:510:32c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Fri, 13
 Nov 2026 06:39:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0002695A.mail.protection.outlook.com (10.167.244.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 06:38:52 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 13 Nov
 2026 00:27:58 -0600
Received: from [10.136.34.22] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 13 Nov 2026 00:27:55 -0600
Message-ID: <e1a63a3c-3975-4b05-8ab4-518c37d867d6@amd.com>
Date: Fri, 13 Nov 2026 11:57:54 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] sched/fair: Avoid re-syncing runtime_enabled on root
 domain changes
To: Peter Zijlstra <peterz@infradead.org>, Qiliang Yuan
	<qiliang.yuan@linux.dev>
CC: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall
	<bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
	<vschneid@redhat.com>, <linux-kernel@vger.kernel.org>
References: <20261111-bug-sched-fair-offline-active-v1-0-4f54523c5a70@linux.dev>
 <20261111-bug-sched-fair-offline-active-v1-2-4f54523c5a70@linux.dev>
 <20261112105624.GM2668804@noisy.programming.kicks-ass.net>
 <20261112111055.400697-1-qiliang.yuan@linux.dev>
 <20261112125947.GZ1813469@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20261112125947.GZ1813469@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0002695A:EE_|SJ0PR12MB7034:EE_
X-MS-Office365-Filtering-Correlation-Id: d851fcb1-76a2-4524-239f-08df4150c89e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|82310400026|36860700016|11063799006|4143699003|261021121427099003|261026121527099003|10067099003|261022075727099003|261026140227099003|261028144727099003|261102123227099003|261022105027099003|56012099006|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	GLMs5p2TkplVQbLwv7yv3X49OA2vSNUo0VzB8uGplKlHFJ9REBcP0AXiembiR0Wae9S6CRQ1ZIDuKb3bfCyoVnDJtr8cn+2+w6YSCaN1JI46jQBzLhvQRmzpF1jJ8UcZ1GTqOW2Mfw7/c6XBet37bZ9wjh0XQ43IXH2CQ7T+6uVZZwX6QQw0LX+jAD8hQC4a3nOR+eVWO/EhywwRBCTlCUPzvbliSwd1EZhAxVdMLO5lJlT0JcPsyZ5pjChQxwRjoYB/Am2BwQa2bxrHN+jbwr461FFbE7Zh9AIJFS7mYuaJPvaRQZtjK5nsRNJfhrmJ7NTpBB1hGh7Jz9c+dXMvqofNPnrDdXnShHq0yO/HQaVyWPP29dINZ8HjoSHnaPT8UaoRyMpI9S9ADVpEwQ0HnHkxdSYqQj9d6WnJoHmLUEsGrnIAvkzGTqf+RAYWNEEnXGKG58C59gLlI33Sn/IWy3FZfihT0aJTujqgrWr8mNNnjE8jLJqjn3yS4sLvVOUeXcl5eYaLh1cB1BQW24eYePDT/XOyXsvIcpNwk+IJnp8wh7DSwNFygB+Zhq22CfwdfReN+P35av0xAIDxyo0TBRtmp58aPTSFlvgHYtkP+8oyZ9+pW1Sp0nqIE6OOukBeEeKrtruzWr6i74//L76Fv0Ayu7P/5/quFNZib9FycWm9y0ND5qdkGXtAMEpGSbK/sVa08iDYx3DOQUFUWStxtg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(82310400026)(36860700016)(11063799006)(4143699003)(261021121427099003)(261026121527099003)(10067099003)(261022075727099003)(261026140227099003)(261028144727099003)(261102123227099003)(261022105027099003)(56012099006)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1KqLM7tzg3OtOeDl2geNG66KUERz+qXB55VLX4Box0wB0rOVVzMwDXDX5jOEZmxbNtcvWN87eEQ7iZIiAxcRtd7WG02QVCWq1xBbHeDRUMSPo8I4j5hCzzb67Mj4Hb4aUrDd0JdVOSfLRagNHVOXyQKIZuSSlSADDitGrZcNB8sFrxUpHRkWY8Lp8EVi+0CRTMgPrTDPuSA9BVJDBe6h3CUL/jP2k8WwIkFnJ+C/K0xhcHsAszwWB5ZYT9N0yxglkT6I9n5PaEbnrivRMkJadqGa7tW9SnZ7+QgVvU7infb4zRgHQ0lrwByRqiqbMxxgtz0YF4qa6L7tWQ/dTqC1dkzKaFkN79UDcavbRuxMWW+uhT7Ri6Q/XpjIa/2evFoLWUPDoItu+OCb/6GLmXCHpRtFWB6MYEogA/Wrqpmj60K5ZKkrcr9KGk+oZcpljAEl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 06:38:52.7613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d851fcb1-76a2-4524-239f-08df4150c89e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0002695A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7034

Hello Peter,

On 11/12/2026 6:29 PM, Peter Zijlstra wrote:
>> A rebuild runs rq_attach_root() on every active CPU, and with the rq
>> lock held and interrupts disabled it walks all task groups twice. 
> 
> Right, that is a bit daft. It should be relatively straight forward to
> make that one loop.

Question: Why do we need to do rq_offline_fair() + rq_online_fair()
during cpuset for active CPUs since fair doesn't have any accounting
linked to rd at all?

For deadline and RT it makes sense for bandwidth accounting and
rto_mask updates on new rd but fair, and ext shouldn't really
care for a rd change.

Would it make sense to separate the offline / online bits from
a root domain switch? It won't speed up hotplug but it should
speed up cpusets causing domain rebuilds.

Something like follows:

  (Lightly tested on top of tip:sched/core at d7e670601af6)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 175b52a7ea79..679d094c6077 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8542,38 +8542,82 @@ static inline void balance_hotplug_wait(void)
 
 #endif /* !CONFIG_HOTPLUG_CPU */
 
-void set_rq_online(struct rq *rq)
+void rq_attach_root_domain(struct rq *rq)
 {
-	if (!rq->online) {
-		const struct sched_class *class;
-		struct root_domain *rd;
+	struct root_domain *rd = rcu_dereference_root_domain(rq->rd);
+	const struct sched_class *class;
 
-		rd = rcu_dereference_root_domain(rq->rd);
-		cpumask_set_cpu(rq->cpu, rd->online);
-		rq->online = 1;
+	/* Offline rq's are handled via set_rq_online(). */
+	if (!rq->online)
+		return;
 
-		for_each_class(class) {
-			if (class->rq_online)
-				class->rq_online(rq);
-		}
+	/* CPU already associated with the root domain. */
+	if (cpumask_test_cpu(rq->cpu, rd->online))
+		return;
+
+	cpumask_set_cpu(rq->cpu, rd->online);
+
+	for_each_class(class) {
+		if (class->rq_attach_root)
+			class->rq_attach_root(rq);
 	}
 }
 
-void set_rq_offline(struct rq *rq)
+void rq_detach_root_domain(struct rq *rq)
 {
-	if (rq->online) {
-		struct root_domain *rd = rcu_dereference_root_domain(rq->rd);
-		const struct sched_class *class;
+	struct root_domain *rd = rcu_dereference_root_domain(rq->rd);
+	const struct sched_class *class;
 
-		update_rq_clock(rq);
-		for_each_class(class) {
-			if (class->rq_offline)
-				class->rq_offline(rq);
-		}
+	/* CPU has already been handled via set_rq_offline(). */
+	if (!rq->online)
+		return;
 
-		cpumask_clear_cpu(rq->cpu, rd->online);
-		rq->online = 0;
+	/* CPU is not associated with the root domain. */
+	if (!cpumask_test_cpu(rq->cpu, rd->online))
+		return;
+
+	update_rq_clock(rq);
+	for_each_class(class) {
+		if (class->rq_detach_root)
+			class->rq_detach_root(rq);
 	}
+
+	cpumask_clear_cpu(rq->cpu, rd->online);
+}
+
+static void set_rq_online(struct rq *rq)
+{
+	const struct sched_class *class;
+	struct root_domain *rd;
+
+	WARN_ON_ONCE(rq->online);
+
+	rd = rcu_dereference_root_domain(rq->rd);
+	cpumask_set_cpu(rq->cpu, rd->online);
+	rq->online = 1;
+
+	update_rq_clock(rq);
+	for_each_class(class) {
+		if (class->rq_online)
+			class->rq_online(rq);
+	}
+}
+
+static void set_rq_offline(struct rq *rq)
+{
+	struct root_domain *rd = rcu_dereference_root_domain(rq->rd);
+	const struct sched_class *class;
+
+	WARN_ON_ONCE(!rq->online);
+
+	update_rq_clock(rq);
+	for_each_class(class) {
+		if (class->rq_offline)
+			class->rq_offline(rq);
+	}
+
+	cpumask_clear_cpu(rq->cpu, rd->online);
+	rq->online = 0;
 }
 
 static inline void sched_set_rq_online(struct rq *rq, int cpu)
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 61b6a6d78171..f9c0a1a0eb9e 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -3366,7 +3366,7 @@ bool dl_task_needs_bw_move(struct task_struct *p,
 }
 
 /* Assumes rq->lock is held */
-static void rq_online_dl(struct rq *rq)
+static void rq_attach_root_dl(struct rq *rq)
 {
 	if (rq->dl.overloaded)
 		dl_set_overload(rq);
@@ -3379,7 +3379,7 @@ static void rq_online_dl(struct rq *rq)
 }
 
 /* Assumes rq->lock is held */
-static void rq_offline_dl(struct rq *rq)
+static void rq_detach_root_dl(struct rq *rq)
 {
 	if (rq->dl.overloaded)
 		dl_clear_overload(rq);
@@ -3387,6 +3387,17 @@ static void rq_offline_dl(struct rq *rq)
 	cpudl_clear(&rcu_dereference_root_domain(rq->rd)->cpudl, rq->cpu, false);
 }
 
+static void rq_online_dl(struct rq *rq)
+{
+	rq_attach_root_dl(rq);
+}
+
+/* Assumes rq->lock is held */
+static void rq_offline_dl(struct rq *rq)
+{
+	rq_detach_root_dl(rq);
+}
+
 void __init init_sched_dl_class(void)
 {
 	unsigned int i;
@@ -3669,6 +3680,9 @@ DEFINE_SCHED_CLASS(dl) = {
 	.task_woken		= task_woken_dl,
 	.find_lock_rq		= find_lock_later_rq,
 
+	.rq_attach_root         = rq_attach_root_dl,
+	.rq_detach_root         = rq_detach_root_dl,
+
 	.task_tick		= task_tick_dl,
 	.task_fork              = task_fork_dl,
 
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 81a71aa5f094..99cc1307d515 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -2398,7 +2398,7 @@ static void task_woken_rt(struct rq *rq, struct task_struct *p)
 }
 
 /* Assumes rq->lock is held */
-static void rq_online_rt(struct rq *rq)
+static void rq_attach_root_rt(struct rq *rq)
 {
 	if (rq->rt.overloaded)
 		rt_set_overload(rq);
@@ -2409,7 +2409,7 @@ static void rq_online_rt(struct rq *rq)
 }
 
 /* Assumes rq->lock is held */
-static void rq_offline_rt(struct rq *rq)
+static void rq_detach_root_rt(struct rq *rq)
 {
 	if (rq->rt.overloaded)
 		rt_clear_overload(rq);
@@ -2419,6 +2419,16 @@ static void rq_offline_rt(struct rq *rq)
 	cpupri_set(&rcu_dereference_root_domain(rq->rd)->cpupri, rq->cpu, CPUPRI_INVALID);
 }
 
+static void rq_online_rt(struct rq *rq)
+{
+	rq_attach_root_rt(rq);
+}
+
+static void rq_offline_rt(struct rq *rq)
+{
+	rq_detach_root_rt(rq);
+}
+
 /*
  * When switch from the rt queue, we bring ourselves to a position
  * that we might want to pull RT tasks from other runqueues.
@@ -2632,6 +2642,9 @@ DEFINE_SCHED_CLASS(rt) = {
 	.switched_from		= switched_from_rt,
 	.find_lock_rq		= find_lock_lowest_rq,
 
+	.rq_attach_root		= rq_attach_root_rt,
+	.rq_detach_root		= rq_detach_root_rt,
+
 	.task_tick		= task_tick_rt,
 
 	.get_rr_interval	= get_rr_interval_rt,
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index a4df59c9c9b6..135eadefd0eb 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2791,6 +2791,12 @@ struct sched_class {
 	void (*rq_online)(struct rq *rq);
 	void (*rq_offline)(struct rq *rq);
 
+	/*
+	 * rq_{detach,attach}_root: rq->lock
+	 */
+	void (*rq_attach_root)(struct rq *rq);
+	void (*rq_detach_root)(struct rq *rq);
+
 	/*
 	 * push_cpu_stop: p->pi_lock && rq->lock
 	 */
@@ -3518,8 +3524,8 @@ static inline void double_rq_unlock(struct rq *rq1, struct rq *rq2)
 	raw_spin_rq_unlock(rq1);
 }
 
-extern void set_rq_online (struct rq *rq);
-extern void set_rq_offline(struct rq *rq);
+extern void rq_attach_root_domain(struct rq *rq);
+extern void rq_detach_root_domain(struct rq *rq);
 
 extern bool sched_smp_initialized;
 
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 99878da03bce..23711105696b 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -494,9 +494,7 @@ void rq_attach_root(struct rq *rq, struct root_domain *rd)
 
 	old_rd = rcu_dereference_root_domain(rq->rd);
 	if (old_rd) {
-		if (cpumask_test_cpu(rq->cpu, old_rd->online))
-			set_rq_offline(rq);
-
+		rq_detach_root_domain(rq);
 		cpumask_clear_cpu(rq->cpu, old_rd->span);
 
 		/*
@@ -512,8 +510,7 @@ void rq_attach_root(struct rq *rq, struct root_domain *rd)
 	rcu_assign_pointer(rq->rd, rd);
 
 	cpumask_set_cpu(rq->cpu, rd->span);
-	if (cpumask_test_cpu(rq->cpu, cpu_active_mask))
-		set_rq_online(rq);
+	rq_attach_root_domain(rq);
 
 	/*
 	 * Because the rq is not a task, dl_add_task_root_domain() did not
-- 
Thanks and Regards,
Prateek

