Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794343603;
	b=N1O3t7zjNwITRAKqQDpW0l++06T5l/UMGuVcqykErCUzYiIY5FQJ4xjOyaZuhn1y23WG
	 9BEYV87Qwwql4IX7j8SxWbWF/TTDM926IrWIL0rbcNYeF8RqB/YffVTaZdVrZnjsecLOO
	 OFSEx78sutrttYHDLRTrjiOw4pr6lDj/HOgbev4yOMxC4ZAT7dDkhN9UqPKlKk5ZetVJN
	 P8N+nkn/8sBeokC+Ijftq+QGN/+/MP4A56/i0XmVWxrPTnbjv7FROWT0pJ93/mcOTjyQr
	 pR8VUi5ED9myfdu0N0eyJ+ceD15IdJeqAfa+yZwEoCU+YO+kaKjgTsBAZc756bdS75Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794343603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=+RTsY+hReKg5lt2wgpCxfAldMdqWp33FHZKP52N/M7M=;
	b=QvYlG2Tsxts+wC3B7LRx5rFkP+TtRCi3NWb5bvf34tV/pqF0L5OoE6gHp4wL9sVEX0Sx
	 qaX+rz9bEzfqegR52JLQXuvQLkVWgVSAJRCgByvLB6z3kbqTuS56FxyaDYpHOa4O0nXc7
	 NPaNDEEsJbpsxC7Gk+D3D0FRwy9JAwIwLvp3K2TzUyYiKhXVr4q8dBJTjVR4wQZTudNef
	 j9xF9d2SqAzE3CWOFIL5xKYV1KiWbryksO6BKy96sWq8fwNAK0oQiHk1DmKSK7s40zulR
	 mD3kPJZ/vzSIDTk1TH3ilo93cV3nLgDZpCvMGzBv7PqiWqh2rqxSr6z5S2H4+e/DidQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eWItCu8w;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACBD606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:46:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DACBD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eWItCu8w
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c40f29667e6so367569966b.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794343601; x=1794948401; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+RTsY+hReKg5lt2wgpCxfAldMdqWp33FHZKP52N/M7M=;
        b=eWItCu8wScwYJCdvcrAzJHdYdkHinkYkRmBX0DtR1T8i0hZ5ZJ99hmoLq8rHGOF7e8
         hxJwwDrd3O/8r+zxL6sY12Pq21vXcsBwR/qg/pgdpYGYMxl3WiUZCwXtYLQhzuVN9HwG
         9v4iCFgH3yYC0IflCmPQSE+ofPSGpK7MCrW1/w1nZRBfhpcSSa3/9Mq6gooqdoAfV5GN
         CORVzRiurfchluSnqmIZpHJzKKJWZ04x+dNJXtAz4v3txXUBG2xvfO/CPkg2FvhrXDNc
         vPbjqkUn4Sh+zMAlgs8Yv9IonZcR7vFjgvfhQCyegNYfmtFl9B6wCkvW76a7NY4evvN8
         LBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794343601; x=1794948401;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+RTsY+hReKg5lt2wgpCxfAldMdqWp33FHZKP52N/M7M=;
        b=HXnV0XKkmzZeXYSLg6ZqOBrefL5WmxNkj5KbmBFhfp1EswbVeTbUv8NRGWxRfm3gJ8
         i5UlHwqKpCwj9TcPG9tUuntkYwifFrp2IO1lfhhi4/m7Z7p0DsO7dEfsrH/T4kzSQ4G1
         kNR50rqmfE0x3/HQ2FYKZQ2XV9elzL8km9dHL5BhBsco9EY1e2u5cTmLiQ26Twdlxmgc
         vvlG2HGeziOlEeVvdBN5UchZNOwpL9Qti7pMN8nzGryuWQ8IGgSFHu7bZzY7X2wEhzCU
         j1nNavIULvPqZt4MFmo4qd2Yli1a6TcQ12nAm2ONZ0ey19hBo3F/k7UuQ8WbI1RtDU3i
         hgrQ==
X-Forwarded-Encrypted: i=1; AL+hErE3NxHzw5tighTmygFs6J9s0Qx4m4Xc0T29kQo6H/hWYbUxyf7wDjtBFFlS5sKrJ3r1d5tqeGznua16Pj0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DCy724KxxwjB2XWtZabnazQtXgEOfH8cD+09JGDPxpP9p4b44
	4Ahdzvf2Robe5KEpJGdn3E/KXiSdOoHKo5tCgmpYrFDJiWns0f1BBgjo+tt0u8OQO3a5zlyXYQg
	T82WFAA==
