Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010021.outbound.protection.outlook.com [52.101.56.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7C34CC635
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790007291; cv=fail; b=injhhI7Xux3cscoH78ASdiVgur72/wpbfkYTcU5QLqzfwTtQkKWTkYnpJJsiZxF51RnsAx4FcEnY6YTgh8gwaK9w/ij0AodKejcyyYoKUIHTPCi9P/aJ9MNFL8OtmC8oNxzI6Kts5mzrJ8YoUKHvuYXnbsTzKeHmLXgl8Kq5fw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790007291; c=relaxed/simple;
	bh=8za191T2BT8yqp67VW0nTBUQ8cb4SGy1ZKEWwdvOhLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VupXbxOGubpu9FRI79bciggSh9fVDwXKZKdXG6kW8KsUDi+9/eOht1IO/lQawmtA9SH5ot27QEUu9BPcg6ZKgk+qPAyGJdwXKLgwT0l93YzDUfuoQKtGuT6ZguJrQfzhTjqtL5Vsz05Td28IjQCH2wyWHpxGpRpZk6q4AhqcZ58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fd2s1r9t; arc=fail smtp.client-ip=52.101.56.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fd2s1r9t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A6bjn2Dt53Hiy64R8Q1numgrGOFeKrR/AdU8LEMh0lz3PaRagd4zDC6y5myITf9yLieUGEPmmx/C5RBVp0QRCNkt4EZzAaf0ltTt32M+51+Vd7+4URUHP4whvkWgUsIqIs2o/PaKfwcqSPtqFdcVXz6iMOhZ6JY0lw7ljbVoRg2hshwJjyiST4BwIPRdq1nlC5Xj4LV/gD5cELAKF4nH8sOL3WZPPWJgNQZO3DPWsdZ3yVLxgRdUYmD41cR2o3Hb+TX5Hw43mIReSZvpf7Dzv9PvSwv2o5wqonakh9BC+eaTIo9QLHQ8ipX9ci1aNtvcgn8l5GPRGXmsqMoYT7ARRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41P3gI6m19CMST9NxSVmilX2LLcr92tNyUnongMrNE8=;
 b=YTtpcF8hi/BxJ9IiMyvF97vdcCoxTAr+2YO/z5NNnNMkX3XRtyzFjSQrKw+1QCjRU4I8nNV710HI7NuiyH+nhc+q+p8FrzDxupkOaNwQT86jwlkgxyaFQeGZiac901x4gPsgtr58TeTZOxF4o2FE/CaF2H9FQXxra3Z6/HruMjKBobnajGfMppAhEcEB4Te1Mv4gal1Uy2sLi40IyYsq/+5IALBuS4DmczyViSFGezdh1vVO1YRUe0pL9o4haqgF1lTU/g1/W0wEU0EtBsD7HfW2unWtQDNZvhp/BQlDEC+aoz7TXgIBJZMStysfomJFMIGuySqkcpf5zcLxcQqbzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41P3gI6m19CMST9NxSVmilX2LLcr92tNyUnongMrNE8=;
 b=fd2s1r9tzulMuwBF5OfOlh3wy+VdpHcompIIo578m7RvMgQQbinBwMznaN/J1qI3AViOHiPjCR2FQc2scjt+GxHO2BPcpnTrBabFt5hipod2sx7ubhai9tSx9QYp3fa2DVXPtVamQEi1pDAit3RDGUPurMEneSU9TsLMbRuwqZSKUll1I7cNMnSQPVnPXHdboYROHji7zhFfp2/YhcLD3Gk6hDYeJYJg4kIbwxBSuu1ZJho0tUCg8nVkgo1zuCQDNa+y9DXsao0MgeT1ADHxJxz5qpO17BNbo317XRFC+HvAai8ZHFX6Iw+zwT/AYRvW1fA/7kuzbwBYMfHRpTHrZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by BY5PR12MB4113.namprd12.prod.outlook.com (2603:10b6:a03:207::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 16:14:33 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 16:14:33 +0000
Date: Mon, 21 Sep 2026 12:14:30 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/fair: Rework pick_task_fair() control flow
Message-ID: <arFX5lm1QRmLJSZj@yury>
References: <20260909181712.1050224-1-ynorov@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909181712.1050224-1-ynorov@nvidia.com>
X-ClientProxiedBy: SJ0PR13CA0125.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::10) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|BY5PR12MB4113:EE_
X-MS-Office365-Filtering-Correlation-Id: cf549c11-a242-4971-3b3a-08df17fb6c2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|23010399003|366016|7416014|376014|10067099003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	MbZNse0g+SG/J6I7L36uiMMvFhpxKZMQN/S7Ruyf2sdUIptWCoLyEAH2r6ASCEYybLWQNj3U4bfSyq+J1vcPpCo27FS+KDCc27GEx+7GD0T6Ws6NpuPjRfC6l6BGoTXfyxyv1Q3W2NlZxr9nrXmg6rU1BvA9paVmulgMPll0wzH6CiSGAJDyKMBg6U7zInIor41EU3Hb2u3oHXOoHMo0MLtYYX7cUeqw+nvCqXi1hTxYvl2cnx6GbBH0FSVcxK/inDXWdbRmhsxs7OIVPLHyqkpDJEy3yH6PFj0Q3H+5ftHKc+l4XpZ57x8lU2QeTJxMv++4jcLlpnkszNVjR71KMT+BrfgbW3j73Zn6kjGRcq+QU/KOsgYNOpzQ6mdimnfB8Yu489p1h15HpjhnBSBip7L810FS36qpZVV+wG/uq57X83tLIWjhoW/ClFNdCwK6CbVC9rCRd+PBydqcX901qR40LzHgmdYyVMDyk4ydDWwc4hbMfPqxD1GFiHWoH8/oMV+fgfQZzEBMtpMM+qYUKQ0rtJUX2Bi+fSVdyo6FQ3WeQeE0NYsiQPH4/zmKtcdtRNlSSF93Pl3Q1mlsCAgxSxKEPuIojHyJiV5CuAeQHDD3eo3aq/3yKwBJgYiNBLP2iWc/a+syw9Vcp2kchN3hT7o2OQd+gjdUJWQiEaCFKoo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(23010399003)(366016)(7416014)(376014)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tY8hfX7X6FYVB9ZSo+dkxVBqBtNSbGlXDrncTpWWSQlIxoC6iZVb7tQvVPj9?=
 =?us-ascii?Q?rrLXRR+BQBkSPUixopDruJSKQebDTsUCRRkdPquNO4b1/rXeMnx3yt3OtCfk?=
 =?us-ascii?Q?V5EdNnFSV5HelKU12Zqp/c076N7PELQ1dyscpt9q+Su6932gwKtVhFnzFggx?=
 =?us-ascii?Q?bBxuh7mZit3o+Ia/7rvotd4FDk/asTo+vNy2k0hqY1IKBG5rEKBn+YYSWLQF?=
 =?us-ascii?Q?JcLuxAc72zBJVI5gVOAQ5q0wlJIXOKfs+v8impUSkTmCBErKzQT9NK8ro5qq?=
 =?us-ascii?Q?nCvZSyT8FgoDiZLB3fJE++ENJ2+traipQWYpCVbMgN0MKMvKa6dLuK4gww5L?=
 =?us-ascii?Q?sYS5d8ZZjpgplWHn1MV2f+rujnnViPEn7d1uTzDD2GFP143JVKpI9E99NEAI?=
 =?us-ascii?Q?vumbP1v+c9ku2hqm6VKfWzo1wbc3zvetnXQicqMeUi/SbULf0aiSflXFicr8?=
 =?us-ascii?Q?y/C7fclAjxVmpF5wJMJTmgfRGIaZ77cFSkse8o0DYGcX0xnpKhYkWBJM08fk?=
 =?us-ascii?Q?4d9rdsS3t7IvuNqBfU8uGe2i4vUJSBukK2C4Cy1nB5yZ2h7ZOFdajo++MSr0?=
 =?us-ascii?Q?5Wh+3rdtrxy97bN1vPGoPE+zwtZ1t5TOSsuXnKRcykgxEHPRwbU9ArgOfqJP?=
 =?us-ascii?Q?dkPj+JDX5aARV6bt08M45JubIKfewp42Tqf0ejxTTkC7eXQ83t0KeLFL5lAk?=
 =?us-ascii?Q?p7sZNiix1VKVPRrPrGbXmHH9nmZNkHJ6AFjsKpkkNdRq+BaMPSRV8ABakAWv?=
 =?us-ascii?Q?1fv9bk4mXDFd2XL+dAL1MbO1HUOdLr3mLYzXFkmbDhyPcyfOcbH1NtyD0r4z?=
 =?us-ascii?Q?J8RWtcY+tzaI8BTUsON9RmHJgeJLBtIfiS+zLXLbOUrTNdJ+eFNJ2FpsYSZE?=
 =?us-ascii?Q?xDxNBd5CVizdpUHg+XWnabd+lDK2GtBaZjJqrG0r+giLK3F0IFHViLkmDJSq?=
 =?us-ascii?Q?dXYZD0fBmNCimr05EePnAXe7t9I2sLTu5X5Jdl2EQSgDbaAzvtbsQyKzRc4C?=
 =?us-ascii?Q?glW3zlKVlsJ9UG8SDfRFwTIpy0jNALAjhdpEKpDnMteK+/TBy40OteERhmpO?=
 =?us-ascii?Q?FoTjo1UilqyyoYDxC2HnsTBqu+iszC44FVJWnFKkYwEgQ4zRWg31FmencQsI?=
 =?us-ascii?Q?RKRo/AVj2uwutd5fyJl9mQPAN35dWV1ChGi32Zmh9oea9ivfJxxPZmUr+yQP?=
 =?us-ascii?Q?FYpUxbm23myvjfj9hPwPOXKlhtbux47X44ky0V8QXtWpXJsYaIAOadd37ZZL?=
 =?us-ascii?Q?GqvnbwT2khhVCr+VZ2dyMHyu57o4MypJoOnHT6Ft/oiPD0SYHq7qWUWygfn3?=
 =?us-ascii?Q?NlUX+A8pdwOf2OG3CWPM8iJbGAuTXF6hdw4BTe3Om4sEOZ6quyMLEaXEyqxG?=
 =?us-ascii?Q?9kv93k5wEYoJioZa5jMZDBzxAAyJq5DVvOIHyg9iEwHliUTpvYGJQrW9WgfS?=
 =?us-ascii?Q?5TKE9CW033C2BX5Lo4y6ugMvPns27EiizkCmTOltSvGbN0fwKdeio1YB1MHQ?=
 =?us-ascii?Q?iYYT+YJ42FZ74/1otPigU9TkjVEEOfiKPRadKZGvto/I8B3XQU8Mvcq7e8qC?=
 =?us-ascii?Q?9cjYDh3ftIQqeh61m3AVFZsfWmNJc/tfnXDt9j4DZY0q2v7a7gvB1WEEFvl1?=
 =?us-ascii?Q?9uhOB+n0m1S5xVyRIofRM0e5+1jMLVkTN3u6I7M3aOFpqsx1CO+bRtMt+WQj?=
 =?us-ascii?Q?UYEtQ7BtlBHbgNW03KMvZlqS92XI2JbRaPi9SPPlH59wLuqQoxvZVHDRwEFH?=
 =?us-ascii?Q?LVJGleRCUgLbQ/GaJd031B5uCfDRltooA0GI+rLDu70JJmDh7uIBJqCHuOWm?=
X-MS-Exchange-AntiSpam-MessageData-1: HQGjmFLiAPecdw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf549c11-a242-4971-3b3a-08df17fb6c2e
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 16:14:33.1743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mu6ol2hXk3YaCqAQAIXqJcOlIb+EY5CR3yIG+w8/OWLajb7Z+QjCxGnwXQPYoKA40unS/hyuIcU0WA2r5D01GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4113

Ping?

On Wed, Sep 09, 2026 at 02:17:12PM -0400, Yury Norov wrote:
> Split out the logic picking a task from rq to a separate helper,
> and get rid of the gotos.
> 
> With GCC 15.2.0 and x86_64_defconfig, the new version saves 96 bytes,
> and with defconfig + CONFIG_SCHED_CORE + CONFIG_CFS_BANDWIDTH it saves
> 124 bytes.
> 
> No functional changes intended.
> 
> Signed-off-by: Yury Norov <ynorov@nvidia.com>
> ---
>  kernel/sched/fair.c | 51 ++++++++++++++++++++++++---------------------
>  1 file changed, 27 insertions(+), 24 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index ade1eceb39b8..ad0c477e58a8 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -10043,39 +10043,42 @@ static void wakeup_preempt_fair(struct rq *rq, struct task_struct *p, int wake_f
>  	resched_curr_lazy(rq);
>  }
>  
> -struct task_struct *pick_task_fair(struct rq *rq, struct rq_flags *rf)
> -	__must_hold(__rq_lockp(rq))
> +static struct task_struct *pick_task_fair_rq(struct rq *rq)
>  {
>  	struct cfs_rq *cfs_rq = &rq->cfs;
>  	struct sched_entity *se;
> -	struct task_struct *p;
> -	int new_tasks;
>  
> -again:
> -	if (!cfs_rq->h_nr_queued)
> -		goto idle;
> +	while (cfs_rq->h_nr_queued) {
> +		/* Might not have done put_prev_entity() */
> +		if (cfs_rq->curr && cfs_rq->curr->on_rq)
> +			update_curr_eevdf(cfs_rq);
>  
> -	/* Might not have done put_prev_entity() */
> -	if (cfs_rq->curr && cfs_rq->curr->on_rq)
> -		update_curr_eevdf(cfs_rq);
> +		se = pick_next_entity(rq, true);
> +		if (se)
> +			return task_of(se);
> +	}
>  
> -	se = pick_next_entity(rq, true);
> -	if (!se)
> -		goto again;
> +	return NULL;
> +}
>  
> -	p = task_of(se);
> -	return p;
> +struct task_struct *pick_task_fair(struct rq *rq, struct rq_flags *rf)
> +	__must_hold(__rq_lockp(rq))
> +{
> +	struct task_struct *p;
> +	int new_tasks;
>  
> -idle:
> -	if (sched_core_enabled(rq))
> -		return NULL;
> +	do {
> +		p = pick_task_fair_rq(rq);
> +		if (p)
> +			return p;
>  
> -	new_tasks = sched_balance_newidle(rq, rf);
> -	if (new_tasks < 0)
> -		return RETRY_TASK;
> -	if (new_tasks > 0)
> -		goto again;
> -	return NULL;
> +		if (sched_core_enabled(rq))
> +			return NULL;
> +
> +		new_tasks = sched_balance_newidle(rq, rf);
> +	} while (new_tasks > 0);
> +
> +	return new_tasks ? RETRY_TASK : NULL;
>  }
>  
>  static struct task_struct *
> -- 
> 2.53.0
