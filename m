Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FA137DAA9
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791445534; cv=none; b=Lj2T243IN+6QvOfWCBY1PWkeDR2TYcwClsx0XrRwTZ13j11C0dUiipnPoe/v6Okn+0mT1DwRIG+1Wzsv2GwJXXqEqLxCiSV3BH7KcCnnRRuVAYLGhcoffx4vh6NBwX8u7olLvdHl7i0Z0VHiO1xnI6SZC3uH1ojSOP6X3Dxybc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791445534; c=relaxed/simple;
	bh=03viI/wUOKtD0driVBrAMfFHQccwqyii1jrpW5FoCRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ubZqCNaOIqF/W3PZkF6WDrY71+ALx0uSFIqY+/gbpggHeovDhOhlpokVJpNmHz3Ew+eMFOO8rprwr8ajA/Pe358t00cP39MBuqxpeScl6oOPgDvE00mfgpHGDt5U9shXA19fbX8Iu6EMUbBEa6h2GEbMR0ne1EmpTqv6cllusRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=Sgvf7B59; arc=none smtp.client-ip=113.46.200.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="Sgvf7B59"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=JgMaUazBcpqvux2KQDW+vhUXwrg8xsyRivF3+Hr/oNo=;
	b=Sgvf7B59ydpF9D5jY+B+heyPb50E82OAtETzIJuBlsByFUHSTjmArd7xNCixSIXjb0p2MggUx
	WFV/UHdLl+c/mjnY4tQiOubY8pSnKYKq9W23opyxq2rRwEJ9jqATT3O/gCpI9ICn9RGuJQ3YfiR
	oAhr8bQc9hfeeO7iDVRzG8g=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4j0hYl4FHDznTVd;
	Thu,  8 Oct 2026 15:33:31 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 63B504055B;
	Thu,  8 Oct 2026 15:45:27 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 8 Oct
 2026 15:45:26 +0800
Message-ID: <fcecf50e-6b0d-4441-a188-31074c8b099a@huawei.com>
Date: Thu, 8 Oct 2026 15:45:25 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/21] KVM: arm64: Protect TPIDRRO_EL0 across guest
 entry/exit
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Ard
 Biesheuvel <ardb@kernel.org>, Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	David Hildenbrand <david@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Mostafa Saleh <smostafa@google.com>, Lorenzo
 Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Linus Walleij
	<linusw@kernel.org>, Marc Zyngier <maz@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-6-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260918161407.2300-6-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/19 0:13, Will Deacon 写道:
> From: Mostafa Saleh <smostafa@google.com>
> 
> To prepare for using TPIDRRO_EL0 to hold 'current' and repurposing
> SP_EL0 as an overflow stack pointer, eagerly switch both registers when
> entering and exiting the guest.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_asm.h           | 10 ++++++++++
>  arch/arm64/kernel/asm-offsets.c            |  1 +
>  arch/arm64/kvm/hyp/entry.S                 | 12 ++++++++----
>  arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h |  2 --
>  4 files changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index e5b92ac09e69..1cfe9216a2ff 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -408,6 +408,16 @@ void __noreturn __cold nvhe_hyp_panic_handler(u64 esr, u64 spsr, u64 elr_virt,
>  	msr	sp_el0, \tmp
>  .endm
>  
> +.macro save_tpidrro_el0 ctxt, tmp
> +	mrs	\tmp,	tpidrro_el0
> +	str	\tmp,	[\ctxt, #CPU_TPIDRRO_EL0_OFFSET]
> +.endm
> +
> +.macro restore_tpidrro_el0 ctxt, tmp
> +	ldr	\tmp,	  [\ctxt, #CPU_TPIDRRO_EL0_OFFSET]
> +	msr	tpidrro_el0, \tmp
> +.endm
> +
>  #endif
>  
>  #endif /* __ARM_KVM_ASM_H__ */
> diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
> index 6038ab3beb25..cb8448cc5f51 100644
> --- a/arch/arm64/kernel/asm-offsets.c
> +++ b/arch/arm64/kernel/asm-offsets.c
> @@ -108,6 +108,7 @@ int main(void)
>    DEFINE(VCPU_HCR_EL2,		offsetof(struct kvm_vcpu, arch.hcr_el2));
>    DEFINE(CPU_USER_PT_REGS,	offsetof(struct kvm_cpu_context, regs));
>    DEFINE(CPU_ELR_EL2,		offsetof(struct kvm_cpu_context, sys_regs[ELR_EL2]));
> +  DEFINE(CPU_TPIDRRO_EL0_OFFSET, offsetof(struct kvm_cpu_context, sys_regs[TPIDRRO_EL0]));
>    DEFINE(CPU_RGSR_EL1,		offsetof(struct kvm_cpu_context, sys_regs[RGSR_EL1]));
>    DEFINE(CPU_GCR_EL1,		offsetof(struct kvm_cpu_context, sys_regs[GCR_EL1]));
>    DEFINE(CPU_APIAKEYLO_EL1,	offsetof(struct kvm_cpu_context, sys_regs[APIAKEYLO_EL1]));
> diff --git a/arch/arm64/kvm/hyp/entry.S b/arch/arm64/kvm/hyp/entry.S
> index 308100ed25de..4c89931a6a92 100644
> --- a/arch/arm64/kvm/hyp/entry.S
> +++ b/arch/arm64/kvm/hyp/entry.S
> @@ -30,8 +30,9 @@ SYM_FUNC_START(__guest_enter)
>  	// Store the hyp regs
>  	save_callee_saved_regs x1
>  
> -	// Save hyp's sp_el0
> +	// Save hyp's sp_el0 and tpidrro_el0
>  	save_sp_el0	x1, x2
> +	save_tpidrro_el0 x1, x2
>  
>  	// Now the hyp state is stored if we have a pending RAS SError it must
>  	// affect the host or hyp. If any asynchronous exception is pending we
> @@ -66,8 +67,9 @@ alternative_else_nop_endif
>  	// when this feature is enabled for kernel code.
>  	ptrauth_switch_to_guest x29, x0, x1, x2
>  
> -	// Restore the guest's sp_el0
> +	// Restore the guest's sp_el0 and tpidrro_el0
>  	restore_sp_el0 x29, x0
> +	restore_tpidrro_el0 x29, x0
>  
>  	// Restore guest regs x0-x17
>  	ldp	x0, x1,   [x29, #CPU_XREG_OFFSET(0)]
> @@ -146,8 +148,9 @@ SYM_INNER_LABEL(__guest_exit, SYM_L_GLOBAL)
>  	// Store the guest regs x18-x29, lr
>  	save_callee_saved_regs x1
>  
> -	// Store the guest's sp_el0
> +	// Store the guest's sp_el0 and tpidrro_el0
>  	save_sp_el0	x1, x2
> +	save_tpidrro_el0 x1, x2
>  
>  	adr_this_cpu x2, kvm_hyp_ctxt, x3
>  
> @@ -161,8 +164,9 @@ SYM_INNER_LABEL(__guest_exit, SYM_L_GLOBAL)
>  	// mte_switch_to_hyp(g_ctxt, h_ctxt, reg1)
>  	mte_switch_to_hyp x1, x2, x3
>  
> -	// Restore hyp's sp_el0
> +	// Restore hyp's sp_el0 and tpidrro_el0
>  	restore_sp_el0 x2, x3
> +	restore_tpidrro_el0 x2, x3

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  
>  	// Now restore the hyp regs
>  	restore_callee_saved_regs x2
> diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> index c382848d3194..b5f7ef8e6371 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> @@ -66,7 +66,6 @@ static inline void __sysreg_save_common_state(struct kvm_cpu_context *ctxt)
>  static inline void __sysreg_save_user_state(struct kvm_cpu_context *ctxt)
>  {
>  	ctxt_sys_reg(ctxt, TPIDR_EL0)	= read_sysreg(tpidr_el0);
> -	ctxt_sys_reg(ctxt, TPIDRRO_EL0)	= read_sysreg(tpidrro_el0);
>  }
>  
>  static inline bool ctxt_has_mte(struct kvm_cpu_context *ctxt)
> @@ -209,7 +208,6 @@ static inline void __sysreg_restore_common_state(struct kvm_cpu_context *ctxt)
>  static inline void __sysreg_restore_user_state(struct kvm_cpu_context *ctxt)
>  {
>  	write_sysreg(ctxt_sys_reg(ctxt, TPIDR_EL0),	tpidr_el0);
> -	write_sysreg(ctxt_sys_reg(ctxt, TPIDRRO_EL0),	tpidrro_el0);
>  }
>  
>  static inline void __sysreg_restore_el1_state(struct kvm_cpu_context *ctxt,

-- 
Best regards,
Jinjie