X-Gm-Gg: AYBFou1Q5mNG0MXRqi3YpQfVcbpo1PzdEH+t/W6P39VaOGMQ3bhY47NhhiiimmntFZn
	OiVl7LXmWOnzqlBnc0FcjHzhQ5DYJZ07ZeAZKOr3PjqEJ62XqEwBu4OF50SUmm/z7j5G3RtPGm+
	QeXTc6m4pskKVaVA45zrA1Cx4Ee3xNuO2y3J1PEnU5spDoyDF5EFQMwPD5bF/koc3RgMw6ksbCa
	ch+nkDkxPj2TbGTpaHXpZk/a9l9cbICn6kZ0q5993leLhEf3/ZGjPjjPLivfaZfW2tvdLYoAdyi
	UguXtACWPDM1lilLkyn9XonwQd8Owp0L9CZljbh3mMy6l0GEhcRO38vCRXOgiQNPWQrnyYSx5G8
	xsuAlkeoYmvGubArGQWzQeXCI3MFW8svEfhUg2Ez3OWyaFy8YSF/vqF7hTD4QyKRQSgDz8+dZDg
	U5zhZSyd8AcB/Q9J+vYfB+JrKQOz1aTA1c1XcZ227QqOoYfF5Ec120hBu4y+ADTeRBf89H6biOu
	aCvEKo14xW+kRe8XSq7rv0OX5LVGS/oX7wGaXai57atmHWpgMyR1fHir7VLIWRMMC73Vcz1nmAc
	O1QHJnBhUAIOLwhua8oL7MtN26qLOc9IIni8FjvCalmHZCJLD6e43KcsZVMIkSQ2
X-Received: by 2002:a17:907:e98a:b0:c50:5e0a:fbad with SMTP id a640c23a62f3a-c5066c9ecefmr20452666b.39.1794343600726;
        Tue, 10 Nov 2026 12:46:40 -0800 (PST)
Received: from google.com (202.70.147.34.bc.googleusercontent.com. [34.147.70.202])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7579031e0sm1579058a12.29.2026.11.10.12.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 12:46:40 -0800 (PST)
Date: Tue, 10 Nov 2026 21:46:36 +0100
From: =?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/24] arm64: Check MTE once per fault-handling section
Message-ID: <avN-XAMZ4bZ72vTO@google.com>
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
 <20261107-mte-kasan-split-v1-5-d84ea5f30f94@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261107-mte-kasan-split-v1-5-d84ea5f30f94@google.com>

