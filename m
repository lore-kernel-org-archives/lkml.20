Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA88019DF62
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 22:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792276855; cv=pass; b=Tl38m4KDr5xi770WAHQlqbjEWt9cVpWgyLeSaNtMC4wNrnURL2LWWn9A5rO06yXcS8O+cgbsKlYsyA++wK6qtAgCpnivMziADL54Cx9SXyf4tA8ZB97NACLCyZvzcuyPGRrFcwvw8DhU+X3X/3qVjBJbtyL9WnGGZ5wMGcAAUvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792276855; c=relaxed/simple;
	bh=oRIP8pPJqh7IzUGPPWhIsDDwt7q2HNrL8WwBT8sPcSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hZs3S+hqgANk7cDtggpvb/ijmPsf4PUByvQr8Ogm8NYDEzulfb7AwtjYsp4pAtU+YtH7DkXxEoftS4owPClVu/pMNTvFxqOK7+CCW/s+Niz25iQLl4sEU2yI27djMp6zs4LrPFcnn1hMGAspOcPma0U1CpmLG6mScCKjgJh7fxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SRvY+Iib; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SRvY+Iib"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so1373205a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 15:40:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792276852; cv=none;
        d=google.com; s=arc-20260327;
        b=ADtUau2qn5Ut8cobUZMNOG/vlBbeGc/hBnfwQH52GY+Rqt+AJwsd+LL6pWewcETGni
         13ejZZ2c1Y0y0ZnZw+X/7KehI+kQYC642xOgCvXUrJCmY63WedaJ+DVEFYfxiBLLXTDY
         fKQCWLIQa2MC6JfmJ/93DjVPtSDwb2+wnU8uU7YxEmH1ul08RdjaWvBeFn3H7Yg4JYyC
         5gvMiPvUQqI5WQxOuK2jwovccYE3nKkWB11NiQpiKEYgnvowqqj4F1Xsiui+DlcSToHs
         QIPFTlNClTKl64C7cVm0QBWoCq//BVeVtVfYRkYXpIeTXH3SPdDSkUQkp50fJydsOyeP
         nihw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BqaWKmhEIx/MyBH36dUoBxkHOV46oHXgijHsAslfTAQ=;
        fh=GHhZV39dOsKhQQC/ly/vKQHSPM60dgTWcOm2mTxnCJg=;
        b=KzvPFVmvfe/XgfyN71nAb7rS01J+hZSyKBliXoKpXWLPPf7Xsw7MLx11znvYgRxHkc
         k6s5zmt8oLxr2cZRxgb6xYOogGLBKd2TmFnxGHRZ6ON9c3a3qRq/TgE7TOaPWgIA9Z84
         rempV18GN9Xvb2AR812YHjYSqi6N2Jwiqd24PQFaHkZlbueNELEbRKvG59UUAkDRrvEB
         DpV3dBJPepywJHEtu3+xTAdLwAkezb9r8DbDJMhoNYCGnX4oE/GbPy+gCs7sTsQ7csdD
         AQZ6ntdgnHCDq7MZtAIdUJwoMZIftXcM9WMvZf/pY61bbTYRZCH09mkvd+VvEWFlI0xE
         iTlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792276852; x=1792881652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BqaWKmhEIx/MyBH36dUoBxkHOV46oHXgijHsAslfTAQ=;
        b=SRvY+IibDLnkdVsAawwcDnYrSdUJFGpKmIKMyqNVZhdjr39u6LWwo1Uh9pmiZRGBWk
         kyOR2w2O4pGXqvQ5lb2AsmgDod7jylVK0DGUhyL7/cpIggwainTklmXazZ1y4wK5Iqy4
         Q6XE7h7FcpQby9NH2tLFvgr67UX1xtZgX0HmpEsSszzyn/doYhbNY3PqlgOAC0y6OWEO
         dJRxbIv6LsanGtfglPqmYQ3Wkyyd0gcxWAD6y0k6iW8sX3+u+i+m4ebWNCuE2FHIpQ45
         cAg3uCTtpR+QQ8jC92HdzhAjPi5zcDnabVgAySIm3w22ne4yMrkofVbMs7dZsDzcGsh1
         uHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792276852; x=1792881652;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BqaWKmhEIx/MyBH36dUoBxkHOV46oHXgijHsAslfTAQ=;
        b=O/172NWwV4JhokKRukm0vVFxJRrFLX5XPQZwrEmaT1R6xNgtdfc8AACRUpsUZe+/xb
         N0w9ytDuYkwUXdw8GlUW7iNlwzH3JLDKJ1hEB+lwoSaEmZVcosqkcRzxF57e9ceVmcDW
         TwiQP5HPm4iFatumyxh2Njzsu8norgtdHKM8iLftL5DO+52ibxM/I4mqU2MqwLo9lKtK
         jyvnlzPCUQ8AMOt24vkvJYdmM2Dyb7b9Wa5KxJfLhjXZfK4oOF4EBw8TZbI02dQ5cVzb
         uiQzsXrThUYhPG1E0NM3dq8nShB7B/jFeya/ajOauiFkc3W88EF6FR5R5gnElaHePx3L
         ClRg==
