Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923038;
	b=RjyDCij6RQMIYtElr5Q9I3+Wcx22nk1yKTx53KyShKPRmWaqJYlji5+g2E/RIqmKpnEO
	 AsFNlYJuXLQaKdQkSs0al2m1qeuWB6yYPQPSFx2ljdTFKaEY3r9bki7+MKW4a0RmVmuwl
	 Gc0uLUaKWYQJ0BZfWDDUE86d+3X8IRZgkvPrQgz5jtxF+dWV/03F0Uf6RA0dIT+SvHfu2
	 jUSG0rQbJHfqQNTjd318i5E1a9geQ1QFwW5eFWv8di8EyBwEYtBxwt22xmV+R5Kjuww8k
	 ZAyy7/XtyrD9oYKha1RYSUmMlFR9C2uqbztyvHbsxDKXCoxB2dqzswCNG2Xzp9/49eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923038;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=XekK17PZVeAg1EAr0WE/yrPV7Cb/raW68qRRXtrEj8Y=;
	b=wwqTqX8bhkW5rCx0MhHFIGiaoNlNxTaBIWlEQ6VcaH4pOAOBzhXAfbV6Yg4UKe9vmZ1R
	 KSHCpAsFxnkOa0HeCDiBlcIKthhbIAzH961wpHDBvYe3rHgEO50FsyitM9+FRk7dNr3a1
	 lk5JWXZzmPnO51aQEpbFRkog9zGKS5qY+8xrtxRc7sZ6uv3QNNq9AOma23d+suLlfuPk7
	 b3CzR0DC63fR3OvVPAoWK7Ds3ldhx4nMzVwOOOfIdsaVZ6qgkAc8AWyAyTOk/wYqOYccT
	 qloiofnv40szgqeGwD/3/F3V14KKYFMe2QsqYoiCXKPwyAmXIt/YM7pJfWo/sd341gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=VFmiYNfK;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C4F606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4C4F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=VFmiYNfK
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FF2D1476;
	Tue, 17 Nov 2026 05:43:53 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.17.180])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3905F3F632;
	Tue, 17 Nov 2026 05:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794923036; bh=ug4DXiwzrQJM5OXNn5R3tQTW4M8dAr6uuOFwNPex6f8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VFmiYNfK+u/GffYcWORPBwD8cDhkiKcQT+7otu4MzQg+yyZJyCwZcosn8/oIrUHV6
	 ZNQ60AxEnR0rJIbVaM//V4rjXoCt03OB7NEWTpobg76oWUHVVYaf8LbJ0bpQgJCV/M
	 Kt0ysRjCnEZhKIuZLIjQUTGEermhAocggPEczfrg=
Message-ID: <10d97df6-ccfc-4025-9773-0ebe7421cbaf@arm.com>
Date: Tue, 17 Nov 2026 13:43:51 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH RFC v1 0/6] arm_mpam,resctrl: expose MPAM MBW_MAX hard
 limit
To: Fenghua Yu <fenghuay@nvidia.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Tony Luck
 <tony.luck@intel.com>, James Morse <james.morse@arm.com>,
 Will Deacon <will@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Shaopeng Tan <tan.shaopeng@fujitsu.com>, Chen Yu <yu.c.chen@intel.com>,
 Babu Moger <babu.moger@amd.com>, Drew Fustini <fustini@kernel.org>,
 Vikram Sethi <vsethi@nvidia.com>, Shanker Donthineni
 <sdonthineni@nvidia.com>, Newton Liu <newtonl@nvidia.com>,
 Richard Cheng <icheng@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261109212937.1409570-1-fenghuay@nvidia.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261109212937.1409570-1-fenghuay@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Fenghua,

