Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80F23F23BB
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791800542; cv=none; b=ApW3GbCSaMPr1ktVpEla2ImtGWTuWunMXga9Ac5tFxEeNXL8nwhp7z5U5yCAN+xfq/aFZRLJP7sGFZ53G96sa7j7OYip+FpCqq9shLWSKnsY3XhuEc5ecxhY7rFnVNDPFUONjd9B6InFEOrdf+ao0EM5Y3gd8jDDHFBHhYDysrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791800542; c=relaxed/simple;
	bh=tTAZF8a763gW6j5Lx6Y94iC7OKIfcaHRy+T2VFppwEc=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=UH2zUcniXXxfYsyx8Vbnjuw2kYzeu/F7ogt7joc7nGW2wE0aFXhMDoLUoKrYIF5eObdG3tvj13b4ocqOOvofLRCXCX1ex9Ft6oyCQ7TlggttChVGn62MSQcO3LHcwMsfvG5B4I46wTTCnPvFdc2zfW8NT3ivzGw1nnKGBoS7/3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=N9JBxXq1; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="N9JBxXq1"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so11945865e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791800524; x=1792405324; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AJYyZEBiOUM7OvSMbISuEMhl5UT5CKz97qPqv6r5uKs=;
        b=N9JBxXq1hXsGzlG8ChFOdJmaMHvc9k1/ZdSQ4Ct4h6McErEbgBaZ9yPYoKO3WstKwZ
         7B82T75S+5jNOiNSJZyl1vavBtq21LevLrD7WBDcihmUiKdHbAxZ70ByuSbAVsvU6hnm
         bDUNjuZoWOMZxYzPJw/hsovM+ILSGbfB6H39BPrrBU6Mgo49Be8h2ykLHxxmx+1jY5Kk
         7w2Z/71aUpgCad8o07id7PYCkcsVc4eNR2wvl2Cy1CtZ3uE2+uTf/UBK5rdLkwi6KYoC
         /PwTKclr0gf0qlPkHMeORwvfAmaN+ABEBR5P8dsj/3NgTWb1/3dNtOb2NiE++IOULQ7x
         HmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791800524; x=1792405324;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJYyZEBiOUM7OvSMbISuEMhl5UT5CKz97qPqv6r5uKs=;
        b=I+QECHyF6xCaE07UFlz8jVe+hflrhbQM0OfSi94VLrgw/9RbTMYjNt7bpRcAaN25gW
         uh6NnlJ2RuBxVgbXGWH3XFJSeJT8u+cn7xrKtnWTtFZGANBirgU3Ldjg/mvJ1PDEl7wK
         4WhOWDSbP/Xm0U2GMbB0dCngiEWpzBa5wBMXIeiYorLWUD/LbYc3H8zM4Ip6IV4pfg/i
         1VMJLNky7P4U6dY4R3Etd1osbnW4OSvWY6eqV6WydZEn5l+DlquaxocE4z9MkInfql6X
         IjmNNwMZ4aa8GKJW7vS7WxCKCHvrHBcQYJd5eMza4d1qpC00fAwHG2A9XKSu5jO3YAZW
         8ygA==
X-Forwarded-Encrypted: i=1; AKwUvBy/+0oY2WEe4yxF0uSCf8ccwmnGakv4/yy/oeVCWqX6g2C9qhuyNxG5kIdMQZB3uwQ+43jPHklWD14mQPk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBuLlupCC16pXncjMzTY+7HHJz6d2q4hJ8JFJrhDJULOSrNQy9
	jjewzoeeQ2ZWptRlQf3m0cTWovY3ERE5oQMu8lTdZy6Jps8+HcGFPN2dPn9nYkrvPLw=
