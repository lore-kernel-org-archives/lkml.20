Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012071.outbound.protection.outlook.com [40.93.195.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477D93C454E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789107687; cv=fail; b=Og0eqt0xT6h7SHHkoY9OVN9iB40r5ajNdaayW7wz4+QGUvLXUjid6k8I1rlAvOea71f9l6N4uxarVfo0V1Zq6CGcPgTusLs6I9JMh5TYKFva8mjPqTShvaolOXLimcaAVkNnrH19BDszPSe0iYa4FSJMpogbIDX/Iz+F7xi2N5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789107687; c=relaxed/simple;
	bh=EF1crhSwdrKWJLGHGAY2dkGivcTsh3MGk3WDwaqZaV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lErf1cQWU/kqeEALowwZFRtqBmQNlWbUVZ4cobE0JEORscELCGGpiGFP2DXhuRlnEhWmgvZMdzc+n4w0OrK3OtO+E5td3KL/lLXo81FJ5viLtgUTXuLIWqlU5C0Xv/2sMkJbp6mCqbUEWe9senS08Gr9E9SDhJz4DqU4c1WGQ1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=py99lOqI; arc=fail smtp.client-ip=40.93.195.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="py99lOqI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZISKot0jpd/W1INMn8eyjgbn0CjwesXwUmvozH+T1SdaTUNdkU8Ls02bov0E0ThmSuCE7cn+Jm9szYmtlkYcnkQC3iqhZSBxGUnoyxRHYW8Ux3paKH8yyfpDOWh9HVISR/7wRLNzUCJnTvqImY0MRNZAdENaKf36JdbuUV10tA9a7r1WHzMhBtO158UbBHkCqr0sUck6IR4GUNmSFW8vI985wkQQctVpYYWXxvTqF98VhVneQ++6A1/dDIRma0TLLT0l9jq+6Pu/J65UAJTPDPB7Fjl9UIiLGPW5br5KzDW3jxHCGT1CCMcVIYdXaOu03fL3s9+pqCbtbZX1TyfxuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCnqSPFDmq4fqYJmP2WJ7NvHM6uOpZ8DSFE/MX5EjRo=;
 b=TKALxnkYgVkWY/yVVb3w6oo5rHk0kXzEG4OZlpGfPB2L/l6jkNSGhNQSHekl3bZzxMHqCUuYRpcyvXTCCsdebuRkthrdcANKqTjYRXEC5cOYJUyFqOMdDEEk/TircHlAYyAJaMoCS9QLKWAMN1m/E8/9CCfqXuqDMyjtAfOrRcfo48lioRA/KifvKscHCm2hPoCNWHvJCjDnWQSjzzSaOpcUUxwsi4KcadGyxVxdUfV/hzkZ/Dlk1QdHZPG4DHfafB/vQ55f+Z0DZdbIa+Ps975STM1FV+6pF4Ri4YsGfqypzHNgmvOR1QLncEVbuH+uFPItqisrhHt3MiNrE7JDCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=163.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCnqSPFDmq4fqYJmP2WJ7NvHM6uOpZ8DSFE/MX5EjRo=;
 b=py99lOqILT3gO4d7l3TchC83il3fY3hipUhPcAusBC0cyFeHIa1aEzl5T32BcH/zlg9gvvvnhzEd8QHI8+v2NdxVw1qhXr4WYKTNq2E5PWCsB0IKdqUSvVo/bPo5uHPvqLDAUQFnahWJSw3+JbovY6t7igxoEFuvmgQeZnxcs7Y=
Received: from SJ0PR13CA0050.namprd13.prod.outlook.com (2603:10b6:a03:2c2::25)
 by LV3PR12MB9234.namprd12.prod.outlook.com (2603:10b6:408:1a0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 06:21:16 +0000
Received: from BY1PEPF00026966.namprd05.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::77) by SJ0PR13CA0050.outlook.office365.com
 (2603:10b6:a03:2c2::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.6 via Frontend Transport; Fri, 11
 Sep 2026 06:21:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026966.mail.protection.outlook.com (10.167.244.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 06:21:16 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 11 Sep
 2026 01:21:14 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 11 Sep
 2026 01:21:14 -0500
Received: from [10.136.42.177] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Fri, 11 Sep 2026 01:21:11 -0500
Message-ID: <b44631c1-4272-4860-88f7-14c62de5e2fd@amd.com>
Date: Fri, 11 Sep 2026 11:51:10 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH RESEND 01/10] sched/fair: Do not set_rd_overloaded()
 if rd->online != env->cpus
To: Xin Zhao <jackzxcui1989@163.com>
CC: <bsegall@google.com>, <dietmar.eggemann@arm.com>, <juri.lelli@redhat.com>,
	<linux-kernel@vger.kernel.org>, <mgorman@suse.de>, <mingo@redhat.com>,
	<peterz@infradead.org>, <rostedt@goodmis.org>, <vincent.guittot@linaro.org>,
	<vschneid@redhat.com>
References: <7735bbdb-2465-4ed3-9486-be9b82f3f42a@amd.com>
 <20260911010623.2425196-1-jackzxcui1989@163.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20260911010623.2425196-1-jackzxcui1989@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026966:EE_|LV3PR12MB9234:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bf27b3f-acbd-45c0-2ba1-08df0fcce2c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|1800799024|23010399003|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ib0mnzFuUtNHJcGCHWpIHKf61TQwzKLqzEFbMHAhOt+TJ6cnR+5LBbPpJtE+w7QEGWRmp1nMA+5uA7BtAWdF1JD9+f0rU3mqyNj4dHZTkV6Mjxa2RA7nX+IHIInBobsVJRVO17DPBx6wSEifTW/bFjdq7G+Rs4esJhxoYSvZ/9n9KRV+qFdktRuGQe916tbKmEAC4oxI59ekAX05jzz6O33mbV02aVkp5TPp3GynKQkIDTFXD28+P0Xy4cGjOUWxktq/kgfgDOCF+lluImdlBO2266wmcRUVWoQvuomLpVT9k+xRIdQvMqbnanlaFy59iWlhf/+kItYa5QzEIAgOwhqEaTqIt16uFvQoKCMNtxt8xHM/3skDRMI6BqXHF5EoyR0cGvCKcngEQqvS7LYVlldrzCth1xrG61fm1Y5I2HEG0afcaoGn50yf+DTYoWaLQw1LMbB8K9KOwvNjNb5GVWglFCXUNxzd9fdhjfUraqog7KGBzphZxBDZ+WC46uJAo3u+2kEQc1HCRN8dBFBJkvQkn8qJlNBpQBbyL30T9y6Dg6G/V9p4BmqXd/kLqO4TbUvvdkBB5xRVEek722A8i9owwu/QMv917gdwKndrKuio6OIHDH3ZE9Hh+Nd8WeYynbFKUtajy31JHobz/97gvy3L3cLeUtkUYU534dsytu8A7v5Yyx7ERylQFP2KvNZpuuqHd8Vn0KYx8qHU2thexw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(1800799024)(23010399003)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+Bl22b8z2fulBMiYovCo9ZaZfuEf0M2X458rghebCtEaKRxSET0qf0MR8Zqxs+VoOVqXvhu4UOO/5AQMhVACJp3amikGW5TY7xXxlcooLxMiXk419ZOjjXjo43jrPcGsTKubWBUlvjAuJsWy8n5GKe07U3NfnnHY5OrQ3DqPbydX1L7EAUMKjFfgels+U79ouiG41s3G57dMJO3MhdJhdqyLEtHF66LN7xH66NOPZSDQ6qPAbGC9tpZSdYcUCHlr83cbLWOjDy6c+iTx7uoUvaQGSf1ze7J/Or3DfaYFqv5yF9Ge7n4piP2qowQ8O221rRhhSKs7z/7/jYTGZlaBRW8+EIt0w0nl5Jg+YLHdULAh4v2K1zBvtjL4DFweqaVr0hW3Z/qn8EV6JkYRODmk/dqwCC8sgXk0Wf5ygC7LuePdp3ipaJEcy2lnCKkvW94U
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 06:21:16.1185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bf27b3f-acbd-45c0-2ba1-08df0fcce2c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026966.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9234

Hello Xin,

On 9/11/2026 6:36 AM, Xin Zhao wrote:
> On Thu, 10 Sep 2026 14:00:43 +0530 K Prateek Nayak <kprateek.nayak@amd.com> wrote:
> 
>> Only two cases manipulate env.cpus:
>>
>> 1. LBF_DST_PINNED: The CPU doing the load balancing clears itself from
>>    env.cpus since pinned tasks cannot be moved to it and goes to
>>    "more_balance" but "more_balance" does not recompute stats and never
>>    reaches update_sd_lb_stats().
>>
>> 2. LBF_ALL_PINNED: CPU with no movable task is cleared from env.cpus.
>>    How will rd->overload being set for a CPU that cannot be helped make
>>    newidle balance any more efficient?
> 
> The effective range of LBF_ALL_PINNED is specific to a particular src CPU
> and a particular dst CPU, whereas rd->overload is indeed a global marker
> that affects all CPUs with idle states. Regardless of whether case 1 has
> been processed, it seems unreasonable to me that rd->overload could be
> incorrectly cleared due to case 2, because the scopes of the LBF_ALL_PINNED
> and ->overload flags are not equivalent.

What is the point of doing load balancing if the CPUs that are overloaded
have all their tasks pinned? Those are just wasted cycles.
>>  Since LBF_ALL_PINNED is known with busiest's rq_lock held, maybe you
>>  can set a rq->flag and later consume it in add_nr_running() to
>>  do set_rd_overloaded() selectively.
> 
> If the global rd->overload is incorrectly cleared due to LBF_ALL_PINNED
> from src (CPUA) to dst (CPUB), it is possible that CPUB may experience
> no changes in nr_running for a certain period of time.

Why? Tasks can still wake up on it no?

All that clearing rq->overloaded does is indicate to newidle balance
that there aren't any CPUs with movable tasks on them and it is futile
to do any load balancing.

Do you have any numbers where Patch 1 specifically improves stuff?

> Therefore, I think
> modifying it in add_nr_running may not be appropriate. I'm not sure if my
> understanding is correct.

I was thinking something along the lines of:

  (Only build tested)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 5de115f67065..e78bbdab637f 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3000,6 +3000,15 @@ static int affine_move_task(struct rq *rq, struct task_struct *p, struct rq_flag
 			complete = true;
 		}
 
+		/*
+		 * At least one task on this rq might be movable again.
+		 * Check if rq->overloaded needs to be changed.
+		 */
+		if (rq->all_pinned && rq->nr_running > 1) {
+			set_rd_overloaded(rq->rd, 1);
+			rq->all_pinned = 0;
+		}
+
 		preempt_disable();
 		task_rq_unlock(rq, p, rf);
 		if (push_task) {
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 66e3b5cd5902..563327eb5ae8 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -13614,6 +13614,19 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 		 */
 		cur_ld_moved = detach_tasks(&env);
 
+		/*
+		 * Indicate this rq currently has all its tasks pinned.
+		 * Next enqueue will reset rd->overloaded accordingly
+		 * if it was cleared during load balancing.
+		 *
+		 * XXX: Do this only when update_sd_lb_stats() clears
+		 * sd_overloaded? Can this be used to skip CPUs with
+		 * pinned tasks in sched_balance_find_src_rq()?
+		 */
+		if (!sd_parent &&
+		    ((env.flags & (LBF_DST_PINNED | LBF_ALL_PINNED)) == LBF_ALL_PINNED))
+			busiest->all_pinned = 1;
+
 		/*
 		 * We've detached some tasks from busiest_rq. Every
 		 * task is masked "TASK_ON_RQ_MIGRATING", so we can safely
@@ -13751,6 +13764,7 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 
 		/* Record that we found at least one task that could run on this_cpu */
 		env.flags &= ~LBF_ALL_PINNED;
+		busiest->all_pinned = 0;
 
 		/*
 		 * ->active_balance synchronizes accesses to
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 5950391b873d..651a6e637e37 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1361,6 +1361,9 @@ struct rq {
 	struct cpuidle_state	*idle_state;
 #endif
 
+	unsigned char		all_pinned;
+				/* hole */
+
 	unsigned int		nr_pinned;
 	unsigned int		push_busy;
 	struct cpu_stop_work	push_work;
@@ -3060,8 +3063,10 @@ static inline void add_nr_running(struct rq *rq, unsigned count)
 		call_trace_sched_update_nr_running(rq, count);
 	}
 
-	if (prev_nr < 2 && rq->nr_running >= 2)
+	if ((prev_nr < 2 || rq->all_pinned) && rq->nr_running >= 2) {
 		set_rd_overloaded(rq->rd, 1);
+		rq->all_pinned = 0;
+	}
 
 	sched_update_tick_dependency(rq);
 }
-- 
Thanks and Regards,
Prateek

