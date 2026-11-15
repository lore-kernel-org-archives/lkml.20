Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794736504;
	b=S/F69s76TJBGm9OLn0X3jtMH3nRwlCmQDoEn2K9JUvDP9Gs9c7E/BN5QxamWJJf/gZ3F
	 8i62V+QPqAtqPrx2ohEWHrjKuhan36AHaCiXozJb+xSoRVyJ4wryoYMxAVccd48GUbYZ3
	 eHiBxkt7bmUIaqX+FOcym/pKqXenqFtqff5UjsS7+bhbVUy610VeM9mjQImTub/Bkr5Ws
	 aHLsX9qZldgu76SXmqq2RLaDH9ueWQU66kq5YmhMxZnb2uZAXsKpGrKtYChSxjdKqF8te
	 LjD/nBsyCcWob2p86p48et8cb3TslPXU6x89ANlnRCWOt8OTCwf2Md5ewVNLbLaHBoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794736504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JHL5wzatApt6+lhpJcXGmWmS8lGzT9CGdFXArAYnx6c=;
	b=rIX6QacdajWxxkzMOUkP1Z6p0/e9gNWa4Cd2aL06r+X1X8soFfnsToDyNW2zNTstbTO8
	 3PKSU3eUSPVHgLTz18oTFmlg+KEjpAZ3ATAQbKsCmo0Cv2oDQV/2TtrpJBhZM5SxwZ5Yh
	 l5Ofd8XA9VFxJguiSUEfRGL8Fsl8kcDLUeStZw7agS8GhwO8eqYZSji3Ie64j9mbhUgJT
	 CSDCjEASINT2/JDhaZhTjFrnG3TsywTorPqcwOVB7+U/1oEWNhS/b8Eu5q1Y1Quk5Qnoo
	 oxIjjznA3yYFx40i21RZZCNcM5g5S8+EzEmp8u/0g/lzGz6X+Nw4SonBNxAgswdNOeg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N7VW5rhR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2396606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2396606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N7VW5rhR
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b577addee9so4114293a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:55:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794736502; cv=none;
        d=google.com; s=arc-20260327;
        b=G2WvIbI9dC/0bHiS+QQMPd/ClPV7AEkFcK1Eo6+K4/ivQF9tHjKZvNUCyW32HIkIh+
         PZj8SRp7zYEs/hGHpNOdIol2h+GLRxmq9h+taXPyl16PjfHZO1GGrJzxkKwgZG2lR50U
         Gqh7b9USPiOr96UWv4CTAngaLRDQX/2cBTzi5P0iDcx7G+2EqOOPyGYIMk1W4kxZZ31E
         wH2rC0zaWJkAac++nvkLWbXh8eqRhcmmII4fOVs9nbIuPXY4eQTk+nFotXPEZUizGugg
         LKoFvw3pJgT3sINnozfCIMhzhqcpEhgNivm5mPrgic0LZ1GPFfrGiwvs+LUA2+OgP+HQ
         y9Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JHL5wzatApt6+lhpJcXGmWmS8lGzT9CGdFXArAYnx6c=;
        fh=9s39X0npjzLRv6pWyblC6UBe/Ahri5Ald4SsfYv4r68=;
        b=ZVXzx1cm9pH8m5qpg9E7jvt++cmevZ9DbcSNu8vZXGm/Q8ue43WsanH4+tbgRb2aHP
         rs8aFgctuU0koU00ODI6KzMSTNcbSUPhCkpJTjYCQ9zzLZKGZmyd7kQUIADIFU5ZXd74
         l7i1zZ64LLBsTMC4NEcNTWnoccnaV6QWMhkXeefsY3gCu4+jUMeMucV8ZLbxMsvGr8FN
         fPWn6j4V4A8pH+QdwO/avBkIaPkJy/y5EilsAleTsMtMQgsCm6j6yTMAx5KIsm+CtgDw
         NF9aHzc3DHBwFOaCP4yF4+pDoDCPbHk3l3KkHxdpGR7wmD7CUHCMhlZ9qTa2NQWbwIGi
         OS+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794736502; x=1795341302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JHL5wzatApt6+lhpJcXGmWmS8lGzT9CGdFXArAYnx6c=;
        b=N7VW5rhRv2QISRvlUKg2PbrNkOd+wvReBXbNCz/1UwqCparIU5pQ6nLpkMU2kbLwY8
         ADqJG6pQGyl/1VxtoNTFtePyBOCgqv2LbWePRsRG5WPA9jb4gGjlTOytiX+MwSACvMsv
         ooI837aMUIb3E0c6JXyOfyTt+DK1acJo9ulLfAMPamj/BDbIUYtPsKnl8xM3tTqe/xG4
         4pP/17uYwGwS4v0nAdueqZ1Nhp25aLR3NnB45G3z21Wwq0o5L89mMZ+GW6EV8mK0vrOf
         6ECpM4wnPnGQpOfeagQPzxRywfv5HOi+lgKBoAv4CpysPuabNtubHgt1qnsVaZUCS2FO
         9dCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794736502; x=1795341302;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JHL5wzatApt6+lhpJcXGmWmS8lGzT9CGdFXArAYnx6c=;
        b=nvLs5cbfhlkdVZrR3tThE2DVvZBZuKDkgm/RExU/7L94/DQph7sMMq8CHeE+nZxqJa
         fKWFu//zuf4ucCGTjd3+xOdYkSvEPWy0j28XMBwbOwnd8FxFw18LupSokiTqxuSM5foj
         FZ9mOrIaJ8q8Fw0B6r6i2WdGMQUrce2m2XUBZI1BsLRXujYJUB5x4yvKWOe9adUbuELP
         MnnIeaKZikWLJTULTJEERpdgyyfo10a9CDhiP9YXndrtCGh9qLovpgxvsV0jLjxiToNe
         7F1EXOcLhSyAgyEgYSY8ctNEXKDtU1m6Ti6fH47qsCEBKwhuQSkvJ9YagQUE52AjG+rs
         VHYg==
