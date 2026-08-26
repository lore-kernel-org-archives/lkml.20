Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011028.outbound.protection.outlook.com [52.101.62.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9376D44AB8A
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787759781; cv=fail; b=knEFgj013ziyDSUhzONPPkiz5zG37XJZf6CePK9JLf5+c6g9IxKek5IhKk4vVR9qSp+BfHff22+9j8v2UzmlTxW6LbPuJRWdwxgdZinzQk+fFG7kBlNgIT6pJWw1pPEeRX8an76AAR92CRJg1qFpj0uUNppfsqpWIeNGSbRwz/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787759781; c=relaxed/simple;
	bh=hN7fh8FOUAn5qrDBaEGKvQ3O65jwVPWLuFlpEt0PSig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UYAwN+3WcykND+NGgztGuYNrQk5Nq7sPgkWYv+4GonNG/9bj6QHKOTscPdWmhXP7nAcm9bFjRz1Ci7aMCdxLhgCruuxfRD+T+43aor3ogve44XXJc4pa8jdVSh1xxrtdreMhlEUhbErDaYfABFNs2qbzpqTNoTS1OTrcw4fXUCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=q0sK0Q3+; arc=fail smtp.client-ip=52.101.62.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="q0sK0Q3+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=anfjHBwOkYIoxK/QXer9QTfoxndbFjMyWSMqdob79iEHJkHYphoIDhM6Rz6jqYWmACW5UV8WJ6LPipqrmn1ghO2g8A/wuDnC+Qnz4RnaTjBizz+OzDx9fd6Lf1XljMtdRaszyBf2HWP9/QUawSAnaCy8qJKjXOzYs8VT2LWtW+0G64EPCWqyban5D2lLS72Qw2XBL68N+CAa67nk7FNdA2i1DRUz38032KQcnKb5/4iCJSG5xTyjyfVzP4+nD7RjBEe/g43xoXgyJorYZCQU5divsrZ91hpVR7bdT/HpqDxYLV6+tqJy+ltLmhQJtU9+znjrbwSRPe/RhYaoicad+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7+ZPVQKo7cwnRHbIOY5SYsxtaR4UrxXWrb+wHu9GtQ=;
 b=mn08FdSOsgm5/yFVu8QnfzHgMidu2P/oJWiiEP3OEQXs/y2fYGjC7nLQZaHG5yrWwZDICig7F+G3vIIu4oC2vUbonE5xoZ8SkZ8SLQLTO0NMf4VlNNtYhUQjej2+eKN1UKBRW8gFrvLdRIIpwhvEIiN2WuT7m77rKLREoL3sxyICk+iSAKt0Z7+9N174haB9Ig2M9vWx6RBuD1OdIGCVn5HEvTiUqP+RVkv53QuBJUk4OuDcm1Ub8Tb1GWvV9Np2Ti3rIASZMqSzE+xuZf+T6CNudFQARy9NlpnFlCziv6MFy2lChVYTmBtb5AAMPrKXQ3tPjIjKlTGkX/Sq0HUY6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u7+ZPVQKo7cwnRHbIOY5SYsxtaR4UrxXWrb+wHu9GtQ=;
 b=q0sK0Q3+OusZUizsWU03EOpgh+AwVsVNOSLHqwJWf+B1qrbxeLLNsy448ZK6VqUAREWmfrLpTr1shTONWyiFlYOWyMaCRMZPDAMxo7vu1TZyf5L2iyPNy2bdlPPuS27C7xeA/YgEsmNjZSOKy4HhY9inMwYxefv2+pX+sOB/nHLLSulb54+nR1Yowf3F6ak5ddmuY6/aI7grk2JVM22M65ozs+Q66eTzALC0qVAPC/OqArr3M/o6+MHq3lR1shUDYgEKh+K/3TrG6znUko98B49vHvGDSP4CTuR7ZC7Y6TGhn4oyB46WxD4SHd/4rUGsceomevAsZF4Q99JHBj9jsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by CH4PR12MB489481.namprd12.prod.outlook.com (2603:10b6:610:509::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Wed, 26 Aug
 2026 15:56:14 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0339.012; Wed, 26 Aug 2026
 15:56:14 +0000
Date: Wed, 26 Aug 2026 17:56:06 +0200
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
Subject: Re: [RFC PATCH 04/16] sched/core: Activate blocked donor when no
 owner is found
Message-ID: <ao8Mlls40IG9Vp6g@gpd4>
References: <20260826062901.2137-1-kprateek.nayak@amd.com>
 <20260826062901.2137-5-kprateek.nayak@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826062901.2137-5-kprateek.nayak@amd.com>
X-ClientProxiedBy: MI3PEPF00007536.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::4c8) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|CH4PR12MB489481:EE_
X-MS-Office365-Filtering-Correlation-Id: 89671d37-f46b-4e40-0eb5-08df038a8eb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|23010399003|366016|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	s1Op5XpcQPVph9bIhx8XXHO+Sukza4qY/hCyCB2U4KofBaHmEgwdjxWouMdG5rwuIfqo9Ix0+DPtE60ImkmdhrRooTRa+p2O0Ex8UPbyg9UiZhOMnsJWNotQfmfkCGonKC+I0DlZpnW/2Zi5F5WHzwIwmhePmxrBMk0ZHHxdRgvkh679RKVxQsrypFd2sZFdgFVXgqyArsZsc+Kli4e3qdLABn0Zwo8iOQpr5CADpP/e/ox/l/6r/9tDad5Y70YH7k0gZd5D/jyJAdO9NDyezNZJTZBk8N012Jtjw5KeVBySSbB3TxO3jr1kqYjp5I6Wjb7n11gn3RBKrAXSTac4Gy8j4U3CjK+8DYP/gXPFHdodTRN2U70isO7NtXTxqxcqUNfVSl8wg9lEhkR35dhZGrphjsaenybVBUhbf2ueQzQxO+nr0Txs7MoIcJKoy5Eq0dsfDQQ/+sIZ4EAqua+g4K/+Q282SW+XfBvCF0jD4vfWWQBR1SUnqvehhvxQUmghh7nHSmUSBjqWWfftrWggb6Rjs+x58zt/QFKBqsFDd74aZZWi1f0JakDU/cMm/MDfUKuKvJfeRM9HwBkkpkNSorwM+W68/GRu1jD1AHv+Y9Zv4j2000q3AvQSNt/i5WZLaFutlcL/YsWDLDLE0efFZGSkSX4mfU/NtExvbl8UZc8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(23010399003)(366016)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q4KO8zcEj//8tjlJOTkuKzWZLvCuK+Fw6Q5Z6zoImgepy1BDhXGR+74wBulu?=
 =?us-ascii?Q?JBYmmFOWKRpaOuC+sXV7R1WXgjTF/SahltQTpSbZqWKe0nmx7gyBnryzg52w?=
 =?us-ascii?Q?MeNMdM/07CI3dAyB+a+SqVBHJnOwBLIlwXtJ28VlqoxKYsryrqBcgXujl/QN?=
 =?us-ascii?Q?398cDvASnWxJENTqEfoxUxfkgcEbAikcRXOd2gNk6ZTF6tnMqels/7IuCFf4?=
 =?us-ascii?Q?isbvcGQp43G0VJY+zUP4NqRrnX780sV8rxebIb5owC7f0Nz8X+nWO1PEbwcO?=
 =?us-ascii?Q?IsuuS2G7zpQupCt9L2ztgn75GRTMUzn52XId9yK3/WMuDBaNhDGM7nakC54+?=
 =?us-ascii?Q?9S64H0EBrUD1lrLYcrGezP+uwKi1IoPQrI96GPtqPjgqRBvR/mOSjDsBoagL?=
 =?us-ascii?Q?3m+uG3NI/J1KldK4wvhs0MnSIbR9lF3K13a3+3JzlRgZJ3Z7LkmE4tkFbOPt?=
 =?us-ascii?Q?6kWFTiI/xgt3yYpofT7rykXzGWAc/iGYQZ57FPyLCu8UrDI7uFbOcwH/OmUj?=
 =?us-ascii?Q?E9MBD2PkI+npqcnYXHEul8KyRGyMIaBFogNqXqRpQGDgG5Lt6uLcNZRZpFLm?=
 =?us-ascii?Q?baqckwRLPw0bkhrKllv3yKsgAQyDXM6plUn/WEqCQU1RTjfP+cm2YGexpv/7?=
 =?us-ascii?Q?67aUDO3Xg6ZiuG4xSpu1xMkmWYZNsWt3b1NQ30At8m6cauVU46Ah7xoCSVrZ?=
 =?us-ascii?Q?4zpxY1thkcCrXWG5dS+4ErIrlO0Gu/ttRfCYPWvh9GfS1tuWpU32ZmudarpY?=
 =?us-ascii?Q?kYUbwAZWA4IVK1VmqdsuXGP/QRiXgzCjv+W4D1M6IYwm4Nx48/jmKrnE/yz5?=
 =?us-ascii?Q?oLirKeyohpQu+c/ROR+8tKfxVl0Ab0CVrGz+DkDWzzr+BzspSa9/oL4B1Q+r?=
 =?us-ascii?Q?ZYYGFQiaNg9k9GWW8pe+Tl9EfcuTmrvFh7ffFc+hWsOzMA1+5LQhG//lVQAe?=
 =?us-ascii?Q?R5V8OAyXx9Jj7V4Mb1JHAK7xskJ38qtHzAKvKL2EcUjksXR/ELDMFhdcuIyU?=
 =?us-ascii?Q?kmlb2FMRdXumi3fVnKy83yTkfSXXwxC3sw1GEPDVHWd/1nImKOXpGRTgQHCo?=
 =?us-ascii?Q?xad9Rc9sxuSl0ZpYxlKlu7MYCD/EJbISD5EJ4L1xdDHRIjtNnFHOVj72CaK4?=
 =?us-ascii?Q?Hgc4PlxhwJiat+jJTrxDOQJkknGItSmQ2sYC252nkLNtZccIka59kuHWW4i/?=
 =?us-ascii?Q?/Q6fbFiQ2FFwXC9mMPoYx/aKH9rcGxJ88o11K4cHvirtiaEYQ6rUcycsRw+q?=
 =?us-ascii?Q?PKpzcbviIQ440EKkJ6sO8T7JpPRFbxKxu+X+Crqjl+83w2dAG9g77+EvQWIM?=
 =?us-ascii?Q?bw0yfZJyb95ufKzsBu077Ffkq/JB72agx3FO/EU6yK2oVUAfnQL2FZUXYrmX?=
 =?us-ascii?Q?rate4qkOvbDV175mV9vAY32TWb/3np6lhlRI9GSdB/+ZWTApj/5TnCc+F3kg?=
 =?us-ascii?Q?r5obcAi+g0JuwZIpt9LYGD2fK8CbnxoXECCxL7ggDPfm2+ruEIlY4soJRAKM?=
 =?us-ascii?Q?3iyTrKoxXDkSa1kEPpKjoZp6PB+lVQ1HisY+zwozOEBIcujG7STUrQwHIyUH?=
 =?us-ascii?Q?Q6rxyoWCvXz8t982iQck4Tv65m2dRMJ9OnErDlqQ4kWz08463/jW39pjAhM0?=
 =?us-ascii?Q?D2CV77GgNP10qNssV4Y9ibotNeBEqCkXyxCLrdbM1xKgznLtt+fJYs7vO8L6?=
 =?us-ascii?Q?uMj2gVvHmnJURKcrZftB9tU0hVGar3Ac670r3RDmG4hALHBfmS2PFwfbQiEV?=
 =?us-ascii?Q?EgtClqaPPg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89671d37-f46b-4e40-0eb5-08df038a8eb5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 15:56:14.5630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/OHSPVpgnrsUJ4+jnP7ltwGtbtX/ugEk7rVkn8jKl/VPinzZYbkeU1MnizfLdNFuhzEjcjkCHHXJvTK/FZaKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR12MB489481

On Wed, Aug 26, 2026 at 06:28:48AM +0000, K Prateek Nayak wrote:
> mutex_unlock_slowpath() follows:
> 
>     if (owner & MUTEX_FLAG_HANDOFF)
>         break /* ... and do __mutex_handoff() */
> 
>     if (atomic_long_try_cmpxchg_release(&lock->owner, &owner, __owner_flags(owner))) {
>         if (owner & MUTEX_FLAG_WAITERS)
>             break; /* ... and wake up the forst waiter. */

nit: s/forst/first/

> 
> MUTEX_FLAG_HANDOFF is only set by first-waiter after it has been woken
> up and in absence of MUTEX_FLAG_HANDOFF, the owner clears itself from
> the lock_word and wakes up the first waiter to try a
> __mutex_trylock_or_handoff().
> 
> MUTEX_FLAG_HANDOFF exists to prevent new optimistic spinners from
> trying to hijack the lock from waiter all the time and potentially
> starving them but it is not necessary for MUTEX_FLAG_HANDOFF to be
> always set in presence of a waiter.
> 
> If a blocked donor is deactivated when no owner is observed, it may not
> be woken up until it becomes the first waiter and is naturally woken up
> which breaks proxy in the interim.
> 
> Wake up the blocked donor and allow it to grab the lock when no owner is
> observed. If the task manages to grab the lock, the block chain will
> follow at the next proxy migration. If the task fails to grab the lock,
> same situation is restored and everyone migrated to the CPU of new
> owner.
> 
> Fixes: f13beb010e4a ("sched: Have try_to_wake_up() handle return-migration for PROXY_WAKING case")
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
> ---
> XXX: Is there a better way to handle this? If we can confirm a owner in
> find_proxy_task(), we don't need to do a spurious wakeup of every task
> observing !owner.
> 
> proxy_resched_idle() until owner appears in an option but it will spin
> until next owner appears.

IIUC, the owner can remain NULL until the waiter selected by mutex_unlock() gets
CPU time and acquires the mutex, so proxy_resched_idle() could spin for longer
than just the unlock critical section.

Maybe we could instead force a handoff from mutex_unlock_slowpath() when proxy
execution is enabled and the mutex has waiters? This would keep the owner
identifiable and avoid waking every task that happens to observe !owner.

> ---
>  kernel/sched/core.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 4cd69b08b415..9d9db7ccf01f 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -6809,6 +6809,19 @@ static inline void proxy_reacquire_rq_lock(struct rq *rq, struct rq_flags *rf)
>  	update_rq_clock(rq);
>  }
>  
> +static void
> +proxy_activate(struct rq *rq, struct rq_flags *rf, struct task_struct *p)
> +	__must_hold(__rq_lockp(rq))
> +{
> +	lockdep_assert_rq_held(rq);
> +	proxy_resched_idle(rq);
> +	proxy_release_rq_lock(rq, rf);
> +
> +	wake_up_process(p);
> +
> +	proxy_reacquire_rq_lock(rq, rf);
> +}
> +
>  /*
>   * If the blocked-on relationship crosses CPUs, migrate @p to the
>   * owner's CPU.
> @@ -6934,14 +6947,15 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
>  			/*
>  			 * If there is no owner, either clear blocked_on
>  			 * and return p (if it is current and safe to
> -			 * just run on this rq), or return-migrate the task.
> +			 * just run on this rq), or wake the task to try
> +			 * and grab the lock it is blocked on.
>  			 */
>  			__clear_task_blocked_on(p, NULL);
> -			if (task_current(rq, p)) {
> +			if (task_current(rq, p) || p->wake_cpu == task_cpu(p)) {
>  				p->is_blocked = 0;
>  				return p;
>  			}
> -			goto deactivate;
> +			goto activate;
>  		}
>  
>  		if (!READ_ONCE(owner->on_rq) || owner->se.sched_delayed) {
> @@ -7029,6 +7043,9 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
>  	}
>  	return owner;
>  
> +activate:
> +	proxy_activate(rq, rf, p);
> +	return NULL;
>  deactivate:
>  	proxy_deactivate(rq, p);
>  	return NULL;
> -- 
> 2.34.1
> 

Thanks,
-Andrea
