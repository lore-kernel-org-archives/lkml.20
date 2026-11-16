Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794836191;
	b=0/CAbBOUpSZa80Zn2/1rUvwXlwijRe1BDt1I8EsXB6GOI0k9OchVqUJlWTeWRZNmINq6
	 NnGy+N9VIYJCW1b9NumM3o8uwObunMcQaoCzUquKO9x4c6OjtJF/ilaW8+i5hRRRigyB3
	 eLt+a1kI4AuwkM58Sktw/XFSitLSom3Rk9j5qU8tvnmrN1OM3ZCnsFuaPco2LA4xEP/Kc
	 jIRibIVxlJm5W7BE7ga7qCUvcGPkkU6EYLVRLwvcMQBwUjv/trOyyTlkF1tILihzIrH+H
	 R8899clHdmaO/ipWZSxc+yMHzaZF+OMiaicPl32OdLlnBBI1eIMUgDYFVT76SYImsig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836191;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=E1FmOO35ppM3Ivasl9eUa5xC86mN03xH8CsNCWcOq5s=;
	b=cXGker4+WhnwII4XvG/4+dcsmCjHrmBWOZlbDCfCXX73BI+DYVP4ABxs6VMHUOrLmiuH
	 nS973ylERecyLz6jP3Lu2V4Yk2ul+6ZgBuWYNc2I7FV+bkYYwWQ+8/Y2Uuxcb25h2fhaH
	 EHRSSE2vjsWV7vupUJNdhfThf9C3ZWKzs3UzgQy6968ya+2P8LVW150UZTlQxyUfOqA6s
	 uTdAZnY/yQxDspDlh1yrDVnX8aZWWzZRKEPnkF48FWG0PiJulJbo5crltKYRuhsB0b209
	 RB7VnN1eSVysw2kCIb/sLJEImqxgS4q6zPCORX9oQ3EYiYCM1W0OJXf2zkZnsUsyLow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=GpeEMUfT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C16F606A323;
	Mon, 16 Nov 2026 13:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C16F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=GpeEMUfT
Received: from ptx.office.stw.pengutronix.de (ptx.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::109])
	(Authenticated sender: relay-from-ptx.office.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 2B069201763;
	Mon, 16 Nov 2026 14:36:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794836188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E1FmOO35ppM3Ivasl9eUa5xC86mN03xH8CsNCWcOq5s=;
	b=GpeEMUfTT7TzqmpugiF+R85BIqQWH8ZbJ63W/bYZQfGNCAIf1s69LZbU/mPIen6t1u8DP6
	1/TnLyhKA8NLdbE9qak9QAeMs36oYnGM47ml4g1/KNxLvd7leDAhQrAGsKV8jjQ/Kbe224
	qacFadow5n+VENpqxfzg9OToEIne+APHQdUr68ltk84pYBYljPXMDzDMdlcrFCSVqiC9Jf
	uW+r/vy8j33SxnWiwOTHnH8X1IuouT2EP316ZmsNADOxf0ZrBjDBdsUCFPX95jb67UePqQ
	x1dU/jw4QuM6v08PyuL06ZBUypq6wQxSWqL8UeqyhlSvfqC7JX6SeJHzno0Uug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794836188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E1FmOO35ppM3Ivasl9eUa5xC86mN03xH8CsNCWcOq5s=;
	b=c6ve2O4CJkkevWbMfviz19pzREpTNZ+7mMFtZruVJ+qqV3a2diPtdcP4XGjZoNsvBb8TmS
	rimuAyDo1D67OfuVIZhBXD+MuDqvB3WfNfXkFzZOFERDjz3MHeUqNFJ+unGLqUHRqMHqPi
	jl93Ul7PpPfX0EpSWares9WQSobIUxPZDOJIpnpO3P5rDsl91WhPJTEQIuDMRO6NGTU/Dk
	KzLD8vZPx95at2aYFtNihu9TqkGMTF9JUy+qdB1yp4ORtYqhneSMFQWZpwaqoXVjv071CM
	3HuodWG0dDHU97YyJEVJoiIpzd16zspJ0goxqaT5ByGwDXMnpBCUUjjTvDTrow==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794836188; a=rsa-sha256;
	cv=none;
	b=HBu3jC5kkuOdBfokVVij0GJCdZyjPxmRPqziwqMK3yfm7XldHroohfLRIe/UUpTEFpReX4
	OZ7tspN62l14WSAeowcR5UWVgCKsooNY9rusngXX5ALzJNfRetfSGqLh5EJJQ3OiCTUJQO
	LiFuIWEejn6wzhkZMvmjPq0nCc++AZ9nTcERmLs9XOkePxjnp0ZJacHxE84ao6DHJOXAMc
	22Ti0/Jkjpfsz37spz7kQ4TZinN/it1DtgNeJu7aLNS297CMU01s+Eyg2B9ZxypZ8j8VS3
	a7AJ4NxxdkVHNnfPjwkoVz4OSmvqGJvOmXF1ETSlG6yCDYC0/gyhP73UKBgVJQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-ptx.office.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
Received: by ptx.office.stw.pengutronix.de (Postfix, from userid 1058)
	id 184C31BFABC; Mon, 16 Nov 2026 14:36:28 +0100 (CET)
Date: Mon, 16 Nov 2026 14:36:28 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH net-next v2 05/10] net: dsa: realtek: rtl8365mb: describe
 the ports of each chip
