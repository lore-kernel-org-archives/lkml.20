Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491602;
	b=MG5PDYxxI6Y1xvHktGXSgq4kzc+6pw/ayiOW2VRFeT0HYRnLY93Ia5yBf76Rn6eDhpvS
	 x/BGoFdMK/0mBnjYhaMpzo+bTiUT/izzJaTW2xABmw0NRwD67AJAw4YPcxrl1bJbrgiz1
	 wumiv/W5xqtIu/QFwRRy76qHz212oZUq0jIUaoqQIbuLQWLCNWvzBKsad3LpFOg0I7apO
	 1OJBnwwko4W7ciVTaUhEe1V1wYr+7lbFCJo4y2ajA863YEpBY8atQhHHTKCWCFamX6G42
	 VpOsOnLsChCW3pFcFntowJq35LPJ0kGYWpGPoZCl3E/6tIPyFSPSf5Dzr4L2EiUkz6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491602;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=H+RpKUw/y3x1/+ry76QBgJqM8WAFh0k087Yi3Hw/3jE=;
	b=4L3YOv8rQVbJchultxX0GNd+hBY2DDlrrjAVQnhwCGcRbFPcgo5KbtrYfwUFCFKMmuH9
	 Gl03O5zqsy3AVjmzzS9QAHaekBHDFE4vez/qKGf4ZpCPv5rlM3s/61MYLvaVu2FpVg7/w
	 c6Qj/JowqXBuX3ATM4Y6HvTDkQgvBPKCT7leQ+DjHYaXGRnhjBXn7E3q+6T9vn61f2SIq
	 QbT6JpbUOgfWMPvXCsZQWn4bEdgUse41XLV70t5vQ5YXwnsHbMVqMtU2KjYHxU5fmJUYN
	 U9Hm9j+IKTB7MSMuxCpQ6g/vjNFsk99mfOK61UiHqVZrpH2LqA5R9fXSgjQAcdbOYbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b="cc4/oX32";
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD2A606A334;
	Tue, 20 Oct 2026 10:20:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CD2A606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=cc4/oX32
Received: from [192.168.33.26] (185.221.141.235.nat.pool.zt.hu [185.221.141.235])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A6BDED0;
	Tue, 20 Oct 2026 12:17:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792491472;
	bh=iJ2U3Sh/bjnj3zWVcu+FnmWUoC+2NGPIitRM857xZl4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cc4/oX323Ocapp46juPac8+QQd6wNdM0FPYoF2k56FS/dpWy3eek//iuO+CneZj1U
	 qDYQTOUvgw+zdZe1I5/4hqDlePQ00fRcv4iWP5zWza+R3fpbXO2ZV3bQvafE+xwFFe
	 ZVSr0yUDlxvCEW5tacI2hOvEu+tb7MHmgeqZRFQo=
Message-ID: <03c04d5b-c93c-4e1e-8889-de079adae312@ideasonboard.com>
Date: Tue, 20 Oct 2026 12:19:54 +0200
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
Subject: Re: [PATCH 2/4] media: rcar-isp: ispcore: Update image data flush
 settings
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
 <20261019-v4l2-add-nv12-v1-2-4a84736803b6@ragnatech.se>
From: =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>
Content-Language: en-US, hu-HU
In-Reply-To: <20261019-v4l2-add-nv12-v1-2-4a84736803b6@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

2026. 10. 19. 21:35 keltezéssel, Niklas Söderlund írta:
> Later versions of the datasheet have an updated chapter on how the image
> out flush settings depends on proper stride settings. Update the bytes
> per line calculation and flush out settings to match the datasheet
> clarification.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>   drivers/media/platform/renesas/rcar-isp/core-io.c | 28 ++++++++++++++++++++---
>   drivers/media/platform/renesas/rcar-isp/core.c    |  2 +-
>   2 files changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-isp/core-io.c b/drivers/media/platform/renesas/rcar-isp/core-io.c
> index badde72352c1..48db37bad69c 100644
> --- a/drivers/media/platform/renesas/rcar-isp/core-io.c
> +++ b/drivers/media/platform/renesas/rcar-isp/core-io.c
> @@ -733,6 +733,28 @@ static const struct v4l2_pix_format_mplane risp_io_capture_default_format = {
>   	},
>   };
>   
> +static unsigned int risp_io_calture_bytesperline(unsigned int width, unsigned int bpp)

   calture -> capture


