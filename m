Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015448;
	b=DnJ/Lwmo5Gl0FaXFDU4o0WNSyb409yLUOYB0uDEoYztxMmF7+wXbnfJ0nfGwuZ72ucCM
	 CRoKiHnQ/ZQBRVA5eOb0ovtQbzX8lTgvkV/iBJm86e3Gwb5ov8QnlNw0LeCDMTi0LEscs
	 3/e1zFXgLgAb9qMRAKulgS97NRSgDJesKS7eziWpICdJWOExpqF+8eRuCN8Ehzi/o5syN
	 8T3iXWSnU65iJWskvKeAmYeVMxrMsqUypb9HBuArPirxBWtfmb+KDy5kM7xJDN8ibnxCp
	 E4cM66vJ/2ZJzXpPf0uGbLKWL7hS6UqxKGTkjrxmA0/REvjrYLL1BWShXhKXW9DJyCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015448;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=IMqP5d2GpqKsgJhfrXjzZSIVvDhsXw2uZqS/tTymGN4=;
	b=RISl7UzXR6fqGAp1zejEE/pFFABRrIjQDMfb7Qp4msuWZCBN4bahZX7Q292jQOEU2sV9
	 3ABA/w7CchFCntr3TcXmHC+ISFV22HWE871a70nV40syfvSXPnP42I9adfaLvV0tnQS7i
	 qN74IWFIvYkhxV4NaRzapkFDe5MvGwR/8ANgJhBxJ8ToNe8zKl3whQk6z/QSjxfFXSOGp
	 57UcZbUL1erBaJA4HoTqyAKid8wN1O1iZdCickvo2bIrLajRqtuJ4l2fqRtaUm7zd7swU
	 XDMkmsPFeoqO0XXA4s59vFk4EFy75+Qy5dqPM418ezx9uXlRrT2no4fbJS73iiNLIJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=B1593lYj;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 232B7606A324;
	Mon, 26 Oct 2026 11:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 232B7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=B1593lYj
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F31421684;
	Mon, 26 Oct 2026 04:50:42 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C02823F59E;
	Mon, 26 Oct 2026 04:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793015446; bh=G+G01ItkIFohq402BAAUlhnrkeJG8Ezyba+2qQt36bU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=B1593lYjBN+4eNbhB643XLJJfGmT5+PuzpSL8xUN9GPjr/WvSKD61pDCAAvXa5ArN
	 1pnmDqpxDCeX5YJU4awrn2r776ZroCdD0xdamoNGUtzFDaHBLFPCDHCL5LsRe99+St
	 KItdwL0IkOtxLwiJ0efIFKE+oxhC1hvHm56++PYc=
Message-ID: <68fa8cba-cccc-4b4c-9421-5b631f539727@arm.com>
Date: Mon, 26 Oct 2026 11:50:42 +0000
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
Subject: Re: [RFC PATCH 2/7] fs/resctrl: Add the L2 monitor events
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, mark.rutland@arm.com, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, james.morse@arm.com,
 reinette.chatre@intel.com, fenghuay@nvidia.com, tony.luck@intel.com,
 Dave.Martin@arm.com, babu.moger@amd.com, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261022084821.4014873-1-ruanjinjie@huawei.com>
 <20261022084821.4014873-3-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261022084821.4014873-3-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jinjie,

