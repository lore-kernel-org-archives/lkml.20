Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793917813;
	b=RiGr5sNNMMGaVopGFmu+qhXhJh2rBx7gXHsn/rdCn21ppC+tP0H08RGnBM33zeuEZtdj
	 vnNb5OHtLB+Gzlcpg1x5SqUbBSKIlyzCvLAZ6wJ7/Eg1rqEijyT2ZX2fbxhqe6kN02j3e
	 c2v1cullhbqVE9yjd/GqNAt9McAXqQ0B7UCNj1ogvALS47e6ov4PnvO6kcfz6qDpEZvhD
	 TfSqASDJVpzrbxPN4kJCifkCtIQUloyS5pOp0DB/hS2XUFkjuGbIc0r46keJDSYybJQeg
	 AF/GKoDS9lM/zXX0u1tVLEo1OGsFfKBoWDpiRR1vaoJyXqIJCZJ4XaYfNlj+/AX0G9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=cAaMsyaxq/hzUovbQXWov0zOr3rsEyWtdK5HVY2JsZc=;
	b=XUFI4JWaYcGYfQeB+7+n85cnad9Rk8gKvcCabDuCgkRyvJeKCvcUAOmoFrYO5zO/770T
	 zi/bvzjWsvdOAscvVC0tXl9G8D7OJ2ki4OWeyig2EdBnmLQs3rccN5+5Xj89reWEUis1T
	 K4NqUHzgNi6k67hwrH87IDFF5tpwP6pU15HZ1LYLf2MxQ+ynnWbkFmXSu6JhU/JACthqK
	 TVVWo0Ar9g2iZR8MYkSBGyOVSXQtCIbknz8kc3wXPQLrwJZN6eeSxFg1nu64dff55L72k
	 HSorYTPlUbsX1F0yuuVqz9SDqQpM7JYjjdkotGRi8RtUqgj++IecZepwilRNbEU/viQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EndB0GMo;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BEE606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 22:30:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59BEE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EndB0GMo
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-490f38e9688so29199f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 14:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917812; x=1794522612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cAaMsyaxq/hzUovbQXWov0zOr3rsEyWtdK5HVY2JsZc=;
        b=EndB0GMoq2m/Lq1I0uNoQpqkg+eaNDcifYpeCgXGyJoGyy7daIqVeQrOuzG7Qg5IZY
         mFRgxWZMuZmDF2OvI3O5uX8/lfvmg62r5NnxWekV5SIOVVe9VqNSVbl3ntCAeU6q/0YE
         VgOwplvg0Q9y0Sox7uYbvgYasrabUzrAXPH4inEoTsuKde4AcpTb0aSqbBXsFXTP4RGd
         UIG2bNa2i8zryHKDlfRYbGVZOH0Rzxmq8kqzxgmsbYVsbA27l0s14eZxwWWdksg4Umtc
         +08aaKaqlfs/0eGOwMmoTlP7VB295R/KgNtxuxwl2/gXcWQyeWyQRoruSgjkNbWpiBC7
         Z4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917812; x=1794522612;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cAaMsyaxq/hzUovbQXWov0zOr3rsEyWtdK5HVY2JsZc=;
        b=oP0K/vWSFDPivkQUEenz02l7BK1sSz1z3Zle/XbkWy2HC9bA8FhHZ7TCAVSy5gB+4B
         5mOCoZeBRlGXnqH5uk4MBHUMFkKf5rtMqWL+iR/AvPL+WIusE5j1noexwYEyMnA5U2U+
         mrKZkf9IaPwO8eRHZEwjjhknFkFVi5rvwTUmEZ8e4is2ByFAEsmgao/wTtj9ilGhe357
         UU/IgHfAxHGSLXUNOMzgNGpwpWaxe4KbqBi8hELtpDHHoxsB8tsiErmxdnAPCendw/qs
         86Rrk7W3VPFSH97mZo0feTDSZ/sqY1S29l5aN66S5AXGkAOexqNT8mPger2ylqJmLAvA
         I0Tw==
