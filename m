Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3469348E0CB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045762; cv=pass; b=EsCg3Y5OEvOS86IAj4cV5Zq9VuS9u6Y7sYo1dTuGCLx7xAOmz8+cGe7LkE3iGAb+Xj32T0r5Aay+HegJ4sFOVgXNrbmKyCOJfhJLvMiKewHZ5NjfJh1twJOzbBXk0zMaFVuoYIgAHWLMY/MXNqXW+sO6MpU18Cmlk8FuBRF60wo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045762; c=relaxed/simple;
	bh=OK0YfBX92H6A0Epu2Kw2rNUmQkQOp+XxcafXxrqgWXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jL1rM3q2YuAfcWA3kYk1iWaVXnSeIZ1gGD/u9IigjvpTlbTecxRoKiLd3gtTRpMX9IZ8LGm9iHIkMF3PUeIqfvX4Jhzz4GKHljqJQ3+YMp85bdlxpw0Qtt9UMTMwgthEpJ1y19ug5SXS7uToXKsB7QYOBow719ZN9s9aN/xdEX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nmc8Thfj; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nmc8Thfj"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b91369ef6so9782265e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:09:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789045758; cv=none;
        d=google.com; s=arc-20260327;
        b=eObuOwmuMMNdCz88U34odn5du/FTknwBNxgngz5gnzOpKEJq17wNu32gzVOgncgd87
         mPtGZ/B3vn0gS9DcPylZ7UsAp0tbG6Mvkw+67jwKZY5DxCs5KY2HG5EFnxCiQq7hA4wt
         VfO2Kv5Sgx4myY+GXFn4xLl3vO0giM93wgvblGIIOcNZyfve5b/d1Ksml0K6YP5uxJaA
         eCxA8CF6zduQn6OcmZjki2O3T2jeFhhdLpVsR8QSeAwXSAdSra5bhuGDVoGo7mqDDObo
         eZM4W/4o3sx/NMSPQ8LxsrC+SH7nxsnEB/4m9EOp5LMbhx7ZEet8jVWsV1GmRXobZXWK
         YZsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Df7aozBOtXp5BasAQeyfsseQI0gbS7rSN3y93pihr6s=;
        fh=e1MJvMkDb7bVLCWIhiqcLQCNYXkOSEsny+inAstB3Rs=;
        b=KbpMrChkf8nyLuNiDToWQau3D6JH72Fg40AnD8S/W6Bt+vsdgGshgAns2LIDABzBEj
         cS0ZervsQb7/2LKaFHK4XMR1uyNoJGix4MMOXMQAFjGt43SNhie6/4+rtDIpiwFt7Puj
         61rb1sznH9yniSMXkhWrXJWs3H2JtsPBPJ1/9LvlXqc8GpmSiUZAvGtF2FP9T6RESJWo
         GVRo+7t4z32gq1a186vErtJs2thT+da+YCz6BoF4uc+uvkb9Wt4oIRJL+7F+Q3Y9k9GN
         JCPpQKZROvXK65bR7kmWT2cO9E5V1JsTagFun5N7M6/NceKgDoLNWGfg6A2Kns5RsM6j
         QSBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045758; x=1789650558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Df7aozBOtXp5BasAQeyfsseQI0gbS7rSN3y93pihr6s=;
        b=Nmc8ThfjVslSMqzrKT+riGIeqWXuIbbPKhuePOqXbEtive9B071Y2UmKWQ8xIFar0v
         vA/GpXEFTitK8UACRjGIY+bU+kd4zM5UNY97QSblVGvIrYfRJ0prOF7gpAAMohqvNCHw
         ADtOp2Cffsa9pyjg6w1EN3k8gJZVPkcLDY+VveKt4EHf1RVykK1+lvIc5UhcRlBf00CD
         lawTFbZgQNQm1Fvu/R2lpmTbI5fCTfEB0dlwHpnclaXnT3rxsVg5mXzxap4nBabS/Dmo
         e31sGhW4VwAzj1pm3vv+9atnWga8YADGgOYgvziJHOfkJkr3+BNMuMZZqefb7WfskKLk
         1M5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045758; x=1789650558;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Df7aozBOtXp5BasAQeyfsseQI0gbS7rSN3y93pihr6s=;
        b=XR6qiQUnewwiFxz2ynUdi7OoIxix1KVxPXtj4n7W9HY2WIPLNluUcurF7bdJfACT/Q
         L3zo05St4EHkIimLUA6nd/Dno/qQMQMdcFx2o37BKKh7LSa7WEFPAOHYJRTaym8IuUTL
         KXFF2262N3GjXNJJpfa6NfBxCpHIyiDMds3brREfVrG96iOsAy0k50HRE08GCQWWT8bh
         wFuPyWMZq97xlkzlwrXDHgP1ajlUUA5D1i5ucoIi1qh2w3BvytHtUj++VKzwF67y7QA1
         WJ8Qo6ocPQEWXXIrWUpRxddZ47OWXWaI6sjKpdxS/AUBf8B1pkFCI9DPrl5ZlIBx/1KC
         5Cxg==
X-Forwarded-Encrypted: i=1; AKwUvBySeSFOD+Z66B8zQQozwVWW4gt47kFbLXFQoVFIWJQha168i+O0BFvqdV8pXGFm9NSiEc8Y8+NL0aP5Z+w=@vger.kernel.org
X-Gm-Message-State: AFuF++n7/Ylbsk+ZQ7BDQg/5H4MoYraY5hXJpgBCtva5KT5T7+x5WXaa
	10924eAlWOCpaJrrWTLaT+Kb09Q3hG56wBm2PdngVYmn2ZdJ8W7bvOZsMlhir+13UmPyGDCRhbX
	K1/tTb6o0bDtG1m8rhUPrHMgU+mDhXok=
