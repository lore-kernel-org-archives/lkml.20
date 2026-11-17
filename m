Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794914284;
	b=RcTfb1cYtxKi7f2bTYCWUvBrvgZuzxa0BtQ7mxc3NrU3aKYipbwT09F+J5RMXoAyK2Cy
	 nX9k90xj7nke+v5nswDu+KAdBJHuaNs8rAUahRL4M3blsqOR62Bqx9TWcWCBB4+s/1jv3
	 MhOlAo4cq2XHSTT7ZdKhmxvTCylDq5EMadazJ8NzGDrtPXNILrFes7k+ZrsGsSW32MV5t
	 hcACmKguJ+zBN5X33+7UNFxrJNWbBIU52ZdmG1dLgPS+kMY62lzSr6x2tYPF1q4S1dn3y
	 d/l4YzYb2EwVKwyMVNSKQRQslylhsX/tKbl6kTGNqegJoMjHXOcHORpntsTIdv2NsLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794914284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IvHB7hK5S+PwHd5KQnMrpJ7r0ZSvgXRfKLl7d97T8vo=;
	b=x+WDNVpg0NQTwsnfXjk8imUlFY3qpxp0bSSzJmzqhd1hhn8147RSbeY99CWN772jxVZr
	 1v4bDApn4rmgoJuT5GhZhqgLWFYXpmq/nENFJX7i7Ymcx0+CS++Kg56H+vy8y6j19FKxm
	 9Lk7pOddj1GPt0DygFeotgzj4Jt2OGDjwLEgi0JEKVEzxHLCLDJGbMftrijn5Fswv7Rv8
	 zpAnNgLDzzwHBFse5QGDTVieciRY2gfoYhUciS6jnwcRYMr5BZ/sARjREVA0zHguMyEVl
	 0OFqv77Jbu86mnwv+LY5xcC5z+D6axlvcQMMHYx5cwMWIxWDy5ZhZJm3+1iIS7qG/ow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OkXCdQfn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28362606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28362606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OkXCdQfn
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b7a488a0a4so5013440a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:18:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794914282; cv=none;
        d=google.com; s=arc-20260327;
        b=iHqx+EWNumjCAsVdFKmLN/r0gz3b7XkzB+3C3kEqQwmLZHVKqmHZIV+WMtNfWvM5oa
         frMgcrXKogksQXhA+81vjHURNP90uOTlSADXwJEuh9eezslFwTnVs/QnOLdt/ECRzP2N
         Ln5knwubGrvJ0jVau+QIlKFuYrvsgY0VhZeBRRGZZ7eGoV4g8UJI7FGwjEqn5Qt/b1sC
         HxBV7vQtk8AoSOGZbv/qylHJ/M+E4iI5TFR2P5RPtJ9Xs678uAKE7knuALl+aYF6os81
         NIxfvqwvoekCNAwZRZId2rDreN2rdcpeiGIG1MsYyEbgP+mT8Ef3CQKzdhk+/DHndA/E
         6AuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IvHB7hK5S+PwHd5KQnMrpJ7r0ZSvgXRfKLl7d97T8vo=;
        fh=O8QwU19dGvC/e+zJovWJpLSAZU89VwXa6eNoa63CzGg=;
        b=FTYCG6RB4mLEwHRnlOhbPkVpFrJY7GlH3m7ZYyfJLhl4aqhbiR5rSi9I5twDJX5B1C
         ZCF6W4qAvNXGXOwTqbhCAGZfwBhqwFEuGmKa4rVbDp53YvEc5BGm2oUalfFhr1+p2yta
         ZCMXMH1uP1fu3MwBu2GSG8Ra7/pLnwQP0XW3ETEy9vYh5FX9GqIZypaf6GSwC62SDC2t
         XZZ2h/7+oiGMVspnHGae8BSpVaGLYXlxoSZG6BXuJCdL0fAb+k22ok3dKyvgTy0H8uzP
         XBNANNaVJB8+zL0vvLXWlFIy9l5oXUtm7rm2IYndXpSEC2yFCHEckOgehdVsGFuDEPDc
         IDwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794914282; x=1795519082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IvHB7hK5S+PwHd5KQnMrpJ7r0ZSvgXRfKLl7d97T8vo=;
        b=OkXCdQfnVlutqofqFQoaKWtk3ADIOB+RDjddqxBmj3rd/EiUwh/q6UlMjGcStmRO2K
         F+Gv9zXjaSmy63MeAINUC8gsRqei6FA3KBgQeVnbyhP4PUFk2wPpwkbP2vcPUbhhGpO/
         QNRQE3yIv7Imlrx4lbj6YsxAJoTT0MmzXy/QZ18Yo8RuiDGktLN8qKsRp4E3p6rXP/Tw
         CQIfIkiBVcD3FoT4Hvg3H08BXAXOg20EcTaTcKGxJjnLypeO+Lsa+BW3aB4V0yOG8OKD
         Plz0oSPA9C1DRowPyxn0UIlXh5k5gAErpYRqrydr2+qyTEMkr4goGcBTsE7Qw31y0dmI
         JEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794914282; x=1795519082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IvHB7hK5S+PwHd5KQnMrpJ7r0ZSvgXRfKLl7d97T8vo=;
        b=GWDsQxXEnv6GhUi9XHKn2tbkKxZFhhpUuy+d6TTzZ/Fm8oAFzbsVqFxOqvWLesrTf2
         KJhWXDO+mP5G++csluuEQ8HkLNN1zHnCAeMtZ8qHt8jmfvEq/oBQqsOOY2Qu5HJHsa4n
         L1X97bVx4LzIJcFbfai1kBS0CAjrDbRURYPJ8/wLnMaX+p2o/ZVb3yQyhIX1eL/4wDXS
         TvUxGBpR0ZyoCMuHa8e5rZyjM+vxdfDtBxGjKxuVkAKDTkTaBYQRy3Xo4jWUIzfyrOlC
         vu22bh4ruuJgB9zvauNnQDtxfxHUvCeD+xNQCr4xZE3jesVLUfe7llQskYe17eMovWQi
         JqGw==
