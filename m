Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6FB43BDD2;
	Thu, 27 Aug 2026 09:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787823652; cv=none; b=NCFDkdysk/5lWOnWFpbiXl8zGqJ/QlYwFPC3v6LYEVzJ7FpIkNhQJnFRM/6Ud6JLJZpVZni6jXN7DJspJWX2jmSRGCKtoplVLkEHETKXCR+duNmGe9tlUyRW93Dpv+MQ5vHIiykGBQBI8f2Q2ZC8WWDFze2SzoPOe/lhvgCDtV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787823652; c=relaxed/simple;
	bh=rL9TYM9yLmhnQCd5sDRb/i0eElotMdsEjEZcYkZOnFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dtlNNbMlDmkQvj7Y8fKpTX6zyXcLra3v8Iu0w/eVBmjHEtl7RRMPTs0E00/dpB/TRdoBH/oGcokKwGhH8wnn0d58/m4U3Vmo/M9fW1hJsgS/neOAVbq2mdbwx2rg9A1rO9hEFjHHG0yXCjz+6d8YiBcq7lRUruMHFq3x0S60kJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hYsVqHxR; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hYsVqHxR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787823648; x=1819359648;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rL9TYM9yLmhnQCd5sDRb/i0eElotMdsEjEZcYkZOnFg=;
  b=hYsVqHxRJxGO9GPI4eVMeBXaPhMpGEPpSPd6KlZeLgtjm8Sk6KxrZUTl
   V3Lmi9JDhEH5I2WeTGg/9LJ8E0XqDi7iDxIqVB47JtGCEGXFNEY8dfK8h
   1Rs60ZsuyKIiG6d+wZfgnY7/nQUVeudGKtYBNCI0B/63TAS/nHSx1BtWN
   9IKvz3WDaltgelisgFJJk55ydInGbuxTrlwdUM54GWety79kGWZ6tcfeq
   AFhk1P019hELvLh5rnd01gMv7YM9jUX+Q6etOamg/HpkmBQa1kchofVVn
   /A1uted5BrOUCTgLZxVVjVBNduUxjxcMkqvXtDwdeG8L6DJQ7S16qr6Oh
   w==;
X-CSE-ConnectionGUID: 7Z5flkA4TeSzQcJCIQIMwg==
X-CSE-MsgGUID: +Shlav/+TraB46NMbjnc7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="75861194"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="75861194"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 02:40:46 -0700
X-CSE-ConnectionGUID: 6r0+pXMlQW2SkceJaqe+5Q==
X-CSE-MsgGUID: f/YZL4bKRAKHWmuwdJ+coA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="266042179"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 02:40:42 -0700
Date: Thu, 27 Aug 2026 12:40:40 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] media: ov8858: support 19.2 MHz clock and CHT gain
 setup
Message-ID: <apAGGD27ZUFHQ6Aa@ashevche-desk.local>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260826132256.3343451-2-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826132256.3343451-2-mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Aug 26, 2026 at 03:22:49PM +0200, Maurizio Casciano wrote:
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
> 
> The manual white-balance register definitions and programming follow
> the GPL-2.0 Intel OV5670 driver, so retain its 2017 Intel copyright
> notice in this file. No proprietary source or tuning binary is included.
> 
> Tested on the Lenovo Yoga Book YB1-X91L OV8858 with full-range test bars
> and real 10-bit Bayer frames.

...

>  #define OV8858_LINK_FREQ		360000000U
> -#define OV8858_XVCLK_FREQ		24000000
> +#define OV8858_XVCLK_FREQ_19_2MHZ	19200000
> +#define OV8858_XVCLK_FREQ_24MHZ		24000000

While at it, use HZ_PER_MHZ multiplier from units.h.

...

>  #define OV8858_REG_LONG_DIGIGAIN	OV8858_REG_16BIT(0x350a)
>  #define OV8858_LONG_DIGIGAIN_H_MASK	0x3fc0
>  #define OV8858_LONG_DIGIGAIN_L_MASK	0x3f
>  #define OV8858_LONG_DIGIGAIN_H_SHIFT	2
>  #define OV8858_LONG_DIGIGAIN_MIN	0x0
>  #define OV8858_LONG_DIGIGAIN_MAX	0x3fff
> -#define OV8858_LONG_DIGIGAIN_STEP	1
>  #define OV8858_LONG_DIGIGAIN_DEFAULT	0x200
>  
> +#define OV8858_DIGITAL_GAIN_STEP	1
> +

What has been changed here? Why?

...

>  struct ov8858 {
>  	struct clk		*xvclk;
> +	unsigned long		xvclk_rate;
>  	struct gpio_desc	*reset_gpio;
>  	struct gpio_desc	*pwdn_gpio;
>  	struct regulator_bulk_data supplies[ARRAY_SIZE(ov8858_supply_names)];

I understand the logic of location of a new field, but can you confirm with
`pahole` that this is optimal as well from alignment perspective?

>  	unsigned int		num_lanes;
>  };

