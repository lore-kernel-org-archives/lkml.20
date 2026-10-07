Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0B45293E2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913890; cv=none; b=HsHuVlU2MJVjzuzwedjiRoqeXgiMU10taCfygWOzCouhnu/6AEDrK/MriBNnU5KXiY2XRbu6gjX2Y8kY0FCKpcYcME6Vmey/ap6BUxlJ0dnkLiXznwSqqG8lMxN1gXy5gFGX3Ani9a0nPfEEYCr494ekMtMmkNihUbv9JuzY+qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913890; c=relaxed/simple;
	bh=FQumjHQziz2usahP6TJbb1/goQQH3Jlf6gf1zLp4j3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gBn/JOSp+nGTnmXa6uVHBYKkq1DQ60hGkSmM0S7sFkThoIhZS9Uzr9YxvVbXAHPzHgzL8A9wM7/EgQqUbnjB3gNPEZ8s2Ya86kwnWSd8J3x78l9G/TmmvDSLtgUcbgL+3U1sxRi7PUwZ+VtZk5iQU/u9GFC0CmdVWZWZDhhnGlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=r3AQvZ5G; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="r3AQvZ5G"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5E5BF1A121A
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:51:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2B50060362
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:51:26 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id 93CE311D7188E; Tue, 13 Oct 2026 19:49:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791913885; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Hb/g3Z5gV3DKZ5gCF8Y43lf2JaAk4JXwyN0WCZ3HOUg=;
	b=r3AQvZ5Gc37Vb/sgzNIldU1qMxI897jlTKXtRDKh2kVfsjURTGLEEXK4fxPTA5frl7qvEY
	XenY8M50BTXRVpN9io3sv0qvnLNrIBpdBUNmKYbq3rUxfhBudy7jskPbDSMQZZv6rW+GjT
	chN9Qb3YBTCWRy+yg1JO2sJxUT/mkeX2lK3L14B09KNLvIfgRSaxkYKVxG9X61EG0Vz3Fu
	TbLL3B3fVk/VteJV2zU+JqMTU34Uc6p6XtZwJDev1vdlpMapbP1lef6+dGWfczNBbE10NL
	+eGFyTseAKrSZzVIertSb9zwU21CgJiFuNch8TjCeANjROPsDuK38pLuYJrnsw==
Authentication-Results: mail.galae.net;
	none
Message-ID: <517a0416-3c48-4b38-865c-5c0b7e5bd143@bootlin.com>
Date: Wed, 7 Oct 2026 11:35:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/7] net: stmmac: dwmac-meson8b: let the controller
 apply the RGMII delays
To: Lucas Tanure <tanure@linux.com>, xianwei.zhao@amlogic.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261007082627.63807-1-tanure@linux.com>
 <20261007082627.63807-2-tanure@linux.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261007082627.63807-2-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 93CE311D7188E
