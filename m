Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794391232;
	b=rZhmq25u2LgAjdyKesCaNUWXV8tZ3c255i9PiSjvxnuP5xuybOonPrDcXbpIogf3XeZF
	 eReJ7qmoVlLqn9nvESWKsY07IrGX0g29znxSwx153Xjnwj8v35xn3VtZR/YyF8QtZaHI1
	 08P/ZnWIoMoH4W8FUIXMY7u7D0A7JzgNoNcIQKEMpjXj4bYD++EHsh9rvOJF32cWYxZoL
	 +RQz/u0XFr43uQXj4gyeQS5skvMCY9DSdfEVzkfa1Pq3F6Ac6Pt/Fh0GH08G9QAQrFYeA
	 c7VItU9G+wA3P6s6LA+UheODPx7/M6PIBmy5GGtZgXt+Bufhhf4MjTu+ZEEI7cXq2sA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=0snpShHvjoBSXjJ0hmmIC0sdwMSEV+1aJlZlq/yq2c4=;
	b=N3K4aktchYnKzfGoeL9TE/cjM64CvD9UhP7sVk7uxXSIPM14luDWc0HvFfEVVKEWvL7q
	 AnP/0VE2JSQfC4Nuz36yklJUpqUaxueT4SvwUhRXZ5dyEEp5u1jBPNDgqQvef3K7BHvOm
	 bM6++y7BKXDHMfmecfyaBvE6oF70o9AxgoL6pP+lejWKevExONwxX9+2131hmC6j/UBcT
	 xR4DFlW/2cJQMIWwzQX+ltTGvwVvfYz1whf0O+SJI8+I6GqZb4rPl1Mr8U1vjmtiihCws
	 84BkJmwNaQylO7GnR3Tjyc4uYWhDIc9itLfB5X0BhO4aDFdqd4zI3k5vcDFwjUvHliw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EZxd9Jl0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0B8606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B0B8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EZxd9Jl0
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67be7b9abc8so2628541d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:00:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794391230; cv=none;
        d=google.com; s=arc-20260327;
        b=ltUKiotINoOs8yfiUOn4zVt1XEXFbGl8zBk/p0+i8IqhrXcWkpV64RYG2Cin4dLGoi
         L321dOwQ/1bgw3HDmOPp4vlMOOiLHkPgoB92CJBs6T7BK6jhJ5IotKqbnWQpc1oyK6Sg
         6oIkyzDjvdBjcqeEgD2tyhKrKh55f23eCVZP9IwJ7zJKqhBhjNOGkfjDcWDcY/dHAC0P
         /xO2fzmS5Eqw2uakVW/RVyhVE5fZ3sLlAcW45zOYDd/eNL8UhCqDR/6gSCSWVUfFB3mY
         MCZED7rGqd/5JY8hEIz9qA4JiucR/ieCYbF3MzXvG1KWzGm/KVC2Cj8gzJ1hn5dsEteQ
         7D7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0snpShHvjoBSXjJ0hmmIC0sdwMSEV+1aJlZlq/yq2c4=;
        fh=Tb6XS/f7nkqUDGUxMUrSaXGD6HE4eIVQYBvnioEjtSk=;
        b=VcsmXOS2AxlGbkJ66RSvWFWceWcxMrmR200GaaywsRCQTzK1zYv/RY96bra8PX5R8n
         Gy4aLo0MRh1jsbpi5HVAcXbWkRTENCANaw+vgsq3V31Fj4GhjONvP5qPOgE4lhhbgg65
         ND3fluNTjqluoJR1gLPzFyDSu/IEqN9aBlv4/UzVbkBIdkUbUhSwAzkrB5TKGe1SB+Dz
         sNg/NBKljFFACvGhNN0ANfTsSM1xAOF8rcuDw47OtlSXxlUkYeZ2kVAoC4MK3A5VVM8W
         MHaW9nE4GrDv2VPa4Jvnny/GL6u3i/+7EKeZZN4+V6AvLAdOz8rBPvU+Xup805KQbWU/
         wqTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794391230; x=1794996030; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0snpShHvjoBSXjJ0hmmIC0sdwMSEV+1aJlZlq/yq2c4=;
        b=EZxd9Jl091oE3DJRikNmKAw2F6sX+5bNmT9eX6X8j6BAbM4wmEoWjXqkmsr2jl9lnL
         Zeh0w1WKLVCC5eov/G0u3dzMI/RoFoOwV49j21zQkTGLoxg0wO/bsi62+699Yg7pWa1T
         5sg6vFUkYWAggIRdZfuNuM7iNP98H4gaigwtNSR3U512FacQENKhMJD8HUP2lM2WeAQ7
         dl18CL+hkIqvgCyRp1jt53TpY9ihb7HmTPECA9SlySjQOh0FNNqDvIDnzjTeWmub9C5A
         rehHTCdZv3bkhFLTLs1vbOnXcpvUbAh+WfWwphblEPrZXmHBBXpYC87NbcJMNxpdxlbO
         +bnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794391230; x=1794996030;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0snpShHvjoBSXjJ0hmmIC0sdwMSEV+1aJlZlq/yq2c4=;
        b=tUfQQlF+bffm5eWBIyK0301vSfCbX8iPfXV3jNd82WTyvq13di33KtMAiT0XWafMjI
         zQOZMFeoLpsCrBvFXycCRvt9tSoNsnj6zr61vOluZTE7Ftf/ye+DuZ8Ruva7Ug/9j+Zc
         iRjnWrQfg0jrNC1mUyk0VcwoFH+G2I87vA472NHu5D2Zybxl5HZR2gVIWXYgnPaWqOz4
         EC/URyr8ZcTy39Pd/DEHOB0K9c0ulEJ/2FmSwznN/U1GwoIi6f7PiNVeS8GFFmjNDH81
         5ALhZtHMBWeG0lmZ7CSbnQeZo4hvrR/tTREFXGCMWkw6kN2XBPpeoTC844wBAUa4+FxR
         mVbA==
