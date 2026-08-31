Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB41384CEF
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788213858; cv=none; b=PgqvJfJyoJ58zDhxBgxSPr009hZXtShjA73MoR/oaZ7I26RyKfj+EBUs1Yl1WX6cfvOxUpV0JUG7IPlGn/CkM496fUFWFTfXGwXPR7x1l+edE5AdWhLwLn27MZyMceAx/RcXRVeez16b1VXpEfOEjooXIwOsbxNYB7MBvCSnc+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788213858; c=relaxed/simple;
	bh=31LRBbRRDzJjDJLdSm06liPNiD+BWf64Oj3a84V7SW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DcssTIrJV3X1X6UPVIe5xU7jVAKyEpj22UlvYyyz+hY9yFmLt62RHflen+8FUXVJbRAml3hjVnE6So4/h39jhp/ZRFSHA4CLtpkNyDyT4ER4fLOdWxc0Q1PhUWdgO4Yzkwy/bthAJwEEDevw283wej6QYp1QUA0k2vNibyk+khs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hwAvmcqL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hwAvmcqL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 634131F000E9;
	Mon, 31 Aug 2026 22:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788213855;
	bh=Qy60nsuw2t0Jxz0AkDCvYdE2QLSiWv5B9mnDVomKQkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hwAvmcqLz1Z4E+0TfMfQCWaAG/19dt+3gtWPAIvmiU22O1jKsNCFzoXZ6z7uZdnv8
	 dE3B3O0reAPXc3VepseFPwT5JEEuhMUFdngydnz51m5GJdA2GfE5aoP9Ztupaa3JLZ
	 FSSBA1sd2Vt9qbMxCECKB+4pIQc759c5wplc5J/Yv4a3e+9FXFm1eNhl/lV9RJvFdy
	 CIbeNsbU3YzI9fzMuPZ6gw9xrYo4ymvJW+v47e8YSGtzwh5WNi7/93/FmAwGEfPNOM
	 YLDHqE3/+Y23n+nIQtGc+EuL2CcBSSGBVo24in2A7w+IFY1nIl4I0p04q3RffDb5t4
	 kKLzJXm/a9EtQ==
Date: Mon, 31 Aug 2026 23:04:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: introduce cap framework and use it to
 optimize pgtable_l4|l5_enabled
Message-ID: <20260831-falsify-arrogance-6917870b8596@spud>
References: <20260830170414.4505-1-jszhang@kernel.org>
 <20260830170414.4505-4-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+PheEPPG8uz8BFlt"
Content-Disposition: inline
In-Reply-To: <20260830170414.4505-4-jszhang@kernel.org>

--+PheEPPG8uz8BFlt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 01:04:01AM +0800, Jisheng Zhang wrote:
> The pgtable_l4|[l5]_enabled check sits at hot code path, performance
> is impacted a lot. Since pgtable_l4|[l5]_enabled isn't changed after
> boot, we can use alternative mechanism to optimize them.
>=20
> So the question is whether we can add RISCV_ISA_EXT_SV48/SV5 and use
> riscv_has_extension_*() or not. Although, per [1] and [2], SV48 and
> SV57 are ISA exensions too, RISCV_ISA_EXT_SV48/SV57 are to describe hw
> supported extensions, while this doesn't mean the pgtable_l4|l5 is
> enabled, for example, we may pass no5lvl/no4lvl kernel boot args or
> explicitly ask for SV39 by setting dt mmu-type property as
> "riscv,sv39". If we clear RISCV_ISA_EXT_SV48|SV57, then internal
> extension queries and potentially userspace reporting can no longer
> distinguish =E2=80=9Cunsupported=E2=80=9D from =E2=80=9Csupported but dis=
abled.=E2=80=9D

That's the case for all extensions that the kernel does not support,
like if the fpu is disabled because the kernel doesn't have the
configuration option set. In fact, I think the CFI extensions are very
similar here, because they also have riscv_nousercfi command line
options that can disable them.
If that's the reason for making a new-but-similar mechanism, I think you
should just introduce RISCV_ISA_EXT_SV{48,57} and use that.

Cheers,
Conor.

