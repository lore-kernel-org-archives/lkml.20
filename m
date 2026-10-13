Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B45A3C988E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882332; cv=none; b=I33mz4yqhwZSbs7Ej8UMO8cAyAWzKPpYeL48lyWALgfanbwH3LUWNJ+Qj6HItT/iQYyNCQqqG49ITVOdoyToWYwWhg8wi1yH2JMBwabcAyBgNBAXOCVL/P4Lsm38uQp46QI1bUyHjhAmpQGJcgWPxdEVx0V8O2M5JcGmVksEVsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882332; c=relaxed/simple;
	bh=mcDuyv5VV8y1u8HIkjifl6NSJsYbz2oQBovItDT06wU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZKnl9Skzp6wwTK9Dubs9fRnkheY4bCEL70qwaxQZS5FiEPJ89R16IpLhhuQ5J1B7UD0MGGAodAx74Vj4FgM+ySZTXJpMjOzbjWCuKRJLK2HYtM6BQZ9eoM439ZAP4pyzrj8Qt15WK6T8TluZkb5srhJelxS+BIhW9QKr1dIRJMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=kuFIYKS+; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="kuFIYKS+"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1882919f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791882328; x=1792487128; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iZjRkbq5W/7t5bYSMSsHGWHFlPOzNbExBo1Z2x1DxZ0=;
        b=kuFIYKS+z25bs0Gwjcq62NEOIl0fnSOlXxjRpd73ZrRd3MxzR3/SJNnu+J4lbqBEQg
         pKLozfQUZYNtb+8GGFxAkaRFDQp02daD3/aY4j1iZjdO+D5LQG98ZGoc6HvGDGIL/7BK
         0aiO/TXZjW5iGlQBCr4TXGXuVxiaw7ZghirkHlg+47rnI28k2lGXjUUPf5Cs8CxNJWQ2
         hrVcK43BF7DzUjREfqmBdHz1hg5Dsif/jtqjpcOAMA7VX35dsPkShIG24szs4zk4PcvC
         mcVcPUdAs85jicDF/6lckhuxNPZcBgJH2Lw63uIFoLMaGDFcLRki3xHf2h6IxWQBFzu3
         UYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791882328; x=1792487128;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iZjRkbq5W/7t5bYSMSsHGWHFlPOzNbExBo1Z2x1DxZ0=;
        b=V7lASEVyP8jGAc9zFUvtjGtd+GQrQNJhnpCd2HHdWJ7Jd8vOoF8jGB80kDIKqMpsnI
         2yezIBT6UEvXp3HLjVgTJxIf8OafN2/V0Dov6j6en0ZDfW46yPI82ZQOhncqRDV67INg
         yZlsz8AHgXm0IRscePcTEtSYQ+BgwYUQlSQ0qyFBKde8DSM1L35jjuooEma3FgARv/3C
         vj8kWaTK63Rp4h/5YY/b+JD9rPao3d02vtO9oXbr/ikyitsiwQJiYKdxojLrvFcNq7pl
         IkKwuaQxZYulkzU2+kbeF8cmoQ/OaEJuvP/2d+gqU+4EnyFMJy43f4liv3jsdhSL2jQK
         bIAw==
X-Forwarded-Encrypted: i=1; AKwUvByblCKAJCCzC4FlffwW9JXnBEeAr3NFBlrVCVRYD35hXVt1/K5hIQlNuXs8U5iHfECX/u3jT0+ykKiGf4w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPQ7oAEvrQq0Xhqrw0SbkbYXRp19kfi6R7r65MSRIMnU1GVr+h
	cOX+Mb94oOcmB8iD2vB80RoGKRJfFasZWWLHza5nof/K2uOmsO2s3i2mJPEo4uL6now=
