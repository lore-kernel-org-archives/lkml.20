Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960414;
	b=QxtdNhsn043+/IURJHjWrZGIZsltGfvwmEckG8j+btRP9ctkiNX63fLaFz5mkgvyMeEO
	 3CCH5v8csmsxGUGQI8kHJdYfQNjXj2wIVvy39LheuLPlDS+UxFFvTzuP+8cfhGTeVt+fK
	 KbEf59korWYS+/2e6xiC5Jq0iKBurnzuZ5XCh6u6SwQ6LSF1y4XMCByqad6QF9/fsUmIe
	 PTVgmRevalaAfTd8GHwTtyDMNRGquJ4BRMbZIx0vii83U+ZGAxUB6Yy/LWwhRyqJzTcXE
	 db5u3EqHgGJA208qlEZU4K3bI+vWfu2vzKwFdGlZS0x9mNXuZbVA4q/OrEc52qtmz+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960414;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ar/hagR3Ji8q3nHgs3iyt5FGhrP0Dmu/n/kITHWcTQk=;
	b=gTqtls8obZq6cVdp827RW9WL7V9mhka1E/9MJelzzQAKpPKOKfsLSd9Y88ksK79E+yQZ
	 cU9Yr5s5nn9xEUySdb5O5zVJBy5m7O2TxXZKKH19vX2dSnonNUBGZYvdcEL704LC2Mo55
	 UwsyA1PzWQbpKCIm/nzpRvUOSr20Dshe0hcYnGKGIufyjCivvKvBNaYIM8ZK4mdxvelVR
	 kmaL0PUhgMfnArigQSH0UP0VhBsNgT9XVM590hMAAjROrVsnc+j2An929Y+tL+8e+jAQ1
	 RP/zVy2LPGqK82nEu0nxBRgd/dWNhqEwghF6ZqWA4909osP4X6VjzrSvmyGDpCs2KNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XkPgXedh;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F51606A33A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:20:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42F51606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XkPgXedh
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62CD71596;
	Fri,  6 Nov 2026 02:20:10 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1177B3F673;
	Fri,  6 Nov 2026 02:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793960413; bh=JOP4IwPSyM7I0nkHX3d+zIh2MVNJhK977ejOTBfvEUY=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=XkPgXedhhisyGRSKieUFEZPX1mbMYgAnx0KudkiXNnRc1BciBCmDEHHgNwDnjaRwu
	 IeY261xFrrmj1ZHogNMHQbt4POBf0va3lXJd5CcP72gWyNdnLL42Gh8NKcOb4EyVoL
	 5lEuMsFJJvXJ6gYxVwNxGh8DU5IkmPr6qppphARk=
Message-ID: <d2b32cd8-accc-4e65-8fe5-6829caccecc4@arm.com>
Date: Fri, 6 Nov 2026 10:20:10 +0000
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
Subject: Re: [PATCH] fs/resctrl: Give a monitor domain the counters the groups
 already use
To: Jinjie Ruan <ruanjinjie@huawei.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 babu.moger@amd.com, bp@alien8.de, x86@kernel.org,
 linux-kernel@vger.kernel.org
References: <20261106094537.2337188-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261106094537.2337188-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jinjie,

On 06/11/2026 09:45, Jinjie Ruan wrote:
> With assignable MBM counters, resctrl can be mounted while all CPUs of
> a monitor domain go offline and one of them comes back, either through
> CPU hotplug or because hibernation takes the non-boot CPUs offline. The
> domain is destroyed and re-created, and the new domain starts with no
> counters assigned. Counters are otherwise only assigned when a group is
> created, when rdtgroup_assign_cntrs() takes a free counter in each
> monitor domain for each MBM event, so no code revisits the groups that
> already exist.
> 
> Those groups read "Unassigned" on the new domain, on any system with
> assignable MBM counters. A counter assigned to them later through
> mbm_L3_assignments is the lowest free one in that domain, so the same
> group can end up with a different counter ID on different domains. For
> example, with the counter ID each group uses for mbm_total_bytes and
> "_" for none:
> 
>                                domain 0         domain 1
>   mount, mkdir g1              default=0 g1=1   default=0 g1=1
>   all CPUs of domain 1 offline default=0 g1=1   (destroyed)
>   one CPU of domain 1 online   default=0 g1=1   default=_ g1=_
>   assign g1 on domain 1        default=0 g1=1   default=_ g1=0
> 
> g1 now uses counter 0 on domain 1, the counter the default group uses
> on domain 0. On x86 each domain has its own counters, so a different ID
> on another domain changes nothing else. MPAM maps a counter ID to one
> hardware monitor for the whole resource, so the assignment moves g1 to
> the default group's monitor on every domain, and on domain 0 g1 reads
> the default group's monitor instead of its own.

