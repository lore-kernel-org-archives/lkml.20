Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012040.outbound.protection.outlook.com [52.101.48.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D936D352034
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761228; cv=fail; b=fG6jeys1yBATMzUG4Fn3E2lGK1DjoqdQC0ffqpiGBP9Ks2O6lUvfk9fzM30/sglDzzArjrnhYdDMrG3GKrU8QpnaWFlyenHG1h4EPPmWE3p2y7E86OVqv1vudxfAA9eeatuo03FVILXPJu+oYKjc0GYh9Zfgb3AAqeAQvKJGI6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761228; c=relaxed/simple;
	bh=uA0M6fmsVqnFa/Dh0PU+x0uGWRg8/LoH01VjhT/UAC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PfREm6AEDEnAJXuzEdWyayo7/aTbReEp089aHmlTdDsW/+b2f4yk5hTIGBnJsa7Z9HqqqlS+4cPxJrJKxT9VV+psnn6CeTpgMPqx7UUou6XFBRYOVrvIZ7KEwrIg0JKdb5knfjz+Wgmg1KdSbiZUa77RlOKRQ1gOgC5dPM5qVj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Tlu5TtWT; arc=fail smtp.client-ip=52.101.48.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Tlu5TtWT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LMwJM37QK8KwNMVUpm6bTPx4/xlHnML7ZlCQTOwsilSt/8HPo9nNjOWtPHCBMQ88r3e6G6DlrVNQik0Dv37eKH8YrElhrvrpJLnIRr5kPPOwOAlmvwQzHUYHSJmYn9o8fjquTvDri8TU11/9eEKJxTEQp9GiwZF5TnNPKpUcbNtGuikaYlCISTGOB+vIPnu97pycr8bzlRTeLyxcbJdSa8i2Ogg+r3tM/NqX+xj20UQ83iJyfPYzVZcosHKM2RtqwkfML7fp04thVNdYx8dN+43MmFQ/cuM4E2/VSqEFUr7AuXWAQpVphdB4k4wB6sSQEDpLjOzm0Ws0CGiFG4LrvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSHbhwKoQJjCRuxbHuRN8xJJKuqyqzY2vIBIpYGWkHc=;
 b=t2Q3ioyQiScYJ/qVnnhZCoBQ2Rl0B3IBQyes1peVq5s9nV84IFrK2ARtPxLX7BTypBGtCLKgHUml6WAtvIO0ZQX1bsepDOMohyhzGDcZ9Y5a98V/RM+WY8HIfRZPVvgnhgDUXBZBFJTeqYiwR2PFEsRCcVDxHhjTIgF1poQmFcEF721GsQVXunX2mo5mk7YHyz14kYG+8mo45ot2UDMkSs+CiDVZQLpKFLNrVYG2KYlUmC9YbuEMcm7ytvEj2mhGPKNADmt8Kvc2no4ae576JwJFukm+ZTZ7svHWDzTy8kKgDlJDd82YeyDBgqaz5krgEmkZ12Hw7jk7N/hByN7DjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSHbhwKoQJjCRuxbHuRN8xJJKuqyqzY2vIBIpYGWkHc=;
 b=Tlu5TtWT/LHKmoXLL+XvOIA+Q/Rz6cTVdkKof5GYZeKSgvH7bXCqNucAQ4+VaW3QDMJ7FjNSUHzSkuQGWEfiuqMknoDL5QU2n+A5G7qbzFoMMXgJKETx2mgpD4BoI/p+5/5rpUtJOr9VpcLLe+XAX9ACV5sTIqtF5DJho5IUwUL+d346rFfELY1mM+RfrRMIrBvnoSMdv3vts97yH4X6W7Bk1aj2g5jSg89WeLwygFdcxiRIuOIQbYIfJCFnWne9zzABjChrsDCCCfd6H1jiyDl59HRQov05VKlDpcigPmUQuQro4LLRWS2o2YvTBJ6sv3JR557E6ey4eUZB2QKhlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by CH2PR12MB4246.namprd12.prod.outlook.com (2603:10b6:610:a9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Wed, 26 Aug
 2026 16:20:20 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0339.012; Wed, 26 Aug 2026
 16:20:19 +0000
Date: Wed, 26 Aug 2026 18:20:10 +0200
From: Andrea Righi <arighi@nvidia.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: John Stultz <jstultz@google.com>,
	Suleiman Souhlal <suleiman@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
	linux-kernel@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [RFC PATCH 06/16] sched/core: Queue blocked donor onto sleeping
 owner for chain-wakeup
Message-ID: <ao8SOkBYH1uLh6Sa@gpd4>
References: <20260826062901.2137-1-kprateek.nayak@amd.com>
 <20260826062901.2137-7-kprateek.nayak@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826062901.2137-7-kprateek.nayak@amd.com>
X-ClientProxiedBy: MI1PEPF000008C6.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::428) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|CH2PR12MB4246:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ca188f8-470b-42e5-ad24-08df038debbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|7416014|10067099003|56012099006|22082099003|4143699003|11063799006|18002099003|7136999003;
X-Microsoft-Antispam-Message-Info:
	F83ORsfLDuuZX0wT5/FnGHdQoBdRqDwlfjEiTAy11F6errFo4mV7Z83TS4nK3qiWSaADrUb1f1YkTrUs8kLuWy9osvLORj3gnCYGq+kl2CxvRstE5OHTPUwuU5MvWCFiAD4MyAvOogn4NwnlguhKG6XsLJ5XXbJCEZ2Vt+lNIyefjk2Lg9808EZYbyaXJotz98E29EpelVMmVmvJi3mNVshhKO5P7doVNtWqXNA7PjZBCnDMMyeA73o50PtaJnbx4XXFe2K3H+b1FKvYWobYZPydbbZRNoePDTuTZRDfB2yvoPedSYP/AoU6AJ/ErZVI85x3utmLu9Yjp9tZn3ULne1vBu9VDQ9BXZlagfuu+VyyO/1zZdTkqhIzvnRla+aKRQBgQJRA4K661eyDRH0UeNpSNGSv1kyLVHlj6aDMD1Oh969Zs+bd3o3s5Ec7nfEYtayxss6Zk5hIR81/JCdz8Z9LXM0L2FHGbU93/8QoEbMBHb8ccm5PgfZY1YdmukGFy2HI3gaZSBWI8QP8KdepI6/xtItk3SW6K5kLKOkhgLBzwNzCKUSF4FSMVqAtyN9r6a5E0FNs+PfeCBqeksNjb4v6VE9+b/Rm1KPslsRZxXuDV3YJJWbKhjFdpCQxOsfuiGmgJayfjwI0Sqkc9ajZkEIeQTepgEF6A+M/QEEl26U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(7416014)(10067099003)(56012099006)(22082099003)(4143699003)(11063799006)(18002099003)(7136999003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?89DvIqj/uooiefXXSSclGNmcSzAKiGaSnx5p9wGOEChAKCHrnMUYjhW+I76b?=
 =?us-ascii?Q?Krt+8BJtpj3Mh200w17V+y3DfEIkWMGMn8BAirBtcaQZrqBEzSQ8JahfYDjT?=
 =?us-ascii?Q?nJITzqwPk/fnC+ldaU2JQhzjUDP9fWDZxZ0tsY9lDM5JDbbxSrHVlIYl29fI?=
 =?us-ascii?Q?a0LIRQTLpdMlAM5thbYFUPdXyhLMSBBx5hlhQxyK9x6bgeBcRmCra5gj/PAM?=
 =?us-ascii?Q?7skl86sm+zqDsyRwnAdzsYWA1nUNc3wugvwCIQ6P5q/YeXXjLWckACEmENaO?=
 =?us-ascii?Q?D5U57zSZl0OnDOpTalr0OsyIrg/KhKSUbKOdqMHJM8FftNhqTnwtVwSD90PF?=
 =?us-ascii?Q?N6VFOAZuJCHjN8Vza3KHt/ZmFS0vnMCGb60Elyw0NQvMUybzRsAi1H1WhF/7?=
 =?us-ascii?Q?LBIsMP9dW/Ywor812dOPK7CAvcSlOrsIiS5UfLQ3ykuawFz3iiZ06ao5iy4e?=
 =?us-ascii?Q?x+RB/rSiKHBEPp+Q9Qpj99ylEP5UWdT8iVo+osD02vwXpleENpIjb/45xTxr?=
 =?us-ascii?Q?r2pITzP24RbnM5YOSK/Z0HJA+w5DtK9vDcvvNqxwiUvpruJgibXn62ho8ToT?=
 =?us-ascii?Q?mL8iuJHClzi4yj5xgWqIlfGwaRf7eK2X6ladwnYsuG5hQeDsnb2cDaxvVBPQ?=
 =?us-ascii?Q?w8xWcMaQHux0oEI4TqS7Cish4wOkbP64VjA+bW/VTi9qDoA8fj3AyoE4N/Xn?=
 =?us-ascii?Q?wWfpdtAJMRdm+JuZkYx8BmDGRH6clnm4bnrZRneakW8oVe364clWfwFjDPXV?=
 =?us-ascii?Q?9rg3hiTmfiL/KmQcPqWDe3z1CgvUdSyOmSHPtI43VN33TP/EWqrOasAMZBvo?=
 =?us-ascii?Q?TgofbLN0tUws8A6MbmqbBLNRfQYk9QPMy1h+l4OnR1ZdmVCXysPBa1DJwTsX?=
 =?us-ascii?Q?nu0hqfgLLnVaUkOOF7xrZlpPeEeGZf9jVJq7r2FqGxx4Ar7hvWzLOXeJMMYd?=
 =?us-ascii?Q?xEo4Qi2Dzn+K30AnXQQJe3rb62hv+B29z4biE1Q7GrbavwFICke4W9QmBKbc?=
 =?us-ascii?Q?GthcX9KDox6Mgimlh3z3bXDT6whyFtMnzmmsMXo8WK5FemNqnRumbkwJ96NN?=
 =?us-ascii?Q?pkG7kWWwifTDHI6u7OtRGm1ja2hVWyTHaThKhEemlBmCwRSCeYcOMT4idbab?=
 =?us-ascii?Q?GqHUrin7x9JGtxEwE+xdY5BWaw1XYRqvt1wg7CLIZt50tv8r5XpjwMLnqST6?=
 =?us-ascii?Q?FBa6oac8qx2BgF+xLtaHtm5saNLUZiIN2h84uKHiLTTlhZ3fLiJ7nHCP68rA?=
 =?us-ascii?Q?YdmqD7NP8eeijTxsc0zP24olbsu3OoHxoucwIfa/fBqr1HvTpW8mBL6z1ana?=
 =?us-ascii?Q?Pn6opPAc2/1mf/U5RdQSjkZk+v8ZudV9KO6lrarkEKcIYU79WasOgDuLzw/R?=
 =?us-ascii?Q?HyRwMICMm8Qax6/ITWXh4wPjI+1ImJi1uECt+RpD3XlcYcRggDIy+T9UH+/j?=
 =?us-ascii?Q?4A+QhDMG673XhYj8rZKDO6R+HwEuhaueFC/rdDubwIYJkyZJjYny4iRX82cd?=
 =?us-ascii?Q?kHUvOUd/7zfQm45dB6LGngpjC11b0r6wX9jseD+xJnaIV43G58ovl1IjGZ5E?=
 =?us-ascii?Q?L6iPOhD4vv9f4LkDbDKLhwjk7LQcuuAdUTUt/+3L9myriObMeLu1VgzeX1pP?=
 =?us-ascii?Q?utLXxmx/sxD6KAWvcRJ8BepCkBUkn/Z38/vE+wIb8dBEtTqkrGhL1DgPt2YE?=
 =?us-ascii?Q?WgRS+RRCz+71VBfkfrrZCPNj4tjNaExJR3K0fP6kY/a2oziHFbZHV6mAJmul?=
 =?us-ascii?Q?BKY7H5/Crw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ca188f8-470b-42e5-ad24-08df038debbc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 16:20:19.1704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9CD4p6Lyq0oYWd+05FGpDTzSVPsusCPXqegCZ9/DjeYjDwrIG351vgVg0xc6fNY8jXlUb0TjnlkbOEzE7yBVPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4246

On Wed, Aug 26, 2026 at 06:28:50AM +0000, K Prateek Nayak wrote:
> Add a blocked_donor to sleeping owner's "blocked_head" when
> find_proxy_task() resolves to a blocked task. Once added to the list,
> double check if the owner has woken up by checking "owner->on_rq".
> 
> If the owner has woken up, remove the task from "blocked_head" and
> continue try find_proxy_task() agiain to re-evaluate the state of owner
> and take the correct steps.

nit: s/agiain/again/

> 
> Since find_proxy_task() is called with wait_lock held, which the owner
> needs during unlock, it is guaranteed that owner cannot disappear under
> us in the process.
> 
> The added data memebers in task_struct serve the following pusrpose:

nit:
s/memebers/members/
s/pusrpose/purpose/

> 
> - blocked_head: Contains the blocked donors queued on us
> - blocked_node: The list head used to queue onto blocked_head of a
>   sleeping owner
> - sleeping_owner: Sleeping owner on which the task is queued.
> 
> Co-developed-by: John Stultz <jstultz@google.com>
> Signed-off-by: John Stultz <jstultz@google.com>
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
> ---
>  include/linux/sched.h |  5 ++++
>  init/init_task.c      |  5 ++++
>  kernel/fork.c         |  5 ++++
>  kernel/sched/core.c   | 68 +++++++++++++++++++++++++++++++++++++++++--
>  4 files changed, 81 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 373bcc0598d1..bf0f4b6be7c4 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1251,6 +1251,11 @@ struct task_struct {
>  
>  	struct mutex			*blocked_on;	/* lock we're blocked on */
>  	raw_spinlock_t			blocked_lock;
> +#ifdef CONFIG_SCHED_PROXY_EXEC
> +	struct list_head		blocked_head;  /* tasks blocked on this task */
> +	struct list_head		blocked_node;  /* our entry on someone elses blocked_head */
> +	struct task_struct		*sleeping_owner; /* task our blocked_node is enqueued on */
> +#endif
>  
>  	/*
>  	 * The task that is boosting this task; a back link for the current
> diff --git a/init/init_task.c b/init/init_task.c
> index b67ef6040a65..a097c0def4c4 100644
> --- a/init/init_task.c
> +++ b/init/init_task.c
> @@ -211,6 +211,11 @@ struct task_struct init_task __aligned(L1_CACHE_BYTES) = {
>  						 &init_task.alloc_lock),
>  #endif
>  	.blocked_donor = NULL,
> +#ifdef CONFIG_SCHED_PROXY_EXEC
> +	.blocked_head = LIST_HEAD_INIT(init_task.blocked_head),
> +	.blocked_node = LIST_HEAD_INIT(init_task.blocked_node),
> +	.sleeping_owner = NULL,
> +#endif
>  #ifdef CONFIG_RT_MUTEXES
>  	.pi_waiters	= RB_ROOT_CACHED,
>  	.pi_top_task	= NULL,
> diff --git a/kernel/fork.c b/kernel/fork.c
> index f0e2e131a9a5..88f2b6e08c46 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -2247,6 +2247,11 @@ __latent_entropy struct task_struct *copy_process(
>  
>  	p->blocked_on = NULL; /* not blocked yet */
>  	p->blocked_donor = NULL; /* nobody is boosting p yet */
> +#ifdef CONFIG_SCHED_PROXY_EXEC
> +	INIT_LIST_HEAD(&p->blocked_head);
> +	INIT_LIST_HEAD(&p->blocked_node);
> +	p->sleeping_owner = NULL;
> +#endif
>  
>  #ifdef CONFIG_BCACHE
>  	p->sequential_io	= 0;
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index b4a2771eb290..e53967a126a9 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -2229,6 +2229,16 @@ void activate_task(struct rq *rq, struct task_struct *p, int en_flags)
>  	__activate_task(rq, p, en_flags | ENQUEUE_MIGRATING);
>  }
>  
> +#ifdef CONFIG_SCHED_PROXY_EXEC
> +
> +static void __proxy_dequeue_from_owner(struct task_struct *p)
> +{
> +	list_del_init(&p->blocked_node);
> +	WRITE_ONCE(p->sleeping_owner, NULL);
> +}
> +
> +#endif /* CONFIG_SCHED_PROXY_EXEC */
> +
>  static void activate_blocked_task(struct rq *rq, struct task_struct *p, int en_flags)
>  {
>  	__activate_task(rq, p, en_flags);
> @@ -6872,6 +6882,43 @@ static void proxy_migrate_task(struct rq *rq, struct rq_flags *rf,
>  	proxy_reacquire_rq_lock(rq, rf);
>  }
>  
> +static void proxy_enqueue_on_owner(struct rq *rq, struct task_struct *owner,
> +				   struct task_struct *p)
> +{
> +	lockdep_assert_rq_held(rq);
> +	lockdep_assert_held(&owner->blocked_lock);
> +
> +	WARN_ON(!p->on_rq);
> +	WARN_ON(p->sleeping_owner);
> +
> +	WRITE_ONCE(p->sleeping_owner, owner);
> +	list_add(&p->blocked_node, &owner->blocked_head);
> +	proxy_resched_idle(rq);
> +
> +	/*
> +	 * Order against __activate_blocked_task_slowpath() checking
> +	 * owner->blocked_list after setting owner->on_rq.

This should be owner->blocked_head not owner->blocked_list, right?

> +	 */
> +	smp_mb();
> +
> +	if (READ_ONCE(owner->on_rq)) {
> +		/*
> +		 * owner has woken up and may miss activating us.
> +		 * Remove ourself from "owner->blocked_head" and try
> +		 * find_proxy_task() again considering the owner's
> +		 * new state.
> +		 */
> +		__proxy_dequeue_from_owner(p);
> +		return;
> +	}
> +
> +	/*
> +	 * Owner is fully blocked. __activate_blocked_task_slowpath()
> +	 * will see us on the list during wakeup and DTRT.
> +	 */
> +	block_task(rq, p, READ_ONCE(p->__state));
> +}
> +
>  /*
>   * Find runnable lock owner to proxy for mutex blocked donor
>   *
> @@ -6962,8 +7009,25 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
>  			/* XXX Don't handle blocked owners yet */
>  			if (curr_in_chain)
>  				return proxy_resched_idle(rq);
> -			__clear_task_blocked_on(p, NULL);
> -			goto deactivate;
> +			/*
> +			 * If !@owner->on_rq, holding @rq->lock will not pin the task,
> +			 * so we cannot drop @mutex->wait_lock until we're sure its a blocked
> +			 * task on this rq.
> +			 *
> +			 * We use @owner->blocked_lock to serialize against ttwu_activate().
> +			 * Either we see its new owner->on_rq or it will see our list_add().
> +			 */
> +			WARN_ON(owner == p);
> +
> +			raw_spin_unlock(&p->blocked_lock);
> +			raw_spin_lock(&owner->blocked_lock);
> +
> +			proxy_enqueue_on_owner(rq, owner, p);
> +
> +			raw_spin_unlock(&owner->blocked_lock);
> +			raw_spin_lock(&p->blocked_lock);
> +
> +			return NULL; /* retry task selection */
>  		}
>  
>  		owner_cpu = task_cpu(owner);
> -- 
> 2.34.1
> 

Thanks,
-Andrea
