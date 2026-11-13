Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794571590;
	b=BuGEMwQ69puTWp0PY8AOLlCDvAgNqnsj5lKSXB3mMt0jQlWrzzrvZ1CM01Bt501UdJL3
	 32gvmJirbaV16kaVhvEQA5LXWlfUpTfbJlYA6OJuXTYaDzDARVWtyUERPaq32BsA639Qa
	 RudVl45dC9aWCV5rRaeHWAw0fmWbVnv266MH8YjsrAniR5EdNX+5mo0xtS03gus/auHMG
	 jec7mukW8MO0jHdb3tjiYRskL0T0dw57FLoDMxrSusYhlKWVlbEDy/ToUdq3IwPK8qW+b
	 UUT15ZbdoEYrSlPAd0IJ42TpaPwYbDbmhc50HgG42MgjnVs9nfZJ/Z5HF4T+SBVZ0WA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794571590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=rrZ72aMFXIt9J0eJiunU6ye5nEAGfTC6WD38knv82lM=;
	b=tUY05O45fCalwzhDVWaLcvRn+fFYgHvYTDNsscO4LeN+lADPFKQXTsB2S9y8KPUk/GlY
	 fqSkVeAIjnGhXV1UNxufxEt2XirIhPNuvqLwgDgPEr+xHK/uXKSbYwaRLJ1OqJn0YbnNQ
	 8Cg02mwddMfa/WlcCo4tM/js0pwm0aOrM3PMDXC9pOZ+vOpQ+NFRum6QqvbnQrtg0ePFn
	 yC0s/XwyTDf8funI1UYdUdsgeRswv1O4dT5ZjTZIvN6dK+A+ntuyhYvGQtlLQ693LRuIL
	 LFKRyPCWxA6YKJuSpZriagQDzT16FZpKyC+OouWbBvEbl///Hs3FzPcKxTyPUhghmVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="hSIZT/fM";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FED2606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FED2606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hSIZT/fM
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b577addee9so1779372a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:06:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794571588; cv=none;
        d=google.com; s=arc-20260327;
        b=T1omFba9PTUIjX39nz0PwTT1aAWsH01wqL54r2OwIJ7aqeVGiHwEE2OM+f5rj2Vnf8
         z9gtKmwccDbPJEfcT/78OkzIWLwmcj+KEPzJRNvNpznrLlHFb1hMX+OQmtpN/HghK08e
         YHtD1SeXQLEMrDbZLHp/5ndGhKaWz7dYefAImVhGo9n3iwewqEX6dcG9sSA7C5pxFOMn
         RKLpUvvcVFISTYSMR2oWElCn3/RZU9pipAUUpBe8KpiQ9nizLQCx53iGylDNKXQK3xll
         pI+orYD8F+6z70zPbx6Dj+UW2I8gBqVr5HNsr72vx0AL8O3is+yIYI3qLc3p0gKaJe+U
         coLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rrZ72aMFXIt9J0eJiunU6ye5nEAGfTC6WD38knv82lM=;
        fh=fqR/Fyk3hevgWe4xmYJfHRsvtuhVRxn90cR04R1BUbw=;
        b=E/AA/36UXYWzSMt2JwKtPMDeHajvCI+/ywfawgQsCMQnthg5djXozQA1+88TBM55xF
         SupKpNIc62RWdipercqnclQqyXt35MKpX5wJi0LXMOYCkPuiGBGqHkpOiB8iOpiWTu+u
         iYrLu04eK2HuYiI9ZuUMb4XKaEQ3vVbRzSz72yVoBNvBcc91PqsjwFTHSsBcsTaNE+Fn
         SpLUn6WZswu4gmf55yEHWGPNKTH6t6Jggx4iqnPZflgOCnUxYHXgu4feM/sA+njlDqk9
         Fh19dpbjVMOepiqJnGJdyfJrZY1jmZnyxLZikWbj8EOA4KcO2WhSwGDR2j4bIEeO2cub
         M78g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794571588; x=1795176388; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rrZ72aMFXIt9J0eJiunU6ye5nEAGfTC6WD38knv82lM=;
        b=hSIZT/fMx7/k1eDgZbgkKWwe8Vo+2D7cRA1eeDwbkq+6Gwve08pwTNZIfE1LEKKzqs
         IV7uSvtfh+yOOmOUlP6Wgj0bJEhnNXkWnzoOs6SqY0HFh0IZ7FpEKIuzWNpN90eI7s5n
         m6ZFj+D8siqtDipklshc9cB7nAAER0AiPxsln7DOEPHJIzN7cNsmxeRAzcGB3qSKKLbV
         LHFwhgeIjfiReCl6+VlaKnPRi/Iwh60ElOoInbZ2ekey7ZllC8Qq33B8CenVRZVplOaq
         nJxAAVJyM/X07MC//3W4CCx0o2cjEM9U6TED1b8X7hZkN+gNnCwtj/g19Gzu9FWEn1oZ
         iTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794571588; x=1795176388;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rrZ72aMFXIt9J0eJiunU6ye5nEAGfTC6WD38knv82lM=;
        b=gQgtjqmShboZBlalbXq3biDJ48wB3fqimaBbxqVJR/crArfdCvWlL1cBCFl6dnDeul
         lGI8iTCKe8IvVqRUQFBWKmgHWcX58itFb8M0Das/rWM62YuhQUniARrAMpMih00eDPCR
         rJQHiZ3D/mXLxiqab1ofQD9szt1FInsgqt3Zg+TonXzMjmqCc8LE2iM7/ZTjenUih94k
         v4Dq/GSkCScOaDIT7KB18w43ODeWNWneu63LQMQvq8asECT6U+NIHVkNuawiXnGcMYAL
         H9M/XQZooVoruotASerR8cLR8QgecDMOZVzcHU/9J4H6MBR7GNDsxE4JqB5TcBGG16BX
         TwGw==
