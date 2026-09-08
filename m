Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E97355055
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 04:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788840206; cv=none; b=COxApugblXcxK0XTiOj0mW7P3bJRzFRY8b7RY2JLVpfFCI5Y3MGecvYXqbQN/LYsLoJkU569ZIwNnegOq39pzuQL13nChIidED6fK2/0l40FYiPBSCigm1dox6YGy2vC1+wS9T5EV9HipFxlb15z7jd1Qj/sGWmwjU2YmKyhGQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788840206; c=relaxed/simple;
	bh=vv2g/lDiXldupiu44hTxEOD6eWOBYaTOpgWAEiBVJ3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYKsYLTBWBkJNuN88uDpvQbpxk/z2TYsbljQhLjpLs3MiY4BxtLR3hGPvtJime3CP/XyAiNbSNZdTYBL36anCa4G0JfJYirEkpJXTPrZZ2j3508h2aKGVjiRmEy8az6XqwKc17/NW3maHmFt71nYHtr/mX3TSpblyOsZnukfhmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JAoVslxz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JAoVslxz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 048EE1F00A3A;
	Tue,  8 Sep 2026 04:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788840204;
	bh=so+QTs3xtfuu2O56qOQPSh9LomXZ/FrylcXf/Zd4fK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JAoVslxz+TiJRhQMJMzp01nOMTgVKW6v43wl4XfeukIDrwV90nqduSQ/6zTnHwekC
	 QLSGjZ2QHtDBJtjuGYgFkimIuJIleD2PYXFRQQJFJjb//TazBOMY5tg4hD/sN/DCc6
	 E43AHmp9K4FBSGf0MfTMFPfJjMjfTPkIB50XwsafeUbsjXUQ2ukPFBGDFqJqPdu1CS
	 p8wt2L/bjENXUx9+Z9Td2wG4d5Ow8XLNdpZqINduUqY3mg57+umPJnpRwaSHgvU3Nd
	 /vFMvRZLD6eJlMet0z74EFaFDbFq0zCaL0Q7k0ttjgMNDjLINKmFHmlBVNg0j3pDAt
	 V9pRL9LsBbhxg==
Date: Tue, 8 Sep 2026 11:43:35 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com
Subject: Re: [PATCH v2 3/5] riscv: support early isa ext and use it to
 optimize pgtable_l4|l5_enabled
Message-ID: <ap-EZ-rb7RJ5ykmG@xhacker>
References: <20260907151437.7603-1-jszhang@kernel.org>
 <20260907151437.7603-4-jszhang@kernel.org>
 <20260907-smashup-darn-93d1ee105a57@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260907-smashup-darn-93d1ee105a57@spud>

