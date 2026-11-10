Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308435;
	b=TKCm60fC55BY9TYQvoTuOdMqCjDswpq+TBjHc3y7gDt0OaIyZWyX/nw4NZs4HUnUFUrr
	 wMd/wcKYkLsb1VgFrbCKN4C2rfZ9+6oryiN2SxsluAcbgo7iNvv+SYilO/4VzCiZ7/mn2
	 YgLrZ6WK8d7Q1dAVnU4IF0eWkpGA7FGbF5fK+ENeYPFrBaeSoWh1rDDqRWaG1Iip3SNo5
	 C5Biulea4A78kH+Isjbd5PcsSX7DJh0Br3Xb7BRQi2ArLXHCIlJ1H08UxCayu6A3oIZk8
	 KVujGKQbpbGP+SrVGw/yjrpKd3JOKhRRx9gbOHblienHBGFeh5+uytN6G4edpSZMiJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308435;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=mr+oYs8/abSZSj4lJ4PMIllB4JnBFwVNz1SRvIolKDk=;
	b=NPmcYuIex9lE9x2Kpy7sWG4uY73+Ipe39iiWsUOef8aBo9G24TbRO5WY/Mmud9XeaNvE
	 HQ7gqJLaRQW0zxF7lFwDpZgccNv/MFKvFPWjDrv4GReDiKEKt6X1ivGbViGyE3vOvFFIB
	 gkMvOUVySQjjljIUD4MsBI2AYaD61l4w068Ik6sJVZOWBzcuV22CuH89uw0gmWAXrJEXz
	 9ta9Mwkl0JqtyXBPV9v+mvSYDBFUQujwLvwfs6KMU+twt7SGi2eIW27XXwDS0/obyXmDy
	 fTeRo2zQ1070vz6aPhJBKJshyXx50FQYvMYfeIPvvqRoGJzfvNoMXV9IJdBInpihImg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LblR3Mll;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F50260A380E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:00:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F50260A380E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LblR3Mll
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71D571BC0;
	Tue, 10 Nov 2026 03:00:30 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 886443F85F;
	Tue, 10 Nov 2026 03:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794308433; bh=4ck62cy1mlRNr4GFH/FwZpJqZdKAc0N4+tB/W3NHdFY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LblR3MllBiBoWbbp/bPau9MCduLwG1ZSwBtHEe+oMYAEMj36I3Mv+8I48Y6V1S/A3
	 4DiT3rjIj15YNhjEKrgjKDo60yfQpeEqhmRGrJ3k4Cstjh62Bh3F8++Y84qbc+0NJx
	 APrqPZZAwLmaPhwOrBjKvSsYJiMT9fe2+K6HTZ0o=
Message-ID: <00a1bcb7-2884-4075-8d51-b8a465e37492@arm.com>
Date: Tue, 10 Nov 2026 11:00:30 +0000
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
Subject: Re: [PATCH v3 0/8] arm_mpam: resctrl: Separate MPAM domains
To: Reinette Chatre <reinette.chatre@intel.com>, james.morse@arm.com,
 Dave.Martin@arm.com, fenghuay@nvidia.com, ruanjinjie@huawei.com
Cc: tony.luck@intel.com, yu.c.chen@intel.com, babu.moger@amd.com,
 fustini@kernel.org, tan.shaopeng@fujitsu.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev
References: <cover.1794283825.git.reinette.chatre@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <cover.1794283825.git.reinette.chatre@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 10/11/2026 04:19, Reinette Chatre wrote:
> Thank you very much to Ben, Jinjie, and Shaopeng for reviewing and testing RFC v2.
> 
> Changes since RFC v2:
>   - RFC v2: https://lore.kernel.org/lkml/cover.1792443633.git.reinette.chatre@intel.com/
>   - Patch 1 is new. It adds find_mbwu_mon_comp() to replace the duplicate
>     code found in resctrl_arch_cntr_read() and resctrl_arch_reset_cntr(),
>     as suggested by Jinjie.
>   - WARN when domain allocation fails. (Ben)
>   - Squash three patches into the patches they build on. (Ben)
>   - Move "Require a component for each monitoring event" ahead of the
>     structure split so the check it adds precedes its first user.
>   - Fix the mpam_resctrl_get_mon_domain_from_cpu() function comment that
>     still referred to the control component.
>   - Add tags from Jinjie and Ben.
>   - Please see the individual patches for their detailed changelogs.
> 
> Changes since RFC v1:
>   - RFC v1: https://lore.kernel.org/lkml/85ca29e89eacf12cfa7071249419e7cadb8f0691.1788220029.git.reinette.chatre@intel.com/
>   - Give each type of domain its own structure instead of duplicating the
>     shared one, set up each domain independently instead of undoing one
>     domain when setting up the other fails, add additional verification
>     checks.
> 
> The MPAM driver represents a resctrl domain with a single structure,
> struct mpam_resctrl_dom, that holds both a control domain and a
> monitoring domain. On a system that supports both allocation and
> monitoring, one instance is created for each domain and its two
> domains are added to the resource's control and monitoring domain
> lists.

Thank you for this respin.

To avoid any confusion for others I mention here that the 'MPAM domains' mentioned here are the MPAM
driver representations of resctrl domains and *not* related to the MPAM feature
FEAT_MPAM_MSC_DOMAINS. There is currently no support for FEAT_MPAM_MSC_DOMAINS in the MPAM driver.

Thanks,

Ben

