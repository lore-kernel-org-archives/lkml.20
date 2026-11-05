Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887583;
	b=V7nC//yCwz4hfkvJfceGPlkhNnXrvoWeAZJW+jDJWo0/QJcuuVOID0GoZqjQXKjhq2Uj
	 W55QBhLjWFijASpbsNNKrdjK8nI17Gkvo8Sc9RGAhDgvQdUqenY0ijKSULiq9IuIcPKYq
	 XuRYw3zaOCZ7j+4h7ZdjWPx2EgCd0XVeGvW6JfOPg/QG6E0vfTGhSSz1fkbT/XfV0/ZbA
	 sOT4yOrGT07OpKugrYyIQVeBRhOTFoggJxAx9OysL752LaZZCgKNt0DxFdRJUJnPAkNJd
	 0orZp+5pWzExM9Yb5oPlN0jBE0AueyXeVeT0U9iyDs2H2k9ye7lp7QpwjO/q8K2ZRxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=UJCvvH2LVzLLKKiKlCpu1moOiFoxJyhCDFLz6en74v0=;
	b=sfTRXTc3ZNQp4kJUv5pq273iyINmKh8qiz+pHX1llImKjLlwut3+1e17YuJ9arluOiJz
	 tSDigF12KUuTh/inc6dj9sIOKG54QDsEMjEGjDS8VoQaqCDiMLwRsbcRp0y0R/uLpeUo9
	 dkSma3PyZvykJnbNaJowUoPzq+Te9aZfEmTZwyRLmaPlg8ZNp4v249W8jKW83uSSt2DQa
	 EZExFAZPLNQv9xRiG7AhQWSzG3boDd8ulBk/9VUpg9pkkeRgC4oekzeVnA/POM/0ntS/8
	 1qwUhHw24MxdMudVeAWg0oVKR7HLROMHFbM1oy1F9ViYjHEYdzTKXocUG4giZSfFIkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b="fOD/4HlG";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39AA606EE97
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C39AA606EE97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=fOD/4HlG
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so13857805e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1793887576; x=1794492376; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UJCvvH2LVzLLKKiKlCpu1moOiFoxJyhCDFLz6en74v0=;
        b=fOD/4HlGPz3p6ReV4CfAWtPZfVdjBTvS80aQFytCHG+6jvIftCSh6f33hBH74qDKMD
         ftCb2VZnl35ODwucMVWosLYjOo+gqKLVsfL4wRp+2ScgKMOo4xVnCgqfr8/3m8l+r9/B
         kC2ereSHyGhSuzM9TwXN52enpcQLEgnTub3nyrkWfpPQWnf+4jt6m9gFA7NjfG3ZXmlA
         NYhJmxex+zpzci+DTQCBHdH1/s5ASBB7wxqC0XO8zKYB6o4ySvfD4DC6PLVDtU69CbjI
         8siL3N2z7ShBjJzbX7zhb9ks3cqC79+P2To5mG7LESNlNW+mdoKOvw+RX/ntmvhwfP6S
         0Z4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887576; x=1794492376;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UJCvvH2LVzLLKKiKlCpu1moOiFoxJyhCDFLz6en74v0=;
        b=vFvnEmgqe086nGJhHwrtmYastrPQ1xmLisAE7slwA0rhzRpKzUJabpF/W8PUmHE5Us
         58NFOAh5wolEvPp0n1cAa8hg392cvqWSsfWsEuoXB4dx3c185AIBdzaFHoC1+gfEehBw
         ifv8sOgx/caY4PWbDX5FEs/tCgoHgvpfWw5ZL4KTydu1jE4VZQaTZVSgMudQYTsKM03R
         c6+UoO8sVGHZMo1+ju+fUz+yWFyAWhXIud8YhYpAHsRF+7qdZrWWPpZNxEeJ3tQNd/O4
         YoqTFOBW3tYzPhq0EmBFGSbo78Rx+dDe15zwQjM18mX0KL1y6urEywhAJr7xjk2H/n3a
         YU3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxZa1mxVwuIBU8QP0QPeLI1ZZrtLkBVPKCHXEIU+qtw5uuSbb0HrSccRnALV85ylhXxjhxX4ZYmgB5gjHk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8r8YlpM/UlqL5/34+JaUgYBNQ/Y7SuZOcrPZK5fuINywYxqs5S
	1otV30MqSxGI99xxXEaYF04RKrsh79l4cVPUeESY6IEdUSW7GohV30CrUfbJCnap5YY=
