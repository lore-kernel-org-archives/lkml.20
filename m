Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DD04F4024;
	Tue, 29 Sep 2026 14:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790692225; cv=none; b=OC+7ZHvk9IfcrJBvzeOJDjYw9IIJ7L0JRpcdFdhx/64/WvLXOGpqO/inyYNPiu4lMKHYk3x78EJ/A391crlgUBJcuVckzId99Ndu8iTD9ScNSK8TPsmT3/xu6dya6HrnLcl5bumfO6YK/awGoXWaYZR6Gap0JsS5l2dSeaOBoSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790692225; c=relaxed/simple;
	bh=7ZMoLlE5/mTVgfBTmCJqOWyEivNkU+AeJL3PzzVxxZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DqG27ZYAuOXaBePCi9TUORbK2G/3dBAalCiSqEhwMHhFMMM5ZhMXGB0OuQbxmdiuKDx8oQWk0i7UvpScMDv+EKwskCQRb2s+y4D1DPIfeo/ePvG+j1w+9M+3U9wSpMH8sH7+taIowFVKYZiu9cTlVSp9oyKo+1expwzoqUaed/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=lGdlGjez; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dm+XL5fC; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="lGdlGjez";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dm+XL5fC"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CE0E71400052;
	Tue, 29 Sep 2026 10:30:18 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 29 Sep 2026 10:30:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790692218;
	 x=1790778618; bh=IvKd5F4ysyhmnPovYdkt0ImhsVRcG0GfXUCUA50JdJ4=; b=
	lGdlGjezXHreh2zZB7Lk2xBC33E1ixJQMdTDLlOR5fmBevWY4CrWYH0dQuFxzjxr
	w0INqrXpVB49kRihyRiilSRG3dUmNbC1+c3Hin96/H+Kh97Dd/fqwK8dc6ZKLWsq
	qVix7iWBBJK4v63VnhnFMy4Xsm1+eUrN5kUMWee0JYt0noBdq7xazTKwIpEPfwx8
	IixMCfLAW6vzQ+3MEsJXwQ4ocFilbUM0//mczQ8zGqUWddO4bjJ40QGqB5+AwkJP
	mJYR5Q0uv8rk6hPzxFVzuKr7Q/ela46p6gLluIkxW/DqAf82ozynp7NJCEywLmEG
	vGoo1R4hEl77GhEIsECuvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790692218; x=
	1790778618; bh=IvKd5F4ysyhmnPovYdkt0ImhsVRcG0GfXUCUA50JdJ4=; b=d
	m+XL5fCSHZ30qaHl4u7S3FtqEl6oJ5Gem/v/I0XscirXMnjIO8UkeWKsQpgmkhvP
	E4/C2IkGxjiL7QwtES30zyE/akJYyFUQpSdejt/o6AlbuuPLZaNNiGVBlqRrxgJp
	JnKDGfOTF7jxqP+hY/u1yDPOb35R1cO1qIBNEUafuII6h5FxwA2gnl5OJjE6YDgl
	JZaqxnV9GdM2ENbeJQivdfttfew0Shmic+512XzdDmc9kwZ5Dy3M2onXRJ8b/87H
	aQ4DrKgcExUH5hx21+m0rsAPEldPQ0gT2oQtO5VCIQjlTdzLoLNJ6gVoOHkzt7VB
	h2f0GTOv8GXIdIrKfxCPw==
X-ME-Sender: <xms:esu7ank6YKCmk6upGufvbHdc7RcDdN_XkR9IwfOcccL_OhFTUo_lQQ>
    <xme:esu7anaC2Qry5jE5m4JfvFu22CKspzQJ9bn0KR7TxD6PNUy8ptnmz0YnZL5fkcIWW
    6X5gfsXzklg4sWQzFp0EPZ05Fm-4OP3dJ5aDvSc-nTEZK3gF_y4qc35nw>
