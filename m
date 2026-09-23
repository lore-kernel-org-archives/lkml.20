Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3BA46D09A;
	Wed, 23 Sep 2026 20:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790196850; cv=none; b=bEkjV96jrx3mMdmxksoKXOLxDXxy0kvb1LEZFkws1Wf+KY7mgnGYC2av5hWH/ba4NBHgINVZ4NivNuXAWn5mHyzyws4+nZnP9Dmc0U2fM/xtC3vRABk6WD9Ne/YjldBfPn8McJF07LMCMd8iKexMpOLRUr4UKGaMSjFMLxr3w2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790196850; c=relaxed/simple;
	bh=iHLa2rw9wf8mLUuRep7O7Zoc1j6qyzT4nWjSA2W3ifw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WxubHDIoIL8QtJEuD9LkU9hqO/08SWD3O/cpjOfx8holqHReyTZj0bEksPQNFM4siR8amTZWY/iBe3+abqml9V4u/dELVRJVhlDcibRQL+UBcCJH+76cT/K4v6u5MgtIpEoyZB8M/YLwciYCqLDrnBc+HHyJOLVpTUr1uvGrWws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i2QKqaJr; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i2QKqaJr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790196848; x=1821732848;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iHLa2rw9wf8mLUuRep7O7Zoc1j6qyzT4nWjSA2W3ifw=;
  b=i2QKqaJrQ3mnLcU2o/93cHZZTtIKkk/omV4RlligBp7rQbapHnk/6pRh
   dXoscQ5fbup3yevTE4ozMNhGO0WBzczH7haFDt6vFEV5aTM30j8x4Zp7W
   RpzMb9nChCrGRrgrBrYz/jp4lFr2cz+fcm9hThMvFV51R2n6KHmYvwbXX
   u8n9pkK8Sn/SysU/ebGURcQV7rAzDl7D91BY5FqMh8NG0cW0zH+bwY7Zb
   bVXHIPqhHlFdux76NpWWLSfJ/oUrfirv5HFLnqlY15rlIW3jlAiiDBuPg
   ZIWnNrt0bOQCBZBY6himbnEt2Q3ttR/+U+csaevSxOCG9DvorQUDjqZhd
   w==;
X-CSE-ConnectionGUID: xEwWZorxSwiRF25X66J8WA==
X-CSE-MsgGUID: G7FqTRLtS3iOEDZsVwORKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="89849339"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="89849339"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 13:54:07 -0700
X-CSE-ConnectionGUID: BHxecrJjSZqusZF7EAr7Bw==
X-CSE-MsgGUID: L4lQHyKcSYWN26Ca68YV4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="4884498"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.83])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 13:54:05 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3CA9611F9B7;
	Wed, 23 Sep 2026 23:54:04 +0300 (EEST)
Date: Wed, 23 Sep 2026 23:54:04 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Felipe Calliari <calliarifelipe@gmail.com>
Cc: linux-media@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomas Moro <tmorolias@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] media: ov02c10: Accept a 26 MHz external clock
Message-ID: <arQ8bCozVcYL8AEf@kekkonen.localdomain>
References: <20260905030732.39196-1-calliarifelipe@gmail.com>
 <20260923144257.119076-1-calliarifelipe@gmail.com>
 <20260923144257.119076-4-calliarifelipe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923144257.119076-4-calliarifelipe@gmail.com>

Hi Felipe,

Thanks for the update.

I think this patch still needs a bit more work, see below.

