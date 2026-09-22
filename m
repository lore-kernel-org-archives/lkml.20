Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41C4486B99
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057637; cv=none; b=DoTAmjDvYfas8RyzVpF8UGuA4VRhv7lPb3byzr/FEHjIq2b9dpeCTs7cI/z9BsBbCzPos2FgerSDsGJauk53sFJWj7yPGB/hzkh8907VrKpH9miXlNOHImi6wq/bNDcdvKahOuZI04CDryl5xY/w/VjXRnuI02y3YBdGN47dj7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057637; c=relaxed/simple;
	bh=Gy9j0KWVr9kj0RgfLoDoTPlP1LTZnQQ7E4VrzUe2ipI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=NCSvxvtqBt7oBIwI3XR4Zd9Fr91GJGaZBPxWuS1kEQiXh8G69X/Cndjaw9XUWzH8TrI89krHMUSPPGHrVyx3e43rZsQPWn3sGj94cgzkhKq5PilopqAfKFzPFtxL7QLdGupobuHoethGCScUN/KOkNwcX/RP1h/frvgh7KSkktc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bKUqFtMr; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=GWYyJnp0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bKUqFtMr";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="GWYyJnp0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790057634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9uMkpjF0ezR0L1Wb7g2yTnDlyybFBCPha3UfYWx1qZ8=;
	b=bKUqFtMrRS4iDpAnHSTfSrc9YiQ7xuW8bR2eVsIcLGDtVfqoZFPW9y+UZMv9Sbj6wCehq6
	pr9TMYMlblVjwzls3+CnopnXOT3kAPLlXsGdzfANBeaCeBFtVTWXohfEYN450+vFPnJzpz
	Aapkdl0XuBYbU3y96UYHyIMMvPvBOTo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-5RlomB9zNLy0tUC5Jb7mzg-1; Tue, 22 Sep 2026 02:13:53 -0400
X-MC-Unique: 5RlomB9zNLy0tUC5Jb7mzg-1
X-Mimecast-MFC-AGG-ID: 5RlomB9zNLy0tUC5Jb7mzg_1790057632
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4870663a5c4so1253868f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790057632; x=1790662432; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9uMkpjF0ezR0L1Wb7g2yTnDlyybFBCPha3UfYWx1qZ8=;
        b=GWYyJnp0suzxGPsGeVyJHqQNLisW8oYLM3vQFl+uVNACFwp+/oazXOddDEGKRPoQOH
         3OdJzbayq7YBDMYvtZCOgTPyri7ec+JjKj57i94TX7q+NX5Rpf5ClJSnFUV9i/TmBfn9
         SuF7eQZWybmamggyoGEXNzYHC0qe6Phxl1lg+InYrqLdkFVyPmWGKHnLZ7bcu35kITiu
         x+VtfCFKeugRB3SrZD1fzlFrCsfB9pyoaQlE4vbYgGZCx/aiaCvhr2EHgwCQFU7MMVwh
         +9nMLV3qtTxP2osn1leZOs+wuiQiYDNxD/yGP8067rZ9X5I5uUe6MjxqoANZOlZ3ubiq
         N4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057632; x=1790662432;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9uMkpjF0ezR0L1Wb7g2yTnDlyybFBCPha3UfYWx1qZ8=;
        b=Gwk4OpA1OsesIsatZGzErR4ZGdXS6/lFCFI72XzhjhZ1rdI0XJDiEYXWsyCz8Nb8i1
         gyBrhrN4lW7OD0CsHoYv6AVnvm8O2yh6AfJMihTWcDAlr6zUN2e679sj59vPQy+4uZNA
         HYhhMNcbEQlp47MMRkkC7uriIJN76jN0w3jGWnbEa4bklEkmsk0WCWGHp98J3rNMpq6K
         srwbl3c2oy0vhHmcoKzbAyJYV+LJWkNOtN1CYLtnu/uZrfDUWTw3em8Zug1yfk5fKcl8
         DKieVwrP0CAGHf8DLyyVmlF6htZqQufwxYbZOtkEfngfnn5cso83ZbzVev+zj9NpteTl
         y0Xg==
