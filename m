Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013026.outbound.protection.outlook.com [40.93.201.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D880F463B8E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188882; cv=fail; b=tcXJtjKaLq+fY9L6n6GuyXT//7m5GUsknMYfJ2OGnIsdDJOGaQYTwzrLETyCn/FOIGObO1IUesZif6OlO6Dte0W3uiNbflFRInHG+FF8eiEJD+pE6MGIgrLqdpMjASCu+bb8x8G7xsoVx1ksCkhFkvszE17lKhGWxhZnkR2url4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188882; c=relaxed/simple;
	bh=vTD0ceMw4VjgJWBWGbFXVO6QFiX2Op5kgCZbVlGzxJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NxJec/iPBG9H7c0t8GrqP7FcF4l09TX+Sk3uMBhCK1r/U3It7Wv8UAta+KTTo3BI3PRIMkemulLuBEIlUPvRaET5XmwyeOCx4y4FcqZv1McAs7vV0xRfYGZDF5Kbap8u4OVR1zr/vyAr4tw8aisg0fBrryzNg0lPm4gRPjmyQ98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=T5+ghQ+a; arc=fail smtp.client-ip=40.93.201.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="T5+ghQ+a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZ7uvx6gEKsehl9aJr7Pb9UiYyVP+gUJh8e0AxASaWlmv1KbQUw4htKSUxzLdufpRIPh565wPjDk4FY3IWBfQp+Eiw2etJ/GYlv2zv3zGALdQ1Zi3ut7B0/smRoiBm+x95e8y4rD/Gwm9XfqJa1gPHx8SNrVHhVpuFGodV5kVutaEJfspDep+PG0pYzxq+bYgsdUhOdMq6Y2ZOwh6MCcltNZ05n9+VVFHHIDxSshCXiFoeAHJKwuDMOt+jPP/YPAYO92zDOvltyJgVzQRW3BG6xDbhOtjeDCeJ7Q2S+aKXYBkMCzCAi2QJCLbtMUBF87qZXw2Zszxn1f487sSNa+Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvLiEhEsvlT9sEKzRybh+S4zhJmb4WMDr2s1wYyPSYI=;
 b=RksX0WXnuWaa/QaV0IaogF7iHRXUIjYDoIDnDZ7OLFJsGV5esFm5n8x1q+ZmGAKLAEvZdDJ3Aj7HLJNFMffS1N/d55CzdA24B0dLFkAGI0C9Mooiq4tbQbusHEqy+FFOjUK2qtlTNVKsjcjVcEhGIk76qHx3Xf/fyBhJHjJhTrQMM9z8xF6LHfjgv8+RkVB20nQZIPwGOOWjCEYD2H7LoQUMITdNRe6oFoTtf8k+j9yxUtWmlOi6BLfSJD9IN90ccDnPVxOhjl/S/pgzRw0I2XKYeQ5UHtPNG+a943QuIqlEtGx+GtL0EQyPJIntY86Aqo0Pl6vcv/NzWwbhm7tLpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvLiEhEsvlT9sEKzRybh+S4zhJmb4WMDr2s1wYyPSYI=;
 b=T5+ghQ+aIT3WgtADdmAHn9apSbFZwvV2M7MMMVMd6ebUupVkhQl2DpBT6uFLyofTfH0UQmGbu8hrauMlBqbxCEI/VUTxATXrgLlWqfRwy01O17gaEB4lyX/OtKuovEYVvEPrDsOWbKVJ15FMldUZck4JYk7e6GOZgzVZbvgfMz33TKBHrOSG28x/piTJbVx8tzMyWNvhBfn0wTTH49+HonfxqvmHPmI0dgknw7qQ1ihHG9Kz4CBnKX5vSsPiJpdZo5EqdIpcbjvZiUUjbwt128JSIUiC2BVVi/ZDuymPJbs+0DmkYku5lyjm0dlo7UbJgC5D/hvTHtOGP0JzTR0wsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by DS0PR12MB7678.namprd12.prod.outlook.com (2603:10b6:8:135::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 15:07:52 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 15:07:52 +0000
Date: Mon, 31 Aug 2026 17:07:43 +0200
From: Andrea Righi <arighi@nvidia.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Peter Zijlstra <peterz@infradead.org>, John Stultz <jstultz@google.com>,
	Suleiman Souhlal <suleiman@google.com>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
	linux-kernel@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [RFC PATCH 04/16] sched/core: Activate blocked donor when no
 owner is found
Message-ID: <apWYv6SdL0Ck-a5w@gpd4>
References: <20260826062901.2137-1-kprateek.nayak@amd.com>
 <20260826062901.2137-5-kprateek.nayak@amd.com>
 <ao8Mlls40IG9Vp6g@gpd4>
 <74324f25-2e8c-4f90-8f22-c1788615b95e@amd.com>
 <fe1bef59-e047-4008-b498-0c0d49a2be76@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe1bef59-e047-4008-b498-0c0d49a2be76@amd.com>
X-ClientProxiedBy: MI1P293CA0023.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:3::9)
 To DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|DS0PR12MB7678:EE_
X-MS-Office365-Filtering-Correlation-Id: a50ab5c7-b9ce-4ca6-fc58-08df0771a09d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|10067099003|6133799003|22082099003|4143699003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	yNaAlraLUAJf++d9GF2cGvlnHcYp5j4fZUx3KGnGvdfTW6LzaIlqtpTmuCDouTKy7czq8YXU6qT0aFzi5hG2Dv2OAqQq02JZEGcGNL79M3noeQ0HvMm3npVwc0nYcLv1oN69s4ugA0rT6T2R+JU5zCB9S5/KxkK+R56tMYie8BuXzlT/+sVrkekG7GQOLa2dRCultfO4bNiR5FMnB+SutlhF6ulAOQs7y4j5FHTopgjX1VMLMgjj7RmUvppKDuS0FLvzojl629S1oZa0RIR47zgY9AmhEZFluP2PlSZg9p3h9owXZQ4yvzSXAJNbW191M6koS9DuOiU4jBMUIhdblTiEg913/OhlstLU4rsgkASaH8EGWtn0ysSdBMUB3vMSv+AkEvoy7TRcU7dlxm4MYIJSh9jdvPTVaH+HxGeo55rH1ClzwK4CRl9V84cVGsQoL+673MS/FMLz/WxDw/D2AR3q4PT8VTfEIlDqlet6cW1gUVQP8Y7PJ/yD0L5ZCiGhI3waSDWfIVssOQMxTnkkKLFpASyn7BjZZraEQ26Tdg1JWtQPc7U8r22CPf/6abHRklWqo793LO41scwTYDtn4cQ4in90fc3khg0snjfkzse99HKDpp3plUyIZJJsHYQzGJvZpA3mD4nE4BVCHZtNs0dCs87mYVI1vbg2bTY8PBo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(10067099003)(6133799003)(22082099003)(4143699003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4tRDTMnNrxnRwYFW3I/RMWJZWnl/L9UwfKwPiYcUCKlTCZlPKiVwYw+WfcMB?=
 =?us-ascii?Q?JKAVAjT2nq0yac/PwZgG6bU+l8sbaHdo9mxgr0fzrzflwragR8a6T1GzHB+e?=
 =?us-ascii?Q?aZCPxyZF0qCZWm1ll6bliVdrJWtSdpDdcvhNxN/ngG75Q4/h8//xpaC4F4GH?=
 =?us-ascii?Q?IggY9v4rH22+U40CDAlDA4sI8MHyRFUSjO5GekwDWKZSSUOdTgXdbHlVVcqW?=
 =?us-ascii?Q?V7pAEJJg/oJJ6qk5427YSTDJrfIvT53fnJ0Gv/P80i9ibbT0MRs+0EGF5as4?=
 =?us-ascii?Q?IrD7V1rJkPUSu8ZtgyI6h0gtouY7lVXel2OIBkzqV1m02EuRdW0x1RTYA1Wl?=
 =?us-ascii?Q?dDXa0MzG4arnaElldp0xOhEdu52Jf8CbsCLA1mytMls5pX0jd7c/Zg5y9C1K?=
 =?us-ascii?Q?QRWv1sRTkpbFh1bnrwIG3bjgiW8IrhYjVUC0ZxFvdg7qyVbmeA/jYk5JFoid?=
 =?us-ascii?Q?zFplZWUW08VqQmi10BIfQSvy+k7zQBBFx2kTwRu43oGyM5ZoPJMgNq+Tnrco?=
 =?us-ascii?Q?ogIH6Y2N7NmuzOmKq+axSnICmwuQSIkfW/VEWtLYNQvqJY88Cbbto/W+9j7x?=
 =?us-ascii?Q?h5Az0QZ0o019FjKZJM4W9xGSxY60d7wiEJd1GLmNpe6yIyFBGPgfQEoycy6J?=
 =?us-ascii?Q?BJ4MJOYYFM5ZXnUrYTA9l/snFXd+kS8swGfBlAyUX+3bFZEdTeLUkptC529O?=
 =?us-ascii?Q?/SR3UlsKGR9YJtFN9ad2f25byupfcQergsBkQOSIHdeIbqIDOznsfcqgRFXd?=
 =?us-ascii?Q?ru3Z8lEaffkAD2SCtGUSYbQcT+ysi/baB2ZjZYACjSDOZLr/8jzcC2dhHq3r?=
 =?us-ascii?Q?M92n6Dq1v87hXDmb5fuPkG/faEiKeuj4ZVM5uystnooI2Yhlc6eROeT7hsJt?=
 =?us-ascii?Q?hXmUucN58B4rhzlgsAkILQxemDFKI8JyASSZPkhXndFNM98rA27MTXoTF15S?=
 =?us-ascii?Q?+jyD7ZcpRc3akwk32HoQF0eiw9DFvNa2hTLF26z15KNm688fpkw/vxs3JghA?=
 =?us-ascii?Q?IxgGFkvSoDsowTugQKn9ZNko3hlvEPTTdYug5kl5yK0bXJGKbsq16fn2WzsN?=
 =?us-ascii?Q?DnijIXtMAdmhZO64ue43XE9LWvdLEVN5IJZ5S67g9SZOlbr7MBDBQQy1D8X/?=
 =?us-ascii?Q?cgdUCQ1v1xzLvWdjar6FAKo1cEc/FKpsFO8EFrMbnbqdn8hfTst9kEeB/tOX?=
 =?us-ascii?Q?+iUx8QJS1kmfVqiogxi8kG0DJPHQyHtUeYsDNcGAnPp1N1MrUX07jPvJqQq9?=
 =?us-ascii?Q?yL57Rao3qrvTGIoy/2yQxkee48SV6JaXVPLEi6drHm19ShIlrQlpHL/543O7?=
 =?us-ascii?Q?5HdfgOoZHXkrPdtkBYbzjR4+sOIIW68xU/dxUpDiqz/J662HhhXYHEp8Otgj?=
 =?us-ascii?Q?D5/d1nOlid89y+NnucqJs7Mtr8dGgQw55x85CVsh24AOU+yhZn20Uh6Z6vHe?=
 =?us-ascii?Q?OBHT1wSwGY0REeUM/MIbsAAPYwXJH9hs+TnAL5Umisd1H0EjOpjMDL24fDJp?=
 =?us-ascii?Q?JaZ9o0wtH9FdY9PZ6H8MuthPUa0vwLc8RgfrSClzgv3JsccVEsdrxNgC8y50?=
 =?us-ascii?Q?jewpzvy1/wNgS0rGqfUPMgsDp8DbYASUqIre3qcyjDUanemolmTh/I9TmPc8?=
 =?us-ascii?Q?hmiyQ2f9Kmq1961xcI+QN6Tgn7JuNg/+AVnae1iZDNQ67kjyvEXvGmS0j1Rq?=
 =?us-ascii?Q?uqIyjJNO9QdnqNEpz2lBoA/HmTxG4yp2disaziFX6Khy3PaE3fQOG4OasYP+?=
 =?us-ascii?Q?0O05MzXF5g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a50ab5c7-b9ce-4ca6-fc58-08df0771a09d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 15:07:52.0235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aNxmIoBH5vDKOJDse/KExrjzASzdVkvGBlCAyNdGXAAbBJH4OwwAijtbAm7CP7eSTtZbvCqcQASzmlkh3QYyJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7678

Hi Prateek,

On Fri, Aug 28, 2026 at 11:34:45AM +0530, K Prateek Nayak wrote:
> Hello Andrea,
> 
> On 8/26/2026 10:50 PM, K Prateek Nayak wrote:
> >>> XXX: Is there a better way to handle this? If we can confirm a owner in
> >>> find_proxy_task(), we don't need to do a spurious wakeup of every task
> >>> observing !owner.
> >>>
> >>> proxy_resched_idle() until owner appears in an option but it will spin
> >>> until next owner appears.
> >>
> >> IIUC, the owner can remain NULL until the waiter selected by mutex_unlock() gets
> >> CPU time and acquires the mutex, so proxy_resched_idle() could spin for longer
> >> than just the unlock critical section.
> >>
> >> Maybe we could instead force a handoff from mutex_unlock_slowpath() when proxy
> >> execution is enabled and the mutex has waiters? This would keep the owner
> >> identifiable and avoid waking every task that happens to observe !owner.
> > 
> > I think that negates some of the benefits of the optimistic spinning +
> > mutex_try_lock(). I'll see if it makes any difference to the benchmark
> > results if we always force a handoff for MUTEX_FLAG_WAITERS.
> > 
> > wait_lock should give enough guarantee that the waiter cannot simple
> > disappear before the handoff after MUTEX_FLAG_PICKUP is set since
> > waiter has to try at least one mutex_trylock() under wait_lock before
> > checking for pending signals.
> 
> Below  are the results from few experiments. All diffs pasted below are
> based on John's tree at:
> 
>   https://github.com/johnstultz-work/linux-dev.git proxy-exec-v31-7.2-rc4
> 
> at commit 06ac43db4d8e ("[ANNOTATION] === Needs confirmation of
> functionality past this point ===") with CONFIG_SCHED_PROXY_EXEC=y.
> 
> All diffs are very experimental: virtme-ng or testing with a disposable
> environment is recommended.
> 
> ============================
> Experiment 1: Simple Handoff
> ============================
> 
> If I do a simple handoff like below, sched-messaging goes pretty bad:
> 
> diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
> index 8a85912d7ee6..da14a49e4fa2 100644
> --- a/kernel/locking/mutex.c
> +++ b/kernel/locking/mutex.c
> @@ -1009,7 +1009,7 @@ static noinline void __sched __mutex_unlock_slowpath(struct mutex *lock, unsigne
>  		MUTEX_WARN_ON(__owner_task(owner) != current);
>  		MUTEX_WARN_ON(owner & MUTEX_FLAG_PICKUP);
>  
> -		if (sched_proxy_exec() && current->blocked_donor) {
> +		if (sched_proxy_exec() && (current->blocked_donor || (owner & MUTEX_FLAG_WAITERS))) {
>  			/* force handoff if we have a blocked_donor */
>  			owner = MUTEX_FLAG_HANDOFF;
>  			break;
> ---
> 
> With just a simple handoff on waiters, we have:
> 
>     ==================================================================
>     Test          : sched-messaging
>     Units         : Normalized time in seconds
>     Interpretation: Lower is better
>     Statistic     : AMean
>     ==================================================================
>       Test:                   vanilla                 handoff
>        1-groups:         3.12 (0.00 pct)         3.47 (-11.21 pct)  *
>        2-groups:         3.43 (0.00 pct)         4.33 (-26.23 pct)  *
>        4-groups:         4.05 (0.00 pct)         5.95 (-46.91 pct)
>        8-groups:         4.29 (0.00 pct)         9.56 (-122.84 pct)
>       16-groups:         5.89 (0.00 pct)        12.29 (-108.65 pct)
> 
>      * Data points have > 10% run to run variance on all versions

Yeah, the results make it pretty clear that forcing a handoff whenever waiters
are present is not viable, so my original suggestion doesn't look practical.

> 
> 
> ==================================================
> Experiment 2: Allow steal until next task is found
> ==================================================
> 
> If we open the opportunity to allow stealing of mutex until the next waiter
> is found, the results are ever so slightly slightly better:
> 
> diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
> index 8a85912d7ee6..5ebb2624b331 100644
> --- a/kernel/locking/mutex.c
> +++ b/kernel/locking/mutex.c
> @@ -92,7 +92,16 @@ static inline struct task_struct *__mutex_trylock_common(struct mutex *lock, boo
>  		unsigned long task = owner & ~MUTEX_FLAGS;
>  
>  		if (task) {
> -			if (flags & MUTEX_FLAG_PICKUP) {
> +			if (sched_proxy_exec() && (flags & MUTEX_FLAG_STEAL)) {
> +				/*
> +				 * STEAL cannot be set after HANDOFF has been
> +				 * initiated. If STEAL is set, clear it and
> +				 * preserve other flags
> +				 */
> +				MUTEX_WARN_ON(flags & (MUTEX_FLAG_PICKUP));
> +				flags &= ~MUTEX_FLAG_STEAL;
> +				task = curr;
> +			}else if (flags & MUTEX_FLAG_PICKUP) {
>  				if (task != curr)
>  					break;
>  				flags &= ~MUTEX_FLAG_PICKUP;
> @@ -104,7 +113,7 @@ static inline struct task_struct *__mutex_trylock_common(struct mutex *lock, boo
>  				break;
>  			}
>  		} else {
> -			MUTEX_WARN_ON(flags & (MUTEX_FLAG_HANDOFF | MUTEX_FLAG_PICKUP));
> +			MUTEX_WARN_ON(flags & (MUTEX_FLAG_HANDOFF | MUTEX_FLAG_PICKUP | MUTEX_FLAG_STEAL));
>  			task = curr;
>  		}
>  
> @@ -274,7 +283,29 @@ static void __mutex_handoff(struct mutex *lock, struct task_struct *task)
>  		new |= (unsigned long)task;
>  		if (task)
>  			new |= MUTEX_FLAG_PICKUP;
> +		if (atomic_long_try_cmpxchg_release(&lock->owner, &owner, new))
> +			break;
> +	}
> +}
> +
> +static void __mutex_steal(struct mutex *lock, struct task_struct *task)
> +{
> +	unsigned long owner = atomic_long_read(&lock->owner);
> +
> +	for (;;) {
> +		unsigned long new;
>  
> +		/* Lock was successfully stolen. */
> +		if (__owner_task(owner) != current)
> +			break;
> +
> +		MUTEX_WARN_ON(!(__owner_flags(owner) & MUTEX_FLAG_STEAL));
> +		MUTEX_WARN_ON(owner & MUTEX_FLAG_PICKUP);
> +
> +		new = (owner & MUTEX_FLAG_WAITERS);
> +		new |= (unsigned long)task;
> +		if (task)
> +			new |= MUTEX_FLAG_PICKUP;
>  		if (atomic_long_try_cmpxchg_release(&lock->owner, &owner, new))
>  			break;
>  	}
> @@ -389,7 +420,17 @@ bool mutex_spin_on_owner(struct mutex *lock, struct task_struct *owner,
>  
>  	lockdep_assert_preemption_disabled();
>  
> -	while (__mutex_owner(lock) == owner) {
> +	for (;;) {
> +		unsigned long __owner = atomic_long_read(&lock->owner);
> +
> +		/* If the owner changed, break out. */
> +		if (__owner_task(__owner) != owner)
> +			break;
> +
> +		/* If lock can be stolen, break out. */
> +		if (sched_proxy_exec() && (__owner_flags(__owner) & MUTEX_FLAG_STEAL))
> +			break;
> +
>  		/*
>  		 * Ensure we emit the owner->on_cpu, dereference _after_
>  		 * checking lock->owner still matches owner. And we already
> @@ -985,6 +1026,7 @@ static noinline void __sched __mutex_unlock_slowpath(struct mutex *lock, unsigne
>  	struct mutex_waiter *waiter;
>  	unsigned long owner;
>  	unsigned long flags;
> +	bool steal;
>  
>  	mutex_release(&lock->dep_map, ip);
>  	__release(lock);
> @@ -1006,19 +1048,31 @@ static noinline void __sched __mutex_unlock_slowpath(struct mutex *lock, unsigne
>  	 */
>  	owner = atomic_long_read(&lock->owner);
>  	for (;;) {
> +		unsigned long owner_flags;
> +
>  		MUTEX_WARN_ON(__owner_task(owner) != current);
>  		MUTEX_WARN_ON(owner & MUTEX_FLAG_PICKUP);
>  
> -		if (sched_proxy_exec() && current->blocked_donor) {
> -			/* force handoff if we have a blocked_donor */
> -			owner = MUTEX_FLAG_HANDOFF;
> -			break;
> -		}
> -
>  		if (owner & MUTEX_FLAG_HANDOFF)
>  			break;
>  
> -		if (atomic_long_try_cmpxchg_release(&lock->owner, &owner, __owner_flags(owner))) {
> +		owner_flags = __owner_flags(owner);
> +		if (sched_proxy_exec()) {
> +			if (current->blocked_donor) {
> +				/* force handoff if we have a blocked_donor */
> +				owner = MUTEX_FLAG_HANDOFF;
> +				break;
> +			}
> +
> +			if (owner & MUTEX_FLAG_WAITERS)
> +				owner_flags = owner | MUTEX_FLAG_STEAL;
> +		}
> +
> +		if (atomic_long_try_cmpxchg_release(&lock->owner, &owner, owner_flags)) {
> +			if (owner_flags & MUTEX_FLAG_STEAL) {
> +				steal = true;
> +				break;
> +			}
>  			if (owner & MUTEX_FLAG_WAITERS)
>  				break;
>  
> @@ -1071,6 +1125,9 @@ static noinline void __sched __mutex_unlock_slowpath(struct mutex *lock, unsigne
>  	if (owner & MUTEX_FLAG_HANDOFF)
>  		__mutex_handoff(lock, next);
>  
> +	if (sched_proxy_exec() && steal)
> +		__mutex_steal(lock, next);
> +
>  	raw_spin_unlock(&current->blocked_lock);
>  	raw_spin_unlock_irqrestore(&lock->wait_lock, flags);
>  	if (next) {
> diff --git a/kernel/locking/mutex.h b/kernel/locking/mutex.h
> index 3e263e98e5fc..eb4180745da0 100644
> --- a/kernel/locking/mutex.h
> +++ b/kernel/locking/mutex.h
> @@ -33,8 +33,9 @@ struct mutex_waiter {
>  #define MUTEX_FLAG_WAITERS	0x01
>  #define MUTEX_FLAG_HANDOFF	0x02
>  #define MUTEX_FLAG_PICKUP	0x04
> +#define MUTEX_FLAG_STEAL	0x08
>  
> -#define MUTEX_FLAGS		0x07
> +#define MUTEX_FLAGS		0x0F
>  
>  /*
>   * Internal helper function; C doesn't allow us to hide it :/
> ---
> 
> With that small steal opportunity, we have:
> 
>     ==================================================================
>     Test          : sched-messaging
>     Units         : Normalized time in seconds
>     Interpretation: Lower is better
>     Statistic     : AMean
>     ==================================================================
>       Test:                   vanilla                 handoff             steal + handoff
>        1-groups:         3.12 (0.00 pct)         3.47 (-11.21 pct)       3.63 (-16.34 pct)  *
>        2-groups:         3.43 (0.00 pct)         4.33 (-26.23 pct)       4.14 (-20.69 pct)  *
>        4-groups:         4.05 (0.00 pct)         5.95 (-46.91 pct)       5.45 (-34.56 pct)
>        8-groups:         4.29 (0.00 pct)         9.56 (-122.84 pct)      7.80 (-81.81 pct)
>       16-groups:         5.89 (0.00 pct)        12.29 (-108.65 pct)     11.89 (-101.86 pct)
> 
>      * Data points have > 10% run to run variance on all versions
> 
> 
> So, the opportunity must be extended to allow stealing until the the waiter
> wakes up for !HANDOFF cases. Few complications with that are:

Right, this only narrows the handoff window and still retains most of its cost.

> 
> o We cannot continue to persist the old owner after mutex_unlock() since that
>   owner can die, block on other mutex, etc. and that breaks queuing on owner
>   since new waiters can go and block on a dead task / task blocked on an
>   incorrect owner.
> 
> o We cannot allow steal after handoff to new owner because __mutex_lock() will
>   resolve to new owner that hasn't woken up yet and waiters start queuing on
>   it but a concurrent task can come steal the lock and break proxy. Not very
>   intuitive; adds a lot of complexity.
> 
> 
> ============================================
> Experiment 3: STEAL + Temporary swap to idle
> ============================================
> 
> the unlock will temporarily swap to rq->idle of the lock owner's CPU with
> MUTEX_FLAG_STEAL set to allow grabbing the task until the the waiter wakes
> up and manages to grab the task itself for !HANDOFF cases. With that,
> numbers are very close:
> 
> diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
> index 8a85912d7ee6..187f95544453 100644
> --- a/kernel/locking/mutex.c
> +++ b/kernel/locking/mutex.c
> @@ -92,7 +92,16 @@ static inline struct task_struct *__mutex_trylock_common(struct mutex *lock, boo
>  		unsigned long task = owner & ~MUTEX_FLAGS;
>  
>  		if (task) {
> -			if (flags & MUTEX_FLAG_PICKUP) {
> +			if (sched_proxy_exec() && (flags & MUTEX_FLAG_STEAL)) {
> +				/*
> +				 * STEAL cannot be set after HANDOFF has been
> +				 * initiated. If STEAL is set, clear it and
> +				 * preserve other flags
> +				 */
> +				MUTEX_WARN_ON(flags & (MUTEX_FLAG_PICKUP));
> +				flags &= ~MUTEX_FLAG_STEAL;
> +				task = curr;
> +			}else if (flags & MUTEX_FLAG_PICKUP) {
>  				if (task != curr)
>  					break;
>  				flags &= ~MUTEX_FLAG_PICKUP;
> @@ -104,7 +113,7 @@ static inline struct task_struct *__mutex_trylock_common(struct mutex *lock, boo
>  				break;
>  			}
>  		} else {
> -			MUTEX_WARN_ON(flags & (MUTEX_FLAG_HANDOFF | MUTEX_FLAG_PICKUP));
> +			MUTEX_WARN_ON(flags & (MUTEX_FLAG_HANDOFF | MUTEX_FLAG_PICKUP | MUTEX_FLAG_STEAL));
>  			task = curr;
>  		}
>  
> @@ -242,7 +251,41 @@ __mutex_remove_waiter(struct mutex *lock, struct mutex_waiter *waiter)
>  	__must_hold(&lock->wait_lock)
>  {
>  	if (list_empty(&waiter->list)) {
> -		__mutex_clear_flag(lock, MUTEX_FLAGS);
> +		/*
> +		 * The last waiter can be interrupted before the full
> +		 * unlock with STEAL is done.
> +		 *
> +		 *  LOCK lock->wait_lock
> +		 *
> +		 *  __mutex_trylock()
> +		 *    // Sees old owner			__mutex_unlock_slowpath()
> +		 *    return owner;			  atomic_long_cmpxchg_release(&owner, idle | STEAL)
> +		 *					    // Succeeds
> +		 *  if (signal_pending())
> +		 *    goto err;
> +		 *
> +		 * err:
> +		 *  __mutex_remove_waiter()
> +		 *    __mutex_clear_flag(MUTEX_FLAGS)
> +		 *    lock->first_waiter = NULL;
> +		 *
> +		 *  UNLOCK lock->wait_lock		  LOCK lock->wait_lock
> +		 *					  waiter = lock->first_waiter; // NULL
> +		 *					  // No wakeup
> +		 *
> +		 *  !!! lock->owner stuck as rq->idle without STEAL set !!!
> +		 *
> +		 * Persis the STEAL flag to prevent an idle task to
> +		 * linger as lock owner. __mutex_trylock_fast() will
> +		 * fail temporarily for first contender but following
> +		 * __mutex_trylock_common() will do the right thing.
> +		 *
> +		 * XXX: This can also be solved by doing a
> +		 * atomic_try_cmpxchg() or__mutex_clear_flag() in
> +		 * __mutex_unlock_slowpath() if steal is set but no
> +		 * waiter is found under lock->wait_lock.
> +		 */
> +		__mutex_clear_flag(lock, MUTEX_FLAGS & ~MUTEX_FLAG_STEAL);
>  		lock->first_waiter = NULL;
>  	} else {
>  		if (lock->first_waiter == waiter)
> @@ -274,7 +317,6 @@ static void __mutex_handoff(struct mutex *lock, struct task_struct *task)
>  		new |= (unsigned long)task;
>  		if (task)
>  			new |= MUTEX_FLAG_PICKUP;
> -
>  		if (atomic_long_try_cmpxchg_release(&lock->owner, &owner, new))
>  			break;
>  	}
> @@ -389,7 +431,17 @@ bool mutex_spin_on_owner(struct mutex *lock, struct task_struct *owner,
>  
>  	lockdep_assert_preemption_disabled();
>  
> -	while (__mutex_owner(lock) == owner) {
> +	for (;;) {
> +		unsigned long __owner = atomic_long_read(&lock->owner);
> +
> +		/* If the owner changed, break out. */
> +		if (__owner_task(__owner) != owner)
> +			break;
> +
> +		/* If lock can be stolen, break out. */
> +		if (sched_proxy_exec() && (__owner_flags(__owner) & MUTEX_FLAG_STEAL))
> +			break;
> +
>  		/*
>  		 * Ensure we emit the owner->on_cpu, dereference _after_
>  		 * checking lock->owner still matches owner. And we already
> @@ -1006,19 +1058,42 @@ static noinline void __sched __mutex_unlock_slowpath(struct mutex *lock, unsigne
>  	 */
>  	owner = atomic_long_read(&lock->owner);
>  	for (;;) {
> +		unsigned long owner_flags;
> +
>  		MUTEX_WARN_ON(__owner_task(owner) != current);
>  		MUTEX_WARN_ON(owner & MUTEX_FLAG_PICKUP);
>  
> -		if (sched_proxy_exec() && current->blocked_donor) {
> -			/* force handoff if we have a blocked_donor */
> -			owner = MUTEX_FLAG_HANDOFF;
> -			break;
> -		}
> -
>  		if (owner & MUTEX_FLAG_HANDOFF)
>  			break;
>  
> -		if (atomic_long_try_cmpxchg_release(&lock->owner, &owner, __owner_flags(owner))) {
> +		owner_flags = __owner_flags(owner);
> +		if (sched_proxy_exec()) {
> +			if (current->blocked_donor) {
> +				/* force handoff if we have a blocked_donor */
> +				owner = MUTEX_FLAG_HANDOFF;
> +				break;
> +			}
> +
> +			if (owner & MUTEX_FLAG_WAITERS) {
> +				unsigned long idle;
> +				/*
> +				 * Swap the owner to current CPU's idle task
> +				 * with a STEAL flag.
> +				 *
> +				 * The lock is free to be stolen and
> +				 * __mutex_owner() will resolve to idle task
> +				 * that is always ->on_rq on this CPU.
> +				 *
> +				 * Proxy donors will temporarily migrate here
> +				 * before a wakeup or an optimistic spinner
> +				 * can grab the lock.
> +				 */
> +				idle = (unsigned long)idle_task(raw_smp_processor_id());
> +				owner_flags = idle | MUTEX_FLAG_STEAL | owner_flags;
> +			}
> +		}
> +
> +		if (atomic_long_try_cmpxchg_release(&lock->owner, &owner, owner_flags)) {
>  			if (owner & MUTEX_FLAG_WAITERS)
>  				break;
>  
> diff --git a/kernel/locking/mutex.h b/kernel/locking/mutex.h
> index 3e263e98e5fc..eb4180745da0 100644
> --- a/kernel/locking/mutex.h
> +++ b/kernel/locking/mutex.h
> @@ -33,8 +33,9 @@ struct mutex_waiter {
>  #define MUTEX_FLAG_WAITERS	0x01
>  #define MUTEX_FLAG_HANDOFF	0x02
>  #define MUTEX_FLAG_PICKUP	0x04
> +#define MUTEX_FLAG_STEAL	0x08
>  
> -#define MUTEX_FLAGS		0x07
> +#define MUTEX_FLAGS		0x0F
>  
>  /*
>   * Internal helper function; C doesn't allow us to hide it :/
> ---
> 
> The results with temporary switch to idle + STEAL are:
> 
>     ==================================================================
>     Test          : sched-messaging
>     Units         : Normalized time in seconds
>     Interpretation: Lower is better
>     Statistic     : AMean
>     ==================================================================
>       Test:                   vanilla                 handoff             STEAL + handoff          idle + STEAL
>        1-groups:         3.12 (0.00 pct)         3.47 (-11.21 pct)       3.63 (-16.34 pct)       3.59 (-15.06 pct)
>        2-groups:         3.43 (0.00 pct)         4.33 (-26.23 pct)       4.14 (-20.69 pct)       3.48 (-1.45 pct)
>        4-groups:         4.05 (0.00 pct)         5.95 (-46.91 pct)       5.45 (-34.56 pct)       4.00 (1.23 pct)
>        8-groups:         4.29 (0.00 pct)         9.56 (-122.84 pct)      7.80 (-81.81 pct)       4.31 (-0.46 pct)
>       16-groups:         5.89 (0.00 pct)        12.29 (-108.65 pct)     11.89 (-101.86 pct)      5.91 (-0.33 pct)
> 
>       * Data points have > 10% run to run variance on all versions
> 
> 
> My machine has held up for some time with Experiment 3 so I'm
> fairly confident at the very least mutual exclusion is holding
> up - I haven't seen any lockups / hung task either so hopefully
> other bits are fine too :-)

This looks much better from a performance perspective. IIUC, the idle task in
this case is being used as a temporary owner marker, but find_proxy_task() would
treat it as a real mutex owner and could set idle->blocked_donor, right?

Should we handle the STEAL state explicitly in find_proxy_task() to avoid
creating a donor relationship with the idle task?

Thanks,
-Andrea
