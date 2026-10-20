Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.79.60.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792459703;
	b=sxUEyhdVv6I7VXDVIrasIui/CRQwHSGunhfC9rS/dQOrEMHK7K9u0IhwgwV54CWVg+Iv
	 lrfYoTEiiuCzZFdb1Hdiizdk9Vv7XeZHGPbK8R43JQ83Mfrx2TvMI+/UUWYCYi2fGVeAF
	 NCplDwjuU/wh3pw7bKk6SdV9AccOsSTDckz5bKfPsj9R1/rdn5WiIGHsBtDCCIgb6BrQd
	 VAWo/EDQ0nNx08/l+Kjv4xqB4Gyeq6M7XmbSH5u3wlpQqOLppguF99a2A1k/0YIKo0gbb
	 68Cc/jPneSnfc9k1mkuIdi8Q41QyW5+EqE9BQcO5joU479BVViUA+sOR3vFY88p+r7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792459703;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=bWBcv8C01IwfRuVPSoLR1DOPENxFQuQLLISriS4I3Bo=;
	b=dHk18wc/w9AZ0/78mxaAokYMP9Qhur6aGqqu6gR9Y4nb/QfJVsfHZG0yl6mYFWq9Ghyd
	 Lh+Q7cuhcKkmSfHCPS0u5GLlbG0aIhzMCwZp/tFHkeXhzbGC3Bch2qLcRKENFVVXo4VCg
	 Sxm8sItGxcKbTnHE68iB28Y00XBu8kmj7kAq1UpYAU/pQXs1kBcj4JkJhCv3I7G86J3Kp
	 g/dAHpHzDsdmfB1D31L44/DzMGVOb3VSejiNi4zToNvWZQ3eMB18chYrYoh+vdfmwpJH/
	 LUBz1g8BLGT/hVajk9+T6PHCCSlVTn20GYNnHDdVi50Fhgdol7Q9yszJQWx8pcVBsyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=gTxNTfGS;
	arc=none smtp.remote-ip=210.79.60.45
