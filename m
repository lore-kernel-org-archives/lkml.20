Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66335341057
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792398263; cv=none; b=Zod3p8alwgLQxanU0KLgjxcGfHS+xh/s6JcOzRjG3ZztFdkzLWM/naqLgvXoEy4o4a+LTXByChc2p5LznUmubFKpoy5fbLrWGhbDQ1sFcRrBnUodDkRn8DUnd9noSb9k8PmWd/hWfxy5P3raQvDl11NDVpWcmcT7vUGqC395AQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792398263; c=relaxed/simple;
	bh=rXD66+sVzoV9arEERpgKs6IHV2zY6TGemyA2upWFmVo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=b4tOeFk1x+NvILc6WQNHV7xIJdynYqmPnsksJSwcJ2lOdICyCncUB6Fb9z+LS3yTuMrGsZ2X174Bx/WVsV97SkN5eXbomdJuGXIE4qLSeUKXe1yfeNCiSDjkOMqnZ0cBXYd3MMeest/AxtvHD/MivcfDkUpIE9hARfmqoKX3M6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=F4ASoeem; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="F4ASoeem"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792398256; bh=Uc478OBxlUZp50UZ9iU03UMf7PH8p3rPo9vDgqn0VVw=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=F4ASoeemH9Wm+mQ5pAw7ldkT4YLurEJEcjIFhgGqfJBNKR89hnK2YmZq8bK5KTz0M
	 24jsQna9qK39hJ1wC0eFBM8Gvw3QLJ9MVrzSCpmsO/p9hfvZTF7dVHaz8R7eVYJx2/
	 MqO/IDmmH2qYOr4WDX/NZHyU2KIAIlxWNEubM+4o=
Received: from [100.125.153.207] ([139.159.170.67])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 60C27A5E; Mon, 19 Oct 2026 16:24:12 +0800
X-QQ-mid: xmsmtpt1792398252tjo79g5vf
Message-ID: <tencent_9831C34A5E5AC9C411A2C52D9E54C00CED06@qq.com>
X-QQ-XMAILINFO: ODQfruXGvXmaxqGxr6jpvOae3OaUYnP/E1/dKDg+ZEvU88qQKKMWUtsDjENxnP
	 x9CETe3+aw2DJd9W7fz/i1XS/3jA36Sjfwz6lPpwtPv8sa93jw4+rw/Z8l7KEw9GKvINi++PomaP
	 pH0WzGuY+8r5ZgDVvihzubln9YipVLoioA4v7lfgqjFVSuFiovX5FT8f+MlCV+djVEUAa1rdd8FU
	 kEzEYipXXC7Gs0L0ogk3M6MD/1ojZPNc8f0iAsgHphQ9kpoClO5bsgzUxKKq8lKrqWE4+cEmBz55
	 4BoG/M8yRNDyJgX6p6eVuNXALB/yhHXqy6EYxEsIEEe+Q8AVyV6kBqiU8m4ayOyPWt1hmZ2t1LTB
	 mPTjUFeDJv9D2CSHqoz/aAtvLJPB4xNRCPIDeVkO+8k6GaIA/i1Y4f/lvdKHz+QuOiLhIrE34NRT
	 Cjsl7isNZJ/gObMPJcFvdfi0qJ/qHLEoxFkT0fczc0wGmTFfooBpYijIfofE1zQMTXVJhVLc2tde
	 8vJmT7sIj8XMT4KjYpn5LM3cWWG4VI0Cvn1+Ehd+sV6Rr/FIxEdvdz925YyBbt1AkB95s358e7Cw
	 G5RV7jdL3e21JTSrLvlKYMRM3ucdCC9xwfcEwtjzQenb0rcQKFSw04rfmqo2hTXrrissKFGMcPSk
	 Tjg2b4Alcgp3WP8+S/E0wzuqZHI7sP1JFHAcjEsSeEOFE2GsU8nx7+/5DDnPzqrp591JP126DIBu
	 Rlfb/ZKpIxyyp+HkfPIHrMZxkfCt7Fm6ExDuGSm9ydhHxuKCLh1nZYebsQZXQ2BvB0FZQIR+jZ0D
	 kFtfxNlnPk31oPn/R3gqMKQH3BWBkTCIfz5NMeaOKjNqwfGPrbKOFxWGtUdtutEw27HUyUSXYFKC
	 5uUfIeZSEkUvpV0D7EaeWI/A8sf1DJ4RwGeo8K5Xt2iLhtlFWTmqVMgjqxxaDSTZAueE9sdfSJ2n
	 cdmEv/GiPsNvIF1ToSEAdCgCYfiUTiM1evfafud0iBwGWrm8YBtQu6t8E+IFBCfH2w2gA34aMuxr
	 Z4BuIGVDCsgZxVIaVolVrX9tIngvGoztMraQjt5Y8FWOpWNzeAPx1TcA1wVgXGbvjYE7518QecPL
	 Xkraugp5ilKFIu2NYPyclXdezrZeuDJ0E1e+cmsAwV8lTHZ2Y=
