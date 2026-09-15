Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F763BB48;
	Tue, 15 Sep 2026 00:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789430725; cv=none; b=p35nB6LqnXvBJ8PxcqfvTnAvn7WMb1uA5JMSKifO2Yhk6Ndn0wUE6Ztimzzv+Luh+Qg92fejwqdJt94cCoyernDjZloE4Rvv7N0v7N8VH/SjSnXdtC4GhCPAQxPA2vEvqcT9OBP4ha0/ZYzDgegoETi7TyBqnMYkXZaEUokvDBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789430725; c=relaxed/simple;
	bh=pnQjveCJaTht4nhZTpwWuMYbdnSb4VYI5/J/S81rxrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZzPe/GAJ4YM/A/H2KI2rVd2hil7eO7jkJTZMwOLTs204cdCya1fjxQGeyrQHBBWYalVbt374fvGNVIyNLVEaeJ1ZGaN1vLqIdZezYzGNGlb+An4wAnocq5QMB4MmtP8NG73vfrAzda/dpeDTEHfhEfOA5u/AOeQRcJq4gezY110=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=In/E9cKY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="In/E9cKY"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F966447;
	Tue, 15 Sep 2026 02:03:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789430621;
	bh=pnQjveCJaTht4nhZTpwWuMYbdnSb4VYI5/J/S81rxrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=In/E9cKYBLrWIn6bm/TB/buW7Ddb0EyYyxZT0THFQ6wwV+7d4pfHu+vkoO6wuw7Fi
	 kKT5Fl3p4hkFYQ4B04LWPT2DVpeWiomVpUKcM/7NKgFBY532e6cVTVJiy6ZK2AeoiI
	 BiH6EWOiFp/UsWLD/RuDme//6C0jjVn/WiCbpO98=
Date: Tue, 15 Sep 2026 03:05:20 +0300
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
Subject: Re: [PATCH v2 6/6] media: imx8-isi: Enable ISI RAW10/12/14 output
 LSB alignment
Message-ID: <20260915000520.GB2804748@killaraus.ideasonboard.com>
References: <20260831-isi_imx952-v2-0-fafdb4b446d4@oss.nxp.com>
 <20260831-isi_imx952-v2-6-fafdb4b446d4@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831-isi_imx952-v2-6-fafdb4b446d4@oss.nxp.com>

