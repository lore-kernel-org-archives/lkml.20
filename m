Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794926119;
	b=bh7rqc8hne+Gl8enHtdIzvtgMP+qyUSwdr9WThy720+UJcpcSmLCC41TtbP5hsCQrbF3
	 +X+kljMPoyOcMfO0dnX7WeELAZOGEx7tXxuwKOyNgwgK4ecGMvVlJsOA8hP9duto9G3Eu
	 uOVrwncwZi3qyhQlhd8cXLx4NK3cEi4J1uuDoRXwgeFLzo24gmNv9pk+nEHwjSaaEG9nq
	 QSf2xUfDaV/yjWVHRVKUd9n5Rdlj6r1DDLPtexhd8GLLvmB4zf59AXG5F3GXdtj8k4Ali
	 ZvX0jI9uZyQEpdBNfnZP24jddySxk2YtDpJvayM7RebO/Vv8jD0bsC5p1ZS15A+YenA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926119;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=p7ojMjj4LC4SS1WElXDJT7WyRei5tH4ru8glaxJTYq4=;
	b=YdH0kt45nPj1oEd6ZM4L13znWk6IeRTpSRc4QnUEOXLhKxli+Ej3CupChUXcTEf2nLcz
	 AhoBzjPgB2e9TMjkajYrCGvD7Ls6c4vyBucdk7/6T3PR+H+CswG/nM1kWVci3DxujvIvJ
	 uPYiYFi0XYq5eox49wA96dWtQu1k4BP6XfUQ6AawUKMKo7iVgqak+HUmIKOUPR/AjVZnC
	 zLwe4eHrJs+wl1qZqc+8XJ80ZjnBFzXI2xvsQ7yQDHzdEwa6PQPK42qvrWu3tf2dgsYed
	 sDk2MFFC5lYCpdmEVmjv5sDGj10G/dpR0GpKoaFmS+xsJtPSBEoLey5CP/+3cvmwPLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884E5606AF41
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 884E5606AF41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7cc603a168fso1654797137.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:35:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794926117; x=1795530917;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p7ojMjj4LC4SS1WElXDJT7WyRei5tH4ru8glaxJTYq4=;
        b=sysbIrTdsBl+rSIi5DNviOjMfA+quInruBP3eiW/QVJ6BfiefR3beoOi1aOve4YRmR
         KEb1OfVisr1pEXOoeieoBQjfNOiEDEP+7VqIk2aLOzIDYaERGz5Ti2SZmBrWboS36v9W
         MxnMgwUuxl2g+LzaQy9aA7TqMqDInig4Yx00V6n2eZlEDbMs9ZegSDOe64qpjqQSD1TW
         1PTvvGwQTe4Yiv6eT4jsikQZENjvTN0CSntZyniQ1Y7lOmLELfj/+xczUUyFJgaItmx4
         FtsaBvn/pQHS32UNtpZw5Vn/2BCjIBH02co+DJUZ4nycE0g79row318o3q4u5esiWyKK
         tvjg==
X-Forwarded-Encrypted: i=1; AL+hErFC1WWzc3H4cnVtczsbQA8+gyf/4R16inMQ4JAjGemC2DqprxMJuxi1u0NQ5LquUxAHJBA8tcsG2+b5xPg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kDRgP43KuxgScDB2C3GnpMCyJFL2ZxeGb03I5hi1I/HHUjdqt
	cBaQIXBpgwEq3ffsYjmet7U1COx/3I8QqTr6Avu4yIe/FV5atURDXebygKWnvAff
X-Gm-Gg: AYBFou2p8Pb/w3puEQ3VouYv2kG8aP0jskZ9dxQE2Y+VjXACC3XXL0Mupv3ZKuKhWd3
	RS0CZZgg2JjjtCPULhdWXAOWHhoZaaG9F7vzuqi7lrARscZs+vvQ1t1d2/5TOyFU9sXVuomv1y5
	0uKDRPwYIlc8C7Yn+IuiK8DybQnKGt6//GkBsxTV5yWQgRm+MiwKW2S0Ypa/+HAwbp1AYzG43D+
	XUpkBqK3Mr4iSH+4i2xxbQ7wpHCVTuaZMY/dxIh9KleVqEMZltTfXVQkd7oo44yFv/2Dgq05vR0
	eN0ynRacot7Y8C52bOLqs3uZUi/LJkY0C425bVoBzjRHgaFMPuhjzDMWTgqbbdbcTBucBjbk0KY
	1FWQnW28LpauGiRDZl6sRxzoxMCjnBsxBhL/puRngmNwYRW3RP/hfICKLPCHcQMel0w2zC256qd
	pIc/CLD4yM0eHyQGUFiEm1m8uvGIC7f7UnRRzNPTc3Pm2qAvH1lY9xpY1khla17jTthB822q0JD
	77v/fzpSddr+0yj3sbA8I0P8cJIbwHUoSlxBgxoy+WGi4NbWxCBN8p1Qp4sfjklnDhJQPndAhGU
	4uXKl9XDExQbaQGUYpFZnYHhdVybT2dFoLDa3GFuZ9jDcXowKfMWqcHTc9tnVJf4olG2oLph86F
	DI5dffFN72Hl4