...

> +	/* The mode tables contain PLL settings for a 24 MHz input clock. */
> +	if (ov8858->xvclk_rate == OV8858_XVCLK_FREQ_19_2MHZ) {
> +		ret = ov8858_write_array(ov8858,
> +					 ov8858_cht_mrd_19_2mhz);

It's perfectly a single line.


> +		if (ret)
> +			return ret;
> +	}

...

> +static int ov8858_set_digital_gain(struct ov8858 *ov8858, u32 gain)
> +{
> +	u16 long_gain;
> +	int ret;
> +
> +	if (ov8858->xvclk_rate != OV8858_XVCLK_FREQ_19_2MHZ) {
> +		long_gain = (gain & OV8858_LONG_DIGIGAIN_L_MASK) |
> +			    ((gain & OV8858_LONG_DIGIGAIN_H_MASK) <<
> +			     OV8858_LONG_DIGIGAIN_H_SHIFT);

I don't see the usefulness of these MASKs and SHIFTs in this case.
Can't we simply

#define OV8858_LONG_DIGIGAIN_MASK
	(OV8858_LONG_DIGIGAIN_L_MASK | OV8858_LONG_DIGIGAIN_H_MASK)

and then
		long_gain = gain & OV8858_LONG_DIGIGAIN_MASK;

?

> +		return ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN,
> +				    long_gain, NULL);
> +	}
> +
> +	ret = ov8858_write(ov8858, OV8858_REG_MWB_RED_GAIN, gain, NULL);
> +	if (ret)
> +		return ret;
> +
> +	ret = ov8858_write(ov8858, OV8858_REG_MWB_GREEN_GAIN, gain, NULL);
> +	if (ret)
> +		return ret;
> +
> +	return ov8858_write(ov8858, OV8858_REG_MWB_BLUE_GAIN, gain, NULL);
> +}

...

>  	struct i2c_client *client = v4l2_get_subdevdata(&ov8858->subdev);
>  	struct v4l2_mbus_framefmt *format;
>  	struct v4l2_subdev_state *state;
> -	u16 digi_gain;
>  	s64 max_exp;
>  	int ret;
>  
> @@ -1570,17 +1647,7 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
>  				   ctrl->val, NULL);
>  		break;
>  	case V4L2_CID_DIGITAL_GAIN:
> -		/*
> -		 * Digital gain is assembled as:
> -		 * 0x350a[7:0] = dgain[13:6]
> -		 * 0x350b[5:0] = dgain[5:0]
> -		 * Reassemble the control value to write it in one go.
> -		 */
> -		digi_gain = (ctrl->val & OV8858_LONG_DIGIGAIN_L_MASK)
> -			  | ((ctrl->val & OV8858_LONG_DIGIGAIN_H_MASK) <<
> -			      OV8858_LONG_DIGIGAIN_H_SHIFT);
> -		ret = ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN,
> -				   digi_gain, NULL);
> +		ret = ov8858_set_digital_gain(ov8858, ctrl->val);
>  		break;

So this part with the above can be split to a preparatory patch.

...

> -	delay_us = DIV_ROUND_UP(8192, OV8858_XVCLK_FREQ / 1000 / 1000);
> +	delay_us = DIV_ROUND_UP(8192, ov8858->xvclk_rate / 1000 / 1000);

Also HZ_PER_MHZ

...

> static int ov8858_init_ctrls(struct ov8858 *ov8858)

>  	struct v4l2_ctrl_handler *handler = &ov8858->ctrl_handler;
>  	const struct ov8858_mode *mode = &ov8858_modes[0];
>  	struct v4l2_fwnode_device_properties props;
> +	u32 digital_gain_default = OV8858_LONG_DIGIGAIN_DEFAULT;
> +	u32 digital_gain_max = OV8858_LONG_DIGIGAIN_MAX;
> +	u32 digital_gain_min = OV8858_LONG_DIGIGAIN_MIN;
>  	s64 exposure_max, vblank_def;
>  	unsigned int pixel_rate;
>  	struct v4l2_ctrl *ctrl;

>  			  OV8858_LONG_GAIN_MIN, OV8858_LONG_GAIN_MAX,
>  			  OV8858_LONG_GAIN_STEP, OV8858_LONG_GAIN_DEFAULT);
>  
> +	if (ov8858->xvclk_rate == OV8858_XVCLK_FREQ_19_2MHZ) {
> +		digital_gain_min = OV8858_MWB_GAIN_MIN;
> +		digital_gain_max = OV8858_MWB_GAIN_MAX;
> +		digital_gain_default = OV8858_MWB_GAIN_DEFAULT;
> +	}

Instead, use 'else' branch so all assignments are close to each other.
Also possible to avoid adding local variables.

-- 
With Best Regards,
Andy Shevchenko


