Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586493;
	b=CL9kgk54rK+ektNGKUvtbxnI0sNarAzydyXKeQDqwnwRV99yxMKFSrgASuCNm2QGje/P
	 Zofz3JbKdHs0zWfyDnHqWD5xY4Q+iJn0zOrMBJ+nEjaHFf+eii1msIoqHSfzIqJj/HllV
	 uLgjDRMuMb06Vjj0pCBwjuqRxtHE5LHEXEZmn0ectKJ+7MLzw+wEYOWsFu1TRT/iVJ8Fc
	 iqCH9rNqEPqgA1ZJaqzUlKaFkDFrI0b6HqGG7zGGe7H8MQ6lSCl0LwUJcgqXIriy4VRvl
	 oJVDWuxxAPfPtLKv+iQssQVG60JYINVIbR9b17trLQ2ERWfYTgBJHzj5g0fjfBUuXtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586493;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=wtyVpuXy15dO4I4euvTy72oPkpvM3hhV0zuEi7/nVcc=;
	b=SC7h3xzcWIkqbgVsNj5GfkB84/mmchuy3nqPmIHDtlu3w4Roc9U8imBbXCjqfTy3FMlb
	 tC/vGjy0FEnVYtuEWXBBOP+FwrL86oNCMQ0wu/jpdUmyWF/S6l5AntdsJcIXB/N75BGgt
	 nWGhmJ0qhAHtboZtWHzYNrHShc+0xmmu3yhVUBfVmIFo2MMHZsEeDxaLBg4a+ruQcX1ud
	 ZaxBfv/aRtLEWt3z2poKveeTYcYmZBZ/2RMc3UTSC/ZXOGdRIOAhEUKxCHgp4GXmGMBZr
	 9c8F7TiKTIMX/9Sm0MX0RE3Uy5ZrVAkDr8Th6qJmrZZNPesgYXVDfzooAImNDrg97GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Kca1aMbS;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1254C606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1254C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Kca1aMbS
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59500143D;
	Fri, 13 Nov 2026 08:14:49 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B8933F673;
	Fri, 13 Nov 2026 08:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794586492; bh=i6MBxrF0w4JXCguJJvppWTYUK6SI7lS9eOj24tuyIBU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Kca1aMbSiP4ptaRyeru+VLQb0nS8xXxVVzqAZYvYOR0cT26gU1mSxylH7eMRaLIes
	 sziSIN6XJ8JM52qwZoMPhgSSjMU/h14pAkGQEI80KvcCowz7SLkM/yMvY0xIpI5lV5
	 IdKpweGRgrX1yXXn+FmW48X0P0I5Vr2qvLQlmgY8=
Message-ID: <10f43d19-2994-4ad2-8a49-2891582e32e7@arm.com>
Date: Fri, 13 Nov 2026 16:14:48 +0000
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
To: tizi4590 <ruanjinjie@huawei.com>, james.morse@arm.com,
 reinette.chatre@intel.com, fenghuay@nvidia.com, tony.luck@intel.com,
 Dave.Martin@arm.com, babu.moger@amd.com, will@kernel.org, jic23@kernel.org,
 gshan@redhat.com, bp@alien8.de, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261113083506.4129060-1-ruanjinjie@huawei.com>
 <20261113083506.4129060-3-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261113083506.4129060-3-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jinjie,

On 13/11/2026 08:35, tizi4590 wrote:
> From: Jinjie Ruan <ruanjinjie@huawei.com>
> 
> With assignable MBM counters, resctrl can be mounted while all CPUs of
> a monitor domain go offline and one of them comes back, either through
> CPU hotplug or because hibernation takes the non-boot CPUs offline. The
> domain is destroyed and re-created, and the new domain starts with no
> counters assigned. Counters are otherwise only assigned when a group is
> created, when rdtgroup_assign_cntrs() takes a free counter in each
> monitor domain for each MBM event, so no code revisits the groups that
> already exist.
> 
> Those groups read "Unassigned" on the new domain, on any system with
> assignable MBM counters. A counter assigned to them later through
> mbm_L3_assignments is the lowest free one in that domain, so the same
> group can end up with a different counter ID on different domains. For
> example, with the counter ID each group uses for mbm_total_bytes and
> "_" for none:
> 
>                                domain 0         domain 1
>   mount, mkdir g1              default=0 g1=1   default=0 g1=1
>   all CPUs of domain 1 offline default=0 g1=1   (destroyed)
>   one CPU of domain 1 online   default=0 g1=1   default=_ g1=_
>   assign g1 on domain 1        default=0 g1=1   default=_ g1=0
> 
> Each domain has its own counters, so g1 can use counter 0 on domain 1
> and counter 1 on domain 0 without affecting the other domain, but until
> it is assigned on domain 1 it reads Unassigned there.

I brought this up before and it was assessed that no change was required:
https://lore.kernel.org/lkml/171f92a3-fa2e-44fb-b0d1-1250c72e31d1@amd.com/

Do you have any particular reason for wanting this behaviour?

Thanks,

Ben

> 
> Assign the counters when the domain comes online, after its state is
> set up. Give each enabled MBM event of every group, including the
> monitor groups under mon_groups/, the counter ID the group uses in
> another domain, and leave the event unassigned when that ID is already
> taken on the new domain. Skip groups in pseudo-lock mode, as their RMID
> has been freed and they are not monitored.
> 
> A group that has no counter for an event in any domain stays unassigned
> on the new domain, as it was before. mbm_assign_on_mkdir only applies
> when a group is created, and counters that the user removed through
> mbm_L3_assignments stay removed.
> 
> Fixes: ef712fe97ec5 ("fs/resctrl: Auto assign counters on mkdir and clean up on group removal")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: <stable@vger.kernel.org>
> Cc: Tony Luck <tony.luck@intel.com>
> Cc: Reinette Chatre <reinette.chatre@intel.com>
> Cc: Babu Moger <babu.moger@amd.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Ben Horgan <ben.horgan@arm.com>
> Cc: Dave Martin <Dave.Martin@arm.com>
> ---
> Changes in v2:
> - Drop the MPAM part of the changelog, the MPAM driver is fixed by
>   "arm_mpam: resctrl: Use the domain's counter ID".
> - Link to v1: https://lore.kernel.org/all/20261106094537.2337188-1-ruanjinjie@huawei.com/