X-Forwarded-Encrypted: i=1; AKwUvBxLcKG+sOhTQ/kC9lqiW1zvllvPbU+mbHFtWqiPz6+J9lnhLPx9sc0h/MuMMQjAvGacSCGAotqq5PRG5Go=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ssFYiIcjGlakyGj9cek99nPRkcow5xs8JK7G2BGkiRzGnlqL1
	nJGcAvwKVG9D1UTFZ6tpFLpR4MRYrqxz6PXYGgc75bCn1TwZcljFo9+o
X-Gm-Gg: AYBFou1qnC1qjV0XzvCSFyo4Q7E4pVIggo8kRnkCeRYUtK78snLr/TGRwQH/NFHtAWK
	mtPRL05hBWHE33pWzppgnbsqTJaQp74cEaQEVnIFM1IerbtCtmqlsLfr1xyFWKKo1jiJWa75w8V
	pHXB8e3xeUoZPTYqH9Oyh7gNfmlJxYvGm8EZagS5OWmkqHf9jnITOJ9KGSPiJzIjAX/aV7ymrYD
	Nq9J+nXvmddCpVaHsBN9asrWuwesBz+TRnNMJ1ydqfIGXBu++Aq6oz7/2bCkuf52CkT/wxy2Tmg
	PZXB+uFxG2Eq0oxnZjMTB6GmKsDd0cflFSJ/R1A7cejVKV71FB9LiXpdAsK4QtqgqXPmcNNt4v9
	D5J/IRBQ5vBw8sBIF24Ls7ILab73UQdGJqBbEk5bSKTVujKwAND9yhKO/cEQI7LPtJ/GzLwvJeu
	cWg7M1ARDbhbhwQJl7LNv1403HUdHIIbmCEVfJwDMLgf0P0E+kiQTo7IjQhNcEMk8//HCGQ8MNp
	GB4xx+JGJ1E9PoGtMOhXnHmWwbYPPfSQ4Fg/yhuVD3V5aW/sARR4s2ZWXGvycoRI2FBL21xl6gJ
	PoI+T9Fg9X7lqiCCgsMqKyw021799zyQn/HRFglEGDsILYMbkRYw48KxM93YdptMjGj4+lCFnSJ
	44si2NZtZX7DVStZi9R6X9Z+cEmD19qdG41B/XpLLucRBO+VkEOi9jU/jtFeKbTK6xygF4n+/Kf
	wM89uUg+pvTW9C
X-Received: by 2002:a05:6000:3c4:b0:48d:f852:c66b with SMTP id ffacd0b85a97d-4911a58b726mr7341283f8f.22.1793917811398;
        Thu, 05 Nov 2026 14:30:11 -0800 (PST)