Received: from mail-m6045.netease.com (mail-m6045.netease.com [210.79.60.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F212606A31A;
	Tue, 20 Oct 2026 01:28:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F212606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=gTxNTfGS
Received: from [127.0.0.1] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 51a0a3a65;
	Tue, 20 Oct 2026 09:28:12 +0800 (GMT+08:00)
Message-ID: <14852d51-eac2-4933-b786-948fbf0f0706@rock-chips.com>
Date: Tue, 20 Oct 2026 09:28:00 +0800
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
Subject: Re: [PATCH v7 7/9] drm: writeback: don't destroy the shared writeback
 properties
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 John Harrison <John.Harrison@igalia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Eric Anholt <eric@anholt.net>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Brian Starkey <brian.starkey@arm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
References: <20261019-wb-drop-encoder-v7-0-d4288a26eb54@oss.qualcomm.com>
 <20261019-wb-drop-encoder-v7-7-d4288a26eb54@oss.qualcomm.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261019-wb-drop-encoder-v7-7-d4288a26eb54@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa156ec57c703a7kunm0a3e7447726d61
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSh9NVhlIHU9NH04dTUIaSlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=gTxNTfGSyaOOvMaGprXiXKZMOe++RQG0eP8q8U6hl3BtnG/aJfNYC74BwlxSIxLdaFPlnHalBnhZGuY6Ue0lc0Ck3vqRpTOL4qYXs/nsN7K86RyI6Pv7njesYRTmlHDOOwRXHIpWHfU72cr6PQxTfS2gZwn6HUgfyhdaSamIS/A=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=bWBcv8C01IwfRuVPSoLR1DOPENxFQuQLLISriS4I3Bo=;
	h=date:mime-version:subject:message-id:from;

Hi Dmitry,

On 10/19/2026 9:12 PM, Dmitry Baryshkov wrote:
> The writeback properties are created once per device and attached to
> every writeback connector. Nevertheless, a failing
> __drm_writeback_connector_init() destroys all three of them. If an
> earlier writeback connector has already been registered (komeda and
> rcar-du create one per CRTC), it is left holding stale property
> pointers. The drmm cleanup action likewise destroys them as soon as the
> first connector goes away.
> 
> Leave the properties alone. They are on the device's property list, so
> drm_mode_config_cleanup() destroys them together with all other
> properties.
> 

If a user attaches a private property to a connector, are they 
responsible for calling put on that property during cleanup? 
In that case, can drmm* functions be used to clean up these 
properties? Thank you.


> Fixes: 2f3f4a73631b ("drm: writeback: Add missing cleanup in case of initialization failure")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/drm_writeback.c | 34 ++++++----------------------------
>  1 file changed, 6 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> index 89c36f1414ce..2f6a7b50336c 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -148,22 +148,6 @@ static int create_writeback_properties(struct drm_device *dev)
>  	return 0;
>  }
>  
> -static void delete_writeback_properties(struct drm_device *dev)
> -{
> -	if (dev->mode_config.writeback_pixel_formats_property) {
> -		drm_property_destroy(dev, dev->mode_config.writeback_pixel_formats_property);
> -		dev->mode_config.writeback_pixel_formats_property = NULL;
> -	}
> -	if (dev->mode_config.writeback_out_fence_ptr_property) {
> -		drm_property_destroy(dev, dev->mode_config.writeback_out_fence_ptr_property);
> -		dev->mode_config.writeback_out_fence_ptr_property = NULL;
> -	}
> -	if (dev->mode_config.writeback_fb_id_property) {
> -		drm_property_destroy(dev, dev->mode_config.writeback_fb_id_property);
> -		dev->mode_config.writeback_fb_id_property = NULL;
> -	}
> -}
> -
>  /**
>   * __drm_writeback_connector_init - Initialize a writeback connector
>   *
> @@ -198,20 +182,18 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
>  	int ret = create_writeback_properties(dev);
>  
>  	if (ret != 0)
> -		goto failed_properties;
> +		return ret;
>  
>  	connector->interlace_allowed = 0;
>  
>  	ret = drm_connector_attach_encoder(connector, enc);
>  	if (ret)
> -		goto failed_properties;
> +		return ret;
>  
>  	blob = drm_property_create_blob(dev, n_formats * sizeof(*formats),
>  					formats);
> -	if (IS_ERR(blob)) {
> -		ret = PTR_ERR(blob);
> -		goto failed_properties;
> -	}
> +	if (IS_ERR(blob))
> +		return PTR_ERR(blob);
>  
>  	INIT_LIST_HEAD(&wb_connector->job_queue);
>  	spin_lock_init(&wb_connector->job_lock);
> @@ -234,9 +216,6 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
>  	wb_connector->pixel_formats_blob_ptr = blob;
>  
>  	return 0;
> -failed_properties:
> -	delete_writeback_properties(dev);
> -	return ret;
>  }
>  
>  /**
> @@ -295,8 +274,8 @@ EXPORT_SYMBOL(drm_writeback_connector_init);
>   * @dev: DRM device
>   * @data: Pointer to the writeback connector to clean up
>   *
> - * This will decrement the reference counter of blobs and destroy properties. It
> - * will also clean the remaining jobs in this writeback connector. Caution: This helper will not
> + * This will decrement the reference counter of blobs. It will also clean the
> + * remaining jobs in this writeback connector. Caution: This helper will not
>   * clean up the attached encoder and the drm_connector.
>   */
>  static void drm_writeback_connector_cleanup(struct drm_device *dev,
> @@ -306,7 +285,6 @@ static void drm_writeback_connector_cleanup(struct drm_device *dev,
>  	struct drm_writeback_job *pos, *n;
>  	struct drm_writeback_connector *wb_connector = data;
>  
> -	delete_writeback_properties(dev);
>  	drm_property_blob_put(wb_connector->pixel_formats_blob_ptr);
>  
>  	spin_lock_irqsave(&wb_connector->job_lock, flags);
> 

-- 
Best, 
Chaoyi
