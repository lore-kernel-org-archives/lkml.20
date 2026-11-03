Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740193;
	b=rjb1/Vj8vE4LwPdM0liTBSx7G+WdAUYvh+FVAnC/zQif54qt3jfyLFJ4irSUqmkWgSJQ
	 Xpwb9iMyN9z0kuRE/svemXGPDVonXLaZRDu3dfIsRsbc1Hv7emSwm9zxMUfTmfciBE5Ai
	 CKfU+js7VJYUXdnaPpQWzcwyapeN90meGKSxHWT8Y7PRRmwZdU87gvK9NCb77SIt07oAh
	 AGsQ6Xzp7Wv5yF4H4Czitc3k1kCLB21UwGP1QUXL+WJJsXT1QcDkDTCGOi45vJUVs6TL2
	 cgx1gLDmROgaqPNHclwLRZpKDIodmNkICvSKVPPs0xR5U762Hw+WaUP0uRPLZLW6Aug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740193;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=L8hrw8BTqeQMi8RBhrOpxHodTpU949C3/zsJFzvh1l0=;
	b=D4f7d91eyHFLWi+L6oyx0LMe50TY6Lq9GAb/fRE10dmrz/KPtH60dY8Mrx+ZE9a7qXYk
	 gZWSOCH4vUyOtvSuoTKdkMOhidJ3NUEh3N84fkMOvLm9zSgOjhoyj964q0O630loIRzpY
	 Sr/9x6dTsBfquQDqgLrAl99vBcp/QrsCut6SUlmIv52Xn9it6+2c0DvswmF2+mxMzb5hv
	 oQBYbRRi9UIlAhd2oRxwNNcCeMgOGuQMkQj1w22sXaHg9/HbKgk4k3d5W/7DurgLcvjtK
	 r13iP+d40VdHE9l3L81VO8C02Rl0U/Gxh1nmH2uIWSAG3jeB0NkAsDbu8wC8Yyc9pRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ggZCicF8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B984606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ggZCicF8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE9E1F0093A;
	Tue,  3 Nov 2026 21:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793740193;
	bh=L8hrw8BTqeQMi8RBhrOpxHodTpU949C3/zsJFzvh1l0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ggZCicF8qVpL2p8CxZxhAgqd1m6OOdaB8MzPqmx4LwwFXvXxihrS9pAiiTOE+8eXe
	 zInNJAW+I11QJdjffta61+KcEDmfgXApxE6i7DF0WKHsIJfjR40/s2rxFrQFg3Qi+5
	 sdJl0U4HRp6QVEFcEhfCo/MskkPWCJHWtoor0/9KNbs0AbN6utrpUkCSp5XrR5CB5C
	 h8AkN/E+Tx84Zsyf969MZ36ySXkDFZ45zgPXzLKB7CRSvVQdkD0KEk4yfWDKdfMr2k
	 Oi62dhKdRbdSiQtzUYol6Mf5Kr5iSWOhYyBd/Nd6bEOmCAKuFrBCvCe7RbraF6bJ/V
	 6Q5Q9iB6PHuQA==
Date: Tue, 3 Nov 2026 21:09:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, cfu@wavecomp.com,
	torvalds@linux-foundation.org, olof@lixom.net,
	aleksa.paunovic@htecgroup.com, arikalo@gmail.com,
	Boqun Feng <boqun@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] riscv: build kernel atomics from LR/SC when Zaamo
 is disabled
Message-ID: <20261103-distance-audio-9b6aac0b1b4b@spud>
References: <20261101-lrsc-only-v4-0-4e1d010463b3@mobileye.com>
 <20261101-lrsc-only-v4-1-4e1d010463b3@mobileye.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+2FX1BX//UlnZkwX"
Content-Disposition: inline
In-Reply-To: <20261101-lrsc-only-v4-1-4e1d010463b3@mobileye.com>

--+2FX1BX//UlnZkwX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

Sorry about not noticing the v4, I had the v3 on my todo list for a few
days and didn't check for an update.

