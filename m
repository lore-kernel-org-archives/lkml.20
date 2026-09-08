Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D50AB4A3869
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788857628; cv=none; b=RavQGK5Os0+RevX8hIEJ4KctJaGa/e4rNjxS9tyWbl0m9IBiCjy1tEVDJRE6rglfpFXtWsGVhPTb6rnvI5GXwZrFHGvzmTq00JjHb1ZkBxDfjRhtYojFJ+0W+8sDgj8fZEUjG/YZNEBmMO27HRFJnkY0u4jzwHyoz476q1jczYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788857628; c=relaxed/simple;
	bh=amM6bviW6cqTMMnwlXoeIUSEOGW7QbeWgYsgc0LwNF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LF2YYWTKekA87e//4PlEsSVmg+hEUSXuOEujj0PiamG0omAneL2JIvKg1AI7RmvgsDvOO2votVf67F7QlIb52FhUKDLwz5V4LHYtRQrV4I1e64hf3WHMhqN0E+zfRH5T8Hp6kvIAdZAtg4lzn+mJISlTf8nKm9a6dxO72ChDvX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Xpq3bnTs; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Xpq3bnTs"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F7171476;
	Tue,  8 Sep 2026 01:53:33 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8652D3F528;
	Tue,  8 Sep 2026 01:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788857616; bh=amM6bviW6cqTMMnwlXoeIUSEOGW7QbeWgYsgc0LwNF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xpq3bnTsB7nfADZq1mqMIfArqNE/2hb+en5bjtvelJFstfz1UntdA5CLGgZsotsyc
	 9fj79GXM8cIYl3/D9cylUy/jFk8yQ4IRdKd2A3/N2C+lZvCGAoE2F/D8iR7jzh3AfT
	 hYsudH6rhg7zt1JXed4hKxPevhJIQlnKF3EKRd5I=
Date: Tue, 8 Sep 2026 09:53:33 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>,
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>, x86@kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [PATCH] x86/mm: Introduce helper for checking direct map 1G page
 support
Message-ID: <ap_NDXCWb0shVvzp@e129823.arm.com>
References: <20260902194718.E1FF3041@davehans-spike.ostc.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902194718.E1FF3041@davehans-spike.ostc.intel.com>

Hi Dave,