Oh dear, that sounds like an MPAM driver bug to me. I think the fix should be there. At a hardware
level the counters are provided by the MSC and so there is no fundamental requirement for the same
index to be used across MPAM components/resctrl domains.

Thanks,

Ben

> 
> Assign the counters when the domain comes online, after its state is
> set up. Give each enabled MBM event of every group, including the
> monitor groups under mon_groups/, the counter ID the group uses in
> another domain, and leave the event unassigned when that ID is already
> taken on the new domain. Skip groups in pseudo-lock mode, as their RMID
> has been freed and they are not monitored.
> 
> A group that has no counter for an event in any domain stays unassigned
> on the new domain, as it was before. mbm_assign_on_mkdir only applies
> when a group is created, and counters that the user removed through
> mbm_L3_assignments stay removed.
> 
> Fixes: ef712fe97ec5 ("fs/resctrl: Auto assign counters on mkdir and clean up on group removal")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: <stable@vger.kernel.org> # 6.18+
> Cc: Tony Luck <tony.luck@intel.com>
> Cc: Reinette Chatre <reinette.chatre@intel.com>
> Cc: Babu Moger <babu.moger@amd.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Ben Horgan <ben.horgan@arm.com>
> Cc: Dave Martin <Dave.Martin@arm.com>
> ---
>  fs/resctrl/internal.h |   2 +
>  fs/resctrl/monitor.c  | 117 +++++++++++++++++++++++++++++++++++++++++-
>  fs/resctrl/rdtgroup.c |   4 ++
>  3 files changed, 121 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
> index c95fa6ce62e6..31c1c04a3c51 100644
> --- a/fs/resctrl/internal.h
> +++ b/fs/resctrl/internal.h
> @@ -437,6 +437,8 @@ int resctrl_available_mbm_cntrs_show(struct kernfs_open_file *of, struct seq_fil
>  
>  void rdtgroup_assign_cntrs(struct rdtgroup *rdtgrp);
>  
> +void resctrl_mbm_cntr_assign_domain(struct rdt_resource *r, struct rdt_l3_mon_domain *d);
> +
>  void rdtgroup_unassign_cntrs(struct rdtgroup *rdtgrp);
>  
>  int event_filter_show(struct kernfs_open_file *of, struct seq_file *seq, void *v);
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index 717c3888c2b5..744961a78435 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -425,6 +425,44 @@ static int mbm_cntr_get(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
>  	return -ENOENT;
>  }
>  
> +/*
> + * Return the counter ID @rdtgrp uses for @evtid in a domain other than @d,
> + * taken from the first domain that has one. Counters are allocated on every
> + * domain together, so a group usually has the same ID everywhere. MPAM relies
> + * on this as it maps a counter ID to one monitor for the whole resource; x86
> + * does not. @d is skipped in case it is already on the list.
> + *
> + * Return:
> + * Valid counter ID on success, or -ENOENT on failure.
> + */
> +static int mbm_cntr_get_other(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
> +			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
> +{
> +	struct rdt_l3_mon_domain *dom;
> +	int cntr_id;
> +
> +	list_for_each_entry_rcu(dom, &r->mon_domains, hdr.list, lockdep_is_cpus_held()) {
> +		if (dom == d)
> +			continue;
> +
> +		cntr_id = mbm_cntr_get(r, dom, rdtgrp, evtid);
> +		if (cntr_id >= 0)
> +			return cntr_id;
> +	}
> +
> +	return -ENOENT;
> +}
> +
> +/*
> + * mbm_cntr_claim() - Mark the counter @cntr_id in domain @d as used by @rdtgrp.
> + */
> +static void mbm_cntr_claim(struct rdt_l3_mon_domain *d, int cntr_id,
> +			   struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
> +{
> +	d->cntr_cfg[cntr_id].rdtgrp = rdtgrp;
> +	d->cntr_cfg[cntr_id].evtid = evtid;
> +}
> +
>  /*
>   * mbm_cntr_alloc() - Initialize and return a new counter ID in the domain @d.
>   * Caller must ensure that the specified event is not assigned already.
> @@ -439,8 +477,7 @@ static int mbm_cntr_alloc(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
>  
>  	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
>  		if (!d->cntr_cfg[cntr_id].rdtgrp) {
> -			d->cntr_cfg[cntr_id].rdtgrp = rdtgrp;
> -			d->cntr_cfg[cntr_id].evtid = evtid;
> +			mbm_cntr_claim(d, cntr_id, rdtgrp, evtid);
>  			return cntr_id;
>  		}
>  	}
> @@ -1414,6 +1451,82 @@ void rdtgroup_assign_cntrs(struct rdtgroup *rdtgrp)
>  					   &mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID]);
>  }
>  
> +/*
> + * Give @rdtgrp the counter IDs it uses on the other domains, on @d.
> + */
> +static void resctrl_mbm_cntr_assign_group(struct rdt_resource *r,
> +					  struct rdt_l3_mon_domain *d,
> +					  struct rdtgroup *rdtgrp)
> +{
> +	struct mon_evt *mevt;
> +
> +	/* Pseudo-locked groups have no RMID and are not monitored. */
> +	if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP ||
> +	    rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED)
> +		return;
> +
> +	for_each_mon_event(mevt) {
> +		int cntr_id;
> +
> +		if (mevt->rid != r->rid || !mevt->enabled ||
> +		    !resctrl_is_mbm_event(mevt->evtid))
> +			continue;
> +
> +		if (mbm_cntr_get(r, d, rdtgrp, mevt->evtid) >= 0)
> +			continue;
> +
> +		/* A group without a counter on any domain stays unassigned. */
> +		cntr_id = mbm_cntr_get_other(r, d, rdtgrp, mevt->evtid);
> +		if (cntr_id < 0)
> +			continue;
> +
> +		/*
> +		 * Allocating a different ID would change the group's mapping for
> +		 * the whole resource on MPAM, so leave the event unassigned.
> +		 */
> +		if (d->cntr_cfg[cntr_id].rdtgrp) {
> +			pr_warn_ratelimited("Counter %d for %s is in use in domain %d\n",
> +					    cntr_id, mevt->name, d->hdr.id);
> +			continue;
> +		}
> +
> +		mbm_cntr_claim(d, cntr_id, rdtgrp, mevt->evtid);
> +		rdtgroup_assign_cntr(r, d, mevt->evtid, rdtgrp->mon.rmid,
> +				     rdtgrp->closid, cntr_id, true);
> +	}
> +}
> +
> +/**
> + * resctrl_mbm_cntr_assign_domain() - Assign counters to the existing groups on
> + *				      a monitor domain that has just come online.
> + * @r:	The resource the domain belongs to.
> + * @d:	The domain that has just come online.
> + *
> + * A new domain has no counters assigned. Give each group, including the
> + * monitor groups below a control group, the counter IDs it uses in the other
> + * domains. A group that has no counter for an event in any domain stays
> + * unassigned: mbm_assign_on_mkdir only applies when a group is created, and
> + * counters that the user removed through mbm_L3_assignments stay removed.
> + *
> + * Called with rdtgroup_mutex held while resctrl is mounted.
> + */
> +void resctrl_mbm_cntr_assign_domain(struct rdt_resource *r, struct rdt_l3_mon_domain *d)
> +{
> +	struct rdtgroup *prgrp, *crgrp;
> +
> +	if (!resctrl_arch_mbm_cntr_assign_enabled(r))
> +		return;
> +
> +	lockdep_assert_held(&rdtgroup_mutex);
> +
> +	list_for_each_entry(prgrp, &rdt_all_groups, rdtgroup_list) {
> +		resctrl_mbm_cntr_assign_group(r, d, prgrp);
> +
> +		list_for_each_entry(crgrp, &prgrp->mon.crdtgrp_list, mon.crdtgrp_list)
> +			resctrl_mbm_cntr_assign_group(r, d, crgrp);
> +	}
> +}
> +
>  /*
>   * rdtgroup_free_unassign_cntr() - Unassign and reset the counter ID configuration
>   * for the event pointed to by @mevt within the domain @d and resctrl group @rdtgrp.
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 3c002b711024..106e78fb1f1d 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -4707,6 +4707,10 @@ int resctrl_online_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *hdr
>  	if (err)
>  		goto out_unlock;
>  
> +	/* The new domain has no counters for the existing groups yet. */
> +	if (resctrl_mounted)
> +		resctrl_mbm_cntr_assign_domain(r, d);
> +
>  	if (resctrl_is_mbm_enabled()) {
>  		INIT_DELAYED_WORK(&d->mbm_over, mbm_handle_overflow);
>  		mbm_setup_overflow_handler(d, MBM_OVERFLOW_INTERVAL,

