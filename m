Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810752;
	b=KIsFJT9SnYUFqp5mq2PMHgCN7C24Wbf5hm4qAidFPTrNaSK/kuO4zguo3KK9k6mjdFwk
	 raCmBY2/ZFdDXLs8t21ThXSP7Z5/263MCkHIzqu40SjlAoC0BJCJoslJNHpUZRKN7etUF
	 SrF9rLwWYqSqu33cAsQobk8ydty2HHgjCNbXaVBq3IdWPMOdmukdRot10UaOGLFylgz92
	 tEWTLMVgVC9Q5kH9nm7S75zdwuRoj3A228CyKCdDNlabphr4mDNFB48ZJ0YSxAeK2nlrR
	 bpbOwOqOXc19Tv0Ef3hYGE6UAUZGu8hpHHX7rc1VzKNP7b0DJ7vS6OLH2owO0LyIG7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810752;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=7/PYDWmtNB1AMn5wxCKpnTjNlOxtiG/bHQ8Qe7AN3rc=;
	b=PKK5+UYBkLi/In3i9t7GgNiwt54kRk7Kj2er8lSB2x2/N5olwP1qQW/51+Ds3SRhRWcO
	 WT0nWdxwfSHdVNbYmQa5OmoEZ3RJ1DTVv5GfDIs1rYuRz0xLVAuyKIfVO7blCVbYMpXEc
	 1whkN0/Es8Oc3hHpWla7uOMLyAkYU0eI32lZ8y8qIg/rHfYeeLbXhg4M2dpgaJitTnu4v
	 FZ0lQGlP8RUJOY2lTKjrWpRmG6pmS8VM5OGVjyhm08aQ3fvvgGix1sTNlo1S8L7+8zhTf
	 KTgl8dmoQONyI+csv70MAUfNRg5bZXY32GHZG+xX7hG28l9vqle4GXwrp0auKWcsglw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.49
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08503606A32F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:45:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08503606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7c322cbc998so218153137.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:45:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810751; x=1794415551;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7/PYDWmtNB1AMn5wxCKpnTjNlOxtiG/bHQ8Qe7AN3rc=;
        b=shKSAuccGXoRe9SculyeM7zXsKg0sVhK4Ew7mxmb80mz/8BYkUhSkuaf7bLePrKu7F
         VahvU3cZcIh42Y0jULKaX1o1HZ5WvYbCO/y5bkmeKKiQ+9OhJuC9nSrKGi6bOGrAlGWV
         hENLhLz6zZTZB256nygNU9WxOiI2pXDIoEwc/d8tAu/OT4SDBFrI4a0HSx9c31WxfmNc
         jHGRN6bsL5G5lazD54BZOjqVgG7xVIFxD+5JV4GykdjP2KJBu38bPlYJxvhZWBl1RVaR
         tkPUkFP6qrthfPFSejf7DSiwGLHekLunRKnPzJRIloXFf6uODfAbRcpDfSSux7x8EdI8
         j4eQ==
X-Forwarded-Encrypted: i=1; AKwUvBynsK2tfEosXRv6MVc35V2shIhSla2d7Vi79MUtO0MHFr35p2SCrP0vyu9gwqh5kXOpyUJxw8FIdNRj7JQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7+C7oKbD0PD3948qJPqzHVWcSKlXvyk4sQqoJBE1PTbUjCBCT
	9H98/SC439PzKM7UuNiPzHoij55eS/F3CHnslkHyiF6GRw0s/LkenCJZRw4msyEu6DI=
X-Gm-Gg: AYBFou3bN/WOYPTgQYN6CudaA5nWrveOuXZ31GFdhcxwuzPDR9glwNah4iwD65Ihaxl
	rGWdDbR+oq9859AT2bBNRGg+0MP5wBD1ddc5Ehjr0dnDcwQ925RGyxFhP25ZOGMSVFbOuaJCzHJ
	AxsUU1uir+P6F+yOiaSvQY6skEFFe4lf6dbJpebIymAhLj8shhX9OFck2QeTSVs/TxifJD1TJYn
	9MTDEWn6902sToHwN/SeE/BjxTcRxBssTGNjh1hhyrBAjl/OFcI8xvdZ8xIjAAtTtU28Vrdld50
	avEg5egXWGRjSc8PGky6bV1eMlHiAOg9isZymDQqdlrG+XU11UzXDo/l5YfRoikqyktcG4rdBIR
	UmYqdO451FTIxJQ5mTib+1ctLA8ZzVnfnG4aAonBEGU1ZRgcOLpeqHXjJW35gVbqE5sahiFZWbI
	0yaxoX1Gp6cz9yYRUelrSN5DQWYbolGq1QVWQk43oQXhwW+YFk6PVs2QxRHFLtcYG7vpXtqahHo
	LvxhUONBMsef0FbrLFwWy1Tmhr6UMuj1TK/McGVZqJB5x8bgiwOKXnAz+UcbRAKtIz3xKqzq3Su
	sr2qKmuJ0V1VGWcXHiRX5SIScIl1VohXt7AVwquBe/7O6auidvGzKYVGiHZyNnpthQ==
