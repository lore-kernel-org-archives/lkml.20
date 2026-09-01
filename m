Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115183016F1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788271163; cv=none; b=n+yidpeRN/OkrgzM4lruZ8mvuEKyYXas2r/1V7g/ra9lpdpKdt7fRDcLkxZuhdPxIWNHStmybycsSLrRc0nDkylIX7nruF+sPzDQnSUSABKokiPBGcVz4Os3eLG1RQJQ4P8za5AjHqdIoODmj/mmAQ1yKGGKc0lG6EQDXxI/VWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788271163; c=relaxed/simple;
	bh=+dQW5HMUoVkq1CBnPzF+MmC76PM+fL5474Pz/VoXE7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bDzVg65Ql6J0cm0xIbDWlcT3CpdLrGsnkQLmU/tHmTRWtwSDtOQ43TvAPpbR6yK5Cp62H8JWGoUB33wXMYhJnmeaadpTLkRkCYIZonttAMrLXvem1PZkoAlGOX2q9ITDdEShMrpbBsgIREV5hFrohI0yrnLqiovH4sHhKn37LXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dUJPq4ER; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LAr/3elC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dUJPq4ER";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LAr/3elC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788271161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RyeT2gPwgRHGbRT1UC00BJ26hUwN31fmD+oDhUutisA=;
	b=dUJPq4ERQjwXXoTKX8HjZrQWwmkGmDwewMWJKJHCwXkushzoss1CcZmZQlM5Jvd7n8tn3+
	IunoRGaKSVJCUOrrvXQJNJHlFHHUl4Ku4gGaYBd5xbT6RWG7ZeLIGbYy/ICaJi7VGBi7FW
	ur/dTctWkUKR+gnE1qIdN65MWM0erls=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-JAMRvRRfOLGC6wUQ-2CY2A-1; Tue, 01 Sept 2026 09:59:09 -0400
X-MC-Unique: JAMRvRRfOLGC6wUQ-2CY2A-1
X-Mimecast-MFC-AGG-ID: JAMRvRRfOLGC6wUQ-2CY2A_1788271148
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-495569acf8dso23585055e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788271148; x=1788875948; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RyeT2gPwgRHGbRT1UC00BJ26hUwN31fmD+oDhUutisA=;
        b=LAr/3elCnOAvH/kVYc+6e94S+p0vL2LMILz1mr1Gtjg5rAT3F8tKZ+YKHtNkdMZ6l+
         L/IrITJ4YSDII4EmOYCt5AKiNjdiM4JAyToMbdrhT6D0kGaNkgo9hjuvtKAhNI6noBuN
         b8kV4upsTAjIgAL9dImyKYcXV1h11b2TCAfaMJDdGXMnaM1Y8LiiDHw+96oEcYdGiOdC
         pDJZ4ca0PJGcP6glUxio/E2N7kZ/FyEgODC8Sb05yWeoDoulHNK+ErfSY0wXaIwZxMyH
         SlxvqSU0icKeQut4tfdUY5UKayIykBESEgxvjAFumvd4gIHhGR5JRyQOwQh6CK4mqbws
         dawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788271148; x=1788875948;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RyeT2gPwgRHGbRT1UC00BJ26hUwN31fmD+oDhUutisA=;
        b=ez/jjcIwgpoKkjIyRBPWGQgeHjqR//acB3hX0bA3DF6PW3C7eYeiMfl5Tkkvldr+gW
         chiNKIX84ULA4rcPV6B++2Rn38kJwejxL7jCWFeKTAhULkyaBalSNtVGDid/OUCqnclZ
         xAvRbL/4FVuurToMN7JN8AybcbgUfW5IBrrckxMfBvKRLTrOGsSizHSpV97jOxlaz8OG
         L9LFyCtRsY7poqqEwUTA2+9nahrH2t/b29vJ+tyLXTzqb444XEG8Kaxee1LUBYw1wtd1
         m4hpBMXhoRAdI8a78SNfCxKWo9Sxth6W9HEQI8LgdiQm1FhGVgzs0eDsN+aeiVwdeqJ/
         qG2g==
X-Forwarded-Encrypted: i=1; AHgh+RofS7xhaIM31AXl4PkvE0GxY2IfgHcY0U0/N8I2UdXURc71YSOlnCx48GkJCDYELeE3CLQ6vuezjWOijmg=@vger.kernel.org
X-Gm-Message-State: AFuF++mx6DzWaXSIMqbGtirgmktmqpOwdGQmjA9oIxt+1d80+QvmuXdN
	pZE9VyUO+H3Vqh5jPL3lROIzOnwXB2JTB9Y7Msh6kogcRZXOtQAqg7pjwrtz/mgkJ78IgOyesKx
	WTFw178wT5xj+b4jGEvMAp/nbFuIeDSmpaYXOS1UQFkjb5YuSVRtZuBCF0y53nqBnWg==
