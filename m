Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011055.outbound.protection.outlook.com [52.101.62.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F4278F4A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774015; cv=fail; b=k/q7CQuTr6/oy30de+MODkKhOv+Dvl0FhRtpsqiusY+V0aP7UgIRTWlanwSfCpmtFAelfGOoQadzQRO3vCDd1ew1/7jRoq0NJiOU+DFanDc3sMwFBvZFpLK36VTod06eSJDomyR56lcYQIAHdA7qhpb8jvns0rZGpKjYCGlhowc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774015; c=relaxed/simple;
	bh=aWtVW/FNOjjfb2LRnxYDFMCxTwNqrkHpFxuSyKgDQxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LoS/xNjspKi2CEwShHEFMTtKwcMlIojO2PPbhwvg/SIdE97Giaulud8Ve8NM4RkP9z7/Yc+zP9GJAeWPo7U4RoYpBjUMsnEl1hbJ9xN+r4ASoKAxS0EcTCTbXMs/H6hSqQgLWBjJPNhy75Pp3jvo4Ol3FsQd4apJViPla0EQHwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5o1JBDQk; arc=fail smtp.client-ip=52.101.62.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5o1JBDQk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JxsHo0oi3Yhw0NDEZx8ehhN1rEwuBhrTZjzeGtjgUINpzaRDPSYa7cYa5FJttvm5O35jOFjYstrOWd9xUFfHo+qDP76nXGAhIZRej8OcMMcrzIetbC3+9vY0A9Oxvim1fIYuLZEkJSCYF+3bnlqCNAjr4afYeixJd17T28bTWSPdeCqHoXeXbSvwldwpltI6otUmZS7DlVSsvyv+vEsfBMyebrKF99E3lUS9bMymhYBZnCOmY+p4fzwvUViiN6RFp6vXSR6cBYXumZFg3NWfDQ2cRpDOA5WTlPZrcoG6dB194jalDNtqh/dOeaOhM60rRxU5eGJlH7ljCtoNQKaY4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WBwls2av3QHf/4M31+QS6DlmCbqypnT5Aq27ZYgmVrI=;
 b=wJNxdTHoP3EZPxlzFuHvCoU5Y5KXleQrG8BQfpU+FLW6h0K680JmmlP9dAs8/rW2nRb148cE07sar5AoWtEtfO4MS25BbrTQbNbsLKPcFRtm7EYkL5Y+ipVkFdJMEJiiR0ESju8Fqjxji/Si7A/TRxlyHYMsz2NlXUphofUaK2PYQgzBbPXaPB8JgFArAGNtCsbcUM12uBOZJel+DzYK33wlWfL49X7b3hMc5QiECKmY8NGQ3YxO6KyzXrHj53qdtMoOQcOEs5NJ4MFxtBhFOpMm188UWL2FabjAJnKdcGKf5+CZTudQDjSumhmgZA/VYFyHknUkO37Voft1bBTkaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WBwls2av3QHf/4M31+QS6DlmCbqypnT5Aq27ZYgmVrI=;
 b=5o1JBDQkxQUYYtRQwns/ZVSJpRWiM5phervUkrbIUVjbNrzC3FF7kkxVWlbMo79eW2eRg19EtQtmxnqsWByktpWHO9R3ICAxIvRKB+p7UlMv50m7CqFpi1z8FVKfA7j8UQQl031IkQVfK7oFnm5KniRDRmYmgiz2upwLa5X/RMw=
Received: from BN9PR03CA0651.namprd03.prod.outlook.com (2603:10b6:408:13b::26)
 by CH8PR12MB999204.namprd12.prod.outlook.com (2603:10b6:610:35a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Mon, 7 Sep
 2026 09:40:07 +0000
Received: from LV8PEPF00000060.namprd02.prod.outlook.com
 (2603:10b6:408:13b:cafe::a1) by BN9PR03CA0651.outlook.office365.com
 (2603:10b6:408:13b::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 09:40:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 LV8PEPF00000060.mail.protection.outlook.com (10.167.245.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 09:40:07 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 7 Sep
 2026 04:40:07 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 7 Sep
 2026 04:40:06 -0500
Received: from [10.136.42.177] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Mon, 7 Sep 2026 04:40:01 -0500
Message-ID: <83b58943-f2ff-4bc5-84b7-a40f03d3c3bd@amd.com>
Date: Mon, 7 Sep 2026 15:10:00 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] sched/fair: Honor asymmetric SMT priority in idle
 selection
To: Andrea Righi <arighi@nvidia.com>
CC: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>,
	"Will Deacon" <will@kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	"Steven Rostedt" <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Mark
 Rutland <mark.rutland@arm.com>, Christian Loehle <christian.loehle@arm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>, Phil Auld <pauld@redhat.com>, "Breno
 Leitao" <leitao@debian.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260904091838.3617894-1-arighi@nvidia.com>
 <20260904091838.3617894-3-arighi@nvidia.com>
 <ff6763c9-f279-47d2-a279-58c54ab37ee6@amd.com> <ap5_3R2H80WsD1R5@gpd4>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <ap5_3R2H80WsD1R5@gpd4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF00000060:EE_|CH8PR12MB999204:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cf39468-bcfc-4aa5-da5e-08df0cc4008a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|36860700016|376014|82310400026|23010399003|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gRQqmzDhfkx0nwxPeMOWcxOveQRMndYBd2SSOzs8aTji5QQxKaUKJo8Ys75SEeNlD+GVyI7jEVRvCOp+S8kP3bHrkVS8aXQQdo5/WQC2HlXb/mEq4qjiombxq02SqxneiS0+iItBziTrGsvbWo+0XIkATsgNuX+pyqbaE/sm2oCzahIZqNubqdLZzYoFEiURMU8BdamxBesV01sxWSeIUFoKrYlrSWjUUdALYDTE/uXB0CCsXkIdXTUXiBp9rDgdjMx5hiUCgtx4IMYbYFNh7Ww/7F0MHvSArpnCWJef/EJrp3P2cYNwy4gn6wwK5mOnTqD6f1TqHvdEBGU0g2dDaSSDzw4sfplQ5+OvStz5Y7i7/xxAnF+HFBSnMAKc7BLBIz6T/XS7y56p+YzLFq2oGwaUj+EsuBeN/uJPAOqH0vaV1n6gPGB02p6Q4O5dr5CsUwiezYk1NmQycF8+1zniZQYsKs6wZDsRsEc2ISYzwoisIRh8MnY9yerUwNMSvtADeYZFF7Jn73VwgOlqjq8DDtUjwApabSwaFaxitdmNWug/Wd2kgE4ZHKdBPKObCN5jSg5MVw3bc89Zw+vVOxyIE9uxft9qgNq7y10Y7RJIBw9WXUgkpP4cDydDCahCxI1rs7iKkIqPQfDTIpAAiOfP4905le8jRunPtgKU1LdNDIABb2fjJZRkJCl8ycK/VNHn2j2IVSGU0zDCCRQ6CnxN7A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PgZJ4JdJ3PzeelbHjLdQa8f+MYc7sM0s0R2TjcekaYqstR+hPkwRwoXaZrF2THwviPBTT/CIqtJvBFyasbj91gDqQIRdMFVxMjro0F0lUQmIiOnmD4XZqhuWtgOgcrT8dO0U1RbFN0PNjgTMcCG6YgXSGHJGP7dzajww35TWUmuEVULqt4GI8gAeJgDs4hfLn05J3613Mkd1/Mxprv+ujLR86/NRkKSL+kEOiaKOHfOfQWys6GItVqOVOanTtQBXiSQoY5Lbe5yv0ixbruNG4bmR743a9rppwfXjUHoi/HaPaxk4Hfm2OBmK/CruirVBvtA1sy52hKeX6QXkgmtttzVN7Xc6jqyM1gNDrNQ9DFItkmkGITUFnYHnOCtm4cBYR59iz7TelCH1+iI/7MYgNzIg9cuLgAjbHx1rOSgQ9VZVg0EsqlyPcJ52v4AsrAxJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 09:40:07.1728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf39468-bcfc-4aa5-da5e-08df0cc4008a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF00000060.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB999204

Hello Andrea,

On 9/7/2026 2:41 PM, Andrea Righi wrote:
>>> @@ -8720,7 +8777,7 @@ static int select_idle_cpu(struct task_struct *p, struct sched_domain *sd, bool
>>>  						return -1;
>>>  					idle_cpu = __select_idle_cpu(cpu, p);
>>>  					if ((unsigned int)idle_cpu < nr_cpumask_bits)
>>> -						return idle_cpu;
>>> +						return select_idle_smt_priority(p, idle_cpu);
>>
>> Question for Shrikanth: On larger SMT (SMT-4, SMT-8), does the ranking
>> make that big of a difference if the core is already busy?
>>
>> Does the overehead of additional search get offset by the benefit of
>> being placed on a better ranked thread? If not, maybe the paths for
>> !has_idle_core can stay as is?
> 
> On Olympus it'd be fine either way, since it's an SMT2. For wider SMT systems I
> also defer the question to Shrikanth, I don't have any of them to test. :)

Same! Best I can do is a VM with -cpus ...,threads=8 but performance on
those are super flaky to make any meaningful deductions.

> 
>>
>>>  				}
>>>  			}
>>>  			cpumask_andnot(cpus, cpus, sched_group_span(sg));
>>> @@ -8745,7 +8802,8 @@ static int select_idle_cpu(struct task_struct *p, struct sched_domain *sd, bool
>>>  	if (has_idle_core)
>>>  		set_idle_cores(target, false);
>>>  
>>> -	return idle_cpu;
>>> +	return (unsigned int)idle_cpu < nr_cpumask_bits ?
>>> +		select_idle_smt_priority(p, idle_cpu) : idle_cpu;
>>
>> Since every path does a select_idle_smt_priority() - be it coming from
>> select_idle_core(), the early-return from the cluster scan, or just an
>> idle CPU from the LLc scan, can't we simply just do it once in
>> select_idle_sibling()?
>>
>> Something like:
> 
> Yes, consolidating it in select_idle_sibling() looks cleaner. One comment below.
> 
>>
>>   (Only build tested)
>>
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index f79fcba4afec..7c97585141dd 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -8964,7 +8964,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>>  
>>  	if (choose_idle_cpu(target, p) &&
>>  	    asym_fits_cpu(task_util, util_min, util_max, target))
>> -		return target;
>> +		goto out;
>>  
>>  	/*
>>  	 * If the previous CPU is cache affine and idle, don't be stupid:
>> @@ -8974,8 +8974,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>>  	    asym_fits_cpu(task_util, util_min, util_max, prev)) {
>>  
>>  		if (!static_branch_unlikely(&sched_cluster_active) ||
>> -		    cpus_share_resources(prev, target))
>> -			return prev;
>> +		    cpus_share_resources(prev, target)) {
>> +			target = prev;
>> +			goto out;
>> +		}
>>  
>>  		prev_aff = prev;
>>  	}
>> @@ -8993,7 +8995,8 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>>  	    prev == smp_processor_id() &&
>>  	    this_rq()->nr_running <= 1 &&
>>  	    asym_fits_cpu(task_util, util_min, util_max, prev)) {
>> -		return prev;
>> +		target = prev;
>> +		goto out;
>>  	}
>>  
>>  	/* Check a recently used CPU as a potential idle candidate: */
>> @@ -9007,8 +9010,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>>  	    asym_fits_cpu(task_util, util_min, util_max, recent_used_cpu)) {
>>  
>>  		if (!static_branch_unlikely(&sched_cluster_active) ||
>> -		    cpus_share_resources(recent_used_cpu, target))
>> -			return recent_used_cpu;
>> +		    cpus_share_resources(recent_used_cpu, target)) {
>> +			target = recent_used_cpu;
>> +			goto out;
>> +		}
>>  
>>  	} else {
>>  		recent_used_cpu = -1;
>> @@ -9030,7 +9035,8 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>>  		 */
>>  		if (sd) {
>>  			i = select_idle_capacity(p, sd, target);
>> -			return ((unsigned)i < nr_cpumask_bits) ? i : target;
>> +			target = ((unsigned)i < nr_cpumask_bits) ? i : target;
>> +			goto out;
>>  		}
>>  	}
>>  
>> @@ -9043,27 +9049,31 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>>  
>>  		if (!has_idle_core && cpus_share_cache(prev, target)) {
>>  			i = select_idle_smt(p, sd, prev);
>> -			if ((unsigned int)i < nr_cpumask_bits)
>> -				return i;
>> +			if ((unsigned int)i < nr_cpumask_bits) {
>> +				target = i;
>> +				goto out;
>> +			}
>>  		}
>>  	}
>>  
>>  	i = select_idle_cpu(p, sd, has_idle_core, target);
>>  	if ((unsigned)i < nr_cpumask_bits)
>> -		return i;
>> -
>> +		target = i;
> 
> Not sure about this final fallback. Is it worth doing an additional
> select_idle_smt_priority() after idle scan failed or stopped because the
> SIS_UTIL scan budget was exhausted?

I see what you mean! We'll end up doing a:

  select_idle_smt_priority(p, target)

at the end which might indeed be wasteful.
> 
> It seems better to jump to out only when one of these paths has actually
> selected a candidate:
> 
> 	i = select_idle_cpu(p, sd, has_idle_core, target);
> 	if ((unsigned int)i < nr_cpumask_bits) {
> 		target = i;
> 		goto out;
> 	}
> 
> The prev_aff and recent_used_cpu fallbacks can jump to "out" as well, since they
> were already verified as suitable candidates. If none of those paths succeeds, I
> think the existing final "return target" should remain unchanged.
> 
> Does that make sense?

Correct me if I'm wrong but you are suggesting to keep the current
return intact and put out label after it like:

    /* If no suitable target was found */
    return target;

out:
   if (!sched_smt_asym_active())
       return target;

   return select_idle_smt_priority(p, target);
---

That makes sense to me!

-- 
Thanks and Regards,
Prateek

