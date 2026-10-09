Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 740AF33438F
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 17:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791566329; cv=none; b=THFMy5usIKIeDD54sSrsk9/62GQP0ebQdGu+Es3UNP1MTur8mRw/M6h2xXjxS6MpqWiq/oywd54PxhYYn0KdY/vWv8RdFMDvvALLHMDuCg6xbImApqCnl2Kfgxr9h4UugEp79ecswE2fTfWqSc6c3TO5iTr1gntfhL88txF7e70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791566329; c=relaxed/simple;
	bh=rBfm1DAAb9cV4CQlblYfiQmthIm+O3I8OrK/R3tCsbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bIiIRHamgjTIb9gPC8ajCqUZEKmXyA3eSrNcipumnSB/Aq3EaENCYkc2+spjQIj8Qnc3fu+dOW7KOW2cSo6UbXRoaEzexwXOWcvd9tIaUxEiTKVeNjcIrofmQJ5O0oM81H/TaCkbn8xwNsM/Sww7LFTMm0pjmOzL0U4CjZ0SOKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=vPppVwSd; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="vPppVwSd"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87DC71D14;
	Fri,  9 Oct 2026 10:18:43 -0700 (PDT)
Received: from [10.211.55.3] (unknown [10.57.54.134])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D98143F763;
	Fri,  9 Oct 2026 10:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791566326; bh=rBfm1DAAb9cV4CQlblYfiQmthIm+O3I8OrK/R3tCsbQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vPppVwSdNz8tfYPfhxi8gWNZb2L3JhcaW4lrUUEYf9Xjxyuq+z8OvsMc3Cv6+g1oS
	 UQ02nedv26nOyh2bru/OvU9Ic70/s0jixXVNgAiPPY355pgr+XW6CZ1ZLR6VG3S8cp
	 Boq2tAyDH4Qo16qRBJr6mNRnGoE1pX99FSj8Ve5U=
Message-ID: <42c28a94-8c04-4a50-bcb5-0445c012fe21@arm.com>
Date: Fri, 9 Oct 2026 18:18:44 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH] arm_mpam: return allocation errors as error pointers
To: Sang-Hoon Choi <csh0052@gmail.com>, James Morse <james.morse@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Fenghua Yu <fenghuay@nvidia.com>, linux-kernel@vger.kernel.org,
 Changyul Lee <lcy8047@gmail.com>
References: <179075213853.3.16001626385793291460.idr-bug-33@gmail.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <179075213853.3.16001626385793291460.idr-bug-33@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sang-Hoon,

On 9/30/26 08:08, Sang-Hoon Choi wrote:
> resctrl_arch_mon_ctx_alloc() stores the result of monitor allocation in
> an allocated int. If monitor allocation fails, it still returns that pointer.
> Callers check IS_ERR(), so they treat the failed allocation as a valid
> monitor context and pass the error value on as a monitor index.
> 
> For example, if the wait for a free monitor ends because a signal is
> pending, the stored result is still -ENOSPC. Other allocation errors
> also reach the same return path.

Thanks for report and fix. Is this addressing a hypothetical problem or
have you seen resctrl_arch_mon_ctx_alloc() fail?

> 
> Free the temporary allocation and return ERR_PTR(err) for negative
> results. Leave successful indices and USE_PRE_ALLOCATED unchanged.
> 
> Fixes: 2a3c79c61539 ("arm_mpam: resctrl: Allow resctrl to allocate monitors")
> Reported-by: Changyul Lee <lcy8047@gmail.com>
> Link: https://github.com/lcy8047/radix-tree-bug-temp/blob/main/bug_list/idr-ida-xarray/wrong-id-value/IDR-BUG-33-mpam-monitor-id.md

I don't see anything at this link. This line can just go.

> Assisted-by: Sang-Hoon Choi <csh0052@gmail.com>

Should this be?

Assisted-by: LLM

Thanks,

Ben

> Signed-off-by: Sang-Hoon Choi <csh0052@gmail.com>
> ---
> Compile-tested on arm64 with allmodconfig and W=1 against mainline
> 6f8319e3e9a44dd537d17f41565a8453c560a581. No hardware runtime test was
> performed.
> 
>  drivers/resctrl/mpam_resctrl.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 9d223057953a..945be7465ad3 100644
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

