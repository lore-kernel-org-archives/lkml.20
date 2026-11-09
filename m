Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794235258;
	b=tSNFv16G2MaLAMYoRoYz0G8pAtEkgiiMvLai6mhJhr84cO2ZW1P7n2taD+jeXuIT1Mo/
	 1Mb8FobAInQCxWjhySSFx2+T92RI8kEMhZw8CyrZQoizRqB4lQ2uwA99oFt+6q4Y6Qfrr
	 Wxoy292XFNJR6sLB+fpe1gSoFFtQ7rVwfFZP5BKkHkieEXfjmPrrrJ5WsYaHMSuTFkIAE
	 cWMNdp/1ckQ5cSR4x0/Bm7BPkdiv4ppLduMeBLnv1GPMt30XGA4tzWDbOZAYLTQADhdPA
	 gCjgD+PXQjz/UntfOsmuQ4xgn23qcvR3b05ox+bu1G5RRold7miR26/bffN5HDGrbmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235258;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=cy50rfmz2U8Wenr7PayVcuqxUEa3jPtDbT+8qtBvWBI=;
	b=kbh/X+1cN64OzrCkC5sC/og9lhbqR1e+IaeqBdY+XAO3dC64Ow/4F9nNId749y3L6urv
	 CiG3FZl7NKyf/5wLWCueOkrFTytTjOFGMxgGqHH4Jnu+NwXe6Getg+5PE4azn/qKoYg2p
	 CHPI+b7/uqk/a79bdasB25raZYU6hmZF7U4Nk1nGfQag1MaRfCbDzMw1bJeKr50TGOzYn
	 pe6RU0s/Mc8hZCNrqy+bN8FudNK3HcWN0AYb4fWAXv3ZocsMVXxSfZg86RKt7e3S0Dv5u
	 a33srmSbqq0NA9aQqLOyj73mDdawPWT3G4yVUBD1O/Bz6QiB6knM4TvO2DT7TBwmn3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B624B606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B624B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5e948e56af3so350700e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:40:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794235257; x=1794840057;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cy50rfmz2U8Wenr7PayVcuqxUEa3jPtDbT+8qtBvWBI=;
        b=eOvZmYO8rSOzgFO/+MC+DwKi0qGDmzyWfew+4ntppsQFt0lSM+KeVgho7+PnikcKbJ
         HwSjFLjKssnFyxdcokOJwoNdLpf3xZ3zSDM1WhNw8u2F8nSYUNQu2YJ/rhXKIhqdkwAv
         +pxkwypqBPjxhNmZdpfLonq+0k+2/5SzT9wLn9Sl84cFNS/RBIZx6VPpeeNesp3yV2qK
         c1Ue4p/5G0jUsMcbaxuTK9GLEixBG9fmCiS8CrhEgmkqJBYpDaDt8LnjDwulFrdr8jBZ
         lRByPG1qUMfEkipn5HDGXrgMW8E+3PJjA4r4QDq2Bl+Ub/d3aEnQWWdP3aHCLrVTiQvc
         vxkw==
X-Forwarded-Encrypted: i=1; AL+hErFLF0Rb7Ah9DNZu5d4BtnZWR2SqierYEXum4AiwWaq8GMIb8qTbPgRV23ITgBxqBiQH7cd3P+Ts8AMSGoE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hWMljESBC5oavPvI9HJekGicBKX92rv087gU4VzsI5fClDHKm
	DUwXIzsGiC+AAB0PY9ryaGCbekCHfMK14X1b3HCjz/TlF0O+Ut6OTF74wgvj7mvOVak=
X-Gm-Gg: AYBFou1Z7LwbRudXxp3msBHJCe9MZs0/V4id6KXSR1IRPeavl9oAYoXIl+PXj0GsNOB
	OM55pIPR1j1p41ER1ogNCQaOwhcH0ecxY1fLywn7ofcvFyp+fVO01LCNKOD6QXx1x7cuEFSlrDJ
	RiF7zzO9HImH9QGayNBEpGXGibguOOd02J+tSpfOJHE/LFcOoMfEVIw3LsboZ+hALyALd3QCEAo
	wfV+q3wcQxg1kUKT3P15awAGWePv4Xf8qSRh36+Th9fWlIJ22WMCJMR0/syRu1OEEsuURDAe25g
	BHkvea7sQJz3Madfgi2Knc+klCusJmfbdzXFD7VqvvTCDMYqdnlSc/EY+UeppOCSkLK2H/0+8CA
	WW3wAGfJCNP6oAxTdGg5F9DLgwZkSvYLXX2UdykXE03XkLTmJQuBtC3Fv1il2pKScYpcd9eUg68
	ChXgFD2BwJ3RfLya9cIgy5jokcEF9/L281tlQyGf2btli/KXYDkSfuEZN1EydAS/5vPge4zy+cb
	bQZuh6K2TMpdnBSgz1lh12bnW3y9RymcC329Nn8ghcAT2y32L+1GoBLTf0uzmciErpsCk/ERvvO
	0K+QEzTRtnKZD90umpuOPhzpupCy69lRlnqLgTuh35xjEKLqEfIsh8lW39okY2kIWqf0p/lDlvR
	+OoiJcCwKooo=
