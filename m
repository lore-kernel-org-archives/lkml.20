Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794886305;
	b=3iIb9nnCp6JuUF+67PfcGxtsYgYVyhPfHIrkX/LAiuJEy+IIA7AVPjZRy3OkS8yV7JD0
	 o/h0HABON4HoN3mOqVIZ/L7SxgHrsf1nVHPNfuVrNQ6f0veswa8eR7gwbLKiicACVb7p4
	 5K9bD53VaFF2K2acdtJj3Q1A9o6SM4ByHxnkTG+ei45NYbC4o/GZK1SkwvuynRRdQUDLM
	 H8ftYpuYCkjy06IDmUAsLjnSjNyz5hi7qlEHjU/jU0/JmFD+bZf31kPgZQxFSzrVyrZU/
	 xidLFDj5wGOXJ427x+rTEqqa2tH28QziWren2UjvjMsvLBvNq6zihNc72bniHIk5LQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794886305;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=rlurS4MvXS+GmSamzD0JfsmMpmwQtgRk+U6c6jP8MBo=;
	b=BTGNAUClRE0oyLsCFVrOrGtlXWHcgm2+BeWd0VeIhMmm/vsVBjt2BYCJFDGCnXJ7bRxb
	 u8pwMgaQjE9ntQuLKGmU4bP/ZrR7C5kwVxI+nmxiGzo1TQ5OKP1TGp8VzZvq5LOVZxeB6
	 KG1wFLACHPUsNKRpJzZdne3cBK7mYICelGAGxi1kZXVXXbwEJhzGet0MyZTJ6cEHXxE4p
	 GrwhezFKMUUSqym2I+dRexJyGBhB528C/2CEC6olmcw/yTR0WuGTSnw4cz/foslybIuXE
	 g7u21ZiqbLl9sLxNHwvPg3LD8h0yYmp64caMGXDWkV7DJDffRAEeC47cwuWhCxbxurQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=PKfwVZYu;
	arc=none smtp.remote-ip=113.46.200.220
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A86606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28A86606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=PKfwVZYu
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rlurS4MvXS+GmSamzD0JfsmMpmwQtgRk+U6c6jP8MBo=;
	b=PKfwVZYuXZwA8euS7rl3LEz71zSVabOEJGzaSgNcCU/T3r7nZwjGms5xi0j7y9aq93QPG29uZ
	Ep0eWKve20okKf1G5PlmswmIY2/kWrr4wACRNmAX9+cSEF4ig68JsIM/7lW0DsgGNtTBNsIJgAX
	AoAMBK2LcbHl2t7XI0FcN3E=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jT9H62Gv6z12LcZ;
	Tue, 17 Nov 2026 11:30:42 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 48FEA203AB;
	Tue, 17 Nov 2026 11:31:35 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 17 Nov
 2026 11:31:34 +0800
Message-ID: <b1fd5fa8-bf03-4575-bc05-540a288b609d@huawei.com>
Date: Tue, 17 Nov 2026 11:31:33 +0800
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
Subject: Re: [PATCH v4 2/3] arm_mpam: resctrl: Only enable CDP on a resource
 that supports it
To: Gavin Shan <gshan@redhat.com>, <james.morse@arm.com>,
	<ben.horgan@arm.com>, <reinette.chatre@intel.com>, <fenghuay@nvidia.com>,
	<zengheng4@huawei.com>, <tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261111081316.3828283-1-ruanjinjie@huawei.com>
 <20261111081316.3828283-3-ruanjinjie@huawei.com>
 <a783b375-7c27-4c91-b40e-7e615d33bc5b@redhat.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <a783b375-7c27-4c91-b40e-7e615d33bc5b@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Hi Gavin,

在 2026/11/13 7:42, Gavin Shan 写道:
> On 11/11/26 6:13 PM, Jinjie Ruan wrote:
>> resctrl_arch_set_cdp_enabled() enables CDP for any cache level that is
>> requested, even one that has no MPAM cache controls. Mounting resctrl
>> with -o cdpl2 when only L3 can allocate still turns CDP emulation on for
>> the whole system, so every CLOSID takes two PARTIDs while resctrl keeps
>> its CLOSID count at the number of PARTIDs. Control groups in the upper
>> half then map to PARTIDs beyond mpam_partid_max, which index past the
>> configuration and monitor arrays and program out of range PARTIDs into
>> the MSCs. On QEMU with 5 PARTIDs the first monitor read after creating
>> 2 control groups raises MSMONCFG_ID_RANGE for PARTID 5, and MPAM is
>> disabled.
>>
>> Do not enable CDP when a resource cannot allocate or is not CDP capable,
>> as x86 does, so the mount fails instead. Only the enable path is checked,
>> since unmount disables CDP on both cache levels to restore the MBA
>> control.
>>
>> A system where only MBA can allocate, or that only has monitors, now
>> fails a mount with CDP as well: CDP hides the MBA control because
>> mbw_max is a per-PARTID maximum, leaving nothing for CDP to apply to.
>>
>> Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
>> Link: https://sashiko.dev/#/bug/linux-05c19551-0bba-4a06-
>> aa2c-3c90fab5853d
>> Suggested-by: Ben Horgan <ben.horgan@arm.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> Cc: <stable@vger.kernel.org> # 7.1+
>> ---
>>   drivers/resctrl/mpam_resctrl.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/
>> mpam_resctrl.c
>> index 573617ba09df..afa3c084c475 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
>> @@ -222,6 +222,10 @@ int resctrl_arch_set_cdp_enabled(enum
>> resctrl_res_level rid, bool enable)
>>       if (enable && mpam_partid_max < 1)
>>           return -EINVAL;
>>   +    if (enable && (!
>> mpam_resctrl_controls[rid].resctrl_res.alloc_capable ||
>> +               !mpam_resctrl_controls[rid].resctrl_res.cdp_capable))
>> +        return -EINVAL;
>> +
> 
> x86 only checks 'cdp_capable', so this check isn't exactly same as to
> what's
> done on x86, as claimed in the commit log?

Sorry, the commit message is somewhat misleading and need updated.

In my opinion, CDP is a feature related to resource allocation, and it
is always reasonable to check alloc_capable.

Best regards,
Jinjie

> 
> int resctrl_arch_set_cdp_enabled(enum resctrl_res_level l, bool enable)
> {
>         struct rdt_hw_resource *hw_res = &rdt_resources_all[l];
> 
>         if (!hw_res->r_resctrl.cdp_capable)
>                 return -EINVAL;
> 
>         :
> }
> 
> 
>>       /*
>>        * resctrl_arch_set_cdp_enabled() is only called with enable set to
>>        * false on error and unmount.
> 
> Thanks,
> Gavin

