Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A1440B10C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 20:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985087; cv=pass; b=Q4foFSw4kWXatiUpIKJfwBOtL6z2O+TduyVH1afmL/2ROVyyAGBhWYc17UfHUCsQlontsFG0L6NsY84tl/DaCcs5qs3unek8eKSNernkKra3fUddl76mj89dn1qjF3iizmQ+EeH1AR2jkXMoKcifVf6vjSvfS9JgGzwmHNc6lFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985087; c=relaxed/simple;
	bh=r0SYPe6/MLvVhiIoMkAkIXOuQ6dRGOznaSyuFqfT4PU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WPgSQYfRDUDPeyae/udINMWGW1qNBBXOPTw66i/TY544fxApK32CNeiqMAi0Qkn6nG9x38oVeKzCfH5GZ+9AzvSdJFQze0l5cZnvtq1USrB6nqn5h23qJLGrGsYtkQglLdDJtOtvsM+lKyGbCL0G/nOR+PtQDVKgGCIRtK67CqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=smJQALHJ; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="smJQALHJ"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a58eb29192so4263381fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:18:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788985078; cv=none;
        d=google.com; s=arc-20260327;
        b=njIzuc7KSouamJcIykX0uL+BtlMvOtt38HUy7xcVbvum0/6dlmmFXC4iurjzMw1phd
         +4jM4OYtvD/DlmZOlPLCZhJButvL9sVmaXEznhOEag4+k40bkvPlexOKzKXZesslbuVN
         632fhEG4oaZjLa12f7EZQAc1rS2/eAvnR+3ecd2gzRU2szAoc8R8FdA5J18ZfQzVGrWe
         SQ15y3OYBDW1ScbyCR9gD5/iNeLfa+HE2T4qGQcx3rx/Q08xag3zZpEJnhA7BZxR1NbO
         sRLPeyFxmkpJRlltJ0B3q9PZUJVOU/oHzAnbLWR3pFCgYo677dxSHNZQKYp1WwFyzeKK
         3T5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rU/edVWvN0al2QuqioTnSDLV4+asJJGA8jcDggwnG3A=;
        fh=pPwQ8K6n+/RmrZrjPyqAh12sjc0mzbk/XnbHVJphWO4=;
        b=WXQ1s6wJWQeSM2EEDTPoXGVrOAKQfmodXQ8oAD2y3PfRHNfoOdEtzncAvIZci+/fxz
         /TLqIBEH9EfQgcSsc+8o0kR0bzTL67WOgpeblCMzqTwF9YFj/L9znUMHoR+KoAjnwoQF
         RfjIXf/o44NhZJtAjqV8OBNFXQdzc3Y84aJxzUcGKG4azTE0xJrm+3Sme2VGOUDsgLmA
         lznm2iowxGT+YsIFzMF6SNyjIcmMv0cEk9kxq4gwFpQEVnKMgF9QTwab5HxFyBl8LtbI
         0JJ5pPbXuApZlfp6leGLmj5EN5pkPvHjQDFA7vtMsqsjV8vu/Cy19El+Q9nAAAuNp8SW
         k+EA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788985078; x=1789589878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rU/edVWvN0al2QuqioTnSDLV4+asJJGA8jcDggwnG3A=;
        b=smJQALHJEKLggOAUE3JHMc4GrHnhEz7kBOpoYZ+TN9qx1gucc9icC6ZGkjkY25N0Hc
         hwOKnXbTnOmQlCMiX8WY7Wbjwvsib1tfB2qyB6MqkouZEUe5OjkyThv3qA5myAKF01PX
         BmLKDkjM5hOjVkYHLAanr63ETq0E9LC2GSoZqoox6EZvrQR6uYEu/UVdyTXh2zgSk1V2
         M024205Bv8hrlzM4HVPzmnPrUR/+dlNMyqZLhQMLQvjtwdq7uJLqGI2km027Yh8QgtFu
         7WIf3RmVmKLsaxk6qGoIS24SCB7zbMPTLBu8TI43Ok91YY3/KlWDJj6JYoMwuHjkDq5x
         NhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788985078; x=1789589878;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rU/edVWvN0al2QuqioTnSDLV4+asJJGA8jcDggwnG3A=;
        b=BOMdzHGxHanWMdN0VnrvRoPIGLyJFqaLCQIRRKEs0z1zj7qQPR4TvvzxUnxYieJ+Fo
         JwzCWJdeKWvd1HIt2k9gJT+OnGGFSjbb2BxPVsjP5CuaWKNbEOz7RLKRAjRwC8Riy282
         XCKkL8HHZezmLa7nUZ+Uitega5qZZ0CJgPKJADAxuWho3wDajZ8uMq0vFplN8YJTXhAD
         PuP2ym9IoMAeK1iTtPTMFTRqyaqGKscpg7Jseh9D48Sj7FVgV/jMZ6G5c5vo1BTotHg6
         l7CwIljEfh1fb8DT/4G2uza8/PUGE3bMuNpz4Bf/2//EA2zL2+Dr7zBAOLJXAkew0IwR
         ZbbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxU84T2UdaPxn3VrpYnMIOW0M/El2e25VRrYqcAuXUZ0kt17g9VRPp2mk0x13RjXpZUrwTR52mPr17zo/s=@vger.kernel.org
