Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794447361;
	b=2pQD6I9JEokoL/YaayeRR9Z0E/lUBuTqGCtR4dFDZ/E/2+YKflu2sl4HMwi72cmOEIXt
	 +yDYHUliYrjKGl5xNwf+kV/nfFE5hYbcBqEQNm/AQB2Gxw7EyQSOmKKmXf1xMn1IAwjUP
	 BiV4FBuGU2mdaA+v0QxU1Zp49MyQYlxLlMT055MYqPCIsHsfj1FUXbA7+x284wyc2eU0G
	 HEaeMGfTBDBLy4zrlo45hzAGFWQ0spoLnmx49XpAKxExFNKQaVE81i+ng96eH2ApLuPIG
	 l2gaUjoFIOKJJK8L+2zDiBN6hyuVXG6Vz3F43d7iDzHoXt3y5LFxKxtL4mL874WYV6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794447361;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=qhI+E20LXIOORxSZb1YDpRTYLRw0BHBznnvwsuR4JMI=;
	b=cWkqnHUc2fb1suhwoztIcZcb7JDKNKviZWtfCoRNgG8hJOhGdBHWl11w4iFV9kowYKuh
	 o4FCCN7CbBHdNxZ8Oj2EEmXjz78zZBwXPeDcu74W0HCL8R4eeX7LqFY1/NWDoppHfhSFx
	 mSqUv6dJWCAtw1c8AgSBj1ffvXZREylHjbPT77P9bfPrDo4WvVZH0U8lplcANmeCyHHMi
	 y95Duq3npjuWN/yvND4x6ZS6PyoiBIOje2sQQP47Rgbq2ttg98IIGc7RvttEoYkUIgPoV
	 xN8e1zKVLUV+NyIFOO0hSpr33qG7H3Q13Tivhn/xwVaX/Cb5WHEdKFUeDWErgqDj9Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=Igalia.com;
	spf=pass smtp.mailfrom=Igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=SSelBtTG;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0883A606A332;
	Thu, 12 Nov 2026 01:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0883A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=Igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=SSelBtTG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=qhI+E20LXIOORxSZb1YDpRTYLRw0BHBznnvwsuR4JMI=; t=1794447360; x=2109807360; 
	b=SSelBtTG2llEei/ybDYULwK7yHOHMPLrjti1UDnPzfNPknKv4UQTaHgLeRsKNgOyfoxHOqTnHQD
	R6PUhVE6duTzW0A33ivRzkrIQJHE2SuRztj6ocMqa+6kEwMvk8PBAZfusV1dZ3Ss1Qf/p016TkxqE
	5UMtL4dODtuQbt0Q0y+HsYb8ExiS3LJbLXigDNfhIyEryyxUukDDYrPsUK+whmbvvIz8ioj+se/WU
	FUElXVAJVSDDA4A7aTapXGg5jU/K07+Gk9xQ9gtJl2UZFcda04O6RKmrVgh9ttv3V5E+JX4NjFC0p
	TUJIkFI0mtpoCgakHfh1S3gB0kjxsbzd/8Mw==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91] helo=[192.168.1.133])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xRJj7-009F8k-Ch; Thu, 12 Nov 2026 02:35:45 +0100
Message-ID: <73c4fcbc-20fe-4efc-95ad-c8d6a519e1fd@Igalia.com>
Date: Wed, 11 Nov 2026 17:35:38 -0800
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
Subject: Re: [PATCH v8 09/10] drm: writeback: clean up writeback connectors in
 drm_connector_cleanup()
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
 <20261111-wb-drop-encoder-v8-9-62948ed87d13@oss.qualcomm.com>
Content-Language: en-GB
From: John Harrison <John.Harrison@Igalia.com>
In-Reply-To: <20261111-wb-drop-encoder-v8-9-62948ed87d13@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/26 16:42, Dmitry Baryshkov wrote:
> Only drmm_writeback_connector_init() registers
> drm_writeback_connector_cleanup(). Connectors set up with
> drm_writeback_connector_init() (amdgpu, komeda, malidp, rcar-du, vc4)
> never drop the formats blob or free the jobs still on the queue, leaking
> them together with their framebuffer and fence references.
>
> Call drm_writeback_connector_cleanup() from drm_connector_cleanup() so it
> runs for both kinds of initialization, the same way the HDMI audio and
> SCDC state is torn down there. It downcasts the connector to its
> drm_writeback_connector wrapper, which is only valid when the connector
> really is embedded in one. A plain drm_connector (or a different wrapper
> struct) may be initialized with DRM_MODE_CONNECTOR_WRITEBACK without being
> a writeback connector, as several KUnit tests do, so keying the cleanup
> off the connector type would read out of bounds. Track genuine writeback
> initialization with a drm_connector::wb_initialized flag set by
> __drm_writeback_connector_init() and clean up based on it instead. The
> drmm action now just wraps the helper; clearing the flag makes the second
> invocation a no-op and also covers drm_connector_cleanup() being called
> after a failed __drm_writeback_connector_init().
>
> Fixes: 935774cd71fe ("drm: Add writeback connector type")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
I have verified that this version fixes the selftest failures I was hitting.

