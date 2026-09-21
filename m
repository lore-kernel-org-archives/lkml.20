Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E193C1998;
	Mon, 21 Sep 2026 08:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789977791; cv=none; b=bsGzao6Qaz96HMV5FdvoScyJYyTXpD5qM/T5HHfMUsnkyelDdAWdLArD3T94hCZzKLh2sl3hl6AAF+RSndZs/ImH0D14mFzUYvX+AIj1CZ+LLu4yirwiFyF+mITnEPHCX0hc4VSCmXHygig1pK+0BamTv7BT1agTzpMYd2E91/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789977791; c=relaxed/simple;
	bh=4MPgzglqjVdZGx+2jOi9TrPxLozn/ma4WxLeqRxobLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nrBbdoNuoLK23nkEmz6hosmOHblaUFHc+l2yOVH9gWiefqPSVCZ8nM6k71iBG0h0p0V9aYeP05eLPjF3gOt6HnUnotldA/pPs+h64/ZYXHM7GbXyOK/lA3zoP6fCQx6qvuPPuUlfjlE7H+wmsmO4Ulgpxz/RKTqs7L6LiuCn8Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=msr6NfKJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="msr6NfKJ"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E313177;
	Mon, 21 Sep 2026 10:01:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789977682;
	bh=4MPgzglqjVdZGx+2jOi9TrPxLozn/ma4WxLeqRxobLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=msr6NfKJ6WhAAdMlg0xGJcB2rHSwIPBiHVA2rAbnfPk22Hwy1NyXTdtaHpo/RQ8Z0
	 dX/0UYWShCclNCWmyyMaQgM8geDtNwCIrfAG9oSDQ3PRIntxKnsygca8yOg7o/LKwu
	 7alO8EgqLWdro5i2MwNZkxQVGRXPU0NC+kG9ccR8=
Date: Mon, 21 Sep 2026 11:03:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
Cc: Frank Li <frank.li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 6/6] media: imx8-isi: Enable ISI RAW10/12/14 output
 LSB alignment
Message-ID: <20260921080305.GB1466037@killaraus.ideasonboard.com>
References: <20260831-isi_imx952-v2-0-fafdb4b446d4@oss.nxp.com>
 <20260831-isi_imx952-v2-6-fafdb4b446d4@oss.nxp.com>
 <20260915000520.GB2804748@killaraus.ideasonboard.com>
 <AMBPR04MB3355239002794E284C008FAFBFFABA2@AMBPR04MB335523.eurprd04.prod.outlook.com>
 <20260915122546.GD2796257@killaraus.ideasonboard.com>
 <AMBPR04MB335523823246285C19B5B96E09FA842@AMBPR04MB335523.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AMBPR04MB335523823246285C19B5B96E09FA842@AMBPR04MB335523.eurprd04.prod.outlook.com>

