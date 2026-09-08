Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800F352B1F3;
	Tue,  8 Sep 2026 11:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788866565; cv=none; b=PKjlC19AX3qtNXOOzty0VagTfOxHi+mhQ8Aocd+pZJn9xbO1NzHE//3nYuThyYR85gEuyjbnwbb3lf/J4ApthODbjkKm95l2vyCpiakJXbZsx9XldJ2hoEn3I4aWFlkn9zs4AgeGCLop64b6Hu3kjYaTLRX0RDwEmwA24RUsFxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788866565; c=relaxed/simple;
	bh=BcdxrgY//V/WdeUxNv6cA5tw/mDVQ/h7jimPEduMHOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ciLuydIMBo+UnV5vWJFxXNWFyCIzMlBH9bXJA8eHBC2QV+Ot8c93m/4h7Tazl6Y9SINOGv756vVnoC5gqPYOchRgEUVfXDiVKIQLyeN7XVkoDSSA+rvgUeZdhQQwDlcFhZwuT+D1bYJooU6+ZqwXZUmz+D/+QVtvXfXKCiXIqxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HopNdFno; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HopNdFno"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788866558; x=1820402558;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BcdxrgY//V/WdeUxNv6cA5tw/mDVQ/h7jimPEduMHOQ=;
  b=HopNdFnocCGYkGYDSl9jYGX6QIeQM/Unqrf27QiDIOf3OPY4GKr1PScF
   G25WZ1yuMMJUfou4UhVzAA0Yp3Rf8ysLgexJm5fcdFdz9OI9mzzDB+cl0
   qBd4VIZnFKJgQrwasYwoezk+GZPSDbbvBbchPDl1OAFBddDZELCF3KQBN
   lM9z8dMtNBhESdpuHe8TqmGF0VW2gEVx0Xe7HRuatiNzH9tYkJjR/jJDi
   i8pDvah+P7C7QX/cpFS4VMlJS/vIcsQ/iy2CJEoBroxrudsrHx+VYII8E
   Ry3rJDlwNZ80Na/6SWLVZCsV41PQKqTO2zYdXT/3l3VF3gXjp+ZNfdnrF
   Q==;
X-CSE-ConnectionGUID: U1Fw++FzTOqQONOvCtzCOw==
X-CSE-MsgGUID: WZxXzazrSm6oqr6V5Vd5Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="88415373"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="88415373"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 04:22:32 -0700
X-CSE-ConnectionGUID: +vo7IbCHR0iK5ixqVGPeiA==
X-CSE-MsgGUID: DAm55W9zRPm5JBvJ7IrZug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="267718984"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.120])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 04:22:29 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 08FCE11F7F5;
	Tue, 08 Sep 2026 14:22:32 +0300 (EEST)
Date: Tue, 8 Sep 2026 14:22:31 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/4] media: i2c: og0ve1b: Introduce per-sensor data
 structure
Message-ID: <ap_v94pUrTo1C1Go@kekkonen.localdomain>
References: <20260901-og0va1b-v6-0-a05b2d04c892@oss.qualcomm.com>
 <20260901-og0va1b-v6-3-a05b2d04c892@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-og0va1b-v6-3-a05b2d04c892@oss.qualcomm.com>

Hi Wenmeng,

