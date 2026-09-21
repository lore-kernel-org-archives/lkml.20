Received: from mail-m19731111.qiye.163.com (mail-m19731111.qiye.163.com [220.197.31.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A8D2D238F;
	Mon, 21 Sep 2026 01:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789955919; cv=none; b=IEjWkS8djIvi8JYbc+JAsIYhVPriURNlwfFI/+HQBlwV6JRzACKk8NXm+137zJTLJK6ip+Pu1vPGe7fmaN39qnUGfcDnIIm5DMRxfgoosurjDVpJd5oKM2ys9ww1BKSMirrzhp3X/J05Md9miORFmHNJMRVzvwoMwVOtox6hdO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789955919; c=relaxed/simple;
	bh=0g7mPXCN2Z2Lt25DZ+v4JMnNnf5UQhKzznDJwqETF4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YCRW6lKGzDBM9wCngQTkcw2QcUvNwXqxjT8WzvgspTYYtxNSMle5oeqsBXqbR4snPoPIHFmB0PMcUIevwmsldr3IesJOnUj15Cvo72I9pcChG1NuiI5XB4HCtY7dm63MWcN6BAa99BiwXO6p7KQ5+CfqGPjxzg8BjzOKr0dThUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=F1wae6Xc; arc=none smtp.client-ip=220.197.31.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="F1wae6Xc"
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4e7dcd1ab;
	Mon, 21 Sep 2026 09:53:12 +0800 (GMT+08:00)
Message-ID: <b6ccf98c-58f3-4fdc-bd7b-3eb1bc3b6e98@rock-chips.com>
Date: Mon, 21 Sep 2026 09:53:12 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] drm/connector: pass down IRQ_HPD to the drivers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>,
 Nikita Travkin <nikita@trvn.ru>, Yongxing Mou
 <yongxing.mou@oss.qualcomm.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Francesco Dolcini <francesco@dolcini.it>, Abel Vesa <abelvesa@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
 <20260920-hpd-irq-events-v5-2-ff1de0090c72@oss.qualcomm.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20260920-hpd-irq-events-v5-2-ff1de0090c72@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa0c1aad18703a7kunm0bf2730011828ad
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZS0xNVh4YQx9JSEhLGB0aGFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=F1wae6Xc2Ll98E4oH3aX72tWpdTNBpUF/4Id0y1xtGULdLtcXmREe+rQNGcB3XdtZo+IKwJ/iDsWwlE1VZ5+iFWx+r8nsHoh8utA9dquAo25H8sCGGSNxUgNNRvgYaEMnEVgr09gpsnUdeon8tvQ8GlQryjz6eiIHmj7zAX49V0=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=JkQGzk7JtUmJhDI7/lc646wm8+od1xD4GOgStSiB+TI=;
	h=date:mime-version:subject:message-id:from;

Hi Dmitry,

On 9/20/2026 11:01 PM, Dmitry Baryshkov wrote:
> The DisplayPort standard defines a special kind of HPD events called
> IRQ_HPD. These events are used to notify DP Source about the events on
> the Sink side.
> 
> Extend drm_connector_funcs::oob_hotplug_event() to pass the
> notifications about the IRQ_HPD events down to the individual drivers,
> letting them handle those as required.
> 
> Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 17 ++++++++++-------
>  drivers/gpu/drm/drm_connector.c                |  2 +-
>  drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
>  include/drm/drm_connector.h                    |  3 ++-
>  4 files changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> index 00feb73e63d7..a51567d19550 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -141,7 +141,8 @@ struct drm_bridge_connector {
>   */
>  
>  static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
> -					    enum drm_connector_status status)
> +					    enum drm_connector_status status,
> +					    enum drm_connector_dp_event event)
>  {
>  	struct drm_bridge_connector *bridge_connector =
>  		to_drm_bridge_connector(connector);
> @@ -154,7 +155,8 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
>  }
>  

It looks like you only changed the function signature. 
Don't the "bridge->funcs->hpd_notify" inside this function need to pass the event?

	drm_for_each_bridge_in_chain_scoped(bridge_connector->encoder, bridge) {
		if (bridge->funcs->hpd_notify)
			bridge->funcs->hpd_notify(bridge, connector, status);
	}


>  static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bridge_connector,
> -					    enum drm_connector_status status)
> +					    enum drm_connector_status status,
> +					    enum drm_connector_dp_event event)
>  {
>  	struct drm_connector *connector = &drm_bridge_connector->base;
>  	struct drm_device *dev = connector->dev;
> @@ -163,7 +165,7 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
>  	connector->status = status;
>  	mutex_unlock(&dev->mode_config.mutex);
>  
> -	drm_bridge_connector_hpd_notify(connector, status);
> +	drm_bridge_connector_hpd_notify(connector, status, event);
>  
>  	drm_kms_helper_connector_hotplug_event(connector);
>  }
> @@ -171,16 +173,17 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
>  static void drm_bridge_connector_hpd_cb(void *cb_data,
>  					enum drm_connector_status status)
>  {
> -	drm_bridge_connector_handle_hpd(cb_data, status);
> +	drm_bridge_connector_handle_hpd(cb_data, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
>  }
>  
>  static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
> -						   enum drm_connector_status status)
> +						   enum drm_connector_status status,
> +						   enum drm_connector_dp_event event)
>  {
>  	struct drm_bridge_connector *bridge_connector =
>  		to_drm_bridge_connector(connector);
>  
> -	drm_bridge_connector_handle_hpd(bridge_connector, status);
> +	drm_bridge_connector_handle_hpd(bridge_connector, status, event);
>  }
>  
>  static void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
> @@ -223,7 +226,7 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
>  		if (hdmi)
>  			drm_atomic_helper_connector_hdmi_hotplug(connector, status);
>  
> -		drm_bridge_connector_hpd_notify(connector, status);
> +		drm_bridge_connector_hpd_notify(connector, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
>  	} else {
>  		switch (connector->connector_type) {
>  		case DRM_MODE_CONNECTOR_DPI:
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 5d4945ea1e95..f0facccb7859 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -3698,7 +3698,7 @@ void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
>  		return;
>  
>  	if (connector->funcs->oob_hotplug_event)
> -		connector->funcs->oob_hotplug_event(connector, status);
> +		connector->funcs->oob_hotplug_event(connector, status, event);
>  
>  	drm_connector_put(connector);
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 50ed615cf0f6..a2acff240b45 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -6800,7 +6800,8 @@ static int intel_dp_connector_atomic_check(struct drm_connector *_connector,
>  }
>  
>  static void intel_dp_oob_hotplug_event(struct drm_connector *_connector,
> -				       enum drm_connector_status hpd_state)
> +				       enum drm_connector_status hpd_state,
> +				       enum drm_connector_dp_event event)
>  {
>  	struct intel_connector *connector = to_intel_connector(_connector);
>  	struct intel_display *display = to_intel_display(connector);
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 906aaefca7e1..c3374cd2598e 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1884,7 +1884,8 @@ struct drm_connector_funcs {
>  	 * has been received from a source outside the display driver / device.
>  	 */
>  	void (*oob_hotplug_event)(struct drm_connector *connector,
> -				  enum drm_connector_status status);
> +				  enum drm_connector_status status,
> +				  enum drm_connector_dp_event event);
>  
>  	/**
>  	 * @debugfs_init:
> 

-- 
Best, 
Chaoyi
