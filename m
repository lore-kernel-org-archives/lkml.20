Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015180;
	b=DGLjKe3c6sCAZ1PMMXH30Uw1IwKa/p+Dj95DibmfieLonqTV8KWf1BQVGI12ie0u+fRd
	 noHNAGQ58rLfH7nMizxkSa3gmifM9nkF8LiUOnfoE+zvOvXaAEPjpaTlOA9hJnZwoCO0v
	 rWT4s8V4SiiOQm5NL8QJBKr/aCAssgH+bzEdkBp3j50nBW3jhkYCidNb/kAX0ZunkgBn4
	 eNGVSJfpXnvI2BHkv6JWvgCPB198JEqqxfG+djDA7wGYkpLc74Q+i6l1r6vxDby+IDeR7
	 wyCENbH12F08GvYrSjGo3RjnHV8Mo29cgXQSxzWBmoGLpA37YqajFSepgNN7+v+QFFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015180;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=waEbYX6KJPSoRNadiwOCD4LDKbTYoW2me5cQNSodTwI=;
	b=1B3ggsoIOLgeta/jlMu6gIoDKOG3twjbM6aY/FIJh10147eFfb9i0efSkeAf38hxSWiU
	 ZO6e+sfzckk+FueyUdesw0VEk8pvEaaDUEhq5V85JrIlzuTKTscs57xrSQ01cSQXncZ/g
	 nZ6XHz5K4W4U1XNP4FsnX5EZGadYwCMTQ3G2NJWW7GMEzkRnihzp0J6kvtFhZ9LqANNOU
	 MAQef3yTdJheVRpoow+Xdq/r+BgumXOcEmA2lEYmi2mvHcOVQrIf4yud9w+1JD7Yo6tK7
	 JZZwLR75SnI2fybq/L8EzaW/9Vi8DbiwYn3fGbRI6Pi3j6Iny/7dTxg/o9Np1U+sPSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=mzuqJlL7;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D706606A31A;
	Mon, 26 Oct 2026 11:46:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D706606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=mzuqJlL7
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DFA61684;
	Mon, 26 Oct 2026 04:46:14 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AE3D3F59E;
	Mon, 26 Oct 2026 04:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793015177; bh=fG1932O5DnRLeWO28TC5OCEzVFgP3pBcePlqgLQmTiM=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=mzuqJlL7w1VogY9w2u92PK52BKlIVq3WC5uykPM1cXLMVMUZa12omeT08El7Nu7u2
	 mTjSVSp6lM91xzRHWsVcz4qdAEmAk4SvhgfsWe7O/IoiOLWEk2aY1y3J/uchKTbOMX
	 10s26HxS0natqMBJ/41T+1s1GqRrmEweoeRBvLJc=
Message-ID: <c1e80268-3981-48bb-b251-dcd2218fc9d5@arm.com>
Date: Mon, 26 Oct 2026 11:46:13 +0000
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
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, mark.rutland@arm.com, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, james.morse@arm.com,
 reinette.chatre@intel.com, fenghuay@nvidia.com, tony.luck@intel.com,
 Dave.Martin@arm.com, babu.moger@amd.com, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261022084821.4014873-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261022084821.4014873-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jinjie,

On 22/10/2026 09:48, Jinjie Ruan wrote:
> MPAM resource monitors hang off a partitionable resource in an MSC, not
> off a particular cache level. resctrl only knows about the L3 scope, so
> the L2 cache monitors that MPAM platforms implement are discovered by
> the driver but never show up in resctrl.

Yes, it would be good to add support for more monitoring scopes. This is not just relevant for MPAM.
RISC-V can also have monitors at many places in the system and we should coordinate so we have a
uniform solution across architectures.

> 
> An L2 MSC has the same CSU and MBWU counters as an L3 MSC; the cache
> level comes from the ACPI MPAM table's cache locator. So this is mostly
> a resctrl scope problem, not a hardware one.
> 
> Extend resctrl's monitor scope to L2: register the L2 occupancy and
> bandwidth events against the L2 resource, pick the L2 classes for them,
> and borrow a CSU/MBWU monitor for the duration of a read. With CDP the

Borrowing an MBWU monitor doesn't sound right. The MBWU monitor needs to be configured while the
traffic is happening so that it can keep count of bytes. The CSU is different as it can measure the
occupancy without having to keep any state.

Thanks,

Ben

> two PARTIDs need separate accumulating monitors, so the borrowed-monitor
> context becomes one monitor per PARTID.
> 
> Patches:
> 
>   1-2  Generalise the per-domain read path, add l2c_occupancy and
>        mbm_core_bytes, update the documentation.
> 
>   3    Split the borrowed-monitor context into data and code entries.
> 
>   4    Do the CDP num_rmid halving for every mon_capable resource.
> 
>   5-7  Pick the L2 classes, describe the events with the L2 resource,
>        add the read paths.
> 
> Tested on QEMU with an L2/L3/memory-controller MSC topology. The L2_MON
> files show up and are readable; l2c_occupancy reports the modelled
> occupancy, and mbm_core_bytes reports the modelled bandwidth.
> 
> QEMU branch: https://github.com/ruanjinjie-eng/qemu/tree/mpam
> Test cases: https://github.com/ruanjinjie-eng/mpam_testcase
> 
> Jinjie Ruan (7):
>   fs/resctrl: Generalize __l3_mon_event_count for non-L3 resources
>   fs/resctrl: Add the L2 monitor events
>   arm_mpam: resctrl: Split monitor context for code/data
>   arm_mpam: resctrl: Halve num_rmid for every mon_capable resource on
>     CDP
>   arm_mpam: resctrl: Describe the L2 monitor events with the L2 resource
>   arm_mpam: resctrl: Pick L2 classes for the L2 monitor events
>   arm_mpam: resctrl: Add the L2 monitor read paths
> 
>  Documentation/arch/arm64/mpam.rst |  23 +--
>  drivers/resctrl/mpam_resctrl.c    | 236 +++++++++++++++++++++++-------
>  fs/resctrl/monitor.c              |  15 +-
>  include/linux/resctrl_types.h     |  13 +-
>  4 files changed, 222 insertions(+), 65 deletions(-)
> 

