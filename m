Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325564DF4A0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449540; cv=none; b=RKHmwHxjjk7JGPZcH7Dyjk22HHeeUd7bR2hehKMHbA+FM/ytqmE+vVmyKrnJ4IURvnnoDpUE+hCVIfXz6HEgxBxHaK85CjFfJsVpMapT682dDp9iEirgSRBc4zg6QcVI2dqopjl2xEGD9BZgZHt0bCSCNXe9fuFarpL9E20hIZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449540; c=relaxed/simple;
	bh=O1T/S/tnLkdqmvZL1LvuEUmH7Qo5CdEtlWyLMpBc4J0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sqBGhj5/cfp0bfMkRxBvK5YBeN7p0MTbH14aMOEJQn/Hqa2Kn81xAlTCjvUjA/Q3aNRi5qaM0LDF///ps/cJ90WGQ4OddQHp7omP96PwivTKZ+VXjjqrzKZv5c3c+ZTJKzA0YJ+kEufZpQX/2vkZHkCaxsIKBMrdc9AemZFuQdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-59b074ec7ceso1046329e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449537; x=1789054337;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=smhgAnbElT93Xc14KAwXUjbx11QNBeL7p1UChIAHiR4=;
        b=jDuJkXqfZzdyXVNI3fejiu5ESeqQf0nzbmt1Ih3vn3v8WlxZ+9ponYISuUmRFrEQ/2
         zzUxgEI7s9U32EuCL8WVedHuopEke8mUiw6f87H8tbujzusMrz3OTVBi0rbS152FC6FT
         hFepdEvDabkUnVA3GoiazYHz2mK4vaFNPejeTp9X38wFNUl+nSiFfrlEBy3ePA5qnlTu
         ttijZvAyGoQk+1qGhEdC3RuVfEV4rTXDKzaceIfMieN57Cprnv0x5GyXMv8Jr2exBx1z
         +WhtQWZDPZhWH7QsR5bUQOda3/R/mySyWrV00yvkegWImdHsoCf8ugcnBoR5nzQAmyBW
         kntg==
X-Forwarded-Encrypted: i=1; AKwUvBwnAGbtT2O3AHeRhQanKrvPbaQTMgzqzLCjEyJ8f4VsPLt+WgXof7thJuj7jbrPJBRQ3PvoZ4Unnlg+60s=@vger.kernel.org
X-Gm-Message-State: AFuF++ne9R/e7yxi5x3qE+pmHyRx07A6Ic9XQO2EnLfXVFP+1utOylRJ
	v8Ev5Tis+KCXF53IZiDDuo8W7W7LOp1p2RHPcPCyjASKmeqWQZ9ojTpy+fem0bRMI9A=
X-Gm-Gg: AYBFou1BsDv/vhCxsuthCakp2AoGWA7SHb5NkSx05IXNTBrzK4/gwZzevxdSI0meCpp
	76mMziJkQWGLPT8hWXO4f+XWYnVhr9N/rJKpoJDgubGmReJuD3FJaCmqisUOzDuOXOHWQ+N0Mw8
	2ZggswRP/9aoOv5GNj+Y1BwyZyOpWwhytn+Dl83pWt7zu0EotdpuG8o18clh4dgNjr/ICI14dub
	9rawtXFh+pn0ICaE6yalJN/EoILE8hHtDaOk99uXAz9MRw+jzW4ywPyd81lG2xjaythwjOPV6PR
	rRIFkO/baF3I1NddRx+mLVxu5XGWyL5n8KVCjWlCk8dp5DIP3VEUPgo1pIiVCvKY+PiqCnJ8hE0
	l9y3OV4T9bAz5pLFx7270SpNNLMhIoMG1d2eXpUNogasm6BDZRE3i9W1d8FVGtGVBOXQ3eewDeB
	cUZGcPZ6SWn9wKITqzBDQnFaLgp1sgyvxTSggcUFoyeXrGFJ2tp+C0Kwa8ULkZXrjywryqe5yjM
	T5Iw9Psde0uifVTv2XNjba5rA==
X-Received: by 2002:a05:6122:1781:b0:5bc:42be:f758 with SMTP id 71dfb90a1353d-5c7d2832974mr5384083e0c.3.1788449536671;
        Thu, 03 Sep 2026 08:32:16 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7cd92817asm4694974e0c.17.2026.09.03.08.32.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:32:15 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-97bf91b2e6eso10805241.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:32:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzaaMELSl1a+ovP0Ckuxn5cOguHHOxXa0PrQq9aVIOy/nV51hTKgYjPPvKFEQyTywYeC2iovi7j2fozUCY=@vger.kernel.org
X-Received: by 2002:a05:6102:e0d:b0:789:5f54:2367 with SMTP id
 ada2fe7eead31-78a1f1f13e9mr4112330137.4.1788449534923; Thu, 03 Sep 2026
 08:32:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903113327.1217457-1-claudiu.beznea+renesas@tuxon.dev> <20260903113327.1217457-4-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260903113327.1217457-4-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 17:32:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV9C6LVBqYWo=Njgf3v4a5R1LhBwKuB5H3TFctOCr338g@mail.gmail.com>
