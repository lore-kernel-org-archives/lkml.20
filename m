Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83434772B1;
	Wed, 23 Sep 2026 09:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156990; cv=none; b=pwgAXLKjhs5s3TJsDPa/+A90PVlKFnFdrOgCEvVxHrB51jY0IjSOsRAFxZpUeK6yY86jwaZtNkEfLQcATAWUglDa5S5LxlVzrZO6WaDwdRheAQw48v/VlzHYRkrYc4vUJaBsmhqzQTa/RUtXCu8tDbL82jv2N2AzH75jsOMYphg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156990; c=relaxed/simple;
	bh=0xs1aK+waLR/h64Dn98ERXS0Ct3KJtqXAJmX+rFh/oU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vE/sN8IHx6aXxyP0itPwUCNoZLnQXIJjU7RbN2WPiVFDFVeG31Lf8w4n39GEoroF521Wqcf0L0rYSB3lvV8UNhilfpGc8sA5oyTPQcTXQsshZYKezaSIgFfEPm2C+LxcLZgcqx/0Aab7Ct5w8kevS4bLktTyrSwroqKluGemzuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Vtphx4aT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Vtphx4aT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790156986;
	bh=0xs1aK+waLR/h64Dn98ERXS0Ct3KJtqXAJmX+rFh/oU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vtphx4aTmU8jfvrft1SoI/PuISbWncfFJzkoaPa9wuqpD75ekIkgSdGVA3qvHGyLa
	 +WfsOnrWMCK8tdgz4i181YAbKB5DNBgQVTJ5YulEYV6kEOArEmJmu9G6F1LfNSANAk
	 iHs3vUCAuHOGSrIluiMeQNI/vF94jWxXoExyWuFv5/0RWvj9k/8Qk90G+Etzub/XvS
	 A/aRXx2096Xx0fRZEmm+h8hw/TMhteAMIOhV07DQ0rUPUvLBKXY5cmSQ6FgK/a83PU
	 9VcD8eGD8J27pAQxHW21INZdaCyP83lQwawM6Resu3lZ2AYHZ1xZfDS5VBMOsY6K68
	 S05g9a1FnxW9g==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A20EC17E0803;
	Wed, 23 Sep 2026 11:49:45 +0200 (CEST)
Message-ID: <b32d6f95-08fe-49f9-a142-11597afd4263@collabora.com>
Date: Wed, 23 Sep 2026 11:49:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 02/10] media: mediatek: decoder: Add a new platform
 data member
To: Kyrie Wu <kyrie.wu@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Yilong Zhou <yilong.zhou@mediatek.com>
References: <20260923081246.268182-1-kyrie.wu@mediatek.com>
 <20260923081246.268182-3-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260923081246.268182-3-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/23/26 10:12, Kyrie Wu wrote:
> Move the chip model information into the codec match data
> and remove the second compatible matching code.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>   .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  |   2 +-
>   .../mediatek/vcodec/decoder/mtk_vcodec_dec.h  |   5 +
>   .../vcodec/decoder/mtk_vcodec_dec_drv.c       |  40 ++-----
>   .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  17 +--
>   .../vcodec/decoder/mtk_vcodec_dec_hw.c        |   2 +-
>   .../vcodec/decoder/mtk_vcodec_dec_stateful.c  |   1 +
>   .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 104 +++++++++++++-----
>   7 files changed, 96 insertions(+), 75 deletions(-)
> 

..snip..

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> index 53d1708b012b..153c617df78d 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> @@ -21,17 +21,6 @@
>   #define IS_VDEC_INNER_RACING(capability) ((capability) & MTK_VCODEC_INNER_RACING)
>   #define IS_VDEC_SUPPORT_EXT(capability) ((capability) & MTK_VDEC_IS_SUPPORT_EXT)
>   
> -enum mtk_vcodec_dec_chip_name {
> -	MTK_VDEC_INVAL = 0,
> -	MTK_VDEC_MT8173 = 8173,
> -	MTK_VDEC_MT8183 = 8183,
> -	MTK_VDEC_MT8186 = 8186,
> -	MTK_VDEC_MT8188 = 8188,
> -	MTK_VDEC_MT8192 = 8192,
> -	MTK_VDEC_MT8195 = 8195,
> -	MTK_VDEC_MT8196 = 8196,
> -};
> -
>   /*
>    * enum mtk_vdec_format_types - Structure used to get supported
>    *		  format types according to decoder capability
> @@ -108,6 +97,7 @@ struct vdec_pic_info {
>    *
>    * @is_subdev_supported: whether support parent-node architecture(subdev)
>    * @uses_stateless_api: whether the decoder uses the stateless API with requests
> + * @chip_model: platforms configuration values
>    */
>   struct mtk_vcodec_dec_pdata {
>   	void (*init_vdec_params)(struct mtk_vcodec_dec_ctx *ctx);
> @@ -129,6 +119,7 @@ struct mtk_vcodec_dec_pdata {
>   
>   	bool is_subdev_supported;
>   	bool uses_stateless_api;
> +	unsigned int chip_model;

I already gave my R-b but I just noticed:

Please use u16 here, 16 bits are way more than enough for this.

>   };
>   
>   /**
> @@ -277,7 +268,7 @@ struct mtk_vcodec_dec_ctx {
>    * @dec_racing_info_mutex: mutex lock used for inner racing mode
>    * @dbgfs: debug log related information
>    *
> - * @chip_name: used to distinguish platforms and select the correct codec configuration values
> + * @chip_model: used to distinguish platforms and select the correct codec configuration values
>    */
>   struct mtk_vcodec_dec_dev {
>   	struct v4l2_device v4l2_dev;
> @@ -321,7 +312,7 @@ struct mtk_vcodec_dec_dev {
>   	struct mutex dec_racing_info_mutex;
>   	struct mtk_vcodec_dbgfs dbgfs;
>   
> -	enum mtk_vcodec_dec_chip_name chip_name;
> +	unsigned int chip_model;

same here


Cheers,
Angelo
