Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DD73A257A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788213973; cv=none; b=ADe+fdzHNebTa4jNuvtgA16xm8c7OBszF7OZsGb41UYVWsd3fhi5wbm/tAZmsMYP8bCItkpvWufNtvhYj4OBz/2ca9r7umwKkc8uZD7eLwwPfIAoTZQkqGnkuanUGIeqadnCBg7YE08jfon5dQSwN0so85q3bCzJhqaCaREsnDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788213973; c=relaxed/simple;
	bh=RkRJv8Tm+SUDMEryf8FTUc5orj9iar9BmMgrC2N7sHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l3d8FHibNfO7qsSS1H+R3W2cfK5c4nKSugfCebapR0D+n455/1rCd9uePc1Gc5QbUc3DP0W+u2Fjyj7OegR7TCyZ9qpMRfvUbAP0O8ZSd9uUTQRat5VRPUb4gDfLMbges625hL9RnZ5qq2AyzwhuZzBq3xvkyGlgtWxhhF5b3Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LM41sZZY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LM41sZZY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA7E1F000E9;
	Mon, 31 Aug 2026 22:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788213971;
	bh=WmgVg8Izt43ei3v8cUEGP6CkNpM6pslLlwRe8DYAH2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LM41sZZYR8xazb93gqdEjXv23erQ6DEPw0PItME1jCyV1kQRJPte5uJAFbNDG5si+
	 o5UrS/Q04Ir0/E0n0iNzv2yaTET8cRAEJ9aEg4EUtTBIYdt/KpZ/yihYC9qQ7CKFmX
	 ejof5DW4j4c/3M7EYiznwrcrt2NC2IWj5u3dAuvBC692PQoFGV0AKh1OOqFU7Q1sK+
	 kCeaOfKRwWByoAOUiq6bLTwpV6M2/7Gz0cg4hP3ifa+G3FVwC6eoqKqAGl3Gbbnh2+
	 XCtx7csQZu3U99PWeo5CDNT6KblExWjr7ERNg01oOdrxzhfkm8AMTUh7a7Ul4Zo0FM
	 +Ls3fJxPaFxYg==
Date: Mon, 31 Aug 2026 23:06:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] riscv: remove RISCV_ALTERNATIVE Kconfig option
Message-ID: <20260831-upfront-captivate-c10e6531851f@spud>
References: <20260830170414.4505-1-jszhang@kernel.org>
 <20260830170414.4505-2-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OxsrtNBkRz5Nlr1u"
Content-Disposition: inline
In-Reply-To: <20260830170414.4505-2-jszhang@kernel.org>

--OxsrtNBkRz5Nlr1u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 01:03:59AM +0800, Jisheng Zhang wrote:
> riscv always selects RISCV_ALTERNATIVE now, so we can remove this
> Kconfig option and enable RISCV_ALTERNATIVE code unconditionally.

I think it'd be nice to add a minor note about what's changed to make
this true, but this seems sane to me.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/Kconfig                          | 23 --------------------
>  arch/riscv/Kconfig.errata                   |  5 +----
>  arch/riscv/include/asm/alternative-macros.h | 24 ---------------------
>  arch/riscv/include/asm/alternative.h        | 10 ---------
>  arch/riscv/include/asm/cpufeature-macros.h  | 10 ++-------
>  arch/riscv/include/asm/cpufeature.h         |  6 ++----
>  arch/riscv/include/asm/vendor_extensions.h  | 18 ++++++----------
>  arch/riscv/kernel/Makefile                  |  2 +-
>  arch/riscv/kernel/cpufeature.c              |  2 --
>  9 files changed, 12 insertions(+), 88 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index f8e26c4bed2b..13b7bb77087e 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -218,7 +218,6 @@ config RISCV
>  	select PCI_ECAM if (ACPI && PCI)
>  	select PCI_MSI if PCI
>  	select RELOCATABLE if !MMU && !PHYS_RAM_BASE_FIXED
> -	select RISCV_ALTERNATIVE
>  	select RISCV_APLIC
>  	select RISCV_IMSIC
>  	select RISCV_INTC
> @@ -539,17 +538,8 @@ config RISCV_COMBO_SPINLOCKS
> =20
>  endchoice
> =20
> -config RISCV_ALTERNATIVE
> -	bool
> -	help
> -	  This Kconfig allows the kernel to automatically patch the
> -	  erratum or cpufeature required by the execution platform at run
> -	  time. The code patching overhead is minimal, as it's only done
> -	  once at boot and once on each module load.
> -
>  config RISCV_ALTERNATIVE_EARLY
>  	bool
> -	depends on RISCV_ALTERNATIVE
>  	help
>  	  Allows early patching of the kernel for special errata
> =20
> @@ -578,7 +568,6 @@ config RISCV_ISA_SUPM
>  config RISCV_ISA_SVNAPOT
>  	bool "Svnapot extension support for supervisor mode NAPOT pages"
>  	depends on 64BIT && MMU
> -	depends on RISCV_ALTERNATIVE
>  	default y
>  	help
>  	  Enable support for the Svnapot ISA-extension when it is detected
> @@ -615,7 +604,6 @@ config RISCV_ISA_SSQOSID
>  config RISCV_ISA_SVPBMT
>  	bool "Svpbmt extension support for supervisor mode page-based memory ty=
pes"
>  	depends on 64BIT && MMU
> -	depends on RISCV_ALTERNATIVE
>  	default y
>  	help
>  	   Add support for the Svpbmt ISA-extension (Supervisor-mode:
> @@ -685,7 +673,6 @@ config RISCV_ISA_V_PREEMPTIVE
> =20
>  config RISCV_ISA_ZAWRS
>  	bool "Zawrs extension support for more efficient busy waiting"
> -	depends on RISCV_ALTERNATIVE
>  	default y
>  	help
>  	  The Zawrs extension defines instructions to be used in polling loops
> @@ -704,7 +691,6 @@ config TOOLCHAIN_HAS_ZABHA
>  config RISCV_ISA_ZABHA
>  	bool "Zabha extension support for atomic byte/halfword operations"
>  	depends on TOOLCHAIN_HAS_ZABHA
> -	depends on RISCV_ALTERNATIVE
>  	default y
>  	help
>  	  Enable the use of the Zabha ISA-extension to implement kernel
> @@ -721,7 +707,6 @@ config TOOLCHAIN_HAS_ZACAS
> =20
>  config RISCV_ISA_ZACAS
>  	bool "Zacas extension support for atomic CAS"
> -	depends on RISCV_ALTERNATIVE
>  	default y
>  	help
>  	  Enable the use of the Zacas ISA-extension to implement kernel atomic
> @@ -766,7 +751,6 @@ config RISCV_ISA_ZBA
> =20
>  config RISCV_ISA_ZBB
>  	bool "Zbb extension support for bit manipulation instructions"
> -	depends on RISCV_ALTERNATIVE
>  	default y
>  	help
>  	   Add support for enabling optimisations in the kernel when the
> @@ -791,7 +775,6 @@ config RISCV_ISA_ZBC
>  	bool "Zbc extension support for carry-less multiplication instructions"
>  	depends on TOOLCHAIN_HAS_ZBC
>  	depends on MMU
> -	depends on RISCV_ALTERNATIVE
>  	default y
>  	help
>  	   Adds support to dynamically detect the presence of the Zbc
> @@ -813,7 +796,6 @@ config TOOLCHAIN_HAS_ZBKB
>  config RISCV_ISA_ZBKB
>  	bool "Zbkb extension support for bit manipulation instructions"
>  	depends on TOOLCHAIN_HAS_ZBKB
> -	depends on RISCV_ALTERNATIVE
>  	default y
>  	help
>  	   Adds support to dynamically detect the presence of the ZBKB
> @@ -827,7 +809,6 @@ config RISCV_ISA_ZBKB
>  config RISCV_ISA_ZICBOM
>  	bool "Zicbom extension support for non-coherent DMA operation"
>  	depends on MMU
> -	depends on RISCV_ALTERNATIVE
>  	default y
>  	select RISCV_DMA_NONCOHERENT
>  	select DMA_DIRECT_REMAP
> @@ -843,7 +824,6 @@ config RISCV_ISA_ZICBOM
> =20
>  config RISCV_ISA_ZICBOZ
>  	bool "Zicboz extension support for faster zeroing of memory"
> -	depends on RISCV_ALTERNATIVE
>  	default y
>  	help
>  	   Enable the use of the Zicboz extension (cbo.zero instruction)
> @@ -856,7 +836,6 @@ config RISCV_ISA_ZICBOZ
>  config RISCV_ISA_ZICBOP
>  	bool "Zicbop extension support for cache block prefetch"
>  	depends on MMU
> -	depends on RISCV_ALTERNATIVE
>  	default y
>  	help
>  	  Adds support to dynamically detect the presence of the ZICBOP
> @@ -871,7 +850,6 @@ config RISCV_ISA_ZICBOP
>  config RISCV_ISA_SVRSW60T59B
>  	bool "Svrsw60t59b extension support for using PTE bits 60 and 59"
>  	depends on MMU && 64BIT
> -	depends on RISCV_ALTERNATIVE
>  	default y
>  	help
>  	  Adds support to dynamically detect the presence of the Svrsw60t59b
> @@ -1204,7 +1182,6 @@ config RISCV_USER_CFI
>  	bool "riscv userspace control flow integrity"
>  	depends on 64BIT && MMU && \
>  		$(cc-option,-mabi=3Dlp64 -march=3Drv64ima_zicfiss_zicfilp -fcf-protect=
ion=3Dfull)
> -	depends on RISCV_ALTERNATIVE
>  	select RISCV_SBI
>  	select ARCH_HAS_USER_SHADOW_STACK
>  	select ARCH_USES_HIGH_VMA_FLAGS
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index 3c945d086c7d..1a66e5b6f7d1 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -2,7 +2,7 @@ menu "CPU errata selection"
> =20
>  config ERRATA_ANDES
>  	bool "Andes AX45MP errata"
> -	depends on RISCV_ALTERNATIVE && RISCV_SBI
> +	depends on RISCV_SBI
>  	help
>  	  All Andes errata Kconfig depend on this Kconfig. Disabling
>  	  this Kconfig will disable all Andes errata. Please say "Y"
> @@ -23,7 +23,6 @@ config ERRATA_ANDES_CMO
> =20
>  config ERRATA_MIPS
>  	bool "MIPS errata"
> -	depends on RISCV_ALTERNATIVE
>  	help
>  	  All MIPS errata Kconfig depend on this Kconfig. Disabling
>  	  this Kconfig will disable all MIPS errata. Please say "Y"
> @@ -46,7 +45,6 @@ config ERRATA_MIPS_P8700_PAUSE_OPCODE
> =20
>  config ERRATA_SIFIVE
>  	bool "SiFive errata"
> -	depends on RISCV_ALTERNATIVE
>  	help
>  	  All SiFive errata Kconfig depend on this Kconfig. Disabling
>  	  this Kconfig will disable all SiFive errata. Please say "Y"
> @@ -98,7 +96,6 @@ config ERRATA_STARFIVE_JH7100
> =20
>  config ERRATA_THEAD
>  	bool "T-HEAD errata"
> -	depends on RISCV_ALTERNATIVE
>  	help
>  	  All T-HEAD errata Kconfig depend on this Kconfig. Disabling
>  	  this Kconfig will disable all T-HEAD errata. Please say "Y"
> diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/inc=
lude/asm/alternative-macros.h
> index 9619bd5c8eba..629d884578da 100644
> --- a/arch/riscv/include/asm/alternative-macros.h
> +++ b/arch/riscv/include/asm/alternative-macros.h
> @@ -2,8 +2,6 @@
>  #ifndef __ASM_ALTERNATIVE_MACROS_H
>  #define __ASM_ALTERNATIVE_MACROS_H
> =20
> -#ifdef CONFIG_RISCV_ALTERNATIVE
> -
>  #ifdef __ASSEMBLER__
> =20
>  .macro ALT_ENTRY oldptr newptr vendor_id patch_id new_len
> @@ -108,28 +106,6 @@
>  	__ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, IS_ENABLED=
(CONFIG_k_1),	\
>  				   new_c_2, vendor_id_2, patch_id_2, IS_ENABLED(CONFIG_k_2))
> =20
> -#else /* CONFIG_RISCV_ALTERNATIVE */
> -#ifdef __ASSEMBLER__
> -
> -.macro ALTERNATIVE_CFG old_c
> -	\old_c
> -.endm
> -
> -#define __ALTERNATIVE_CFG(old_c, ...)		ALTERNATIVE_CFG old_c
> -#define __ALTERNATIVE_CFG_2(old_c, ...)		ALTERNATIVE_CFG old_c
> -
> -#else /* !__ASSEMBLER__ */
> -
> -#define __ALTERNATIVE_CFG(old_c, ...)		old_c "\n"
> -#define __ALTERNATIVE_CFG_2(old_c, ...)		old_c "\n"
> -
> -#endif /* __ASSEMBLER__ */
> -
> -#define _ALTERNATIVE_CFG(old_c, ...)		__ALTERNATIVE_CFG(old_c)
> -#define _ALTERNATIVE_CFG_2(old_c, ...)		__ALTERNATIVE_CFG_2(old_c)
> -
> -#endif /* CONFIG_RISCV_ALTERNATIVE */
> -
>  /*
>   * Usage:
>   *   ALTERNATIVE(old_content, new_content, vendor_id, patch_id, CONFIG_k)
> diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/as=
m/alternative.h
> index 8407d1d535b8..688c7d1a9ae3 100644
> --- a/arch/riscv/include/asm/alternative.h
> +++ b/arch/riscv/include/asm/alternative.h
> @@ -10,8 +10,6 @@
> =20
>  #ifndef __ASSEMBLER__
> =20
> -#ifdef CONFIG_RISCV_ALTERNATIVE
> -
>  #include <linux/init.h>
>  #include <linux/kernel.h>
>  #include <linux/types.h>
> @@ -61,13 +59,5 @@ void thead_errata_patch_func(struct alt_entry *begin, =
struct alt_entry *end,
>  void riscv_cpufeature_patch_func(struct alt_entry *begin, struct alt_ent=
ry *end,
>  				 unsigned int stage);
> =20
> -#else /* CONFIG_RISCV_ALTERNATIVE */
> -
> -static inline void apply_boot_alternatives(void) { }
> -static inline void apply_early_boot_alternatives(void) { }
> -static inline void apply_module_alternatives(void *start, size_t length)=
 { }
