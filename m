Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823588;
	b=WWB7dJr7D2WdaoBb/DQsuAHTbyMAJdrC5yZR03RUUzc2JUzfqsgYNDcdbEnXjAPIxlTq
	 PHeh8DSvLcAUgZ6y4wZSgGCrtVHcppjBC4gZeg7NvtgU8OaaTkByuGSJmR/vvIaTE1xbY
	 4SHKq3CEoDXqNF8GDL8uSzSpCOXaqWGxSsCwk1sMZmxW4m7xwoxaTyjxn+FnJwmXgBhUE
	 nkdUgnzay7D7TSeLkPW58KjaQ4ReEPwvv9N3xyR+Qu59u7Ag+bGhNLpJXmznE6pK6Cgza
	 lm1sIzA4nbSdefRCRE/kotzW7LQ0AxDMUfYH/25sGCc+57cuL402S7RVFml0dWry2Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823588;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=FQv63oMeyb6aVpvob51R58sok6IpONoz09tUDuPeRsM=;
	b=qn5vDD99oWZVRqS4QL5gKMDoV3nZg1Y5cZjdS4JYI4SNkrvrwzaGPLhaneQb4bg3zRkl
	 bgWjDr0gL8ZAhaUM4LI0k0hhmSoUqoZFUFyh+5sVMxjNlB5oRZ7pvnRiqImIAirXncO4r
	 Pysw01z+CuCnvVCh2YLJQKb2N7YZ/xbC8z2QxE0L+Eq3DCn+6HtIxytX9X3tTlEnXHuxh
	 AhSPJ/HLGTuGbkG2aP45n0JEGE6p9Sd6lgm0uXIpEtCg+7H6Bbd7KlOYFgQ57eNsYX2Bb
	 VoJSOWWYrAMvsOQEzfXjKZYtuiHym6d+NvwvVZvF8Nv3LwSI/PcPKMDqVK2jQEbD16Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=LfstUijx;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE02606A323;
	Mon, 16 Nov 2026 10:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FE02606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=LfstUijx
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21571175;
	Mon, 16 Nov 2026 11:03:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794823438;
	bh=bxrtpDD8N3Q+zYNaMdZ/96pUZk6vlLNdrXEK33HVwmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LfstUijxd4wy6BMUa9Q06ZS9D2WTcEtxEsxnEs5vG/IhB6+2z/enmzQMqXBnde18U
	 CDj7U8eNLBKQO0yItRhqeBC3YI+P7nUCSv1QcqtZx8KmFKeBx8z0C/qMd7yM/Uq8Dn
	 7CO37gpfOlDY5CLpIhVj81BhCdXeKnPPHFBBdN4c=
Date: Mon, 16 Nov 2026 11:06:22 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/3] media: uapi: videodev2: Add 20-bit Bayer formats
Message-ID: <avrSQkNcHFVO7t42@zed>
References: <20261115-v4l2-add-raw-pix-v2-0-f66dd83e5f85@ragnatech.se>
 <20261115-v4l2-add-raw-pix-v2-1-f66dd83e5f85@ragnatech.se>
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
In-Reply-To: <20261115-v4l2-add-raw-pix-v2-1-f66dd83e5f85@ragnatech.se>

Hi Niklas,
   thanks for the update

