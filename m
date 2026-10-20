Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.224.81.87
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792459378;
	b=lUrWPj25AyavQmvBMW5MICD4Gg/Skv1rv8ZwaW2blPD+PDcEjYWDmKMi1VbUdNMDBHZX
	 Kx7IXpcYvRupPsxff3xcoPCAAGC5NCCyGPVRVnA+ta1JcsmVqJWG3nIYPvvU5c3dM9YOp
	 EVtuzGECWscfMKeyuuUvNvMpqGkGLf5WUx39St7K3RZqSq/kN36Vd7PLMpY0Ys41vV34/
	 rqdnmisgvWTce6NxuxdA/YKnNOMGEHGohhFVqBDGRksHiwB4fk4fSAxHqLBU7hW8+YXnU
	 wJLkyHn6wA0vldcij/U8TOV46xSLHjwlbovMWhrx0hiuJqh9fCaRpRW0NS7j3/DFAQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792459378;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=F0uOS6v5FtHuwws+7EOvbcOhYOvdamssnZrxcYuc3qI=;
	b=WZK08Hsd9MVmS2crNBd8eaidbr5hKnLtlPIksSVpsTcB5/Rf6JjmyLlU1slegSvA1jNJ
	 bhRin46ZKtz0GX5tt+fQjkZ4UFXfpuSpkWBj7NcyyF2UOgzrdc7iadwoqmu1X1/ZinjRY
	 inKFaZLsQj/w2Ua+pOdBgsAPgTwO5NuxcO/TqfS4OBFpzc5awdToneVKFFPtvINceJKie
	 P4XdCsJwSullonXgm/Vof72Emcug4jqPb+HJjJ0tIoKzX9dTE18c0PPzNfjFDgJYtqqvC
	 G/0I67PqyJ9DxiF2zqEhEjUyMI4qGj0EQuNg82zcZ+fXuaQjT6JUTelajAMffIkXkrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=T1YeAO2k;
	arc=none smtp.remote-ip=156.224.81.87
