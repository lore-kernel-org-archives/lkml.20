Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793589850;
	b=wfDIIqhCxJQmWUvdnDm0bbXLEw75dWkz4UJc3Rhmgc2JHoK1V2IR9eE4EnP6tKNwT5JO
	 21/66FJi9ZvkPWx3LpC0fdopPirN7t32SQJeGKdxjRXIP7XFWP88kjzG3+P6X8Yk6qB3y
	 1jTiFMXTzICyO0gHuBs1Usw1vGTCZcMTU/Hb49HGBA3um9PNGtBljM16GYFqLXXO8SAKL
	 hSUZs5k0Z3e6SJ5hviZtX3Ogq4ELt793FChCGlksnMZuAmGlmQlOXulNptTodVYw3Gz6V
	 5fwtjWTEugRR0awuhLAhplKjcosqYoICDRXt5FPC2iWGU0S4bHp1a9uRHbRhtKB+8VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793589850;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=KaTdiwMWudYfERU/E+XvtEtv6XN7xCCT4UxFwKCQbgY=;
	b=xm1M9SD5zZrYKPyHrO33C7woGgLJE8VHzhe7I6rDZIipQTFdHmbBhr6cQjUvddnCQlEj
	 1U7brZgfne5Qo88Pp4IaVyUm8oywuV0t6gUQOzhdKSFeTh1C3jyCgxRk5FKDiG8C0EYWR
	 oRAhjXNiT0JIuBPKQN2e8Fj5Sz4eieK6evlmjF6M3Uuzc4P9TDjijrZWjmCfxVFP8HX7/
	 55uKExa5kFpVwnGBcwOiuOXsNtVZmOC/PwsOvZt/r9kTw0HBYHyhjPG5bjezfyNkzWyN3
	 WFM2edlXURqRw4ANySoF2wHIbd4NSt1Oy+pYJROjFXm6PhR6UZLv/Zd2wfjp6S36ppA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=O2p8XH9+;
	arc=none smtp.remote-ip=113.46.200.218
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470E3606A324;
	Mon,  2 Nov 2026 03:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 470E3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=O2p8XH9+
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=KaTdiwMWudYfERU/E+XvtEtv6XN7xCCT4UxFwKCQbgY=;
	b=O2p8XH9+nIKo/SHJQvkoNlL4LG8DUPa7z5az4NMbn4QOSUwJiVcYlpUUX/m9TA7CQfyPm2MvU
	Cwh5LZ6dROeeylnsx9068aMRCbanodwtjZlAGPjtuw2LVfYHEH7g6S6Ul29eDy6TYX4JY1IF6uP
	NNoos+v4xL/Z385AyfTy/iA=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4jHxqs4cm8zpStD;
	Mon,  2 Nov 2026 11:23:37 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 9E70540561;
	Mon,  2 Nov 2026 11:23:58 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 2 Nov
 2026 11:23:57 +0800
Message-ID: <9880eb24-2189-4592-a999-5769c59ebb81@huawei.com>
Date: Mon, 2 Nov 2026 11:23:57 +0800
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
Subject: Re: [RFC PATCH v2 00/19] resctrl: Generalize monitor events across
 resources
To: Reinette Chatre <reinette.chatre@intel.com>, <james.morse@arm.com>,
	<ben.horgan@arm.com>, <fenghuay@nvidia.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <mark.rutland@arm.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>,
	<zengheng4@huawei.com>, <gshan@redhat.com>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20261029123611.1108424-1-ruanjinjie@huawei.com>
 <d4a54429-7d45-4936-b5b3-06d8fa8545ee@intel.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <d4a54429-7d45-4936-b5b3-06d8fa8545ee@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/10/31 1:09, Reinette Chatre 写道:
> Hi Jinjie,
> 
> On 10/29/26 5:35 AM, Jinjie Ruan wrote:
>> Resctrl only knows about monitoring at the L3 scope. MPAM monitors are
>> attached to a resource in an MSC, and firmware says which cache level that
>> resource is. The driver already finds L2 monitors, but resctrl has
>> nowhere to show them.
>>
>> This is not MPAM specific. RISC-V can also place monitors at several
>> points in the system.
>>
> 
> One key to this is in the first sentence of this cover letter: "Resctrl only knows
> about monitoring at the L3 *scope*.".
> 
> When it comes to exposing monitoring data to user space resctrl has been using "L3"
> interchangeable as resource and scope. 
> 
> The existing resctrl user interface already establishes that the "L3" in
> "L3_MON" and the per monitor group "mon_data/mon_L3_xx" refers to the L3 *scope*,
> not the L3 resource. More specifically, consider the existing user interface:

Hi Reinette,

Thanks for your explanation, you are right, the "L3" in "L3_MON" and
"mon_L3_xx" is the scope, not the resource, this interface can include
different resources such as MB and L3 at the same time..

> 
> # find mon_data/
> mon_data/
> mon_data/mon_L3_00
> mon_data/mon_L3_00/mbm_local_bytes <=== monitoring data associated with MB resource at L3 scope
> mon_data/mon_L3_00/mbm_total_bytes <=== monitoring data associated with MB resource at L3 scope
> mon_data/mon_L3_00/llc_occupancy   <=== monitoring data associated with L3 resource at L3 scope
> 
> Associating the monitor events with the L3 resource was an implementation choice
> that was convenient at the time. Since L2 can similarly be used interchangeably for resource
> and scope associating the L2 scope monitoring with the L2 resource may similarly be convenient
> when considering how to support L2 monitors as is done in this series.

L2 works here only because the names happen to be the same for resource
and scope as L3 has done.

> 
> Even so, I do not believe that associating monitoring with the resource will be
> able to cleanly support all MPAM monitoring capability. Specifically the upcoming CPU-less
> memory bandwidth monitoring.
> 
> As I see the plan at this time: CPU-less memory bandwidth allocation will be
> backed by a new MB_NODE resource. For these systems the expectation is that their
> monitoring data will be exposed to user space via NODE scope and will appear to user space as:
> 
> mon_data/
> mon_data/mon_NODE_00
> mon_data/mon_NODE_00/mbm_total_bytes <=== monitoring data associated with MB resource at NODE scope

You are righ, associating monitoring with the resource cannot give
mon_NODE_00 but mon_MB_xx. I am happy to key it off scope instead for
naming and display, and keep the resource-based event tables as an
internal detail.

> 
> The cover-letter is titled "Generalize monitor events across resources". As I see it such
> generalization does not prepare resctrl for all MPAM monitoring capabilities. Could this
> work do so?

CPU-less NODE monitoring is not part of this series, but I will make
sure the scope-based naming does not block it.

> 
> Reinette

-- 
Best regards,
Jinjie