X-Forwarded-Encrypted: i=1; AKwUvBxoYKwbFeWMNnJmyU01LmhX603ezbmjDsh8b9h7GW3mjoNXOr8V2LiC7SlermSSCkAZciBnf/giE07VrpI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLU/O3yB57/Nw9UD6A1CBQsbW4KVZ1oZAKcDXRBRhC+3AYCTOlA
	ZMEg+A+Ar7+Nn9cPIPwf2kZfEWYkD/tZOBm0o1W9nf6GsOV/EkSPW8hsxkYj0c2EWfXDPn54B0I
	8DsH9m5Ur34P/pLQL8Vq9Bs08FbRCS5w=
X-Gm-Gg: AYBFou0LK2ey8Q+2N7YCoDwNIujjhhefcqmY4agiHu7wIPD4GowgM3X4g02v1dHnW+n
	BKNUCSiBIaJ0eWZf+vydXIvJlAvu+olB73q7EUpXf25C1bABQWCU+R7MXXTqv2GIN/BCEDIRjJZ
	eJ8THSXQ7DnYEGatR/cZxrLV3gJ1Sk8NoFZKmHvAgwBumOaD/ew5vMCxAk/24RcLpgBLioVlEH8
	dxui2o6v0SW7VNzcNIYlSWHGPjN1aED51d3CnvR22+H0HWoEQTHsmB0WUE7Hr7OzCTL9kUTRFVO
	I8Y3+PR6ThuxZ+kMdokw8TH3xcbOXZWHpTGAN9HzACmE3Rh5wSAosKkggC6mq4759U2aP2xOPXo
	H8evSZ+QPDF6h93BGAD3cXMCp36nlS0SLcYniPBI6bM8ZeiLMsW3v
X-Received: by 2002:a05:6402:a516:20b0:6ac:afa2:ca25 with SMTP id
 4fb4d7f45d1cf-6b3a80d48bcmr1363508a12.6.1792276851798; Sat, 17 Oct 2026
 15:40:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261017174007.695344-1-mattst88@gmail.com>
In-Reply-To: <20261017174007.695344-1-mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 18 Oct 2026 00:40:39 +0200
X-Gm-Features: AclHuK_Ih8NRcUeHiVy08vs1YO2xbvPGDzEkZWbDiQ8EM38w8BlDbwAuz0bVzYc
Message-ID: <CA+=Fv5R2vixMYF4-ksiFYjS00Se1f51MW0uoSNtge4XMcoS5pw@mail.gmail.com>
Subject: Re: [PATCH v3] alpha: select ARCH_SUPPORTS_INT128
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, 
	Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Oct 17, 2026 at 7:40=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> gcc supports __int128 on Alpha, and the 64x64 to 128-bit multiply that
> the users in the scheduler and in lib/ care about maps onto mulq/umulh
> rather than an out-of-line libgcc helper.
>
> Variable 128-bit shifts are another matter. gcc open-codes them when
> optimizing for speed, but with CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy it calls t=
he
> libgcc routines __ashlti3, __ashrti3 and __lshrti3 instead. The kernel
> does not link against libgcc, so provide the three helpers in C, as s390
> does, and export them for modules. They are built into the kernel proper
> rather than lib.a so the exports are present even when nothing built in
> references them. Like the s390 versions they are marked noinstr, since
> the compiler may emit calls to them from noinstr code.
>
> Gate the select on CC_HAS_INT128 as the other 64-bit architectures do.
>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
> v3:
> - Fold in "alpha: add 128-bit shift helpers" so the select never lands
>   without the libgcc shift routines that -Os builds need
>   (https://lore.kernel.org/r/20261010022039.1610210-1-mattst88@gmail.com,
>   reported at https://lore.kernel.org/oe-kbuild-all/202610090831.DSxrGQRc=
-lkp@intel.com/)
> - Mark the helpers noinstr, as s390 does
> - Drop Magnus's Reviewed-by and Tested-by given the new code
>
>  arch/alpha/Kconfig                      |  1 +
>  arch/alpha/include/asm/asm-prototypes.h |  6 +++
>  arch/alpha/lib/Makefile                 |  2 +
>  arch/alpha/lib/tishift.c                | 70 +++++++++++++++++++++++++
>  4 files changed, 79 insertions(+)
>  create mode 100644 arch/alpha/lib/tishift.c
>
> diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> index 2672971b83f3..bed3f1c8d9d2 100644
> --- a/arch/alpha/Kconfig
> +++ b/arch/alpha/Kconfig
> @@ -16,6 +16,7 @@ config ALPHA
>         select ARCH_NO_PREEMPT
>         select ARCH_NO_SG_CHAIN
>         select ARCH_SUPPORTS_ATOMIC_RMW
> +       select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
>         select ARCH_USE_CMPXCHG_LOCKREF
>         select FORCE_PCI
>         select PCI_DOMAINS if PCI
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
> index 000000000000..8319907d8150
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
> +noinstr __int128_t __ashlti3(__int128_t a, int shift)
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
> +noinstr __int128_t __ashrti3(__int128_t a, int shift)
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
> +noinstr __int128_t __lshrti3(__int128_t a, int shift)
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

Tested v3 on my ES40: all 3,369,984 shift checks and 168 mul/div
tests passed, including compiler-generated -Os helper calls.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