X-Forwarded-Encrypted: i=1; AL+hErGb93C/jFEuDJXisYCTWZc3D+dcpTD51qFum3e9DLnbcovCqsi0qlkIh8U1XooL1qbP9g4T6K/pr22XrZs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ajq/pEbyGTSs+0Xqzk/7r3FGyH4pIWneUpRu2Ut24v4VBUe3E
	PkfBN/6881rOgvT4kM4a8dD0Db4Rdtli1fAaxofOQ5UFhk9wtNOr6+5HegJFyoAlJqzL7Tjl3M/
	b+QW5cI6nABc0IftDyrvcYw5VkF536qRI/qyAb/qrXg==
X-Gm-Gg: AYBFou2Hct+baOm/cdOgd8/cBJvb2ZUBK0pOk8abu3QtXwUJmbUYajotvkZ0F+LSJcZ
	7+DHG1b4DuPQcGRs4Nw7JQMI2qCLGx8liPuDQd1I/g5kSQa4T6yMSfmJ7Phi1tsql6jeLosVqZ7
	o10VdEX0Xlv239omKde3JNMW9Z/qKrWNuB/6JTDFtYbD2CB2ao6+HVmhO21Uhi7boe6LYXvn/5W
	clO4UM0PRraNXHToHqM7AjceVQpmNMkoMlASd9r7seYqjqiUh6dCIxASIg4nxJxRpitx1iJAdv2
	DTjoC56Tu+s61WzJV2vJ1kZoS+uGdSti1hAV8sY1WuwUiBEc5rI07YYEyFZ208ZVLaHKDoGeOHw
	zWwVakA0ybJUuAvg0Kxq5u9maAlHLISIeFKtyizz/yrSOVscHXkV8Omskf7t5HU/YlE2mvw==
X-Received: by 2002:a05:6402:2350:b0:6b7:6f9:2ef7 with SMTP id
 4fb4d7f45d1cf-6b7c0bc5f30mr1834438a12.11.1794571587568; Fri, 13 Nov 2026
 04:06:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104850epcas5p4ef9292af100475b1f12a2601bf5e1a84@epcas5p4.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-8-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-8-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 12:06:15 +0000
X-Gm-Features: AclHuK_PX8mgp8O_dlqBWaitzb8guO9jt4s7fw--0eo5yJf4LliJ6Zz_ShncF-Q
Message-ID: <CADrjBPoAVMdxgU4P+shh+9O5rGJp+m3sRQMDd2c-7zbJ8qhiBQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/14 RESEND] clk: samsung: exynos8855: add block top
 and peric clock support
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Raghav,

