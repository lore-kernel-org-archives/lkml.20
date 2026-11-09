Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794224941;
	b=0FeKIkE5VTOqqczJS6ngyFA57DvXnOjqhpogQBmbefWeh4mslI/6FRSGMqxh1JVP97oa
	 3xNcz8TVPQvm5kz9x/ROuX2Z4o8wp3i2OzyfZnGvyy+Y2kZmroDvcPE0v1IE1p4utWTHg
	 Uu+TzH8gyiQYJbOQjK8Le2f0ga028OfzBiEBKwFejQb9DO8eQNksla9OdXBbeOzNEIHWd
	 gZWWkTu0PzowVpsANIzQJ5dWxM/Jiyb54QInTJsPLce5gzolaHpcIaSyVPO3sezpNzBM7
	 kkwEb+shS0WkLZ/6ZyOaN3e0I5P0684AQj7jGWrY0PJfvnj21p9Q3UdQuaefis1SzRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794224941;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=/pX/0zcpELm4T3tW1ew12U67QtK8O0IA9eN0hFZtzis=;
	b=gwNzOGk5UK6UgQz59O5ha8nQBgwtoYI0QAlP5OBe96R+gX3wDt9c/8AHLcuJCzgNHH3C
	 G3NSMd1qowq3Y6RKYBO4o3aL6Ntb+Wn/HsNGo3aS3eMmhhoNVrVxT3oWJ4EH2uVqV9PgW
	 OfBD5d3a1T4QI16ZJ9IhCKEXaYMh+8d6X7NYZYubHc+ZYd0C3RfSbAUvj8+D7KfFPDqUD
	 AloUq4YrMlfu5C7C5ekVgxKxMfoI6HdDWHpWkoXLAHPJxxHhaThR2+s0ITfOJVJ+n3cMM
	 ixOzj82bu7zFmDhug00F+MQyocwxjtyLm76LKkCJLzD9SHVcXvBfGksKV1ANIlM4E9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Tb4WJjXo;
	arc=none smtp.remote-ip=113.46.200.216
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02930606A331
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02930606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Tb4WJjXo
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=/pX/0zcpELm4T3tW1ew12U67QtK8O0IA9eN0hFZtzis=;
	b=Tb4WJjXovABgSGjngM0OfUlcQPiTbFOoUm6oh4nqIrgd4s1GQGr69tXvGjANh5uQmwXCYMQGQ
	rG8o3ruVB9cUbWtpeuLcMjpawW4aSw0JCXg+cE2u3MKW19IDVa4yLJfn/7EU5DzTRsUiw9R8COy
	CADLbhBYtn4MfvnimQtKz0A=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jNSj75ypbz1T4H6;
	Mon,  9 Nov 2026 19:48:27 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id C8B124056D;
	Mon,  9 Nov 2026 19:48:54 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 9 Nov
 2026 19:48:54 +0800
Message-ID: <dc148861-35cc-4029-835e-2e93c8b64f05@huawei.com>
Date: Mon, 9 Nov 2026 19:48:53 +0800
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
Subject: Re: [PATCH v4 3/3] fs/resctrl: Unmount resctrl with the CDP state it
 was mounted with
To: Reinette Chatre <reinette.chatre@intel.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<bp@alien8.de>, <tan.shaopeng@fujitsu.com>, <zengheng4@huawei.com>,
	<gshan@redhat.com>, <jic23@kernel.org>, <ben.horgan@arm.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261105070934.2258613-1-ruanjinjie@huawei.com>
 <20261105070934.2258613-4-ruanjinjie@huawei.com>
 <7163c46a-2abf-42d2-842a-8a43dafecaa3@intel.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <7163c46a-2abf-42d2-842a-8a43dafecaa3@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/7 6:52, Reinette Chatre 写道:
> Hi Jinjie,

Hi Reinette,

> 
> On 11/4/26 11:09 PM, Jinjie Ruan wrote:
>> resctrl can be mounted without CDP, unmounted, and mounted again with
>> CDP enabled. A group's RMID is not returned to the free list when the
>> group is removed: it stays in limbo until the cache lines tagged with it
>> are evicted, and a limbo worker reads its occupancy counter in the
>> meantime. When resctrl is mounted again, the worker reads the RMIDs of
>> the groups removed by the unmount.
>>
>> On MPAM the counter is selected by the PARTID of the CLOSID that owned
>> the RMID. Without CDP, CLOSID c is PARTID c; with CDP it is PARTIDs 2c
>> and 2c+1. resctrl_unmount() clears the CDP state before it removes the
>> groups, so their monitor configuration is also removed with a different
>> CLOSID to PARTID mapping. With 5 PARTIDs:
>>
>>   mount                  CDP off, CLOSID c -> PARTID c
>>   mkdir g1..g4           CLOSIDs 1..4
>>   umount
>>     rdt_disable_ctx()    clear CDP
>>     remove g1..g4        RMIDs enter limbo with CLOSIDs 1..4
>>   mount -o cdp           CDP on, CLOSID c -> PARTIDs 2c, 2c+1
>>   limbo worker           reads CLOSID 2 as PARTID 5 > PARTID_MAX 4
>>                          MSC error interrupt, mpam_disable()
> 
> As I understand this issue goes both ways. If resctrl is first mounted

