Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793064829;
	b=IEeEOtIybgniF46bISsy8v/98a6iqLH+gwJGfOUjeSetqhfd21VMvvmrFrmFrDimZRxV
	 lh0BomYHoSQNwNtR/Zr6xNRqJcBmlvh4VK8WPZm1QJ2iobUbipYr4Zddus5W/oOI/ykog
	 /hR4dFNl+c97nHmujoHZ5xPCDavL/TYUAtzJskgNfua1ZJJ4IGjS0Rp7I5t+kdTyte1+1
	 nKVj/ibB9J654D5vmGXwnlgQYLLzE06n2RPl6+A1h01lqXllMJITiZrl3OZT55kqn9gLz
	 nFS9mnZuVnAZ+tTRG6XDtw2bxdh/uMNxCHJZLcI+H2JqSIH7nLlVSxVsRGKCsA6MOmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793064829;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=VU1MmXBQZzhWH4bqmbYfRjkYl9cO6KG6V5ltO3IaDt0=;
	b=iFzSPV42dsMuhGx8p+wqK2BCvfiPvvGObrfGmRLS6nVp5tiZiduH7yplkujQiOqhRT1n
	 uBVp41TTuFHEUG33t2v6PDNic/cpXCtVEEe2vFtZ5pZVrpCm79ajdB1HlQALnp5JNUpvj
	 DhaYHLaindwSk5n//ZjUKuSg8h/SaM7UdzFuBLR6A5dpNb5qRpTmdVwFmjIw7BcdqQZ6I
	 +SaK1HYAVXSHUkXCD9YOa9xI5rcZZwusR82fR+Lncq8b+SZEAnQFyV1/qfb8Y8hIYAnJe
	 b61NrpxCrq1qjSQcQ8oAny3tjx2U7nPfQBFKIGJ4pO8v9IYENACbDjoVNwawlPReWVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b="HWPtC/QQ";
	arc=none smtp.remote-ip=113.46.200.224
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B521D606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B521D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=HWPtC/QQ
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VU1MmXBQZzhWH4bqmbYfRjkYl9cO6KG6V5ltO3IaDt0=;
	b=HWPtC/QQqDQWk8DU4iuWV1d28nmQqyaOFO3oqzkYaxv6exIeqBi/xE4OPwYLUVBnUU9NHYaGq
	EBLjIeLCW9G56mREFhPiPDACyxS124z/zRfQqzu4C19WMKVKc5WzUKs95Pq/jZ6eVeWLUOYxlLg
	ONk+KSuGXsd3bvz2cYNJ+sQ=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jDCgj6QkDz1cySW;
	Tue, 27 Oct 2026 09:33:37 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id CBEB640561;
	Tue, 27 Oct 2026 09:33:43 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 27 Oct
 2026 09:33:43 +0800
Message-ID: <f927b065-3a87-44ec-b092-4ddff877260c@huawei.com>
Date: Tue, 27 Oct 2026 09:33:42 +0800
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
Subject: Re: [PATCH v10 RESEND 02/15] fs/resctrl: Skip monitor context
 allocation when force-freeing RMIDs
To: Ben Horgan <ben.horgan@arm.com>, <tony.luck@intel.com>,
	<reinette.chatre@intel.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<babu.moger@amd.com>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<tan.shaopeng@fujitsu.com>, <zengheng4@huawei.com>, <jic23@kernel.org>,
	<gshan@redhat.com>, <catalin.marinas@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261020134239.3921377-1-ruanjinjie@huawei.com>
 <20261020134239.3921377-3-ruanjinjie@huawei.com>
 <069b920d-b1f9-4074-aee0-1607860dac21@arm.com>
 <a27fb58a-563b-4c40-8be2-cc9d05f24279@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <a27fb58a-563b-4c40-8be2-cc9d05f24279@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/10/26 22:11, Ben Horgan 写道:
> Hi Jinjie,
> 
> On 26/10/2026 14:08, Ben Horgan wrote:
>> Hi Jinjie,
>>
>> On 20/10/2026 14:42, Jinjie Ruan wrote:
>>> __check_limbo() allocates the architecture monitor context before the
>>> scan loop, even when force_free is set. The force-free path never reads
>>> occupancy and never uses the context.
>>>
>>> If the allocation fails, the function returns early and leaves the limbo
>>> list unflushed. Callers such as the unmount path then silently fail to
>>> return the RMIDs to the free list, leaving stale CLOSIDs in limbo that
>>> are re-interpreted with the CDP state of the next mount.
>>
>> Is this a theoretical fix or is there some way that resctrl_arch_mon_ctx_alloc() can fail in practice?
> 
> This does seem a good change to me and we do have to consider that the memory alocation might fail.

Hi Ben,

I agree. force_free=true not rely on the allocation of arch_mon_ctx
succeeding, we should directly loop to free the RMID.

Perhaps a small refactor is needed to split __check_limbo() into two
versions as there isn't much duplication?

> 
> Thanks,
> 
> Ben
> 
>>
>> Thanks,
>>
>> Ben
>>
>>>
>>> Only allocate and free the monitor context when occupancy will be read.
>>>
>>> Fixes: fa7d949337cc ("x86/resctrl: Rename and move rdt files to a separate directory")
>>> Cc: James Morse <james.morse@arm.com>
>>> Cc: Reinette Chatre <reinette.chatre@intel.com>
>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>> ---
>>>  fs/resctrl/monitor.c | 15 +++++++++------
>>>  1 file changed, 9 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>>> index da883adc3adc..ffa9c67c9f00 100644
>>> --- a/fs/resctrl/monitor.c
>>> +++ b/fs/resctrl/monitor.c
>>> @@ -142,11 +142,13 @@ void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
>>>  	u64 val = 0;
>>>  
>>>  	arch_priv = mon_event_all[QOS_L3_OCCUP_EVENT_ID].arch_priv;
>>> -	arch_mon_ctx = resctrl_arch_mon_ctx_alloc(r, QOS_L3_OCCUP_EVENT_ID);
>>> -	if (IS_ERR(arch_mon_ctx)) {
>>> -		pr_warn_ratelimited("Failed to allocate monitor context: %pe",
>>> -				    arch_mon_ctx);
>>> -		return;
>>> +	if (!force_free) {
>>> +		arch_mon_ctx = resctrl_arch_mon_ctx_alloc(r, QOS_L3_OCCUP_EVENT_ID);
>>> +		if (IS_ERR(arch_mon_ctx)) {
>>> +			pr_warn_ratelimited("Failed to allocate monitor context: %pe",
>>> +					    arch_mon_ctx);
>>> +			return;
>>> +		}
>>>  	}
>>>  
>>>  	/*
>>> @@ -192,7 +194,8 @@ void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
>>>  		cur_idx = idx + 1;
>>>  	}
>>>  
>>> -	resctrl_arch_mon_ctx_free(r, QOS_L3_OCCUP_EVENT_ID, arch_mon_ctx);
>>> +	if (!force_free)
>>> +		resctrl_arch_mon_ctx_free(r, QOS_L3_OCCUP_EVENT_ID, arch_mon_ctx);
>>>  }
>>>  
>>>  bool has_busy_rmid(struct rdt_l3_mon_domain *d)
>>
> 

-- 
Best regards,
Jinjie