X-Forwarded-Encrypted: i=1; AL+hErGJU5asQpZ2IpTSsyFOEIlUjQSYzoD+0M45BMphszTh/ElQeCDpiFf7LzERcng7ax8Ee0iUfsAPd/bScJc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GOz8CHirj2zlRf8ExIOyplJqh9Njd4sN67sggeD/x8TSvBCT5
	4hFp9UYWQ8ZNojMNaTtbYmlgyWTl1Gx6Jk8NBWXw4spfXzEP63MO/Dg/haVpaWqfutW6hpYZ+Sm
	H/y+AXCIxi3ZoTL8fqzXHKEpXspIYJNk=
X-Gm-Gg: AYBFou1XsIXrPWqjORFQsB1LVwbAebsBG8qdcEtKIvRXV3E35K0biCvhxbh0jkVgltl
	KvX61lFf6p3lN8ZWhF73KoC3PzhfFo3m7C4KzQ3bkM5GKnJqJmax07EmL1+Q63kZSAy6H57cUxp
	cIbnbx82DeVRw2R5VzptiCbrtcNPbi64ODGx3Olr6VuHPwf+1BEnQyvmIqskkWyZ/FdOCTsYHqk
	syMLGzl6K48QYPSHQ0WnpinNp+RnIrtGNqUYJXLJpW0PD6/OhWglcn05MB2OAJG1dHi6W8FB8q9
	8ao4t01h1MCM7T7c0VfEE22nrzu8AEbLBRIxtqpKyAW3iotRIQOp7MDj/WbRtOK03/lClYEDN7S
	pmx8+JcJZWcm0iqHPNsrs8brFSyENDdrQDrneivrmwhplP64/h1W2FTYDDrVkH+6ZAGMomLXlDF
	KQ8E2EP/D+b/y5wJrNK865ZfdaiXHOG0T9Dch924K3moIsjg==
X-Received: by 2002:a05:6402:c504:20b0:6b5:823f:3462 with SMTP id
 4fb4d7f45d1cf-6b7c0c220d4mr7411065a12.19.1794914282282; Tue, 17 Nov 2026
 03:18:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com> <20261116-marvel-env-v2-3-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-3-ef614eb2e7f1@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 17 Nov 2026 12:17:50 +0100
