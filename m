Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810570;
	b=1eRDJhCitR/GAivLo8iberfnlGU+OeSjEJcamJhd4sudFe4jamXv/loZfQssKKZyQB5f
	 si8rjgWZtjwPQM3EVWXKURa594iSlDYVTi/h/pTZ6rklPLJM80gbId9P7AllCg+PvLs12
	 e76GNUxty48acmVmizGh00oP5/ZkYuoH0VRcgNdkwkrsyInm0EZMXETZoLsbeMTgD9dnl
	 2VHcdo2LfZjGta0Y7ZcuHJYU4x53Q8UEliYV73HUa5Ca1ZKQlN5L6pMloq4vczYIBS9eO
	 IyDQEorMWN/xXv+byPWvARheMFVt7eTO2Cg5MlejbN/cdCq/KQDL7NpuBG4FQ9j9LNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810570;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=KJ+1oCAIH39mLuoRRIwRDFkQlDS7B45Vb+3W30Jd5To=;
	b=iQd7VwrrEdxC1/KP4GdnetRCKaTpGuFWo4Mf/RhCXvFoGmdlooygipAZTfpv5F3El3mb
	 DqdajqkrIrYdTKiAgK6PyYyuPEOJhJFaYp3nINWWcLyvEyWcbSUtPv/XoTSfKNwVRhH52
	 VDt/5o2mwGenVg57x0evMivlKlKVm+r2bwDasf6/6K0e0gwuJowpKBIygxYE3bntXWVMA
	 h0WocD56TRe9k6kWniUpGG6cOZmLqRutmoeO7C8s40Z/UpwWEZAsPsI9wrULet+NtVnmf
	 LMNxBpukKYve0YXCoU+bI9D5NJ6I0QSJgflicbFLTWiprKjKD0ZwfrPEgrnGZFiHQEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7EF606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E7EF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5ec3561ad43so457670e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:42:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810569; x=1794415369;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KJ+1oCAIH39mLuoRRIwRDFkQlDS7B45Vb+3W30Jd5To=;
        b=IbaIBijijCjDgiyXFY+oEeHm2va5bhp/mIi9nHVgRUw7U7NWDZI8sEjXa9CtSpqtAq
         FJcXYFRzhZgLupHZh3P/6aV5cOPcOtPICEPdg6Hmv8qfCCEE82l9x2y37/vHm3pl88M9
         q90sjvn+ne+YTPd//iV0d0rvn3GTomEtA5kOBA4q4pE1sRcQFmKAuFOUEWFl7jlk5JSm
         0QWp6FXGYGOOB0hYdNdekUn02wXaRAd38v3Uf6Ifdr7sLLT+6vkHenjjHwQZQABFpvPk
         vCLVcYWbZ9PSSjQ5vK5F06PFKgWibH7otv1zl4eScYjiBASdpjB5mldyTyAavoCyqbyF
         t8uw==
X-Forwarded-Encrypted: i=1; AKwUvBye3Nk5Kfle2+uiyJhBKvsmVRJK2p/5pLAW3qFK5+Ga9c7wyhVK+aocWGCxx9A/AMtsa1oiupy4/v7QBS8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LZdJiaLkmWt+6s9R16dxilcg8pAPictzqVEQ6nwxZlkZwp1t8
	uXGVjdsEEzv2m2vZi7+8C8dZUJkmuF/tptIrIak8ssTVRGixSl09N9lKYUN/wK5kTl0=
X-Gm-Gg: AYBFou3d8lG8rVlJdoSRChmYI5mnGPdUlJ5NndNCmV7oHDHPm5ObNGVknUy2k50YE1F
	DSbhT88avMRAmL1AdWihp3Xi+nRytShk5jnN3KmdOX86NgCqgKH4TpfDfPAGaA45tkHCnHoE1Qj
	lgTurHQohJyERDe+PIGn5WXP0SDZUwX/XS78E0ub8qjRe7Yl9WWGfdOFqBRIelKFwHddrzfRgGL
	78WenrrJP5p8QsiQvbj+KKanv2c0nSdlruaZgHAxUoSsmsK6l3S9Pg+/XdJygOn0Pl0k5nmDnLM
	mU+iVGN6JQEIyxQHlc4gBHO+B/6RPzEgVkrRlEiLfGl5fVVfgVrKKdYtLLFJi4cVMI8DmdQM3H0
	H6IIRffEVZ82ws6pzqvSPf+KgTDnAorg6PW/4vEzD31JEe4yd1TMmCZVCdS2+Tufu1klaameLm1
	HZJ7saWaaDiJE1fCu1GkX/xAQL+oEd6j/zABSLNOKSghz7yHhp/cY7WI6Tv6MwAcgHBytBC470D
	6lS54pgBjfEyek+YduKFEwMeajCpNf0khSu4rZeOoeyhdGPRhd80ymcGLPYcbIJprkSOW+YnLa3
	LZm/2jn8+c60zZzd6CqvBaa3nbAArnLw/lFPryZTZzdrD3gUPOSdiLX2IRSzcmzrcA==
