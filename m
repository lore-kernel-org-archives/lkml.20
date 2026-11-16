Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832789;
	b=RL/VRLOWFb/GiWV8LE+CQnlAUznqsF4CHElk1CeeP2NHG2jf9DujFPjtTrgoNTqc2aK7
	 jFjEO7WImRXNnIF9EcjAH8Bedzstm37hQTrcb646nP3iSe6aUmBEjGUNbNvyVSo+I8+Wp
	 TYc21KTvZCXdU627ihGrXRyT4W8aS2lFIU79N+Qt9/8OkH4DoaYo2ORYtE7lJJr8lC5gr
	 ApLAl78ybz+q44t6g/XR8IjdA4HmVh22F+nsjgEtEPJddK3vuXZ/Ab4Ua8KELfPALkFjA
	 iMowA5uS8569Zqu1yVYuBmIfcfB+/Xg6dBxrr8aBwi4xjVbeKz8HzaLZdm4Cw3D5HjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832789;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=nxenrdouUK6y+DAi07yt6iOH6+eUJjLJwROhmePJqr8=;
	b=2TrJo5VsIaGRS/utxbN4hLfwL/F3uwLS/7aqG+2GIYKIUfq2hLXe9cxSvZl4+tv5GFbA
	 IQgCKeaPvhWBeqwVIZ6/LGRb6jnw7NBZNPMSNJZ6AeS/qP2YnUc1LRy5Zkr0yqTd8Z0Bm
	 +/1wM9zAMokqOWwQxq+yOydbwguBRWyD++Q/wFjeE0BDbRIddumovk9uf5pSam6VqD+Bz
	 vHgnydT85jPftqyevYDBIPvTaxfRy1NtZOQBVn7GC25pwD0OysCTB6u52SLNABZMqI67f
	 UeCdMcu3i5Y7BqW0l3vsezfdlL1czJPFlg4pas+LVa5R3r98CFU1rXGwTUz8c5Y9heQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=CtE9QPD5;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51788606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51788606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=CtE9QPD5
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B1F21C4EFD7;
	Mon, 16 Nov 2026 12:39:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BCFDA6023F;
	Mon, 16 Nov 2026 12:39:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CE01111BC00A4;
	Mon, 16 Nov 2026 13:39:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794832778; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=nxenrdouUK6y+DAi07yt6iOH6+eUJjLJwROhmePJqr8=;
	b=CtE9QPD5mt4WKb6jYrR88eZzNnZ+KnWR4rRe4+95QyBRycvl4uEVBAzWr3pHtvyZ7Glgxt
	/V/8wB2sC3TO/t6hG//e3FgR0S5DLaCKDX4epeugDYooqK5nEDpLkakJJTCGJbNFqTC3Ag
	sRJWfr+jx1rvfO59FP2sq853TSqMaulQpmB8DmGzx4Pygepb/a/gKSdfKO0FInvXmGfcP0
	CvIdnfETafMjxtw5zLG3xGvRO/HnweGoIXDEvZKMXqAzFZa0D/flgya1vkk/+1MF3sPWcq
	qzxmwWqIfGI9+o+xG7OMsPEPvhiQSbPeZjr2jxWj+BEajTralxH6LCeQ2U3C+w==
Message-ID: <e086d6f0-0729-4408-934f-4cac8980f5bc@bootlin.com>
Date: Mon, 16 Nov 2026 13:39:31 +0100
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
Subject: Re: [PATCH v11 9/9] drm/vkms: Add driver-specific plane property for
 testing
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>
Cc: Daniel Stone <daniels@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, =?UTF-8?Q?Jonas_=C3=85dahl?=
 <jadahl@redhat.com>, =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, Simon Ser <contact@emersion.fr>,
 Victoria Brekenfeld <victoria@system76.com>, Xaver Hugl
 <xaver.hugl@kde.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Oarora Etimis <oaroraetimis@gmail.com>
