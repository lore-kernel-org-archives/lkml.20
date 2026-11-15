Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794752319;
	b=NQX+Ea52hsm+sdHblRfWYRPlnDw9Pv3x5oDW0VvRCjVi5TFx7UMfPl8Donyj4UWL0IGE
	 Vvw/zVJtOTykhZvkMVD85yGVIAn+YUUVZbHWOkzEGbwpIkXeTK6aDS/+fOji+QKgQHmZo
	 GBO9Z3bYY+GWAaufH23dqT2gJFiwUbJHyw5OQ/ZP7tJNqKBYvGOM+qtY8B9BczyYAN7j4
	 Chfb3RsrhcrmaK6o4mUeCcskytusnpo2zDYN6Fo4u2o/kmcCnMkiej4xTG4JGx3P7BmRA
	 i9PjVUS9Fu5/PY4Bry5yzKlrSFAxRy63yTop9i4+LzaW8i5cyw0/iJu/bFMAclJBZ6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=eRXocFNPHTDFcDxqvK37Nsoc4c3iJpE3zFJQsev+8wc=;
	b=N6zt3MwYQgXGzEZnLKcJj+uicUKA7x9Zqpqov1aiZEQZEZnunvzjigZF33S0SRUh28PZ
	 ril0eBjLJDlNth9AEtCjNmIxGfZXWGuSde6dRo0nvemrkLX17XEQwgeOXk0eaBbuCUNqm
	 tx45eBOdVM88Lb/PlwJBH9f7l/+dwfv3MGhVbpM+RA/YlNPglBFJmrui8SPcHnky0RWSJ
	 KsXfRU4Rn0J/I/uO2fQVOFUspP8yuIzla2REi1epcsKWEuzaZ5KqOgFqrJkaF57n9iLOo
	 jfPjOj6dD/Su95cwfe5uxql7Xij49G5J8fGDRdBE+4ad1I8o2oivmc5aRonFr2pJL/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=P5RIs5Wq;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3895E606A336
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3895E606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=P5RIs5Wq
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4918c2d727fso1325320f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794752317; x=1795357117; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eRXocFNPHTDFcDxqvK37Nsoc4c3iJpE3zFJQsev+8wc=;
        b=P5RIs5WqvBJXJys4r64Vc9p4f4XQ8vj0mv1u3YgepuRR+IQkicaqErb/VrktUy5M3T
         EfwJF1KIdRVJbWBDzcilsBgTMjE+SX90teSuqBAKpagjgrJKg1rugGz+v8If1LWvbGNQ
         +yo46DY5w/PolyHmv0kEbExE6iZPyH31nSqxspsxMx1tUPjviSCMrH+A2da8WGe/xw0K
         x1aH5zR9W26ndXrv5rfy3c0DuMEGA8p12+2OB8L719NZuBtAIs50GMV3M0z2nplvYu51
         noZHs3xQCY9jIEGGBrJxQXSj8KMz7V29AwWRvJMJlt+dcDTlzbWsqF4Vnn/q2vkxV524
         vwqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794752317; x=1795357117;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eRXocFNPHTDFcDxqvK37Nsoc4c3iJpE3zFJQsev+8wc=;
        b=fvZHpLHQRe2ZHZlCrWaNE7BqFpNlqnbQ9GLB9/RYsBNxC5eAby1RMkQXywZTNJhqsL
         Z1C9sAoefTzcn8c5oXkiij7D97PvrMSJNNPxgze3Zyg58T5vSZrInUeSXdLcmoQ6BqPe
         Y3qjeq4COzjlwHRbKghlUiCEsYzuP/4oahD6X2SU7iwpp7FhAwfHedI3pJkCpNK16vXp
         niWm19PtJA5Mf1bOi5fzdON3/PnR9DJH98QIjlT98tmsx6jYm6jXsNnzGnqmQaaGjHgO
         oeCNmXfIZao3wws1p3QLPBHk5x2WVb403YINYAdgNs1g6qjX+SRnicm2SnNTgq2EcVEc
         76kA==
