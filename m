Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94EA45DF60;
	Wed,  2 Sep 2026 10:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345211; cv=none; b=qzLK2BdPFd86S7Hpht/KcVgmbWvEoPggfZE2y5Z91e/yrWzW6dRpBHKkkqJqaDz0OhKd0D0tYVJW9gJ9KJ2g4gB3HBN3pzOu6xAoHgrGh3vCwxFsGDdY9Uiu2h5JJNF1HNOm25Y+H6TDwJZG6aSkQiYmXE2KhJbChx9qqb5gt7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345211; c=relaxed/simple;
	bh=wJoiUDzqgCau6bE4gj+OL8YxHLjJ0Bs3rQBGQIVEI/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GL+Y0Lwjmp/Oq1Wh9jJjoEYj7zjgaUTjZtDqYOmW6JyskGDilq2HXdYpr5jFJn8Xj2U0bc50DXPDEdV10e0ZJgVdhNVXO5ufCkgrtNKCRmm1CbKNcxsFzmAz+5tmrbBdgKRerxSK9Xxha28I1oS2N7r+95CZQHyfAzezmfgchiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cWhM0KzC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cWhM0KzC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788345208; x=1819881208;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wJoiUDzqgCau6bE4gj+OL8YxHLjJ0Bs3rQBGQIVEI/8=;
  b=cWhM0KzCUxnakJNvH6rt8CWJ1EAv+J+AzbdXTfZ7hcIwJB5cRpUPpjoB
   kWwF266UgfNdwNtmkeJeeEtIQCiHuOpVqC62+YVznHxfyIH714N9iX+wl
   +7LKlcoR60OZ/RW9RUW9cggk9tkoJQAjpktgMD57Ud6ZBsk+zCsrfbpuu
   mVpKd5ZgJFj5xRSKQoOgfWiGK0KDZze4BRmXVnwHwILRbn2/8oHvp9zcX
   PScyVHep3nBzkB+blWTJte5da/TkvgyCrCcvcYB+eewAp1KQUpuAdaLUx
   iW9zhhjUrFtrvyo2iiNCLG6aRl9H0El+pydbJgRjcmeAAQa13wjIou1tn
   w==;
X-CSE-ConnectionGUID: YLm7wBC9TZa9RFFYsVdETg==
X-CSE-MsgGUID: HjrHYQTLQDeMHsrQXZw73g==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88828218"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="88828218"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 03:33:27 -0700
X-CSE-ConnectionGUID: S1mwy3iKSLmPOoDYrOHecQ==
X-CSE-MsgGUID: dyAtE+jaRKa34G5/Qb3bOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="268831509"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.129])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 03:33:24 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5FC48120EB7;
	Wed, 02 Sep 2026 13:33:20 +0300 (EEST)
Date: Wed, 2 Sep 2026 13:33:20 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org, bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	andy@kernel.org, andriy.shevchenko@intel.com, hansg@kernel.org,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 02/16] media: ov8858: support 19.2 MHz clock and CHT
 gain setup
Message-ID: <apf7cJOoXrl_wZfr@kekkonen.localdomain>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
 <bfa79097b66fc3ed6155c7b8c5368b2e0fe9e882.1788286339.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfa79097b66fc3ed6155c7b8c5368b2e0fe9e882.1788286339.git.mauriziocasciano7@gmail.com>

Hi Maurizio,

On Tue, Sep 01, 2026 at 09:04:24PM +0200, Maurizio Casciano wrote:
> The Yoga Book drives its OV8858 from a 19.2 MHz platform clock, while
> the existing mode tables program the sensor PLL for 24 MHz. Reusing
> those settings produces incorrect internal and CSI-2 clocks.
> 
> Accept both input rates and use the actual rate for the reset delay. For
> 19.2 MHz, apply the Cherry Trail MRD PLL and black-level settings after
> the generic mode table.
> 
> The 19.2 MHz platform uses the per-channel manual white-balance
> registers for digital gain. Program registers 0x5032, 0x5034 and 0x5036
> and expose their 1x-to-4x range, while retaining the existing
> long-exposure gain block for 24 MHz systems.

Could these be exposed as separate controls? The available controls
shouldn't be dependent on the external clock frequency.