> 
> There is an existing variable (direct_gbpages) that says whether the
> kernel can and should use 1G pages in the direct map. It is driven
> by a bunch of other machinery. At least:
> 
>  1. Hardware support for 1G pages
>  2. Kconfig support for 1G direct mappings
>  3. Kernel command line overrides
> 
> Most code just checks the 'direct_gbpages' variable itself.  But there
> are cases where 1G mappings are compile-time disabled (via
> X86_DIRECT_GBPAGES) and 'direct_gbpages' is always 0. Unfortunately,
> that constraint is invisible to the compiler.
> 
> This opacity has been historically functionally harmless; it only
> leaves a bit of dead code. But, there are plans to tigthen up the
> compile-time checks around folded page table levels. The build will
> break if that dead code appears reachable to the compiler. Making
> the compile-time config visible to the compiler fixes the build.
> 
> Add a helper to replace 'direct_gbpages' checks. Check the Kconfig
> option and base CPU support before looking at the variable.
> 
> This lets the compiler optimize things better, especially
> collapse_pud_page() where most of the function can now be optimized
> out when the PUD level is folded.
> 
> Notes:
> 
> Use boot_cpu_has() instead of cpu_feature_enabled(). There's no
> required/disabled features for 1G pages themselves
> (X86_DIRECT_GBPAGES is for kernel mappings only) and the
> static_cpu_has() infrastructure is just gets in the compiler's way.
> 
> This makes 64-bit build marginally larger (20 bytes in one compile)
> and 32-bit builds less marginally _smaller_ (~700 bytes).
> 
> Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Tested-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Link: https://lore.kernel.org/all/20260902-dummy_ptxp3-v3-15-5d8f5b17c25c@arm.com/ [1]
> ---
> 
>  b/arch/x86/include/asm/pgtable.h     |   14 ++++++++++++++
>  b/arch/x86/kernel/cpu/common.c       |    2 +-
>  b/arch/x86/kernel/machine_kexec_64.c |    2 +-
>  b/arch/x86/mm/init.c                 |    2 +-
>  b/arch/x86/mm/pat/set_memory.c       |    4 ++--
>  5 files changed, 19 insertions(+), 5 deletions(-)
> 
> diff -puN arch/x86/include/asm/pgtable.h~direct_gbpages-compiletime arch/x86/include/asm/pgtable.h
> --- a/arch/x86/include/asm/pgtable.h~direct_gbpages-compiletime	2026-09-02 10:08:59.999169372 -0700
> +++ b/arch/x86/include/asm/pgtable.h	2026-09-02 10:09:00.011170394 -0700
> @@ -1163,6 +1163,20 @@ static inline int pgd_none(pgd_t pgd)
>  #ifndef __ASSEMBLER__
>  
>  extern int direct_gbpages;
> +static inline bool direct_gbpages_enabled(void)
> +{
> +	/* Check the direct map config option: */
> +	if (!IS_ENABLED(CONFIG_X86_DIRECT_GBPAGES))
> +		return false;
> +
> +	/* Check the CPU feature: */
> +	if (!boot_cpu_has(X86_FEATURE_GBPAGES))
> +		return false;
> +
> +	/* Check the command-line and early setup variable: */
> +	return direct_gbpages;
> +}
> +
>  void init_mem_mapping(void);
>  void early_alloc_pgt_buf(void);
>  void __init poking_init(void);
> diff -puN arch/x86/mm/init.c~direct_gbpages-compiletime arch/x86/mm/init.c
> --- a/arch/x86/mm/init.c~direct_gbpages-compiletime	2026-09-02 10:09:00.001169542 -0700
> +++ b/arch/x86/mm/init.c	2026-09-02 10:09:00.011170394 -0700
> @@ -251,7 +251,7 @@ static void __init probe_page_size_mask(
>  		__default_kernel_pte_mask &= ~_PAGE_GLOBAL;
>  
>  	/* Enable 1 GB linear kernel mappings if available: */
> -	if (direct_gbpages && boot_cpu_has(X86_FEATURE_GBPAGES)) {
> +	if (direct_gbpages_enabled()) {
>  		printk(KERN_INFO "Using GB pages for direct mapping\n");
>  		page_size_mask |= 1 << PG_LEVEL_1G;
>  	} else {
> diff -puN arch/x86/kernel/cpu/common.c~direct_gbpages-compiletime arch/x86/kernel/cpu/common.c
> --- a/arch/x86/kernel/cpu/common.c~direct_gbpages-compiletime	2026-09-02 10:09:00.003169713 -0700
> +++ b/arch/x86/kernel/cpu/common.c	2026-09-02 10:09:00.012170479 -0700
> @@ -2660,7 +2660,7 @@ void __init arch_cpu_finalize_init(void)
>  		 * Right now we don't do that with gbpages because there seems
>  		 * very little benefit for that case.
>  		 */
> -		if (!direct_gbpages)
> +		if (!direct_gbpages_enabled())
>  			set_memory_4k((unsigned long)__va(0), 1);
>  	} else {
>  		fpu__init_check_bugs();
> diff -puN arch/x86/kernel/machine_kexec_64.c~direct_gbpages-compiletime arch/x86/kernel/machine_kexec_64.c
> --- a/arch/x86/kernel/machine_kexec_64.c~direct_gbpages-compiletime	2026-09-02 10:09:00.004169798 -0700
> +++ b/arch/x86/kernel/machine_kexec_64.c	2026-09-02 10:09:00.012170479 -0700
> @@ -257,7 +257,7 @@ static int init_pgtable(struct kimage *i
>  		info.kernpg_flag |= _PAGE_ENC;
>  	}
>  
> -	if (direct_gbpages)
> +	if (direct_gbpages_enabled())
>  		info.direct_gbpages = true;
>  
>  	for (i = 0; i < nr_pfn_mapped; i++) {
> diff -puN arch/x86/mm/pat/set_memory.c~direct_gbpages-compiletime arch/x86/mm/pat/set_memory.c
> --- a/arch/x86/mm/pat/set_memory.c~direct_gbpages-compiletime	2026-09-02 10:09:00.008170139 -0700
> +++ b/arch/x86/mm/pat/set_memory.c	2026-09-02 10:09:00.013170565 -0700
> @@ -130,7 +130,7 @@ void arch_report_meminfo(struct seq_file
>  	seq_printf(m, "DirectMap4M:    %8lu kB\n",
>  			direct_pages_count[PG_LEVEL_2M] << 12);
>  #endif
> -	if (direct_gbpages)
> +	if (direct_gbpages_enabled())
>  		seq_printf(m, "DirectMap1G:    %8lu kB\n",
>  			direct_pages_count[PG_LEVEL_1G] << 20);
>  }
> @@ -1340,7 +1340,7 @@ static int collapse_pud_page(pud_t *pud,
>  	pmd_t *pmd, first;
>  	int i;
>  
> -	if (!direct_gbpages)
> +	if (!direct_gbpages_enabled())
>  		return 0;
>  
>  	addr &= PUD_MASK;
> _

Sorry for late Dave, But would it be better to include below with your
patch?

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 0ce140e4bca6..1165cb793478 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -1697,7 +1697,7 @@ static int populate_pud(struct cpa_data *cpa, unsigned long start, p4d_t *p4d,
        /*
         * Map everything starting from the Gb boundary, possibly with 1G pages
         */
-       while (boot_cpu_has(X86_FEATURE_GBPAGES) && end - start >= PUD_SIZE) {
+       while (direct_gbpages_enabled() && end - start >= PUD_SIZE) {
                set_pud(pud, pud_mkhuge(pfn_pud(cpa->pfn,
                                   canon_pgprot(pud_pgprot))));

-- 
Sincerely,
Yeoreum Yun
