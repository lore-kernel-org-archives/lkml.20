Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793861694;
	b=zvuQOHz40buTRVq4JZAtF09LKaygFrwRty0OYwRgewXYwiD8X/h8hoxKDQoyxREst11H
	 Yew1f0b63opYjqXLwKvwthk7ksxe7+sxr08Mb7WXA65+xz6reE0GB0a6/j8uBmmKeOABS
	 61sWTbL2C8D/xid8yamRbnrRoi2b61KYFQltmSI+mNMAB2ybo96soaSRtqFx+BZH0azL8
	 99hkf2vUhF5Ow8cGB+r2IM4Jk+/xkMqlmZ6m3rvftIgw5ah2/z0k+MY02uqpGe5DnTpgf
	 Sh04o7nk71Minx6T55r6F5CRdpi+F1Zh96gQYNFCQHgm2Qu3iyPIu8sD5brj8c3M0aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793861694;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=zmYVc0rqCY7NT79CI5C9/miZnbaqPv1DT3XdwXlwJ8Q=;
	b=Q03ktOwAtn0SRwmtmwB8mfc7WpQV7YSzn3qc+Dc+QFsDbyoAlBJEkg6buaVUa4fRoMxV
	 bkjZWvw0YEO/xXABSKmftPv3nF56n23oqNS6qCwVqXR+JWlqWWDnYKwFvbNXtrf7X5iDV
	 QmaQAiw3W0DlFd04rF7nQ7wAmpKd4K+ZnJkmvuw1+EFleInf4N3EC0usWhemyyxET3IfZ
	 0HJMwsTkZB+YtGNAnpSYM1nI+0ZjvTj0Syxage8pKttnd125nhO8HrHv8kYD2T+B6/JdY
	 DE3AQnneCjDAX0Xgvr9kRFLt7qaoCzT7sfwnD5SKz+yt4lW9Jnd8X4nHjWYqbBJ+QZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=xgy+G+AI;
	arc=none smtp.remote-ip=113.46.200.224
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FAE606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 06:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6FAE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=xgy+G+AI
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=zmYVc0rqCY7NT79CI5C9/miZnbaqPv1DT3XdwXlwJ8Q=;
	b=xgy+G+AIrXumiOnA9rO5gYVK3QzhjJvY2tN0GczOQsED83uDL5+eVM7XaMPdM1+mT0BnAeEZa
	JE6VQmG77iKSj8knGj57A3p3hUSCxUrBm9rGomYuqME7ypVhkpPyUJvmI6ATlKnOP9GjrZCaFex
	olUWLgF00zWhzUdLBgjKctE=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jKtMq3RYYz1cynS;
	Thu,  5 Nov 2026 14:54:31 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 2A13540563;
	Thu,  5 Nov 2026 14:54:43 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 14:54:31 +0800
Message-ID: <2c2db850-071e-4121-8892-8f4a568d19cd@huawei.com>
Date: Thu, 5 Nov 2026 14:54:30 +0800
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
From: Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [PATCH] fs/resctrl: Unmount resctrl with the CDP state it was
 mounted with
To: Reinette Chatre <reinette.chatre@intel.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<jic23@kernel.org>, <ben.horgan@arm.com>, <zengheng4@huawei.com>,
	<gshan@redhat.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261031094616.1691026-1-ruanjinjie@huawei.com>
 <71a65c26-da2f-469c-a38a-4b6b279ead96@intel.com>
