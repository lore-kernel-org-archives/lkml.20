Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011064.outbound.protection.outlook.com [40.107.208.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A326A3F1063
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 03:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788753466; cv=fail; b=NlGyTn7BAMzWUAIOBTioUO8UEeYf0kpLaH2a3YgZPllIagTSg2UguIiNjVZZxq8v/hNKdRcWtb0jVx8NTu6s4UhePzf5saJUEX+OMFCe2dcp0rS/qsp6kLOE2PAljAMRaSJuXXVcfgOh9B7bbmQ+kQ2rFyLk//pjWUQ479jJrDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788753466; c=relaxed/simple;
	bh=374qxsSN7YMHpCkGbYhX9RXLRkNJgNi7iDYYmUoOea8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cOcLyTNahxkeegkYNGpn0u6R4G/XWwmIN0vhQY+i+uQ6y9DcCJ0ZepiCf9DtCe6kHYdlNksWoBHgeqjIn/ChkLwyNKhBbIkry7l/Qft/M4FNGyc6DeOUBqp25+fOV2DcaiL2WUTquZx5RgbH7xwjzABiey2mAav5uet2FqS7wAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gXYVsK+W; arc=fail smtp.client-ip=40.107.208.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gXYVsK+W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqRGc3Q3Hh0C+wPTJsdlCJ7zrANUYpySCiaDjiLNvaLu5I26pfYE4ZDuYa0RAi6lvy6hBgY1e5y6XgxbEzF5oIeP/I4Wa9KKZRsU6w7BpS8hvrysX5uct3Xbop2CVX+RtmeSNQiqiBXAGVyfCTdLmnknvmqcGONySpD5FhCxz4vBkonnFa3pad94/Vv95LwHqRSqiMygG+17AFGrI+25ZbARDbJ7BzQzLd/RYxlLJWfKGziDjA8ovmjjHidfjysOPpSfQprBfkYE3SqXn4Y8jGdj/DHgSY2PUAMb7vB1sdMW+M2yRQp81jsmPtrON6HemoAWvWfXOdvwLR3giRjl9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+NHslz1H3kno+8qTUFA4+sn0GFMXY++mDepyXKLgwE=;
 b=bE52qnbKQzuFWgM/xuihI/gZKuOfD3krZ7552FvdtTrs2tpO5Lvx6JF//MwvnQqAtmEqP3d8ftYu6y2wIvGkPINkKgk8QTJlT2WdObkMe+obFtcytBoQNyzdgBf14GegvdcysfkizdSx5XY9PSZnr3TNzamuXhPVMwvKMePJS4qpI/uL7UxaMRqgcaYn8YcGfiQaWvXGMmk7WxaaGeKUMaj9injHJ0J76NBd6U2AX2EEjyGTlYMvAeBH9ckwK9RIsClnzfRfi1ssD3xbMbPKIOIlCmrhE3wtNXn5DXNw5/Qv93dEnwSrNdHqASbdTiVSz0lwecYzwRw+9Pj40NFoQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+NHslz1H3kno+8qTUFA4+sn0GFMXY++mDepyXKLgwE=;
 b=gXYVsK+WMXDofEk3tWVj3yMFRmiUJp3trFlC7rRH+mZRD9neHO719i5N88biey4OlRPb8XhEi5Tjw3SrZtXUltFOXlhVVt2jLomJSqq5RWvy6lDjNTk/5HvlmtlYKziRwGwlF46OvTq+QYlxmmZPtJ4aRdSnf25o7wf5EAq4VxU=
Received: from MN2PR20CA0064.namprd20.prod.outlook.com (2603:10b6:208:235::33)
 by LV8PR12MB9667.namprd12.prod.outlook.com (2603:10b6:408:297::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 03:57:38 +0000
Received: from BN7PEPF000000AB.namprd05.prod.outlook.com
 (2603:10b6:208:235:cafe::23) by MN2PR20CA0064.outlook.office365.com
 (2603:10b6:208:235::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 03:57:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN7PEPF000000AB.mail.protection.outlook.com (10.167.245.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 03:57:37 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sun, 6 Sep
 2026 22:57:35 -0500
Received: from [10.136.42.177] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Sun, 6 Sep 2026 22:57:29 -0500
Message-ID: <ff6763c9-f279-47d2-a279-58c54ab37ee6@amd.com>
Date: Mon, 7 Sep 2026 09:27:22 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] sched/fair: Honor asymmetric SMT priority in idle
 selection
To: Andrea Righi <arighi@nvidia.com>, Ingo Molnar <mingo@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent
 Guittot <vincent.guittot@linaro.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Mark Rutland
	<mark.rutland@arm.com>, Christian Loehle <christian.loehle@arm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>, Phil Auld <pauld@redhat.com>, Breno
 Leitao <leitao@debian.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260904091838.3617894-1-arighi@nvidia.com>
 <20260904091838.3617894-3-arighi@nvidia.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20260904091838.3617894-3-arighi@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000AB:EE_|LV8PR12MB9667:EE_
X-MS-Office365-Filtering-Correlation-Id: d474ed4c-d82e-4ed9-d778-08df0c9427c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|23010399003|1800799024|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	r1lUpx8r/44pUuAhQw6LPrnJ5vJfNvUahyOgUkIzS3Ty7GejcEOxHFenRhzfL9bHd6e8MnXBpen2EXlFCVNxqVYEQML6GfZHKhHKo42hzo+f0RiT6AZcv/ngaawfs2nXgXGMj6IB/UgPr2Bjd78Vm0hsZYWCOowv6pFl5X1jOZjPVVXfqQ83A7Y3PT4RNlt6d/CTBPh3mDCnPyNJPYjcn9Pu0k8/OCkQ/FsPaz9Jff4r3NyP9VRUftrteoCwy2a3tqw2gb0GFus2ua8l7eDfaYUzhmreiOH/OtKtL2YffKrpIfmb3qzy6iWGZMxJ5B5H1IeQIeAqMc66a2sFhRlAnfVVarEIsJqfeuNNobfB/6v+YGCV9zov9DapP+nsErLHgficXNxjYyysx95k3FO4RxzOoYNxygO689GLkjmXzkJdR173AvUsXWsXy+LjuXNdCxYv7kd+r/+MQYFGfRckmc2MaOh82RdA418mQOSiTWOsJVuWTBy4AGmMTxPMdBvMRVVGMnUFhB97lDAshbnupLTRFvH2UOX1hHiwIfQWJ8r+jPeD1YEqb/lq96kkvtSXBabBzRfeuDaSIQx/gTRUArly+UPEMZZPzNhS6ctcjOWfFjxpbAg0aSBRGboXfgLe4DDS8Wf6YUyncGFPJmflfMveaTTTIoa0lQwUdS9GT0gr+id9W38Ib0TBelKOit8kHVeMixy2qIIAwfzQnJAbhA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(23010399003)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5++LEQ9+tXbfTSG6eUz63GiF5Qno+jcN0aSlJF/aNgj6RYP1y5O5fIBU3edYS3ProKLJMZqH8CSCuybsKcUS5VwVHcq2qbGv5F1ZoZNHubZsPCwPYStcGSWlp/c3aGqxG9W/FrlCOZAlqd9LuOyVNvQt4GP9r4iycMiOSCw2ksVXokz4QLcZD4g08seEHUxc8BktFA5XJ8GtnuUdUX1wb3NcvjgR7p0Fg9vIvUGi2GeRlpx+N1RD2+VHIC0mKPjnRW8b8bca72LN2NKHnNalK0TB1T8xmxCDt8nJ8P1Lm1cpH7hhuGw2a22EWIvMR8NTYtQA4s3fFVOhIVbOahyLtev2CIPQ1xlxyGNdlA/m1K+2QSDzX5aafGqCTnGwj5o9j2+bAXvbUa8KM1WCyq3LCRPhZ/QiSV+wLJHwXv0QpuC41yaf3orvUzgu0FluWLPt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 03:57:37.1182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d474ed4c-d82e-4ed9-d778-08df0c9427c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000AB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9667

Hello Andrea,

On 9/4/2026 2:48 PM, Andrea Righi wrote:
> +/*
> + * Return true when @cpu has a higher asymmetric-packing priority than
> + * @other in their shared SMT scheduling domain.
> + */
> +static bool sched_smt_asym_prefer(int cpu, int other)
> +{
> +	struct sched_domain *sd = rcu_dereference_all(cpu_rq(cpu)->sd);
> +
> +	if (!sd)
> +		return false;
> +
> +	if (!(sd->flags & SD_SHARE_CPUCAPACITY) ||
> +	    !(sd->flags & SD_ASYM_PACKING))
> +		return false;
> +
> +	if (!cpumask_test_cpu(other, sched_domain_span(sd)))
> +		return false;
> +
> +	return sched_asym_prefer(cpu, other);
> +}
> +
> +/*
> + * Return the highest-priority available CPU in @cpu's SMT core that is also in @cpus.
> + */
> +static int __select_idle_smt_cpu(struct task_struct *p, int cpu, const struct cpumask *cpus)
> +{
> +	int best = cpu;
> +	int sibling;
> +
> +	for_each_cpu_and(sibling, cpu_smt_mask(cpu), cpus) {
> +		if (sibling == best || !choose_idle_cpu(sibling, p))
> +			continue;
> +
> +		if (sched_smt_asym_prefer(sibling, best))
> +			best = sibling;

nit. Since sched_smt_asym_prefer() is only used here, and we know rq->sd
is the one that can have SD_SHARE_CPUCAPACITY | SD_ASYM_PACKING, perhaps
you can inline the check here do a:

    sd = rcu_dereference_all(cpu_rq(cpu)->sd);

    if (!sd)
         return cpu;

   if (!(sd->flags & SD_SHARE_CPUCAPACITY) || !(sd->flags & SD_ASYM_PACKING))
       return cpu;

   for_each_cpu_and (sibling, sched_domain_span(sd), cpus) {
       ...
   }

  ...


That way, you don't need to dereference cpu_rq(cpu)->sd every time in
sched_smt_asym_prefer() and check cpumask_test_cpu(). Both, domain
span and task affinity will be covered at once.

Thoughts?

> +	}
> +
> +	return best;
> +}
> +
> +static inline int
> +select_idle_smt_cpu(struct task_struct *p, int cpu, const struct cpumask *cpus)
> +{
> +	if (!sched_smt_asym_active())
> +		return cpu;
> +
> +	return __select_idle_smt_cpu(p, cpu, cpus);
> +}
> +
> +/*
> + * Redirect an available SMT CPU to a higher-priority available sibling allowed by task affinity.
> + */
> +static inline int select_idle_smt_priority(struct task_struct *p, int cpu)
> +{
> +	return select_idle_smt_cpu(p, cpu, p->cpus_ptr);
> +}
> +
>  /*
>   * Scans the local SMT mask to see if the entire core is idle, and records this
>   * information in sd_balance_shared->has_idle_cores.
> @@ -8645,7 +8702,7 @@ static int select_idle_core(struct task_struct *p, int core, struct cpumask *cpu
>  	}
>  
>  	if (idle)
> -		return core;
> +		return select_idle_smt_cpu(p, core, cpus);
>  
>  	cpumask_andnot(cpus, cpus, cpu_smt_mask(core));
>  	return -1;
> @@ -8668,7 +8725,7 @@ static int select_idle_smt(struct task_struct *p, struct sched_domain *sd, int t
>  		if (!cpumask_test_cpu(cpu, sched_domain_span(sd)))
>  			continue;
>  		if (choose_idle_cpu(cpu, p))
> -			return cpu;
> +			return select_idle_smt_priority(p, cpu);
>  	}
>  
>  	return -1;
> @@ -8720,7 +8777,7 @@ static int select_idle_cpu(struct task_struct *p, struct sched_domain *sd, bool
>  						return -1;
>  					idle_cpu = __select_idle_cpu(cpu, p);
>  					if ((unsigned int)idle_cpu < nr_cpumask_bits)
> -						return idle_cpu;
> +						return select_idle_smt_priority(p, idle_cpu);

Question for Shrikanth: On larger SMT (SMT-4, SMT-8), does the ranking
make that big of a difference if the core is already busy?

Does the overehead of additional search get offset by the benefit of
being placed on a better ranked thread? If not, maybe the paths for
!has_idle_core can stay as is?

>  				}
>  			}
>  			cpumask_andnot(cpus, cpus, sched_group_span(sg));
> @@ -8745,7 +8802,8 @@ static int select_idle_cpu(struct task_struct *p, struct sched_domain *sd, bool
>  	if (has_idle_core)
>  		set_idle_cores(target, false);
>  
> -	return idle_cpu;
> +	return (unsigned int)idle_cpu < nr_cpumask_bits ?
> +		select_idle_smt_priority(p, idle_cpu) : idle_cpu;

Since every path does a select_idle_smt_priority() - be it coming from
select_idle_core(), the early-return from the cluster scan, or just an
idle CPU from the LLc scan, can't we simply just do it once in
select_idle_sibling()?

Something like:

  (Only build tested)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index f79fcba4afec..7c97585141dd 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8964,7 +8964,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 
 	if (choose_idle_cpu(target, p) &&
 	    asym_fits_cpu(task_util, util_min, util_max, target))
-		return target;
+		goto out;
 
 	/*
 	 * If the previous CPU is cache affine and idle, don't be stupid:
@@ -8974,8 +8974,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 	    asym_fits_cpu(task_util, util_min, util_max, prev)) {
 
 		if (!static_branch_unlikely(&sched_cluster_active) ||
-		    cpus_share_resources(prev, target))
-			return prev;
+		    cpus_share_resources(prev, target)) {
+			target = prev;
+			goto out;
+		}
 
 		prev_aff = prev;
 	}
@@ -8993,7 +8995,8 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 	    prev == smp_processor_id() &&
 	    this_rq()->nr_running <= 1 &&
 	    asym_fits_cpu(task_util, util_min, util_max, prev)) {
-		return prev;
+		target = prev;
+		goto out;
 	}
 
 	/* Check a recently used CPU as a potential idle candidate: */
@@ -9007,8 +9010,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 	    asym_fits_cpu(task_util, util_min, util_max, recent_used_cpu)) {
 
 		if (!static_branch_unlikely(&sched_cluster_active) ||
-		    cpus_share_resources(recent_used_cpu, target))
-			return recent_used_cpu;
+		    cpus_share_resources(recent_used_cpu, target)) {
+			target = recent_used_cpu;
+			goto out;
+		}
 
 	} else {
 		recent_used_cpu = -1;
@@ -9030,7 +9035,8 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 		 */
 		if (sd) {
 			i = select_idle_capacity(p, sd, target);
-			return ((unsigned)i < nr_cpumask_bits) ? i : target;
+			target = ((unsigned)i < nr_cpumask_bits) ? i : target;
+			goto out;
 		}
 	}
 
@@ -9043,27 +9049,31 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 
 		if (!has_idle_core && cpus_share_cache(prev, target)) {
 			i = select_idle_smt(p, sd, prev);
-			if ((unsigned int)i < nr_cpumask_bits)
-				return i;
+			if ((unsigned int)i < nr_cpumask_bits) {
+				target = i;
+				goto out;
+			}
 		}
 	}
 
 	i = select_idle_cpu(p, sd, has_idle_core, target);
 	if ((unsigned)i < nr_cpumask_bits)
-		return i;
-
+		target = i;
 	/*
 	 * For cluster machines which have lower sharing cache like L2 or
 	 * LLC Tag, we tend to find an idle CPU in the target's cluster
 	 * first. But prev_cpu or recent_used_cpu may also be a good candidate,
 	 * use them if possible when no idle CPU found in select_idle_cpu().
 	 */
-	if ((unsigned int)prev_aff < nr_cpumask_bits)
-		return prev_aff;
-	if ((unsigned int)recent_used_cpu < nr_cpumask_bits)
-		return recent_used_cpu;
+	else if ((unsigned int)prev_aff < nr_cpumask_bits)
+		target = prev_aff;
+	else if ((unsigned int)recent_used_cpu < nr_cpumask_bits)
+		target = recent_used_cpu;
+out:
+	if (!sched_smt_asym_active())
+		return target;
 
-	return target;
+	return select_idle_smt_priority(p, target);
 }
 
 /**
---

That way, it lives in a single place, and we don't have to pepper
select_idle_smt_priority() everywhere. Thoughts?

-- 
Thanks and Regards,
Prateek

