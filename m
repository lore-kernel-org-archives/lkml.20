Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793865080;
	b=Zc1iloqCxQIHSR5Vc9sxb+KgN50sxPamqnuBZkDJwzy/YLn6AgWihJKOgJhpAyoCd++V
	 VzjdlQKTvm51OasE9i/GgDNpk/5ApacKAZQFO1qweMapnw/hVpniQrM76K7kpFaKaDvyy
	 BWfzUUPIjiSKSab86zZlHILdzSEzxM6hO9vZtQ4iU6Bj7Fepk0s5fO96tAn7fthqywN5x
	 iNVpPDVCPwEKoaISiVhVjvLuG8ohpxapS3c+26VrHTMGrfBWrLahoWjVAG+gpibkVTUvK
	 3v80QNwrz/U4b6q3zkq11LHSgqFNFNyQkYacyGRfJ4hzWCFJek6qJXaAI96Y9vhG+hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865080;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=Px0sqORprMbXj8PfvcHinmAN21yuNblfIKP4pRZkKYY=;
	b=BZgZVwZs/dQ/kGDBp63XAZx3q8y2pP8l1NC/cPJNZiTjLbtmRsfMXKv7/UOvrIRYIdKs
	 2dpZ2e1WQLb6yDY3elm+RKyEFKZjhTjIyGI6ck2zVZPNtyC7nRhTQ0rWLWaSQs9HI9AP5
	 Cxab16LVnCWHqNgVdY2jJjtbfe7U0wndMu7t17qhW3m06pOjsd6cmRqp5hVqVEJDX2fkr
	 ddX1yOyl3sns+a2Bi9n+UJFik85gNi2T3dEX+zdVhyopAZYQ50GsWsZD978CEhj+ds8U0
	 oIWKVzUp2OHMNmZW1rj+46z9fVbe5dbRvePa03lnNtNuJdu1aRKnvl6jiJxTsL3jH9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=z7SSXliw;
	arc=none smtp.remote-ip=113.46.200.216
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C1B606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1C1B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=z7SSXliw
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Px0sqORprMbXj8PfvcHinmAN21yuNblfIKP4pRZkKYY=;
	b=z7SSXliwnhT2hTPZZRf02xhKbSmGYoMVBe/uF3REJNemuk0NVX+aIOl5ArfyUCWpo5xDmKV4y
	ByPcQ6biC8I/NAMY1ERfLowFj55XKy5NTmoihKdqKxooyRXcD7hWiM8vUUqS0gKn+2H/F1lIMSy
	8cTVDOtn51cQsx72/Ncb4ak=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jKvct60Dhz1T4Fq;
	Thu,  5 Nov 2026 15:50:54 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id D850E2011D;
	Thu,  5 Nov 2026 15:51:15 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 15:51:15 +0800
Message-ID: <52c306ab-5378-496b-a759-27bbc0b6e55e@huawei.com>
Date: Thu, 5 Nov 2026 15:51:14 +0800
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
Subject: Re: [PATCH] fs/resctrl: Allocate the RMID array with kvzalloc
To: Ben Horgan <ben.horgan@arm.com>, <tony.luck@intel.com>,
	<reinette.chatre@intel.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<babu.moger@amd.com>, <bp@alien8.de>, <tan.shaopeng@fujitsu.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261104102004.609259-1-ruanjinjie@huawei.com>
 <8a543030-d0c1-416f-8747-6cd599ad6a90@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <8a543030-d0c1-416f-8747-6cd599ad6a90@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/4 18:51, Ben Horgan 写道:
> Hi Jinjie,
> 
> On 04/11/2026 10:20, Jinjie Ruan wrote:
>> setup_rmid_lru_list() sizes rmid_ptrs[] by the whole RMID index space.
>> On x86 the index is the RMID, so the array stays small. On MPAM the
>> index space is the product of the PARTID and PMG ranges, and with a
>> large range the array is megabytes in size.
>>
>> kzalloc() needs a high-order page allocation for it, which fails once
>> memory is fragmented, and a size above KMALLOC_MAX_SIZE always fails.
>> resctrl then fails to mount.
>>
>> Use kvzalloc(), which falls back to vmalloc().
> 
> Yep, I ran into this too when experimenting with large PARTID counts on the FVP model. I have the
> same patch here [1] and plan to repost soon with some more related kmalloc to kvmalloc changes.

Hi Ben,

Sorry, next time before sending, I will carefully check the email list.
Thank you for the review.

> 
> [1] https://lore.kernel.org/lkml/20260911160608.1091121-1-ben.horgan@arm.com/
> 
> Thanks,
> 
> Ben
> 
>>
>> Fixes: 6791e0ea3071 ("x86/resctrl: Access per-rmid structures by index")
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> Cc: <stable@vger.kernel.org> # 7.1.x
>> Cc: Tony Luck <tony.luck@intel.com>
>> Cc: Reinette Chatre <reinette.chatre@intel.com>
>> Cc: Dave Martin <Dave.Martin@arm.com>
>> Cc: James Morse <james.morse@arm.com>
>> Cc: Babu Moger <babu.moger@amd.com>
>> ---
>>  fs/resctrl/monitor.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>> index f69dbf66f42e..7713aa5d3996 100644
>> --- a/fs/resctrl/monitor.c
>> +++ b/fs/resctrl/monitor.c
>> @@ -1029,7 +1029,7 @@ int setup_rmid_lru_list(void)
>>  		return 0;
>>  
>>  	idx_limit = resctrl_arch_system_num_rmid_idx();
>> -	rmid_ptrs = kzalloc_objs(struct rmid_entry, idx_limit);
>> +	rmid_ptrs = kvzalloc_objs(struct rmid_entry, idx_limit);
>>  	if (!rmid_ptrs)
>>  		return -ENOMEM;
>>  
>> @@ -1125,7 +1125,7 @@ void free_rmid_lru_list(void)
>>  		return;
>>  
>>  	mutex_lock(&rdtgroup_mutex);
>> -	kfree(rmid_ptrs);
>> +	kvfree(rmid_ptrs);
>>  	rmid_ptrs = NULL;
>>  	mutex_unlock(&rdtgroup_mutex);
>>  }
> 

-- 
Best regards,
Jinjie

