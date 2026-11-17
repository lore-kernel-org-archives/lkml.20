Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794913753;
	b=Pf2AaHWcE2HHnewdT5PjhvUOxGgCf7dp+iEULW2SGHgwJbSJzOiIg2K3Y5sjybAXGzb+
	 m+G4k0iJkO58IgrW+wquziRwwHJDyKYYsvnAgBo3OTr8oGqRi+FPDes2e9iXuP8nW0NgM
	 1IEPNoFsP/En5dcUzXubHo51WgGUTnCv16FslXZ9IcrC2c++AA5ABDXY7U4XkM6wQerb+
	 hD+j9q3wVlcXSaZmqpDvu6PCJ66oUfhUxVWohS7ehY1pAdfkUa4VbnPD6GQJDV/5gixNL
	 hX11F7KiGGcFCUr91IhUjjXvJHGpwHOgcy9q8eJ7cuV+D0UshZ26Lxm6w5QM8vsiBAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+5RFtFeHVJYTUWfudaVF9Kzy7VFX5fFixoIPN3O+g6o=;
	b=G/Xqg3S5CvLy6N7Z1lk7Q3i37iA+GaX99Vx5gtBik6Zf7WrUjLBvNSmMWwXsC1lypoF4
	 7QWF/hXYC/Wc/Jtm/f6tgbS3UKZsH4Jo+UCH9N2Yv3HN9OERStlltJpojuFawwXHHfvRG
	 sc6A0eIwiN5LXkAgOkd2TXylLUcMOPr166As68FxK4bbtoMI91DcUEaugijm3idq69gxU
	 nxQMWWWdRXaqL7hOyKGn0b/qt+ORbNvUzbPZM1DPwXknPNaS/5jXO3cy/qVNRgdoMHSfy
	 x39Fe+aws5n5yOJ21uLrf6sa/KshF4yKYCxHGmlZWk2tV83sQv4pMLOP59EFggXr0kA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="o/On8or2";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41D3606A335
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E41D3606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o/On8or2
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d21051042so264945266b.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:09:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794913751; cv=none;
        d=google.com; s=arc-20260327;
        b=aNVYZoyakfdaurIQuz5S+wVWJ0wOghfpBNIQq0wvEocuJCWpFaG0zKpJg6skY5iPKF
         LfYaZKfxv6UovSei9VhJZECdqswjsA0WoR4fhL21JYBVgt/+jUD73gHviib4NiGZZtcS
         MBYZURUbjFe0/WglV/QuZBZ0Im+ot/xGnJuWCOocW++xJ9feme+W9yBXa7vewpYrbetb
         Vuv6YX4ctGyBLwKIwStAPYZUXxomu2/u0Y3QtHbZ8ZpmW+ufLGltaVDqoiLSnks2SzRG
         m4y6noc016HG9sjtpt9Lq21t3Bj28ZmiUtTotwziSB/FsMQpN1hD+qFMAPzHT/SM3Qeu
         XaiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+5RFtFeHVJYTUWfudaVF9Kzy7VFX5fFixoIPN3O+g6o=;
        fh=WPhBTavSdZ8EoAWu1so8MTkHdE12dwBJYH2LzoOJl9Q=;
        b=AROkzPBlC+dZkoUrrBwh1PAX6ReUwoD8YTvtlqNeZe+T0snuMRRFt1ttytbDE8dIEC
         965C5XT7OZNRvi9fAw8f1DkusQCKE+4tuh843XqpepbGl9W15f9wgFdzGkKl7/RHQClm
         UvfwjvrjpC/95caDyebrETyHjzeeMzqu07FzFF3bm+mhLoQchjUk1bahNwuaDEQZTYHn
         Po0e/D6jkhdkshBNMkVIjofTsSGhu1imi7VHSvD2+kHd2uJ4pvYhjLyilw6KII3UXZqd
         j/WEhMT8N/tP0hkMZH4tUxeOuKDOekPCwjcTPKlqsoCnbZ3wVOVEEotxoZj2XI9vy5mq
         29Lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913751; x=1795518551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+5RFtFeHVJYTUWfudaVF9Kzy7VFX5fFixoIPN3O+g6o=;
        b=o/On8or2Oy8aXwijm1DRzoNacf/V3nZElWzRSDwSRPXorudIiUm7z5ReWWOfwU7t+N
         FxE/Zvi47jjzme9Lysc90014NGArwMqIcUWi1NYFUM8PGTsn0bgMLOPQrBG43NR0rn+r
         OAL9Xdd5h+X7DKdyMUjyhkIzkyeE3GBWqk42Xc0VSLCaZ+S0UPci6he5xnxPl94FgAaj
         wttOV9UE9SqgW7Uw8I13SZYbzfRGSfffzi2z866IVOZrsXAq8YgbJFOApgpnjlrIQK/N
         CKvAAkRpHLdc6K9YBdByBff7iopDEzkKBYCjKdwo84c44cflbcMF8ZrDZFb2PtRkXdPF
         YiFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913751; x=1795518551;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5RFtFeHVJYTUWfudaVF9Kzy7VFX5fFixoIPN3O+g6o=;
        b=ZggM42KK8QxmOj7wPm1+l8pM69rQdK3SUhXNYah7hAX01kULUe2gVcROVCv1ucX9AI
         6nfbAI26SYTbAeu5bsY3fzBTO6wSHlqYr8pu4OL8ULkHBR6I/mi4/QzPhsFDnG4I+XTt
         oF/LAZjVth5EVXpGuFqTY5nMDOnvD/G1bpIUlu8pU4tqTH+1u+NKHDaW9fyrbbgOjGny
         7d5Z1nxZJYdZbupNCxiMzzMvMT7RilQu8nLpYFAJozTwYqKRNd3tgMF3QXPWCh1OxsVk
         rRjMixxFi9QMmziQcI2jXPrs8DFGUr77535nNPfNgH5FvmF86i/wb0YoeBCXgvauos0j
         2C7Q==
