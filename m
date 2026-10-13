Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F33A521236
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791911511; cv=none; b=WeZWXq+K89lwRmAS3jVauPk/EtW47FeQtGt0pPThFB4nKEMt3uJjy33dHMC5jyN9e4bpbGAZ6Cz/PWpU+OQiaVQE+orKw3qzSqD2uf8w0ERDWBYsFJEnVkLNqPVwksYR5wwKGPrR6BZTnXCKke4SBbtypmZDrG6IGjfQvkPXazo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791911511; c=relaxed/simple;
	bh=HtowRJsUwg4PNKjvaAjRuA7NLeSkaTDUlND1/8cCaXA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Brl4KZ8HAOuXhIwOwEcu2kUs+UQ3xm/pLwUkbzNiUwMOdtVkED1aAHKjzofuYgaWO4be55T9N8wNZTOxoVJBkNWVOqQ0ZgABIDOxjNQZFrgh1XGatvAlDJHcY13gLb0orYx2Fw6ETYqSJ4SPy6J6K5LbLAm+04fRWnUGC9sJ2Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DyuvPbvH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DyuvPbvH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791911510; x=1823447510;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=HtowRJsUwg4PNKjvaAjRuA7NLeSkaTDUlND1/8cCaXA=;
  b=DyuvPbvHtAgc35RYjer6JpjTg5aGGPnz1NoBCc9lKhTwsMA9+oHTOWsC
   QIcRISca9ypsXGvASGSpvfAkTissY1eBXiq1/deAjAUNC93fKu/Ag6tSP
   +W0VqnQrD6QPR4GyMZ1D5Vb4QP0Spwilhv3ZImdQZ0vkGZt2YQKbbNRWg
   /vj0Lm1UxRyB6a3szJuD73gOB2aExTx02kG20eWyV6Ou2uq8acnn5TsiW
   zre1EBaGB+2/xmD1mMHC/klLeQRlBSh0c6FvvJLuoL3CjdEILHIvxKaA8
   rFFXLH/OePv05xdQUpmDMlB9+gBX2Z68Gy2BN9bFyAq4x9VZ9v7NzT3gC
   Q==;
X-CSE-ConnectionGUID: StB3+egNTuu0cRkjDR34Zg==
X-CSE-MsgGUID: bq1qkQvvTpO0a4VmGuMzQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="739613"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="739613"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 10:11:50 -0700
X-CSE-ConnectionGUID: rTLiwan9QDmpAKbOwlq4OA==
X-CSE-MsgGUID: 0tG/2zHOTjGVc07BnIDopQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1105934"
Received: from unknown (HELO [10.241.242.105]) ([10.241.242.105])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 10:11:49 -0700
Message-ID: <98a75f35d1f382e35f19a6cca87935ca41339c66.camel@linux.intel.com>
Subject: Re: [PATCH v2] sched/cache: Avoid publishing partial LLC utilization
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Jemmy Wong <jemmywong512@gmail.com>, mingo@redhat.com,
 peterz@infradead.org, 	kprateek.nayak@amd.com, yu.c.chen@intel.com
Cc: juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, 	rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, 	linux-kernel@vger.kernel.org
Date: Tue, 13 Oct 2026 10:11:49 -0700
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
>=20
> Suggested-by: K Prateek Nayak <kprateek.nayak@amd.com>
> Suggested-by: Tim Chen <tim.c.chen@linux.intel.com>
> Fixes: f025ef275388 ("sched/cache: Record per LLC utilization to guide ca=
che aware scheduling decisions")
> Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>

BTW, I think this is also a candidate for 7.2.x stable.

Tim

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
>=20
