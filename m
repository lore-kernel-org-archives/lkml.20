Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025617;
	b=KyJjp8cqhDCsjDHRRDiYsI18vZ9JfKr7doWTEVDb9r2xCuLcmm4buh8OwCMZIPt/KowR
	 YusJQig9kkqP1jS/criJOwWdjIsBJMuzUiQNjsc21QncIZAO3dYAzfFza6+IVe0RG0LoH
	 sFrPVVL4+MqoU/sh08zFaQi/XoN0wWNKPHBrvsFBFNAMa+h7Zm+B/nHwQdZAtkI+gA5FI
	 CrRMjYuG5kbLu07kR9IqWy9JrC2IboQ5sDQwCCTYu0YWFs4Awkjpy8PXTEn0Q3RY06aYl
	 WT7SxPqclfwVJIz/Tc9UXkCXA4Gdnbthh7aP95qaFVX1JqZaaXaCBRZCgSmxF7yTGZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025617;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ykRfXkH6cJmLTmHpPvaF/REchQME/dZi6i2ouOecx9Q=;
	b=YDz46zU6Ttw/CIQLOFj7ex1bjP31FedRFac2uoKEcShsp0V1V00lj/JTCk/e1Oo6SjwQ
	 GcxZqWqIJmbV25tMolUAHFCS5GU5V1Ce0L5YZBlBsrHhnsgph882+oQWnY3JcjTmB6uLM
	 wn87Tdzt7tFrDySI9ITo/qZw68DYn2aEDthOFSL4Ht99wfOkFcalbJo0ga5GR3ODYPsTT
	 S+u2vd4iZCd8Ck2mwOiHA17NXTbzfpMwXjr1T9L+jWdQ+8acFpJSfwCqL7+WqhmYNh4Qk
	 ECO8PEiK5Ug07BzJJ3R4NJ34gUWTmkOPEZKKLvXpvt4vWk8H7rHxelSKjRa8XKnS8tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=puyL+T5V;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC70D606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:40:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC70D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=puyL+T5V
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1B7315A1;
	Mon, 26 Oct 2026 07:40:12 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD6943F7B4;
	Mon, 26 Oct 2026 07:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793025616; bh=PdifPg312y5PvYuc4Xf4GG9TzVq4AqraeMh1xZ/Yeuc=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=puyL+T5V7eyYwEjIbrmCvuo098AiKubUI3TpqNXW2y9h/IP7DjG1Z+YUMr0ka9LgP
	 xaF5EWC/3q/GhEYlNQ1v7PlL0h53mQHIhMIfb5rhpg5uaudAURIBUWMftlZdwWrvzs
	 juxaGqD6dMvBG3ajtN3rMVZfhjK8EqEMkehoHvyo=
Message-ID: <19a84290-d0a8-4900-bb2a-ecd525eeff57@arm.com>
Date: Mon, 26 Oct 2026 14:40:12 +0000
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
Subject: Re: [PATCH v10 RESEND 03/15] arm_mpam: Fix error return in
 resctrl_arch_mon_ctx_alloc()
To: Jinjie Ruan <ruanjinjie@huawei.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 babu.moger@amd.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, fenghuay@nvidia.com,
 tan.shaopeng@fujitsu.com, zengheng4@huawei.com, jic23@kernel.org,
 gshan@redhat.com, catalin.marinas@arm.com, x86@kernel.org,
 linux-kernel@vger.kernel.org
References: <20261020134239.3921377-1-ruanjinjie@huawei.com>
 <20261020134239.3921377-4-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261020134239.3921377-4-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jinjie,

On 20/10/2026 14:42, Jinjie Ruan wrote:
> resctrl_arch_mon_ctx_alloc() stores the allocation result in a
> heap-allocated int and returns the pointer unconditionally. When
> allocation fails with anything other than a retryable -ENOSPC (e.g.
> -EINVAL, -EOPNOTSUPP, or -ENOSPC with a pending signal), the caller
> receives a valid heap pointer that IS_ERR() does not detect.
> 
> The caller then treats the error code as a monitor index: hardware
> reads use an out-of-range index, and resctrl_arch_mon_ctx_free() hands
> it to ida_free(), corrupting the allocator state.
> 
> Return ERR_PTR() when the allocation failed.

Is this just theoretical? What state do we have to be in for resctrl_arch_mon_ctx_alloc_no_wait() to
fail? I see that the same fix has already been posted by Sang-Hoon.

https://lore.kernel.org/lkml/179075213853.3.16001626385793291460.idr-bug-33@gmail.com/

Thanks,

Ben

> 
> Fixes: 2a3c79c61539 ("arm_mpam: resctrl: Allow resctrl to allocate monitors")
> Cc: James Morse <james.morse@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/resctrl/mpam_resctrl.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index edd8da460fd7..23a8771ef148 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -413,6 +413,13 @@ void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r,
>  	} while (*ret == -ENOSPC && !signal_pending(current));
>  	finish_wait(&resctrl_mon_ctx_waiters, &wait);
>  
> +	if (*ret < 0) {
> +		int err = *ret;
> +
> +		kfree(ret);
> +		return ERR_PTR(err);
> +	}
> +
>  	return ret;


>  }
>  

