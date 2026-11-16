Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831174;
	b=ViP+RJmXo2WRNq5GjwxShqn4krndZOgC7RUYs9dYFg35GacKBWhVYS/O2jP2/7VHmeDY
	 SQU4qIT6UJyLHLfu8YOxdsuDUzJsMrgqRXCeSNEBsKuvSfll0OntZYnsRXhWF9kKRKZb/
	 3N6JXPotiVtWeOU90bT0Y7nBRT362Qb/s0hRwUcMcdOknsgNgiY+a/sse+ztsGVq52szh
	 rEmQ0gCJHUDsTusVhx/Kleqz5nK901CWQB7aX7kthYLABNDs8kjDFTdT5defmiIKYe00b
	 R3aXyurcJubDQjHunWEjVVmidqLADZsNt1ZdZf7P0FlnEcGvUHJ7GqD6zCti7k6/ZWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831174;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=wcgmon70XAk5Fo/0VolrEg/3YS/oGzQP4jqWgRSNGG8=;
	b=ExKcMkN4y9v7YoVxpP04Rs904AjiCBy70BxpG7TzNQJ99IPM/i3Lhz4V5xvqSJKSW9OU
	 vrKKsfXxTWYjvpmjIhTAZqEDrURwUlUix6Ce+LyNaTPNqhOG2s/933iQY4RNeIn2EnyYW
	 lO1EivI2BpiXMgwNxrXhIZ02hrDloSMeKYgrIbAJaVLvo2GlYGXgvD5wH5+1gpMfhWs1M
	 1pLSLBVixgEEUlu4/4eosZ/j5sNqUFQPfMwntPRTZtd2UZMBtzdbyd1Im9Zx/tV5ZHELS
	 zaBd3Pm7Ev5yDKVRR87/0S7RdzYVsENNV1e1kX+P4CfWLB0a+B0E9fDqjGc3jjir3Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="Z/fhjXH4";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88152606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88152606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Z/fhjXH4
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEDA81713;
	Mon, 16 Nov 2026 04:12:49 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 680953F632;
	Mon, 16 Nov 2026 04:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794831172; bh=Rn3iFP/lgki79057m7a1NNQZy+R5XRKrQ/1Ha1Qrerc=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Z/fhjXH4JfuGCO3N1q9W45igR1Gfj24iupe+IrQOYy9kWgixEM4PPHpZJj4xIlWsU
	 Yv9c03l4t6KVe9LkzlNTStqcr/QUh5OqColkDxva0Q6BfYgFHFqsG+xlxpT40QwYs6
	 UYAxOGhP9/ENiYTCa0ii7NYY2OmLx/zmEFs8qWeY=
Message-ID: <f89e485b-33b0-465a-984f-fdddd60a35d4@arm.com>
Date: Mon, 16 Nov 2026 12:12:50 +0000
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
Subject: Re: [PATCH] arm_mpam: resctrl: Annotate domain list walks as RCU
 under cpus lock
To: Jinjie Ruan <ruanjinjie@huawei.com>, james.morse@arm.com,
 reinette.chatre@intel.com, fenghuay@nvidia.com, jic23@kernel.org,
 tan.shaopeng@jp.fujitsu.com, zengheng4@huawei.com, gshan@redhat.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261116024834.275512-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261116024834.275512-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jinjie,

On 16/11/2026 02:48, Jinjie Ruan wrote:
> The resctrl domain lists are RCU lists which are only modified while the
> CPU hotplug write lock is held, so traversing them is protected by
> cpus_read_lock().  That is the convention the generic resctrl code
> follows.
> 
> The MPAM implementation omits the condition at three places, so lockdep
> reports a spurious violation with CONFIG_PROVE_RCU_LIST on whenever
> they run:
> 
>   WARNING: suspicious RCU usage
>   drivers/resctrl/mpam_resctrl.c:1762 RCU-list traversed in non-reader section!!
>    mpam_resctrl_get_domain_from_cpu+0x200/0x298
>    mpam_resctrl_online_cpu+0xa4/0x160
>    mpam_cpu_online+0x2b4/0x300
>    cpuhp_invoke_callback+0x304/0x700
> 
> Likewise for mpam_resctrl_get_mon_domain_from_cpu() and
> resctrl_arch_update_domains().
> 
> The lock really is held: lockdep_assert_cpus_held() is the first thing
> each of these functions does, and the warning's own lock list shows
> cpu_hotplug_lock and cpuhp_state-up taken.  Only the annotation is
> missing, so add lockdep_is_cpus_held() to all three walks.
> 
> Fixes: 9cd2b522be2c ("arm_mpam: resctrl: Implement helpers to update configuration")
> Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
> Fixes: 09e61daf8e96 ("arm_mpam: resctrl: Add boilerplate cpuhp and domain allocation")
> Cc: stable@vger.kernel.org

The patch looks good to me but the Fixes and stable Cc can be dropped. This is just providing extra
debug information to allow a debug feature under RCU_EXPERT to be used. The equivalent commit in
fs/resctrl, 11b57be8e406 ("x86,fs/resctrl: Document safe RCU list traversal"), which is needed to
make this useful was only added after MPAM support was merged and has no Fixes tag.

Thanks,

Ben

> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/resctrl/mpam_resctrl.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 5468367776e2..d25c2bac9678 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -1516,7 +1516,7 @@ int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid)
>  	if (!mpam_is_enabled())
>  		return -EINVAL;
>  
> -	list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list) {
> +	list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list, lockdep_is_cpus_held()) {
>  		for (enum resctrl_conf_type t = 0; t < CDP_NUM_TYPES; t++) {
>  			struct resctrl_staged_config *cfg = &d->staged_config[t];
>  
> @@ -1743,7 +1743,8 @@ static struct mpam_resctrl_dom *mpam_resctrl_get_mon_domain_from_cpu(int cpu)
>  	if (cache_id < 0)
>  		return NULL;
>  
> -	list_for_each_entry_rcu(dom, &l3->resctrl_res.mon_domains, resctrl_mon_dom.hdr.list) {
> +	list_for_each_entry_rcu(dom, &l3->resctrl_res.mon_domains, resctrl_mon_dom.hdr.list,
> +				lockdep_is_cpus_held()) {
>  		if (dom->resctrl_mon_dom.hdr.id == cache_id)
>  			return dom;
>  	}
> @@ -1759,7 +1760,8 @@ mpam_resctrl_get_domain_from_cpu(int cpu, struct mpam_resctrl_res *res)
>  
>  	lockdep_assert_cpus_held();
>  
> -	list_for_each_entry_rcu(dom, &r->ctrl_domains, resctrl_ctrl_dom.hdr.list) {
> +	list_for_each_entry_rcu(dom, &r->ctrl_domains, resctrl_ctrl_dom.hdr.list,
> +				lockdep_is_cpus_held()) {
>  		if (cpumask_test_cpu(cpu, &dom->ctrl_comp->affinity))
>  			return dom;
>  	}

