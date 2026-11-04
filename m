Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793801556;
	b=GFhUXs0Bh2222jbVf8F9K6oV0vgEIAx78VgL14R9aWgAsjBun/haBi8OGjifNo6Dj3TV
	 T1TFL45wEILUokifnxH+kG0NWxTelYNbdxWcuS6P7HECrdDu9QHjaIIYsy8QAaoEZWqMR
	 Ap5H04meVahLhjUxooM8PcgTOD7JDbAK9AkmmKrt90q6Q1qnAiiJ2F6T2UT8ssElfoMaD
	 imi4cIzUMZDZkb8dp1onkBJ9blG9jpev7cxV4vnaArEu8oh/E0RkgkR1u7OXE4rzg5X3+
	 HJEnax4n6lgL40SqTQnB/kL0ZZn1vmAXsvQJ4uq6U/0ClIIg21bWZcuBzwM81doz24A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801556;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=YvS6ooKVwKypkaolFvHXqoO8MqX5BzI/xKvJfWr51T8=;
	b=WcYO7ABNcVEWJosEYMu0G3cnByj1qui1yBH7DNhwm6TuHm/92iMjxtkstt9yOmoD5CFX
	 R9hx29+otcw/CeNwBhSv9XK4uXn9oEs0l9CRQVAACK6AgcwrqwzuMuDWi5lFzW/zPH0Qj
	 1lJy6EQKOgkM/j150AxTInFRh5VB6QO0rlwA2NPPdKMkTXjNMqEKfj6MJL6uBx0GiPmac
	 wY2bHG7FqhZIYDyJ6dVIwHEgBA/xE6Ceu4SvplMUKMWrwJwD3FW7O52dCzQF5EjIyhHU2
	 kHXf3RxtjLwSeAe7q6P4wtIAFOual5X+WdO1DFALHK6mRFT2EpOUMyMmbuMrKkoyCWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=OeMDIkmI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F8C606EE84;
	Wed,  4 Nov 2026 14:12:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85F8C606EE84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=OeMDIkmI
ARC-Seal: i=1; a=rsa-sha256; t=1793801509; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=T1jilRb5wucUxZzsiUHWFXU3QP8gWP4Jxbqx77jnO9LDy3ZSAES1TBG22meFsALSAZK++CUEtm95mlpfKOblP6cWrAwzUIVEkkNXeVaCt/qhQBT4r8AwMqeDp7ec+zVehZeA3Q5KiRgkEvCwIAXXKbDPIKgyKy9HeYC1cHrRko8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793801509; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YvS6ooKVwKypkaolFvHXqoO8MqX5BzI/xKvJfWr51T8=; 
	b=mTmYMnIK6OBW+AI3irWk9JuYEadnmcVGSn/LBXiV6KAQsTVdlNhdnGtsCHjRJr6WivzBo6c+WWGGVksyxB/gWAX9O7FsPPhfCn6YdOLWc1DC2H3cu5z57/860kmql+Ts4RQWMzIGNr5jG1jAB8+TToJlyesEXqmSssCOEWelfh8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: a=rsa-sha256; b=OeMDIkmIGVzsQFWqiBBZMVjQasmnyeiE1zY+UwBvVUrgqEphJo29TwTp+bf5IqU89A+7dgQzSBu2kOaQaDy1Q/2e8kxnoMp5cSBVIWugQrtyAskGHHrfqgkKeSdZHWPJP2sHYPnRFapB0br5mT2n0+WynU2mBBE56cx9aulffEE=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=YvS6ooKVwKypkaolFvHXqoO8MqX5BzI/xKvJfWr51T8=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179380150728514.866978180500155;
	Wed, 4 Nov 2026 06:11:47 -0800 (PST)
