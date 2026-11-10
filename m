Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.209.128.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308115;
	b=AKV1fLyj6DbpPYEegqC+G7m8vJcfwvvymc69ooGHjPRXV6eDpxOXskSYD8xYEpwTFWOh
	 mT5pxAdgwXsaEgaxCKK1b7XkH9lTtDafSjMFso0A4aiSoEZSmMFXCWZRXoaM4XD6bfsGj
	 QHOrj+RXx9JLtuWaxUE6vsulqmphnN7HyTU1t0UhVvd+kFPJ69khv21kPuzQB9puUL7TB
	 3zGBCXFdjHQvtKDGZqZLyIYnE+3wL3J0rknKnaxCE65k1I0Dj97AdPJLVlTHf9ubR2+uG
	 374G88lh9+RUcPb2KxKsATErnClm/okrLziYQ0kdNzMyvKSUo5vYVU0HInkAJhbIqTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308115;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=WxMxVqCanhe7Ngs86MSptXojYhzvFxvRax2Dii2VAMI=;
	b=yg0EDBw8GNvBloJ/qHE0bmLdJ010/SZbeWaRXVneJzy3uGFDsRfM4jQDv+J33+tSxZTJ
	 7OF40hrqhQdcrQniaXMUycTyTgaaldDITmiCSaKxPT0TGILDqBUsKZ0RsL81u3LpgqJqm
	 wYiincrZLC4cY2df4t/OwTrR62AFi1Ln4vom93fuluOFStE3fT5D74Ba72oHmVMZs5sWZ
	 JAYcHJ1YHjHWftnEPFM2BxbVQrx/P7YwiSkztRvG1X5Tvzi5mo664AUIGLbjHdp3yoTUX
	 41IrcE2mybCKCaBmFWvFfp6q5+6RCWUZNCvZBMtG7QrS9G3BWfm9VYjBiBg/489jM4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=cGlrPuje;
	arc=none smtp.remote-ip=103.209.128.222