X-Forwarded-Encrypted: i=1; AL+hErEA+hOERLUI8nrfg8qcW6pMcknbYvRVBpG0r2u52To9D9XByv/I/TJxS1e+mS3wvIvKz7A5STT6KpZT6BQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aCnvLx4WIkbkk9M+FU7LyVEAWFp2acSSDyoYEEszyhT+ZLgqz
	1DL+0yskx7YP9paoBWg5k70Ioj2wk7qoctqcTXR7GDavDB9JREV+3oZUtG3XgqFRsDjR98j7vge
	1fVfbNYb/qmJaIkg8VAuF3I2KbhZJ5UJPCjPBzoog
X-Gm-Gg: AYBFou3pVputCo+KE0jCd2dVTxhO5Zwka1pFo+dwt2WwPGV8zHNFeS5TLmbgdicm7N3
	h6ljhIuyPUWEzU8FcYjGLKLQEYlrXYTSht0uodIstKWDDCvz0QGWU7+erWLEtyerqskEGRjLuri
	3gqlA1DGehIGZmO3sQ13Jj0nYn+A+OrDWUidrJt+qZibZYGt11Lv7TzQX3NJZIq0FhfVFzMIInI
	8eS/UUVNttiC3BbiR6VjNsH++Dl7rHUgSa3lVpfKFAmyLhPucaZIIwE9qbHbbNOTrove+ruxl1f
	DeBedbEIlJ8GdkZWaGJRDadbIxlSOuJa6J7uDCUzrtLnTN5rsx2tODw0Y/PEWJf18wO/Qa4E68j
	sMYsfxZZvrkh3/F2zbJc4o08jhjZBhhne/Dxd4NFvfmGWSqNyzpX/7GAi+ZLpFbStZRiqJxWJ+9
	xbjVbwkbqwM232zQ==
X-Received: by 2002:a05:690e:439b:b0:67c:2fdb:9419 with SMTP id
 956f58d0204a3-67c67f97140mr1094112d50.57.1794391229421; Wed, 11 Nov 2026
 02:00:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111092231.2027735-1-arnd@kernel.org>
In-Reply-To: <20261111092231.2027735-1-arnd@kernel.org>
From: Marco Elver <elver@google.com>
Date: Wed, 11 Nov 2026 10:59:51 +0100
X-Gm-Features: AclHuK_qP5L8F_RmiE0XH87_imZfKgz52BAPUVzydYBM3OwPM4hCNb5eu8txhc4
Message-ID: <CANpmjNP5p-N6v=GiETYQMxgRMsOgKOdUjDCxSHj-6=pa4NkA8w@mail.gmail.com>
Subject: Re: [PATCH] [RFC] instrumented.h: mark instrument_write non-const
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Aleksei Nikiforov <aleksei.nikiforov@linux.ibm.com>, Andreas Grapentin <gra@linux.ibm.com>, 
	Finn Thain <fthain@linux-m68k.org>, Peter Zijlstra <peterz@infradead.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, David Hildenbrand <david@kernel.org>, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Nov 2026 at 10:22, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> I got another instance of a -Wmaybe-uninitialized in ntfs, as this is
