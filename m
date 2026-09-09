Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B8A423783
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 20:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985304; cv=pass; b=h6pRgaB7caX6cUrxgHYi+Sk3xWbLsG182wzCDrtn7iDMPqYQKN7diVX47V2aQO4y75T7SYHETse8hDSGdlJA1pSBXb2NVgEVQcfabfRgaXEIa4qCAPGqlwus+QBvKtcOj6aXW957mIpOKyRoWr3ocSgGpMkqmeXneJBDFU7ovY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985304; c=relaxed/simple;
	bh=0VHC4PV1n3kvmpJBB03kx86ZwKDGKzt09AXVkbRvG6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b4apKu6dzEa3FWXj/ugz/w5Ko+iCbcOWx3HzWJxXHV5kYE8wOZDVbfblehsxnliDjotyLl5drIJelYOCn5CPj4LLSQV/QR6UuHVaal2Mr3L7rd6WG0LZa+/1gSjz/CLrMNTzmaJkDu/Mu9IUZ3Q6Oh6hXpoXMVlpI8aOhvm28uc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LUIaaVuJ; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LUIaaVuJ"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3a468f4c547so41143111fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:21:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788985296; cv=none;
        d=google.com; s=arc-20260327;
        b=p3Yye1iQB2Um+4FlqEI3z3wZcMZeTF3iD2yDdGyk9LV0dPnazwnOQJGUbigvohcwaH
         Q0uTBeNRXO3B5elak1ZQJZeqBuRH0ZdxGQZodu7HpoXqhccVWRDL2GrZOLraVUpclIXm
         0pJy1TWumRE6VhKXea2nhrCQdmOLL05rSpkY+T4v1foy1ir3B/gQhfL0U6WRNh9xlW0I
         DAYe74eMLNF9IT1ei61NLuF1Wt5Q+5sDUcqdardDPv0CvnCsLGJuqB/BA1MRyp+Yop/9
         mjBZ9FsfXDncLRGmowkbuD4jwk/pZAxU8phwO3ZvhaRDG0GigdaDvJSJiObxOKjOqCFE
         GtPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KA2VpArXTb8DPUcHb4yt2Z+i5iQStht727IOnEs/FJU=;
        fh=QP+8uj9dC8B8GAot2nizqrD9aWezTmGqCCEMOquA9NM=;
        b=FM4LqeJwnJbQKpkSDti+oD6CYX7rHgKNO4aWSNYZCFwa7S38tDOwvOzAmTEUdEuEB2
         ryl5Kaz0o8R8hjm5md99UTGjNHSMmk3uHlTzkebYHyu53fgMjAK7S73ugzFWKtS2uj7M
         2nBQkRwzX+S39qBVVSkGt2JTudmlZyJBAaoRNt4zeFR+3Wel+F+PtasbrrzvQQaOgLcK
         jxj4DSIb3EAtOieSiPgkYuE4GtfzFK87qXzMw4VAn8Mbswi2noIDNOFUU8Pw5WIexZ0p
         PABPfcwHrphJ7oWkLEzhqyGPNr9Bybx18dzVBA94MVZl69KucKpT7SI4YCP8Y/Zg2ezR
         ZUxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788985296; x=1789590096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KA2VpArXTb8DPUcHb4yt2Z+i5iQStht727IOnEs/FJU=;
        b=LUIaaVuJod11/3g/t6MbNyyoSX0CGO7oms/3y74cxk2EqkM2BDpR1KUNdVBrhuAfA9
         bSMPndRxSTkcgUpnYqN9zDlJgMWyAIZ1UlS4m1CFX6RVka/csj2ljbMnaDf/WDF0xUDh
         p2RzP3hZ0yLqEloDhD4nDMUMHpuQiLu3xcB5SXR3tnbFjOiY3ZxDtdXHK9mR1nh+VEF4
         TTnh0U90Ta5H05+5Kn4Vu/aOoDSE/k82LatXfdQtFVmsxCKPCz6dRSa3x5X9sCT78Hxh
         Q/o0uo7WWnZte+3/JDYeSMruLATwmPWM3pOGCjLoBwn3RAf8UCyqjrKgQFa8QCOsHz5l
         zJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788985296; x=1789590096;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KA2VpArXTb8DPUcHb4yt2Z+i5iQStht727IOnEs/FJU=;
        b=AaYS3MjrWXqCe0GOBJeUXkT7fT9SLEvipe+5Qmnjfq3feeJ/9LO3BMw1LHr8ak3bll
         sm83O6xhO+BmfJrdqIwDsLrpt0MJzna4KF914qvlPFdydrTJKPMP7UyilRSMDViSadqa
         /6uJtJ2Wax+1NhyiN7XPhImxQYZ7dyYSMnvv56GdbKV3Yy8gJyPEEcFD4FWdZuSKt/Pz
         76PDTIFgHF1wqekN39+MJygHsNYcaMfuALoJ9a/85nVGIzZJTGyU0UhDBhkSgHtsHnl0
         IvMSkfyT/tPRNr0ZIqJvDwITYACSpAU3/ysrrV2g5l7k4up2eTl93EJZQjNo+l6O7rRM
         7//w==