In-Reply-To: <71a65c26-da2f-469c-a38a-4b6b279ead96@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/3 13:51, Reinette Chatre 写道:
> Hi Jinjie,
> 
> On 10/31/26 2:46 AM, Jinjie Ruan wrote:
>> Busy RMIDs of a monitor domain are normally released by the limbo handler
>> once their cache occupancy drops below the threshold. The handler keeps
>> running after resctrl is unmounted, and  each RMID left in limbo retains
>> the CLOSID it was allocated with.
>>
>> When reading the counter for an RMID in limbo, the architecture translates
>> the CLOSID associated with that RMID into a PARTID. On arm64 MPAM with CDP
>> enabled, CLOSID c maps to data PARTID 2 * c and code PARTID 2 * c + 1,
>> so the same CLOSID selects a different PARTID depending on the CDP state.
>> resctrl_unmount() clears the CDP state before resctrl_fs_teardown() frees
>> the groups, so an RMID left in limbo is read using the CDP state of the
>> next mount rather than the state it was allocated under. A CLOSID from the
>> upper half of the range then produces a PARTID beyond the MSC's range; the
>> MSC raises an MPAM error interrupt, and mpam_disable() disables MPAM.
> 
> Could you please start the problem description with a brief description of the
> scenario? As it is written it is not clear what is meant with "the next mount".

Hi Reinette,

The original question is as follows, I will make it more clear:

https://lore.kernel.org/all/20261020134239.3921377-7-ruanjinjie@huawei.com/

I will add a question sequence diagram.

> 
>>
>> Move the CDP disable after the groups have been torn down, so every
>> CLOSID freed on unmount is translated with the CDP state it was
>> allocated under.
> 
> Above is a brief statement that appears unrelated to earlier problem description.
> Does it aim to capture some other problems encountered with existing rdt_disable_ctx()
> placement? I think MPAM is fortunate that it does not use CLOSID in 

You are right! It means move rdt_disable_ctx() down because
rdt_disable_ctx() changes the cdp state which used in rmdir_all_sub()
and resctrl_fs_teardown() for freeing RMIDs.

> resctrl_arch_reset_all_ctrls() but from what I can tell the per-resource group
> rdtgroup_unassign_cntrs() may also end up leaving stale monitor configuration
> behind?
> 
>> Keep the RMIDs in limbo instead of forcing them back
>> to the free list, because a quick remount would otherwise reuse RMIDs
>> whose counters are still dirty. Pause the limbo handler while the
>> filesystem is unmounted. At mount, release any RMID left in limbo under
>> a different CDP state without reading its counter, since its CLOSID no
>> longer selects the same PARTID, and restart the handler.
> 
> Sounds reasonable.
> 
>>
>> x86 RMIDs are independent of the CLOSID, so the CDP state does not
>> change which counter is read. Only arm64 MPAM systems are affected, and
>> only when CDP is enabled with the cdp mount option (CDP depends on
>> CONFIG_EXPERT).
>>
>> Reproduced on QEMU:
>> - mount resctrl, create four control groups
>> - unmount, and mount again with -o cdp.
>>
>> Before this patch, the limbo handler reads the counters for the limbo RMIDs
> 
> (nit: please never use the "this patch" term in a changelog - this is by definition
> a patch and this term can be a trigger word for some).

Has deleted them.

> 
>> using the doubled PARTID:
>>
>> 	mpam:__mpam_irq_handler: error irq from msc:1 'MSMONCFG_ID_RANGE', partid:5, pmg: 0, ris: 0
>> 	mpam:mpam_disable: MPAM disabled due to hardware error interrupt
>>
>> After this patch the RMIDs are released before their counters are read, and
>> the same sequence completes without an error.
>>
>> Rebased on the below fix.
>> 	https://lore.kernel.org/all/20261031063634.1678345-3-ruanjinjie@huawei.com/
> 
> Information like above rebase hint should not follow a change into the kernel
> and is best left below the "---".

Will put it below "---".