X-Gm-Message-State: AFuF++m74dwy0l7n5y1HqZD9DDau/5TGlST7uDkfMKKibu6D1fFbpS1H
	WxEJFOVakUTC91PbJWd2UzeVT2AzDmPoLK0Eea4m7Z49u3gDB4WsK4NDhxEW4cZ7VKvtk/56zcZ
	HUb+jAqvbCT4NpKpkInTUx7+Sk94p8ns=
X-Gm-Gg: AYBFou0oTy01aWxI/eR4ZfrwwD2MJ2mlon0r0wm9vnw06PMfp2oy1O42wDcLsj1Gzlm
	Q1LcI8awuM97re+UWYbNjGNNKb+jvybE79nTDgO7zDycQ0W6OF4eSRgf1+d37P0XJhmWAlPYOin
	lNS4yxIiGbYaVcG3TjPq65638Pel4gi2eWK+tlDEHX+SoKI2S2Q3TpYvMZSE5u2QO+V966a6h2v
	9JB1bulNAgWc+ddmasPfBTSuZccxzZ3puZHZ+GKIupOeaXvK5+o8IaTajyQ5DDfWjOxallujbPs
	r7MjOyhpruuBf6Ji5m8vP9J3OSdfGzwByiHuHKZCtNyWvhu+ZbQEFbXMylU3KR7FTDJXHZZv2sX
	j2OuhFGZdrxlmoBZvKXCsntib+4aLj0v+2fOkCu8nUT3O
X-Received: by 2002:a05:6512:acd:b0:5b6:1a7c:fd86 with SMTP id
 2adb3069b0e04-5b61a7cfdb9mr6159278e87.44.1788985077633; Wed, 09 Sep 2026
 13:17:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-9-arnd@kernel.org>
In-Reply-To: <20260908152808.3928630-9-arnd@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 9 Sep 2026 17:17:46 -0300
X-Gm-Features: AcwNN1WKZQyaGADU6lkE-GsXnisq5MVghkNUlNC3CqrQiDAXJmgIgXPSi_5sivU
Message-ID: <CAOMZO5B4q01XRGRfK_LoR1SWkvdP-_fbSHrE4BYq7gVf7k0Xwg@mail.gmail.com>
Subject: Re: [PATCH 08/13] ARM: imx: remove nommu support
To: Arnd Bergmann <arnd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Drew Fustini <fustini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>, 
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
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 12:29=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The i.MX platform has grown support for three separate product
> lines using Cortex-M based microcontrollers over the years:
>
>  - i.MX RT1050, a high-end microcontroller
>  - Vybrid vf610 suppors running Linux on either the Cortex-A5
>    CPU or the Cortex-M4 MCU
>  - i.MX7D similarly can run Linux on the Cortex-A7 or the
>    Cortex-M4
>
> There are no known upstream users of any of those three, so
> drop support and simplify the platform to assume that an MMU
> is present.
>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Vladimir Zapolskiy <vz@mleia.com>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/boot/dts/nxp/imx/Makefile            |    2 -
>  arch/arm/boot/dts/nxp/imx/imxrt1050-evk.dts   |   72 -
>  arch/arm/boot/dts/nxp/imx/imxrt1050-pinfunc.h |  993 -----------
>  arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi      |  160 --
>  arch/arm/boot/dts/nxp/imx/imxrt1170-pinfunc.h | 1561 -----------------