X-Forwarded-Encrypted: i=1; AL+hErGoc4HF2W5+nnjk3GLMCRfUDjxTRdkssqb9Soxr9RLUVgNSh6XzNHlEYYEHeTmDu+DCqvtLqGwL7IUwZvU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8l+/np1vzqlLTeuNyWQ7Kq9dunheuUvZf/qs+78U/PsZ22DWlD
	H3naUiGL5VUVJE8nkBIJdCEt0XWptls907Q9XhViELAW+O6oE9UMwc6pcYfSOC/09NpOJ5v6Vtc
	lgdbbUxw5+Fqbh+2C96+ShBhbO1tyUX4=
X-Gm-Gg: AYBFou27HEysGs+NtEMOlaprsXOFEf7cwYZmKskK2QF6Bu7vlZjUKlrnJx0yUT6gjeq
	P/grUuiretWVuBXQR1sk7EuOGQZZJ5r5Ca2yu9jYRPfZRGaR/eDwvtgjlLB41B4RdyEMrhs82bW
	cmDER2Dm8C5Vy6ynBTn6GD7miexkHn9LKXCnwwXbgc/wBDxf5NAJDs7dP9TLRDuI+eIeqNOvJzN
	DdkB0TmwzcR+xF2x/Gx8QBEEnBOOkBB4nhMoxOwxDf1oDfS2/RfIb4pXtdADM6uYdpY7hqICkTS
	FzWHLaxn3LbUMTp+wMwos32f33ElU9gW+aCs6TIaWIqRLjKh+UEN1Khj1Wg5jcBoY9uxpY47IYr
	EbILMBmNHxr5VmMYQKB+9ZqN8m1tmzXfu2NZjeSKx9YHl8Fia3zr6GujZbGJMwVVb+FrTU1m0Zq
	linls8F+phHwT/mOg89gEdCCQ=
X-Received: by 2002:a05:6402:5d86:b0:6b6:e905:b045 with SMTP id
 4fb4d7f45d1cf-6b7c08c1bc0mr3897272a12.3.1794736501763; Sun, 15 Nov 2026
 01:55:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com> <20261114-marvel-env-v1-3-890328e4b7e5@gmail.com>