X-Gm-Features: AclHuK94U5vxuAIzRoUk_xuGjpCyMdIeT7TvYpftDX4IwxFk1UD_NZ2lFEHO6QE
Message-ID: <CA+=Fv5QvCT_=-vJVUfnyFJK6+Z+HN7_Mt-zLEo4hsaHODQk-Zg@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] alpha: marvel: refresh environmental readings
 through the console
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Nov 17, 2026 at 3:59=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> The SRM console keeps the readings of the temperature, fan, voltage and
> power supply sensors in the power and environment (P&E) nodes of the
> config tree (GCT), and refreshes those of one node when asked through
> config tree callback 0x28, function 0x1f. The Alpha Architecture
> Reference Manual reserves every callback code it does not list, so this
> is a Marvel console extension; its code and function number come from
> Tru64 UNIX. Define CCB_CFGTREE in asm/console.h, and add the callback
> and marvel_cfgtree_partial_update() for a sensor driver to use,
> retrying, as Tru64 UNIX does, while the console reports busy.
>
> On an ES47 the callback takes 13 to 300 ms per node with interrupts
> disabled. The console callbacks are not reentrant: a refresh on one CPU
> while another printed to the SRM console killed the second CPU, and the
> service processor reset the partition. So export the srmcons callback
> lock and hold it around the call.
>
> Tru64 UNIX makes this and its other runtime config tree callbacks only on
> the master CPU, and the Marvel PAL TOY calls are already known to work
> only on the boot CPU, so make the call there as well.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/console.h    |  5 +++++
>  arch/alpha/include/asm/marvel_env.h | 12 ++++++++++
>  arch/alpha/kernel/core_marvel.c     | 45 +++++++++++++++++++++++++++++++=
++++++
>  arch/alpha/kernel/proto.h           |  1 +
>  arch/alpha/kernel/srmcons.c         |  3 ++-
>  arch/alpha/lib/callback_srm.S       |  1 +
>  6 files changed, 66 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/include/asm/console.h b/arch/alpha/include/asm/co=
nsole.h
> index 1cabdb6064bb..4f5cf589aff7 100644
> --- a/arch/alpha/include/asm/console.h
> +++ b/arch/alpha/include/asm/console.h
> @@ -4,6 +4,9 @@
>
>  #include <uapi/asm/console.h>
>
> +/* Not architected: a Marvel console extension, as used by Tru64 UNIX. *=
/
> +#define CCB_CFGTREE            0x28
> +
>  #ifndef __ASSEMBLER__
>  extern long callback_puts(long unit, const char *s, long length);
>  extern long callback_getc(long unit);
> @@ -15,6 +18,8 @@ extern long callback_read(long channel, long count, con=
st char *buf, long lbn);
>  extern long callback_getenv(long id, const char *buf, unsigned long buf_=
size);
>  extern long callback_setenv(long id, const char *buf, unsigned long buf_=
size);
>  extern long callback_save_env(void);
> +extern long callback_cfgtree(long func, unsigned long arg1, unsigned lon=
g arg2,
> +                            unsigned long arg3, unsigned long arg4);
>
>  extern int srm_fixup(unsigned long new_callback_addr,
>                      unsigned long new_hwrpb_addr);
> diff --git a/arch/alpha/include/asm/marvel_env.h b/arch/alpha/include/asm=
/marvel_env.h
> new file mode 100644
> index 000000000000..16ccd2002a11
> --- /dev/null
> +++ b/arch/alpha/include/asm/marvel_env.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ALPHA_MARVEL_ENV_H
> +#define __ALPHA_MARVEL_ENV_H
> +
> +/*
> + * Ask the console to refresh the environmental readings of the GCT node=
 at
> + * @offset from the start of the GCT. Returns the console status, which =
is 1
> + * or -0x4a on success.
> + */
> +long marvel_cfgtree_partial_update(unsigned long offset);
> +
> +#endif /* __ALPHA_MARVEL_ENV_H */
> diff --git a/arch/alpha/kernel/core_marvel.c b/arch/alpha/kernel/core_mar=
vel.c
> index 92e3312e786e..7525f3ed6b62 100644
> --- a/arch/alpha/kernel/core_marvel.c
> +++ b/arch/alpha/kernel/core_marvel.c
> @@ -20,10 +20,13 @@
>  #include <linux/string.h>
>  #include <linux/module.h>
>  #include <linux/memblock.h>
> +#include <linux/workqueue.h>
>
>  #include <asm/ptrace.h>
>  #include <asm/smp.h>
>  #include <asm/gct.h>
> +#include <asm/console.h>
> +#include <asm/marvel_env.h>
>  #include <asm/tlbflush.h>
>  #include <asm/vga.h>
>
> @@ -1094,3 +1097,45 @@ marvel_agp_info(void)
>
>         return agp;
>  }
> +
> +/*
> + * The console refreshes the environmental packets of a GCT node through
> + * config tree callback function 0x1f, returning -26 while it is busy. T=
he
> + * callback runs for up to 300 ms with interrupts disabled. Hold the con=
sole
> + * callback lock: a concurrent callback from another CPU, such as SRM co=
nsole
> + * output, kills that CPU. Make the call on the boot CPU, as Tru64 UNIX =
does
> + * for its config tree callbacks; the PAL TOY calls also work only there=
.
> + */
> +#define CFGTREE_PARTIAL_UPDATE 0x1f
> +#define CFGTREE_BUSY           (-26)
> +
> +static long marvel_cfgtree_partial_update_local(void *arg)
> +{
> +       unsigned long flags;
> +       long status;
> +
> +       spin_lock_irqsave(&srmcons_callback_lock, flags);
> +       status =3D callback_cfgtree(CFGTREE_PARTIAL_UPDATE, (unsigned lon=
g)arg,
> +                                 0, 0, 0);
> +       spin_unlock_irqrestore(&srmcons_callback_lock, flags);
> +
> +       return status;
> +}
> +
> +long marvel_cfgtree_partial_update(unsigned long offset)
> +{
> +       long status;
> +       int tries;
> +
> +       for (tries =3D 0; tries < 100; tries++) {
> +               status =3D work_on_cpu(boot_cpuid,
> +                                    marvel_cfgtree_partial_update_local,
> +                                    (void *)offset);
> +               if (status !=3D CFGTREE_BUSY)
> +                       break;
> +               usleep_range(10000, 20000);
> +       }
> +
> +       return status;
> +}
> +EXPORT_SYMBOL_GPL(marvel_cfgtree_partial_update);
> diff --git a/arch/alpha/kernel/proto.h b/arch/alpha/kernel/proto.h
> index c418333d0b89..b54f4fd69a0f 100644
> --- a/arch/alpha/kernel/proto.h
> +++ b/arch/alpha/kernel/proto.h
> @@ -112,6 +112,7 @@ extern struct screen_info vgacon_screen_info;
>
>  /* srmcons.c */
>  #if defined(CONFIG_ALPHA_GENERIC) || defined(CONFIG_ALPHA_SRM)
> +extern spinlock_t srmcons_callback_lock;

