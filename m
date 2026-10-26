Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023718;
	b=Byf4wlYUm17Fi3sD/YiDOi2y7hSIPpOCUIJw8PIxwh9jiuLnm26iAet7ZWBoNham4Vao
	 raI+b+JiYWBBVdyXE+AOpysFQUaEYflD6+GFSspzWvLu+Q8TDH/Y4wmfKMw+6S7taj1zv
	 kPOisqOOPg3Zok/rMbhGn2NLvpwKL1Y5UH7N77Udf+78u+zi/jKXWrpypCyG8eEpHayL/
	 heLjW8nr68iz5s1cjFt7sHocBCf1A9MJnujlnw64lxr3Bk8PkRSOGcHuGomMvRkssX6UF
	 LSK5dMRasn4Z41LQSpYbcH/2Rfi7X1JsmVd0GY4wFcbedoMkhI0arMZX127fw8MEtpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023718;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=/gG3Pme0hUJLTahHb/eEr3A0ViX2GHH674qv8PI71bk=;
	b=0Atx4zFUq/SDiBw5gKCfIawSu2pKJLO9Cmq8Vw7+5yjjW7L8c1RTf8VrWdSbPr9juHWf
	 Wfakk9SFKZwyvIRb8MAC/dpRHlzb4m+cvdv1LdxTOiVmeZpnY0aTnoV19LxwhXSi4UQdN
	 WrC2JhCCmrWjvVjFiJhuHE5R4/mdYixK1Kf8VjFulXTAP5RZhGiv0aPR2XhaxtS6CAMUt
	 bgtembIIB3t1ADP9uaYbyuzvVD5kHbRUkVZcjQcpNMlDgbxURiYhnnYceEHGWTPRpe1R+
	 WruDIEn2dGXUWPjol9/3EFEVsAql7TaBTb2yhyyPkK8GneF8GN9WOPXMkhf1ZJ6rGlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Urxu8VY9;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BD0F60A2605
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BD0F60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Urxu8VY9
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C82C12720;
	Mon, 26 Oct 2026 07:08:32 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA1A63F7B4;
	Mon, 26 Oct 2026 07:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793023716; bh=eUs7kmCkJ7Bff+CIl7HbCiCvIO4y+3HR25s9EgeT4eU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Urxu8VY9ZrGdWTttxT9tiVeFhr+4b3/WCjyfZeciPSBSOOxuyovCos9rS15DL4LAd
	 /QuheN9lR1dNl7VhDtXkEGU8TF7L7pJnwkaaUKlzkRGkvey5aAWAMakRVEuGa2FpDS
	 qWHaRjlLSdqTNMWq+Q8etHVBdJSdCTc29ggQCqpc=
Message-ID: <069b920d-b1f9-4074-aee0-1607860dac21@arm.com>
Date: Mon, 26 Oct 2026 14:08:32 +0000
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
Subject: Re: [PATCH v10 RESEND 02/15] fs/resctrl: Skip monitor context
 allocation when force-freeing RMIDs
To: Jinjie Ruan <ruanjinjie@huawei.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 babu.moger@amd.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, fenghuay@nvidia.com,
 tan.shaopeng@fujitsu.com, zengheng4@huawei.com, jic23@kernel.org,
 gshan@redhat.com, catalin.marinas@arm.com, x86@kernel.org,
 linux-kernel@vger.kernel.org
References: <20261020134239.3921377-1-ruanjinjie@huawei.com>
 <20261020134239.3921377-3-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261020134239.3921377-3-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jinjie,

On 20/10/2026 14:42, Jinjie Ruan wrote:
> __check_limbo() allocates the architecture monitor context before the
> scan loop, even when force_free is set. The force-free path never reads
> occupancy and never uses the context.
> 
> If the allocation fails, the function returns early and leaves the limbo
> list unflushed. Callers such as the unmount path then silently fail to
> return the RMIDs to the free list, leaving stale CLOSIDs in limbo that
> are re-interpreted with the CDP state of the next mount.

Is this a theoretical fix or is there some way that resctrl_arch_mon_ctx_alloc() can fail in practice?

Thanks,

Ben

> 
> Only allocate and free the monitor context when occupancy will be read.
> 
> Fixes: fa7d949337cc ("x86/resctrl: Rename and move rdt files to a separate directory")
> Cc: James Morse <james.morse@arm.com>
> Cc: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  fs/resctrl/monitor.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index da883adc3adc..ffa9c67c9f00 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -142,11 +142,13 @@ void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
>  	u64 val = 0;
>  
>  	arch_priv = mon_event_all[QOS_L3_OCCUP_EVENT_ID].arch_priv;
> -	arch_mon_ctx = resctrl_arch_mon_ctx_alloc(r, QOS_L3_OCCUP_EVENT_ID);
> -	if (IS_ERR(arch_mon_ctx)) {
> -		pr_warn_ratelimited("Failed to allocate monitor context: %pe",
> -				    arch_mon_ctx);
> -		return;
> +	if (!force_free) {
> +		arch_mon_ctx = resctrl_arch_mon_ctx_alloc(r, QOS_L3_OCCUP_EVENT_ID);
> +		if (IS_ERR(arch_mon_ctx)) {
> +			pr_warn_ratelimited("Failed to allocate monitor context: %pe",
> +					    arch_mon_ctx);
> +			return;
> +		}
>  	}
>  
>  	/*
> @@ -192,7 +194,8 @@ void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
>  		cur_idx = idx + 1;
>  	}
>  
> -	resctrl_arch_mon_ctx_free(r, QOS_L3_OCCUP_EVENT_ID, arch_mon_ctx);
> +	if (!force_free)
> +		resctrl_arch_mon_ctx_free(r, QOS_L3_OCCUP_EVENT_ID, arch_mon_ctx);
>  }
>  
>  bool has_busy_rmid(struct rdt_l3_mon_domain *d)

