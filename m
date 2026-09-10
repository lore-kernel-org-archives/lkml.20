Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010011.outbound.protection.outlook.com [52.101.61.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C98371860
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789027765; cv=fail; b=VEx2bFCqRxBr+xA9sBMXskYPKitgRYtR+h0ygjeiFRR5V+tdr4CykNCfMPv2dxSmoQJ8mEuEaaaWCpp3NJDaO196xnwkL0DCkRpQpN2zKzgM9PGZinO9nk9pH9KXZ3JvOFsrG/B6E0wjTAJiOTY9f4zgRo0tiDhtp+za4kb6EHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789027765; c=relaxed/simple;
	bh=LhmEioZDC0My7x2e4tQr0Ez8v3ULjiJNkO+7y4pDO+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uqmUetR0cZikTBf8ZuQrB/AemH87lBjuWycRoiFabbSslfnrovSmLKlPjhQEDg8wKLeV5lsISFr3wKPOn1XYStsVOSDLrW/o/TIUjVqKD1EBl9uTm77tLvfhleP+o/43VHG869Nu5K5KX7/JeuGdrxpJu/JsBhgGHU1vNBM09ew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2s/umHVS; arc=fail smtp.client-ip=52.101.61.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2s/umHVS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ldTORc+PMNiu91J4F/IKwPcV4QACvWYuM942VySRjoDhEj5jyocZGm2juoC2yP2TfHSYUKJmBlASC/DkvmXN4y3Jx8GsiOllkL71ugLpBCraEcRYNGxyKz0YaUFDHSWnV1JBN+e4JXsplvRF/RkKPeBRebfZfUTWEeqJsy1EglW0gYi22dC/wHMvWU5ObXlSeccOcJ8+0rWY9Wi+7fw+/p1pSIxrAOMguueddjBqwKFEnvLQ3Eb7Uqvr4VPsLS9PahUV0kSvP8/jF1bVMhn9qDeYxsb8nMVWUy7vVy/qAQThasN7j5FxfSM33Q+CiMVeZxK47FvxiRb8oJN3GHQsNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+CEqbR72SNV2kmoesGh1brp268Q7oskNAY14JDefDMA=;
 b=xlahf3VkrnF8UxN4sXyh3mEbhRV+QQLCg5uktA70QsyM5Br4pQj7UOmb7qJKdwuyxb5xU7SJIiLoQr1r/rAObtDz4/5zeOrXHvKbZwtvtF/2Jk/lNprA5P4bQjLE537bPx/T4p5CGrRWGKU2d4fFlcIrEijEWmy5FUkusHGbXo6p70i2h6syZI4l0ec8BFBtvTHZFl9u3LYGPrACOFmLlcu/0ARYjMUnj+LkaupvZvVX+WsT+FIppfhrN4Pk5XRcsOfir6BL5YQljrrIz0wU//4lrlA63YNcUOGIV0mLVzN3y/v55VBTAg1DWeb+Q7aZOZOOZK9OG5DU72Y9JVPG1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=163.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CEqbR72SNV2kmoesGh1brp268Q7oskNAY14JDefDMA=;
 b=2s/umHVSwvm/0WwwaFfkdrnmKce+vGb4ltiiv+9owkqsMJk7I+yhw4BINm+M34/tzZ7Dm6TxPTXNKmavyR4kV6Z3LQM7KDKl1KknwOSI7OdNcrv5xB7adoZ/XiC5zRdsSdBoUAxrSGFzYlNz7y6xSDZDaJRTT5txCltrep4E1Vk=
Received: from BN0PR04CA0014.namprd04.prod.outlook.com (2603:10b6:408:ee::19)
 by SAVPR12MB999144.namprd12.prod.outlook.com (2603:10b6:806:4e6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 08:09:20 +0000
Received: from BL6PEPF00020E60.namprd04.prod.outlook.com
 (2603:10b6:408:ee:cafe::14) by BN0PR04CA0014.outlook.office365.com
 (2603:10b6:408:ee::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Thu, 10
 Sep 2026 08:09:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF00020E60.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 08:09:19 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 03:09:19 -0500
Received: from [10.136.42.177] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Thu, 10 Sep 2026 03:09:16 -0500
Message-ID: <f771bdd6-3e4b-47db-bfa9-b04bd58b9a06@amd.com>
Date: Thu, 10 Sep 2026 13:39:10 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH RESEND 03/10] sched/fair: Clear active_balance at the
 end of active_load_balance_cpu_stop()
To: Xin Zhao <jackzxcui1989@163.com>, <mingo@redhat.com>,
	<peterz@infradead.org>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>,
	<rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>,
	<vschneid@redhat.com>
CC: <linux-kernel@vger.kernel.org>
References: <20260910042950.1619727-1-jackzxcui1989@163.com>
 <20260910042950.1619727-4-jackzxcui1989@163.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20260910042950.1619727-4-jackzxcui1989@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E60:EE_|SAVPR12MB999144:EE_
X-MS-Office365-Filtering-Correlation-Id: 29b5f3ae-c427-404f-0ed1-08df0f12d0b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|7416014|376014|10067099003|6133799003|22082099003|18002099003|4143699003|56012099006|11063799006|921020;
X-Microsoft-Antispam-Message-Info:
	wEwF+ZqfsRkOuRUNJtrQouENNOJRBN25ujkBFcaRYfhdlavcroT/UVJUOzAS3GP2H8SyP4AAPJ242MfPDGmEYqrVgFXTBaeJE1lKnMkDUoImGne1arU9GJc8luQ8iHhbe0z16nsl0iQrNCNA8NrQpBR0WMF/qxgKXa3EimHyL93M4asTsZQB1veUblHlrnhqJgp9vz2ACJS5BOjepycjsONOMEoE0m5OR3dRj1QJwbsJXRm+E1waKUNzZx7k/uWDrmUbvPWTC4DBFJYnOBzgxu4RbIh5PfYw0aDHmMumwdfTx/yAhuFM10SMc2l/9rjHJVZ6tQsui7K6cGONmroKWyQPlk6iqoShcDFFnH5kwTT0fXORvwwBWn/PSozh/pz5XgzXsFzv+x5881OmNrg6Rfdjd/V9V/VlH71arL97gC/Y5VxtBZ3yi292UHieKd0zVoqVGrtCYiQ59nM3Aewnot3w4TLGeEUEn3vdTWxLs+FFEhTc2ylY02ph+aQTBA7VIDAoCkAyOuKWPxhuO3rpq4ZY9qj6DP2NmENJbao2BrjFQU0ESNINyEfVtgxv9k+7uPcRA+Mrq+xGoYutsMG04vH0MUDJBYfoi3Gfmdqh0jwVNANOukPhQNIxs/JGrQUCY2GVgQQiHchtUzCXwjgtFN8pPXu2aUglDJbyZTrS5rpLYG6rZpzlzkGC+Zjm/hlk91W+o0xqcRUk0YND32F8jSMZu1yk9EE3wUgTYbn2VwMl4I8JZoeVUwtwlANKFW06
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(7416014)(376014)(10067099003)(6133799003)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IAPCt7hwpqf7H1CxP6LTgfaW6cqJ4OuryZTh4/znAfe1XJVxtTKvxi7j3Ye+OTO6zsF4qnM+sMMkOERS29GOBDEZIITsPj4tSQFJIrNJFYSb7xwdMJal2AyHbrTPYl+UaXOoMMPsRUJALLZkFeYJSFqpHPS/+PLX8wNIDW36KTPhVju/6bkk54GnMP4Nhjyezri4ST7n+memGDQHEElDA13udteJu50JzSxc7E5Zbf+gVHAx/l/gx+xw8mPZQhh0bfC/r0bgnTZJdVcTJmkS7j2rkSAFQNfvh9ajN+2jeu3qEbO69952AaF/ZN6Ox7sWh8YY6Nhmjk3yAZSM0b8sSy5OVaRdumK+lZqI8F7WIyJYkSTEZdmPdXUEZnVu4/M84nghVojEQxULaWXE7YB1+OY3yQZ9g/eW81SCw18iflQ4dbxLFSaVa7H/wkReF/Iq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 08:09:19.4956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29b5f3ae-c427-404f-0ed1-08df0f12d0b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E60.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR12MB999144

Hello Xin,

On 9/10/2026 9:59 AM, Xin Zhao wrote:
> The rq->active_balance flag is used to prevent multiple CPUs from
> simultaneously dispatching active balance stop tasks. Since there can only
> ever be one consumer of the stop task, it is not strictly necessary to
> protect the setting of rq->active_balance to 0 with the rq lock in
> active_load_balance_cpu_stop(). Therefore, we can move the action of
> clearing rq->active_balance to the end of active_load_balance_cpu_stop().
> The benefit of this approach is that the task load of dst_rq will change
> due to the execution of attach_one_task(), which helps avoid prematurely
> clearing rq->active_balance before attach_one_task(), thus preventing
> unnecessary dispatch of duplicate active balance stop tasks.

Aren't we moving tasks *out* of the busiest CPU where the stopper is
scheduled?

As soon as we do detach_one_task() within the rq_lock, the load is
reflected correctly. There is no need to wait until we attach task to
a remote target_rq. TASK_ON_RQ_MIGRATING will immediately detach its
PELT signal from busiest.

That last statement seems to be inaccurate.

> 
> Active balance stop task is triggered only when rq->active_balance flag
> changes from 0 to 1, and there can be at most one consumer of active
> balance stop task at any given time. Therefore, we should never see zero
> rq->active_balance in active_load_balance_cpu_stop(), use WARN_ON_ONCE
> instead.
> 
> Signed-off-by: Xin Zhao <jackzxcui1989@163.com>
> ---
>  kernel/sched/fair.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 11c104010b2e..20d03ceed9d7 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -13769,8 +13769,7 @@ static int active_load_balance_cpu_stop(void *data)
>  	if (!cpu_active(busiest_cpu) || !cpu_active(target_cpu))
>  		goto out_unlock;
>  
> -	if (unlikely(!busiest_rq->active_balance))
> -		goto out_unlock;
> +	WARN_ON_ONCE(!busiest_rq->active_balance);
>  
>  	/* Is there any task to move? */
>  	if (busiest_rq->nr_running <= 1)
> @@ -13815,13 +13814,13 @@ static int active_load_balance_cpu_stop(void *data)
>  	}
>  	rcu_read_unlock();
>  out_unlock:
> -	busiest_rq->active_balance = 0;
>  	rq_unlock(busiest_rq, &rf);
>  
>  	if (p)
>  		attach_one_task(target_rq, p);
>  
>  	local_irq_enable();

As soon as we enable IRQs, a timer for a remote tick may go off which
may want to push the task from this CPU again but it sees
->active_balance still set.

At the very least, I think this should be done before IRQs are enabled
but I'm not convinced by the justification for this in the commit
message.

> +	busiest_rq->active_balance = 0;
>  
>  	return 0;
>  }

-- 
Thanks and Regards,
Prateek

