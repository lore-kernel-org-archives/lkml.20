Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793850265;
	b=vvZLf7MSqUB+oGXtJnOSWXxDSIBzlAUKW/6rbvlhlcuSz1wArXcOwrJOb92oHV94v80n
	 bn3e/3TY0x9s8U9qr9g2IVVPtIAoL3alAh5xTmIPxWpkhXEPV6IakW52ZncL4WufDb0z+
	 bHzvYhye0QoOCgD6XqP4aocPuK5yAQ/vH28xZNbbGf+xbL8ZwN4hbB2MvhT7u7xKBrsTq
	 QpJWnij2OO1TLS9BliB1Rfz8HvcAZzQpnsvIQnXiyFZaumsLcSS/fZnh2ZDUs3LJiymJl
	 ClT3aTgG5sc4w8HTfPDOVn1pDu4pVdFmP7BoXYWxqIzn766CS07txANyj+urTEPLmSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793850265;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 CC:References:Content-Language:From:In-Reply-To:Content-Type:
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
	bh=wciZbxVaJMUCqSXqL5oG0lG7/nKBad/g9vP2YlipriE=;
	b=34taSTjp5V0quhCXr2a1kWfeB+Gg+ZvR3uMZtYmf5wPWXZJREX2yLcyu3/hez5N36UHr
	 IuRzUtEZ2UZX+N9ARJRw43qvKClLdN36O8ODWbe5Iz7RYQCR3BM27FCsgtdRFDhHZg8Ym
	 1Lp4tqZdqzh8eJxMjRBo0r1EePEAgKEO/soaOaVVKm+kiNZ5+mkCnPH+YdJqp5eM4zGxI
	 bC1Z1UNO3gaOwCwjJllog13GO1cevGFYtORENOrNAG9/XqQSBPBkaQj7ppBXjxP9ama3J
	 w6QNn273cxEReBbNACYoESjQF+OE72TFoKyvToYULc/2FBDUrGsKfz4C+ajBsGWt8bg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=oXLobnyT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.51
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012051.outbound.protection.outlook.com [40.93.195.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AA1606A32E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 03:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09AA1606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=oXLobnyT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hzsYG2qK80KNQiVlWjmE0myTmXnJCXeEnSgCmmjVjL6Dsp2czKeOJOnKiuZ4lyypzqizU2pRPxV29h+TqLa8byqhjrTLYTJQz3XdGT48FU7UiQkjcGcYUcobGekKXSzSz7Zw1c+9aXBAavSqqYWNIeXpxGUZFg+kW214DaJxpVplFqDH8mP4G02uR5CDXPxPr9RNAmZUVNYN7oXvvEL2/4TFwnyCfifAU/u+88870JDzjJnlGd+3vVp+XZaXUnDKcGYboJmhS1qAp0o3925Pymmz+N7jSm4CHjhXRP56gHYa3nNoGvDxhUIIQsWCqwjBGDStRiQ3WKF77e1Gdkc6Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wciZbxVaJMUCqSXqL5oG0lG7/nKBad/g9vP2YlipriE=;
 b=dr682A9vXtN59jlrOEUTQXS+anuLKKgC1miO5igReuxB92cT4Uw2ht6QkFausUSF1TFQili9gTOpkQFqkKfx1pMyhfV+8QKNA2PlCd42UEn1Mpm4PTnnsy7y/VLy8Oz/6ySYAPya6qviq8Mmibu5/ty9cyXqBTPc2F+USUynf+f0oRnAJ0Q1lJgc+uT1eyZHFKfJFaYaKk8LqRvc5YvU57qFmXuU+T58PjQAGNcKAM0yOJQKMUhOlQsGdPaV9nos4G5Yhqe2H0pKlNuPpYkWkUjbLyePlslGRmB+WRo3s7cZzqBP0bwM7uLSsozQVbM7zh0ieY4Jv8XAO63f+kY/QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=open-hieco.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wciZbxVaJMUCqSXqL5oG0lG7/nKBad/g9vP2YlipriE=;
 b=oXLobnyThn3NzKMCCPa1+ZnYUwrxXcLPvNMOGX55qxdxZSph7igWvQtlINcJM0Kb1s8bVgSMzOhAJHXwqysUKP7RqY2TxBhRQJooCEDsqlwo/dtMLlhU5mqmH35pL3j321J+qLD5/7QnUsl/FHeujmbOlgorUapXJGOrK317Fs0=
Received: from CH2PR14CA0014.namprd14.prod.outlook.com (2603:10b6:610:60::24)
 by DM4PR12MB6424.namprd12.prod.outlook.com (2603:10b6:8:be::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 03:44:20 +0000
Received: from CH2PEPF000166C5.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::26) by CH2PR14CA0014.outlook.office365.com
 (2603:10b6:610:60::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 03:44:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF000166C5.mail.protection.outlook.com (10.167.244.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 03:44:19 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 4 Nov
 2026 21:44:19 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 4 Nov
 2026 21:44:18 -0600
Received: from [10.136.35.83] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 4 Nov 2026 21:44:16 -0600
Message-ID: <7269c4e1-1e58-4600-bd01-94dc92e0f2b7@amd.com>
Date: Thu, 5 Nov 2026 09:14:15 +0530
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
Subject: Re: [PATCH] sched/fair: Distribute burst-woken tasks when rq depth
 reaches 3x average
To: Li kunyu <likunyu@open-hieco.net>, <mingo@redhat.com>,
	<peterz@infradead.org>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>,
	<rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>,
	<vschneid@redhat.com>
CC: <linux-kernel@vger.kernel.org>
References: <20261104091842.266273-1-likunyu@open-hieco.net>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20261104091842.266273-1-likunyu@open-hieco.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000166C5:EE_|DM4PR12MB6424:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e7e4201-d01c-491f-841d-08df3aef12fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|36860700016|82310400026|921020|11063799006|56012099006|261009223027099003|261022075727099003|261026121527099003|261028144727099003|261026140227099003|261022105027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AxT0w6kl4tukO4yGQw7jitJ6oP+GD4pDq6SHwpQtFiZF56J1Ly4tsHzsTnMWwLluKAGrzeEKpez0yb+tB7sUH5L31aYl5aLEAduEW0YbgZVD36Z6Us0sRacWFIQIA0duL9HHanNy14ziFWF2q0q0trRHfnHKsyKogct1GJ2irrH2wLRKFRhXccyXFlEwFtQVtOWARQW62NkhYrOngXZXdDyMGwW/JiWrZTwjNW9qRgF05v4FKXUOg0O3kb+jq6jVUzL7bl0R7fEbPq77Q2hVD0aHG4R4Ev83lVq3sLIwZzeFP2cjoY8SmB2nbY+AetsXPjyoeeNqhbKSEPr3OYa3YE6x7HNhViQs/KgWUEAg4pHFikCPJitx1OjrH+0Rl1tKlaVfn5/w1cpA5Atpzqa61/m+JLo8pY+5D9ORnGfLgGuRcKeBfjyTcCLsQ4acmjE50YL+OGMaImUbt22pM/Kwz71i04NIlg2dULKT5Pyw0SQLZGtiZEZCU55ILcKYd8aEIsa1eFrPMVw8q1L2sB9lpTb3Zjifxb9aeCSLFUk4o0pqtM2CJkZRmq7F/Bfi9iUhUqP3xRUJP/59xdKnf0FQuH2tSx5jIbrP/w4YPpogGizVXMS8SVdMOKaP1lbdevp+YeZBhVbsu9tba5+E1cVVC9/kO4sjvSlNs57pBFEs189DLSEv6qq037gsCpdQ6/Ikz0ixrI/f4mLml6z3//y8BqYZRGSzAnG65LgBAOY2jrQ2V0N+AGxkFZUEYgUV2JPy
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(36860700016)(82310400026)(921020)(11063799006)(56012099006)(261009223027099003)(261022075727099003)(261026121527099003)(261028144727099003)(261026140227099003)(261022105027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o8nCBVcvttCt6TAEu77C+dBG3xtl7SyBfIIfGS53/ag3sQ1ntbazfwOLC6qSG5WKNQCK//Zrpzwl82W1V5yovtYtL8OciblE0HFQDxWYszgRxVtPgSHuu6f0tbHWYQQNX6Ej+t44rD5qSZWqtkKPbw5H3TmWLYOid7/pcJrzLyob3TLAhRwL/Q20cNYgNl0wnnNuZF3KUYOFQbZHGMSYcdzZx2NwAtJ/4WvgWZ6LU5c+1pVMZyeAf2IVZsTMgZFqWTAlru2FvCpO4dX3Wu3Z68u1CSbT19mwzFYGTehe2sO8DfqfNfHDb9uJrckUInvHt/SX3xUa73Q2/oqYLXQ/k1Pkdv+AY24DrrR8XKHvnOS6WZvziZN7f/VA8Dymq0120ozk0+cCI/fnmiZHGj2cOX+68XXXRu1x3baN53XQGAussPUdgIvuOMBtJ4AbYoCf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 03:44:19.9475
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e7e4201-d01c-491f-841d-08df3aef12fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000166C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6424

On 11/4/2026 2:48 PM, Li kunyu wrote:
> +/*
> + * Check if a CPU's rq depth reaches 3x the system-wide average tracked
> + * in root_domain (scaled by SCHED_CAPACITY_SCALE, floored at 1 task).
> + */
> +static inline bool rq_burst_overloaded(int cpu)
> +{
> +	struct rq *rq = cpu_rq(cpu);
> +	unsigned long avg;
> +
> +	if (unlikely(!rq->rd))
> +		return false;
> +
> +	avg = max_t(unsigned long, READ_ONCE(rq->rd->avg_nr_running),
> +		    SCHED_CAPACITY_SCALE);
> +
> +	return (READ_ONCE(rq->nr_running) << SCHED_CAPACITY_SHIFT) >= avg * 3;

You can just store (avg * 3) >> SCHED_CAPACITY_SHIFT in rd and skip
this math all the time.

> +}
> +
> +static inline void reset_periodic_lb_interval(int cpu)
> +{
> +	struct sched_domain *sd;
> +
> +	/*
> +	 * Only the most basic values are updated here to avoid excessive
> +	 * cost.
> +	 */
> +	for_each_domain(cpu, sd) {
> +		if (READ_ONCE(sd->balance_interval) > sd->min_interval)
> +			WRITE_ONCE(sd->balance_interval, sd->min_interval);

Isn't 'sd->balance_interval' only stretched for LBF_ALL_PINNED cases?
Why does this make a difference?

> +	}
> +}
> +
>  /*
>   * select_task_rq_fair: Select target runqueue for the waking task in domains
>   * that have the relevant SD flag set. In practice, this is SD_BALANCE_WAKE,
> @@ -9972,11 +10004,19 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>  
>  	/* Slow path */
>  	if (unlikely(sd))
> -		return sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
> -
> +		new_cpu = sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
>  	/* Fast path */
> -	if (wake_flags & WF_TTWU)
> -		return select_idle_sibling(p, prev_cpu, new_cpu);
> +	else if (wake_flags & WF_TTWU)
> +		new_cpu = select_idle_sibling(p, prev_cpu, new_cpu);

Why even do select_idle_sibling() if you are not going to use that
data? Can't we check rq_burst_overloaded() beforehand?

> +
> +	if (unlikely(rq_burst_overloaded(new_cpu))) {
> +		int dist_cpu = cpumask_any_and_distribute(p->cpus_ptr, cpu_active_mask);
> +
> +		if (likely(dist_cpu < nr_cpumask_bits)) {
> +			reset_periodic_lb_interval(new_cpu);

This runs for every successful selection? Is that right? Why?

> +			return dist_cpu;
> +		}
> +	}
>  
>  	return new_cpu;
>  }
> @@ -11685,6 +11725,7 @@ struct sg_lb_stats {
>  struct sd_lb_stats {
>  	struct sched_group *busiest;		/* Busiest group in this sd */
>  	struct sched_group *local;		/* Local group in this sd */
> +	unsigned long total_nr_running;		/* Sum of nr_running in this sd */
>  	unsigned long total_load;		/* Total load of all groups in sd */
>  	unsigned long total_capacity;		/* Total capacity of all groups in sd */
>  	unsigned long avg_load;			/* Average load across all groups in sd */
> @@ -12964,6 +13005,7 @@ static inline void update_sd_lb_stats(struct lb_env *env, struct sd_lb_stats *sd
>  		/* Now, start updating sd_lb_stats */
>  		sds->total_load += sgs->group_load;
>  		sds->total_capacity += sgs->group_capacity;
> +		sds->total_nr_running += sgs->sum_nr_running;
>  
>  		sum_util += sgs->group_util;
>  		sg = sg->next;
> @@ -12982,11 +13024,31 @@ static inline void update_sd_lb_stats(struct lb_env *env, struct sd_lb_stats *sd
>  		env->fbq_type = fbq_classify_group(&sds->busiest_stat);
>  
>  	if (!env->sd->parent) {

On a large, busy system, load balancing at topmost domain is only
done once ever couple seconds and keeping the 'avg_nr_running' the
same for that long seems dodgy.

An overshoot shouldn't be worse than what it is now, and an
undershoot would at-least wait till 3 tasks on the CPU so it should
be fine?

> +		unsigned int weight = env->sd->span_weight;
> +
>  		/* update overload indicator if we are at root domain */
>  		set_rd_overloaded(env->dst_rq->rd, sg_overloaded);
>  
>  		/* Update over-utilization (tipping point, U >= 0) indicator */
>  		set_rd_overutilized(env->dst_rq->rd, sg_overutilized);
> +
> +		/*
> +		 * We update the average task count at the top-level (root)
> +		 * domain, as this incurs the least overhead and comes
> +		 * closest to the ideal scenario. The trade-off is that we
> +		 * must accept some temporary data inaccuracy.
> +		 */
> +		if (weight) {
> +			unsigned long cur_avg;
> +			unsigned long old_avg;
> +
> +			cur_avg = (sds->total_nr_running << SCHED_CAPACITY_SHIFT) / weight;
> +			old_avg = READ_ONCE(env->dst_rq->rd->avg_nr_running);
> +			if (old_avg)
> +				cur_avg = (old_avg * 7 + cur_avg) >> 3;

Is this an open-coded update_avg()?

> +
> +			WRITE_ONCE(env->dst_rq->rd->avg_nr_running, cur_avg);

Can you do this selectively when old_avg != new_avg?

Also since you compare it with,

	READ_ONCE(rq->nr_running) << SCHED_CAPACITY_SHIFT

Checking if (cur_avg * 3) >> SCHED_CAPACITY_SHIFT has changed and caching that
would be better and save on computation during wakeup.

> +		}
>  	} else if (sg_overutilized) {
>  		set_rd_overutilized(env->dst_rq->rd, sg_overutilized);
>  	}
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index e656c7059bf8..4147e043407c 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -1077,6 +1077,9 @@ struct root_domain {
>  	cpumask_var_t		rto_mask;
>  	struct cpupri		cpupri;
>  
> +	/* Scaled (SCHED_CAPACITY_SCALE) average per-CPU rq depth */
> +	unsigned long		avg_nr_running;
> +
>  	/*
>  	 * NULL-terminated list of performance domains intersecting with the
>  	 * CPUs of the rd. Protected by RCU.

-- 
Thanks and Regards,
Prateek

