Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718095;
	b=caFYQ1+IVkiPVdTOjfgU+stawYOKV9OGlske2MIUcwvwFXMFNPRVJTseKwzzGR0dCrp7
	 DW0Aqhdyly3eOb1D6hDUS16KV5bLO0uf/8g88pyqtd3LLIqqeY0VTqk1OTNSI+3ZkHEM4
	 v2tEhyKaQdf65/povP12GhKw2Pwm6oEPtvgRslKnL3rjpVYY8fQC6tH9zJIvVfZJogMil
	 o5AxQYceD/FUpNJbUjgdpVFX/c4/TQm8Z6Afbad5qTUCvrzgLDzTFQHQAuB2Tvn4z7vvO
	 ZOZXrXRi0DiMe2/84LnXTOX1zdquboMqKW1o064z7bVaWa6Jl6XfgzOl9CGomVHKecA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718095;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=rEef8FS7q0lvCkkrIL907JgA/rs6+IUe1wrxy5V7xDA=;
	b=1x6U+6fQwKCKwb/lvguijfucD4OQMdjndtUEQ0RXTMSL0bwehdAv4keGY7fBVlsgYKtl
	 oCSaE0cG6Qg+gcpUCLEs7tinvA3n09OpQ+GVm+ppKQ44TvDKRF667nnAO4HHvQQkcLcPn
	 imcnQuiyKXxwMtGJSWKvthpo3bBRVlrq+qKdoiwlS1gJoJ0m4S2wQ+qigBTz0SOtTe13w
	 TW2gcUlnNm+3DL/OfZVapCQ1sKkidX5IauGBdlfTQ/k7qZH2ecjBL2L0CWdEkVIs0IBcI
	 DoTL1fPI5257IL2pmCfshcowECMoF0dGkKsqP9tbjPbZuZvhRww2gvJiY4alGkqB2RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ZnDuSfKU;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285BA606F63F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 285BA606F63F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ZnDuSfKU
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3E3C1595;
	Tue,  3 Nov 2026 07:01:30 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.89.242])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 521733F628;
	Tue,  3 Nov 2026 07:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793718094; bh=CG6q8wsIPq+ixhkuVkm9929Wn3zQbR8LSPlxbsnxgtI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZnDuSfKUzzE9MrbULG40+AhOWauF13XR9ar+iCOPiMJNHMlvLoOqwPvWBa47p0fK1
	 8UJSFcHsd+Px1RBaKuZYevFUjD0Ba7z8RiIURshnbBLyoPtH8jIV86ji1j1uml8ztU
	 RsMBYlU5UXEbTrhovtUPjd5a7Em9ROyM3SdqHRUo=
Message-ID: <308b326e-9fc8-4d49-9c85-c3b9cb9288f3@arm.com>
Date: Tue, 3 Nov 2026 15:01:30 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [RFC PATCH v2 01/10] arm_mpam: resctrl: Use find_component() when
 allocating a domain
To: Reinette Chatre <reinette.chatre@intel.com>, james.morse@arm.com,
 Dave.Martin@arm.com, fenghuay@nvidia.com
Cc: tony.luck@intel.com, yu.c.chen@intel.com, babu.moger@amd.com,
 fustini@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <cover.1792443633.git.reinette.chatre@intel.com>
 <94ddff51b91f4a51965baf0384c2368e292c1a8c.1792443633.git.reinette.chatre@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <94ddff51b91f4a51965baf0384c2368e292c1a8c.1792443633.git.reinette.chatre@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

The change seems good but I think the commit message can be cut down at bit.

On 19/10/2026 23:07, Reinette Chatre wrote:
> mpam_resctrl_alloc_domain() starts by checking that the resource's
> class has a component whose CPU affinity includes the CPU, and fails the
> domain allocation otherwise. When the resource supports allocation, that
> component also backs the control domain. The check uses an open-coded
> walk of the class's component list, while the same function uses
> find_component() to find the component backing each monitoring event.
> 
> The open-coded walk duplicates find_component(). It also holds the SRCU
> read lock until mpam_resctrl_alloc_domain() returns, 

, -> .

which suggests that
> the component needs this protection while the domain is set up.
> 
> The component does not need it. Components are freed only when an MSC
> fails to probe, in which case MPAM is never enabled and no resctrl
> domain is created, or by mpam_disable(), which first removes the CPU
> hotplug callbacks and thereby tears down all resctrl domains. A component> therefore outlives every domain that refers to it.

You can drop the above section. The SRCU read lock, as you say, is just
intended for walking the list and modulo any bugs we can just take that
as read.

However, ...> The SRCU read lock is
> only needed while walking the component list, and find_component() holds
> it for that walk. 


In addition, mpam_resctrl_alloc_domain() only runs
> from MPAM's CPU hotplug startup callback, which already holds the SRCU
> read lock throughout.

I think this can go from the commit message too. It is interesting that
you point it out though as that is unexpected. I should have used
scoped_guard() in the case you are removing and in mpam_cpu_online()
rather than guard() so that the lock can be dropped as early as possible
and make the intent of the lock clearer.

Thanks,

Ben

> 
> Replace the open-coded walk with find_component().
> 
> Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
> ---
>  drivers/resctrl/mpam_resctrl.c | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 9cec5843e8fa..3d5f90f9f1f3 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -1623,21 +1623,12 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
>  	struct rdt_l3_mon_domain *mon_d;
>  	struct rdt_ctrl_domain *ctrl_d;
>  	struct mpam_class *class = res->class;
> -	struct mpam_component *comp_iter, *ctrl_comp;
> +	struct mpam_component *ctrl_comp;
>  	struct rdt_resource *r = &res->resctrl_res;
>  
>  	lockdep_assert_held(&domain_list_lock);
>  
> -	ctrl_comp = NULL;
> -	guard(srcu)(&mpam_srcu);
> -	list_for_each_entry_srcu(comp_iter, &class->components, class_list,
> -				 srcu_read_lock_held(&mpam_srcu)) {
> -		if (cpumask_test_cpu(cpu, &comp_iter->affinity)) {
> -			ctrl_comp = comp_iter;
> -			break;
> -		}
> -	}
> -
> +	ctrl_comp = find_component(class, cpu);
>  	/* class has no component for this CPU */
>  	if (WARN_ON_ONCE(!ctrl_comp))
>  		return ERR_PTR(-EINVAL);

