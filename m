Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011000.outbound.protection.outlook.com [40.93.194.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6DE4F3EB9
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790615990; cv=fail; b=ZfFzUI4Q5mlmPDJ6zOqepREW9VjxkIl7kpZnsTgytIQq9JT822iRiKpidQjStHv2WEtTDVo4+svqTVLKQmnX6bNMOR5gQSN4KkVlntOVD7ZYgPnPhIAwoYIJkYstJu8Vod0tD4LREPzpXm9cAeGfMGIXic94WmpQX68HVfbnX4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790615990; c=relaxed/simple;
	bh=04LLXglSyn6qM2VtNnUXs6+yCiH+n/m2wI6koUurWug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MHlUf9yylKZ0wpnJ/tohr3qIhphkOHo6jxCUVCpsjF7Bu9Dm8RZQ+dqNTLaLB9OdfjBJsNjvGGeD3yUaY+G/SNgE389lmITCada75QmaPrrl3W/NCqCECIz3Kg85/kappzzo835LL99p4JS6mU3SCVAPgPDsorkk8rZQqgLzmyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KnjPPNH6; arc=fail smtp.client-ip=40.93.194.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KnjPPNH6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dXrscFWxq2S6m893eqx0RDLKTEIBsPSVmKWRqK6Q+1DEgf0NdkwaW2aDstBNDlSY6F0rLZZyfgg3uY+vO8N1reqctVgBOIm29mDo5jH0/Rx9i78U2JTTgUkcmlGhBkLsTH159/vGgEXXLHLlPLUH6TlKAiWzNMRMkSSIyrpMnZ+HRSFKLZJHlxX70lLKYV1IhtKeKGmmtwx+43EgHxOxOiHNZO2+2XpkZI+dHobTDBGzZ3NGqT84gxQgwpFqqdr5/baf/D6eUkmk+BxD/8fQafTo3T89UXVQkCxdQbZLEPKeZk/Jyy5zfoHYiIYi9KeOhaHG9MhUNtf3yVGgzyrRBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZtkim0TEt2R4BVatTpczKpUCRFTCWcw7PTbfeeplgU=;
 b=hVQr2z4/ToGByltiJUWVDeQqAnDQBDDJcw30VWBD/3XmYBHao2oaRN5keVVBitZVgVJ0asXwd2Fsx2eosW8Uyw8VMeKcFi3rwXqkrrFfp1wsVjS3oM3EO2CDthi194Zvj1+JzDs10E65bmpwmZVNgM+2DbvTb/XEgsXIdec9dCnrsPPwR5IUPVTpfjpPWitdTan/NoFLU3UZGHylCxSTtFidUcnTvBrsvC9dgDybrUHm89GTiHtnyajrjN2NWybUmTS/vCMnLxcm5VcAGKzGmT0NKY1KQxRucqlqomlcrTRp+VAPNDQBj/BrAlxKzEvSiGsYqihn0sezY4vLeT08Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZtkim0TEt2R4BVatTpczKpUCRFTCWcw7PTbfeeplgU=;
 b=KnjPPNH65nT0g9SIaqG24ABZj0BbmnYMC2S2/diMb8c+7WufzeMy1VfSvlePt9dcxymodjnFWSz+NtJhUZ3MGkyehyTrGGUbm33hNaGXSovPDyLv+wM+sl5hR/H/A1xyM+R3nmAmhgu0sTx1cearlq1XQRluaY+Kynf3hCwilvac86qcCT45qE1bPv1U6MWNWz+6RsoFzkpp8+lBbtG/LmmIe6eST3jfRzYajdXLK5eneC0ytvRhLMPuq4XIxZg/lFty/oSBUOzeX6KFj6lv65ENGmfmqcMKdWUR5IyIFZ0xPz4Py+Q/LH5g3Un9L98dfqUfCV8XILRZl55984Sukg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by SJ2PR12MB8739.namprd12.prod.outlook.com (2603:10b6:a03:549::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 17:19:38 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 17:19:38 +0000
Date: Mon, 28 Sep 2026 19:19:26 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Sechang Lim <rhkrqnwk98@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Gabriele Monaco <gmonaco@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] sched: set TIF_NEED_RESCHED before calling
 __trace_set_need_resched()
Message-ID: <arqhnt6lW8qiCo19@gpd4>
References: <20260630084750.2792851-1-rhkrqnwk98@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630084750.2792851-1-rhkrqnwk98@gmail.com>
X-ClientProxiedBy: MI1P293CA0019.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::16) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|SJ2PR12MB8739:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b8eacbe-54ae-455d-3d63-08df1d84ac5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|7416014|10067099003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hNrQoeCrnsrwM3EHHR+TN0JQo2EmvLZSE2WUn4xG03PFLaM6G917acfhMQ7U/8WqTTUkuiznUiccLdoalDHPm6dfO8W/ZJFtADaAWeVle6ePdC7nOZ7Kyob1G+TyqJcOJsHIxrt34jpeNDwH5ZlWr5cTOPX/6F7G/Vh/oycuiTnP1T/Fp8M2zttFO/I5HdW8cpzAsADM9n991QTCYdstjWu2AKTpZ1qD80C3rRQG1iGYU+57KnAbFmxio+qICw+/G2yPCCIqP87k2nneZLyLTCDH/h6Ut8UaMuAUMXvxVL7+WWqJlK9qdJsSsCxTMJ8TR54z48e1pFHWiBJkqAsCYXYn7SDc/opUHTqucFjONP7Maznd4BomhtzHMS9xPyVs880Z51MosNxRivSrhs4b83FoRSJhAteaax5O8lMxh48ENsRspg9EKubNEZ8qEcpzmJoq6Yf473yXiWt1Nw35Xifv/baeSEqOaMYb6Js/9zx5oD+0SEmjgTJCsKW96GPEPW1FX4pctxhTxmCtKpjpSMB3a80ZGRVjSzemmqDP4T8fnSJePxPBHQB1mjAAJWD3aBiy7qqJ8erf31H6t59vb3mD7EIGlsdLUBhl0tkcMQdMHzT+Y7NABgWavh/v1OfdcyIM1q3auq43Rbbd+OLWvsZrO8xYXurDEz7+ROEmNlE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(7416014)(10067099003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3QpxCrwRf2t3WEzq1vZNDhQB5o8ipS3MmTvUv4ueSLTe68KfUi6vn341ZRJJ?=
 =?us-ascii?Q?Ypyp8y76uwCcNhKrJ5giwFmenZhFPgerLFy8D9dLk5ptmW2UeJEuvpxyxuDy?=
 =?us-ascii?Q?3c78GczoAEviEKFrxne00KwAGRKSYejppmTXHlfQRh2PSgmh1FomaTTHFhXX?=
 =?us-ascii?Q?p+abrst2TJ9/VMU6OXqoUntge4cBuXnn+8iZ1uZbwguEnTGxotodfZuAitkM?=
 =?us-ascii?Q?WPb1n6ro6e9TUzp6pEw4yMceytBOI/XufEh7Gsa2dfzcbqfwtUtu5xX8dwjk?=
 =?us-ascii?Q?+YdXHRDDT1T56pKk7/NduxnYilXQq3y1gGqZFEQBIqmTQQ5X7CgDfSJd1R0g?=
 =?us-ascii?Q?JpnrnGjDQxILt0M9ouD/L460zWSQRXd49vGDDxx6Ixp5LX8VVMBWZoZkzctu?=
 =?us-ascii?Q?qNzbMnnki6aczWpezWzjYtgVXEpNmLhstcYzWZM5tnBC4XuO4XG9F+9U+m03?=
 =?us-ascii?Q?+h6e7Fcmi8HMjoreiqRgnINDONGZJzr6BSyrwkljao3eX/JgHhWFfL8Y7m/p?=
 =?us-ascii?Q?o+8U+cWMbn8pci3dEIEsRso00QgOUrVXokqQBWHDs6MDy6Mvqa/GXLBtQgPw?=
 =?us-ascii?Q?2ThcKRxGTO8mjwLoelEVBKrZ/+sKyHdaybz1FAdPMcRguCi/PCuVKu5KVGr/?=
 =?us-ascii?Q?ftL5OF3oAUvg5DsBJY0Y1J1gDKz4ZZ1t4UNWkRwK+jyamrAnxMYh2V+hf6xg?=
 =?us-ascii?Q?7Tuw2zBbRRR8G21H4P7TlngiwG5J8j2IzOp2YjLEk/Jzy5HemAgeWMA2JYm/?=
 =?us-ascii?Q?sejJ2MiaoCXywzLo72YPOAY/mxSUhIFW6rtWaKCkobg+AWBQbzwH0FcyUkjx?=
 =?us-ascii?Q?LDZIOPSyawRT15kHBKR6BnmbLAHdujqjRZIRJz80sSoMSROy18bMYVjZxIrL?=
 =?us-ascii?Q?cp/aDb9cQjnkgdl7DRObl3hXfJyuS5UrvvIOoBVSvNiY48Ph7RmQPJcYju6B?=
 =?us-ascii?Q?W3hxpUCxTaojjXuzWpSW9nEJAXR57Wpj/zrqfCB2fdAS1vV+ehzA3uKCPNZf?=
 =?us-ascii?Q?UloGS3/i7Iqdkp1Usf8nzVpCv6hExsLJJO3wO4fQGlYbkmaFA5IZDaeFm0hW?=
 =?us-ascii?Q?uDd6eeePFNALWt74QZuJku5vbQiP/mhVKiR0hTjnTW+OcmDfZJXOJzCLauBq?=
 =?us-ascii?Q?pIa1kXViVKbjx26vpr0LLdIASl3lY5OJBJFUgJ8NXbZcyd1qRfsM8jxHbv8s?=
 =?us-ascii?Q?KNHHb6FTJ7GXatNu5vELVaD6PGrFOdhTGx/5M1V7aJ0T/JT7YsH4jhCoDJHk?=
 =?us-ascii?Q?/kjbQgsRFgg9VEZqrKAaUkEVgKXumjFW0RlSc0bFEtlqb692J3HsX2PNbesR?=
 =?us-ascii?Q?mEk0NUZMTIA2nEiScLh/Y/U8qNOddg+9MJn7HnDilqUeNrcFi+DyX6VF4QAa?=
 =?us-ascii?Q?Wss1ze516+O6rvRqzApdH3YQYfB2/KdMm44qeKoG6CZU3vJL6owfwaZY8yf0?=
 =?us-ascii?Q?nN/f1V1yB1X28diqUT1r+A8gBz1KmzKtXmR+6ltRXdp3l0ylbWjDmhOq5cPX?=
 =?us-ascii?Q?iXEB/jYS/jGXMuPHrizQoI9L2MP1EWFHN2+9rHCB80TOVComJSRfqSXRk30y?=
 =?us-ascii?Q?f9Xd/fGGIiQPRy7TWJPAY/ofGB8zF7XTxB66juvl9Jx/P0edt0QTnKN7Ozp6?=
 =?us-ascii?Q?Yrm0JYozonGbHRbnz39c5UlhzSXUzjp/FXph9Y3yDQYrNFBytPJ3QcaGEAec?=
 =?us-ascii?Q?1rMSciYI2VIpURO7Gd/W6emxsUJalx97j9jQdkGv7Jn2var2QB20ImD6g9Tk?=
 =?us-ascii?Q?GF9uwRhLGA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b8eacbe-54ae-455d-3d63-08df1d84ac5b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 17:19:37.9780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RZYlUyozMDIuDB6fh8amIF7IZV+zCjXawowU3YTC0d3kr8OyWMN9e+dpkS+N+vggQ0qOSjUQLzVC4k8/cdY5lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8739

Hi Sechang,

On Tue, Jun 30, 2026 at 08:47:37AM +0000, Sechang Lim wrote:
> set_tsk_need_resched() tests TIF_NEED_RESCHED, calls
> __trace_set_need_resched() if the flag is clear, then sets it via
> set_tsk_thread_flag().  A BPF raw_tp program attached to
> sched_set_need_resched executes synchronously inside __bpf_trace_run().
> On return, __bpf_trace_run() drops the RCU lock with
> rcu_read_unlock_migrate(), which on the preempt-or-BH-disabled path
> calls set_need_resched_current() -> set_tsk_need_resched() again.
> 
> set_tsk_thread_flag() follows the tracepoint call, so every re-entrant
> frame sees TIF_NEED_RESCHED clear and calls __trace_set_need_resched()
> again:
> 
>   BUG: TASK stack guard page was hit at ffffc9001224ff98
>   Oops: stack guard page: 0000 [#1] SMP KASAN PTI
>   RIP: 0010:__bpf_trace_sched_set_need_resched_tp+0x1c/0x190
>   Call Trace:
>    trace_sched_set_need_resched_tp+0x110/0x130
>    set_tsk_need_resched include/linux/sched.h:2076
>    set_need_resched_current include/linux/sched.h:2094
>    rcu_read_unlock_special+0x43a/0x440
>    __rcu_read_unlock+0x9e/0x120
>    rcu_read_unlock_migrate+0xa9/0x240
>    __bpf_trace_run+0x131/0x180
>    bpf_trace_run3+0x333/0x430
>    __bpf_trace_sched_set_need_resched_tp+0x13a/0x190
>    trace_sched_set_need_resched_tp+0x110/0x130
>    set_tsk_need_resched include/linux/sched.h:2076
>    ...
> 
> __resched_curr() has the same ordering, firing the tracepoint before
> setting the flag via set_ti_thread_flag() or set_nr_and_not_polling().
> Fix it for consistency.
> 
> Replace the separate test_tsk_thread_flag() + set_tsk_thread_flag() pair
> in set_tsk_need_resched() with test_and_set_tsk_thread_flag().  In
> __resched_curr(), move the tracepoint call after the flag is set in
> each path.

This leaves the race Prateek described in the v2 discussion: a remote CPU sets
TIF_NEED_RESCHED under rq->lock, but the target CPU can emit sched_entry_tp()
before acquiring that lock, ahead of the need-resched tracepoint.

I reproduced it with this applied to tip/master. With the RV nrp monitor
enabled, 300 runs of "perf bench sched messaging -g 20 -l 100" produced:

  rv: monitor nrp does not allow event schedule_entry_preempt on state any_thread_running

Applying the following on top fixed the ordering, the same 300-run test then
completed without an RV violation. If it makes sense, could you fold this change
into v4?

Thanks,
-Andrea

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 639b5df7cf130..91a15a4234280 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7143,9 +7143,6 @@ static void __sched notrace __schedule(int sched_mode)
 	struct rq *rq;
 	int cpu;
 
-	/* Trace preemptions consistently with task switches */
-	trace_sched_entry_tp(sched_mode == SM_PREEMPT);
-
 	cpu = smp_processor_id();
 	rq = cpu_rq(cpu);
 	prev = rq->curr;
@@ -7178,6 +7175,9 @@ static void __sched notrace __schedule(int sched_mode)
 	rq_lock(rq, &rf);
 	smp_mb__after_spinlock();
 
+	/* Trace preemptions consistently with task switches */
+	trace_sched_entry_tp(sched_mode == SM_PREEMPT);
+
 	hrtick_schedule_enter(rq);
 
 	/* Promote REQ to ACT */


> 
> Fixes: adcc3bfa8806 ("sched: Adapt sched tracepoints for RV task model")
> Signed-off-by: Sechang Lim <rhkrqnwk98@gmail.com>
> ---
> v3:
>  - reorder need_ipi variable. (K Prateek Nayak)
> 
> v2:
>  - https://lore.kernel.org/all/20260627081657.499781-1-rhkrqnwk98@gmail.com/
> 
> v1:
>  - https://lore.kernel.org/all/20260625065656.392182-1-rhkrqnwk98@gmail.com/
> 
>  include/linux/sched.h | 5 ++---
>  kernel/sched/core.c   | 7 +++++--
>  2 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index ee06cba5c6f5..c9efd08dae92 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -2071,10 +2071,9 @@ static inline int test_tsk_thread_flag(struct task_struct *tsk, int flag)
>  
>  static inline void set_tsk_need_resched(struct task_struct *tsk)
>  {
> -	if (tracepoint_enabled(sched_set_need_resched_tp) &&
> -	    !test_tsk_thread_flag(tsk, TIF_NEED_RESCHED))
> +	if (!test_and_set_tsk_thread_flag(tsk, TIF_NEED_RESCHED) &&
> +	    tracepoint_enabled(sched_set_need_resched_tp))
>  		__trace_set_need_resched(tsk, TIF_NEED_RESCHED);
> -	set_tsk_thread_flag(tsk,TIF_NEED_RESCHED);
>  }
>  
>  static inline void clear_tsk_need_resched(struct task_struct *tsk)
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index b8871449d3c6..19de28f0d85a 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -1171,6 +1171,7 @@ static void __resched_curr(struct rq *rq, int tif)
>  {
>  	struct task_struct *curr = rq->curr;
>  	struct thread_info *cti = task_thread_info(curr);
> +	bool need_ipi;
>  	int cpu;
>  
>  	lockdep_assert_rq_held(rq);
> @@ -1187,15 +1188,17 @@ static void __resched_curr(struct rq *rq, int tif)
>  
>  	cpu = cpu_of(rq);
>  
> -	trace_sched_set_need_resched_tp(curr, cpu, tif);
>  	if (cpu == smp_processor_id()) {
>  		set_ti_thread_flag(cti, tif);
>  		if (tif == TIF_NEED_RESCHED)
>  			set_preempt_need_resched();
> +		trace_sched_set_need_resched_tp(curr, cpu, tif);
>  		return;
>  	}
>  
> -	if (set_nr_and_not_polling(cti, tif)) {
> +	need_ipi = set_nr_and_not_polling(cti, tif);
> +	trace_sched_set_need_resched_tp(curr, cpu, tif);
> +	if (need_ipi) {
>  		if (tif == TIF_NEED_RESCHED)
>  			smp_send_reschedule(cpu);
>  	} else {
> -- 
> 2.43.0
> 