X-Received: by 2002:a05:6102:6107:20b0:7d2:7be1:271f with SMTP id ada2fe7eead31-7d27be12fabmr792423137.31.1793810751009;
        Wed, 04 Nov 2026 08:45:51 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-998d8afbfe6sm2331315241.3.2026.11.04.08.45.45
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 08:45:47 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7cc365db987so577146137.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:45:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzB8BmDJccvYBf4De6PHMlpGjBp8NT/2Yl7t5TWwmp7zwkjUT6XEAqQ/TR5y229hXLkVx2WDK07Nq3RHnQ=@vger.kernel.org
X-Received: by 2002:a05:6102:b04:b0:7a7:198b:6747 with SMTP id
 ada2fe7eead31-7d072713841mr7188563137.28.1793810744356; Wed, 04 Nov 2026
 08:45:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260929113921.119489-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260929113921.119489-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260929113921.119489-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Nov 2026 17:45:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX9bJB-BUqJxvzYbaVuNziux1NhgXvkY6rgvGC6tdYe4w@mail.gmail.com>
X-Gm-Features: AclHuK8CcANpUVtg31h47wbirSO92khOvhLt-OHr-CDqoYw8N4PrzA7mWxauNt0
Message-ID: <CAMuHMdX9bJB-BUqJxvzYbaVuNziux1NhgXvkY6rgvGC6tdYe4w@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g056: Add ADC clocks and reset
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 29 Sept 2026 at 13:39, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clocks and reset entries for the ADC controller.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

Similar comments as for "[PATCH 1/2] clk: renesas: r9a09g057: Add ADC
clocks and reset".

> --- a/drivers/clk/renesas/r9a09g056-cpg.c
> +++ b/drivers/clk/renesas/r9a09g056-cpg.c

> @@ -539,6 +556,10 @@ static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
>                                                 BUS_MSTOP(3, BIT(4))),
>         DEF_MOD("gpu_0_ace_clk",                CLK_PLLDTY_ACPU_DIV2, 15, 2, 7, 18,
>                                                 BUS_MSTOP(3, BIT(4))),
> +       DEF_MOD("adc_0_pclk",                   CLK_PLLCM33_ADC_PCLK_DIV2, 16, 7, 8, 7,
> +                                               BUS_MSTOP(3, BIT(9))),
> +       DEF_MOD("adc_0_adclk",                  CLK_PLLCM33_ADC_ADCLK_GEAR, 16, 8, 8, 8,
> +                                               BUS_MSTOP(3, BIT(9))),
>         DEF_MOD("tsu_0_pclk",                   CLK_QEXTAL, 16, 9, 8, 9,
>                                                 BUS_MSTOP(5, BIT(2))),
>         DEF_MOD("tsu_1_pclk",                   CLK_QEXTAL, 16, 10, 8, 10,
> @@ -634,6 +655,7 @@ static const struct rzv2h_reset r9a09g056_resets[] __initconst = {
>         DEF_RST(13, 13, 6, 14),         /* GPU_0_RESETN */
>         DEF_RST(13, 14, 6, 15),         /* GPU_0_AXI_RESETN */
>         DEF_RST(13, 15, 6, 16),         /* GPU_0_ACE_RESETN */
> +       DEF_RST(15, 6, 7, 7),           /* ADC_ADRST_N */
>         DEF_RST(15, 7, 7, 8),           /* TSU_0_PRESETN */
>         DEF_RST(15, 8, 7, 9),           /* TSU_1_PRESETN */
>  };

The lists of clock and reset signals (tables 4.4-2 and 4.4-3) claim
there are 3 sets of clocks and resets, one for each ADC instance,
but this does not seem to be reflected in the register bits?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
