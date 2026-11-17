Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794886039;
	b=cCiAKRijPAElACbzDvghXs5MZzZ1yuorwnwIGwc2FICM3Mn5eqABgZnV6wufAzg6XNBY
	 JDycGCzv0eya5nG60p/Ria3NleLgVkMXNlUjC1y0lPQBx2Xfi9MOrQAPkW5lgSzI3BDTv
	 zSGqUh81TrkxFSnq36pUCu6uAtwsZSB6/DLIkh7079v6cP80Xm9SEgDzpL133bWYeuz37
	 9j1rUkJoY/6WjloB2sFVOmkOOAiCGdlzBb4XZipfFzwkZSzTxO8nlQlR3CN4FH6aqi53H
	 h9wbHw7SAIrLN0oUlmgB/CPMaZRP0DDxvuU4RatVVcxY+322w6Evuejvs6Pj228BLzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794886039;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=2zFul203cJABpzA7e6NhNRDGHJm49HaUa43qT7bwsi0=;
	b=fTYGeka/kRFSNBAAuyeeYUXnSjjptThiaTO03QfkryiJi+Nr8hgUioUb9kc4nxw8NaI1
	 JRj37xwy5wnrIePpLyIMdAOttxFo2fCmcs+lKT84QWPwRr9LUlXm3hW7D5URs+mI7vkgm
	 Gd6hUSiWv+lzcYthpvnjhzrrHcKLSTWSknuUI3vMOBBs43d9MkkUvsgXY9hTvDWrfypnO
	 B3u2SYgxWz3wnJ/FV+4pBf9omGetmLqK0uHfd5ATq/68E1TQ0mLkhbr1l6ltpXirOGuEM
	 EHOvFa9L1zga1KkxmdpdS3HOqLfYKORrXRdVxIX1pmTEIzufeI1P+pfLALlV1Ig1LPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=2XmO2F0w;
	arc=none smtp.remote-ip=113.46.200.222
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9416C606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:27:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9416C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=2XmO2F0w
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=2zFul203cJABpzA7e6NhNRDGHJm49HaUa43qT7bwsi0=;
	b=2XmO2F0wYOlOqZXYbb4uoagngFo4eP0ch1UG1ZihMy/0FK3smtUs9vUYYch62jRw13m6KrVYy
	cCoCGopLKVB4FhRpXvmtGIP691hLzWkHVGR5qVBr7Bhi42gQlY8rijG9tGzmtVnScQEeB2I4xMH
	jAKDMqvRZmPa8BCylbnu4zg=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jT9BX5gG3zLlXL;
	Tue, 17 Nov 2026 11:26:44 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 8EDEB40563;
	Tue, 17 Nov 2026 11:27:03 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 17 Nov
 2026 11:27:02 +0800
Message-ID: <1162c8a9-2829-40a4-9ad5-6a526bc57178@huawei.com>
Date: Tue, 17 Nov 2026 11:27:02 +0800
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
Subject: Re: [PATCH v2 2/2] fs/resctrl: Give a monitor domain the counters the
 groups already use
To: Ben Horgan <ben.horgan@arm.com>, <james.morse@arm.com>,
	<reinette.chatre@intel.com>, <fenghuay@nvidia.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <babu.moger@amd.com>, <will@kernel.org>,
	<jic23@kernel.org>, <gshan@redhat.com>, <bp@alien8.de>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261113083506.4129060-1-ruanjinjie@huawei.com>
 <20261113083506.4129060-3-ruanjinjie@huawei.com>
 <10f43d19-2994-4ad2-8a49-2891582e32e7@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <10f43d19-2994-4ad2-8a49-2891582e32e7@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/14 0:14, Ben Horgan 写道:
> Hi Jinjie,
> 
> On 13/11/2026 08:35, tizi4590 wrote:
>> From: Jinjie Ruan <ruanjinjie@huawei.com>
>>
>> With assignable MBM counters, resctrl can be mounted while all CPUs of
>> a monitor domain go offline and one of them comes back, either through
>> CPU hotplug or because hibernation takes the non-boot CPUs offline. The
>> domain is destroyed and re-created, and the new domain starts with no
>> counters assigned. Counters are otherwise only assigned when a group is
>> created, when rdtgroup_assign_cntrs() takes a free counter in each
>> monitor domain for each MBM event, so no code revisits the groups that
>> already exist.
>>
>> Those groups read "Unassigned" on the new domain, on any system with
>> assignable MBM counters. A counter assigned to them later through
>> mbm_L3_assignments is the lowest free one in that domain, so the same
>> group can end up with a different counter ID on different domains. For
>> example, with the counter ID each group uses for mbm_total_bytes and
>> "_" for none:
>>
>>                                domain 0         domain 1
>>   mount, mkdir g1              default=0 g1=1   default=0 g1=1
>>   all CPUs of domain 1 offline default=0 g1=1   (destroyed)
>>   one CPU of domain 1 online   default=0 g1=1   default=_ g1=_
>>   assign g1 on domain 1        default=0 g1=1   default=_ g1=0
>>
>> Each domain has its own counters, so g1 can use counter 0 on domain 1
>> and counter 1 on domain 0 without affecting the other domain, but until
>> it is assigned on domain 1 it reads Unassigned there.
> 
> I brought this up before and it was assessed that no change was required:
> https://lore.kernel.org/lkml/171f92a3-fa2e-44fb-b0d1-1250c72e31d1@amd.com/
> 
> Do you have any particular reason for wanting this behaviour?

Hi Ben,

sashiko also find this problem as below.

Link:
https://sashiko.dev/#/patchset/20261116125914.498841-1-ruanjinjie%40huawei.com

Best regards,
Jinjie

> 
> Thanks,
> 
> Ben
> 
>>
>> Assign the counters when the domain comes online, after its state is
>> set up. Give each enabled MBM event of every group, including the
>> monitor groups under mon_groups/, the counter ID the group uses in
>> another domain, and leave the event unassigned when that ID is already
>> taken on the new domain. Skip groups in pseudo-lock mode, as their RMID
>> has been freed and they are not monitored.
>>
>> A group that has no counter for an event in any domain stays unassigned
>> on the new domain, as it was before. mbm_assign_on_mkdir only applies
>> when a group is created, and counters that the user removed through
>> mbm_L3_assignments stay removed.
>>
>> Fixes: ef712fe97ec5 ("fs/resctrl: Auto assign counters on mkdir and clean up on group removal")
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> Cc: <stable@vger.kernel.org>
>> Cc: Tony Luck <tony.luck@intel.com>
>> Cc: Reinette Chatre <reinette.chatre@intel.com>
>> Cc: Babu Moger <babu.moger@amd.com>
>> Cc: James Morse <james.morse@arm.com>
>> Cc: Ben Horgan <ben.horgan@arm.com>
>> Cc: Dave Martin <Dave.Martin@arm.com>
>> ---
>> Changes in v2:
>> - Drop the MPAM part of the changelog, the MPAM driver is fixed by
>>   "arm_mpam: resctrl: Use the domain's counter ID".
>> - Link to v1: https://lore.kernel.org/all/20261106094537.2337188-1-ruanjinjie@huawei.com/
> 