On Wed, Sep 23, 2026 at 11:42:57AM -0300, Felipe Calliari wrote:
> Several Meteor Lake / Lunar Lake designs (e.g. the Samsung Galaxy Book3/4
> series) wire the OV02C10 to a 26 MHz external clock instead of the
> 19.2 MHz assumed so far. The IPU6 ipu-bridge forwards the rate from the
> ACPI SSDB verbatim as the "clock-frequency" property, so probe() just
> rejects it today:
> 
>   ov02c10 i2c-OVTI02C1:00: external clock 26000000 is not supported
> 
> Rename OV02C10_MCLK to OV02C10_MCLK_19_2MHZ, add OV02C10_MCLK_26MHZ and
> accept both.
> 
> The register tables program the OP PLL multiplier (0x0304/0x0305, 16-bit)
> to 0x0190 = 400 for a 19.2 MHz clock: the common table writes
> 0x0304 = 0x01 and the per-lane tables override 0x0305 = 0x90. Left alone
> on a 26 MHz clock the same dividers run every internal clock, and
> therefore the MIPI link, 26/19.2 = 1.3542x faster: a ~541.7 MHz link at
> ~40 fps instead of the nominal 400 MHz at ~30 fps.
> 
> Re-program both PLL multipliers by the inverse factor instead, so that
> the link stays where the driver and the ipu-bridge fwnode already
> describe it: 400 * 19.2 / 26 = 295 = 0x0127, written to 0x0304/0x0305
> and 0x0315/0x0316 after the per-lane table when the external clock is
> 26 MHz. That puts the link at 295 * 26 / 19.2 = 399.5 MHz, within 0.13%
> of the nominal 400 MHz, so link-frequency and pixel-rate stay accurate
> with the single existing menu entry and the ipu-bridge needs no change.

Please do add that frequency; it's still different from what's supported
now. If someone later on improves the driver and implements a PLL
calculator for it, this will stop working.

What about pixel rate? It's also affected, isn't it?

> 
> Tested on a Samsung Galaxy Book3 (two CSI-2 data lanes, 26 MHz clock
> confirmed via clk_summary): the multiplier registers read back 0x0127
> while streaming and capture runs at a steady 30.01 fps by buffer
> timestamp, against ~40 fps with the unmodified tables, matching the
> 30.14 fps that the exported hblank, vblank and pixel-rate describe.

If the patch is adding support for a new link frequency, just say that. The
rest goes to the cover letter.

> 
> While touching the clock check, terminate its error string with a
> newline.
> 
> Link: https://lore.kernel.org/linux-media/ap_CGQTdNFysTLot@kekkonen.localdomain/
> Signed-off-by: Felipe Calliari <calliarifelipe@gmail.com>
> ---
> 
> Changes in v2:
> - Re-program the OP and VT PLL multipliers instead of advertising the
>   scaled 541.667 MHz link frequency (Sakari). The suggested 0x28a / 0x1b1
>   produce no output on this hardware; 0x0127 -- the 0x0190 the tables
>   already program, scaled by 19.2/26 -- does, and brings the frame rate
>   back to the nominal ~30 fps.
> - Drop the second V4L2_CID_LINK_FREQ entry that v1 added: with the link
>   back at ~400 MHz the existing single entry matches the ipu-bridge
>   fwnode directly, so no ipu-bridge change is needed either.
> - Bryan's Reviewed-by and the Tested-by on v1 are not carried over, as
>   the patch was rewritten.
> 
>  drivers/media/i2c/ov02c10.c | 43 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 40 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index cdccbdef3..17208f2e6 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -16,7 +16,8 @@
>  #include <media/v4l2-fwnode.h>
>  
>  #define OV02C10_LINK_FREQ_400MHZ	400000000ULL
> -#define OV02C10_MCLK			19200000
> +#define OV02C10_MCLK_19_2MHZ		19200000
> +#define OV02C10_MCLK_26MHZ		26000000
>  #define OV02C10_RGB_DEPTH		10
>  
>  #define OV02C10_NATIVE_WIDTH		1928
> @@ -337,6 +338,23 @@ static const struct reg_sequence sensor_1928x1092_30fps_2lane_setting[] = {
>  	{0x3016, 0x32},
>  };
>  
> +/*
> + * The mode tables target a 19.2 MHz input clock, programming the OP PLL
> + * multiplier (0x0304/0x0305, 16-bit) to 0x0190 = 400 for a 400 MHz link at
> + * ~30 fps.  A 26 MHz input clock instead runs every internal clock, and
> + * therefore the MIPI link, 26/19.2 = 1.3542x faster (~541.7 MHz, ~40 fps).
> + * Scaling both PLL multipliers by 19.2/26 -- 400 * 19.2 / 26 = 295 = 0x0127
> + * -- puts the link back at 295 * 26 / 19.2 = 399.5 MHz, within 0.13% of the
> + * nominal 400 MHz, so the frame rate and the advertised link frequency both
> + * stay correct without a second link-frequency entry.
> + */
> +static const struct reg_sequence sensor_pll_26mhz_setting[] = {
> +	{0x0304, 0x01},
> +	{0x0305, 0x27},
> +	{0x0315, 0x01},
> +	{0x0316, 0x27},
> +};

