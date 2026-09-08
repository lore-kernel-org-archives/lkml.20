Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55053434999
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 19:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788896416; cv=none; b=TlB9V6rNTyxSsGt9uMjDh5gXDMOZSI7V8fcw3E5tausGV7bQLN1Jr6D5TSFjBnNuq3E0XsITF/m6eds9gYV78+poGNWvQnMkn7/eK5vONzU699NP1Ek4bJrfcTRXSHH96C9Cz415eN/UabnrGSf2g+UY5v+/S0H/H2cMvebMMIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788896416; c=relaxed/simple;
	bh=EsrGjrnP7IgSiDLJcakyY4ms71wqAvVcdyupbrs+ipo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OVu/PJzsMQPieE8tdhJelccEaRZq0iSojp1+5aSgGutDHqPNk1s8i21DQBzAEOvfeiwHSoAA+HDx7dfGiFftzsKzJqiuqd+fDdwN/1n6+K2ouqG3qo0S7lj2ePMBda+z7U/kosUnVLCUfPFSBv3oR6qg3D1nnCT5xSdx3M+PovA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TEDHWMJM; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEDHWMJM"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-485850cf499so3342371f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 12:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788896412; x=1789501212; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HzP/HtSzvmP6ZP70XBuHWUc2m2AKpgco5yULa/5Kmis=;
        b=TEDHWMJM9duaytD8JkqocezS6iP42AtBh5KBUdL6VJfMAo8G72zIpPgMijD++58Po0
         YwHwizi3QVSNbvl4pEaWbB6M+s9YZwMWDOxMFtEILOG/FKg4VCuHJvoiejsBGj/B8ELd
         M6MBENKrWZ/n8I8xUJVhLId7XCco84KBIIBd6Q3NUTtCaMHVeFeMf1doV9F52xOheVWd
         ZafumnTzVsVcJ//LRyR7yjnBPr1uq+kT7RtXKWt7YOL3NTbu2nSpJmOBbctZl8f7VUDn
         MHay7jF4KqXdYWKswO4Url/5cuki37cFsHDoyppV6YdOQGmyHB73PIIkwYzxyZ1J62Ib
         xNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788896412; x=1789501212;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzP/HtSzvmP6ZP70XBuHWUc2m2AKpgco5yULa/5Kmis=;
        b=HRAX6X0mofcXX1xlZaEdxKsZ6WFJEzfsh/9PgmLk3qhkMQd8k1NbguMUz5n41aeBKn
         b/aI246xNrPySVIZZaKRdvx8fzRC/Ic3lOfrWixeYiYDHXoHxs/3Pt4njCglhrD1tra9
         obg96ucrrwHag2NopUHt3xflZfNerWTdyifiVQjWRX8jY3cI1UgM/SA3cDX51Zp6/VWR
         2XzrDIRrQxVQO1GiSiuXZjamksex7k2BR/hqkarucMLtckOVxI+jVjAcex2B3Xn8OXqi
         NX2xJzveSEdteHguOU5VMvi6I7kcYEMJFZpFjKI/ExfhHT0qPE9bi7RNO76/k+H27ELK
         SSjw==
X-Forwarded-Encrypted: i=1; AKwUvBw/AOdbYxK7FkKkNFBWMr8MA8Q8Ie5/pwkFNUEvrfWaVpG/Iu34WleY8kpksjf5TtmsovCR5yXnAuUZ1fw=@vger.kernel.org
X-Gm-Message-State: AFuF++kRr+OT1pEE894Lc2DZ/sziz7sr0WU0sDuNld7sEheL5aqW1xTw
	BNPvrUGPhPeiykBkQIY9RSOwaxStkWkJLtbgXcu79MDG7OARFxDshRZy
