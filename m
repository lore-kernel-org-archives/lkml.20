Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577144A441D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363544; cv=none; b=kTFduCkAVJwAOMMyESCSKh7TzuUL7IJLePu8V8CKrWxvNMvN4y8dIzRkQlSIecoRQ5TwGDuuiTehQQzplY0MaO6V5z8XgB08K+7bOOuM8LSiArC5/OWGHU2SfF4VuCPZzSyugUW2kp8yf5PiAw0da4Y7ukA3NpUJxFzIDhBRfDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363544; c=relaxed/simple;
	bh=K9RxcfC9bh8o+4LHcbZu69c+uOvcXHHn9YLIegfCPlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mAW0a4x2jAKl/ghxBgPeZ8FdU4WMySCLwNvw8Te3zGzg8+uhq/9vRVZFDq0SzINNGpwm9ko1wZ67WU2ZIZxNk74ZMH1nm+M9zhTOEf6XmC3QV9KrdPGe06Pc9csy/0+HffE1O1QbsLAOm9l6c43QgaoMY89PQzDwLbRvQyKwTcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=eHa+3CBH; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="eHa+3CBH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1788363533;
 bh=bHtjTcLrG0knafbd8zwXtCbTXm1/ruu7gX+jOBhr0RU=;
 b=eHa+3CBHmcttQD6D4f1f2XmSm6D5s3rCe11MuAF/lwdvyZ0Txs8+c43cRDJI+2GT2phkfbeS4
 h5Vbb+s15joindK2ZhIV+1/F0/8ZOUwDca9aJlfwqHHRfqnGr1rAExW7/dtNMJlkgOC4w3iWnYX
 aSEZoRmJnmT4nbc57oviGMmMJjxS8V/zrja+Y5A7F0cR5QXxC9fmZtm+v+juYecz59frEg6MjXn
 9celAHiZRGiChbID8iIjUK3s2u6SJTO9A2pFGU5vKR1oZezY7sU2lrAyGPvhnYXvib8InbQIdKn
 Yi7XSQ/hch8M2+/mOgtXz8uqNqYhvsV/NVP3VrvWBpwQ==
X-Forward-Email-ID: 6a9842fcde3605641460f2af
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.14.0
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <7b26a257-534b-4bb1-a6a4-17d3d41aa374@kwiboo.se>
Date: Wed, 2 Sep 2026 17:38:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] drm/bridge: dw-hdmi: optionally ignore rxsense
 when detecting hotplug
To: Ian Ray <ian.ray@gehealthcare.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lucas Stach <l.stach@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260902130117.2731-1-ian.ray@gehealthcare.com>
 <20260902130117.2731-2-ian.ray@gehealthcare.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260902130117.2731-2-ian.ray@gehealthcare.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ian,

On 9/2/2026 3:01 PM, Ian Ray wrote:
> Commit da09daf88108 ("drm: bridge: dw_hdmi: only trigger hotplug event
> on link change") changed the way hotplug is detected to take into
> consideration rxsense.
> 
> That change is problematic for boards where rxsense is always detected,
> such as when an HDMI to DP converter is used.

I have a series [1] with a patch [2] that tries to fully remove the
rxsense part from the dw-hdmi driver, any help to test that series is
welcomed. Should likely solve the issue you are trying to workaround
here.

Planning on sending out a v8 next few days now that v7.3-rc1 have landed.

[1] https://lore.kernel.org/all/20260518180206.2480119-1-jonas@kwiboo.se/
[2] https://lore.kernel.org/all/20260518180206.2480119-21-jonas@kwiboo.se/

Regards,
Jonas

> 
> Introduce an optional property 'ignore-rxsense' to handle such boards.
> 
> Fixes: da09daf88108 ("drm: bridge: dw_hdmi: only trigger hotplug event on link change")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 34c5f583e910..a9337d1f4b88 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -171,6 +171,7 @@ struct dw_hdmi {
>  	bool disabled;			/* DRM has disabled our bridge */
>  	bool bridge_is_on;		/* indicates the bridge is on */
>  	bool rxsense;			/* rxsense state */
> +	bool ignore_rxsense;		/* use HPD only, ignore rxsense for detect */
>  	u8 phy_mask;			/* desired phy int mask settings */
>  	u8 mc_clkdis;			/* clock disable register */
>  
> @@ -3156,6 +3157,9 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
>  		if (phy_stat & HDMI_PHY_HPD)
>  			status = connector_status_connected;
>  
> +		if (hdmi->ignore_rxsense)
> +			phy_stat &= ~HDMI_PHY_RX_SENSE;
> +
>  		if (!(phy_stat & (HDMI_PHY_HPD | HDMI_PHY_RX_SENSE)))
>  			status = connector_status_disconnected;
>  	}
> @@ -3362,6 +3366,8 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>  	mutex_init(&hdmi->cec_notifier_mutex);
>  	spin_lock_init(&hdmi->audio_lock);
>  
> +	hdmi->ignore_rxsense = of_property_read_bool(np, "ignore-rxsense");
> +
>  	ddc_node = of_parse_phandle(np, "ddc-i2c-bus", 0);
>  	if (ddc_node) {
>  		hdmi->ddc = of_get_i2c_adapter_by_node(ddc_node);

