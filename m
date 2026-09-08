Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003C5434982
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 19:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788895363; cv=none; b=nHs2aSyeI0FCxgUTHUIELtpxz/XLa5JQl9PQNEIkCcLSxN1j5qVzB11/AockMFAzOIlSP5TzmcSSvdxbN4FW6MNtsF52kPmm9dJ4VC1jUDEn9Ue/mHawG3ABlT+uFHvDzh/gobwUhbRgb+mINzh2fsqIW91SaCh5kNdDep8Wwcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788895363; c=relaxed/simple;
	bh=BL1RUYoOl+2DCnnljwHrTpWKc1vt3ozShPXUSpVHg8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ua72lHYjC8GjAEnrPTc9EjEKlTozlWxhsTs1C3rwXU6wYK5vZCHi+fIJpxwkXW0o9UsuXXXBJxDafBMHn+RBZ3A0PTQzQyIHTgvc4+iV2tA0LQFwSxKawPPnH9tzC2L0wKL/upQrCHlXqxNzWMDhgggmAbmLLuk9c/KGBQZU7zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IldMupf/; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IldMupf/"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4957eefd361so39548305e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 12:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788895358; x=1789500158; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GVs4+8gm56Wnu6exUObCNgkOQEYDE8t6OW3Oqkq6qd8=;
        b=IldMupf/CXO1fJhcChwVffZ26pAdYEuJJo7n3NchFgpe6wbStMGfI4utvCihSq3+Mx
         QfakSVaL/MJcsyxLgiVpLhVZFiyd8ScB3t8IUALrvbnZWyWN17avGp9xQ9S7P4++LXdU
         LUlfBZMoh7BO7j3i9dt1eIczOoUyh6xGljMyldbvy7aZbl9McjsggHDOzBBQdaTDXM7h
         T05dJ6nI49n7G0r3JT59zHl54FDUVXNFF31hTE4azXp5dODZo1yxFt83JcwMmjJUyP59
         wMfR0iaSQSzgKmfqD4f+FZODJ2rym9Fks8lUDFHOufvKk5rwLwpiVRfU7SdRzD88aQWa
         rObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788895358; x=1789500158;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GVs4+8gm56Wnu6exUObCNgkOQEYDE8t6OW3Oqkq6qd8=;
        b=oc82MVQK7cPOPBkS0eeegtRUgKvVUNu/hy9aXgCjs9piFfPEx6d2kvbcC5nV7kHA3U
         GZHHyB8Urc380kRbIxeh3hXPDJsAIuhuvSm1Lk6Bk/t5S/ntxWv6isV5tvVGf+HUBOu0
         merJZVriBraHgL/rspHIgQDwY5PNHDgr+iVYet2msIaPaisTukLtLrGGMe+vqK5ykBTi
         5VKiScJQH8VOVNGHZdyi65qnS11UxSwkFH1q1ysuF+64zb2Z3huGVlOdyMpG9W0iZX73
         yfRnxQMpTBpkp3WKJXlvIv5R337K/g4lElrf+V6LS1P9SejPTU7WDCSkdD06OQT5/ru2
         RKFw==
X-Forwarded-Encrypted: i=1; AKwUvByRYRe2cR8SQAfcQfytO8wrchfOApSiYcSH9UG9p73TFlKDJBX9XUs0DX4M7ddfqHnWlTeIvNiiAeNTzYQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k6vyVoXK4hK7FLJSY9eNfE1Nhs5UkPxyiflo4mKeFu6zGKHNRw
	0ZmgM2o7qcGSeyp0UZjMrc7JYloehVlwYc18TtYj29pXfnu8HDAD+c27
X-Gm-Gg: AYBFou3DyRrqDOSh7WtYgQyOCze0FY2t+ymSRriVvvxDkc8w4Wp1NxgKK/TpcB0hIZg
	sqrtPSe5YRmU7qIvzXAtGI2d8gnIT2DiRNg5or9q00c6XxrqMw7b9qVFsodRcnK/lfJwstA38HN
	XxPxxKZRCDh+PXEBA57CyI31HmoEOhzFklp89Of/jrs7CWAYUFQrCGqvj5NY3zBnNumiNrBESci
	pVo4epER7p74f0D8WaHW36c5S5RsOmNGdCjGzdmoNpDBiDQ5WZY2M6Jip2Wzth5PVDaGhztzFQk
	yfYYdqHzxFdgaJw5sL5iCnMv4CD/8qY+5pwS8OXsqNrconoMrt9vUU/eSyHe23fPBDAx/lAcEBp
	LMnAZjuSSAadFoPsu9Z52VIAEGzEnUdD0tZuK4XvcJmvs9rrsNGWrmxVqMk7lwmLZNUfADS1dWR
	cFi6BphaW3WZ3OZpNqQ2mZEAQ6n4N1vJyZfetyA1bWFLvRKXFFwVz1xd0569J5saHQ8EUJlNCLL
	awd4hxNZj2kNA5XTg7zsbjR59MhK0AwrpYQ4gkcRIXTRL/dpaqx4MIc2wQcUbBPRIwwRQZAT4j4
	hIhBjfUThaXGx64MNWSNFuxZdWsqzw==
X-Received: by 2002:a05:600c:3ba3:b0:49d:e79:612f with SMTP id 5b1f17b1804b1-49d0e79635amr157041045e9.26.1788895358151;
        Tue, 08 Sep 2026 12:22:38 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-095-117-170-066.95.117.pool.telefonica.de. [95.117.170.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485881353e8sm38080321f8f.1.2026.09.08.12.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:22:37 -0700 (PDT)
Date: Tue, 8 Sep 2026 21:21:22 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Drew Fustini <fustini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Stefan Agner <stefan@agner.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	Shawn Guo <shawnguo@kernel.org>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, Paul Walmsley <paul@pwsan.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Helge Deller <deller@gmx.de>, Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 06/13] ARM: omap2: remove omap24xx support
Message-ID: <aqBXOemS4boakDGt@gmail.com>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-7-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908152808.3928630-7-arnd@kernel.org>

On Tue, Sep 08, 2026 at 05:27:56PM +0100, Arnd Bergmann wrote:
>  86 files changed, 60 insertions(+), 10696 deletions(-)

Note that Sashiko skipped reviewing this patch, because it exceeded
its current 10000 line limit.

> -CONFIG_ARCH_MULTI_V6=y
>  CONFIG_OMAP_RESET_CLOCKS=y
> -CONFIG_ARCH_OMAP2=y

With CONFIG_ARCH_MULTI_V6 gone, CONFIG_ARM_ERRATA_411920=y a few lines
down can be deleted (savedefconfig drops it)

> diff --git a/arch/arm/mach-omap2/gpmc.h b/arch/arm/mach-omap2/gpmc.h
> deleted file mode 100644

perl scripts/get_maintainer.pl --self-test=patterns now warns:
  ./MAINTAINERS:19896: warning: no file matches	F:	arch/arm/mach-omap2/*gpmc*

> @@ -560,13 +533,11 @@ void __init pdata_quirks_init(const struct of_device_id *omap_dt_match_table)
>  	 * We still need this for omap2420 and omap3 PM to work, others are

Stale comment about omap2420

> diff --git a/arch/arm/mach-omap2/voltagedomains2xxx_data.c b/arch/arm/mach-omap2/voltagedomains2xxx_data.c
> deleted file mode 100644
> [...]
> -void __init omap2xxx_voltagedomains_init(void)

The declaration for this is still in voltage.h.

Thanks,
Karl
