Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4996E4248C9
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791800534; cv=none; b=q3nfgI3I3+NgFlItmWKM+aKGpZoy+yMAcFRU5ytNRRXdVHs7lfXc/CFM5rJcy7aB1PoNNwd61VldwS0VLzcuXifcBfE0cjgZPzKfG4y2JRdk0cccRO1hNv2jrh/dCeONTj7BWBceBQJS0BaRbNim5eKLdfdBCdYw+4/ZpYCLthE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791800534; c=relaxed/simple;
	bh=4tJxa6i6IS+DTFcXWg2M1j4JZuIKSXMzJlCDp/VpPfs=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=KPoBDYHxpFLqK0BOOrPoH9ZHpJPlbq6Um6CZtCftFxW9Hbo2vyRGlDLk5NpI8+00BMq8yzb5hFUByh7+2uv/0Eo9SkpJj6haWP9dWAPb1EsPaJDKFi5JofR1X6YsuhoR9S1IjDwif3B5TL1Sg45tt3s6XGUBw7zvx9zPwWbPMeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=oyzSp2h7; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="oyzSp2h7"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49d05d51553so10684165e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791800518; x=1792405318; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fmOWbwJ0T2o334M14HILyz5Wz3Aty+XrLvb7Rkh/Kco=;
        b=oyzSp2h7/vGWlFpffblMRVIxXUK9S8cbG4NCAsUgTn30aSgJ3Azkb8kzzNBioFWq8/
         Kv0pZ7Ywa5G651hMFW6O6B7RPIRmYPoZSwWRpA7nrmnzFAJdoxfKPNr0mBbwfTg3jfgd
         mlUxWKCjsPNh1WcQ86/tU8AvN/ZQkH2Nh3NuP6J2fRpEPiw/ZVmoAFzXCjxGuFBH5DPS
         LKrSa8GLNwTkfezUwSGaOOc1PLY2T/nQ5VhacQMF3/RsMT5O0F5RrOy3XxRBA2oiYkLw
         LqPAy3tMCsmc6WEMazQS7p6MKZUZdNlh8t1xVDtWjSq6zGoVVb79G17ZDxrjep2iiwkn
         UvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791800518; x=1792405318;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fmOWbwJ0T2o334M14HILyz5Wz3Aty+XrLvb7Rkh/Kco=;
        b=Y9+CylhkcqNCIEuoYpac1ZFbfuMaD5+VakqG89aZ+OyuSPv6Y4YiSWRPGV2eK26h0I
         pdQludq1WJF5YjRUVxZw9wqS9W6guICfkn9nL6uvKmit8CV7FKfMyzhOZgxZnhw8YQwo
         T07EdTXtT3nKvcBrYwKN2fwNwJrqu7s502lO7C/b7Hla0c88+LccXsRWHEpWl15x94qe
         OtJjLMA1T9jnPD4FWkwX0wVRuvmkFd+q+qaHJP6WhjI97Xea5HB3ssvPEUZF6PpmhhXv
         GiM+cdjhkoC6Byn9UGZ9+/bz/KwaS1JgxkEgTeFvT7d54lZTLUnRDW51TseDgYIltz+N
         f0fQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHEaTa5WObzBDzt60pnT+IXXKsCQdZ0ZwSsC97DKgZCEapXjmy0g0sJNTTKxBzRcwwXypu4WRa8mg4G1A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGXeSKUr8yjTwJD1DTPF6rslewyJcMbe02kiU9gVkicbo063Sg
	80SLNMKaD1DN+d3C0gvFOY+Vizu5IXq9ionkpsX/kNs/PURucGw12pBXtCCEVfUuPBs=
