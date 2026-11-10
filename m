Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304470;
	b=VcFkV0Z2Rjd8xMxvBJ9Rmauxbj+X9clNia0Q98/rxJPAn6cwOI6KsOsCygWvYRg98UvW
	 tfMtyYGgWLns0iwlQTMxSeLkOSVRSDlWwG6vpUkJI1wi1309lSvJuyo7BGjU23x4FiunP
	 GI4pXlajXCs1ne8zBApUT/otjxrVFcXUIbElVVNmUolYWKfBCdjlSNZM05ckW17Y+iE84
	 0gCLFBk+RuIaPolBw9tknJ1VnWrswUeas0+yBNgdtdCZjpw0172fmTd4YcFyBU9ziGJnR
	 BCoEStPkfHerX9VdSzUpZTVQnEWgWFVjrkYnUSNQfdQ40Po9Vb2U1oFW7KZZouN/P2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304470;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=+1i1sVyMH9ad9wsU8jFlrzIKrGOD1X4RL8nm+PYmu6A=;
	b=AVPm9Em3Gwhv0bUDHKHgPKkHzr/qlqNjW3CCf3aYsQf/Mj2fPfKW0koiNpjW1cxFpTbb
	 bJlVtXLL0jA8k0FXYj1Hvjj9LlRjgQKkGPRwU1fiwhHaYku1XJASbtT1Ve9ksEG0pLwt8
	 SPLqhyFmMCnSN/0PbICmWxNQJ4JnqwFDkY6e+GOV/iDN5n1K8n1cpfrX9fPQQEs7mOxn4
	 wW7+gXBAhFu0Bm/oB1iKIo/VQ3HqZf9zEgPuRtXy2U7uPQKURn1rKtgqnv+0JZd47WOUP
	 w5GZuNZqnjPGanqSPNbntkubjtMAI0VGT8SromwV1yqrIRR8LlPh96K0d6B4rLzhotw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=dxG7dKRj;
	arc=none smtp.remote-ip=113.46.200.221
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3B2606A900;
	Tue, 10 Nov 2026 09:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D3B2606A900
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=dxG7dKRj
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+1i1sVyMH9ad9wsU8jFlrzIKrGOD1X4RL8nm+PYmu6A=;
	b=dxG7dKRjQbGQ7VRuW2iwYcZFB00Gynna4dL9BbZdnTflV/D1Wg/cpTkNn9dAnZ2hKAz8J4QjI
	KPKEz1S6B3O3KKTsJLIY/ciq/IYEqpjZZCDDkY03eaKBWPYRrV39a++e65rCmS5GV/CWyDb0P7N
	yv54i+EUDCR4VE0ISK3e4iA=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jP26n00cczRhT3;
	Tue, 10 Nov 2026 17:54:08 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id CA43C40561;
	Tue, 10 Nov 2026 17:54:18 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 10 Nov
 2026 17:54:17 +0800
Message-ID: <46e25aa5-4db5-4322-961c-95ac8a2c40d4@huawei.com>
Date: Tue, 10 Nov 2026 17:54:16 +0800
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
Subject: Re: [RFC PATCH 00/6] resctrl: Support mba_MBps on MPAM
To: Ben Horgan <ben.horgan@arm.com>, Jinjie Ruan <ruanjinjie01@gmail.com>,
	<babu.moger@amd.com>, <bp@alien8.de>, <corbet@lwn.net>,
	<Dave.Martin@arm.com>, <fenghuay@nvidia.com>, <james.morse@arm.com>,
	<rdunlap@infradead.org>, <reinette.chatre@intel.com>,
	<skhan@linuxfoundation.org>, <tony.luck@intel.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
References: <20261109132621.3862497-1-ruanjinjie01@gmail.com_quarantine>
 <dc1398f4-b81c-4ad8-b706-df89a1622e6c@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <dc1398f4-b81c-4ad8-b706-df89a1622e6c@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/10 1:50, Ben Horgan 写道:
> Hi Jinjie,

Hi Ben,