Right! it also have the same problem.

> with CDP the issue may even be worse since there is no error interrupt that
> draws attention to the problem that the wrong (albeit in range) RMID entries

Yes, there is no error irq.

> are tested. In such opposite scenario CDP is disabled on unmount causing
> the limbo handler that keeps running to immediately use the wrong index
> before resctrl is mounted again.

I agree.

> 
>>
>> The groups are removed after rdt_disable_ctx() clears CDP, so their
>> monitor configuration is cleared with a CLOSID to PARTID mapping that
>> differs from the one used to set it up.
> 
> hmmm .. this paragraph seems out of place after the limbo handler introduction.
> This looks to be a (very) high level description of counter reconfiguration done
> on unmount where MPAM also needs to translate a CLOSID into PARTID. This brief snippet
> seems to be what is connected to the patch subject, not the limbo handler, and
> describes the portion of the patch that moves rdt_disable_ctx() to be after
> resctrl_fs_teardown()? 

Yes, it does.

> 
> As I see it it the move of rdt_disable_ctx() has nothing to do with the limbo handler.
> In the spirit of separating logical changes, could you please separate this fix into
> its own patch? 

Will put it in a seperate patch, thank you!

> 
>>
>> Clear the CDP state after the groups are removed. While resctrl is
>> unmounted, don't read the RMIDs in limbo. When resctrl is mounted,
>> return the RMIDs freed under the other CDP state to the free list
>> without reading their counters, then restart the limbo worker unless it
>> is already queued. The RMIDs stay in limbo across the unmount so that a
>> quick remount does not give a new group an RMID that cache lines from
>> the removed group still carry.
>>
>> Only MPAM with CDP enabled through the cdp or cdpl2 mount option is
> 
> It is unexpected that a mount with cdpl2 impacts the limbo handler that
> only taked the L3 resource into account. (more later)
> 
>> affected; CDP depends on CONFIG_EXPERT. x86 is not affected as its RMID
>> does not depend on the CLOSID.
>>
>> Reproduced on QEMU with the sequence above:
>>
>> 	mpam:__mpam_irq_handler: error irq from msc:1 'MSMONCFG_ID_RANGE', partid:5, pmg: 0, ris: 0
>> 	mpam:mpam_disable: MPAM disabled due to hardware error interrupt
>>
>> With the change the sequence completes without an error.
>>
> 
> ...> ---
>>  fs/resctrl/internal.h |  1 +
>>  fs/resctrl/monitor.c  | 71 ++++++++++++++++++++++++++++++++++++++-----
>>  fs/resctrl/rdtgroup.c |  7 +++--
>>  3 files changed, 70 insertions(+), 9 deletions(-)
>>
>> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
>> index 1c85e06f09bf..c95fa6ce62e6 100644
>> --- a/fs/resctrl/internal.h
>> +++ b/fs/resctrl/internal.h
>> @@ -373,6 +373,7 @@ void closid_free(int closid);
>>  int setup_rmid_lru_list(void);
>>  
>>  void free_rmid_lru_list(void);
>> +void resctrl_limbo_resume(void);
>>  
>>  int alloc_rmid(u32 closid);
>>  
>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>> index ae9ddd380515..717c3888c2b5 100644
>> --- a/fs/resctrl/monitor.c
>> +++ b/fs/resctrl/monitor.c
>> @@ -70,6 +70,11 @@ static u32 *closid_num_dirty_rmid;
>>   */
>>  static unsigned int rmid_limbo_count;
>>  
>> +/*
>> + * @limbo_cdp - The CDP state under which the RMIDs in limbo were freed.
>> + */
>> +static bool limbo_cdp;
> 
> The variable is described as "The CDP state ..." but its type is a boolean.
> What does "true" mean? Could this be renamed limbo_cdp_enabled?
> 
> Looks like this is only set if CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID is set,
> please mention that in the comments.
> 
>> +
>>  /*
>>   * @rmid_entry - The entry in the limbo and free lists.
>>   */
>> @@ -852,6 +857,10 @@ void cqm_handle_limbo(struct work_struct *work)
>>  	 */
>>  	mutex_lock(&rdtgroup_mutex);
>>  
>> +	/* Don't read the RMIDs in limbo until a mount sets up the CDP state. */
>> +	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID) && !resctrl_mounted)
>> +		goto out_unlock;
>> +
> 
> Is this IS_ENABLED() check needed? There are several flows managing the limbo handler
> yet just cqm_handle_limbo() and resctrl_limbo_resume() use this IS_ENABLED() check to manage
> the lifecycle in a unique way that I am concerned will trip people up in the future when
> trying to untangle the limbo worker lifecycle.
> 
> I understand that the IS_ENABLED() check is added to support MPAM specifically here but
> I think we should aim for as much as possible similar behavior across all architectures.