On 09/11/2026 21:29, Fenghua Yu wrote:
> This series exposes the ARM MPAM MBW_MAX HARDLIM bit through resctrl.
> The MBA schemata line sets the maximum bandwidth. HARDLIM selects
> whether that maximum is a hard limit. It is a per-domain 0/1 value, not
> another percentage, so it is a separate control on the MBA resource
> rather than a second bandwidth percentage.
> 
> MPAMF_MBW_IDR.MAX_LIM reports how the implementation encodes that limit.
> When the probed value is 0, this kernel treats HARDLIM as read/write.
> When MAX_LIM is nonzero, or the platform has no hard-limit control, the
> schemata line is omitted.
> 
> The line follows the MSC, the same way the bandwidth line does. A cache
> MSC uses cache ids:
> 
> 	       MB:1=100;2=100
> 	MB_MAXHLM:1=0;2=0
> 
> A memory-level MSC uses NUMA node ids:
> 
> 	       MB_NODE:0=100;1=100
> 	MB_MAXHLM_NODE:0=0;1=0
> 
> Please advise if "MB_MAXHLM" on cache ids and "MB_MAXHLM_NODE" on
> NUMA ids meet the new naming conventions.

It doesn't look to match the naming convention to me.

I was expecting: <resource_type>_<scope>_<control>_<control_param>.

Reinette asked you your view on this here:
https://lore.kernel.org/all/e13cf2e7-3956-4069-ac43-c65e874c6109@intel.com/

Thanks,

Ben

> 
> 0 clears HARDLIM (soft limit). 1 sets HARDLIM. New groups start with the
> hard limit off. info/MB/schemata/MB_MAXHLM/max and
> info/MB/schemata/MB_MAXHLM_NODE/max are 1. The bandwidth control's max
> stays 100. The control directory under info/MB/schemata/ is MB_MAXHLM or
> MB_MAXHLM_NODE.
> 
> The 6 patches are grouped as follows:
> 
> 1. resctrl hard-limit control (patch 1)
> 
>    Parse MB_MAXHLM as a 0/1 value on the MBA resource, and initialize
>    new groups with HARDLIM clear.
> 
> 2. MPAM probe and config (patches 2-3)
> 
>    Read MAX_LIM from MPAMF_MBW_IDR, derive HARDLIM read/write when that
>    encoding is 0, and keep the HARDLIM bit in mpam_config so later
>    MBW_MAX programming does not drop it.
> 
> 3. Wire the control (patch 4)
> 
>    Create the MAXHLM control on the MBA resource when HARDLIM is
>    read/write, and read and write it through resctrl_arch_get_config()
>    and resctrl_arch_update_one().
> 
> 4. Node scope and documentation (patches 5-6)
> 
>    On a memory-level MSC, name the control MB_MAXHLM_NODE, set the
>    resource scope to the NUMA node, and give the hard-limit control the
>    range 0..1. Document both schemata lines.
> 
> The branch is on top CPU-less RFC V3 and resource controls RFC V2:
> https://github.com/fyu1/linux/commits/hlim.rfc.v1
> 
> Testing
> 
> Brought up on an ARM MPAM platform whose MBA resource is a memory-level
> MSC. resctrl mounts, and schemata lists MB_NODE and MB_MAXHLM_NODE with
> NUMA node ids. Not tested on x86 beyond compilation of the resctrl
> changes.
> 
> Fenghua Yu (6):
>   resctrl: wire MB_MAXHLM schemata parsing and group setup
>   arm_mpam: resctrl: probe MPAMF_MBW_IDR MAX_LIM and hardlim_rw
>   arm_mpam: resctrl: track MBW max hard-limit in config
>   arm_mpam: resctrl: add MAXHLM control on the MBA resource
>   arm_mpam: Add MB_MAXHLM_NODE and Node scope
>   Documentation: resctrl: document MB_MAXHLM for MPAM MBA
> 
>  Documentation/filesystems/resctrl.rst |  28 ++++
>  drivers/resctrl/mpam_devices.c        |  67 ++++++++-
>  drivers/resctrl/mpam_internal.h       |   8 ++
>  drivers/resctrl/mpam_resctrl.c        | 191 +++++++++++++++++++++-----
>  fs/resctrl/ctrlmondata.c              |  36 +++++
>  fs/resctrl/rdtgroup.c                 |  17 +++
>  include/linux/resctrl.h               |  16 ++-
>  7 files changed, 325 insertions(+), 38 deletions(-)
> 