> the only place that enables the warning:
>
> In file included from include/asm-generic/rwonce.h:26,
>                  from fs/ntfs3/file.c:10:
> In function 'instrument_copy_from_user_before',
>     inlined from '_inline_copy_from_user' at include/linux/uaccess.h:184:2,
>     inlined from 'copy_from_user' at include/linux/uaccess.h:222:9,
>     inlined from 'ntfs_ioctl_fitrim' at fs/ntfs3/file.c:78:6,
>     inlined from 'ntfs_ioctl' at fs/ntfs3/file.c:246:10:
> include/linux/kasan-checks.h:38:27: error: 'range' may be used uninitialized [-Werror=maybe-uninitialized]
>    38 | #define kasan_check_write __kasan_check_write
> include/linux/instrumented.h:146:9: note: in expansion of macro 'kasan_check_write'
>   146 |         kasan_check_write(to, n);
>       |         ^~~~~~~~~~~~~~~~~
> include/linux/kasan-checks.h: In function 'ntfs_ioctl':
> include/linux/kasan-checks.h:20:6: note: by argument 1 of type 'const volatile void *' to '__kasan_check_write' declared here
>    20 | bool __kasan_check_write(const volatile void *p, unsigned int size);
>       |      ^~~~~~~~~~~~~~~~~~~
> fs/ntfs3/file.c:66:29: note: 'range' declared here
>    66 |         struct fstrim_range range;
>       |                             ^~~~~
>
> The problem here is that copy_from_user() is called on an uninitialized
> object, but the instrumentation passes the pointer into a function that
> takes a const object. gcc deduces that any access to that object is
> undefined behavior and warns about it.
>
> The only workaround I could come up with is to remove the 'const' keyword
> from these annotations, which of course is not great either, as the
> functions do not actually access the data at all.

Agree, but the code where a real 'write' happens ought to never pass
in a const-qualified variable or pointer anyway, so I think it's fine.

> This also found incorrect 'const' annotations in
> arch/s390/include/asm/fpu-insn.h, which writes to those pointers.

That looks like a bug. Maybe split it into a separate patch.

> Any ideas?
>
> Fixes: 33b75c1d884e ("instrumented.h: allow instrumenting both sides of copy_from_user()")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

If there are no warnings that appear because of this elsewhere, then:

Acked-by: Marco Elver <elver@google.com>