> 
> On 09/11/2026 13:26, Jinjie Ruan wrote:
>> From: Jinjie Ruan <ruanjinjie@huawei.com>
>>
>> Resctrl offers two ways to describe an MBA policy:
>> - The percentage interface writes a fraction of the maximum bandwidth
>>   into the hardware control register
>> - The MBA software controller (mounted with -o mba_MBps) takes
>>   an absolute target in MiB/s and adjusts that percentage based on
>>   the MBM counters sampled once per second.
>>
>> The problem is that a percentage alone isn't enough. How much bandwidth
>> a percentage actually corresponds to depends on the memory frequency,
>> the channel count, how many threads are generating traffic, the access
>> pattern, and the traffic of other groups. Neither MPAM nor x86 resctrl
>> reports the maximum bandwidth in MiB/s. So an administrator who wants
>> to enforce an absolute budget (a tenant SLA, a noisy-neighbour limit)
>> has to measure and re-tune the percentage on every machine. x86 resctrl
>> has had this software controller since 2018; MPAM has never been able
>> to use it. This series makes it work on MPAM.
> 
> I see that you are enabling the software controller at the same time as
> assignable mbm counters. This means that if you enable the software
> controller and create too many monitor groups then the software
> controller will stop working. Any user applications already using the

Thanks for the review.

You are right, once the mbm counter pool is empty a new monitor group
has no counter, the software controller cannot see it, and it can then
raise the control above the user's target. The warn was not a fix for that.

> software controller would be broken.
> 
> Would instead teaching MPAM about the mbm_default fixed allocation of
> counters be better? If a platform has sufficient bandwidth counters then
> we can ensure there is a counter for every monitor group. If necessary,

Right, if the MBM assignable counter is assigned at the time of group
creation, the MBps mechanism can be prevented from failing due to a lack
of counters.

> we can also reduce the number of CLOSID/RMID the driver reports so that
> there is one per monitor group.

I tried this method, and it works fine on QEMU.

> 
> Thanks,
> 
> Ben
> 
>>
>> What this series does
>> =====================
>>
>> MPAM refuses mba_MBps in two places:
>> - Its MBM counters are assignable, and supports_mba_mbps() refuses
>>   the option when they are.
>> - Its maximum bandwidth control is a soft limit by default, which
>>   can't hold a single requester down to the target.
>>   MPAMF_MBW_IDR.MAX_LIM reports whether the hard limit exists.
>>
>> MPAM also makes two generic defects reachable:
>> - Writing the control register sleeps (smp_call_on_cpu()), while
>>   the worker runs under the RCU read lock
>> - A 16-bit fraction lets the minimum control value reach zero, which
>>   divides by zero in the estimator
>>
>> The patches:
>>
>> - Patches 1 and 2 fix the two generic defects.
>> - Patches 3 and 4 make the loop runnable on MPAM: the worker takes the
>>   CPU hotplug lock around the sleeping control update, and assignable
>>   counters are accepted with a fixed assignment mode.
>> - Patches 5 and 6 handle the maximum: the driver sets HARDLIM and
>>   records the MAX_LIM behaviours, and mba_MBps is refused where only
>>   the soft limit exists.
>>
>> x86 has no assignable counters in the mode where the controller is
>> allowed, and does not set the soft-limit flag, so its behaviour is
>> unchanged.
>>
>> Testing
>> =======
>>
>> With the MPAM MSC model in QEMU:
>>
>> - From a 9606 MiB/s baseline, a 7000 MiB/s target converges to
>>   6888 MiB/s and a 9000 MiB/s target to 8766 MiB/s.
>> - The memory-side MSC register shows MBW_MAX.HARDLIM set.
>> - A modelled MSC that implements only the soft limit refuses the
>>   mba_MBps mount, while a plain mount succeeds.
>> - With mbm_assign_on_mkdir forced on while the controller is in use,
>>   a write of 0 is refused, and the user's value is restored after
>>   unmount.
>> - The KUnit tests for the MPAM driver pass.
>>
>> Jinjie Ruan (6):
>>   fs/resctrl: Avoid division by zero in the MBA software controller
>>   fs/resctrl: Do not update bandwidth from a failed counter read
>>   fs/resctrl: Take the CPU hotplug lock for software controller updates
>>   fs/resctrl: Allow mba_MBps with assignable MBM counters
>>   fs/resctrl: Reject mba_MBps when the maximum is only a soft limit
>>   arm_mpam: Program the hard limit for the software controller
>>
>>  Documentation/filesystems/resctrl.rst | 13 +++-
>>  drivers/resctrl/mpam_devices.c        | 55 +++++++++++++----
>>  drivers/resctrl/mpam_internal.h       |  4 ++
>>  drivers/resctrl/mpam_resctrl.c        |  9 +++
>>  fs/resctrl/monitor.c                  | 86 +++++++++++++++++++++------
>>  fs/resctrl/rdtgroup.c                 | 48 ++++++++++++---
>>  include/linux/resctrl.h               |  5 ++
>>  7 files changed, 179 insertions(+), 41 deletions(-)
>>
> 

-- 
Best regards,
Jinjie

