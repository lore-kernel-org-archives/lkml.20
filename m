Received: from mta1.migadu.com (out-199.mta1.migadu.com [95.215.58.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6E652E042
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790693507; cv=none; b=lHIUWb4ZUzDgsbUqH4rU07mpwPT9AAz2RakfvoWlnIoPXiFIlGhokZUcLAUvBQ1DjG+ESFWlTOpVwSQNsoySsHgB0lcGB2C4erHb5KlJXUFHMlK+8CZHAZvWUDpSiYv0ZpUf5iYQY+nq3JvFEBE0GzxYGlVuwK3GEgHOLMgoP58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790693507; c=relaxed/simple;
	bh=XZPyfvt4g57ouREqJbckahQeqiNknydY9I/3u2/4oGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d5jlPFi0CdER2FKEDskzH5vc86hqwtui+PhvzTrV7b1nyzlzwDhDhfZwSU2fcXFfeCbKfZpZXFKYAfYTPBLLFZm4iAyxMQHjOgocFoa2fXUjtPYDLiqPIpMr1RDW3t591/iiP5G3K66VulWNOLtCMC29+TiB2JPoPHnPaOXhaeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OpqieAXn; arc=none smtp.client-ip=95.215.58.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OpqieAXn"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XZPyfvt4g57ouREqJbckahQeqiNknydY9I/3u2/4oGg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790693503; v=1; x=1791298303;
 b=OpqieAXnVDqAUnSi8lpcNf9AxSZ3XGmM6QJ3FWVLq+Re3EPF2FcXUsH+17IYR+9VTxLHQ0F8
 lmtJPIFrO3lYOAI2SVj/rcJHh7TQudyPOjAGyeWqVzhy6t4WCd2xBJBlGibDR8X/p4jFpUwo5gO
 KuCa70v7QooDp0ozX1cNds2k=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a86e1109c0f04003;
	Tue, 29 Sep 2026 14:51:43 +0000
X-Mizu-Trace-ID: a86e1109c0f04003
X-Migadu-Flow: FLOW_OUT
Date: Tue, 29 Sep 2026 22:52:04 +0800
From: Chen Yu <chen.yu@linux.dev>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Chen Yu <yu.c.chen@intel.com>, tony.luck@intel.com, tglx@kernel.org,
	bp@alien8.de, mingo@redhat.com, dave.hansen@linux.intel.com,
	hpa@zytor.com, fenghuay@nvidia.com, babu.moger@amd.com,
	hongyu.ning@intel.com, x86@kernel.org, linux-kernel@vger.kernel.org,
	Hongyu Ning <hongyu.ning@linux.intel.com>
Subject: Re: [PATCH v8 4/9] x86/resctrl: Attach ACPI ERDT information to L3
 mon domain on CPU online
Message-ID: <arvQlK5X-hRhIKsG@three-body>
References: <cover.1789705667.git.yu.c.chen@intel.com>
 <1299d05391a5095a151d6204a459d6ca0f431462.1789705667.git.yu.c.chen@intel.com>
 <f79a0d30-2a3d-49dc-9632-b8a81e4fa7d8@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f79a0d30-2a3d-49dc-9632-b8a81e4fa7d8@intel.com>

Hi Reinette,

On Mon, Sep 28, 2026 at 02:44:19PM -0700, Reinette Chatre wrote:
> Hi Chenyu,
> 
> On 9/17/26 9:50 PM, Chen Yu wrote:
> > Reading LLC occupancy counters via MMIO requires the per-domain ERDT
> > information, parsed from the ACPI ERDT table, to be reachable from the resctrl
> > L3 monitoring domain. Nothing links the two yet, so the monitoring code cannot
> > locate the MMIO registers of a domain.
> 
> Last sentence sets this change up as a bugfix when it is actually a preparatory patch.
>

OK, let me rephase it to:
In preparation for MMIO-based LLC occupancy monitoring, link the per-domain ERDT information
to the resctrl L3 monitoring domain, so the MMIO read path can locate a domain's MMIO registers.
 
> > 
> > ERDT and CPUID enumerate CPU-to-L3-domain membership independently: CPUID leaf 4
> > describes the L3 cache topology, while the firmware CACD sub-table lists the
> > CPUs of each ERDT domain. Both views must agree on a CPU's L3 domain for that
> > CPU to be monitored safely.
> > 
> > When a CPU comes online, validate that firmware and CPUID agree on its L3 domain
> > before adding it to any resctrl domain. Exclude the CPU from all resctrl domains
> > on a mismatch because a topology inconsistency between ERDT and CPUID indicates
> > a firmware defect that makes the CPU's domain placement unreliable for any
> > resource. Otherwise attach the matching ERDT domain information to the L3
> > monitoring domain so that monitoring data can be read via ERDT and its
> > sub-tables.
> > 
> > Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> > Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> > Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> > ---
> >  arch/x86/kernel/cpu/resctrl/core.c     |  16 ++++
> >  arch/x86/kernel/cpu/resctrl/erdt.c     | 109 +++++++++++++++++++++++++
> >  arch/x86/kernel/cpu/resctrl/internal.h |   5 ++
> >  3 files changed, 130 insertions(+)
> > 
> > diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
> > index 54cfdf12dfbb..3514d73a8056 100644
> > --- a/arch/x86/kernel/cpu/resctrl/core.c
> > +++ b/arch/x86/kernel/cpu/resctrl/core.c
> > @@ -34,6 +34,9 @@
> >   * the domain list must either take cpus_read_lock(), or rely on an RCU
> >   * read-side critical section, to avoid observing concurrent modification.
> >   * All writers take this mutex:
> 
> Above sentence ends with ":" since the definition used to follow it, adding
> text below it breaks this reference. 
>

OK, let me move above sentence above the "All writers take this mutex".
 
> > + *
> > + * This mutex also protects the ERDT domain_info_list, which is modified when a
> > + * CPU comes online.
> 
> Please read the comment that is above this added line ...
> 
> >   */
> >  static DEFINE_MUTEX(domain_list_lock);
> >  
> > @@ -564,6 +567,8 @@ static void l3_mon_domain_setup(int cpu, int id, struct rdt_resource *r, struct
> >  		return;
> >  	}
> >  	list_add_tail_rcu(&d->hdr.list, add_pos);
> > +
> > +	erdt_l3_mon_domain_setup(id, &d->hdr);
> 
> ... the comment above domain_list_lock's definition explains how the domain list
> is managed between resctrl fs and the architecture. Even though this change is made
> with domain_list_lock held the above setup _after_ adding the domain to the RCU list
> changes the resctrl monitoring domain _after_ it is made available to resctrl filesystem
> via the RCU list.
> 
> This issue was also flagged by sashiko:
> https://sashiko.dev/#/patchset/cover.1789705667.git.yu.c.chen%40intel.com?part=9
>

The writer l3_mon_domain_setup() not only holds domain_list_lock but also the cpus_write,
because l3_mon_domain_setup() is invoked in cpu hotplug path. And the reader  mon_event_read()
which access the monitoring domain hold cpus_read_lock(), so the race might
not be triggered. But for safety reason in case in the future there is other reader
uses list_for_each_rcu() to access the domain without the lock, we should move erdt_l3_mon_domain_setup()
before the rcu publish.

> 
> Apart from above I think this is the first hint that SNC and ERDT is not quite
> integrated. Sashiko also found a couple of SNC vs ERDT sticky points.
> For above, please consider that when SNC is enabled then resctrl sets the scope
> of the L3 resource's monitoring domains to be RESCTRL_L3_NODE. That means that
> @id parameter of l3_mon_domain_setup() could be the NUMA node ID, not L3 cache ID.
> 
> erdt_l3_mon_domain_setup() seems to assume an L3 cache ID and just searches for
> a matching ERDT domain.
>

Yes, I did not deal with SNC much in this version because it seems that SNC and the
current ERDT cannot co-exist. According to the RDT spec, Table 0-1 (Glossary, Acronym):
"RMD - Resource Management Domain: A set of features defined within a particular cache
domain, such as an L3 cache supporting a number of logical processors."
This implies that the smallest domain in ERDT is cache scope, it can not be node scope,
so dividing a single LLC into several SNC nodes is not supported by the current RMD.

If ERDT's support for SNC scope is added in the future, we can update erdt.c to handle SNC 
(hopefully the ERDT tables will contain SNC ID information).

> >  }
> >  
> >  static void domain_add_cpu_mon(int cpu, struct rdt_resource *r)
> > @@ -742,6 +747,17 @@ static int resctrl_arch_online_cpu(unsigned int cpu)
> >  	struct rdt_resource *r;
> >  
> >  	mutex_lock(&domain_list_lock);
> > +	/*
> > +	 * A CPU whose ERDT and CPUID L3 domain views disagree is not added to
> > +	 * any domain. resctrl_arch_offline_cpu() still tries to remove it when
> > +	 * it goes offline and warns that no domain contains it. That warning is
> > +	 * expected.
> > +	 */
> > +	if (!erdt_cpu_valid(cpu)) {
> > +		mutex_unlock(&domain_list_lock);
> > +		return 0;
> > +	}
> > +
> >  	for_each_capable_rdt_resource(r)
> >  		domain_add_cpu(cpu, r);
> >  	mutex_unlock(&domain_list_lock);
> > diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
> > index 0dfe5eda166c..249ba547d7c8 100644
> > --- a/arch/x86/kernel/cpu/resctrl/erdt.c
> > +++ b/arch/x86/kernel/cpu/resctrl/erdt.c
> > @@ -209,6 +209,115 @@ static __init bool parse_rmdd_table(struct acpi_subtbl_hdr_16 *rmdd_hdr)
> >  	return false;
> >  }
> >  
> > +bool erdt_cpu_valid(int cpu)
> 
> The function name "erdt_cpu_valid()" that returns a bool creates impression that it
> just does a validity check without changing any state. This function does more than this.
> How about something like "erdt_try_bind_cpu(int cpu)" and then the supporting text in changelog
> can be "... validate and bind the CPU to its ERDT domain ...".
>

