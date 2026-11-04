Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793801602;
	b=Rguo4FdfvvxuGoM5wqZcjjx1+3h0fMtoSu1awVwdyDzYOZ+HPSuKB+qTEwA+Vl8Q79cZ
	 3CSe9iAzGaIpq5NOw8r1bPXGQEfBmFABYCUdOrajIICFTs7o3eks71mBwL30GJBvUS677
	 823cL+2MTX1KelNy6Hfp04Mj/emlbu8vNJYK+CFLXwuHtq0bCb9rBiTRlt7tzaUexg4i8
	 wg9aKtThCiIldjbxKUIR+U4hElXLCm/eFWaLXSdZl4oLObnwn7hFA8poqIOkLkqi1Rz6E
	 D1KgEkd7P8IX7d0R7NYr3nDq3LP1ydcWZ71PkBScoCdziz2Ta/GKCwzucCxqtjCsDYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801602;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=OK43RD7KB8YCCbSj8Xdu8lG0LPOf9mPvhkSzEL014WQ=;
	b=XLgyAr9FQN2HlR9GheCqAr6UMS00b65f1kyTcFQUIeUxGg5iCfH/yPA5EuMW7U7PbAAm
	 b2cbnI/0NpydlAE9KPSz7GYgO5CERFiU/lypQELNWiAVfk/1mOYiq6ByqmtVwGqpBjeGv
	 5Mv5ZzwC9M6dqdRX9i+OEdwa/TxvnxylhuGfXUJeW3RvdkaeWhyNo4/ePNyes8ih/VC8B
	 hGvp3gaN9Db/nRIHs7eyCw/oH7VQJH2reWRuehXYDjWuAaKW8SFBaNEtHaE7JNsOFeEFA
	 XZgO+/TKHm6eEcv8w+oqf3HfGSmVdhVG3pOtTDSjjuuIXEwFtNe7391m5bNn67L515Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=PLyT1GCY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B957606D824;
	Wed,  4 Nov 2026 14:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B957606D824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=PLyT1GCY
ARC-Seal: i=1; a=rsa-sha256; t=1793801560; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eBBIFyGc4iaIfE6XS/9kQmuDtfY2z4LQlkj8tlu6SHMwtx44/R1Q2d/FlOe1xndGPf2oByWf4UkwVv29Wb+fI8hMyEnrTRNm2jSN/TYcpZXMeNeSWFscmyWLFYeM1ep7wkETZ2Br1g6kIKGC+F2UDphcNZM3+6lcCM3ig6+Wa1c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793801560; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OK43RD7KB8YCCbSj8Xdu8lG0LPOf9mPvhkSzEL014WQ=; 
	b=DYSnAXXSyePjdLO0FiX+T99c64tPOU2O8D3QepW7Yp5VWhV8qcpIRPrErdg9hOvGysnKXREqaXI5hR4G+ZtIEdYoHdXjDnTO7D4jPug4hUNOqDpftwR/XrRnDGzj+tGbkZU2d4eJLk4/Qd2bipkJTqkUFmKEpwdf2JGAcNTiBy8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: a=rsa-sha256; b=PLyT1GCYmJe4RNsWqhJ4WrKcdMUMVroxB21Mw8puLCcwVYQIGZTe9VCfQ3z+kmqacxUrc2LKczphm1iwOawOv/6U2xDG6rJmxGUz3z7YFvBLsmWpWUb/sZnoWMrAVxrY4xR4fB3ZTjjKt7zt+EYzrlCA3JvTGcTgSdqcoVCyPto=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=OK43RD7KB8YCCbSj8Xdu8lG0LPOf9mPvhkSzEL014WQ=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793801556572164.68419808829083;
	Wed, 4 Nov 2026 06:12:36 -0800 (PST)
Message-ID: <fe1c9fc6-53b8-461c-a183-411e4bc85eea@collabora.com>
Date: Wed, 4 Nov 2026 17:12:31 +0300
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
Subject: Re: [PATCH v3 06/10] media: synopsys: hdmirx: give the signal lock
 wait a real timeout
To: Sascha Hauer <s.hauer@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dingxian Wen <shawn.wen@rock-chips.com>,
 Shreeya Patel <shreeya.patel@collabora.com>
Cc: Gerald Loacker <gerald.loacker@wolfvision.net>,
 Lucas Sinn <lucas.sinn@wolfvision.net>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org
References: <20261005-hdmirx-media-v3-0-71a11a2e3e76@pengutronix.de>
 <20261005-hdmirx-media-v3-6-71a11a2e3e76@pengutronix.de>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20261005-hdmirx-media-v3-6-71a11a2e3e76@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 10/5/26 16:28, Sascha Hauer wrote:
> From: Gerald Loacker <gerald.loacker@wolfvision.net>
> 
> hdmirx_wait_signal_lock() bounded itself by a count of 300 iterations.
> How long that came to depended on the debounce inside
> tx_5v_power_present(), which the loop calls once per iteration and which
> sleeps about 7ms of it, so the effective timeout was around two seconds
> by accident rather than by design.
> 
> That accident is about to go away. A later patch in this series takes the
> 5V state from an upstream subdev where the board has no hpd-gpios, which
> leaves tx_5v_power_present() a plain read of a flag costing microseconds.
> The same 300 iterations would then be over in a few milliseconds and the
> wait would give up almost immediately.
> 
> Poll on a fixed 10ms interval against an explicit three second deadline.
> Check the deadline after the 5V test so a disconnect is still reported as
> -ENOLINK rather than a timeout, and report the timeout as -ETIMEDOUT; the
> sole caller only tests for non-zero, so neither is a change in behaviour.
> 
> Assisted-by: LLM
> Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>   .../media/platform/synopsys/hdmirx/snps_hdmirx.c   | 40 +++++++++++++++-------
>   1 file changed, 28 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index 6231bb28616c1..a28eb86e0b83c 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> @@ -2129,13 +2129,25 @@ static irqreturn_t hdmirx_dma_irq_handler(int irq, void *dev_id)
>   	return IRQ_HANDLED;
>   }
>   
> +/*
> + * Wait for the HDMI signal to lock: TMDS clock detection and ratio
> + * configuration, then PHY and CMU lock, then DMA lock.
> + *
> + * The wait used to be bounded by a count of 300 iterations. What that came
> + * to in wall clock time was decided by the debounce inside
> + * tx_5v_power_present(), which is called once per iteration and sleeps
> + * about 7ms of it, so the real timeout was an accident of how 5V happens to
> + * be sensed. Poll on a fixed interval against an explicit deadline instead.
> + */
>   static int hdmirx_wait_signal_lock(struct snps_hdmirx_dev *hdmirx_dev)
>   {
>   	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
>   	u32 mu_status, scdc_status, dma_st10, cmu_st;
> -	u32 i;
> +	unsigned long timeout;
> +
> +	timeout = jiffies + msecs_to_jiffies(3000);
>   
> -	for (i = 0; i < 300; i++) {
> +	for (;;) {
>   		mu_status = hdmirx_readl(hdmirx_dev, MAINUNIT_STATUS);
>   		scdc_status = hdmirx_readl(hdmirx_dev, SCDC_REGBANK_STATUS3);
>   		dma_st10 = hdmirx_readl(hdmirx_dev, DMA_STATUS10);
> @@ -2149,21 +2161,25 @@ static int hdmirx_wait_signal_lock(struct snps_hdmirx_dev *hdmirx_dev)
>   		if (!tx_5v_power_present(hdmirx_dev)) {
>   			v4l2_dbg(1, debug, v4l2_dev,
>   				 "%s: HDMI pull out, return\n", __func__);
> -			return -1;
> +			return -ENOLINK;
>   		}
>   
> -		hdmirx_tmds_clk_ratio_config(hdmirx_dev);
> -	}
> +		if (time_after(jiffies, timeout)) {
> +			v4l2_err(v4l2_dev,
> +				 "%s: signal not lock, tmds_clk_ratio:%d\n",
> +				 __func__, hdmirx_dev->tmds_clk_ratio);
> +			v4l2_err(v4l2_dev,
> +				 "%s: mu_st:%#x, scdc_st:%#x, dma_st10:%#x, cmu_st:%#x\n",
> +				 __func__, mu_status, scdc_status, dma_st10,
> +				 cmu_st);
> +			return -ETIMEDOUT;
> +		}
>   
> -	if (i == 300) {
> -		v4l2_err(v4l2_dev, "%s: signal not lock, tmds_clk_ratio:%d\n",
> -			 __func__, hdmirx_dev->tmds_clk_ratio);
> -		v4l2_err(v4l2_dev, "%s: mu_st:%#x, scdc_st:%#x, dma_st10:%#x\n",
> -			 __func__, mu_status, scdc_status, dma_st10);
> -		return -1;
> +		hdmirx_tmds_clk_ratio_config(hdmirx_dev);
> +		usleep_range(10000, 11000);
>   	}
>   
> -	v4l2_dbg(1, debug, v4l2_dev, "%s: signal lock ok, i:%d\n", __func__, i);
> +	v4l2_dbg(1, debug, v4l2_dev, "%s: signal lock ok\n", __func__);
>   	hdmirx_writel(hdmirx_dev, GLOBAL_SWRESET_REQUEST, DATAPATH_SWRESETREQ);
>   
>   	reinit_completion(&hdmirx_dev->avi_pkt_rcv);
> 

Acked-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
