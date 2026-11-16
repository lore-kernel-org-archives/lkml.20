Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813907;
	b=Aim2Gd6OTZVWrbkNEMvPdzcaoJaGnoejGOPiLb1/FrTnwH0meZPUw3hh7bVYD0X8LFRv
	 wJxgyifWGEI3nxPmvba0mwNqvEsOmQaeXzSTD7BBePqnWj1k6sRwphPxPCxlAwj9qQKQo
	 QmZiTVkWJOpAuuyXca7u1ShQ50ySGfaEaCwnifPYOfS+2ICM97zOsnoYg2OIggXe8LPPx
	 yyDkrUNy/TuFGNxFOcN/rn1HIIyLtmtL21M8VCSjo/SODZMOih2W9JUiK074I3CVoOnfa
	 5cFlOzxS01bhijmBmcc3fqjtqgkeK9SNesEJT6fHTGrFORgQdqtsB3i/MCAb8Oy4X2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813907;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=P9FhyP19g4/Z7L4dlr4LVD3QYchlsaZ1ecHmn97OucQ=;
	b=HQXJJYf8aoL8cku/ji2TT8lmoybh5+OzsfuqQFEobEIT2yMyeDX4t7GrWUwyCHMPJjpk
	 b2ktrGplCkD7AxWc0PR1Txbc4W8NW3+imgY8H6N374/whFbB/hWa+xlPn5U8BjLS16iZM
	 DUTxnZREMUSkFj/w4gd/os0aqiXJOM6/FfVtSpoisC89f1mPKVMqk/zrP6+9a4c28Kr/T
	 4H7S8w5+F5j2v4PLUJSH3rMTpTyWft1fM9Pkx1pjKS5lN5Yh/TNq8ebRfqtpAfgXB648R
	 5J4Fw9KBtHN9WHR2Cf7Ody787hWZMZ/TCHW+ZCGMbAWATB9pG+zf3Xhs/xmxAvECm5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZxQPRN+q;
	arc=none smtp.remote-ip=91.218.175.152
Received: from mta0.migadu.com (out-152.mta0.migadu.com [91.218.175.152])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4F3606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E4F3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZxQPRN+q
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OXY/PavH/peuhwyWsspl7R73VH8ZvM8gYOCn3rjjGLo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794813904; v=1; x=1795418704;
 b=ZxQPRN+qu7BWvSx3kXczj3TqtMq6h+idph1ymQ/UAjMuVvCaz+l3nqnj/cdBwfXq3CezSd/f
 kSGSmMw90mjTid37RAkYaPHgeJPGbqMRJIgIV5k91akBjBR/8QgDuJc92WrRJZysa+ABSi2l/il
 K6Plhhlf10lTKaMl+uzv44Zk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 585cded695b6ca3a;
	Mon, 16 Nov 2026 07:25:03 +0000
X-Mizu-Trace-ID: 585cded695b6ca3a
X-Migadu-Flow: FLOW_OUT
Message-ID: <f5f1ecf6-d33a-4245-a522-34b986a3d7c2@linux.dev>
Date: Mon, 16 Nov 2026 15:24:59 +0800
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
Subject: Re: [PATCH-next v4 6/6] cgroup/cpuset: Fix lockdep_is_cpuset_held()
To: Waiman Long <longman@redhat.com>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Guopeng Zhang <guopeng.zhang@linux.dev>
References: <20261116012330.2271010-1-longman@redhat.com>
 <20261116012330.2271010-7-longman@redhat.com>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20261116012330.2271010-7-longman@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/16/2026 9:23 AM, Waiman Long wrote:
> Commit a84097e625f2 ("cgroup/cpuset: Call housekeeping_update()
> without holding cpus_read_lock") changes lockdep_is_cpuset_held()
> to return true if either cpuset_mutex or cpuset_top_mutex is held.
> lockdep_is_cpuset_held() is used by housekeeping_dereference_check()
> as one of the conditions that rcu_read_lock() is not needed to
> access HK_TYPE_DOMAIN cpumask that can be changed at run time.
> In reality, it should return true only if cpuset_top_mutex is held as
> housekeeping_update() is called with only cpuset_top_mutex held.
> 
> If only cpuset_mutex is held, it is possible that there can be a parallel
> housekeeping_update() call leading to a potential use-after-free situation
> when HK_TYPE_DOMAIN housekeeping cpumask is being accessed. It also
> means that rcu_read_lock will be required if only cpuset_mutex is being
> held like when calling from hotplug, scheduler or cgroup.
> 
> Fixes: a84097e625f2 ("cgroup/cpuset: Call housekeeping_update() without holding cpus_read_lock")
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>   kernel/cgroup/cpuset-v1.c | 16 ++++++++++------
>   kernel/cgroup/cpuset.c    |  9 +++++++--
>   2 files changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/kernel/cgroup/cpuset-v1.c b/kernel/cgroup/cpuset-v1.c
> index 7c7f2887dfaf..6bf6da639fec 100644
> --- a/kernel/cgroup/cpuset-v1.c
> +++ b/kernel/cgroup/cpuset-v1.c
> @@ -686,6 +686,7 @@ int cpuset1_generate_sched_domains(cpumask_var_t **domains,
>   	int csn;		/* how many cpuset ptrs in csa so far */
>   	int i, j;		/* indices for partition finding loops */
>   	cpumask_var_t *doms;	/* resulting partition; i.e. sched domains */
> +	cpumask_var_t hk_cpus;	/* HK_TYPE_DOMAIN housekeeping CPUs */
>   	struct sched_domain_attr *dattr;  /* attributes for custom domains */
>   	int ndoms = 0;		/* number of sched domains in result */
>   	int nslot;		/* next empty doms[] struct cpumask slot */
> @@ -698,6 +699,11 @@ int cpuset1_generate_sched_domains(cpumask_var_t **domains,
>   	dattr = NULL;
>   	csa = NULL;
>   
> +	alloc_cpumask_var(&hk_cpus, GFP_KERNEL);
> +	scoped_guard(rcu) {
> +		cpumask_copy(hk_cpus, housekeeping_cpumask(HK_TYPE_DOMAIN));
> +	}
> +

The return value of alloc_cpumask_var() isn't checked. With
CONFIG_CPUMASK_OFFSTACK=y, hk_cpus is NULL on failure. Maybe goto done
like the other allocation failures here?

Also, rebuild_sched_domains() can be called from outside cpuset, e.g.
arch_topology and the energy model, with only cpus_read_lock and
cpuset_mutex held. partition_sched_domains_locked() reads
HK_TYPE_DOMAIN in asym_cpu_capacity_scan() and in its fallback path.
Will these trigger a lockdep warning after this change? If so, do they
need an RCU read lock as well?


>   	/* Special case for the 99% of systems with one, full, sched domain */
>   	if (is_sched_load_balance(&top_cpuset)) {
>   		ndoms = 1;
> @@ -710,9 +716,7 @@ int cpuset1_generate_sched_domains(cpumask_var_t **domains,
>   			*dattr = SD_ATTR_INIT;
>   			update_domain_attr_tree(dattr, &top_cpuset);
>   		}
> -		cpumask_and(doms[0], top_cpuset.effective_cpus,
> -			    housekeeping_cpumask(HK_TYPE_DOMAIN));
> -
> +		cpumask_and(doms[0], top_cpuset.effective_cpus, hk_cpus);
>   		goto done;
>   	}
>   
> @@ -736,8 +740,7 @@ int cpuset1_generate_sched_domains(cpumask_var_t **domains,
>   		 */
>   		if (!cpumask_empty(cp->cpus_allowed) &&
>   		    !(is_sched_load_balance(cp) &&
> -		      cpumask_intersects(cp->cpus_allowed,
> -					 housekeeping_cpumask(HK_TYPE_DOMAIN))))
> +		      cpumask_intersects(cp->cpus_allowed, hk_cpus)))
>   			continue;
>   
>   		if (is_sched_load_balance(cp) &&
> @@ -794,7 +797,7 @@ int cpuset1_generate_sched_domains(cpumask_var_t **domains,
>   						*(dattr + nslot) = SD_ATTR_INIT;
>   				}
>   				cpumask_or(dp, dp, csa[j]->effective_cpus);
> -				cpumask_and(dp, dp, housekeeping_cpumask(HK_TYPE_DOMAIN));
> +				cpumask_and(dp, dp, hk_cpus);
>   				if (dattr)
>   					update_domain_attr_tree(dattr + nslot, csa[j]);
>   			}
> @@ -806,6 +809,7 @@ int cpuset1_generate_sched_domains(cpumask_var_t **domains,
>   
>   done:
>   	kfree(csa);
> +	free_cpumask_var(hk_cpus);
>   
>   	/*
>   	 * Fallback to the default domain if kmalloc() failed.
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 64cbcbdbf6da..d18439e13bce 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -343,10 +343,13 @@ void cpuset_full_unlock(void)
>   }
>   
>   #ifdef CONFIG_LOCKDEP
> +/*
> + * Holding cpuset_top_mutex will guarantee that a parallel
> + * housekeeping_update() call modifying housekeeping cpumasks is not possible.
> + */
>   bool lockdep_is_cpuset_held(void)
>   {
> -	return lockdep_is_held(&cpuset_mutex) ||
> -	       lockdep_is_held(&cpuset_top_mutex);
> +	return lockdep_is_held(&cpuset_top_mutex);
>   }
>   #endif
>   
> @@ -1416,8 +1419,10 @@ static bool prstate_housekeeping_conflict(int new_prs, int parent_prs,
>   		}
>   	}
>   
> +	rcu_read_lock();
>   	cpumask_and(full_hk_cpus, housekeeping_cpumask(HK_TYPE_KERNEL_NOISE),
>   		    housekeeping_cpumask(HK_TYPE_DOMAIN));
> +	rcu_read_unlock();
>   	cpumask_andnot(full_hk_cpus, full_hk_cpus, isolated_cpus);
>   	cpumask_and(full_hk_cpus, full_hk_cpus, cpu_active_mask);
>   	res = !cpumask_weight_andnot(full_hk_cpus, new_cpus);

-- 
Best regards
Ridong

