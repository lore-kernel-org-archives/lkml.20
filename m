Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862986;
	b=cqVqAx8G+HKDM8oScoq1hfOTYwz63CqK0gHO4vL9mK9DTu3HNSA35OfQKF/5SUcziECS
	 fX7s3g5x1NO0Nhircp+xUktizRd5pxK/p0lBdljmpmp7RzFmbPwXYr/YThpYbwTPhXfgt
	 u1Ixx6xjSziB/G/wSdzqk2RmWHRHAQj2KCiBNeis4KcE37bCSsdwbChoCRKVxYWLVVCwo
	 pyQTIfDuU9ZXS22ne/XJOwI2vmqU9VonCH0ifGEzoImVZEB85B0P5mKggwyKHwVhMzorS
	 n+q+ZnOMOc29Tr6r+BIGMQmsEOrscu6ZIiPubFNmEGzboTm+Qd9NbgSM1u3aPXCT/LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862986;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=xmDWGutiin4uCx8kXq9+NVdqng5FIqT+d5iQkfyQ+W8=;
	b=yIcEh28WBAMstKCAK7vooI9o4t14RaXOjUVE3eyT9Tr+/eiSBSPYRepKoNCWIIvbWGgN
	 BZtQvZv0jfdcikz/n9tIKXMHttS4S91ppftke7KDZ7AVxycJOur/6fUKz38tGGvREqah5
	 TV8S9N3q3MMp+wu9FSD+DuaDK7KURLzoidtrZoyWibb7usaR3iVKv3djTBolJ8CGJXV8T
	 ER4Il4ujfmR8l04Z1qJ5qg7wPOIjXtMzkXFii53Vh/JybQC2MSnThMZ4hV9w8YI/7cGNj
	 iq4iHikXzexRFGZeQaj885MlqoBSNaKeEKAKd5rOuiV8j/K6OV0C8HbFLGYyZ7ZCtvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=qcMq0vmm;
	arc=none smtp.remote-ip=113.46.200.216
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79A1606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B79A1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=qcMq0vmm
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=xmDWGutiin4uCx8kXq9+NVdqng5FIqT+d5iQkfyQ+W8=;
	b=qcMq0vmmCG+QJ06/5tuCyDejH+9yDD2CBbqRmS3yCn7bs80aWley02L2N3S3jymkY6dVNZTl0
	eY9OZcUVoMN0yt45VCA0PDWf7LeBJ+jz9ewSY+sKYXs4siDGDsr21dnT3I8sFeaTOe8nIKeHVq/
	rGeLwyEATGTYaN2icQF11Rw=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jKtrY68hyz1T4KC;
	Thu,  5 Nov 2026 15:15:57 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id D2FA940538;
	Thu,  5 Nov 2026 15:16:18 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 15:16:18 +0800
Message-ID: <b2d59ec8-31f3-4454-9127-0cea58d27716@huawei.com>
Date: Thu, 5 Nov 2026 15:16:17 +0800
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
Subject: Re: [PATCH] arm_mpam: Round the CDP RMID count down to whole CLOSIDs
To: Ben Horgan <ben.horgan@arm.com>, <james.morse@arm.com>,
	<reinette.chatre@intel.com>, <fenghuay@nvidia.com>, <zengheng4@huawei.com>,
	<gshan@redhat.com>, <jic23@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261104101622.563280-1-ruanjinjie@huawei.com>
 <45efa783-21b4-4f67-a0fd-c6772d5cb038@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <45efa783-21b4-4f67-a0fd-c6772d5cb038@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/4 22:21, Ben Horgan 写道:
> Hi Jinjie,

Hi Ben,

> 
> For patches touching the glue between MPAM and resctrl, essentially mpam_resctrl.c, the prefix used
> is 'arm_mpam: resctrl' rather than just 'arm_mpam'.

The following will be done in this format.

> 
> On 04/11/2026 10:16, Jinjie Ruan wrote:
>> resctrl_arch_set_cdp_enabled() halves the whole RMID index space, while
>> the resctrl core halves the CLOSID count: schemata_list_add() divides a
>> CDP resource's schema by two, and closid_init() takes the smallest
>> across the schemata.
>>
>> When the PMG count and the CLOSID count are both odd, halving the
>> product counts RMIDs that belong to a CLOSID resctrl never allocates.
>> With 3 PMGs and 5 CLOSIDs MPAM reports 7 RMIDs, but the 2 CLOSIDs that
>> resctrl has times 3 PMGs only allow 6. The count is visible in
>> /sys/fs/resctrl/info/L3_MON/num_rmids, so userspace reads a value that
>> includes RMIDs no CLOSID can use; 
> 
> Good spot.
> 
> It occurs to me that 'num_rmids' is also too high on a monitor only system too as there is only one
> PARTID that can be used.  Can you see a clean way to fix this in one go?

I will have a try to fix both problems in a clean way, thank you very much.

> 
> Thanks,
> 
> Ben
> 
> RMID allocation itself is bounded by
>> the free list.
>>
>> Derive the number of RMID groups from the index space and halve that, so
>> the count follows resctrl_arch_system_num_rmid_idx().
>>
>> Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> Cc: <stable@vger.kernel.org> # 7.1.x
>> Cc: James Morse <james.morse@arm.com>
>> Cc: Ben Horgan <ben.horgan@arm.com>
>> Cc: Reinette Chatre <reinette.chatre@intel.com>
>> Cc: Fenghua Yu <fenghuay@nvidia.com>
>> ---
>>  drivers/resctrl/mpam_resctrl.c | 12 +++++++++---
>>  1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>> index 5468367776e2..d3f957162b68 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
>> @@ -217,10 +217,16 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>>  	cdp_enabled = enable;
>>  	mpam_resctrl_controls[rid].cdp_enabled = enable;
>>  
>> -	if (enable)
>> -		l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx() / 2;
>> -	else
>> +	if (enable) {
>> +		u32 num_group;
>> +
>> +		/* Halve the number of RMID groups, keeping whole PMG rows. */
>> +		num_group = resctrl_arch_system_num_rmid_idx() /
>> +			    (mpam_pmg_max + 1);
>> +		l3->mon.num_rmid = (mpam_pmg_max + 1) * (num_group / 2);
>> +	} else {
>>  		l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
>> +	}
>>  
>>  	/* The mbw_max feature can't hide cdp as it's a per-partid maximum. */
>>  	if (cdp_enabled && !mpam_resctrl_controls[RDT_RESOURCE_MBA].cdp_enabled)
> 

-- 
Best regards,
Jinjie