X-Gm-Gg: AYBFou3n9CP6XcIPRLK4JIpHdLRPWG5M2LnI73XiIMb9yJjBdgs0H5cORCun6A8ksHv
	1Y0ctHGPrGKtLwLbCDSexU+mOg3nYDQshYwbfi3Y1iUcfRnFkEuhVZD+3UwbT0ru414eYhoJb+q
	+3jhti7wW5ZuoSZgMlZ/WpcbYQ35QJmp/FY0tLdRFK7gbVOcyyXZkjGZwBmgu53oWY5oVzIIrna
	IbxIQ3p6bisc9MbQOKyXZD7gSZnV8eu+UEc08y3XhcTEYupZlPK3RUqbQbdQMud2riWK2LeADDC
	wKnZqmuOBf7jZzx70XogK9tbXadWRDS3UM/i39Ur7GoPH3yltW6IFbI5C66u5ZYB4AGt7k3Aivt
	A95Ad2OhcoG5loqtXfqfVm16wLPLO7rZFj5yUWA3spNUMXkMqyX1ZSKw9Xf3VpR9DT5RXWL+cii
	V4/OF56pF4A/6CQmxygFaIlNqWKl7Jg7uto688oNDCET+MXfdll5Ud2rZv6RhHKry6kAPFVUQ3B
	ujyV7CgE1znfDMMEA==
X-Received: by 2002:a05:600c:3e0a:b0:4a0:1c10:1419 with SMTP id 5b1f17b1804b1-4a18e4cd667mr165296415e9.26.1791800523761;
        Mon, 12 Oct 2026 03:22:03 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f249692sm143801505e9.3.2026.10.12.03.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:22:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 10/15] clk: starfive: Add StarFive JHB100
 Peripheral-0 clock driver
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
In-Reply-To: <20261008123338.11081-11-changhuang.liang@starfivetech.com>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <20261008123338.11081-11-changhuang.liang@starfivetech.com>
Date: Mon, 12 Oct 2026 12:21:47 +0200
Message-Id: <179180050742.66744.4988353309640403131.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5017; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=tTAZF8a763gW6j5Lx6Y94iC7OKIfcaHRy+T2VFppwEc=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlntuznFX6rbup/o6uqu9d9gqCAanb70c5Ja+t9j3U/n
 5LInFLXUcrCIMbFICumyFLDXS3+TlLry6zpOrdh5rAygQxh4OIUgIm4v2T4K+gjayPzakqr4lEd
 aSMdb5GHD+Pm7Jh923+T2fu20m37tzP8d/K+9HX1+cdPlaMOSJvuLd6/eeXc7mu2LTKnzorHNUk
 85AMA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Add driver for the StarFive JHB100 Peripheral-0 clock controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/clk/starfive/Kconfig                  |  10 +
