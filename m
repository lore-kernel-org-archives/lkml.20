Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341865;
	b=TkSpkmsWhrg/qD3SkaKeNySQaX/fonkjYO6/rDQp0Tg85yHG/J4D2FwMIiF+PnOsuzBx
	 X6uoUJ/k10BrnOpK2QDGfLW5J2rMaRT4UgdL+Bh4NbyH7yWCMFMBt7CqwsasasUIvGM7Y
	 WaFKlaeeZJ+nCz+5yuKSOu6qg4gG6ubutuTtSJbWYswyrYGe8QcWKVHEZQTAQPFJccOYA
	 sn0/6HgLAv72//NBiuJBC/OuJI5kNYaTj79oRiNs/6ulFMRa1TI8MOzDIhrm6zWMLgvNj
	 yms831CLNgG5vSZSs774dgcD27MFK3Hr0ca3T6nsD5T6xWL3KTdDmVBIgLsLypDFRfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341865;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=bwatc7YNKphmzLOD1cva3Yaj2FQt6Hn0T7415Isuht0=;
	b=wsNNipqUO2rouE9i1D6Sr6s3WQWBpKz7FWduIvpkU3YYIUKGBKaXHM2xOZdyMfFXwxt2
	 mycSJVmeM8abnaIRUrP8//jM8K5k2Vsa3ETHQCz0XyDYwpKvG+UKai1VHtoyexZI6Nz17
	 QWnMZ+lsNrhPOj1Wj7yNSmbIs0+EMx/TGOVqjpuIJi/nBn+FsHwWe+NfkIHZJYfVcs8x9
	 ABQFQQzpo+G//APOJYaaEyoplB8isIyC1A1614D91xjGuvTc0JzmVFRGemfpxhpcQu77l
	 dJs4EyW8AslyLjSbywqIXXEq1CiE2v3+avRZeRzxGbuMlnPNpStVBVPf/k7cpb4mZDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D16D2606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:30:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D16D2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5CAD1E8D;
	Thu, 29 Oct 2026 23:30:55 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 20D073F673;
	Thu, 29 Oct 2026 23:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793341858; bh=sMSs6Ns8tchEO99DqKZ8eipSmR6/5yo08UeggARfrxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qq4Oi0RzbQA92a2gWL9OHWpVv5dTojKFIycXc2abJiaylBMym09KZdmdDm/xpdH2s
	 Vjd4MLWOClLMsuz/MXEBOLgoqLsNSbCrBDbfGQNwR7AJ7jzVALt5/tuq/Y/KigoljB
	 5ElcEnZyPgKlbxdj8HmH/AmEf/eiErgoCnIUdczI=
Date: Fri, 30 Oct 2026 12:00:55 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, 
	Lai Jiangshan <jiangshan.ljs@antgroup.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Thomas Huth <thuth@redhat.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: mm: Stop using the previous ASID for init_mm
Message-ID: <r56ewhlz5fihgwd34zbiaxgmxdw4eq4t36jlsmwepu4nbhon6i@kjsqwoivmfhr>
References: <20261027100231.31184-1-jiangshanlai@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027100231.31184-1-jiangshanlai@gmail.com>

On Tue, Oct 27, 2026 at 06:02:27PM +0800, Lai Jiangshan wrote:
> From: Lai Jiangshan <jiangshan.ljs@antgroup.com>
> 
> Switching to init_mm should prevent further accesses through the
> previous address space's translations.
> 
> Commit e53f21bce4d3 ("arm64: Use the reserved TTBR0 if context switching
> to the init_mm") avoided installing init_mm.pgd as a user page table.
> At the time, the ASID was held in TTBR0, so installing the reserved
> TTBR0 also switched to ASID 0.
> 
> Since commit 7655abb95386 ("arm64: mm: Move ASID from TTBR0 to TTBR1"),
> installing the reserved TTBR0 no longer changes the active ASID.
> Consequently, switching to init_mm leaves the CPU using the previous
> address space's ASID. An empty page table does not prevent TLB hits
> for that ASID.
> 
> This can retain access beyond the lifetime of the backing pages.
> During fullmm teardown, user data pages can be freed before their
> cached translations are invalidated. If those pages are subsequently
> reused for kernel data, an erroneous uaccess that hits a surviving
> translation can read or corrupt that data instead of faulting.
> 
> Fixes: 7655abb95386 ("arm64: mm: Move ASID from TTBR0 to TTBR1")
> Signed-off-by: Lai Jiangshan <jiangshan.ljs@antgroup.com>
> 
> diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
> index 803b68758152..7e56099c5fbb 100644
> --- a/arch/arm64/include/asm/mmu_context.h
> +++ b/arch/arm64/include/asm/mmu_context.h
> @@ -235,15 +235,6 @@ enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk)
>  
>  static inline void __switch_mm(struct mm_struct *next)
>  {
> -	/*
> -	 * init_mm.pgd does not contain any user mappings and it is always
> -	 * active for kernel addresses in TTBR1. Just set the reserved TTBR0.
> -	 */
> -	if (next == &init_mm) {
> -		cpu_set_reserved_ttbr0();
> -		return;
> -	}
> -
>  	check_and_switch_context(next);
>  }
>  
> diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
> index 0f4a28b87469..a96ebe904dd7 100644
> --- a/arch/arm64/mm/context.c
> +++ b/arch/arm64/mm/context.c
> @@ -218,6 +218,16 @@ void check_and_switch_context(struct mm_struct *mm)
>  	unsigned int cpu;
>  	u64 asid, old_active_asid;
>  
> +	/*
> +	 * init_mm.pgd contains kernel mappings, so use the reserved page
> +	 * tables for TTBR0 and switch TTBR1 to ASID 0. Leave active_asids

Just curious - does TTBR1 switch to ASID 0 ? AFAICS TTBR1_EL1 gets
the ASID which is derived from the mm_struct via ASID(mm) earlier.

void cpu_do_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm)
{
	unsigned long ttbr1 = read_sysreg(ttbr1_el1);
	unsigned long asid = ASID(mm);
	unsigned long ttbr0 = phys_to_ttbr(pgd_phys);

	/* Skip CNP for the reserved ASID */
	if (system_supports_cnp() && asid)
		ttbr0 |= TTBRx_EL1_CnP;

	/* SW PAN needs a copy of the ASID in TTBR0 for entry */
	if (IS_ENABLED(CONFIG_ARM64_SW_TTBR0_PAN))
		ttbr0 |= FIELD_PREP(TTBRx_EL1_ASID_MASK, asid);

	/* Set ASID in TTBR1 since TCR.A1 is set */
	ttbr1 &= ~TTBRx_EL1_ASID_MASK;
	ttbr1 |= FIELD_PREP(TTBRx_EL1_ASID_MASK, asid);

	cpu_set_reserved_ttbr0_nosync();
	write_sysreg(ttbr1, ttbr1_el1);
	write_sysreg(ttbr0, ttbr0_el1);
	isb();
	post_ttbr_update_workaround();
}

> +	 * unchanged to preserve the ASID rollover bookkeeping.
> +	 */
> +	if (mm == &init_mm) {
> +		cpu_do_switch_mm(__pa_symbol(reserved_pg_dir), mm);
> +		return;
> +	}
> +
>  	if (system_supports_cnp())
>  		cpu_set_reserved_ttbr0();
>  
> -- 
> 2.39.5 (Apple Git-154)
> 
