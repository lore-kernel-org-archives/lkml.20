Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786883F5BEC
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791800539; cv=none; b=hzU3x4PJcBo+p+bApmQsVRFzPm9odiBrCPsDJPZt5Ddhf8SotETv9jjt0v1mCedmIoKzfpwm/5e0vUrCRucaMgFkVqiJJp76CmvKBOy6ZzMO8wDgAFXHPchR4EhV9ci9gh6l00k+txT4NIq3n5Rto5B9c8m44YhCkyl72ytzHCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791800539; c=relaxed/simple;
	bh=YyoMrHD861VVJe+iGivxq1ZHVntN1q/d1zW1Rds/nog=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=OGb8sC+e8K4mSNnNRFLZBpS1InFXm6/Rh4b9Zij5NNX4UEjMH4H+dz0dDNYkImDwasyjZbZPZAN79JL0sFhN8M7LjpWAlAwd8RcfxirKeedSolgGofNn/VZFdBUbxb/xGFMJtMUW/OLHsNxi0UiTjR1kUqRUP04/ESyWgbQ33YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=UnQ+2uOj; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="UnQ+2uOj"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a02718da81so12873975e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791800519; x=1792405319; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EQ8apU/TC78OUyWBg16BbmC/9tMwONU/mzWyf8HFPDg=;
        b=UnQ+2uOjBP0b8JyqsyuNCVx3/XpKzJNCx5bbY9/wpDBDRojFBSZqgmrg9bbTaEaFIB
         WurwYQCSXOlkTBNqMeKNRwrvHyh75dQjkDX2/IcjikTr3Y89pFlk4+igpg9x2dGXJrYq
         qHvRMsuszV3r3vp9+ky2xpC8NLKYMBUxK+hSn6axvaERtJWsVgpKhXo11y3RWlIKSSqB
         c9AaYW8yZM5IKmdFR/eOEwzwMawKUDmdKtVEmpBSNL3DmWWxxLwb4Z51I8bvgBjsX846
         CMLwf4pCZo9du88aGj083pW/w4TcAvLH4jCzUJ8XtqGU116dWfGxoUBfK2cuOslCE3mj
         rGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791800519; x=1792405319;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EQ8apU/TC78OUyWBg16BbmC/9tMwONU/mzWyf8HFPDg=;
        b=deXh1ORnuzEQ5BUEjM/g9JEjSt3O71SraaNCBc0q5Zjvd3JyHVawD9q1z0i1WihMZj
         Zi356npCOCEoyoffMPtIlus6ohimM3nyv/xgYA7XO01oYDQWaiaLD517MCpx41yAG2/8
         c16ciRpBwoIYjZ/ApEMwYy6V43a5gFNbJBH+/zOYBha05fPf1653JWZcPsL8s/qJ8xy5
         VmG5DfiTZa1xQDoOQZDXpgAyfC6h7sgrYlW8wuIQLUdAxDtkfRYIZcH8X0Wre0/Y1jv9
         +P5m8+bNlaHMpoSieFRZojj+fs6vAdYq5fOFx5tNHpCsd/uaeH4k3AsNYu32X5Q4EV8x
         c9GQ==
X-Forwarded-Encrypted: i=1; AKwUvBykeVNUGX3DjEeINgNy0q/5VKYZlQs/IZCG+/PGBs6m7Pllj9SCue1dxHOB5moZJvbexf7Vk4fTXUyAWs0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYnvyNa/3CPKrZW0EOooIRsA93rz6stZICP9mVHRwFEs6rzk2T
	7DMuG9iDtMKdL++iE2tHIELsWnxztnidlZMbqKYkop8HUoyVoQ9WGNv02ch/FuJCqfs=
X-Gm-Gg: AYBFou37R/D4Aan5OQH+zXEF1DuBThrhWt8M+gswMgjw/opOP/dZcituP3DqFT2mqLg
	1JuhG04mjAYMPbC4QF4KnfwRMSothdJG0Daa/BZuR7Pk0XWBeNW94J6+VuZcVHbe9UO5KeuU4Uj
	DPfW8s5xIa2sZLKfA0M4mYbpO0H3jZlxJ4SarOltyXUVlh/UzxZ6NFWOpCqbeWnEuP6z5kikG3E
	Ge+8iYcqjLtsfAo5L7abuQvK+OZ55Xrxh5PQm3SUe/aYbZrh3EpCw0zl4nnQxFYGju7MROYaL0X
	9ogJuEBNiUhCB09qFtF+IxhPOUvECUzLkp8Wj0pomuW6xhyWp1f/aaSJHJRQLAQiLG1F0ByH3RI
	1xrPqPk6z5sK5lqTxGpR7NhtWRHMWPxJaIw6kbwuz3qAaKB42dO1qS8wEL2eXqOs6Nyz3Z1ehr4
	8GMf6zz5mknx4c9wtNZ/OgYBw5ZsGZgJVzdFcMF/5RvggFWz6FjV8mT7t0BhT84MbTiKKwGYOHt
	8GevysarkUwRlfN+A==
