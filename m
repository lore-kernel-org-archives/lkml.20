Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E9C3AFB01
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 15:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791647774; cv=pass; b=BKr1iRPeVJsWMItbbch79jVtHym2x/YxfAmHyMAVsW/C6/C6ba6wu2o21a7658yDLiUwHwuDSwJ490+wPSxbJET5zsL44B3b/qCpPyh97sUJSO4ANwLaVXizboBjHByDSVj7aIO7B5UtyazR4A9noukJy0LWIoa0piiMsKUdl1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791647774; c=relaxed/simple;
	bh=1LlNv9iLTw5kz6VsMVqZfAokfIUtc3HuT5Y1+gdSsVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mGFWwqHd/dV0ky9PIXoHELAnpoaTIIsQa56a/e8OoJUGVk1uILW5uiDVZcpq4xiPAYjHG5B4+ywP22s5ouw+u36aGIjEV7mhfYTm23Lm+dX6MSnzPZTJciJeZ86tuH4XKXkXQXSu+Wkg8r8r3eLsLUi6j9TNcNrXkrJlzYjJz+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4w7wdqI; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4w7wdqI"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2afa22e1dcso117875466b.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:56:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791647771; cv=none;
        d=google.com; s=arc-20260327;
        b=T9OHaNwCrXF4t4qkFr21nkM//sZwBAiuOYdwcNXRypPakUURZMGZZWS4XISjCLctBq
         zCNOmqNK79Yxlm8L2ob92QcQEu2abXZ6/aUGtpkjzvN/hYL91Z1M/5VrBNbHqkI/H3i6
         t2dRmbSxvBueW71F2w+Ouiic4v+QL2gRfinEaR8tNMaK0wBfoe6T/QGjC+bgZZtAM2gn
         BtXcvg64V+oiFQhsW3hLm09Qr21HDc7od40mRXAA7crBgSfM3yy8ZhY25Gp8z61qPDLI
         juLJBgbfggNSIPp08zbfjlS7Ut78+3fjxmZz4i9z2P6Bbr1vcUtCOU70PmPf6Rm3pqL8
         FvGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UrVuj/KtTic62Eb1wEr1a7bTAGelasNdPgxfdOzKGbI=;
        fh=VEsCc3G5s/I97j4M612y4wITk+xRadlClUz9MiISDRc=;
        b=LAeDVWtGMKtDvw97OwDR0zVLJCo1fxKd3fzi5aozkW9u8kiX7oieeVWN80W6ighVSY
         WFdBjp++fbHBoIG3Lqe2UgsPcQ5bqaJ/J5fdPUTFJ82Qwl9eNxZIZl27t9rcLhiCo+lp
         A85WnBDy3HkYf6iYlZj4tX8l7FWkBURGx6oNzwLn3Wfc7MkZiRKtNi9Bh+5AssxKHVyH
         bpE/Mow5Et5YqIQyld+iyTR0tE4S4KiG8HMpELUmsZTVJqBW7nSBGHFvtC6aa+7J6spc
         8e3I5uESBaS1eMHe7uUXUWHP2woo/A0NgEdvGoVcBLQcs3ihfUIcPr3ewCpq6zOFSpDZ
         9i/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791647771; x=1792252571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UrVuj/KtTic62Eb1wEr1a7bTAGelasNdPgxfdOzKGbI=;
        b=Z4w7wdqI2lUBMaIisI/MyWwgO4RBhfg1wt2rPVPDxzkXynA7symJQO9t5864NzWmTN
         poqXr81KL/g2nWVoHRaV7RsPqkiZlnQAJOMfl3b6ghKCKdWFDSkdFPpRK0ob3IAvi05N
         7qo1r+Dm0+w9zlyKQ+/KTd21o2fPCGKuKvii1NdlhoGvPBR6/++nT3yQotiVuyb1nMrQ
         VASox20Vv7HYghKR6QbpZGT2DRD6GaZu939IzbhMA7TBQkqwewXhzmRSg8EACSXE9WI7
         bkDqkbG7MzZndA2n5ShedFrwJ1fjg06zeCz8ZMD6Pd6L94vMR2ZF4oqFoRqJ4fFJIuvw
         c7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791647771; x=1792252571;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UrVuj/KtTic62Eb1wEr1a7bTAGelasNdPgxfdOzKGbI=;
        b=vPITouTaj1QaL8aeV1hTrCtWRrXwl9VE3Yzf2FNY9mWy0yjPq67C2a3h2eKYhOl8ub
         L05+n1pWXse14ghQ9PAZ5leJ2jLSHxNeifjQAkgo90Xmlgq1Ie95rQQeIoU6tw2CEBgU
         blA/hlOIhEHOtbBocygTghlQng4u3RQiPwTC5VOQleGeMH8+7LaVN7oLXpXUIWY4ixxh
         XvvBwO14f0eJwXx7Dum8KTUToDjvXWksE/RI1y8ZY76HRhacx3BQcOrQJibtpKIatNeF
         8fRn5A1QdOywJWAVS0N7NfD8cpHye47Rbx6u1s3mUs1gTuR8DVNLLWma8h60A27oDsud
         Vi4w==