Nice to see you got the auto clock mode working on this SoC. Great
Work! See some inline comments below

On Fri, 13 Nov 2026 at 10:53, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Register compatible and cmu_info data to support clocks.
> CMU_TOP & CMU_PERIC, these provide clocks for TOP & PERIC
>
> Co-developed-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
>  drivers/clk/samsung/Makefile         |    1 +
>  drivers/clk/samsung/clk-exynos8855.c | 1130 ++++++++++++++++++++++++++
>  2 files changed, 1131 insertions(+)
>  create mode 100644 drivers/clk/samsung/clk-exynos8855.c
>
> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
> index b3e994bd525d..99c2c304ff48 100644
> --- a/drivers/clk/samsung/Makefile
> +++ b/drivers/clk/samsung/Makefile
> @@ -29,6 +29,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK) += clk-exynos8895.o
>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  += clk-exynos990.o
>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  += clk-exynosautov9.o
>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  += clk-exynosautov920.o
> +obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  += clk-exynos8855.o
>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  += clk-gs101.o
>  obj-$(CONFIG_EXYNOS_ACPM_CLK)          += clk-acpm.o
>  obj-$(CONFIG_S3C64XX_COMMON_CLK)       += clk-s3c64xx.o
> diff --git a/drivers/clk/samsung/clk-exynos8855.c b/drivers/clk/samsung/clk-exynos8855.c
> new file mode 100644
> index 000000000000..dcf58f2459b0
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-exynos8855.c
> @@ -0,0 +1,1130 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026 Samsung Electronics Co., Ltd.
> + * Author: Raghav Sharma <raghav.s@samsung.com>
> + *
> + * Common Clock Framework support for Exynos 8855 SoC.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#include <dt-bindings/clock/samsung,exynos8855.h>
> +
> +#include "clk.h"
> +#include "clk-exynos-arm64.h"
> +
> +/* NOTE: Must be equal to the last clock ID increased by one */
> +#define CLKS_NR_TOP                     (CLKCMU_DOUT_G3D_HTU + 1)
> +#define CLKS_NR_PERIC                   (CLK_GOUT_USI_PERIC + 1)
> +
> +#define EXYNOS8855_PERIC_GATE_DBG_OFFSET      0x2024
> +#define EXYNOS8855_TOP_GATE_DBG_OFFSET      0x20A0
> +
> +#define EXYNOS8855_DRCG_EN_OFFSET       0x104
> +#define EXYNOS8855_MEMCLK_OFFSET        0x108
> +
> +/* ---- CMU_TOP --------------------------------------------------------- */
> +
> +/* Register Offset definitions for CMU_TOP (0x13900000) */
> +/* PLL */

IIUC in clk-pll.c you are using PLL_LOCKTIME_PLL_SHARED* - 4 for the
PLL_CON8 register offset? I was expecting to see those registers
defined here

