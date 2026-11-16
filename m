Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855359;
	b=2cQcdf1sAIU+FR96u5KAsJTr8jNGsk1vSpR6blHuRRZ/vm1DvUasck3W3JcppnBZ7bHQ
	 wSOo4zZTUjsQI3yLth2ARtPmJr5h/mZTPzDftj2rSPhOjLt4qGOriPNKZ9srK5siQnyRz
	 MtQlW32yqaOg58D4tFNE0BisYUBCVuserj5a5zvCdULI8ChZrhLR0USAmGNELb48ByAkq
	 PnNO4fJb5mTo9b0x2XJY9zxh4ZJJgS96pWOgi9nFqwYc3SngIhsX/4d+DRKj3iN+zXCvq
	 6K5Luh4j1pJDlbATlDqPzOxaJolMSRZXak0pQjbpjjpoD5ZANXhPoHxbXF9CR7CuSnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855359;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=WUJem+e3eK2NpuDYxzL5O4Iyg/vJeSPMVoOYesW4bbA=;
	b=33+cOyUzd0b50CD4AHIZA23cUdQx6fAHhCmAnfawdbCdUg7jK35+7EJHBC71mcpBsPY/
	 oCFp+SWn7M4vbYz/3qJ8Bv2Ju5WR2gQzoONVBAQtk4GB2Y1lo5FwtG3Hnw1mJHgUAnvar
	 3BxNK1kEIRGWnDE3vYzA8FUWgE/3+4tOxRTMJ8Os/2gK+iqHhxobRpuXmwnL0YjlpnPSg
	 dx3Fhx9xCXQyhcovO2NH1YKqBbGj6J1vDCcRgU+kwx033dLPzNIbFS02q4kcqzvS2TIQA
	 P8arSx+Wi9FVvqN8ZefJgfcXIABUwXHBH2ZqCEAe71HQNaZzheAtaslHKqqHgHqOBWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xku6ZbDx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D28606A323;
	Mon, 16 Nov 2026 18:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xku6ZbDx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7CD71F000CD;
	Mon, 16 Nov 2026 18:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794855359;
	bh=WUJem+e3eK2NpuDYxzL5O4Iyg/vJeSPMVoOYesW4bbA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Xku6ZbDxFBdsCzjSe4Vh1GI5UosudVFWxl+/jK3xMVr0Un7HWsdno3mcf6Rgb8Zdy
	 y13uFwadTUjey9LwC7QUIgnhiPwzo22xd+iyYGLuFCA5YuHJ+CwewvhhdxUG95qIUA
	 BWXIW787kEkASPwlO0MWJK6sT8S+pPZfjrxMCxBNKAfOef90bqSFShj97pQllMmiiC
	 R3yNmJXcMY4fIAFXBqwJAbsQYjXWPTEPNaOFot6uxg5e/ZhQa/xUHrtvyjGj85SD1t
	 CKd2cv0ONLH45i57ujZZ7ntEB4yT3g2zWnVCyG9itQE6rktZ6okzI/Md3QcwXsm6CR
	 CDh6XLRq6i6mA==
Subject: Re: [PATCH net-next v10 09/12] net: dsa: realtek: rtl8365mb: add
 family D SDS13 PCS support
From: netdev-bot+sashiko@kernel.org
To: namiltd@yahoo.com
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
Date: Mon, 16 Nov 2026 18:55:58 +0000
Message-ID: <179485535833.3136.12442631026953386374@kernel.org>
In-Reply-To: <1545f0c7-b413-4fc7-9563-baeb808720c9@yahoo.com>
References: <1545f0c7-b413-4fc7-9563-baeb808720c9@yahoo.com>
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

- [Low] rtl8365mb_pcs_config() now runs on family D too, but it still
  starts with the family C DW8051 hold sequence, applied on both…

--

net: dsa: realtek: rtl8365mb: add family D SDS13 PCS support

This commit extends the RTL8367S SGMII/HSGMII PCS code in rtl8365mb so
it also works on family D switches. On family D the CPU SerDes sits
behind the indexed SDS13 window, and the SDS_MISC layout is different.
The family D paths only become reachable once the RTL8367S-VB chip entry
is added later in the series.

> diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
> index 1c2a998695d6d..909319974120a 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_main.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_main.c

[ ... ]

> @@ -1475,25 +1524,44 @@ static int rtl8365mb_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,

[ ... ]

> +	sds_index = is_d ? RTL8365MB_D_SDS_EXT0_INDEX : 0;
> +
>  	/* Hold the embedded DW8051 microcontroller in reset and keep it
>  	 * disabled. The vendor driver loads firmware into it to manage the
>  	 * SerDes link, but the firmware only duplicates work that phylink

[Severity: Low]
Are the DW8051 bits known to have the same meaning on family D?

With this patch, rtl8365mb_pcs_config() also runs on family D. It still
starts with the family C DW8051 hold sequence, and that sequence has no
is_d check:

    ret = regmap_update_bits(priv->map, RTL8365MB_CHIP_RESET_REG,
                             RTL8365MB_CHIP_RESET_DW8051_MASK,
                             RTL8365MB_CHIP_RESET_DW8051_MASK);
    ...
    ret = regmap_update_bits(priv->map, RTL8365MB_MISC_CFG0_REG,
                             RTL8365MB_MISC_CFG0_DW8051_EN_MASK, 0);

This sets BIT(4) in CHIP_RESET (0x1322) and clears BIT(5) in MISC_CFG0
(0x130C). Both masks are defined only once, as family C registers, and
neither has a family D note.

Most of the rest of rtl8365mb_pcs_config() is now split by family: the
tuning table, the SDS index, the SDS_MISC layout, FIBER_CFG2 and
DIGITAL_INTERFACE_SELECT. The comment on RTL8365MB_BYPASS_LINE_RATE_REG
was also changed to say family D matches the vendor RTL8367D API. The
DW8051 bits get no such note.

If either bit means something else on family D, every pcs_config() call
for SerDes port 6 on the RTL8367S-VB would set an unknown bit in a reset
register and clear an unknown config bit.

There is some evidence that the layouts match. rtl8365mb_reset_chip()
already uses BIT(0) of 0x1322 on family D, and the series reports SGMII
and 2500base-x tested on two family D boards.

Could the vendor RTL8367D API be checked for these two bits? Then either
a comment like the one on the bypass register could be added, or the
sequence could be limited to family C.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/d9da17af-f49e-4878-a8dd-59a8919e6930%40yahoo.com
