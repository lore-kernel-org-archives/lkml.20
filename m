Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407E8377EA7;
	Wed, 30 Sep 2026 15:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790782026; cv=none; b=l13v2sSN50PA3emYNNcOCee84jVEWJIUAyANygE0KL5VrMFwcGmhuk66whpo+AK3GVgIZZb+ktJhwq4Nfm7FDlHM89t4RQaYVVu+LKwEu40L96PILZjvUpTcSMuim1tA/JhztnD29Cn1D/j096Njn+IYT6nnksPesAq7WYZnYRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790782026; c=relaxed/simple;
	bh=TdcPCkvQ8SkxsW5RLbugRcFtwUGemTHEIeENNWBRjbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQt+dnl+crLGY+dTifToZa6/C+3ADJcEDzkIyg8t7czE44sfUVNgTjxZmUMDUsvQLz+KrvcuXn2XgOPGJ7V2iw3LbUzPZqrYFc2fe8XASiXB96XCdvNLfqN6I+LhoOyZx0QqE38Kb4fzeR/bAk4dj1lu5P30aQu7XH7OjrFox4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YCigCSQ/; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YCigCSQ/"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6B3D24E410D7;
	Wed, 30 Sep 2026 15:26:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3B8C860749;
	Wed, 30 Sep 2026 15:26:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B2917103281E9;
	Wed, 30 Sep 2026 17:26:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790782013; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=WKdkz1BYvLrQk/8aMA/M0VzHCoi8lQfFBU94QLV8ZrY=;
	b=YCigCSQ/jqKVGvnheb3+DGcKvvYgGY5QvVbgPml2ZqdCs1fe0uap+hqMvnedjqX5RbmJo/
	0+wacTSCNn+VDU+AanMmOpoloFY86p0C8dQd8Y0XKYpmiIvRdm0V2L3jOlWOFgWJUl6ocx
	U9n4cEtex4QKLKEXj7ItBIF0T7hKcE6RynSirU5B/lclASfld4seim4lyBTYwguZ+SDnB6
	VLpiUKoHPhqDbqsCNkPK+/ogSn6TbkC/4pitlJe+zVLBV1AQTgv6Nfo1yzdrsDBd8zcT/Z
	ZYwSGoAaqEW+n/RnuMbDmHmK/kt7Lge14ZjxcZ+r+KzyCYnH0eQuWGI7PqkFgA==
Date: Wed, 30 Sep 2026 17:26:46 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: =?utf-8?B?5Zue6KaGOiBbUEFUQw==?= =?utf-8?Q?H?= 1/8] dt-bindings:
 i3c: Document the AST2700 I3C controller
Message-ID: <2026093015264653e04d9e@mail.local>
References: <20260901-b4-i3c-hci-ast2700-v1-0-19909e7cbd7e@aspeedtech.com>
 <20260901-b4-i3c-hci-ast2700-v1-1-19909e7cbd7e@aspeedtech.com>
 <20260907-imaginary-economic-oyster-57cdd6@quoll>
 <20260917154754dd1eefbe@mail.local>
 <SEZPR06MB7237179374D186C39384D9808B812@SEZPR06MB7237.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEZPR06MB7237179374D186C39384D9808B812@SEZPR06MB7237.apcprd06.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3

On 24/09/2026 05:39:47+0000, Billy Tsai wrote:
> > I guess we need to make them generic. Probably nobody needed them yet
> > and not all the controllers will have support anyway.
> > However, I would like to make sure we get enough commonality between
> > controllers that support setting the timings individually, can you
> > check?
> 
> I went through dw-i3c-master, i3c-master-cdns, and the AMD/Xilinx AXI
> I3C driver. Every property in this set has a direct counterpart in at
> least one of them:
> 
> - Open-drain and push-pull SCL high/low: dw-i3c-master has
>   SCL_I3C_OD_TIMING/SCL_I3C_PP_TIMING (high/low count each); the
>   AMD/Xilinx driver has separate SCL high/low and OD SCL high/low
>   registers.
> - SDA/data hold time: the AMD/Xilinx driver has its own hold-time
>   register computed as a percentage of the low period; cdns has a
>   data hold delay explicitly there to meet the MIPI I3C tHD_PP
>   minimum "regardless of PCB balancing", their words for the same
>   board-variance concern we have.
> - tCAS: dw-i3c-master's own comment says its MST_FREE register
>   represents tCAS in pure I3C mode; the AMD/Xilinx driver computes an
>   explicit tCAS minimum from the spec value.
> 
> None of the three expose any of this through a DT property today.
> They either derive it purely from the bus rate, or hardcode one fixed
> value per compatible (cdns's data hold delay is a flat 10ns baked
> into its per-SoC match data, the same default we picked
> independently). So there's no existing naming convention to be
> consistent with, but the underlying quantities are clearly common
> across implementations, not something specific to our controller.
> 

Thanks for the investigation, then let's have them in i3c.yaml.

> Thanks
> Billy

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