X-Forwarded-Encrypted: i=1; AL+hErFWwQ02U0nTKi9WnhwKSukMtSWhv+vSde6uPR9pyYDDye4CP8HQxgTSNFLGYis0WFlGiTx8UMlXb0r3rWk=@vger.kernel.org
X-Gm-Message-State: APuU4Z87j/n6vxERJxiINCyGgZoXYzem2I1oZQ0NU1xy5pensKOLOqUc
	q6J1TI5HNsMqkJKP5ilKsN9mDp6u+NFIDYZZTS76Nn8ChniDKv+KdXBo6S5PP9H+MJZwdktNYhW
	zSar1Ger02AgfSWs1B4bEqSf4fAIsW2A=
X-Gm-Gg: AYBFou1RR3StTbNfl5/YsJ+7P8SkFpDT115x63pYS73iN6AeWDS4WE/l5Wog5XmAVbT
	+hUEQGqf6o8tQPjl0+huA1Isud2AHN8oVb0Uni+Ypk2Nma0JeDszVQYf+ojAjOuqqJ8xtPPKTRf
	2hT3rUai3mx/MeuLUfYRx48+hxDc+YQ04JTebk22P8ITpXwcSKAc594d9WNa6F4aYKEERxma6HO
	soNax4bqjMJqGYpPPKC46LAj/LUXh5ntuK5KxXEcQopp9VOK+b43B9RqGlD6d2ZzMXKx0XxxaDE
	CQBxzyhWCWXu1F2cR1CheGXqkvzOBC5wibpJeQ3kIMQdre5XsLmnUnQ9gLIPH6Ky/Gk+2P5REUJ
	NyHuXZEZYPF38M47p9ie99qwV/qFKr5XP1/tHwWsW0bTuBpbUnUgZ6f78Oj/aGkp/DiM3WuTOnB
	3kC2ppKlN4nB9QJR+XgPTCw+E=
X-Received: by 2002:a17:907:94c2:b0:c41:26b8:c49d with SMTP id
 a640c23a62f3a-c50963cccbdmr1046355966b.38.1794913751100; Tue, 17 Nov 2026
 03:09:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com> <20261116-marvel-env-v2-1-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-1-ef614eb2e7f1@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 17 Nov 2026 12:08:59 +0100