X-Forwarded-Encrypted: i=1; AKwUvBznXz6b7DItY7tj9JstkNijIQ4TgrXtD4Hefwd9lB3dHQKdPBTQTvdf8ffbgxTGMJvbbNi81PortCNVVLQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mHytPmolXqriRAzmVK/BImJ9GR7EHOn8f8gBTO1O8jHZ/eXbVx
	mq4WbBJgd0DUU35GkD5u7Vhf450xkGpnsetaKXxQd5629O4tH58L2WzL7i/qFYhuCtzbaVfnXnB
	vpcbj9xi5eRBq/5BuhJT70ZbcZZTsCyU=
X-Gm-Gg: AYBFou3RGx8A8mwPAXoDrRdGLdMLQyan2b2cr5Fx7U3kq2SpvaBqdhLUhc23N868DXW
	lwWZ82B4pPf0MRh4r3/w4kPXGPry4IoLPIGRtxjJyWKMTbuxKXD+GhR8+cxWzjeKFgCQnzE0fZK
	jYw7oCY8lW/uWcJthvU4aFpRAT/Fs37P5ccOIep+X6+krAnj3Q8wk4O5XzmfjUBjCj5NQKkqhy3
	pZPyXeRP7AN80B2J2goTT1DeWs9L6dAKchbvBVEmTyQXg8iZvoPRvoOzRHFj5mzlzgL0D7yWnXt
	iqW8IqKjlSZzOoq5IlHgED8fex13xKrNc/pHxqUrRaiPusgI9LxWVG7sQaDY5msx7S6xmok7vm6
	zJiSww2hEt/+ihzlDKs2SFhgmp/BeX61lexiAi9Is0Bma
X-Received: by 2002:a05:651c:b0f:b0:3a3:749e:31a4 with SMTP id
 38308e7fff4ca-3a58d92c643mr3500071fa.24.1788985296110; Wed, 09 Sep 2026
 13:21:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-9-arnd@kernel.org>
In-Reply-To: <20260908152808.3928630-9-arnd@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 9 Sep 2026 17:21:24 -0300
X-Gm-Features: AcwNN1XhCWWR_p45edJ2cAUvnO6YnDwGtKUGW17Fe3LwHfhT5TU0cNccQ42bU4E
Message-ID: <CAOMZO5Bw72SkBChbRLg+FaYZ34ENAW95-0+LrgcrESu_YtNXFQ@mail.gmail.com>
Subject: Re: [PATCH 08/13] ARM: imx: remove nommu support
To: Arnd Bergmann <arnd@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, 
	Giulio Benetti <giulio.benetti@benettiengineering.com>
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
	Krzysztof Kozlowski <krzk+dt@kernel.org>
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
>  arch/arm/boot/dts/nxp/vf/Makefile             |    2 -
>  arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dts  |   61 -
>  arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dts   |   88 -
>  arch/arm/boot/dts/nxp/vf/vf610m4.dtsi         |   61 -
>  arch/arm/configs/imxrt_defconfig              |   35 -
>  arch/arm/configs/vf610m4_defconfig            |   39 -
>  arch/arm/mach-imx/Kconfig                     |   27 +-
>  arch/arm/mach-imx/Makefile                    |    3 -
>  arch/arm/mach-imx/mach-imx7d-cm4.c            |   18 -
>  arch/arm/mach-imx/mach-imxrt.c                |   19 -

The imxrt1050-evk dts is used in U-Boot.

Adding Jesse and Giulio, who use this platform in U-Boot.