On 22/10/2026 09:48, Jinjie Ruan wrote:
> Add the L2 cache occupancy (l2c_occupancy) and L2 bandwidth
> (mbm_core_bytes) monitor events, and route RDT_RESOURCE_L2 through the
> same per-domain read path as the L3.
> 
> As ARM MPAM Specification said, MPAM resource monitors are associated
> with a shared partitionable resource in an MSC, not with a particular
> cache level: the level comes from firmware's description of the MSC.
> L2 monitors were only missing a resctrl scope. The events are
> exposed once an architecture reports the L2 resource
> mon_capable; x86 never does.
> 
> Update Documentation/arch/arm64/mpam.rst to mention L2.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  Documentation/arch/arm64/mpam.rst | 23 ++++++++++++++---------
>  fs/resctrl/monitor.c              |  9 +++++++++
>  include/linux/resctrl_types.h     | 13 ++++++++++++-
>  3 files changed, 35 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/arch/arm64/mpam.rst b/Documentation/arch/arm64/mpam.rst
> index 67fe515ed501..f0697dedde03 100644
> --- a/Documentation/arch/arm64/mpam.rst
> +++ b/Documentation/arch/arm64/mpam.rst
> @@ -32,8 +32,9 @@ Because the user interface to MPAM is via resctrl, only MPAM features that are
>  compatible with resctrl can be exposed to user-space.
>  
>  MSC are considered as a group based on the topology. MSC that correspond with
> -the L3 cache are considered together, it is not possible to mix MSC between L2
> -and L3 to 'cover' a resctrl schema.
> +the L3 cache are considered together, as are MSC that correspond with the L2
> +cache; it is not possible to mix MSC between L2 and L3 to 'cover' a resctrl
> +schema.
>  
>  The supported features are:
>  
> @@ -61,9 +62,11 @@ The supported features are:
>    When the MPAM driver finds multiple groups of MSC it can use for the 'MB'
>    schema, it prefers the group closest to the L3 cache.
>  
> -* Cache Storage Usage (CSU) counters can expose the 'llc_occupancy' provided
> -  there is at least one CSU monitor on each MSC that makes up the L3 group.
> -  Exposing CSU counters from other caches or devices is not supported.
> +* Cache Storage Usage (CSU) counters expose the occupancy of the cache they
> +  monitor: 'llc_occupancy' for the L3 group and 'l2c_occupancy' for the L2
> +  group, provided there is at least one CSU monitor on each MSC that makes up
> +  the group. Exposing CSU counters from other caches or devices is not
> +  supported.
>  
>  * Memory Bandwidth Usage (MBWU) on or after the L3 cache.  resctrl uses the
>    L3 cache-id to identify where the memory bandwidth is measured. For this
> @@ -82,10 +85,12 @@ The supported features are:
>    have a corresponding L3 cache. 'mbm_local_bytes' is not exposed as MPAM
>    cannot distinguish local traffic from global traffic.
>  
> -  All these restrictions based on L3 cache are due to resctrl, currently, only
> -  supporting monitoring at the L3 scope. It is expected that going forward more
> -  MBWU monitors can be exposed to the user after support for more monitoring
> -  scopes is added to resctrl.
> +  MBWU monitors on an L2 MSC expose the bandwidth the cache sees as the
> +  'mbm_core_bytes' event on the L2 resource.
> +
> +  These restrictions are due to resctrl only supporting monitoring at the L2
> +  and L3 cache scopes. MBWU monitors on caches at other levels, or on devices,
> +  are not exposed.
>  
>  Reporting Bugs
>  ==============
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index f9f4d4486c1b..ee296c27c6e8 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -543,6 +543,13 @@ static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
>  			return __mon_event_count_one_domain(rdtgrp, rr);
>  		else
>  			return __l3_mon_event_count_sum(rdtgrp, rr);
> +	case RDT_RESOURCE_L2:
> +		WARN_ON_ONCE(rr->evt->any_cpu);
> +		if (WARN_ON_ONCE(!rr->hdr)) {
> +			rr->err = -EINVAL;
> +			return -EINVAL;
> +		}
> +		return __mon_event_count_one_domain(rdtgrp, rr);
>  	case RDT_RESOURCE_PERF_PKG: {
>  		u64 tval = 0;
>  
> @@ -1032,6 +1039,8 @@ struct mon_evt mon_event_all[QOS_NUM_EVENTS] = {
>  	MON_EVENT(QOS_L3_OCCUP_EVENT_ID,		"llc_occupancy",	RDT_RESOURCE_L3,	false),
>  	MON_EVENT(QOS_L3_MBM_TOTAL_EVENT_ID,		"mbm_total_bytes",	RDT_RESOURCE_L3,	false),
>  	MON_EVENT(QOS_L3_MBM_LOCAL_EVENT_ID,		"mbm_local_bytes",	RDT_RESOURCE_L3,	false),
> +	MON_EVENT(QOS_L2_OCCUP_EVENT_ID,		"l2c_occupancy",	RDT_RESOURCE_L2,	false),
> +	MON_EVENT(QOS_L2_MBM_CORE_EVENT_ID,		"mbm_core_bytes",	RDT_RESOURCE_L2,	false),
>  	MON_EVENT(PMT_EVENT_ENERGY,			"core_energy",		RDT_RESOURCE_PERF_PKG,	true),
>  	MON_EVENT(PMT_EVENT_ACTIVITY,			"activity",		RDT_RESOURCE_PERF_PKG,	true),
>  	MON_EVENT(PMT_EVENT_STALLS_LLC_HIT,		"stalls_llc_hit",	RDT_RESOURCE_PERF_PKG,	false),
> diff --git a/include/linux/resctrl_types.h b/include/linux/resctrl_types.h
> index a5f56faa18d2..f31b8f2ccb8b 100644
> --- a/include/linux/resctrl_types.h
> +++ b/include/linux/resctrl_types.h
> @@ -37,7 +37,14 @@
>  /* Number of memory transactions that an MBM event can be configured with */
>  #define NUM_MBM_TRANSACTIONS		7
>  
> -/* Event IDs */
> +/*
> + * Monitor Event IDs, representative a variety of monitoring events:
> + * QOS_L3_OCCUP_EVENT_ID:     L3 Cache Occupancy statistics event
> + * QOS_L3_MBM_TOTAL_EVENT_ID: Global Memory Bandwidth statistics event
> + * QOS_L3_MBM_LOCAL_EVENT_ID: L3 Cache Bandwidth statistics event
> + * QOS_L2_OCCUP_EVENT_ID:     L2 Cache Occupancy statistics event
> + * QOS_L2_MBM_CORE_EVENT_ID:  L2 Cache Bandwidth statistics event
> + */
>  enum resctrl_event_id {
>  	/* Must match value of first event below */
>  	QOS_FIRST_EVENT			= 0x01,
> @@ -50,6 +57,10 @@ enum resctrl_event_id {
>  	QOS_L3_MBM_TOTAL_EVENT_ID	= 0x02,
>  	QOS_L3_MBM_LOCAL_EVENT_ID	= 0x03,
>  
> +	/* ARM MPAM L2 Events */
> +	QOS_L2_OCCUP_EVENT_ID,
> +	QOS_L2_MBM_CORE_EVENT_ID,

These are essentially, L2 versions of L3 events. Does it not make sense to generalize the existing
events to apply in different scopes?

Thanks,

Ben

> +
>  	/* Intel Telemetry Events */
>  	PMT_EVENT_ENERGY,
>  	PMT_EVENT_ACTIVITY,

