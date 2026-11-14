Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794648518;
	b=ouKqR5KbzTDGMywUlOHMcVXwhBUHbTp3eQmyPpvARvMAVsgjVP+SwH4YtIat3R8o0k8T
	 RSNk7G6HP6g3QegTfezQMLIxgQu05msgqDyIPrUze9MQvkpMGyMZois4jx8TJAY2COxe1
	 Idhz49NKSWFQXyemudOOzjM/VBbY9YgQJKWlwVVyDjHqQv/I44FkH84ZMjIylwn+rcdKz
	 s8eaz0pJ/UC/ViNjhjEWudyrrlNIiOfP4VcWN7mpMiDf67c1VMXYnV6Un/x1X7oWuz4eM
	 6Ejli0Dwp8czrnrfkFtfd3Ala/J2cSNKTkCgmztOhYavduXT7PHj8lzxKXBDAeU58hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794648518;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=RENNZfG/pnKsnY0GRiJ1fVPMjdSy5AZ3i3jPYh5MFsM=;
	b=vlgGPrM4kclkQbFgYx/gP5ME/hNdoHiXePs5bwxwtVPYc4vCJlaeBTDWj/e+jOtCRhPr
	 BQyXcev0PZ/Nt2JwjKwGkZaBMte7qI7C/0EgjeHH8ExZ8vX+dpW5O1TLWJve9pc5ZOci2
	 8Sxa+VhPz/I1e+6CvPDPKE38us/OYmYESfiFe4lJE0M/BkYdDAgwvioH1Er3YWEZGnqSG
	 E65sM/Ri/FNYaUB0873eQtXfjdS9HekETN55vHduW4jJZXQU533cYgoYTyvOoBE4ZVVie
	 79NM+5z+Gw8Bfu/PGG8H8wJqMgrBlZvLSuwMTLcpHQcKb5xlxwVrjdgWMG15sr7ed8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mjs5Mjqf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9A4606A881;
	Sat, 14 Nov 2026 09:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mjs5Mjqf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95C581F000C5;
	Sat, 14 Nov 2026 09:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794648518;
	bh=RENNZfG/pnKsnY0GRiJ1fVPMjdSy5AZ3i3jPYh5MFsM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Mjs5MjqfMwPEACVbbaonWqHtO7Pu5x9zndh/9QS2TOB9IXl2s6YNI3OWhWCSq3UdB
	 Ml94QxTWMI2kByJdCpWUAcc04TkTJE9pJ/mzQ2BGTMAoKEopMpyOLqJlPt5PUyjgIM
	 TUazSslcoKKN15dFmQH8lwxMtT4Au7bAFLT9UiDKZGOfXtuJUGWs4Rlrx42+g4G1CS
	 wGwFTKjDJhuC84KxXpv+eLWebjamC9WXEUf/f75jQNzsOJgvhne4XlehCkWKdivHoM
	 HtI9vHhLuvnxRpjZQeh/syeu3eo+IXBRWNz1XActK6AiKcBCHiu1Pn9D+IZ2C9pybc
	 s5Oqv6REUQjTQ==
Subject: Re: [PATCH net-next v8 09/11] r8152: split r8157_hw_phy_cfg into
 RTL8157 and RTL8159 variants
From: netdev-bot+sashiko@kernel.org
To: hsu.chih.kai@realtek.com
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
 nic_swsd@realtek.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 edumazet@google.com, bjorn@mork.no, pabeni@redhat.com, andrew+netdev@lunn.ch,
 mail@birger-koblitz.de
Date: Sat, 14 Nov 2026 09:28:37 +0000
Message-ID: <179464851718.2199510.17123458125555803933@kernel.org>
In-Reply-To: <20261110032416.16968-10-nic_swsd@realtek.com>
References: <20261110032416.16968-10-nic_swsd@realtek.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] r8159_hw_phy_cfg() (drivers/net/usb/r8152.c,
  RTL_VER_17_QFN68/QFN100 case) adds two GPHY OCP writes that neither…
- [Low] This commit makes datasheet-driven corrections to already-
  supported hardware without a Fixes: tag or any user-visible symptom.

--

r8152: split r8157_hw_phy_cfg into RTL8157 and RTL8159 variants

This splits r8157_hw_phy_cfg() into r8157_hw_phy_cfg() for RTL8157
(RTL_VER_16) and a new r8159_hw_phy_cfg() for RTL8159
(RTL_VER_17_QFN68/QFN100). It also changes some RTL8159 EEE and clock
settings per the datasheet, moves the 0xd3c8 BIT(0) clear into the shared
prologue, and adds new RTL8159 PHY tuning parameters. Finally, it adds
sram2_set_bits()/sram2_clr_bits() helpers.

> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index 6adc198bc92ab..fad4473caf2a4 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c

[ ... ]