This breaks a Marvel kernel without SRM:

  arch/alpha/kernel/core_marvel.c:1118:28: error:
'srmcons_callback_lock' undeclared

That config needs EXPERT=3Dy and TTY=3Dn (ALPHA_SRM has no prompt on Marvel
and depends on TTY), so only randconfig will hit it, but the bots do
build those. You're right that the call is unreachable at run time;
the alpha_using_srm check is what let the compiler drop it, since it is
the constant 0 there (asm/machvec.h). Putting it back, with the extern
before the #if as in v1, builds for me with and without SRM.

Magnus

>  extern void register_srm_console(void);
>  extern void unregister_srm_console(void);
>  #else
> diff --git a/arch/alpha/kernel/srmcons.c b/arch/alpha/kernel/srmcons.c
> index d19e51ec711d..45a10d539f19 100644
> --- a/arch/alpha/kernel/srmcons.c
> +++ b/arch/alpha/kernel/srmcons.c
> @@ -24,7 +24,8 @@
>  #include "proto.h"
>
>
> -static DEFINE_SPINLOCK(srmcons_callback_lock);
> +/* The console callbacks are not reentrant. */
> +DEFINE_SPINLOCK(srmcons_callback_lock);
>  static int srm_is_registered_console =3D 0;
>
>  /*
> diff --git a/arch/alpha/lib/callback_srm.S b/arch/alpha/lib/callback_srm.=
S
> index 36b63f295170..6d3c9ce6b815 100644
> --- a/arch/alpha/lib/callback_srm.S
> +++ b/arch/alpha/lib/callback_srm.S
> @@ -94,6 +94,7 @@ CALLBACK(reset_env, CCB_RESET_ENV, 4)
>  CALLBACK(save_env, CCB_SAVE_ENV, 1)
>  CALLBACK(pswitch, CCB_PSWITCH, 3)
>  CALLBACK(bios_emul, CCB_BIOS_EMUL, 5)
> +CALLBACK(cfgtree, CCB_CFGTREE, 6)
>
>  EXPORT_SYMBOL(callback_getenv)
>  EXPORT_SYMBOL(callback_setenv)
>
> --
> 2.56.1
>
