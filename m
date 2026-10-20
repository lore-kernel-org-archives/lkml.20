Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792488974;
	b=TB2FVx+OymI2/mqiUgW56ms6zcH8K+bIN2GW+dgC4crDah+Ja1jQ5IJt4VlbH/6j36nw
	 pDmTOYjNSHqdzRr2VrFSKWPGBTURp44QS/JaW7cL45tmoz3VSDAl50g7DBPVpjmfPzLmq
	 h3mGo4ASsswx8nOlqALpkvhRG6/1+rD49r//fl1iqnsLM1sAPOc49v1yLKpuS0wcLOnDC
	 1lHBQ4Fo0qdGGuQXH/JajE9tyWzg0DmLRE5O7ceMpwKGqItZdqP9T0VEAS/43FZPmdMki
	 rjsHjqrgEef7EzHFkI4vyIa7kkR8LmPqxLAWXLIneHJLs0ONglKW+G1pseAk7se9JFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792488974;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ynyE+fA5NTfw2+uhvHohwdPTh6sK8d+mcL5qpPLSA1A=;
	b=WsMtPJOtTkS38KbbHLGtzN2oGi9rnKvhO78Er9o4OmCJ58g6PStZ1FgjLDmZH99Ie+9o
	 tNnPpcUxh1DPbz5S0n6KoHLjKAnb9prWDHU1N1+AsX7DP+ZnilBUnilibFgG/RIVzavCc
	 Nth0gnA7MukMdiPtjeI3bkTEGHhc3Hrg0rLH28y/Kuc2se+a+xV4HFFfe41YiF+W4Jx9k
	 C34AH+jcqrC/AKAMijpaJfP75JaB92oPRRvH1d8+VlX4r2fU3wLQ6VZFLLPL/avjoSFMX
	 FcnkDqn/jDSFJG7nkISG3zJohKWYFXySZxWKXWbYmVyyLXpCObDrASfKUceM6wNJxOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=ciMiB0Fy;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14503606A33E;
	Tue, 20 Oct 2026 09:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14503606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=ciMiB0Fy
Received: from [192.168.33.26] (185.221.141.235.nat.pool.zt.hu [185.221.141.235])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D4112E9;
	Tue, 20 Oct 2026 11:34:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792488843;
	bh=Iv2yHbGaosk29+ndUAO2qtiC5IJ8/X2fH8ie6cTjmyU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ciMiB0FyxDyLFci9A18xtIcNNBLizuaaiATabqgJTpDLfhWLxnp/Wp3QRZKNdzzNj
	 j2xY6SfbluAM8Yo1FqcVOp7N80Zr0gdLz7nxMN0QanLM7r/12rBdQkhhFgMRPSvod7
	 m79B/XKKjsmMn9aFCkN9VKm40U+qFpePmdn6kpUk=
Message-ID: <6c8e77c9-c0a2-40c6-8e7f-7e2d51c71740@ideasonboard.com>
Date: Tue, 20 Oct 2026 11:36:04 +0200
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
Subject: Re: [PATCH 1/4] media: rcar-isp: ispcore: Honour requested
 bytesperline on RAW input
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
 Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?=
 <barnabas.pocze+renesas@ideasonboard.com>,
 Yusuke Goda <yusuke.goda.sx@renesas.com>,
 Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20261019-v4l2-add-nv12-v1-0-4a84736803b6@ragnatech.se>
 <20261019-v4l2-add-nv12-v1-1-4a84736803b6@ragnatech.se>
From: =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>
Content-Language: en-US, hu-HU
In-Reply-To: <20261019-v4l2-add-nv12-v1-1-4a84736803b6@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

2026. 10. 19. 21:35 keltezéssel, Niklas Söderlund írta:
> From: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
> 
> The RAW input video device always overwrote the bytesperline requested
> by userspace with width * bpp. The input buffers are however shared with
> the VIN, which may use a larger line stride (for example 3296 instead of
> 3280 bytes for a 1640 pixel wide 10 bit image). The dmabuf exported by
> the ISP was then smaller than the VIN buffer size, and queueing it to
> the VIN failed with -EINVAL:
> 
>    __prepare_dmabuf: invalid dmabuf length 4042752 for plane 0,
>    minimum length 4060672
> 
> Use the requested bytesperline if it is larger than the minimum.
> 
> Signed-off-by: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
> [Niklas: Use max(min(..)) instead of if statement]
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>   drivers/media/platform/renesas/rcar-isp/core-io.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-isp/core-io.c b/drivers/media/platform/renesas/rcar-isp/core-io.c
> index b60b91f43d42..badde72352c1 100644
> --- a/drivers/media/platform/renesas/rcar-isp/core-io.c
> +++ b/drivers/media/platform/renesas/rcar-isp/core-io.c
> @@ -5,6 +5,8 @@
>    * Copyright (C) 2026 Ragnatech AB
>    */
>   
> +#include <linux/sizes.h>
> +
>   #include <media/v4l2-ctrls.h>
>   #include <media/v4l2-event.h>
>   #include <media/v4l2-ioctl.h>
> @@ -335,6 +337,7 @@ static void risp_io_input_try_format(struct rcar_isp_core_io *io,
>   				     struct v4l2_pix_format_mplane *pix)
>   {
>   	unsigned int bpp = 0;
> +	unsigned int bpl;
>   
>   	v4l_bound_align_image(&pix->width, RISP_MIN_WIDTH, RISP_MAX_WIDTH, RISP_SIZE_ALIGNMENT,
>   			      &pix->height, RISP_MIN_HEIGHT, RISP_MAX_HEIGHT, RISP_SIZE_ALIGNMENT,
> @@ -352,11 +355,17 @@ static void risp_io_input_try_format(struct rcar_isp_core_io *io,
>   		bpp = risp_io_input_formats[0].bpp;
>   	}
>   
> +	/*
> +	 * Honour the line stride requested by userspace, the buffers are
> +	 * shared with the VIN which may use a larger stride than the minimum.
> +	 */
> +	bpl = max(pix->width * bpp, min(pix->plane_fmt[0].bytesperline, SZ_64K));

   clamp(pix->plane_fmt[0].bytesperline, pix->width * bpp, SZ_64K)

?

And does the device really accept any value between these two limits?


> +
>   	pix->field = V4L2_FIELD_NONE;
>   	pix->colorspace = V4L2_COLORSPACE_RAW;
>   
>   	pix->num_planes = 1;
> -	pix->plane_fmt[0].bytesperline = pix->width * bpp;
> +	pix->plane_fmt[0].bytesperline = bpl;
>   	pix->plane_fmt[0].sizeimage = pix->plane_fmt[0].bytesperline * pix->height;
>   }
>   
> 