> 
>>
>> Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
>> Suggested-by: Ben Horgan <ben.horgan@arm.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> Cc: <stable@vger.kernel.org> # 7.3.x
>> Cc: Tony Luck <tony.luck@intel.com>
>> Cc: Reinette Chatre <reinette.chatre@intel.com>
>> Cc: Dave Martin <Dave.Martin@arm.com>
>> Cc: James Morse <james.morse@arm.com>
>> Cc: Babu Moger <babu.moger@amd.com>
>> ---
>>  fs/resctrl/internal.h |  1 +
>>  fs/resctrl/monitor.c  | 60 ++++++++++++++++++++++++++++++++++++++++---
>>  fs/resctrl/rdtgroup.c | 31 +++++++++++++++++-----
>>  3 files changed, 83 insertions(+), 9 deletions(-)
>>
>> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
>> index 1c85e06f09bf..ccae796a1489 100644
>> --- a/fs/resctrl/internal.h
>> +++ b/fs/resctrl/internal.h
>> @@ -373,6 +373,7 @@ void closid_free(int closid);
>>  int setup_rmid_lru_list(void);
>>  
>>  void free_rmid_lru_list(void);
>> +void resctrl_limbo_pause(void);
>>  
>>  int alloc_rmid(u32 closid);
>>  
>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>> index 2002c4af1a5c..292f7f334b4c 100644
>> --- a/fs/resctrl/monitor.c
>> +++ b/fs/resctrl/monitor.c
>> @@ -70,6 +70,16 @@ static u32 *closid_num_dirty_rmid;
>>   */
>>  static unsigned int rmid_limbo_count;
>>  
>> +/*
>> + * @limbo_paused - True if the filesystem is unmounted
>> + *     The limbo handler must not read counters until the next mount has
>> + *     set the CDP state up.
> 
> Is this new flag needed? The description "True if the filesystem is unmounted"
> could be a hint that it could just use the "resctrl_mounted" flag
> similar to how the MBM overflow handler uses it?

Yes, this can also work.

> 
> 
>> + * @limbo_cdp - True if the RMIDs currently in limbo were freed with
>> + *     CDP enabled.
>> + */
>> +static bool limbo_paused;
>> +static bool limbo_cdp;
>> +
>>  /*
>>   * @rmid_entry - The entry in the limbo and free lists.
>>   */
>> @@ -350,6 +360,8 @@ static void add_rmid_to_limbo(struct rmid_entry *entry)
>>  		entry->busy++;
>>  	}
>>  
>> +	if (!rmid_limbo_count)
>> +		limbo_cdp = resctrl_arch_get_cdp_enabled(RDT_RESOURCE_L3);
> 
> CDP state cannot change after resctrl mount so this runtime assignment
> on each RMID state change looks redundant. It could just be set once on
> mount? More on this later but I also think the !rmid_limbo_count assumes

You are right! we only enable cdp when mount and disble cdp when umount.
So set once on mount is fine.

> an MPAM underlying architecture since there the rmid_limbo_count will
> always be reset on a state change during mount. Having limbo_cdp gated
> on rmid_limbo_count being zero may thus not behave the same on all
> architectures.

Understand.

> 
>>  	rmid_limbo_count++;
>>  	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID))
>>  		closid_num_dirty_rmid[entry->closid]++;
>> @@ -852,6 +864,13 @@ void cqm_handle_limbo(struct work_struct *work)
>>  	 */
>>  	mutex_lock(&rdtgroup_mutex);
>>  
>> +	/*
>> +	 * The limbo state is kept across mounts, but can't be read while
>> +	 * the filesystem is unmounted: the CDP state may have changed.
>> +	 */
>> +	if (limbo_paused)
> 
> Could this be if (!resctrl_mounted) instead? Compare with mbm_handle_overflow().

Yes, you are right.

