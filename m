Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01343AEB2D;
	Tue, 22 Sep 2026 11:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077202; cv=none; b=Xa5iEaTcjTkx7U9ZluDs3vu3VMTwjaRlqh+fOnWhpfd1UyMmgdD7NszfUdAC9Dmo2CmmCTuI6RGpoj8ETX2YeHNXxVaXmedVfOREqQLMsC/rD73ZDvfKsHCDE3etYsqlDty917cR7ksjDMBkGFTDODuvZwqSTV5fN3hV2+JVlZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077202; c=relaxed/simple;
	bh=I+P7ifGDVyf6f2n5jCSjq23+QEv/c5084lNzdK+YCqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ffX9TdMwDSIp+kcS1lvU5TU/wRig+1WEYerytTzu7atUqYkkqI4+MI9MR+f0Phg2zu9TZZ8iqeZGySKp9uarmyV043NlLJBtAVU/3iERBDtHG5doOvlGzHdCP+UBkvUZLpvEiV3d6fiDKd6OtkYT//gm8aXrYUSQeKoLjOTzMDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ESr7paz0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ESr7paz0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077192;
	bh=I+P7ifGDVyf6f2n5jCSjq23+QEv/c5084lNzdK+YCqI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=ESr7paz04/j4sPbBqfg8VWS/fAlgQI5L2fdhADsLjlTdvJBu5FRyURwZh/6yCT29+
	 F2ohzfUBnRM+b8H9pdQaIk657lekrS1ycw79tCvg4QjDHxNEBGAWfnQKKmqxjksL8v
	 LaGX/xnyrar3JCDHkc31WUEzN1l0gHej0aDTL3WvMhQXftc3dhpVE0vbfHeq8K87Lr
	 jrLVcPiqdR3Oe1Q3A23Ii4FvwBSwDVtqMNX7DeC+TFOzbvLCEATIIIvSDGg+lQxTHc
	 rPm6QkyU7s+0mMXH5HpIpOAlqFkIaNhIBsa+588Q/B/L+jbKc/dsyo2I2vBNB/rjb5
	 siXgA9X9yFiKw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3983B17E03B6;
	Tue, 22 Sep 2026 13:39:52 +0200 (CEST)
Message-ID: <32d02591-406b-4460-9a87-ec1f883f3b2c@collabora.com>
Date: Tue, 22 Sep 2026 13:39:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 12/12] media: mediatek: jpeg: add jpeg smmu sid
 setting
To: Kyrie Wu <kyrie.wu@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bin Liu <bin.liu@mediatek.com>,
 kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
 Hans Verkuil <hverkuil@kernel.org>, irui wang <irui.wang@mediatek.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260922091530.241762-1-kyrie.wu@mediatek.com>
 <20260922091530.241762-13-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260922091530.241762-13-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 11:15, Kyrie Wu wrote:
> Add a configuration to set jpeg dec & enc smmu sid
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>   .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 29 +++++++++++++++++++
>   .../platform/mediatek/jpeg/mtk_jpeg_core.h    | 15 ++++++++++
>   .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 23 +++++++++++++++
>   .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 23 +++++++++++++++
>   4 files changed, 90 insertions(+)
> 

..snip..

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index 07452249b..3058fdf4f 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -613,6 +613,25 @@ static int mtk_jpegdec_hw_init_irq(struct mtk_jpegdec_comp_dev *dev)
>   	return 0;
>   }
>   
> +static int mtk_jpegdec_smmu_init(struct mtk_jpegdec_comp_dev *dev)
> +{
> +	struct mtk_jpeg_dev *master_dev = dev->master_dev;
> +
> +	if (!master_dev->variant->support_smmu)
> +		return 0;
> +
> +	dev->smmu_regmap =
> +		syscon_regmap_lookup_by_phandle(dev->plat_dev->dev.of_node,
> +						"mediatek,smmu-config");

Where is this property being introduced? I don't see any binding change for this.

Besides, is smmu-config in the multimedia smmu iospace?
That'd be wrong and wouldn't really work.

Cheers,
Angelo

> +	if (IS_ERR(dev->smmu_regmap)) {
> +		return dev_err_probe(dev->dev, PTR_ERR(dev->smmu_regmap),
> +				     "mmap smmu_base failed(%pe)\n",
> +				     dev->smmu_regmap);
> +	}
> +
> +	return 0;
> +}
> +
>   static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
>   {
>   	struct mtk_jpegdec_clk *jpegdec_clk;
> @@ -665,6 +684,10 @@ static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
>   	master_dev->reg_decbase[i] = dev->reg_base;
>   	dev->master_dev = master_dev;
>   
> +	ret = mtk_jpegdec_smmu_init(dev);
> +	if (ret)
> +		return ret;
> +
>   	platform_set_drvdata(pdev, dev);
>   	pm_runtime_enable(&pdev->dev);
>   
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index c7954af0e..506a49d1a 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -338,6 +338,25 @@ static int mtk_jpegenc_hw_init_irq(struct mtk_jpegenc_comp_dev *dev)
>   	return 0;
>   }
>   
> +static int mtk_jpegenc_smmu_init(struct mtk_jpegenc_comp_dev *dev)
> +{
> +	struct mtk_jpeg_dev *master_dev = dev->master_dev;
> +
> +	if (!master_dev->variant->support_smmu)
> +		return 0;
> +
> +	dev->smmu_regmap =
> +		syscon_regmap_lookup_by_phandle(dev->plat_dev->dev.of_node,
> +						"mediatek,smmu-config");
> +	if (IS_ERR(dev->smmu_regmap)) {
> +		return dev_err_probe(dev->dev, PTR_ERR(dev->smmu_regmap),
> +				     "mmap smmu_base failed(%pe)\n",
> +				     dev->smmu_regmap);
> +	}
> +
> +	return 0;
> +}
> +
>   static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
>   {
>   	struct mtk_jpegenc_clk *jpegenc_clk;
> @@ -388,6 +407,10 @@ static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
>   	master_dev->reg_encbase[i] = dev->reg_base;
>   	dev->master_dev = master_dev;
>   
> +	ret = mtk_jpegenc_smmu_init(dev);
> +	if (ret)
> +		return ret;
> +
>   	platform_set_drvdata(pdev, dev);
>   	pm_runtime_enable(&pdev->dev);
>   