X-Forwarded-Encrypted: i=1; AL+hErEKoFvjhf3CO7Q3ORtgYt+O4kM9wOMLc1g0rQ8Ob/JMQv2UG7+eo5eMAP00UwaO73D20qrROVNOPigwSjA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8284ZN3hMgK65uz8BufFWteST8p7nou7huAM+w2xgfVSX987DP
	b1SEMp6xS++jGSxAreFlByLYBz+9rXpUP3NWBVPMJWVRCxxOJiO1PYlBOch73+Vqxvo=
X-Gm-Gg: AYBFou2Ozir9ZgOsIWTiwRU6mNdVqA64Wb+cwBSZPQnJgd1HlgD0KopYg5Rjw12DAJ2
	I25utFxSQ7VpOgmcSr6HCRmSRYL/r3TDXrvDC+HRMogc450HlcBNmgmK1qC69EQjjG1CKFxRtBl
	TucFc2tarWUA1MIESelTH8Bq08u79TWqqGyt/MZxg3UmquJXpcEQCkF7uNkLJCtT2Jn8h/V6Kw2
	Z5PK3t49ZEnLgnAhfTymMCfDlQT20qNncwMxSH9VIQGfUH51l8oB2mTVi9YO07CknMtf+JIka+9
	rkNs7QUaZ1XMCD2VtqoOAxbSTg5HQ3HE0Xoq90c2ARWYqwVVlVVHFM2kbO8y5WVyWWjm1ofSWrT
	I4mZNdZrvap42lUbSNMDRFeftkswUywk3q+lpQwOVPypZoafBmhPq5VvQTBsc5xZqeUX3EeQRGq
	No5F75y0gchmzk7fOZabkqxdVK9M2I5pYIBQaxyi3GZAU3E5tSeJlwxHGK+lKvjygdgLAHJUclV
	udTbmxebCxTA2+pUoQ83Nhgrr8LZeLnkrNkQgKEMRdpynAy9qdh8q2EqdfPiEe/4ICbWiHpWuT1
	Re672xh6MDkJqcyuLatHQkgeFi/Nd5OFAMNdBu6wTy5ux/3R
X-Received: by 2002:a05:6000:18ac:b0:48e:68d5:818d with SMTP id ffacd0b85a97d-49c70ed9222mr16798800f8f.16.1794752317494;
        Sun, 15 Nov 2026 06:18:37 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6934sm16286752f8f.48.2026.11.15.06.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:18:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v1 4/6] clk: starfive: Add JHB100 System-0 clock
 generator driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20261013102707.9207-5-changhuang.liang@starfivetech.com>
References: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
 <20261013102707.9207-5-changhuang.liang@starfivetech.com>