> +{
> +	/*
> +	 * The datasheet specifies strict alignment and padding rules to be able
> +	 * to flush out all the pixels. Each line must be 256 byte aligned and
> +	 * at the end of the frame at least one extra line of space must be
> +	 * available.
> +	 *
> +	 * As we can't extend the buffer with one extra line we need to work
> +	 * with stride setting to satisfy both constraints. Fortunately the
> +	 * datasheet gives us a calculation for this.
> +	 *
> +	 *   FLUSH[pixels] = ALIGN(WIDTH[pixels], 256)
> +	 *
> +	 *   PADDING[bytes] = ALIGN(BPP[bytes] * WIDTH[pixels], 256) - BPP[bytes] * WIDTH[pixels] + BPP[bytes] * FLUSH[pixels]
> +	 */
> +	unsigned int data = bpp * width;
> +	unsigned int padding = ALIGN(data, 256) - data + bpp * ALIGN(width, 256);

So this adds one line's worth of extra padding on top of what is needed to achieve 256-byte alignment
of the actual data? With this change, for an output size of 2304x1296, I see

   ioctl(18</dev/video3>, VIDIOC_TRY_FMT, {
     type=V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE, fmt.pix_mp={
       width=2304, height=1296,
       pixelformat=v4l2_fourcc('X', 'R', '2', '4') /* V4L2_PIX_FMT_XBGR32 */,
       field=V4L2_FIELD_NONE, colorspace=V4L2_COLORSPACE_DEFAULT,
       plane_fmt=[], num_planes=0
     }
   } => {
    fmt.pix_mp={
      width=2304, height=1296,
      pixelformat=v4l2_fourcc('X', 'R', '2', '4') /* V4L2_PIX_FMT_XBGR32 */,
      field=V4L2_FIELD_NONE,
      colorspace=V4L2_COLORSPACE_SRGB,
      plane_fmt=[
        { sizeimage=23887872, bytesperline=18432 }
      ],
      num_planes=1
    }
   }) = 0 <0.000074>

which means that the stride is `(2304 * 4) * 2 = 18432`, which is effectively
twice what would be required for just the 256 byte alignment. So this
in practice doubles the size of every buffer, or am I missing something?


> +
> +	return data + padding;
> +}
> +
>   static void risp_io_capture_try_format(struct rcar_isp_core_io *io,
>   				       struct v4l2_pix_format_mplane *pix)
>   {
> @@ -749,16 +771,16 @@ static void risp_io_capture_try_format(struct rcar_isp_core_io *io,
>   	case V4L2_PIX_FMT_NV16M:
>   		pix->quantization = V4L2_QUANTIZATION_LIM_RANGE;
>   		pix->num_planes = 2;
> -		pix->plane_fmt[0].bytesperline = ALIGN(pix->width, 256);
> +		pix->plane_fmt[0].bytesperline = risp_io_calture_bytesperline(pix->width, 1);
>   		pix->plane_fmt[0].sizeimage = pix->plane_fmt[0].bytesperline * pix->height;
> -		pix->plane_fmt[1].bytesperline = ALIGN(pix->width, 256);
> +		pix->plane_fmt[1].bytesperline = pix->plane_fmt[0].bytesperline;
>   		pix->plane_fmt[1].sizeimage = pix->plane_fmt[1].bytesperline * pix->height;
>   		break;
>   	default:
>   		pix->pixelformat = V4L2_PIX_FMT_XBGR32;
>   		pix->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>   		pix->num_planes = 1;
> -		pix->plane_fmt[0].bytesperline = ALIGN(pix->width * 4, 256);
> +		pix->plane_fmt[0].bytesperline = risp_io_calture_bytesperline(pix->width, 4);
>   		pix->plane_fmt[0].sizeimage = pix->plane_fmt[0].bytesperline * pix->height;
>   		break;
>   	}
> diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
> index b5861d0cd0e8..3e135e84b75b 100644
> --- a/drivers/media/platform/renesas/rcar-isp/core.c
> +++ b/drivers/media/platform/renesas/rcar-isp/core.c
> @@ -398,7 +398,7 @@ static int risp_core_config_output(struct rcar_isp_core *core,
>   
>   	/* Set image out flush EOF. */
>   	risp_core_write(core, ISPCORE_DMA_IMAGE_FLUSH_OUT_REG(index),
> -			pix->plane_fmt[0].bytesperline <<
> +			ALIGN(pix->width, 256) <<

I'm probably mistaken, but does this not need a multiplication by bpp?
Or was the previous version actually incorrect?


>   			ISPCORE_DMA_IMAGE_FLUSH_OUT_PADDING_PIXEL_EOF_SHIFT);
>   
>   	/* Enable DMA and set burst length. */
> 