> 
>> +		goto out_unlock;
>> +
>>  	/*
>>  	 * Ensure the worker is dedicated to a CPU as intended and not
>>  	 * relocated by workqueue subsystem as part of CPU going offline.
>> @@ -991,6 +1010,8 @@ void mbm_setup_overflow_handler(struct rdt_l3_mon_domain *dom, unsigned long del
>>  int setup_rmid_lru_list(void)
>>  {
>>  	struct rmid_entry *entry = NULL;
>> +	struct rdt_l3_mon_domain *d;
>> +	struct rdt_resource *r;
>>  	u32 idx_limit;
>>  	u32 idx;
>>  	int i;
>> @@ -1001,11 +1022,37 @@ int setup_rmid_lru_list(void)
>>  	/*
>>  	 * Called on every mount, but the number of RMIDs cannot change
>>  	 * after the first mount, so keep using the same set of rmid_ptrs[]
>> -	 * until resctrl_exit(). Note that the limbo handler continues to
>> -	 * access rmid_ptrs[] after resctrl is unmounted.
>> +	 * until resctrl_exit(). The limbo state is kept too, so that dirty
>> +	 * RMIDs aren't reused after a quick remount.
>>  	 */
>> -	if (rmid_ptrs)
>> +	if (rmid_ptrs) {
>> +		r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
>> +
>> +		/*
>> +		 * An entry freed under a different CDP state can't be read
>> +		 * with the new one: its CLOSID selects a different PARTID.
>> +		 * Release those without reading them.
> 
> Please refrain from adding architecture specific comments in resctrl filesystem code
> that aims to be architecture agnostic. Since MPAM support was added after initial resctrl
> design the "CLOSID" and "RMID" terms are "baked into" resctrl fs with known 
> translations added by architectures. 

OK, will delete the architecture specific comments.

> 
>> +		 */
>> +		if (resctrl_arch_get_cdp_enabled(RDT_RESOURCE_L3) != limbo_cdp) {
> 
> Here I am not so sure since I am very unfamiliar with the MPAM driver. It looks
> like the problematic path in MPAM is gated by a global "cdp_enabled" flag that
> may be set when filesystem is mounted with -o cdpl2? Could this mean that

-o cdp or -o cdpl2

> this test would not accurately capture whether MPAM driver uses the "cdp_enabled"
> flows?

Will add the l2 case.

> 
> Apart from this, should this be gated by a 
> 	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID))
> as well as a check that LLC occupancy is actually enabled?

Yes, should be corrected.>
> (
>  ah - looks like sashiko agrees, could you please also check the sashiko
>  feedback at 
> 	https://sashiko.dev/#/patchset/20261031094616.1691026-1-ruanjinjie%40huawei.com

Will fix it.

> )
> 
> 
>> +			list_for_each_entry(d, &r->mon_domains, hdr.list) {
> 
> list_for_each_entry_rcu()?

ok.

> 
>> +				if (has_busy_rmid(d))
>> +					release_limbo_rmids(d);
>> +			}
>> +		}
>> +
>> +		limbo_paused = false;
>> +
>> +		/* Restart the handler for the domains that are still busy. */
> 
> Switching to resctrl_mounted flag would mean this needs to be started later, after
> the flag is set. Doing so has the benefit of placing it with the code that starts

Yes

> the MBM overflow handler that centralizes the workers.
> 
> Thinking about it more - there seems to be a lot of benefits with such a move and
> may avoid needing to move when setup_rmid_lru_list() is called since removing the
> entries that no longer have matching CDP state only needs to be done before
> starting the worker so this can all be done together, after setting resctrl_mounted?
> 
> Could there perhaps be a new function that initializes limbo_cdp, releases limbo
> RMIDs (if needed), and starts the limbo worker? This function can be called from rdt_get_tree()

Yes, it works.

> after resctrl_mounted is set? I think this could simplify this implementation.

Indeed it is.

> 
> 
>> +		if (resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID)) {
>> +			list_for_each_entry(d, &r->mon_domains, hdr.list) {
> 
> list_for_each_entry_rcu()?
> 
>> +				if (has_busy_rmid(d))
>> +					cqm_setup_limbo_handler(d, CQM_LIMBOCHECK_INTERVAL,
> 
> Why is a delay needed here instead of scheduling it to run immediately? 
> With this delay a user may unnecessarily need to wait a second after mounting resctrl
> before new resource groups can be created?

Will remove the delay.

> 
>> +								RESCTRL_PICK_ANY_CPU);
>> +			}
>> +		}
>> +
>>  		return 0;
>> +	}
>>  
>>  	idx_limit = resctrl_arch_system_num_rmid_idx();
>>  	rmid_ptrs = kzalloc_objs(struct rmid_entry, idx_limit);
> Reinette

-- 
Best regards,
Jinjie

