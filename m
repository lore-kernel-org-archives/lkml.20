Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025722;
	b=fZAN8VH5MZf4MnC+qKlbW4QAJRDOxGheRdXaBQNsnZaqU8P4hNtOeyYeshg4+Vkv1i1n
	 wd2ZhKPjMJsUvN4TKaRGsCjRQBRR7nUux/xdt9VRt0Z6e34KmK4uYbFcg1meATZSW26vD
	 QcoD56cyLJhMQAr/8mIzt5gvA+GD3YY3OaEkPQtsCg8Pssq14CuZ40LmjyfBfNPcQWGMz
	 TYj9pWZn7ruQYVMK+vc2ry7uiauA3mJVWGsWgjv6TEX7IPwH9zFy53CdWujzvlFxKjGfy
	 b5U2rUapzVOEIn+drq+K78p18oJ9jas1EqdRrYjpO7JtWuXXB7Vxj46vm+FwvjgITBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025722;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Ez65BpebUQ+LzZHerBti0ml+PzvEp3wP1I1rTS2yZ9k=;
	b=WgcU2OGBSiVdYCvGJuuMngP6g/165etCT3T6PiSd5j7wi6xg5wFp1Kdw9ypjFyuYafa+
	 05oOKZQ2GM2XOYkEUQVIXi8svZ3VzGyK7wQeG/pInCt0yWen7F2ZR+keGndXXQ9fL1PSh
	 rEJM+3jLk9GFoT9hfRUc7hhgCHRDTqTRwmaB1HNNdBmal394polaw/k+N8LAeWg2hskwL
	 YVsiKHaaDGP4YrdBs7MBv40KBdnL0p7ZVmP/tUTv7lflGGgC1sVbdW714xnf+H/CBbg3q
	 wzo5OOWXJMoV2Path0M2JqhHkb+f3IHcE3mRbBbWJanLijgA9a0wR598aOwnviUKfHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=V1BVr1N3;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D163E606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D163E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=V1BVr1N3
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F5E615A1;
	Mon, 26 Oct 2026 07:41:58 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4BAA03F7B4;
	Mon, 26 Oct 2026 07:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793025721; bh=devpMkqlvzmfIsTiMV2MoQfbNpvgTmDNNsOb8HPINhY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V1BVr1N3Qqxj7gcY/ep6aR1lXjSC7poy8s9CxzmUwsk1SjBmQX0Ky04+PUyPEByk8
	 +PGlLvVN20cEtCr3WloEoUl3QRZlw2kAuoO/9yVgdyTC7Bdv/A1b5Edx41vSa+LP0S
	 Okr9YUu6b/GuMkKuj7SHEbiMGCwRpcHn5xkP/bdM=
Message-ID: <d92a1d48-6833-47a1-ab10-9d3b98543de1@arm.com>
Date: Mon, 26 Oct 2026 14:41:58 +0000
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

On 30/09/2026 08:08, Sang-Hoon Choi wrote:
> resctrl_arch_mon_ctx_alloc() stores the result of monitor allocation in
> an allocated int. If monitor allocation fails, it still returns that pointer.
> Callers check IS_ERR(), so they treat the failed allocation as a valid
> monitor context and pass the error value on as a monitor index.
> 
> For example, if the wait for a free monitor ends because a signal is
> pending, the stored result is still -ENOSPC. Other allocation errors
> also reach the same return path.
> 
> Free the temporary allocation and return ERR_PTR(err) for negative
> results. Leave successful indices and USE_PRE_ALLOCATED unchanged.
> 
> Fixes: 2a3c79c61539 ("arm_mpam: resctrl: Allow resctrl to allocate monitors")
> Reported-by: Changyul Lee <lcy8047@gmail.com>
> Link: https://github.com/lcy8047/radix-tree-bug-temp/blob/main/bug_list/idr-ida-xarray/wrong-id-value/IDR-BUG-33-mpam-monitor-id.md
> Assisted-by: Sang-Hoon Choi <csh0052@gmail.com>
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

This seems like a good place to use the cleanup.h helpers, __free(kfree) and then pass on the
pointer with return_ptr(ret).

Thanks,

Ben

>  }
>  

