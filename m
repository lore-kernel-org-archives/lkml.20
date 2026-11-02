Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626887;
	b=2LvB8HmNOZCVWl3e4HukPIiPwb+MYyYr5SUHPzu1L6C2JYQ/vl5FKRj6mhbpLWuYNB+l
	 1PQxv+QpWJ6E8UX2uJsgmg/7M5Dr1FH+STRR/E/6+dL2gCFjuyM7RkzzDIW55F1v8QJqN
	 oZQ5wPJ9Fka6O7dtJ08y1SYae/Hxd4o5fmhTilDjrb8JWs9lOhn6b+CejwvJUrJ3uEPjq
	 zM861/br2e34xgLiKh3X4qB85PelWtz0loABU73ZGMeBDibAX4fxyW3hUfZy9Ji2HFHxZ
	 /uCEYAUmxFXAlM94UWmjL3x/COx2PWUwJg6IWtYZKzn6hFMZNDhUS056FC3WhbqtT+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626887;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=vtv8xpZBrQmEjFIrQCBqz+2OdEy+M0+o1H6jKGcfgF8=;
	b=1Vj8Yz7lpsBNaza+i9W6wiV/MkWO4flBZlEC1RbuT+tLbVxwcEz5Ea9HocPXQW9sT01+
	 MKc1rrxoy6WnYF8v7lXXkJroqRfDTirM/fDyt1Jf66P+P6azg7r/EvSaoku76PIazkh5I
	 zmu58bRbtHytdmgAY80BzJM3waM4152X6IwFsx7/bTJ8nwsbvn9prHIZTmMaTGNiSu6QW
	 jfq3hXkUlHjQPyOeY2yD5WgZCr9PwAnpum9IDegxhAcIigDKn1kl7X5i9ci/bsQeURDBm
	 rULrIyfP3aPsVe8qjx7RKGMgWcZrHvpMusqZwU7U6tqWdXf9v3BhNCRAJUOnOR5aygg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="b/xvAP08";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C923606A905
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b/xvAP08
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E41001F00A16;
	Mon,  2 Nov 2026 13:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793626887;
	bh=vtv8xpZBrQmEjFIrQCBqz+2OdEy+M0+o1H6jKGcfgF8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=b/xvAP08Bjx1FeNnlpwwolEeQo0hJONCM7VpEqmBHaG4h7s3SJNzElndSbaWMvZB6
	 Dq0/W2YC9bV8CY5WAP0ydIBiEj3KyEpo9+xi5BHMzAokVP8KGx/rV4rs6iSyH4CVay
	 0pmi45x8rCpJ0FiRclcFpYh9TDPBKqwcjf6AYAtBl25tgHtzR5eC65odz9TGIi0QCt
	 XgbSOGyLVvJrKLIzSlNvjQ153VtlzhWlgq5xXtqSLyLe+zrsXdBX1adQ3lZTQLCLJQ
	 CMIf3wP0QtWwAeGQm2Qlz/dWg+OLyHyzssyfkU5psC1yJhMpZrsaKAAILFBviSWhix
	 z0TrzGzHiNmzA==
Message-ID: <9742cc0b-e371-4ca1-9ca0-ca3451c39310@kernel.org>
Date: Mon, 2 Nov 2026 14:41:21 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/11] soc: mediatek: dram-ecc: add the DRAM ECC
 driver skeleton
To: "santino.wang" <santino.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, light.chen@mediatek.com,
 Fred-WY.Chen@mediatek.com, arnab.layek@mediatek.com
References: <20261102092334.138759-1-santino.wang@mediatek.com>
 <20261102092334.138759-2-santino.wang@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261102092334.138759-2-santino.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/11/2026 10:23, santino.wang wrote:
> From: Santino Wang <santino.wang@mediatek.com>
> 
> On the MediaTek mt8992 SoC the secure firmware (ATF) owns the DRAM
> controller ECC interrupts and reports each corrected (CE) or
> uncorrectable (UCE) error to the OS as an ACPI GHES record. The
> following patches add the driver that consumes those records.
> 
> Add only the module skeleton here: the Kconfig entry, the Makefiles, a
> class device that the later patches attach their sysfs attributes to,
> and the MAINTAINERS entry.
> 
> Signed-off-by: Santino Wang <santino.wang@mediatek.com>
> ---
>  MAINTAINERS                                   |  9 ++++
>  drivers/soc/mediatek/Kconfig                  |  2 +
>  drivers/soc/mediatek/Makefile                 |  1 +
>  drivers/soc/mediatek/dram-ecc/Kconfig         | 16 ++++++
>  drivers/soc/mediatek/dram-ecc/Makefile        |  3 ++
>  drivers/soc/mediatek/dram-ecc/core/Makefile   |  6 +++
>  drivers/soc/mediatek/dram-ecc/core/main.c     | 53 +++++++++++++++++++
>  .../soc/mediatek/dram-ecc/core/mtk_dram_ecc.h | 24 +++++++++
>  8 files changed, 114 insertions(+)
>  create mode 100644 drivers/soc/mediatek/dram-ecc/Kconfig
>  create mode 100644 drivers/soc/mediatek/dram-ecc/Makefile
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/Makefile
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/main.c
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/mtk_dram_ecc.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aaf2825ac945..e7d25be97f24 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17026,6 +17026,15 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/dma/mediatek,*
>  F:	drivers/dma/mediatek/
>  
> +MEDIATEK DRAM ECC DRIVER
> +M:	Santino Wang <santino.wang@mediatek.com>
> +L:	linux-kernel@vger.kernel.org
> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	drivers/soc/mediatek/dram-ecc/
> +F:	include/uapi/linux/mtk_dram_ecc_netlink.h
> +
>  MEDIATEK ETHERNET DRIVER
>  M:	Felix Fietkau <nbd@nbd.name>
>  M:	Lorenzo Bianconi <lorenzo@kernel.org>
> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
> index d7293977f06e..91aed7d29be0 100644
> --- a/drivers/soc/mediatek/Kconfig
> +++ b/drivers/soc/mediatek/Kconfig
> @@ -89,4 +89,6 @@ config MTK_SOCINFO
>  	  information about the SoC to the userspace including the
>  	  manufacturer name, marketing name and soc name.
>  
> +source "drivers/soc/mediatek/dram-ecc/Kconfig"
> +
>  endmenu
> diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
> index 0665573e3c4b..880342bed606 100644
> --- a/drivers/soc/mediatek/Makefile
> +++ b/drivers/soc/mediatek/Makefile
> @@ -9,3 +9,4 @@ obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
>  obj-$(CONFIG_MTK_MMSYS) += mtk-mutex.o
>  obj-$(CONFIG_MTK_SVS) += mtk-svs.o
>  obj-$(CONFIG_MTK_SOCINFO) += mtk-socinfo.o
> +obj-y += dram-ecc/
> diff --git a/drivers/soc/mediatek/dram-ecc/Kconfig b/drivers/soc/mediatek/dram-ecc/Kconfig
> new file mode 100644
> index 000000000000..c015c66635b2
> --- /dev/null
> +++ b/drivers/soc/mediatek/dram-ecc/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# MediaTek DRAM ECC error handling driver
> +# See plat/mediatek/drivers/dram_ecc/ in ATF for the SMC handler side.
> +#
> +
> +# core/ -> mtk_dram_ecc.ko
> +config MTK_DRAM_ECC
> +	tristate "MediaTek DRAM ECC Error Handling Driver"
> +	depends on HAVE_ARM_SMCCC && ACPI_APEI_GHES
> +	default m
> +	help
> +	  Driver for MediaTek DRAM ECC runtime error handling. It works
> +	  with the secure firmware (ATF), which owns the DRAM controller
> +	  ECC interrupts and reports each corrected or uncorrectable
> +	  error to the OS as an ACPI GHES record.

Why is EDAC-like driver outside of edac subsystem? drivers/soc/ is not a
dumping ground.

> +
> +static int __init mtk_dram_ecc_init(void)
> +{
> +	int ret;
> +
> +	mtk_dram_ecc_class = class_create("mtk-dram-ecc");
> +	if (IS_ERR(mtk_dram_ecc_class))
> +		return PTR_ERR(mtk_dram_ecc_class);
> +
> +	mtk_dram_ecc_dev = device_create(mtk_dram_ecc_class, NULL,
> +					 MKDEV(0, 0), &mtk_ecc_data,
> +					 "mtk-dram-ecc0");
> +	if (IS_ERR(mtk_dram_ecc_dev)) {
> +		ret = PTR_ERR(mtk_dram_ecc_dev);
> +		goto err_class;
> +	}
> +
> +	dev_info(mtk_dram_ecc_dev, "initialized\n");

No, that's not a code style which exists in upstream.

> +	return 0;
> +
> +err_class:
> +	class_destroy(mtk_dram_ecc_class);
> +	return ret;
> +}
> +
> +static void __exit mtk_dram_ecc_exit(void)
> +{
> +	device_destroy(mtk_dram_ecc_class, MKDEV(0, 0));
> +	class_destroy(mtk_dram_ecc_class);
> +}
> +
Best regards,
Krzysztof
