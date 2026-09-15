Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B547F222599;
	Tue, 15 Sep 2026 00:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789430514; cv=none; b=QW9Lnc0KhQH0JrHyaxxW1uR7d8ljdEg6jlZlnmT6ex9GdfXApsCsLehh4tpzn+MT+UE5uHztjmvRshboMOe+EHiYz867JQ5UYcQw5npKsVdfYD0HCmOlamMHlPCWhpR6TO8TpSyKKuShe1F57zIra9P6XAIPynCSTDHlUw83dzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789430514; c=relaxed/simple;
	bh=DzjwrZ8Y9dyLlcnqv/R/WNI8vufkQK9CVzzRc4UyBTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z/Rv70qNy9S4geqWdlL9rRgImostxeoWks5IPbhTYLBMWFlKYZfh7DvmTJEqK9rhUuEzOymE4dwo9PpOnDgExqm2tjQqGm+cIVABiVWmh5NXkUr0wp3GzG3/zTMBbo6Ib37+FWd4utm1vaw8YXGyf51xnoCCaDY3syrbjk+D1iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZWcf1LHI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZWcf1LHI"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 29F9D1741;
	Tue, 15 Sep 2026 02:00:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789430410;
	bh=DzjwrZ8Y9dyLlcnqv/R/WNI8vufkQK9CVzzRc4UyBTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZWcf1LHIfdA9FFvZwb43y2WBf10oGppSLA7fg/MiniXKtxyDne1ZCtOT8ObbgbXSh
	 0qnkcp59seWUhxwFj4YMw8ANrkoPEWd55t21scLKd6IiwaD/eyb8PQhYva5BsZ2vfv
	 o7n2/snFedXFGUcIUBoeELKtNLE2+pn6yar23BQc=
Date: Tue, 15 Sep 2026 03:01:49 +0300
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
Subject: Re: [PATCH v2 2/6] media: imx8-isi: Use per-platform format_mask for
 output format field
Message-ID: <20260915000149.GC2796257@killaraus.ideasonboard.com>
References: <20260831-isi_imx952-v2-0-fafdb4b446d4@oss.nxp.com>
 <20260831-isi_imx952-v2-2-fafdb4b446d4@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831-isi_imx952-v2-2-fafdb4b446d4@oss.nxp.com>

