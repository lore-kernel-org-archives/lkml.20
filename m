Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946665;
	b=UX9p5nMYzPc3P0JcKGaFXsCpVLl+U2ERSpNft7c40bO9+CitXsNK4BqCTwGlpMxhlISV
	 eKMHIeSxWy3xGOt1/70GYaVpk2vffa7Tb9l8QxatjAwVXRHm4L3hPMUwBQ82iGiNsj7Ep
	 1Lmv94yr64lsVRSdEOBvgUDm3x7Hnnz5PLXrnlDPj23bjzDhbnttugUCbh7nThGRsMRqE
	 94cK3h/Ya+Q7Jel5r+eoewUOvw7KD32J1N7d8W48oIsRDhyNR3/dXur7cvykGVFvnkAXi
	 wu5Qo/3v0GN5QkIYfbuRgHbOAHgQe/TzC96sRol0s0/9sySN9Az5jfEyxKcOJT/nfzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946665;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=DQeh+eeQMo/SIybDgVOY15eY93EZz04rm/AKrXj4yok=;
	b=PI0CGiL881qMz7GXiGCKb3cXrOaHQrA6U0KfxI6LhMVeS1Ulmd2FumYiZYr5oSrWmksF
	 rdeo+nlR6Vyue9fpRxbz4YC8dErR/td8C7nSYPwjCKo0aSiCF049aSH0zwteU+bzn6gOY
	 7cp6u4a9FDdzkNxI+Sxg5+BkSiRdSEQi81Cn0pA262JuveGQNP5B4NoMdTFPc16Ci87FI
	 fg0fFk0mvCuGODebEZRw0eOU37D2hJbQiRbeus//kquLWk6Ie+/RB9MiPJCM+CijaaRUK
	 7JzHnmfaEPlwMivzmUBkD1YH1+S3PGis6rufRIf4VBYvCRwWo62V9mhDTZQm2/bW6vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ofCxben6;
	arc=none smtp.remote-ip=113.46.200.227
Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63239606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63239606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ofCxben6
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=DQeh+eeQMo/SIybDgVOY15eY93EZz04rm/AKrXj4yok=;
	b=ofCxben6kZYgog2AIP9FKZtRjFeAdLzTqDWjOP9lNE/2fQxFRW88oK4ts6qk3iMnq0j0nxa/+
	NTrkI/1jGpA9r0h6iSDpndU36KdLQRgtGEeAud4jLvSv2tZEOIGLK+0HXNtyKzjWkI6BuVakm4m
	+/sohbElFPNNP6V/WHwbmJA=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4jLTpD6zNHznTV6;
	Fri,  6 Nov 2026 14:31:00 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id B73F240563;
	Fri,  6 Nov 2026 14:30:58 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 6 Nov
 2026 14:30:57 +0800
Message-ID: <99d6cf18-61ae-4eb2-9efc-c483e92f3fbc@huawei.com>
Date: Fri, 6 Nov 2026 14:30:57 +0800
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
Subject: Re: [PATCH v2] arm_mpam: resctrl: Limit num_rmids to the CLOSIDs in
 use
To: Ben Horgan <ben.horgan@arm.com>, <tony.luck@intel.com>,
	<reinette.chatre@intel.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<babu.moger@amd.com>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<jic23@kernel.org>, <zengheng4@huawei.com>, <gshan@redhat.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
References: <20261105123304.2281987-1-ruanjinjie@huawei.com>
 <676991f4-6ddd-4cd0-a3f5-880cef369f62@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <676991f4-6ddd-4cd0-a3f5-880cef369f62@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/5 22:12, Ben Horgan 写道:
> Hi Jinjie,
> 
> For patches that touch mpam and fs/resctrl the conventional prefix, as I understand it, should be
> arm,fs/resctrl: and if it also touches the x86 rdt code it should then be arm,x86,fs/resctrl:.

Hi Ben,

Thank you for the reminder.

> Although, if possible please try and make separate patches for each.
> 
> 
> On 05/11/2026 12:33, Jinjie Ruan wrote:
>> On MPAM an RMID is a PMG within a PARTID, so resctrl can only allocate
>> the PMGs of the CLOSIDs it uses. info/L3_MON/num_rmids is instead set
>> to the whole PARTID and PMG space when the monitors are initialised,
>> and halved when CDP is enabled. It reports more RMIDs than resctrl can
>> allocate in two cases:
>>
>> - With CDP each CLOSID takes two PARTIDs, and resctrl halves the
>>   CLOSID count rounding down, while MPAM halves the whole RMID space.
>>   With 5 PARTIDs and 2 PMGs resctrl has 2 CLOSIDs and 4 RMIDs, but
>>   num_rmids reads 5. The count is too high whenever the number of
>>   PARTIDs is odd and there is more than one PMG.
>>
>> - On a monitor-only system there are no control groups and resctrl
>>   only uses the default CLOSID, but num_rmids still covers every
>>   PARTID. With 5 PARTIDs and 2 PMGs it reads 10 while only 2 RMIDs
>>   can be allocated.
>>
>> RMID allocation is limited to the CLOSIDs in use, so only the value
>> reported to userspace is too high. Creating as many monitor groups as
>> num_rmids allows fails with -ENOSPC before that number is reached.
>>
>> Let resctrl tell the architecture how many CLOSIDs it uses on every
>> mount. Add resctrl_arch_set_mon_rmid_count(), called after closid_init()
> 
> Is it really necessary for resctrl to tell the MPAM driver the number of CLOSIDs? Is there any case
> where the MPAM driver doesn't just know how many CLOSIDs there will be?

