Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115CA5452B3;
	Thu, 17 Sep 2026 13:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789652491; cv=none; b=TElaSXQAGQQQaJ6oIAowwutBE+WCqB/oZJMUjohM/RPKIS7X9zfe6x3QBvsiaieUbLkG6JcX8lQeX858pWSl2TYjFyDNR5wzcM7xOr7oOB+q7Egjtyykb9DAz56JE5uk+Z2ZtTUxqeWkdFD8+FnnLZdUQ0UuDpleaT7uzzq07gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789652491; c=relaxed/simple;
	bh=2I8IYPE4jK4J/34TcT0rn/Ucik7A413Pi2ivi1Aafkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WXqrmMJuBkHAbQjGoiMp8+vmvmY+dfQ9LKbYbUaeS8LMqmKz2Us9g5q9PvBMJeHrapAnEgWevCeXPxqVts47a6Nwk2PsiLR1Uz3QU8Ot8lRy9fLPZAbxZqq7UNh6Pdotm/+U+4Syv5jt1xyo+h2ZPmDATch4z33I83Ktjyo5q54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Yor3PFAs; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Yor3PFAs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789652475;
	bh=2I8IYPE4jK4J/34TcT0rn/Ucik7A413Pi2ivi1Aafkc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Yor3PFAsld/Sk7hwTH66NORlEGrS2Z5+yn28LYDI8ReNtlNWl9eNl3T5TgfUx3nhY
	 cw81iZ6gxoL4n+v0BE5JGblEOaqYTlgd96wq5B1babozBEPPrlV4RRrmh9Ur5ngSie
	 8p8KzekU+itHLKDpYUFYTor1fBw/Xzl8YpHVsv2mb8asHZoQ6maGFNFsb+0IQzZOq7
	 5zcdUrVrnA8jOKJJLY6Gma5L3NXS3T+IKXGfv38/RFmh7tFe/4Od/C02dtaSn5/RX8
	 YStcKMvtTrDD2s3vBBTH49IFIeUEmPkTC6NJJJkaR86nuommroKVWjodhd5IYCRkwB
	 F2d3W0GAwJh+A==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F40AF17E03B6;
	Thu, 17 Sep 2026 15:41:14 +0200 (CEST)
Message-ID: <b3b2f2ae-1eb1-4d3d-9f4b-4de3868802f1@collabora.com>
Date: Thu, 17 Sep 2026 15:41:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] usb: mtu3: introduce platform data
To: rva333@protonmail.com, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260917-6595-mtu3-v1-0-a2ba7c230d68@protonmail.com>
 <20260917-6595-mtu3-v1-2-a2ba7c230d68@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260917-6595-mtu3-v1-2-a2ba7c230d68@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/26 09:32, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 

That's good, but the commit title doesn't explain anything.

usb: mtu3: Add SoC platform data for FIFO slots ?

...or anything else that actually explains what you're doing.

> Some SoCs, such as mt6595, require specific quirks for the MTU3 to
> function properly.
> 
> The mt6595 IP block doesn't support multiple slots for the FIFO,
> resulting FIFO wrap.
> 
> Fix this by adding platform data with a field to handle FIFO limitation.

Well, also say that this commit brings no functional differences for the
currently supported SoCs :-)