On Mon, Aug 31, 2026 at 11:36:57AM +0800, Guoniu Zhou wrote:
> The ISI output format field width differs across SoC generations:
> i.MX8 series (MN/MP/QM/QXP) use a 6-bit field (bits 29:24), while
> from i.MX8ULP onwards (including i.MX91/93/95/952) the field is
> extended to 7 bits (bits 30:24) to support RAW32 and RAW14 formats.
> 
> Replace the static CHNL_IMG_CTRL_FORMAT_MASK with a per-platform
> format_mask in mxc_isi_plat_data to correctly match the hardware
> format field width for each SoC.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
> Changes in v2:
> - Add Reviewed-by tag from Frank Li
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 8 ++++++++
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h | 1 +
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c   | 3 ++-
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h | 1 -
>  4 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index f2a8eb82fbfd..c1c16dbc1539 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -297,6 +297,7 @@ static const struct mxc_isi_plat_data mxc_imx8mn_data = {
>  	.reg_offset		= 0,
>  	.ier_reg		= &mxc_imx8_isi_ier_v1,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.format_mask		= GENMASK(29, 24),
>  	.buf_active_reverse	= false,
>  	.gasket_ops		= &mxc_imx8_gasket_ops,
>  	.has_36bit_dma		= false,
> @@ -309,6 +310,7 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
>  	.reg_offset		= 0x2000,
>  	.ier_reg		= &mxc_imx8_isi_ier_v2,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.format_mask		= GENMASK(29, 24),
>  	.buf_active_reverse	= true,
>  	.gasket_ops		= &mxc_imx8_gasket_ops,
>  	.has_36bit_dma		= true,
> @@ -322,6 +324,7 @@ static const struct mxc_isi_plat_data mxc_imx8qm_data = {
>  	.reg_offset		= 0x10000,
>  	.ier_reg		= &mxc_imx8_isi_ier_qm,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.format_mask		= GENMASK(29, 24),
>  	.buf_active_reverse	= true,
>  	.has_36bit_dma		= false,
>  };
> @@ -334,6 +337,7 @@ static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
>  	.reg_offset		= 0x10000,
>  	.ier_reg		= &mxc_imx8_isi_ier_v2,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.format_mask		= GENMASK(29, 24),
>  	.buf_active_reverse	= true,
>  	.has_36bit_dma		= false,
>  };
> @@ -345,6 +349,7 @@ static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
>  	.reg_offset		= 0x0,
>  	.ier_reg		= &mxc_imx8_isi_ier_v2,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.format_mask		= GENMASK(30, 24),
>  	.buf_active_reverse	= true,
>  	.has_36bit_dma		= false,
>  };
> @@ -356,6 +361,7 @@ static const struct mxc_isi_plat_data mxc_imx91_data = {
>  	.reg_offset		= 0,
>  	.ier_reg		= &mxc_imx8_isi_ier_v2,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.format_mask		= GENMASK(30, 24),
>  	.buf_active_reverse	= true,
>  	.has_36bit_dma		= false,
>  };
> @@ -367,6 +373,7 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
>  	.reg_offset		= 0,
>  	.ier_reg		= &mxc_imx8_isi_ier_v2,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.format_mask		= GENMASK(30, 24),
>  	.buf_active_reverse	= true,
>  	.gasket_ops		= &mxc_imx93_gasket_ops,
>  	.has_36bit_dma		= false,
> @@ -380,6 +387,7 @@ static const struct mxc_isi_plat_data mxc_imx95_data = {
>  	.reg_offset		= 0x10000,
>  	.ier_reg		= &mxc_imx8_isi_ier_v2,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.format_mask		= GENMASK(30, 24),
>  	.buf_active_reverse	= true,
>  	.has_36bit_dma		= true,
>  };
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 58b47335afc7..05c21c448b93 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -175,6 +175,7 @@ struct mxc_isi_plat_data {
>  	const struct mxc_isi_ier_reg  *ier_reg;
>  	const struct mxc_isi_set_thd *set_thd;
>  	const struct mxc_gasket_ops *gasket_ops;
> +	u32 format_mask;
>  	bool buf_active_reverse;
>  	bool has_36bit_dma;
>  };
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> index 6aa760ce3605..2405f7d33d0a 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> @@ -410,13 +410,14 @@ void mxc_isi_channel_set_output_format(struct mxc_isi_pipe *pipe,
>  				       const struct mxc_isi_format_info *info,
>  				       struct v4l2_pix_format_mplane *format)
>  {
> +	const struct mxc_isi_plat_data *pdata = pipe->isi->pdata;
>  	u32 val;
>  
>  	/* set outbuf format */
>  	dev_dbg(pipe->isi->dev, "output format %p4cc", &format->pixelformat);
>  
>  	val = mxc_isi_read(pipe, CHNL_IMG_CTRL);
> -	val &= ~CHNL_IMG_CTRL_FORMAT_MASK;
> +	val &= ~pdata->format_mask;
>  	val |= CHNL_IMG_CTRL_FORMAT(info->isi_out_format);
>  	mxc_isi_write(pipe, CHNL_IMG_CTRL, val);
>  
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> index e795f4daf3ff..7c4e736f4651 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> @@ -39,7 +39,6 @@
>  /* Channel Image Control Register */
>  #define CHNL_IMG_CTRL						0x0004
>  #define CHNL_IMG_CTRL_FORMAT(n)					((n) << 24)
> -#define CHNL_IMG_CTRL_FORMAT_MASK				GENMASK(29, 24)

Wouldn't it be simpler to extend this mask to 7 bits unconditionally ?
If bit 30 isn't used on older platforms, clearing it shouldn't cause
issues.

>  #define CHNL_IMG_CTRL_FORMAT_RGBA8888				0x00
>  #define CHNL_IMG_CTRL_FORMAT_ABGR8888				0x01
>  #define CHNL_IMG_CTRL_FORMAT_ARGB8888				0x02

-- 
Regards,

Laurent Pinchart