X-Forwarded-Encrypted: i=1; AKwUvBztJYsBtSol9eaCQ4hbTIrXIJPXwayM+JqQUGFGxtf6K2DYFzpuy39xxE4Bk61f6lrmhnLfD5iSC5AcCpw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKK7S+cS+6fcQFHBBFsMtfdsrShHIYRbDf+YhQU6CHpEmOFR90g
	dJwF/X4rQqrMV8wfurGfB6+UmjXytO0UWeifpka8ZoXN9PGj9OFpwqtZypv+yBGVHFhBOfT8hgk
	oRNFmILdeEvZPX3PheydUbmGuyAD3yu0=
X-Gm-Gg: AYBFou2Imels0Q3GC6FajmCl/W9dblMCmPrmEMMNiGcUZEoWkK5Z+Frp+2ZR897A18m
	VL28HLXUgJRSDr50gSFvOLAzpd1qHNvtLPLhkS33SoV/ePT9FT4x6kzGC3PieLCGdF1V8gASDu0
	F0c2YdWAbWIwPebXCGvYbjvoFnZQmX7fnOd0nCpS3Xv68Ik+aqWR6tetGI6HScYMMm1eXStaXwc
	rIiGYmpDOKAfzUBwtb6+RaJCXTHo1hAIONYx9mZEMZlDK75x1ZNcnSlyWISkVvlfhx2cJhArtlH
	Sx6LtzP/LyjIwM6wj6BzNEvpNnTCAP09eRcy9GOkbxH4bhVUYfIH7+N5XN69MBAsCo1Db0Nq070
	ZFj0CcZeBjQ+gF/8DuRNzlYBBOOmmXermYo6BV+XwCA==
X-Received: by 2002:a17:906:7305:b0:c31:866c:9696 with SMTP id
 a640c23a62f3a-c31aa09edfdmr448825766b.31.1791647770611; Sat, 10 Oct 2026
 08:56:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+=Fv5RJpeusA2W4rRHOJMPRn8iF=OngRy05X22Myurs0wA-sQ@mail.gmail.com>
 <20261010022039.1610210-1-mattst88@gmail.com>
In-Reply-To: <20261010022039.1610210-1-mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 10 Oct 2026 17:55:59 +0200
X-Gm-Features: AclHuK_4R9ladkJBFXKnSPR1Gb2rGeGfvuj5KKc4PC21RA5o7-m4C9wi3sPQdTc
Message-ID: <CA+=Fv5Q0p+v5dp-P_pQJ6ks3pZXEO3VPB-E+=t8HYRRAypH=yQ@mail.gmail.com>
Subject: Re: [PATCH] alpha: add 128-bit shift helpers
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,