X-Forwarded-Encrypted: i=1; AKwUvBzxmdlWFql2Fp8Y1clTsY0O4hKjBKHUiTnO2sQ0s0IEbhJoCeHAGLeii/aJ5jETJzyL0M7UmwyQtqY+H6o=@vger.kernel.org
X-Gm-Message-State: AFuF++kqvqSeRhW9LVtoAx10ZH7EiTGf3D72yVap5cr+6Uh4+BYktV+2
	vaS+2na6nJdiAMafsGQMqmetwGuFIuReuXa7HQlTqYNoR0sGVc7t1UgBdyA2eUEiGE1rchivmYn
	Bwnnb1FVls6qOOdM7C7f5TZYT6smPEn6XBKo+mpuEC3f0tUJH8ZV/byXwH0QBh42WT/lpP2QuaA
	==
X-Gm-Gg: AYBFou33YwHQJzkfbSo2j2jNjrrUw2zQNllT2sNGBCwwYw0EO3F2R/JlrLqkYI9QNRu
	MtgG3gHgE1FnmV2SChBiuCAyVtrgYPeemsq8ri/Zxi0QcP42YOtDjFralvq7tcoUJmAufQ2BuYB
	/sPlT/ONFc05QSYIlKJCOMJHzXFGQYE8Om0hzufAAqBJ5KeKKRnmw5jIBGVU/VMs+SUo8nOEZfJ
	iIc5CSTTiygHjniKOK7i186Vod+zas3dklSlHIyzJ3JLux3v/wLiNEBm8CNPX3RLi8v63g79+OP
	tZ06ymH965j1ahTA9BK9CS0UJVHhveCqg+1MkSVa0hXSiqYJytI5gwx0YgefLcAVIqJIIuZ5rw=
	=
X-Received: by 2002:a05:600c:19cb:b0:49c:fc6c:be13 with SMTP id 5b1f17b1804b1-49fc5740216mr183368195e9.25.1790057632310;
        Mon, 21 Sep 2026 23:13:52 -0700 (PDT)
X-Received: by 2002:a05:600c:19cb:b0:49c:fc6c:be13 with SMTP id 5b1f17b1804b1-49fc5740216mr183367955e9.25.1790057631830;
        Mon, 21 Sep 2026 23:13:51 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.113.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdab8ae6dsm53367615e9.0.2026.09.21.23.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 23:13:50 -0700 (PDT)
Message-ID: <990c48e8-7604-455f-a2eb-915b1af352b0@redhat.com>
Date: Tue, 22 Sep 2026 08:13:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] asm-generic: Replace __ASSEMBLY__ with __ASSEMBLER__ in
 non-uapi headers
From: Thomas Huth <thuth@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260821085201.226650-1-thuth@redhat.com>
Content-Language: en-US
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20260821085201.226650-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/08/2026 10.52, Thomas Huth wrote:
> While the GCC and Clang compilers already define __ASSEMBLER__ auto-
> matically when compiling assembly code, __ASSEMBLY__ is a macro that
> only gets defined by the Makefiles in the kernel. This can be very
> confusing when switching between userspace and kernelspace coding, or
> when dealing with uapi headers that rather should use __ASSEMBLER__
> instead. Let's standardize now on the __ASSEMBLER__ macro to avoid
> this confusion.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   Note: This has been split from an earlier bigger patch of mine into
>         this separate patch to ease reviewing
> 
>   include/asm-generic/barrier.h         | 4 ++--
>   include/asm-generic/bug.h             | 4 ++--
>   include/asm-generic/current.h         | 2 +-
>   include/asm-generic/error-injection.h | 2 +-
>   include/asm-generic/int-ll64.h        | 6 +++---
>   include/asm-generic/rwonce.h          | 4 ++--
>   include/asm-generic/signal.h          | 4 ++--
>   7 files changed, 13 insertions(+), 13 deletions(-)

Friendly ping?

