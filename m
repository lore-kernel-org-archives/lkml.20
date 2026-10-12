Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78BD42E007
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791800541; cv=none; b=TuVDWr0BwlTuoySQgDJbA65tneAxOi33y41ly8Y0xIu46O1fQYLcEmThy90PEul9K2nhXt9F2KsVoc5FeXPUPxnCXXYY3Y5/7wbp+MTO6x/Gfr9JlrcGPRlfH76zi4L/460U1DSHDlS6xOpZAhyzZ+NLktY6l0FcyNo+kpj+BAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791800541; c=relaxed/simple;
	bh=tFLGoMHM+YmatgXDpuz/rj3x/WCsWzUXd015rn8gH3o=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=mzRWO97ZFGOKHjW49eNgYxKI5DBRPIRMfirj5zcoaZ2ZppW9AJDnm3m+9Ztdl/vriRCVC+rgQWA7tmHW1Ci47BTnxamHSFhqAc/ZTHiA7ptLIIAt5InQT+qRyKUHUhZUGV/yJnLkQkyExa2bbUpakLWAqxu/y8u7ZV0KlHrIxE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=IDqFk5uD; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="IDqFk5uD"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48afe75f055so1606187f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791800522; x=1792405322; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DuaQjF779FLWW5Q7e9PrJle5aNrB9tweNNuseFSzYZk=;
        b=IDqFk5uDDYL72ZcsnCO9c25+lsqxuhvZ/A/HcaMqV/ZKrilKjTQvnsiRFNB3YBgJZg
         1i+Na9Vd6oc13QOrIZ7i2wq4/vQQQBTjwRmnSvvFfOoF8LS7Jiu/44eFBfndenQQy1eI
         y/Sl68iDbeQFQg3W8KYahz9Ab4I9xPuaDEc6lOgHaONdrBAklL/fjs3crHiHfk464JCv
         D8QCDKNCv96vbkie8CrkgCi+EkwHS8SJ3LXgqnM0LvGYe/FmSPpss0NmF/Ace4AJS44X
         9hZQqp6cM0LjPMsQkaXVKwi+71eZ7hYdikTCAuXZoF05wem7Z01azYOOGol0Mld37Lhv
         5Jig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791800522; x=1792405322;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DuaQjF779FLWW5Q7e9PrJle5aNrB9tweNNuseFSzYZk=;
        b=TXgCksRngDzsVHZrW471t7a3eJPcgl2I6somvXCyUhgiezOcHtky3osdEdC5dV/uP6
         Prrxc5rfLeJbg7JzFCYXDmWafKSqNXLg7N7UPekTR23iL7nmfkEGWeME8TnYykS/IzUZ
         /uXFfzbfmhvDByzSbK1JXGP9DeViRTBbVhUBjfnJOYo6xoRX1UwdujB2EjgbRHW4fehU
         HTBmJLSP/lokf0/HPLHjW1YAS9bIsD5CmdszScxyXCTGGkYYtF+z6tAxx1tfKVIbxYyY
         IIf62NpqC3XaSIC8IMSQrYAH8i72Jv2hxL/rkGh88pULxz73PwsWIUPzD34VCLqpfTDE
         WI9w==
X-Forwarded-Encrypted: i=1; AKwUvByApE8smFKxvaQBKMz+vBBdvfJvPn3U6oT8uoHA/qiUt5pA2tpVnL4Bgx4aARNu3uZHa7bijFZT4lN0/uM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVh3M8oP5GMJsjslTeHBZDcuI+lvPySulGqYfGzJoA/Bo0ACub
	Df7FUrGZQrIN3Z1iPFJ5KIqXNsdb4X2COvqTeB7Iuhy3pAqY6qBUyxQgcKkB3iPqOPWb8oX/6RY
	ze/I26K4=
