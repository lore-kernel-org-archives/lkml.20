Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84DF48E0CB
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395614; cv=none; b=ayajB7w6ysM8oDRjP/hCnz4FrrfRxiQS2rmsY3OoXDaXHJtY9JF2R9JbSlmKGtsHGCk610FHRmMKb3TCUb7QeiLTbuiCUan5I4TypOzqpUfoKDdED7Aok1BYQd/0WNA+dm3qhCpgWMsCA9yWHq6q8k/k2A0j0fpo24jpX70lK38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395614; c=relaxed/simple;
	bh=DT7tWGRorHL45umJe9t2q7qTRzJoJLjHRBL+ufDbIcQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IJRXMY139s5UUTJTB2V8g6koZXNyRFeX2qaADGR+dY3T4ROkOPfvsfNwtVVR639psly6LTgO+Uru/LIPqehZ/UQPI3zbk3/wa3WdNJTFr0kz/71bBT1Ol8Ot+OBVSJXkPQa+qEIiFCuZbMWPycJymO/fXL8zIaN0+5b4H4OIU78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V8PhslIJ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V8PhslIJ"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e10a70540so464621f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792395605; x=1793000405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M0SUy48Ueh56GzaTiRmwygfsPwqE3Nw6AJaFjvfAhy4=;
        b=V8PhslIJ14XACrtgoMAmVuPVPo2pHG4PYU/w4DtQwo4DnFh0YXKu0WtcrkGz2W4sRJ
         f2fHYtbLEzMf7wpRMPwMGYIywrxcqjUwmpCwczxQqxpvk0E1EIbud96W3tttWNQrjASR
         t7gfNVbcaQ777RXYT3yuxK4hUC6fJ15bPprWIzQ9/TAbvjMr8nK7Jjo7bdum2L7G1Cjb
         i8Dc/LDVU3CNqUQcD/9aTgJZE3DNAIM7sr/qdjWSzsPzsFzvXir2rER5hiZNh4yU4N1d
         jBRAMNlE0JRREDTI7/6ZZuT94P99f1bqW8YSX6UqrxSxIXnKXweEPp/WbukboCA/jrdu
         uIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792395605; x=1793000405;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M0SUy48Ueh56GzaTiRmwygfsPwqE3Nw6AJaFjvfAhy4=;
        b=iC3MIo3QmLSzUtsapqVluvRvqOnIpVawX2X5+i6qbaFvDX9syuEkCORjnfInzeQC6J
         NJLJbB0e/SDbgFLkAHeXlicYxmfh4reyqiJpM+G4dM5JC7qq7jftSYgir/edKB0oDcHg
         z+eXclQFn11BxAKqE7CFpqzXlxTEvJXR3JY5WQPeul9FQZwKWuFjNFMmA0Z0BY2FSdeq
         r9vRsUjsK98oe/Ebcle2NPT0BbehgERQXJf4VOyAhIjjtfpt7+hXrHAGnGG4tZ4RyKlC
         s6HAZ8lsAtODyh63BzwDMABkgWhIITXq72K4QPZStx7hQY/M3vZHQa56uQoucA/9rQX8
         9CIw==
X-Forwarded-Encrypted: i=1; AKwUvByUIBUxvpBhWi5Z/ESJSmVmbA8jODgUugRyVDqpgbQsOCskI/G0enc4A+aa0idFaD9Q9H+5hRReO3m1/+Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtpvTM4GaLYdyfAqiVGIAvGGCHVNccSHgVbECN7k5sTB6FsFYa
	XbildgzZmY/TPYDzKW8q6yK5pCebXPpB/rvxomp7FmDucUWADILS51s4ndZaGMOVcaU=
X-Gm-Gg: AYBFou29rSCn1xqwkHsuowpMU2wZXppaJ1IT+cT02gO1jdduojUW2Py7dE2uB9yA53S
	iapMCPKdjWVsWLld7LxqayAuocw0b4m0O/bS9zZ3swIErOHJ41EoctX+JywajLXR4PLRvuRlG+0
	CGmL3rjWe04HqwPlDZipK+m+2SE42J46wU6LH81vmXn3jMIg3INkoXxNGsNvpIqxYC9iwRzFKob
	3Mf+DgEQKrXIb3DzY57HhqUqn12zntpGfe2b6H8Ppwysdrmo6LFYkjNozDHOOC65itQEjjBEXt4
	hCc896qgKVpCWRHi7Bq84ymsW2pqV011uEXPHx1xsmEv7t2QEpgvkF5k5OhvEarIROW0fkrW2Eo
	TWl+aythRICZ+rrJJnYy3IXUyCNqlDh5U1ROFFwp2LZxi4zzFcWjbfLeYqLK8Wumo2cRSRpR86E
	+E7brdVzVw5H+7+1x4lCs1BAe5CNlTA0VlEJ7UV9tu2t9Lih9gWmHbcK5U2EJMPbOziGWxiDBGj
	gx5Fc7JsTnyfmUasrEkHpVwN6jGWm3AeDLXeuhf2+nldoQQgwb2XA==
