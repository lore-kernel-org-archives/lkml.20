Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747293B71D9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779557; cv=none; b=P829xBag4hxL0EIr5zdesIDPUcjl1NrP2+YS11xYnnQwOUcrrzcxgl6ZHNFdpELwkzJiN8y9hAQKCGLlebYTBrMlvB95whdkcGqMYYDH2thSnM8yzD2seWDYpA3cP5CVRZ2H00q37HEbXHK5WhR39sRyn6/DlOWR+6rWVR3h1gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779557; c=relaxed/simple;
	bh=GF7/YPL0HWRDZcMXZJtA443hHFAhpSrxVIaylOHC8CU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kAx1P3ZsKlcIl6jGHe9Bycc3lndIVKWQuxnQ2sAB/G3enIM2HSvXugS59VyNXt2nYXW6xv3HXHSkIRw3EKa5CTzn+mp2etXNimakFqRndfoJ3ruko3psM/gwNceLY+BGr80u2w9RLDMpkIzqLldN8llRvZHZyQ67SeOj5ZtY+x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=p9gZOxfM; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="p9gZOxfM"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D775F1476;
	Mon,  7 Sep 2026 04:12:30 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 706083F7D8;
	Mon,  7 Sep 2026 04:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788779554; bh=GF7/YPL0HWRDZcMXZJtA443hHFAhpSrxVIaylOHC8CU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=p9gZOxfMIwizXB8FqDNrdPhO3/1zTH1LN6nFTu2vMXkyjMRRdN4n1eH0vYn9yzTi2
	 laFBHiFwZvsaoZuS4TUdjIWRdqvhsQwH9ecgj6mpjHTEXx0izLgDQiUG+mI26thVJV
	 +3mZKGiJ5xSbhwsysjJ2OWRTQuMpmhga8ZFtyOgw=
Message-ID: <ef9fb6b1-3c11-4169-802b-b82c8ea07849@arm.com>
Date: Mon, 7 Sep 2026 12:12:31 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 12/19] arm_mpam: resctrl: Add NUMA node notifier
 for domain online/offline
To: Fenghua Yu <fenghuay@nvidia.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Tony Luck
 <tony.luck@intel.com>, James Morse <james.morse@arm.com>,
 Dave Martin <Dave.Martin@arm.com>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Shaopeng Tan <tan.shaopeng@fujitsu.com>, Chen Yu <yu.c.chen@intel.com>,
 Babu Moger <babu.moger@amd.com>, Drew Fustini <fustini@kernel.org>,
 Vikram Sethi <vsethi@nvidia.com>, Shanker Donthineni
 <sdonthineni@nvidia.com>, Newton Liu <newtonl@nvidia.com>,
 Richard Cheng <icheng@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260831172245.42253-1-fenghuay@nvidia.com>
 <20260831172245.42253-13-fenghuay@nvidia.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260831172245.42253-13-fenghuay@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Fenghua,