X-Spamd-Result: default: False [1.37 / 30.00];
	SUSPICIOUS_RECIPS(1.50)[];
	BAYES_HAM(-1.03)[81.08%];
	DATE_IN_PAST(1.00)[152];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[netdev,dt];
	RCVD_COUNT_ZERO(0.00)[0];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
	FREEMAIL_TO(0.00)[linux.com,amlogic.com,lunn.ch,davemloft.net,kernel.org,redhat.com,linaro.org,baylibre.com,googlemail.com,gmail.com,foss.st.com];
	BCC(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	URIBL_BLOCKED(0.00)[linux.com:email,linaro.org:email,localhost:rdns,localhost:helo,lunn.ch:email,st.com:email,davemloft.net:email,galae.net:url,infradead.org:email,baylibre.com:email,amlogic.com:email,bootlin.com:email,bootlin.com:mid,bootlin.com:url];
	TO_DN_SOME(0.00)[]

Hi Lucas,

On 10/7/26 10:26, Lucas Tanure wrote:
> RGMII needs a delay on each of its two clocks. A board can get it from
> the length of its tracks, from the PHY, or from the controller.
> "rgmii-id" in the device tree says the delay is added inside the chips
> but not which chip adds it, and the generic tx-internal-delay-ps and
> rx-internal-delay-ps properties name the controller.
> 
> This driver ignored those properties. In the "-id" modes it switched
> its own delays off and left the whole job to the PHY, so a board that
> asks the controller for one of them does not get it, and a board whose
> PHY cannot supply that delay has no usable link at all.
> 
> Boards not using those properties behave as before.
> 
> Assisted-by: LLM
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 46 ++++++++++++++++++-
>  1 file changed, 44 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> index e4d5c41294f4..d73dfd0ac167 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> @@ -92,6 +92,8 @@ struct meson8b_dwmac {
>  	struct clk			*rgmii_tx_clk;
>  	u32				tx_delay_ns;
>  	u32				rx_delay_ps;
> +	bool				mac_tx_delay;
> +	bool				mac_rx_delay;
>  	struct clk			*timing_adj_clk;
>  };
>  
> @@ -299,6 +301,22 @@ static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
>  		delay_config = rx_adj_config;
>  		break;
>  	case PHY_INTERFACE_MODE_RGMII_ID:
> +		/*
> +		 * "rgmii-id" only says the delays are internal, not which
> +		 * side applies them. The *-internal-delay-ps properties say
> +		 * it is this controller, so leave ours switched on.
> +		 */
> +		if (dwmac->mac_tx_delay || dwmac->mac_rx_delay) {
> +			delay_config = 0;
> +			if (dwmac->mac_tx_delay)
> +				delay_config |= tx_dly_config;
> +			if (dwmac->mac_rx_delay)
> +				delay_config |= rx_adj_config;
> +			else
> +				cfg_rxclk_dly = 0;
> +			break;
> +		}
> +		fallthrough;
>  	case PHY_INTERFACE_MODE_RMII:
>  		delay_config = 0;
>  		cfg_rxclk_dly = 0;
> @@ -384,6 +402,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
>  	struct plat_stmmacenet_data *plat_dat;
>  	struct stmmac_resources stmmac_res;
>  	struct meson8b_dwmac *dwmac;
> +	u32 tx_delay_ps;
>  	int ret;
>  
>  	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
> @@ -409,9 +428,13 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
>  	dwmac->dev = &pdev->dev;
>  	dwmac->phy_mode = plat_dat->phy_interface;
>  
> +	/* the generic property is preferred over the vendor one */
> +	if (!of_property_read_u32(pdev->dev.of_node, "tx-internal-delay-ps",
> +				  &tx_delay_ps))
> +		dwmac->tx_delay_ns = tx_delay_ps / 1000;
>  	/* use 2ns as fallback since this value was previously hardcoded */
> -	if (of_property_read_u32(pdev->dev.of_node, "amlogic,tx-delay-ns",
> -				 &dwmac->tx_delay_ns))
> +	else if (of_property_read_u32(pdev->dev.of_node, "amlogic,tx-delay-ns",
> +				      &dwmac->tx_delay_ns))
>  		dwmac->tx_delay_ns = 2;
>  
>  	/* RX delay defaults to 0ps since this is what many boards use */
> @@ -424,6 +447,25 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
>  			dwmac->rx_delay_ps *= 1000;
>  	}
>  
> +	/*
> +	 * Each property names one clock this controller delays itself. The
> +	 * PHY must be asked for whatever is left, or the two would delay the
> +	 * same clock and push it past the window.
> +	 */
> +	dwmac->mac_tx_delay = of_property_present(pdev->dev.of_node,
> +						  "tx-internal-delay-ps");
> +	dwmac->mac_rx_delay = of_property_present(pdev->dev.of_node,
> +						  "rx-internal-delay-ps");
> +
> +	if (dwmac->phy_mode == PHY_INTERFACE_MODE_RGMII_ID) {
> +		if (dwmac->mac_tx_delay && dwmac->mac_rx_delay)
> +			plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII;
> +		else if (dwmac->mac_tx_delay)
> +			plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII_RXID;
> +		else if (dwmac->mac_rx_delay)
> +			plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII_TXID;
> +	}

There's a helper for that :

phy_fix_phy_mode_for_mac_delays(), passed as parameters the mode, and wether the mac
inserts TX/RX delays, and it returns what you should hand out to the PHY :)

