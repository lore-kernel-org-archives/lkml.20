Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793170236;
	b=to966a40Rzjb2fTdlCySH0m+nbpZLr3gvqsw/3HhqWvSLrN2kf9TEx2JQUqCkT64cs2f
	 8JHm6PIt5Tu+TEidG5I+wkavc/mXFnjXFIx3TENUOwZYD7JItk38cazfLAHB5UA5IYagC
	 yFr/kB87B3cUSUxLMQvDJXBLTzTkGSOM3eR6tUg42rK0zWlicp5mgAKOAVkN4t3uuOMXj
	 /Zh7DlHc8bY2y64fI89QGJd1A8Hjdl3yy8il9Hi4bqG/J7OQY8UcbrfI35dZFy14yHcgF
	 P6+er+ry7RyttXJvV2OuDb1OZnFVySp1F0+F98WS0SGhEhGUakuedgVcQl7PUT/81+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793170236;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=MM4e7fqDmtE4Y1ZW9vkBOxUF+4WU0wru0ULzuQOF7XA=;
	b=0VixCM6zljjygfFagl6nCDzxsJx1coumtrvDz3mE5Pi4orEeeFCZlfBBiqDXxgT1S4Xc
	 KNbnISF4pOOjfcS5Kkd1xCqzyw7N6CcOktlqWUzGxq2KB/x0BGALpzvBK1uzeYEHW5r58
	 fNvzGBR0ioSGgIz3bVQsaccc2UnGHTJ2oP/ZZ124xyiaIH0McGJZBrI6tOjDW9EmPu8Lh
	 +SJ/SJyNeRBKQN3jO0xp0shhFBa6Xkmc0XHIoC8Drd7eN+PgbbyDOsrUntKOivdP0Gxd7
	 SiUMi5EKOITE159P9VO0dKrvIiRpwBVA5+EtYp0C6UhcPGZp+qlP/zNUbUPkOZQ8Tkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=kDYCJR6S;
	arc=none smtp.remote-ip=113.46.200.224
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB13606A31A;
	Wed, 28 Oct 2026 06:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DB13606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=kDYCJR6S
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=MM4e7fqDmtE4Y1ZW9vkBOxUF+4WU0wru0ULzuQOF7XA=;
	b=kDYCJR6SJ82tPv7VlCiiurY6K2bKbbvDJxj3cmhJNiV6IeumEI1K1Ib+EOGfAF0FExlMWgzAu
	0VU372aPc4j52tFDFJU/YVCKIXA7Ib+XrObEW0jN50KdQLSSeIXeOxJiUQLp1wLBLvNsXAuLTK4
	ibWmxgHJEB8QLqv5F/24Q3s=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jDyfl5V83z1cyqb;
	Wed, 28 Oct 2026 14:50:23 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 71B9340586;
	Wed, 28 Oct 2026 14:50:30 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 28 Oct
 2026 14:50:29 +0800
Message-ID: <e0475b6d-3728-49e2-aab7-efd4c49593f1@huawei.com>
Date: Wed, 28 Oct 2026 14:50:29 +0800
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
Subject: Re: [RFC PATCH 0/7] arm_mpam: Add L2 cache monitors
To: Ben Horgan <ben.horgan@arm.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <mark.rutland@arm.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <james.morse@arm.com>,
	<reinette.chatre@intel.com>, <fenghuay@nvidia.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <babu.moger@amd.com>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261022084821.4014873-1-ruanjinjie@huawei.com>
 <c1e80268-3981-48bb-b251-dcd2218fc9d5@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <c1e80268-3981-48bb-b251-dcd2218fc9d5@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/10/26 19:46, Ben Horgan 写道:
> Hi Jinjie,
> 
> On 22/10/2026 09:48, Jinjie Ruan wrote:
>> MPAM resource monitors hang off a partitionable resource in an MSC, not
>> off a particular cache level. resctrl only knows about the L3 scope, so
>> the L2 cache monitors that MPAM platforms implement are discovered by
>> the driver but never show up in resctrl.
> 
> Yes, it would be good to add support for more monitoring scopes. This is not just relevant for MPAM.
> RISC-V can also have monitors at many places in the system and we should coordinate so we have a
> uniform solution across architectures.

Hi Ben,

Agree, we should take other emerging architectures such as RISC-V into
account, design a more extensible solution.

> 
>>
>> An L2 MSC has the same CSU and MBWU counters as an L3 MSC; the cache
>> level comes from the ACPI MPAM table's cache locator. So this is mostly
>> a resctrl scope problem, not a hardware one.
>>
>> Extend resctrl's monitor scope to L2: register the L2 occupancy and
>> bandwidth events against the L2 resource, pick the L2 classes for them,
>> and borrow a CSU/MBWU monitor for the duration of a read. With CDP the
> 
> Borrowing an MBWU monitor doesn't sound right. The MBWU monitor needs to be configured while the
> traffic is happening so that it can keep count of bytes. The CSU is different as it can measure the
> occupancy without having to keep any state.

Thank you very much, will drop this approach and try the compatible
solution you suggested.

> 
> Thanks,
> 
> Ben
> 
>> two PARTIDs need separate accumulating monitors, so the borrowed-monitor
>> context becomes one monitor per PARTID.
>>
>> Patches:
>>
>>   1-2  Generalise the per-domain read path, add l2c_occupancy and
>>        mbm_core_bytes, update the documentation.
>>
>>   3    Split the borrowed-monitor context into data and code entries.
>>
>>   4    Do the CDP num_rmid halving for every mon_capable resource.
>>
>>   5-7  Pick the L2 classes, describe the events with the L2 resource,
>>        add the read paths.
>>
>> Tested on QEMU with an L2/L3/memory-controller MSC topology. The L2_MON
>> files show up and are readable; l2c_occupancy reports the modelled
>> occupancy, and mbm_core_bytes reports the modelled bandwidth.
>>
>> QEMU branch: https://github.com/ruanjinjie-eng/qemu/tree/mpam
>> Test cases: https://github.com/ruanjinjie-eng/mpam_testcase
>>
>> Jinjie Ruan (7):
>>   fs/resctrl: Generalize __l3_mon_event_count for non-L3 resources
>>   fs/resctrl: Add the L2 monitor events
>>   arm_mpam: resctrl: Split monitor context for code/data
>>   arm_mpam: resctrl: Halve num_rmid for every mon_capable resource on
>>     CDP
>>   arm_mpam: resctrl: Describe the L2 monitor events with the L2 resource
>>   arm_mpam: resctrl: Pick L2 classes for the L2 monitor events
>>   arm_mpam: resctrl: Add the L2 monitor read paths
>>
>>  Documentation/arch/arm64/mpam.rst |  23 +--
>>  drivers/resctrl/mpam_resctrl.c    | 236 +++++++++++++++++++++++-------
>>  fs/resctrl/monitor.c              |  15 +-
>>  include/linux/resctrl_types.h     |  13 +-
>>  4 files changed, 222 insertions(+), 65 deletions(-)
>>
> 

-- 
Best regards,
Jinjie