On Sat, Oct 10, 2026 at 4:20=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> Selecting ARCH_SUPPORTS_INT128 lets generic code shift __int128 values by
> a variable count. gcc open-codes such a shift when optimizing for speed,
> but with CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy it calls the libgcc routines
> __ashlti3, __ashrti3 and __lshrti3 instead. The kernel does not link
> against libgcc and Alpha does not provide them, so the link fails:
>
>   alpha-linux-ld: lib/ubsan.o: in function `get_signed_val':
>   (.text+0x1c0): undefined reference to `__ashlti3'
>   (.text+0x1f8): undefined reference to `__ashrti3'
>   alpha-linux-ld: kernel/time/timekeeping.o: in function `delta_to_ns_saf=
e':
>   (.text+0x2ac): undefined reference to `__lshrti3'
>
> Provide the three helpers in C, as s390 does, and export them for
> modules. They are built into the kernel proper rather than lib.a so the
> exports are present even when nothing built in references them.
>
> The 64x64 to 128-bit multiply is always expanded inline with mulq/umulh,
> so no __multi3 is needed.
>
> Fixes: fd04433a5bf3 ("alpha: select ARCH_SUPPORTS_INT128")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610090831.DSxrGQRc-lkp@i=
ntel.com/
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
> Magnus, this is an alternative to dropping the select. It applies on top
> of for-next (496e328c6107). If you would rather drop "alpha: select
> ARCH_SUPPORTS_INT128" for now, I will resend this without the Fixes tag,
> followed by the select, as a two-patch series.
>

I'll apply this on top of my for-next, no need for a separate series


> Tested with gcc 16: defconfig plus CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy and
> CONFIG_UBSAN=3Dy builds and links (vmlinux and modules, W=3D1), and the
> helpers match the compiler's inline shifts for every count from 0 to 127
> in a userspace test. Not boot tested.
>
>  arch/alpha/include/asm/asm-prototypes.h |  6 +++
>  arch/alpha/lib/Makefile                 |  2 +
>  arch/alpha/lib/tishift.c                | 70 +++++++++++++++++++++++++
>  3 files changed, 78 insertions(+)
>  create mode 100644 arch/alpha/lib/tishift.c
>
> diff --git a/arch/alpha/include/asm/asm-prototypes.h b/arch/alpha/include=
/asm/asm-prototypes.h
> index c8ae46fc2e74..672fea15032f 100644
> --- a/arch/alpha/include/asm/asm-prototypes.h
> +++ b/arch/alpha/include/asm/asm-prototypes.h
> @@ -17,3 +17,9 @@ extern void __remlu(void);
>  extern void __divqu(void);
>  extern void __remqu(void);
>  extern unsigned long __udiv_qrnnd(unsigned long *, unsigned long, unsign=
ed long , unsigned long);
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
> @@ -35,6 +35,8 @@ lib-y =3D       __divqu.o __remqu.o __divlu.o __remlu.o=
 \
>         callback_srm.o srm_puts.o srm_printk.o \
>         fls.o
>
> +obj-$(CONFIG_ARCH_SUPPORTS_INT128) +=3D tishift.o
> +
>  # The division routines are built from single source, with different def=
ines.
>  AFLAGS___divqu.o =3D -DDIV
>  AFLAGS___remqu.o =3D       -DREM
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
> + * gcc open-codes a variable 128-bit shift when optimizing for speed, bu=
t
> + * calls these libgcc routines when optimizing for size.
> + */
> +
> +#include <linux/export.h>
> +#include <linux/types.h>
> +#include <asm/asm-prototypes.h>
> +
> +union ti {
> +       __int128_t val;
> +       struct {
> +               u64 low;
> +               u64 high;
> +       };
> +};
> +
> +__int128_t __ashlti3(__int128_t a, int shift)
> +{
> +       union ti ti =3D { .val =3D a };
> +
> +       if (!shift)
> +               return ti.val;
> +       if (shift < 64) {
> +               ti.high =3D (ti.high << shift) | (ti.low >> (64 - shift))=
;
> +               ti.low <<=3D shift;
> +       } else {
> +               ti.high =3D ti.low << (shift - 64);
> +               ti.low =3D 0;
> +       }
> +       return ti.val;
> +}
> +EXPORT_SYMBOL(__ashlti3);
> +
> +__int128_t __ashrti3(__int128_t a, int shift)
> +{
> +       union ti ti =3D { .val =3D a };
> +
> +       if (!shift)
> +               return ti.val;
> +       if (shift < 64) {
> +               ti.low =3D (ti.low >> shift) | (ti.high << (64 - shift));
> +               ti.high =3D (s64)ti.high >> shift;
> +       } else {
> +               ti.low =3D (s64)ti.high >> (shift - 64);
> +               ti.high =3D (s64)ti.high >> 63;
> +       }
> +       return ti.val;
> +}
> +EXPORT_SYMBOL(__ashrti3);
> +
> +__int128_t __lshrti3(__int128_t a, int shift)
> +{
> +       union ti ti =3D { .val =3D a };
> +
> +       if (!shift)
> +               return ti.val;
> +       if (shift < 64) {
> +               ti.low =3D (ti.low >> shift) | (ti.high << (64 - shift));
> +               ti.high >>=3D shift;
> +       } else {
> +               ti.low =3D ti.high >> (shift - 64);
> +               ti.high =3D 0;
> +       }
> +       return ti.val;
> +}
> +EXPORT_SYMBOL(__lshrti3);
> --
> 2.55.0
>

I build-tested this on top of the current Alpha for-next branch with
CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy and CONFIG_UBSAN=3Dy. Both vmlinux and the
configured modules built successfully, with no unresolved references
to the new 128-bit shift helpers.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
