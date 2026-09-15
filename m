Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5010F4A2A60
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475191; cv=none; b=Qz1KpaaRBLIbdecM2v7LdGhVQJAifv1gY5eC7PlL00OeV4WE0M1LCj5H3UeZaK3yClWfSEHVRlawhyEi2hb2cdsHtmHR6/fvAgU3bSjl1/9SFvZezniGSEBei6RfR3EkQOYBBfL1+pTieiU1JnTdKOUNaDwrr+8b8ZxCaAML2AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475191; c=relaxed/simple;
	bh=/ZojfrfW2IBmBEs/62KEYt1EejWBbGxWHSboAcJDbR0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=no5JBo1WKJ9D/KQaz779MIWlWndIuThwGkOWys35wNhiNF8eLgnO93d8VjWO+Tq4qotC2/3yQREbq3VnehB608uPZlK/kdyPC6CAP2z/cqTfUXsiuh4bs9wvo+fGDhyfKBuHTl7DiUwj8SLA9m1CPk1YxYeMzE0Fb/JhxH/pil8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=KxfxcSnW; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="KxfxcSnW"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso9981545e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789475186; x=1790079986; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rl6JhS65mEEXMmU5m1MLq7qtdOHWcdMQWYuFmQvPLeI=;
        b=KxfxcSnWWTuskUVDRoMr5Iz/IlLu/EaZjDEQc+t557vUMS31qTDTBkkY5IvNmRo2GD
         VHEJwZGugFqeZTInH8eCWrkt0m5++bv0C/TiR+dReDt9q3mD0sJIw6+tacyItAuy5bTK
         u++Vg4mK2b+eHc7B2z5tHRXd//KmdlnHhJ3vQnaMjcMZdI0ygWHOdvmivP8UD6V5DTdm
         ikD5fN77hISPMrknX7MjMZnNEYH+AhnPMQo52bJvMHUvV+BAEdzmkzkvLFB6tiBP+eMO
         qPfGOi7VA1wZqMqVqytW4BpBHijfQBb77WdXxk3vPWUHYxqwFABNPmURI5MGvkZIbBOB
         PlEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475186; x=1790079986;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rl6JhS65mEEXMmU5m1MLq7qtdOHWcdMQWYuFmQvPLeI=;
        b=fSlPg8mv1ZUuAITKDbhEIuFVEMw8G3PZvWVZeGnnxAvM7MUri6nMuJKQOP2BoVdOgY
         j42KJfCcfbOPkTc9D7gCgWo0YqObD1plvzvqwbi4oN5FvaL1b0djPdVMJ9rofgljQE5r
         CZqtDy//VvzG5/qymrW7H7H8jwbCB44JqqhydiH/jwRhRJ8w3H5Q7QQm13+OcWGME1AB
         5IXMUSevAlxtkRzVxmXAgIJC+ocJB17FBM1GMLSjyyFip44eiyrM4kOPnOiM/7OVZ0ZS
         RQgDNXvIBHZhwGU1hDE8HUoGmkAjKR9XkciMFklCCfdrWMEDWb7pa0+YioHQool2sP1Q
         UV2A==
X-Forwarded-Encrypted: i=1; AKwUvBwkSWdeynoIxexydohmK5//wsQXDrT2Z7pydDY1Da7e7oBR9YDzB8x7XUk9yZUOADqUUnPjmeJ+RQEYDXc=@vger.kernel.org
X-Gm-Message-State: AFuF++kKhYoq4ltKTn7PFRm936OGxRr2PDgzdP0s3y3XwlxFIoatfa5B
	GlQswwAgTpe52Opg8WEMPrSwd9hdfFfR/K7UnUZNSSDccGDG80PoHV+M7o4Y2tp+J+w=