> -
> -#endif /* CONFIG_RISCV_ALTERNATIVE */
> -
>  #endif
>  #endif
> diff --git a/arch/riscv/include/asm/cpufeature-macros.h b/arch/riscv/incl=
ude/asm/cpufeature-macros.h
> index a8103edbf51f..adaf9e3fb25c 100644
> --- a/arch/riscv/include/asm/cpufeature-macros.h
> +++ b/arch/riscv/include/asm/cpufeature-macros.h
> @@ -47,20 +47,14 @@ static __always_inline bool riscv_has_extension_unlik=
ely(const unsigned long ext
>  {
>  	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EX=
T_MAX");
> =20
> -	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
> -		return __riscv_has_extension_unlikely(STANDARD_EXT, ext);
> -
> -	return __riscv_isa_extension_available(NULL, ext);
> +	return __riscv_has_extension_unlikely(STANDARD_EXT, ext);
>  }
> =20
>  static __always_inline bool riscv_has_extension_likely(const unsigned lo=
ng ext)
>  {
>  	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EX=
T_MAX");
> =20
> -	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
> -		return __riscv_has_extension_likely(STANDARD_EXT, ext);
> -
> -	return __riscv_isa_extension_available(NULL, ext);
> +	return __riscv_has_extension_likely(STANDARD_EXT, ext);
>  }
> =20
>  #endif /* _ASM_CPUFEATURE_MACROS_H */
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm=
/cpufeature.h
> index 739fcc84bf7b..37c9f2a0fb54 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -134,8 +134,7 @@ static __always_inline bool riscv_cpu_has_extension_l=
ikely(int cpu, const unsign
>  {
>  	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EX=
T_MAX");
> =20
> -	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) &&
> -	    __riscv_has_extension_likely(STANDARD_EXT, ext))
> +	if (__riscv_has_extension_likely(STANDARD_EXT, ext))
>  		return true;
> =20
>  	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
> @@ -145,8 +144,7 @@ static __always_inline bool riscv_cpu_has_extension_u=
nlikely(int cpu, const unsi
>  {
>  	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EX=
T_MAX");
> =20
> -	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) &&
> -	    __riscv_has_extension_unlikely(STANDARD_EXT, ext))
> +	if (__riscv_has_extension_unlikely(STANDARD_EXT, ext))
>  		return true;
> =20
>  	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
> diff --git a/arch/riscv/include/asm/vendor_extensions.h b/arch/riscv/incl=
ude/asm/vendor_extensions.h
> index 7437304a71b9..b00149be2627 100644
> --- a/arch/riscv/include/asm/vendor_extensions.h
> +++ b/arch/riscv/include/asm/vendor_extensions.h
> @@ -54,11 +54,9 @@ static __always_inline bool riscv_has_vendor_extension=
_likely(const unsigned lon
>  	if (!IS_ENABLED(CONFIG_RISCV_ISA_VENDOR_EXT))
>  		return false;
> =20
> -	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
> -		return __riscv_has_extension_likely(vendor,
> -						    ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
> +	return __riscv_has_extension_likely(vendor,
> +					    ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
> =20
> -	return __riscv_isa_vendor_extension_available(VENDOR_EXT_ALL_CPUS, vend=
or, ext);
>  }
> =20
>  static __always_inline bool riscv_has_vendor_extension_unlikely(const un=
signed long vendor,
> @@ -67,11 +65,9 @@ static __always_inline bool riscv_has_vendor_extension=
_unlikely(const unsigned l
>  	if (!IS_ENABLED(CONFIG_RISCV_ISA_VENDOR_EXT))
>  		return false;
> =20
> -	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
> -		return __riscv_has_extension_unlikely(vendor,
> -						      ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
> +	return __riscv_has_extension_unlikely(vendor,
> +					      ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
> =20
> -	return __riscv_isa_vendor_extension_available(VENDOR_EXT_ALL_CPUS, vend=
or, ext);
>  }
> =20
>  static __always_inline bool riscv_cpu_has_vendor_extension_likely(const =
unsigned long vendor,
> @@ -80,8 +76,7 @@ static __always_inline bool riscv_cpu_has_vendor_extens=
ion_likely(const unsigned
>  	if (!IS_ENABLED(CONFIG_RISCV_ISA_VENDOR_EXT))
>  		return false;
> =20
> -	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) &&
> -	    __riscv_has_extension_likely(vendor, ext + RISCV_VENDOR_EXT_ALTERNA=
TIVES_BASE))
> +	if (__riscv_has_extension_likely(vendor, ext + RISCV_VENDOR_EXT_ALTERNA=
TIVES_BASE))
>  		return true;
> =20
>  	return __riscv_isa_vendor_extension_available(cpu, vendor, ext);
> @@ -94,8 +89,7 @@ static __always_inline bool riscv_cpu_has_vendor_extens=
ion_unlikely(const unsign
>  	if (!IS_ENABLED(CONFIG_RISCV_ISA_VENDOR_EXT))
>  		return false;
> =20
> -	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) &&
> -	    __riscv_has_extension_unlikely(vendor, ext + RISCV_VENDOR_EXT_ALTER=
NATIVES_BASE))
> +	if (__riscv_has_extension_unlikely(vendor, ext + RISCV_VENDOR_EXT_ALTER=
NATIVES_BASE))
>  		return true;
> =20
>  	return __riscv_isa_vendor_extension_available(cpu, vendor, ext);
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index ebe1c3588177..91353c94bfab 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -48,7 +48,7 @@ always-$(KBUILD_BUILTIN) +=3D vmlinux.lds
> =20
>  obj-y	+=3D head.o
>  obj-y	+=3D soc.o
> -obj-$(CONFIG_RISCV_ALTERNATIVE) +=3D alternative.o
> +obj-y	+=3D alternative.o
>  obj-y	+=3D cpu.o
>  obj-y	+=3D cpufeature.o
>  obj-y	+=3D entry.o
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index d2ec96843456..9915121e9438 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -1217,7 +1217,6 @@ void __init riscv_user_isa_enable(void)
>  		pr_warn("Zicbop disabled as it is unavailable on some harts\n");
>  }
> =20
> -#ifdef CONFIG_RISCV_ALTERNATIVE
>  /*
>   * Alternative patch sites consider 48 bits when determining when to pat=
ch
>   * the old instruction sequence with the new. These bits are broken into=
 a
> @@ -1306,4 +1305,3 @@ void __init_or_module riscv_cpufeature_patch_func(s=
truct alt_entry *begin,
>  		mutex_unlock(&text_mutex);
>  	}
>  }
> -#endif
> --=20
> 2.53.0
>=20

--OxsrtNBkRz5Nlr1u
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapX6zwAKCRB4tDGHoIJi
0qR3AP9bcE0T7XrfBwuxtgzS5tqBkMVJ0yfyA1YGmGXM0SqwawEA+9NghGsi9glZ
UFz63lzqm2ED8/d1I8aSFl0grrbKpQw=
=dgHQ
-----END PGP SIGNATURE-----

--OxsrtNBkRz5Nlr1u--