Yes, it is for mpam.

> To that end I do not see why limbo handler should not run on MPAM when resctrl fs is unmounted
> while on x86 it should. 

Is it because the CDP implementation of x86 is different from MPAM, and
MPAM is implemented through simulation?

> 
> Having the limbo handler only depend on resctrl_mounted here will make the behavior consistent
> across architectures while also matching the overflow handler. Keeping these behaviors similar
> just makes the code easier to understand and reason about. Having resctrl filesystem provide
> consistent flows across all architectures ensures the same flows are always tested.
> 
> Yes, x86 would lose the ability to drain RMIDs across an unmount, but nothing needs these
> RMIDs while resctrl is unmounted. This work ensures that the RMIDs are freed shortly
> after a mount when they will be needed.

I believe this behavior is also universal for x86.

> 
> Could you please separate out a patch that _only_ changes the limbo handler lifetime
> independent of architecture? This patch can introduce resctrl_limbo_resume() but not release

Will put it in a seperate patch, thank you!

> any RMIDs from it. Splitting the limbo worker lifecycle change that impacts both
> architectures from the MPAM specific change that releases RMIDs on mount would make
> the impact easier to describe to reviewers.
> 
>>  	/*
>>  	 * Ensure the worker is dedicated to a CPU as intended and not
>>  	 * relocated by workqueue subsystem as part of CPU going offline.
>> @@ -868,10 +877,12 @@ void cqm_handle_limbo(struct work_struct *work)
>>  	__check_limbo(d);
>>  
>>  	if (has_busy_rmid(d)) {
>> -		d->cqm_work_cpu = cpumask_any_housekeeping(&d->hdr.cpu_mask,
>> -							   RESCTRL_PICK_ANY_CPU);
>> -		schedule_delayed_work_on(d->cqm_work_cpu, &d->cqm_limbo,
>> -					 delay);
>> +		int cpu;
>> +
>> +		cpu = cpumask_any_housekeeping(&d->hdr.cpu_mask,
>> +					       RESCTRL_PICK_ANY_CPU);
>> +		if (schedule_delayed_work_on(cpu, &d->cqm_limbo, delay))
>> +			d->cqm_work_cpu = cpu;
>>  	}
>>  
>>  out_unlock:
>> @@ -893,10 +904,13 @@ void cqm_setup_limbo_handler(struct rdt_l3_mon_domain *dom, unsigned long delay_
>>  	int cpu;
>>  
>>  	cpu = cpumask_any_housekeeping(&dom->hdr.cpu_mask, exclude_cpu);
>> -	dom->cqm_work_cpu = cpu;
>> +	if (cpu >= nr_cpu_ids) {
>> +		dom->cqm_work_cpu = cpu;
>> +		return;
>> +	}
>>  
>> -	if (cpu < nr_cpu_ids)
>> -		schedule_delayed_work_on(cpu, &dom->cqm_limbo, delay);
>> +	if (schedule_delayed_work_on(cpu, &dom->cqm_limbo, delay))
>> +		dom->cqm_work_cpu = cpu;
>>  }
> 
> hmmm ... this cqm_work_cpu wrangling is a concern and surely looks like something that
> we will trip over later. Making it worse is that there is no justification or explanation
> for why this is needed. I *assume* that it is done with anticipation that
> schedule_delayed_work_on() may fail since limbo handler is already pending, but please

Yes, that it the reason.

> also keep in mind that the worker my already be running and blocked on rdtgroup_mutex.
> We just had to fix a similar issues in this area recently so I would like to avoid any new
> issues here.
> 
> Looks like sashiko also uncovered a few issues in this area:
> 	https://sashiko.dev/#/patchset/20261105070934.2258613-1-ruanjinjie%40huawei.com
> 
> Could this implementation not instead just ensure that the worker is not pending and then
> the above two hunks can be dropped? (more later)
> 
>>  
>>  void mbm_handle_overflow(struct work_struct *work)
>> @@ -1033,6 +1047,49 @@ int setup_rmid_lru_list(void)
>>  	return 0;
>>  }
>>  
>> +/**
>> + * resctrl_limbo_resume() - Resume RMID limbo handling after a mount.
>> + *
>> + * Release the RMIDs that were freed under another CDP state without
>> + * reading them, and restart the limbo handler.
>> + */
>> +void resctrl_limbo_resume(void)
>> +{
>> +	struct rdt_l3_mon_domain *d;
>> +	struct rdt_resource *r;
>> +	bool cdp;
>> +
>> +	if (!IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID) ||
> 
> Please drop this check from the core limbo handler resume code that
> should be done for all architectures. Instead just use it to gate whether
> release_limbo_rmids() is called or not.

OK.

> 
>> +	    !resctrl_arch_mon_capable())
>> +		return;
>> +
>> +	lockdep_assert_held(&rdtgroup_mutex);
> 
> Please move to beginning of function. How about lockdep_assert_cpus_held()?

