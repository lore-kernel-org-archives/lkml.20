Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690643;
	b=ssmRTE5EU4GrHUC5JLryi/NyIAzqGXLD2KVB2gv5WXbyXr+YRHeycKBhErj2sldcZDJK
	 TuJSQkx42nLEswMUrstov7SQ34Ncs3K5PA/w0zDez0NqNl326eA8H5jj5Tjd1LYk9wTTl
	 4McREfDRXQ0OsbvRtAwhFlvuot3x7BwTx0r5LxpyyRsTrRML401dmyxMDM2HLsBu0LPN5
	 AWJ8XKge/GYdllt5CZDcMWLRhzcdN9F+D2SRmUPdZWAbXzWTPKz5GhyrTGte2IyHcwRej
	 7EUo2jXBP6Jc7lb4qSp7yGIkPFnUOuKj34kPZyWkjO1wK9OczlMI67wr/IX2y/YMjZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690643;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=90PpyRvqw50zWmq9+jh1atWjcGYKGRTrDoZ7I20u5a0=;
	b=2pRoO/MWB+HmGyraxzMnp/jZ2EHTMYf/u866YGc2X8gsLVSfIUTJEmDKuGdwQIjFcp4N
	 KouTs9p6u8lPPK9HU3/xPy/2LAA+QuCyYhdGo3PLurW3hBed0KuHQMteYKesK9Spa4SNR
	 OWG+rIHpEcfYQ3QouFKriwCOgHN3FcNJ5SBHEa9ZQ6g8yzua929rozcJE5iLs4/9svztZ
	 uT5tvH+6KTV9f9sG2Q8qEo3pS6HkonLR7RY94Nwt8oDpFWOWFbRnRjQ3v6Jf7aEG6h4lI
	 7VMrIqZVfjZ6c/A8CyV/RrW0+jMS9ABeNRFqxzwS2TiRO8K206FJ2STRjYzfqrvBLyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81CF606A328
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A81CF606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48df54150dfso31322f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:37:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690641; x=1793295441;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=90PpyRvqw50zWmq9+jh1atWjcGYKGRTrDoZ7I20u5a0=;
        b=Q3EJTi3BN88LIADU6PrEvs8khPnJ8nPPSeL3g4CIgnmCkOQNafJpYpJHCMpQ3zyiDn
         f7g6zSbZyQpvWWDztnsm1hjhCTah7D6nmQq5/OAEhT0A0k/OFh+jW9TzHG8pbgCFLrRt
         oFZE+4RzTX4hyGPCGlavCM8HyxaXZoXVCF2VfPtEyXqezEfftaf7gdT+twx9jw1g8YKe
         xx8OVPyQS5grKWihmKrF+bGI+2ZERk0sGcANy9ca78P53trd0cpGKDZrhTDcBGD95+OY
         aENj6U756xLSdlcTWITTA4yzDKVJ/ucXpKXFIgRvPIPY9bt/2urrtiU/GFyTnZfYG48x
         YbWg==
X-Forwarded-Encrypted: i=1; AKwUvBzbBM0Jz4yiKTQTTXKE9XUn/YzmunNlwhhpUD4yeFkW8Ls5ksMXPUeJBOc6zfNSi4+2uIdliwXcmuh22mA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMX5O7Vt8optZcGNtgB7h4lTDmCUxg5OfFW6cL4bFYr3t+6WKJ
	+MOanOGCws3potgPINlaoOnMBsRp6b+XLmYLAacLDzgPSZb/89WwdrZrcz83tgS5jBs=
