Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B22236B907
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791579719; cv=none; b=V4jYmZq2KdaS+CxO59JAVUF7t53Ye6f+kgNGgbzbBszuoVTuMAkX6HqUNBRm+pmPII6t5h/mFvyHF/8doj/SPtje3WfyIac6B0kfKZoTYwrEk5+AoYhwedNKZYZ+nwc/LyZbH2V2vzln6UYyDLgEBBFayrrvGQSq5gbpwN/9Af0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791579719; c=relaxed/simple;
	bh=6iCGaSQqJJmu9MvX10MaJyCioLIG89Gt/JVrx+zJcfU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dF1GzqcsFyU5+z+3Noa9H3vS4wgM1MwNChXQc3uz2l1B8WfELzqHQwAs7516k6+P7GMc6c4JhUc/+EZVo4eDLlLcaWOLfprP9NQoYzBBsakFcqzF2blnXbxjgv+945NgNFRpY61NKx8irg4d8bcb0EAEYSsgbojSrZsXKfEAOUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GdfnjVhb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GdfnjVhb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791579718; x=1823115718;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=6iCGaSQqJJmu9MvX10MaJyCioLIG89Gt/JVrx+zJcfU=;
  b=GdfnjVhb814EeEEEn1KYY2637hYWDOx5sDAaUFiDw3RByDUFtheMTWBt
   /nqSNr890de+rJQvUWnkpUj1J0AdbDaoGnCZO8bwM1/w93bShzuRuRdKS
   p3qKqSWyYsL0cGyxAcPeBC0XsknWETl2mTEhvCfVwbCI5ORE+EapldbC0
   NKXGQfrgsMoMw3eFjfUTg4Hz8XEdwlfS4PQS6UDo0W43dyQllxcZnhYTy
   +kzKPZkT6u7qAkFs2GEnepPrsiYA05RdVNxCkNs+Wuc+yxHhlFtwRKaUQ
   klPtpcTqzRqgVKemefhhy58VSSBTNEXNgUqsGRA88uVa8T1FcE7tH3AQb
   w==;
X-CSE-ConnectionGUID: difcCv/KSOikpt8EUOrHEg==
X-CSE-MsgGUID: TSyQw6wZTHSMERGjCivrjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="279572"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="279572"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 14:01:57 -0700
X-CSE-ConnectionGUID: W/D4B5vFRUihlaDKLMm+rw==
X-CSE-MsgGUID: wDRdHnAlTZKxiKROKOVWNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="853743"
Received: from schen9-mobl4.amr.corp.intel.com (HELO [10.125.109.103]) ([10.125.109.103])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 14:01:57 -0700
Message-ID: <b73d47b04b62d2637920f59134b632d607a71aee.camel@linux.intel.com>
Subject: Re: [PATCH] sched/cache: Remove the old cache group footprint on
 exec
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Jemmy Wong <jemmywong512@gmail.com>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot	
 <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K
 Prateek Nayak <kprateek.nayak@amd.com>, Chen Yu <yu.c.chen@intel.com>, 
	linux-kernel@vger.kernel.org
Date: Fri, 09 Oct 2026 14:01:56 -0700
In-Reply-To: <20261009151215.62878-1-jemmywong512@gmail.com>
References: <20261009151215.62878-1-jemmywong512@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-10-09 at 23:12 +0800, Jemmy Wong wrote:
> Exec replaces the task's cache group before resetting its NUMA fault
> statistics, but only the exit path subtracts the task's contribution
> from the old group's footprint.
>=20
> Although de_thread() removes other members of the executing task's
> thread group, tasks created with CLONE_VM without CLONE_THREAD can
> retain the old mm and cache group. The executing task's contribution
> then remains in that group without further updates or decay, potentially
> suppressing cache-aware aggregation through the LLC capacity check.

Thanks for catching this.

It might help to mention vfork() explicitly, where the parent keeps the old=
 mm
alive while the child execs. In practice a vfork child rarely builds
up NUMA faults before exec, since NUMA scanning starts late, so the
leak mostly matters for longer-lived CLONE_VM tasks that later exec. If
you have a workload where you saw this, please mention it. Otherwise,
saying it was found by code inspection is fine.

Please also add:

Fixes: b636fef85bda ("sched/cache: Introduce task_struct->sched_cache_grp t=
o fix UAF")


>=20
> Factor the existing footprint subtraction into a helper and use it when
> leaving a cache group on both exec and exit. Subtract before dropping the
> old group reference, preserving the existing underflow protection.
>=20
> Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>
> ---
>  kernel/sched/fair.c | 51 ++++++++++++++++++++++++++-------------------
>  1 file changed, 29 insertions(+), 22 deletions(-)
>=20
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 57360f5cdde4..af182c9fcde7 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1771,6 +1771,25 @@ void sched_cache_fork_cleanup(struct task_struct *=
p)
>  	RCU_INIT_POINTER(p->sched_cache_grp, NULL);
>  }
> =20
> +static void sched_cache_footprint_sub(struct sched_cache_group *grp,
> +				      struct task_struct *p)
> +{
> +#ifdef CONFIG_NUMA_BALANCING
> +	/*
> +	 * Remove this task's contribution when it leaves the group, either
> +	 * through exit or exec. Other thread groups sharing the old mm can
> +	 * keep the group alive after exec resets this task's NUMA statistics.
> +	 * Unlocked for performance; clamp to avoid underflow.
> +	 */
> +	if (grp && p->total_numa_faults) {
> +		unsigned long fp =3D READ_ONCE(grp->footprint);
> +		unsigned long sub =3D min(fp, p->total_numa_faults);
> +
> +		WRITE_ONCE(grp->footprint, fp - sub);
> +	}
> +#endif
> +}
> +
>  void sched_cache_exec_mmap(struct task_struct *p, struct mm_struct *mm)
>  {
>  	struct sched_cache_group *old;
> @@ -1780,6 +1799,7 @@ void sched_cache_exec_mmap(struct task_struct *p, s=
truct mm_struct *mm)
>  	 * the old one. @p is current and the only writer of its own pointer.
>  	 */
>  	old =3D sched_cache_replace_grp(p, sched_cache_group_get(mm->sched_cach=
e_grp));
> +	sched_cache_footprint_sub(old, p);
>  	sched_cache_group_put(old);
>  }

This relies on running before task_numa_free() in bprm_execve()
clears p->total_numa_faults, and nothing enforces that ordering. A
short comment here noting the dependency would keep a future exec
rework from quietly bringing the leak back.

With the changelog and comment tweaks above:

Reviewed-by: Tim Chen <tim.c.chen@linux.intel.com>



> =20
> @@ -1787,19 +1807,7 @@ void sched_cache_exit_mm(struct task_struct *p)
>  {
>  	struct sched_cache_group *grp =3D sched_cache_replace_grp(p, NULL);
> =20
> -#ifdef CONFIG_NUMA_BALANCING
> -	/*
> -	 * Subtract this task's footprint from the group before dropping the
> -	 * reference, so the group footprint converges as its threads exit.
> -	 * Unlocked for performance; clamp to avoid underflow.
> -	 */
> -	if (grp && p->total_numa_faults) {
> -		unsigned long fp =3D READ_ONCE(grp->footprint);
> -		unsigned long sub =3D min(fp, p->total_numa_faults);
> -
> -		WRITE_ONCE(grp->footprint, fp - sub);
> -	}
> -#endif
> +	sched_cache_footprint_sub(grp, p);
>  	sched_cache_group_put(grp);
>  }
> =20
> @@ -3975,16 +3983,15 @@ static void task_numa_placement(struct task_struc=
t *p)
>  			 * sharing this mm. Acceptable since footprint is a
>  			 * heuristic and occasional lost updates are tolerable.
>  			 *
> -			 * If a task exits, its corresponding footprint must
> -			 * be subtracted from p->sched_cache_grp->footprint,
> -			 * otherwise the footprint will not converge: the
> -			 * exiting thread's footprint remains unchanged/undecayed.
> -			 * See exit_mm().
> +			 * If a task leaves its cache group through exit or exec,
> +			 * its contribution must be subtracted from the old group's
> +			 * footprint. Otherwise, that contribution remains
> +			 * unchanged/undecayed while other tasks keep the group alive.
> +			 * See sched_cache_footprint_sub().
>  			 *
> -			 * Lost updates and unsynchronized subtraction
> -			 * in exit_mm() can cause footprint + diff to
> -			 * go negative. Clamp to zero to prevent the
> -			 * unsigned footprint from wrapping.
> +			 * Lost updates and unsynchronized subtraction on exit or
> +			 * exec can cause footprint + diff to go negative. Clamp
> +			 * to zero to prevent the unsigned footprint from wrapping.
>  			 */
>  			scoped_guard(rcu) {
>  				grp =3D rcu_dereference(p->sched_cache_grp);