Received: from mail-m128222.netease.com (mail-m128222.netease.com [103.209.128.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8A560A2606
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:55:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A8A560A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=cGlrPuje
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5428b394e;
	Tue, 10 Nov 2026 18:55:02 +0800 (GMT+08:00)
Message-ID: <2a2a1c1f-643e-4348-b4ae-503ed8ff54f4@rock-chips.com>
Date: Tue, 10 Nov 2026 18:54:57 +0800
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
Subject: Re: [PATCH 5/8] drm/rockchip: vop2: Report POST_BUF_EMPTY at most
 once per frame
To: aiyengar1990@gmail.com
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andyshrk@163.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261110-vop2-fixes-v1-0-d336e9dd90d3@gmail.com>
 <20261110-vop2-fixes-v1-5-d336e9dd90d3@gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261110-vop2-fixes-v1-5-d336e9dd90d3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1c518d91803a7kunmdf10dae7723114
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHh1PVhhKSEofQktOGR5PTFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=cGlrPujeT9H3vYmO1lQ0mRWVFHUy06oljfmhyU+3qWQtMrWnhJKxDmp8DbFWRrJ9oKM01euCWetTugulvb5ENE0c7phW5Y0QjQysusVhRXezIz0O43U3v8RwVILExb5Ad9otj+gxmizQ4yK2x/iMX12di2sc2jNIk4vA6HEI8sc=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=WxMxVqCanhe7Ngs86MSptXojYhzvFxvRax2Dii2VAMI=;
	h=date:mime-version:subject:message-id:from;

Hi Arun,

On 11/10/2026 3:18 PM, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> POST_BUF_EMPTY is raised for every line on which the post processing
> stage of a video port finds no data. The interrupt handler only
> rate-limits the error message and leaves the interrupt enabled, so an
> underflowing video port keeps the CPU in the interrupt handler 50000 to
> 300000 times per second, for as long as the configuration that causes
> the underflow stays in place (e.g. 120000 interrupts per second for
> 3840x2160@120 with two full screen layers on one AXI port).
> 
> Mask POST_BUF_EMPTY when it fires and unmask it at the next frame start.
> The frame start (FS) interrupt is enabled for that frame even when
> vblank reporting is off, and disabled again once POST_BUF_EMPTY is
> re-armed. A new per video port lock serialises the interrupt enable
> bookkeeping between the interrupt handler and the vblank callbacks.
> The error is still reported, now at most once per frame and video port.
> 
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 63 ++++++++++++++++++++++++++--
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h | 10 +++++
>  2 files changed, 70 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index 9aeb90c6aa4b..3323e50224c5 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -841,6 +841,48 @@ static void vop2_crtc_disable_irq(struct vop2_video_port *vp, u32 irq)
>  	vop2_writel(vop2, RK3568_VP_INT_EN(vp->id), irq << 16);
>  }
>  
> +/*
> + * POST_BUF_EMPTY is raised for every line the post processing stage finds
> + * no data for, so an underflowing video port can raise it 100000 times per
> + * second. Report it at most once per frame: mask it when it fires and
> + * unmask it at the next frame start, using the FS interrupt even when
> + * vblank reporting is off.
> + */
> +static void vop2_crtc_enable_post_buf_empty_irq(struct vop2_video_port *vp)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&vp->irq_lock, flags);
> +	vp->post_buf_empty_masked = false;
> +	vop2_crtc_enable_irq(vp, VP_INT_POST_BUF_EMPTY);
> +	spin_unlock_irqrestore(&vp->irq_lock, flags);
> +}
> +
> +static void vop2_crtc_handle_post_buf_empty(struct vop2_video_port *vp)
> +{
> +	struct vop2 *vop2 = vp->vop2;
> +
> +	spin_lock(&vp->irq_lock);
> +	vop2_crtc_disable_irq(vp, VP_INT_POST_BUF_EMPTY);
> +	vp->post_buf_empty_masked = true;
> +	/* don't clear a pending FS, it may carry a vblank event */
> +	vop2_writel(vop2, RK3568_VP_INT_EN(vp->id),
> +		    VP_INT_FS_FIELD << 16 | VP_INT_FS_FIELD);

Do we really need this? Disabling the POST_BUF_EMPTY IRQ should not
affect the FS_FIELD IRQ, because this register has write mask.


> +	spin_unlock(&vp->irq_lock);
> +}
> +
> +static void vop2_crtc_rearm_post_buf_empty(struct vop2_video_port *vp)
> +{
> +	spin_lock(&vp->irq_lock);
> +	if (vp->post_buf_empty_masked) {
> +		vp->post_buf_empty_masked = false;
> +		vop2_crtc_enable_irq(vp, VP_INT_POST_BUF_EMPTY);
> +		if (!vp->vblank_enabled)
> +			vop2_crtc_disable_irq(vp, VP_INT_FS_FIELD);
> +	}
> +	spin_unlock(&vp->irq_lock);
> +}
> +
>  static int vop2_core_clks_prepare_enable(struct vop2 *vop2)
>  {
>  	int ret;
> @@ -1668,8 +1710,12 @@ static const struct drm_plane_funcs vop2_plane_funcs = {
>  static int vop2_crtc_enable_vblank(struct drm_crtc *crtc)
>  {
>  	struct vop2_video_port *vp = to_vop2_video_port(crtc);
> +	unsigned long flags;
>  
> +	spin_lock_irqsave(&vp->irq_lock, flags);
> +	vp->vblank_enabled = true;
>  	vop2_crtc_enable_irq(vp, VP_INT_FS_FIELD);
> +	spin_unlock_irqrestore(&vp->irq_lock, flags);
>  
>  	return 0;
>  }
> @@ -1677,8 +1723,13 @@ static int vop2_crtc_enable_vblank(struct drm_crtc *crtc)
>  static void vop2_crtc_disable_vblank(struct drm_crtc *crtc)
>  {
>  	struct vop2_video_port *vp = to_vop2_video_port(crtc);
> +	unsigned long flags;
>  
> -	vop2_crtc_disable_irq(vp, VP_INT_FS_FIELD);
> +	spin_lock_irqsave(&vp->irq_lock, flags);
> +	vp->vblank_enabled = false;
> +	if (!vp->post_buf_empty_masked)
> +		vop2_crtc_disable_irq(vp, VP_INT_FS_FIELD);
> +	spin_unlock_irqrestore(&vp->irq_lock, flags);
>  }
>  
>  static enum drm_mode_status vop2_crtc_mode_valid(struct drm_crtc *crtc,
> @@ -1977,7 +2028,7 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
>  
>  	vcstate->yuv_overlay = is_yuv_output(vcstate->bus_format);
>  
> -	vop2_crtc_enable_irq(vp, VP_INT_POST_BUF_EMPTY);
> +	vop2_crtc_enable_post_buf_empty_irq(vp);
>  
>  	polflags = 0;
>  	if (vcstate->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
> @@ -2535,6 +2586,7 @@ static irqreturn_t rk3576_vp_isr(int irq, void *data)
>  	}
>  
>  	if (irqs & VP_INT_FS_FIELD) {
> +		vop2_crtc_rearm_post_buf_empty(vp);
>  		drm_crtc_handle_vblank(crtc);
>  		spin_lock(&crtc->dev->event_lock);
>  		if (vp->event) {
> @@ -2552,6 +2604,7 @@ static irqreturn_t rk3576_vp_isr(int irq, void *data)
>  	}
>  
>  	if (irqs & VP_INT_POST_BUF_EMPTY) {
> +		vop2_crtc_handle_post_buf_empty(vp);
>  		drm_err_ratelimited(vop2->drm, "POST_BUF_EMPTY irq err at vp%d\n", vp->id);
>  		ret = IRQ_HANDLED;
>  	}
> @@ -2591,6 +2644,7 @@ static irqreturn_t vop2_isr(int irq, void *data)
>  			}
>  
>  			if (irqs & VP_INT_FS_FIELD) {
> +				vop2_crtc_rearm_post_buf_empty(vp);
>  				drm_crtc_handle_vblank(crtc);
>  				spin_lock(&crtc->dev->event_lock);
>  				if (vp->event) {
> @@ -2608,6 +2662,7 @@ static irqreturn_t vop2_isr(int irq, void *data)
>  			}
>  
>  			if (irqs & VP_INT_POST_BUF_EMPTY) {
> +				vop2_crtc_handle_post_buf_empty(vp);
>  				drm_err_ratelimited(vop2->drm,
>  						    "POST_BUF_EMPTY irq err at vp%d\n",
>  						    vp->id);
> @@ -2984,7 +3039,7 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
>  	struct vop2 *vop2;
>  	struct resource *res;
>  	size_t alloc_size;
> -	int ret;
> +	int ret, i;
>  
>  	vop2_data = of_device_get_match_data(dev);
>  	if (!vop2_data)
> @@ -3102,6 +3157,8 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
>  	mutex_init(&vop2->vop2_lock);
>  	mutex_init(&vop2->ovl_lock);
>  	spin_lock_init(&vop2->axi_lock);
> +	for (i = 0; i < ARRAY_SIZE(vop2->vps); i++)
> +		spin_lock_init(&vop2->vps[i].irq_lock);
>  
>  	ret = devm_request_irq(dev, vop2->irq, vop2_isr, IRQF_SHARED, dev_name(dev), vop2);
>  	if (ret)
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> index f1e35967e67f..7de32bef8d7b 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> @@ -272,6 +272,16 @@ struct vop2_video_port {
>  	struct drm_pending_vblank_event *event;
>  
>  	unsigned int nlayers;
> +
> +	/** @irq_lock: protects @vblank_enabled and @post_buf_empty_masked */
> +	spinlock_t irq_lock;
> +	/** @vblank_enabled: the FS interrupt is enabled for vblank reporting */
> +	bool vblank_enabled;
> +	/**
> +	 * @post_buf_empty_masked: POST_BUF_EMPTY is masked until the next
> +	 * frame start
> +	 */
> +	bool post_buf_empty_masked;
>  };
>  
>  /**
> 

-- 
Best, 
Chaoyi