X-Received: by 2002:a05:6102:3e8e:b0:7d2:76af:fcce with SMTP id ada2fe7eead31-7d64d69dd48mr3933541137.9.1794926117310;
        Tue, 17 Nov 2026 06:35:17 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e3389bb37sm2131722241.3.2026.11.17.06.35.16
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 06:35:17 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7cc603a168fso1654786137.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:35:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFDRZ8qj+LQ6lCBFdTubTjo18NmKI46wBrdZURBytY90FSTuAtU7LlRkZagomjaY2QgPR4kuqgKKv73Ydo=@vger.kernel.org
X-Received: by 2002:a67:e118:0:b0:7c1:bc57:c7f5 with SMTP id
 ada2fe7eead31-7d64d69de8amr3553023137.12.1794926116643; Tue, 17 Nov 2026
 06:35:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
 <20261113-clegoffic-pinctrl-scmi-gpio-v2-1-faccb4685d88@baylibre.com>
In-Reply-To: <20261113-clegoffic-pinctrl-scmi-gpio-v2-1-faccb4685d88@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Nov 2026 15:35:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWwp4RtKnBpFNJPHdigzrQ-wf3yt-pBZGG9QKs9tcd_Ow@mail.gmail.com>
X-Gm-Features: Aa3M54qy9_Rj7xaMwVGFv3qcI8VRtXgzHIP9TNCjd9LuAgCDDCHrVflQc6VrO_I
Message-ID: <CAMuHMdWwp4RtKnBpFNJPHdigzrQ-wf3yt-pBZGG9QKs9tcd_Ow@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] pinctrl: scmi: send the drive strength in microamperes
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, Andy Shevchenko <andy@kernel.org>, 
	Dhruva Gole <d-gole@ti.com>, Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cl=C3=A9ment,

On Fri, 13 Nov 2026 at 16:02, Cl=C3=A9ment Le Goffic <clegoffic@baylibre.co=
m> wrote:
> SCMI gives the drive strength in microamperes, but
> PIN_CONFIG_DRIVE_STRENGTH is in milliamperes and was sent unchanged.
> Convert it on set and on get. It is the only unit that differs: the
> debounce is in microseconds and the pull resistances in ohms on both
> sides, and every other value is a flag or implementation defined.
>
> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl=
 driver")
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Signed-off-by: Cl=C3=A9ment Le Goffic <clegoffic@baylibre.com>

Thanks for your patch, which is now commit cc2f90768e971bcc ("pinctrl:
scmi: send the drive strength in microamperes") in pinctrl/for-next.

> --- a/drivers/pinctrl/pinctrl-scmi.c
> +++ b/drivers/pinctrl/pinctrl-scmi.c
> @@ -14,6 +14,7 @@
>  #include <linux/scmi_protocol.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> +#include <linux/units.h>
>
>  #include <linux/pinctrl/machine.h>
>  #include <linux/pinctrl/pinconf.h>
> @@ -155,6 +156,14 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_co=
nfig_param param,
>         return 0;
>  }
>
> +static u32 pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param,=
 u32 value)
> +{
> +       if (param =3D=3D PIN_CONFIG_DRIVE_STRENGTH)
> +               return value / MILLI;

Does this need rounding?

While MILLI =3D 1000UL is correct from a numerical point of view,
it is not correct from a semantical point of view.

<linux/units.h> has:

    #define MICROWATT_PER_MILLIWATT 1000UL

In the absence of a generic conversion value, "(MICRO / MILLI)" might
be better.

> +
> +       return value;
> +}
> +
>  static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param=
,
>                                              enum scmi_pinctrl_conf_type =
*type)
>  {
> @@ -167,13 +176,17 @@ static int pinctrl_scmi_map_pinconf_type_get(enum p=
in_config_param param,
>  }
>
>  static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param=
,
> -                                            enum scmi_pinctrl_conf_type =
*type)
> +                                            enum scmi_pinctrl_conf_type =
*type,
> +                                            u32 *arg)
>  {
>         if (param =3D=3D PIN_CONFIG_LEVEL) {
>                 *type =3D SCMI_PIN_OUTPUT_VALUE;
>                 return 0;
>         }
>
> +       if (param =3D=3D PIN_CONFIG_DRIVE_STRENGTH)
> +               *arg *=3D MILLI;

What happens if the result differs from the original value in =C2=B5A,
due to truncation or rounding?

Likewise about the use of MILLI.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