X-Received: by 2002:a05:6102:f8b:b0:7ce:8505:9848 with SMTP id ada2fe7eead31-7d2db1ebbd3mr1256899137.31.1794235256535;
        Mon, 09 Nov 2026 06:40:56 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d2db578e09sm4234433137.4.2026.11.09.06.40.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:40:50 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7cc0e865dd1so314428137.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:40:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEuDFUdP1859SuUnj/p/anN2TSQ20WK0yE4OivpXJbs4LUcFcJ46QyDJN3X1zX6u35SonbnY/iIb0TbVwM=@vger.kernel.org
X-Received: by 2002:a05:6102:5693:b0:7c1:8aa5:36d6 with SMTP id
 ada2fe7eead31-7d2db05a3b9mr1026612137.11.1794235249748; Mon, 09 Nov 2026
 06:40:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <202611071612471583hApcIRmqJX9mMWQtxmcN@zte.com.cn> <20261107161252647FthWsffiqzpLz7zrKd2ux@zte.com.cn>
In-Reply-To: <20261107161252647FthWsffiqzpLz7zrKd2ux@zte.com.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Nov 2026 15:40:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXHSU3QLanoVyAr3a5akukwDbCHWYoGiLT8HfuCGvHmog@mail.gmail.com>
X-Gm-Features: AclHuK8ggxFfIk6ZpEhrNh6YRrumZjRHb3TbORQZdwxVU1wvicBkSXZ49z_E2iM
Message-ID: <CAMuHMdXHSU3QLanoVyAr3a5akukwDbCHWYoGiLT8HfuCGvHmog@mail.gmail.com>
Subject: Re: [PATCH 1/5] gpio: rcar: don't clobber INTMSK when disabling a
 single line
To: shao.mingyin@zte.com.cn
Cc: linusw@kernel.org, brgl@kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andrew@codeconstruct.com.au, wbg@kernel.org, 
	opendmb@gmail.com, florian.fainelli@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, jelonek.jonas@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Shao,

On Sat, 7 Nov 2026 at 09:13, <shao.mingyin@zte.com.cn> wrote:
> gpio_rcar_irq_disable() writes ~BIT(hwirq) to the whole INTMSK register,
> which clears the bit of the line being disabled but sets every other bit
> in the bank to 1.  Since a set bit in INTMSK means "interrupt enabled"
> (gpio_rcar_irq_handler() only handles lines whose INTMSK bit is set),
> this disables one GPIO interrupt while collateral-enabling all the
> other GPIO interrupts of the bank, which can cause a storm of spurious
> cascaded interrupts on level-triggered lines.
>
> Do a read-modify-write to clear only the line being disabled.
>
> Fixes: 119f5e448d32 ("gpio: Renesas R-Car GPIO driver V3")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Thanks for your patch!

The GPIO interrupt masking operation procedure is indeed a bit uncommon:
  - Interrupts are disabled (masked) by writing 0 to bits in INTMSK,
  - Interrupts are enabled (unmasked) by writing 1 to bits in INTMSKCLR.

Section 10.2.7 ("Interrupt Mask Register n (INTMSK0 to INTMSKn)")
in the main PDF file in [1] states:

    "Only writing 0 to this register is effective."

Section 10.2.8 ("Interrupt Mask Clear Register n (MSKCLR0 to MSKCLRn)"):

    "Only writing 1 to MSKCLR is effective".

Hence setting extra bits in the INTMSK register does not enable all
other GPIO interrupts.

NAKed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/gpio/gpio-rcar.c
> +++ b/drivers/gpio/gpio-rcar.c
> @@ -129,7 +129,7 @@
>         struct gpio_rcar_priv *p = gpiochip_get_data(gc);
>         irq_hw_number_t hwirq = irqd_to_hwirq(d);
>
> -       gpio_rcar_write(p, INTMSK, ~BIT(hwirq));
> +       gpio_rcar_write(p, INTMSK, gpio_rcar_read(p, INTMSK) & ~BIT(hwirq));
>         gpiochip_disable_irq(gc, hwirq);
>  }

[1] https://www.renesas.com/en/document/mah/rzg-series-2nd-generation-users-manual-hardware?r=1054546

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