On Sun, Nov 01, 2026 at 02:51:39PM +0200, Vladimir Kondratiev wrote:
> The A extension is Zaamo plus Zalrsc. MIPS P8700 implements only
> Zalrsc, and its AMO instructions trap to SBI. A typical atomic is
> about 40 cycles with LR/SC and about 600 cycles with an emulated AMO,
> so keep the existing AMO sequences when the toolchain defines
> __riscv_zaamo or __riscv_atomic, and use an LR/SC loop otherwise.
>=20
> Add RISCV_ISA_ZAAMO and RISCV_ISA_ZALRSC. Both default on, and that
> selection still passes "a" in -march. Zalrsc remains required because
> cmpxchg and the conditional atomics are LR/SC sequences. Zaamo can be
> turned off only with CONFIG_NONPORTABLE, and only when the compiler
> accepts _zalrsc in -march. GCC 15.1 introduces that support. Older compil=
ers keep Zaamo
> enabled and -march keeps "a". An LR/SC-only build passes _zalrsc
> instead of "a".
>=20
> Suggested-by: Chao-ying Fu <cfu@wavecomp.com>
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> ---
>  arch/riscv/Kconfig               | 32 +++++++++++++++++++++++
>  arch/riscv/Makefile              | 15 ++++++++---
>  arch/riscv/include/asm/atomic.h  | 56 ++++++++++++++++++++++++++++++++++=
+++++-
>  arch/riscv/include/asm/bitops.h  | 51 ++++++++++++++++++++++++++++++++++=
++
>  arch/riscv/include/asm/cmpxchg.h | 18 +++++++++++++
>  arch/riscv/include/asm/futex.h   | 53 ++++++++++++++++++++++++++++++++++=
+++
>  arch/riscv/kernel/entry.S        |  9 +++++++
>  arch/riscv/kernel/head.S         | 14 ++++++++++
>  8 files changed, 243 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 5874ca30f4f6..925963a61f62 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -730,6 +730,38 @@ config RISCV_ISA_ZACAS
> =20
>  	  If you don't know what to do here, say Y.
> =20
> +config TOOLCHAIN_HAS_ZALRSC
> +	bool
> +	default y
> +	depends on !64BIT || $(cc-option,-mabi=3Dlp64 -march=3Drv64im_zalrsc)
> +	depends on !32BIT || $(cc-option,-mabi=3Dilp32 -march=3Drv32im_zalrsc)
> +
> +config RISCV_ISA_ZAAMO
> +	bool "Zaamo extension support for AMO atomics" if NONPORTABLE && TOOLCH=
AIN_HAS_ZALRSC

Probably this option should be called something like
TOOLCHAIN_HAS_ZALRSC_ZAAMO if you're going to use it like this, because
it is confusing why ZALRSC gates a ZAAMO option.

I'm curious actually, does every toolchain provide zalrsc and zaamo as a
pair, or should you check for both here? I'd be surprised if there was a
toolchain with one but not the other but worth checking to avoid some
bizarre toolchain bug..

| > The text here doesn't really make much sense, given it is default
| > disabled as it depends on NONPORTABLE that is default disabled.
| > If this is retained, it should be default n and the text reworded.
|=20
| Not exactly. RISCV_ISA_ZAAMO is visible if NONPORTABLE &&
| TOOLCHAIN_HAS_ZALRSC (later was added in v4). Otherwise it is not
| visible and set to "y". If one disables NONPORTABLE, RISCV_ISA_ZAAMO set
| to "y" with no option to change it. Same for added in v4
| TOOLCHAIN_HAS_ZALRSC

Ah, right. But that kinda goes against how NONPORTABLE is meant to work
since the default cannot run on all platforms? At that point, just get
rid of NONPORTABLE?

> +	default y
> +	help
> +	  Use AMO instructions for kernel atomic memory operations. When
> +	  disabled, those operations are built from LR/SC and the kernel
> +	  is compiled with zalrsc instead of the A extension.
> +
> +	  Disable this only for a hart that implements Zalrsc but not
> +	  Zaamo, such as the MIPS P8700, and only when the compiler accepts
> +	  _zalrsc in -march. GCC 15.1 introduces that support. Without it this
> +	  option stays enabled and -march keeps the A extension.
> +
> +	  The resulting kernel cannot run on a hart without LR/SC.
> +
> +	  If you don't know what to do here, say Y.
> +
> +config RISCV_ISA_ZALRSC
> +	def_bool y
> +	help
> +	  Zalrsc provides LR/SC. cmpxchg and the conditional atomics
> +	  require it, so it is always enabled.