This needs to be preceded by a patch splitting off these registers from the
main register list. The result, in this patch, should be two register lists
to choose from (or even better, a PLL calculator).

> +
>  static const char * const ov02c10_test_pattern_menu[] = {
>  	"Disabled",
>  	"Color Bar",
> @@ -396,6 +414,9 @@ struct ov02c10 {
>  	/* MIPI lane info */
>  	u32 link_freq_index;
>  	u8 mipi_lanes;
> +
> +	/* External (sensor) clock rate, Hz */
> +	u32 xvclk_freq;
>  };
>  
>  static inline struct ov02c10 *to_ov02c10(struct v4l2_subdev *subdev)
> @@ -619,6 +640,17 @@ static int ov02c10_enable_streams(struct v4l2_subdev *sd,
>  		goto out;
>  	}
>  
> +	if (ov02c10->xvclk_freq == OV02C10_MCLK_26MHZ) {
> +		reg_sequence = sensor_pll_26mhz_setting;
> +		sequence_length = ARRAY_SIZE(sensor_pll_26mhz_setting);
> +		ret = regmap_multi_reg_write(ov02c10->regmap,
> +					     reg_sequence, sequence_length);
> +		if (ret) {
> +			dev_err(ov02c10->dev, "failed to write PLL settings\n");
> +			goto out;
> +		}
> +	}
> +
>  	ret = __v4l2_ctrl_handler_setup(ov02c10->sd.ctrl_handler);
>  	if (ret)
>  		goto out;
> @@ -877,6 +909,10 @@ static int ov02c10_check_hwcfg(struct ov02c10 *ov02c10)
>  	/* v4l2_link_freq_to_bitmap() guarantees at least 1 bit is set */
>  	ov02c10->link_freq_index = ffs(link_freq_bitmap) - 1;
>  
> +	dev_dbg(dev, "%u Hz external clock, link freq %lld Hz\n",
> +		ov02c10->xvclk_freq,
> +		link_freq_menu_items[ov02c10->link_freq_index]);

Maybe useful at development time, but hardly anymore.

> +
>  	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 1 &&
>  	    bus_cfg.bus.mipi_csi2.num_data_lanes != 2) {
>  		ret = dev_err_probe(dev, -EINVAL,
> @@ -926,10 +962,11 @@ static int ov02c10_probe(struct i2c_client *client)
>  				     "failed to get imaging clock\n");
>  
>  	freq = clk_get_rate(ov02c10->img_clk);
> -	if (freq != OV02C10_MCLK)
> +	if (freq != OV02C10_MCLK_19_2MHZ && freq != OV02C10_MCLK_26MHZ)
>  		return dev_err_probe(ov02c10->dev, -EINVAL,
> -				     "external clock %lu is not supported",
> +				     "external clock %lu is not supported\n",
>  				     freq);
> +	ov02c10->xvclk_freq = freq;
>  
>  	v4l2_i2c_subdev_init(&ov02c10->sd, client, &ov02c10_subdev_ops);
>  

-- 
Regards,

Sakari Ailus