X-Gm-Gg: AYBFou1PAhz3yh30NYadc0AbLf1ytaGKsq+wFNHuHblLJ8Ks89GYhjKrsSoCY+JV68J
	phfNR5DCCqxwrRTENTDJETNEHtRO6eHikmvqx0p/qNzglfN4x3qGeeQ95sEO4Q+e8emRi2xfTlc
	1TTV/jPcdewin2NBHzFfN0QMofbTK8oIXcIa6U/DL1bRRpqe3PNaYB0Tu7E1X0iuBQuJ1Bi9+5z
	SOPR55ooD0znHidcaYBSkMvKn2LXKBqel1UIq5ZHst4Ah6SAv9jiALOEt4DmCa4GkZ4ynUHydR8
	Emk7YDNeVG7JHpHdyK29yR0uawBnWzL/lOsopLa1nSzC9uQah/3vd+O82CnVj2FZDj+vMiqkXFP
	2yJsbN0VViyjXM9YN2PQa3BDo2RHt1jEM+ApmCsIHScgU+5Bs5NpRjQ1LWox1x2mOYvrXospknO
	nQ7LdT8ynR9YlhuLXWSh8aO1Uj0ckMJTKc65+vXzPHRskr4+azqq8+GOzZhVGf5Mk0GrP/PI/Br
	J86/71+Jf2z4EPyVA==
X-Received: by 2002:a05:6000:40e0:b0:48c:6a4d:3b67 with SMTP id ffacd0b85a97d-48dbaceb433mr22277898f8f.19.1791882328049;
        Tue, 13 Oct 2026 02:05:28 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab6361sm3495503f8f.32.2026.10.13.02.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:05:27 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v6 05/15] clk: starfive: Add JHB100 System-0 clock
 generator driver
In-Reply-To: <ZQ4PR01MB1202DE124DED06ECEC948B89F29E2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <20261008123338.11081-6-changhuang.liang@starfivetech.com>
 <179180050742.66744.1321848308971146208.b4-review@b4>
 <ZQ4PR01MB1202DE124DED06ECEC948B89F29E2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Date: Tue, 13 Oct 2026 11:05:26 +0200
Message-ID: <1jzewiezs9.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mar. 13 oct. 2026 at 05:29, Changhuang Liang <changhuang.liang@starfivetech.com> wrote:

> Hi, Jerome
>
>> > Add support for JHB100 System-0 clock generator (SYS0CRG).
>> >
>> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>> > ---
>> >  MAINTAINERS                                   |   7 +
>> >  drivers/clk/starfive/Kconfig                  |  10 ++
>> >  drivers/clk/starfive/Makefile                 |   2 +
>> >  .../clk/starfive/clk-starfive-jhb100-sys0.c   | 156 ++++++++++++++++++
>> >  4 files changed, 175 insertions(+)
>> >  create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-sys0.c
>> >
>> > diff --git a/MAINTAINERS b/MAINTAINERS index
>> > 66d6c15f1dd2..dff8b819f83e 100644
>> > --- a/MAINTAINERS
>> > +++ b/MAINTAINERS
>> > @@ -26217,6 +26217,13 @@ F:
>> 	Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
>> >  F:	drivers/phy/starfive/phy-jh7110-pcie.c
>> >  F:	drivers/phy/starfive/phy-jh7110-usb.c
>> >
>> > +STARFIVE JHB100 CLOCK DRIVERS
>> > +M:	Changhuang Liang <changhuang.liang@starfivetech.com>
>> > +S:	Supported
>> > +F:	Documentation/devicetree/bindings/clock/starfive,jhb1*.yaml
>> > +F:	drivers/clk/starfive/clk-starfive-jhb1*
>> > +F:	include/dt-bindings/clock/starfive,jhb1*.h
>> > +
>> >  STARFIVE JHB100 EXTERNAL INTERRUPT CONTROLLER DRIVER
>> >  M:	Changhuang Liang <changhuang.liang@starfivetech.com>
>> >  S:	Supported
>> > diff --git a/drivers/clk/starfive/Kconfig
>> > b/drivers/clk/starfive/Kconfig index 51716655554f..cd5b7754403e 100644
>> > --- a/drivers/clk/starfive/Kconfig
>> > +++ b/drivers/clk/starfive/Kconfig
>> > @@ -72,3 +72,13 @@ config CLK_STARFIVE_JH7110_VOUT
>> >  	help
>> >  	  Say yes here to support the Video-Output clock controller
>> >  	  on the StarFive JH7110 SoC.
>> > +
>> > +config CLK_STARFIVE_JHB100_SYS0
>> > +	bool "StarFive JHB100 system-0 clock support"
>> > +	depends on ARCH_STARFIVE || COMPILE_TEST
>> > +	select CLK_STARFIVE_JH71X0
>> > +	select RESET_STARFIVE_JHB100 if RESET_CONTROLLER
>> 
>> just imply RESET_STARFIVE_JHB100 ?
>> 
>> It can be disabled if RESET_CONTROLLER is not set, so it is kind of weak
>> already.
>> 
>> > +	default ARCH_STARFIVE
>> > +	help
>> > +	  Say yes here to support the system-0 clock controller on the
>> > +	  StarFive JHB100 SoC.
>> > diff --git a/drivers/clk/starfive/Makefile
>> > b/drivers/clk/starfive/Makefile index 199ac0f37a2f..d2ba83d7d02c
>> > 100644
>> > --- a/drivers/clk/starfive/Makefile
>> > +++ b/drivers/clk/starfive/Makefile
>> > @@ -10,3 +10,5 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_AON)	+=
>> clk-starfive-jh7110-aon.o
>> >  obj-$(CONFIG_CLK_STARFIVE_JH7110_STG)	+= clk-starfive-jh7110-stg.o
>> >  obj-$(CONFIG_CLK_STARFIVE_JH7110_ISP)	+= clk-starfive-jh7110-isp.o
>> >  obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+=
>> clk-starfive-jh7110-vout.o
>> > +
>> > +obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+=
>> clk-starfive-jhb100-sys0.o
>> > diff --git a/drivers/clk/starfive/clk-starfive-jhb100-sys0.c
>> > b/drivers/clk/starfive/clk-starfive-jhb100-sys0.c
>> > new file mode 100644
>> > index 000000000000..edab54f228ad
>> > --- /dev/null
>> > +++ b/drivers/clk/starfive/clk-starfive-jhb100-sys0.c
>> > @@ -0,0 +1,156 @@
>> > +// SPDX-License-Identifier: GPL-2.0
>> > +/*
>> > + * StarFive JHB100 System-0 Clock Driver
>> > + *
>> > + * Copyright (C) 2024 StarFive Technology Co., Ltd.
>> > + *
>> > + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
>> > + *
>> > + */
>> > +
>> > +#include <dt-bindings/clock/starfive,jhb100-crg.h>
>> > +#include <linux/init.h>
>> > +#include <linux/platform_device.h>
>> > +
>> > +#include "clk-starfive-jh71x0.h"
>> > +
>> > +#define JHB100_SYS0CLK_NUM_CLKS
>> 	(JHB100_SYS0CLK_GPU1_NCNOC_INIT + 1)
>> > +
>> > +/* external clocks */
>> > +#define JHB100_SYS0CLK_OSC
>> 	(JHB100_SYS0CLK_NUM_CLKS + 0)
>> > +#define JHB100_SYS0CLK_PLL0
>> 	(JHB100_SYS0CLK_NUM_CLKS + 1)
>> > +#define JHB100_SYS0CLK_PLL1
>> 	(JHB100_SYS0CLK_NUM_CLKS + 2)
>> > +#define JHB100_SYS0CLK_PLL2
>> 	(JHB100_SYS0CLK_NUM_CLKS + 3)
>> 
>> Does this mean that if the you ever find out you've forgot an internal clock
>> (which does happen fairly often) the whole external block will shift ?
>> 
>
> Later, I will introduce the following macros to define the external clock, which can avoid this problem.
>
> #define JH71X0_EXT_CLK_FLAG	BIT(15)
> #define JH71X0_EXT_CLK(_n) 	(JH71X0_EXT_CLK_FLAG | (_n))
>

hummm okay ... still seems hackish to me.

>

-- 
Jerome