> +#define PLL_LOCKTIME_PLL_SHARED0                            0x8
> +#define PLL_LOCKTIME_PLL_SHARED1                            0x10
> +#define PLL_LOCKTIME_PLL_SHARED2                            0x18
> +#define PLL_LOCKTIME_PLL_MMC                                 0x20
> +#define PLL_LOCKTIME_PLL_SHARED3                            0x28
> +#define PLL_LOCKTIME_PLL_SHARED4                            0x38
> +#define PLL_LOCKTIME_PLL_MIF_SWITCH                         0x30
> +#define PLL_CON0_PLL_MMC                                    0x1c0
> +#define PLL_CON3_PLL_MMC                                    0x1cc
> +#define PLL_CON0_PLL_SHARED0                                0x100
> +#define PLL_CON3_PLL_SHARED0                                0x10c
> +#define PLL_CON0_PLL_SHARED1                                0x140
> +#define PLL_CON3_PLL_SHARED1                                0x14c
> +#define PLL_CON0_PLL_SHARED2                                0x180
> +#define PLL_CON3_PLL_SHARED2                                0x18c
> +#define PLL_CON0_PLL_SHARED3                                0x200
> +#define PLL_CON3_PLL_SHARED3                                0x20c
> +#define PLL_CON0_PLL_SHARED4                                0x280
> +#define PLL_CON3_PLL_SHARED4                                0x28c
> +#define PLL_CON0_PLL_MIF_SWITCH                             0x240
> +#define PLL_CON3_PLL_MIF_SWITCH                             0x24c
> +
> +/* MUX & DIV */
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_AUD_CPU                   0x1000
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_AUD_NOC                   0x1004
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CPUCL0_SWITCH             0x1008
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CPUCL0_NOCP               0x100c
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_DSU_SWITCH                0x1010
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CPUCL1_SWITCH             0x1014
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CIS_CLK0                  0x1018
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CIS_CLK1                  0x101c
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CIS_CLK2                  0x1020
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CIS_CLK3                  0x1024
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CIS_CLK4                  0x1028
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CMU_BOOST_TOP             0x102c
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CMU_BOOST                 0x1030
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CMU_BOOST_CPU             0x1034
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CMU_BOOST_MIF0            0x1038
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CSIS_NOC                  0x103c
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CSTAT_NOC                 0x1040
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CSTAT_BYRP                0x1044
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_DPU_NOC                   0x1048
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_G3DCORE_SWITCH            0x104c
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_M2M_NOC                   0x1058
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_M2M_JPEG                  0x105c
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_M2M_GDC                   0x1060
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_MIF1_NOCP                 0x1064
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_MFC_NOC                   0x1068
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_MIF0_NOCP                 0x106c
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_NOCL0_NOC                 0x1070
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_NOCL1A_NOC                0x1074
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_PERIC_NOC                 0x1078
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_PERIC_MMC_CARD            0x107c
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_PERIC_IP                  0x1080
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_AUD_CPU                   0x1800
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_AUD_NOC                   0x1804
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CPUCL0_SWITCH             0x1808
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CPUCL0_NOCP               0x180c
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_DSU_SWITCH                0x1810
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CPUCL1_SWITCH             0x1814
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CIS_CLK0                  0x1818
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CIS_CLK1                  0x181c
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CIS_CLK2                  0x1820
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CIS_CLK3                  0x1824
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CIS_CLK4                  0x1828
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CMU_BOOST_TOP             0x182c
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CMU_BOOST                 0x1830
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CSIS_NOC                  0x1834
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CMU_BOOST_CPU             0x1838
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CMU_BOOST_MIF0            0x183c
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CSTAT_NOC                 0x1840
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CSTAT_BYRP                0x1844
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_DPU_NOC                   0x1848
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_G3DCORE_SWITCH            0x184c
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_M2M_NOC                   0x1858
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_M2M_JPEG                  0x185c
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_M2M_GDC                   0x1860
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_MIF1_NOCP                 0x1864
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_MFC_NOC                   0x1868
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_MIF0_NOCP                 0x186c
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_NOCL0_NOC                 0x1870
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_NOCL1A_NOC                0x1874
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_NOC                 0x1878
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_MMC_CARD            0x187c
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_IP                 0x1880
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_PERIS_GIC                 0x10c4
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_PERIS_NOC                 0x10c8
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_PERIS_GIC                 0x18c0
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_PERIS_NOC                 0x18c4
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_HSI_NOC                   0x1050
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_HSI_UFS_EMBD              0x1054
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_HSI_NOC                   0x1850
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_HSI_UFS_EMBD              0x1854
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_RGBP_NOC                  0x1084
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_YUVP_NOC                  0x1090
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_ALIVE_NOC                 0x1094
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CSIS_DCPHY                0x1098
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CSIS_OIS                  0x109c
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_ICPU_NOCD_0               0x10a0
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_ICPU_NOCD_1               0x10a4
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_GNPU0_NOC                 0x10ac
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_GNPU0_XMAA                0x10b0
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_SDMA_NOC                  0x10b4
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_DNC_HTU                   0x10b8
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_DNC_NOC                   0x10bc
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_PSP_NOC                   0x10c0
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_G3D_NOCP                  0x10cc
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_USI_NOC                   0x10d0
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_USI_IP                    0x10d4
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CPUCL0_DBG_NOC            0x10d8
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_BOOST_RCO                 0x10dc
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_MIF0_SWITCH               0x10e0
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_MIF1_SWITCH               0x10e4
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_NOCL1B_NOC                0x10e8
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CPUCL2_SWITCH             0x10ec
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CMU_BOOST_MIF1            0x10f0
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CSTAT_MCSC                0x10f4
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_G3D_HTU                   0x10f8
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_RGBP_NOC                  0x1884
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_YUVP_NOC                  0x1890
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_ALIVE_NOC                 0x1894
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CSIS_DCPHY                0x1898
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CSIS_OIS                  0x189c
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_ICPU_NOCD_0               0x18a0
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_ICPU_NOCD_1               0x18a4
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_GNPU0_NOC                 0x18a8
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_GNPU0_XMAA                0x18ac
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_SDMA_NOC                  0x18b0
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_DNC_HTU                   0x18b4
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_DNC_NOC                   0x18b8
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_PSP_NOC                   0x18bc
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_G3D_NOCP                  0x18c8
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_USI_NOC                   0x18cc
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_USI_IP                    0x18d0
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CPUCL0_DBG_NOC            0x18d4
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_NOCL1B_NOC                0x18d8
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CPUCL2_SWITCH             0x18dc
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CMU_BOOST_MIF1            0x18e0
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CSTAT_MCSC                0x18e4
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_G3D_HTU                   0x18e8
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_USB_NOC                   0x1088
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_USB_USB20DRD              0x108c
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_USB_NOC                   0x1888
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_USB_USB20DRD              0x188c
> +#define CMU_TOP_CONTROLLER_OPTION0_CMU_CTRL                  0x800
> +
> +static const unsigned long top_clk_regs[] __initconst = {
> +       PLL_LOCKTIME_PLL_MMC,

and also here

> +       PLL_LOCKTIME_PLL_SHARED0,
> +       PLL_LOCKTIME_PLL_SHARED1,
> +       PLL_LOCKTIME_PLL_SHARED2,

[..]

> +/* Register CMU_TOP early, as it's a dependency for other early domains */
> +CLK_OF_DECLARE(exynos8855_cmu_top, "samsung,exynos8855-cmu-top",
> +              exynos8855_cmu_top_init);
> +
> +/* ---- CMU_PERIC --------------------------------------------------------- */
> +
> +/* Register Offset definitions for CMU_PERIC (0x15400000) */
> +#define CMU_PERIC_PLL_CON0_MUX_CLKCMU_PERIC_IP_USER            0x600
> +#define CMU_PERIC_PLL_CON0_MUX_CLKCMU_PERIC_MMC_CARD_USER      0x610
> +#define CMU_PERIC_PLL_CON0_MUX_CLKCMU_PERIC_NOC_USER           0x620
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_I2C                    0x1000
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_UART_DBG               0x1004
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI00                  0x1008
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI01                  0x100c
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI02                  0x1010
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI03                  0x1014
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI04                  0x1018
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI09_USI_OIS          0x101c
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI10_USI_OIS          0x1020
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_NOCP                   0x1800
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_UART_DBG               0x1804
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI00_USI              0x1808
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI01_USI              0x180c
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI02_USI              0x1810
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI03_USI              0x1814
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI04_USI              0x1818
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI09_USI_OIS          0x181c
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI10_USI_OIS          0x1820
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI_I2C                0x1824
> +#define CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_CMU_PERIC_IPCLKPORT_PCLK    0x2004
> +#define CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_SYSREG_PERIC_IPCLKPORT_PCLK 0x2060
> +#define CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_UART_DBG_IPCLKPORT_PCLK     0x2064
> +#define CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_USI00_USI_IPCLKPORT_PCLK    0x206c
> +#define CMU_PERIC_CONTROLLER_OPTION0_CMU_CTRL                  0x800
> +

If you don't define all registers (like QCH, etc.) in the CMUs that
can be powered off, enabling power domains on this SoC might cause you
to lose state configured by the bootloader (and quite possibly also
suffer weird hard to debug timing/clock issues when enabling power
management).

Since auto clock mode is now used (and QCH registers are used by auto
mode), I think it makes sense to define all the CMU registers that
need their state preserved here.

Thanks,

Peter
