Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725889;
	b=M1t7Dm2XWj2+GcMpjsko8SYnW8Jfij9xOV5m2IED/5yryfFCSF000zuO1GxIs358EADT
	 GcWmkgmiI5q9Lg/xG8doBKS5EE/wO36HFb8krT02j5jrayw5UHNcCh3AeZ4G/NswSP022
	 hkbbTd411ecan6KsIGOKDmP3lm5UIOWKHw098DQm1BZaeX6aElovMH3RjAPt6JhsBZ9GB
	 AslhXvbBHiOmNJHcgimxqichwewDVyh/6vUAZ9QFo5HSDiJl2gsUa/ydPteUhhHjqAAj1
	 pwOPUjxS6BRayky9uJT0sCt2XVmdVIemH5hI9Ebh1nz9DNMoiqaR23mr2xNTnb8lXBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725889;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=s1Yv71SuyxOXYsD/jAGU72nFY9Ch4hVTWZURPNYFJAw=;
	b=vXJQ3rf6v1ZZsAyKa/KbwzmSiYGabv0C/COi3SexeIyRzrLTRq52Fs67iV7+NlJ44fvJ
	 U5cIFNYWyVY1Fm8tcNgR44ie9f5DJCtRAzcd99IbQcIlSgnGHlDvTF5+NImuOVglZKmL4
	 CT1V5qedlOaRC4To69WVn+zAmF/bdphOD2PaZ9NkBZno1PpKrvy8srCNgxbL8SNVKOVeq
	 /xz7rkfK95NZSSk5PK5X9S7f42jgHaz61fodURDH+jOhsBO5INF0uO3u4hHnKQyBIUBrb
	 85x1QLbzLUlutKMLBsPtApLRTB3nJg6Wu4ShFqT3Gw79vrK8jxw4KxGpA6RFrERFHCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=db6rR0GJ;
	arc=none smtp.remote-ip=113.46.200.216
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDC4606A332
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CDC4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=db6rR0GJ
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=s1Yv71SuyxOXYsD/jAGU72nFY9Ch4hVTWZURPNYFJAw=;
	b=db6rR0GJZuqqWFRKh5fhIkUVWkdEfj1sS9OFhpqzfJpN71WxyqtyNRXh35QyqpWB5YYSoi+G3
	iPoE/C4chRv2KpYrxAf4rFnJ4YhTSLPXZ28+xj2HGEQzkjtZkai4/6HS+RqyxZv7N/QHQM01BLt
	kYtf6+b4PpxBsWDBT9o2AZs=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4j9pKf2Htdz1T4Gd;
	Fri, 23 Oct 2026 11:24:38 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 7F07340538;
	Fri, 23 Oct 2026 11:24:40 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 23 Oct
 2026 11:24:39 +0800
Message-ID: <894e51bb-c511-4fa1-90fb-055360cf1f65@huawei.com>
Date: Fri, 23 Oct 2026 11:24:38 +0800
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
Subject: Re: [PATCH v9 0/9] arm_mpam: Introduce Narrow-PARTID feature
To: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>, Zeng Heng
	<zengheng@picoheart.com>, "tony.luck@intel.com" <tony.luck@intel.com>,
	"reinette.chatre@intel.com" <reinette.chatre@intel.com>,
	"Dave.Martin@arm.com" <Dave.Martin@arm.com>, "james.morse@arm.com"
	<james.morse@arm.com>, "babu.moger@amd.com" <babu.moger@amd.com>,
	"tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "hpa@zytor.com" <hpa@zytor.com>,
	"ben.horgan@arm.com" <ben.horgan@arm.com>, "fenghuay@nvidia.com"
	<fenghuay@nvidia.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20261012082337.822258-1-ruanjinjie@huawei.com>
 <TY4PR01MB16930CE9AD3B1D0AF7BEE6C208B662@TY4PR01MB16930.jpnprd01.prod.outlook.com>
 <88c6c8cd-5da7-4c28-8d5c-7d6489e5913f@picoheart.com>
 <TY4PR01MB16930C19CEFB050B742F74AF68B642@TY4PR01MB16930.jpnprd01.prod.outlook.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <TY4PR01MB16930C19CEFB050B742F74AF68B642@TY4PR01MB16930.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/10/23 10:53, Shaopeng Tan (Fujitsu) 写道:
> Hello Jinjie, ZengHeng,
> 
> 
>>>
>>> I would like to confirm the following points.
>>>
>>>  - Is the number of reqPARTIDs per intPARTID dependent on the total number of intPARTIDs and reqPARTIDs?
>>
>> Hi Shaopeng,
>>
>> You are right,
>>
>> reqPARTID % mpam_num_closid(the total number of intPARTIDs) -> intPARTID
>>
>> so reqPARTIDs per intPARTID = Total number of reqPARTIDs / Total number
>> of intPARTIDs
>>
>>>  - Given that requirements for the number of control and monitoring groups vary by user,
>>>    would dynamic configuration of the mapping ratio between intPARTID and reqPARTID be a more suitable approach?
>>
>> No, in v8 James has suggested "static first" and avoid exposing user ABI
>> in multiple places below:
>>
>> "I think we should leave anything dynamic here for the further future,
>>  lets get static partitioning working first"
>>
>> "I'd prefer we get the static grouping working first, before we work out
>> what needs changing in resctrl to do it dynamically"
>>
>> "I'd like to avoid exposing user ABI to control this until we get it
>> working, then we can talk about whether to try making the grouping
>> dynamically managed by resctrl."
>>
>> Link:
>> https://lore.kernel.org/all/2944b506-a462-42f8-95cf-404241fb27f0@arm.com/
>> Link:
>> https://lore.kernel.org/all/ec8bc617-9e74-4749-ab33-39d1079415cc@arm.com/
>>
>>
>>>  - Regarding the mapping logic, some reqPARTIDs may remain unused. Is this the expected behavior?
>>
>> As mentioned above, we are implementing the static solution first, so it
>> is expected behavior that some of the reqpartids are not used.
>>
>>>  - Considering that Arm has previously implemented this,
>>>    are there any gaps between their implementation and Huawei’s requirements?
>>>    https://lore.kernel.org/linux-arm-kernel/20241212154000.330467-1-Dave.Martin@arm.com/
>>
>> I haven't looked at the ARM implementation yet (I'll refer to it later),
>> but currently the code is being gradually aligned with the maintainer's
>> review comments.
> 
> 
> My understanding is that if hardware supports PARTID Narrowing, 
> the feature is automatically enabled in the current driver implementation. 

Hi Shaopeng,

Yes, You’ve got it right

> This implies that users cannot disable it even if they wish to do so.

Right.

> Could you please confirm if my understanding is correct?
> 
> If so, I believe we need a mechanism to explicitly enable or disable this feature. In Dave Martin's proposal, 
> a partid_per_closid switch was introduced, where partid_per_closid = 1 effectively disables the feature, 
> while setting it to `N` allows for customization to meet individual user requirements.
> 
> It would be ideal if we could configure the partid_per_closid value during the MPAM driver load time, 
> avoiding the need for dynamic changes while the driver is in use. What are your thoughts on this approach?

I agree with the idea of having a switch at initialization time.

But I think it can be added later as an additional feature, and it
doesn’t conflict with the current implementation.

> 
> Additionally, could you please let me know which branch this patch series is based on?

I rebased on v7.3-rc6.

This series is also available at:

	https://github.com/ruanjinjie-eng/linux/tree/narrow_partid_v10

> 
> 
> Best regards,
> Shaopeng TAN

-- 
Best regards,
Jinjie

