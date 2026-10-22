Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792688483;
	b=iAHIAJzNDz5G3NoRoBOkbwaixjZeaJJINdI/BXAvBRoobeapKOn0nZ3VONRIFJurl5Hi
	 W38fUZq2mVoX1KH8blOinCqM7xKgcEZUGcpbp6sRgvuhpUEbj5UATisyIYuHbtTOR1KhS
	 R/FaYNxf1n0vWBdO0lpGWKcPiCDFy9WgYSLEidHemWvyLtDzcG5Rg9QjzKiwDbIg94P6j
	 hOwrzCGimNraooK7x4axvzH7r01vaFiXG3g8iSNT5uYYZyEXNA/XU1wdaNuFPw1yX3t7c
	 88jnVmUi6xEuKmXcKPT2BgiMZUCq0dNWk3uu8NTb5JBSMd03aPrIaMnSwOd7jHjSd8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792688483;
	h=DMARC-Filter:Received:X-Spam-Checker-Version:X-Spam-Level:
	 X-Spam-Status:Received:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
	 References:Organization:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=NgjaHYfiAaPHJ5kq0vWXXCIZ+lJdJlUeid+zTDPD1io=;
	b=QssnGXDsw6HhzP3MkjXBnhFKx20FNKe5kyeXJQcxIXT03nx2zwj8mfNBuKg+x2S2mkre
	 rrF7gQQ6Mvc+eGo54XoCbN4hh3TBBNFBKy/FCMc0VbWjlpYxqQdLi6h+hDjQz3zr41Che
	 R9j82QbVrEppUrr5LarlLcFJFxu/D0TDTGO2tPSlwJCEYAfrrX4Z9Y7CWuz596E8CXpYh
	 r/Fj1yaSwZsLR05Ovug3y8TbeW7DXgS4oWw/MnCLaxv73nWk8px/xleFoo6EVOseawBOK
	 5jW0vruZwr9O+LKzFURGBulYkPNJjiVvB3xBlIZaUprsQssDdoBOEqOrCrhXApy087w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA91606A319;
	Thu, 22 Oct 2026 17:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CA91606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 107)
	id 8342968D16; Thu, 22 Oct 2026 19:01:13 +0200 (CEST)
X-Spam-Level: 
Received: from rocky.lan (dynamic-077-002-186-156.77.2.pool.telefonica.de [77.2.186.156])
	by verein.lst.de (Postfix) with ESMTPSA id 081A368C4E;
	Thu, 22 Oct 2026 19:00:36 +0200 (CEST)
Date: Thu, 22 Oct 2026 19:00:26 +0200
From: Torsten Duwe <duwe@lst.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Lucas Sinn <lucas.sinn@wolfvision.net>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/4] media: rockchip: Add JPEG decoder driver
Message-ID: <20261022190026.6cb0a534@rocky.lan>
In-Reply-To: <20261022-rockchip-jpegdec-v7-2-3fd7dd55f408@pengutronix.de>
References: <20261022-rockchip-jpegdec-v7-0-3fd7dd55f408@pengutronix.de>
	<20261022-rockchip-jpegdec-v7-2-3fd7dd55f408@pengutronix.de>
Organization: LST e.V.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.50; aarch64-suse-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Sascha,

first: thank you for driving this :)

On Thu, 22 Oct 2026 13:06:40 +0200
Sascha Hauer <s.hauer@pengutronix.de> wrote:

> Add a driver for the JPEG hardware decoder Rockchip integrates into a
> number of its SoCs. 

[...]

> +static int rkjpegd_enum_fmt_vid_out(struct file *file, void *priv,
> +				    struct v4l2_fmtdesc *f)
> +{
> +	if (f->index)
> +		return -EINVAL;
> +
> +	f->pixelformat = V4L2_PIX_FMT_JPEG;
> +	f->flags |= V4L2_FMT_FLAG_DYN_RESOLUTION;
> +
> +	return 0;
> +}
> +
> +static int rkjpegd_enum_framesizes(struct file *file, void *priv,
> +				   struct v4l2_frmsizeenum *fsize)
> +{
> +	/* The decoded format follows the bitstream, nothing to enumerate. */
> +	if (fsize->pixel_format == V4L2_PIX_FMT_NV12 ||
> +	    fsize->pixel_format == V4L2_PIX_FMT_GREY)
> +		return -ENOTTY;
> +
> +	if (fsize->pixel_format != V4L2_PIX_FMT_JPEG)
> +		return -EINVAL;
> +
> +	if (fsize->index)
> +		return -EINVAL;
> +
> +	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
> +	fsize->stepwise.min_width = RKJPEGD_MIN_WIDTH;
> +	fsize->stepwise.max_width = RKJPEGD_MAX_SIZE;
> +	fsize->stepwise.step_width = RKJPEGD_CODED_STEP;
> +	fsize->stepwise.min_height = RKJPEGD_MIN_HEIGHT;
> +	fsize->stepwise.max_height = RKJPEGD_MAX_SIZE;
> +	fsize->stepwise.step_height = RKJPEGD_CODED_STEP;
> +
> +	return 0;
> +}

Can it do JPEG, MJPEG or maybe both? AFAICT the difference is minimal,
so maybe try to be more permissive?

[...]

> +static const struct v4l2_ioctl_ops rkjpegd_ioctl_ops = {
> +	.vidioc_querycap = rkjpegd_querycap,
> +	.vidioc_enum_framesizes = rkjpegd_enum_framesizes,
> +
> +	.vidioc_enum_fmt_vid_cap = rkjpegd_enum_fmt_vid_cap,
> +	.vidioc_g_fmt_vid_cap_mplane = rkjpegd_g_fmt_vid_cap,
> +	.vidioc_try_fmt_vid_cap_mplane = rkjpegd_try_fmt_vid_cap,
> +	.vidioc_s_fmt_vid_cap_mplane = rkjpegd_s_fmt_vid_cap,
> +
> +	.vidioc_enum_fmt_vid_out = rkjpegd_enum_fmt_vid_out,
> +	.vidioc_g_fmt_vid_out_mplane = rkjpegd_g_fmt_vid_out,
> +	.vidioc_try_fmt_vid_out_mplane = rkjpegd_try_fmt_vid_out,
> +	.vidioc_s_fmt_vid_out_mplane = rkjpegd_s_fmt_vid_out,
> 

You are populating only the *_out_mplane members and not the single
plane ones? So a greyscale JPEG needs to go _mplane with 1 plane?

And for color, the colorspace on the decoded side should be
V4L2_COLORSPACE_JPEG, not sRGB, I think.

Would you mind to give a hint about your test setup?

Thanks,
	Torsten
