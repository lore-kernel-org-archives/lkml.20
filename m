Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A29C1B4F0A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 05:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788239744; cv=none; b=Ftvu35WVRZG4pcUsN2kFslknKYOLmnVCRsXT2qG+HGDRBhH1dQNfo1KsZO+xOCgbs3z0SLUo95qS6utlVbYKPDsm1c3E7ztHlcTqEhKFW6he9RjMttghlTHct0KtpxM3P90jLRYWfOVz31A9GFOkj3mvRL2hW7FAJ+yPQy+vJRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788239744; c=relaxed/simple;
	bh=wycDAd2ap7QleRv04ZFpC5VVWTnqOAbUkv4GSe+5sNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pSWYnItmZsYt2OWx0X+HaJ1h7KMMBXW5o7R4SYJKqArKgjisga1Za84L5NZkCmolnynPT8/mPFc1cEbDRPpjfEx+QtlfajT2r5hZoz8uYgZj9nIAaspst0g/HSPYOFiszfMEpxnoE10+spYPMoHG+hRCIsjedaD4cqWittKWPxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gL1c/ygS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gL1c/ygS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DAC41F000E9;
	Tue,  1 Sep 2026 05:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788239742;
	bh=NvH7FVrJmFGaY1BsctNirSS3XvqZpLifDI5FmBgGlm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gL1c/ygShZUVdEsDIzB0sToG+QdX3z0/AJkvq5zkB6R/Mo70d/H9FfSIBneEZ/aha
	 sJ0TD8l/yOBSs6VH4DiGI06tYY++K8EtWnFX844yMfBLfx9auPfkv0fmwEsoBEpou3
	 zM42gyIxXBL4gt4lmG85bi0eKDI4y2IIXoNktpqLQYih/53+i5tYsvYTZ4wOAo/mLR
	 YdiKYN8MS+kFi2i04YxZlxA4Up7rtJ/8Jok5VbNiVV+4l00dTkUZRZg1kaj778t/S4
	 yLsyF6iQ8GGKMfWH3oyJkeb8Ua81QqB2anxKxANIuRpzSIiwUjZ2d0s1R9x6BShd3i
	 PM8k/lstwxAsg==
Date: Tue, 1 Sep 2026 12:55:56 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: introduce cap framework and use it to
 optimize pgtable_l4|l5_enabled
Message-ID: <apZa3EnjGjpaydGm@xhacker>
References: <20260830170414.4505-1-jszhang@kernel.org>
 <20260830170414.4505-4-jszhang@kernel.org>
 <20260831-falsify-arrogance-6917870b8596@spud>
 <apYafAJvKqz_hRzR@xhacker>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <apYafAJvKqz_hRzR@xhacker>

On Tue, Sep 01, 2026 at 08:21:16AM +0800, Jisheng Zhang wrote:
> On Mon, Aug 31, 2026 at 11:04:12PM +0100, Conor Dooley wrote:
> > On Mon, Aug 31, 2026 at 01:04:01AM +0800, Jisheng Zhang wrote:
> > > The pgtable_l4|[l5]_enabled check sits at hot code path, performance
> > > is impacted a lot. Since pgtable_l4|[l5]_enabled isn't changed after
> > > boot, we can use alternative mechanism to optimize them.
> > > 
> > > So the question is whether we can add RISCV_ISA_EXT_SV48/SV5 and use
> > > riscv_has_extension_*() or not. Although, per [1] and [2], SV48 and
> > > SV57 are ISA exensions too, RISCV_ISA_EXT_SV48/SV57 are to describe hw
> > > supported extensions, while this doesn't mean the pgtable_l4|l5 is
> > > enabled, for example, we may pass no5lvl/no4lvl kernel boot args or
> > > explicitly ask for SV39 by setting dt mmu-type property as
> > > "riscv,sv39". If we clear RISCV_ISA_EXT_SV48|SV57, then internal
> > > extension queries and potentially userspace reporting can no longer
> > > distinguish “unsupported” from “supported but disabled.”
> > 
> > That's the case for all extensions that the kernel does not support,
> > like if the fpu is disabled because the kernel doesn't have the
> > configuration option set. In fact, I think the CFI extensions are very
> 
> To be honest, before introduce the cap framework, I did think about FPU,
> ZACAS, ZABHA etc. ISA extensions' cases. Finally I came to a conclusion
> that the SV48/57 is a different case: Let me take FPU for an example.
> FPU once probed, the ISA support is never disabled, IOW, the
> riscv_has_extension_likely(FPU) is always true no matter the CONFIG_FPU
> is enabled or not. There's "no supported but disabled" case for FPU.
> But for SV48 case, that's different. The underlying HW may support SV48
> or SV57, but the "no5lvl and no4lvl" may explicitly force SV39, thus
> if we go with exisiting riscv_has_extension_*() API, we need to
> explicitly disable it by clear the isa bitmap. IOW, riscv_has_extension_likely(SV48)
> is false even the underlying HW supports SV48, thus the user can't
> distinguish between “unsupported” from “supported but disabled.”
> What do you think?