X-Gm-Gg: AYBFou3Y0k+XCSBqxwuq7fLzUVSf0tZkMNtOsMTcZfaiR2lmySFGcsQcwQHhEg5qIYt
	no3HFVMSCodY9FVHz0DW5nEpLvajs3pwIbq6O0ghP1i07Sq3r6vpmOc9MCJpxGjpGgv9Y1OPM7h
	hhM3/UVzKACZq/wr2W9Lc9WJa+EvecAQYHEORBmfphX5ETbEszTiTletgXFB/QnyEAJXjWiDbo0
	8nC5bJzDMarXdu33ZNOS2bysmXwz2ClZTKgfUE29OOhpr9m6iAvFJuWw9QRCoywhY72Tj5oRciJ
	pmWKR+AgEMLGe+jtEDfw+E8wpOAg2Yif+81/Jk7tLdmbAFRkOqpLJTehTe8ugicfCvQ7T4wtY1f
	HPWPDT3tZgr/fsj6ABJLnwbRbR8ISeBouiUA3lncoH+6zYmTI7HgI46uIuvlKgg7M5xiLYGLZP/
	NLxzmoy+kmnTaNV3vm8TpWnUVam98PslWPPLIja3uaDmOBwH372sZhul0r8GQPcI2Jk608dHUdY
	VPDHBrbndbFQU+NgUKiQPH1fzxPGilqaDb5N6B8NVqbGiNgroXOb+APkI8VETJ1nD9D2ob8Wxht
	Mx1WlFKE39fcX2XRUwgLHtwaR9vluAmC
X-Received: by 2002:a05:6000:4e:b0:48d:f3a4:a6aa with SMTP id ffacd0b85a97d-48e264f2be7mr9021652f8f.35.1792690640831;
        Thu, 22 Oct 2026 10:37:20 -0700 (PDT)
Received: from [192.168.1.135] ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254f0bc2sm13391825f8f.1.2026.10.22.10.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:37:20 -0700 (PDT)
Message-ID: <00b94eed-fe1b-4cf3-a4ed-12813faacb86@linux.com>
Date: Thu, 22 Oct 2026 18:37:19 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] net: stmmac: dwmac-meson8b: apply the RGMII delays
 the T7 way
