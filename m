Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793245926;
	b=5HE0LHngCoEUFx0lqciVniCQpA5XLAZxanSJ8YukvhFSWH24Q1GgCmJYRrwsuvhgeUhB
	 i8pT3RrWN99LS0OiN3N7LBP1qRYRKrCwEbMlY05BR2V3fYIKuCq5Ntxc/xexAY0gwMWTa
	 8Zeb5D+E63Xxt7dxjS2z8ovKebW5gKbVv5Up6EXPSozMk0NQfu/pyQvkCXrY1mYPX6WJE
	 jQX6G6dIZJg6SRopFB6WYZTLdFm3BhVrXmV/mzYEGFv7trYHeBo9IuyhrPECFAK2JUQAu
	 M1M8jyALfOkthYENABX5sYW1L81MDKBdPNGqeRUuBzUJh5vzs1pHu1owUJZY+1cTLlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793245926;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=qixoEVSqgEF2nQA2b/vD107HKEObSlU42nXMVY8kxqo=;
	b=LPiiN6IvIHFzjEuOaV9jdLb2SKQecf5JsRmTd+kPD8qHcUWBYK76swfimCXewFqaFdYT
	 fd++2dtmo3FaWLKWU21RkuHT2EL8EdWsEiTH0HdbSMW2ZcL3GIS+kbg4hZAjnRs9ZpoDH
	 HS1FgaZdx0aN7V5r8XbMQ7ZOckwVLazcu7+6LM6sI24re1L8cqHfk0joJ6jh1ZV+6lRse
	 wC/RZXZnf3TItoP7kpe7buzOmCdqE+M8TBs+7pTe3CXrDivf58x0ZhQGFLbffTb7MGHbp
	 MN5n5Tw9RC5jSmrnwCR8rmkfdVkdZS43I+dyrBWzdjd2dtthz3XeoGY7GwAiz/UVQ7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=burAcJNh;
	arc=none smtp.remote-ip=113.46.200.222
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D22A606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:52:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D22A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=burAcJNh
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=qixoEVSqgEF2nQA2b/vD107HKEObSlU42nXMVY8kxqo=;
	b=burAcJNhxmpTJAQPIX47fbpGXa0r0jmuW/AinYm18KVGY74WGO8vvtMTnx8ZJVqAk1ugoXf3j
	m5txwD/4Vew6NhB058SUyST3p0+uH1TKk9GN6R2veH0I9aEbQikOKKpwAN4YtSs6SlZ7Hn8TcQg
	oKDFlRUb96Swu5Mz84KTIvk=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jFVf95q4LzLlTD;
	Thu, 29 Oct 2026 11:51:45 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id BC8CC40563;
	Thu, 29 Oct 2026 11:51:52 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 11:51:51 +0800
Message-ID: <ee77c4f7-e1d6-47e1-8cc6-d6a749f6a55a@huawei.com>
Date: Thu, 29 Oct 2026 11:51:51 +0800
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
Subject: Re: [PATCH v10 RESEND 01/15] fs/resctrl: Return -EBUSY when
 per-CLOSID RMIDs are in limbo
To: Reinette Chatre <reinette.chatre@intel.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <ben.horgan@arm.com>,
	<fenghuay@nvidia.com>, <tan.shaopeng@fujitsu.com>, <zengheng4@huawei.com>,
	<jic23@kernel.org>, <gshan@redhat.com>, <catalin.marinas@arm.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261020134239.3921377-1-ruanjinjie@huawei.com>
 <20261020134239.3921377-2-ruanjinjie@huawei.com>
 <faf2f64a-ef40-4ec7-afcd-282885c09833@intel.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <faf2f64a-ef40-4ec7-afcd-282885c09833@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/10/29 5:28, Reinette Chatre 写道:
> Hi Jinjie,
> 
> On 10/20/26 6:42 AM, Jinjie Ruan wrote:
>> resctrl_find_free_rmid() returns ERR_PTR(-ENOSPC) when no matching RMID
>> is found in the free list. On systems where RMIDs depend on CLOSIDs
>> (CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID), the target CLOSID may have RMIDs
>> temporarily in limbo rather than permanently exhausted.
>>
>> When userspace attempts to create a new monitoring group, a permanent
>> -ENOSPC failure prevents retry even though the CLOSID's RMIDs may become
>> available once the limbo handler completes.
>>
>> Check closid_num_dirty_rmid[] before returning -ENOSPC. If the target
>> CLOSID has dirty RMIDs, return -EBUSY to signal a retryable condition.
>>
>> Fixes: c4c0376eefe1 ("x86/resctrl: Allow RMID allocation to be scoped by CLOSID")
>> Cc: James Morse <james.morse@arm.com>
>> Cc: Reinette Chatre <reinette.chatre@intel.com>
>> Cc: Babu Moger <babu.moger@amd.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  fs/resctrl/monitor.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>> index 73413cb128ea..da883adc3adc 100644
>> --- a/fs/resctrl/monitor.c
>> +++ b/fs/resctrl/monitor.c
>> @@ -225,6 +225,14 @@ static struct rmid_entry *resctrl_find_free_rmid(u32 closid)
>>  			return itr;
>>  	}
>>  
>> +	/*
>> +	 * If this CLOSID has RMIDs in limbo, return -EBUSY so userspace can
>> +	 * retry. Otherwise, the CLOSID is genuinely out of RMIDs.
>> +	 */
>> +	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID) &&
>> +	    closid_num_dirty_rmid[closid])
>> +		return ERR_PTR(-EBUSY);
>> +
>>  	return ERR_PTR(-ENOSPC);
>>  }
>>  
> 
> Does this address all scenarios? Consider for example the first test of 
> resctrl_find_free_rmid():
> 
> 	if (list_empty(&rmid_free_lru))
> 		return rmid_limbo_count ? ERR_PTR(-EBUSY) : ERR_PTR(-ENOSPC);
> 
> If rmid_free_lru is empty but rmid_limbo_count > 0 then it will return -EBUSY
> but it may be that closid_num_dirty_rmid[closid] is zero so no amount of
> waiting on limbo handler will produce a usable RMID.

Yes, you are right, we should defer the check for whether rmid_free_lru
is empty, and first check whether closid_num_dirty_rmid is 0 to
determine whether to return -EBUSY.



> 
> Reinette

-- 
Best regards,
Jinjie