> @@ -8223,11 +8234,14 @@ static void r8157_hw_phy_cfg(struct r8152 *tp)
>  	ocp_word_clr_bits(tp, MCU_TYPE_PLA, PLA_PHY_PWR, PFM_PWM_SWITCH);
>  
>  	/* Advanced Power Saving parameter */
> -	ocp_reg_set_bits(tp, 0xa430, BIT(0) | BIT(1));
> +	ocp_reg_set_bits(tp, OCP_POWER_CFG, EN_10M_PLLOFF | EN_ALDPS_PLLOFF);
>  
>  	/* Disable ALDPS force mode */
>  	ocp_reg_clr_bits(tp, 0xa44a, BIT(2));
>  
> +	/* Disable bypass_turn_off_clk_in_aldps */
> +	ocp_byte_clr_bits(tp, MCU_TYPE_PLA, 0xd3c8, BIT(0));
> +

[Severity: Low]
With this change, r8157_hw_phy_cfg() also clears 0xd3c8 BIT(0) on RTL8157
(RTL_VER_16). Before this patch the clear only ran in the RTL_VER_17 case,
which was added by ad2a55b63b41 ("r8152: Add support for the RTL8159
chip"). The RTL8157 support in fd3c7d080df5 ("r8152: Add support for the
RTL8157 hardware") never cleared it.

The r8159_hw_phy_cfg() part of the patch also changes existing RTL8159
settings to follow the datasheet:

	ocp_reg_clr_bits(tp, OCP_DOWN_SPEED,
			 EN_EEE_100 | EN_EEE_1000 | EN_10M_CLKDIV);
	tp->ups_info._10m_ckdiv = false;
	...
	ocp_reg_clr_bits(tp, 0xa5ea, BIT(0) | BIT(1) | BIT(2));

and sram2 0x8ffe goes from 0xf450 to 0xf4ff.

If these correct hardware that is already supported, should the commit
carry Fixes: tags for fd3c7d080df5 and ad2a55b63b41, and describe the
symptom users would see? Other datasheet corrections in the same series
cite those commits, for example "r8152: fix RTL8156/RTL8156B/RTL8157/RTL8159
up and down settings", "r8152: add rtl8157_unload() for RTL8157 and
RTL8159", "r8152: add rtl8157_change_mtu() for RTL8157 and RTL8159" and
"r8152: fix flow control for RTL8156/RTL8156B/RTL8157/RTL8159".

[ ... ]

> @@ -8364,22 +8451,35 @@ static void r8157_hw_phy_cfg(struct r8152 *tp)
>  		sram_write_w0w1(tp, 0x81ae, 0xff00, 0x0f00);
>  		sram_write_w0w1(tp, 0x81b9, 0xff00, 0xb900);
>  		/* normal link TX filter */
> -		sram2_write_w0w1(tp, 0x83b0, 0x0e00, 0);
> -		sram2_write_w0w1(tp, 0x83c5, 0x0e00, 0);
> -		sram2_write_w0w1(tp, 0x83da, 0x0e00, 0);
> -		sram2_write_w0w1(tp, 0x83ef, 0x0e00, 0);
> +		sram2_clr_bits(tp, 0x83b0, 0x0e00);
> +		sram2_clr_bits(tp, 0x83c5, 0x0e00);
> +		sram2_clr_bits(tp, 0x83da, 0x0e00);
> +		sram2_clr_bits(tp, 0x83ef, 0x0e00);
> +
> +		ocp_reg_w0w1(tp, 0xbf38, 0x01f0, 0x0160);
> +		ocp_reg_w0w1(tp, 0xbf3a, 0x001f, 0x0014);
> +		/* shorten CLKS latency */
> +		ocp_reg_clr_bits(tp, 0xbf28, BIT(14) | BIT(13));
> +		ocp_reg_clr_bits(tp, 0xbf2c, BIT(15) | BIT(14));
> +		/* CMP_Timer on MP_Timer=333
> +		 * GPHY OCP 0xbf28 bit[0] = 0x1
> +		 * GPHY OCP 0xbf28 bit[6:1] = 0x3
> +		 * GPHY OCP 0xbf28 bit[12:7] = 0x3
> +		 */
> +		ocp_reg_w0w1(tp, 0xbf28, 0x1fff, 0x0187);
> +		ocp_reg_w0w1(tp, 0xbf2a, 0x3f, 0x03);

[Severity: Low]
What do the 0xbf38 and 0xbf3a writes configure in r8159_hw_phy_cfg()?

The commit message lists four new RTL8159 tuning items: shorten CLKS
latency, CMP_Timer on MP_Timer=333, spdchg_pga1_lpf_cap, and ENET PLL
jitter improvement. These two writes come before the "shorten CLKS latency"
comment, have no comment of their own, and don't match any item on that
list. None of these registers were used in r8152.c before this patch.

The CMP_Timer comment only describes bit fields of 0xbf28, but the block
also writes 0xbf2a[5:0] = 0x03.

Could 0xbf38/0xbf3a get a comment and a mention in the commit message?
Could the CMP_Timer comment also cover 0xbf2a?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110032416.16968-1-nic_swsd%40realtek.com