OK.

> 
>> +
>> +	r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
>> +
>> +	cdp = resctrl_arch_get_cdp_enabled(RDT_RESOURCE_L2) ||
>> +	      resctrl_arch_get_cdp_enabled(RDT_RESOURCE_L3);
> 
> This is unexpected and looks to be leaking an MPAM quirk into
> the filesystem? I see there is a global "cdp_enabled" that guides
> MPAM internals but on the filesystem side it does not look right for
> the L2 CDP state to impact the limbo handler that only operates on
> L3 resource.

I will recheck this logic, Thank you!

> 
>> +
>> +	if (cdp != limbo_cdp) {
>> +		list_for_each_entry_rcu(d, &r->mon_domains, hdr.list,
>> +					lockdep_is_cpus_held()) {
>> +			if (d->rmid_busy_llc && has_busy_rmid(d))
> 
> How about calling cancel_delayed_work(&d->cqm_limbo) here? Could doing
> so eliminate the need for all that cqm_work_cpu wrangling?

Make sense, so we need not check whether it is running later.

> 
>> +				release_limbo_rmids(d);
>> +		}
>> +	}
>> +	limbo_cdp = cdp;
>> +
>> +	if (!resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID))
>> +		return;
> 
> Could this be moved to the top of the function? QOS_L3_OCCUP_EVENT_ID
> state cannot change between mounts and this is the event that determines
> whether limbo handler runs at all. Moving this check would also eliminate the 
> need for the "d->rmid_busy_llc" check above.

But limbo_cdp must be updated for next time check.

> 
>> +
>> +	list_for_each_entry_rcu(d, &r->mon_domains, hdr.list,
>> +				lockdep_is_cpus_held()) {
>> +		/* A queued worker will run, don't move its cqm_work_cpu. */
>> +		if (has_busy_rmid(d) && !delayed_work_pending(&d->cqm_limbo))
>> +			cqm_setup_limbo_handler(d, 0, RESCTRL_PICK_ANY_CPU);
>> +	}
>> +}
>> +
>>  void free_rmid_lru_list(void)
>>  {
>>  	if (!resctrl_arch_mon_capable())
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 5d0351453c2f..e6b64a5c9302 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -3150,13 +3150,14 @@ static void resctrl_unmount(void)
>>  	cpus_read_lock();
>>  	mutex_lock(&rdtgroup_mutex);
>>  
>> -	rdt_disable_ctx();
>> -
>>  	/* Put everything back to default values. */
>>  	for_each_alloc_capable_rdt_resource(r)
>>  		resctrl_arch_reset_all_ctrls(r);
>>  
>>  	resctrl_fs_teardown();
>> +
>> +	/* Remove the groups under the CDP state they were set up with. */
> 
> This comment looks out of place as it documents what happens _before_
> rdt_disable_ctx(). It also only refers to removal of group while I believe

It should be moved before resctrl_fs_teardown().

> (when looking an MPAM's __config_cntr()) there is an issue with counter reset 
> also?
> 
> How about something like:
> 
> 	Clear the CDP state after the cleanup. The CDP state decides
> 	which hardware configuration a CLOSID refers to, so the teardown
> 	must run with the state the configuration was created under.

It looks a bit more complete, will update the comment as it.

> 
>> +	rdt_disable_ctx();
>>  	if (resctrl_arch_alloc_capable())
>>  		resctrl_arch_disable_alloc();
>>  	if (resctrl_arch_mon_capable())
>> @@ -3261,6 +3262,8 @@ static int rdt_get_tree(struct fs_context *fc)
>>  						   RESCTRL_PICK_ANY_CPU);
>>  	}
>>  
>> +	resctrl_limbo_resume();
>> +
>>  	/*
>>  	 * Ensure root remains accessible after mutex is unlocked so that
>>  	 * kernfs_kill_sb() can run safely if called by kernfs_get_tree()'s
> 
> Reinette

-- 
Best regards,
Jinjie