X-Received: by 2002:a05:6122:21a6:b0:5ea:e18b:32e3 with SMTP id 71dfb90a1353d-5ec68951b9emr7512923e0c.15.1793810569330;
        Wed, 04 Nov 2026 08:42:49 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca89b81b3sm2056545e0c.2.2026.11.04.08.42.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 08:42:48 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7bec5112765so552571137.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:42:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwTooNQvxKX6fiYZvpPrHaBlQpF8DPhuVL/Sdht61G82J5pDmugSE370h6G10Atqz3wCOx5JbTV+HHlMVU=@vger.kernel.org
X-Received: by 2002:a05:6102:290c:b0:7a8:10eb:96ce with SMTP id
 ada2fe7eead31-7d07277c1d1mr6700629137.4.1793810568003; Wed, 04 Nov 2026
 08:42:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260929113921.119489-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260929113921.119489-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260929113921.119489-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Nov 2026 17:42:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV5Sn9FaMNEaxQKF7_rm5hvM-pfC2-KU14=96DFGp85jg@mail.gmail.com>
X-Gm-Features: AclHuK-yEEtBzpAX8urnUe9YWbbPPxJguJG6y14QRK8iWGHBOGMP4whb2TqDpDg
Message-ID: <CAMuHMdV5Sn9FaMNEaxQKF7_rm5hvM-pfC2-KU14=96DFGp85jg@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: r9a09g057: Add ADC clocks and reset
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

> --- a/drivers/clk/renesas/r9a09g057-cpg.c
> +++ b/drivers/clk/renesas/r9a09g057-cpg.c

> @@ -173,11 +183,18 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
>         DEF_PLL(".pllgpu", CLK_PLLGPU, CLK_QEXTAL, PLLGPU),
>
>         /* Internal Core Clocks */
> +       DEF_FIXED(".pllcm33_div2", CLK_PLLCM33_DIV2, CLK_PLLCM33, 1, 2),
>         DEF_FIXED(".pllcm33_div3", CLK_PLLCM33_DIV3, CLK_PLLCM33, 1, 3),
>         DEF_FIXED(".pllcm33_div4", CLK_PLLCM33_DIV4, CLK_PLLCM33, 1, 4),
>         DEF_FIXED(".pllcm33_div5", CLK_PLLCM33_DIV5, CLK_PLLCM33, 1, 5),
>         DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
>         DEF_DDIV(".pllcm33_gear", CLK_PLLCM33_GEAR, CLK_PLLCM33_DIV4, CDDIV0_DIVCTL1, dtable_2_64),
> +       DEF_CSDIV(".adc_pclk_gear", CLK_PLLCM33_ADC_PCLK_GEAR, CLK_PLLCM33_DIV2,

".pllcm33_adc_pclk_gear"?

> +                 CSDIV1_DIVCTL0, dtable_8_10),
> +       DEF_FIXED(".adc_pclk_gear_div2", CLK_PLLCM33_ADC_PCLK_DIV2,

".pllcm33_adc_pclk_gear_div2"?

> +                 CLK_PLLCM33_ADC_PCLK_GEAR, 1, 2),
> +       DEF_CSDIV(".adc_adclk_gear", CLK_PLLCM33_ADC_ADCLK_GEAR, CLK_PLLCM33_ADC_PCLK_GEAR,

".pllcm33_adc_adclk_gear"?

> +                 CSDIV1_DIVCTL1, dtable_2_16),

>         DEF_SMUX(".smux2_xspi_clk0", CLK_SMUX2_XSPI_CLK0, SSEL1_SELCTL2, smux2_xspi_clk0),
>         DEF_SMUX(".smux2_xspi_clk1", CLK_SMUX2_XSPI_CLK1, SSEL1_SELCTL3, smux2_xspi_clk1),
>         DEF_CSDIV(".pllcm33_xspi", CLK_PLLCM33_XSPI, CLK_SMUX2_XSPI_CLK1, CSDIV0_DIVCTL3,

> @@ -669,6 +690,7 @@ static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
>         DEF_RST(13, 13, 6, 14),         /* GPU_0_RESETN */
>         DEF_RST(13, 14, 6, 15),         /* GPU_0_AXI_RESETN */
>         DEF_RST(13, 15, 6, 16),         /* GPU_0_ACE_RESETN */
> +       DEF_RST(15, 6, 7, 7),           /* ADC_ADRST_N */

ADC_0_ADRST_N?

>         DEF_RST(15, 7, 7, 8),           /* TSU_0_PRESETN */
>         DEF_RST(15, 8, 7, 9),           /* TSU_1_PRESETN */
>  };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
