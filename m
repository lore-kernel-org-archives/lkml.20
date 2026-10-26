Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003538;
	b=ODP+FszJQN/NUPkkkPHghk7SR7okm60xwXQT8myBz8KUeFqDTgAncxx0WxG/UicRrXEw
	 tdAXuDY50ybmnVD32F2+380C3DmBwT/sVliL89JzvvZ5Gw1UOZ0d68IKeMPrUSHTDYWlC
	 cOwABgotSTetOSV/u74IDmTvEklO0mHt7rTpxkVp4ljNromgVvO0oy/9M2KkLOBx+AfmH
	 08O8KfYVrkZ9yq/OI/2oLHAnXIiNIvgA2v1mqVJtjJG1Rw8ml9/3qurA+NumTUTik8cnE
	 jITGz5tQa24+UpYmw2PtgPL7eM4uCzr18bwCZ1E9aTUfX/p2BpwZpuE9VkF3gShcjnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=FTBCK/49FHYyjT64MBODQZDYUzxg0z0ieIJxPQn3hTo=;
	b=vqROSHBuVvgJelaJZb3QayNZwFP1vYpQ4Eg6wultXA5J8lv5Ar7ymb3Olfh1VAvHfv5O
	 VtduXipEEHEIVmNx2cUacPY5/6Rrc6V+YVftpCO8heFVsDLpu8z/jm1Vp8CQvVQiza1xk
	 3Q8DXrD8U6e0EPWpmuoVngT/q2ub9O37uPvG163tkIU4eY5V2CRAi8omlScmwHU/HLIVa
	 D4fZSLDafGlg76MPYZfsMSHPcjcKp0gnvylpdW2mJTQtcOIrD0Cb8yehhOOsVmKV5R2Hs
	 APeutLUy0lRZEZSEnyc4vSwQ4kGsIGHg0wdLVTo+FrvHV4UxhTedo9NqofBXiqypPwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UBevvWnb;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCA5606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DCA5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UBevvWnb
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1325977f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793003535; x=1793608335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTBCK/49FHYyjT64MBODQZDYUzxg0z0ieIJxPQn3hTo=;
        b=UBevvWnbpfYb5PWc9lvwB1MmZwWuPDn4QE6CCI3+JXFnS7SFMI7aUmXl0iOWC+mgPe
         HnRHx03eQT07MDMI2Yy5spRhVJer44ijo11J9IYtpkMtqoA1wHyibPABVKP9SdH/W267
         SaGDwrpMuci/yA6qP03kgLb+6UYpCdO+WQ/sh1N6fkGY0rdYSK5lPuLG+h0lEPxALL0b
         6T27nYLLjqrYUAGC1p/9/Rb8KECAup7DZGY23jPABFSOFtI+NT4dmGeOZ/JwzJtlJYCq
         MK9jejW/AjKl1fHSp0nMZe//H7BRdlTY0Z4X/YLA6JNALQIRO4ZEAA7gjoJRQSiWIxxw
         2U/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003535; x=1793608335;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTBCK/49FHYyjT64MBODQZDYUzxg0z0ieIJxPQn3hTo=;
        b=q1Og2Lmq3AEL9Mx21CXyGUpFVX9xogZyZZoP0oS2T4yZK42F2f8T0ice/xAWwFYyd4
         KcmFxrEaiFy2P858Cc0kEvv71JU9GwXiIlI9P8BYVd3D0qBcEW2+/JEQio97jsaFxnpY
         UZs1muQeXq2a8FrNNYRqnZk5i5Gh1+AU0ovx5PYkLfMfa91rdXYCcVcT3ej8wGGE80LN
         OWCEokEpUTIngGDUBMS1OEf6hJ/+3gG2dbJ5EcQTrQew76p7bqfB6gogWqJeNkz80+qL
         N4gLhI3ahyazL4bakt/vOzLBc4CPAkXigOuww3BOR+YdAd8MJNj0y1yf77AbxiU2cz6c
         x9Vw==