On Sun, Nov 15, 2026 at 08:10:05PM +0100, Niklas Söderlund wrote:
> Add 20-bit Bayer formats and documentation.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v1
> - Use same table format example as for other Bayer formats.
> - Add format to v4l2_format_info()
> ---
>  .../userspace-api/media/v4l/pixfmt-bayer.rst       |   1 +
>  .../userspace-api/media/v4l/pixfmt-srggb20.rst     | 103 +++++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-common.c              |   1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c               |   4 +
>  include/uapi/linux/videodev2.h                     |   4 +
>  5 files changed, 113 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> index 8b4e413177f5..b93e66d6a27e 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> @@ -33,3 +33,4 @@ orders. See also `the Wikipedia article on Bayer filter
>      pixfmt-srggb14
>      pixfmt-srggb14p
>      pixfmt-srggb16
> +    pixfmt-srggb20
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb20.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb20.rst
> new file mode 100644
> index 000000000000..915700a5af93
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb20.rst
> @@ -0,0 +1,103 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +.. c:namespace:: V4L
> +
> +.. _V4L2-PIX-FMT-SRGGB20:
> +.. _v4l2-pix-fmt-sbggr20:
> +.. _v4l2-pix-fmt-sgbrg20:
> +.. _v4l2-pix-fmt-sgrbg20:
> +
> +***************************************************************************************************************************
> +V4L2_PIX_FMT_SBGGR20 ('BG20'), V4L2_PIX_FMT_SGBRG20 ('GB20'), V4L2_PIX_FMT_SGRBG20 ('GR20'), V4L2_PIX_FMT_SRGGB20 ('RG20'),
> +***************************************************************************************************************************
> +
> +
> +====================
> +20-bit Bayer formats
> +====================
> +
> +
> +Description
> +===========
> +
> +These four pixel formats are raw sRGB / Bayer formats with 20 bits per
> +sample. Each sample is stored in a 32-bit word. Each n-pixel row contains

I see the description of the other formats mentioning where the
padding bits are located inside the word. In example (from
pixfmt-srggb12)

Each colour component is stored in a 16-bit word, with 4 unused
high bits filled with zeros.

Should we specify the same?

These four pixel formats are raw sRGB / Bayer formats with 20 bits per
sample. Each sample is stored in a 32-bit word witht the 12 unused high
bits filled with zeros. Each n-pixel row contains

And now

> +n/2 green samples and n/2 blue or red samples, with alternating red and blue
> +rows. Bytes are stored in memory in little endian order. They are
> +conventionally described as GRGR... BGBG..., RGRG... GBGB..., etc. Below is
> +an example of a small V4L2_PIX_FMT_SBGGR20 image:
> +
> +**Byte Order.**
> +Each cell is one byte.

Here as well:

**Byte Order.**
Each cell is one byte, the 12 most significant bits in the high bytes are
0.

And now I wonder, could a 20 bits format be stored in a 24 bits word ?
I'm not sure if that's a use case, but I guess we'll need new
pixelcodes for that.

> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - start + 0:
> +      - B\ :sub:`00`
> +      - B\ :sub:`00`
> +      - B\ :sub:`00`
> +      - B\ :sub:`00`
> +      - G\ :sub:`01`
> +      - G\ :sub:`01`
> +      - G\ :sub:`01`
> +      - G\ :sub:`01`
> +      - B\ :sub:`02`
> +      - B\ :sub:`02`
> +      - B\ :sub:`02`
> +      - B\ :sub:`02`
> +      - G\ :sub:`03`
> +      - G\ :sub:`03`
> +      - G\ :sub:`03`
> +      - G\ :sub:`03`
> +    * - start + 16:
> +      - G\ :sub:`10`
> +      - G\ :sub:`10`
> +      - G\ :sub:`10`
> +      - G\ :sub:`10`
> +      - R\ :sub:`11`
> +      - R\ :sub:`11`
> +      - R\ :sub:`11`
> +      - R\ :sub:`11`
> +      - G\ :sub:`12`
> +      - G\ :sub:`12`
> +      - G\ :sub:`12`
> +      - G\ :sub:`12`
> +      - R\ :sub:`13`
> +      - R\ :sub:`13`
> +      - R\ :sub:`13`
> +      - R\ :sub:`13`
> +    * - start + 32:
> +      - B\ :sub:`20`
> +      - B\ :sub:`20`
> +      - B\ :sub:`20`
> +      - B\ :sub:`20`
> +      - G\ :sub:`21`
> +      - G\ :sub:`21`
> +      - G\ :sub:`21`
> +      - G\ :sub:`21`
> +      - B\ :sub:`22`
> +      - B\ :sub:`22`
> +      - B\ :sub:`22`
> +      - B\ :sub:`22`
> +      - G\ :sub:`23`
> +      - G\ :sub:`23`
> +      - G\ :sub:`23`
> +      - G\ :sub:`23`
> +    * - start + 48:
> +      - G\ :sub:`30`
> +      - G\ :sub:`30`
> +      - G\ :sub:`30`
> +      - G\ :sub:`30`
> +      - R\ :sub:`31`
> +      - R\ :sub:`31`
> +      - R\ :sub:`31`
> +      - R\ :sub:`31`
> +      - G\ :sub:`32`
> +      - G\ :sub:`32`
> +      - G\ :sub:`32`
> +      - G\ :sub:`32`
> +      - R\ :sub:`33`
> +      - R\ :sub:`33`
> +      - R\ :sub:`33`
> +      - R\ :sub:`33`
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 11ab684024c5..009721cd2527 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -402,6 +402,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
>  		{ .format = V4L2_PIX_FMT_SGBRG16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>  		{ .format = V4L2_PIX_FMT_SGRBG16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>  		{ .format = V4L2_PIX_FMT_SRGGB16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_SRGGB20,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },

What about the other permutations ?

The same comments apply to the other patches in the series.

Thanks
   j

>
>  		/* Renesas Camera Data Receiver Unit formats, bayer order agnostic */
>  		{ .format = V4L2_PIX_FMT_RAW_CRU10,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 6, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 17ba1ae70735..14cb94591ea8 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1434,6 +1434,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_SGBRG16:	descr = "16-bit Bayer GBGB/RGRG"; break;
>  	case V4L2_PIX_FMT_SGRBG16:	descr = "16-bit Bayer GRGR/BGBG"; break;
>  	case V4L2_PIX_FMT_SRGGB16:	descr = "16-bit Bayer RGRG/GBGB"; break;
> +	case V4L2_PIX_FMT_SBGGR20:	descr = "20-bit Bayer BGBG/GRGR"; break;
> +	case V4L2_PIX_FMT_SGBRG20:	descr = "20-bit Bayer GBGB/RGRG"; break;
> +	case V4L2_PIX_FMT_SGRBG20:	descr = "20-bit Bayer GRGR/BGBG"; break;
> +	case V4L2_PIX_FMT_SRGGB20:	descr = "20-bit Bayer RGRG/GBGB"; break;
>  	case V4L2_PIX_FMT_RAW_CRU20:	descr = "14-bit Raw CRU Packed"; break;
>  	case V4L2_PIX_FMT_SN9C20X_I420:	descr = "GSPCA SN9C20X I420"; break;
>  	case V4L2_PIX_FMT_SPCA501:	descr = "GSPCA SPCA501"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 5373dba640fa..85a32dee4e21 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -744,6 +744,10 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_SGBRG16 v4l2_fourcc('G', 'B', '1', '6') /* 16  GBGB.. RGRG.. */
>  #define V4L2_PIX_FMT_SGRBG16 v4l2_fourcc('G', 'R', '1', '6') /* 16  GRGR.. BGBG.. */
>  #define V4L2_PIX_FMT_SRGGB16 v4l2_fourcc('R', 'G', '1', '6') /* 16  RGRG.. GBGB.. */
> +#define V4L2_PIX_FMT_SBGGR20 v4l2_fourcc('B', 'G', '2', '0') /* 20  BGBG.. GRGR.. */
> +#define V4L2_PIX_FMT_SGBRG20 v4l2_fourcc('G', 'B', '2', '0') /* 20  GBGB.. RGRG.. */
> +#define V4L2_PIX_FMT_SGRBG20 v4l2_fourcc('G', 'R', '2', '0') /* 20  GRGR.. BGBG.. */
> +#define V4L2_PIX_FMT_SRGGB20 v4l2_fourcc('R', 'G', '2', '0') /* 20  RGRG.. GBGB.. */
>
>  /* HSV formats */
>  #define V4L2_PIX_FMT_HSV24 v4l2_fourcc('H', 'S', 'V', '3')
>
> --
> 2.56.1
>
>