In-Reply-To: <20261114-marvel-env-v1-3-890328e4b7e5@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 15 Nov 2026 10:54:50 +0100
X-Gm-Features: AclHuK8CrzNtGefK2sFGSiEYfzCMzmaPoiSojcAn4JlPWrCgrZasE0gcjNf1_n0
Message-ID: <CA+=Fv5Q4kViTAqkzcVkynb5FvjKRzFMeT+Xev7rwToJTZHN7ow@mail.gmail.com>
Subject: Re: [PATCH 3/7] alpha: marvel: refresh environmental readings through
 the console
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Nov 14, 2026 at 6:39=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> The SRM console keeps the readings of the temperature, fan, voltage and
> power supply sensors in the power and environment (P&E) nodes of the
> config tree (GCT), and refreshes those of one node when asked through
> config tree callback 0x28, function 0x1f. Add the callback and
> marvel_cfgtree_partial_update() for a sensor driver to use, retrying,
> as Tru64 UNIX does, while the console reports busy.
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
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/console.h      |  2 ++
>  arch/alpha/include/asm/marvel_env.h   | 12 +++++++++
>  arch/alpha/include/uapi/asm/console.h |  2 ++
>  arch/alpha/kernel/core_marvel.c       | 48 +++++++++++++++++++++++++++++=
++++++
>  arch/alpha/kernel/proto.h             |  1 +
>  arch/alpha/kernel/srmcons.c           |  3 ++-
>  arch/alpha/lib/callback_srm.S         |  1 +
>  7 files changed, 68 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/include/asm/console.h b/arch/alpha/include/asm/co=
nsole.h
> index 1cabdb6064bb..9b4a0f73c125 100644
> --- a/arch/alpha/include/asm/console.h
> +++ b/arch/alpha/include/asm/console.h
> @@ -15,6 +15,8 @@ extern long callback_read(long channel, long count, con=
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
> index 000000000000..583dca6c02d1
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
> + * or -0x4a on success, or -ENODEV when not booted from SRM.
> + */
> +long marvel_cfgtree_partial_update(unsigned long offset);
> +
> +#endif /* __ALPHA_MARVEL_ENV_H */
> diff --git a/arch/alpha/include/uapi/asm/console.h b/arch/alpha/include/u=
api/asm/console.h
> index 5fcb65300b56..ed2f0959e035 100644
> --- a/arch/alpha/include/uapi/asm/console.h
> +++ b/arch/alpha/include/uapi/asm/console.h
> @@ -25,6 +25,8 @@
>  #define CCB_GET_ENV            0x22
>  #define CCB_SAVE_ENV           0x23
>
> +#define CCB_CFGTREE            0x28
> +

0x28 is not an architected callback: ARM 4th ed. Table 26-9 (p. 26-30)
marks every code it does not list as Reserved. So this is a Marvel
firmware extension. I'd keep it out of the uapi header, e.g. in
asm/console.h, which callback_srm.S already includes, and say in the
commit message that it comes from Tru64.

The boot-CPU-only call is fine by ARM 26.3.1 ("some console routines may
be invoked only on the primary processor").

>  #define CCB_PSWITCH            0x30
>  #define CCB_BIOS_EMUL          0x32
>
> diff --git a/arch/alpha/kernel/core_marvel.c b/arch/alpha/kernel/core_mar=
vel.c
> index 92e3312e786e..bd918028b410 100644
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
> @@ -1094,3 +1097,48 @@ marvel_agp_info(void)
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
> +       if (!alpha_using_srm)
> +               return -ENODEV;
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
> index c418333d0b89..dc4ae0e0ed05 100644
> --- a/arch/alpha/kernel/proto.h
> +++ b/arch/alpha/kernel/proto.h
> @@ -111,6 +111,7 @@ extern void * __init move_initrd(unsigned long);
>  extern struct screen_info vgacon_screen_info;
>
>  /* srmcons.c */
> +extern spinlock_t srmcons_callback_lock;
>  #if defined(CONFIG_ALPHA_GENERIC) || defined(CONFIG_ALPHA_SRM)
>  extern void register_srm_console(void);
>  extern void unregister_srm_console(void);
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

Magnus