On 31/08/2026 18:22, Fenghua Yu wrote:
> From: James Morse <james.morse@arm.com>
> 
> To expose resctrl resources that contain CPU-less NUMA domains, resctrl
> needs to be told when a CPU-less NUMA domain comes online. This can't
> be done with the cpuhp callbacks.
> 
> Add a memory hotplug notifier, and use this to create and destroy
> resctrl domains.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
> ---
>  drivers/resctrl/mpam_resctrl.c | 343 ++++++++++++++++++++++++++++++++-
>  include/linux/memory.h         |   1 +
>  2 files changed, 337 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index cd9bebf5f0c2..8bb313efc716 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -11,6 +11,8 @@
>  #include <linux/limits.h>
>  #include <linux/list.h>
>  #include <linux/math.h>
> +#include <linux/memory.h>
> +#include <linux/node.h>
>  #include <linux/printk.h>
>  #include <linux/rculist.h>
>  #include <linux/resctrl.h>
> @@ -1775,16 +1777,25 @@ void resctrl_arch_reset_all_ctrls(struct rdt_resource *r)
>  	mpam_reset_class_locked(res->class);
>  }
>  
> +static void mpam_resctrl_domain_hdr_init_mask(const struct cpumask *cpus,
> +					      int id_cpu,
> +					      struct mpam_component *comp,
> +					      enum resctrl_res_level rid,
> +					      struct rdt_domain_hdr *hdr)
> +{
> +	INIT_LIST_HEAD(&hdr->list);
> +	hdr->id = mpam_resctrl_pick_domain_id(id_cpu, comp);
> +	hdr->rid = rid;
> +	cpumask_copy(&hdr->cpu_mask, cpus);
> +}
> +
>  static void mpam_resctrl_domain_hdr_init(int cpu, struct mpam_component *comp,
>  					 enum resctrl_res_level rid,
>  					 struct rdt_domain_hdr *hdr)
>  {
>  	lockdep_assert_cpus_held();
>  
> -	INIT_LIST_HEAD(&hdr->list);
> -	hdr->id = mpam_resctrl_pick_domain_id(cpu, comp);
> -	hdr->rid = rid;
> -	cpumask_set_cpu(cpu, &hdr->cpu_mask);
> +	mpam_resctrl_domain_hdr_init_mask(cpumask_of(cpu), cpu, comp, rid, hdr);
>  }
>  
>  static void mpam_resctrl_online_domain_hdr(unsigned int cpu,
> @@ -1805,12 +1816,12 @@ static void mpam_resctrl_online_domain_hdr(unsigned int cpu,
>   * indicating the parent structure can be freed.
>   * If there are other CPUs in the domain, returns false.
>   */
> -static bool mpam_resctrl_offline_domain_hdr(unsigned int cpu,
> -					    struct rdt_domain_hdr *hdr)
> +static bool mpam_resctrl_offline_domain_hdr_mask(const struct cpumask *cpus,
> +						 struct rdt_domain_hdr *hdr)
>  {
>  	lockdep_assert_held(&domain_list_lock);
>  
> -	cpumask_clear_cpu(cpu, &hdr->cpu_mask);
> +	cpumask_andnot(&hdr->cpu_mask, &hdr->cpu_mask, cpus);
>  	if (cpumask_empty(&hdr->cpu_mask)) {
>  		list_del_rcu(&hdr->list);
>  		synchronize_rcu();
> @@ -1820,6 +1831,12 @@ static bool mpam_resctrl_offline_domain_hdr(unsigned int cpu,
>  	return false;
>  }
>  
> +static bool mpam_resctrl_offline_domain_hdr(unsigned int cpu,
> +					    struct rdt_domain_hdr *hdr)
> +{
> +	return mpam_resctrl_offline_domain_hdr_mask(cpumask_of(cpu), hdr);
> +}
> +
>  static void mpam_resctrl_domain_insert(struct list_head *list,
>  				       struct rdt_domain_hdr *new)
>  {
> @@ -1835,6 +1852,23 @@ static void mpam_resctrl_domain_insert(struct list_head *list,
>  	list_add_tail_rcu(&new->list, pos);
>  }
>  
> +static struct mpam_component *find_component_nid(struct mpam_class *class, int nid)
> +{
> +	struct mpam_component *comp;
> +
> +	if (!class || class->type != MPAM_CLASS_MEMORY)
> +		return NULL;
> +
> +	guard(srcu)(&mpam_srcu);
> +	list_for_each_entry_srcu(comp, &class->components, class_list,
> +				 srcu_read_lock_held(&mpam_srcu)) {
> +		if (comp->comp_id == nid)
> +			return comp;
> +	}
> +
> +	return NULL;
> +}
> +
>  static struct mpam_component *find_component(struct mpam_class *class, int cpu)
>  {
>  	struct mpam_component *comp;
> @@ -2094,6 +2128,297 @@ static void mpam_resctrl_offline_ctrls(unsigned int cpu, struct mpam_resctrl_res
>  	}
>  }
>  
> +static bool mpam_mba_uses_memory_nid(void)
> +{
> +	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_MBA];
> +
> +	return res->class && res->class->type == MPAM_CLASS_MEMORY;
> +}
> +
> +static struct mpam_resctrl_dom *
> +mpam_get_ctrl_domain_from_nid(int nid, struct mpam_resctrl_res *res,
> +			      struct resctrl_ctrl *ctrl)
> +{
> +	struct mpam_resctrl_dom *dom;
> +
> +	list_for_each_entry(dom, &ctrl->domains, resctrl_ctrl_dom.hdr.list) {
> +		if (!dom->ctrl_comp || !dom->ctrl_comp->class)
> +			continue;
> +		if (dom->ctrl_comp->class->type != MPAM_CLASS_MEMORY)
> +			continue;
> +		if (dom->ctrl_comp->comp_id == nid)
> +			return dom;
> +	}
> +
> +	return NULL;
> +}
> +
> +static struct mpam_resctrl_dom *
> +mpam_get_mon_domain_from_nid(int nid, struct mpam_resctrl_res *res)
> +{
> +	struct mpam_resctrl_dom *dom;
> +	struct rdt_resource *r = &res->resctrl_res;
> +
> +	if (!r->mon_capable)
> +		return NULL;
> +
> +	list_for_each_entry(dom, &r->mon_domains, resctrl_mon_dom.hdr.list) {
> +		if (!dom->ctrl_comp || !dom->ctrl_comp->class)
> +			continue;
> +		if (dom->ctrl_comp->class->type != MPAM_CLASS_MEMORY)
> +			continue;
> +		if (dom->ctrl_comp->comp_id == nid)
> +			return dom;
> +	}
> +
> +	return NULL;
> +}
> +
> +static struct mpam_resctrl_dom *
> +mpam_resctrl_alloc_ctrl_domain_nid(int nid, struct mpam_resctrl_res *res,
> +				   struct resctrl_ctrl *ctrl,
> +				   struct mpam_component *comp)
> +{
> +	int err;
> +	struct mpam_resctrl_dom *dom;
> +	struct rdt_ctrl_domain *ctrl_d;
> +	struct rdt_resource *r = &res->resctrl_res;
> +	int id_cpu = cpumask_first(cpu_possible_mask);
> +
> +	if (id_cpu >= nr_cpu_ids)
> +		id_cpu = 0;
> +
> +	lockdep_assert_held(&domain_list_lock);
> +
> +	if (!r->alloc_capable)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (WARN_ON_ONCE(!comp))
> +		return ERR_PTR(-EINVAL);
> +
> +	dom = kzalloc_node(sizeof(*dom), GFP_KERNEL, nid);
> +	if (!dom)
> +		return ERR_PTR(-ENOMEM);
> +
> +	dom->ctrl_comp = comp;
> +
> +	ctrl_d = &dom->resctrl_ctrl_dom;
> +	mpam_resctrl_domain_hdr_init_mask(cpu_possible_mask, id_cpu, comp,
> +					  r->rid, &ctrl_d->hdr);
> +	ctrl_d->hdr.type = RESCTRL_CTRL_DOMAIN;
> +	err = resctrl_online_ctrl_domain(r, ctrl, ctrl_d);
> +	if (err)
> +		goto free_domain;
> +
> +	mpam_resctrl_domain_insert(&ctrl->domains, &ctrl_d->hdr);
> +
> +	return dom;
> +
> +free_domain:
> +	kfree(dom);
> +	return ERR_PTR(err);
> +}
> +
> +static struct mpam_resctrl_dom *
> +mpam_resctrl_alloc_mon_domain_nid(int nid, struct mpam_resctrl_res *res,
> +				  struct mpam_component *comp)
> +{
> +	int err;
> +	struct mpam_resctrl_dom *dom;
> +	struct rdt_l3_mon_domain *mon_d;
> +	struct rdt_resource *r = &res->resctrl_res;
> +	struct mpam_component *any_mon_comp = NULL;
> +	struct mpam_resctrl_mon *mon;
> +	enum resctrl_event_id eventid;
> +	int id_cpu = cpumask_first(cpu_possible_mask);
> +
> +	if (id_cpu >= nr_cpu_ids)
> +		id_cpu = 0;
> +
> +	lockdep_assert_held(&domain_list_lock);
> +
> +	if (!r->mon_capable)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (WARN_ON_ONCE(!comp))
> +		return ERR_PTR(-EINVAL);
> +
> +	dom = kzalloc_node(sizeof(*dom), GFP_KERNEL, nid);
> +	if (!dom)
> +		return ERR_PTR(-ENOMEM);
> +
> +	dom->ctrl_comp = comp;
> +
> +	for_each_mpam_resctrl_mon(mon, eventid) {
> +		struct mpam_component *mon_comp;
> +
> +		if (!mon->class)
> +			continue;
> +
> +		mon_comp = find_component_nid(mon->class, nid);
> +		dom->mon_comp[eventid] = mon_comp;
> +		if (mon_comp)
> +			any_mon_comp = mon_comp;
> +	}
> +	if (!any_mon_comp) {
> +		err = -EFAULT;
> +		goto free_domain;
> +	}
> +
> +	mon_d = &dom->resctrl_mon_dom;
> +	mpam_resctrl_domain_hdr_init_mask(cpu_possible_mask, id_cpu, any_mon_comp,
> +					  r->rid, &mon_d->hdr);
> +	mon_d->hdr.type = RESCTRL_MON_DOMAIN;
> +	err = resctrl_online_mon_domain(r, &mon_d->hdr);
> +	if (err)
> +		goto free_domain;
> +
> +	mpam_resctrl_domain_insert(&r->mon_domains, &mon_d->hdr);
> +
> +	return dom;
> +
> +free_domain:
> +	kfree(dom);
> +	return ERR_PTR(err);
> +}
> +
> +static int mpam_resctrl_online_node(unsigned int nid)
> +{
> +	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_MBA];
> +	struct rdt_resource *r = &res->resctrl_res;
> +	struct mpam_component *comp;
> +	struct resctrl_ctrl *ctrl, *em_ctrl;
> +	struct mpam_resctrl_dom *dom;
> +
> +	if (!res->class)
> +		return 0;
> +
> +	comp = find_component_nid(res->class, nid);
> +	if (!comp)
> +		return 0;
> +
> +	guard(mutex)(&domain_list_lock);
> +
> +	if (r->alloc_capable) {
> +		for_each_resource_ctrl(ctrl, r) {
> +			dom = mpam_get_ctrl_domain_from_nid(nid, res, ctrl);
> +			if (!dom) {
> +				dom = mpam_resctrl_alloc_ctrl_domain_nid(nid, res,
> +									 ctrl, comp);
> +				if (IS_ERR(dom))
> +					return PTR_ERR(dom);
> +			}
> +
> +			list_for_each_entry(em_ctrl, &ctrl->emulated_by, entry) {
> +				dom = mpam_get_ctrl_domain_from_nid(nid, res, em_ctrl);
> +				if (!dom) {
> +					dom = mpam_resctrl_alloc_ctrl_domain_nid(nid, res,
> +										 em_ctrl, comp);
> +					if (IS_ERR(dom))
> +						return PTR_ERR(dom);
> +				}
> +			}
> +		}
> +	}
> +
> +	if (r->mon_capable) {
> +		dom = mpam_get_mon_domain_from_nid(nid, res);
> +		if (!dom) {
> +			dom = mpam_resctrl_alloc_mon_domain_nid(nid, res, comp);
> +			if (IS_ERR(dom))
> +				return PTR_ERR(dom);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int mpam_resctrl_offline_node(unsigned int nid)
> +{
> +	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_MBA];
> +	struct rdt_resource *r = &res->resctrl_res;
> +	struct resctrl_ctrl *ctrl, *em_ctrl;
> +	struct mpam_resctrl_dom *dom;
> +	struct rdt_ctrl_domain *ctrl_d;
> +	struct rdt_l3_mon_domain *mon_d;
> +
> +	if (!res->class)
> +		return 0;
> +
> +	if (!find_component_nid(res->class, nid))
> +		return 0;
> +
> +	guard(mutex)(&domain_list_lock);
> +
> +	if (r->alloc_capable) {
> +		for_each_resource_ctrl(ctrl, r) {
> +			list_for_each_entry(em_ctrl, &ctrl->emulated_by, entry) {
> +				dom = mpam_get_ctrl_domain_from_nid(nid, res, em_ctrl);
> +				if (WARN_ON_ONCE(!dom))
> +					continue;
> +				ctrl_d = &dom->resctrl_ctrl_dom;
> +				if (mpam_resctrl_offline_domain_hdr_mask(cpu_possible_mask,
> +									 &ctrl_d->hdr)) {
> +					resctrl_offline_ctrl_domain(r, em_ctrl, ctrl_d);
> +					kfree(dom);
> +				}
> +			}
> +
> +			dom = mpam_get_ctrl_domain_from_nid(nid, res, ctrl);
> +			if (WARN_ON_ONCE(!dom))
> +				continue;
> +			ctrl_d = &dom->resctrl_ctrl_dom;
> +			if (mpam_resctrl_offline_domain_hdr_mask(cpu_possible_mask,
> +								 &ctrl_d->hdr)) {
> +				resctrl_offline_ctrl_domain(r, ctrl, ctrl_d);
> +				kfree(dom);
> +			}
> +		}
> +	}
> +
> +	if (r->mon_capable) {
> +		dom = mpam_get_mon_domain_from_nid(nid, res);
> +		if (WARN_ON_ONCE(!dom))
> +			return 0;
> +		mon_d = &dom->resctrl_mon_dom;
> +		if (mpam_resctrl_offline_domain_hdr_mask(cpu_possible_mask, &mon_d->hdr)) {
> +			resctrl_offline_mon_domain(r, &mon_d->hdr);
> +			kfree(dom);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int mpam_resctrl_node_notifier(struct notifier_block *self,
> +				      unsigned long action, void *arg)
> +{
> +	struct node_notify *nn = arg;
> +
> +	if (nn->nid < 0 || !mpam_mba_uses_memory_nid())
> +		return NOTIFY_OK;
> +
> +	/*
> +	 * Ignore nids that have CPUs. Resctrl needs to see the cpu offline
> +	 * call for each CPU to update the CPUs in control groups.
> +	 */
> +	if (!cpumask_empty(cpumask_of_node(nn->nid)))
> +		return NOTIFY_OK;

I was expecting the lifecycle of the resctrl MB_NODE resource to be the same as the memory
associated with the memory node. This is discussed on Reinette's controls PoC here:

https://lore.kernel.org/lkml/f5b6cec4-03d8-4a11-884d-d4579dab6b22@intel.com/

This looks to be a different lifecycle?

Thanks,

Ben

> +
> +	switch (action) {
> +	case NODE_ADDED_FIRST_MEMORY:
> +		mpam_resctrl_online_node(nn->nid);
> +		break;
> +	case NODE_REMOVED_LAST_MEMORY:
> +		mpam_resctrl_offline_node(nn->nid);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
>  int mpam_resctrl_online_cpu(unsigned int cpu)
>  {
>  	struct mpam_resctrl_res *res;
> @@ -2229,6 +2554,10 @@ int mpam_resctrl_setup(void)
>  		}
>  	}
>  
> +	if (mpam_mba_uses_memory_nid())
> +		hotplug_node_notifier(mpam_resctrl_node_notifier,
> +				      RESCTRL_CALLBACK_PRI);
> +
>  	cpus_read_unlock();
>  
>  	if (!resctrl_arch_alloc_capable() && !resctrl_arch_mon_capable()) {
> diff --git a/include/linux/memory.h b/include/linux/memory.h
> index 463dc02f6cff..1497d4be38ee 100644
> --- a/include/linux/memory.h
> +++ b/include/linux/memory.h
> @@ -120,6 +120,7 @@ struct mem_section;
>  #define CPUSET_CALLBACK_PRI	10
>  #define MEMTIER_HOTPLUG_PRI	100
>  #define KSM_CALLBACK_PRI	100
> +#define RESCTRL_CALLBACK_PRI	100
>  
>  #ifndef CONFIG_MEMORY_HOTPLUG
>  static inline void memory_dev_init(void)