X-QQ-XMRINFO: MFuljud3PUW4PBylPAT/IzU6hXYZ8ywbJQ==
X-OQ-MSGID: <2643d9f8-5ece-4eef-9485-b5aeb6cb800f@qq.com>
Date: Mon, 19 Oct 2026 16:24:12 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/15] arm_mpam: Introduce Narrow-PARTID feature
From: Jinjie Ruan <2118537295@qq.com>
To: babu.moger@amd.com, ben.horgan@arm.com, bp@alien8.de,
 catalin.marinas@arm.com, dave.hansen@linux.intel.com, Dave.Martin@arm.com,
 fenghuay@nvidia.com, gshan@redhat.com, hpa@zytor.com, james.morse@arm.com,
 jic23@kernel.org, mingo@redhat.com, reinette.chatre@intel.com,
 ruanjinjie@huawei.com, tan.shaopeng@fujitsu.com, tglx@kernel.org,
 tony.luck@intel.com, zengheng4@huawei.com, x86@kernel.org,
 linux-kernel@vger.kernel.org
References: <tencent_28FE31D80A7A9AEEC43B22D0AD8894E30C06@qq.com>
Content-Language: en-US
In-Reply-To: <tencent_28FE31D80A7A9AEEC43B22D0AD8894E30C06@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Sorry, due to SMTP rate limiting, this v10 series has been split into 
multiple threads. The complete 15 patches
are as follows:
- patch 1 ~ 12: 
https://lore.kernel.org/all/tencent_42E06D8D14F5CCC231EB4A4C9AC4C42EA206@qq.com/
- patch 13: 
https://lore.kernel.org/all/tencent_57E8587BC53D6D65E212D1EAD6440A6AA605@qq.com/
- patch 14 ~ 15: 
https://lore.kernel.org/all/tencent_8B0A4E9AF24412E2F6ADAC94C84CC231FA06@qq.com/

