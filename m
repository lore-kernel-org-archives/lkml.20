Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF0F1A3A80
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889729; cv=none; b=TDAHkkeLBVTWmYS0zpXaFyYhNo5sU/O193QY78/kBNEfnIzu9QnZHbR8HvbhuhcdpPWYr7RJwoDRXD4OQgGdcteN/b8+EyErqy1V+mwWiDogJGsVU40dg1ZiaJDKB8iFZs6JA8VD2Q5HNmf+7Zbe84R1ZBgdw4z3S/fGSV5C0kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889729; c=relaxed/simple;
	bh=f4UIowynbF07Wy7Vh7mDdrS3+ucFbjTlgVg501LnxLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J2eNOhujfa4DeXBWGZ1RNoAn0WVIe3Wrb0CQseRGYe03QJ3IrfahRX4h4evYelJa3F5z58uBhXb1sGG7bMOyVMF8Q9bu1ODbmUUr9IOpo5LTVZvULwvxAcd9lKrUqPi3JH+JujBdFbpkurJkmOfvLMRd7mMjwyvEq8PpK/9ABvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IBzvOoH6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IBzvOoH6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 300551F00A3A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788889728;
	bh=f4UIowynbF07Wy7Vh7mDdrS3+ucFbjTlgVg501LnxLs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IBzvOoH6ZYw3JxznOt8OitmZ8ZGAkUBX6t12Ik36Zs4OQHpCNzboDjONGUoSwOdPI
	 T0k9zKuq1bEh5C+z9Gt9MoBFO5OXuIhxtNI2P4z6irn9WiCnp27bi5FmvmAlix0nLn
	 a8oLaHUQm0BnrHhJnUK7T8Z5CGAfEYt7u3oy50iRZ4nLtrJTmSNMhDlRZZAZBlSGzy
	 Qt7hQ/Bje9lK9WwKpxomerW7836DCUL0aDjdUUUscDQSijanX3i7FgzQTL9Uiqcx8H
	 aCz8M+AtJVUhytj754TN3BMNCIPpVeVL+KlOio7PXp7IU2/WOABWOmm1kNDcZ9eq3p
	 4EV4LZEB6WtSA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a468f4c547so29606691fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:48:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByG31Hi9OHEMJL1IpzPzPWah72M5QJp4O+I87bIgt4Q/aMzjaPJU0DeHMPVG5MfSqKIo0GDJy9BNyRMUlY=@vger.kernel.org
X-Gm-Message-State: AFuF++lcgI5j/PcyHLwmaf4379UxYXkKCtEpUrAwfzCtLk3jXRfyMOmZ
	p17BYYd6lPCzsf5vGu3X5hbsj38pvpisvsRgkSAy18xvUOYfIcC8IbO4DOIhEoGxCCOJ3HmUos7
	4lEOGbh7P+gOSBZwyPuf6UQRxWmML7VY=
X-Received: by 2002:a05:6512:3ca9:b0:5b6:183c:5c87 with SMTP id
 2adb3069b0e04-5b6183c5e04mr5069176e87.37.1788889259016; Tue, 08 Sep 2026
 10:40:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-14-arnd@kernel.org>
In-Reply-To: <20260908152808.3928630-14-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 8 Sep 2026 19:40:47 +0200
X-Gmail-Original-Message-ID: <CAD++jLndhdr2XYp2rYvngPMr4hkCtX3Xqv=bs76kuEK5MAq91Q@mail.gmail.com>
X-Gm-Features: AcwNN1Ujo9rjMuk24CQogLFJvH7ujiRz2lorQ7l9osv6uL8Ek2VIq58WljFfaCg
Message-ID: <CAD++jLndhdr2XYp2rYvngPMr4hkCtX3Xqv=bs76kuEK5MAq91Q@mail.gmail.com>
Subject: Re: [PATCH 13/13] ARM: axxia: remove entire platform
To: Arnd Bergmann <arnd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Russell King <linux@armlinux.org.uk>, Drew Fustini <fustini@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	Shawn Guo <shawnguo@kernel.org>, Karl Mehltretter <kmehltretter@gmail.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	Anders Berg <anders.berg@lsi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 5:30=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The initial Axxia port was contributed by LSI in 2014, but never complete=
d
> after the sale of the business unit to Intel, which kept supporting the
> bulk of the drivers in their own downstream BSP.
>
> The downstream work has also ended now, and there is no realistic chance
> that anyone would rewrite it all into an upstreamable port.
>
> Remove it now that the 7.3LTS release is out and can be used as the
> base for one more downstream rebase of the downstream patches if needed.
>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> Cc: Anders Berg <anders.berg@lsi.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