X-Gm-Gg: AYBFou1mmifgZQKlBst6QivscAwUH259w5zFjsGOLjh3emeBVOe3eGax8lQC3/CNza8
	gAO65/inENdy/YqLu6RkMhAVT6jo5U/6k3labde7WoGozwM9FdWNN8m+40MCFROkfwwT2AzNR+F
	pgq5JChnnwN0m/K7KzmLAbhE19RlogUQcavOyCIwvfKtu/D0hfkq/fk9k3KX0kXajXT7NJwm3IT
	00Iev85XFFJWp6jxzKpfxhQjWg1IgQGyiK8+fAg011PifrmnMnFWgNDmUEYOa0v4ZbIz0IVU7ch
	IFB4w+WhmlAyexLP3gUm6jcNU1b5bQT/P4+0kKuR/Xs9EQYqf4VINNhXUwLwGWRznpUNc1yXk6p
	K1lbZQElVCEBX
X-Received: by 2002:a05:600c:6c07:b0:49d:1cc7:5ec3 with SMTP id
 5b1f17b1804b1-49d259138abmr111164355e9.9.1789045757952; Thu, 10 Sep 2026
 06:09:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-9-arnd@kernel.org>
 <CAOMZO5Bw72SkBChbRLg+FaYZ34ENAW95-0+LrgcrESu_YtNXFQ@mail.gmail.com>
In-Reply-To: <CAOMZO5Bw72SkBChbRLg+FaYZ34ENAW95-0+LrgcrESu_YtNXFQ@mail.gmail.com>
From: Jesse T <mr.bossman075@gmail.com>
Date: Thu, 10 Sep 2026 09:08:41 -0400
X-Gm-Features: AcwNN1UEFdvIck3fXBUKab0LkOKuiFOwC71vVQo2jwIoxCjaBOCf3NRiYyhyIhY
Message-ID: <CAJFTR8RYajZ+Az9JvemMCApvUEGG3pDLq1KVkKyAsA6Luw-0BA@mail.gmail.com>
Subject: Re: [PATCH 08/13] ARM: imx: remove nommu support
To: Fabio Estevam <festevam@gmail.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Giulio Benetti <giulio.benetti@benettiengineering.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
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

On Wed, Sep 9, 2026 at 4:21=E2=80=AFPM Fabio Estevam <festevam@gmail.com> w=
rote:
>
> On Tue, Sep 8, 2026 at 12:29=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> w=
rote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The i.MX platform has grown support for three separate product
> > lines using Cortex-M based microcontrollers over the years:
> >
> >  - i.MX RT1050, a high-end microcontroller
> >  - Vybrid vf610 suppors running Linux on either the Cortex-A5
> >    CPU or the Cortex-M4 MCU
> >  - i.MX7D similarly can run Linux on the Cortex-A7 or the
> >    Cortex-M4
> >
> > There are no known upstream users of any of those three,
There is both a u-boot and buildroot config for i.MX RT1050,
I also do basic regression testing on this platform. I understand the
need to depreciate no-MMU, but it's sad to see them go.

If it helps at all to remove i.MX RT1050 there are only 11 commits
adding it that are from Giulio Benetti and I.
For i.MX RT1170 only 3 commits by me which only got partially
added. See
Commit: fff65226b229 ("pinctrl: freescale: Add i.MXRT1170 pinctrl
driver support")

I also occasionally test the stm32f429-disco as I have one.

> > so
> > drop support and simplify the platform to assume that an MMU
> > is present.
> >
> > Cc: Frank Li <Frank.Li@nxp.com>
> > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > Cc: Fabio Estevam <festevam@gmail.com>
> > Cc: Stefan Agner <stefan@agner.ch>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Vladimir Zapolskiy <vz@mleia.com>
> > Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > Cc: devicetree@vger.kernel.org
> > Cc: imx@lists.linux.dev
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  arch/arm/boot/dts/nxp/imx/Makefile            |    2 -
> >  arch/arm/boot/dts/nxp/imx/imxrt1050-evk.dts   |   72 -
> >  arch/arm/boot/dts/nxp/imx/imxrt1050-pinfunc.h |  993 -----------
> >  arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi      |  160 --
> >  arch/arm/boot/dts/nxp/imx/imxrt1170-pinfunc.h | 1561 -----------------
> >  arch/arm/boot/dts/nxp/vf/Makefile             |    2 -
> >  arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dts  |   61 -
> >  arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dts   |   88 -
> >  arch/arm/boot/dts/nxp/vf/vf610m4.dtsi         |   61 -
> >  arch/arm/configs/imxrt_defconfig              |   35 -
> >  arch/arm/configs/vf610m4_defconfig            |   39 -
> >  arch/arm/mach-imx/Kconfig                     |   27 +-
> >  arch/arm/mach-imx/Makefile                    |    3 -
> >  arch/arm/mach-imx/mach-imx7d-cm4.c            |   18 -
> >  arch/arm/mach-imx/mach-imxrt.c                |   19 -
>
> The imxrt1050-evk dts is used in U-Boot.
>
> Adding Jesse and Giulio, who use this platform in U-Boot.

Thanks for the CC,
Jesse Taube
