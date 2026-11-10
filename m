Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297067;
	b=ny5nt766H+Bpt9+Gku48gNBngBQatUAYK8XYqImXTGEPwOhKk0oLggdtop+Z8B14iBuW
	 cigcjxHV6fiG+JhJSmTIDc+AlII4YOpg0iUfJfEiZbmoVpTWOF1nrk7mSo6Vsm8gmGrp9
	 FT5SAFkQNoooxNQfywjyp/a8jM55vOlklui9kjuWzqjONRhK+aDu1s+k6XXpsnAMVTwiv
	 OgNK6ufpq8kvPwjCj9Ry6ko+SdzALkO6QEiSVm2ALMxnHyO0++RlNkTtmaHUxugsUgjMY
	 Kbsr0HWt5iuj2cQyaBZugplNmEsvIJuAUZDooVsUg0LmXARIMbkuB5rkrgzQcDSNNsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297067;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=oCAnq9Ydyn9pzFtWZAL2uoxXAv5DcpFwU0HVA55B7zc=;
	b=s2iSJkMmKB/e83WOqgBTrU/HPUcv5yadIeErajWPOXjcAyq9CtqBdhoHk7/f0rPN0PR2
	 H/qjt070KVTb9xz1WKOYWWZ+q0o3cCBSDKl4aSJLiDBwIjM9sj3TaZv5RZCWHYjtqG9ER
	 eFYG3LhElChzQvqmrvIhWyAe2mjhGA1CFnAGIqZqjUsu21VS/K1Cf9c44D/L1EnoT/+eo
	 kJZCDikauyLSNn7MX2QcmRMZKRY1HS5/dS6OEZ/ugL2jK3k79t4sXyRvzjO2ddU4IClih
	 uBl5pJwIJxXPtMCebI1NdSMMsMzDSDjvvVF6w3BuwO8FUTGQixovEssEnC53Kip4WEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Bt11K0DF;
	arc=none smtp.remote-ip=95.215.58.228
Received: from mta1.migadu.com (out-228.mta1.migadu.com [95.215.58.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65253606C637
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65253606C637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Bt11K0DF
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VEYHcJJXdTr+sSu/VkSL5rhEFuBwOC/PnaSfhFDxgH4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794297064; v=1; x=1794901864;
 b=Bt11K0DFsGKbjUzn/HQN5vSqRNQbCITQzMqgzZSVPTK8Ks7/8ZCi1hZYj1vCJlS1KNqzmK8h
 OnM+Gmbeo3EQyaa0Oy2n0daXlzBnGKD1O6EN2UuNgZywnsbzN9SrVCZBp0/kkowynQkgbfCxr9b
 bZoVt616m4e1laAF5GMWGFnQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d983afd97fe96bab;
	Tue, 10 Nov 2026 07:51:04 +0000
X-Mizu-Trace-ID: d983afd97fe96bab
X-Migadu-Flow: FLOW_OUT
Message-ID: <9c767bbc-3189-429b-b008-021306426b7e@linux.dev>
Date: Mon, 9 Nov 2026 23:50:58 -0800
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
Subject: Re: [PATCH] x86/Kconfig: enable ROX cache in execmem when
 STRICT_KERNEL_RWX is set
To: Mike Rapoport <rppt@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Borislav Petkov <bp@alien8.de>, Dan Moulding <dan@danm.net>,
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
References: <20250716075410.82578-1-rppt@kernel.org>
Content-Language: en-US
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250716075410.82578-1-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/16/25 12:54 AM, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Dan Moulding reported that kernel configured without modules produces
> "Found insecure W+X mapping at address 0xffffffffc0247000" warining:
>
> [    6.022847] ------------[ cut here ]------------
> [    6.023020] x86/mm: Found insecure W+X mapping at address 0xffffffffc0247000
> [    6.023200] WARNING: CPU: 5 PID: 1 at arch/x86/mm/dump_pagetables.c:246 note_page+0x6ec/0x790
> [    6.023381] CPU: 5 UID: 0 PID: 1 Comm: swapper/0 Tainted: G                T   6.16.0-rc6 #1 PREEMPT
> [    6.023558] Tainted: [T]=RANDSTRUCT
> ...
> [    6.031153] x86/mm: Checked W+X mappings: FAILED, 10 W+X pages found.
>
> The 10 W+X pages are the pages allocated for ITS thunks. With
> CONFIG_MODULES disabled, CONFIG_STRICT_MODULE_RWX does not exist and ROX
> cache in execmem is not enabled so execmem_restore_rox() becomes an empty
> stub.
>
> Enabling ROX cache when CONFIG_STRICT_KERNEL_RWX is set solves the issue and
> makes ITS thunks memory properly protected.
>
> It also ensures that memory containing ITS thunks is mapped with 2M pages
> for kernels compiled without modules.
>
> Reported-by: Dan Moulding <dan@danm.net>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>   arch/x86/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 8bed9030ad47..d6d8050683ae 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -89,7 +89,7 @@ config X86
>   	select ARCH_HAS_DMA_OPS			if GART_IOMMU || XEN
>   	select ARCH_HAS_EARLY_DEBUG		if KGDB
>   	select ARCH_HAS_ELF_RANDOMIZE
> -	select ARCH_HAS_EXECMEM_ROX		if X86_64 && STRICT_MODULE_RWX
> +	select ARCH_HAS_EXECMEM_ROX		if X86_64 && (STRICT_KERNEL_RWX || STRICT_MODULE_RWX)
>   	select ARCH_HAS_FAST_MULTIPLIER
>   	select ARCH_HAS_FORTIFY_SOURCE
>   	select ARCH_HAS_GCOV_PROFILE_ALL
>
> base-commit: 347e9f5043c89695b01e66b3ed111755afcf1911

We recently hit this issue after changing CONFIG_MODULES from y to n in 
our guest kernels.
Did this patch slip through the cracks last year ?

Could we get it merged?

I have verified the fix on 7.4-rc1 in a KVM guest running on an Intel 
Cooper Lake host.

Tested-by: Atish Patra <atishp@meta.com>