X-Gm-Gg: AYBFou1frrZ4ZK/XlmJclxSjQn6OxyXGdGt84HEK5iD7GmUYOsQ73h475WlxzNigGn1
	RzA6qKFwWeNALh8HUSeDBqkmCzsD5hsra3/KZHyKSPvjxszWcfZVItLdUvGQTgAbyQ2F0D/nkgw
	aSddqqJQPFdmq85ZCVfDlgEweHOT8bakCVfYWwnG4F2PGsIS9NVZNUI6QBBs4Wl3uCQa6plQkfS
	dsl5HcPYRFtPdkfFYPlq4M3nxIubAgYHRXQp/oIKzaQKz//Yx2jtMjna15If/8gO3vxZluhJVoK
	+E11VaSMeC4W17d66CeXCTUBU37fjy+i/NR2OrX/Q+mslYdRrVH0ZPWoRz05u8tLDyEywshOicY
	MaWUbw2OLrP//7tShRwAgfPtZfnjA/gRpBxLJSFjL0/gz+bbKOSFa0Ah+ickg2KEiDFGfyX+y7q
	b2Fgm6Lm/Oh/7TXQTACrZbILKLoXXA9pkjfsRXmJ/3Q1B+0tPJNGTgHAmVtU8k5FrPl6GwjukAP
	67aPrQIXzsP5JoSJJ+9lBIgYasnvNwxx5ZOVg3JPRLMnhlmrI5Dy8NrykO4JpFRtDtD6B3Kx35I
	9Bc6SpNlyxmrYWVefHP7sM4IE8RhLbVQ0zshSctK+AcOCnDavrwxcUsjcYEI9vyp5M97c4zEOD4
	7FVZ3BwvXD0g2wV7umv78FrjJtZeEh6hKJp7v4o42Xwr6bo3tZ+g22sZ8XNo8/T3SPubaZJ7Vbe
	djMXvCCbxneqh9
X-Received: by 2002:a05:600c:83c5:b0:4a2:148b:c88c with SMTP id 5b1f17b1804b1-4ac17191017mr399753615e9.8.1793887575774;
        Thu, 05 Nov 2026 06:06:15 -0800 (PST)
Received: from aspen.lan (aztw-33-b2-v4wan-169864-cust3247.vm26.cable.virginm.net. [92.239.204.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57203a98fsm59048765e9.4.2026.11.05.06.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:06:15 -0800 (PST)
Date: Thu, 5 Nov 2026 14:06:12 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, hkallweit1@gmail.com,
	linux@armlinux.org.uk, richardcochran@gmail.com,
	p.zabel@pengutronix.de, peppe.cavallaro@st.com,
	joabreu@synopsys.com, mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 5/5] net: stmmac: support the TC9564 SoC
Message-ID: <auyNVNo2I_Xunxi-@aspen.lan>
References: <20261019030129.1470307-1-elder@riscstar.com>
 <20261019030129.1470307-6-elder@riscstar.com>
 <3d0b17c6-3b94-4e36-b7bc-700211c83273@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d0b17c6-3b94-4e36-b7bc-700211c83273@bootlin.com>

Hi Maxime

Actually, this might be more for Alex to find when he works through the
review feedback but...


On Mon, Oct 19, 2026 at 09:52:58AM +0200, Maxime Chevallier wrote:
> > +static struct tc9564_mac_speed mac_speed[] = {
> > +	{ PHY_INTERFACE_MODE_2500BASEX,	SPEED_2500,  SP_SEL_2500BASEX },
> > +	{ PHY_INTERFACE_MODE_SGMII,	SPEED_1000,  SP_SEL_SGMII_1000M },
> > +	{ PHY_INTERFACE_MODE_SGMII,	SPEED_100,   SP_SEL_SGMII_100M },
> > +	{ PHY_INTERFACE_MODE_SGMII,	SPEED_10,    SP_SEL_SGMII_10M },
> > +};
> <snip>
> > +static int tc9564_mac_speed_select(struct tc9564_data *td,
> > +				   phy_interface_t interface, int speed)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(mac_speed); i++) {
> > +		if (mac_speed[i].phy_interface != interface)
> > +			continue;
> > +
> > +		if (speed == mac_speed[i].speed || speed == SPEED_UNKNOWN)
> > +			return mac_speed[i].sp_sel;
> > +	}
> > +	dev_err(td->dev, "%s/%d unsupported\n", phy_modes(interface), speed);
>
> Is that "mac_speed" lookup table actually needed ? maybe a simpler switch/case
> based on the speed alone would be enough, or do we really need to validate
> the phy_interface_t each time ?

Once we add 10G PHY support I don't think it can be based on link speed
alone (for 10G PHY we have to write the same value to SP_SEL regardless
of link speed).

However even when that happens we could still code it up using switch/case
and ifs.


Daniel.