Unnecessary, we can do the same thing in the mpam driver, will drop it.

> 
> Thanks,
> 
> Ben
> 
> 
>> and before the info files are created, and have MPAM report
>> (pmg_max + 1) RMIDs for each CLOSID. The CLOSID count already accounts
>> for CDP, as schemata_list_add() halves it when CDP is enabled, so drop
>> the halving in resctrl_arch_set_cdp_enabled(). A monitor-only system
>> passes 1 for the default CLOSID. On x86 the RMIDs do not depend on the
>> CLOSIDs and the hook does nothing.
>>
>> Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> Cc: <stable@vger.kernel.org> # 7.1.x
>> Cc: James Morse <james.morse@arm.com>
>> Cc: Ben Horgan <ben.horgan@arm.com>
>> Cc: Reinette Chatre <reinette.chatre@intel.com>
>> Cc: Fenghua Yu <fenghuay@nvidia.com>
>> ---
>> v2:
>> - Use the "arm_mpam: resctrl:" prefix.
>> - Also fix num_rmids on monitor-only systems, as Ben suggested: add
>>   resctrl_arch_set_mon_rmid_count() so resctrl reports the number of
>>   CLOSIDs it uses, and remove the CDP-only rounding.
>> - Retitle from "arm_mpam: Round the CDP RMID count down to whole CLOSIDs".
>> - v1: https://lore.kernel.org/all/20261104101622.563280-1-ruanjinjie@huawei.com/
>> ---
>>  arch/x86/include/asm/resctrl.h |  3 +++
>>  drivers/resctrl/mpam_resctrl.c | 18 ++++++++++++------
>>  fs/resctrl/rdtgroup.c          |  2 ++
>>  include/linux/resctrl.h        |  1 +
>>  4 files changed, 18 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
>> index 8f6edcdcfd87..50165027b92d 100644
>> --- a/arch/x86/include/asm/resctrl.h
>> +++ b/arch/x86/include/asm/resctrl.h
>> @@ -164,6 +164,9 @@ static inline bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 ignored,
>>  	return READ_ONCE(tsk->rmid) == rmid;
>>  }
>>  
>> +/* RMIDs are independent of CLOSIDs on x86. */
>> +static inline void resctrl_arch_set_mon_rmid_count(u32 num_closid) { }
>> +
>>  static inline void resctrl_arch_sched_in(struct task_struct *tsk)
>>  {
>>  	if (static_branch_likely(&rdt_enable_key))
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>> index 5468367776e2..cca9568bab70 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
>> @@ -217,11 +217,6 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>>  	cdp_enabled = enable;
>>  	mpam_resctrl_controls[rid].cdp_enabled = enable;
>>  
>> -	if (enable)
>> -		l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx() / 2;
>> -	else
>> -		l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
>> -
>>  	/* The mbw_max feature can't hide cdp as it's a per-partid maximum. */
>>  	if (cdp_enabled && !mpam_resctrl_controls[RDT_RESOURCE_MBA].cdp_enabled)
>>  		mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = false;
>> @@ -279,6 +274,16 @@ u32 resctrl_arch_system_num_rmid_idx(void)
>>  	return (mpam_pmg_max + 1) * (mpam_partid_max + 1);
>>  }
>>  
>> +void resctrl_arch_set_mon_rmid_count(u32 num_closid)
>> +{
>> +	struct rdt_resource *l3 = &mpam_resctrl_controls[RDT_RESOURCE_L3].resctrl_res;
>> +
>> +	if (!l3->mon_capable)
>> +		return;
>> +
>> +	l3->mon.num_rmid = (mpam_pmg_max + 1) * num_closid;
>> +}
>> +
>>  u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid)
>>  {
>>  	return closid * (mpam_pmg_max + 1) + rmid;
>> @@ -1350,7 +1355,8 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
>>  	 * each control group. Hence, advertise the whole rmid_idx space even
>>  	 * though each control group has its own pmg/rmid space. Unfortunately,
>>  	 * this does mean userspace needs to know the architecture to correctly
>> -	 * interpret this value.
>> +	 * interpret this value. resctrl_arch_set_mon_rmid_count() replaces it
>> +	 * with the RMIDs of the CLOSIDs in use when resctrl is mounted.
>>  	 */
>>  	l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
>>  
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 106e78fb1f1d..2335dd7054ca 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -3214,6 +3214,8 @@ static int rdt_get_tree(struct fs_context *fc)
>>  	if (ret)
>>  		goto out_schemata_free;
>>  
>> +	resctrl_arch_set_mon_rmid_count(closids_supported() ?: 1);
>> +
>>  	if (resctrl_arch_mon_capable())
>>  		flags |= RFTYPE_MON;
>>  
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index 10dfdca7f4bf..4a78f2e60bdf 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -417,6 +417,7 @@ static inline u32 resctrl_get_default_ctrl(struct rdt_resource *r)
>>  /* The number of closid supported by this resource regardless of CDP */
>>  u32 resctrl_arch_get_num_closid(struct rdt_resource *r);
>>  u32 resctrl_arch_system_num_rmid_idx(void);
>> +void resctrl_arch_set_mon_rmid_count(u32 num_closid);
>>  int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid);
>>  
>>  bool resctrl_enable_mon_event(enum resctrl_event_id eventid, bool any_cpu,
> 

-- 
Best regards,
Jinjie