On Tue, Sep 01, 2026 at 03:40:06PM +0800, Wenmeng Liu wrote:
> Refactor the driver to separate sensor-specific data from the common
> driver code. Introduce a sensor_data structure, populated through
> i2c_get_match_data(), to hold the chip ID, MCLK frequency, link
> frequencies and supported modes.
> 
> Test pattern programming is described by a per-sensor callback, and each
> mode stores its media bus format code (rather than a bits-per-pixel
> value) so that sensors with a different output format can be supported.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Tested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>  drivers/media/i2c/og0ve1b.c | 100 +++++++++++++++++++++++++++++++-------------
>  1 file changed, 72 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
> index da5c8e49d4a811f55736bd89c6922856f2e7391c..f560d5d90fda94abf4bc622c5e4f861b078b811f 100644
> --- a/drivers/media/i2c/og0ve1b.c
> +++ b/drivers/media/i2c/og0ve1b.c
> @@ -5,6 +5,7 @@
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
> +#include <linux/math64.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
> @@ -65,11 +66,23 @@ struct og0ve1b_mode {
>  	u32 height;	/* Frame height in pixels */
>  	u32 hts;	/* Horizontal timing size */
>  	u32 vts;	/* Default vertical timing size */
> -	u32 bpp;	/* Bits per pixel */
> +	u32 code;	/* MEDIA_BUS_FMT code */
>  
>  	const struct og0ve1b_reg_list reg_list;	/* Sensor register setting */
>  };
>  
> +struct og0ve1b;
> +
> +struct og0ve1b_sensor_data {
> +	u64 chip_id;

This one seems to be unused.

> +	unsigned long mclk_freq;
> +	int (*enable_test_pattern)(struct og0ve1b *og0ve1b, u32 pattern);
> +	const s64 *link_freq_menu;
> +	int num_link_freqs;
> +	const struct og0ve1b_mode *modes;
> +	int num_modes;
> +};
> +
>  static const char * const og0ve1b_test_pattern_menu[] = {
>  	"Disabled",
>  	"Standard Test Bar",
> @@ -99,6 +112,8 @@ struct og0ve1b {
>  
>  	/* Saved register value */
>  	u64 pre_isp;
> +
> +	const struct og0ve1b_sensor_data *data;
>  };
>  
>  static const struct cci_reg_sequence og0ve1b_640x480_120fps_mode[] = {
> @@ -247,13 +262,13 @@ static const struct cci_reg_sequence og0ve1b_640x480_120fps_mode[] = {
>  	{ CCI_REG8(0x3f47), 0x35 },
>  };
>  
> -static const struct og0ve1b_mode supported_modes[] = {
> +static const struct og0ve1b_mode og0ve1b_supported_modes[] = {
>  	{
>  		.width = 640,
>  		.height = 480,
>  		.hts = 792,
>  		.vts = 568,
> -		.bpp = 8,
> +		.code = MEDIA_BUS_FMT_Y8_1X8,
>  		.reg_list = {
>  			.regs = og0ve1b_640x480_120fps_mode,
>  			.num_regs = ARRAY_SIZE(og0ve1b_640x480_120fps_mode),
> @@ -273,11 +288,21 @@ static int og0ve1b_enable_test_pattern(struct og0ve1b *og0ve1b, u32 pattern)
>  	return cci_write(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP, val, NULL);
>  }
>  
> +static const struct og0ve1b_sensor_data og0ve1b_data = {
> +	.chip_id = OG0VE1B_CHIP_ID,
> +	.mclk_freq = OG0VE1B_MCLK_FREQ_24MHZ,
> +	.enable_test_pattern = og0ve1b_enable_test_pattern,
> +	.link_freq_menu = og0ve1b_link_freq_menu,
> +	.num_link_freqs = ARRAY_SIZE(og0ve1b_link_freq_menu),
> +	.modes = og0ve1b_supported_modes,
> +	.num_modes = ARRAY_SIZE(og0ve1b_supported_modes),
> +};
> +
>  static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct og0ve1b *og0ve1b = container_of(ctrl->handler, struct og0ve1b,
>  					       ctrl_handler);
> -	const struct og0ve1b_mode *mode = &supported_modes[0];
> +	const struct og0ve1b_mode *mode = &og0ve1b->data->modes[0];
>  	s64 exposure_max;
>  	int ret;
>  
> @@ -314,7 +339,7 @@ static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
>  				ctrl->val + mode->height, NULL);
>  		break;
>  	case V4L2_CID_TEST_PATTERN:
> -		ret = og0ve1b_enable_test_pattern(og0ve1b, ctrl->val);
> +		ret = og0ve1b->data->enable_test_pattern(og0ve1b, ctrl->val);
>  		break;
>  	default:
>  		ret = -EINVAL;
> @@ -330,10 +355,19 @@ static const struct v4l2_ctrl_ops og0ve1b_ctrl_ops = {
>  	.s_ctrl = og0ve1b_set_ctrl,
>  };
>  
> +static s64 og0ve1b_pixel_rate(const struct og0ve1b_sensor_data *data)
> +{
> +	const struct og0ve1b_mode *mode = &data->modes[0];
> +	unsigned int bpp = mode->code == MEDIA_BUS_FMT_Y8_1X8 ? 8 : 10;
> +
> +	return div_u64(data->link_freq_menu[0], bpp);
> +}
> +
>  static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
>  {
>  	struct v4l2_ctrl_handler *ctrl_hdlr = &og0ve1b->ctrl_handler;
> -	const struct og0ve1b_mode *mode = &supported_modes[0];
> +	const struct og0ve1b_mode *mode = &og0ve1b->data->modes[0];
> +	const struct og0ve1b_sensor_data *data = og0ve1b->data;
>  	s64 exposure_max, pixel_rate, h_blank, v_blank;
>  	struct v4l2_fwnode_device_properties props;
>  	struct v4l2_ctrl *ctrl;
> @@ -343,12 +377,12 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
>  
>  	ctrl = v4l2_ctrl_new_int_menu(ctrl_hdlr, &og0ve1b_ctrl_ops,
>  				      V4L2_CID_LINK_FREQ,
> -				      ARRAY_SIZE(og0ve1b_link_freq_menu) - 1,
> -				      0, og0ve1b_link_freq_menu);
> +				      data->num_link_freqs - 1,
> +				      0, data->link_freq_menu);
>  	if (ctrl)
>  		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  
> -	pixel_rate = og0ve1b_link_freq_menu[0] / mode->bpp;
> +	pixel_rate = og0ve1b_pixel_rate(data);
>  	v4l2_ctrl_new_std(ctrl_hdlr, &og0ve1b_ctrl_ops, V4L2_CID_PIXEL_RATE,
>  			  0, pixel_rate, 1, pixel_rate);
>  
> @@ -407,7 +441,7 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
>  static void og0ve1b_update_pad_format(const struct og0ve1b_mode *mode,
>  				      struct v4l2_mbus_framefmt *fmt)
>  {
> -	fmt->code = MEDIA_BUS_FMT_Y8_1X8;
> +	fmt->code = mode->code;
>  	fmt->width = mode->width;
>  	fmt->height = mode->height;
>  	fmt->field = V4L2_FIELD_NONE;
> @@ -421,8 +455,8 @@ static int og0ve1b_enable_streams(struct v4l2_subdev *sd,
>  				  struct v4l2_subdev_state *state, u32 pad,
>  				  u64 streams_mask)
>  {
> -	const struct og0ve1b_reg_list *reg_list = &supported_modes[0].reg_list;
>  	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
> +	const struct og0ve1b_reg_list *reg_list = &og0ve1b->data->modes[0].reg_list;
>  	int ret;
>  
>  	ret = pm_runtime_resume_and_get(og0ve1b->dev);
> @@ -484,13 +518,14 @@ static int og0ve1b_set_pad_format(struct v4l2_subdev *sd,
>  				  struct v4l2_subdev_state *state,
>  				  struct v4l2_subdev_format *fmt)
>  {
> +	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
>  	struct v4l2_mbus_framefmt *format;
>  	const struct og0ve1b_mode *mode;
>  
>  	format = v4l2_subdev_state_get_format(state, 0);
>  
> -	mode = v4l2_find_nearest_size(supported_modes,
> -				      ARRAY_SIZE(supported_modes),
> +	mode = v4l2_find_nearest_size(og0ve1b->data->modes,
> +				      og0ve1b->data->num_modes,
>  				      width, height,
>  				      fmt->format.width,
>  				      fmt->format.height);
> @@ -505,10 +540,12 @@ static int og0ve1b_enum_mbus_code(struct v4l2_subdev *sd,
>  				  struct v4l2_subdev_state *sd_state,
>  				  struct v4l2_subdev_mbus_code_enum *code)
>  {
> +	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
> +
>  	if (code->index > 0)
>  		return -EINVAL;
>  
> -	code->code = MEDIA_BUS_FMT_Y8_1X8;
> +	code->code = og0ve1b->data->modes[0].code;
>  
>  	return 0;
>  }
> @@ -517,15 +554,18 @@ static int og0ve1b_enum_frame_size(struct v4l2_subdev *sd,
>  				   struct v4l2_subdev_state *sd_state,
>  				   struct v4l2_subdev_frame_size_enum *fse)
>  {
> -	if (fse->index >= ARRAY_SIZE(supported_modes))
> +	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
> +	const struct og0ve1b_sensor_data *data = og0ve1b->data;
> +
> +	if (fse->index >= data->num_modes)
>  		return -EINVAL;
>  
> -	if (fse->code != MEDIA_BUS_FMT_Y8_1X8)
> +	if (fse->code != data->modes[fse->index].code)
>  		return -EINVAL;
>  
> -	fse->min_width = supported_modes[fse->index].width;
> +	fse->min_width = data->modes[fse->index].width;
>  	fse->max_width = fse->min_width;
> -	fse->min_height = supported_modes[fse->index].height;
> +	fse->min_height = data->modes[fse->index].height;
>  	fse->max_height = fse->min_height;
>  
>  	return 0;
> @@ -534,13 +574,14 @@ static int og0ve1b_enum_frame_size(struct v4l2_subdev *sd,
>  static int og0ve1b_init_state(struct v4l2_subdev *sd,
>  			      struct v4l2_subdev_state *state)
>  {
> +	const struct og0ve1b_mode *mode = &to_og0ve1b(sd)->data->modes[0];
>  	struct v4l2_subdev_format fmt = {
>  		.which = V4L2_SUBDEV_FORMAT_TRY,
>  		.pad = 0,
>  		.format = {
> -			.code = MEDIA_BUS_FMT_Y8_1X8,
> -			.width = supported_modes[0].width,
> -			.height = supported_modes[0].height,
> +			.code = mode->code,
> +			.width = mode->width,
> +			.height = mode->height,
>  		},
>  	};
>  
> @@ -586,9 +627,9 @@ static int og0ve1b_identify_sensor(struct og0ve1b *og0ve1b)
>  		return ret;
>  	}
>  
> -	if (val != OG0VE1B_CHIP_ID) {
> -		dev_err(og0ve1b->dev, "chip id mismatch: %x!=%llx\n",
> -			OG0VE1B_CHIP_ID, val);
> +	if (val != og0ve1b->data->chip_id) {
> +		dev_err(og0ve1b->dev, "chip id mismatch: %llx!=%llx\n",
> +			og0ve1b->data->chip_id, val);
>  		return -ENODEV;
>  	}
>  
> @@ -624,8 +665,8 @@ static int og0ve1b_check_hwcfg(struct og0ve1b *og0ve1b)
>  	ret = v4l2_link_freq_to_bitmap(og0ve1b->dev,
>  				       bus_cfg.link_frequencies,
>  				       bus_cfg.nr_of_link_frequencies,
> -				       og0ve1b_link_freq_menu,
> -				       ARRAY_SIZE(og0ve1b_link_freq_menu),
> +				       og0ve1b->data->link_freq_menu,
> +				       og0ve1b->data->num_link_freqs,
>  				       &freq_bitmap);
>  
>  	v4l2_fwnode_endpoint_free(&bus_cfg);
> @@ -686,6 +727,9 @@ static int og0ve1b_probe(struct i2c_client *client)
>  		return -ENOMEM;
>  
>  	og0ve1b->dev = &client->dev;
> +	og0ve1b->data = i2c_get_match_data(client);
> +	if (!og0ve1b->data)
> +		return -ENODEV;
>  
>  	v4l2_i2c_subdev_init(&og0ve1b->sd, client, &og0ve1b_subdev_ops);
>  
> @@ -700,7 +744,7 @@ static int og0ve1b_probe(struct i2c_client *client)
>  				     "failed to get XVCLK clock\n");
>  
>  	freq = clk_get_rate(og0ve1b->xvclk);
> -	if (freq && freq != OG0VE1B_MCLK_FREQ_24MHZ)
> +	if (freq && freq != og0ve1b->data->mclk_freq)
>  		return dev_err_probe(og0ve1b->dev, -EINVAL,
>  				     "XVCLK clock frequency %lu is not supported\n",
>  				     freq);
> @@ -819,7 +863,7 @@ static const struct dev_pm_ops og0ve1b_pm_ops = {
>  };
>  
>  static const struct of_device_id og0ve1b_of_match[] = {
> -	{ .compatible = "ovti,og0ve1b" },
> +	{ .compatible = "ovti,og0ve1b", .data = &og0ve1b_data },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, og0ve1b_of_match);
> 

-- 
Regards,

Sakari Ailus
