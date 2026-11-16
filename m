Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828083;
	b=TZ8qTd2HTmDgd5zU4yWGaPjrUbe5SXl+XHryHQN+M4xcfATzFdbdNY/pTPbn3XDOvRRc
	 YlgHNDNYglH7pT/MAUndt7KDsAM9mPcmG9LQCWP6/OgysUQoV3DlAB5x6/+vyKnnAiDsG
	 PuhjYZCajkvtOGkJePUhhj3Jtvyi9co5XdgyhUJ7FGc78qQs3/oSf3lRmZ7B5BgSWu04X
	 zYW/Q4DlssF/MEnoMEq3y5EVEDbGufvtqydhPic1k1kTLKC9ZaFOi5pi2NyH2RT7a5y5W
	 +aEjNpv498Ab9TvKZgb5DqfGTnl79InpcVNwjJ1oa6Q8bt8ZcwsAqJQZwQnfiXEf3Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828083;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=Iw+agB8/B2dXhCFTRFi/Uemb21kx5SWBHCHbygPq9cc=;
	b=BaTUhhP2xdfsuGcxDs5KPfDR+EmJatpxvqxXsnC6sSRv1BI4aMj0G9OPmYdItjCzEMeB
	 sizaSq5/GLLXWh44gJBTcCg7hs75AkvY6fbHAcUBPjN4oxiSb2XkDaA/9oFWKKWi8xb5Q
	 PzWz8H/JETXlYGjMvDIKmJuh1HiOY9BmhxILHxmxa0nxG1AFsyvJRXY8k2Bm+C0v7+9M2
	 L0TNnXMenQMl5Bi9xFZL704LQshqarNP3r2dgnVlUCAbNYIakKxLt0h+nyO+J+g0jOxKP
	 wH7tsUsfw4vTZqdDrs843ZA12vcRt8eZMmZo8Vwr90sLU3LLgxXHgvGve9HpuuR4UeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=DN2SUpo6;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312056071837;
	Mon, 16 Nov 2026 11:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 312056071837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=DN2SUpo6
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E21B24BB;
	Mon, 16 Nov 2026 12:18:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794827933;
	bh=bVR2JXsgkGN4euBFDvSPj+3trt0O9nxPW1FSPi6nUZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DN2SUpo6TKOVHi4kutvyzEm5IXbtRWmUa/8GDiZCd2AZzPOU+ekqfPu3ete/QW5Zk
	 m+MWh7EZXm17afHLmuCNsYoNRbz2lE2AHd9hL6agpr9282JS88LpXmq3FNOvq4/F+G
	 txT5La8DY5gNIN8D96ZTHwwgWmabQS82Y/wdH8DQ=
Date: Mon, 16 Nov 2026 12:21:17 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	=?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>, Yusuke Goda <yusuke.goda.sx@renesas.com>, 
	Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] media: rcar-isp: ispcore: Honour requested
 bytesperline on RAW input
Message-ID: <avrjjCYcqsQOzhvf@zed>
References: <20261114-v4l2-add-nv12-v2-0-a3f5ecfd48d6@ragnatech.se>
 <20261114-v4l2-add-nv12-v2-1-a3f5ecfd48d6@ragnatech.se>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261114-v4l2-add-nv12-v2-1-a3f5ecfd48d6@ragnatech.se>

Hi Niklas,

On Sat, Nov 14, 2026 at 08:55:16PM +0100, Niklas Söderlund wrote:
> From: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
>
> The RAW input video device always overwrote the bytesperline requested
> by userspace with width * bpp. The input buffers are however shared with
> the VIN, which may use a larger line stride (for example 3296 instead of
> 3280 bytes for a 1640 pixel wide 10 bit image). The dmabuf exported by
> the ISP was then smaller than the VIN buffer size, and queueing it to
> the VIN failed with -EINVAL:
>
>   __prepare_dmabuf: invalid dmabuf length 4042752 for plane 0,
>   minimum length 4060672
>
> Use the requested bytesperline if it is larger than the minimum.
>

This is worth a fixes imo

> Signed-off-by: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
> [Niklas: Use clamp(..) instead of if statements]
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v1
> - Use clamp() instead of max(min()).
> - Upper limit at SZ_64K - 1, not SZ_64K.
> ---
>  drivers/media/platform/renesas/rcar-isp/core-io.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/renesas/rcar-isp/core-io.c b/drivers/media/platform/renesas/rcar-isp/core-io.c
> index b60b91f43d42..cc538e984aa1 100644
> --- a/drivers/media/platform/renesas/rcar-isp/core-io.c
> +++ b/drivers/media/platform/renesas/rcar-isp/core-io.c
> @@ -5,6 +5,8 @@
>   * Copyright (C) 2026 Ragnatech AB
>   */
>
> +#include <linux/sizes.h>
> +
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-ioctl.h>
> @@ -335,6 +337,7 @@ static void risp_io_input_try_format(struct rcar_isp_core_io *io,
>  				     struct v4l2_pix_format_mplane *pix)
>  {
>  	unsigned int bpp = 0;
> +	unsigned int bpl;
>
>  	v4l_bound_align_image(&pix->width, RISP_MIN_WIDTH, RISP_MAX_WIDTH, RISP_SIZE_ALIGNMENT,
>  			      &pix->height, RISP_MIN_HEIGHT, RISP_MAX_HEIGHT, RISP_SIZE_ALIGNMENT,
> @@ -352,11 +355,17 @@ static void risp_io_input_try_format(struct rcar_isp_core_io *io,
>  		bpp = risp_io_input_formats[0].bpp;
>  	}
>
> +	/*
> +	 * Honour the line stride requested by userspace, the buffers are
> +	 * shared with the VIN which may use a larger stride than the minimum.
> +	 */
> +	bpl = clamp(pix->plane_fmt[0].bytesperline, pix->width * bpp, SZ_64K - 1);
> +

There is a (quite long) anlysis of this bug in our forge:
https://git.ideasonboard.com/renesas-v4h-isp/libcamera/issues/14

and while the commit message of this patch correctly identify the issue
it doesn't take into account any requirement (stride alignment and max
stride length) of the VSP-X unit which actually does the transfer on
behalf of the ISP.

We didn't get to the bottom of VSP-X stride alignment constraints, but
the RPF unit documentation specifies a max size for the source picture
stride (which is the SZ_64K - 1 value that is used by this patch).
https://git.ideasonboard.com/renesas-v4h-isp/libcamera/issues/14#issuecomment-40317

Laurent suggested to get the VSP-X stride alignment and max size by
adding a function (possibily a try format) in the ISP/VSP-X interface.

I'm more of the opinion that as the ISP-core, VSP-X and VIN are part
of the same SoC it is not too crazy to use (SZ_64K - 1) here directly
(maybe adding a comment on where the limits comes from).

What do you think ?


>  	pix->field = V4L2_FIELD_NONE;
>  	pix->colorspace = V4L2_COLORSPACE_RAW;
>
>  	pix->num_planes = 1;
> -	pix->plane_fmt[0].bytesperline = pix->width * bpp;
> +	pix->plane_fmt[0].bytesperline = bpl;
>  	pix->plane_fmt[0].sizeimage = pix->plane_fmt[0].bytesperline * pix->height;
>  }
>
>
> --
> 2.55.0
>
>