X-Received: by 2002:a05:600c:1909:b0:4a0:2391:6529 with SMTP id 5b1f17b1804b1-4a18e4d3f12mr185023125e9.29.1791800519433;
        Mon, 12 Oct 2026 03:21:59 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a199e5db12sm157509785e9.2.2026.10.12.03.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:21:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 06/15] clk: starfive: Add JHB100 System-1 clock
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
In-Reply-To: <20261008123338.11081-7-changhuang.liang@starfivetech.com>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <20261008123338.11081-7-changhuang.liang@starfivetech.com>
Date: Mon, 12 Oct 2026 12:21:47 +0200
Message-Id: <179180050742.66744.3501923081079835549.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4493; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=YyoMrHD861VVJe+iGivxq1ZHVntN1q/d1zW1Rds/nog=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlntuz/OvmOF/+PdIvvq15Kvru33VB0vvWu2u6yyRuPi
 7Tr3lYR6ChlYRDjYpAVU2Sp4a4Wfyep9WXWdJ3bMHNYmUCGMHBxCsBEwr4yMmx47H9k33SjzKWC
 bxPfrBdz/X540yORr1XnfNk3bffc2SzD8E95Jffi+BLeqcIv406da9VQudt6IN/+6hTZJxl5UaJ
 7+zgB
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Add support for JHB100 System-1 clock generator (SYS1CRG).
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/clk/starfive/Kconfig                  |  10 ++
>  drivers/clk/starfive/Makefile                 |   1 +
>  .../clk/starfive/clk-starfive-jhb100-sys1.c   | 118 ++++++++++++++++++
>  3 files changed, 129 insertions(+)
>  create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-sys1.c
>
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> index cd5b7754403e..11da8bcc4046 100644
> --- a/drivers/clk/starfive/Kconfig
> +++ b/drivers/clk/starfive/Kconfig
> @@ -82,3 +82,13 @@ config CLK_STARFIVE_JHB100_SYS0
>  	help
>  	  Say yes here to support the system-0 clock controller on the
>  	  StarFive JHB100 SoC.
> +
> +config CLK_STARFIVE_JHB100_SYS1
> +	bool "StarFive JHB100 system-1 clock support"
> +	depends on ARCH_STARFIVE || COMPILE_TEST
> +	select CLK_STARFIVE_JH71X0
> +	select RESET_STARFIVE_JHB100 if RESET_CONTROLLER
> +	default ARCH_STARFIVE
> +	help
> +	  Say yes here to support the system-1 clock controller on the
> +	  StarFive JHB100 SoC.
> diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
> index d2ba83d7d02c..0061550e0f7e 100644
> --- a/drivers/clk/starfive/Makefile
> +++ b/drivers/clk/starfive/Makefile
> @@ -12,3 +12,4 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_ISP)	+= clk-starfive-jh7110-isp.o
>  obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+= clk-starfive-jh7110-vout.o
>  
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+= clk-starfive-jhb100-sys0.o
> +obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS1)		+= clk-starfive-jhb100-sys1.o
> diff --git a/drivers/clk/starfive/clk-starfive-jhb100-sys1.c b/drivers/clk/starfive/clk-starfive-jhb100-sys1.c
> new file mode 100644
> index 000000000000..db37b243db18
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jhb100-sys1.c
> @@ -0,0 +1,118 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * StarFive JHB100 System-1 Clock Driver
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
> +#define JHB100_SYS1CLK_NUM_CLKS			(JHB100_SYS1CLK_BMCPER3_CFG_125 + 1)
> +
> +/* external clocks */
> +#define JHB100_SYS1CLK_OSC			(JHB100_SYS1CLK_NUM_CLKS + 0)
> +#define JHB100_SYS1CLK_PLL0			(JHB100_SYS1CLK_NUM_CLKS + 1)
> +#define JHB100_SYS1CLK_PLL1			(JHB100_SYS1CLK_NUM_CLKS + 2)
> +#define JHB100_SYS1CLK_PLL2			(JHB100_SYS1CLK_NUM_CLKS + 3)
> +#define JHB100_SYS1CLK_PLL4			(JHB100_SYS1CLK_NUM_CLKS + 4)
> +#define JHB100_SYS1CLK_PLL5			(JHB100_SYS1CLK_NUM_CLKS + 5)
> +#define JHB100_SYS1CLK_NPU_NCNOC_INIT		(JHB100_SYS1CLK_NUM_CLKS + 6)
> +
> +static const char * const jhb100_sys1_ext_clk[] = {
> +	"osc",
> +	"pll0",
> +	"pll1",
> +	"pll2",
> +	"pll4",
> +	"pll5",
> +	"npu_ncnoc_init",
> +};
> +
> +/*
> + * Regarding the CLK_IS_CRITICAL flag:
> + *   Clocks flagged CLK_IS_CRITICAL feed logic that has to keep running whether
> + *   or not a consumer holds them, such as the bus interconnect and always-on
> + *   blocks. Gating them hangs the system, so they must never be disabled.
> + *
> + * Regarding the CLK_IGNORE_UNUSED flag:
> + *   Clocks flagged CLK_IGNORE_UNUSED are not consumed by any driver. The flag
> + *   keeps them in their hardware default state (enabled) instead of letting
> + *   the clock framework gate them once it disables unused clocks.  If this
> + *   flag needs to be removed later, it must be ensured that these clocks will
> + *   not be disabled even if they are not consumed.

Those comments you are using are too generic and not really helpful as they are.

For example there is no CLK_IGNORE_UNUSED below but the comment mention it.

On the previous patch you've mention CLK_IS_CRITICAL and the fact the clock must stay on.
It is the flag definition so it does not help much.

For each clock with this flag, adding a quick comment explain *WHY* is must stay
ON would be a lot more helpful for a future contributor wondering why it was
put there and how it can possibly be removed. IOW, what device does this clock and
why doesn't it have a driver ?

... and again, I don't think a USB clock should be critical.

-- 
Jerome

