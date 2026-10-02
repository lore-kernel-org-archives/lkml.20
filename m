Received: from mail-ed2-f33.google.com (mail-ed2-f33.google.com [74.125.228.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA085012A3
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790959636; cv=none; b=Z24rU+Nd4KRdKcWkFvuymSuA7ylybySCqFb0HBnMTdD3tL6ep+Yph3Qq3K1COk9yvNN1g7rjlOYlHovkcfBdD9NuBRkjnDbJG7wSfYqOvFrCjan53cJz+7pyNHe44phymYxjxWKZkxXvByauvqxnr+duUF5zT+IgdbGPu0RsW70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790959636; c=relaxed/simple;
	bh=lxRMV4WNZd97e9NA1Vo8JkTiV00PFppU+2Bzmt97/gM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kaTriZBe5h5ilQvna2ksrspfgX52ErDABi5LSVECMtObZOTO5m+Znw1AqLYfQj3YVVy+Dgg+o0Oh6PLm9vOSB4owKy+VD2LjtMU0e6zKFJALgtd6w6VQpKUQ+bWvoVVSMwfB4OdaWSlmHr8QasWECtMYqTtIDa5XnTU7hFft9zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=SiKTrJ9Y; arc=none smtp.client-ip=74.125.228.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="SiKTrJ9Y"
Received: by mail-ed2-f33.google.com with SMTP id 4fb4d7f45d1cf-6ac768bda6aso10051123a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1790959631; x=1791564431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gQxZFNe1rWBibsrSm2fJpFRrCL8XwGmShlpoXQZ+uig=;
        b=SiKTrJ9YTKJhBX8hlQa8yHSGAbwVhMMRoQGyzB5OAa+RFnBeHvSGhhsCfxyR57P25q
         sDKZcxqO4wiU08bJ1JBgSvZDRyqZyiMKxmPYHFZT7IzlE3eOWh5nV3BVLev2jFHNkBqx
         WMMYoCotcTLAUqZx72aJ5bqToV3H/WKx4SoAAmJfMcrjR4fDnlTmFPzIGUdGkgSCyyeH
         3WzdcQR3vYDG+qUGRrf+Ip52LHDB+48vOVnb8p2XOkU/UxNzNxci2FHUsJjn5fIwnKRV
         p3WE2FUoBfHGU4m05xg7wm71t6ix7qNm02RP5lwYQtXURjOaRTtG13XKlSO8ugTM6drf
         WCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790959631; x=1791564431;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gQxZFNe1rWBibsrSm2fJpFRrCL8XwGmShlpoXQZ+uig=;
        b=jnvNSKgnSlF+laAkV+1MAf6o31+IxQnDn8hAcodoTS3qWVyTzlTjN5/t2rZtnWjSpl
         6d69U+VPz3vPkyg6FG5Q+2jVmRy+3T1VWVJcWDcCsfTYH2OLJt/ZZOFsBMf84RP1vpmZ
         1KIIHtLXXxfLCUa+OBPyhlb+z8Tuit1+HpRneRRZwQdTuu6WBURkdpf66US7UyB1sR+M
         SqKpcUtEewYFdwNMtzeBjObxvZJFvVgSQ4c5RN6zQ4RKo6MPr6aIlE4K49JZKlTHlm+U
         O9l7uUR78NdmmtAbUGr3kh9yzJeDbqtn3Foud69aMZCEuuBHaybzi+7DmxIuN7zEUqyL
         1e1g==
X-Forwarded-Encrypted: i=1; AKwUvBwaD4cwETwgwmqfj3rm2F8CJpwpLP905nLF2BRjMkvFoxk0NWTB7dM/JZ+IVAjuSAvQTMgxJccDECJN8gk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPIvtcGLcFWKboT4GLvJA8fQ0bCL3ipJggC0JTPG70I4QkH9ma
	0a4RPUwyRmDWn1m/NrtXipuozZ7T5E1gc8eWsUARjOS/KOmOMu9U4hoyHuJjliC3ex0=
X-Gm-Gg: AYBFou3kjX8EJ7VMatElfQthWsQxeKcH2Ef6dWe5BWPUMfypDVSIMIeCl9Z5dS9zDXC
	paEFMaMZU5S0nfs50eJxRgDu26TGgPJ3Uix3NTwJ0TWuge7kR4QF+C57gUWHxb5T9UPtajpdHvK
	P/j1aYa5oN7efstnDkCRz9lyla2eacxWlYMF9IM47koFwooGiDDXqtNrOo2FkbTzcmL3w+2nzKY
	xJY/PwnQs3G3Cg+BwqYlnmfWAMAOhBH7q7NnMk6NNyQtGQqXzQudSDYFf66O/5n0NkzyhOAdgrA
	v7fBaN1hpLaF+19MWfB0G+dra4VmKN+YfuTQV2X8yoJKtSko74fywRWK4h3lbpstpgS5pkAuOfn
	irpyI943mBdnWtxLMo4fklISKxwPkrvzcgJfSBfMxxXfGsmjlZDSekJCO3x3FEiGUjBV9IPDLgq
	AJYy4QItqqFZjLlaVMnyBRtr4/r1U9Wtlt8EdxoPy4nmQW9blslhcOg3GgNDh4wd1Q1MX/ytcmA
	sxZSntP+H7a75uMPHnMgdogbASZIwCJ5mt0dJe2TsyX8gL7Bho=
X-Received: by 2002:a17:907:c02:b0:c2e:4292:d268 with SMTP id a640c23a62f3a-c2e4aac822amr274357466b.16.1790959631108;
        Fri, 02 Oct 2026 09:47:11 -0700 (PDT)
Received: from ?IPV6:2a01:599:841:224a:bb33:b9f8:dc3b:fc30? ([2a01:599:841:224a:bb33:b9f8:dc3b:fc30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf680ddsm101999566b.52.2026.10.02.09.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 09:47:10 -0700 (PDT)
Message-ID: <9cfcd3e7-bbc3-47c6-ad43-72b595a90110@9elements.com>
Date: Fri, 2 Oct 2026 18:47:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] soc: aspeed: Add B650D4U power passthrough support
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, joel@jms.id.au, ryan_chen@aspeedtech.com,
 Andrew Jeffery <andrew@codeconstruct.com.au>
References: <20261002131634.113680-1-prasanth.padarthi10@gmail.com>
Content-Language: en-US
From: Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <20261002131634.113680-1-prasanth.padarthi10@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/2/26 3:16 PM, Prasanth Kumar Padarthi wrote:
> Add the AST2600 SCU passthrough selector support used by the
> ASRock Rack B650D4U host power-control circuit. This RFC includes
> the driver, Devicetree binding, and board node to discuss the final
> kernel-facing interface.
> 
> Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>

This is definitely not the way how to solve this. I've already said on 
linux-aspeed as well as off-the-list, requesting the GPIO lines is 
enough and enabling GPIOP passthrough here does not make any sense, as 
it would be disabled by pinctrl anyways.
There's a whole implementation in userspace to solve this issue (at 
least if you use OpenBMC). The issue you're facing here is, from my 
point of view, a configuration error, and you'll not solve it with a 
kernel driver that literally just enables GPIOP passthrough...

So my answer to this patch is:
NACKed-by: Tan Siewert <tan.siewert@9elements.com>

> ---
>   .../asrock,b650d4u-power-passthrough.yaml     |  23 ++++
>   .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  |   5 +
>   drivers/soc/aspeed/Kconfig                    |   9 ++
>   drivers/soc/aspeed/Makefile                   |   1 +
>   drivers/soc/aspeed/aspeed-b650d4u-power.c     | 110 ++++++++++++++++++
>   5 files changed, 148 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/soc/aspeed/asrock,b650d4u-power-passthrough.yaml
>   create mode 100644 drivers/soc/aspeed/aspeed-b650d4u-power.c
> 
> diff --git a/Documentation/devicetree/bindings/soc/aspeed/asrock,b650d4u-power-passthrough.yaml b/Documentation/devicetree/bindings/soc/aspeed/asrock,b650d4u-power-passthrough.yaml
> new file mode 100644
> index 000000000000..e6451d17955c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/aspeed/asrock,b650d4u-power-passthrough.yaml
> @@ -0,0 +1,23 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/aspeed/asrock,b650d4u-power-passthrough.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASRock Rack B650D4U power passthrough
> +
> +maintainers:
> +  - Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: asrock,b650d4u-power-passthrough
> +
> +  aspeed,scu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +required:
> +  - compatible
> +  - aspeed,scu
> +
> +additionalProperties: false
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> index a4e384588a54..86291c250562 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> @@ -32,6 +32,11 @@ gfx_memory: framebuffer {
>   			size = <0x01000000>;
>   		};
>   	};
> +
> +	host-power-passthrough {
> +		compatible = "asrock,b650d4u-power-passthrough";
> +		aspeed,scu = <&syscon>;
> +	};
>   };
>   
>   &fmc {
> diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
> index 11e4db998c06..1b0281e0bfb0 100644
> --- a/drivers/soc/aspeed/Kconfig
> +++ b/drivers/soc/aspeed/Kconfig
> @@ -58,6 +58,15 @@ config ASPEED_SBC
>   	  Say yes to provide information about the secure boot controller in
>   	  debugfs.
>   
> +config ASPEED_B650D4U_POWER
> +	tristate "ASRock B650D4U host power passthrough"
> +	select REGMAP
> +	select MFD_SYSCON
> +	default ARCH_ASPEED
> +	help
> +	  Enable the AST2600 GPIO passthrough selector used by the
> +	  ASRock Rack B650D4U host power-control circuit. This selector routes the host power pulse through the board's passthrough logic during power sequencing.
> +
>   config ASPEED_XDMA
>   	tristate "ASPEED XDMA Engine Driver"
>   	select REGMAP
> diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
> index 5f61bb4cc36c..3e9618d1eafc 100644
> --- a/drivers/soc/aspeed/Makefile
> +++ b/drivers/soc/aspeed/Makefile
> @@ -5,4 +5,5 @@ obj-$(CONFIG_ASPEED_UART_ROUTING)	+= aspeed-uart-routing.o
>   obj-$(CONFIG_ASPEED_P2A_CTRL)		+= aspeed-p2a-ctrl.o
>   obj-$(CONFIG_ASPEED_SOCINFO)		+= aspeed-socinfo.o
>   obj-$(CONFIG_ASPEED_SBC)		+= aspeed-sbc.o
> +obj-$(CONFIG_ASPEED_B650D4U_POWER)	+= aspeed-b650d4u-power.o
>   obj-$(CONFIG_ASPEED_XDMA)		+= aspeed-xdma.o
> diff --git a/drivers/soc/aspeed/aspeed-b650d4u-power.c b/drivers/soc/aspeed/aspeed-b650d4u-power.c
> new file mode 100644
> index 000000000000..22a6925539dc
> --- /dev/null
> +++ b/drivers/soc/aspeed/aspeed-b650d4u-power.c
> @@ -0,0 +1,110 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/device.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/mutex.h>
> +#include <linux/kstrtox.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/bits.h>
> +
> +#define ASPEED_SCU_PROTECTION        0x000
> +#define ASPEED_SCU_GPIO_PASSTHROUGH  0x4bc
> +#define ASPEED_SCU_GPIO_ACTION       0x51c
> +#define ASPEED_SCU_UNLOCK_KEY        0x1688a8a8
> +#define ASPEED_B650D4U_POWER_MASK    GENMASK(27, 26)
> +
> +static struct regmap *b650d4u_scu;
> +static DEFINE_MUTEX(b650d4u_lock);
> +
> +static int b650d4u_set_passthrough(bool enable)
> +{
> +	int ret;
> +
> +	mutex_lock(&b650d4u_lock);
> +
> +	ret = regmap_write(b650d4u_scu, ASPEED_SCU_PROTECTION,
> +			   ASPEED_SCU_UNLOCK_KEY);
> +	if (ret) {
> +		pr_err("B650D4U: SCU unlock failed: %d\n", ret);
> +		goto out;
> +	}
> +
> +	ret = regmap_update_bits(b650d4u_scu,
> +				 ASPEED_SCU_GPIO_PASSTHROUGH,
> +				 ASPEED_B650D4U_POWER_MASK,
> +				 enable ? ASPEED_B650D4U_POWER_MASK : 0);
> +	if (ret) {
> +		pr_err("B650D4U: passthrough update failed: %d\n", ret);
> +		goto out;
> +	}
> +
> +	if (!enable)
> +		ret = regmap_write(b650d4u_scu,
> +				   ASPEED_SCU_GPIO_ACTION, 0);
> +
> +out:
> +	mutex_unlock(&b650d4u_lock);
> +	return ret;
> +}
> +
> +static ssize_t passthrough_store(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *buf, size_t count)
> +{
> +	bool enable;
> +	int ret;
> +
> +	ret = kstrtobool(buf, &enable);
> +	if (ret)
> +		return ret;
> +
> +	ret = b650d4u_set_passthrough(enable);
> +	return ret ? ret : count;
> +}
> +static DEVICE_ATTR_WO(passthrough);
> +
> +static int aspeed_b650d4u_power_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	b650d4u_scu = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
> +						      "aspeed,scu");
> +	if (IS_ERR(b650d4u_scu))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(b650d4u_scu),
> +				     "failed to get AST2600 SCU regmap\n");
> +
> +	ret = b650d4u_set_passthrough(true);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to enable power GPIO passthrough\n");
> +
> +	ret = device_create_file(&pdev->dev, &dev_attr_passthrough);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to create passthrough control\n");
> +
> +	dev_info(&pdev->dev, "enabled GPIO passthrough selector 1\n");
> +	return 0;
> +}
> +
> +static const struct of_device_id aspeed_b650d4u_power_of_match[] = {
> +	{ .compatible = "asrock,b650d4u-power-passthrough" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, aspeed_b650d4u_power_of_match);
> +
> +static struct platform_driver aspeed_b650d4u_power_driver = {
> +	.probe = aspeed_b650d4u_power_probe,
> +	.driver = {
> +		.name = "aspeed-b650d4u-power",
> +		.of_match_table = aspeed_b650d4u_power_of_match,
> +	},
> +};
> +module_platform_driver(aspeed_b650d4u_power_driver);
> +
> +MODULE_DESCRIPTION("ASRock Rack B650D4U host power GPIO passthrough");
> +MODULE_LICENSE("GPL");