OK, will rename the function and update the changelog.
 
> > +{
> > +	struct erdt_domain_info *d, *cpu_dom = NULL;
> > +	int dom_id;
> > +
> > +	/* Without ERDT there is no firmware topology to disagree with. */
> > +	if (!erdt_enabled)
> > +		return true;
> > +
> > +	dom_id = get_cpu_cacheinfo_id(cpu, RESCTRL_L3_CACHE);
> > +	if (dom_id < 0) {
> > +		pr_warn(FW_BUG "Can't find L3 id for CPU:%d\n", cpu);
> > +		return false;
> > +	}
> > +
> > +	/*
> > +	 * Find the erdt_domain_info that contains this CPU, then bind that ERDT
> > +	 * domain to this CPU's L3 id. A CPU whose L3 id does not match the binding
> > +	 * of its ERDT domain cannot be covered by resctrl.
> > +	 *
> > +	 * For example, the CACD sub-tables report:
> > +	 * domain0: CPU0, CPU2, domain1: CPU1, CPU3
> > +	 * while CPUID/cacheinfo reports the L3 cache is shared by:
> > +	 * id0: CPU0, CPU1, id1: CPU2, CPU3
> > +	 * With the CPUs coming online in order, CPU0 binds domain0 to L3 id0 and
> > +	 * CPU3 binds domain1 to L3 id1, so CPU1 and CPU2 are not covered by
> > +	 * resctrl.
> > +	 */
> 
> Please move this comment block to be the comment of the entire function. It does not
> have to be kernel-doc but it could borrow some of the style, for example, "this CPU"
> can be @cpu to make it clear it refers to the function parameter.
>
> The "With the CPUs coming online in order" also seems to describe whole function
> and not just the snippet below it. With the function comment describing the example
> entirely the smaller snippets within functions can refer to it more coherently.
> 

OK, will move them to be the comment of the function.

> > +
> > +	/*
> > +	 * A possible new binding. Check if another ERDT domain shares the same
> > +	 * L3 id. If yes, this is a conflict and this CPU should not be considered
> > +	 * by resctrl:
> > +	 * When CPU1 is brought online, a new domain1 is found. But then it found that
> 
> Above is mixing tense
>

OK, will fix all of them.
 
> > +	 * domain0's ID is 0, which is the same as CPU1's dom_id, so CPU1 is ineligible.
> > +	 */
> > +	list_for_each_entry(d, &domain_info_list, entry) {
> > +		if (d == cpu_dom)
> > +			continue;
> > +
> > +		if (d->dom_id == dom_id) {
> > +			pr_warn(FW_BUG "CPU%d's id=%d is already used by CACD domain(%*pbl), skip this CPU\n",
> > +				cpu, dom_id, cpumask_pr_args(&d->cpu_mask));
> > +
> > +			return false;
> > +		}
> > +	}
> > +
> > +	/* Eligible new binding, assign the L3 id. */
> > +	cpu_dom->dom_id = dom_id;
> > +
> > +	return true;
> > +}
> > +
> > +/*
> > + * Associate ERDT table information with this domain.
> > + */
> > +void erdt_l3_mon_domain_setup(int id, struct rdt_domain_hdr *hdr)
> 
> @id is unnecessary, function can just use hdr->id (but keep above comment about
> @id not always being an L3 cache ID in mind).
>