Received: from ?IPV6:2a01:261:818:9401:46b1:9fe8:a5e3:32be? ([2a01:261:818:9401:46b1:9fe8:a5e3:32be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7702477sm37694f8f.41.2026.11.05.14.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 14:30:10 -0800 (PST)
Message-ID: <56e7300b-cd1c-4fb4-b269-2243394c6df0@gmail.com>
Date: Thu, 5 Nov 2026 23:30:08 +0100
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
Subject: Re: [PATCH 3/7] x86: make CX8 usage unconditional
To: Arnd Bergmann <arnd@kernel.org>, Ingo Molnar <mingo@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, Thomas Gleixner
 <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-um@lists.infradead.org
References: <20261105163440.2381661-1-arnd@kernel.org>
 <20261105163440.2381661-4-arnd@kernel.org>
Content-Language: en-US
From: Uros Bizjak <ubizjak@gmail.com>
In-Reply-To: <20261105163440.2381661-4-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/5/26 17:34, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> All supported CPUs now provide the cmpxchg8b instruction, so remove
> all compile-time and runtime checks for its presence and the fallback
> implementation, to assume it just works.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/um/include/asm/asm-prototypes.h  |   4 -
>   arch/x86/Kconfig.cpu                  |   3 -
>   arch/x86/Kconfig.cpufeatures          |   6 +-
>   arch/x86/include/asm/asm-prototypes.h |   4 -
>   arch/x86/include/asm/atomic64_32.h    |  15 --
>   arch/x86/include/asm/cmpxchg_32.h     |  76 +---------
>   arch/x86/include/asm/percpu.h         |  14 +-
>   arch/x86/lib/Makefile                 |   4 -
>   arch/x86/lib/atomic64_386_32.S        | 195 --------------------------
>   arch/x86/lib/cmpxchg8b_emu.S          |  97 -------------
>   arch/x86/um/Kconfig                   |   2 +-
>   arch/x86/um/Makefile                  |   3 +-
>   lib/atomic64_test.c                   |   7 +-
>   13 files changed, 13 insertions(+), 417 deletions(-)
>   delete mode 100644 arch/x86/lib/atomic64_386_32.S
>   delete mode 100644 arch/x86/lib/cmpxchg8b_emu.S
> 
> diff --git a/arch/um/include/asm/asm-prototypes.h b/arch/um/include/asm/asm-prototypes.h
> index 408b31d59127..b446eec98ed8 100644
> --- a/arch/um/include/asm/asm-prototypes.h
> +++ b/arch/um/include/asm/asm-prototypes.h
> @@ -1,6 +1,2 @@
>   #include <asm-generic/asm-prototypes.h>
>   #include <asm/checksum.h>
> -
> -#ifdef CONFIG_UML_X86
> -extern void cmpxchg8b_emu(void);
> -#endif
> diff --git a/arch/x86/Kconfig.cpu b/arch/x86/Kconfig.cpu
> index f2c1f544f5f9..832e4bd9f6e0 100644
> --- a/arch/x86/Kconfig.cpu
> +++ b/arch/x86/Kconfig.cpu
> @@ -274,9 +274,6 @@ config X86_HAVE_PAE
>   	def_bool y
>   	depends on MCRUSOE || MEFFICEON || MCYRIXIII || MPENTIUM4 || MPENTIUMM || MPENTIUMIII || MPENTIUMII || M686 || MVIAC7 || MATOM || X86_64
>   
> -config X86_CX8
> -	def_bool y
> -
>   # this should be set for all -march=.. options where the compiler
>   # generates cmov.
>   config X86_CMOV
> diff --git a/arch/x86/Kconfig.cpufeatures b/arch/x86/Kconfig.cpufeatures
> index 09833c88f9ff..e0f2ff65377d 100644
> --- a/arch/x86/Kconfig.cpufeatures
> +++ b/arch/x86/Kconfig.cpufeatures
> @@ -40,9 +40,6 @@ config X86_REQUIRED_FEATURE_NOPL
>   	def_bool y
>   	depends on X86_64
>   
> -config X86_REQUIRED_FEATURE_CX8
> -	def_bool y
> -
>   # this should be set for all -march=.. options where the compiler
>   # generates cmov.
>   config X86_REQUIRED_FEATURE_CMOV
> @@ -59,6 +56,9 @@ config X86_REQUIRED_FEATURE_SYSFAST32
>   	def_bool y
>   	depends on X86_64 && !X86_FRED
>   
> +config X86_REQUIRED_FEATURE_CX8
> +	def_bool y
> +
>   config X86_REQUIRED_FEATURE_CPUID
>   	def_bool y
>   	depends on X86_64
> diff --git a/arch/x86/include/asm/asm-prototypes.h b/arch/x86/include/asm/asm-prototypes.h
> index 11c6fecc3ad7..6ec680a36dea 100644
> --- a/arch/x86/include/asm/asm-prototypes.h
> +++ b/arch/x86/include/asm/asm-prototypes.h
> @@ -16,10 +16,6 @@
>   #include <asm/gsseg.h>
>   #include <asm/nospec-branch.h>
>   
> -#ifndef CONFIG_X86_CX8
> -extern void cmpxchg8b_emu(void);
> -#endif
> -
>   #ifdef CONFIG_STACKPROTECTOR
>   extern unsigned long __ref_stack_chk_guard;
>   #endif
> diff --git a/arch/x86/include/asm/atomic64_32.h b/arch/x86/include/asm/atomic64_32.h
> index ab838205c1c6..e3da5d0094c4 100644
> --- a/arch/x86/include/asm/atomic64_32.h
> +++ b/arch/x86/include/asm/atomic64_32.h
> @@ -48,7 +48,6 @@ static __always_inline s64 arch_atomic64_read_nonatomic(const atomic64_t *v)
>   	ATOMIC64_EXPORT(atomic64_##sym)
>   #endif
>   
> -#ifdef CONFIG_X86_CX8
>   #define __alternative_atomic64(f, g, out, in, clobbers...)		\
>   	asm volatile("call %c[func]"					\
>   		     : ALT_OUTPUT_SP(out) \
> @@ -57,20 +56,6 @@ static __always_inline s64 arch_atomic64_read_nonatomic(const atomic64_t *v)
>   		     : clobbers)
>   
>   #define ATOMIC64_DECL(sym) ATOMIC64_DECL_ONE(sym##_cx8)
> -#else
> -#define __alternative_atomic64(f, g, out, in, clobbers...)		\
> -	alternative_call(atomic64_##f##_386, atomic64_##g##_cx8,	\
> -			 X86_FEATURE_CX8, ASM_OUTPUT(out),		\
> -			 ASM_INPUT(in), clobbers)
> -
> -#define ATOMIC64_DECL(sym) ATOMIC64_DECL_ONE(sym##_cx8); \
> -	ATOMIC64_DECL_ONE(sym##_386)
> -
> -ATOMIC64_DECL_ONE(add_386);
> -ATOMIC64_DECL_ONE(sub_386);
> -ATOMIC64_DECL_ONE(inc_386);
> -ATOMIC64_DECL_ONE(dec_386);
> -#endif
>   
>   #define alternative_atomic64(f, out, in, clobbers...) \
>   	__alternative_atomic64(f, f, ASM_OUTPUT(out), ASM_INPUT(in), clobbers)
> diff --git a/arch/x86/include/asm/cmpxchg_32.h b/arch/x86/include/asm/cmpxchg_32.h
> index e85c221ed1c9..1019c4bce620 100644
> --- a/arch/x86/include/asm/cmpxchg_32.h
> +++ b/arch/x86/include/asm/cmpxchg_32.h
> @@ -68,8 +68,6 @@ static __always_inline bool __try_cmpxchg64_local(volatile u64 *ptr, u64 *oldp,
>   	return __arch_try_cmpxchg64(ptr, oldp, new,);
>   }
>   
> -#ifdef CONFIG_X86_CX8
> -
>   #define arch_cmpxchg64 __cmpxchg64
>   
>   #define arch_cmpxchg64_local __cmpxchg64_local
> @@ -78,78 +76,6 @@ static __always_inline bool __try_cmpxchg64_local(volatile u64 *ptr, u64 *oldp,
>   
>   #define arch_try_cmpxchg64_local __try_cmpxchg64_local
>   
> -#else
> -
> -/*
> - * Building a kernel capable running on 80386 and 80486. It may be necessary
> - * to simulate the cmpxchg8b on the 80386 and 80486 CPU.
> - */
> -
> -#define __arch_cmpxchg64_emu(_ptr, _old, _new, _lock_loc, _lock)	\
> -({									\
> -	union __u64_halves o = { .full = (_old), },			\
> -			   n = { .full = (_new), };			\
> -									\
> -	asm_inline volatile(						\
> -		ALTERNATIVE(_lock_loc					\
> -			    "call cmpxchg8b_emu",			\
> -			    _lock "cmpxchg8b %a[ptr]", X86_FEATURE_CX8)	\
> -		: ALT_OUTPUT_SP("+a" (o.low), "+d" (o.high))		\
> -		: "b" (n.low), "c" (n.high),				\
> -		  [ptr] "S" (_ptr)					\
> -		: "memory");						\
> -									\
> -	o.full;								\
> -})
> -
> -static __always_inline u64 arch_cmpxchg64(volatile u64 *ptr, u64 old, u64 new)
> -{
> -	return __arch_cmpxchg64_emu(ptr, old, new, , "lock ");
> -}
> -#define arch_cmpxchg64 arch_cmpxchg64
> -
> -static __always_inline u64 arch_cmpxchg64_local(volatile u64 *ptr, u64 old, u64 new)
> -{
> -	return __arch_cmpxchg64_emu(ptr, old, new, ,);
> -}
> -#define arch_cmpxchg64_local arch_cmpxchg64_local
> -
> -#define __arch_try_cmpxchg64_emu(_ptr, _oldp, _new, _lock_loc, _lock)	\
> -({									\
> -	union __u64_halves o = { .full = *(_oldp), },			\
> -			   n = { .full = (_new), };			\
> -	bool ret;							\
> -									\
> -	asm_inline volatile(						\
> -		ALTERNATIVE(_lock_loc					\
> -			    "call cmpxchg8b_emu",			\
> -			    _lock "cmpxchg8b %a[ptr]", X86_FEATURE_CX8) \
> -		: ALT_OUTPUT_SP("=@ccz" (ret),				\
> -				"+a" (o.low), "+d" (o.high))		\
> -		: "b" (n.low), "c" (n.high),				\
> -		  [ptr] "S" (_ptr)					\
> -		: "memory");						\
> -									\
> -	if (unlikely(!ret))						\
> -		*(_oldp) = o.full;					\
> -									\
> -	likely(ret);							\
> -})
> -
> -static __always_inline bool arch_try_cmpxchg64(volatile u64 *ptr, u64 *oldp, u64 new)
> -{
> -	return __arch_try_cmpxchg64_emu(ptr, oldp, new, , "lock ");
> -}
> -#define arch_try_cmpxchg64 arch_try_cmpxchg64
> -
> -static __always_inline bool arch_try_cmpxchg64_local(volatile u64 *ptr, u64 *oldp, u64 new)
> -{
> -	return __arch_try_cmpxchg64_emu(ptr, oldp, new, ,);
> -}
> -#define arch_try_cmpxchg64_local arch_try_cmpxchg64_local
> -
> -#endif
> -
> -#define system_has_cmpxchg64()		boot_cpu_has(X86_FEATURE_CX8)
> +#define system_has_cmpxchg64()		true
>   
>   #endif /* _ASM_X86_CMPXCHG_32_H */
> diff --git a/arch/x86/include/asm/percpu.h b/arch/x86/include/asm/percpu.h
> index cef9a4ca9841..539abf94828d 100644
> --- a/arch/x86/include/asm/percpu.h
> +++ b/arch/x86/include/asm/percpu.h
> @@ -330,11 +330,9 @@ do {									\
>   	old__.var = _oval;						\
>   	new__.var = _nval;						\
>   									\
> -	asm_inline qual (						\
> -		ALTERNATIVE("call this_cpu_cmpxchg8b_emu",		\
> -			    "cmpxchg8b " __percpu_arg([var]), X86_FEATURE_CX8) \
> -		: ALT_OUTPUT_SP([var] "+m" (__my_cpu_var(_var)),	\
> -				"+a" (old__.low), "+d" (old__.high))	\
> +	asm_inline qual ("cmpxchg8b " __percpu_arg([var])		\

This can be plain "asm" instead of "asm_inline"; there is only one asm 
instruction in the asm template.

> +		: [var] "+m" (__my_cpu_var(_var)),			\
> +				"+a" (old__.low), "+d" (old__.high)	\
>   		: "b" (new__.low), "c" (new__.high),			\
>   		  "S" (&(_var))						\

The line above was needed to force address of _var in %esi. This is not 
needed anymore.
>   		: "memory");						\
> @@ -359,10 +357,8 @@ do {									\
>   	old__.var = *_oval;						\
>   	new__.var = _nval;						\
>   									\
> -	asm_inline qual (						\
> -		ALTERNATIVE("call this_cpu_cmpxchg8b_emu",		\
> -			    "cmpxchg8b " __percpu_arg([var]), X86_FEATURE_CX8) \
> -		: ALT_OUTPUT_SP("=@ccz" (success),			\
> +	asm_inline qual ("cmpxchg8b " __percpu_arg([var])		\

Also here, use "asm" and remove "S" constraint. Please see [1].

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?h=WIP.x86/cpu&id=8cfdd354dae90a3db46c351d15c801dfbf76fc5a

Uros.

> +		: "=@ccz" (success),					\
>   				[var] "+m" (__my_cpu_var(_var)),	\
>   				"+a" (old__.low), "+d" (old__.high))	\
>   		: "b" (new__.low), "c" (new__.high),			\
> diff --git a/arch/x86/lib/Makefile b/arch/x86/lib/Makefile
> index 2dba7f83ef97..210af275f468 100644
> --- a/arch/x86/lib/Makefile
> +++ b/arch/x86/lib/Makefile
> @@ -48,10 +48,6 @@ ifeq ($(CONFIG_X86_32),y)
>           lib-y += strstr_32.o
>           lib-y += string_32.o
>           lib-y += memmove_32.o
> -        lib-y += cmpxchg8b_emu.o
> -ifneq ($(CONFIG_X86_CX8),y)
> -        lib-y += atomic64_386_32.o
> -endif
>   else
>   ifneq ($(CONFIG_GENERIC_CSUM),y)
>           lib-y += csum-partial_64.o csum-copy_64.o csum-wrappers_64.o
> diff --git a/arch/x86/lib/atomic64_386_32.S b/arch/x86/lib/atomic64_386_32.S
> deleted file mode 100644
> index e768815e58ae..000000000000
> --- a/arch/x86/lib/atomic64_386_32.S
> +++ /dev/null
> @@ -1,195 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-or-later */
> -/*
> - * atomic64_t for 386/486
> - *
> - * Copyright © 2010  Luca Barbieri
> - */
> -
> -#include <linux/linkage.h>
> -#include <asm/alternative.h>
> -
> -/* if you want SMP support, implement these with real spinlocks */
> -.macro IRQ_SAVE reg
> -	pushfl
> -	cli
> -.endm
> -
> -.macro IRQ_RESTORE reg
> -	popfl
> -.endm
> -
> -#define BEGIN_IRQ_SAVE(op) \
> -.macro endp; \
> -SYM_FUNC_END(atomic64_##op##_386); \
> -.purgem endp; \
> -.endm; \
> -SYM_FUNC_START(atomic64_##op##_386); \
> -	IRQ_SAVE v;
> -
> -#define ENDP endp
> -
> -#define RET_IRQ_RESTORE \
> -	IRQ_RESTORE v; \
> -	RET
> -
> -#define v %ecx
> -BEGIN_IRQ_SAVE(read)
> -	movl  (v), %eax
> -	movl 4(v), %edx
> -	RET_IRQ_RESTORE
> -ENDP
> -#undef v
> -
> -#define v %esi
> -BEGIN_IRQ_SAVE(set)
> -	movl %ebx,  (v)
> -	movl %ecx, 4(v)
> -	RET_IRQ_RESTORE
> -ENDP
> -#undef v
> -
> -#define v  %esi
> -BEGIN_IRQ_SAVE(xchg)
> -	movl  (v), %eax
> -	movl 4(v), %edx
> -	movl %ebx,  (v)
> -	movl %ecx, 4(v)
> -	RET_IRQ_RESTORE
> -ENDP
> -#undef v
> -
> -#define v %ecx
> -BEGIN_IRQ_SAVE(add)
> -	addl %eax,  (v)
> -	adcl %edx, 4(v)
> -	RET_IRQ_RESTORE
> -ENDP
> -#undef v
> -
> -#define v %ecx
> -BEGIN_IRQ_SAVE(add_return)
> -	addl  (v), %eax
> -	adcl 4(v), %edx
> -	movl %eax,  (v)
> -	movl %edx, 4(v)
> -	RET_IRQ_RESTORE
> -ENDP
> -#undef v
> -
> -#define v %ecx
> -BEGIN_IRQ_SAVE(sub)
> -	subl %eax,  (v)
> -	sbbl %edx, 4(v)
> -	RET_IRQ_RESTORE
> -ENDP
> -#undef v
> -
> -#define v %ecx
> -BEGIN_IRQ_SAVE(sub_return)
> -	negl %edx
> -	negl %eax
> -	sbbl $0, %edx
> -	addl  (v), %eax
> -	adcl 4(v), %edx
> -	movl %eax,  (v)
> -	movl %edx, 4(v)
> -	RET_IRQ_RESTORE
> -ENDP
> -#undef v
> -
> -#define v %esi
> -BEGIN_IRQ_SAVE(inc)
> -	addl $1,  (v)
> -	adcl $0, 4(v)
> -	RET_IRQ_RESTORE
> -ENDP
> -#undef v
> -
> -#define v %esi
> -BEGIN_IRQ_SAVE(inc_return)
> -	movl  (v), %eax
> -	movl 4(v), %edx
> -	addl $1, %eax
> -	adcl $0, %edx
> -	movl %eax,  (v)
> -	movl %edx, 4(v)
> -	RET_IRQ_RESTORE
> -ENDP
> -#undef v
> -
> -#define v %esi
> -BEGIN_IRQ_SAVE(dec)
> -	subl $1,  (v)
> -	sbbl $0, 4(v)
> -	RET_IRQ_RESTORE
> -ENDP
> -#undef v
> -
> -#define v %esi
> -BEGIN_IRQ_SAVE(dec_return)
> -	movl  (v), %eax
> -	movl 4(v), %edx
> -	subl $1, %eax
> -	sbbl $0, %edx
> -	movl %eax,  (v)
> -	movl %edx, 4(v)
> -	RET_IRQ_RESTORE
> -ENDP
> -#undef v
> -
> -#define v %esi
> -BEGIN_IRQ_SAVE(add_unless)
> -	addl %eax, %ecx
> -	adcl %edx, %edi
> -	addl  (v), %eax
> -	adcl 4(v), %edx
> -	cmpl %eax, %ecx
> -	je 3f
> -1:
> -	movl %eax,  (v)
> -	movl %edx, 4(v)
> -	movl $1, %eax
> -2:
> -	RET_IRQ_RESTORE
> -3:
> -	cmpl %edx, %edi
> -	jne 1b
> -	xorl %eax, %eax
> -	jmp 2b
> -ENDP
> -#undef v
> -
> -#define v %esi
> -BEGIN_IRQ_SAVE(inc_not_zero)
> -	movl  (v), %eax
> -	movl 4(v), %edx
> -	testl %eax, %eax
> -	je 3f
> -1:
> -	addl $1, %eax
> -	adcl $0, %edx
> -	movl %eax,  (v)
> -	movl %edx, 4(v)
> -	movl $1, %eax
> -2:
> -	RET_IRQ_RESTORE
> -3:
> -	testl %edx, %edx
> -	jne 1b
> -	jmp 2b
> -ENDP
> -#undef v
> -
> -#define v %esi
> -BEGIN_IRQ_SAVE(dec_if_positive)
> -	movl  (v), %eax
> -	movl 4(v), %edx
> -	subl $1, %eax
> -	sbbl $0, %edx
> -	js 1f
> -	movl %eax,  (v)
> -	movl %edx, 4(v)
> -1:
> -	RET_IRQ_RESTORE
> -ENDP
> -#undef v
> diff --git a/arch/x86/lib/cmpxchg8b_emu.S b/arch/x86/lib/cmpxchg8b_emu.S
> deleted file mode 100644
> index d4bb24347ff8..000000000000
> --- a/arch/x86/lib/cmpxchg8b_emu.S
> +++ /dev/null
> @@ -1,97 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -
> -#include <linux/export.h>
> -#include <linux/linkage.h>
> -#include <asm/percpu.h>
> -#include <asm/processor-flags.h>
> -
> -.text
> -
> -#ifndef CONFIG_X86_CX8
> -
> -/*
> - * Emulate 'cmpxchg8b (%esi)' on UP
> - *
> - * Inputs:
> - * %esi : memory location to compare
> - * %eax : low 32 bits of old value
> - * %edx : high 32 bits of old value
> - * %ebx : low 32 bits of new value
> - * %ecx : high 32 bits of new value
> - */
> -SYM_FUNC_START(cmpxchg8b_emu)
> -
> -	pushfl
> -	cli
> -
> -	cmpl	(%esi), %eax
> -	jne	.Lnot_same
> -	cmpl	4(%esi), %edx
> -	jne	.Lnot_same
> -
> -	movl	%ebx, (%esi)
> -	movl	%ecx, 4(%esi)
> -
> -	orl	$X86_EFLAGS_ZF, (%esp)
> -
> -	popfl
> -	RET
> -
> -.Lnot_same:
> -	movl	(%esi), %eax
> -	movl	4(%esi), %edx
> -
> -	andl	$(~X86_EFLAGS_ZF), (%esp)
> -
> -	popfl
> -	RET
> -
> -SYM_FUNC_END(cmpxchg8b_emu)
> -EXPORT_SYMBOL(cmpxchg8b_emu)
> -
> -#endif
> -
> -#ifndef CONFIG_UML
> -
> -/*
> - * Emulate 'cmpxchg8b %fs:(%rsi)'
> - *
> - * Inputs:
> - * %esi : memory location to compare
> - * %eax : low 32 bits of old value
> - * %edx : high 32 bits of old value
> - * %ebx : low 32 bits of new value
> - * %ecx : high 32 bits of new value
> - *
> - * Notably this is not LOCK prefixed and is not safe against NMIs
> - */
> -SYM_FUNC_START(this_cpu_cmpxchg8b_emu)
> -
> -	pushfl
> -	cli
> -
> -	cmpl	__percpu (%esi), %eax
> -	jne	.Lnot_same2
> -	cmpl	__percpu 4(%esi), %edx
> -	jne	.Lnot_same2
> -
> -	movl	%ebx, __percpu (%esi)
> -	movl	%ecx, __percpu 4(%esi)
> -
> -	orl	$X86_EFLAGS_ZF, (%esp)
> -
> -	popfl
> -	RET
> -
> -.Lnot_same2:
> -	movl	__percpu (%esi), %eax
> -	movl	__percpu 4(%esi), %edx
> -
> -	andl	$(~X86_EFLAGS_ZF), (%esp)
> -
> -	popfl
> -	RET
> -
> -SYM_FUNC_END(this_cpu_cmpxchg8b_emu)
> -
> -#endif
> diff --git a/arch/x86/um/Kconfig b/arch/x86/um/Kconfig
> index 44b12e45f9a0..5b78440a78b9 100644
> --- a/arch/x86/um/Kconfig
> +++ b/arch/x86/um/Kconfig
> @@ -13,7 +13,7 @@ config UML_X86
>   	select ARCH_USE_QUEUED_SPINLOCKS
>   	select DCACHE_WORD_ACCESS
>   	select HAVE_EFFICIENT_UNALIGNED_ACCESS
> -	select UML_SUBARCH_SUPPORTS_SMP if X86_CX8
> +	select UML_SUBARCH_SUPPORTS_SMP
>   
>   config 64BIT
>   	bool "64-bit kernel" if "$(SUBARCH)" = "x86"
> diff --git a/arch/x86/um/Makefile b/arch/x86/um/Makefile
> index 100b68f601f9..716da7b1e3e9 100644
> --- a/arch/x86/um/Makefile
> +++ b/arch/x86/um/Makefile
> @@ -19,8 +19,7 @@ ifeq ($(CONFIG_X86_32),y)
>   
>   obj-y += syscalls_32.o
>   
> -subarch-y = ../lib/string_32.o ../lib/atomic64_32.o ../lib/atomic64_cx8_32.o
> -subarch-y += ../lib/cmpxchg8b_emu.o ../lib/atomic64_386_32.o
> +subarch-y = ../lib/string_32.o ../lib/atomic64_32.o
>   subarch-y += ../lib/checksum_32.o
>   subarch-y += ../kernel/sys_ia32.o
>   
> diff --git a/lib/atomic64_test.c b/lib/atomic64_test.c
> index d726068358c7..37af41df3e6a 100644
> --- a/lib/atomic64_test.c
> +++ b/lib/atomic64_test.c
> @@ -251,15 +251,12 @@ static __init int test_atomics_init(void)
>   	test_atomic64();
>   
>   #ifdef CONFIG_X86
> -	pr_info("passed for %s platform %s CX8 and %s SSE\n",
> +	pr_info("passed for %s platform %s SSE\n",
>   #ifdef CONFIG_X86_64
>   		"x86-64",
> -#elif defined(CONFIG_X86_CX8)
> -		"i586+",
>   #else
> -		"i386+",
> +		"i586+",
>   #endif
> -	       boot_cpu_has(X86_FEATURE_CX8) ? "with" : "without",
>   	       boot_cpu_has(X86_FEATURE_XMM) ? "with" : "without");
>   #else
>   	pr_info("passed\n");