> diff --git a/include/asm-generic/barrier.h b/include/asm-generic/barrier.h
> index b99cb57dfcccc..c029b1e1854c4 100644
> --- a/include/asm-generic/barrier.h
> +++ b/include/asm-generic/barrier.h
> @@ -11,7 +11,7 @@
>   #ifndef __ASM_GENERIC_BARRIER_H
>   #define __ASM_GENERIC_BARRIER_H
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   #include <linux/compiler.h>
>   #include <linux/kcsan-checks.h>
> @@ -302,5 +302,5 @@ do {									\
>   # define smp_mb__after_switch_mm()	smp_mb()
>   #endif
>   
> -#endif /* !__ASSEMBLY__ */
> +#endif /* !__ASSEMBLER__ */
>   #endif /* __ASM_GENERIC_BARRIER_H */
> diff --git a/include/asm-generic/bug.h b/include/asm-generic/bug.h
> index 09e8eccee8ed9..044ebc96f373c 100644
> --- a/include/asm-generic/bug.h
> +++ b/include/asm-generic/bug.h
> @@ -26,7 +26,7 @@
>   #endif
>   #endif /* WARN_CONDITION_STR */
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   #include <linux/panic.h>
>   #include <linux/printk.h>
>   
> @@ -258,6 +258,6 @@ extern __printf(1, 2) void __warn_printk(const char *fmt, ...);
>   # define WARN_ON_SMP(x)			({0;})
>   #endif
>   
> -#endif /* __ASSEMBLY__ */
> +#endif /* __ASSEMBLER__ */
>   
>   #endif
> diff --git a/include/asm-generic/current.h b/include/asm-generic/current.h
> index 9c2aeecbd05a6..8e7d8f019377f 100644
> --- a/include/asm-generic/current.h
> +++ b/include/asm-generic/current.h
> @@ -2,7 +2,7 @@
>   #ifndef __ASM_GENERIC_CURRENT_H
>   #define __ASM_GENERIC_CURRENT_H
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   #include <linux/thread_info.h>
>   
>   #define get_current() (current_thread_info()->task)
> diff --git a/include/asm-generic/error-injection.h b/include/asm-generic/error-injection.h
> index b05253f68eaa5..0a9ec33fa8f20 100644
> --- a/include/asm-generic/error-injection.h
> +++ b/include/asm-generic/error-injection.h
> @@ -2,7 +2,7 @@
>   #ifndef _ASM_GENERIC_ERROR_INJECTION_H
>   #define _ASM_GENERIC_ERROR_INJECTION_H
>   
> -#if defined(__KERNEL__) && !defined(__ASSEMBLY__)
> +#if defined(__KERNEL__) && !defined(__ASSEMBLER__)
>   enum {
>   	EI_ETYPE_NULL,		/* Return NULL if failure */
>   	EI_ETYPE_ERRNO,		/* Return -ERRNO if failure */
> diff --git a/include/asm-generic/int-ll64.h b/include/asm-generic/int-ll64.h
> index a248545f1e18c..58974e8abbfae 100644
> --- a/include/asm-generic/int-ll64.h
> +++ b/include/asm-generic/int-ll64.h
> @@ -11,7 +11,7 @@
>   #include <uapi/asm-generic/int-ll64.h>
>   
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   typedef __s8  s8;
>   typedef __u8  u8;
> @@ -31,7 +31,7 @@ typedef __u64 u64;
>   #define S64_C(x) x ## LL
>   #define U64_C(x) x ## ULL
>   
> -#else /* __ASSEMBLY__ */
> +#else /* __ASSEMBLER__ */
>   
>   #define S8_C(x)  x
>   #define U8_C(x)  x
> @@ -42,6 +42,6 @@ typedef __u64 u64;
>   #define S64_C(x) x
>   #define U64_C(x) x
>   
> -#endif /* __ASSEMBLY__ */
> +#endif /* __ASSEMBLER__ */
>   
>   #endif /* _ASM_GENERIC_INT_LL64_H */
> diff --git a/include/asm-generic/rwonce.h b/include/asm-generic/rwonce.h
> index 52b969c7cef93..c35b262ee4223 100644
> --- a/include/asm-generic/rwonce.h
> +++ b/include/asm-generic/rwonce.h
> @@ -20,7 +20,7 @@
>   #ifndef __ASM_GENERIC_RWONCE_H
>   #define __ASM_GENERIC_RWONCE_H
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   #include <linux/compiler_types.h>
>   #include <linux/kasan-checks.h>
> @@ -94,5 +94,5 @@ unsigned long read_word_at_a_time(const void *addr)
>   	return *(unsigned long *)addr;
>   }
>   
> -#endif /* __ASSEMBLY__ */
> +#endif /* __ASSEMBLER__ */
>   #endif	/* __ASM_GENERIC_RWONCE_H */
> diff --git a/include/asm-generic/signal.h b/include/asm-generic/signal.h
> index 663dd6d0795dc..392e59fd3d8b9 100644
> --- a/include/asm-generic/signal.h
> +++ b/include/asm-generic/signal.h
> @@ -4,10 +4,10 @@
>   
>   #include <uapi/asm-generic/signal.h>
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   #include <asm/sigcontext.h>
>   #undef __HAVE_ARCH_SIG_BITOPS
>   
> -#endif /* __ASSEMBLY__ */
> +#endif /* __ASSEMBLER__ */
>   #endif /* _ASM_GENERIC_SIGNAL_H */

