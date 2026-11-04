Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793791965;
	b=trkhOI7dKZ3yS2+fA2qvyyn+24kpKruQy0rWBDgh04dgGajK89gfpn3bZTQbaRh5xFVN
	 6uLqym9CKb0ULxRmS+WicV6QKWl5zvTRaW7r6jNLDcAs/WJnEh52U+GUpZEyG4EypoFlR
	 AifkHBrutDXf80s3Z7lCK23I4WWHQLDBG4NbycTMPHEXU/cL7RQCJ7hjf6fRvI1ybhe7t
	 rT8wo/UnCUGqsODfvXrtM/dloyAbtN+cekdxS3X6wVtuKYlDpnldYLMu9Vxf40GFm1jn9
	 Q0dYo7QMFeGAmaUa0NvxCaivj/kVpcOiF0kr0G9wDX7ScNPjf7NDSGBveKGsO1XO3FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791965;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=nSAdp7d2w4x8lFKtRcJRBiPEu1Q6p424n1DTy1d1p1c=;
	b=y4PJorliI+d5XEhGCiXRGH8sy29oUQY3kiG8MGvxGw128nAPj4KHpe0fkTlvPIVaTTgv
	 ZhxGCFfbLwUwODOU22W4so9jPjkDuBxOc5Bqz29Y6HyqQLpD0Iq6GJkfa+T4OroeT97Jy
	 4Yyi3HYkRc3zA2CKGh8CC4kOt9rQqEa27eGacmfQpS1WGWflTvxIAZ2rBz2QOUCJjCz7e
	 5VI64NvpsygRHFeodQkkOTGaA9kS6T+w/U3F+AOZ0M0i41/0axU4UtYswycTItgIYj8Nx
	 F1zAoHQ1oo/bJsBqissjgaL5G3djwObPtYTYqFej67+O7dvZmOspABZm0sPimXQHZ3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=MvHjrEne;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A96D606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A96D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=MvHjrEne
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 41988C8F46F;
	Wed,  4 Nov 2026 11:33:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 35DFE60770;
	Wed,  4 Nov 2026 11:32:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B1DD210329171;
	Wed,  4 Nov 2026 12:32:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793791961; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=nSAdp7d2w4x8lFKtRcJRBiPEu1Q6p424n1DTy1d1p1c=;
	b=MvHjrEneFWYCZlFWinNnQWxc2Ej/64pyntWK44iPlXCjj6rUOBf1i/rrTeCrUf9vIy9kB+
	gK7TMl0m2lYTCKMseG9zh4e3+De0Mo0m7eRyZ9zB2an3rcmntu6mZuiAIvAVLZIZuaaZR9
	OvHVrMcrONF5rZozO2M5hxT/L0SCnOMf9TnOfYy3uXvEQmPQAVD838DYJiL7uImpaUALvq
	gQ8f7OWL1NoHXASD9I89dyQPYM1N4qlD9j1o4hZbpfiOe69MGDJ9RgYuPE9AIS9plpEmfR
	mHoB5pFxaujF4YWP7ZsKG+uR/S4HPqSGWrD1fTzVnA/X8kGxi2nnStBa0oOzEg==
Message-ID: <5e00fd7f-40f9-4041-8dfa-fff222b57b92@bootlin.com>
Date: Wed, 4 Nov 2026 12:32:34 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH net-next 3/4] net: pse-pd: realtek-pse-mcu: configure
 global power budget
To: Jonas Jelonek <jonas@jonasjelonek.de>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Sander Vanheule <sander@svanheule.net>,
 Russell Senior <russell@personaltelco.net>
References: <20261103220312.860629-1-jonas@jonasjelonek.de>
 <20261103220312.860629-4-jonas@jonasjelonek.de>
From: Kory Maincent <kory.maincent@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261103220312.860629-4-jonas@jonasjelonek.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/3/26 23:03, Jonas Jelonek wrote:
> Use the optional VMAIN regulator power budget to configure the MCU's
> aggregate PoE power limit during probe. Quantize the available budget to
> the protocol's 100 mW units and reserve exactly that amount through the
> regulator core.
> 
> The regulator budget represents the usable PoE allowance. Program zero
> reserved power so the previous firmware guard band does not further reduce
> that allowance.
> 
> Require a finite budget of at least one protocol unit when vmain-supply is
> provided. Program the budget before selecting dynamic power management and
> ungating the ports, so enforcement starts with the regulator-derived limit.
> 
> Enable VMAIN before hardware initialization and register one managed cleanup
> action to free any reserved budget and release the enable reference on probe
> failure and driver removal. Record each successful reservation immediately
> so subsequent initialization failures are covered by this action.
> 
> Read the current budget index before programming the MCU. Retain the
> programmed MCU limit on probe failure and driver removal, as reducing that
> limit to zero would interrupt ongoing power delivery.
> 
> Boards without vmain-supply retain their existing firmware-managed
> budget.
> 
> Signed-off-by: Jonas Jelonek <jonas@jonasjelonek.de>
> ---

...

>   
> +static void rtpse_mcu_cleanup_vmain(void *data)
> +{
> +	struct rtpse_mcu_ctrl *pse = data;
> +
> +	if (pse->requested_budget_mW)
> +		regulator_free_power_budget(pse->vmain, pse->requested_budget_mW);
> +	regulator_disable(pse->vmain);
> +}

Following patch 4 logic, you might not want to disable the PSE 
controller power supply, this will lead to a power off of all your PIs.
I think you should still free the power budget, to not allocate it twice 
if the module is loaded again.

Else is ok to me.

-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

