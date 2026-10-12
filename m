Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82C348CD41
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808680; cv=none; b=cMsgSpbVoHgAFmYkFAJAKG3j+uDXlNiswSfKJWpPXFplztpLV4zBlzW296BrDZiZwwqfQTQUo0LFzmfnhXQb+rPtUxQP8ZVrlRCu1WYT0WWpeXKaXub/Y2LxiqsuSoPw2sUZMcUBMTv+26hl6Fjg+glNSEHa0YdSN2rdRop4yDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808680; c=relaxed/simple;
	bh=VH0AM69Ra+gB3iZQ6SWDCq1VTBUq+NfYyh42eZTZN6M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NgBBGeeFb9EjaopkQ5fBlSE6a8fxY3JEAxCqvekrJl9WG2LrmVAyMztnaf4tfxYFpVcCAPp6V1p0IVwWu8FHGoo9jv3cpoPT1APRRmdDIPY45gbKbqpSUazaOPSFk3KJBV1m/+c68WvjlK4O9IAl95i0IqSniNxcsZqOqxbwHZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHyFXYEK; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHyFXYEK"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso1528534f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791808676; x=1792413476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FAa1zh2oFmbuGXbuxB3nKxDGq0l8J98l2LtUP9fmNNc=;
        b=AHyFXYEK9PVW3OlQ4XLbP62vQBFVIyoKzFxnXAZ8DPf0iTldGDhpPsEOaZ3sZ9yKRC
         4I299NxDfuU01EIwt3Cp0zNc0OJzQs3Ucg0afDMds2155iCz3A5NhMFehys84ZcHIvDz
         Ty7dzLmbaBvHrF0XqHEZs18xAuIAPDmV5OpJQ1PqA/haeCIfmSgI9D44TbAXvUXdSsr9
         /NKxqeYqyj4aZDAwCyJCQsS8snOFR4CsGgRB3cTC/rNwtlOPdu8zgIYYW6aRFVK33nvQ
         IRKdA+CFI2yztZ+L/gw3QvMVuF9N/KwRNSUTKI9nNIHaVJ3dT9fw4fYIGhE5CXMzajj2
         qJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791808676; x=1792413476;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FAa1zh2oFmbuGXbuxB3nKxDGq0l8J98l2LtUP9fmNNc=;
        b=o4TJ0MIqTm5jWA/Q5yNokAY7M3zCLJHbD3FHnWOEP86wrn0JiynG0fR3Ns/dEHMAw0
         oG2Hd3q2hRSgOGPFWjKWLVRntjGb0N0C6OZ7u6BynLRFzLlqqe6diNcH3n+KSFCzgXRJ
         xLR/MrQki2ENXdMhRo513h0k7WA5vhAWxGo4tMbYOp6kqkJVlRVBIEcfp1uGB7MWNf2h
         TzVrjO7aFo/vcoFH/qxb2SRhBXSUQMB0OCA9fIJyqCChplWWasu2Kw0h6XMS1QwjYY5g
         Pa7R3F5gyM0usgQNjXtiP66TAEChpwfIz1Dj+6oIz1+kUnZU0LBsFpOM/a6vOTpGsbbK
         o/CQ==
X-Forwarded-Encrypted: i=1; AKwUvByLgaf4bxJaXjDB1f2oUWKYXjSVo5Z7QaCeXonKXULsGmwmb+P68GDFou3xo4oAPVjW7h4wjr22YxiZjCk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcC2mkBUW8FOTkwabl0KPDxLH00uO8cnBzO1ZB6HDQcYG7S2Qr
	rXjwy0ilWsEIKKq1S2epW9V2iiwX734Fr9GG/nYxpLVCGH61QcOr8Jnu
