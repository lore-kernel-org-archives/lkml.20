Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908133;
	b=jF4G70PlHBxk7RM0weNE/QIxuRBucAdzIsa3eXGAprbwQu3JvolAvuQYJuj3CBybopxa
	 6vSL/SCdjRx2rTGGQwPE2yY3LD1K54N+hBx4hJI9xU9IkBx5owO6FmisU4g4ZWjqgmIdX
	 p6lJhSaQy5RceiFrlDDzLMazXboMkowHypa7UzuRDc/8QMAvmQZad171zQGMqVV9CkcB/
	 bgCdj8jvYzXecKzbwQx1jiNuGlljujNBkGSd5+VqMo2MXbSwzH3E6DOKaM0Pkn0lNQftc
	 By6K4xSgS5aATwulmQi9CIilkTfbHarchxUBwQaqqdUzIMjDwFjwGb0oy5kPi2DutYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908133;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=WwhwaYFJNMtPhT56t3rNjNOo+MK4UinclZfxdqo22ag=;
	b=Nkup/T7Dk9lHdEMqXjruuunroew9A5946+lejmkG04JCYrjFKl1PeQYcKorkc5grFwGJ
	 NARBoqUAlgRiGhA5KvkT1Mvpc1F+XfgWxC0EtcESXDQs5SLWnpny4qFKP3shtbzsZ0bAp
	 csNFgVsc6502YEwE1vZbKmSDgBY3Q6yhIJncTC0lsH34wOglcPkFGotwHGSB5GBQ+kjis
	 o2PmXGkNqM/qFX9xTqebZWYeh0g3xwr+jdkgI+eGp0UQC8ShKIlmH+CTy223SzjSSTRXA
	 C7b3/7A/VFOa4CK6vWtH1Cgx/IjbMw7HeznnY8UVZFKGOi7J4Q1IS8SeFeV5xTsokkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vI11SneC;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908B4606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 908B4606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vI11SneC
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 93C50C4EDBC;
	Tue, 17 Nov 2026 09:35:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 410EE5FC81;
	Tue, 17 Nov 2026 09:35:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 18CF011BC0B8F;
	Tue, 17 Nov 2026 10:35:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908130; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=WwhwaYFJNMtPhT56t3rNjNOo+MK4UinclZfxdqo22ag=;
	b=vI11SneCI57vK3QInTMJGFmCHhAx0leLQ4YOKCpOSQITmvWd+ijDWcMsdWsjwe4olDvKXG
	lJp6vHcNgfsAYJxHFIKAjUyZJopqKXIdt9Yko+ilDnz//erJz52amc8o9TGyqanFZ0/rdE
	d1WeNt4Uog1Cwm5T8A7opkjYz+Tus1i0LdB7ADk2ztleDz9d7yG20dJAt2gukKMI8LpKNU
	V/+umM5GnXCckLLfBcPOxL3AwE6Xz8+81LvUTp65dgQhOavHiH90OqrA9+m3E6q6WAlj61
	vs6Gh+caEYLNzCDzVE5RMMdEGKLg5on2sgGZgCyR9NVksik888lc7sYrsO4CuA==
Message-ID: <7b9a4fe1-a885-4ace-bad0-b819ac8b11b4@bootlin.com>
Date: Tue, 17 Nov 2026 10:35:23 +0100
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
Subject: Re: [PATCH net-next] net: stmmac: dwmac-sun8i: Defer probe when the
 EPHY clock is not ready
To: netdev-bot+sashiko@kernel.org, aiyengar1990@gmail.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@kernel.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, clabbe.montjoie@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261113-b4-sun8i-emac-ephy-defer-v1-1-12a8591702fe@gmail.com>
 <179490321548.3136.12535368591168637116@kernel.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <179490321548.3136.12535368591168637116@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 11/17/26 09:13, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 · Medium: 0 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] The patch makes get_ephy_nodes() in
>   drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c return -EPROBE_DEFER…
> 
> --
> 
> net: stmmac: dwmac-sun8i: Defer probe when the EPHY clock is not ready
> 
> With this patch, get_ephy_nodes() returns -EPROBE_DEFER when of_clk_get()
> on the internal PHY node returns -EPROBE_DEFER. Before, it skipped the
> node and the probe ended with -ENODEV. Other clock errors still skip the
> node.
> 
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
>> index 2ece7ba9dd73b..8163e49fa7ad0 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
>> @@ -801,8 +801,13 @@ static int get_ephy_nodes(struct stmmac_priv *priv)
>>  		struct clk *ephy_clk;
>>  
>>  		ephy_clk = of_clk_get(iphynode, 0);
>> -		if (IS_ERR(ephy_clk))
>> +		if (IS_ERR(ephy_clk)) {
>> +			if (PTR_ERR(ephy_clk) == -EPROBE_DEFER) {
>> +				of_node_put(mdio_internal);
>> +				return -EPROBE_DEFER;
>> +			}
>>  			continue;
>> +		}
>>  		gmac->rst_ephy = of_reset_control_get_exclusive(iphynode, NULL);
>>  		if (IS_ERR(gmac->rst_ephy)) {
>>  			ret = PTR_ERR(gmac->rst_ephy);
> 
> [Severity: High]
> Does this deferral come too late in the probe?
I agree with the bot here, this defer happens after the netdev is registered,
which isn't great... And it's likely the PHY is on that mux'd bus, no ?

Was this tested ? Doesn't it really work to return a probedefer so late ?

This mdio mux logic should likely be reworked so that we register the mux in due
time (i.e during the mdio init sequence, may be by hooking into stmmac_mdio_setup
or something like that ?)

Maxime



