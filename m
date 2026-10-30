Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378290;
	b=pkYGj0OojA1D6oFyFU29+RGK1xYw4AFvef8HQ68+fg0YHrwvunWxpI8IjGyxmUDFt3IJ
	 JiZcVVg6c6bfvRmcCzrI0TP57+orszP+HmtoRc/iLfMW1D6sarDRBRZjY1x90iL6VzK46
	 UTbSuQjciWCq/jTcAFAShkaKX2wos8aHTiSzwCK/plAJzI8edx/4+W7nD0l3YbdkTYSDz
	 nZ2w9yxXDP0qscLgXVaAvbzQo9r3DyxGKoHovMxjzmDIgxjL14soLjtu9DikSEqLec9MH
	 goeTvy65hyq2UWLgYRS5R87rrN0aCuSr0BU7XutiqwMq6wh9gJ29fyjhMZKq+XfwA5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378290;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=htSTNd9cA8Wg2MeyyIfM51PFL8ci57bD31F/Ut36EqM=;
	b=ms4QZYdI/XobqUh7oS4M4QYXUJMbpz6mtZ/Wp6cCyxXG+7m1eNsn6dwk6jNiwz1RjKKg
	 JN6i9+7J1hjLC6DyDrLyCRcApGQq4nl6GmZrPpLCJ7hRsKNtmOdfgmALE7u7hFGIVh2c5
	 8tK68JCfUMjXTmcJKG5wqZi1wA3wpnnPYpRg3xmciod/FiNVHyiiW8RAWinZVDeorKNRL
	 Y4WJoLGWezLv4x16ez9wx+CndwrQnh7s3YjjimsipMTazOTl+OQ6SvXTCKwyA+e46Dd6S
	 EO9MxS3IqsQ5y5EwLP8sepZQ0M8cObW/WF5MqCxwUdxqFZGFbM2BEhPKz3eP+prvxxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="Zd/VYZzH";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9EB1606A31E;
	Fri, 30 Oct 2026 16:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9EB1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Zd/VYZzH
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F5B01682;
	Fri, 30 Oct 2026 09:38:05 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D0C43F673;
	Fri, 30 Oct 2026 09:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793378288; bh=Rfc4WAfhYKXq9UXyLbETI7ENpp2ZXXl3U2uJkCJ+X0U=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Zd/VYZzHC0G8xIyj2KtjF5zomiTqmINVwwYmlLjfKLdpjcOPnRrjfCyWT3CuBbbTp
	 J4zFyqlptBA3FPP4bz6rXczLbQWb/Y/m1ILcXgRV/1RVjTTZQxhMzeoDnxPhjSbwhx
	 G5XsdXCf20ZF8aFLJMUi+knOUeh0gOCHlWeFd/Oo=
Message-ID: <bea9392d-a9d1-4683-ba2c-41139a1dca9d@arm.com>
Date: Fri, 30 Oct 2026 16:38:03 +0000
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
Subject: Re: [RFC PATCH v2 01/19] arm_mpam: resctrl: Leave CDP off when there
 are too few PARTIDs
To: Jinjie Ruan <ruanjinjie@huawei.com>, reinette.chatre@intel.com,
 james.morse@arm.com, fenghuay@nvidia.com, catalin.marinas@arm.com,
 will@kernel.org, mark.rutland@arm.com, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, tony.luck@intel.com,
 Dave.Martin@arm.com, babu.moger@amd.com, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
 tan.shaopeng@jp.fujitsu.com, jic23@kernel.org, zengheng4@huawei.com,
 gshan@redhat.com, x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20261029123611.1108424-1-ruanjinjie@huawei.com>
 <20261029123611.1108424-2-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261029123611.1108424-2-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jinjie,

Thanks for this fix!

On 29/10/2026 12:35, Jinjie Ruan wrote:
> Enabling CDP needs a second PARTID for the reserved closid.

I'm not sure what a 'reserved closid' is here but you could just say:

Enabling CDP requires at least 2 PARTIDs.

> If firmware
> reports too few PARTIDs, resctrl_arch_set_cdp_enabled() returns -EINVAL,

Not all systems are firmware backed. This can be:

If there are too few PARTIDs, ... .

> but only after it has recorded CDP as enabled, halved the monitor count
> and turned off the mbw_max MBA control. 


> resctrl then reports an error
> and believes CDP is off, which leaves the two sides out of step and the
> halved monitor count and the missing MBA control are not undone.

I think the 'reports an error part' can be dropped leaving 'resctrl then believes CDP is off...' as
exactly what resctrl does is not important here.

> 
> Check the PARTID limit, and work out the CDP PARTIDs, before anything is

Why work out the CDP PARTIDs so early if they aren't going to be used?

> changed so a failed enable has no effect.
> 
> Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/resctrl/mpam_resctrl.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 5468367776e2..886f0595d364 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -210,6 +210,18 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>  	if (enable)
>  		pr_warn("CDP is an expert feature and may cause MPAM to malfunction.\n");
>  
> +	/*
> +	 * Check this before changing any state: if CDP can't be enabled the
> +	 * caller must see CDP left off.
> +	 */

I don't think this comment is needed. Failing early rather than failing late after some side effects
have happened is clearly better.

> +	if (enable) {
> +		if (mpam_partid_max < 1)
> +			return -EINVAL;
> +
> +		partid_d = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_DATA);
> +		partid_i = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_CODE);

The partid_d/partid_i determination can stay below so it's close to the user.

I think we can just have the check here:

if (enable && mpam_partid_max < 1)
  	return -EINVAL;

Thanks,

Ben

> +	}
> +
>  	/*
>  	 * resctrl_arch_set_cdp_enabled() is only called with enable set to
>  	 * false on error and unmount.
> @@ -238,14 +250,6 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>  	if (!cdp_enabled && mpam_resctrl_controls[RDT_RESOURCE_MBA].class)
>  		mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = true;
>  
> -	if (enable) {
> -		if (mpam_partid_max < 1)
> -			return -EINVAL;
> -
> -		partid_d = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_DATA);
> -		partid_i = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_CODE);
> -	}
> -
>  	mpam_set_task_partid_pmg(current, partid_d, partid_i, 0, 0);
>  	WRITE_ONCE(arm64_mpam_global_default, mpam_get_regval(current));
>  