X-ME-Received: <xmr:esu7aiHJQBa28eqaBOaCuo5WZS6SQcgWXSLG9INa4S7Cct3WVVY3OcalB0mmINQ9nhgF3e7Lj62afSd_iLSmhBKBU1a4twU>
X-ME-Proxy-Cause: dmFkZTEyWfgsudX6RHBNY3GF5pQCgYzAE/M8J+Q79q2i5teNIp70QUGwnC8FGzOsVnv7PH
    Oauk00hqFW1CQZLOQyRkCYBzJNqjFDyye3CdCqcW2pTaNew2h1ya4Q53DsxGkxg1S5fA9L
    Bk+4v4Jyf1OnyerDMQAPphlVFeNGvDdQqHQdLy6RqUrJFlNV2SNPNS0irkuuw+vI++2LsC
    yQX3vBa+4scslmM2r8qXS153SzwoZGSy+b8NmCwxc+7scF+T4tLNa1HQ/QBQMgspF6/XOO
    94/nmtmG8+Ei66lS9meTmpJaEvTT85MXdjZv+Nl5QwOgEml8P9OD/+soog4pi8907lToOY
    eB7QdzwLaZRUQoIXmfojncegddWq2/MOSFsHFmEDgRamIKpUa2QKaNVXzuUDIla+qIdrk6
    CBGOtLEW+zSfod0ZbGjhGl4g7m3bMEc2Nh1gN7Nf+/+K0ji/9UdoViPnwYF7FAluMQxtyZ
    kjat/77oFrfdcnZn4vKncvB9cHeSipTT7g2f/zS8buZxNhKwKuYfaqub+aLszGxDjENAMR
    8zwVafAY4YySCBjX2N5zMHdepnbiwRRRyIh6o5zX6e04W/sEDE7SqFk3NWMaMXwDW91UxG
    IXnuPt8cOxyU3JFSTb+3gCvqumQ/2Y//4Vovl2j2jvy/5nGTL/YI8eZLpsuQ
X-ME-Proxy: <xmx:esu7amZKKufKg_tiuKhOQH8rWIrTfNCErBRUTRTEku13CezcJJ4mOg>
    <xmx:esu7amwp_9Fd5-u4cNdpJau8lxvrdJanWwsJNch21yE5er-pzi6sew>
    <xmx:esu7aoQiblkj-cPTzXTUEq4DA4fj5y-PJ2cCGzx52yOXI3tf_YY5Tg>
    <xmx:esu7ajKzV-Rc4yMHyzvglIPGLTLFx2SocykRgI_1ia0vBvaNJSSPDg>
    <xmx:esu7arG7vGUhfFn73_gMWvHf32ps5gKvdzycQb7eMePiodvGqcZK4V__>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Sep 2026 10:30:17 -0400 (EDT)
Date: Tue, 29 Sep 2026 16:30:15 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] media: rcar-isp: ispcore: Fix inconsistent step sizes
Message-ID: <20260929143015.GA1244576@ragnatech.se>
References: <20260929133020.342677-2-barnabas.pocze+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260929133020.342677-2-barnabas.pocze+renesas@ideasonboard.com>

Hi Barnabás,

Thanks for your work.

On 2026-09-29 15:30:21 +0200, Barnabás Pőcze wrote:
> `risp_io_{input,capture}_enum_framesizes()` sets the horizonal and vertical

nit: horizontal