X-Gm-Gg: AYBFou194yQt5OdxOK9dLZozQE1XGa0Ra6jgDDRrfoz/to8K9AwP4kBFMlofsChzOfP
	CUAsBpMLi+SK3Ck91ZaxqgImjpNhRtrllXG5hAZiNaDJ3kUstN3gVr9QN+IQHE/TYpRMcVI4lk4
	ZZQLqkDQv8IsNSeMx0p5NUkaNHHxKHt8I9rAUUPq3NUlbNtJN25SCevmFl24p+b7f8som9B/eYe
	HWn81dbFRyUDx0JKF+kihNPUTkF+bO0V6c6cBdxenSJt20ZZ+oZ6MM9ag08HFxbr/7owLepXtny
	Fxpk8DKy328IiX60m5pfQb8f+ZyO/TVeWgP9ZFdnJ7pt84htdzZfTwCT3lyNBSdyr5Oo7279XO+
	bo3v9pb4Waj7Hx0ImHzlArUSDskP56vXKALESyLR5z6+kJ8AF47JFDPXF/i9PT4d2DfcjVZZ1wY
	YZMP8/ENwcSReFs4Yu8Oks95PHjYAprQE0cQ+6IMDfqMGBWlHmzg1LzNy10l+iDdbrK4Y2TblL+
	Ed3pV0QGrXDTcn+lEzXsZRxxGGx
X-Received: by 2002:a05:600c:3b8b:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4a18e4a7cfcmr212480665e9.26.1791800518316;
        Mon, 12 Oct 2026 03:21:58 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a199e5db12sm157508575e9.2.2026.10.12.03.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:21:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 05/15] clk: starfive: Add JHB100 System-0 clock
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
In-Reply-To: <20261008123338.11081-6-changhuang.liang@starfivetech.com>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <20261008123338.11081-6-changhuang.liang@starfivetech.com>
Date: Mon, 12 Oct 2026 12:21:47 +0200
Message-Id: <179180050742.66744.1321848308971146208.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4406; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=4tJxa6i6IS+DTFcXWg2M1j4JZuIKSXMzJlCDp/VpPfs=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlntuyPviZQ5cKea5b/7JyEHf8SF/eEXc8+PtboE76j1
 HTPXbK1o5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABM5wcjIsET4haTu03o/Q8+v
 gdL3VrFunBi5s1/+UldX37O7fhUR1xj+p7bum8/rphCjszWqbobG253H/nrMqpiz4IxzSXJzpTg
 nAwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Add support for JHB100 System-0 clock generator (SYS0CRG).
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  MAINTAINERS                                   |   7 +
>  drivers/clk/starfive/Kconfig                  |  10 ++
>  drivers/clk/starfive/Makefile                 |   2 +
>  .../clk/starfive/clk-starfive-jhb100-sys0.c   | 156 ++++++++++++++++++
>  4 files changed, 175 insertions(+)
>  create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-sys0.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 66d6c15f1dd2..dff8b819f83e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26217,6 +26217,13 @@ F:	Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
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
> index 51716655554f..cd5b7754403e 100644
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
> +	select RESET_STARFIVE_JHB100 if RESET_CONTROLLER

just imply RESET_STARFIVE_JHB100 ?

It can be disabled if RESET_CONTROLLER is not set, so it is kind of weak already.

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
> index 000000000000..edab54f228ad
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jhb100-sys0.c
> @@ -0,0 +1,156 @@
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
> +#define JHB100_SYS0CLK_NUM_CLKS			(JHB100_SYS0CLK_GPU1_NCNOC_INIT + 1)
> +
> +/* external clocks */
> +#define JHB100_SYS0CLK_OSC			(JHB100_SYS0CLK_NUM_CLKS + 0)
> +#define JHB100_SYS0CLK_PLL0			(JHB100_SYS0CLK_NUM_CLKS + 1)
> +#define JHB100_SYS0CLK_PLL1			(JHB100_SYS0CLK_NUM_CLKS + 2)
> +#define JHB100_SYS0CLK_PLL2			(JHB100_SYS0CLK_NUM_CLKS + 3)

Does this mean that if the you ever find out you've forgot an internal clock
(which does happen fairly often) the whole external block will shift ?

> +
> +static const char * const jhb100_sys0_ext_clk[] = {
> +	"osc",
> +	"pll0",
> +	"pll1",
> +	"pll2",
> +};
> +
> +/*
> + * Regarding the CLK_IS_CRITICAL flag:
> + *   Clocks flagged CLK_IS_CRITICAL feed logic that has to keep running whether
> + *   or not a consumer holds them, such as the bus interconnect and always-on
> + *   blocks. Gating them hangs the system, so they must never be disabled.

PCIE and USB are critical below and do not appear to meant this criteria, yet
they are critical too.

-- 
Jerome

