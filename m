Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793801543;
	b=xMJlgzF6isE6XMhh1hwywm/XnU4iE/EB7nwagcN3J/axHCQXCXIX4SUeHZUsGIkWhKt1
	 o7qmw4DKAx3cetgehFyPk3vRKAS7TgqSi4Y+fe3hSWycvuYmVXL1yHSj60gjHtLC0hurb
	 uqcBTLzmS4PxNTcsCirJTYIx5uD676JWFa9ihOrojxHe3K9Z6BxEoM7EwVkyOIZPf6yBA
	 HigW1281S1m7Veblx9mO9RNDli4mVi7+pFHue8fMIaZvHxR3ncB7kABkmhkdhky/uBtPW
	 N07q350wyg3bzA95b3dHO6fZjjRs1iGGxGSZ/yfVRzxIGhHVdsZnnV/X8gOBmv4g0cw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801543;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=qt8pYHnyAZsiOolx0cEcvSp4N3W6vYqWJkMHRpqOlXc=;
	b=4y7deYml1yd+l5/YI/rORm2AYxBjpPwLqFq23KO6UiLlBpjj3FF7Zle+WB44UL8hiruq
	 mxgLyEwy9Nr34qHvwjtRxMcj36OkoOWoVFqlfwDrwR/jY/acrACjVBkPcjDEvZf77bgan
	 vEYqfoReEfHp9bvFMO5A4pr+stFnCoiO7ltGHvYJEiJAaWEvDJv+TY/E292uEJAh4fsX1
	 45EILPk6fEAOo8/iHoGTwh/ME698LFwqii5ZRUe2QxWPe1J6nr0nKnPlpKlIsZHHMw5eN
	 fSdLk7y7rizO8jxRD3wXsVRHeV5juF4VPPQKmzNCfACH5NhaVHmGno9fSRRv3X7fpHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=fj2rZQhy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA175606A335;
	Wed,  4 Nov 2026 14:12:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA175606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=fj2rZQhy
ARC-Seal: i=1; a=rsa-sha256; t=1793801495; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gpQx703hJQlp5rl0ZOVzEgqbS5E0x99CANbAmQSF3a2Iit6649AW2SOps7qWpQLEEPNrM6fYlmuiQKDBQAblmayjyxGTq4WU9fKjwTqoxTZTR246fDW1ob+AZtYmh7L4L+wOuwfOO/LmotfnUmtybErLzZJx2BLMPLr+5+p/vDE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793801495; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qt8pYHnyAZsiOolx0cEcvSp4N3W6vYqWJkMHRpqOlXc=; 
	b=TGKc1rCzQ1GDRG4g9rOzIdpTo7WGlX+ledGN2lLQklwuNfZc475xRBV1nAgYnbCXuu8HhXzaytHUbQ64RpPb8k85+Ys8HiOmYOSP/6Adoj8R50bTfnIFGNBH9cwgUvOq4HUdn7/j1tuJ9zQLo2O+GKeVvaqTpDRxiO3ncevpHsM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: a=rsa-sha256; b=fj2rZQhyPJLdwKUfVjmn6zqd/uKdqw4eje2Zj9dh+IcuSu6VI/YkM3jritetmyGtuti/xFllyo9k8VO4aEuHhkmGuCAkiAPPp2DKiq8tDKDp8rujbsQsL4GxiMqDZ50SOeyizgAhVGoqQXsC9opprvJOEak4HR6v6plx5ZUCKis=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=qt8pYHnyAZsiOolx0cEcvSp4N3W6vYqWJkMHRpqOlXc=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793801491817146.82438902791648;
	Wed, 4 Nov 2026 06:11:31 -0800 (PST)
Message-ID: <657ea8a3-2cfd-4c90-b672-84c78acee181@collabora.com>
Date: Wed, 4 Nov 2026 17:11:25 +0300
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
Subject: Re: [PATCH v3 02/10] media: synopsys: hdmirx: add media device
 infrastructure
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
 <20261005-hdmirx-media-v3-2-71a11a2e3e76@pengutronix.de>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20261005-hdmirx-media-v3-2-71a11a2e3e76@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 10/5/26 16:28, Sascha Hauer wrote:
> From: Gerald Loacker <gerald.loacker@wolfvision.net>
> 
> Initialize the media device to enable integration with HDMI bridge
> devices in the video capture pipeline. This provides the foundation
> for representing the hardware topology through the media controller
> framework.
> 
> Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>   drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index bc541431638e7..8b04c84be75ec 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> @@ -31,6 +31,7 @@
>   #include <linux/workqueue.h>
>   
>   #include <media/cec.h>
> +#include <media/media-device.h>
>   #include <media/v4l2-common.h>
>   #include <media/v4l2-ctrls.h>
>   #include <media/v4l2-device.h>
> @@ -123,6 +124,7 @@ struct snps_hdmirx_dev {
>   	struct device *dev;
>   	struct hdmirx_stream stream;
>   	struct v4l2_device v4l2_dev;
> +	struct media_device mdev;
>   	struct v4l2_ctrl_handler hdl;
>   	struct v4l2_ctrl *detect_tx_5v_ctrl;
>   	struct v4l2_ctrl *rgb_range;
> @@ -2649,6 +2651,7 @@ static void hdmirx_v4l2_release(struct v4l2_device *v4l2_dev)
>   		container_of(v4l2_dev, struct snps_hdmirx_dev, v4l2_dev);
>   
>   	v4l2_ctrl_handler_free(&hdmirx_dev->hdl);
> +	media_device_cleanup(&hdmirx_dev->mdev);
>   	kfree(hdmirx_dev);
>   }
>   
> @@ -2751,6 +2754,11 @@ static int hdmirx_probe(struct platform_device *pdev)
>   		goto err_pm;
>   	}
>   
> +	hdmirx_dev->mdev.dev = dev;
> +	strscpy(hdmirx_dev->mdev.model, "snps-hdmirx", sizeof(hdmirx_dev->mdev.model));
> +	media_device_init(&hdmirx_dev->mdev);
> +	hdmirx_dev->v4l2_dev.mdev = &hdmirx_dev->mdev;
> +
>   	stream = &hdmirx_dev->stream;
>   	stream->hdmirx_dev = hdmirx_dev;
>   	ret = hdmirx_register_stream_vdev(stream);
> 

Acked-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