Date: Sun, 15 Nov 2026 15:18:28 +0100
Message-Id: <179475230833.3873592.8310507156583636155.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8368; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=TxbedSC4eUXLevyLtulFrGyDmY5zaUcSjNZDAxD2f5s=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFk/95uXva9fbZTEol5vsL2et+fTt40MLvvvLzzdOSt/E
 7N6gahhRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACbiJ83wh9tgx62r1x/0HPul
 KDrNh9M+8s1b1ulZF2e5dFxZ0PgiaAojw70re5WL5PYwvuHQ0zxU9OYyp0IoGwO7RMukZ60vayv
 rOQA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Add support for JHB100 System-0 clock generator (SYS0CRG).
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  MAINTAINERS                                   |   7 +
>  drivers/clk/starfive/Kconfig                  |  10 ++
>  drivers/clk/starfive/Makefile                 |   2 +
>  .../clk/starfive/clk-starfive-jhb100-sys0.c   | 148 ++++++++++++++++++
>  4 files changed, 167 insertions(+)
>  create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-sys0.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb315065..f66998e8eb64 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26837,6 +26837,13 @@ F:	Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
>  F:	drivers/phy/starfive/phy-jh7110-pcie.c
>  F:	drivers/phy/starfive/phy-jh7110-usb.c
>  
> +STARFIVE JHB100 CLOCK DRIVERS
> +M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> +S:	Supported
> +F:	Documentation/devicetree/bindings/clock/starfive,jhb1*.yaml
> +F:	drivers/clk/starfive/clk-starfive-jhb1*
> +F:	include/dt-bindings/clock/starfive,jhb1*.h
> +
>  STARFIVE JHB100 EXTERNAL INTERRUPT CONTROLLER DRIVER
>  M:	Changhuang Liang <changhuang.liang@starfivetech.com>
>  S:	Supported
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> index 51716655554f..cb246ae12c08 100644
> --- a/drivers/clk/starfive/Kconfig
> +++ b/drivers/clk/starfive/Kconfig
> @@ -72,3 +72,13 @@ config CLK_STARFIVE_JH7110_VOUT
>  	help
>  	  Say yes here to support the Video-Output clock controller
>  	  on the StarFive JH7110 SoC.
> +
> +config CLK_STARFIVE_JHB100_SYS0
> +	bool "StarFive JHB100 system-0 clock support"
> +	depends on ARCH_STARFIVE || COMPILE_TEST
> +	select CLK_STARFIVE_JH71X0
> +	imply RESET_STARFIVE_JHB100
> +	default ARCH_STARFIVE
> +	help
> +	  Say yes here to support the system-0 clock controller on the
> +	  StarFive JHB100 SoC.
> diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
> index 199ac0f37a2f..d2ba83d7d02c 100644
> --- a/drivers/clk/starfive/Makefile
> +++ b/drivers/clk/starfive/Makefile
> @@ -10,3 +10,5 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_AON)	+= clk-starfive-jh7110-aon.o
>  obj-$(CONFIG_CLK_STARFIVE_JH7110_STG)	+= clk-starfive-jh7110-stg.o
>  obj-$(CONFIG_CLK_STARFIVE_JH7110_ISP)	+= clk-starfive-jh7110-isp.o
>  obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+= clk-starfive-jh7110-vout.o
> +
> +obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+= clk-starfive-jhb100-sys0.o
> diff --git a/drivers/clk/starfive/clk-starfive-jhb100-sys0.c b/drivers/clk/starfive/clk-starfive-jhb100-sys0.c
> new file mode 100644
> index 000000000000..dd4d65f4e682
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jhb100-sys0.c
> @@ -0,0 +1,148 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * StarFive JHB100 System-0 Clock Driver
> + *
> + * Copyright (C) 2024 StarFive Technology Co., Ltd.
> + *
> + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> + *
> + */
> +
> +#include <dt-bindings/clock/starfive,jhb100-crg.h>
> +#include <linux/init.h>
> +#include <linux/platform_device.h>
> +
> +#include "clk-starfive-jh71x0.h"
> +
> +/* external clocks */
> +#define JHB100_SYS0CLK_OSC			JH71X0_EXT_CLK(0)
> +#define JHB100_SYS0CLK_PLL0			JH71X0_EXT_CLK(1)
> +#define JHB100_SYS0CLK_PLL1			JH71X0_EXT_CLK(2)
> +#define JHB100_SYS0CLK_PLL2			JH71X0_EXT_CLK(3)
> +
> +static const char * const jhb100_sys0_ext_clk[] = {
> +	"osc",
> +	"pll0",
> +	"pll1",
> +	"pll2",
> +};

These are the hackish part I was referring to.