X-Gm-Gg: AR+sD13oAsNFtOUF2Yk5LpC9S1kzcqvmkE1CfLYtQfS1qPvm9tKX6IPI7Exmiu9KbmH
	Ds04W6HxJtCJwj3FQ5E9TICtL50Zj3lAM6tqJq4VRlUhSZVeYTxdJEs8/2zvHtCGeqhjyCdxBQw
	GQGXfDJFhXS5TYflnruRGjeaeypebjyBQQGZE9DjxcqJUdNjfRSljaqL/xZOdKxb0WKroijrBP9
	HrRzVE/zgINklHMckk5nsoH7uXUcqlBoeUjT+VeS96HswdwjC6owOfVkPqJFC/zAmfnuEzcEdkP
	F8i8t6Gq5cOY9SPBZY1YcV+nio53B04ygFNScxBKTy/rZQuR15Fn+XNYcwKEYtM11QFcPK+Vc6w
	sKm8PZjXl+IyxzjEGo/j/BM2AEWdt29wKi44MmOTE2j2mAJj5d6uzEbLA9YrxDOgbKRCtCL9uQw
	==
X-Received: by 2002:a05:600c:3542:b0:499:a5c8:c6f3 with SMTP id 5b1f17b1804b1-49cdc422c19mr158172425e9.3.1788271148249;
        Tue, 01 Sep 2026 06:59:08 -0700 (PDT)
X-Received: by 2002:a05:600c:3542:b0:499:a5c8:c6f3 with SMTP id 5b1f17b1804b1-49cdc422c19mr158171425e9.3.1788271147829;
        Tue, 01 Sep 2026 06:59:07 -0700 (PDT)
Received: from [192.168.188.218] (ip245-45-231-195.pool-bba.aruba.it. [195.231.45.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10153sm76476035e9.4.2026.09.01.06.59.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:59:07 -0700 (PDT)
Message-ID: <17e50070-46c9-46dd-8109-95007a4f681f@redhat.com>
Date: Tue, 1 Sep 2026 15:59:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/3] net: phy: motorcomm: Enable analog frontend
 on YT8531S
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>,
 Heiner Kallweit <hkallweit1@gmail.com>, Yao Zi <me@ziyao.cc>,
 Frank <Frank.Sae@motor-comm.com>
Cc: thomas.petazzoni@bootlin.com, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260831073747.361482-1-maxime.chevallier@bootlin.com>
 <20260831073747.361482-4-maxime.chevallier@bootlin.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260831073747.361482-4-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/31/26 9:37 AM, Maxime Chevallier wrote:
> The YT6801 PCIe NIC includes the dwmac-motorcomm IP for the MAC part, as
> well as a YT8531S PHY, configured in GMII mode.
> 
> It seems this PHY requires the Analog Front-end (AFE) DAC clock to be
> enabled for link to reliably establish, otherwise the link just doesn't
> come up.
> 
> Let's enable it at config_init().
> 
> This logic has been extracted from the vendor driver provided by
> Motorcomm.
> 
> It's really unclear if this is specific to the integrated version of
> that PHY, and how this potentially interacts with the fiber mode this
> PHY supports, so this configuration is only enabled when the interface
> is GMII, i.e. the PHY is integrated.
> 
> With this, the PHY reliably establishes link and the YT6801 PCIe card
> becomes fully functional.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  drivers/net/phy/motorcomm.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/phy/motorcomm.c b/drivers/net/phy/motorcomm.c
> index 36c229460a77..90a4f86f2758 100644
> --- a/drivers/net/phy/motorcomm.c
> +++ b/drivers/net/phy/motorcomm.c
> @@ -144,6 +144,11 @@
>  #define YT8521_CLOCK_GATING_REG			0xC
>  #define YT8521_CGR_RX_CLK_EN			BIT(12)
>  
> +/* Analog front-end control register 3 */
> +#define YT8531S_EXT_AFE_CTRL3			0x12
> +/* Analog front-end DAC clock enable */
> +#define YT8531S_AFE_CTRL3_CLKDAC_AON		BIT(13)
> +
>  #define YT8521_EXTREG_SLEEP_CONTROL1_REG	0x27
>  #define YT8521_ESC1R_SLEEP_SW			BIT(15)
>  #define YT8521_ESC1R_PLLON_SLP			BIT(14)
> @@ -1740,8 +1745,15 @@ static int yt8531s_config_init(struct phy_device *phydev)
>  	if (ret)
>  		goto err_restore_page;
>  
> -	if (phy_interface_is_rgmii(phydev))
> +	if (phy_interface_is_rgmii(phydev)) {
>  		ret = yt8531_set_ds(phydev);
> +		if (ret)
> +			goto err_restore_page;
> +	}
> +
> +	if (phydev->interface == PHY_INTERFACE_MODE_GMII)
> +		ret = ytphy_modify_ext(phydev, YT8531S_EXT_AFE_CTRL3,
> +				       0, YT8531S_AFE_CTRL3_CLKDAC_AON);

Sashiko suspects this will not survive a suspend/resume:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260831073747.361482-1-maxime.chevallier%40bootlin.com

/P