Message-ID: <12f1f67a-9855-4765-9f3c-5f30853df76b@collabora.com>
Date: Wed, 4 Nov 2026 17:11:42 +0300
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
Subject: Re: [PATCH v3 03/10] media: synopsys: hdmirx: add media entity for
 video capture device
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
 <20261005-hdmirx-media-v3-3-71a11a2e3e76@pengutronix.de>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20261005-hdmirx-media-v3-3-71a11a2e3e76@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 10/5/26 16:28, Sascha Hauer wrote:
> From: Gerald Loacker <gerald.loacker@wolfvision.net>
> 
> Register the video device as a media entity with a sink pad to integrate
> it into the media controller topology. This allows the capture device to
> be properly represented in the media graph and enables userspace to
> discover the device capabilities through the MC API.
> 
> The sink pad indicates that this entity receives data (HDMI video stream)
> which is then made available through the V4L2 video capture interface.
> 
> Initialize the pad before registering the video device. The previous patch
> gave v4l2_dev an mdev, so video_register_device() already registers the
> entity, and doing it the other way round would hand
> media_device_register_entity() an entity with no pads yet.
> 
> Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>   .../media/platform/synopsys/hdmirx/snps_hdmirx.c   | 26 ++++++++++++++++++++--
>   1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index 8b04c84be75ec..9891e0f3874ea 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> @@ -125,6 +125,7 @@ struct snps_hdmirx_dev {
>   	struct hdmirx_stream stream;
>   	struct v4l2_device v4l2_dev;
>   	struct media_device mdev;
> +	struct media_pad pad;
>   	struct v4l2_ctrl_handler hdl;
>   	struct v4l2_ctrl *detect_tx_5v_ctrl;
>   	struct v4l2_ctrl *rgb_range;
> @@ -2761,15 +2762,29 @@ static int hdmirx_probe(struct platform_device *pdev)
>   
>   	stream = &hdmirx_dev->stream;
>   	stream->hdmirx_dev = hdmirx_dev;
> +
> +	hdmirx_dev->pad.flags = MEDIA_PAD_FL_SINK;
> +	ret = media_entity_pads_init(&stream->vdev.entity, 1, &hdmirx_dev->pad);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "media entity pads initialization failed\n");
> +		goto err_unreg_v4l2_dev;
> +	}
> +
>   	ret = hdmirx_register_stream_vdev(stream);
>   	if (ret < 0) {
>   		dev_err_probe(dev, ret, "video device registration failed\n");
> -		goto err_unreg_v4l2_dev;
> +		goto err_cleanup_entity;
> +	}
> +
> +	ret = media_device_register(&hdmirx_dev->mdev);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "media device registration failed\n");
> +		goto err_unreg_video_dev;
>   	}
>   
>   	ret = hdmirx_register_cec(hdmirx_dev, pdev);
>   	if (ret)
> -		goto err_unreg_video_dev;
> +		goto err_unreg_media;
>   
>   	hdmirx_load_default_edid(hdmirx_dev);
>   
> @@ -2784,8 +2799,12 @@ static int hdmirx_probe(struct platform_device *pdev)
>   
>   	return 0;
>   
> +err_unreg_media:
> +	media_device_unregister(&hdmirx_dev->mdev);
>   err_unreg_video_dev:
>   	vb2_video_unregister_device(&hdmirx_dev->stream.vdev);
> +err_cleanup_entity:
> +	media_entity_cleanup(&hdmirx_dev->stream.vdev.entity);
>   err_unreg_v4l2_dev:
>   	v4l2_device_unregister(&hdmirx_dev->v4l2_dev);
>   	hdmirx_disable(dev);
> @@ -2814,7 +2833,10 @@ static void hdmirx_remove(struct platform_device *pdev)
>   
>   	hdmirx_disable_irq(dev);
>   
> +	media_device_unregister(&hdmirx_dev->mdev);
> +
>   	vb2_video_unregister_device(&hdmirx_dev->stream.vdev);
> +	media_entity_cleanup(&hdmirx_dev->stream.vdev.entity);
>   	v4l2_device_unregister(&hdmirx_dev->v4l2_dev);
>   
>   	hdmirx_disable(dev);
> 

Acked-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