Other thoughts:

performance PoV: usually, an ISA extension improves the performance, so
there's no case where we clear the ISA bit map. But SV48/SV57 is
different, e.g on a board w/ only 4GB DDR but the cpu supports SV57,
there's no reason to enable SV57 which impacts performance a bit. This
is the reason why no4lvl/no5lvl are introduced, AIUI.

other cap usage PoV: the cap can be used to replace various static
branch usage in arch/riscv, for example the fast_unaligned_access_speed_key
As is known, the static branch has some drawbacks.

So no matter which direction this series goes to, we need similar cap
framework. The key question is whether we can extend the
riscv_has_extension_*() to cover cpu/HW cap, and change its meaning a
bit from "the underlying HW supports the feature" to "the underlying HW
enables the feature".

or keep it only for ISA extensions only.

X86's X86_FEATURE_* take the first path, I.E it only means the feature
is enabled or disabled on current platform, but doesn't mean the current
platform HW supports the feature or not.

Any comments is appreciated.

> 
> > similar here, because they also have riscv_nousercfi command line
> 
> This is another story, neither CPU ISA extension nor CPU capbility.
> 
> > options that can disable them.
> > If that's the reason for making a new-but-similar mechanism, I think you
> > should just introduce RISCV_ISA_EXT_SV{48,57} and use that.
> > 
> > Cheers,
> > Conor.
> > 
> > > 
> > > Introduce cap framework to describe the capabilities selected by
> > > kernel. It also uses similar alternatives mechanism as the
> > > riscv_has_extension_*() helpers.
> > > 
> > > After that, use it to optimize pgtable_l4|l5_enabled.
> > > 
> > > For the typical access_ok(addr, 1);
> > > before the patch:
> > > 
> > > ...
> > > auipc	a5,0xb43
> > > lbu	a5,100(a5) # ffffffff80b51f68 <pgtable_l5_enabled>
> > > bnez	a5,ffffffff8000ef46 <foo+0x56>
> > > auipc	a5,0xb43
> > > lbu	a5,91(a5) # ffffffff80b51f69 <pgtable_l4_enabled>
> > > beqz	a5,ffffffff8000ef5a <foo+0x6a>
> > > ...
> > > 
> > > after the patch:
> > > there are only two j or nop instructions which avoid memory load and
> > > test branch.
> > > 
> > > Initial test lmbench's lat_syscall write on TH1520 platforms shows that
> > > the write syscall latency is reduced by about 2.38%.
> > > 
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > Link: https://github.com/riscv/riscv-isa-manual/blob/main/src/profiles/profiles.adoc [1]
> > > Link: https://riscv.atlassian.net/wiki/spaces/HOME/pages/16154732/Ratified+ISA+Extensions [2]
> > > ---
> > >  arch/riscv/Kconfig                         |  1 +
> > >  arch/riscv/include/asm/alternative.h       |  2 +-
> > >  arch/riscv/include/asm/cpufeature-macros.h | 46 ++++++++++++++++++++++
> > >  arch/riscv/include/asm/cpufeature.h        |  2 +
> > >  arch/riscv/include/asm/hwcap.h             |  6 +++
> > >  arch/riscv/include/asm/pgtable-64.h        | 12 ++++++
> > >  arch/riscv/kernel/alternative.c            | 24 +++++++----
> > >  arch/riscv/kernel/cpufeature.c             | 41 +++++++++++++++----
> > >  arch/riscv/mm/init.c                       |  9 +++++
> > >  9 files changed, 128 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index 13b7bb77087e..e9476b8cbeb0 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -218,6 +218,7 @@ config RISCV
> > >  	select PCI_ECAM if (ACPI && PCI)
> > >  	select PCI_MSI if PCI
> > >  	select RELOCATABLE if !MMU && !PHYS_RAM_BASE_FIXED
> > > +	select RISCV_ALTERNATIVE_EARLY if 64BIT
> > >  	select RISCV_APLIC
> > >  	select RISCV_IMSIC
> > >  	select RISCV_INTC
> > > diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
> > > index 688c7d1a9ae3..6be7b2b6ade9 100644
> > > --- a/arch/riscv/include/asm/alternative.h
> > > +++ b/arch/riscv/include/asm/alternative.h
> > > @@ -33,7 +33,7 @@ void __init apply_early_boot_alternatives(void);
> > >  void apply_module_alternatives(void *start, size_t length);
> > >  
> > >  void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
> > > -				   int patch_offset);
> > > +				   int patch_offset, bool early);
> > >  
> > >  struct alt_entry {
> > >  	s32 old_offset;		/* offset relative to original instruction or data  */
> > > diff --git a/arch/riscv/include/asm/cpufeature-macros.h b/arch/riscv/include/asm/cpufeature-macros.h
> > > index adaf9e3fb25c..dca320e7e88c 100644
> > > --- a/arch/riscv/include/asm/cpufeature-macros.h
> > > +++ b/arch/riscv/include/asm/cpufeature-macros.h
> > > @@ -1,6 +1,7 @@
> > >  /* SPDX-License-Identifier: GPL-2.0-only */
> > >  /*
> > >   * Copyright 2022-2024 Rivos, Inc
> > > + * Copyright 2026 Jisheng Zhang <jszhang@kernel.org>
> > >   */
> > >  
> > >  #ifndef _ASM_CPUFEATURE_MACROS_H
> > > @@ -57,4 +58,49 @@ static __always_inline bool riscv_has_extension_likely(const unsigned long ext)
> > >  	return __riscv_has_extension_likely(STANDARD_EXT, ext);
> > >  }
> > >  
> > > +static __always_inline bool __riscv_has_cap_likely(const unsigned long cap)
> > > +{
> > > +	asm goto(ALTERNATIVE("j	%l[l_no]", "nop", 0, %[cap], 1)
> > > +	:
> > > +	: [cap] "i" (cap)
> > > +	:
> > > +	: l_no);
> > > +
> > > +	return true;
> > > +l_no:
> > > +	return false;
> > > +}
> > > +
> > > +static __always_inline bool __riscv_has_cap_unlikely(const unsigned long cap)
> > > +{
> > > +
> > > +	asm goto(ALTERNATIVE("nop", "j	%l[l_yes]", 0, %[cap], 1)
> > > +	:
> > > +	: [cap] "i" (cap)
> > > +	:
> > > +	: l_yes);
> > > +
> > > +	return false;
> > > +l_yes:
> > > +	return true;
> > > +}
> > > +
> > > +static __always_inline bool riscv_has_cap_unlikely(const unsigned long cap)
> > > +{
> > > +	compiletime_assert(cap >= RISCV_ISA_EXT_MAX &&
> > > +			   cap < RISCV_CAP_MAX,
> > > +			   "cap must be >= RISCV_ISA_EXT_MAX and < RISCV_CAP_MAX");
> > > +
> > > +	return __riscv_has_cap_unlikely(cap);
> > > +}
> > > +
> > > +static __always_inline bool riscv_has_cap_likely(const unsigned long cap)
> > > +{
> > > +	compiletime_assert(cap >= RISCV_ISA_EXT_MAX &&
> > > +			   cap < RISCV_CAP_MAX,
> > > +			   "cap must be >= RISCV_ISA_EXT_MAX and < RISCV_CAP_MAX");
> > > +
> > > +	return __riscv_has_cap_likely(cap);
> > > +}
> > > +
> > >  #endif /* _ASM_CPUFEATURE_MACROS_H */
> > > diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> > > index 37c9f2a0fb54..50453586558e 100644
> > > --- a/arch/riscv/include/asm/cpufeature.h
> > > +++ b/arch/riscv/include/asm/cpufeature.h
> > > @@ -36,6 +36,8 @@ extern const struct seq_operations cpuinfo_op;
> > >  /* Per-cpu ISA extensions. */
> > >  extern struct riscv_isainfo hart_isa[NR_CPUS];
> > >  
> > > +extern DECLARE_BITMAP(riscv_cap, RISCV_CAP_MAX - RISCV_ISA_EXT_MAX);
> > > +
> > >  extern u32 thead_vlenb_of;
> > >  
> > >  void __init riscv_user_isa_enable(void);
> > > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > > index f8db798b2654..4a3e2c43afc4 100644
> > > --- a/arch/riscv/include/asm/hwcap.h
> > > +++ b/arch/riscv/include/asm/hwcap.h
> > > @@ -128,6 +128,12 @@
> > >  #define RISCV_ISA_EXT_MAX		128
> > >  #define RISCV_ISA_EXT_INVALID		U32_MAX
> > >  
> > > +/* Kernel capabilities occupy the gap below vendor alternative IDs. */
> > > +#define RISCV_CAP_PGTABLE_L4		RISCV_ISA_EXT_MAX
> > > +#define RISCV_CAP_PGTABLE_L5		(RISCV_ISA_EXT_MAX + 1)
> > > +#define RISCV_CAP_EARLY_MAX		(RISCV_ISA_EXT_MAX + 2)
> > > +#define RISCV_CAP_MAX			RISCV_CAP_EARLY_MAX
> > > +
> > >  #ifdef CONFIG_RISCV_M_MODE
> > >  #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
> > >  #define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SMNPM
> > > diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> > > index 72b8c63469fa..b0f59e3d5c31 100644
> > > --- a/arch/riscv/include/asm/pgtable-64.h
> > > +++ b/arch/riscv/include/asm/pgtable-64.h
> > > @@ -13,6 +13,7 @@
> > >  extern bool _pgtable_l4_enabled;
> > >  extern bool _pgtable_l5_enabled;
> > >  
> > > +#ifdef USE_EARLY_PGTABLE_LEVELS
> > >  static __always_inline bool pgtable_l5_enabled(void)
> > >  {
> > >  	return _pgtable_l5_enabled;
> > > @@ -22,6 +23,17 @@ static __always_inline bool pgtable_l4_enabled(void)
> > >  {
> > >  	return _pgtable_l4_enabled;
> > >  }
> > > +#else
> > > +static __always_inline bool pgtable_l4_enabled(void)
> > > +{
> > > +	return riscv_has_cap_likely(RISCV_CAP_PGTABLE_L4);
> > > +}
> > > +
> > > +static __always_inline bool pgtable_l5_enabled(void)
> > > +{
> > > +	return riscv_has_cap_likely(RISCV_CAP_PGTABLE_L5);
> > > +}
> > > +#endif
> > >  
> > >  #define PGDIR_SHIFT_L3  30
> > >  #define PGDIR_SHIFT_L4  39
> > > diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
> > > index c0c9306022c5..bbb215349452 100644
> > > --- a/arch/riscv/kernel/alternative.c
> > > +++ b/arch/riscv/kernel/alternative.c
> > > @@ -75,7 +75,8 @@ static u32 riscv_instruction_at(void *p)
> > >  }
> > >  
> > >  static void riscv_alternative_fix_auipc_jalr(void *ptr, u32 auipc_insn,
> > > -					     u32 jalr_insn, int patch_offset)
> > > +					     u32 jalr_insn, int patch_offset,
> > > +					     bool early)
> > >  {
> > >  	u32 call[2] = { auipc_insn, jalr_insn };
> > >  	s32 imm;
> > > @@ -88,10 +89,15 @@ static void riscv_alternative_fix_auipc_jalr(void *ptr, u32 auipc_insn,
> > >  	riscv_insn_insert_utype_itype_imm(&call[0], &call[1], imm);
> > >  
> > >  	/* patch the call place again */
> > > -	patch_text_nosync(ptr, call, sizeof(u32) * 2);
> > > +	if (early) {
> > > +		memcpy(ptr, call, sizeof(call));
> > > +	} else {
> > > +		patch_text_nosync(ptr, call, sizeof(call));
> > > +	}
> > >  }
> > >  
> > > -static void riscv_alternative_fix_jal(void *ptr, u32 jal_insn, int patch_offset)
> > > +static void riscv_alternative_fix_jal(void *ptr, u32 jal_insn, int patch_offset,
> > > +				      bool early)
> > >  {
> > >  	s32 imm;
> > >  
> > > @@ -103,11 +109,14 @@ static void riscv_alternative_fix_jal(void *ptr, u32 jal_insn, int patch_offset)
> > >  	riscv_insn_insert_jtype_imm(&jal_insn, imm);
> > >  
> > >  	/* patch the call place again */
> > > -	patch_text_nosync(ptr, &jal_insn, sizeof(u32));
> > > +	if (early)
> > > +		memcpy(ptr, &jal_insn, sizeof(u32));
> > > +	else
> > > +		patch_text_nosync(ptr, &jal_insn, sizeof(u32));
> > >  }
> > >  
> > >  void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
> > > -				      int patch_offset)
> > > +				   int patch_offset, bool early)
> > >  {
> > >  	int num_insn = len / sizeof(u32);
> > >  	int i;
> > > @@ -131,7 +140,8 @@ void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
> > >  				continue;
> > >  
> > >  			riscv_alternative_fix_auipc_jalr(alt_ptr + i * sizeof(u32),
> > > -							 insn, insn2, patch_offset);
> > > +							 insn, insn2, patch_offset,
> > > +							 early);
> > >  			i++;
> > >  		}
> > >  
> > > @@ -144,7 +154,7 @@ void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
> > >  				continue;
> > >  
> > >  			riscv_alternative_fix_jal(alt_ptr + i * sizeof(u32),
> > > -						  insn, patch_offset);
> > > +						  insn, patch_offset, early);
> > >  		}
> > >  	}
> > >  }
> > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > > index 9915121e9438..9b47fea25ee4 100644
> > > --- a/arch/riscv/kernel/cpufeature.c
> > > +++ b/arch/riscv/kernel/cpufeature.c
> > > @@ -40,6 +40,7 @@ unsigned long elf_hwcap __read_mostly;
> > >  
> > >  /* Host ISA bitmap */
> > >  static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
> > > +DECLARE_BITMAP(riscv_cap, RISCV_CAP_MAX - RISCV_ISA_EXT_MAX) __read_mostly;
> > >  
> > >  /* Per-cpu ISA extensions. */
> > >  struct riscv_isainfo hart_isa[NR_CPUS];
> > > @@ -81,6 +82,14 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, unsigned i
> > >  }
> > >  EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
> > >  
> > > +static bool __riscv_cap_available(unsigned int bit)
> > > +{
> > > +	if (bit >= RISCV_CAP_MAX || bit < RISCV_ISA_EXT_MAX)
> > > +		return false;
> > > +
> > > +	return test_bit(bit - RISCV_ISA_EXT_MAX, riscv_cap);
> > > +}
> > > +
> > >  static int riscv_ext_f_depends(const struct riscv_isa_ext_data *data,
> > >  			       const unsigned long *isa_bitmap)
> > >  {
> > > @@ -1257,9 +1266,7 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
> > >  	struct alt_entry *alt;
> > >  	void *oldptr, *altptr;
> > >  	u16 id, value, vendor;
> > > -
> > > -	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> > > -		return;
> > > +	bool early = stage == RISCV_ALTERNATIVES_EARLY_BOOT;
> > >  
> > >  	for (alt = begin; alt < end; alt++) {
> > >  		id = PATCH_ID_CPUFEATURE_ID(alt->patch_id);
> > > @@ -1274,6 +1281,8 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
> > >  		 * vendor extension.
> > >  		 */
> > >  		if (id < RISCV_ISA_EXT_MAX) {
> > > +			if (early)
> > > +				continue;
> > >  			/*
> > >  			 * This patch should be treated as errata so skip
> > >  			 * processing here.
> > > @@ -1287,7 +1296,14 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
> > >  			value = PATCH_ID_CPUFEATURE_VALUE(alt->patch_id);
> > >  			if (!riscv_cpufeature_patch_check(id, value))
> > >  				continue;
> > > +		} else if (id < RISCV_CAP_MAX) {
> > > +			if (id >= RISCV_CAP_EARLY_MAX && early)
> > > +				continue;
> > > +			if (!__riscv_cap_available(id))
> > > +				continue;
> > >  		} else if (id >= RISCV_VENDOR_EXT_ALTERNATIVES_BASE) {
> > > +			if (early)
> > > +				continue;
> > >  			if (!__riscv_isa_vendor_extension_available(VENDOR_EXT_ALL_CPUS, vendor,
> > >  								    id - RISCV_VENDOR_EXT_ALTERNATIVES_BASE))
> > >  				continue;
> > > @@ -1299,9 +1315,20 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
> > >  		oldptr = ALT_OLD_PTR(alt);
> > >  		altptr = ALT_ALT_PTR(alt);
> > >  
> > > -		mutex_lock(&text_mutex);
> > > -		patch_text_nosync(oldptr, altptr, alt->alt_len);
> > > -		riscv_alternative_fix_offsets(oldptr, alt->alt_len, oldptr - altptr);
> > > -		mutex_unlock(&text_mutex);
> > > +		if (early) {
> > > +			/* oldptr is writable through the MMU-off kernel mapping. */
> > > +			memcpy(oldptr, altptr, alt->alt_len);
> > > +			riscv_alternative_fix_offsets(oldptr, alt->alt_len,
> > > +						      oldptr - altptr, true);
> > > +		} else {
> > > +			mutex_lock(&text_mutex);
> > > +			patch_text_nosync(oldptr, altptr, alt->alt_len);
> > > +			riscv_alternative_fix_offsets(oldptr, alt->alt_len,
> > > +						      oldptr - altptr, false);
> > > +			mutex_unlock(&text_mutex);
> > > +		}
> > >  	}
> > > +
> > > +	if (early)
> > > +		local_flush_icache_all();
> > >  }
> > > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > > index fc74142fe6e6..aca09992ef06 100644
> > > --- a/arch/riscv/mm/init.c
> > > +++ b/arch/riscv/mm/init.c
> > > @@ -6,6 +6,11 @@
> > >   *  Nick Kossifidis <mick@ics.forth.gr>
> > >   */
> > >  
> > > +#ifdef CONFIG_64BIT
> > > +/* riscv_has_cap_likely() cannot be used this early */
> > > +#define USE_EARLY_PGTABLE_LEVELS
> > > +#endif
> > > +
> > >  #include <linux/init.h>
> > >  #include <linux/mm.h>
> > >  #include <linux/memblock.h>
> > > @@ -892,6 +897,10 @@ static __init void set_satp_mode(uintptr_t dtb_pa)
> > >  	memset(early_p4d, 0, PAGE_SIZE);
> > >  	memset(early_pud, 0, PAGE_SIZE);
> > >  	memset(early_pmd, 0, PAGE_SIZE);
> > > +	if (pgtable_l4_enabled())
> > > +		set_bit(RISCV_CAP_PGTABLE_L4 - RISCV_ISA_EXT_MAX, riscv_cap);
> > > +	if (pgtable_l5_enabled())
> > > +		set_bit(RISCV_CAP_PGTABLE_L5 - RISCV_ISA_EXT_MAX, riscv_cap);
> > >  }
> > >  #endif
> > >  
> > > -- 
> > > 2.53.0
> > > 
> 
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