On Sat, Nov 07, 2026 at 04:36:11PM +0100, Pierre-Clément Tosi wrote:
> Call system_uses_mte_async_or_asymm_mode() only once per section. This
> improves performance (fewer instructions at runtime and fewer static
> branches needing to be tracked and patched), correctness (no theoretical
> race between the execution of the section and the static branch being
> toggled, which could leave TCO in an unexpected state), and code clarity
> (no 3-level indirection with redundant checks to flip one PSTATE bit).
> 
> Signed-off-by: Pierre-Clément Tosi <ptosi@google.com>
> ---
>  arch/arm64/include/asm/mte-kasan.h      | 25 -----------
>  arch/arm64/include/asm/uaccess.h        | 80 ++++++++++++++++++++-------------
>  arch/arm64/include/asm/word-at-a-time.h | 22 +++++++--
>  3 files changed, 67 insertions(+), 60 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/mte-kasan.h b/arch/arm64/include/asm/mte-kasan.h
> index 467d1d41a392..b474fca3ea56 100644
> --- a/arch/arm64/include/asm/mte-kasan.h
> +++ b/arch/arm64/include/asm/mte-kasan.h
> @@ -48,23 +48,6 @@ static inline void mte_enable_tco(void)
>  	asm volatile(ALTERNATIVE("nop", SET_PSTATE_TCO(1), ARM64_MTE));
>  }
>  
> -/*
> - * These functions disable tag checking only if in MTE async mode
> - * since the sync mode generates exceptions synchronously and the
> - * nofault or load_unaligned_zeropad can handle them.
> - */
> -static inline void __mte_disable_tco_async(void)
> -{
> -	if (system_uses_mte_async_or_asymm_mode())
> -		mte_disable_tco();
> -}
> -
> -static inline void __mte_enable_tco_async(void)
> -{
> -	if (system_uses_mte_async_or_asymm_mode())
> -		mte_enable_tco();
> -}
> -
>  /*
>   * These functions are meant to be only used from KASAN runtime through
>   * the arch_*() interface defined in asm/memory.h.
> @@ -197,14 +180,6 @@ static inline void mte_enable_tco(void)
>  {
>  }
>  
> -static inline void __mte_disable_tco_async(void)
> -{
> -}
> -
> -static inline void __mte_enable_tco_async(void)
> -{
> -}
> -
>  static inline u8 mte_get_ptr_tag(void *ptr)
>  {
>  	return 0xFF;
> diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
> index f0924dc0bd64..9e3957ee3642 100644
> --- a/arch/arm64/include/asm/uaccess.h
> +++ b/arch/arm64/include/asm/uaccess.h
> @@ -240,6 +240,24 @@ do {										\
>  	(x) = (__force __typeof__(*(ptr)))__gu_val;				\
>  } while (0)
>  
> +/*
> + * We must not call into the scheduler between setting and clearing TCO. As `x`
> + * and `ptr` may contain blocking functions, we must evaluate these outside of
> + * the critical section.
> + */
> +#define __raw_get_mem_tco(ldr, x, ptr, label, type)			\
> +do {									\
> +	__label__ __rgm_err;						\
> +									\
> +	asm volatile(SET_PSTATE_TCO(1));				\
> +	__raw_get_mem(ldr, x, ptr, __rgm_err, type);			\
> +	asm volatile(SET_PSTATE_TCO(0));				\
> +	break;								\
> +__rgm_err:								\
> +	asm volatile(SET_PSTATE_TCO(0));				\
> +	goto label;							\
> +} while (0)
> +
>  /*
>   * We must not call into the scheduler between uaccess_ttbr0_enable() and
>   * uaccess_ttbr0_disable(). As `x` and `ptr` could contain blocking functions,
> @@ -286,27 +304,18 @@ do {									\
>  
>  #define get_user	__get_user
>  
> -/*
> - * We must not call into the scheduler between __mte_enable_tco_async() and
> - * __mte_disable_tco_async(). As `dst` and `src` may contain blocking
> - * functions, we must evaluate these outside of the critical section.
> - */
> +/* We handle synchronous exceptions so only use PSTATE.TCO in non-sync MTE. */
>  #define __get_kernel_nofault(dst, src, type, err_label)			\
>  do {									\
>  	__typeof__(dst) __gkn_dst = (dst);				\
>  	__typeof__(src) __gkn_src = (src);				\
> -	do { 								\
> -		__label__ __gkn_label;					\
>  									\
> -		__mte_enable_tco_async();				\
> +	if (system_uses_mte_async_or_asymm_mode())			\
> +		__raw_get_mem_tco("ldr", *((type *)(__gkn_dst)),	\
> +		      (__force type *)(__gkn_src), err_label, K);	\
> +	else								\
>  		__raw_get_mem("ldr", *((type *)(__gkn_dst)),		\
> -		      (__force type *)(__gkn_src), __gkn_label, K);	\
> -		__mte_disable_tco_async();				\
> -		break;							\
> -	__gkn_label:							\
> -		__mte_disable_tco_async();				\
> -		goto err_label;						\
> -	} while (0);							\
> +		      (__force type *)(__gkn_src), err_label, K);	\
>  } while (0)
>  
>  #define __put_mem_asm(store, reg, x, addr, label, type)			\
> @@ -337,6 +346,24 @@ do {										\
>  	}									\
>  } while (0)
>  
> +/*
> + * We must not call into the scheduler between setting and clearing TCO. As `x`
> + * and `ptr` may contain blocking functions, we must evaluate these outside of
> + * the critical section.
> + */
> +#define __raw_put_mem_tco(str, x, ptr, label, type)			\
> +do {									\
> +	__label__ __rpm_err;						\
> +									\
> +	asm volatile(SET_PSTATE_TCO(1));				\
> +	__raw_put_mem(str, x, ptr, __rpm_err, type);			\
> +	asm volatile(SET_PSTATE_TCO(0));				\
> +	break;								\
> +__rpm_err:								\
> +	asm volatile(SET_PSTATE_TCO(0));				\
> +	goto label;							\
> +} while (0)
> +
>  /*
>   * We must not call into the scheduler between uaccess_ttbr0_enable() and
>   * uaccess_ttbr0_disable(). As `x` and `ptr` could contain blocking functions,
> @@ -383,28 +410,19 @@ do {									\
>  
>  #define put_user	__put_user
>  
> -/*
> - * We must not call into the scheduler between __mte_enable_tco_async() and
> - * __mte_disable_tco_async(). As `dst` and `src` may contain blocking
> - * functions, we must evaluate these outside of the critical section.
> - */
> +/* We handle synchronous exceptions so only use PSTATE.TCO in non-sync MTE. */
>  #define __put_kernel_nofault(dst, src, type, err_label)			\
>  do {									\
>  	__typeof__(dst) __pkn_dst = (dst);				\
>  	__typeof__(src) __pkn_src = (src);				\
>  									\
> -	do {								\
> -		__label__ __pkn_err;					\
> -		__mte_enable_tco_async();				\
> +	if (system_uses_mte_async_or_asymm_mode())			\
> +		__raw_put_mem_tco("str", *((type *)(__pkn_src)),	\
> +			      (__force type *)(__pkn_dst), err_label, K); \
> +	else								\
>  		__raw_put_mem("str", *((type *)(__pkn_src)),		\
> -			      (__force type *)(__pkn_dst), __pkn_err, K);	\
> -		__mte_disable_tco_async();				\
> -		break;							\
> -	__pkn_err:							\
> -		__mte_disable_tco_async();				\
> -		goto err_label;						\
> -	} while (0);							\
> -} while(0)
> +			      (__force type *)(__pkn_dst), err_label, K); \
> +} while (0)
>  
>  extern unsigned long __must_check __arch_copy_from_user(void *to, const void __user *from, unsigned long n);
>  #define raw_copy_from_user(to, from, n)					\
> diff --git a/arch/arm64/include/asm/word-at-a-time.h b/arch/arm64/include/asm/word-at-a-time.h
> index d7a3b69dc8c6..ec72126210d1 100644
> --- a/arch/arm64/include/asm/word-at-a-time.h
> +++ b/arch/arm64/include/asm/word-at-a-time.h
> @@ -10,6 +10,9 @@
>  #include <linux/bitops.h>
>  #include <linux/wordpart.h>
>  
> +#include <asm/mte-kasan.h>
> +#include <asm/sysreg.h>
> +
>  struct word_at_a_time {
>  	const unsigned long one_bits, high_bits;
>  };
> @@ -41,12 +44,10 @@ static inline unsigned long zero_bytemask(unsigned long bits)
>   * and the next page not being mapped, take the exception and
>   * return zeroes in the non-existing part.
>   */
> -static inline unsigned long load_unaligned_zeropad(const void *addr)
> +static __always_inline unsigned long __load_unaligned_zeropad(const void *addr)
>  {
>  	unsigned long ret;
>  
> -	__mte_enable_tco_async();
> -
>  	/* Load word from unaligned pointer addr */
>  	asm(
>  	"1:	ldr	%0, %2\n"
> @@ -55,7 +56,20 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
>  	: "=&r" (ret)
>  	: "r" (addr), "Q" (*(unsigned long *)addr));
>  
> -	__mte_disable_tco_async();
> +	return ret;
> +}
> +
> +static inline unsigned long load_unaligned_zeropad(const void *addr)
> +{
> +	unsigned long ret;
> +
> +	/* We handle synchronous exceptions so only use TCO in non-sync MTE. */
> +	if (!system_uses_mte_async_or_asymm_mode())
> +		return __load_unaligned_zeropad(addr);
> +
> +	asm volatile(SET_PSTATE_TCO(1));
> +	ret = __load_unaligned_zeropad(addr);
> +	asm volatile(SET_PSTATE_TCO(0));

Note that Sashiko identified that nothing prevents the compiler from re-ordering
__load_unaligned_zeropad() w.r.t. the SET_PSTATE_TCO() and the presence of the
exact same expression above is probably inciting it to do so!

I believe that the most robust approach would to use the "memory" clobber in
set_pstate_tco() so that it always acts as a full compiler barrier. I'll address
this (and reorder the patches to introduce the macro first) in the next version.

>  
>  	return ret;
>  }
> 
> -- 
> 2.56.0.455.g6c5a503b38-goog
> 

-- 
Pierre
