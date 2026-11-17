Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919022;
	b=tYpAGSLAJ0TTCXDUp2M0q44ZycggIjn0KxweErJlo0FputPSBkJadXaCVQRGtqmqvWHW
	 RvUUUkxWhVoOHtLFAPrHaJutuGDg3bAeQm8Aj28fMANxmHGEwx5S/Ro23xrQsEvLksHfJ
	 fIki4wwSAHatNaSdxaGXtIkl461P5qN1R9SCfX43KpUkBoRtC5QwZLGgFm6FL73nHJL4o
	 4qQuBZrFbN9eamoelDiIYr8b2/yUMo2l8zgjmQfvtydiYJ0SM8uijVEbxWWzw323kEfdN
	 GXDrg4uGJ/cMKsoXorOhq7ZWB8FNg3crj5bzEnw1sEZUnyH9TW4TnaUi/8BCwETOsBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919022;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=rsl8lIUdxMSdZsgbl4gxPv/9K85NLxT9rxnZ+drG2RI=;
	b=dUzF1vkl/KOLi5skO7cTzB/3uryDwftcrH33OlhS+vDX8Cq4MsnQlhaHEfJhPIYy2HyY
	 m01UlJMg6tDJUjYfDEdiboZjlvpYdMQKuByy0JFeYIkuEEWlAjdlL6SfIQbO6doSV3y7f
	 6UF9gQLZOrYKpY17ial9BERM5s86RUf7xt/U8gCmWzMXq/xLzq6N8nOJhv0896PYalFwK
	 izgW/Kljj0WI12sYGsXZF7kAOLZk5GPxs8X3gi9hudxnL5EVFt6S7NAtu5L2CoEyv/C+X
	 UOGkmUVeo/zeXHcnKrEX9q2+H5TOLbO5etxBAotJi5IniFB7IJNR6f//KdCZ2robsTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=IhmZd2mt;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B6F606A323;
	Tue, 17 Nov 2026 12:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77B6F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=IhmZd2mt
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 604D0A03E1;
	Tue, 17 Nov 2026 13:36:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1794919019; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rsl8lIUdxMSdZsgbl4gxPv/9K85NLxT9rxnZ+drG2RI=;
	b=IhmZd2mtGVksC7yAOgoTfYA9YdqHyzf068Yz3i7VyyI7IsXSGcOIsBFg9SJG388dA4V8ZW
	g4gEiRSbzzNY3aP9f0jHz1NhHBuJfPu3XABsDPRvlmCG6OUJx36MxLbF1FPyKH68trYH2z
	RHPNjRfHCZBBnfwZBX1sF8kybkEapJ2RB7Krix/A37BOpLbDtthuuqR+TNB07D7vith7g/
	iJAFYu5cUOfsByoMEZyqvU1g0iL8UD0Ytbi0RgS92/kdquKPeWqiyrcR3LMQwPN63AMWnd
	uOT31WEiPM9zG+Wgt0WmYZ8LIp2RMAjHIZDeM7wfD6vV+tMaUGiiyKQ5qbeU+Q==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 17 Nov 2026 13:36:59 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org, Carlos Soto <carlos.soto@broadcom.com>, Justin
 Chen <justin.chen@broadcom.com>, Doug Berger <opendmb@gmail.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew
 Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, linux-kernel@vger.kernel.org, Mlody12 mlody12
 <kudzo51@gmail.com>
Subject: Re: [PATCH net-next v2 4/4] net: mdio: mdio-bcm-unimac: Add Clause 45
 support
In-Reply-To: <20261116213449.1682731-5-florian.fainelli@broadcom.com>
References: <20261116213449.1682731-1-florian.fainelli@broadcom.com>
 <20261116213449.1682731-5-florian.fainelli@broadcom.com>
Message-ID: <cefef6bd3411c56bdc872debae831450@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 16.11.2026 22:34, Florian Fainelli wrote:
> Add Clause 45 read/write support to the UniMAC MDIO bus controller 
> driver
> by implementing the read_c45/write_c45 bus callbacks. Each access 
> performs
> the two-step C45 sequence (ADDR cycle followed by a READ/WRITE cycle) 
> under
> the bus lock and switches MDIO_CFG between C22 and C45 mode as needed;
> MDIO_CFG is only written when the mode actually changes.
> 
> Also skip the BMSR workaround read in unimac_mdio_reset() for children
> compatible with "ethernet-phy-ieee802.3-c45", since such PHYs are not
> expected to respond to C22 accesses.
> 
> Note that providing read_c45/write_c45 also makes the MDIO core scan 
> for
> C45 PHYs at registration time, on addresses that are not masked and do 
> not
> already have a C22 device.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Co-developed-by: Carlos Soto <carlos.soto@broadcom.com>
> Signed-off-by: Carlos Soto <carlos.soto@broadcom.com>
> Co-developed-by: Justin Chen <justin.chen@broadcom.com>
> Signed-off-by: Justin Chen <justin.chen@broadcom.com>

> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai
