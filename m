Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.79.60.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792718499;
	b=B5WEmY9Zqo+TjT1BjFDojx2HEjgCeoxBj2dv4WQZuQGxTtbZtIcQNRWYiYwb4Y6Sjt5h
	 IPpqFdV9diygxHCV5ysDtzPaYqwWdexitDM9m5eP+SOOnAj5WGgcpJ2zl0Kv28zv0kotO
	 NEi6oOBrKpFmEgymGZVzHlSV1HtD5zVA1To2bUaefFOpPn+bIYtsKFO8j9ESKolNMdPWG
	 Jnu7xShfS1gVktRlHZ69/uSgn4Rdfb9iZEjZSMRZfRMnVbzhL0PkLFC1nfFtCzCWKbC7r
	 9SWxJldeCVbjftQOOrpewK+JJ4oA/a8h2t+r/+IruWt+c9cHevAa/YeW+ugxMMkdcZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792718499;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=fTHe9pcXTKxRGNgBHQwELDkRI1+tQnp9o4yzAANBj4Y=;
	b=FU9EKRgUitN6XfVwtfllZlEfOLaIiXXxpowQE3qXDwlHVYlkZ5eXErc9K+aQeicXJTN7
	 5c/ACVt5DQ6NUucF685dUdmEGQ2zkJm0UmjWKis0WBLyGPjFpSOIg/5QRA0S5RyvECiav
	 kMkTcZdQmU8UKGuYOrHgiq3J0zfjQ4xABgtAClR0qAsTkElFlP4o/7h3+ztedaheStV+r
	 se/hKf6TLg72T9qN/Ad7V0utyMCLmHIsNZFrLY0WC2HrBljE9r1hnMVjI0ON+nFcxTc1f
	 kg52iZazW2pDMlvGhchXgAR8wofNAadt/PFeL4esfD+GMhZ5Vq89+kGm8hBkB54hZcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b="X/Fm4VDX";
	arc=none smtp.remote-ip=210.79.60.23
Received: from mail-m6023.netease.com (mail-m6023.netease.com [210.79.60.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F561606A319;
	Fri, 23 Oct 2026 01:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F561606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=X/Fm4VDX
Received: from [127.0.0.1] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 520f42c30;
	Fri, 23 Oct 2026 09:21:25 +0800 (GMT+08:00)
Message-ID: <e19ac7d1-5a86-4a96-a868-56a4abda3ec4@rock-chips.com>
Date: Fri, 23 Oct 2026 09:21:08 +0800
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
Subject: Re: [PATCH v6 3/9] drm/bridge: pass down IRQ_HPD to the drivers
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Francesco Dolcini <francesco@dolcini.it>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
 <20261022-hpd-irq-events-v6-3-337ea3ddaa62@oss.qualcomm.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261022-hpd-irq-events-v6-3-337ea3ddaa62@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1665937f503a7kunmabefcd952d3a31
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHkxKVkIdSU4dHxpNGhkZTFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=X/Fm4VDX9sFENPD6Wn9qD+Uao+7D0Epq2pQrsnbwFBrymGk6h8O6RmS3bL18Vm4+OOE5fn9EHK7f5aXlKmzlgC52HGgkZdlKQwycb9gdto26fXfwfIFdx0+DDP+R8+nr+Q9Qgl+MLUiC4hQPHMwHPlcJ75OMdNIu2jiqwx+mQLE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=fTHe9pcXTKxRGNgBHQwELDkRI1+tQnp9o4yzAANBj4Y=;
	h=date:mime-version:subject:message-id:from;

On 10/22/2026 9:27 PM, Dmitry Baryshkov wrote:
> The DisplayPort standard defines a special kind of HPD events called
> IRQ_HPD. These events are used to notify DP Source about the events on
> the Sink side. Pass down the extra status to the bridge drivers via the
> hpd_notify() callback, letting DP bridges to act accordingly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c     | 3 ++-
>  drivers/gpu/drm/display/drm_bridge_connector.c | 2 +-
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c     | 3 ++-
>  drivers/gpu/drm/msm/dp/dp_display.c            | 3 ++-
>  drivers/gpu/drm/msm/dp/dp_drm.h                | 3 ++-
>  drivers/gpu/drm/omapdrm/dss/hdmi4.c            | 3 ++-
>  include/drm/drm_bridge.h                       | 3 ++-
>  7 files changed, 13 insertions(+), 7 deletions(-)
> 

Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index b3bb7f2cebb3..b1ffbab89a16 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -429,7 +429,8 @@ static const struct drm_edid *lt9611uxc_bridge_edid_read(struct drm_bridge *brid
>  
>  static void lt9611uxc_bridge_hpd_notify(struct drm_bridge *bridge,
>  					struct drm_connector *connector,
> -					enum drm_connector_status status)
> +					enum drm_connector_status status,
> +					enum drm_connector_dp_event event)
>  {
>  	const struct drm_edid *drm_edid;
>  
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> index 898273f60cf6..1b0a1a00d8eb 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -151,7 +151,7 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
>  	/* Notify all bridges in the pipeline of hotplug events. */
>  	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge) {
>  		if (bridge->funcs->hpd_notify)
> -			bridge->funcs->hpd_notify(bridge, connector, status);
> +			bridge->funcs->hpd_notify(bridge, connector, status, event);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> index c4355c5cc340..a637613ae2e1 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -323,7 +323,8 @@ static int meson_encoder_hdmi_atomic_check(struct drm_bridge *bridge,
>  
>  static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
>  					  struct drm_connector *connector,
> -					  enum drm_connector_status status)
> +					  enum drm_connector_status status,
> +					  enum drm_connector_dp_event event)
>  {
>  	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 6abe30bdff12..fa8942922b53 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1541,7 +1541,8 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
>  
>  void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
>  			      struct drm_connector *connector,
> -			      enum drm_connector_status status)
> +			      enum drm_connector_status status,
> +			      enum drm_connector_dp_event event)
>  {
>  	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
>  	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
> index da412c788503..8f2f4201da60 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.h
> @@ -31,6 +31,7 @@ void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
>  void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
>  void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
>  			      struct drm_connector *connector,
> -			      enum drm_connector_status status);
> +			      enum drm_connector_status status,
> +			      enum drm_connector_dp_event event);
>  
>  #endif /* _DP_DRM_H_ */
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> index bd6c4d2dcdc8..72972a6fe989 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> @@ -429,7 +429,8 @@ static void hdmi4_bridge_disable(struct drm_bridge *bridge,
>  
>  static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
>  				    struct drm_connector *connector,
> -				    enum drm_connector_status status)
> +				    enum drm_connector_status status,
> +				    enum drm_connector_dp_event event)
>  {
>  	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
>  
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 1981d24a700d..6382ef5f1ea2 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -509,7 +509,8 @@ struct drm_bridge_funcs {
>  	 */
>  	void (*hpd_notify)(struct drm_bridge *bridge,
>  			   struct drm_connector *connector,
> -			   enum drm_connector_status status);
> +			   enum drm_connector_status status,
> +			   enum drm_connector_dp_event event);
>  
>  	/**
>  	 * @hpd_enable:
> 

-- 
Best, 
Chaoyi