Received: from mail-m8187.xmail.ntesmail.com (mail-m8187.xmail.ntesmail.com [156.224.81.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FBF606A319;
	Tue, 20 Oct 2026 01:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0FBF606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=T1YeAO2k
Received: from [127.0.0.1] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 51a079946;
	Tue, 20 Oct 2026 09:22:43 +0800 (GMT+08:00)
Message-ID: <c86428a2-b72b-4c47-b2ba-90124111b9d2@rock-chips.com>
Date: Tue, 20 Oct 2026 09:22:31 +0800
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
Subject: Re: [PATCH v7 6/9] drm: writeback: rename
 drm_writeback_connector_init_with_encoder()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 John Harrison <John.Harrison@igalia.com>,
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
 <20261019-wb-drop-encoder-v7-6-d4288a26eb54@oss.qualcomm.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261019-wb-drop-encoder-v7-6-d4288a26eb54@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa156e753a003a7kunmb394a3327256e3
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHk5IVhoZQ0IZTUxPSh5DTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=T1YeAO2kq/ikq7GGi2RzrIP7rUaHs0FQV7ZTfKRJD380Wl/oi8w5HoJKvuQgvMr7INLtgl6+4c6hnt2N5FwE5sY1I/0Av5i3pMKRLtbn0Mj+GjwWeFfzhC51BFoU0Qqq40Dr3Sz5JiDN0Z9T0BOEqsx5vr4swzhcjm0d0mqLGEE=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=F0uOS6v5FtHuwws+7EOvbcOhYOvdamssnZrxcYuc3qI=;
	h=date:mime-version:subject:message-id:from;

On 10/19/2026 9:12 PM, Dmitry Baryshkov wrote:
> Rename drm_writeback_connector_init_with_encoder() to
> drm_writeback_connector_init() and adapt its interface to follow
> drmm_writeback_connector_init(). Drop references to the "custom encoder"
> from the documentation since it's now the only way to specify the
> encoder to the writeback connector.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c    | 10 +++++-----
>  .../drm/arm/display/komeda/komeda_wb_connector.c    |  8 ++++----
>  drivers/gpu/drm/arm/malidp_mw.c                     |  8 ++++----
>  drivers/gpu/drm/drm_writeback.c                     | 21 +++++++++------------
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c | 10 +++++-----
>  drivers/gpu/drm/vc4/vc4_txp.c                       |  8 ++++----
>  include/drm/drm_writeback.h                         | 10 +++++-----
>  7 files changed, 36 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
> index b5b186e4f81c..18bee44794ce 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
> @@ -261,11 +261,11 @@ int amdgpu_dm_wb_connector_init(struct amdgpu_display_manager *dm,
>  
>  	drm_connector_helper_add(&wbcon->base.base, &amdgpu_dm_wb_conn_helper_funcs);
>  
> -	res = drm_writeback_connector_init_with_encoder(&dm->adev->ddev, &wbcon->base,
> -							&wbcon->encoder,
> -							&amdgpu_dm_wb_connector_funcs,
> -							amdgpu_dm_wb_formats,
> -							ARRAY_SIZE(amdgpu_dm_wb_formats));
> +	res = drm_writeback_connector_init(&dm->adev->ddev, &wbcon->base,
> +					   &amdgpu_dm_wb_connector_funcs,
> +					   &wbcon->encoder,
> +					   amdgpu_dm_wb_formats,
> +					   ARRAY_SIZE(amdgpu_dm_wb_formats));
>  	if (res) {
>  		drm_encoder_cleanup(&wbcon->encoder);
>  		return res;
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
> index 77aecf4d3f09..7c64facfd799 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
> @@ -186,10 +186,10 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
>  		return err;
>  	}
>  
> -	err = drm_writeback_connector_init_with_encoder(&kms->base, wb_conn,
> -							wb_encoder,
> -							&komeda_wb_connector_funcs,
> -							formats, n_formats);
> +	err = drm_writeback_connector_init(&kms->base, wb_conn,
> +					   &komeda_wb_connector_funcs,
> +					   wb_encoder,
> +					   formats, n_formats);
>  	komeda_put_fourcc_list(formats);
>  	if (err) {
>  		drm_encoder_cleanup(wb_encoder);
> diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
> index 7f5e25adf999..7e1d1c0988ae 100644
> --- a/drivers/gpu/drm/arm/malidp_mw.c
> +++ b/drivers/gpu/drm/arm/malidp_mw.c
> @@ -240,10 +240,10 @@ int malidp_mw_connector_init(struct drm_device *drm)
>  		return ret;
>  	}
>  
> -	ret = drm_writeback_connector_init_with_encoder(drm, &malidp->mw_connector,
> -							&malidp->mw_encoder,
> -							&malidp_mw_connector_funcs,
> -							formats, n_formats);
> +	ret = drm_writeback_connector_init(drm, &malidp->mw_connector,
> +					   &malidp_mw_connector_funcs,
> +					   &malidp->mw_encoder,
> +					   formats, n_formats);
>  	kfree(formats);
>  	if (ret) {
>  		drm_encoder_cleanup(&malidp->mw_encoder);
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> index 683da368e339..89c36f1414ce 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -165,8 +165,7 @@ static void delete_writeback_properties(struct drm_device *dev)
>  }
>  
>  /**
> - * __drm_writeback_connector_init - Initialize a writeback connector with
> - * a custom encoder
> + * __drm_writeback_connector_init - Initialize a writeback connector
>   *
>   * @dev: DRM device
>   * @wb_connector: Writeback connector to initialize
> @@ -241,8 +240,7 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
>  }
>  
>  /**
> - * drm_writeback_connector_init_with_encoder - Initialize a writeback connector with
> - * a custom encoder
> + * drm_writeback_connector_init - Initialize a writeback connector
>   *
>   * @dev: DRM device
>   * @wb_connector: Writeback connector to initialize
> @@ -269,11 +267,11 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
>   *
>   * Returns: 0 on success, or a negative error code
>   */
> -int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
> -					      struct drm_writeback_connector *wb_connector,
> -					      struct drm_encoder *enc,
> -					      const struct drm_connector_funcs *con_funcs,
> -					      const u32 *formats, int n_formats)
> +int drm_writeback_connector_init(struct drm_device *dev,
> +				 struct drm_writeback_connector *wb_connector,
> +				 const struct drm_connector_funcs *con_funcs,
> +				 struct drm_encoder *enc,
> +				 const u32 *formats, int n_formats)
>  {
>  	struct drm_connector *connector = &wb_connector->base;
>  	int ret;
> @@ -290,7 +288,7 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
>  
>  	return ret;
>  }
> -EXPORT_SYMBOL(drm_writeback_connector_init_with_encoder);
> +EXPORT_SYMBOL(drm_writeback_connector_init);
>  
>  /**
>   * drm_writeback_connector_cleanup - Cleanup the writeback connector
> @@ -320,8 +318,7 @@ static void drm_writeback_connector_cleanup(struct drm_device *dev,
>  }
>  
>  /**
> - * drmm_writeback_connector_init - Initialize a writeback connector with
> - * a custom encoder
> + * drmm_writeback_connector_init - Initialize a writeback connector
>   *
>   * @dev: DRM device
>   * @wb_connector: Writeback connector to initialize
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
> index b0c1ca0d0dfa..35460a314a7f 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
> @@ -219,11 +219,11 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
>  	drm_connector_helper_add(&wb_conn->base,
>  				 &rcar_du_wb_conn_helper_funcs);
>  
> -	ret = drm_writeback_connector_init_with_encoder(&rcdu->ddev, wb_conn,
> -							encoder,
> -							&rcar_du_wb_conn_funcs,
> -							writeback_formats,
> -							ARRAY_SIZE(writeback_formats));
> +	ret = drm_writeback_connector_init(&rcdu->ddev, wb_conn,
> +					   &rcar_du_wb_conn_funcs,
> +					   encoder,
> +					   writeback_formats,
> +					   ARRAY_SIZE(writeback_formats));
>  	if (ret)
>  		drm_encoder_cleanup(encoder);
>  
> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
> index c469f8b1068b..33b1bc37b362 100644
> --- a/drivers/gpu/drm/vc4/vc4_txp.c
> +++ b/drivers/gpu/drm/vc4/vc4_txp.c
> @@ -601,10 +601,10 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
>  
>  	drm_connector_helper_add(&txp->connector.base,
>  				 &vc4_txp_connector_helper_funcs);
> -	ret = drm_writeback_connector_init_with_encoder(drm, &txp->connector,
> -							encoder,
> -							&vc4_txp_connector_funcs,
> -							drm_fmts, ARRAY_SIZE(drm_fmts));
> +	ret = drm_writeback_connector_init(drm, &txp->connector,
> +					   &vc4_txp_connector_funcs,
> +					   encoder,
> +					   drm_fmts, ARRAY_SIZE(drm_fmts));
>  	if (ret)
>  		return ret;
>  
> diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
> index 879ca103320c..958466a05e60 100644
> --- a/include/drm/drm_writeback.h
> +++ b/include/drm/drm_writeback.h
> @@ -137,11 +137,11 @@ drm_connector_to_writeback(struct drm_connector *connector)
>  	return container_of(connector, struct drm_writeback_connector, base);
>  }
>  
> -int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
> -				struct drm_writeback_connector *wb_connector,
> -				struct drm_encoder *enc,
> -				const struct drm_connector_funcs *con_funcs, const u32 *formats,
> -				int n_formats);
> +int drm_writeback_connector_init(struct drm_device *dev,
> +				 struct drm_writeback_connector *wb_connector,
> +				 const struct drm_connector_funcs *con_funcs,
> +				 struct drm_encoder *enc,
> +				 const u32 *formats, int n_formats);
>  
>  int drmm_writeback_connector_init(struct drm_device *dev,
>  				  struct drm_writeback_connector *wb_connector,
> 

Looks good to me. 

Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

-- 
Best, 
Chaoyi