X-Gm-Gg: AYBFou1tY1C/sPkPv79vNUJ0GMfqU+r6h/GLl13vcKIDeZGw11Q/iV4dYm2nRIz8qIb
	aZixphmme5JC87ce93reyf1CbKLFtYsO4nTrtQidYGM8ayjVG2GACpOaBUvy3RTlEyV0IFe3lwf
	by5I1oHMln1FugePNOS5vHhS5T960+vqFs9Yf4L0Q9ThvvQwHO15/Kyq6kO/c4fp/UCtl4kSXyp
	67V/I1atBCOk/00uKmJBLAFIwjPlRuOkzzm4fesrSZQgpKncogXxKkaALrKbm1U4oU/qqZTmrUo
	dXOmBNHV2tCVj+DAJEzmgezf+91R73PWXIpB5yQhS6tk54rww2IoqUfGM3lhFNNsbrnJt2c8vqI
	fCAjMLsDTyAqxqPsR/UUDkHy/QfcHwkkxiKxAM9RYX7+hD1lCfRl5IOMiP5m9s4xV8zIfQ/QW8v
	VObqFRKCDuOjI5Yh47bSEhIFCEJiX8sevaBNuM0CwKNhtoxrnGvd9wJV4ymSie1FHIcn166hZQu
	XBD7gQhdudDuLt8Dit3DI/L3Eyp
X-Received: by 2002:a05:600c:3146:b0:49c:c0d4:53d9 with SMTP id 5b1f17b1804b1-49e7a668896mr82505995e9.14.1789475186101;
        Tue, 15 Sep 2026 05:26:26 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb36e4a6sm35902151f8f.37.2026.09.15.05.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:26:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v14 04/11] clk: realtek: Introduce common probe()
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 p.zabel@pengutronix.de, cylee12@realtek.com, afaerber@suse.com, 
 jyanchou@realtek.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, 
 cy.huang@realtek.com, stanley_chang@realtek.com, 
 Brian Masney <bmasney@redhat.com>
In-Reply-To: <20260901072446.2563145-5-eleanor.lin@realtek.com>
References: <20260901072446.2563145-1-eleanor.lin@realtek.com>
 <20260901072446.2563145-5-eleanor.lin@realtek.com>
Date: Tue, 15 Sep 2026 14:26:17 +0200
Message-Id: <178947517742.448573.7975580808033616494.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8639; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=/ZojfrfW2IBmBEs/62KEYt1EejWBbGxWHSboAcJDbR0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqqTlp3tsdp4MPJHxbixeJs86XTBzouL9QFlD0n
 NgQqhlviAmJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaqk5aQAKCRDm/A8cN/La
 hVcqEAC06hi67ejmVN0pfal7W+Ank37EH6X16+Vg0CoMR3Pq/l7qoxRk54s/dggclfphngsEJu5
 mVN37m4pUeCSoDB9CGjiINgNOFsun7jILbGph/+qXO7myjAyg4OKrWw7CqJBVs2tk8umrkflQgm
 MEZw+vfJ6otkFvZ1N+c5P3OC84J7hX8afjyPgOJBzMIre67Z28iDVDoyagVoB/DNy51eRAlt691
 iiVODXcW9ZW/xGSsC8REGVE9YJXIWRp25y84Vq/nmDwtTxX5jjTtSUaNHf6vbKQ1NjNzPdOxnnH
 Jw3ah04M+P3BTSi1hTyl8A7ilQwACqyg0QlTN2lbbPJeXYM+74JAoQ2C5mj88fZAR0FW36RvU/S
 NqfAoJZEL+L6IeiFtYMg3+3F5laPUwbZZbrfaOXUhvTFcw3d5qH05/qrEIpy8UcBLm5IWsBXkYO
 +PWcCASubDTPEmpGzcAc2r/KLdRSzIzAFG3vd8w6H16VKdhLbivuUw0Q2C4u+DfItBphRDdp+5f
 9TplNL8t8Nyp8YbPFIMPJyp7qXhDWsba8r9sEj+22JHLeAqRkT3ausAzFi9a4qr/+g7SJeblcrQ
 LIZ/ZZO4vkeLla1qucfBa2gOOVW6B5UAv78BEG5hbgfzSYbKwo46T9bbTKVg1HE6zWGVAc2jxUO
 er+YctuH4W4zpHg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-09-01 15:24 +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add rtk_clk_probe() to set up the shared regmap, register clock hardware,
