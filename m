Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED945581FB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957728; cv=none; b=WcwMDT/+m/026zxexZrnlzoRA7sZbEqOb474SY5bRlWpN3yH55pabuAy5JCAhkPFeYSL17i3ODcfRbGfXki6UaRh3WlzUNJ2Rri8lcMj4HKJU+ySogsP5f1fCigkbNhI0eXrIRK/U8c08dTy9cSOESyMwGSs7PHsX2ksZ+UrSJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957728; c=relaxed/simple;
	bh=GJNMZQbHSmwBr+zVeFr9A/dvc+rKaXGmrgl80slAuJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GLXeMjGV4BuYQLeDNhkNktvY6x21uTslXfoFjqxmF4h20iPZZU60N5anqkjZH2hQwZywT4q3q+zNymoWBEcJDWg7TAbi0Ss5auOAJcYhpU8ywuYSurhN3MRcNtV61XxixO7cbURdQvMqNHwQhrrJk46EoC/5friGlKU0NjBAEsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fQo5xu37; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fQo5xu37"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 651884E415A4;
	Wed,  9 Sep 2026 12:42:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D9A160448;
	Wed,  9 Sep 2026 12:42:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1B80311C7AF5C;
	Wed,  9 Sep 2026 14:41:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788957721; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=h9+wKzPa6JcporMdRfFhDFtBgO7SIKlB0UBH49rnfV0=;
	b=fQo5xu37RTwShDHIC2oOZlp+NwSKioDt2qv5+gAB1pv8i9p+xJQbpBXEwU+2wNL2W4bc8r
	5cdb/8tcsinfXdAF55wQjGfmArjpUrnYw4Dwco2XE/SlnHXnjcm/SZpd+T85a2MnDnA5cj
	I3SHBVAWhlYv2l8rgrX5gjNqlPBVFcZZmIn2oh7yHqY859T6YrMyKFUUAhgpuCNlxyhc10
	OiAeT05poKOLR0VWpwX3AYkmSmv6vensv1/nsp8wCJD7M129KP1VZIPp7XUsgL1XhmBn6B
	5oUZeTpanwQJifomjKg1GJWn4SAVptG5WZkcER8lGg69/mFX7Lp5cN8lxf3sWg==
Date: Wed, 9 Sep 2026 14:41:53 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Drew Fustini <fustini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH 12/13] ARM: at91: remove samv7 support
Message-ID: <202609091241532edd8277@mail.local>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-13-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908152808.3928630-13-arnd@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3

On 08/09/2026 17:28:02+0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The Atmel at91 line, now known as Microchip SAM contains both
> SoCs using ARM926 and Cortex-A CPUs as well as a number of
> microcontrollers. Only a single one of those MCUs currently
> has Linux support, and has no known users.
> 
> The samv7 platform was deprecated in Linux-7.3LTS, which will
> remain supported a while longer after it is gone from mainline.
> 
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
