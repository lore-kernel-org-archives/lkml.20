Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6493521218
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791911400; cv=none; b=C8jzI+MxJ6LiuOJnbXMktJt39Om1+HYVWFXiZTaUgJOEEeR6fZ6mSrlpaAdpknp7nf+zXB7aPRetas58yUOjs6jrPUPuUIO5uteg/TzafaxZL/iH1308GN24RLsjaXT0McdFzztAu8MwHssp9g0dBV7YJU/+oAM2xzjQnrNxSao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791911400; c=relaxed/simple;
	bh=jKcoMmiIjHzkYBS2xCxAla4EG+wZPXIe7oERrnhY3Hg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XQIFTppZTeF4+QlXVTUlTFA1oAUmwzNhllG17HQ/HqiANGS9ASZYuIf1JFezKA8lbi+aK5fKw+dyZZV5CzZb1kvNJwOWA672F+Yc/fg2IVbjA+WNAScEKUhBuguxaY2vnQLmuBih6vqJEEYu7z0fyzYSJr1gYmKqUyURmDTOATY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E0/LujpG; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E0/LujpG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791911397; x=1823447397;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=jKcoMmiIjHzkYBS2xCxAla4EG+wZPXIe7oERrnhY3Hg=;
  b=E0/LujpGAyjMWF3UA4GLoi/yHpP1dtOkLUo1W/yZfajSqQ7DAPykFlYv
   vXisvbUULTgnuYFEWCxEhz3uIVEctLaAD3u0Uo9YX14XFZC3XbsZWV02E
   352Cnn7taS5AZmhpZ+GqWKy2zAdIqhJx0xLP9H+6mhc97jrVfxTUvQJyt
   T4bLXJtQfA2a7COiBZZM1sbFTdPwJMVvxljSdeaxM9Iu9zkssdftDLIus
   qHzA5n1vrvO1Z8yL1CYYde9XKT5F5v735qDEon1/tg6qbkZtfJl8vLy+Z
   BcCA1XlEON1WqKQQsERN6h64zD21f0lYzQuexBJZ/vU0J05dRiF7yY2d3
   g==;
X-CSE-ConnectionGUID: mhlHgxhRRGW2aXKVcWcwWg==
X-CSE-MsgGUID: mIuGpin1Q3CFQy7MSPRd9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="739351"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="739351"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 10:09:56 -0700
X-CSE-ConnectionGUID: NUYiTlxhRGqkyO2rrIRZOA==
X-CSE-MsgGUID: on//JLpuRE21U+Pwawr9wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1180790"
Received: from unknown (HELO [10.241.242.105]) ([10.241.242.105])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 10:09:56 -0700
Message-ID: <fa7a1d9240b0401c9f73f4978b6f60b3fa9206e6.camel@linux.intel.com>
Subject: Re: [PATCH v2] sched/cache: Avoid publishing partial LLC utilization
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Jemmy Wong <jemmywong512@gmail.com>, mingo@redhat.com,
 peterz@infradead.org, 	kprateek.nayak@amd.com, yu.c.chen@intel.com
Cc: juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, 	rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, 	linux-kernel@vger.kernel.org
Date: Tue, 13 Oct 2026 10:09:55 -0700
In-Reply-To: <20261013084338.55100-1-jemmywong512@gmail.com>
References: <20261013084338.55100-1-jemmywong512@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-10-13 at 16:43 +0800, Jemmy Wong wrote:
> update_sg_lb_stats() sums utilization over the CPUs in both
> sched_group_span(group) and env->cpus, but takes capacity from
> group->sgc->capacity for the whole group. record_sg_llc_stats()
> publishes both.
>=20
> Rejecting an all-affinity-pinned source runqueue removes that CPU from
> env->cpus and retries group selection. The retry can publish the
> partial utilization with the full capacity.
>=20
> can_migrate_llc() then treats a busy preferred LLC as having spare
> capacity. More tasks can aggregate into it, migrations out can be
> blocked, and two busy LLCs may not fall back to generic balancing.
> This increases CPU contention and task latency. Found by inspection.
>=20
> Skip publication on affinity retries using LBF_ALL_PINNED, retaining
> the first-pass snapshots and avoiding repeated cpumask checks. On the
> first pass, publish either shared LLC statistic only when env->cpus
> covers the whole group. Load balancing still uses the affinity-filtered
> statistics.
>=20
> The same window exists during CPU hotplug. env->cpus drops a CPU at
> set_cpu_active(false), but the group span and sgc->capacity still
> include it until cpuset_cpu_inactive() rebuilds the domains. Keeping
> the previous snapshot avoids the mismatched publish. After the rebuild,
> the next periodic balance records both statistics again.

Thanks.

Reviewed-by: Tim Chen <tim.c.chen@linux.intel.com>

Tim

>=20
> Suggested-by: K Prateek Nayak <kprateek.nayak@amd.com>
> Suggested-by: Tim Chen <tim.c.chen@linux.intel.com>
> Fixes: f025ef275388 ("sched/cache: Record per LLC utilization to guide ca=
che aware scheduling decisions")
> Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>
> ---
>=20
> v1: https://lore.kernel.org/r/20261010113425.34829-1-jemmywong512@gmail.c=
om/
>=20
> Changes since v1:
> - Skip publication on affinity retries using LBF_ALL_PINNED, retaining
>   first-pass snapshots and avoiding repeated cpumask checks, as suggested
>   by Prateek and Tim. Keep cpumask_subset() for partial group coverage
>   during CPU hotplug on the first pass.
> - Update the comment and commit message to explain the retry behavior.
> - Add Fixes and Suggested-by tags.
>=20
>  kernel/sched/fair.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 57360f5cdde4..dc01fdc0526d 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -12111,6 +12111,14 @@ static void record_sg_llc_stats(struct lb_env *e=
nv,
>  	if (env->sd->child !=3D rcu_dereference_all(per_cpu(sd_llc, env->dst_cp=
u)))
>  		return;
>=20
> +	/*
> +	 * A redo repeats stats published on the first pass. Hotplug can
> +	 * still leave env->cpus partial, so util would not match capacity.
> +	 */
> +	if ((env->flags & LBF_ALL_PINNED) ||
> +	    !cpumask_subset(sched_group_span(group), env->cpus))
> +		return;
> +
>  	/*
>  	 * At this point we know this group spans a LLC domain.
>  	 * Record the statistic of this group in its corresponding
>=20
> --
> 2.54.0 (Apple Git-157)
