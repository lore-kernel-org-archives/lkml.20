Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794241775;
	b=NmEDludg+NY/Xm5zfdbH2wZkrWkqQZCuhoAh/WiYJFcuYx6+dEvoa8GPSJKYCL3moIDk
	 CxWTbO2UgIUu+ItUZLp6swJVvxiInWKyAS3ACh5we9lvaOrekPt10NEgJMVIOmhhBhrF/
	 i1rDXLIwSOVgfMOa/O796unnZ/2D/5luh+mZilxrYF5b561jxwPhOiah+tgtj/y0ts0i9
	 heNrQbm2sDBFFtAhUKHHFpnMWBgq/usx3cLQlGmcxUtol8Gl4Dhle+n0fauuKsEF4rIQW
	 Wr7hvx4wDFlT94CeJ6A4dK6f5pxXcYPUAf2B2gRRC6/2eeIAhXnGAn1JaxAOzrseWkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241775;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
	bh=EsTOtg1wHLEo0ZTusjGA4+BpHgdpiqnkxhcG+EozUhY=;
	b=EWE1I4viX9T2O1zw6dl3ujcmoPk+saINPs2XwDWpMhpDq/IMAw0jyocUNMnw1nTIOWJs
	 KdVNNENUITk99ywkhxA3qzVsEqwzB+Rk/h8WPDNtGnYjxotB28k/LasLszKQyM3Fh4qu3
	 VP8NIbcYkHPSFW2qyd6hKuajgNBcjV+buZPqkpe5hV7iu5EQH6eyeu7rB68GCkq8l2hOo
	 mOnKtKbQ/Z+Vg3yRdA6FFPNyqkCC3epExiqVKvLdfE9wNVlsz7g8AfhiodrzsQkIIi1NR
	 CmV3lOqMsldsOVXlNMoZTyq3UqS24a8fsQ4ELtmoL7tzPI+gPpl8JpdWtOpDakfdy1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=RBuPLtZq;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293F1606EE88;
	Mon,  9 Nov 2026 16:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 293F1606EE88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=RBuPLtZq
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5EF88C5845D;
	Mon,  9 Nov 2026 16:29:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 46E7760051;
	Mon,  9 Nov 2026 16:29:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 227C410328531;
	Mon,  9 Nov 2026 17:29:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794241769; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=EsTOtg1wHLEo0ZTusjGA4+BpHgdpiqnkxhcG+EozUhY=;
	b=RBuPLtZqrGZ04Eym/pFeRTwd2DLY3KznOpoqdIOi4bmj0gCgBXibiaQfcp6sv3S6QyBDut
	IiiwqzlfMxGQJ3YcFzwSh8BMBdVVRsIRgqsSfpwO0cIvBF9OcXiaZmR9B8mZKcCtw6N13/
	AQGNnLkKN7EnCQUKsT/LfZAvCUCwWtVpsadHLcatmEuhJ8TVtp7lLCgN1m3xjF9xiL6vwa
	HMAh6p0bpQbpVJRu0ggsgIIPPHbWNJEQZ6VCp91TeLVl/sbxkZSvjZ1cNZ11+a72h3h9kV
	6yTfWwM5jGTq0XStRQCtBvpRFJdZUCNAIFXqLD7rzyzHPL5FGkdNsu3eVhefnQ==
Date: Mon, 9 Nov 2026 17:29:19 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: E Shattow <e@freeshell.de>
Cc: Owen O'Hehir <oo.hehir@gmail.com>, linux-rtc@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	"ziv.xu" <ziv.xu@starfivetech.com>, Conor Dooley <conor@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v2 2/4] rtc: Add StarFive JH7110 RTC driver
Message-ID: <202611091629193b8f049c@mail.local>
References: <20261108212826.15890-1-oo.hehir@gmail.com>
 <20261108212826.15890-3-oo.hehir@gmail.com>
 <ff0906c3-478e-4ad6-ac30-1e0a7cc35a41@freeshell.de>
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
In-Reply-To: <ff0906c3-478e-4ad6-ac30-1e0a7cc35a41@freeshell.de>
X-Last-TLS-Session-Version: TLSv1.3

On 08/11/2026 19:12:58-0800, E Shattow wrote:
> > +static const struct of_device_id jh7110_rtc_of_match[] = {
> > +	{ .compatible = "starfive,jh7110-rtc" },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, jh7110_rtc_of_match);
> > +
> > +static struct platform_driver jh7110_rtc_driver = {
> > +	.driver = {
> > +		.name = "jh7110-rtc",
> > +		.of_match_table = jh7110_rtc_of_match,
> > +	},
> > +	.probe = jh7110_rtc_probe,
> > +};
> > +module_platform_driver(jh7110_rtc_driver);
> 
> I note that JH7100 does not mention RTC in its datasheet. Does JH7110
> RTC have any commonality with JHB100 and if so then would rtc-starfive
> be a more suitable name for the code filename and module?
> 

The filename has to be soc specific, else we will end up with
rtc-starfive.c, rtc-starfive2.c, etc... when the vendor choose to change
the IP.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