>=20
> Introduce cap framework to describe the capabilities selected by
> kernel. It also uses similar alternatives mechanism as the
> riscv_has_extension_*() helpers.
>=20
> After that, use it to optimize pgtable_l4|l5_enabled.
>=20
> For the typical access_ok(addr, 1);
> before the patch:
>=20
> ...
> auipc	a5,0xb43
> lbu	a5,100(a5) # ffffffff80b51f68 <pgtable_l5_enabled>
> bnez	a5,ffffffff8000ef46 <foo+0x56>
> auipc	a5,0xb43
> lbu	a5,91(a5) # ffffffff80b51f69 <pgtable_l4_enabled>
> beqz	a5,ffffffff8000ef5a <foo+0x6a>
> ...
>=20
> after the patch:
> there are only two j or nop instructions which avoid memory load and
> test branch.
>=20
> Initial test lmbench's lat_syscall write on TH1520 platforms shows that
> the write syscall latency is reduced by about 2.38%.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Link: https://github.com/riscv/riscv-isa-manual/blob/main/src/profiles/pr=
ofiles.adoc [1]
> Link: https://riscv.atlassian.net/wiki/spaces/HOME/pages/16154732/Ratifie=
d+ISA+Extensions [2]
> ---
>  arch/riscv/Kconfig                         |  1 +
>  arch/riscv/include/asm/alternative.h       |  2 +-
>  arch/riscv/include/asm/cpufeature-macros.h | 46 ++++++++++++++++++++++
>  arch/riscv/include/asm/cpufeature.h        |  2 +
>  arch/riscv/include/asm/hwcap.h             |  6 +++
>  arch/riscv/include/asm/pgtable-64.h        | 12 ++++++
>  arch/riscv/kernel/alternative.c            | 24 +++++++----
>  arch/riscv/kernel/cpufeature.c             | 41 +++++++++++++++----
>  arch/riscv/mm/init.c                       |  9 +++++
>  9 files changed, 128 insertions(+), 15 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 13b7bb77087e..e9476b8cbeb0 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -218,6 +218,7 @@ config RISCV
>  	select PCI_ECAM if (ACPI && PCI)
>  	select PCI_MSI if PCI
>  	select RELOCATABLE if !MMU && !PHYS_RAM_BASE_FIXED
> +	select RISCV_ALTERNATIVE_EARLY if 64BIT
>  	select RISCV_APLIC
>  	select RISCV_IMSIC
>  	select RISCV_INTC
> diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/as=
m/alternative.h
> index 688c7d1a9ae3..6be7b2b6ade9 100644
> --- a/arch/riscv/include/asm/alternative.h
> +++ b/arch/riscv/include/asm/alternative.h
> @@ -33,7 +33,7 @@ void __init apply_early_boot_alternatives(void);
>  void apply_module_alternatives(void *start, size_t length);
> =20
>  void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
> -				   int patch_offset);
> +				   int patch_offset, bool early);
> =20
>  struct alt_entry {
>  	s32 old_offset;		/* offset relative to original instruction or data  */
> diff --git a/arch/riscv/include/asm/cpufeature-macros.h b/arch/riscv/incl=
ude/asm/cpufeature-macros.h
> index adaf9e3fb25c..dca320e7e88c 100644
> --- a/arch/riscv/include/asm/cpufeature-macros.h
> +++ b/arch/riscv/include/asm/cpufeature-macros.h
> @@ -1,6 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * Copyright 2022-2024 Rivos, Inc
> + * Copyright 2026 Jisheng Zhang <jszhang@kernel.org>
>   */
> =20
>  #ifndef _ASM_CPUFEATURE_MACROS_H
> @@ -57,4 +58,49 @@ static __always_inline bool riscv_has_extension_likely=
(const unsigned long ext)
>  	return __riscv_has_extension_likely(STANDARD_EXT, ext);
>  }
> =20
> +static __always_inline bool __riscv_has_cap_likely(const unsigned long c=
ap)
> +{
> +	asm goto(ALTERNATIVE("j	%l[l_no]", "nop", 0, %[cap], 1)
> +	:
> +	: [cap] "i" (cap)
> +	:
> +	: l_no);
> +
> +	return true;
> +l_no:
> +	return false;
> +}
> +
> +static __always_inline bool __riscv_has_cap_unlikely(const unsigned long=
 cap)