Message-ID: <avsG3JcrIQgzxUzN@pengutronix.de>
References: <20261112-rtl8365mb-dcb-ingress-v2-0-f8e6fbdf8c99@pengutronix.de>
 <20261112-rtl8365mb-dcb-ingress-v2-5-f8e6fbdf8c99@pengutronix.de>
 <avXUEaiSnKsO705y@analog.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <avXUEaiSnKsO705y@analog.com>

On Thu, Nov 12, 2026 at 04:08:47PM +0100, Alvin Šipraga wrote:
> On Thu, Nov 12, 2026 at 09:37:48AM +0100, Oleksij Rempel wrote:
> > Record which ports each chip has, report one more than its highest
> > port to DSA as the port count, and reject a devicetree port the chip
> > does not have. Lower the family maximum to 8 to match.
> >
> > Commit ca5ecd4246d4 ("net: dsa: realtek: rtl8365mb: correct the max
> > number of ports") raised the port count of all chips to 11, but no
> > supported chip has a port above 7.
> >
> > Since commit 51a4a22301b0 ("net: dsa: realtek: rtl8365mb: use dsa
> > helpers for port iteration"), setup also programs unused ports, so
> > every probe writes per-port registers of ports 8..10. Their learn-limit
> > writes go to 0x0A28..0x0A2A, above the learn-limit registers of ports
> > 0..7. We have not seen a visible effect from these writes.
>
> I'm not quite sure what the point of the patch is (sorry, maybe it's
> clear later in the series, but I didn't get that far yet). Was the setup
> of nonexistent ports clobbering some other registers?

Not that I could see. I saw no effect from the writes to ports 8..10.

The reason is the rest of the series. The QoS code in the later
patches handles ports 0..7 only. With 11 ports, DSA accepts a
devicetree port 8..10, and the QoS code would then write a register
that does not hold that port's field. With the per-chip port mask, the
driver no longer accepts a port the chip does not have. I reworded the
commit message to say this.

> Also in the blamed commit there was:
>
> -/* RTL8370MB and RTL8310SR, possibly suportable by this driver, have 10 ports */
> -#define RTL8365MB_MAX_NUM_PORTS                10
> +#define RTL8365MB_MAX_NUM_PORTS                11
>
> So maybe it needs bumping in the future if support is added for those
> chips. That's why I'm wondering if you saw something off?

Good point. v3 drops that.

> >  	dsa_switch_for_each_port(dp, ds) {
> > +		if (dsa_port_is_unused(dp))
> > +			continue;
>
> You can use dsa_switch_for_each_available_port() here.

Done in v3.

> > +
> > +		if (!(mb->chip_info->port_mask & BIT(dp->index))) {
> > +			dev_err(priv->dev, "port %d does not exist on %s\n",
> > +				dp->index, mb->chip_info->name);
> > +			ret = -EINVAL;
> > +			goto out_teardown_irq;
> > +		}
> > +

Thanks,
Oleksij