>  drivers/clk/starfive/Makefile                 |   1 +
>  .../clk/starfive/clk-starfive-jhb100-per0.c   | 617 ++++++++++++++++++
>  3 files changed, 628 insertions(+)
>  create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-per0.c
>
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> index cfaac934a8e0..b2a05bbb450f 100644
> --- a/drivers/clk/starfive/Kconfig
> +++ b/drivers/clk/starfive/Kconfig
> @@ -73,6 +73,16 @@ config CLK_STARFIVE_JH7110_VOUT
>  	  Say yes here to support the Video-Output clock controller
>  	  on the StarFive JH7110 SoC.
>  
> +config CLK_STARFIVE_JHB100_PER0
> +	bool "StarFive JHB100 peripheral-0 clock support"
> +	depends on ARCH_STARFIVE || COMPILE_TEST
> +	select CLK_STARFIVE_JH71X0
> +	select RESET_STARFIVE_JHB100 if RESET_CONTROLLER
> +	default ARCH_STARFIVE
> +	help
> +	  Say yes here to support the peripheral-0 clock controller
> +	  on the StarFive JHB100 SoC.
> +
>  config CLK_STARFIVE_JHB100_SYS0
>  	bool "StarFive JHB100 system-0 clock support"
>  	depends on ARCH_STARFIVE || COMPILE_TEST
> diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
> index 29cdef20575e..352717886295 100644
> --- a/drivers/clk/starfive/Makefile
> +++ b/drivers/clk/starfive/Makefile
> @@ -11,6 +11,7 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_STG)	+= clk-starfive-jh7110-stg.o
>  obj-$(CONFIG_CLK_STARFIVE_JH7110_ISP)	+= clk-starfive-jh7110-isp.o
>  obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+= clk-starfive-jh7110-vout.o
>  
> +obj-$(CONFIG_CLK_STARFIVE_JHB100_PER0)		+= clk-starfive-jhb100-per0.o
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+= clk-starfive-jhb100-sys0.o
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS1)		+= clk-starfive-jhb100-sys1.o
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS2)		+= clk-starfive-jhb100-sys2.o
> diff --git a/drivers/clk/starfive/clk-starfive-jhb100-per0.c b/drivers/clk/starfive/clk-starfive-jhb100-per0.c
> new file mode 100644
> index 000000000000..ef6e6906cd2f
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jhb100-per0.c
> @@ -0,0 +1,617 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * StarFive JHB100 Peripheral-0 Clock Driver
> + *
> + * Copyright (C) 2024 StarFive Technology Co., Ltd.
> + *
> + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> + *
> + */
> +
> +#include <dt-bindings/clock/starfive,jhb100-crg.h>
> +#include <linux/platform_device.h>
> +
> +#include "clk-starfive-jh71x0.h"
> +
> +#define JHB100_PER0CLK_NUM_CLKS			(JHB100_PER0CLK_MAIN_ICG_EN_TRNG + 1)
> +
> +/* external clocks */
> +#define JHB100_PER0CLK_OSC			(JHB100_PER0CLK_NUM_CLKS + 0)
> +#define JHB100_PER0CLK_PLL6			(JHB100_PER0CLK_NUM_CLKS + 1)
> +#define JHB100_PER0CLK_CFG_400			(JHB100_PER0CLK_NUM_CLKS + 2)
> +#define JHB100_PER0CLK_CFG_800			(JHB100_PER0CLK_NUM_CLKS + 3)
> +#define JHB100_PER0CLK_NCNOC_INIT		(JHB100_PER0CLK_NUM_CLKS + 4)
> +#define JHB100_PER0CLK_NCNOC_TARG		(JHB100_PER0CLK_NUM_CLKS + 5)
> +
> +static const char * const jhb100_per0_ext_clk[] = {
> +	"osc",
> +	"pll6",
> +	"cfg_400",
> +	"cfg_800",
> +	"ncnoc_init",
> +	"ncnoc_targ",
> +};
> +
> +/*
> + * Regarding the CLK_IS_CRITICAL flag:
> + *   What is special here is the UART*-related clocks. On the JHB100, the secure
> + *   core may consume one UART, while the AP core consumes another. Different
> + *   core boards may select different UARTs, so we usually want to keep all UART*
> + *   clocks always on to prevent the AP core from turning off the clock for the
> + *   secure core's UART.
> + *   UART0-3 are usually used by the HOST side, and there will be no driver on
> + *   the BMC side to consume these clocks. Therefore, these clocks need to be
> + *   enabled for the host to consume.

So you are forcefully enabling 14 clocks for 1 to 4 clocks that may or may not be used.
This is not how this should work. You just enable clock randomly hoping it will cover
your use case. If you are managing the clock for these secure core, it clearly shows you
need a driver for it.

> + *
> + * Regarding the CLK_IGNORE_UNUSED flag:
> + *   Clocks flagged CLK_IGNORE_UNUSED are not consumed by any driver. The flag
> + *   keeps them in their hardware default state (enabled) instead of letting
> + *   the clock framework gate them once it disables unused clocks.  If this
> + *   flag needs to be removed later, it must be ensured that these clocks will
> + *   not be disabled even if they are not consumed.

Why ? you are ignoring all sorts of thing in there like i3c. If the i3c bus is unused,
the clock should be disabled. If it is actively used, why don't you have a driver for it ?

Throwing CLK_IGNORE_UNUSED and CLK_IS_CRITICAL at the majority of your clocks is not OK.

-- 
Jerome