> step size to 2. However, `risp_io_{input,capture}_try_format()` passes 2
> to `v4l_bound_align_image()`, which corresponds to a step size of 2^2 = 4.
> 
> So move these constants into macros to avoid the repetition, and with that,
> use 4 as the step size everywhere.
> 
> Fixes: 2151350f60d1 ("media: rcar-isp: Add support for ISPCORE")
> Signed-off-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  .../media/platform/renesas/rcar-isp/core-io.c | 40 +++++++++++--------
>  1 file changed, 24 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-isp/core-io.c b/drivers/media/platform/renesas/rcar-isp/core-io.c
> index 820af506f896c..b60b91f43d42d 100644
> --- a/drivers/media/platform/renesas/rcar-isp/core-io.c
> +++ b/drivers/media/platform/renesas/rcar-isp/core-io.c
> @@ -15,6 +15,12 @@
>  
>  #include "risp-core.h"
>  
> +#define RISP_MIN_WIDTH 128
> +#define RISP_MAX_WIDTH 5120
> +#define RISP_MIN_HEIGHT 128
> +#define RISP_MAX_HEIGHT 4096
> +#define RISP_SIZE_ALIGNMENT 2 /* 2^2 = 4 */
> +
>  #define risp_io_err(d, fmt, arg...)         dev_err((d)->core->dev, fmt, ##arg)
>  
>  static struct risp_buffer *risp_io_vb2buf(struct vb2_v4l2_buffer *vb)
> @@ -330,8 +336,9 @@ static void risp_io_input_try_format(struct rcar_isp_core_io *io,
>  {
>  	unsigned int bpp = 0;
>  
> -	v4l_bound_align_image(&pix->width, 128, 5120, 2,
> -			      &pix->height, 128, 4096, 2, 0);
> +	v4l_bound_align_image(&pix->width, RISP_MIN_WIDTH, RISP_MAX_WIDTH, RISP_SIZE_ALIGNMENT,
> +			      &pix->height, RISP_MIN_HEIGHT, RISP_MAX_HEIGHT, RISP_SIZE_ALIGNMENT,
> +			      0);
>  
>  	for (unsigned int i = 0; i < ARRAY_SIZE(risp_io_input_formats); i++) {
>  		if (risp_io_input_formats[i].fourcc == pix->pixelformat) {
> @@ -423,13 +430,13 @@ static int risp_io_input_enum_framesizes(struct file *file, void *fh,
>  
>  	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
>  
> -	fsize->stepwise.min_width = 128;
> -	fsize->stepwise.max_width = 5120;
> -	fsize->stepwise.step_width = 2;
> +	fsize->stepwise.min_width = RISP_MIN_WIDTH;
> +	fsize->stepwise.max_width = RISP_MAX_WIDTH;
> +	fsize->stepwise.step_width = 1u << RISP_SIZE_ALIGNMENT;
>  
> -	fsize->stepwise.min_height = 128;
> -	fsize->stepwise.max_height = 4096;
> -	fsize->stepwise.step_height = 2;
> +	fsize->stepwise.min_height = RISP_MIN_HEIGHT;
> +	fsize->stepwise.max_height = RISP_MAX_HEIGHT;
> +	fsize->stepwise.step_height = 1u << RISP_SIZE_ALIGNMENT;
>  
>  	return 0;
>  }
> @@ -720,8 +727,9 @@ static const struct v4l2_pix_format_mplane risp_io_capture_default_format = {
>  static void risp_io_capture_try_format(struct rcar_isp_core_io *io,
>  				       struct v4l2_pix_format_mplane *pix)
>  {
> -	v4l_bound_align_image(&pix->width, 128, 5120, 2,
> -			      &pix->height, 128, 4096, 2, 0);
> +	v4l_bound_align_image(&pix->width, RISP_MIN_WIDTH, RISP_MAX_WIDTH, RISP_SIZE_ALIGNMENT,
> +			      &pix->height, RISP_MIN_HEIGHT, RISP_MAX_HEIGHT, RISP_SIZE_ALIGNMENT,
> +			      0);
>  
>  	pix->field = V4L2_FIELD_NONE;
>  	pix->colorspace = V4L2_COLORSPACE_SRGB;
> @@ -824,13 +832,13 @@ static int risp_io_capture_enum_framesizes(struct file *file, void *fh,
>  
>  	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
>  
> -	fsize->stepwise.min_width = 128;
> -	fsize->stepwise.max_width = 5120;
> -	fsize->stepwise.step_width = 2;
> +	fsize->stepwise.min_width = RISP_MIN_WIDTH;
> +	fsize->stepwise.max_width = RISP_MAX_WIDTH;
> +	fsize->stepwise.step_width = 1u << RISP_SIZE_ALIGNMENT;
>  
> -	fsize->stepwise.min_height = 128;
> -	fsize->stepwise.max_height = 4096;
> -	fsize->stepwise.step_height = 2;
> +	fsize->stepwise.min_height = RISP_MIN_HEIGHT;
> +	fsize->stepwise.max_height = RISP_MAX_HEIGHT;
> +	fsize->stepwise.step_height = 1u << RISP_SIZE_ALIGNMENT;
>  
>  	return 0;
>  }
> -- 
> 2.55.0
> 

-- 
Kind Regards,
Niklas Söderlund
