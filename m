Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794447780;
	b=ea/FVXE3v/CS5+x73u6lA5naKt+B8iC/i5wC/X7lMvdPESuUmQdVhHV0sHF1jvVwpy1i
	 ktTqBrcyrdxQUXNutYVpea5yBIZT+dkwU5ojLdfu8IeQrTUJLJ1lxsJYnKQypFmkExEhy
	 C+MmdPVKRUYfuAgdO/dQ7q5lXTzdvBVuDP3xZ+IUXAfmwIvmyzzYTJN+A+CehwbBsXO67
	 xNl7F2wFpsdNOlP1ItN02rHzsI+FCDmwYUmXf7/UfBIsVS4nnyDqYUHB0DjAUuNuiWajO
	 a/6tqDnniJoz7dSy+npxFgAAAUHcagMUrCBYrgGdd7kET/MBIN6M5Mwt5lmObJSb86A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794447780;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=RydkAwhCHaAKlfAub9w35tVkjVw3id/z9+LZoN9cN3s=;
	b=KCRCg3ZaXwl0CrMfFdsye9MdWw9bEvV9ZiNo3aKvnVB2LHRIW49bvI9UbCNj6eOAQys/
	 64oDsYCPmyrrBVm71BWnHtwKhLpcUXOPuFTtdIb+eKgi/bWvXp/a2OnRY1fHTpSU4PPMy
	 FYZdTWkctoYxBnQjrcx/8pw9EbEOzmEGw+xV30aQywmWH+x0bybwVr8kSG81uwcNNkwgG
	 aCVg43OMaCBSVuK2R5TQrp8w+vRWnILCT4ZvSrf6/x1ZCRKmAeIstZE3jfHh4ja2Vj+my
	 Ly26Ibw4Poaiq8taptzQVqvzsPyvOrYcjTI67fjUiJFYtXZDv5GThhKjyY81r4Zs8+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=qyp+1ySN;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D18606A324;
	Thu, 12 Nov 2026 01:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46D18606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=qyp+1ySN
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CCD5E33D;
	Thu, 12 Nov 2026 02:40:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794447635;
	bh=mbqc4reuJ5uBUi3+eZMvhNNKUYHa01GKz4Io2SYawNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qyp+1ySNielkdl0+WhADvwJC2XanDvORnzB3mO35LsdWGnWfo8J/2OEdTcOqSBYcu
	 D/WsJgfwElxahNpwMU1hHy25tzzEwM7EOgi1eKF0VoE7u0Bv65N+C+DBwaYKq0s1fj
	 1QcAyKfs/dcLEttWGWavP7I52moXsHbWCpoMn8Aw=
Date: Thu, 12 Nov 2026 03:42:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 03/11] media: imx8-isi: Support mbus_code filtering in
 format enumeration
Message-ID: <20261112014257.GB449716@killaraus.ideasonboard.com>
References: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com>
 <20260929-isi_imx952-v4-3-e69f89c7c651@oss.nxp.com>
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
In-Reply-To: <20260929-isi_imx952-v4-3-e69f89c7c651@oss.nxp.com>

On Tue, Sep 29, 2026 at 04:52:24PM +0800, Guoniu Zhou wrote:
> Extend mxc_isi_format_enum() to accept a v4l2_fmtdesc pointer instead
> of a plain index, so it can filter formats by mbus_code when set. This
> is used by the capture path to enumerate only formats compatible with
> the connected subdev output.

It's not in this patch, mxc_isi_format_enum() is used for M2M only. It
will only be used in the capture path in patch 04/11.

> 
> For the M2M device, the V4L2 framework clears mbus_code to 0 for
> devices without V4L2_CAP_IO_MC (v4l2-ioctl.c), so this change has no
> effect on M2M format enumeration.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
> Changes in v4:
> - New patch
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h  | 2 +-
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c   | 2 +-
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 6 +++++-
>  3 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 58b47335afc7..a30633a7e2e9 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -322,7 +322,7 @@ mxc_isi_bus_format_by_index(unsigned int index, unsigned int pad);
>  const struct mxc_isi_format_info *
>  mxc_isi_format_by_fourcc(u32 fourcc, enum mxc_isi_video_type type);
>  const struct mxc_isi_format_info *
> -mxc_isi_format_enum(unsigned int index, enum mxc_isi_video_type type);
> +mxc_isi_format_enum(const struct v4l2_fmtdesc *f, enum mxc_isi_video_type type);
>  const struct mxc_isi_format_info *
>  mxc_isi_format_try(struct mxc_isi_pipe *pipe, struct v4l2_pix_format_mplane *pix,
>  		   enum mxc_isi_video_type type);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> index b729eecad0fe..1178947bb548 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> @@ -492,7 +492,7 @@ static int mxc_isi_m2m_enum_fmt_vid(struct file *file, void *fh,
>  		MXC_ISI_VIDEO_M2M_OUT : MXC_ISI_VIDEO_M2M_CAP;
>  	const struct mxc_isi_format_info *info;
>  
> -	info = mxc_isi_format_enum(f->index, type);
> +	info = mxc_isi_format_enum(f, type);
>  	if (!info)
>  		return -EINVAL;
>  
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index f45c2aae59ce..0d87a1082727 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -482,13 +482,17 @@ mxc_isi_format_by_fourcc(u32 fourcc, enum mxc_isi_video_type type)
>  }
>  
>  const struct mxc_isi_format_info *
> -mxc_isi_format_enum(unsigned int index, enum mxc_isi_video_type type)
> +mxc_isi_format_enum(const struct v4l2_fmtdesc *f, enum mxc_isi_video_type type)
>  {
> +	unsigned int index = f->index;
>  	unsigned int i;
>  
>  	for (i = 0; i < ARRAY_SIZE(mxc_isi_formats); i++) {
>  		const struct mxc_isi_format_info *fmt = &mxc_isi_formats[i];
>  
> +		if (f->mbus_code && fmt->mbus_code != f->mbus_code)
> +			continue;
> +
>  		if (!(fmt->type & type))
>  			continue;
>  

-- 
Regards,

Laurent Pinchart
