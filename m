Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439007;
	b=ThRClWGWSEjyj+7BloJhRL5d8Wu99ra9f2Enf23zfaFv2NKZsIiAU8OHEm8aB/08RUEG
	 Bc4oZdv04XUhXYaFrREKc6+mD/6D90xX3YifWM9l28rb73ZNy8+XCDENFL62QPxSnrmqZ
	 o3eMqYWL+kpWqAY8DlpNoFNYNYFIgkyNlUgu5E8npeBdeawHG9RV81Mvi9ndGWQmYQ458
	 fClVwnasuoBC+8NfnUUc/O6oXWrLmt1k3XlbKBoaEzbtHKTGj8kBogCk2qabO0V6R/PpN
	 WhGKGJK5QywotI7JVJmt+FwiJoEcQ+bRxJPXRML1q+LBwpt9PCiOPJtezqW18bwX0yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439007;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=gVIeqTEhmx2fXY3RkoSwuO1fdXlfwtDek+Btr2BpwUw=;
	b=hqBGiohegM5Dk88KzdI96Z/2AhDQgjUvq8NufxKrDTYppXrsYFWaKDULLBGgElimK19a
	 humh9xjxOoR/m3tMvYGhDdxeGo6zHlooC22n9HnqGK/kCd5VL+8ORECyiwkuX4RxQ5D3s
	 JbtWofbnS/wCp0QfV2eiv65YiweJnXef0BK+RoBIVs5vRlDe2qSvqD0mk95DlIMfDFO6q
	 ZbdAitqe9Dk/XWrSh62r+LNuc4MS0FkFZvZIjlyKVX842ZJc93iwTEF7j9++k/24jxlmp
	 8A8WEcOqryl/XW0FGb/tl6nFFIHlhKUm+5CpRwA8QfMGY1swpAKK3G5dVA/TmlViQNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=Ydtw7KnN;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47401606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:16:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47401606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=Ydtw7KnN
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44DF422B;
	Thu, 12 Nov 2026 00:14:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794438862;
	bh=z0dg7bwU2AAoMLZ79Myh4uGTQaMh+gcfY67SeB0Tlv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ydtw7KnN0JpDWFAoRtrJahH5aWkusxuCN0PY/k/3ePCt0lPSp7vPcpbdfpNo022R2
	 fv9gBmDZ83xYbRPNXsDlKt7B01xDdhFW+TnYG9z7BN8PHLWQJucSwDJCn/d1mmqMeE
	 k13Wvp9epVQNLdNwT9hMEzVDcBkto18wJciq3i3A=
Date: Thu, 12 Nov 2026 01:16:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank.Li@oss.nxp.com
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	"open list:DRM DRIVERS FOR XILINX" <dri-devel@lists.freedesktop.org>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] drm: xlnx: zynqmp_disp: use
 dmaengine_get_copy_align() accessor
Message-ID: <20261111231644.GC449775@killaraus.ideasonboard.com>
References: <20261111200739.3823753-1-Frank.Li@oss.nxp.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111200739.3823753-1-Frank.Li@oss.nxp.com>

On Wed, Nov 11, 2026 at 03:07:37PM -0500, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Use the dmaengine_get_copy_align() helper instead of directly accessing
> the copy_align field from the DMA device structure.
> 
> No functional change and prepare to move struct dma_device to private.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Tomi, I assume you'll push this to drm-misc. Please let me know if
that's not correct.

> ---
>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index e998f22686748..0753236b9546a 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -1433,7 +1433,7 @@ int zynqmp_disp_probe(struct zynqmp_dpsub *dpsub)
>  		struct zynqmp_disp_layer *layer;
>  
>  		layer = &disp->layers[ZYNQMP_DPSUB_LAYER_VID];
> -		dpsub->dma_align = 1 << layer->dmas[0].chan->device->copy_align;
> +		dpsub->dma_align = 1 << dmaengine_get_copy_align(layer->dmas[0].chan);
>  	}
>  
>  	dpsub->disp = disp;

-- 
Regards,

Laurent Pinchart
