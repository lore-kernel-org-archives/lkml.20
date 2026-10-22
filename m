Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792633882;
	b=GWgW03PUWcaWywDb372B6lTO/C5lBauG23vn3/9gc1tyGgnXwRGfyxZk9ct+MUtZRp5V
	 Pl5dXhroL1FtzN2kkUPXoiqE94C0pG6s9K8krtFxV2g4beukj464zdbDUvGnFgBhiEs+S
	 X+pciRqbH2F6bOWAwIsIPoqq66L0LUxuPCUv3ahwmgzpWskbCm0ADJLd67RtnGWiEJ0lL
	 x64Xnw07U4DEs7DV4+ZLorCu8RRfjaROxBtXKhWxCDQ0AfAxo7Rod9QQ78Tabhcbj9sBJ
	 zuaxPufs4FUN5O8gVHXW2/XJPra3P7wi7iICbA/Z0zcC7P93FFnGw17v1ndCKsi17DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792633882;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=3iMfMhxfw5kayLgQ+ratnvMf0GrA3hzl9KQf2w39uas=;
	b=nUeHnOQWsCuATvWifilBBy4PvPk+xPZXc7LVtJp/1dX6mPhKnnwMElEXT08Kz3GtGfxH
	 v7S1PwQ3JywYzKW7IJYryHHd/CgiZ+IxsI5uUFvthHT1CvScT9QDpcXrqzaLfw9kjHFsw
	 09jsDex9WTT01775fErMdQ+7js+vq43ibB5kuJRcjhtuV1xDv94VjYhq3VAdD1lcEpPE1
	 JKUs9s/KGXxcWu6Xmad1wIxPmKKl9Kq6X21iIp+qFVOd1KZr3x+qgQVqgfVKS5s4XtcZ8
	 MrAnbm5vDhDTmgSfkgFbHIBcvP+LpcsYFCtK/vLvmx7EQ1953YSAI4i3DTpEkPckrUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=y0ys0K+m;
	arc=none smtp.remote-ip=113.46.200.218
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D124606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:51:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D124606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=y0ys0K+m
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=3iMfMhxfw5kayLgQ+ratnvMf0GrA3hzl9KQf2w39uas=;
	b=y0ys0K+mctFUoeHzG5PnyE5apLMd4qBkgebjEPnfmSAUlU47j2uKESiIun3w6CqhibvEiaf7d
	Pvxc0AOxTbzq+oDKCTSeBMk3qoJLECiYxfNw/v7pCwhZ1ZeUmOfZ5j5C7i7zPoU3aqDcSGda8PI
	Sr9+0gSOUBWtsSdlOTHQ8ko=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4j98J92Vg5zpSvF;
	Thu, 22 Oct 2026 09:51:05 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id A439B4057D;
	Thu, 22 Oct 2026 09:51:06 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 09:51:05 +0800
Message-ID: <f3cf7673-0720-4fb3-8f36-a451b3cb6dde@huawei.com>
Date: Thu, 22 Oct 2026 09:51:05 +0800
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
To: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>, "tony.luck@intel.com"
	<tony.luck@intel.com>, "reinette.chatre@intel.com"
	<reinette.chatre@intel.com>, "Dave.Martin@arm.com" <Dave.Martin@arm.com>,
	"james.morse@arm.com" <james.morse@arm.com>, "babu.moger@amd.com"
	<babu.moger@amd.com>, "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com"
	<mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hpa@zytor.com"
	<hpa@zytor.com>, "ben.horgan@arm.com" <ben.horgan@arm.com>,
	"fenghuay@nvidia.com" <fenghuay@nvidia.com>, "x86@kernel.org"
	<x86@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
References: <20261012082337.822258-1-ruanjinjie@huawei.com>
 <TY4PR01MB16930CE9AD3B1D0AF7BEE6C208B662@TY4PR01MB16930.jpnprd01.prod.outlook.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <TY4PR01MB16930CE9AD3B1D0AF7BEE6C208B662@TY4PR01MB16930.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/10/22 8:02, Shaopeng Tan (Fujitsu) 写道:
> Hello Jinjie,
> 
> I would like to confirm the following points.
> 
>  - Is the number of reqPARTIDs per intPARTID dependent on the total number of intPARTIDs and reqPARTIDs?

Hi Shaopeng,

You are right,

reqPARTID % mpam_num_closid(the total number of intPARTIDs) -> intPARTID

so reqPARTIDs per intPARTID = Total number of reqPARTIDs / Total number
of intPARTIDs

>  - Given that requirements for the number of control and monitoring groups vary by user, 
>    would dynamic configuration of the mapping ratio between intPARTID and reqPARTID be a more suitable approach?

No, in v8 James has suggested "static first" and avoid exposing user ABI
in multiple places below:

"I think we should leave anything dynamic here for the further future,
 lets get static partitioning working first"

"I'd prefer we get the static grouping working first, before we work out
what needs changing in resctrl to do it dynamically"

"I'd like to avoid exposing user ABI to control this until we get it
working, then we can talk about whether to try making the grouping
dynamically managed by resctrl."

Link:
https://lore.kernel.org/all/2944b506-a462-42f8-95cf-404241fb27f0@arm.com/
Link:
https://lore.kernel.org/all/ec8bc617-9e74-4749-ab33-39d1079415cc@arm.com/