X-Gm-Gg: AYBFou0n2LHo8zOsk7WsGGQD0TogMHv2ZlEIO9/nMaV0yGXYfGUxpvh55+7aa4adpuC
	ogBsG8aCfn16tCxVBbEqIIn1zXlSXw6PjDl5vyCihWMUJPX6wc1nSJJ6F61jlsHXViJPhw01bd9
	S7t4YD9HICVpDkL//pLy2wBJ2CRzact7qA1W0LnkQXyjAx56jf4NuZmnyrdQAdkx5V64+y03fwr
	vLR0Zih7FBpP6fLJKyNbEt0SDV61iNGnLSVeZck1S6V/U2pbcEfkYLlImWYt0DPT8PQDpX0t1z3
	Zpta8ez7EUk//oaEfIcD2Z4+0cHCt+SZiKPu52I67Qb7bPhjB0UFF5+i89bzWGoA57I4k/Xz32c
	g4Lp5oGxWFFrU4aXSPLYo/9pS+oFIRjLsetMriGA3crOimIdGwyxxNEgkvfhHYuh8X1l//f0Wji
	2g0pOgep3gZmqpxIFCFV5xIkTgc4z0jhyUDzWBuaSrg6DRzZTP+uIXW7PPqKHpLx0VzdZuWAVVb
	zbhgxmVQxwXcJNaHg==