X-Gm-Gg: AYBFou0ATqISU3/t9WTLkS95KO1CrsMASLOF5mEhL3ChrAilGpEz3azRd23UTWM+/d/
	BdQ6i3HZthnnemtEuvTid/acNuwruJiLCXWAf5Qb/BgG5AK+Z5UNyT8iitfetxD7Te5/RA3whmI
	dzCwseSKFf6jQkzdPl7vD5DkW9d32TZhM0JWo2B2iR8+xKqGvMPc9zLE0xYJBfNDsumxPrc4nEJ
	Bvi0AGdL+JTtnIIWWiWnjnnKl0+ewIOwhVK7cyaWXJ4Xmu84pXsZXxnVtN3pNCXDOigvGPTt5lO
	nGkckNL9QlWpxJtq925ZmVYNDy6VKcRA+sFSPGB1G0DNdzAUbz4snKZgiw+BfKzkXTEe7FI8n0c
	wRqjnSbFjcGuuTpShUiWwCIT56mZOcgptg25Ts0hkAjXKb22gDjLLEr+zVMyAxvP9qd52l6jjfZ
	WKQ5CYLgFa4gx7JoikfFLbRIKGmAv0bXFId1z1j9AXR40mqUJzpXvEGhnwbJ9FoyH01WpPUnhN3
	am+Vm2BCBA61IhpppfVLJ0hxHOenj5ImRE=
X-Received: by 2002:a5d:43cb:0:b0:48a:f59f:8b70 with SMTP id ffacd0b85a97d-48dbaae4c6cmr13859682f8f.46.1791808675476;
        Mon, 12 Oct 2026 05:37:55 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae17e9sm19599710f8f.57.2026.10.12.05.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:37:55 -0700 (PDT)
Date: Mon, 12 Oct 2026 13:37:53 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Matt Turner <mattst88@gmail.com>
Cc: Magnus Lindholm <linmag7@gmail.com>, Richard Henderson
 <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
 oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] alpha: add 128-bit shift helpers
Message-ID: <20261012133753.3a5868e9@pumpkin>
In-Reply-To: <20261010022039.1610210-1-mattst88@gmail.com>
References: <CA+=Fv5RJpeusA2W4rRHOJMPRn8iF=OngRy05X22Myurs0wA-sQ@mail.gmail.com>
	<20261010022039.1610210-1-mattst88@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  9 Oct 2026 22:20:39 -0400
Matt Turner <mattst88@gmail.com> wrote:

> Selecting ARCH_SUPPORTS_INT128 lets generic code shift __int128 values by
> a variable count. gcc open-codes such a shift when optimizing for speed,
> but with CONFIG_CC_OPTIMIZE_FOR_SIZE=y it calls the libgcc routines
> __ashlti3, __ashrti3 and __lshrti3 instead. The kernel does not link
> against libgcc and Alpha does not provide them, so the link fails:
> 
>   alpha-linux-ld: lib/ubsan.o: in function `get_signed_val':
>   (.text+0x1c0): undefined reference to `__ashlti3'
>   (.text+0x1f8): undefined reference to `__ashrti3'
>   alpha-linux-ld: kernel/time/timekeeping.o: in function `delta_to_ns_safe':
>   (.text+0x2ac): undefined reference to `__lshrti3'
> 
> Provide the three helpers in C, as s390 does, and export them for
> modules. They are built into the kernel proper rather than lib.a so the
> exports are present even when nothing built in references them.

Do they need an explicit (shift &= 63)?
I've seen gcc/clang remove an explicit '&= 63' because they know the
hardware instruction ignores the high bits.
But I'm not sure what happens here.
Adding it won't make much difference - unless it matters.

David

> 
> The 64x64 to 128-bit multiply is always expanded inline with mulq/umulh,
> so no __multi3 is needed.
> 
> Fixes: fd04433a5bf3 ("alpha: select ARCH_SUPPORTS_INT128")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610090831.DSxrGQRc-lkp@intel.com/
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
> Magnus, this is an alternative to dropping the select. It applies on top
> of for-next (496e328c6107). If you would rather drop "alpha: select
> ARCH_SUPPORTS_INT128" for now, I will resend this without the Fixes tag,
> followed by the select, as a two-patch series.
> 
> Tested with gcc 16: defconfig plus CONFIG_CC_OPTIMIZE_FOR_SIZE=y and
> CONFIG_UBSAN=y builds and links (vmlinux and modules, W=1), and the
> helpers match the compiler's inline shifts for every count from 0 to 127
> in a userspace test. Not boot tested.
> 
>  arch/alpha/include/asm/asm-prototypes.h |  6 +++
>  arch/alpha/lib/Makefile                 |  2 +
>  arch/alpha/lib/tishift.c                | 70 +++++++++++++++++++++++++
>  3 files changed, 78 insertions(+)
>  create mode 100644 arch/alpha/lib/tishift.c
> 
> diff --git a/arch/alpha/include/asm/asm-prototypes.h b/arch/alpha/include/asm/asm-prototypes.h
> index c8ae46fc2e74..672fea15032f 100644
> --- a/arch/alpha/include/asm/asm-prototypes.h
> +++ b/arch/alpha/include/asm/asm-prototypes.h
> @@ -17,3 +17,9 @@ extern void __remlu(void);
>  extern void __divqu(void);
>  extern void __remqu(void);
>  extern unsigned long __udiv_qrnnd(unsigned long *, unsigned long, unsigned long , unsigned long);
> +
> +#ifdef CONFIG_ARCH_SUPPORTS_INT128
> +extern __int128_t __ashlti3(__int128_t a, int shift);
> +extern __int128_t __ashrti3(__int128_t a, int shift);
> +extern __int128_t __lshrti3(__int128_t a, int shift);
> +#endif
> diff --git a/arch/alpha/lib/Makefile b/arch/alpha/lib/Makefile
> index 84046e730e6d..f77d4a46f2e6 100644
> --- a/arch/alpha/lib/Makefile
> +++ b/arch/alpha/lib/Makefile
> @@ -35,6 +35,8 @@ lib-y =	__divqu.o __remqu.o __divlu.o __remlu.o \
>  	callback_srm.o srm_puts.o srm_printk.o \
>  	fls.o
>  
> +obj-$(CONFIG_ARCH_SUPPORTS_INT128) += tishift.o
> +
>  # The division routines are built from single source, with different defines.
>  AFLAGS___divqu.o = -DDIV
>  AFLAGS___remqu.o =       -DREM
> diff --git a/arch/alpha/lib/tishift.c b/arch/alpha/lib/tishift.c
> new file mode 100644
> index 000000000000..488e1e483d48
> --- /dev/null
> +++ b/arch/alpha/lib/tishift.c
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * 128-bit shift helpers.
> + *
> + * gcc open-codes a variable 128-bit shift when optimizing for speed, but
> + * calls these libgcc routines when optimizing for size.
> + */
> +
> +#include <linux/export.h>
> +#include <linux/types.h>
> +#include <asm/asm-prototypes.h>
> +
> +union ti {
> +	__int128_t val;
> +	struct {
> +		u64 low;
> +		u64 high;
> +	};
> +};
> +
> +__int128_t __ashlti3(__int128_t a, int shift)
> +{
> +	union ti ti = { .val = a };
> +
> +	if (!shift)
> +		return ti.val;
> +	if (shift < 64) {
> +		ti.high = (ti.high << shift) | (ti.low >> (64 - shift));
> +		ti.low <<= shift;
> +	} else {
> +		ti.high = ti.low << (shift - 64);
> +		ti.low = 0;
> +	}
> +	return ti.val;
> +}
> +EXPORT_SYMBOL(__ashlti3);
> +
> +__int128_t __ashrti3(__int128_t a, int shift)
> +{
> +	union ti ti = { .val = a };
> +
> +	if (!shift)
> +		return ti.val;
> +	if (shift < 64) {
> +		ti.low = (ti.low >> shift) | (ti.high << (64 - shift));
> +		ti.high = (s64)ti.high >> shift;
> +	} else {
> +		ti.low = (s64)ti.high >> (shift - 64);
> +		ti.high = (s64)ti.high >> 63;
> +	}
> +	return ti.val;
> +}
> +EXPORT_SYMBOL(__ashrti3);
> +
> +__int128_t __lshrti3(__int128_t a, int shift)
> +{
> +	union ti ti = { .val = a };
> +
> +	if (!shift)
> +		return ti.val;
> +	if (shift < 64) {
> +		ti.low = (ti.low >> shift) | (ti.high << (64 - shift));
> +		ti.high >>= shift;
> +	} else {
> +		ti.low = ti.high >> (shift - 64);
> +		ti.high = 0;
> +	}
> +	return ti.val;
> +}
> +EXPORT_SYMBOL(__lshrti3);