>  - Regarding the mapping logic, some reqPARTIDs may remain unused. Is this the expected behavior?

As mentioned above, we are implementing the static solution first, so it
is expected behavior that some of the reqpartids are not used.

>  - Considering that Arm has previously implemented this,
>    are there any gaps between their implementation and Huawei’s requirements?
>    https://lore.kernel.org/linux-arm-kernel/20241212154000.330467-1-Dave.Martin@arm.com/

I haven't looked at the ARM implementation yet (I'll refer to it later),
but currently the code is being gradually aligned with the maintainer's
review comments.

> 
> Best regards,
> Shaopeng TAN
> 
> 
>> Background
>> ==========
>>
>> In ARM MPAM, a monitoring group is defined by a (PARTID, PMG) pair.
>> However, many production platforms implement only a single PMG bit,
>> limiting the total number of monitoring groups long before the request
>> PARTID space is exhausted.
>>
>> Hardware Mechanism
>> ===================
>>
>> Platforms with "PARTID narrowing" mitigate this by mapping multiple
>> request PARTIDs onto a single internal PARTID. The internal PARTID
>> dictates the control group configuration, while each individual request
>> PARTID functions as an independent monitoring group. This decouples
>> control and monitoring allocation, allowing more monitoring groups
>> than the PMG constraint normally permits.
>>
>> Software Strategy
>> ==================
>>
>> Using request PARTIDs beyond the internal range is only safe when no MPAM
>> class loses a non-aliasing control. While aliasing controls (e.g., cache
>> portion bitmaps) can be safely replicated across request PARTIDs,
>> non-aliasing controls (e.g., cache capacity) are additive and cannot.
>>
>> To ensure safety, this series implements a completely static grouping
>> policy evaluated once before resctrl_init(). If any class contains
>> non-aliasing controls without narrowing capabilities, the expansion
>> is bypassed. This infrastructure remains completely transparent
>> to user-space.
>>
>> Patch Architecture
>> ====================
>>
>> - Patches 1-4: Bugfix and preparatory rework.
>>
>> - Patch 5: Track both internal and request PARTID limits per class.
>>
>> - Patches 6-7: Implement driver-side modulo interleaving for request
>>   PARTIDs and flat global RMID indexing.
>>
>> - Patches 8-9: Identify non-aliasing controls, and enable the narrowing
>>   expansion by lifting driver-side partid_max clamping and freeing
>>   the extra request PARTIDs for resctrl.
>>
>> Changes since v8
>> - Replaced dynamic allocation with pure static grouping as requested by James.
>> - Removed the 'mpam.intpartid_max' boot parameter; expansion is now automatic.
>> - Extended safety verification to all classes, preserving
>>   forward-compatibility for unknown classes that might gain resctrl
>>   schemas later.
>> - Decoupled the driver infrastructure patch from the resctrl glue patch.
>> - Introduced resctrl_arch_rmid_idx_match() to clean up the RMID allocator.
>> - Link to v8: https://lore.kernel.org/all/20260413085405.1166412-1-zengheng4@huawei.com/
>>
>> Previous Versions
>> =================
>>
>>     v7: https://lore.kernel.org/all/20260317132141.1272506-1-zengheng4@huawei.com/
>>     v6: https://lore.kernel.org/all/20250222112448.2438586-1-zengheng4@huawei.com/
>>     v5: https://lore.kernel.org/all/20250217031852.2014939-1-zengheng4@huawei.com/
>> RFC-v4: https://lore.kernel.org/all/20250104101224.873926-1-zengheng4@huawei.com/
>> RFC-v3: https://lore.kernel.org/all/20241207092136.2488426-1-zengheng4@huawei.com/
>> RFC-v2: https://lore.kernel.org/all/20241119135104.595630-1-zengheng4@huawei.com/
>> RFC-v1: https://lore.kernel.org/all/20241114135037.918470-1-zengheng4@huawei.com/
>>
>> Jinjie Ruan (6):
>>   fs/resctrl: Add resctrl_arch_rmid_idx_match() helper
>>   arm_mpam: resctrl: Add resctrl_closid_rmid_to_partid_pmg() helper
>>   arm_mpam: Add a helper to check a PARTID is in a CLOSID
>>   arm_mpam: Track the PARTID and internal PARTID limits per class
>>   arm_mpam: Identify the non-aliasing controls
>>   arm_mpam: Use the request PARTIDs beyond the internal range
>>
>> Zeng Heng (3):
>>   fs/resctrl: Unmount resctrl with the CDP state it was mounted with
>>   arm_mpam: Divide the PARTIDs between the control groups
>>   arm_mpam: Map resctrl RMIDs onto the request PARTIDs
>>
>>  arch/x86/include/asm/resctrl.h  |   6 +
>>  drivers/resctrl/mpam_devices.c  | 105 +++++++++++++---
>>  drivers/resctrl/mpam_internal.h |  24 ++++
>>  drivers/resctrl/mpam_resctrl.c  | 213 +++++++++++++++++++++++++++-----
>>  fs/resctrl/monitor.c            |  13 +-
>>  fs/resctrl/rdtgroup.c           |  38 +++++-
>>  include/linux/arm_mpam.h        |   1 +
>>  7 files changed, 341 insertions(+), 59 deletions(-)
>>
>> -- 
>> 2.34.1
>>

-- 
Best regards,
Jinjie