> +
>  	if (dwmac->data->has_prg_eth1_rgmii_rx_delay) {
>  		if (dwmac->rx_delay_ps > 3000 || dwmac->rx_delay_ps % 200) {
>  			dev_err(dwmac->dev,

This looks better, thanks for this :)

Maxime
text:
Return-Path: <netdev+bounces-342286-maxime.chevallier=bootlin.com@vger.kernel.org>
Delivered-To: maxime.chevallier@bootlin.com
Received: from mail.galae.net ([172.22.1.253])
	by 9e7fea892943 with LMTP
	id gCS8EoUVxmqzXwwAtaWaaQ
	(envelope-from <netdev+bounces-342286-maxime.chevallier=bootlin.com@vger.kernel.org>)
	for <maxime.chevallier@bootlin.com>; Wed, 07 Oct 2026 11:48:53 +0200
X-Original-To: maxime.chevallier@bootlin.com
Received: from smtpin-01.galae.net (smtpin-01.galae.net [51.159.2.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.galae.net (Postcow) with ESMTPS id D4A4611D500F1
	for <maxime.chevallier@bootlin.com>; Wed,  7 Oct 2026 11:48:52 +0200 (CEST)
Authentication-Results: mail.galae.net;
	dkim=pass header.d=bootlin.com header.s=dkim header.b="F6vLO8/J";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1");
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.galae.net: domain of "netdev+bounces-342286-maxime.chevallier=bootlin.com@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="netdev+bounces-342286-maxime.chevallier=bootlin.com@vger.kernel.org"
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com;
	s=dkim; t=1791366533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:
	 list-unsubscribe:list-subscribe:dkim-signature;
	bh=xQN3wQkVGd6JZIsxjTwgNRXi/qvLUOwJEvsQFsaSMuc=;
	b=Qi6pce3VtYmTMb1Ew1UlNg9GwFxewjzDvcBgA6A6zaktaGT7lCXj5jhqjpT1R2Ilsfwv0Y
	OQlrGc1i05r3RnxM3gyBfDwpqADD3N63DoWnitF8hQxKv6u0GGDZ//KgmKks/r0q7GbEA7
	ifC3xuxbXqeGr58Kj7CrAiYiajgSb8i6rJoFQbUespcEZTVGOP0Gt6c+TKC4ryI675+slf
	WFuTbc6/VkKMws+IKwUly81oufSb6RE2Blf4+ACVM278PGGoClgkZGyM2RcdhQMbZyH/b7
	PLyxbH4NKFms3laoRWYWKzSgGxn0DKtzZv95P48YQrlnaxohc/ctxZCevf8lCg==
ARC-Authentication-Results: i=2;
	mail.galae.net;
	dkim=pass header.d=bootlin.com header.s=dkim header.b="F6vLO8/J";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1");
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.galae.net: domain of "netdev+bounces-342286-maxime.chevallier=bootlin.com@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="netdev+bounces-342286-maxime.chevallier=bootlin.com@vger.kernel.org"
ARC-Seal: i=2; s=dkim; d=bootlin.com; t=1791366533; a=rsa-sha256; cv=pass;
	b=xWuimLhKlpaFMWkt2/Xr2UAD+5VCOeeOi/l924ahktq6WdC9XLcwTak4JbPDbW50jQTH+z
	0Qlk3OOn9lq+YsLYHad64g6Xo+wu3B1DBPXIKlU+XAf/fQZLXL50AL+Z5AxwxjaoHGYcYL
	zsUJFI+IpwrKk/dSCTj3m3eHQhb0Ney20tGchcBKXkX4MG4VEl2Fm5YDmrIqNvG0MFbSxp
	HWKP4p8ECn/udbScNnXAnB1S7fpNrnUkupTzW8DRFF0Z9igjpyi5VJm7tY+GY1fEVDUIy3
	J9BouEY42W5v4olMRLhFo7nIzcthtch429NIJbWXo/pxnIjHTvyWJEE9re960w==
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by smtpin-01.galae.net (Postfix) with ESMTPS id 493643429DF
	for <maxime.chevallier@bootlin.com>; Wed,  7 Oct 2026 09:48:52 +0000 (UTC)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26DD9456E0
	for <maxime.chevallier@bootlin.com>; Wed,  7 Oct 2026 09:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7EED47D45B;
	Wed,  7 Oct 2026 09:35:41 +0000 (UTC)
X-Original-To: netdev@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C02388369
	for <netdev@vger.kernel.org>; Wed,  7 Oct 2026 09:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365739; cv=none; b=h8PcMp5x/Fr/7hPhQ4dxsO1S7x33aa+qTZcdUnAZrixphIrgtiL9adJaCOF+gZfXzTLCkxGUPkaTpIwO/iaQQffJ7UnadVXqmxr6ajsPik4xueFznUW+XGwH01fCPO8mr6/Hia+F/KM6gZi2t/DXMECf3GtYg4nNZ3yrDXAeh2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365739; c=relaxed/simple;
	bh=HZ4Yai8hHKkjGNwF1DyF5ppHLfujuiudOKsOWhFEiMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TPOvKSIPlj2Eq5eRFZ06xfenPpaEgaSamE+rGTEJt2oDqBapSyOdsCype5fctrgscFPh5WyZlQMwRXTbjH1zX5OFEJHzLlwcSmsYXLBdIpEYpFzMfLemCzSMuPixg1cAJ5+hFswUgHr+HMlVCTfygXK5Y2Fitr9Eqpn7zgbDlcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=F6vLO8/J; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 10CCD1A1152;
	Wed,  7 Oct 2026 09:35:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D0BCE6074B;
	Wed,  7 Oct 2026 09:35:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9C9EC11D5006E;
	Wed,  7 Oct 2026 11:35:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791365718; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=xQN3wQkVGd6JZIsxjTwgNRXi/qvLUOwJEvsQFsaSMuc=;
	b=F6vLO8/Jrxzbe/6VTfHp1fxHL49UWZ7bUNvCBV6S3aWj9qw4/Y+NYCnR+wXXtMVF21vtN8
	6HO18hsdYrmSr3IcUe2mcYmZiNvV8UMqDzr+mA6xQj+34muF/6X8kXoalbJzvztH26FNBa
	K5+OZbd3o0t/hlIz1fWptevr9i2LwGhB7MyPt4CWYzBcKhrRfHzLvkEgXBp/jTbEPTQObp
	7oAGJRThN3DBQLRGYmhO2A1fjO10mSyM258NnQc7qDy09Vmq/uYJdtwgPHdNMHIZeMHZRC
	JINJJrljNLVaiKtvTHsTbReOHINo7BhmDfAKbGYWXUNz9HNrGtFmjQExvdZfCQ==
Message-ID: <517a0416-3c48-4b38-865c-5c0b7e5bd143@bootlin.com>
Date: Wed, 7 Oct 2026 11:35:11 +0200
Precedence: bulk
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/7] net: stmmac: dwmac-meson8b: let the controller
 apply the RGMII delays
To: Lucas Tanure <tanure@linux.com>, xianwei.zhao@amlogic.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261007082627.63807-1-tanure@linux.com>
 <20261007082627.63807-2-tanure@linux.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261007082627.63807-2-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-3.17 / 30.00];
	SUSPICIOUS_RECIPS(1.50)[];
	IP_REPUTATION_HAM(-1.41)[asn: 63949(-0.40), country: SG(-0.01), ip: 172.234.253.10(-1.00)];
	BAYES_HAM(-1.09)[81.68%];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MX_GOOD(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	URIBL_BLOCKED(0.00)[bootlin.com:mid,bootlin.com:dkim,linux.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RCPT_MAILCOW_DOMAIN(0.00)[bootlin.com];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux.com,amlogic.com,lunn.ch,davemloft.net,kernel.org,redhat.com,linaro.org,baylibre.com,googlemail.com,gmail.com,foss.st.com];
	MIME_TRACE(0.00)[0:+];
	BCC(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-342286-maxime.chevallier=bootlin.com];
	RBL_SENDERSCORE_REPUT_BLOCKED(0.00)[172.234.253.10:from];
	DKIM_TRACE(0.00)[bootlin.com:+];
	DNSWL_BLOCKED(0.00)[185.246.84.56:received,100.90.174.1:received,172.234.253.10:from,212.83.139.233:received,212.83.136.155:received];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maxime.chevallier@bootlin.com,netdev@vger.kernel.org];
	ARC_SIGNED(0.00)[bootlin.com:s=dkim:i=2];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[netdev,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[bootlin.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	EXTERNAL_RELAY_AUTHENTICATED(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D4A4611D500F1

Hi Lucas,

On 10/7/26 10:26, Lucas Tanure wrote:
> RGMII needs a delay on each of its two clocks. A board can get it from
> the length of its tracks, from the PHY, or from the controller.
> "rgmii-id" in the device tree says the delay is added inside the chips
> but not which chip adds it, and the generic tx-internal-delay-ps and
> rx-internal-delay-ps properties name the controller.
> 
> This driver ignored those properties. In the "-id" modes it switched
> its own delays off and left the whole job to the PHY, so a board that
> asks the controller for one of them does not get it, and a board whose
> PHY cannot supply that delay has no usable link at all.
> 
> Boards not using those properties behave as before.
> 
> Assisted-by: LLM
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 46 ++++++++++++++++++-
>  1 file changed, 44 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> index e4d5c41294f4..d73dfd0ac167 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> @@ -92,6 +92,8 @@ struct meson8b_dwmac {
>  	struct clk			*rgmii_tx_clk;
>  	u32				tx_delay_ns;
>  	u32				rx_delay_ps;
> +	bool				mac_tx_delay;
> +	bool				mac_rx_delay;
>  	struct clk			*timing_adj_clk;
>  };
>  
> @@ -299,6 +301,22 @@ static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
>  		delay_config = rx_adj_config;
>  		break;
>  	case PHY_INTERFACE_MODE_RGMII_ID:
> +		/*
> +		 * "rgmii-id" only says the delays are internal, not which
> +		 * side applies them. The *-internal-delay-ps properties say
> +		 * it is this controller, so leave ours switched on.
> +		 */
> +		if (dwmac->mac_tx_delay || dwmac->mac_rx_delay) {
> +			delay_config = 0;
> +			if (dwmac->mac_tx_delay)
> +				delay_config |= tx_dly_config;
> +			if (dwmac->mac_rx_delay)
> +				delay_config |= rx_adj_config;
> +			else
> +				cfg_rxclk_dly = 0;
> +			break;
> +		}
> +		fallthrough;
>  	case PHY_INTERFACE_MODE_RMII:
>  		delay_config = 0;
>  		cfg_rxclk_dly = 0;
> @@ -384,6 +402,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
>  	struct plat_stmmacenet_data *plat_dat;
>  	struct stmmac_resources stmmac_res;
>  	struct meson8b_dwmac *dwmac;
> +	u32 tx_delay_ps;
>  	int ret;
>  
>  	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
> @@ -409,9 +428,13 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
>  	dwmac->dev = &pdev->dev;
>  	dwmac->phy_mode = plat_dat->phy_interface;
>  
> +	/* the generic property is preferred over the vendor one */
> +	if (!of_property_read_u32(pdev->dev.of_node, "tx-internal-delay-ps",
> +				  &tx_delay_ps))
> +		dwmac->tx_delay_ns = tx_delay_ps / 1000;
>  	/* use 2ns as fallback since this value was previously hardcoded */
> -	if (of_property_read_u32(pdev->dev.of_node, "amlogic,tx-delay-ns",
> -				 &dwmac->tx_delay_ns))
> +	else if (of_property_read_u32(pdev->dev.of_node, "amlogic,tx-delay-ns",
> +				      &dwmac->tx_delay_ns))
>  		dwmac->tx_delay_ns = 2;
>  
>  	/* RX delay defaults to 0ps since this is what many boards use */
> @@ -424,6 +447,25 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
>  			dwmac->rx_delay_ps *= 1000;
>  	}
>  
> +	/*
> +	 * Each property names one clock this controller delays itself. The
> +	 * PHY must be asked for whatever is left, or the two would delay the
> +	 * same clock and push it past the window.
> +	 */
> +	dwmac->mac_tx_delay = of_property_present(pdev->dev.of_node,
> +						  "tx-internal-delay-ps");
> +	dwmac->mac_rx_delay = of_property_present(pdev->dev.of_node,
> +						  "rx-internal-delay-ps");
> +
> +	if (dwmac->phy_mode == PHY_INTERFACE_MODE_RGMII_ID) {
> +		if (dwmac->mac_tx_delay && dwmac->mac_rx_delay)
> +			plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII;
> +		else if (dwmac->mac_tx_delay)
> +			plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII_RXID;
> +		else if (dwmac->mac_rx_delay)
> +			plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII_TXID;
> +	}

There's a helper for that :

phy_fix_phy_mode_for_mac_delays(), passed as parameters the mode, and wether the mac
inserts TX/RX delays, and it returns what you should hand out to the PHY :)

> +
>  	if (dwmac->data->has_prg_eth1_rgmii_rx_delay) {
>  		if (dwmac->rx_delay_ps > 3000 || dwmac->rx_delay_ps % 200) {
>  			dev_err(dwmac->dev,

This looks better, thanks for this :)

Maxime