> +
> +static const struct jh71x0_clk_data jhb100_sys0crg_clk_data[] = {
> +	/* bmcpcierp */
> +	JH71X0__DIV(JHB100_SYS0CLK_BMCPCIERP_NCNOC_MAIN, "bmcpcierp_ncnoc_main", 6,
> +		    JHB100_SYS0CLK_PLL0),
> +	JH71X0__DIV(JHB100_SYS0CLK_BMCPCIERP_NCNOC_CFG, "bmcpcierp_ncnoc_cfg", 12,
> +		    JHB100_SYS0CLK_PLL1),
> +	JH71X0__DIV(JHB100_SYS0CLK_PCIE_REF_CML, "pcie_ref_cml", 24,
> +		    JHB100_SYS0CLK_PLL0),
> +	JH71X0_GATE(JHB100_SYS0CLK_BMCPCIERP_NCNOC_DATA_INIT, "bmcpcierp_ncnoc_data_init",
> +		    0, JHB100_SYS0CLK_BMCPCIERP_NCNOC_MAIN),

I think the v6 that came before this had a bunch of critical clocks. None of those were critical after all ?
You did test without passing clk_ignore_unused in the boot arguments ?

> +	JH71X0_GATE(JHB100_SYS0CLK_BMCPCIERP_NCNOC_CFG_INIT, "bmcpcierp_ncnoc_cfg_init",
> +		    0, JHB100_SYS0CLK_BMCPCIERP_NCNOC_CFG),
> +	JH71X0_GATE(JHB100_SYS0CLK_BMCPCIERP_NCNOC_TARG, "bmcpcierp_ncnoc_targ",
> +		    0, JHB100_SYS0CLK_BMCPCIERP_NCNOC_MAIN),
> +	JH71X0_GATE(JHB100_SYS0CLK_BMCPCIERP_PCU, "bmcpcierp_pcu", 0, JHB100_SYS0CLK_OSC),
> +	/* hostss0 */
> +	JH71X0__DIV(JHB100_SYS0CLK_HOSTSS0_NCNOC_CFG, "hostss0_ncnoc_cfg", 12,
> +		    JHB100_SYS0CLK_PLL1),
> +	JH71X0__DIV(JHB100_SYS0CLK_HOSTSS0_NCNOC_DATA, "hostss0_ncnoc_data", 6,
> +		    JHB100_SYS0CLK_PLL0),
> +	JH71X0__DIV(JHB100_SYS0CLK_HOSTSS0_PHY_SCAN_400, "hostss0_phy_scan_400", 6,
> +		    JHB100_SYS0CLK_PLL0),
> +	JH71X0__DIV(JHB100_SYS0CLK_GPIO_ESPI0_EXT, "gpio_espi0_ext", 14,
> +		    JHB100_SYS0CLK_PLL2),
> +	/* bmcusb */
> +	JH71X0__DIV(JHB100_SYS0CLK_BMCUSB_NCNOC_INIT, "bmcusb_ncnoc_init", 6,
> +		    JHB100_SYS0CLK_PLL0),
> +	JH71X0__DIV(JHB100_SYS0CLK_BMCUSB_NCNOC_TARG, "bmcusb_ncnoc_targ", 6,
> +		    JHB100_SYS0CLK_PLL1),
> +	JH71X0__DIV(JHB100_SYS0CLK_BMCUSB_SCANCLK, "bmcusb_scanclk", 5,
> +		    JHB100_SYS0CLK_PLL0),
> +	JH71X0_GATE(JHB100_SYS0CLK_BMCUSB_480M_SCANCLK, "bmcusb_480m_scanclk",
> +		    0, JHB100_SYS0CLK_BMCUSB_SCANCLK),
> +	/* vce */
> +	JH71X0__DIV(JHB100_SYS0CLK_VCE_NCNOC_INIT, "vce_ncnoc_init", 10,
> +		    JHB100_SYS0CLK_PLL0),
> +	JH71X0__DIV(JHB100_SYS0CLK_VCE_NCNOC_TARG, "vce_ncnoc_targ", 12,
> +		    JHB100_SYS0CLK_PLL1),
> +	/* bmcperiph2 */
> +	JH71X0__DIV(JHB100_SYS0CLK_BMCPER2_NCNOC_INIT, "bmcper2_ncnoc_init", 6,
> +		    JHB100_SYS0CLK_PLL0),
> +	JH71X0__DIV(JHB100_SYS0CLK_BMCPER2_NCNOC_TARG, "bmcper2_ncnoc_targ", 12,
> +		    JHB100_SYS0CLK_PLL1),
> +	JH71X0__DIV(JHB100_SYS0CLK_BMCPER2_CFG_400, "bmcper2_cfg_400", 8,
> +		    JHB100_SYS0CLK_PLL0),
> +	JH71X0__DIV(JHB100_SYS0CLK_BMCPER2_CFG_125, "bmcper2_cfg_125", 10,
> +		    JHB100_SYS0CLK_PLL1),
> +	/* hostss1 */
> +	JH71X0__DIV(JHB100_SYS0CLK_HOSTSS1_NCNOC_DATA, "hostss1_ncnoc_data", 6,
> +		    JHB100_SYS0CLK_PLL0),
> +	JH71X0__DIV(JHB100_SYS0CLK_HOSTSS1_PHY_SCAN_400, "hostss1_phy_scan_400", 6,
> +		    JHB100_SYS0CLK_PLL0),
> +	JH71X0_GATE(JHB100_SYS0CLK_HOSTSS1_PHY_SCAN_400_ICG_BUF,
> +		    "hostss1_phy_scan_400_icg_buf", 0,
> +		    JHB100_SYS0CLK_HOSTSS1_PHY_SCAN_400),
> +	/* npu */
> +	JH71X0__DIV(JHB100_SYS0CLK_NPU_NCNOC_INIT, "npu_ncnoc_init", 6,
> +		    JHB100_SYS0CLK_PLL0),
> +	/* vout */
> +	JH71X0__DIV(JHB100_SYS0CLK_VOUT_NCNOC_INIT, "vout_ncnoc_init", 6,
> +		    JHB100_SYS0CLK_PLL0),
> +	JH71X0__DIV(JHB100_SYS0CLK_VOUT_AUX, "vout_aux", 150,
> +		    JHB100_SYS0CLK_PLL0),
> +	/* bmcperiph3 */
> +	JH71X0__DIV(JHB100_SYS0CLK_BMCPER3_NCNOC_INIT, "bmcper3_ncnoc_init", 6,
> +		    JHB100_SYS0CLK_PLL0),
> +	/* hostusb */
> +	JH71X0__DIV(JHB100_SYS0CLK_HOSTUSB_NCNOC_INIT, "hostusb_ncnoc_init", 6,
> +		    JHB100_SYS0CLK_PLL0),
> +	/* hostusbcmn */
> +	JH71X0__DIV(JHB100_SYS0CLK_HOSTUSBCMN_CFG_480, "hostusbcmn_cfg_480", 5,
> +		    JHB100_SYS0CLK_PLL0),
> +	/* bmcperiph1 */
> +	JH71X0__DIV(JHB100_SYS0CLK_BMCPER1_NCNOC_INIT, "bmcper1_ncnoc_init", 6,
> +		    JHB100_SYS0CLK_PLL0),
> +	JH71X0__DIV(JHB100_SYS0CLK_BMCPER1_CFG_800, "bmcper1_cfg_800", 4,
> +		    JHB100_SYS0CLK_PLL0),
> +	/* bmcperiph0 */
> +	JH71X0__DIV(JHB100_SYS0CLK_BMCPER0_NCNOC_INIT, "bmcper0_ncnoc_init", 6,
> +		    JHB100_SYS0CLK_PLL0),
> +	JH71X0__DIV(JHB100_SYS0CLK_BMCPER0_CFG_400, "bmcper0_cfg_400", 8,
> +		    JHB100_SYS0CLK_PLL0),
> +	JH71X0__DIV(JHB100_SYS0CLK_BMCPER0_CFG_800, "bmcper0_cfg_800", 8,
> +		    JHB100_SYS0CLK_PLL0),
> +	/* gpu0 */
> +	JH71X0__DIV(JHB100_SYS0CLK_GPU0_NCNOC_INIT, "gpu0_ncnoc_init", 10,
> +		    JHB100_SYS0CLK_PLL0),
> +	/* gpu1 */
> +	JH71X0__DIV(JHB100_SYS0CLK_GPU1_NCNOC_INIT, "gpu1_ncnoc_init", 10,
> +		    JHB100_SYS0CLK_PLL0),
> +};
> +
> +static_assert(ARRAY_SIZE(jhb100_sys0crg_clk_data) <= JH71X0_EXT_CLK_FLAG);

This could go away too with the rework I have suggested.

-- 
Jerome

