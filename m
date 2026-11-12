Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794447169;
	b=fOh//VXTIN+VCGREg63NXEAPgJbMpyNB2Prt9cTQw27/mrXuoXs1QS/BDy3W6Zz9m2Dg
	 mjAEDuFKUAdkdF4+9+ND7bMdle7UvCkh5VN8hltpjRFK5zHSEvYmQ/CHBs/UrsMIoQ4up
	 KUgJHykhI8lj1G7FpPPeT5LvsNX6LNVfl1Tu8RtdVg7QXduEDi3cJoVxodTck5jQSULo2
	 erH/VS/ob4/o7wJToHKFC03yl+yutWT5IqcJZimwOHjzhcFAtrQV+ysaVE3W1TeFkA7Et
	 UwRx0MiMzi0+yW+ovYWuMZgZsHWRYgF8pp+aFSLzvybOpEYjvcBTgiNeO4nz6wThzxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794447169;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=StFp1g4ubx1WuclDmg58dMlRXvni7TqI4/w/yKHNuxg=;
	b=3l/YCf4ex/pbYg0yz+09mpL2QwwYsxmWG7LwQ0UfjMdmXnfvgyEeMTmhKqs646GcFE7H
	 TrjA3qe+Xjqys5GDUhbV+rVNvb+N+h5Qr6M4riNm+jx64kn82wI8bzPCD8hRnZB70Dld9
	 Cz+OBOInxpcAILWCcwzG9eBSzDLJrIf0MZNFCkbEXexPZIzjRJ8XLfUR6kTzfMMNLEMnR
	 FqSuOlULcKnmOBo7d8wbzmSdfmaaq1tymWGYyqxTVcNgNLZ7X48jOLnyHUmWuRe48Jfqk
	 i3Ll//02oPbPiXGLG74SAKeRpzxn0foWbNmDevllbNg4uljN2iQJUCHKUfUGYJuYUhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=Igalia.com;
	spf=pass smtp.mailfrom=Igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=s2opkGXr;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66123606A327;
	Thu, 12 Nov 2026 01:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66123606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=Igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=s2opkGXr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=StFp1g4ubx1WuclDmg58dMlRXvni7TqI4/w/yKHNuxg=; t=1794447167; x=2109807167; 
	b=s2opkGXr94lW9bexnnxDQQjbuy1cjwunD43MvT59+dt6FfKoYImurtv/ouXw+h9LDX6xZh89523
	QskCDo8qLYjsMczoDKZNHMpD0FLhqh4eUbt1UBqbCRG6KkGrTstBfJ8QaNpYVKFFUCy1CEmuxZj89
	bd3Htrgxa1DCoDvrBYRDk+KyMhLXJMO8AHjTcQPGgQkV4YDVNBgLpT/H/o/+AiVX1OdgJ70UvgWNg
	ABEhNKpV/lbANRyixsfFXa7dgGCjmWuMxDR6G/2PIgbzR7rEOY1/mqI3ObwiNsrtpke9SyueDbaA3
	lvVgNzEs3DxznRbcou2g89lVZI3dYh/DQWcw==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91] helo=[192.168.1.133])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xRJfi-009F3i-Aj; Thu, 12 Nov 2026 02:32:14 +0100
Message-ID: <ee8a57d3-d290-4a20-a3ca-ac8e17a7561c@Igalia.com>
Date: Wed, 11 Nov 2026 17:32:05 -0800
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
Subject: Re: [PATCH v8 07/10] drm: writeback: don't destroy the shared
 writeback properties
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
 Brian Starkey <brian.starkey@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <20261111-wb-drop-encoder-v8-0-62948ed87d13@oss.qualcomm.com>
 <20261111-wb-drop-encoder-v8-7-62948ed87d13@oss.qualcomm.com>
Content-Language: en-GB
From: John Harrison <John.Harrison@Igalia.com>
In-Reply-To: <20261111-wb-drop-encoder-v8-7-62948ed87d13@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/26 16:42, Dmitry Baryshkov wrote:
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
This does appear to be the actual behaviour. More importantly, it is 
also the intended behaviour according to various comments sprinkled 
around the property creation functions.

Reviewed-by: John Harrison <John.Harrison@Igalia.com>

> Fixes: 2f3f4a73631b ("drm: writeback: Add missing cleanup in case of initialization failure")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/drm_writeback.c | 34 ++++++----------------------------
>   1 file changed, 6 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> index 89c36f1414ce..2f6a7b50336c 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -148,22 +148,6 @@ static int create_writeback_properties(struct drm_device *dev)
>   	return 0;
>   }
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
>   /**
>    * __drm_writeback_connector_init - Initialize a writeback connector
>    *
> @@ -198,20 +182,18 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
>   	int ret = create_writeback_properties(dev);
>   
>   	if (ret != 0)
> -		goto failed_properties;
> +		return ret;
>   
>   	connector->interlace_allowed = 0;
>   
>   	ret = drm_connector_attach_encoder(connector, enc);
>   	if (ret)
> -		goto failed_properties;
> +		return ret;
>   
>   	blob = drm_property_create_blob(dev, n_formats * sizeof(*formats),
>   					formats);
> -	if (IS_ERR(blob)) {
> -		ret = PTR_ERR(blob);
> -		goto failed_properties;
> -	}
> +	if (IS_ERR(blob))
> +		return PTR_ERR(blob);
>   
>   	INIT_LIST_HEAD(&wb_connector->job_queue);
>   	spin_lock_init(&wb_connector->job_lock);
> @@ -234,9 +216,6 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
>   	wb_connector->pixel_formats_blob_ptr = blob;
>   
>   	return 0;
> -failed_properties:
> -	delete_writeback_properties(dev);
> -	return ret;
>   }
>   
>   /**
> @@ -295,8 +274,8 @@ EXPORT_SYMBOL(drm_writeback_connector_init);
>    * @dev: DRM device
>    * @data: Pointer to the writeback connector to clean up
>    *
> - * This will decrement the reference counter of blobs and destroy properties. It
> - * will also clean the remaining jobs in this writeback connector. Caution: This helper will not
> + * This will decrement the reference counter of blobs. It will also clean the
> + * remaining jobs in this writeback connector. Caution: This helper will not
>    * clean up the attached encoder and the drm_connector.
>    */
>   static void drm_writeback_connector_cleanup(struct drm_device *dev,
> @@ -306,7 +285,6 @@ static void drm_writeback_connector_cleanup(struct drm_device *dev,
>   	struct drm_writeback_job *pos, *n;
>   	struct drm_writeback_connector *wb_connector = data;
>   
> -	delete_writeback_properties(dev);
>   	drm_property_blob_put(wb_connector->pixel_formats_blob_ptr);
>   
>   	spin_lock_irqsave(&wb_connector->job_lock, flags);
>

