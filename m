Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7F15111AE;
	Wed, 30 Sep 2026 16:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790786060; cv=none; b=gAJcWBHvjepULPGubpmUKSzVrEVXG+xHga7XJS6kqtTsnUP3CfpA+CPFDLp0aL+KNeRxygUrwI9ncmLRIx3YjSSi76Hpohga8vXE8yuysyBDkRe62iCjpVxW/BQv2qndhlRtWtqtQzPGZaHZBYk5YoU+jo45zVzvuFpSo8rmYlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790786060; c=relaxed/simple;
	bh=y7ren6IejrkeCk5hmF7Uf7yQg3KfB/xaQjsCfj4NnNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pi2Jb4c42Br/pmU1kj+Hv3bgff44lBET364SvxhJZQJhhUpc5G5mA89eBUx2fLaW17Sz9vRIuWP1TaedmdfKDvKAdkK43e30SUJiYFNYQvo8Nx4F+lOO30awd3VirLIa3ht6KLDtkIMalmNezeezeH34rX614QnRd5DyIovZOBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UrUu+oC+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UrUu+oC+"
Received: from ideasonboard.com (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C224E493;
	Wed, 30 Sep 2026 18:32:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790785943;
	bh=y7ren6IejrkeCk5hmF7Uf7yQg3KfB/xaQjsCfj4NnNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UrUu+oC+2QfHTQgLS5xQildIvPFEyJy6+8cdCLTLxb9eIASJm2KkTztqbsXLw1X/Q
	 jjo3Z+sKXgD6sGy6It5Xy1G0H/13W21JjHQOSzQ82PfyXrLibsbe8uf19gEZCVBrs3
	 Dl7inGRK518RWQg9cEZUPTGosFH7G255YiMWM35I=
Date: Wed, 30 Sep 2026 18:34:12 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	"jai.luthra" <jai.luthra@ideasonboard.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Philippe Baetens <philippebaetens@gmail.com>
Subject: Re: [PATCH v5 2/2] media: i2c: mira016: Add driver for Mira016
Message-ID: <ar03QZc3wVMKy8F8@zed>
References: <20260930-mira016-v5-0-499a34ab8204@ideasonboard.com>
 <20260930-mira016-v5-2-499a34ab8204@ideasonboard.com>
 <PN3P287MB1829832B0C6C42441B18D9D18B8B2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3P287MB1829832B0C6C42441B18D9D18B8B2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>

Hi Tarang,
  thanks for the review

On Wed, Sep 30, 2026 at 01:47:22PM +0000, Tarang Raval wrote:
> Hi Jacopo,
>
> I noticed a few issues. Could you please check the comments below?
>
> > Add driver for the ams OSRAM Mira016 sensor.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  MAINTAINERS                 |    1 +
> >  drivers/media/i2c/Kconfig   |   12 +
> >  drivers/media/i2c/Makefile  |    1 +
> >  drivers/media/i2c/mira016.c | 2309 +++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 2323 insertions(+)
>
> ...
>
> > +/* Register select. */
> > +#define MIRA016_BANK_SEL_REG           CCI_REG8(0xe000)
> > +#define MIRA016_ACTIVE_CONTEXT_REG     CCI_REG8(0x4002)
> > +#define MIRA016_NEXT_ACTIVE_CONTEXT_REG        CCI_REG8(0xe003)
> > +#define MIRA016_RW_CONTEXT_REG         CCI_REG8(0xe004)
> > +#define MIRA016_AUTO_SWITCH_CONTEXT_REG        CCI_REG8(0xe005)
> > +#define MIRA016_PARAM_HOLD_REG         CCI_REG8(0x0006)
> > +#define MIRA016_DISABLE_CONTEXTSYNC_REG        CCI_REG8(0xe008)
> > +#define MIRA016_DISABLE_CONTEXTSYNC    BIT(0)
> > +#define MIRA016_CMD_REQ_1_REG          CCI_REG8(0x000a)
> > +#define MIRA016_CMD_HALT_BLOCK_REG     CCI_REG8(0x000c)
>
> A few of these macros are unused. Can we remove them?
>

Will do

> > +
> > +/* Chip id */
> > +#define MIRA016_CHIP_ID_REG            CCI_REG8(0x011B)
> > +#define MIRA016_CHIP_ID                        33
>
> ...
>
> > +static const struct cci_reg_sequence mira016_8b_fine_gain_init[] = {
> > +     { CCI_REG8(0xe000), 0x0 },
> > +     { CCI_REG8(0x01bb), 0xb4 },
> ...
> > +     { CCI_REG8(0xe000), 0x1 },
> > +     { CCI_REG8(0xe000), 0x1 },
> > +     { CCI_REG8(0xe024), 0x3 },
> > +     { CCI_REG8(0xe000), 0x0 },
> > +     { CCI_REG8(0xe000), 0x0 },
> > +     { CCI_REG8(0xe000), 0x0 },
> > +     { CCI_REG8(0x005c), 0x0 },
> > +     { CCI_REG8(0x005d), 0x18 },
> > +     { CCI_REG8(0xe000), 0x0 },
> > +};
>
> I noticed some registers are written multiple times within each
> of these arrays. Are all the repeated writes required, or can
> the redundant ones be removed?

Good question.

I've broken out almost all documented parts from the register
sequences, which are generated by a vendor provided too.

I'm not sure I would dare to modify them to be honest. Also, if
anything have to be updated, comparing the sequences here with the
generated one will be easier.

>
> Like for the above array 0xe000 register.

0xe000 is repeated multiple times because it's the register that
selects which bank to write to (there are 2 registers banks on this
sensor)

>
> > +static void mira016_update_pad_format(struct mira016 *mira016,
> > +                                     struct v4l2_mbus_framefmt *fmt, u32 code)
>
> third argument is unused. Can we remove it?
>

Ah yes, sure

> > +{
> > +       unsigned int i;
> > +
> > +       for (i = 0; i < ARRAY_SIZE(mira016_mbus_formats); ++i) {
> > +               if (mira016_mbus_formats[i] == fmt->code)
> > +                       break;
> > +       }
> > +       if (i == ARRAY_SIZE(mira016_mbus_formats))
> > +               fmt->code = mira016_mbus_formats[0];
> > +
> > +       fmt->width = MIRA016_PIXEL_ARRAY_WIDTH;
> > +       fmt->height = MIRA016_PIXEL_ARRAY_HEIGHT;
> > +       fmt->field = V4L2_FIELD_NONE;
> > +       fmt->colorspace = V4L2_COLORSPACE_RAW;
> > +       fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
> > +       fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> > +       fmt->xfer_func = V4L2_XFER_FUNC_NONE;
> > +}
>
> ...
>
> > +static int mira016_set_pad_format(struct v4l2_subdev *sd,
> > +                                 const struct v4l2_subdev_client_info *ci,
> > +                                 struct v4l2_subdev_state *state,
> > +                                 struct v4l2_subdev_format *fmt)
> > +{
> > +       struct mira016 *mira016 = to_mira016(sd);
> > +       struct v4l2_rect *crop;
> > +       u32 pixel_rate;
> > +       u32 min_vblank;
> > +       u32 gain_max;
> > +       int ret;
> > +
> > +       mira016_update_pad_format(mira016, &fmt->format, fmt->format.code);
> > +       *v4l2_subdev_state_get_format(state, 0) = fmt->format;
> > +
> > +       crop = v4l2_subdev_state_get_crop(state, 0);
> > +       crop->width = fmt->format.width;
> > +       crop->height = fmt->format.height;
> > +       crop->left = MIRA016_PIXEL_ARRAY_LEFT;
> > +       crop->top = MIRA016_PIXEL_ARRAY_TOP;
> > +
> > +       if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> > +               return 0;
> > +
> > +       /*
> > +        * Update the row length: changing the image format implies changing the
> > +        * row_length parameter, which changes the line duration and the pixel
> > +        * rate consequentially. Also, changing the image format changes the
> > +        * analogue gain limits.
> > +        *
> > +        * Do not allow to change image format while the subdevice is streaming.
> > +        *
> > +        * TODO: row length depends on binning, update it also in the
> > +        * implementation of set_selection.
> > +        */
> > +       if (v4l2_subdev_is_streaming(sd))
> > +               return -EBUSY;
>
> State is overwritten before the streaming check, so a failed call
> with -EBUSY still changes the active format.
>
> Should we move this check to the top of the function and only check
> it for V4L2_SUBDEV_FORMAT_ACTIVE?

mmm, you're probably right, if we can't get past this for (ACTIVE &&
streaming) we shouldn't probably update the format in the state at
all.

The expectations are not 100% clear in case of EBUSY here
https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-subdev-g-fmt.html

but I think what you suggest makes sense

>
> > +
> > +       switch (fmt->format.code) {
> > +       case MEDIA_BUS_FMT_Y8_1X8:
> > +               gain_max = ARRAY_SIZE(mira016_gain_lut_8bit);
> > +               break;
> > +       case MEDIA_BUS_FMT_Y10_1X10:
> > +               gain_max = ARRAY_SIZE(mira016_gain_lut_10bit);
> > +               break;
> > +       case MEDIA_BUS_FMT_Y12_1X12:
> > +       default:
> > +               /*
> > +                * TODO: Clarify how to handle 12 bit 2x fixed gain which
> > +                * changes the line timings while streaming. Only allow 1x
> > +                * for the time being.
> > +                */
> > +               gain_max = 1;
> > +               break;
> > +       }
> > +
> > +       ret = __v4l2_ctrl_modify_range(mira016->gain, 1, gain_max, 1, 1);
> > +       if (ret)
> > +               return ret;
> > +
> > +       mira016_calc_row_length(mira016, state);
> > +
> > +       min_vblank = mira016_calc_min_vblank(mira016, crop->height);
> > +       ret = __v4l2_ctrl_modify_range(mira016->vblank, min_vblank,
> > +                                      MIRA016_MAX_VBLANK, 1, min_vblank);
> > +       if (ret)
> > +               return ret;
> > +
> > +       pixel_rate = mira016_calc_prate(mira016, crop->width);
> > +
> > +       return __v4l2_ctrl_modify_range(mira016->prate, pixel_rate, pixel_rate,
> > +                                       1, pixel_rate);
> > +}
> > +
> > +                                 u64 streams_mask)
> > +{
> > +       struct mira016 *mira016 = to_mira016(sd);
> > +       struct i2c_client *client = v4l2_get_subdevdata(&mira016->sd);
>
> We can use mira016->dev directly instead &client->dev.
>
> > +       int ret;
>
> ...
>
> > +static int mira016_disable_streams(struct v4l2_subdev *sd,
> > +                                  struct v4l2_subdev_state *state, u32 pad,
> > +                                  u64 streams_mask)
> > +{
> > +       struct mira016 *mira016 = to_mira016(sd);
> > +       struct i2c_client *client = v4l2_get_subdevdata(&mira016->sd);
>
> same here.
>

ack

> > +
>
> ...
>
> > +static int mira016_init_state(struct v4l2_subdev *sd,
> > +                             struct v4l2_subdev_state *state)
> > +{
> > +       struct v4l2_subdev_format fmt = {
> > +               .which = V4L2_SUBDEV_FORMAT_TRY,
> > +               .pad = 0,
> > +               .format = {
> > +                       .code = MEDIA_BUS_FMT_Y8_1X8,
> > +                       .width = MIRA016_PIXEL_ARRAY_WIDTH,
> > +                       .height = MIRA016_PIXEL_ARRAY_HEIGHT
> > +               },
> > +       };
> > +
> > +       mira016_set_pad_format(sd, NULL, state, &fmt);
> > +
> > +       return 0;
>
> You can directly return the result of
> mira016_set_pad_format() here.
>

True

> > +}
>
> ...
>
> > +static int mira016_set_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +       struct mira016 *mira016 =
> > +               container_of(ctrl->handler, struct mira016, ctrl_handler);
> > +       struct i2c_client *client = v4l2_get_subdevdata(&mira016->sd);
>
> we can use mira016->dev directly instead &client->dev.
>
> > +       struct v4l2_subdev_state *state;
> > +       struct v4l2_rect *crop;
> > +       int ret = 0;
> > +
> > +       state = v4l2_subdev_get_locked_active_state(&mira016->sd);
> > +       crop = v4l2_subdev_state_get_crop(state, 0);
> > +
> > +       if (ctrl->id == V4L2_CID_VBLANK) {
> > +               s32 exposure_max = crop->height + ctrl->val
> > +                                - MIRA016_FRAME_INTEGRATION_DIFF;
> > +               s32 exposure_def = min(exposure_max,
> > +                                      mira016->exposure->val);
> > +
> > +               ret = __v4l2_ctrl_modify_range(mira016->exposure,
> > +                                              mira016->exposure->minimum,
> > +                                              exposure_max,
> > +                                              mira016->exposure->step,
> > +                                              exposure_def);
> > +               if (ret)
> > +                       return ret;
> > +       }
> > +
> > +       if (!pm_runtime_get_if_in_use(&client->dev))
> > +               return 0;
> > +
> > +       switch (ctrl->id) {
> > +       case V4L2_CID_EXPOSURE:
> > +               ret = mira016_write_exposure_reg(mira016, ctrl->val);
> > +               break;
> > +       case V4L2_CID_VBLANK:
> > +               ret = mira016_write_frame_duration_reg(mira016, state, ctrl->val);
> > +               break;
> > +       case V4L2_CID_ANALOGUE_GAIN:
> > +               ret = mira016_write_analogue_gain(mira016, state, ctrl->val);
> > +               break;
>
> Why do you not introduce vflip and hflip controls here?
>

If you see the control initialization there is a comment about that
	/*
	 * Changing VFLIP requires re-programming the top point, hence we
	 * program flips along with the ROI windows at enable_streams time. As
	 * we grab the flip controls there, there's no need to handle the two
	 * controls while streaming.
	 */
	mira016->hflip = v4l2_ctrl_new_std(ctrl_hdlr, NULL,
					   V4L2_CID_HFLIP, 0, 1, 1, 0);

	mira016->vflip = v4l2_ctrl_new_std(ctrl_hdlr, NULL,
					   V4L2_CID_VFLIP, 0, 1, 1, 0);

So we can't change flips at runtime but flips are only programmed at
streaming time as part of the mira016_configure_roi() function


> > +       default:
> > +               ret = -EINVAL;
> > +               break;
> > +       }
> > +
> > +       pm_runtime_put_autosuspend(&client->dev);
> > +
> > +       return ret;
> > +}
>
> ...
>
> > +static int mira016_init_controls(struct mira016 *mira016)
> > +{
> > +       struct i2c_client *client = v4l2_get_subdevdata(&mira016->sd);
>
> we can use mira016->dev directly.
>
> > +       struct v4l2_fwnode_device_properties props;
> > +       struct v4l2_ctrl_handler *ctrl_hdlr;
> > +       struct v4l2_ctrl *link_freq;
> > +       struct v4l2_ctrl *hblank;
> > +       u32 min_exposure_lines;
> > +       u32 def_exposure;
> > +       u32 min_vblank;
> > +       u32 def_vblank;
> > +       u32 pixel_rate;
> > +       int ret;
> > +
>
> ...
>
> > +static u8 mira016_m_to_pll_m(u32 pll_m)
> > +{
> > +       /* Table 12: Lookup table for “M to PLL_DIV_M” mapping */
> > +       static const struct pll_m_div {
> > +               u8 m_min;
> > +               u8 m_max;
> > +               u8 pll_m_min;
> > +               u8 pll_m_max;
> > +       } pll_m_lut[] = {
> > +               { 16, 31, 224, 239 }, { 32, 63, 192, 233 },
>
> I’m not sure, but I think 233 might be a typo and should be 223,
> Since the m range and PLL code range don’t match.
>

good good spot, thansk!


> > +               { 64, 127, 128, 191 }, { 1285, 0, 127 },
> > +       };
> > +
> > +       for (unsigned int i = 0; i < ARRAY_SIZE(pll_m_lut); ++i) {
> > +               const struct pll_m_div *p = &pll_m_lut[i];
> > +
> > +               if (pll_m > p->m_max)
> > +                       continue;
> > +
> > +               return p->pll_m_min + pll_m - p->m_min;
> > +       }
> > +
> > +       return 0;
> > +}
>
> ...
>
> > +               for (m = MIRA016_PLL_M_MIN; m < MIRA016_PLL_M_MAX; ++m) {
> > +                       u32 pll2 = pll1 * m;
> > +
> > +                       if (pll2 < MIRA016_PLL_PLL2_MIN ||
> > +                           pll2 > MIRA016_PLL_PLL2_MAX)
> > +                               continue;
> > +
> > +                       if (pll2 == target_mbps) {
> > +                               found = true;
> > +                               break;
> > +                       }
> > +
> > +                       if (abs(pll2 - target_mbps) < best) {
>
> Since these are unsigned int values, it would be better to use
> abs_diff() instead of abs() here.
>

I'll check!

> > +                               n_best = n;
> > +                               m_best = m;
> > +                               best = abs(pll2 - target_mbps);
> > +                       }
> > +               }
> > +               if (found)
> > +                       break;
> > +       }
>
> ...
>
> > +static int mira016_get_regulators(struct mira016 *mira016)
> > +{
> > +       struct i2c_client *client = v4l2_get_subdevdata(&mira016->sd);
>
> We can remove this as well.
>
> > +       for (unsigned int i = 0; i < ARRAY_SIZE(mira016_supplies); i++)
> > +               mira016->supplies[i].supply = mira016_supplies[i];
> > +
> > +       return devm_regulator_bulk_get(&client->dev,
> > +                                      ARRAY_SIZE(mira016_supplies),
> > +                                      mira016->supplies);
> > +}
> > +
>
> ...
>
> > +static int mira016_probe(struct i2c_client *client)
> > +{
> > +       struct device *dev = &client->dev;
> > +       struct mira016 *mira016;
> > +       int ret;
> > +
> > +       mira016 = devm_kzalloc(&client->dev, sizeof(*mira016), GFP_KERNEL);
> > +       if (!mira016)
> > +               return -ENOMEM;
> > +
> > +       mira016->dev = &client->dev;
> > +
> > +       ret = mira016_parse_endpoint(dev, mira016);
> > +       if (ret)
> > +               return ret;
> > +
> > +       v4l2_i2c_subdev_init(&mira016->sd, client, &mira016_subdev_ops);
> > +
> > +       mira016->regmap = devm_cci_regmap_init_i2c(client, 16);
> > +       if (IS_ERR(mira016->regmap))
> > +               return dev_err_probe(dev, PTR_ERR(mira016->regmap),
> > +                                    "failed to initialize CCI\n");
> > +
> > +       mira016->xclk = devm_v4l2_sensor_clk_get(dev, NULL);
> > +       if (IS_ERR(mira016->xclk))
> > +               return dev_err_probe(dev, PTR_ERR(mira016->xclk),
> > +                                    "failed to get xclk\n");
> > +
> > +       mira016->xclk_freq = clk_get_rate(mira016->xclk);
> > +       if (mira016_validate_xclk_freq(mira016)) {
> > +               dev_err(dev, "xclk frequency not supported: %d Hz\n",
>
> Please use dev_err_probe.

What would it give me though ? I know the return value is EINVAL, it
won't save nothing, doesn't it ?

>
> > +                       mira016->xclk_freq);
> > +               return -EINVAL;
> > +       }
> > +
> > +       ret = mira016_get_regulators(mira016);
> > +       if (ret)
> > +               return dev_err_probe(dev, ret, "failed to get regulators\n");
> > +
> > +       mira016->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> > +                                                     GPIOD_OUT_HIGH);
> > +       if (IS_ERR(mira016->reset_gpio))
> > +               return dev_err_probe(dev, PTR_ERR(mira016->reset_gpio),
> > +                                    "failed to get reset gpio\n");
> > +
> > +       /*
> > +        * Calculate the PLL configuration based on the link frequency
> > +        * selected by .dts and compute the sensor timing bases.
> > +        *
> > +        * Initialize row_length to a value matching the default format for
> > +        * exposure and frame time limits calculations.
> > +        */
> > +       mira016_pll_calc(mira016);
> > +       mira016_timings_calc(mira016);
> > +       mira016->timings.row_length = 1262;
>
> 1262 doesn’t match any of the supported formats. Is this a typo?
> Should it be 1062 instead?

Harmless, but clearly a leftover from my early attempts.
Thanks for spotting!

>
> > +
> > +       ret = mira016_power_on(dev);
> > +       if (ret)
> > +               return ret;
> > +
> > +       /* Enable runtime PM and power on the device */
> > +       pm_runtime_set_active(dev);
> > +       pm_runtime_enable(dev);
> > +
> > +       ret = mira016_identify_module(mira016);
> > +       if (ret)
> > +               goto error_power_off;
> > +
> > +       ret = mira016_init_controls(mira016);
> > +       if (ret)
> > +               goto error_power_off;
> > +
> > +       /* Initialize subdev */
> > +       mira016->sd.internal_ops = &mira016_internal_ops;
> > +       mira016->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +       mira016->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > +
> > +       /* Initialize source pads */
> > +       mira016->pad.flags = MEDIA_PAD_FL_SOURCE;
> > +
> > +       ret = media_entity_pads_init(&mira016->sd.entity, 1, &mira016->pad);
> > +       if (ret) {
> > +               dev_err_probe(dev, ret, "failed to init entity pads\n");
> > +               goto error_handler_free;
> > +       }
> > +
> > +       mira016->sd.state_lock = mira016->ctrl_handler.lock;
> > +       ret = v4l2_subdev_init_finalize(&mira016->sd);
> > +       if (ret < 0) {
> > +               dev_err_probe(dev, ret, "subdev init error\n");
> > +               goto error_media_entity;
> > +       }
> > +
> > +       ret = v4l2_async_register_subdev_sensor(&mira016->sd);
> > +       if (ret < 0) {
> > +               dev_err_probe(dev, ret,
> > +                             "failed to register sensor sub-device\n");
> > +               goto error_subdev_cleanup;
> > +       }
> > +
> > +       pm_runtime_set_autosuspend_delay(dev, 1000);
> > +       pm_runtime_use_autosuspend(dev);
> > +       pm_runtime_idle(dev);
> > +
> > +       return 0;
> > +
> > +error_subdev_cleanup:
> > +       v4l2_subdev_cleanup(&mira016->sd);
> > +error_media_entity:
> > +       media_entity_cleanup(&mira016->sd.entity);
> > +error_handler_free:
> > +       v4l2_ctrl_handler_free(mira016->sd.ctrl_handler);
> > +error_power_off:
> > +       pm_runtime_disable(dev);
> > +       if (!pm_runtime_status_suspended(&client->dev))
>
> Could we use dev here as well, just for consistency?
>

Sure

Thanks for the review!

> > +               mira016_power_off(dev);
> > +       pm_runtime_set_suspended(dev);
> > +       return ret;
> > +}
> > +
>
> ...
>
> > +static const struct of_device_id mira016_dt_ids[] = {
> > +       { .compatible = "ams,mira016" },
> > +       { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, mira016_dt_ids);
> > +
> > +static struct i2c_driver mira016_i2c_driver = {
> > +       .driver = {
> > +               .name = "mira016",
> > +               .of_match_table = mira016_dt_ids,
> > +               .pm = pm_ptr(&mira016_pm_ops),
> > +       },
> > +       .probe = mira016_probe,
> > +       .remove = mira016_remove,
> > +};
> > +
> > +module_i2c_driver(mira016_i2c_driver);
> > +
> > +MODULE_AUTHOR("Jacopo Mondi <jacopo.mondi@ideasonboard.com>");
> > +MODULE_DESCRIPTION("ams OSRAM MIRA016 sensor driver");
> > +MODULE_LICENSE("GPL");
> >
> > --
> > 2.55.0
>
> Best Regards,
> Tarang