> and add the clock provider.
> 
> Additionally, if the "#reset-cells" property is present in the device tree,
> it creates and registers an auxiliary device using the provided aux_name.
> This allows the dedicated reset driver to bind to this device, enabling
> both clock and reset drivers to share the same regmap.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v14:
> - Move Reviewed-by tags to the correct position.
> - Use devm_platform_ioremap_resource() + devm_regmap_init_mmio() instead
> of device_node_to_regmap().
> - Drop rtk_clk_remove().
> ---
>  MAINTAINERS                          |  1 +
>  drivers/clk/Kconfig                  |  1 +
>  drivers/clk/Makefile                 |  1 +
>  drivers/clk/realtek/Kconfig          | 30 ++++++++++
>  drivers/clk/realtek/Makefile         |  4 ++
>  drivers/clk/realtek/clk-rtk-common.c | 82 ++++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-rtk-common.h | 37 +++++++++++++
>  7 files changed, 156 insertions(+)
>  create mode 100644 drivers/clk/realtek/Kconfig
>  create mode 100644 drivers/clk/realtek/Makefile
>  create mode 100644 drivers/clk/realtek/clk-rtk-common.c
>  create mode 100644 drivers/clk/realtek/clk-rtk-common.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a752551f32f9..e55eb1c06119 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22746,6 +22746,7 @@ M:	Cheng-Yu Lee <cylee12@realtek.com>
>  M:	Yu-Chun Lin <eleanor.lin@realtek.com>
>  S:	Supported
>  F:	Documentation/devicetree/bindings/clock/realtek*
> +F:	drivers/clk/realtek/*
>  F:	drivers/reset/realtek/*
>  F:	include/dt-bindings/clock/realtek*
>  F:	include/dt-bindings/reset/realtek*
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 1717ce75a907..97ad817457db 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -525,6 +525,7 @@ source "drivers/clk/nuvoton/Kconfig"
>  source "drivers/clk/pistachio/Kconfig"
>  source "drivers/clk/qcom/Kconfig"
>  source "drivers/clk/ralink/Kconfig"
> +source "drivers/clk/realtek/Kconfig"
>  source "drivers/clk/renesas/Kconfig"
>  source "drivers/clk/rockchip/Kconfig"
>  source "drivers/clk/samsung/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index cc108a75a900..b1aa373e9f84 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -141,6 +141,7 @@ obj-$(CONFIG_COMMON_CLK_PISTACHIO)	+= pistachio/
>  obj-$(CONFIG_COMMON_CLK_PXA)		+= pxa/
>  obj-$(CONFIG_COMMON_CLK_QCOM)		+= qcom/
>  obj-y					+= ralink/
> +obj-$(CONFIG_COMMON_CLK_REALTEK)	+= realtek/
>  obj-y					+= renesas/
>  obj-$(CONFIG_COMMON_CLK_ROCKCHIP)	+= rockchip/
>  obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
> diff --git a/drivers/clk/realtek/Kconfig b/drivers/clk/realtek/Kconfig
> new file mode 100644
> index 000000000000..778f5b4a967a
> --- /dev/null
> +++ b/drivers/clk/realtek/Kconfig
> @@ -0,0 +1,30 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config COMMON_CLK_REALTEK
> +	tristate "Clock driver for Realtek SoCs"
> +	depends on ARCH_REALTEK || COMPILE_TEST
> +	default ARCH_REALTEK
> +	help
> +	  Enable the common clock framework infrastructure for Realtek
> +	  system-on-chip platforms.
> +
> +	  This provides the base support required by individual Realtek
> +	  clock controller drivers to expose clocks to peripheral devices.
> +
> +	  If you have a Realtek-based platform, say Y.
> +
> +if COMMON_CLK_REALTEK
> +
> +config RTK_CLK_COMMON
> +	tristate "Realtek Clock Common"
> +	depends on RESET_CONTROLLER
> +	select AUXILIARY_BUS
> +	select REGMAP_MMIO
> +	select RESET_RTK_COMMON

Is there compile time dependency with reset that I missed ?
The point of the aux bus is to remove such dep

> +	help
> +	  Common helper code shared by Realtek clock controller drivers.
> +
> +	  This provides utility functions and data structures used by
> +	  multiple Realtek clock implementations, and include integration
> +	  with reset controllers where required.
> +
> +endif
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> new file mode 100644
> index 000000000000..13000ed4ba11
> --- /dev/null
> +++ b/drivers/clk/realtek/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
> +
> +clk-rtk-y += clk-rtk-common.o
> diff --git a/drivers/clk/realtek/clk-rtk-common.c b/drivers/clk/realtek/clk-rtk-common.c
> new file mode 100644
> index 000000000000..493f2d5588d0
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtk-common.c
> @@ -0,0 +1,82 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2019-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/device.h>
> +#include <linux/export.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include "clk-rtk-common.h"
> +
> +static int rtk_reset_controller_register(struct device *dev, const char *aux_name,
> +					 struct regmap *map)
> +{
> +	struct auxiliary_device *adev;
> +
> +	if (!of_property_present(dev->of_node, "#reset-cells"))
> +		return 0;
> +
> +	if (!aux_name) {
> +		dev_err(dev, "DTS requires reset controller, but aux_name is missing\n");
> +		return -EINVAL;
> +	}
> +
> +	adev = devm_auxiliary_device_create(dev, aux_name, (void *)map);
> +	if (!adev)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +static const struct regmap_config rtk_clk_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +};
> +
> +int rtk_clk_probe(struct platform_device *pdev, const struct rtk_clk_desc *desc)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct regmap *regmap;
> +	void __iomem *base;
> +	struct clk_hw *hw;
> +	int i, ret;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	regmap = devm_regmap_init_mmio(dev, base, &rtk_clk_regmap_config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	for (i = 0; i < desc->num_clks; i++)
> +		desc->clks[i]->regmap = regmap;
> +
> +	for (i = 0; i < desc->clk_data->num; i++) {
> +		hw = desc->clk_data->hws[i];
> +		if (!hw)
> +			continue;
> +
> +		ret = devm_clk_hw_register(dev, hw);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to register hw of clk%d\n", i);
> +	}
> +
> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> +					  desc->clk_data);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to add clock provider\n");
> +
> +	platform_set_drvdata(pdev, (void *)desc);
> +
> +	return rtk_reset_controller_register(dev, desc->aux_name, regmap);

sashiko report on Patch 10 is actually not a prexisting issue. it is here.
Could you address it ?

> +}
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_probe, "CLK_REALTEK");
> +
> +MODULE_DESCRIPTION("Realtek clock infrastructure");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/realtek/clk-rtk-common.h b/drivers/clk/realtek/clk-rtk-common.h
> new file mode 100644
> index 000000000000..de3f23120b53
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtk-common.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2016-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#ifndef __CLK_REALTEK_COMMON_H
> +#define __CLK_REALTEK_COMMON_H
> +
> +#include <linux/clk-provider.h>
> +
> +#define __rtk_clk_regmap_hw(_p) ((_p)->hw)
> +
> +struct device;
> +struct platform_device;
> +struct regmap;
> +
> +struct rtk_clk_regmap {
> +	struct clk_hw hw;
> +	struct regmap *regmap;
> +};
> +
> +struct rtk_clk_desc {
> +	struct clk_hw_onecell_data *clk_data;
> +	struct rtk_clk_regmap **clks;
> +	size_t num_clks;
> +	char *aux_name;
> +};
> +
> +static inline struct rtk_clk_regmap *to_rtk_clk_regmap(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct rtk_clk_regmap, hw);
> +}
> +
> +int rtk_clk_probe(struct platform_device *pdev, const struct rtk_clk_desc *desc);
> +
> +#endif /* __CLK_REALTEK_COMMON_H */
> -- 
> 2.43.0
> 
> 