Reviewed-by: John Harrison <John.Harrison@Igalia.com>

> ---
>   drivers/gpu/drm/drm_connector.c     |  3 +++
>   drivers/gpu/drm/drm_crtc_internal.h |  3 +++
>   drivers/gpu/drm/drm_writeback.c     | 30 ++++++++++++++++++++++++------
>   include/drm/drm_connector.h         | 12 ++++++++++++
>   4 files changed, 42 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index d66188521881..da0b16f25ac4 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -921,6 +921,9 @@ void drm_connector_cleanup(struct drm_connector *connector)
>   	if (connector->hdmi.scdc_work_initialized)
>   		cancel_delayed_work_sync(&connector->hdmi.scdc_work);
>   
> +	if (connector->wb_initialized)
> +		drm_writeback_connector_cleanup(connector);
> +
>   	platform_device_unregister(connector->hdmi_audio.codec_pdev);
>   
>   	if (connector->privacy_screen) {
> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
> index 3492787c3697..f60216adcd31 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -329,4 +329,7 @@ static inline void drm_panic_unregister(struct drm_device *dev) {}
>   static inline void drm_panic_init(void) {}
>   #endif
>   
> +/* drm_writeback.c */
> +void drm_writeback_connector_cleanup(struct drm_connector *connector);
> +
>   #endif /* __DRM_CRTC_INTERNAL_H__ */
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> index 6487f4a104f2..6ea3e55a1962 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -21,6 +21,8 @@
>   #include <drm/drm_property.h>
>   #include <drm/drm_writeback.h>
>   
> +#include "drm_crtc_internal.h"
> +
>   /**
>    * DOC: overview
>    *
> @@ -215,6 +217,8 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
>   				   blob->base.id);
>   	wb_connector->pixel_formats_blob_ptr = blob;
>   
> +	connector->wb_initialized = true;
> +
>   	return 0;
>   }
>   
> @@ -271,22 +275,28 @@ EXPORT_SYMBOL(drm_writeback_connector_init);
>   
>   /**
>    * drm_writeback_connector_cleanup - Cleanup the writeback connector
> - * @dev: DRM device
> - * @data: Pointer to the writeback connector to clean up
> + * @connector: Writeback connector to clean up
>    *
>    * This will decrement the reference counter of blobs. It will also clean the
>    * remaining jobs in this writeback connector. Caution: This helper will not
>    * clean up the attached encoder and the drm_connector.
> + *
> + * Called from drm_connector_cleanup() for all writeback connectors.
>    */
> -static void drm_writeback_connector_cleanup(struct drm_device *dev,
> -					    void *data)
> +void drm_writeback_connector_cleanup(struct drm_connector *connector)
>   {
> -	struct drm_writeback_connector *wb_connector = data;
> +	struct drm_writeback_connector *wb_connector =
> +		drm_connector_to_writeback(connector);
>   	struct drm_writeback_job *pos, *n;
>   	unsigned long flags;
>   	LIST_HEAD(jobs);
>   
> +	if (!connector->wb_initialized)
> +		return;
> +	connector->wb_initialized = false;
> +
>   	drm_property_blob_put(wb_connector->pixel_formats_blob_ptr);
> +	wb_connector->pixel_formats_blob_ptr = NULL;
>   
>   	spin_lock_irqsave(&wb_connector->job_lock, flags);
>   	list_splice_init(&wb_connector->job_queue, &jobs);
> @@ -298,6 +308,14 @@ static void drm_writeback_connector_cleanup(struct drm_device *dev,
>   	}
>   }
>   
> +static void drm_writeback_connector_cleanup_action(struct drm_device *dev,
> +						   void *data)
> +{
> +	struct drm_writeback_connector *wb_connector = data;
> +
> +	drm_writeback_connector_cleanup(&wb_connector->base);
> +}
> +
>   /**
>    * drmm_writeback_connector_init - Initialize a writeback connector
>    *
> @@ -336,7 +354,7 @@ int drmm_writeback_connector_init(struct drm_device *dev,
>   	if (ret)
>   		return ret;
>   
> -	ret = drmm_add_action_or_reset(dev, drm_writeback_connector_cleanup,
> +	ret = drmm_add_action_or_reset(dev, drm_writeback_connector_cleanup_action,
>   				       wb_connector);
>   	if (ret)
>   		return ret;
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index f656ed8324d3..07218ab26c9e 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -2688,6 +2688,18 @@ struct drm_connector {
>   	 */
>   	struct llist_node free_node;
>   
> +	/**
> +	 * @wb_initialized:
> +	 *
> +	 * Set when the connector is embedded in a &struct
> +	 * drm_writeback_connector that has been initialized through
> +	 * __drm_writeback_connector_init(). A plain &struct drm_connector may
> +	 * be created with DRM_MODE_CONNECTOR_WRITEBACK without being a
> +	 * writeback connector, so drm_connector_cleanup() keys the writeback
> +	 * teardown off this flag rather than the connector type.
> +	 */
> +	bool wb_initialized;
> +
>   	/**
>   	 * @hdmi: HDMI-related variable and properties.
>   	 */
>