OK, will remove the @id parameter.
 
> > +{
> > +	struct rdt_hw_l3_mon_domain *hw_dom;
> > +	struct erdt_domain_info *d;
> > +
> > +	if (!erdt_enabled)
> > +		return;
> > +
> > +	hw_dom = resctrl_to_arch_mon_dom(container_of(hdr, struct rdt_l3_mon_domain, hdr));
> > +
> > +	list_for_each_entry(d, &domain_info_list, entry) {
> > +		if (d->dom_id == id) {
> > +			/* Assign the ERDT information to hw_dom */
> 
> This comment is just duplicate of function comment and does not add any information
> to the code it aims to describe.
>

OK, will remove it.
 
> > +			if (hw_dom->d_info) {
> 
> Is this necessary? hw_dom has just been kzalloc'ed so it cannot have any value here 
>

Right, this is not needed, the duplicated case has been covered in erdt_cpu_valid().
 
> > +				pr_warn(FW_BUG "Duplicated ERDT domains are mapped to an existing L3 domain\n");
> > +				return;
> > +			}
> > +			hw_dom->d_info = d;
> > +			return;
> > +		}
> > +	}
> > +}
> > +
> >  void erdt_exit(void)
> >  {
> >  	struct erdt_domain_info *d, *tmp;
> > diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> > index 156206088372..2e8fb36ad804 100644
> > --- a/arch/x86/kernel/cpu/resctrl/internal.h
> > +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> > @@ -97,14 +97,19 @@ struct rdt_hw_ctrl_domain {
> >   * @arch_mbm_states:	Per-event pointer to the MBM event's saved state.
> >   *			An MBM event's state is an array of struct arch_mbm_state
> >   *			indexed by RMID on x86.
> > + * @d_info:		ERDT table information of this domain
> >   *
> >   * Members of this structure are accessed via helpers that provide abstraction.
> >   */
> >  struct rdt_hw_l3_mon_domain {
> >  	struct rdt_l3_mon_domain	d_resctrl;
> >  	struct arch_mbm_state		*arch_mbm_states[QOS_NUM_L3_MBM_EVENTS];
> > +	const struct erdt_domain_info	*d_info;
> >  };
> >  
> > +bool erdt_cpu_valid(int cpu);
> > +void erdt_l3_mon_domain_setup(int id, struct rdt_domain_hdr *hdr);
> > +
> 
> Why did these two erdt related prototypes land here instead of with the
> other erdt related prototypes?
>

They were added near the introduction of const struct erdt_domain_info *d_info, let me move
them near other erdt_* helpers.

thanks,
Chenyu