> 
> The manual white-balance register definitions and programming follow
> the GPL-2.0 Intel OV5670 driver, so retain its 2017 Intel copyright
> notice in this file. No proprietary source or tuning binary is included.
> 
> Tested on the Lenovo Yoga Book YB1-X91L OV8858 with full-range test bars
> and real 10-bit Bayer frames.
> 
> Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
> Assisted-by: LLM sparse

Sparse isn't an LLM AFAIK, or is it?

> ---
>  drivers/media/i2c/ov8858.c | 130 +++++++++++++++++++++++++++++++++----
>  1 file changed, 118 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
> index d95f034de752..8d697b8d11c6 100644
> --- a/drivers/media/i2c/ov8858.c
> +++ b/drivers/media/i2c/ov8858.c
> @@ -3,10 +3,9 @@
>   * Copyright (C) 2023 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>   * Copyright (C) 2022 Nicholas Roth <nicholas@rothemail.net>
>   * Copyright (C) 2017 Fuzhou Rockchip Electronics Co., Ltd.
> + * Copyright (c) 2017 Intel Corporation.
>   */
>  
> -#include <linux/unaligned.h>
> -
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
> @@ -18,6 +17,8 @@
>  #include <linux/property.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
> +#include <linux/unaligned.h>
> +#include <linux/units.h>
>  
>  #include <media/media-entity.h>
>  #include <media/v4l2-async.h>
> @@ -28,8 +29,9 @@
>  #include <media/v4l2-mediabus.h>
>  #include <media/v4l2-subdev.h>
>  
> -#define OV8858_LINK_FREQ		360000000U
> -#define OV8858_XVCLK_FREQ		24000000
> +#define OV8858_LINK_FREQ		(360 * HZ_PER_MHZ)
> +#define OV8858_XVCLK_FREQ_24MHZ		24000000
> +#define OV8858_XVCLK_FREQ_19_2MHZ	19200000
>  
>  #define OV8858_REG_SIZE_SHIFT		16
>  #define OV8858_REG_ADDR_MASK		0xffff
> @@ -59,6 +61,14 @@
>  #define OV8858_LONG_GAIN_STEP		1
>  #define OV8858_LONG_GAIN_DEFAULT	0x80
>  
> +#define OV8858_REG_MWB_RED_GAIN		OV8858_REG_16BIT(0x5032)
> +#define OV8858_REG_MWB_GREEN_GAIN	OV8858_REG_16BIT(0x5034)
> +#define OV8858_REG_MWB_BLUE_GAIN	OV8858_REG_16BIT(0x5036)
> +#define OV8858_MWB_GAIN_MIN		0x400
> +#define OV8858_MWB_GAIN_MAX		0xfff
> +#define OV8858_MWB_GAIN_STEP		1
> +#define OV8858_MWB_GAIN_DEFAULT		0x400
> +
>  #define OV8858_REG_LONG_DIGIGAIN	OV8858_REG_16BIT(0x350a)
>  #define OV8858_LONG_DIGIGAIN_H_MASK	0x3fc0
>  #define OV8858_LONG_DIGIGAIN_L_MASK	0x3f
> @@ -93,6 +103,33 @@ struct regval_modes {
>  	const struct regval *mode_4lanes;
>  };
>  
> +struct ov8858_gain_range {
> +	u32 min;
> +	u32 max;
> +	u32 step;
> +	u32 def;
> +};
> +
> +enum ov8858_xvclk_index {
> +	OV8858_XVCLK_24MHZ,
> +	OV8858_XVCLK_19_2MHZ,
> +};
> +
> +static const struct ov8858_gain_range ov8858_digital_gain_ranges[] = {
> +	[OV8858_XVCLK_24MHZ] = {
> +		.min = OV8858_LONG_DIGIGAIN_MIN,
> +		.max = OV8858_LONG_DIGIGAIN_MAX,
> +		.step = OV8858_LONG_DIGIGAIN_STEP,
> +		.def = OV8858_LONG_DIGIGAIN_DEFAULT,
> +	},
> +	[OV8858_XVCLK_19_2MHZ] = {
> +		.min = OV8858_MWB_GAIN_MIN,
> +		.max = OV8858_MWB_GAIN_MAX,
> +		.step = OV8858_MWB_GAIN_STEP,
> +		.def = OV8858_MWB_GAIN_DEFAULT,
> +	},
> +};
> +
>  struct ov8858_mode {
>  	u32 width;
>  	u32 height;
> @@ -104,6 +141,7 @@ struct ov8858_mode {
>  
>  struct ov8858 {
>  	struct clk		*xvclk;
> +	unsigned long		xvclk_rate;
>  	struct gpio_desc	*reset_gpio;
>  	struct gpio_desc	*pwdn_gpio;
>  	struct regulator_bulk_data supplies[ARRAY_SIZE(ov8858_supply_names)];
> @@ -121,6 +159,41 @@ struct ov8858 {
>  	unsigned int		num_lanes;
>  };
>  
> +/*
> + * Cherry Trail MRD production settings for a 19.2 MHz input and 360 MHz
> + * CSI-2 link. Apply these after the otherwise reusable 24 MHz mode table.

Please move the registers related to the 24 MHz configuration to another
array, which is written to the device in the 24 MHz case.

> + *
> + * Besides the corrected sensor/MIPI PLL divisors, keep the final common
> + * black-level settings here. The per-mode tables retain their resolution
> + * dependent black-column anchors and window sizes.
> + */
> +static const struct regval ov8858_cht_mrd_19_2mhz[] = {
> +	{0x0300, 0x00},
> +	{0x0302, 0x27},
> +	{0x0303, 0x00},
> +	{0x0304, 0x03},
> +	{0x030b, 0x00},
> +	{0x030d, 0x27},
> +	{0x030e, 0x00},
> +	{0x030f, 0x04},
> +	{0x0312, 0x01},
> +	{0x031e, 0x0c},
> +	{0x3f08, 0x08},
> +	{0x400a, 0x01},
> +	{0x400d, 0x10},
> +	{0x4011, 0x20},
> +	{0x403e, 0x08},
> +	{0x4040, 0x07},
> +	{0x4041, 0xc6},
> +	{0x4202, 0x00},
> +	{0x4500, 0x58},
> +	{0x470b, 0x28},
> +	{0x4837, 0x15},
> +	{0x58f4, 0x32},
> +	{0x58f8, 0x3d},
> +	{REG_NULL, 0x00},
> +};
> +
>  static inline struct ov8858 *sd_to_ov8858(struct v4l2_subdev *sd)
>  {
>  	return container_of(sd, struct ov8858, subdev);
> @@ -1345,6 +1418,13 @@ static int ov8858_start_stream(struct ov8858 *ov8858,
>  	if (ret)
>  		return ret;
>  
> +	/* The mode tables contain PLL settings for a 24 MHz input clock. */
> +	if (ov8858->xvclk_rate == OV8858_XVCLK_FREQ_19_2MHZ) {
> +		ret = ov8858_write_array(ov8858, ov8858_cht_mrd_19_2mhz);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	/* 200 usec max to let PLL stabilize. */
>  	fsleep(200);
>  
> @@ -1540,6 +1620,21 @@ static int ov8858_set_long_digital_gain(struct ov8858 *ov8858, u32 gain)
>  	return ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN, long_gain, NULL);
>  }
>  
> +static int ov8858_set_mwb_digital_gain(struct ov8858 *ov8858, u32 gain)
> +{
> +	int ret;
> +
> +	ret = ov8858_write(ov8858, OV8858_REG_MWB_RED_GAIN, gain, NULL);
> +	if (ret)
> +		return ret;

You can do:

	int ret = 0;

	ov8858_write(ov8858, OV8858_REG_MWB_RED_GAIN, gain, &ret);
	...;

	return ret;

> +
> +	ret = ov8858_write(ov8858, OV8858_REG_MWB_GREEN_GAIN, gain, NULL);
> +	if (ret)
> +		return ret;
> +
> +	return ov8858_write(ov8858, OV8858_REG_MWB_BLUE_GAIN, gain, NULL);
> +}
> +
>  static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct ov8858 *ov8858 = container_of(ctrl->handler,
> @@ -1586,7 +1681,10 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
>  				   ctrl->val, NULL);
>  		break;
>  	case V4L2_CID_DIGITAL_GAIN:
> -		ret = ov8858_set_long_digital_gain(ov8858, ctrl->val);
> +		if (ov8858->xvclk_rate == OV8858_XVCLK_FREQ_19_2MHZ)
> +			ret = ov8858_set_mwb_digital_gain(ov8858, ctrl->val);
> +		else
> +			ret = ov8858_set_long_digital_gain(ov8858, ctrl->val);

Why does this configuration depend on 

>  		break;
>  	case V4L2_CID_VBLANK:
>  		ret = ov8858_write(ov8858, OV8858_REG_VTS,
> @@ -1622,9 +1720,6 @@ static int ov8858_power_on(struct ov8858 *ov8858)
>  	unsigned long delay_us;
>  	int ret;
>  
> -	if (clk_get_rate(ov8858->xvclk) != OV8858_XVCLK_FREQ)
> -		dev_warn(dev, "xvclk mismatched, modes are based on 24MHz\n");
> -
>  	ret = clk_prepare_enable(ov8858->xvclk);
>  	if (ret < 0) {
>  		dev_err(dev, "Failed to enable xvclk\n");
> @@ -1643,7 +1738,7 @@ static int ov8858_power_on(struct ov8858 *ov8858)
>  	 * transaction, but a double sleep between the release of gpios
>  	 * helps with sporadic failures observed at probe time.
>  	 */
> -	delay_us = DIV_ROUND_UP(8192, OV8858_XVCLK_FREQ / 1000 / 1000);
> +	delay_us = DIV_ROUND_UP(8192, ov8858->xvclk_rate / HZ_PER_MHZ);
>  
>  	gpiod_set_value_cansleep(ov8858->reset_gpio, 0);
>  	fsleep(delay_us);
> @@ -1701,9 +1796,11 @@ static int ov8858_init_ctrls(struct ov8858 *ov8858)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(&ov8858->subdev);
>  	struct v4l2_ctrl_handler *handler = &ov8858->ctrl_handler;
> +	const struct ov8858_gain_range *digital_gain_range;
>  	const struct ov8858_mode *mode = &ov8858_modes[0];
>  	struct v4l2_fwnode_device_properties props;
>  	s64 exposure_max, vblank_def;
> +	unsigned int xvclk_index;
>  	unsigned int pixel_rate;
>  	struct v4l2_ctrl *ctrl;
>  	u32 h_blank;
> @@ -1746,10 +1843,12 @@ static int ov8858_init_ctrls(struct ov8858 *ov8858)
>  			  OV8858_LONG_GAIN_MIN, OV8858_LONG_GAIN_MAX,
>  			  OV8858_LONG_GAIN_STEP, OV8858_LONG_GAIN_DEFAULT);
>  
> +	xvclk_index = ov8858->xvclk_rate == OV8858_XVCLK_FREQ_19_2MHZ ?
> +		OV8858_XVCLK_19_2MHZ : OV8858_XVCLK_24MHZ;
> +	digital_gain_range = &ov8858_digital_gain_ranges[xvclk_index];
>  	v4l2_ctrl_new_std(handler, &ov8858_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
> -			  OV8858_LONG_DIGIGAIN_MIN, OV8858_LONG_DIGIGAIN_MAX,
> -			  OV8858_LONG_DIGIGAIN_STEP,
> -			  OV8858_LONG_DIGIGAIN_DEFAULT);
> +			  digital_gain_range->min, digital_gain_range->max,
> +			  digital_gain_range->step, digital_gain_range->def);
>  
>  	v4l2_ctrl_new_std_menu_items(handler, &ov8858_ctrl_ops,
>  				     V4L2_CID_TEST_PATTERN,
> @@ -1887,6 +1986,13 @@ static int ov8858_probe(struct i2c_client *client)
>  		return dev_err_probe(dev, PTR_ERR(ov8858->xvclk),
>  				     "Failed to get xvclk\n");
>  
> +	ov8858->xvclk_rate = clk_get_rate(ov8858->xvclk);
> +	if (ov8858->xvclk_rate != OV8858_XVCLK_FREQ_19_2MHZ &&
> +	    ov8858->xvclk_rate != OV8858_XVCLK_FREQ_24MHZ)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Unsupported xvclk rate %lu Hz\n",
> +				     ov8858->xvclk_rate);
> +
>  	ov8858->reset_gpio = devm_gpiod_get_optional(dev, "reset",
>  						     GPIOD_OUT_HIGH);
>  	if (IS_ERR(ov8858->reset_gpio))

-- 
Regards,

Sakari Ailus