> 
> Assisted-by: LLM (debugging)
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>   drivers/usb/mtu3/mtu3.h        | 9 +++++++++
>   drivers/usb/mtu3/mtu3_core.c   | 5 +++++
>   drivers/usb/mtu3/mtu3_gadget.c | 8 ++++++--
>   drivers/usb/mtu3/mtu3_plat.c   | 8 ++++++--
>   4 files changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
> index ba5a63669e5f..1258aa7483aa 100644
> --- a/drivers/usb/mtu3/mtu3.h
> +++ b/drivers/usb/mtu3/mtu3.h
> @@ -315,6 +315,14 @@ static inline struct ssusb_mtk *dev_to_ssusb(struct device *dev)
>   	return dev_get_drvdata(dev);
>   }
>   
> +/**
> + * struct mtu3_platform_data - platform data for the driver.
> + * @single_slot: the IP can handle only one buffer for bulk transfers
> + */
> +struct mtu3_platform_data {
> +	bool single_slot;

bool fifo_single_slot ?

> +};
> +
>   /**
>    * struct mtu3 - device driver instance data.
>    * @slot: MTU3_U2_IP_SLOT_DEFAULT for U2 IP only,
> @@ -369,6 +377,7 @@ struct mtu3 {
>   	unsigned connected:1;
>   	unsigned async_callbacks:1;
>   	unsigned separate_fifo:1;
> +	unsigned single_slot:1;

unsigned fifo_single_slot:1 ?

...or you can bring the entire pdata structure in there for easy future extension.
Your choice.

>   
>   	u8 address;
>   	u8 test_mode_nr;
> diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
> index 66dbfe1705d5..03e28c93bc51 100644
> --- a/drivers/usb/mtu3/mtu3_core.c
> +++ b/drivers/usb/mtu3/mtu3_core.c
> @@ -923,6 +923,7 @@ int ssusb_gadget_init(struct ssusb_mtk *ssusb)
>   {
>   	struct device *dev = ssusb->dev;
>   	struct platform_device *pdev = to_platform_device(dev);
> +	const struct mtu3_platform_data *pdata = NULL;
>   	struct mtu3 *mtu = NULL;
>   	int ret = -ENOMEM;
>   
> @@ -930,6 +931,10 @@ int ssusb_gadget_init(struct ssusb_mtk *ssusb)
>   	if (mtu == NULL)
>   		return -ENOMEM;
>   
> +	pdata = device_get_match_data(dev);
> +	if (pdata)

Checking if there's any pdata is redundant, since you have already correctly
assigned pdata to all of the of_match entries.

Cheers,
Angelo

> +		mtu->single_slot = pdata->single_slot;
> +
>   	mtu->irq = platform_get_irq_byname_optional(pdev, "device");
>   	if (mtu->irq < 0) {
>   		if (mtu->irq == -EPROBE_DEFER)
> diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
> index f224f2ee379a..bfacb1ba152e 100644
> --- a/drivers/usb/mtu3/mtu3_gadget.c
> +++ b/drivers/usb/mtu3/mtu3_gadget.c
> @@ -112,8 +112,12 @@ static int mtu3_ep_enable(struct mtu3_ep *mep)
>   	mep->ep.desc = desc;
>   	mep->ep.comp_desc = comp_desc;
>   
> -	/* slot mainly affects bulk/isoc transfer, so ignore int */
> -	mep->slot = usb_endpoint_xfer_int(desc) ? 0 : mtu->slot;
> +	if (mtu->single_slot)
> +		/* older IPs can handle only one slot reliably */
> +		mep->slot = 0;
> +	else
> +		/* slot mainly affects bulk/isoc transfer, so ignore int */
> +		mep->slot = usb_endpoint_xfer_int(desc) ? 0 : mtu->slot;
>   
>   	ret = mtu3_config_ep(mtu, mep, interval, burst, mult);
>   	if (ret < 0)
> diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
> index cc8a864dbd63..bc65acdfb0de 100644
> --- a/drivers/usb/mtu3/mtu3_plat.c
> +++ b/drivers/usb/mtu3/mtu3_plat.c
> @@ -611,9 +611,13 @@ static const struct dev_pm_ops mtu3_pm_ops = {
>   
>   #define DEV_PM_OPS (IS_ENABLED(CONFIG_PM) ? &mtu3_pm_ops : NULL)
>   
> +static const struct mtu3_platform_data mt8173_platform_data = {
> +	.single_slot = false,
> +};
> +
>   static const struct of_device_id mtu3_of_match[] = {
> -	{.compatible = "mediatek,mt8173-mtu3",},
> -	{.compatible = "mediatek,mtu3",},
> +	{ .compatible = "mediatek,mt8173-mtu3", .data = &mt8173_platform_data },
> +	{ .compatible = "mediatek,mtu3", .data = &mt8173_platform_data },
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, mtu3_of_match);
> 