> +{
> +
> +	asm goto(ALTERNATIVE("nop", "j	%l[l_yes]", 0, %[cap], 1)
> +	:
> +	: [cap] "i" (cap)
> +	:
> +	: l_yes);
> +
> +	return false;
> +l_yes:
> +	return true;
> +}
> +
> +static __always_inline bool riscv_has_cap_unlikely(const unsigned long c=
ap)
> +{
> +	compiletime_assert(cap >=3D RISCV_ISA_EXT_MAX &&
> +			   cap < RISCV_CAP_MAX,
> +			   "cap must be >=3D RISCV_ISA_EXT_MAX and < RISCV_CAP_MAX");
> +
> +	return __riscv_has_cap_unlikely(cap);
> +}
> +
> +static __always_inline bool riscv_has_cap_likely(const unsigned long cap)
> +{
> +	compiletime_assert(cap >=3D RISCV_ISA_EXT_MAX &&
> +			   cap < RISCV_CAP_MAX,
> +			   "cap must be >=3D RISCV_ISA_EXT_MAX and < RISCV_CAP_MAX");
> +
> +	return __riscv_has_cap_likely(cap);
> +}
> +
>  #endif /* _ASM_CPUFEATURE_MACROS_H */
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm=
/cpufeature.h
> index 37c9f2a0fb54..50453586558e 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -36,6 +36,8 @@ extern const struct seq_operations cpuinfo_op;
>  /* Per-cpu ISA extensions. */
>  extern struct riscv_isainfo hart_isa[NR_CPUS];
> =20
> +extern DECLARE_BITMAP(riscv_cap, RISCV_CAP_MAX - RISCV_ISA_EXT_MAX);
> +
>  extern u32 thead_vlenb_of;
> =20
>  void __init riscv_user_isa_enable(void);
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index f8db798b2654..4a3e2c43afc4 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -128,6 +128,12 @@
>  #define RISCV_ISA_EXT_MAX		128
>  #define RISCV_ISA_EXT_INVALID		U32_MAX
> =20
> +/* Kernel capabilities occupy the gap below vendor alternative IDs. */
> +#define RISCV_CAP_PGTABLE_L4		RISCV_ISA_EXT_MAX
> +#define RISCV_CAP_PGTABLE_L5		(RISCV_ISA_EXT_MAX + 1)
> +#define RISCV_CAP_EARLY_MAX		(RISCV_ISA_EXT_MAX + 2)
> +#define RISCV_CAP_MAX			RISCV_CAP_EARLY_MAX
> +
>  #ifdef CONFIG_RISCV_M_MODE
>  #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
>  #define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SMNPM
> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm=
/pgtable-64.h
> index 72b8c63469fa..b0f59e3d5c31 100644
> --- a/arch/riscv/include/asm/pgtable-64.h
> +++ b/arch/riscv/include/asm/pgtable-64.h
> @@ -13,6 +13,7 @@
>  extern bool _pgtable_l4_enabled;
>  extern bool _pgtable_l5_enabled;
> =20
> +#ifdef USE_EARLY_PGTABLE_LEVELS
>  static __always_inline bool pgtable_l5_enabled(void)
>  {
>  	return _pgtable_l5_enabled;
> @@ -22,6 +23,17 @@ static __always_inline bool pgtable_l4_enabled(void)
>  {
>  	return _pgtable_l4_enabled;
>  }
> +#else
> +static __always_inline bool pgtable_l4_enabled(void)
> +{
> +	return riscv_has_cap_likely(RISCV_CAP_PGTABLE_L4);
> +}
> +
> +static __always_inline bool pgtable_l5_enabled(void)
> +{
> +	return riscv_has_cap_likely(RISCV_CAP_PGTABLE_L5);
> +}
> +#endif
> =20
>  #define PGDIR_SHIFT_L3  30
>  #define PGDIR_SHIFT_L4  39
> diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternat=
ive.c
> index c0c9306022c5..bbb215349452 100644
> --- a/arch/riscv/kernel/alternative.c
> +++ b/arch/riscv/kernel/alternative.c
> @@ -75,7 +75,8 @@ static u32 riscv_instruction_at(void *p)
>  }
> =20
>  static void riscv_alternative_fix_auipc_jalr(void *ptr, u32 auipc_insn,
> -					     u32 jalr_insn, int patch_offset)
> +					     u32 jalr_insn, int patch_offset,
> +					     bool early)
>  {
>  	u32 call[2] =3D { auipc_insn, jalr_insn };
>  	s32 imm;
> @@ -88,10 +89,15 @@ static void riscv_alternative_fix_auipc_jalr(void *pt=
r, u32 auipc_insn,
>  	riscv_insn_insert_utype_itype_imm(&call[0], &call[1], imm);
> =20
>  	/* patch the call place again */
> -	patch_text_nosync(ptr, call, sizeof(u32) * 2);
> +	if (early) {
> +		memcpy(ptr, call, sizeof(call));
> +	} else {
> +		patch_text_nosync(ptr, call, sizeof(call));
> +	}
>  }
> =20
> -static void riscv_alternative_fix_jal(void *ptr, u32 jal_insn, int patch=
_offset)
> +static void riscv_alternative_fix_jal(void *ptr, u32 jal_insn, int patch=
_offset,
> +				      bool early)
>  {
>  	s32 imm;
> =20
> @@ -103,11 +109,14 @@ static void riscv_alternative_fix_jal(void *ptr, u3=
2 jal_insn, int patch_offset)
>  	riscv_insn_insert_jtype_imm(&jal_insn, imm);
> =20
>  	/* patch the call place again */
> -	patch_text_nosync(ptr, &jal_insn, sizeof(u32));
> +	if (early)
> +		memcpy(ptr, &jal_insn, sizeof(u32));
> +	else
> +		patch_text_nosync(ptr, &jal_insn, sizeof(u32));
>  }
> =20
>  void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
> -				      int patch_offset)
> +				   int patch_offset, bool early)
>  {
>  	int num_insn =3D len / sizeof(u32);
>  	int i;
> @@ -131,7 +140,8 @@ void riscv_alternative_fix_offsets(void *alt_ptr, uns=
igned int len,
>  				continue;
> =20
>  			riscv_alternative_fix_auipc_jalr(alt_ptr + i * sizeof(u32),
> -							 insn, insn2, patch_offset);
> +							 insn, insn2, patch_offset,
> +							 early);
>  			i++;
>  		}
> =20
> @@ -144,7 +154,7 @@ void riscv_alternative_fix_offsets(void *alt_ptr, uns=
igned int len,
>  				continue;
> =20
>  			riscv_alternative_fix_jal(alt_ptr + i * sizeof(u32),
> -						  insn, patch_offset);
> +						  insn, patch_offset, early);
>  		}
>  	}
>  }
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 9915121e9438..9b47fea25ee4 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -40,6 +40,7 @@ unsigned long elf_hwcap __read_mostly;
> =20
>  /* Host ISA bitmap */
>  static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
> +DECLARE_BITMAP(riscv_cap, RISCV_CAP_MAX - RISCV_ISA_EXT_MAX) __read_most=
ly;
> =20
>  /* Per-cpu ISA extensions. */
>  struct riscv_isainfo hart_isa[NR_CPUS];
> @@ -81,6 +82,14 @@ bool __riscv_isa_extension_available(const unsigned lo=
ng *isa_bitmap, unsigned i
>  }
>  EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
> =20
> +static bool __riscv_cap_available(unsigned int bit)
> +{
> +	if (bit >=3D RISCV_CAP_MAX || bit < RISCV_ISA_EXT_MAX)
> +		return false;
> +
> +	return test_bit(bit - RISCV_ISA_EXT_MAX, riscv_cap);
> +}
> +
>  static int riscv_ext_f_depends(const struct riscv_isa_ext_data *data,
>  			       const unsigned long *isa_bitmap)
>  {
> @@ -1257,9 +1266,7 @@ void __init_or_module riscv_cpufeature_patch_func(s=
truct alt_entry *begin,
>  	struct alt_entry *alt;
>  	void *oldptr, *altptr;
>  	u16 id, value, vendor;
> -
> -	if (stage =3D=3D RISCV_ALTERNATIVES_EARLY_BOOT)
> -		return;
> +	bool early =3D stage =3D=3D RISCV_ALTERNATIVES_EARLY_BOOT;
> =20
>  	for (alt =3D begin; alt < end; alt++) {
>  		id =3D PATCH_ID_CPUFEATURE_ID(alt->patch_id);
> @@ -1274,6 +1281,8 @@ void __init_or_module riscv_cpufeature_patch_func(s=
truct alt_entry *begin,
>  		 * vendor extension.
>  		 */
>  		if (id < RISCV_ISA_EXT_MAX) {
> +			if (early)
> +				continue;
>  			/*
>  			 * This patch should be treated as errata so skip
>  			 * processing here.
> @@ -1287,7 +1296,14 @@ void __init_or_module riscv_cpufeature_patch_func(=
struct alt_entry *begin,
>  			value =3D PATCH_ID_CPUFEATURE_VALUE(alt->patch_id);
>  			if (!riscv_cpufeature_patch_check(id, value))
>  				continue;
> +		} else if (id < RISCV_CAP_MAX) {
> +			if (id >=3D RISCV_CAP_EARLY_MAX && early)
> +				continue;
> +			if (!__riscv_cap_available(id))
> +				continue;
>  		} else if (id >=3D RISCV_VENDOR_EXT_ALTERNATIVES_BASE) {
> +			if (early)
> +				continue;
>  			if (!__riscv_isa_vendor_extension_available(VENDOR_EXT_ALL_CPUS, vend=
or,
>  								    id - RISCV_VENDOR_EXT_ALTERNATIVES_BASE))
>  				continue;
> @@ -1299,9 +1315,20 @@ void __init_or_module riscv_cpufeature_patch_func(=
struct alt_entry *begin,
>  		oldptr =3D ALT_OLD_PTR(alt);
>  		altptr =3D ALT_ALT_PTR(alt);
> =20
> -		mutex_lock(&text_mutex);
> -		patch_text_nosync(oldptr, altptr, alt->alt_len);
> -		riscv_alternative_fix_offsets(oldptr, alt->alt_len, oldptr - altptr);
> -		mutex_unlock(&text_mutex);
> +		if (early) {
> +			/* oldptr is writable through the MMU-off kernel mapping. */
> +			memcpy(oldptr, altptr, alt->alt_len);
> +			riscv_alternative_fix_offsets(oldptr, alt->alt_len,
> +						      oldptr - altptr, true);
> +		} else {
> +			mutex_lock(&text_mutex);
> +			patch_text_nosync(oldptr, altptr, alt->alt_len);
> +			riscv_alternative_fix_offsets(oldptr, alt->alt_len,
> +						      oldptr - altptr, false);
> +			mutex_unlock(&text_mutex);
> +		}
>  	}
> +
> +	if (early)
> +		local_flush_icache_all();
>  }
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index fc74142fe6e6..aca09992ef06 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -6,6 +6,11 @@
>   *  Nick Kossifidis <mick@ics.forth.gr>
>   */
> =20
> +#ifdef CONFIG_64BIT
> +/* riscv_has_cap_likely() cannot be used this early */
> +#define USE_EARLY_PGTABLE_LEVELS
> +#endif
> +
>  #include <linux/init.h>
>  #include <linux/mm.h>
>  #include <linux/memblock.h>
> @@ -892,6 +897,10 @@ static __init void set_satp_mode(uintptr_t dtb_pa)
>  	memset(early_p4d, 0, PAGE_SIZE);
>  	memset(early_pud, 0, PAGE_SIZE);
>  	memset(early_pmd, 0, PAGE_SIZE);
> +	if (pgtable_l4_enabled())
> +		set_bit(RISCV_CAP_PGTABLE_L4 - RISCV_ISA_EXT_MAX, riscv_cap);
> +	if (pgtable_l5_enabled())
> +		set_bit(RISCV_CAP_PGTABLE_L5 - RISCV_ISA_EXT_MAX, riscv_cap);
>  }
>  #endif
> =20
> --=20
> 2.53.0
>=20

--+PheEPPG8uz8BFlt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapX6XAAKCRB4tDGHoIJi
0vf6AP9HT1YUwphXSiGeLcCAzk2nk5W2gvSuV6M04XMAwM+TWAEAiOy4Fq+HFPJA
9bEm2eHYeg2KQRtoCH/L27CK35ANFQc=
=gxlx
-----END PGP SIGNATURE-----

--+PheEPPG8uz8BFlt--
