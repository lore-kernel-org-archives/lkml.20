Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010012.outbound.protection.outlook.com [52.101.193.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A383358B0
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029062; cv=fail; b=recmXApS1oXH/lclWtsACrXIZv8AFVELu/bRERebXVLRlFCDLTdoMnQD/A0N2I3g6k5YS2zFjSapf/8t48OHsI8xUns3DO3lWA3Wc9jyKHij59so9+vYM3Ip5GfMhMndLyuo51V6zCHqOk76rHak2Z4xbou72KnBMfYBZVkgtF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029062; c=relaxed/simple;
	bh=/32etpZgYeE6CI9qIho/H8ogX+F7IKXlFVR+HSjeIxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HOOlBEZkSEtSlIdjolZS4vENf9CDgB0ulMfJjQGOxur8YsetYwXMgbtZc5QMR8gmoJI06WBo/G5th/l1YD8FIq97WY0gM+iMd5v7avs9E+pnSRHxsEPv5Dmd9JaKv61DRFfO1A+PnHCvVaIz+sJoeusUN69LmYav4ho9QE/DIfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0jPfPy7x; arc=fail smtp.client-ip=52.101.193.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0jPfPy7x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DRJJLj4k9vu2k1WEkQLEovfALMmHhQ4KnRSmMleuOwZmQI1J2TJFMbBJrgt1YcuLMp67L6JP1Gp/jkTmRAvosGy7e/MYJ8Wur/aY3/nO/dCrJro6w8nIa7MJjkgYCKyCXPCz2UKhCC/SatUIQVHBH4QF/uo/j4hIHRLYDStgGt5SW0dNjL9Sh0aW9BMkO1h1+/Vh9FUIhhKgAs6xpq0g/bRj9Pko0E/lnWK8AfJZi7h4jN7kuqwk4anUvsh8E7gn9C4qRPmmc+esTnH9pOoh2tC4liWVhkMrZyTxr3C3AbObmkgY6YRW/6D6J0lqj2MGopaNKshsDQuLstOWy7x+6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WuMyK3MKvtvLu6N1xn4/jHmbUn7GR7SObN1MyeRnx7E=;
 b=Ft8NnN5AP2qEytZJQb/WA8e0+P8BDgrben2Rvq02CKE5g93UjZBbJ+kx5XeryIxkWYNuQ+CC8uFvHeWaSO2piQt3Fdfv18RCBetpSi1giXy/IxQMvbypYRhIIyC/3UGX1w0gJqHSl5Mq2Uy0YByG+inu7cfhWvzQgqAr2Dk+7lh1WobX7Ms661UbgATwa9869qwSvjBR7SSf7FPm9nyhSOmvQQsh8JUX1pZU8PHoQgj/9SeS+huh+82znVMxCiOjd6Yds5A9BGBQD+Ql9WmuyIz4RHla/+YJmoFokpVYvp6pa2TRbGzzK0qcGNta6gS4T5QenA+Hg7VxeQ1beoIKQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=163.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuMyK3MKvtvLu6N1xn4/jHmbUn7GR7SObN1MyeRnx7E=;
 b=0jPfPy7xEty41dAValH58x8dRnGNMjdMYiCoAtdoVFBTl4GVqfng/LdU8TdThstvM5UrbEkxnFKkpBKR+ZnmMzw+ueCH9tTCbHjob/C9Q/cNM6nvG+K1pobuO3uSkyntdVcwXvMq1mrMakEE7ykXS4mFBlGP6fLQVGVPnFK9N7s=
Received: from MW4PR03CA0034.namprd03.prod.outlook.com (2603:10b6:303:8e::9)
 by PH0PR12MB7837.namprd12.prod.outlook.com (2603:10b6:510:282::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 08:30:53 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:303:8e:cafe::aa) by MW4PR03CA0034.outlook.office365.com
 (2603:10b6:303:8e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 08:30:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 08:30:53 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 03:30:52 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 03:30:52 -0500
Received: from [10.136.42.177] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Thu, 10 Sep 2026 03:30:49 -0500
Message-ID: <7735bbdb-2465-4ed3-9486-be9b82f3f42a@amd.com>
Date: Thu, 10 Sep 2026 14:00:43 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH RESEND 01/10] sched/fair: Do not set_rd_overloaded()
 if rd->online != env->cpus
To: Xin Zhao <jackzxcui1989@163.com>, <mingo@redhat.com>,
	<peterz@infradead.org>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>,
	<rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>,
	<vschneid@redhat.com>
CC: <linux-kernel@vger.kernel.org>
References: <20260910042950.1619727-1-jackzxcui1989@163.com>
 <20260910042950.1619727-2-jackzxcui1989@163.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20260910042950.1619727-2-jackzxcui1989@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|PH0PR12MB7837:EE_
X-MS-Office365-Filtering-Correlation-Id: cfa2beec-bde6-487c-f3dc-08df0f15d3d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|376014|36860700016|7416014|10067099003|4143699003|18002099003|22082099003|56012099006|11063799006|921020;
X-Microsoft-Antispam-Message-Info:
	cb6THR8SIeOyatevpvQDaoSeziFckhByk4qE281nKebHDquMSxeomJVlCAC6VQzYv3VBSRc4XfpNyFFV6MOa4yRxhHD26hkMEmnUU51pahWRZ2HMn65co32jB6KpOGO4yCMdmXKfbdEZTtYWK0ZgJjq/Del/NialAcinw4VKJKCl6ilYYdQqs33vls19uKKon4n1iZO5bPhI6mrBiSnXP+yDscOEF4tFCL8xsmPDbzoX4luSl3z520VEha/F1T11xtTpIVnJqlz4ngcCnMxzyW3eXYiW2y/Cbw2nqRC/pg1z2iIabD4cigCWCdJRv4Vnwcq42+Q3kNT/ou/0kALzPk3hlwTlhLcZUmAxBz51osgGFXgsHAWghBzTdRELHuIo3/vGBN0+ZB5jB7GOen5TfkmCPBquWhfKxcZ7dVDiMV4fXZcYRrf/k/81KtD7SHBDIN167k+G6p0+ZNrBMpaNPhzG6+VKQOWFI4kUUbrMlNpSJv6NjUJUGwtWQim9L6EFmE3YZDYceqLKalqYrYmf3ajNan81PFpxXFxhUTF9bWyEkbPieAoPkymKtsX2cKHJxJwZu3yW8lp+Y3XZJYsqdD0W7OGWWJB0UaqNwZoBKKihxB1IuqUUQH2jVexz63bTNa3w88udfC+tDv36CL0JxGeQzHhJyUuJxwI2wJodYCKgv/pElxn3K8Tiu/qdrC1X2ro+wT0LU51RYgqHYGB3agqufnIyfQk8HvoEAs6areNA8VuXFPCiZE/gFoJpAF4F
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(376014)(36860700016)(7416014)(10067099003)(4143699003)(18002099003)(22082099003)(56012099006)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uyFDtORBG5UKaTB7+EVlc6MFrrSY7hRqU5/KJWg0tTeVdrCEw5LYBJJCqF3JyZGYaCU7q6kSPQo3wzlbBCjJB4ZRAkzFN3BJbmt9Zk7/ZeSav2SVvkBwTjdXXg/lsdryUdS99JSGiAwKpKsSUkBpUJ9Oi0UXd6qhL0KFtZ75ZEN5z5+vVUc+LrBZFGmllfNaWDH3a0DtqrDtjqVA0a/MeLW93+5YpOgTZRDBIiqGyPQzVVphlUUQ/dw+R/iHzhZHrrF9/s940UHhUMeYAp3dr1rtO8AXyRyknEEIj3tqlV8ss5iFXP6yEgweSFpQ0AxXVqDIndHpdpJOftLMDZKLRUAILWEnDDZfbIGyi6LNGHwgyLDypHTVF8LiMyUfUyknEPe8amsYeTFDmosZN6phIh7mC0GCXgGMr9yo/cQz+bA3PRV3GlihlrVUQwumyEaP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 08:30:53.1320
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa2beec-bde6-487c-f3dc-08df0f15d3d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7837

Hello Xin,

On 9/10/2026 9:59 AM, Xin Zhao wrote:
> In update_sg_lb_stats(), it only traverses sched_group that belongs to
> env->cpus, but env->cpus may not necessarily equal rd->online. This can
> lead to the incorrect clearing of the overloaded flag of rd. For example,
> if cpuA belongs to the online CPU mask of the rd but does not belong to
> env->cpus, and cpuA consistently maintains nr_running >= 2, while other
> CPUs in rd->online keep rq->nr_running <= 1, the overloaded flag of rd
> will not be set until next update of update_sd_lb_stats() for that rd.
> During this period, sched_balance_newidle() will prematurely return due to
> the incorrect assumption that the rd is in a non-overloaded state.

Only two cases manipulate env.cpus:

1. LBF_DST_PINNED: The CPU doing the load balancing clears itself from
   env.cpus since pinned tasks cannot be moved to it and goes to
   "more_balance" but "more_balance" does not recompute stats and never
   reaches update_sd_lb_stats().

2. LBF_ALL_PINNED: CPU with no movable task is cleared from env.cpus.
   How will rd->overload being set for a CPU that cannot be helped make
   newidle balance any more efficient?

  Since LBF_ALL_PINNED is known with busiest's rq_lock held, maybe you
  can set a rq->flag and later consume it in add_nr_running() to
  do set_rd_overloaded() selectively.


Now a combination of (1) -> (2) -> redo can actually leave the original
"dest_cpu" out of the env.cpus which might be problematic.

Vincent, do you know why we clear the original dest_cpu (the CPU doing
load balancing) from "env.cpus" in LBF_DST_PINNED?

We update the destination to env.new_dst_cpu, "busiest" is till the same
and instead of moving load from A -> B, we are moving it from A -> C.

Later, if we do a "redo", B can still be a valid target for a different
busiest CPU with movable tasks right?

> 
> In update_sd_lb_stats(), add a check to verify whether rd->online is equal
> to env->cpus before calling set_rd_overloaded() to avoid such incorrect
> settings.
> 
> Signed-off-by: Xin Zhao <jackzxcui1989@163.com>
> ---
>  kernel/sched/fair.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index dcf860c59a14..13e873b1ef58 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -12679,8 +12679,12 @@ static inline void update_sd_lb_stats(struct lb_env *env, struct sd_lb_stats *sd
>  		env->fbq_type = fbq_classify_group(&sds->busiest_stat);
>  
>  	if (!env->sd->parent) {
> -		/* update overload indicator if we are at root domain */
> -		set_rd_overloaded(env->dst_rq->rd, sg_overloaded);
> +		/*
> +		 * Update overload indicator if we are at root domain.
> +		 * Note that env->cpus may change during sched_balance_rq().
> +		 */
> +		if (cpumask_equal(env->dst_rq->rd->online, env->cpus))
> +			set_rd_overloaded(env->dst_rq->rd, sg_overloaded);
>  
>  		/* Update over-utilization (tipping point, U >= 0) indicator */
>  		set_rd_overutilized(env->dst_rq->rd, sg_overutilized);

-- 
Thanks and Regards,
Prateek