On Mon, Sep 21, 2026 at 03:12:04AM +0000, G.N. Zhou (OSS) wrote:
> On Tuesday, September 15, 2026 8:26 PM, Laurent Pinchart wrote:
> > On Tue, Sep 15, 2026 at 02:19:55AM +0000, G.N. Zhou (OSS) wrote:
> > > Hi Laurent,
> > >
> > > Thanks for your review.
> > >
> > > NXP Confidential
> >
> > Really ? :-)
> >
> > > On Tuesday, September 15, 2026 8:05 AM, Laurent Pinchart wrote:
> > > > On Mon, Aug 31, 2026 at 11:37:01AM +0800, Guoniu Zhou wrote:
> > > > > V4L2 requires RAW formats to be LSB-aligned (right-aligned).
> > > > > Before i.MX952, the ISI shifts RAW10/12/14 output left to MSB, so
> > > > > the driver works around this by using RAW16 format instead.
> > > > >
> > > > > The i.MX952 ISI introduces a RAW output LSB alignment bit. Enable
> > > > > it along with the input MSB alignment on platforms that support
> > > > > this feature, so that RAW10/12/14 output formats can be used
> > > > > directly without the RAW16 workaround.
> > > > >
> > > > > Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> > > > > ---
> > > > >  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  1 +
> > > > >  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  1 +
> > > > >  drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  | 39 ++++++++++++++++++++-
> > > > >  .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    |  3 ++
> > > > >  .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 40 +++++++++++----------
> > > > -
> > > > >  5 files changed, 63 insertions(+), 21 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > > > index d492631dfb6d..0f776fc8fd7e 100644
> > > > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > > > @@ -394,6 +394,7 @@ static const struct mxc_isi_plat_data mxc_imx952_data = {
> > > > >     .format_mask            = GENMASK(30, 24),
> > > > >     .buf_active_reverse     = true,
> > > > >     .has_36bit_dma          = true,
> > > > > +   .raw_out_lsb            = true,
> > > > >  };
> > > > >
> > > > >  /*
> > > > > -----------------------------------------------------------------------------
> > > > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > > > index 73f6ea7b0ea1..c352bcf8dc47 100644
> > > > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > > > @@ -166,6 +166,7 @@ struct mxc_isi_plat_data {
> > > > >     u32 format_mask;
> > > > >     bool buf_active_reverse;
> > > > >     bool has_36bit_dma;
> > > > > +   bool raw_out_lsb;
> > > >
> > > > As there's a single SoC that supports this, I would have used the
> > > > model field instead of adding a new boolean.
> > > >
> > > > >  };
> > > > >
> > > > >  struct mxc_isi_dma_buffer {
> > > > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> > > > > index 2405f7d33d0a..4838b445f279 100644
> > > > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> > > > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> > > > > @@ -308,6 +308,7 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
> > > > >                                     unsigned int vc,
> > > > >                                     bool bypass)  {
> > > > > +   const struct mxc_isi_plat_data *pdata = pipe->isi->pdata;
> > > > >     u32 val;
> > > > >
> > > > >     mutex_lock(&pipe->lock);
> > > > > @@ -357,6 +358,20 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
> > > > >                     val |= CHNL_CTRL_VC_ID_1(vc >> 2);
> > > > >     }
> > > > >
> > > > > +   if (pdata->raw_out_lsb) {
> > > > > +           /*
> > > > > +            * Enable RAW10/12/14 output LSB alignment to match the
> > > > > +            * V4L2 requirement that RAW formats are LSB-aligned.
> > > > > +            */
> > > > > +           val |= CHNL_CTRL_RAW_OUT_LSB_ALIGN;
> > > > > +
> > > > > +           /*
> > > > > +            * Align the data selection from pixel link to MSB to
> > > > > +            * avoid data shift since the data from PL is MSB.
> > > > > +            */
> > > > > +           val |= CHNL_CTRL_RAW_IN_MSB_ALIGN;
> > > > > +   }
> > > > > +
> > > > >     mxc_isi_write(pipe, CHNL_CTRL, val);
> > > > >
> > > > >     mutex_unlock(&pipe->lock);
> > > > > @@ -406,11 +421,19 @@ void mxc_isi_channel_set_input_format(struct mxc_isi_pipe *pipe,
> > > > >                   CHNL_IN_BUF_PITCH_LINE_PITCH(bpl));
> > > > >  }
> > > > >
> > > > > +static bool isi_out_raw(u32 format) {
> > > > > +   return format == CHNL_IMG_CTRL_FORMAT_RAW10 ||
> > > > > +          format == CHNL_IMG_CTRL_FORMAT_RAW12 ||
> > > > > +          format == CHNL_IMG_CTRL_FORMAT_RAW14; }
> > > > > +
> > > > >  void mxc_isi_channel_set_output_format(struct mxc_isi_pipe *pipe,
> > > > >                                    const struct mxc_isi_format_info *info,
> > > > >                                    struct v4l2_pix_format_mplane *format)  {
> > > > >     const struct mxc_isi_plat_data *pdata = pipe->isi->pdata;
> > > > > +   u32 fmt;
> > > > >     u32 val;
> > > > >
> > > > >     /* set outbuf format */
> > > > > @@ -418,7 +441,21 @@ void mxc_isi_channel_set_output_format(struct
> > > > > mxc_isi_pipe *pipe,
> > > > >
> > > > >     val = mxc_isi_read(pipe, CHNL_IMG_CTRL);
> > > > >     val &= ~pdata->format_mask;
> > > > > -   val |= CHNL_IMG_CTRL_FORMAT(info->isi_out_format);
> > > > > +
> > > > > +   /*
> > > > > +    * Before i.MX952, the ISI shifts the 10/12/14-bit formats left
> > > > > +    * by 6, 4 and 2 bits when using CHNL_IMG_CTRL_FORMAT_RAW10/12/14
> > > > > +    * respectively, to align the bits to the left and pad with zeros in
> > > > > +    * the LSBs. The corresponding V4L2 formats are however right-aligned,
> > > > > +    * we have to use CHNL_IMG_CTRL_FORMAT_RAW16 to avoid the left shift.
> > > > > +    * After i.MX952, ISI add RAW10/12/14 LSB output alignment, so skip
> > > > > +    * the above workaround.
> > > >
> > > > What happens on i.MX952 if you use CHNL_IMG_CTRL_FORMAT_RAW16 and
> > > > don't set CHNL_CTRL_RAW_OUT_LSB_ALIGN ? Won't that work, the same
> > > > way as on previous ISI versions ? If so we could use that workaround
> > > > on i.MX952 as well and avoid this complexity.
> > >
> > > Before i.MX95, on platforms such as i.MX8QXP/QM, i.MX8MN/MP and
> > > i.MX93, the gasket can provide LSB-aligned RAW10/12/14 data to the
> > > ISI. In that case, using
> > > CHNL_IMG_CTRL_FORMAT_RAW16 works as a workaround, as the ISI simply
> > > passes the pixel data through without performing the internal left
> > > shift, and the resulting memory layout matches the V4L2 RAW formats.
> > >
> > > Starting with i.MX95, the gasket has been replaced by the CSI
> > > formatter block. Unlike the previous gasket implementation, the CSI
> > > formatter always provides MSB-aligned
> > > RAW10/12/14 data to the ISI. When CHNL_IMG_CTRL_FORMAT_RAW16 is used
> > > on these SoCs, the data remains MSB-aligned in memory, which is not
> > > compatible with the right-aligned RAW formats expected by V4L2 userspace.
> > >
> > > To address this limitation, newer ISI versions (i.MX952 and later) add
> > > explicit output alignment control through CHNL_CTRL_RAW_OUT_LSB_ALIGN,
> > > allowing the ISI to generate LSB-aligned RAW10/12/14 output. This is
> > > the reason for the patch: it enables the hardware-supported alignment
> > > mode on i.MX952 instead of relying on the RAW16 workaround, which no
> > > longer produces V4L2-compatible output due to the CSI formatter behavior.
> >
> > How does it work on i.MX95 then ? Are all raw formats currently broken there ?
> 
> Yes, RAW10/12/14 formats are broken on i.MX95. Before i.MX95, the
> gasket provides LSB-aligned data to the ISI, so the RAW16 passthrough
> produces correct LSB-aligned output. Starting with i.MX95, the gasket
> is replaced by the CSI formatter which always provides MSB-aligned
> data, so the RAW16 passthrough outputs MSB-aligned data that doesn't
> match the V4L2 format definition.

That would have been useful information in the commit message.

I think you should first fix the i.MX95 problem, and add i.MX952 support
on top.

> > i.MX95 doesn't have CHNL_CTRL_RAW_OUT_LSB_ALIGN but it has
> > CHNL_CTRL_RAW_IN_MSB_ALIGN. Wouldn't it be enough to set
> > CHNL_CTRL_RAW_IN_MSB_ALIGN. on i.MX95 (and I suppose i.MX931 and
> > i.MX93) and i.MX952 without setting CHNL_CTRL_RAW_OUT_LSB_ALIGN, and
> > keep the current .isi_out_format workaround unconditionally ?
> 
> Unfortunately not. CHNL_CTRL_RAW_IN_MSB_ALIGN only affects how the
> ISI selects input data in RAW10/12/14 format modes — it controls
> whether the ISI selects the high bits or low bits from the pixel link
> bus as its input. It does not affect RAW16 mode, which is a pure
> passthrough.

If the pixel link always aligns data to the MSB, as you stated, does it
mean that not setting CHNL_CTRL_RAW_IN_MSB_ALIGN would always result in
dropping the MSBs of each pixel, essentially breaking ISI operation ?
What is the use case for making the CHNL_CTRL_RAW_IN_MSB_ALIGN bit
configurable if it must always be set for proper operation ?

> So the RAW16 workaround no longer works on i.MX95 since the input
> data from the CSI formatter is MSB-aligned. Should we filter out
> RAW10/12/14 formats on i.MX95 as a fix, or do you have a different
> approach in mind?

If i.MX95 can't produce the V4L2 RAW1[024] formats at all, then they
should be filtered out, yes.

> > > > > +    */
> > > > > +   fmt = !pdata->raw_out_lsb && isi_out_raw(info->isi_out_format) ?
> > > > > +         CHNL_IMG_CTRL_FORMAT_RAW16 :
> > > > > +         info->isi_out_format;
> > > > > +
> > > > > +   val |= CHNL_IMG_CTRL_FORMAT(fmt);
> > > > >     mxc_isi_write(pipe, CHNL_IMG_CTRL, val);
> > > > >
> > > > >     /* line pitch */
> > > > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> > > > > index 35dec3a650ac..c9c22a3668f9 100644
> > > > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> > > > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> > > > > @@ -20,6 +20,8 @@
> > > > >  #define CHNL_CTRL_CHAIN_BUF_NO_CHAIN                               0
> > > > >  #define CHNL_CTRL_CHAIN_BUF_2_CHAIN                                1
> > > > >  #define CHNL_CTRL_SW_RST                                           BIT(24)
> > > > > +#define CHNL_CTRL_RAW_OUT_LSB_ALIGN                                BIT(23) /* i.MX952 only */
> > > > > +#define CHNL_CTRL_RAW_IN_MSB_ALIGN                                 BIT(22) /* i.MX{91,93,95,952} only */
> > > > >  /*
> > > > >   * CHNL_CTRL_BLANK_PXL: i.MX8{QM,QXP} only
> > > > >   * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX{95,952} only
> > > > @@ -88,6 +90,7 @@
> > > > >  #define CHNL_IMG_CTRL_FORMAT_YUV420_3P10P                  0x3a
> > > > >  #define CHNL_IMG_CTRL_FORMAT_YUV420_2P12                   0x3d
> > > > >  #define CHNL_IMG_CTRL_FORMAT_YUV420_3P12                   0x3e
> > > > > +#define CHNL_IMG_CTRL_FORMAT_RAW14                         0x41
> > > >       /* i.MX{8ULP,91,93,95,952} only */
> > > >
> > > > This is documented as available on i.MX{8ULP,91,93,95,952}, but the
> > > > format will only be used on i.MX952.
> > > >
> > > > >  #define CHNL_IMG_CTRL_GBL_ALPHA_VAL(n)                             ((n) << 16)
> > > > >  #define CHNL_IMG_CTRL_GBL_ALPHA_VAL_MASK                           GENMASK(23, 16)
> > > > >  #define CHNL_IMG_CTRL_GBL_ALPHA_EN                                 BIT(15)
> > > > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c> b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > > > > index f45c2aae59ce..9a6a8302774c 100644
> > > > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > > > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > > > > @@ -221,11 +221,11 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
> > > > >     /*
> > > > >      * RAW formats
> > > > >      *
> > > > > -    * The ISI shifts the 10-bit and 12-bit formats left by 6 and 4 bits
> > > > > -    * when using CHNL_IMG_CTRL_FORMAT_RAW10 or MXC_ISI_OUT_FMT_RAW12
> > > > > -    * respectively, to align the bits to the left and pad with zeros in
> > > > > -    * the LSBs. The corresponding V4L2 formats are however right-aligned,
> > > > > -    * we have to use CHNL_IMG_CTRL_FORMAT_RAW16 to avoid the left shift.
> > > > > +    * The format entries use the native RAW10/12/14 ISI format codes.
> > > > > +    * On platforms without hardware LSB alignment, the driver
> > > > > +    * substitutes RAW16 at runtime in
> > > > > +    * mxc_isi_channel_set_output_format() to avoid the left shift
> > > > > +    * that the ISI applies to RAW10/12/14 output.
> > > > >      */
> > > > >     {
> > > > >             .mbus_code      = MEDIA_BUS_FMT_Y8_1X8,
> > > > > @@ -240,7 +240,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
> > > > >             .mbus_code      = MEDIA_BUS_FMT_Y10_1X10,
> > > > >             .fourcc         = V4L2_PIX_FMT_Y10,
> > > > >             .type           = MXC_ISI_VIDEO_CAP,
> > > > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW10,
> > > > >             .mem_planes     = 1,
> > > > >             .color_planes   = 1,
> > > > >             .depth          = { 16 },
> > > > > @@ -249,7 +249,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
> > > > >             .mbus_code      = MEDIA_BUS_FMT_Y12_1X12,
> > > > >             .fourcc         = V4L2_PIX_FMT_Y12,
> > > > >             .type           = MXC_ISI_VIDEO_CAP,
> > > > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW12,
> > > > >             .mem_planes     = 1,
> > > > >             .color_planes   = 1,
> > > > >             .depth          = { 16 },
> > > > > @@ -258,7 +258,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
> > > > >             .mbus_code      = MEDIA_BUS_FMT_Y14_1X14,
> > > > >             .fourcc         = V4L2_PIX_FMT_Y14,
> > > > >             .type           = MXC_ISI_VIDEO_CAP,
> > > > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW14,
> > > > >             .mem_planes     = 1,
> > > > >             .color_planes   = 1,
> > > > >             .depth          = { 16 },
> > > > > @@ -312,7 +312,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
> > > > >             .mbus_code      = MEDIA_BUS_FMT_SBGGR10_1X10,
> > > > >             .fourcc         = V4L2_PIX_FMT_SBGGR10,
> > > > >             .type           = MXC_ISI_VIDEO_CAP,
> > > > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW10,
> > > > >             .mem_planes     = 1,
> > > > >             .color_planes   = 1,
> > > > >             .depth          = { 16 },
> > > > > @@ -321,7 +321,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
> > > > >             .mbus_code      = MEDIA_BUS_FMT_SGBRG10_1X10,
> > > > >             .fourcc         = V4L2_PIX_FMT_SGBRG10,
> > > > >             .type           = MXC_ISI_VIDEO_CAP,
> > > > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW10,
> > > > >             .mem_planes     = 1,
> > > > >             .color_planes   = 1,
> > > > >             .depth          = { 16 },
> > > > > @@ -330,7 +330,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
> > > > >             .mbus_code      = MEDIA_BUS_FMT_SGRBG10_1X10,
> > > > >             .fourcc         = V4L2_PIX_FMT_SGRBG10,
> > > > >             .type           = MXC_ISI_VIDEO_CAP,
> > > > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW10,
> > > > >             .mem_planes     = 1,
> > > > >             .color_planes   = 1,
> > > > >             .depth          = { 16 },
> > > > > @@ -339,7 +339,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
> > > > >             .mbus_code      = MEDIA_BUS_FMT_SRGGB10_1X10,
> > > > >             .fourcc         = V4L2_PIX_FMT_SRGGB10,
> > > > >             .type           = MXC_ISI_VIDEO_CAP,
> > > > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW10,
> > > > >             .mem_planes     = 1,
> > > > >             .color_planes   = 1,
> > > > >             .depth          = { 16 },
> > > > > @@ -348,7 +348,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
> > > > >             .mbus_code      = MEDIA_BUS_FMT_SBGGR12_1X12,
> > > > >             .fourcc         = V4L2_PIX_FMT_SBGGR12,
> > > > >             .type           = MXC_ISI_VIDEO_CAP,
> > > > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW12,
> > > > >             .mem_planes     = 1,
> > > > >             .color_planes   = 1,
> > > > >             .depth          = { 16 },
> > > > > @@ -357,7 +357,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
> > > > >             .mbus_code      = MEDIA_BUS_FMT_SGBRG12_1X12,
> > > > >             .fourcc         = V4L2_PIX_FMT_SGBRG12,
> > > > >             .type           = MXC_ISI_VIDEO_CAP,
> > > > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW12,
> > > > >             .mem_planes     = 1,
> > > > >             .color_planes   = 1,
> > > > >             .depth          = { 16 },
> > > > > @@ -366,7 +366,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
> > > > >             .mbus_code      = MEDIA_BUS_FMT_SGRBG12_1X12,
> > > > >             .fourcc         = V4L2_PIX_FMT_SGRBG12,
> > > > >             .type           = MXC_ISI_VIDEO_CAP,
> > > > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW12,
> > > > >             .mem_planes     = 1,
> > > > >             .color_planes   = 1,
> > > > >             .depth          = { 16 },
> > > > > @@ -375,7 +375,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
> > > > >             .mbus_code      = MEDIA_BUS_FMT_SRGGB12_1X12,
> > > > >             .fourcc         = V4L2_PIX_FMT_SRGGB12,
> > > > >             .type           = MXC_ISI_VIDEO_CAP,
> > > > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW12,
> > > > >             .mem_planes     = 1,
> > > > >             .color_planes   = 1,
> > > > >             .depth          = { 16 },
> > > > > @@ -384,7 +384,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
> > > > >             .mbus_code      = MEDIA_BUS_FMT_SBGGR14_1X14,
> > > > >             .fourcc         = V4L2_PIX_FMT_SBGGR14,
> > > > >             .type           = MXC_ISI_VIDEO_CAP,
> > > > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW14,
> > > > >             .mem_planes     = 1,
> > > > >             .color_planes   = 1,
> > > > >             .depth          = { 16 },
> > > > > @@ -393,7 +393,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
> > > > >             .mbus_code      = MEDIA_BUS_FMT_SGBRG14_1X14,
> > > > >             .fourcc         = V4L2_PIX_FMT_SGBRG14,
> > > > >             .type           = MXC_ISI_VIDEO_CAP,
> > > > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW14,
> > > > >             .mem_planes     = 1,
> > > > >             .color_planes   = 1,
> > > > >             .depth          = { 16 },
> > > > > @@ -402,7 +402,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
> > > > >             .mbus_code      = MEDIA_BUS_FMT_SGRBG14_1X14,
> > > > >             .fourcc         = V4L2_PIX_FMT_SGRBG14,
> > > > >             .type           = MXC_ISI_VIDEO_CAP,
> > > > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW14,
> > > > >             .mem_planes     = 1,
> > > > >             .color_planes   = 1,
> > > > >             .depth          = { 16 },
> > > > > @@ -411,7 +411,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
> > > > >             .mbus_code      = MEDIA_BUS_FMT_SRGGB14_1X14,
> > > > >             .fourcc         = V4L2_PIX_FMT_SRGGB14,
> > > > >             .type           = MXC_ISI_VIDEO_CAP,
> > > > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW14,
> > > > >             .mem_planes     = 1,
> > > > >             .color_planes   = 1,
> > > > >             .depth          = { 16 },

-- 
Regards,

Laurent Pinchart
