Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77AB51EE1A;
	Tue, 22 Sep 2026 11:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077210; cv=none; b=i5goLI96rU3cLJBxcDxQSezx7YQcpwYfypyl3JG/hgJdxEpmWODTf1x3YMd5GX34gM6jt8l7nm/zUZiYfnqZWsCA4SF9WYKUuptQSvj/9MTF7CIUV41BhyHiVLQVyx78bh+DxeYSPuuv7JtZeHjUe30wtzpocrXU4v3ZQGuOkLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077210; c=relaxed/simple;
	bh=jU0zivh/mWkMF+ZUOXtIeerMJHXs/5HODo04g72cDis=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pYOLURHDxnzgYTLyrYtGAKvEwu3IH4tYuaSZY/IHj3GXwUnAXcziejxAZjt8awzZYi1wGUnWOgNnAr1g9oMCIssJpfd6/uoVjISyX0Lbjkf7V4MyntTNPXvWyZ+xPezohbfOMoPt/HltM9P5ew8k9eWgLbt0sJEcqTLcjCVhLWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RywuT+5W; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RywuT+5W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077198;
	bh=jU0zivh/mWkMF+ZUOXtIeerMJHXs/5HODo04g72cDis=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=RywuT+5WXwDhxSWe6NYpXkLtjgVrhB1MFQC4nPw/itrqeqndtcWNCpB0vbAID6dTB
	 XMlEIkhyJNZdPjz/MQ6q1v0XfLQjNO0a46gUnvHP421piHrfID8tz1t//GhgZpuBcR
	 r/eijk/O+le7/iJiqPL3nTunrzIurPYk6E00fWmhzAk2XyMWaKYpuLgYdNPBOdqAjT
	 g634sRC7RCJtZM60KFT54n3RjMjoNmXoJ+neDLONxdL79l4toMSU1I4wEH3D/ls0Mx
	 KEXQ735/FhsjYqZhrDG1MGwDX19MmT6TpuHjT4+vUTOpXCJmZwNmzSSvMQUMNT3pV0
	 zc/85o1BibmqA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9551217E0DF0;
	Tue, 22 Sep 2026 13:39:57 +0200 (CEST)
Message-ID: <8df54405-811e-47ac-94a2-7cf0873c066a@collabora.com>
Date: Tue, 22 Sep 2026 13:39:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 05/12] media: mediatek: jpeg: Fix multi-core clk
 suspend and resume setting
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
 <20260922091530.241762-6-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260922091530.241762-6-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 11:15, Kyrie Wu wrote:
> The suspend/resume callback function is defined in the dev_pm_ops
> structure, which is defined in platform_driver. For multiple-core
> architecture, each hardware driver will register a platform_driver
> structure, so it is necessary to add a suspend/resume callback
> function for each hardware to support this operation.
> 
> Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
> Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware")
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
>   .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 28 +++-------
>   .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 55 +++++++++++++++++--
>   .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 53 ++++++++++++++++--
>   3 files changed, 107 insertions(+), 29 deletions(-)
> 

..snip..