X-Gm-Features: AclHuK9H_8vU3hJPZ8dHPtT7XE9N0U_m1mhQuXonsqEgANhu7g6ac_7o1E3AWCc
Message-ID: <CA+=Fv5Ttsa=cbSPJSxx86krBNwcm=DRNNASfV+tvZY-sYySU6Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] alpha: marvel: fix the environmental subpacket layout
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
> struct ev7_pal_environmental_subpacket does not match what the MBM and
> CMM firmware (V2.7) put in system event frames, which is:
>
>   +0   cabinet
>   +2   drawer
>   +8   PE (the power and environment node holding the sensor)
>   +10  sensor index
>   +14  state: 0 ok, 1 warning, 2 fault, 0xfffe unknown, 0xffff removed
>
> So the byte printed as "Condition" was half of the sensor index, and the
> state was never printed. Use the firmware's layout and print the state
> along with the sensor's key. This matches the frames in the error log of
> an ES47.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/err_ev7.h | 16 ++++++++++++----
>  arch/alpha/kernel/err_marvel.c   | 28 +++++++++++++++++-----------
>  2 files changed, 29 insertions(+), 15 deletions(-)
>
> diff --git a/arch/alpha/include/asm/err_ev7.h b/arch/alpha/include/asm/er=
r_ev7.h
> index ab17e6333764..5d30af0221fb 100644
> --- a/arch/alpha/include/asm/err_ev7.h
> +++ b/arch/alpha/include/asm/err_ev7.h
> @@ -147,17 +147,25 @@ struct ev7_pal_io_subpacket {
>   *        class PAL (14), type POWER_SUPPLY (14)
>   *        class PAL (14), type LAN (15)
>   *        class PAL (14), type HOT_PLUG (16)
> + *
> + * Cabinet, drawer, PE and sensor are the keys of the sensor's GCT packe=
t.
>   */
>  struct ev7_pal_environmental_subpacket {
>         u16 cabinet;
>         u16 drawer;
>         u16 reserved1[2];
> -       u8 module_type;
> -       u8 unit_id;             /* unit reporting condition */
> -       u8 reserved2;
> -       u8 condition;           /* condition reported       */
> +       u16 pe;
> +       u16 sensor;
> +       u16 reserved2;
> +       u16 state;              /* EV7_ENV_STATE_* */
>  };
>
> +#define EV7_ENV_STATE_OK       0
> +#define EV7_ENV_STATE_WARNING  1
> +#define EV7_ENV_STATE_FAULT    2
> +#define EV7_ENV_STATE_UNKNOWN  0xfffe
> +#define EV7_ENV_STATE_REMOVED  0xffff
> +
>  /*
>   * Convert environmental type to index
>   */
> diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marve=
l.c
> index c0c0ccefc467..85f7a56816ce 100644
> --- a/arch/alpha/kernel/err_marvel.c
> +++ b/arch/alpha/kernel/err_marvel.c
> @@ -21,6 +21,19 @@
>  #include "err_impl.h"
>  #include "proto.h"
>
> +static const char *
> +marvel_env_state(u16 state)
> +{
> +       switch (state) {
> +       case EV7_ENV_STATE_OK:          return "ok";
> +       case EV7_ENV_STATE_WARNING:     return "warning";
> +       case EV7_ENV_STATE_FAULT:       return "fault";
> +       case EV7_ENV_STATE_UNKNOWN:     return "unknown";
> +       case EV7_ENV_STATE_REMOVED:     return "removed";
> +       default:                        return "unrecognized";
> +       }
> +}
> +

After the reorder this sits outside the CONFIG_VERBOSE_MCHECK block but
is only used inside it until 2/7, so this patch alone warns with
VERBOSE_MCHECK=3Dn (and fails with CONFIG_WERROR):

  arch/alpha/kernel/err_marvel.c:25:1: warning: 'marvel_env_state'
defined but not used [-Wunused-function]

Wrapping it in #ifdef CONFIG_VERBOSE_MCHECK here and dropping that in
2/7 with the other one fixes it.

Growing the struct to 16 bytes is safe, since
ev7_collect_logout_frame_subpackets() steps by each subpacket's own
length (err_ev7.c).

>  static void
>  marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
>  {
> @@ -50,17 +63,10 @@ marvel_print_680_frame(struct ev7_lf_subpackets *lf_s=
ubpackets)
>                 if (!env)
>                         continue;
>
> -               printk("%s**%s event (cabinet %d, drawer %d)\n",
> -                      err_print_prefix,
> -                      ev_packets[i].name,
> -                      env->cabinet,
> -                      env->drawer);
> -               printk("%s   Module Type: 0x%x - Unit ID 0x%x - "
> -                      "Condition 0x%x\n",
> -                      err_print_prefix,
> -                      env->module_type,
> -                      env->unit_id,
> -                      env->condition);
> +               printk("%s**%s %s (cabinet %u, drawer %u, PE %u, sensor %=
u, state %#x)\n",
> +                      err_print_prefix, ev_packets[i].name,
> +                      marvel_env_state(env->state), env->cabinet,
> +                      env->drawer, env->pe, env->sensor, env->state);
>         }
>  #endif /* CONFIG_VERBOSE_MCHECK */
>  }
>
> --
> 2.56.1
>


Magnus