X-Gm-Gg: AYBFou2c7zwJv5D7sm5hMJRT7aaEbi3BDEjVpEQwbLENxpJJc3j6YzBY6i/OOCsqTMJ
	7iMnWZ+yDLiOgTl59zEUiF2CK/QDbV0MmSjEYBTjP4P/Zkt1cNa5vRbMeS58eBZpn+EJd4/TE8i
	4gPw1n5urZm8Kyrb90NqgKHk177UjspNKtNCtOlO8tsPneARB9k2wRI3R1VibH6iibceHvFj5cr
	LYQFoU3bmbV/GrQCgMH/b8mqJmWwNFp0LkyWlBZK/xypplK94c3h0kyiRoHSJ9iKb3auGwGUKMd
	KpynH6bfQYROBVbAgFcpXaZbHay9cpNWs4yqQ9E0IIpvfbcA3f4sWEuKjuYPzmuoPYJXOtBfQ9q
	DNajjQ34wZ7K/kYD3fju9QX4icLZ20ylvTo1mWUDWg9m1Yvtjdu+en9PLc/qvqUjpNO7cJrA2rV
	P8yZa19nWVu1X75rHy6y4bwaob45unHCMwj/6/Id+7K9agWDxIX9loxkbuiL4Leuc7PT+pkBPK2
	8qfeA1WvQUhZFw52UYOlt2Uy5dY1ulwXoO1XD26tELoPBIIA+bzOAgpK4tHy9JWZ0WWV3Hgz6gb
	SYFg7G2GxNfVF5S0gOdIvgCW
X-Received: by 2002:a05:600c:a087:b0:49c:d26a:cf70 with SMTP id 5b1f17b1804b1-49cf825a75dmr321721005e9.15.1788896412155;
        Tue, 08 Sep 2026 12:40:12 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-095-117-170-066.95.117.pool.telefonica.de. [95.117.170.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fc1be3sm991795e9.4.2026.09.08.12.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:40:10 -0700 (PDT)
Date: Tue, 8 Sep 2026 21:39:36 +0200
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
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 01/13] ARM: remove sa1100 platform
Message-ID: <aqBhF5oS1A2W6dAa@gmail.com>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-2-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908152808.3928630-2-arnd@kernel.org>

On Tue, Sep 08, 2026 at 05:27:51PM +0100, Arnd Bergmann wrote:
>  62 files changed, 19 insertions(+), 10501 deletions(-)

Note that Sashiko skipped reviewing this patch, because it exceeded
its current 10000 line limit.

> diff --git a/drivers/rtc/rtc-sa1100.c b/drivers/rtc/rtc-sa1100.c
> @@ -275,18 +275,10 @@ static int sa1100_rtc_probe(struct platform_device *pdev)
> -	if (IS_ENABLED(CONFIG_ARCH_SA1100) ||
> -	    of_device_is_compatible(pdev->dev.of_node, "mrvl,sa1100-rtc")) {
> -		info->rcnr = base + 0x04;
> -		info->rtsr = base + 0x10;
> -		info->rtar = base + 0x00;
> -		info->rttr = base + 0x08;
> -	} else {
> -		info->rcnr = base + 0x0;
> -		info->rtsr = base + 0x8;
> -		info->rtar = base + 0x4;
> -		info->rttr = base + 0xc;
> -	}
> +	info->rcnr = base + 0x0;
> +	info->rtsr = base + 0x8;
> +	info->rtar = base + 0x4;
> +	info->rttr = base + 0xc;

This drops the layout switch but keeps "mrvl,sa1100-rtc" in
sa1100_rtc_dt_ids[] and in bindings/rtc/sa1100-rtc.yaml, so a DT with
that compatible would now silently get the MMP register offsets instead
of the SA1100 ones.

> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> @@ -614,16 +614,16 @@ config S3C2410_WATCHDOG
>  	  be called s3c2410_wdt.
>  
>  config SA1100_WATCHDOG
> -	tristate "SA1100/PXA2xx watchdog"
> -	depends on ARCH_SA1100 || ARCH_PXA || COMPILE_TEST
> +	tristate "PXA2xx watchdog"
> +	depends on ARCH_PXA || COMPILE_TEST
>  	help
> -	  Watchdog timer embedded into SA11x0 and PXA2xx chips. This will
> -	  reboot your system when timeout is reached.
> +	  Watchdog timer embedded PXA2xx chips. This will reboot your
> +	  system when timeout is reached.
>  

"embedded into PXA2xx chips" is better.

The RTC_DRV_SA1100 help text a bit earlier in the patch also still says
"built into your SA11x0 or PXA2xx CPU".

Thanks,
Karl