> @@ -673,11 +669,58 @@ static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +static int mtk_jpegdec_pm_suspend(struct device *dev)
> +{
> +	struct mtk_jpegdec_comp_dev *jpeg = dev_get_drvdata(dev);
> +
> +	clk_bulk_disable_unprepare(jpeg->jdec_clk.clk_num,
> +				   jpeg->jdec_clk.clks);
> +
> +	return 0;
> +}
> +
> +static int mtk_jpegdec_pm_resume(struct device *dev)
> +{
> +	struct mtk_jpegdec_comp_dev *jpeg = dev_get_drvdata(dev);
> +
> +	return clk_bulk_prepare_enable(jpeg->jdec_clk.clk_num,
> +				       jpeg->jdec_clk.clks);
> +}
> +
> +static int mtk_jpegdec_suspend(struct device *dev)
> +{
> +	struct mtk_jpegdec_comp_dev *jpeg = dev_get_drvdata(dev);
> +
> +	v4l2_m2m_suspend(jpeg->master_dev->m2m_dev);
> +
> +	return pm_runtime_force_suspend(dev);

Uhm, are you validating that the JPEG decoder IP is actually idle, or that
the job actually stopped, before forcing clk-off suspend?

I don't see that done anywhere... am I missing anything?

Also, can't we unify single and multicore suspend strategies?
That'd be nice for maintainability.

Cheers,
Angelo

> +}
> +
> +static int mtk_jpegdec_resume(struct device *dev)
> +{
> +	struct mtk_jpegdec_comp_dev *jpeg = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = pm_runtime_force_resume(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	v4l2_m2m_resume(jpeg->master_dev->m2m_dev);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops mtk_jpegdec_pm_ops = {
> +	SYSTEM_SLEEP_PM_OPS(mtk_jpegdec_suspend, mtk_jpegdec_resume)
> +	RUNTIME_PM_OPS(mtk_jpegdec_pm_suspend, mtk_jpegdec_pm_resume, NULL)
> +};
> +
>   static struct platform_driver mtk_jpegdec_hw_driver = {
>   	.probe = mtk_jpegdec_hw_probe,
>   	.driver = {
>   		.name = "mtk-jpegdec-hw",
>   		.of_match_table = mtk_jpegdec_hw_ids,
> +		.pm             = &mtk_jpegdec_pm_ops,
>   	},
>   };
>   
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index 44a064dc7..4a8559c35 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -263,13 +263,12 @@ static void mtk_jpegenc_timeout_work(struct work_struct *work)
>   	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
>   
>   	mtk_jpeg_enc_reset(cjpeg->reg_base);
> -	clk_disable_unprepare(cjpeg->venc_clk.clks->clk);
> -	pm_runtime_put(cjpeg->dev);
>   	cjpeg->hw_state = MTK_JPEG_HW_IDLE;
>   	atomic_inc(&master_jpeg->hw_rdy);
>   	wake_up(&master_jpeg->hw_wq);
>   	v4l2_m2m_buf_done(src_buf, buf_state);
>   	mtk_jpegenc_put_buf(cjpeg);
> +	pm_runtime_put(cjpeg->dev);
>   }
>   
>   static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
> @@ -303,12 +302,11 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
>   	buf_state = VB2_BUF_STATE_DONE;
>   	v4l2_m2m_buf_done(src_buf, buf_state);
>   	mtk_jpegenc_put_buf(jpeg);
> -	pm_runtime_put(ctx->jpeg->dev);
> -	clk_disable_unprepare(jpeg->venc_clk.clks->clk);
>   
>   	jpeg->hw_state = MTK_JPEG_HW_IDLE;
>   	wake_up(&master_jpeg->hw_wq);
>   	atomic_inc(&master_jpeg->hw_rdy);
> +	pm_runtime_put(jpeg->dev);
>   
>   	return IRQ_HANDLED;
>   }
> @@ -394,11 +392,58 @@ static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +static int mtk_jpegenc_pm_suspend(struct device *dev)
> +{
> +	struct mtk_jpegenc_comp_dev *jpeg = dev_get_drvdata(dev);
> +
> +	clk_bulk_disable_unprepare(jpeg->venc_clk.clk_num,
> +				   jpeg->venc_clk.clks);
> +
> +	return 0;
> +}
> +
> +static int mtk_jpegenc_pm_resume(struct device *dev)
> +{
> +	struct mtk_jpegenc_comp_dev *jpeg = dev_get_drvdata(dev);
> +
> +	return clk_bulk_prepare_enable(jpeg->venc_clk.clk_num,
> +				       jpeg->venc_clk.clks);
> +}
> +
> +static int mtk_jpegenc_suspend(struct device *dev)
> +{
> +	struct mtk_jpegenc_comp_dev *jpeg = dev_get_drvdata(dev);
> +
> +	v4l2_m2m_suspend(jpeg->master_dev->m2m_dev);
> +
> +	return pm_runtime_force_suspend(dev);
> +}
> +
> +static int mtk_jpegenc_resume(struct device *dev)
> +{
> +	struct mtk_jpegenc_comp_dev *jpeg = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = pm_runtime_force_resume(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	v4l2_m2m_resume(jpeg->master_dev->m2m_dev);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops mtk_jpegenc_pm_ops = {
> +	SYSTEM_SLEEP_PM_OPS(mtk_jpegenc_suspend, mtk_jpegenc_resume)
> +	RUNTIME_PM_OPS(mtk_jpegenc_pm_suspend, mtk_jpegenc_pm_resume, NULL)
> +};
> +
>   static struct platform_driver mtk_jpegenc_hw_driver = {
>   	.probe = mtk_jpegenc_hw_probe,
>   	.driver = {
>   		.name = "mtk-jpegenc-hw",
>   		.of_match_table = mtk_jpegenc_drv_ids,
> +		.pm = &mtk_jpegenc_pm_ops,
>   	},
>   };
>   