X-Forwarded-Encrypted: i=1; AKwUvBwldomWdVcIl2f1bvPTs6LClg/tub6stCPREV7o2Ey2/a9SoRDgcjwCQk+h0As2DlGIH/SGBI/WDOy7nLs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFNGk2W6xaHBCJyadguB2K3ePwZOOj6vi05du/B+kNK9b48TbT
	2rQnShvscDcguUuBzJkx6b/xWoWMfMf0vkcWNzNoVEuxEoE7mNWgYWgpppcUXTxTsz0=
X-Gm-Gg: AYBFou1FgOzYGEDIK2uGw/+JrOQlmi4L2gooP9fBL+kSeOQe7cB4rElydYormYcPsBn
	iPRpzVmWbQbixtqrs21lRQrt5QungqhxQhSgFNMl8kygtv+Cx4nO1NUetP0PgfT/c00/lg5HPOs
	rVx6xU/e5ioMqJWPagBWhjul/kxcjLVCpdgZ69pk7jviZZWKmrnd1r60Po3evCGSx6uqqE3R1xi
	vcs5toExmWdIm9KYyO9QwcI2gcbxdZ53j2irwIwf4845HzOctu/hORzl+Yrkixmt6xjNQdpTtSQ
	opGR3DSVPsWpZkCQw40V0Tb93OzK+LsluLir2cZg0CW9DUgQSGHWfWyXVKt1M+3KN1RzGJq4ZYp
	ogKNSuzk/7mFbkaC57PRvqO5vEqf7cMlxOFhOxNuPm7SA0g1W3VbrM8yGB2srJYJICEU5yRNGyb
	xfv9WUVlAvtdYUDfVFyGqYZDWplXPUlC3M8Lv3cq1ZdUmH9i2z2iNbw8aTH7KP2ev5hjTL3OovR
	nnn8SMrsd2UuAlI4Kw0tcO7hk5ZiVAc/GcrF+zDuHvs3Ep4DkVki6sfBz0/hvtuzxe6Y7iW4qFf
	0TdNv1hqTT40x1gh8xEe
X-Received: by 2002:a5d:4fd0:0:b0:48a:f59f:8b70 with SMTP id ffacd0b85a97d-48e3eb9fc55mr7018739f8f.46.1793003535324;
        Mon, 26 Oct 2026 01:32:15 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3a1csm15026669f8f.16.2026.10.26.01.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:32:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: christian.koever-draxl@student.uibk.ac.at, neil.armstrong@linaro.org,
 sboyd@kernel.org, bmasney+clk@redhat.com, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, yu.tu@amlogic.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH 1/2] clk: meson: s4: keep the PWM clocks off vid_pll
In-Reply-To: <20261025191852.208226-2-christian.koever-draxl@student.uibk.ac.at>
References: <20261025191852.208226-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025191852.208226-2-christian.koever-draxl@student.uibk.ac.at>
Date: Mon, 26 Oct 2026 09:32:13 +0100
Message-ID: <1jpkwwkgky.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On dim. 25 oct. 2026 at 20:18, christian.koever-draxl@student.uibk.ac.at wr=
ote:

> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>
> The PWM driver asks the clock framework for the fastest input it can
> get (clk_round_rate() with roughly 0xffff/period), so on S4 every PWM
> channel ends up parented to vid_pll, the fastest input of the PWM mux.
> vid_pll is derived from the HDMI PLL and is reprogrammed on every
> display mode set, which silently changes the period and duty cycle of
> whatever PWM runs from it.

While I agree with the general principle of the change,
"The PWM driver asks the clock framework for the fastest input" is a
fairly inaccurate representation of what the PWM driver does and it gets
repeated. Please fix this.

You've disclose the usage AI, it is great. It would be even better if
you could summarize its output a little bit. This is very verbose
for a simple problem: vid_pll is dedicated to another usage in general
and should actually not be provided to PWM devices, eventhough the HW
allows it