On Mon, Aug 31, 2026 at 11:37:01AM +0800, Guoniu Zhou wrote:
> V4L2 requires RAW formats to be LSB-aligned (right-aligned). Before
> i.MX952, the ISI shifts RAW10/12/14 output left to MSB, so the driver
> works around this by using RAW16 format instead.
> 
> The i.MX952 ISI introduces a RAW output LSB alignment bit. Enable it
> along with the input MSB alignment on platforms that support this
> feature, so that RAW10/12/14 output formats can be used directly
> without the RAW16 workaround.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  1 +
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  1 +
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  | 39 ++++++++++++++++++++-
>  .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    |  3 ++
>  .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 40 +++++++++++-----------
>  5 files changed, 63 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index d492631dfb6d..0f776fc8fd7e 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -394,6 +394,7 @@ static const struct mxc_isi_plat_data mxc_imx952_data = {
>  	.format_mask		= GENMASK(30, 24),
>  	.buf_active_reverse	= true,
>  	.has_36bit_dma		= true,
> +	.raw_out_lsb		= true,
>  };
>  
>  /* -----------------------------------------------------------------------------
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 73f6ea7b0ea1..c352bcf8dc47 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -166,6 +166,7 @@ struct mxc_isi_plat_data {
>  	u32 format_mask;
>  	bool buf_active_reverse;
>  	bool has_36bit_dma;
> +	bool raw_out_lsb;

As there's a single SoC that supports this, I would have used the model
field instead of adding a new boolean.

>  };
>  
>  struct mxc_isi_dma_buffer {
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> index 2405f7d33d0a..4838b445f279 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> @@ -308,6 +308,7 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
>  					unsigned int vc,
>  					bool bypass)
>  {
> +	const struct mxc_isi_plat_data *pdata = pipe->isi->pdata;
>  	u32 val;
>  
>  	mutex_lock(&pipe->lock);
> @@ -357,6 +358,20 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
>  			val |= CHNL_CTRL_VC_ID_1(vc >> 2);
>  	}
>  
> +	if (pdata->raw_out_lsb) {
> +		/*
> +		 * Enable RAW10/12/14 output LSB alignment to match the
> +		 * V4L2 requirement that RAW formats are LSB-aligned.
> +		 */
> +		val |= CHNL_CTRL_RAW_OUT_LSB_ALIGN;
> +
> +		/*
> +		 * Align the data selection from pixel link to MSB to
> +		 * avoid data shift since the data from PL is MSB.
> +		 */
> +		val |= CHNL_CTRL_RAW_IN_MSB_ALIGN;
> +	}
> +
>  	mxc_isi_write(pipe, CHNL_CTRL, val);
>  
>  	mutex_unlock(&pipe->lock);
> @@ -406,11 +421,19 @@ void mxc_isi_channel_set_input_format(struct mxc_isi_pipe *pipe,
>  		      CHNL_IN_BUF_PITCH_LINE_PITCH(bpl));
>  }
>  
> +static bool isi_out_raw(u32 format)
> +{
> +	return format == CHNL_IMG_CTRL_FORMAT_RAW10 ||
> +	       format == CHNL_IMG_CTRL_FORMAT_RAW12 ||
> +	       format == CHNL_IMG_CTRL_FORMAT_RAW14;
> +}
> +
>  void mxc_isi_channel_set_output_format(struct mxc_isi_pipe *pipe,
>  				       const struct mxc_isi_format_info *info,
>  				       struct v4l2_pix_format_mplane *format)
>  {
>  	const struct mxc_isi_plat_data *pdata = pipe->isi->pdata;
> +	u32 fmt;
>  	u32 val;
>  
>  	/* set outbuf format */
> @@ -418,7 +441,21 @@ void mxc_isi_channel_set_output_format(struct mxc_isi_pipe *pipe,
>  
>  	val = mxc_isi_read(pipe, CHNL_IMG_CTRL);
>  	val &= ~pdata->format_mask;
> -	val |= CHNL_IMG_CTRL_FORMAT(info->isi_out_format);
> +
> +	/*
> +	 * Before i.MX952, the ISI shifts the 10/12/14-bit formats left
> +	 * by 6, 4 and 2 bits when using CHNL_IMG_CTRL_FORMAT_RAW10/12/14
> +	 * respectively, to align the bits to the left and pad with zeros in
> +	 * the LSBs. The corresponding V4L2 formats are however right-aligned,
> +	 * we have to use CHNL_IMG_CTRL_FORMAT_RAW16 to avoid the left shift.
> +	 * After i.MX952, ISI add RAW10/12/14 LSB output alignment, so skip
> +	 * the above workaround.

What happens on i.MX952 if you use CHNL_IMG_CTRL_FORMAT_RAW16 and don't
set CHNL_CTRL_RAW_OUT_LSB_ALIGN ? Won't that work, the same way as on
previous ISI versions ? If so we could use that workaround on i.MX952 as
well and avoid this complexity.

> +	 */
> +	fmt = !pdata->raw_out_lsb && isi_out_raw(info->isi_out_format) ?
> +	      CHNL_IMG_CTRL_FORMAT_RAW16 :
> +	      info->isi_out_format;
> +
> +	val |= CHNL_IMG_CTRL_FORMAT(fmt);
>  	mxc_isi_write(pipe, CHNL_IMG_CTRL, val);
>  
>  	/* line pitch */
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> index 35dec3a650ac..c9c22a3668f9 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> @@ -20,6 +20,8 @@
>  #define CHNL_CTRL_CHAIN_BUF_NO_CHAIN				0
>  #define CHNL_CTRL_CHAIN_BUF_2_CHAIN				1
>  #define CHNL_CTRL_SW_RST					BIT(24)
> +#define CHNL_CTRL_RAW_OUT_LSB_ALIGN				BIT(23)	/* i.MX952 only */
> +#define CHNL_CTRL_RAW_IN_MSB_ALIGN				BIT(22)	/* i.MX{91,93,95,952} only */
>  /*
>   * CHNL_CTRL_BLANK_PXL: i.MX8{QM,QXP} only
>   * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX{95,952} only
> @@ -88,6 +90,7 @@
>  #define CHNL_IMG_CTRL_FORMAT_YUV420_3P10P			0x3a
>  #define CHNL_IMG_CTRL_FORMAT_YUV420_2P12			0x3d
>  #define CHNL_IMG_CTRL_FORMAT_YUV420_3P12			0x3e
> +#define CHNL_IMG_CTRL_FORMAT_RAW14				0x41	/* i.MX{8ULP,91,93,95,952} only */

This is documented as available on i.MX{8ULP,91,93,95,952}, but the
format will only be used on i.MX952.

>  #define CHNL_IMG_CTRL_GBL_ALPHA_VAL(n)				((n) << 16)
>  #define CHNL_IMG_CTRL_GBL_ALPHA_VAL_MASK			GENMASK(23, 16)
>  #define CHNL_IMG_CTRL_GBL_ALPHA_EN				BIT(15)
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index f45c2aae59ce..9a6a8302774c 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -221,11 +221,11 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  	/*
>  	 * RAW formats
>  	 *
> -	 * The ISI shifts the 10-bit and 12-bit formats left by 6 and 4 bits
> -	 * when using CHNL_IMG_CTRL_FORMAT_RAW10 or MXC_ISI_OUT_FMT_RAW12
> -	 * respectively, to align the bits to the left and pad with zeros in
> -	 * the LSBs. The corresponding V4L2 formats are however right-aligned,
> -	 * we have to use CHNL_IMG_CTRL_FORMAT_RAW16 to avoid the left shift.
> +	 * The format entries use the native RAW10/12/14 ISI format codes.
> +	 * On platforms without hardware LSB alignment, the driver
> +	 * substitutes RAW16 at runtime in
> +	 * mxc_isi_channel_set_output_format() to avoid the left shift
> +	 * that the ISI applies to RAW10/12/14 output.
>  	 */
>  	{
>  		.mbus_code	= MEDIA_BUS_FMT_Y8_1X8,
> @@ -240,7 +240,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_Y10_1X10,
>  		.fourcc		= V4L2_PIX_FMT_Y10,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -249,7 +249,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_Y12_1X12,
>  		.fourcc		= V4L2_PIX_FMT_Y12,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -258,7 +258,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_Y14_1X14,
>  		.fourcc		= V4L2_PIX_FMT_Y14,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -312,7 +312,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
>  		.fourcc		= V4L2_PIX_FMT_SBGGR10,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -321,7 +321,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
>  		.fourcc		= V4L2_PIX_FMT_SGBRG10,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -330,7 +330,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
>  		.fourcc		= V4L2_PIX_FMT_SGRBG10,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -339,7 +339,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
>  		.fourcc		= V4L2_PIX_FMT_SRGGB10,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -348,7 +348,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
>  		.fourcc		= V4L2_PIX_FMT_SBGGR12,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -357,7 +357,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
>  		.fourcc		= V4L2_PIX_FMT_SGBRG12,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -366,7 +366,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
>  		.fourcc		= V4L2_PIX_FMT_SGRBG12,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -375,7 +375,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
>  		.fourcc		= V4L2_PIX_FMT_SRGGB12,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -384,7 +384,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SBGGR14_1X14,
>  		.fourcc		= V4L2_PIX_FMT_SBGGR14,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -393,7 +393,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SGBRG14_1X14,
>  		.fourcc		= V4L2_PIX_FMT_SGBRG14,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -402,7 +402,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SGRBG14_1X14,
>  		.fourcc		= V4L2_PIX_FMT_SGRBG14,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -411,7 +411,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SRGGB14_1X14,
>  		.fourcc		= V4L2_PIX_FMT_SRGGB14,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },

-- 
Regards,

Laurent Pinchart
