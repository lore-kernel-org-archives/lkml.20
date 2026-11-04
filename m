Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793801588;
	b=n/e1Rvf+e9Tq3R5+fddTSKZArY9XuDB1IZjWfJNpWkkCBnHl81qL6aLtQU5Tj4vhbOnj
	 OyWxaD0MAmlfKrxQPIO+2pgXdsYeKVIZmwoEdOB6NxxtxAT+bmPgv6JCNcHa2VtWezCCo
	 so6PzBzym++ajsf0CCmcwbOY8fjUwm/NyA+UMBQ1k6GaiBkLinubSup59xcWOR378XguU
	 h+NR9z1jHk+KLmUcwrmVtsF59QZ0H3m1FJBn0WajoZt74IbflCrChxeOShIi0x8UwrPnL
	 nLmJnnEzXp35aH7P+L7l5S9ljhQsWUCgeoJzJiQbZWSw96DihRkVl2rgJbJSrQ4IFWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801588;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=7gYZ+EiHzdZ0kEX5Acc8nrWgIeWvJewVbncRfE2fPPI=;
	b=DEXPSR5gBiDPhGwRt2zn8UjBDPGfoOZya2fy1lmJq5iz/LVkj1R0jinNKQLQYbmxip5k
	 eW3TjMCz4+Ek286cKZkORjwt0VgTSsTtfBevmeF3E1K0Dd136g2tk0Ph8dos7fjtwzwOy
	 VmTVXFwmcX42b7I1+aJQde43z/KDqK/yqW+eku9l43swSZMw/VxPAcbUXpA+B03oIrog4
	 7CLv0d1fU/mQMMTCl0XasU5heMq+P9NYXQ3yKON26R692vEqatHS5eTBVilzQBV6kNtI9
	 l4s89RgLqWxbC1A4zneFMq39QoOqQvwh3JcYUiMnqUzm5x8XeO1nBxwKiX9sgYl0twA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=XxGgyVo6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0394606A33C;
	Wed,  4 Nov 2026 14:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0394606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=XxGgyVo6
ARC-Seal: i=1; a=rsa-sha256; t=1793801539; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fAL2jrSe7HaEC2dQAFelqZk8zmqDyYl9W8ooaM9ZVqdOomxmWyM+QMR5d2czVvIKTcovFg3vLqxNsmStW+MUbpPHuFHc4kJTO3WQ6ShxSk6CEM7CiUt91zpDYFM24dp8jotJTUbCy0qGpE4IyOXNbNWlTfR6zvZUQiRFIiXR9rc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793801539; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7gYZ+EiHzdZ0kEX5Acc8nrWgIeWvJewVbncRfE2fPPI=; 
	b=D66XhaxnLm8DMxTzEZY1kPgmVAMh+Q5kix6hz/S7JYO0YizDaj3V4a4cxDGnvAZnS5QQTswS2QHVqJDpVYVhUzKUuUxOP6f5PxX5oWzcfX2WX/FFKkKZh0nJGS9czuxO9jYmOdMVCdNPtfjaclQpGuf5GgxWx69AgK3RC8b3w/0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: a=rsa-sha256; b=XxGgyVo66FaCUkaW62/wNs7neFIe5KF7QGLd8kwQwjK6EX8BWL8TJap9urEBlLGCL6BAqfYygz7CoPkY0hyVh2i2QrVR3Mtu7zAr8SylZfqwbbToTsI1ZGJ/H+NnLYt5U24vXhEkk8DhojAcv2m/n/b39CJFfAYsiT+Ro+ia3lg=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=7gYZ+EiHzdZ0kEX5Acc8nrWgIeWvJewVbncRfE2fPPI=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179380153634836.9526638878134;
	Wed, 4 Nov 2026 06:12:16 -0800 (PST)
Message-ID: <7a1868dc-0bd7-4f5e-a6bd-6f7d06420ddb@collabora.com>
Date: Wed, 4 Nov 2026 17:12:12 +0300
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
Subject: Re: [PATCH v3 05/10] media: synopsys: hdmirx: add async subdevice
 support
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
 <20261005-hdmirx-media-v3-5-71a11a2e3e76@pengutronix.de>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20261005-hdmirx-media-v3-5-71a11a2e3e76@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 10/5/26 16:28, Sascha Hauer wrote:
> From: Gerald Loacker <gerald.loacker@wolfvision.net>
> 
> Add V4L2 async notifier support to enable dynamic binding of connected
> subdevices in the video pipeline. The driver parses device-tree endpoints
> to discover and register video bridge subdevices.
> 
> When a subdevice is bound, a media link is created between its output pad
> and the HDMI RX sink pad. Subdevice nodes are registered once binding
> completes, making them accessible from userspace.
> 
> If no endpoint is defined in the device tree, the driver operates in
> standalone mode and registers its subdevice nodes directly, maintaining
> backward compatibility with simpler configurations.
> 
> The notifier itself is unregistered on the way out whether or not a
> subdevice ever bound. Only v4l2_async_nf_unregister() takes the notifier
> off the global list, so cleaning up without it would leave an entry
> pointing into memory devres is about to free. Both calls are no-ops when
> there was no endpoint to watch.
> 
> Ask the bound subdevice which of its pads faces us rather than assuming
> the second one. media_create_pad_link() warns and fails on an index the
> entity does not have, which a bridge with a single pad would hit.
> 
> V4L2_ASYNC has to be selected now that the driver calls the notifier
> helpers. v4l2-async.h has no stubs for them, and nothing else the driver
> already selects pulls the symbol in.
> 
> The media device is already registered when the subdevice binds, so
> userspace can be walking the graph under graph_mutex while the link is
> added. media_create_pad_link() does not take the lock itself; take it
> around the call.
> 
> Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> Assisted-by: LLM
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>   drivers/media/platform/synopsys/hdmirx/Kconfig     |  1 +
>   .../media/platform/synopsys/hdmirx/snps_hdmirx.c   | 92 +++++++++++++++++++++-
>   2 files changed, 92 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/synopsys/hdmirx/Kconfig b/drivers/media/platform/synopsys/hdmirx/Kconfig
> index 4321f985f6320..598c303eba8d0 100644
> --- a/drivers/media/platform/synopsys/hdmirx/Kconfig
> +++ b/drivers/media/platform/synopsys/hdmirx/Kconfig
> @@ -5,6 +5,7 @@ config VIDEO_SYNOPSYS_HDMIRX
>   	depends on ARCH_ROCKCHIP || COMPILE_TEST
>   	depends on VIDEO_DEV
>   	select MEDIA_CONTROLLER
> +	select V4L2_ASYNC
>   	select VIDEO_V4L2_SUBDEV_API
>   	select VIDEOBUF2_DMA_CONTIG
>   	select CEC_CORE
> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index 9891e0f3874ea..6231bb28616c1 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> @@ -20,6 +20,7 @@
>   #include <linux/math64.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
> +#include <linux/of_graph.h>
>   #include <linux/of_platform.h>
>   #include <linux/of_reserved_mem.h>
>   #include <linux/pinctrl/consumer.h>
> @@ -32,12 +33,14 @@
>   
>   #include <media/cec.h>
>   #include <media/media-device.h>
> +#include <media/v4l2-async.h>
>   #include <media/v4l2-common.h>
>   #include <media/v4l2-ctrls.h>
>   #include <media/v4l2-device.h>
>   #include <media/v4l2-dv-timings.h>
>   #include <media/v4l2-event.h>
>   #include <media/v4l2-fh.h>
> +#include <media/v4l2-fwnode.h>
>   #include <media/v4l2-ioctl.h>
>   #include <media/videobuf2-dma-contig.h>
>   #include <media/videobuf2-v4l2.h>
> @@ -126,6 +129,7 @@ struct snps_hdmirx_dev {
>   	struct v4l2_device v4l2_dev;
>   	struct media_device mdev;
>   	struct media_pad pad;
> +	struct v4l2_async_notifier notifier;
>   	struct v4l2_ctrl_handler hdl;
>   	struct v4l2_ctrl *detect_tx_5v_ctrl;
>   	struct v4l2_ctrl *rgb_range;
> @@ -2656,6 +2660,50 @@ static void hdmirx_v4l2_release(struct v4l2_device *v4l2_dev)
>   	kfree(hdmirx_dev);
>   }
>   
> +static int hdmirx_fwnode_bound(struct v4l2_async_notifier *notifier,
> +			       struct v4l2_subdev *subdev,
> +			       struct v4l2_async_connection *asc)
> +{
> +	struct snps_hdmirx_dev *hdmirx_dev =
> +		container_of(notifier, struct snps_hdmirx_dev, notifier);
> +	int source_pad;
> +	int ret;
> +
> +	source_pad = media_entity_get_fwnode_pad(&subdev->entity,
> +						 asc->match.fwnode,
> +						 MEDIA_PAD_FL_SOURCE);
> +	if (source_pad < 0) {
> +		dev_err(hdmirx_dev->dev, "%s has no source pad for %pfw: %d\n",
> +			subdev->name, asc->match.fwnode, source_pad);
> +		return source_pad;
> +	}
> +
> +	mutex_lock(&hdmirx_dev->mdev.graph_mutex);
> +	ret = media_create_pad_link(&subdev->entity, source_pad,
> +				    &hdmirx_dev->stream.vdev.entity, 0,
> +				    MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE);
> +	mutex_unlock(&hdmirx_dev->mdev.graph_mutex);
> +	if (ret) {
> +		dev_err(hdmirx_dev->dev, "Failed to create media link: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int hdmirx_fwnode_complete(struct v4l2_async_notifier *notifier)
> +{
> +	struct snps_hdmirx_dev *hdmirx_dev =
> +		container_of(notifier, struct snps_hdmirx_dev, notifier);
> +
> +	return v4l2_device_register_subdev_nodes(&hdmirx_dev->v4l2_dev);
> +}
> +
> +static const struct v4l2_async_notifier_operations hdmirx_async_ops = {
> +	.bound = hdmirx_fwnode_bound,
> +	.complete = hdmirx_fwnode_complete,
> +};
> +
>   static int hdmirx_probe(struct platform_device *pdev)
>   {
>   	struct snps_hdmirx_dev *hdmirx_dev;
> @@ -2663,6 +2711,8 @@ static int hdmirx_probe(struct platform_device *pdev)
>   	struct v4l2_ctrl_handler *hdl;
>   	struct hdmirx_stream *stream;
>   	struct v4l2_device *v4l2_dev;
> +	struct device_node *ep_node;
> +	struct v4l2_async_connection *asc;
>   	int ret;
>   
>   	hdmirx_dev = kzalloc_obj(*hdmirx_dev);
> @@ -2782,9 +2832,38 @@ static int hdmirx_probe(struct platform_device *pdev)
>   		goto err_unreg_video_dev;
>   	}
>   
> +	ep_node = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
> +	if (ep_node) {
> +		v4l2_async_nf_init(&hdmirx_dev->notifier, &hdmirx_dev->v4l2_dev);
> +		hdmirx_dev->notifier.ops = &hdmirx_async_ops;
> +
> +		asc = v4l2_async_nf_add_fwnode_remote(&hdmirx_dev->notifier,
> +						      of_fwnode_handle(ep_node),
> +						      struct v4l2_async_connection);
> +		of_node_put(ep_node);
> +
> +		if (IS_ERR(asc)) {
> +			ret = PTR_ERR(asc);
> +			dev_err_probe(dev, ret, "Failed to add remote fwnode\n");
> +			goto err_unreg_media;
> +		}
> +
> +		ret = v4l2_async_nf_register(&hdmirx_dev->notifier);
> +		if (ret) {
> +			dev_err_probe(dev, ret, "Failed to register async notifier\n");
> +			goto err_cleanup_notifier;
> +		}
> +	} else {
> +		ret = v4l2_device_register_subdev_nodes(&hdmirx_dev->v4l2_dev);
> +		if (ret) {
> +			dev_err_probe(dev, ret, "Failed to register subdev nodes\n");
> +			goto err_unreg_media;
> +		}
> +	}
> +
>   	ret = hdmirx_register_cec(hdmirx_dev, pdev);
>   	if (ret)
> -		goto err_unreg_media;
> +		goto err_unreg_notifier;
>   
>   	hdmirx_load_default_edid(hdmirx_dev);
>   
> @@ -2799,6 +2878,10 @@ static int hdmirx_probe(struct platform_device *pdev)
>   
>   	return 0;
>   
> +err_unreg_notifier:
> +	v4l2_async_nf_unregister(&hdmirx_dev->notifier);
> +err_cleanup_notifier:
> +	v4l2_async_nf_cleanup(&hdmirx_dev->notifier);
>   err_unreg_media:
>   	media_device_unregister(&hdmirx_dev->mdev);
>   err_unreg_video_dev:
> @@ -2833,6 +2916,13 @@ static void hdmirx_remove(struct platform_device *pdev)
>   
>   	hdmirx_disable_irq(dev);
>   
> +	/*
> +	 * Both are no-ops when there was no endpoint to watch: the notifier is
> +	 * zeroed and neither v4l2_dev nor waiting_list is set.
> +	 */
> +	v4l2_async_nf_unregister(&hdmirx_dev->notifier);
> +	v4l2_async_nf_cleanup(&hdmirx_dev->notifier);
> +
>   	media_device_unregister(&hdmirx_dev->mdev);
>   
>   	vb2_video_unregister_device(&hdmirx_dev->stream.vdev);
> 

Acked-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