References: <20261116-drm-reset-state-flag-v11-0-378b3f7bef32@kernel.org>
 <20261116-drm-reset-state-flag-v11-9-378b3f7bef32@kernel.org>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261116-drm-reset-state-flag-v11-9-378b3f7bef32@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/16/26 11:17, Maxime Ripard wrote:
> The DRM_MODE_ATOMIC_RESET flag allows userspace to reset all object
> states to their defaults before applying new property values. Testing
> that this mechanism works correctly requires a property that the test
> can set to a non-default value and then verify is properly reset.
> 
> Using a standard property for this is problematic: compositors like
> Mutter enumerate and track all known properties, making it difficult
> to isolate the reset behavior from the compositor's own property
> management.
> 
> Add a "vkms-test-do-not-use-in-prod" range property to vkms planes.
> The property is stored in vkms_plane_state, duplicated across state
> copies, and initialized from its registered default in
> atomic_create_state via drm_object_property_get_default_value().
> 
> Reviewed-by: Daniel Stone <daniels@collabora.com>
> Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>   drivers/gpu/drm/vkms/vkms_drv.h   |  3 ++
>   drivers/gpu/drm/vkms/vkms_plane.c | 63 +++++++++++++++++++++++++++++++++++++--
>   2 files changed, 64 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index dea6cad3f1b9..384616095b45 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -144,20 +144,23 @@ struct conversion_matrix {
>    * @base: base plane state
>    * @frame_info: data required for composing computation
>    * @pixel_read_line: function to read a pixel line in this plane. The creator of a
>    *		     struct vkms_plane_state must ensure that this pointer is valid
>    * @conversion_matrix: matrix used for yuv formats to convert to rgb
> + * @vkms_test_do_not_use_value: driver-specific property for testing only
>    */
>   struct vkms_plane_state {
>   	struct drm_shadow_plane_state base;
>   	struct vkms_frame_info frame_info;
>   	pixel_read_line_t pixel_read_line;
>   	struct conversion_matrix conversion_matrix;
> +	unsigned int vkms_test_do_not_use_value;
>   };
>   
>   struct vkms_plane {
>   	struct drm_plane base;
> +	struct drm_property *vkms_test_do_not_use_property;
>   };
>   
>   struct vkms_color_lut {
>   	struct drm_color_lut *base;
>   	size_t lut_length;
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index fd3d34dcf0fe..42513cb462ac 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -9,14 +9,18 @@
>   #include <drm/drm_colorop.h>
>   #include <drm/drm_fourcc.h>
>   #include <drm/drm_gem_atomic_helper.h>
>   #include <drm/drm_gem_framebuffer_helper.h>
>   #include <drm/drm_print.h>
> +#include <drm/drm_property.h>
>   
>   #include "vkms_drv.h"
>   #include "vkms_formats.h"
>   
> +#define to_vkms_plane(target) \
> +	container_of_const(target, struct vkms_plane, base)
> +
>   static const u32 vkms_formats[] = {
>   	DRM_FORMAT_ARGB8888,
>   	DRM_FORMAT_ABGR8888,
>   	DRM_FORMAT_BGRA8888,
>   	DRM_FORMAT_RGBA8888,
> @@ -52,16 +56,19 @@ static const u32 vkms_formats[] = {
>   };
>   
>   static struct drm_plane_state *
>   vkms_plane_duplicate_state(struct drm_plane *plane)
>   {
> +	struct vkms_plane_state *old_state = to_vkms_plane_state(plane->state);
>   	struct vkms_plane_state *vkms_state;
>   
>   	vkms_state = kzalloc_obj(*vkms_state);
>   	if (!vkms_state)
>   		return NULL;
>   
> +	vkms_state->vkms_test_do_not_use_value = old_state->vkms_test_do_not_use_value;
> +
>   	__drm_gem_duplicate_shadow_plane_state(plane, &vkms_state->base);
>   
>   	return &vkms_state->base.base;
>   }
>   
> @@ -83,28 +90,69 @@ static void vkms_plane_destroy_state(struct drm_plane *plane,
>   	kfree(vkms_state);
>   }
>   
>   static struct drm_plane_state *vkms_plane_create_state(struct drm_plane *plane)
>   {
> +	struct vkms_plane *vkms_plane = to_vkms_plane(plane);
>   	struct vkms_plane_state *vkms_state;
> +	u64 val;
>   
>   	vkms_state = kzalloc_obj(*vkms_state);
>   	if (!vkms_state) {
>   		DRM_ERROR("Cannot allocate vkms_plane_state\n");
>   		return ERR_PTR(-ENOMEM);
>   	}
>   
>   	__drm_gem_shadow_plane_state_init(plane, &vkms_state->base);
>   
> +	if (!drm_object_property_get_default_value(&plane->base,
> +						   vkms_plane->vkms_test_do_not_use_property,
> +						   &val))
> +		vkms_state->vkms_test_do_not_use_value = val;
> +
>   	return &(&vkms_state->base)->base;
>   }
>   
> +static int vkms_plane_atomic_set_property(struct drm_plane *plane,
> +					  struct drm_plane_state *state,
> +					  struct drm_property *property,
> +					  uint64_t val)
> +{
> +	struct vkms_plane *vkms_plane = to_vkms_plane(plane);
> +	struct vkms_plane_state *vkms_state = to_vkms_plane_state(state);
> +
> +	if (property == vkms_plane->vkms_test_do_not_use_property) {
> +		vkms_state->vkms_test_do_not_use_value = val;
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int vkms_plane_atomic_get_property(struct drm_plane *plane,
> +					  const struct drm_plane_state *state,
> +					  struct drm_property *property,
> +					  uint64_t *val)
> +{
> +	const struct vkms_plane_state *vkms_state = to_vkms_plane_state(state);
> +	const struct vkms_plane *vkms_plane = to_vkms_plane(plane);
> +
> +	if (property == vkms_plane->vkms_test_do_not_use_property) {
> +		*val = vkms_state->vkms_test_do_not_use_value;
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
>   static const struct drm_plane_funcs vkms_plane_funcs = {
>   	.update_plane		= drm_atomic_helper_update_plane,
>   	.disable_plane		= drm_atomic_helper_disable_plane,
> -	.atomic_create_state = vkms_plane_create_state,
> -	.atomic_duplicate_state = vkms_plane_duplicate_state,
> +	.atomic_set_property	= vkms_plane_atomic_set_property,
> +	.atomic_get_property	= vkms_plane_atomic_get_property,
> +	.atomic_create_state	= vkms_plane_create_state,
> +	.atomic_duplicate_state	= vkms_plane_duplicate_state,
>   	.atomic_destroy_state	= vkms_plane_destroy_state,
>   };
>   
>   static void vkms_plane_atomic_update(struct drm_plane *plane,
>   				     struct drm_atomic_commit *state)
> @@ -281,10 +329,21 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>   					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
>   					  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
>   					  DRM_COLOR_YCBCR_BT601,
>   					  DRM_COLOR_YCBCR_FULL_RANGE);
>   
> +	plane->vkms_test_do_not_use_property =
> +		drm_property_create_range(dev, 0,
> +					  "vkms-test-do-not-use-in-prod",
> +					  0, U32_MAX);
> +	if (!plane->vkms_test_do_not_use_property)
> +		return ERR_PTR(-ENOMEM);
> +
> +	drm_object_attach_property(&plane->base.base,
> +				   plane->vkms_test_do_not_use_property,
> +				   0);
> +
>   	if (vkms_config_plane_get_default_pipeline(plane_cfg))
>   		vkms_initialize_colorops(&plane->base);
>   
>   	return plane;
>   }
> 

