Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793801615;
	b=ryygX25JOdJQ9l2/Liz5t1QvxaCsD3YJ1D+QIn0Li6JgwgNKmM2ve4QNm6EqB6C+lu5m
	 WN5b6XOTXugRVzdml/EUQsZw9eJCdAfezFUKgT9cU9krG7l8BbeCR3Jl7hfErzdHaIGpp
	 C87/12BW8zn2ehyzjnYl8W/AUdYP2mK03UOzQXW5ImvgAIg0LxBy4xTtG3umkfKUNGoZZ
	 oHe+bFHnZLlPY4NXw0nhcFqiW0jWCr3Dcz5iPP0HHCUypkPfqId1J9S7Ujq75WXS7fIFl
	 GPPl1itWMQUQoKN1gidT3lp8sO6Fx/lngarcEsxNAF0MEANZpAkm64C0VTTCt0SRLvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801615;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=mt9uukvO/9C1HAHMlfgdaKRlWs1vCFtkTulFeEpmqg0=;
	b=3T+iFp72jfHai2PxxFaJcCLnLdf7oX69sq/lvED2ycZXuAYqtGLIF4oTCGRRB77V0yR3
	 NRyKAZQS1Uiy2G7hbVo0MpgeSuQoCR9S71sev6/sigp1pi6GssL/OG4jsCfWINEjrqikm
	 OakTYV1NX6QFt4BlwdYhqVHCPa2lDYlHv+vu6oWNvCIH/JM+AGxmN9/a8bMTjNK1d8Fjw
	 ZdS+6O/S6mVgWai4cegJ9yYVcLckRMtjKuzk6Vzcne3Gyy6hAPwG1KjroeQ9lMUpcZkjf
	 /hUJfqHcUWMgLQ7RT4vFx+K1y1OmgFq+6tO/bGx2wEW7b8ZmxvuRbxNzbJJfcgd1Org==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=jwpI9Mll;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FA4606D807;
	Wed,  4 Nov 2026 14:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4FA4606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=jwpI9Mll
ARC-Seal: i=1; a=rsa-sha256; t=1793801575; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YH/9Mw5RpS3ux1AdkRwrWuP+fPo3YP+1F7eZNKm3ejoF0qGUubnrwMG8wRpYMVP0YAmYz0rUUKE5hT8epvhQABEMrQUHXpSFeh2XOyxLKfxuD8TfK7U+hnVNG2i0ztMoTe+iwWbzqvmDfA7Nd4u4e8/SjlevhgRz8wPgSfws4MI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793801575; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mt9uukvO/9C1HAHMlfgdaKRlWs1vCFtkTulFeEpmqg0=; 
	b=gDH7YEnRiFWKQcsw5PX8TD/aYxF4SgPzigwXbPJN2QHJkeA1hLkzBtAanJxfdbhr6dbuSjg71uGuNwg+j8mHZn/uzMzpJzKHdDh1BozC7diAAzfMJdJBrBF/npMK6j79f5jV5QuE/CG5RMFCsLfEo7H8/ig9Lw1sExgoFMCHpp0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: a=rsa-sha256; b=jwpI9MllYCVdkFmYSYcOpG2xbiIWM1FqKRM2wkx50QqhghjmlBDCDfwn+FtKnqsfiaEalmnJ1AymNXpaWX7cyyrbwU0Fpy7MI3tN39k2OoTpvfoXZVC8QUKbDzwHU8VXVUzA9e0JlzPCSMXyb641ONrU4q2/1sZEls72M8FKHlA=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=mt9uukvO/9C1HAHMlfgdaKRlWs1vCFtkTulFeEpmqg0=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793801572872552.3022511319283;
	Wed, 4 Nov 2026 06:12:52 -0800 (PST)
Message-ID: <6b6a5799-b7d6-4351-9e76-1d8bc7fa2689@collabora.com>
Date: Wed, 4 Nov 2026 17:12:49 +0300
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
Subject: Re: [PATCH v3 10/10] media: synopsys: hdmirx: get the 5V state from
 the upstream subdev
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
 <20261005-hdmirx-media-v3-10-71a11a2e3e76@pengutronix.de>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20261005-hdmirx-media-v3-10-71a11a2e3e76@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 10/5/26 16:28, Sascha Hauer wrote:
> From: Gerald Loacker <gerald.loacker@wolfvision.net>
> 
> On a board whose HDMI connector belongs to a device in front of this
> receiver, the connector's +5V line goes to that device and hpd-gpios is
> absent. tx_5v_power_present() then reads a NULL descriptor, which
> gpiod_get_value_cansleep() reports as zero, so the receiver never sees a
> source and hdmirx_plugin() never runs.
> 
> Ask the device in front instead. Remember the subdev bound through our
> async notifier in source_sd, and without a GPIO of our own have
> tx_5v_power_present() call its g_input_status(), taking
> V4L2_IN_ST_NO_POWER as "no 5V". There is nothing to debounce here; the
> subdev does that on its side of the connector. A subdev without that op
> is bound anyway, with a warning: a receiver that sees no source beats
> one that refuses to probe.
> 
> Changes reach us the way they do on the GPIO path, as an edge that makes
> the hotplug worker look again. Once the subdev is bound its
> sd->v4l2_dev is ours, so v4l2_subdev_notify() lands in the callback
> installed here, and V4L2_DEVICE_NOTIFY_RX_POWER_PRESENT stands in for
> the 5V interrupt this board does not have. The value the notification
> carries is not used. The worker asks the subdev itself, so nothing is
> cached that could go stale against bind, unbind, or a notification that
> arrives early or late. Bind and unbind queue the work as well, for a
> source that was connected all along and for one that leaves with the
> subdev. With a GPIO of our own, notifications are ignored.
> 
> source_sd is set and cleared under work_lock. Every caller of
> tx_5v_power_present() already holds it except port_no_link(), which
> VIDIOC_QUERY_DV_TIMINGS reaches without it; take it there.
> hdmirx_notify() reads sd->v4l2_dev, which relies on
> v4l2_device_unregister_subdev() waiting for running callbacks before it
> clears the pointer, see "media: v4l2-device: wait for notifications
> when unregistering a subdev".
> 
> Without a det_irq there is nothing to disable_irq() across the cancel in
> hdmirx_disable_irq(), so a notification could queue the hotplug work
> right afterwards - including from hdmirx_suspend(), on its way to gating
> the clocks. Disable the work items instead of cancelling them.
> disable_delayed_work_sync() also turns every later attempt to queue them
> into a no-op, whoever makes it, and hdmirx_enable_irq() enables them
> again. They start out disabled at probe, which keeps the worker queued
> by hdmirx_fwnode_bound() off the hardware before the EDID is written.
> It also covers the way out: hdmirx_fwnode_unbind() queues the work from
> inside v4l2_async_nf_unregister(), in hdmirx_remove() and on the probe
> error path, just before the devm allocated hdmirx_dev goes away, and
> that queue is now ignored.
> 
> Assisted-by: LLM
> Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>   .../media/platform/synopsys/hdmirx/snps_hdmirx.c   | 101 +++++++++++++++++++--
>   1 file changed, 95 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index a937ee23e230c..7f04958de1702 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> @@ -142,6 +142,7 @@ struct snps_hdmirx_dev {
>   	struct mutex phy_rw_lock; /* to protect phy r/w configuration */
>   	struct mutex stream_lock; /* to lock video stream capture */
>   	struct mutex work_lock; /* to lock the critical section of hotplug event */
> +	struct v4l2_subdev *source_sd; /* under work_lock: 5V without hpd-gpios */
>   	struct reset_control_bulk_data resets[HDMIRX_NUM_RST];
>   	struct clk_bulk_data *clks;
>   	struct regmap *grf;
> @@ -237,6 +238,23 @@ static bool tx_5v_power_present(struct snps_hdmirx_dev *hdmirx_dev)
>   	int val, i, cnt = 0;
>   	bool ret;
>   
> +	/*
> +	 * Without a GPIO of our own the connector belongs to the subdev in
> +	 * front of us. Ask it; it debounces on its side of the connector.
> +	 */
> +	if (!hdmirx_dev->detect_5v_gpio) {
> +		u32 status;
> +
> +		lockdep_assert_held(&hdmirx_dev->work_lock);
> +
> +		if (!hdmirx_dev->source_sd ||
> +		    v4l2_subdev_call(hdmirx_dev->source_sd, video,
> +				     g_input_status, &status))
> +			return false;
> +
> +		return !(status & V4L2_IN_ST_NO_POWER);
> +	}
> +
>   	for (i = 0; i < 10; i++) {
>   		usleep_range(1000, 1100);
>   		val = gpiod_get_value_cansleep(hdmirx_dev->detect_5v_gpio);
> @@ -465,7 +483,13 @@ static int hdmirx_get_detected_timings(struct snps_hdmirx_dev *hdmirx_dev,
>   
>   static bool port_no_link(struct snps_hdmirx_dev *hdmirx_dev)
>   {
> -	return !tx_5v_power_present(hdmirx_dev);
> +	bool present;
> +
> +	mutex_lock(&hdmirx_dev->work_lock);
> +	present = tx_5v_power_present(hdmirx_dev);
> +	mutex_unlock(&hdmirx_dev->work_lock);
> +
> +	return !present;
>   }
>   
>   static int hdmirx_query_dv_timings(struct file *file, void *priv,
> @@ -2268,13 +2292,22 @@ static void hdmirx_delayed_work_res_change(struct work_struct *work)
>   	mutex_unlock(&hdmirx_dev->work_lock);
>   }
>   
> -static irqreturn_t hdmirx_5v_det_irq_handler(int irq, void *dev_id)
> +/*
> + * A 5V edge. Neither source of one says more than "look again": the
> + * hotplug worker samples tx_5v_power_present() and acts on what it finds.
> + */
> +static void hdmirx_5v_edge(struct snps_hdmirx_dev *hdmirx_dev)
>   {
> -	struct snps_hdmirx_dev *hdmirx_dev = dev_id;
> -
>   	queue_delayed_work(system_dfl_wq,
>   			   &hdmirx_dev->delayed_work_hotplug,
>   			   msecs_to_jiffies(10));
> +}
> +
> +static irqreturn_t hdmirx_5v_det_irq_handler(int irq, void *dev_id)
> +{
> +	struct snps_hdmirx_dev *hdmirx_dev = dev_id;
> +
> +	hdmirx_5v_edge(hdmirx_dev);
>   
>   	return IRQ_HANDLED;
>   }
> @@ -2526,14 +2559,18 @@ static void hdmirx_disable_irq(struct device *dev)
>   	disable_irq(hdmirx_dev->dma_irq);
>   	disable_irq(hdmirx_dev->hdmi_irq);
>   
> -	cancel_delayed_work_sync(&hdmirx_dev->delayed_work_hotplug);
> -	cancel_delayed_work_sync(&hdmirx_dev->delayed_work_res_change);
> +	/* A subdev in front of us can still notify, keep it from queueing. */
> +	disable_delayed_work_sync(&hdmirx_dev->delayed_work_hotplug);
> +	disable_delayed_work_sync(&hdmirx_dev->delayed_work_res_change);
>   }
>   
>   static void hdmirx_enable_irq(struct device *dev)
>   {
>   	struct snps_hdmirx_dev *hdmirx_dev = dev_get_drvdata(dev);
>   
> +	enable_delayed_work(&hdmirx_dev->delayed_work_hotplug);
> +	enable_delayed_work(&hdmirx_dev->delayed_work_res_change);
> +
>   	enable_irq(hdmirx_dev->hdmi_irq);
>   	enable_irq(hdmirx_dev->dma_irq);
>   	if (hdmirx_dev->det_irq > 0)
> @@ -2680,6 +2717,19 @@ static void hdmirx_v4l2_release(struct v4l2_device *v4l2_dev)
>   	kfree(hdmirx_dev);
>   }
>   
> +static void hdmirx_notify(struct v4l2_subdev *sd, unsigned int notification,
> +			  void *arg)
> +{
> +	struct snps_hdmirx_dev *hdmirx_dev =
> +		container_of(sd->v4l2_dev, struct snps_hdmirx_dev, v4l2_dev);
> +
> +	if (notification != V4L2_DEVICE_NOTIFY_RX_POWER_PRESENT ||
> +	    hdmirx_dev->detect_5v_gpio)
> +		return;
> +
> +	hdmirx_5v_edge(hdmirx_dev);
> +}
> +
>   static int hdmirx_fwnode_bound(struct v4l2_async_notifier *notifier,
>   			       struct v4l2_subdev *subdev,
>   			       struct v4l2_async_connection *asc)
> @@ -2708,6 +2758,21 @@ static int hdmirx_fwnode_bound(struct v4l2_async_notifier *notifier,
>   		return ret;
>   	}
>   
> +	if (hdmirx_dev->detect_5v_gpio)
> +		return 0;
> +
> +	if (!v4l2_subdev_has_op(subdev, video, g_input_status))
> +		dev_warn(hdmirx_dev->dev,
> +			 "%s cannot report 5V and there is no hpd-gpios, no source will be detected\n",
> +			 subdev->name);
> +
> +	mutex_lock(&hdmirx_dev->work_lock);
> +	hdmirx_dev->source_sd = subdev;
> +	mutex_unlock(&hdmirx_dev->work_lock);
> +
> +	/* The source may have been connected all along. */
> +	hdmirx_5v_edge(hdmirx_dev);
> +
>   	return 0;
>   }
>   
> @@ -2719,8 +2784,28 @@ static int hdmirx_fwnode_complete(struct v4l2_async_notifier *notifier)
>   	return v4l2_device_register_subdev_nodes(&hdmirx_dev->v4l2_dev);
>   }
>   
> +static void hdmirx_fwnode_unbind(struct v4l2_async_notifier *notifier,
> +				 struct v4l2_subdev *subdev,
> +				 struct v4l2_async_connection *asc)
> +{
> +	struct snps_hdmirx_dev *hdmirx_dev =
> +		container_of(notifier, struct snps_hdmirx_dev, notifier);
> +
> +	/* With a GPIO of our own the connector is ours and stays put. */
> +	if (hdmirx_dev->detect_5v_gpio)
> +		return;
> +
> +	mutex_lock(&hdmirx_dev->work_lock);
> +	hdmirx_dev->source_sd = NULL;
> +	mutex_unlock(&hdmirx_dev->work_lock);
> +
> +	/* The source went with it. */
> +	hdmirx_5v_edge(hdmirx_dev);
> +}
> +
>   static const struct v4l2_async_notifier_operations hdmirx_async_ops = {
>   	.bound = hdmirx_fwnode_bound,
> +	.unbind = hdmirx_fwnode_unbind,
>   	.complete = hdmirx_fwnode_complete,
>   };
>   
> @@ -2779,6 +2864,9 @@ static int hdmirx_probe(struct platform_device *pdev)
>   			  hdmirx_delayed_work_hotplug);
>   	INIT_DELAYED_WORK(&hdmirx_dev->delayed_work_res_change,
>   			  hdmirx_delayed_work_res_change);
> +	/* Until hdmirx_enable_irq(), after the EDID is written. */
> +	disable_delayed_work(&hdmirx_dev->delayed_work_hotplug);
> +	disable_delayed_work(&hdmirx_dev->delayed_work_res_change);
>   
>   	hdmirx_dev->cur_fmt_fourcc = V4L2_PIX_FMT_BGR24;
>   	hdmirx_dev->timings = cea640x480;
> @@ -2818,6 +2906,7 @@ static int hdmirx_probe(struct platform_device *pdev)
>   	}
>   	hdmirx_dev->v4l2_dev.ctrl_handler = hdl;
>   	hdmirx_dev->v4l2_dev.release = hdmirx_v4l2_release;
> +	hdmirx_dev->v4l2_dev.notify = hdmirx_notify;
>   
>   	ret = v4l2_device_register(dev, &hdmirx_dev->v4l2_dev);
>   	if (ret < 0) {
> 

Acked-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