X-Gm-Features: AcwNN1WnpoMcG4OiqSwpOhcE41-w5QvCDbZ1B83z-OJyrnfhHqNepFiL_pVw_TE
Message-ID: <CAMuHMdV9C6LVBqYWo=Njgf3v4a5R1LhBwKuB5H3TFctOCr338g@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] pinctrl: renesas: rzg2l: Unify the power source handling
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Thu, 3 Sept 2026 at 13:34, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The previous code handled power sources using a mixture of power
> source specific definitions and lookups in the available_ps[] array.
> Unify the power source handling by introducing
> struct rzg2l_pinctrl_ps_desc, whose purpose is to describe a power
> source through its power source value, associated register value,
> associated capabilities (e.g. Ethernet), and associated IOLH index.
>
> Introduce two new functions, rzg2l_ps_to_desc() and
> rzg2l_pwr_reg_val_to_desc(), using the
> RZG2L_PINCTRL_PS_DESC_MEMBER_TO_DESC_FUNC() macro, as their
> implementations are similar.
>
> These functions retrieve a power source descriptor based on either a
> power source value or a power source register value. Other functions
> that need to perform power source specific operations can call them to
> retrieve the corresponding power source descriptor.
>
> The register values for the soft power sources were kept to zero since
> they are not used across the driver's code.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v6:
> - described all the available power sources in the available_ps[]
>   array and dropped to wildcard approach to avoid letting the user
>   selecting unavailable power source for pins
> - simplified RZG2L_PINCTRL_PS_DESC_MEMBER_TO_DESC_FUNC()
> - for these two points ^ didn't collect the Wolfram's Tb tag
> - dropped rzg2l_ps_is_supported()
> - used conditional operator in rzg2l_ps_to_iolh_idx()
> - adjusted the patch description

Thanks for the update!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c

> +static const struct rzg2l_pinctrl_ps_desc available_ps[] = {
> +       /* Ethernet I/O voltage domains */
> +       RZG2L_PINCTRL_PS_DESC(1800, 1, PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1,
> +                             RZG2L_IOLH_IDX_1V8),
> +       RZG2L_PINCTRL_PS_DESC(2500, 2, PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1,
> +                             RZG2L_IOLH_IDX_2V5),
> +       RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1,
> +                             RZG2L_IOLH_IDX_3V3),
> +
> +       /* SD I/O voltage domains */
> +       RZG2L_PINCTRL_PS_DESC(1800, 1, PIN_CFG_IO_VMC_SD0 | PIN_CFG_IO_VMC_SD1 |
> +                             PIN_CFG_IO_VMC_SD2, RZG2L_IOLH_IDX_1V8),
> +       RZG2L_PINCTRL_PS_DESC(2500, 2, PIN_CFG_IO_VMC_SD0 | PIN_CFG_IO_VMC_SD1 |
> +                             PIN_CFG_IO_VMC_SD2, RZG2L_IOLH_IDX_2V5),

Before (see below), only Ethernet could select the 2.5V domain, so
shouldn't this entry be dropped?

> +       RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_IO_VMC_SD0 | PIN_CFG_IO_VMC_SD1 |
> +                             PIN_CFG_IO_VMC_SD2, RZG2L_IOLH_IDX_3V3),
> +
> +       /* QSPI I/O voltage domains */
> +       RZG2L_PINCTRL_PS_DESC(1800, 1, PIN_CFG_IO_VMC_QSPI, RZG2L_IOLH_IDX_1V8),
> +       RZG2L_PINCTRL_PS_DESC(2500, 2, PIN_CFG_IO_VMC_QSPI, RZG2L_IOLH_IDX_2V5),

Same here?

> +       RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_IO_VMC_QSPI, RZG2L_IOLH_IDX_3V3),
> +
> +       /* AWO I/O voltage domains */
> +       RZG2L_PINCTRL_PS_DESC(1800, 1, PIN_CFG_PVDD1833_OTH_AWO_POC,
> +                             RZG2L_IOLH_IDX_1V8),
> +       RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_PVDD1833_OTH_AWO_POC,
> +                             RZG2L_IOLH_IDX_3V3),
> +
> +       /* ISO I/O voltage domains */
> +       RZG2L_PINCTRL_PS_DESC(1800, 1, PIN_CFG_PVDD1833_OTH_ISO_POC,
> +                             RZG2L_IOLH_IDX_1V8),
> +       RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_PVDD1833_OTH_ISO_POC,
> +                             RZG2L_IOLH_IDX_3V3),
> +
> +       /* WDTOVF I/O voltage domains */
> +       RZG2L_PINCTRL_PS_DESC(1800, 1, PIN_CFG_WDTOVF_N_POC, RZG2L_IOLH_IDX_1V8),
> +       RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_WDTOVF_N_POC, RZG2L_IOLH_IDX_3V3),
> +
> +       /* Software voltage domains */
> +       RZG2L_PINCTRL_PS_DESC(1800, 0, PIN_CFG_SOFT_PS, RZG2L_IOLH_IDX_1V8),
> +       RZG2L_PINCTRL_PS_DESC(2500, 0, PIN_CFG_SOFT_PS, RZG2L_IOLH_IDX_2V5),
> +       RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_SOFT_PS, RZG2L_IOLH_IDX_3V3),

I never really understood PIN_CFG_SOFT_PS...

> +};

> -static int rzg2l_ps_to_pwr_reg_val(u32 ps, u32 caps)
> +static int rzg2l_ps_to_pwr_reg_val(u16 ps, u32 caps)
>  {
> -       switch (ps) {
> -       case 1800:
> -               return PVDD_1800;
> -       case 2500:
> -               if (!(caps & (PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1)))
> -                       return -EINVAL;
> -               return PVDD_2500;
> -       case 3300:
> -               return PVDD_3300;
> -       }
> +       const struct rzg2l_pinctrl_ps_desc *desc;
>
> -       return -EINVAL;
> +       desc = rzg2l_ps_to_desc(ps, caps);
> +       if (!desc)
> +               return -EINVAL;
> +
> +       return desc->pwr_reg_val;
>  }
>
>  static int rzg2l_get_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps)

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