在 2026/10/19 15:33, Jinjie Ruan 写道:
> From: Jinjie Ruan <ruanjinjie@huawei.com>
>
> Background
> ==========
>
> In ARM MPAM, a monitoring group is defined by a (PARTID, PMG) pair.
> However, many production platforms implement only a single PMG bit,
> limiting the total number of monitoring groups long before the request
> PARTID space is exhausted.
>
> Hardware Mechanism
> ===================
>
> Platforms with "PARTID narrowing" mitigate this by mapping multiple
> request PARTIDs onto a single internal PARTID. The internal PARTID
> dictates the control group configuration, while each individual request
> PARTID functions as an independent monitoring group. This decouples
> control and monitoring allocation, allowing more monitoring groups
> than the PMG constraint normally permits.
>
> Software Strategy
> ==================
>
> Using request PARTIDs beyond the internal range is only safe when no MPAM
> class loses a non-aliasing control. While aliasing controls (e.g., cache
> portion bitmaps) can be safely replicated across request PARTIDs,
> non-aliasing controls (e.g., cache capacity) are additive and cannot.
>
> To ensure safety, this series implements a completely static grouping
> policy evaluated once before resctrl_init(). If any class contains
> non-aliasing controls without narrowing capabilities, the expansion
> is bypassed. This infrastructure remains completely transparent
> to user-space.
>
> Patch Architecture
> ====================
>
> - Patches 1-6: bugfixes found by sashiko or while testing this series
> - Patches 7-9: Preparatory helpers, no functional change
> - Patch 10: Track internal and request PARTID limits per class
> - Patches 11-12: Driver-side modulo interleaving + flat global RMID
> - Patches 13-14: Identify non-aliasing controls; enable the narrowing
> - Patch 15: KUnit tests for the narrow-PARTID helpers
>
> Testing
> ========
>
> Verified on both QEMU and real Hisi hardware:
>
> - Narrowing expands monitoring groups from 4 to 256:
>
>        [ 62.602939] mpam:mpam_resctrl_configure_partids: PARTIDs: monitor=256 closid=32 extra=1
>        [ 63.788467] MPAM enabled with 256 PARTIDs and 4 PMGs
>
> - KUnit: narrow-PARTID helper tests pass.
>
> QEMU branch: https://github.com/ruanjinjie-eng/qemu/tree/mpam
> Test cases: https://github.com/ruanjinjie-eng/mpam_testcase
>
> Changes since v9
> =================
> - Compatibility with Narrow PARTID and CDP mode
> - Fix several sashiko reported issues:
>    - Return -EBUSY when a CLOSID's RMIDs are only in limbo
>    - Skip the monitor-context allocation on the force-free limbo path
>    - Return an correct error pointer from resctrl_arch_mon_ctx_alloc()
>      on failure.
>    - Widen the PARTID reset loop counter to u32 to fix the 65536 wrap.
> - Fix MPAM enable issue when a MSC fails to probe (e.g. nr_cpus= clipping
>    the possible CPUs).
> - Add KUnit tests for the narrow-PARTID helpers.
> - Link to v9: https://lore.kernel.org/all/20261012082337.822258-1-ruanjinjie@huawei.com/
>
> Link: https://sashiko.dev/#/patchset/20261012082337.822258-1-ruanjinjie%40huawei.com
>
> Previous Versions
> =================
>
>      v9: https://lore.kernel.org/all/20261012082337.822258-1-ruanjinjie@huawei.com/
>      v8: https://lore.kernel.org/all/20260413085405.1166412-1-zengheng4@huawei.com/
>      v7: https://lore.kernel.org/all/20260317132141.1272506-1-zengheng4@huawei.com/
>      v6: https://lore.kernel.org/all/20250222112448.2438586-1-zengheng4@huawei.com/
>      v5: https://lore.kernel.org/all/20250217031852.2014939-1-zengheng4@huawei.com/
> RFC-v4: https://lore.kernel.org/all/20250104101224.873926-1-zengheng4@huawei.com/
> RFC-v3: https://lore.kernel.org/all/20241207092136.2488426-1-zengheng4@huawei.com/
> RFC-v2: https://lore.kernel.org/all/20241119135104.595630-1-zengheng4@huawei.com/
> RFC-v1: https://lore.kernel.org/all/20241114135037.918470-1-zengheng4@huawei.com/
>
> Jinjie Ruan (13):
>    fs/resctrl: Return -EBUSY when per-CLOSID RMIDs are in limbo
>    fs/resctrl: Skip monitor context allocation when force-freeing RMIDs
>    arm_mpam: Fix error return in resctrl_arch_mon_ctx_alloc()
>    arm_mpam: Fix infinite PARTID reset loop when 65536 PARTIDs are
>      supported
>    arm_mpam: Don't stall MPAM enable when an MSC fails to probe
>    fs/resctrl: Add resctrl_arch_rmid_idx_match() helper
>    arm_mpam: resctrl: Add resctrl_closid_rmid_to_partid_pmg() helper
>    arm_mpam: Add a helper to check a PARTID is in a CLOSID
>    arm_mpam: Track the PARTID and internal PARTID limits per class
>    arm_mpam: Divide the PARTIDs between the control groups
>    arm_mpam: Identify the non-aliasing controls
>    arm_mpam: Use the request PARTIDs beyond the internal range
>    arm_mpam: resctrl: Add kunit tests for narrow PARTID helpers
>
> Zeng Heng (2):
>    fs/resctrl: Unmount resctrl with the CDP state it was mounted with
>    arm_mpam: Map resctrl RMIDs onto the request PARTIDs
>
>   arch/x86/include/asm/resctrl.h      |   6 +
>   drivers/resctrl/.kunitconfig        |   4 +
>   drivers/resctrl/mpam_devices.c      | 160 ++++++++--
>   drivers/resctrl/mpam_internal.h     |  25 ++
>   drivers/resctrl/mpam_resctrl.c      | 227 +++++++++++---
>   drivers/resctrl/test_mpam_resctrl.c | 466 ++++++++++++++++++++++++++++
>   fs/resctrl/monitor.c                |  36 ++-
>   fs/resctrl/rdtgroup.c               |  46 ++-
>   include/linux/arm_mpam.h            |   1 +
>   9 files changed, 889 insertions(+), 82 deletions(-)
>   create mode 100644 drivers/resctrl/.kunitconfig
>

