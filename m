Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794438955;
	b=JgdlEcLqJo+vhQ+gVX823DyGok5HpjqXnP6POtr3vTvpHDGNlNiLc57Ryxn1acYzlXvf
	 oL1AqNfMu5t+vI4Uc8Lndfnt3qAFzvl64FGfpTczJ8DzQffOxra7SyobR1H3tdzgXNp5v
	 wfYVspsUSwV5lMXWOu0bd9G06zzZpn370yTAGAosjhcQ64CMwWUzH5xYFNzSOvJwhqdZK
	 wEknBHW/0HsoX9IRGmlXTgQJov6hQI8I1yRwvcqxPOvPaYDj3uOGbCMaCOI1UuoKQ8q0j
	 T+MrcGpGGuRI0SyfhE9PGvToSso+xU+Lx6ybWGlfk5UV5896mZX/kDIhCjjmKsRkMKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794438955;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=SwCLDaTF/SZHcXaLHvk//w6qsnUfE/A450nw0/y6Vmg=;
	b=DSRPoV1bdOcOx3LIBDe85AAvOogy4seg9Ih3Vg28hPA+fc9rIMAPcEaOOufRxtTF1cHz
	 gjasdc+wTTISdi3q/lWAEorW5hpfoS3H+nN8jXXbOvf2s+EzYzdZxdm61GFGQbpQeKoW2
	 O7fhnaAm2sfoDP2RBKgtMK78XpeqzBC6Je5/gfDyy9BJbrGOZ3THCHoeUFHgauWyfLaRR
	 FPHCVFL8SZzTPnHePgQJOudAQiCCc5c+KElVewLYw5u1xGRm/WIm6H+5smc6WQ/WAXllU
	 DOteZvGHNqATpIp6lKGP9Kdi5JO+yCH5LiKUsfFBz8qBKndFH8KMNcsMsRQG6B67PoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=YRreNREZ;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA305606A331;
	Wed, 11 Nov 2026 23:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA305606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=YRreNREZ
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0EEB122B;
	Thu, 12 Nov 2026 00:13:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794438809;
	bh=aGlUHD0gujoJhXfnK8skBxle8rV39ixzq+kLCVy3sgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YRreNREZ6iYcL1wj2CZzh0OVHAnqJaAJj760Zo3rcUn8hMU5mKP1gznFZMtYw+lPQ
	 qPBRdAeFJV4k+qIGrrcidLhGuvPyHInhjCWAwj7OdPri/Q+ZXzr6Tm+VX+ld17dJkM
	 7wH1odF1AHoeA9X08f473Z3B5S2dro1xeg/JM2YM=
Date: Thu, 12 Nov 2026 01:15:51 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank.Li@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	"open list:XILINX VIDEO IP CORES" <linux-media@vger.kernel.org>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev,
	vkoul@kernel.org, Frank Li <Frank.Li@nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 1/1] media: xilinx: Use dmaengine_get_copy_align()
 accessor
Message-ID: <20261111231551.GB449775@killaraus.ideasonboard.com>
References: <20261111171325.3424645-1-Frank.Li@oss.nxp.com>
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
In-Reply-To: <20261111171325.3424645-1-Frank.Li@oss.nxp.com>

On Wed, Nov 11, 2026 at 12:13:24PM -0500, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace direct access to dma->dma->device->copy_align with the
> dmaengine_get_copy_align() accessor function.
> 
> Prepare move struct dma_device to private.

I didn't see a rationale in the commit that introduced
dmaengine_get_copy_align(), and I then saw it here. Without knowing much
about the greater plan of making dma_device private, this patch looks
OK.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Tomi, will you handle this with any other ongoing work on
media/platform/xilinx/, or should it get merged separately ?

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/media/platform/xilinx/xilinx-dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
> index ece2116639fc0..e01bb40bc39c7 100644
> --- a/drivers/media/platform/xilinx/xilinx-dma.c
> +++ b/drivers/media/platform/xilinx/xilinx-dma.c
> @@ -710,7 +710,7 @@ int xvip_dma_init(struct xvip_composite_device *xdev, struct xvip_dma *dma,
>  		goto error;
>  	}
>  
> -	dma->align = 1 << dma->dma->device->copy_align;
> +	dma->align = 1 << dmaengine_get_copy_align(dma->dma);
>  
>  	ret = video_register_device(&dma->video, VFL_TYPE_VIDEO, -1);
>  	if (ret < 0) {

-- 
Regards,

Laurent Pinchart
