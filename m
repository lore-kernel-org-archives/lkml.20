Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1995E47728E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253982; cv=none; b=dlsH8SVkVqYtY6ANX7+xWIdD3MPGQV+l2e2KpHJUVOfrbERy8HYJxryfKBP/mo0pautFlGGk2mE18vo4avjWLrzrmnpf1klStEZP11bfkP8DkhU4ILRfT2oMRAl8+eybmOn7KI2dLI50J7TaerSo98NM1QRc/2/ef3LRqmTlAxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253982; c=relaxed/simple;
	bh=rbaRyeBPrLdcQyWyCt5ftES2mzcd8+vW5l8SUinEmKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jW+bGcJrOVP84tKt9PURXubHtQZlf2zue/8+Icx52LsCSP6+kvOOFj0CsAHcbf297dknzqZEqnqGCnFETMKoznnD9PPRfhNrfhs58uRCf3NYL5o3eUfNjI0RduOsqEcARtQgb2fAuTwAjgzOhomk6neyGPESTw4b59VOKH5U5QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KoOZ9kQR; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KoOZ9kQR"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 714961AED;
	Tue,  1 Sep 2026 02:12:56 -0700 (PDT)
Received: from [10.57.7.38] (unknown [10.57.7.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A378B3F882;
	Tue,  1 Sep 2026 02:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788253980; bh=rbaRyeBPrLdcQyWyCt5ftES2mzcd8+vW5l8SUinEmKw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KoOZ9kQRWDVapEe+PRSx3GlmHQ1bOERvE9n0m1uXbfY+3jf32r3ozjYgMTknTEt97
	 J/egV5OVx8vR+xZPEwrKRHP2kIWAR+pa3QkOiuluynTStRIM5QctxTFFnLmls1qM/2
	 Zr5IKtty+8ZaimKIu4wbd7BWz8iAesXqI/FfuOws=
Message-ID: <e98a0dd6-d834-402c-be1c-0b7e8737e7ad@arm.com>
Date: Tue, 1 Sep 2026 11:12:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 4/4] arm64: mm: Move fixmap intermediate page
 tables into .rodata
To: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>
References: <20260827164409.3421848-6-ardb+git@google.com>
 <20260827164409.3421848-10-ardb+git@google.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260827164409.3421848-10-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/08/2026 18:44, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> The fixmap intermediate page tables are allocated statically, are
> installed into the kernel's page table hierarchy early during boot, and
> control a slice of the kernel's virtual address space that is not
> subject to KASLR randomization.
>
> Combined with the lack of randomization of the linear map, and the
> tendency of some Android bootloaders to place the kernel image at the
> base of DRAM in the physical space, the placement of these page tables
> produces a vulnerability that is comparatively easy to exploit.
>
> Avoid this, by moving these intermediate page tables into .rodata, so
> that they cannot be manipulated directly via the linear map.

Would be good to mention that this works thanks to the previous patches,
otherwise one would wonder why we didn't do this earlier :)

- Kevin

> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/include/asm/linkage.h | 1 +
>  arch/arm64/mm/fixmap.c           | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/include/asm/linkage.h b/arch/arm64/include/asm/linkage.h
> index d1f7a16729d2..00963e11ebf0 100644
> --- a/arch/arm64/include/asm/linkage.h
> +++ b/arch/arm64/include/asm/linkage.h
> @@ -45,6 +45,7 @@
>  
>  #define _THIS_IP_ ({ unsigned long __ip; asm volatile("adr %0, ." : "=r" (__ip)); __ip; })
>  
> +#define __rodata_pgtbl __section(".pgtbl.ro_after_init") __aligned(PAGE_SIZE)
>  #define __bss_pgtbl __section(".bss..pgtbl") __aligned(PAGE_SIZE)
>  
>  #endif
> diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
> index 3a8cf6de6a7d..ab0f9ba7b712 100644
> --- a/arch/arm64/mm/fixmap.c
> +++ b/arch/arm64/mm/fixmap.c
> @@ -32,8 +32,8 @@ static_assert(NR_BM_PMD_TABLES == 1);
>  #define BM_PTE_TABLE_IDX(addr)	__BM_TABLE_IDX(addr, PMD_SHIFT)
>  
>  pte_t fixmap_bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __bss_pgtbl;
> -static pmd_t bm_pmd[PTRS_PER_PMD] __bss_pgtbl __maybe_unused;
> -static pud_t bm_pud[PTRS_PER_PUD] __bss_pgtbl __maybe_unused;
> +static pmd_t bm_pmd[PTRS_PER_PMD] __rodata_pgtbl;
> +static pud_t bm_pud[PTRS_PER_PUD] __rodata_pgtbl;
>  
>  const size_t fixmap_bm_pte_size = sizeof(fixmap_bm_pte);
>  
