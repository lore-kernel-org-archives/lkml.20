Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958573;
	b=2EjCmE2FA7yEWkysSd3c0udDSm+bxOj81iQtc589dWttvUVLwIloHSEFL5u8dXEOt6z5
	 ftX2jbuw5Jads/Nn6grRkK64pREVX5okP1fVWXBTFgm0qC/4mPTqxTxFcXudH4pxRLqPh
	 KL+N/26lOMefZPhD1Kuga9p9PaI6Ao/VKOdFyhM0vCA1OxdnwsEmyScgx2EaOaJjJoxbA
	 vmZOxyhmDU7yck1yXiZYt/yRjNrxC/bT8m+Gr4CkwD9NKK83eOmsOsFsdosEgbG7XiV8I
	 z1x3Q0Pv9y+3qwTqDnVaonITO5T7HR+9GDO7Loy3ziBw4iK+HHw3xpiQ+jvjiaeSC1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958573;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=mGEVtVjtz0KdzhZ4I6DHO8/MAISpHDmHM9ZM3zRq5ss=;
	b=INykqbBiR6ufgE7iw6HDeXFsrUIKPS4lnaoZR9neIVToiUBepUYJzjutbap+bHywDhbg
	 nReqxl7B9sDBLgQKQLombFfiTSVqYrNWL/QfHmVXvIU4jze8M8fCL2R/S+EIgbzZJAMOd
	 jRltcUhRXbjEJSdIkv6klKn2BA/DqA6+GFYTYPryyepitw04QnYShqWCX+upQKMxq+kzW
	 18BkWqHmoewN/tadvMdv4VCL78ZA0GY5Bn1aALZmw9w9688iQ3XRRp5WgwXiKs4f5uZDZ
	 QoIz3T9K2mcrtsR/e3RRLjz4Gvit1x0M335rX7EPDWLSRGhPd3WPXieiNm7Jqw1AzPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OewCBRCP;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AEB3606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AEB3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OewCBRCP
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 406B41682;
	Fri,  6 Nov 2026 01:49:28 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7871F3F628;
	Fri,  6 Nov 2026 01:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793958571; bh=rLjhCA81jsFFZwqXTBDCS2ZN6MP7pRTuX1rJ8TeDxJg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OewCBRCPbvf6K6u//AQLua4egeAPRExi5r/EQa7FK6boaqTALhV+g89fa4QSv6wSZ
	 clvU+ONgkTvvMAyQci1F5UATL4nn1URWApob7+sVx/XttaDKXa3W0Hq/QzAOa78iAP
	 a59A+CsLaK3SQa6zeZ1fXoQcw4NbNkX5aRr5uLlY=
Message-ID: <cb37c75b-51eb-48de-b254-0c495f3c543b@arm.com>
Date: Fri, 6 Nov 2026 09:49:29 +0000
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
Subject: Re: arm_mpam: selecting hard or soft MBW_MAX limits
To: Ping Li <leeonion.muyu@gmail.com>, james.morse@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 reinette.chatre@intel.com, fenghuay@nvidia.com
References: <20261106043611.790930-1-leeonion.muyu@gmail.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261106043611.790930-1-leeonion.muyu@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ping,

On 06/11/2026 04:36, Ping Li wrote:
> Hi Ben,
> 
> mbw_max support in the driver always programs MPAMCFG_MBW_MAX without
> setting MPAMCFG_MBW_MAX.HARDLIM, so the limit is always soft: a

Just to clarify. The limit is always soft whenever a soft limit is supported but if it isn't
MPAMCFG_MBW_MAX.HARDLIM is RAO/WI and so even though the driver writes 0 to MPAMCFG_MBW_MAX.HARDLIM
you would still get a hard limit.

> PARTID above its MAX contends with low priority for bandwidth beyond
> the limit, but is not prevented from exceeding it. On our platform we
> would like to be able to select the hard limit, where a PARTID above
> its MAX is throttled even when the system is otherwise idle - soft
> limits let a noisy task exceed its limit and disturb higher-priority
> work when bandwidth contention appears.
> 
> MPAMF_MBW_IDR.MAXLIM reports whether the MSC implements a hard limit,
> a soft limit, or both, but the driver does not read it today.
> 
> Is there a preferred way to expose this choice? The options we see:
> 
>   - a mount option or info flag, if the choice must be global
>   - a per-resource or per-group resctrl knob
>   - selecting hard limits by default whenever MAXLIM reports the MSC
>     supports them

The current plan is that this will be an extra line in the schemata file. Fenghua was looking into
this and there is some discussion here [1]. This relies on the generic schemata changes to have
multiple controls for resources. The same series as linked although there is a rfc v2 now.

[1] https://lore.kernel.org/lkml/e13cf2e7-3956-4069-ac43-c65e874c6109@intel.com/

Thanks,

Ben

> 
> Thanks,
> Ping