On Mon, Sep 07, 2026 at 05:39:02PM +0100, Conor Dooley wrote:
> On Mon, Sep 07, 2026 at 11:14:35PM +0800, Jisheng Zhang wrote:
> > The pgtable_l4|[l5]_enabled check sits at hot code path, performance
> > is impacted a lot. Since pgtable_l4|[l5]_enabled isn't changed after
> > boot, we can use alternative mechanism to optimize them.
> > 
> > So the question is whether we can add RISCV_ISA_EXT_SV48/SV5 and use
> > riscv_has_extension_*() or not. Per [1] and [2], SV48 and SV57 are ISA
> > exensions too. From another side, riscv_has_extension_[un]likely() and
> > other related functions report whether the extension is supported and
> > enabled on the platform. So SV48 and SV57 can be supported with current
> > isa extension alternative mechanism.
> > 
> > However, to use it to optimize pgtable_l4|l5_enabled, we have support
> > the "early" characteristic, I.E besides risc_isa bitmap setting, we
> > need to support appling alternative early before MMU on.
> > 
> > After that, use it to optimize pgtable_l4|l5_enabled.
> > 
> > For the typical access_ok(addr, 1);
> > before the patch:
> > 
> > ...
> > auipc	a5,0xb43
> > lbu	a5,100(a5) # ffffffff80b51f68 <pgtable_l5_enabled>
> > bnez	a5,ffffffff8000ef46 <foo+0x56>
> > auipc	a5,0xb43
> > lbu	a5,91(a5) # ffffffff80b51f69 <pgtable_l4_enabled>
> > beqz	a5,ffffffff8000ef5a <foo+0x6a>
> > ...
> > 
> > after the patch:
> > These memory load and test branch instructions are replaced with only
> > two j or nop instructions.
> > 
> > Initial test lmbench's lat_syscall write on TH1520 platforms shows that
> > the write syscall latency is reduced by about 2.38%.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > Link: https://github.com/riscv/riscv-isa-manual/blob/main/src/profiles/profiles.adoc [1]
> > Link: https://riscv.atlassian.net/wiki/spaces/HOME/pages/16154732/Ratified+ISA+Extensions [2]
> > ---
> >  arch/riscv/Kconfig                   |  1 +
> >  arch/riscv/include/asm/alternative.h |  2 +-
> >  arch/riscv/include/asm/cpufeature.h  |  2 +
> >  arch/riscv/include/asm/hwcap.h       |  2 +
> >  arch/riscv/include/asm/pgtable-64.h  | 12 ++++++
> >  arch/riscv/kernel/alternative.c      | 24 +++++++----
> >  arch/riscv/kernel/cpufeature.c       | 60 ++++++++++++++++++++++------
> >  arch/riscv/mm/init.c                 |  9 +++++
> >  8 files changed, 91 insertions(+), 21 deletions(-)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 13b7bb77087e..e9476b8cbeb0 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -218,6 +218,7 @@ config RISCV
> >  	select PCI_ECAM if (ACPI && PCI)
> >  	select PCI_MSI if PCI
> >  	select RELOCATABLE if !MMU && !PHYS_RAM_BASE_FIXED
> > +	select RISCV_ALTERNATIVE_EARLY if 64BIT
> >  	select RISCV_APLIC
> >  	select RISCV_IMSIC
> >  	select RISCV_INTC
> > diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
> > index 688c7d1a9ae3..6be7b2b6ade9 100644
> > --- a/arch/riscv/include/asm/alternative.h
> > +++ b/arch/riscv/include/asm/alternative.h
> > @@ -33,7 +33,7 @@ void __init apply_early_boot_alternatives(void);
> >  void apply_module_alternatives(void *start, size_t length);
> >  
> >  void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
> > -				   int patch_offset);
> > +				   int patch_offset, bool early);
> >  
> >  struct alt_entry {
> >  	s32 old_offset;		/* offset relative to original instruction or data  */
> > diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> > index 37c9f2a0fb54..af18ba93f580 100644
> > --- a/arch/riscv/include/asm/cpufeature.h
> > +++ b/arch/riscv/include/asm/cpufeature.h
> > @@ -36,6 +36,8 @@ extern const struct seq_operations cpuinfo_op;
> >  /* Per-cpu ISA extensions. */
> >  extern struct riscv_isainfo hart_isa[NR_CPUS];
> >  
> > +extern DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX);
> > +
> >  extern u32 thead_vlenb_of;
> >  
> >  void __init riscv_user_isa_enable(void);
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > index f8db798b2654..b6d50025cb79 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -122,6 +122,8 @@
> >  #define RISCV_ISA_EXT_ZICCAMOA		113
> >  #define RISCV_ISA_EXT_ZICCIF		114
> >  #define RISCV_ISA_EXT_ZA64RS		115
> > +#define RISCV_ISA_EXT_SV48		116
> > +#define RISCV_ISA_EXT_SV57		117
> >  
> >  #define RISCV_ISA_EXT_XLINUXENVCFG	127
> >  
> > diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> > index 72b8c63469fa..7e30ec0e9f6c 100644
> > --- a/arch/riscv/include/asm/pgtable-64.h
> > +++ b/arch/riscv/include/asm/pgtable-64.h
> > @@ -13,6 +13,7 @@
> >  extern bool _pgtable_l4_enabled;
> >  extern bool _pgtable_l5_enabled;
> >  
> > +#ifdef USE_EARLY_PGTABLE_LEVELS
> >  static __always_inline bool pgtable_l5_enabled(void)
> >  {
> >  	return _pgtable_l5_enabled;
> > @@ -22,6 +23,17 @@ static __always_inline bool pgtable_l4_enabled(void)
> >  {
> >  	return _pgtable_l4_enabled;
> >  }
> > +#else
> > +static __always_inline bool pgtable_l4_enabled(void)
> > +{
> > +	return riscv_has_extension_likely(RISCV_ISA_EXT_SV48);
> > +}
> > +
> > +static __always_inline bool pgtable_l5_enabled(void)
> > +{
> > +	return riscv_has_extension_likely(RISCV_ISA_EXT_SV57);
> > +}
> > +#endif
> >  
> >  #define PGDIR_SHIFT_L3  30
> >  #define PGDIR_SHIFT_L4  39
> > diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
> > index c0c9306022c5..bbb215349452 100644
> > --- a/arch/riscv/kernel/alternative.c
> > +++ b/arch/riscv/kernel/alternative.c
> > @@ -75,7 +75,8 @@ static u32 riscv_instruction_at(void *p)
> >  }
> >  
> >  static void riscv_alternative_fix_auipc_jalr(void *ptr, u32 auipc_insn,
> > -					     u32 jalr_insn, int patch_offset)
> > +					     u32 jalr_insn, int patch_offset,
> > +					     bool early)
> >  {
> >  	u32 call[2] = { auipc_insn, jalr_insn };
> >  	s32 imm;
> > @@ -88,10 +89,15 @@ static void riscv_alternative_fix_auipc_jalr(void *ptr, u32 auipc_insn,
> >  	riscv_insn_insert_utype_itype_imm(&call[0], &call[1], imm);
> >  
> >  	/* patch the call place again */
> > -	patch_text_nosync(ptr, call, sizeof(u32) * 2);
> > +	if (early) {
> > +		memcpy(ptr, call, sizeof(call));
> > +	} else {
> > +		patch_text_nosync(ptr, call, sizeof(call));
> > +	}
> >  }
> >  
> > -static void riscv_alternative_fix_jal(void *ptr, u32 jal_insn, int patch_offset)
> > +static void riscv_alternative_fix_jal(void *ptr, u32 jal_insn, int patch_offset,
> > +				      bool early)
> >  {
> >  	s32 imm;
> >  
> > @@ -103,11 +109,14 @@ static void riscv_alternative_fix_jal(void *ptr, u32 jal_insn, int patch_offset)
> >  	riscv_insn_insert_jtype_imm(&jal_insn, imm);
> >  
> >  	/* patch the call place again */
> > -	patch_text_nosync(ptr, &jal_insn, sizeof(u32));
> > +	if (early)
> > +		memcpy(ptr, &jal_insn, sizeof(u32));
> > +	else
> > +		patch_text_nosync(ptr, &jal_insn, sizeof(u32));
> >  }
> >  
> >  void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
> > -				      int patch_offset)
> > +				   int patch_offset, bool early)
> >  {
> >  	int num_insn = len / sizeof(u32);
> >  	int i;
> > @@ -131,7 +140,8 @@ void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
> >  				continue;
> >  
> >  			riscv_alternative_fix_auipc_jalr(alt_ptr + i * sizeof(u32),
> > -							 insn, insn2, patch_offset);
> > +							 insn, insn2, patch_offset,
> > +							 early);
> >  			i++;
> >  		}
> >  
> > @@ -144,7 +154,7 @@ void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
> >  				continue;
> >  
> >  			riscv_alternative_fix_jal(alt_ptr + i * sizeof(u32),
> > -						  insn, patch_offset);
> > +						  insn, patch_offset, early);
> >  		}
> >  	}
> >  }
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 9915121e9438..ce08e7f19e2d 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -39,7 +39,7 @@ static bool any_cpu_has_zicbom;
> >  unsigned long elf_hwcap __read_mostly;
> >  
> >  /* Host ISA bitmap */
> > -static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
> > +DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
> >  
> >  /* Per-cpu ISA extensions. */
> >  struct riscv_isainfo hart_isa[NR_CPUS];
> > @@ -624,6 +624,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
> >  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> >  	__RISCV_ISA_EXT_DATA(svrsw60t59b, RISCV_ISA_EXT_SVRSW60T59B),
> >  	__RISCV_ISA_EXT_DATA(svvptc, RISCV_ISA_EXT_SVVPTC),
> > +	__RISCV_ISA_EXT_DATA(sv48, RISCV_ISA_EXT_SV48),
> > +	__RISCV_ISA_EXT_DATA(sv57, RISCV_ISA_EXT_SV57),
> >  };
> >  
> >  const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
> > @@ -862,7 +864,8 @@ static void __init riscv_parse_isa_string(const char *isa, unsigned long *bitmap
> >  	}
> >  }
> >  
> > -static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
> > +static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap,
> > +						    unsigned long *riscv_isa_early)
> 
> All of the "early" business in this file seems overly complicated. Can
> we just do something like this?
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index d2ec96843456..46715a0255c1 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -922,6 +922,11 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
>  			set_bit(RISCV_ISA_EXT_ZIHPM, source_isa);
>  		}
>  
> +		if (_pgtable_l4_enabled)
> +			set_bit(RISCV_ISA_EXT_SV48, source_isa);
> +		if (_pgtable_l5_enabled)
> +			set_bit(RISCV_ISA_EXT_SV57, source_isa);
> +
>  		/*
>  		 * "V" in ISA strings is ambiguous in practice: it should mean
>  		 * just the standard V-1.0 but vendors aren't well behaved.
> @@ -1082,6 +1087,11 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
>  			riscv_isa_set_ext(ext, source_isa);
>  		}
>  
> +		if (_pgtable_l4_enabled)
> +			set_bit(RISCV_ISA_EXT_SV48, source_isa);
> +		if (_pgtable_l5_enabled)
> +			set_bit(RISCV_ISA_EXT_SV57, source_isa);
> +
>  		riscv_resolve_isa(source_isa, isainfo->isa, &this_hwcap, isa2hwcap);
>  		riscv_fill_cpu_vendor_ext(cpu_node, cpu);
> 
> The pagetable levels are the only thing we do this kind of early and
> probed detection for, adding a framework for them and only them that
> mostly just complicates the normal case seems rather excessive. Doing
> something simple like this is also quite explicit as to what's being

This assumes SV48 and SV57 are the only "early" users, but
other ISA ext may also need "early", who knows. So if future some extensions
need the "early", the code is ready, the author doesn't need to care about
the isa filling at all.

So I prefer my patch as is. What's your opinion?

> done and what the basis for it is.
> 
> Cheers,
> Conor.
> 
> >  {
> >  	struct device_node *node;
> >  	const char *isa;
> > @@ -933,6 +936,7 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
> >  		if (acpi_disabled && boot_vendorid == THEAD_VENDOR_ID && boot_archid == 0x0)
> >  			clear_bit(RISCV_ISA_EXT_V, source_isa);
> >  
> > +		bitmap_or(source_isa, source_isa, riscv_isa_early, RISCV_ISA_EXT_MAX);
> >  		riscv_resolve_isa(source_isa, isainfo->isa, &this_hwcap, isa2hwcap);
> >  
> >  		/*
> > @@ -1050,7 +1054,8 @@ static int has_thead_homogeneous_vlenb(void)
> >  	return 0;
> >  }
> >  
> > -static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
> > +static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap,
> > +						 unsigned long *riscv_isa_early)
> >  {
> >  	unsigned int cpu;
> >  	bool mitigated;
> > @@ -1082,6 +1087,7 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
> >  			riscv_isa_set_ext(ext, source_isa);
> >  		}
> >  
> > +		bitmap_or(source_isa, source_isa, riscv_isa_early, RISCV_ISA_EXT_MAX);
> >  		riscv_resolve_isa(source_isa, isainfo->isa, &this_hwcap, isa2hwcap);
> >  		riscv_fill_cpu_vendor_ext(cpu_node, cpu);
> >  
> > @@ -1137,6 +1143,7 @@ void __init riscv_fill_hwcap(void)
> >  {
> >  	char print_str[NUM_ALPHA_EXTS + 1];
> >  	unsigned long isa2hwcap[RISCV_ISA_EXT_BASE] = {0};
> > +	DECLARE_BITMAP(riscv_isa_early, RISCV_ISA_EXT_MAX);
> >  	int i, j;
> >  
> >  	isa2hwcap[RISCV_ISA_EXT_I] = COMPAT_HWCAP_ISA_I;
> > @@ -1147,14 +1154,17 @@ void __init riscv_fill_hwcap(void)
> >  	isa2hwcap[RISCV_ISA_EXT_C] = COMPAT_HWCAP_ISA_C;
> >  	isa2hwcap[RISCV_ISA_EXT_V] = COMPAT_HWCAP_ISA_V;
> >  
> > +	bitmap_copy(riscv_isa_early, riscv_isa, RISCV_ISA_EXT_MAX);
> > +	bitmap_zero(riscv_isa, RISCV_ISA_EXT_MAX);
> > +
> >  	if (!acpi_disabled) {
> > -		riscv_fill_hwcap_from_isa_string(isa2hwcap);
> > +		riscv_fill_hwcap_from_isa_string(isa2hwcap, riscv_isa_early);
> >  	} else {
> > -		int ret = riscv_fill_hwcap_from_ext_list(isa2hwcap);
> > +		int ret = riscv_fill_hwcap_from_ext_list(isa2hwcap, riscv_isa_early);
> >  
> >  		if (ret && riscv_isa_fallback) {
> >  			pr_info("Falling back to deprecated \"riscv,isa\"\n");
> > -			riscv_fill_hwcap_from_isa_string(isa2hwcap);
> > +			riscv_fill_hwcap_from_isa_string(isa2hwcap, riscv_isa_early);
> >  		}
> >  	}
> >  
> > @@ -1250,6 +1260,17 @@ static bool riscv_cpufeature_patch_check(u16 id, u16 value)
> >  	return false;
> >  }
> >  
> > +static bool __init_or_module riscv_is_isa_ext_early_id(u16 id)
> > +{
> > +	switch (id) {
> > +	case RISCV_ISA_EXT_SV48:
> > +	case RISCV_ISA_EXT_SV57:
> > +		return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> >  void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
> >  						  struct alt_entry *end,
> >  						  unsigned int stage)
> > @@ -1257,9 +1278,7 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
> >  	struct alt_entry *alt;
> >  	void *oldptr, *altptr;
> >  	u16 id, value, vendor;
> > -
> > -	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> > -		return;
> > +	bool early = stage == RISCV_ALTERNATIVES_EARLY_BOOT;
> >  
> >  	for (alt = begin; alt < end; alt++) {
> >  		id = PATCH_ID_CPUFEATURE_ID(alt->patch_id);
> > @@ -1274,6 +1293,8 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
> >  		 * vendor extension.
> >  		 */
> >  		if (id < RISCV_ISA_EXT_MAX) {
> > +			if (early && !riscv_is_isa_ext_early_id(id))
> > +				continue;
> >  			/*
> >  			 * This patch should be treated as errata so skip
> >  			 * processing here.
> > @@ -1288,6 +1309,8 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
> >  			if (!riscv_cpufeature_patch_check(id, value))
> >  				continue;
> >  		} else if (id >= RISCV_VENDOR_EXT_ALTERNATIVES_BASE) {
> > +			if (early)
> > +				continue;
> >  			if (!__riscv_isa_vendor_extension_available(VENDOR_EXT_ALL_CPUS, vendor,
> >  								    id - RISCV_VENDOR_EXT_ALTERNATIVES_BASE))
> >  				continue;
> > @@ -1299,9 +1322,20 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
> >  		oldptr = ALT_OLD_PTR(alt);
> >  		altptr = ALT_ALT_PTR(alt);
> >  
> > -		mutex_lock(&text_mutex);
> > -		patch_text_nosync(oldptr, altptr, alt->alt_len);
> > -		riscv_alternative_fix_offsets(oldptr, alt->alt_len, oldptr - altptr);
> > -		mutex_unlock(&text_mutex);
> > +		if (early) {
> > +			/* oldptr is writable through the MMU-off kernel mapping. */
> > +			memcpy(oldptr, altptr, alt->alt_len);
> > +			riscv_alternative_fix_offsets(oldptr, alt->alt_len,
> > +						      oldptr - altptr, true);
> > +		} else {
> > +			mutex_lock(&text_mutex);
> > +			patch_text_nosync(oldptr, altptr, alt->alt_len);
> > +			riscv_alternative_fix_offsets(oldptr, alt->alt_len,
> > +						      oldptr - altptr, false);
> > +			mutex_unlock(&text_mutex);
> > +		}
> >  	}
> > +
> > +	if (early)
> > +		local_flush_icache_all();
> >  }
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index fc74142fe6e6..2a2402d79bc4 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -6,6 +6,11 @@
> >   *  Nick Kossifidis <mick@ics.forth.gr>
> >   */
> >  
> > +#ifdef CONFIG_64BIT
> > +/* riscv_has_extension_likely() cannot be used this early */
> > +#define USE_EARLY_PGTABLE_LEVELS
> > +#endif
> > +
> >  #include <linux/init.h>
> >  #include <linux/mm.h>
> >  #include <linux/memblock.h>
> > @@ -892,6 +897,10 @@ static __init void set_satp_mode(uintptr_t dtb_pa)
> >  	memset(early_p4d, 0, PAGE_SIZE);
> >  	memset(early_pud, 0, PAGE_SIZE);
> >  	memset(early_pmd, 0, PAGE_SIZE);
> > +	if (pgtable_l4_enabled())
> > +		set_bit(RISCV_ISA_EXT_SV48, riscv_isa);
> > +	if (pgtable_l5_enabled())
> > +		set_bit(RISCV_ISA_EXT_SV57, riscv_isa);
> >  }
> >  #endif
> >  
> > -- 
> > 2.53.0
> > 