> ---
>  arch/s390/include/asm/fpu-insn.h |  8 ++++----
>  include/linux/instrumented.h     | 10 +++++-----
>  include/linux/kasan-checks.h     |  6 +++---
>  mm/kasan/shadow.c                |  2 +-
>  4 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/arch/s390/include/asm/fpu-insn.h b/arch/s390/include/asm/fpu-insn.h
> index aaf1faeb3dc5..7cd6e9f30485 100644
> --- a/arch/s390/include/asm/fpu-insn.h
> +++ b/arch/s390/include/asm/fpu-insn.h
> @@ -359,7 +359,7 @@ static __always_inline void fpu_vsrlb(u8 v1, u8 v2, u8 v3)
>
>  #ifdef CONFIG_CC_HAS_ASM_AOR_FORMAT_FLAGS
>
> -static __always_inline void fpu_vst(u8 v1, const void *vxr)
> +static __always_inline void fpu_vst(u8 v1, void *vxr)
>  {
>         instrument_write(vxr, sizeof(__vector128));
>         asm volatile("VST       %[v1],%O[vxr],,%R[vxr]"
> @@ -370,7 +370,7 @@ static __always_inline void fpu_vst(u8 v1, const void *vxr)
>
>  #else /* CONFIG_CC_HAS_ASM_AOR_FORMAT_FLAGS */
>
> -static __always_inline void fpu_vst(u8 v1, const void *vxr)
> +static __always_inline void fpu_vst(u8 v1, void *vxr)
>  {
>         instrument_write(vxr, sizeof(__vector128));
>         asm volatile(
> @@ -385,7 +385,7 @@ static __always_inline void fpu_vst(u8 v1, const void *vxr)
>
>  #ifdef CONFIG_CC_HAS_ASM_AOR_FORMAT_FLAGS
>
> -static __always_inline void fpu_vstl(u8 v1, u32 index, const void *vxr)
> +static __always_inline void fpu_vstl(u8 v1, u32 index, void *vxr)
>  {
>         unsigned int size;
>
> @@ -400,7 +400,7 @@ static __always_inline void fpu_vstl(u8 v1, u32 index, const void *vxr)
>
>  #else /* CONFIG_CC_HAS_ASM_AOR_FORMAT_FLAGS */
>
> -static __always_inline void fpu_vstl(u8 v1, u32 index, const void *vxr)
> +static __always_inline void fpu_vstl(u8 v1, u32 index, void *vxr)
>  {
>         unsigned int size;
>
> diff --git a/include/linux/instrumented.h b/include/linux/instrumented.h
> index a1b4cf81adc2..d28aa6b0aeb8 100644
> --- a/include/linux/instrumented.h
> +++ b/include/linux/instrumented.h
> @@ -36,7 +36,7 @@ static __always_inline void instrument_read(const volatile void *v, size_t size)
>   * Instrument a regular write access. The instrumentation should be inserted
>   * before the actual write happens.
>   */
> -static __always_inline void instrument_write(const volatile void *v, size_t size)
> +static __always_inline void instrument_write(volatile void *v, size_t size)
>  {
>         kasan_check_write(v, size);
>         kcsan_check_write(v, size);
> @@ -50,7 +50,7 @@ static __always_inline void instrument_write(const volatile void *v, size_t size
>   * Instrument a regular write access. The instrumentation should be inserted
>   * before the actual write happens.
>   */
> -static __always_inline void instrument_read_write(const volatile void *v, size_t size)
> +static __always_inline void instrument_read_write(volatile void *v, size_t size)
>  {
>         kasan_check_write(v, size);
>         kcsan_check_read_write(v, size);
> @@ -92,7 +92,7 @@ static __always_inline void instrument_atomic_read(const volatile void *v, size_
>   * Instrument an atomic write access. The instrumentation should be inserted
>   * before the actual write happens.
>   */
> -static __always_inline void instrument_atomic_write(const volatile void *v, size_t size)
> +static __always_inline void instrument_atomic_write(volatile void *v, size_t size)
>  {
>         kasan_check_write(v, size);
>         kcsan_check_atomic_write(v, size);
> @@ -107,7 +107,7 @@ static __always_inline void instrument_atomic_write(const volatile void *v, size
>   * Instrument an atomic read-write access. The instrumentation should be
>   * inserted before the actual write happens.
>   */
> -static __always_inline void instrument_atomic_read_write(const volatile void *v, size_t size)
> +static __always_inline void instrument_atomic_read_write(volatile void *v, size_t size)
>  {
>         kasan_check_write(v, size);
>         kcsan_check_atomic_read_write(v, size);
> @@ -141,7 +141,7 @@ instrument_copy_to_user(void __user *to, const void *from, unsigned long n)
>   * variants). The instrumentation should be inserted before the accesses.
>   */
>  static __always_inline void
> -instrument_copy_from_user_before(const void *to, const void __user *from, unsigned long n)
> +instrument_copy_from_user_before(void *to, const void __user *from, unsigned long n)
>  {
>         kasan_check_write(to, n);
>         kcsan_check_write(to, n);
> diff --git a/include/linux/kasan-checks.h b/include/linux/kasan-checks.h
> index 3d6d22a25bdc..90b878b876f5 100644
> --- a/include/linux/kasan-checks.h
> +++ b/include/linux/kasan-checks.h
> @@ -17,13 +17,13 @@
>   */
>  #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
>  bool __kasan_check_read(const volatile void *p, unsigned int size);
> -bool __kasan_check_write(const volatile void *p, unsigned int size);
> +bool __kasan_check_write(volatile void *p, unsigned int size);
>  #else
>  static inline bool __kasan_check_read(const volatile void *p, unsigned int size)
>  {
>         return true;
>  }
> -static inline bool __kasan_check_write(const volatile void *p, unsigned int size)
> +static inline bool __kasan_check_write(volatile void *p, unsigned int size)
>  {
>         return true;
>  }
> @@ -41,7 +41,7 @@ static inline bool kasan_check_read(const volatile void *p, unsigned int size)
>  {
>         return true;
>  }
> -static inline bool kasan_check_write(const volatile void *p, unsigned int size)
> +static inline bool kasan_check_write(volatile void *p, unsigned int size)
>  {
>         return true;
>  }
> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
> index d286e0a04543..591c179164af 100644
> --- a/mm/kasan/shadow.c
> +++ b/mm/kasan/shadow.c
> @@ -32,7 +32,7 @@ bool __kasan_check_read(const volatile void *p, unsigned int size)
>  }
>  EXPORT_SYMBOL(__kasan_check_read);
>
> -bool __kasan_check_write(const volatile void *p, unsigned int size)
> +bool __kasan_check_write(volatile void *p, unsigned int size)
>  {
>         return kasan_check_range((void *)p, size, true, _RET_IP_);
>  }
> --
> 2.53.0
>