>
> On boards that use a PWM regulator for the CPU supply this corrupts
> the CPU voltage: on an S905W2 board vddcpu read 699 mV at 1 GHz and
> the first cpufreq transition hung the SoC. Boards that feed the
> 32.768 kHz low power clock of an SDIO wifi chip from a PWM see the chip
> intermittently fail to enumerate ("Failed to initialize a
> non-removable card").
>
> Drop vid_pll from the PWM parents and keep the remaining inputs on
> their register values with a mux table. xtal, fclk_div4 and fclk_div3
> cover every PWM rate in use.
>
> Fixes: 57b55c76aaf1 ("clk: meson: S4: add support for Amlogic S4 SoC peri=
pheral clock controller")
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
> ---
>  drivers/clk/meson/s4-peripherals.c | 38 ++++++++++++++++++++----------
>  1 file changed, 26 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-pe=
ripherals.c
> index ba41fcd90588..329cd526749e 100644
> --- a/drivers/clk/meson/s4-peripherals.c
> +++ b/drivers/clk/meson/s4-peripherals.c
> @@ -2588,51 +2588,65 @@ static struct clk_regmap s4_spicc0_en =3D {
>  	},
>  };
>=20=20
> -/* PWM Clock */
> +/*
> + * PWM Clock
> + *
> + * vid_pll (mux input 1) is left out on purpose. The PWM driver asks for=
 the
> + * fastest clock it can get, which made every PWM pick vid_pll - and vid=
_pll
> + * is the HDMI PLL, reprogrammed on every display mode set. That silently
> + * changed the period and duty of whatever ran from it: the PWM CPU supp=
ly
> + * (a cpufreq voltage change then hung the SoC) and the 32.768kHz clock =
of an
> + * SDIO wifi chip (which then failed to enumerate).
> + */
> +static u32 s4_pwm_parents_table[] =3D { 0, 2, 3 };
> +
>  static const struct clk_parent_data s4_pwm_parents[] =3D {
>  	{ .fw_name =3D "xtal", },
> -	{ .hw =3D &s4_vid_pll.hw },
>  	{ .fw_name =3D "fclk_div4", },
>  	{ .fw_name =3D "fclk_div3", },
>  };
>=20=20
> -static S4_COMP_SEL(pwm_a, CLKCTRL_PWM_CLK_AB_CTRL, 9, 0x3, s4_pwm_parent=
s);
> +#define S4_PWM_SEL(_name, _reg, _shift) \
> +	MESON_COMP_SEL(s4_, _name, _reg, _shift, 0x3, s4_pwm_parents, \
> +		       s4_pwm_parents_table, 0, 0)
> +
> +static S4_PWM_SEL(pwm_a, CLKCTRL_PWM_CLK_AB_CTRL, 9);
>  static S4_COMP_DIV(pwm_a, CLKCTRL_PWM_CLK_AB_CTRL, 0, 8);
>  static S4_COMP_GATE(pwm_a, CLKCTRL_PWM_CLK_AB_CTRL, 8);
>=20=20
> -static S4_COMP_SEL(pwm_b, CLKCTRL_PWM_CLK_AB_CTRL, 25, 0x3, s4_pwm_paren=
ts);
> +static S4_PWM_SEL(pwm_b, CLKCTRL_PWM_CLK_AB_CTRL, 25);
>  static S4_COMP_DIV(pwm_b, CLKCTRL_PWM_CLK_AB_CTRL, 16, 8);
>  static S4_COMP_GATE(pwm_b, CLKCTRL_PWM_CLK_AB_CTRL, 24);
>=20=20
> -static S4_COMP_SEL(pwm_c, CLKCTRL_PWM_CLK_CD_CTRL, 9, 0x3, s4_pwm_parent=
s);
> +static S4_PWM_SEL(pwm_c, CLKCTRL_PWM_CLK_CD_CTRL, 9);
>  static S4_COMP_DIV(pwm_c, CLKCTRL_PWM_CLK_CD_CTRL, 0, 8);
>  static S4_COMP_GATE(pwm_c, CLKCTRL_PWM_CLK_CD_CTRL, 8);
>=20=20
> -static S4_COMP_SEL(pwm_d, CLKCTRL_PWM_CLK_CD_CTRL, 25, 0x3, s4_pwm_paren=
ts);
> +static S4_PWM_SEL(pwm_d, CLKCTRL_PWM_CLK_CD_CTRL, 25);
>  static S4_COMP_DIV(pwm_d, CLKCTRL_PWM_CLK_CD_CTRL, 16, 8);
>  static S4_COMP_GATE(pwm_d, CLKCTRL_PWM_CLK_CD_CTRL, 24);
>=20=20
> -static S4_COMP_SEL(pwm_e, CLKCTRL_PWM_CLK_EF_CTRL, 9, 0x3, s4_pwm_parent=
s);
> +static S4_PWM_SEL(pwm_e, CLKCTRL_PWM_CLK_EF_CTRL, 9);
>  static S4_COMP_DIV(pwm_e, CLKCTRL_PWM_CLK_EF_CTRL, 0, 8);
>  static S4_COMP_GATE(pwm_e, CLKCTRL_PWM_CLK_EF_CTRL, 8);
>=20=20
> -static S4_COMP_SEL(pwm_f, CLKCTRL_PWM_CLK_EF_CTRL, 25, 0x3, s4_pwm_paren=
ts);
> +static S4_PWM_SEL(pwm_f, CLKCTRL_PWM_CLK_EF_CTRL, 25);
>  static S4_COMP_DIV(pwm_f, CLKCTRL_PWM_CLK_EF_CTRL, 16, 8);
>  static S4_COMP_GATE(pwm_f, CLKCTRL_PWM_CLK_EF_CTRL, 24);
>=20=20
> -static S4_COMP_SEL(pwm_g, CLKCTRL_PWM_CLK_GH_CTRL, 9, 0x3, s4_pwm_parent=
s);
> +static S4_PWM_SEL(pwm_g, CLKCTRL_PWM_CLK_GH_CTRL, 9);
>  static S4_COMP_DIV(pwm_g, CLKCTRL_PWM_CLK_GH_CTRL, 0, 8);
>  static S4_COMP_GATE(pwm_g, CLKCTRL_PWM_CLK_GH_CTRL, 8);
>=20=20
> -static S4_COMP_SEL(pwm_h, CLKCTRL_PWM_CLK_GH_CTRL, 25, 0x3, s4_pwm_paren=
ts);
> +static S4_PWM_SEL(pwm_h, CLKCTRL_PWM_CLK_GH_CTRL, 25);
>  static S4_COMP_DIV(pwm_h, CLKCTRL_PWM_CLK_GH_CTRL, 16, 8);
>  static S4_COMP_GATE(pwm_h, CLKCTRL_PWM_CLK_GH_CTRL, 24);
>=20=20
> -static S4_COMP_SEL(pwm_i, CLKCTRL_PWM_CLK_IJ_CTRL, 9, 0x3, s4_pwm_parent=
s);
> +static S4_PWM_SEL(pwm_i, CLKCTRL_PWM_CLK_IJ_CTRL, 9);
>  static S4_COMP_DIV(pwm_i, CLKCTRL_PWM_CLK_IJ_CTRL, 0, 8);
>  static S4_COMP_GATE(pwm_i, CLKCTRL_PWM_CLK_IJ_CTRL, 8);
>=20=20
> -static S4_COMP_SEL(pwm_j, CLKCTRL_PWM_CLK_IJ_CTRL, 25, 0x3, s4_pwm_paren=
ts);
> +static S4_PWM_SEL(pwm_j, CLKCTRL_PWM_CLK_IJ_CTRL, 25);
>  static S4_COMP_DIV(pwm_j, CLKCTRL_PWM_CLK_IJ_CTRL, 16, 8);
>  static S4_COMP_GATE(pwm_j, CLKCTRL_PWM_CLK_IJ_CTRL, 24);
>=20=20
> --=20
> 2.56.0
>

--=20
Jerome