| > So why have a kconfig option for it then? It's pointless if always
| > enabled.
|=20
| My logic when adding it:
| There are 2 sets of extensions related defines: one is Kconfig ones,
| CONFIG_RISCV_ISA_<ext>; and another one found in the
| arch/riscv/include/asm/hwcap.h, RISCV_ISA_EXT_<ext>
|=20
| In the hwcap.h, there's already
|=20
| #define RISCV_ISA_EXT_ZAAMO		97
| #define RISCV_ISA_EXT_ZALRSC		98
|=20
| added by commit 35173b666a16 (riscv: add parsing for Zaamo and Zalrsc
| extensions, 2024-06-19)
|=20
| These 2 sets are logically coupled, and used in the BPF JUT code like
|=20
| #define rv_ext_enabled(ext) \
| 	(IS_ENABLED(CONFIG_RISCV_ISA_##ext) &&
| riscv_has_extension_likely(RISCV_ISA_EXT_##ext))
|=20
| So I thought if RISCV_ISA_EXT_ZALRSC exists although it is mandatory,
| CONFIG_RISCV_ISA_ZALRSC counterpart should exist for the same reason.
|=20
| Do you suggest this is different case and it is worth to remove
| CONFIG_RISCV_ISA_ZALRSC anyway?

If this is the justification for it, then you need to provide this
justification in your commit message - but if zalrsc is always enabled
then there's no need for any code like that in the bpf jit in the first
place, once more making this dead code that should be deleted?

> +
> +config RISCV_ISA_A
> +	def_bool RISCV_ISA_ZAAMO && RISCV_ISA_ZALRSC
> +
>  config TOOLCHAIN_HAS_ZBB
>  	bool
>  	default y
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 44f5a439741a..1b0a459a0f74 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -58,8 +58,9 @@ ifeq ($(CONFIG_SHADOW_CALL_STACK),y)
>  endif
> =20
>  # ISA string setting
> -riscv-march-$(CONFIG_ARCH_RV32I)	:=3D rv32ima
> -riscv-march-$(CONFIG_ARCH_RV64I)	:=3D rv64ima
> +riscv-march-$(CONFIG_ARCH_RV32I)	:=3D rv32im
> +riscv-march-$(CONFIG_ARCH_RV64I)	:=3D rv64im
> +riscv-march-$(CONFIG_RISCV_ISA_A)	:=3D $(riscv-march-y)a
>  riscv-march-$(CONFIG_FPU)		:=3D $(riscv-march-y)fd
>  riscv-march-$(CONFIG_RISCV_ISA_C)	:=3D $(riscv-march-y)c
>  riscv-march-$(CONFIG_RISCV_ISA_V)	:=3D $(riscv-march-y)v
> @@ -75,9 +76,15 @@ else
>  riscv-march-$(CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI) :=3D $(ris=
cv-march-y)_zicsr_zifencei
>  endif
> =20
> -KBUILD_BASE_ISA =3D -march=3D$(shell echo $(riscv-march-y) | sed -E 's/(=
rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
> +KBUILD_BASE_ISA =3D -march=3D$(shell echo $(riscv-march-y) | sed -E 's/(=
rv32ima?|rv64ima?)fd([^v_]*)v?/\1\2/')
>  export KBUILD_BASE_ISA
> =20
> +# Zaamo is off only when the compiler accepts _zalrsc in -march.

I think the comment here is not quite right, it should be "can only be
off", no?

> +ifneq ($(CONFIG_RISCV_ISA_A),y)
> +riscv-march-$(CONFIG_RISCV_ISA_ZAAMO) :=3D $(riscv-march-y)_zaamo

Isn't this dead code? The logic for RISCV_ISA_A is:
config RISCV_ISA_A
	def_bool RISCV_ISA_ZAAMO && RISCV_ISA_ZALRSC
but ZALRSC is always set, so RISCV_ISA_A is equivalent to
RISCV_ISA_ZAAMO so there can't be a case where RISCV_ISA_A is not set
but RISCV_ISA_ZAAMO is?

> +riscv-march-$(CONFIG_RISCV_ISA_ZALRSC) :=3D $(riscv-march-y)_zalrsc

And here, this is effectively just riscv-march-y, since if you get as
far as here, it must be true.

> +endif
> +
>  # Remove F,D,V from isa string for all. Keep extensions between "fd" and=
 "v" by
>  # matching non-v and non-multi-letter extensions out with the filter ([^=
v_]*)
>  KBUILD_CFLAGS +=3D $(KBUILD_BASE_ISA)
> @@ -85,7 +92,7 @@ KBUILD_CFLAGS +=3D $(KBUILD_BASE_ISA)
>  KBUILD_AFLAGS +=3D -march=3D$(riscv-march-y)
> =20
>  # For C code built with floating-point support, exclude V but keep F and=
 D.
> -CC_FLAGS_FPU  :=3D -march=3D$(shell echo $(riscv-march-y) | sed -E 's/(r=
v32ima|rv64ima)([^v_]*)v?/\1\2/')
> +CC_FLAGS_FPU  :=3D -march=3D$(shell echo $(riscv-march-y) | sed -E 's/(r=
v32ima?|rv64ima?)([^v_]*)v?/\1\2/')
> =20
>  KBUILD_CFLAGS +=3D -mno-save-restore
> =20
> diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/ato=
mic.h
> index 616b8b332ac5..dc6a8c95c975 100644
> --- a/arch/riscv/include/asm/atomic.h
> +++ b/arch/riscv/include/asm/atomic.h
> @@ -50,6 +50,7 @@ static __always_inline void arch_atomic64_set(atomic64_=
t *v, s64 i)
>   * have the AQ or RL bits set.  These don't return anything, so there's =
only
>   * one version to worry about.
>   */
> +#if defined(__riscv_atomic) || defined(__riscv_zaamo)

| > ...why are we making this a compiletime decision in the first place?
| > Why can't this be an alternative, starting with the zalrsc stuff and
| > moving to the better implementation if available?
|=20
| I started with alternatives approach, see
| https://lore.kernel.org/all/20260114072552.731974-1-vladimir.kondratiev@m=
obileye.com/
| Then I converted it to the static compile-time decision following input
| from Gary Guo that I think is valid, here:
| https://lore.kernel.org/all/DFSQIY6WV4U7.3B3RY31KE739B@garyguo.net/


Okay, that logic from Gary does make some sense. I'll accept that
argument, but again this needs to be communicated in the commit message.

| > Is there some zaamo code that gets generated automatically that we lose
| > out on by always building the kernel with zalrsc instead of with all of=
 a?
|=20
| There's BPF JIT that emits AMO instructions, patch for this is not ready
| yet. These AMO instructions will be emulated and work correctly but very
| slowly.

I think that needs to be part of this series. You're far too focused on
your individual platform where the instructions work, rather than the
holistic solution of lowering our minimum requirements so that platforms
that do not have any AMO support work. The only way that it'd make sense
to move forward with this without the bpf jit patch is if you disabled
bpf entirely when RISCV_ISA_ZAAMO is disabled.

> +#if defined(__riscv_atomic) || defined(__riscv_zaamo)

Something else to note is that we do not use this pattern anywhere else
in arch code as far as I know? We always use the RISC_ISA_WHATEVER
config option to gate conditional stuff. Since RISCV_ISA_A is equivalent
to RISCV_ISA_ZAAMO (unless I am mistaken there somehow) this just collapses
to a single check?

>  #define ATOMIC_OP(op, asm_op, I, asm_type, c_type, prefix)		\
>  static __always_inline							\
>  void arch_atomic##prefix##_##op(c_type i, atomic##prefix##_t *v)	\
> @@ -59,7 +60,25 @@ void arch_atomic##prefix##_##op(c_type i, atomic##pref=
ix##_t *v)	\
>  		: "+A" (v->counter)					\
>  		: "r" (I)						\
>  		: "memory");						\
> -}									\
> +}
> +#elif defined(__riscv_zalrsc)
> +#define ATOMIC_OP(op, asm_op, I, asm_type, c_type, prefix)		\
> +static __always_inline							\
> +void arch_atomic##prefix##_##op(c_type i, atomic##prefix##_t *v)	\
> +{									\
> +	register c_type ret, temp;					\
> +	__asm__ __volatile__ (						\
> +		"1:	lr." #asm_type " %1, %0\n"			\
> +		"	" #asm_op " %2, %1, %3\n"			\
> +		"	sc." #asm_type " %2, %2, %0\n"			\
> +		"	bnez %2, 1b\n"					\
> +		: "+A" (v->counter), "=3D&r" (ret), "=3D&r" (temp)		\
> +		: "r" (I)						\
> +		: "memory");						\
> +}
> +#else
> +#error "Need AMO or LR/SC atomics"

And this error is actually unreachable?

(and so on in every other place that this pattern is repeated)

Cheers,
Conor.

> +#endif

--+2FX1BX//UlnZkwX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaupNmwAKCRB4tDGHoIJi
0lWJAP47/7wo97SPKRn2JxsE8gcUN7h5rA05GC/OEt6LjOPMyAD9ETG5/W9W55Qa
W+OuieCq72k6AUkvJ1n9DOwZIvFKtA0=
=zFph
-----END PGP SIGNATURE-----

--+2FX1BX//UlnZkwX--
