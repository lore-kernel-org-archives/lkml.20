Received: from mta1.migadu.com (out-38.mta1.migadu.com [95.215.58.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC07912C534
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790213138; cv=none; b=GDVBFu7ScyR3s4W6GRp37odo7cd+PHKWs0Go2suOg2vdstWy9GiaEbPOxEtJjqF/amjtFIeZI1fLtx6sNih000jo0W1HZ101hE60x7i6OPkK2lqvysV/pyN0gyPtxLjPID+Z7OUPs5TPOioc4RZNoDASIhZr+rQ0rewWJ7sGons=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790213138; c=relaxed/simple;
	bh=DeMHDh3uSjVrxgU96xYeFj/2pU456l46kIvtq+IJU28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qx86gFkjraol+9CZfu3RFFvEyeF7St4FMFA4vGDdSDTkqiWunVzpetog8H5kSc4V8+FeReWkR7DqmhlmHV+QuQkb4SA9GyQyjtDH/j8jRuylpNxU9SXD4WuFMf8E7FqsYw/Hj6xBBC1htuM2KOeltIbODFRnZyRWfqEFcl6lTF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dbgw8NUk; arc=none smtp.client-ip=95.215.58.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dbgw8NUk"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DeMHDh3uSjVrxgU96xYeFj/2pU456l46kIvtq+IJU28=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790213135; v=1; x=1790817935;
 b=dbgw8NUkAscS+FN3V5JCakI3PZGbtafKdWoCj382lOxe6Jz18aHVm1DNUPJby86D2AV/8SRS
 vayumL/e7csfewXpzm81T4PM26xe0BR/tDovvoyJWX5CI++hRxzxO/Or3dKMeV7kccVZhI4Ora3
 58Vnf5sCyXt9YAG1kEj4VOE4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f81bd399fb250b99;
	Thu, 24 Sep 2026 01:25:34 +0000
X-Mizu-Trace-ID: f81bd399fb250b99
X-Migadu-Flow: FLOW_OUT
Message-ID: <b49d86a5-299b-41a8-b65f-51f1aac2a1e4@linux.dev>
Date: Thu, 24 Sep 2026 09:25:27 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next,PATCH v1] enetc: Increase eMDIO MDC rate to 1.2 MHz
To: Marek Vasut <marex@nabladev.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Clark Wang <xiaoning.wang@nxp.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260924003132.580306-1-marex@nabladev.com>
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <20260924003132.580306-1-marex@nabladev.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 2026/9/24 8:30, Marek Vasut wrote:
> The current eMDIO MDC rate is 558 kHz on i.MX95 B0. This is very low,
> but also very compatible. However, for example NXP TJA1120 PHY needs
> at minimum 1 MHz MDC clock and 558 kHz does not work with that PHY.
>
> As a minimum change, increase the MDC clock to 1.2 MHz which should be
> equally very compatible, since even old PHYs like LAN8210Ai, KSZ8794,
> DP83822 support up to 2.5 MHz MDC clock frequency, and it covers the
> NXP TJA1120 as well. There is no known rationale for why the 558 kHz
> was picked when the eMDIO driver was added.
>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Andrew Lunn <andrew+netdev@lunn.ch>
> Cc: Clark Wang <xiaoning.wang@nxp.com>
> Cc: Claudiu Manoil <claudiu.manoil@nxp.com>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Vladimir Oltean <vladimir.oltean@nxp.com>
> Cc: Wei Fang <wei.fang@nxp.com>
> Cc: imx@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org
> Cc: netdev@vger.kernel.org
> ---
> NOTE: Alternatively, I can either add a DT property to configure the
>        clock rate, or model the clock as clock hw divider and then use
>        assigned-clock-rates DT property to configure the desired rate?

There's a documented DT property, at 
Documentation/devicetree/bindings/net/mdio.yaml :

   clock-frequency:
     description:
       Desired MDIO bus clock frequency in Hz. Values greater than IEEE 
802.3
       defined 2.5MHz should only be used when all devices on the bus 
support
       the given clock speed.

If the property is absent, you should configure the standard 2.5MHz rate 
by default, instead of 1.2MHz.

> ---
>   drivers/net/ethernet/freescale/enetc/enetc_mdio.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_mdio.c b/drivers/net/ethernet/freescale/enetc/enetc_mdio.c
> index 998aaa394e9c4..30ea91cea00e5 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_mdio.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_mdio.c
> @@ -24,7 +24,7 @@
>   
>   #define ENETC_EMDIO_CFG \
>   	(MDIO_CFG_HOLD(2) | \
> -	 MDIO_CFG_CLKDIV(258) | \
> +	 MDIO_CFG_CLKDIV(138) | \
>   	 MDIO_CFG_NEG)
>   
>   #define MDIO_CTL_DEV_ADDR(x)	((x) & 0x1f)