To: Andrew Lunn <andrew@lunn.ch>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261010105900.247342-1-tanure@linux.com>
 <20261010105900.247342-5-tanure@linux.com>
 <a1c0b76b-7b67-43e9-af15-3139f17d7fe7@lunn.ch>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <a1c0b76b-7b67-43e9-af15-3139f17d7fe7@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/2026 13:30, Andrew Lunn wrote:
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
>> @@ -82,6 +82,7 @@ struct meson8b_dwmac_data {
>>   	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
>>   	bool has_prg_eth1_rgmii_rx_delay;
>>   	bool has_pipeline_clk;
>> +	bool mac_applies_dt_delays;
> 
> Please can you invert this and call it broken delays.
> 
> We should make it clear that new devices should not set this, because
> it wrong, broken.

Moved to a function for T7. And the previous SoCs have their own 
function which gets a comment that new SoCs must not use it.

> 
>> +static int meson_dwmac_init_dt_delays(struct meson8b_dwmac *dwmac,
>> +				      struct plat_stmmacenet_data *plat_dat)
>> +{
>> +	struct device_node *np = dwmac->dev->of_node;
>> +	u32 tx_delay_ps = 0, rx_delay_ps = 0;
>> +	phy_interface_t phy_mode;
>> +	bool mac_tx, mac_rx;
>> +
>> +	mac_tx = !of_property_read_u32(np, "tx-internal-delay-ps", &tx_delay_ps);
>> +	mac_rx = !of_property_read_u32(np, "rx-internal-delay-ps", &rx_delay_ps);
>> +
>> +	/* one step is a quarter of the RGMII clock period, 2ns at 1Gbit/s */
>> +	if (tx_delay_ps > 6000 || tx_delay_ps % 2000)
>> +		return dev_err_probe(dwmac->dev, -EINVAL,
>> +				     "The RGMII TX delay must be 0, 2000, 4000 or 6000ps\n");
> 
> tx-internal-delay is not listed in amlogic,meson-dwmac.yaml. Please
> could you add it, and list the valid values.
Patch 2 of this series adds it to the T7 block with the valid values.
That changes in v4, see below.
> 
> Do you have access to the datasheet? Could you check these numbers are
> correct, because they are larger than typical. 4ns, and 6ns makes no
> sense, the RGMII standard only calls for 2ns.

Yes. The field is not a delay line. It selects the phase of the TX
clock sent to the PHY: 0, 1/4, 1/2 or 3/4 of the clock period. At
1Gbit/s that is 0, 2, 4 or 6ns, which is where the numbers come from
(the existing amlogic,tx-delay-ns property lists the same four). Only
1/4 is a usable RGMII delay; 1/2 is an inverted clock and 3/4 is a 2ns
lead. And since it is a fraction of the period, the 2ns is only true at
1Gbit/s, at 100Mbit/s the same setting is 10ns. I agree 4000 and 6000
make no sense.

> 
>> +
>> +	/* the RX delay line moves in 200ps steps and reaches 3000ps */
>> +	if (rx_delay_ps > 3000 || rx_delay_ps % 200)
>> +		return dev_err_probe(dwmac->dev, -EINVAL,
>> +				     "The RGMII RX delay range is 0..3000ps in 200ps steps\n");
> 
> Please could you listing these values in the binding.
> 
> Also, mark that amlogic,tx-delay-ns & amlogic,rx-delay-ns are not
> valid for this compatible.
The RX values are in patch 2 as well, the T7 shares the G12A list
(0..3000ps in 200ps steps); v4 drops the 0. The two vendor properties
are already rejected for the T7: they are only defined for the older
compatibles and the schema has unevaluatedProperties: false. v4 adds an
explicit "false" for both in the T7 block so that it is visible.
> 
>> +
>> +	phy_mode = phy_fix_phy_mode_for_mac_delays(dwmac->phy_mode, mac_tx,
>> +						   mac_rx);
> 
> This is not correct. This function assumes mac_tx and mac_rx are
> Boolean values, the MAC is applying the full 2ns delay. However, if
> rx-internal-delay-ps is only providing 200ps, that is not true.
> 
> I would prefer you keep to the usual way of doing things. Allow the
> MAC to apply small tuning delays, but have the PHY do the 2ns. So
> don't make any modification to phy-mode.
> 

OK. v4 does not touch phy-mode. rx-internal-delay-ps becomes the tuning
the MAC adds on top, 200..3000ps. On the TX side the T7 has nothing
small to offer, the only step is the 2ns phase, so v4 does not accept
tx-internal-delay-ps on the T7 at all, in the binding and in the
driver. The VIM4 then uses plain rgmii-id with the PHY adding both
delays. That also removes the wrong claim in patch 7 that the RTL8211F
TX delay does not work; the real cause was a bootloader value left in
the glue register, details in my reply to Martin on patch 7.
>>   static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
>>   {
>>   	u32 tx_dly_config, rx_adj_config, cfg_rxclk_dly, delay_config;
>> @@ -411,32 +455,34 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
>>   	dwmac->dev = &pdev->dev;
>>   	dwmac->phy_mode = plat_dat->phy_interface;
>>   
>> -	/* use 2ns as fallback since this value was previously hardcoded */
>> -	if (of_property_read_u32(pdev->dev.of_node, "amlogic,tx-delay-ns",
>> -				 &dwmac->tx_delay_ns))
>> -		dwmac->tx_delay_ns = 2;
>> -
>> -	/* RX delay defaults to 0ps since this is what many boards use */
>> -	if (of_property_read_u32(pdev->dev.of_node, "rx-internal-delay-ps",
>> -				 &dwmac->rx_delay_ps)) {
>> -		if (!of_property_read_u32(pdev->dev.of_node,
>> -					  "amlogic,rx-delay-ns",
>> -					  &dwmac->rx_delay_ps))
>> -			/* convert ns to ps */
>> -			dwmac->rx_delay_ps *= 1000;
>> -	}
>> -
>> -	if (dwmac->data->has_prg_eth1_rgmii_rx_delay) {
>> -		if (dwmac->rx_delay_ps > 3000 || dwmac->rx_delay_ps % 200) {
>> -			dev_err(dwmac->dev,
>> -				"The RGMII RX delay range is 0..3000ps in 200ps steps");
>> -			return -EINVAL;
>> +	if (!dwmac->data->mac_applies_dt_delays) {
> 
> I suggest you do this at a higher level. Either call this function if
> _broken_delay is set, or the other one.

Done through the callback. Probe makes one call, and the parsing of the
vendor properties moves into the older function.
> 
> 	Andrew