X-Received: by 2002:a05:6000:29c6:b0:48b:5e2:52dd with SMTP id ffacd0b85a97d-48e07bbd36emr9726692f8f.11.1792395604385;
        Mon, 19 Oct 2026 00:40:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6674:33bf:38d6:bc10? ([2a01:e0a:106d:1080:6674:33bf:38d6:bc10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8bd9sm22298261f8f.35.2026.10.19.00.40.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 00:40:03 -0700 (PDT)
Message-ID: <98df3ac1-c6ae-4acb-b0ee-ddda92487660@linaro.org>
Date: Mon, 19 Oct 2026 09:40:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] i3c: master: svc: Add Amlogic A9 glue layer
To: junyi.zhao@amlogic.com, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
 linux-hardening@vger.kernel.org, xianwei.zhao@amlogic.com,
 Kelvin.Zhang@amlogic.com
References: <20261019-a9_i3c-v1-0-329d819d621f@amlogic.com>
 <20261019-a9_i3c-v1-3-329d819d621f@amlogic.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20261019-a9_i3c-v1-3-329d819d621f@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/26 07:34, Junyi Zhao via B4 Relay wrote:
> From: Junyi Zhao <junyi.zhao@amlogic.com>
> 
> Add support for the Amlogic A9 implementation of the Silvaco
> SVC I3C controller.
> 
> The glue layer provides Amlogic-specific operations and resource
> handling while reusing the common SVC I3C core driver.
> 
> Add a corresponding MAINTAINERS entry for the Amlogic I3C
> controller.
> 
> Signed-off-by: Junyi Zhao <junyi.zhao@amlogic.com>
> ---
>   MAINTAINERS                          |   6 +
>   drivers/i3c/master/svc/Kconfig       |   7 +
>   drivers/i3c/master/svc/Makefile      |   1 +
>   drivers/i3c/master/svc/i3c-amlogic.c | 250 +++++++++++++++++++++++++++++++++++
>   4 files changed, 264 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dffc63af2..478979446 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1398,6 +1398,12 @@ F:	Documentation/userspace-api/media/v4l/metafmt-c3-isp.rst
>   F:	drivers/media/platform/amlogic/c3/isp/
>   F:	include/uapi/linux/media/amlogic/
>   
> +AMLOGIC I3C DRIVER
> +M:	Junyi Zhao <junyi.zhao@amlogic.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/i3c/amlogic,i3c-a9.yaml
> +F:	drivers/i3c/master/svc/i3c-amlogic.c
> +
>   AMLOGIC MIPI ADAPTER DRIVER
>   M:	Keke Li <keke.li@amlogic.com>
>   L:	linux-media@vger.kernel.org
> diff --git a/drivers/i3c/master/svc/Kconfig b/drivers/i3c/master/svc/Kconfig
> index 14fa1e542..df3528bc1 100644
> --- a/drivers/i3c/master/svc/Kconfig
> +++ b/drivers/i3c/master/svc/Kconfig
> @@ -18,4 +18,11 @@ config I3C_SILVACO
>   	  compatible strings such as "silvaco,i3c-master-v1" and
>   	  "nuvoton,npcm845-i3c".
>   
> +config I3C_AMLOGIC
> +	tristate "Amlogic I3C support"
> +	default y
> +	help
> +	  This selects the Amlogic SoC glue layer support for
> +	  the Silvaco device driver. This driver is used for A9, C5 SoCs.
> +
>   endif # SVC_I3C
> diff --git a/drivers/i3c/master/svc/Makefile b/drivers/i3c/master/svc/Makefile
> index cf18c5da6..695863d1f 100644
> --- a/drivers/i3c/master/svc/Makefile
> +++ b/drivers/i3c/master/svc/Makefile
> @@ -3,3 +3,4 @@
>   
>   obj-$(CONFIG_SVC_I3C)	+= i3c-main.o
>   obj-$(CONFIG_I3C_SILVACO)	+= i3c-silvaco.o
> +obj-$(CONFIG_I3C_AMLOGIC)	+= i3c-amlogic.o
> diff --git a/drivers/i3c/master/svc/i3c-amlogic.c b/drivers/i3c/master/svc/i3c-amlogic.c
> new file mode 100644
> index 000000000..82300d6ae
> --- /dev/null
> +++ b/drivers/i3c/master/svc/i3c-amlogic.c
> @@ -0,0 +1,250 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Copyright (C) 2026 Amlogic, Inc. All rights reserved
> + */
> +#include "i3c-main.h"
> +#include <linux/math64.h>
> +
> +/* Amlogic specific registers */
> +#define I3C_BG_RD_ADDR			0x200
> +#define I3C_BG_WR_ADDR			0x204
> +#define I3C_BG_WR_CTRL			0x208
> +#define I3C_BG_R_TT_LEN			0x20c
> +#define I3C_BG_X_CNT			0x210
> +#define I3C_BUS_MON_CTRL		0x214
> +#define I3C_BUS_MON_ADDR		0x218
> +#define I3C_BUS_MON_DATA		0x21c
> +#define I3C_BUS_MON_DATA_MAK		0x220
> +#define I3C_CLK_SLOW_DIV_CTRL		0x224
> +#define I3C_BG_R_WCNT_CLR		0x228
> +#define I3C_DEBUG_MODIFY		0x22c
> +
> +#define I3C_AO_CLK_SLOW_DIV_CTRL	0x300
> +#define I3C_AO_FCLK_DIV_CTRL		0x304
> +#define I3C_AO_FCLK_DIV_MASK		GENMASK(7, 0)
> +#define I3C_AO_FCLK_DIV_EN		BIT(8)
> +#define I3C_AO_FCLK_EN			BIT(9)
> +#define I3C_AO_DEBUG_MODIFY		0x308
> +
> +#define I3C_DEFAULT_FCLK_RATE		25000000UL
> +
> +struct amlogic_i3c_priv {
> +	int num_clks;
> +	struct clk_bulk_data *clks;
> +};
> +
> +struct amlogic_i3c_drvdata {
> +	int (*fclk_rate_init)(struct svc_i3c_master *master,
> +			      struct clk *fclk, unsigned long rate);
> +};
> +
> +static int default_i3c_fclk_rate_init(struct svc_i3c_master *master,
> +				      struct clk *fclk, unsigned long rate)
> +{
> +	int err;
> +
> +	err = clk_set_rate(fclk, rate);
> +	if (err)
> +		return dev_err_probe(master->dev, err,
> +				     "setting fast clock rate failed\n");
> +
> +	return 0;
> +}
> +
> +static int ao_i3c_fclk_rate_init(struct svc_i3c_master *master,
> +				 struct clk *fclk, unsigned long rate)
> +{
> +	unsigned int div_cnt, reg_val;
> +	unsigned long fin_freq = clk_get_rate(fclk);
> +
> +	if (!fin_freq)
> +		return dev_err_probe(master->dev, -EINVAL,
> +				     "can't get I3C fast clock rate\n");
> +
> +	div_cnt = div64_u64(fin_freq, rate);
> +	if (!div_cnt || div_cnt > I3C_AO_FCLK_DIV_MASK)
> +		return dev_err_probe(master->dev, -EINVAL,
> +				     "requested fast clock frequency too low\n");
> +
> +	reg_val = I3C_AO_FCLK_DIV_EN | I3C_AO_FCLK_EN | (div_cnt - 1);
> +	writel(reg_val, master->regs + I3C_AO_FCLK_DIV_CTRL);
> +
> +	return 0;
> +}

You could also create a clock divider, register it and use a common clk_set_rate()
for both setups.

Neil

> +
> +static int amlogic_i3c_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	const struct amlogic_i3c_drvdata *data;
> +	struct svc_i3c_master *master;
> +	struct amlogic_i3c_priv *priv;
> +	struct clk *fclk;
> +	int ret, i;
> +
> +	master = svc_i3c_master_alloc(dev);
> +	if (!master)
> +		return -ENOMEM;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	master->drvdata = of_device_get_match_data(dev);
> +	if (!master->drvdata)
> +		return -EINVAL;
> +
> +	data = master->drvdata->bsp_data;
> +	if (!data)
> +		return -EINVAL;
> +
> +	master->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(master->regs))
> +		return PTR_ERR(master->regs);
> +
> +	master->irq = platform_get_irq(pdev, 0);
> +	if (master->irq < 0)
> +		return master->irq;
> +
> +	priv->num_clks = devm_clk_bulk_get_all(dev, &priv->clks);
> +	if (priv->num_clks < 0)
> +		return dev_err_probe(dev, -EINVAL, "can't get I3C clocks\n");
> +
> +	for (i = 0; i < priv->num_clks; i++) {
> +		if (!strcmp(priv->clks[i].id, "fast_clk"))
> +			break;
> +	}
> +
> +	if (i == priv->num_clks)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "can't get I3C peripheral clock\n");
> +
> +	if (IS_ERR(priv->clks[i].clk))
> +		return PTR_ERR(priv->clks[i].clk);
> +	fclk = priv->clks[i].clk;
> +
> +	ret = clk_bulk_prepare_enable(priv->num_clks, priv->clks);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "can't enable I3C clocks\n");
> +
> +	master->dev = dev;
> +	master->bsp_priv = priv;
> +	ret = data->fclk_rate_init(master, fclk, I3C_DEFAULT_FCLK_RATE);
> +	if (ret)
> +		goto err_disable_clks;
> +	master->fclk_rate = I3C_DEFAULT_FCLK_RATE;
> +
> +	pm_runtime_set_autosuspend_delay(dev, SVC_I3C_PM_TIMEOUT_MS);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_get_noresume(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +
> +	ret = svc_i3c_master_probe(pdev, master);
> +	if (ret)
> +		goto rpm_disable;
> +
> +	platform_set_drvdata(pdev, master);
> +	pm_runtime_put_autosuspend(dev);
> +
> +	return 0;
> +
> +rpm_disable:
> +	pm_runtime_dont_use_autosuspend(dev);
> +	pm_runtime_put_noidle(dev);
> +	pm_runtime_disable(dev);
> +	pm_runtime_set_suspended(dev);
> +
> +err_disable_clks:
> +	clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
> +
> +	return ret;
> +}
> +
> +static void amlogic_i3c_remove(struct platform_device *pdev)
> +{
> +	struct svc_i3c_master *master = platform_get_drvdata(pdev);
> +
> +	svc_i3c_master_remove(master);
> +
> +	pm_runtime_dont_use_autosuspend(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
> +}
> +
> +static int __maybe_unused amlogic_i3c_runtime_suspend(struct device *dev)
> +{
> +	struct svc_i3c_master *master = dev_get_drvdata(dev);
> +	struct amlogic_i3c_priv *priv = master->bsp_priv;
> +
> +	svc_i3c_save_regs(master);
> +	clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
> +	pinctrl_pm_select_sleep_state(dev);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused amlogic_i3c_runtime_resume(struct device *dev)
> +{
> +	struct svc_i3c_master *master = dev_get_drvdata(dev);
> +	struct amlogic_i3c_priv *priv = master->bsp_priv;
> +	int ret;
> +
> +	pinctrl_pm_select_default_state(dev);
> +	ret = clk_bulk_prepare_enable(priv->num_clks, priv->clks);
> +	if (ret)
> +		return ret;
> +
> +	svc_i3c_restore_regs(master);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops amlogic_i3c_pm_ops = {
> +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				      pm_runtime_force_resume)
> +	SET_RUNTIME_PM_OPS(amlogic_i3c_runtime_suspend,
> +			   amlogic_i3c_runtime_resume, NULL)
> +};
> +
> +static const struct amlogic_i3c_drvdata amlogic_i3c_data = {
> +	.fclk_rate_init = default_i3c_fclk_rate_init,
> +};
> +
> +static const struct amlogic_i3c_drvdata amlogic_i3c_ao_data = {
> +	.fclk_rate_init = ao_i3c_fclk_rate_init,
> +};
> +
> +static const struct svc_i3c_drvdata amlogic_a9_drvdata = {
> +	.quirks = SVC_I3C_QUIRK_FIFO_EMPTY |
> +		SVC_I3C_QUIRK_FALSE_SLVSTART |
> +		SVC_I3C_QUIRK_DAA_CORRUPT,
> +	.bsp_data = &amlogic_i3c_data,
> +};
> +
> +static const struct svc_i3c_drvdata amlogic_a9_ao_drvdata = {
> +	.quirks = SVC_I3C_QUIRK_FIFO_EMPTY |
> +		SVC_I3C_QUIRK_FALSE_SLVSTART |
> +		SVC_I3C_QUIRK_DAA_CORRUPT,
> +	.bsp_data = &amlogic_i3c_ao_data,
> +};
> +
> +static const struct of_device_id amlogic_i3c_of_match_tbl[] = {
> +	{ .compatible = "amlogic,i3c-a9", .data = &amlogic_a9_drvdata },
> +	{ .compatible = "amlogic,i3c-ao-a9", .data = &amlogic_a9_ao_drvdata },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, amlogic_i3c_of_match_tbl);
> +
> +static struct platform_driver amlogic_i3c_master = {
> +	.probe = amlogic_i3c_probe,
> +	.remove = amlogic_i3c_remove,
> +	.driver = {
> +		.name = "amlogic-i3c-master",
> +		.of_match_table = amlogic_i3c_of_match_tbl,
> +		.pm = &amlogic_i3c_pm_ops,
> +	},
> +};
> +module_platform_driver(amlogic_i3c_master);
> +
> +MODULE_AUTHOR("Junyi Zhao <junyi.zhao@amlogic.com>");
> +MODULE_DESCRIPTION("Amlogic I3C master driver");
> +MODULE_LICENSE("GPL");
> 