X-Received: by 2002:a05:600c:c092:b0:4a1:9831:a69c with SMTP id 5b1f17b1804b1-4a19831a9f7mr65008085e9.30.1791800521413;
        Mon, 12 Oct 2026 03:22:01 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19c8244edsm109630595e9.2.2026.10.12.03.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:22:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 07/15] clk: starfive: Add JHB100 System-2 clock
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
In-Reply-To: <20261008123338.11081-8-changhuang.liang@starfivetech.com>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <20261008123338.11081-8-changhuang.liang@starfivetech.com>
Date: Mon, 12 Oct 2026 12:21:47 +0200
Message-Id: <179180050742.66744.9435488912757103428.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7093; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=tFLGoMHM+YmatgXDpuz/rj3x/WCsWzUXd015rn8gH3o=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlntuyXffs3XURqndmJ5MfqwdLG4leD326/V2p0vnNFz
 U/5+2qOHaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZjI3L+MDL+EnipqNVsYPn8V
 7qZeNpP5ndXvK7NK3z7sSLwu1B7u7sLwP/dOaHDAHbXe4MxPv36H1J2eePjMhG+q949LXnThOW/
 lzggA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Add support for JHB100 System-2 clock generator (SYS2CRG).
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/clk/starfive/Kconfig                  |  10 ++
>  drivers/clk/starfive/Makefile                 |   1 +
>  .../clk/starfive/clk-starfive-jhb100-sys2.c   | 135 ++++++++++++++++++
>  3 files changed, 146 insertions(+)
>  create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-sys2.c
>
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> index 11da8bcc4046..cfaac934a8e0 100644
> --- a/drivers/clk/starfive/Kconfig
> +++ b/drivers/clk/starfive/Kconfig
> @@ -92,3 +92,13 @@ config CLK_STARFIVE_JHB100_SYS1
>  	help
>  	  Say yes here to support the system-1 clock controller on the
>  	  StarFive JHB100 SoC.
> +
> +config CLK_STARFIVE_JHB100_SYS2
> +	bool "StarFive JHB100 system-2 clock support"
> +	depends on ARCH_STARFIVE || COMPILE_TEST
> +	select CLK_STARFIVE_JH71X0
> +	select RESET_STARFIVE_JHB100 if RESET_CONTROLLER
> +	default ARCH_STARFIVE
> +	help
> +	  Say yes here to support the system-2 clock controller on the
> +	  StarFive JHB100 SoC.
> diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
> index 0061550e0f7e..29cdef20575e 100644
> --- a/drivers/clk/starfive/Makefile
> +++ b/drivers/clk/starfive/Makefile
> @@ -13,3 +13,4 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+= clk-starfive-jh7110-vout.o
>  
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+= clk-starfive-jhb100-sys0.o
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS1)		+= clk-starfive-jhb100-sys1.o
> +obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS2)		+= clk-starfive-jhb100-sys2.o
> diff --git a/drivers/clk/starfive/clk-starfive-jhb100-sys2.c b/drivers/clk/starfive/clk-starfive-jhb100-sys2.c
> new file mode 100644
> index 000000000000..405f45a3042a
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jhb100-sys2.c
> @@ -0,0 +1,135 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * StarFive JHB100 System-2 Clock Driver
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
> +#define JHB100_SYS2CLK_NUM_CLKS			(JHB100_SYS2CLK_MAIN_ICG_EN_JTAG1 + 1)
> +
> +/* external clocks */
> +#define JHB100_SYS2CLK_OSC			(JHB100_SYS2CLK_NUM_CLKS + 0)
> +#define JHB100_SYS2CLK_PLL1			(JHB100_SYS2CLK_NUM_CLKS + 1)
> +#define JHB100_SYS2CLK_GPU0_NCNOC_INIT		(JHB100_SYS2CLK_NUM_CLKS + 2)
> +#define JHB100_SYS2CLK_GPU1_NCNOC_INIT		(JHB100_SYS2CLK_NUM_CLKS + 3)
> +
> +static const char * const jhb100_sys2_ext_clk[] = {
> +	"osc",
> +	"pll1",
> +	"gpu0_ncnoc_init",
> +	"gpu1_ncnoc_init",
> +};
> +
> +/*
> + * Regarding the CLK_IS_CRITICAL flag:
> + *   Clocks flagged CLK_IS_CRITICAL feed logic that has to keep running whether
> + *   or not a consumer holds them, such as the bus interconnect and always-on
> + *   blocks. Gating them hangs the system, so they must never be disabled.
> + */
> +static const struct jh71x0_clk_data jhb100_sys2crg_clk_data[] = {
> +	/* jtag mst*/
> +	JH71X0__DIV(JHB100_SYS2CLK_JTAGM0_HCLK, "jtagm0_hclk", 6,
> +		    JHB100_SYS2CLK_PLL1),
> +	JH71X0__DIV(JHB100_SYS2CLK_JTAGM1_HCLK, "jtagm1_hclk", 6,
> +		    JHB100_SYS2CLK_PLL1),
> +	JH71X0__DIV(JHB100_SYS2CLK_JTAGM0_ATPG, "jtagm0_atpg", 12,
> +		    JHB100_SYS2CLK_PLL1),
> +	JH71X0__DIV(JHB100_SYS2CLK_JTAGM1_ATPG, "jtagm1_atpg", 12,
> +		    JHB100_SYS2CLK_PLL1),
> +	JH71X0__DIV(JHB100_SYS2CLK_JTAGM0_ATPG_TCLOCK, "jtagm0_atpg_tclock", 2,
> +		    JHB100_SYS2CLK_JTAGM0_ATPG),
> +	JH71X0__DIV(JHB100_SYS2CLK_JTAGM1_ATPG_TCLOCK, "jtagm1_atpg_tclock", 2,
> +		    JHB100_SYS2CLK_JTAGM1_ATPG),
> +	JH71X0_GATE(JHB100_SYS2CLK_JTAG0_MST_WRAP_HCLK, "jtag0_mst_wrap_hclk",
> +		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM0_HCLK),
> +	JH71X0_GATE(JHB100_SYS2CLK_JTAG0_MST_WRAP_CLK_JTAG, "jtag0_mst_wrap_clk_jtag",
> +		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM0_HCLK),
> +	JH71X0_GATE(JHB100_SYS2CLK_JTAG0_MST_WRAP_APB_PCLK, "jtag0_mst_wrap_apb_pclk",
> +		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM0_ATPG),
> +	JH71X0_GATE(JHB100_SYS2CLK_JTAG0_MST_WRAP_ATPG_TCLOCK, "jtag0_mst_wrap_atpg_tclock",
> +		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM0_ATPG),
> +	JH71X0_GATE(JHB100_SYS2CLK_JTAG1_MST_WRAP_HCLK, "jtag1_mst_wrap_hclk",
> +		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM1_HCLK),
> +	JH71X0_GATE(JHB100_SYS2CLK_JTAG1_MST_WRAP_CLK_JTAG, "jtag1_mst_wrap_clk_jtag",
> +		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM1_HCLK),
> +	JH71X0_GATE(JHB100_SYS2CLK_JTAG1_MST_WRAP_APB_PCLK, "jtag1_mst_wrap_apb_pclk",
> +		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM1_ATPG),
> +	JH71X0_GATE(JHB100_SYS2CLK_JTAG1_MST_WRAP_ATPG_TCLOCK, "jtag1_mst_wrap_atpg_tclock",
> +		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM1_ATPG),

It is really wise to leave the JTAG clocks ON by default ?
There should at least be a comment explaining this. Maybe the device on the field should
disable this clock in the bootloader or something.

> +	/* hostusbcmn */
> +	JH71X0__DIV(JHB100_SYS2CLK_HOSTUSB_NCNOC_TARG, "hostusb_ncnoc_targ", 12,
> +		    JHB100_SYS2CLK_PLL1),
> +	JH71X0__DIV(JHB100_SYS2CLK_HOSTUSBCMN_CFG_500, "hostusbcmn_cfg_500", 4,
> +		    JHB100_SYS2CLK_PLL1),
> +	/* bmcperiph1 */
> +	JH71X0__DIV(JHB100_SYS2CLK_BMCPER1_NCNOC_TARG, "bmcper1_ncnoc_targ", 6,
> +		    JHB100_SYS2CLK_PLL1),
> +	JH71X0__DIV(JHB100_SYS2CLK_BMCPER1_CFG_250, "bmcper1_cfg_250", 5,
> +		    JHB100_SYS2CLK_PLL1),
> +	JH71X0__DIV(JHB100_SYS2CLK_BMCPER1_CFG_143_DFT, "bmcper1_cfg_143_dft", 8,
> +		    JHB100_SYS2CLK_PLL1),
> +	JH71X0_GATE(JHB100_SYS2CLK_BMCPER1_CFG_143, "bmcper1_cfg_143", CLK_IS_CRITICAL,
> +		    JHB100_SYS2CLK_BMCPER1_CFG_143_DFT),
> +	/* bmcperiph0 */
> +	JH71X0__DIV(JHB100_SYS2CLK_BMCPER0_NCNOC_TARG, "bmcper0_ncnoc_targ", 6,
> +		    JHB100_SYS2CLK_PLL1),
> +	/* gpu0 */
> +	JH71X0__DIV(JHB100_SYS2CLK_GPU0_NCNOC_TARG, "gpu0_ncnoc_targ", 12,
> +		    JHB100_SYS2CLK_PLL1),
> +	JH71X0_GATE(JHB100_SYS2CLK_GPU0_BUS_CLK, "gpu0_bus_clk", CLK_IS_CRITICAL,
> +		    JHB100_SYS2CLK_GPU0_NCNOC_INIT),
> +	JH71X0_GATE(JHB100_SYS2CLK_GPU0_APB_CLK, "gpu0_apb_clk", CLK_IS_CRITICAL,
> +		    JHB100_SYS2CLK_GPU0_NCNOC_TARG),
> +	JH71X0_GATE(JHB100_SYS2CLK_GPU0_OSC_CLK, "gpu0_osc_clk", CLK_IS_CRITICAL,
> +		    JHB100_SYS2CLK_OSC),
> +	/* gpu1 */
> +	JH71X0__DIV(JHB100_SYS2CLK_GPU1_NCNOC_TARG, "gpu1_ncnoc_targ", 12,
> +		    JHB100_SYS2CLK_PLL1),
> +	JH71X0_GATE(JHB100_SYS2CLK_GPU1_BUS_CLK, "gpu1_bus_clk", CLK_IS_CRITICAL,
> +		    JHB100_SYS2CLK_GPU1_NCNOC_INIT),
> +	JH71X0_GATE(JHB100_SYS2CLK_GPU1_APB_CLK, "gpu1_apb_clk", CLK_IS_CRITICAL,
> +		    JHB100_SYS2CLK_GPU1_NCNOC_TARG),
> +	JH71X0_GATE(JHB100_SYS2CLK_GPU1_OSC_CLK, "gpu1_osc_clk", CLK_IS_CRITICAL,

No, I don't think a GPU clock is critical. A GPU usually has a driver.

-- 
Jerome

