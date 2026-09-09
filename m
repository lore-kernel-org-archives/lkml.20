Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011042.outbound.protection.outlook.com [40.93.194.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408963AAF5F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788935550; cv=fail; b=WUpTbRLDAKMpMlwYafGZhUQIVltwFZgQQrzpYTHkFt1x50uZPssMZxzkSc+BdaVu9MNB7YFe596pPG1FI7lGlIRTVV5iwObxnYz7pUbyd4widwT8u0qOZMpBTugu13yAVA2/k566fJkyulyKaoG/C4/Cd+xBPaMzOyEWsHa6OHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788935550; c=relaxed/simple;
	bh=CmcVD7LCATAnMKSy//KeKUqxLSt/taJGWcbyEe6OJnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bjJSDbFpWZvbkywo4dcRkEeBL6v6W71NE/Ovzma3ttBdPaZC3V8Rx/bJE0iJWnxyVMyZ5oA33kcyDv3prqwB68Zt4uxuHpv3k9A/peeiBMyIstb2Z2XaETB8PZY3Ur2D9mAkjvdt7Rn/CGTHAKixouRdQ5hnGS66l/3NSgHmK5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Vl9o9xKO; arc=fail smtp.client-ip=40.93.194.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Vl9o9xKO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rMstwgZFOFeav4vMLHbHXZgifRN1XUAyZkqS+4pfI3+10K+GvD5psDhFhM6hrMzTiKSMz2bfD3Y3R/uazfavOzl1Tz3O0LDyFAcD5IjwVOzx2zEJ9I/z4VC9oJIuVM7Yw/63IgTPWsRPHx7v45JvV5s2gdX75P2LRpphrbkAGfDWnNJVmpEtrcr05RCgDA4M7YQTzqkd1HM68/vsmmuJeowi493xh6SVjclaYt+Xg1ih2gvbluZH0uTRtL2Fr4jTzh0YP2jQICVxPw52yEEe0nI5ACvsC6qSdaZYTxZJfMZeGvbbwM4czDBZnmpE6KzSKAd59mJKwZjt0r0roRd40g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CIWNDLYDI0lqfn5YVzIcb/I4QO9eJrKQkwXhpRUYp/c=;
 b=GIY7te3xn8ENtz4CgQl5he7bwQUJwLBY2GmU7/LMLNybL1bcgo1EvtWTRjncQb3fIxwYHiAs9Llz+JfH9bBkVo1HzwAHxuYyU1dalHoLk8uKBn75N6sbwh1PbWuw57T/3hHIe8TRY0pxNudpU7PR6qmfLNht6PBiJ2Qk79jl+ZyLSEISNcVV5xWP6kdBcLVNgDpurTLKstyp2xuf2ZAAgR+96HCaTbs9ulw/+k8db0Pppvlf/qhdUh4gizfgTRSazZ2UA5ddrtZ/noT3MiQ94879htnOTLF7ddpNiO+9pi3aesYn7dHjpyiAZEPpOi8DGUDvZyfbzbedc/l4T5XfWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIWNDLYDI0lqfn5YVzIcb/I4QO9eJrKQkwXhpRUYp/c=;
 b=Vl9o9xKOVj320bQf9Ja3FfYptdZDOWrpfnULA4XGfZTWoHxKmHWE+eRt/uzxHdjonDEIW6OCoGMLDTmOgigODYnBMoJwT8AO/NEH4RFLz2yxLnpGDBepQzXcMYKeqjaXwe1JjpnBJb1LNJubmf17SwHvNpE8CC2YMz4ttHfd6p0=
Received: from CH0PR08CA0016.namprd08.prod.outlook.com (2603:10b6:610:33::21)
 by PH7PR12MB9201.namprd12.prod.outlook.com (2603:10b6:510:2e8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 06:32:24 +0000
Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
 (2603:10b6:610:33:cafe::4b) by CH0PR08CA0016.outlook.office365.com
 (2603:10b6:610:33::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Wed, 9
 Sep 2026 06:32:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 06:32:24 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 01:32:23 -0500
Received: from [10.136.42.177] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Wed, 9 Sep 2026 01:32:18 -0500
Message-ID: <2abe03fa-63a3-4196-8869-f2372a5a13e7@amd.com>
Date: Wed, 9 Sep 2026 12:02:12 +0530
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
	<vincent.guittot@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven
 Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Mark Rutland
	<mark.rutland@arm.com>, Christian Loehle <christian.loehle@arm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>, Phil Auld <pauld@redhat.com>, Breno
 Leitao <leitao@debian.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260908082345.103087-1-arighi@nvidia.com>
 <20260908082345.103087-3-arighi@nvidia.com>
 <ce287aa0-0079-4cfd-b330-6b7617f49e8a@amd.com> <aqB05WpYBcZfIZYQ@gpd4>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <aqB05WpYBcZfIZYQ@gpd4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|PH7PR12MB9201:EE_
X-MS-Office365-Filtering-Correlation-Id: fe8f9f50-d19f-4d9b-9fc0-08df0e3c1c13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|7416014|1800799024|82310400026|4143699003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ZcYw6lIut9/x4wAVj7vvXB6xMd9EyXHwvJnwZHSyT5jCxekNm23UgRRB4Gti/HyOI8CTSDrjRgp76cY4hJDlSFy961fzYGxY4XqgBDD1Vk+f0WVzJlAF7cEROWD3yUxmfPAh/atdueBfOUUYIoxOg1ZywWsxzAdsV0sHGznR5SdI5dn09BDo5OQw2ltIOkc6pTAf8aBb0xLXLwUs1koxoukUcZ2q+URgAGVE8wQHLV28obJNEGzsr7Vd/tXRjnG7UClZYy/cvpN2eV73shYXZzEf6ogfonrN6km9r7oxqOZVUiZ3qJee7RS46ynQmI4IZhnNdw9x0qBwqAFhcWeDJqM9jy2r8q92TTacKCJjgJ/BDxk5h9i2aVcL2HgDMp7ONtr8xm0wAjGPBqZ+tCd3lC8n4bsy3hb3F3LSX4KPYXLNTm7YGnAFxdsoFm40bb7dkCVb8+Q4tdFFCy+ioBs3+GElXCDpjvz4jlc/ukcCVtcEIZ98HFF+IAHxqjyTJK43EBXo7nTJ7aamhwaMvYQgltn83YxiHVC+cPpCchedWSSVfXIBDl8WTBwjfWVmH74a4F1wCD7FviyXdXBdtvgYFrzc1p8AMfw84w1kI71T46UlINSZ+djsEouhI6smWpCvahKkwcZYv568ZQ504SoHXIwjwl/isoT4jcE0MImF1IuMQHtjC7OVZAxgqODvcFMNxW2mKKw3bm0keXnK0JtOPA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(7416014)(1800799024)(82310400026)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DI0Cc4KX0EjE9dOi3Q1wGjeonqkv44053JLRruaxca8Y2LSU+zhnX+iIWhFHgdEkjDuBQtrxJNW+68DewdzGwiVrKHv6wDLr18hQwXVqJ9moibRUuukxN/6svJpdyZ5eOLzGVlNJJj39+mPbXVn9jbLOAKen7KjZK4lTxVhdpPoCntM5gotK8Szc32zt3W3d7ZDWsutp6Ceboqp4tRdPJiHxWmYwcxyTHt/hV5+8/Us/T10qlnDagE/1eEHxKrEYd4eyE8w+VRcMBu1Biwqh8jU9dajWalZUGtOciOFE0IMqOc7FazqU+Xgz1IK64HEnomw8xcrSCdIL0g/Cg3VjMYmnB/dHfw04FZiJBE3/Wv7bGQZUjehOCnfvRhFjLxDDgs9IcvB8Zjk6HX1dhk3JQgdKfPxYaseAivkF+7n4M8Ko6DWYsaHvb1Jkc57dlUg+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 06:32:24.1447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe8f9f50-d19f-4d9b-9fc0-08df0e3c1c13
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9201

Hello Andrea,

On 9/9/2026 2:19 AM, Andrea Righi wrote:
>> nit. I personally feel this can be better integrated into the
>> sched_balance_find_dst_cpu(). Something like the following:
>>
>>   (Only build tested)
>>
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index b8bd308c2d5b..1012dfb33f08 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -12353,6 +12353,17 @@ static inline void update_sg_wakeup_stats(struct sched_domain *sd,
>>  
>>  	}
>>  
>> +	/*
>> +	 * If we are on a SD_SHARE_CPUCAPACITY | SD_ASYM_PACKING
>> +	 * domain, use the group_asym_packing classification to
>> +	 * decide placement based on rankings of idle siblings.
>> +	 */
>> +	if (unlikely(sched_smt_asym_active() &&
>> +		     (sd->flags & SD_SHARE_CPUCAPACITY) &&
>> +		     (sd->flags & SD_ASYM_PACKING) &&
>> +		     sgs->idle_cpus))
>> +		sgs->group_asym_packing = 1;
> 
> Integrating the preference in the slow-path selection sounds appealing, but I
> don't think group_asym_packing can be used as a destination classificaiton here.
> 
> The intended policy is to prefer PE0 over PE1 when both siblings of the selected
> SMT core are idle. And if PE0 is busy, PE1 should remain a valid destination. It
> shouldn't make a busy PE0 preferable to an idle PE1.
> 
> IIUC group_type is ordered for busiest-group selection, group_asym_packing
> describes a source group whole load should be moved to a "more preferred" CPU.
> Marking an idle SMT group as group_asym_packing could make it rank worse than a
> fully busy group.
> 
> Example: a fork on SMT2 can have the busy local PE0 classified as
> group_has_spare or group_fully_busy, while the idle PE1 is forced to
> group_asym_packing, sched_balance_find_dst_group() can then consider the busy
> local group the better destination and stack the new task on PE0. That may
> preserve one-thread mode for a short task, but it can also reduce throughput for
> sustained work.

Ah! Sorry for not realizing that earlier. Probably needs a special case in
"group_has_spare" instead of using the "group_asym_packing" which is always
considered busier than some other classifications but we can always work on
it later.

For now, I can confirm that this shows no performance impact on systems
I've tested this on (4th gen EPYC, and a 128C Ampere ARM server) and the
fast-paths are inlined correctly into select_task_rq_fair() so feel free to
include:

Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>

-- 
Thanks and Regards,
Prateek

