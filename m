Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7404A2621;
	Thu, 17 Sep 2026 12:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647885; cv=none; b=Ji0VPtooZX7bkH+q4d4fhyHmGKrjWKvjyFhec7Jdnjc0JCf2uyciOOc8WLcXokmhBwMSzfZRflXRTe8Xm0fqzXdCKp4APZLrgmS5/+uc205zEcu2lb/rLtUrgteEsIt0fNwLS9g/6wluEPydRtyWzJb3Z9p0hor1CbvSv7DCQrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647885; c=relaxed/simple;
	bh=sq/OIQZ8Y+FiicMVNYCfF3nklWb6bLTU6PnU8h07U5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ERvCuHWwe1EoEJgHAEqfFpSNHREa6YD8DItCJUz3sYjynEzPdIqArVLvLlhWaDx01y+IOhOjPt48b9j3dQ1oXeGX7z+Q4g0K0j2BhDy3CBgAZzSj/xedN9Ysix0grr1XZ7AQ3vRzWWvabJASDetyKjumKZ9WEpXcGBpT6spqqQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mYIgPzsM; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mYIgPzsM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789647881; x=1821183881;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sq/OIQZ8Y+FiicMVNYCfF3nklWb6bLTU6PnU8h07U5o=;
  b=mYIgPzsMEHx8l83xJsEymBzyrZCS2Wdhgn3rCkZNe2IrsHvO5jkkv1rU
   7ARsw1JL4sXp1UBbZaJvYDPvp7A57dE66z5Ru5aav+V0F3q56SWP1lvND
   NrhL5E7Tk2XYL5oWTD2oHBx1dx5l+mLFtGmQoRbKi3dUdazwlqRjIcfjQ
   AmeEraCQ94I+fihi7bSNmQIbZ34OotWM4+3XbnTqJ6qVrx5KlhYi2eRpP
   65JejZTB6/cnhPIzu+wwm72DH2NDrc/MwBOgctAUUTpt6y4lV/UMR1kuZ
   LM3Z9pJNT9F6qT7GyejPJS40IozWNYRr2mG5fTex33HZ6d376xm9c3RNG
   Q==;
X-CSE-ConnectionGUID: NPvPeJ9eSZS5DtF0zJXxAw==
X-CSE-MsgGUID: 0VLat/sPTK2omiyOaTSCrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101407213"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101407213"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 05:24:35 -0700
X-CSE-ConnectionGUID: KcN01iaQT6GVoPxb26RArw==
X-CSE-MsgGUID: ysCKns8ETAK9mdjgCa0pZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1942251"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 05:24:33 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6ACC511FB34;
	Thu, 17 Sep 2026 15:24:30 +0300 (EEST)
Date: Thu, 17 Sep 2026 15:24:30 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Philippe Baetens <philippebaetens@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 2/2] media: i2c: Add driver for AMS-OSRAM Mira220
Message-ID: <aqvb_n-aPcXLnEa7@kekkonen.localdomain>
References: <20260731-mira220-v11-0-1295fe17021d@ideasonboard.com>
 <20260731-mira220-v11-2-1295fe17021d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731-mira220-v11-2-1295fe17021d@ideasonboard.com>

Hi Jacopo,

Just a few comments...

On Fri, Jul 31, 2026 at 05:28:20PM +0200, Jacopo Mondi wrote:
> From: Philippe Baetens <philippebaetens@gmail.com>
> 
> Add a V4L2 subdev driver for driver for the AMS-OSRAM Mira220 image
> sensor.
> 
> Mira220 is a global shutter image sensor with a resolution of 1600x1400
> pixels.
> 
> The driver implements support for mono and RGB 12, 10 and 8 bits
> formats. The output data-rate per lane is 1500Mbit/s, with a maximum
> frame rate up to 90 fps.
> 
> Signed-off-by: Philippe Baetens <philippebaetens@gmail.com>

Should there be Co-developed-by: tag here?

> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
> 

...

> +/* Initialize control handlers */
> +static int mira220_init_controls(struct mira220 *mira220)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&mira220->sd);
> +	struct v4l2_ctrl_handler *ctrl_hdlr;
> +	struct v4l2_fwnode_device_properties props;
> +	struct v4l2_ctrl *link_freq;
> +	struct v4l2_ctrl *hblank;
> +	u32 max_exposure = 0;
> +	u32 min_vblank;
> +	u32 hblank_val;
> +	int ret;
> +
> +	ctrl_hdlr = &mira220->ctrl_handler;
> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
> +	if (ret)
> +		return ret;
> +
> +	/* By default, PIXEL_RATE is read only */
> +	v4l2_ctrl_new_std(ctrl_hdlr, &mira220_ctrl_ops, V4L2_CID_PIXEL_RATE,
> +			  MIRA220_PIXEL_RATE, MIRA220_PIXEL_RATE, 1,
> +			  MIRA220_PIXEL_RATE);
> +
> +	min_vblank = mira220_calc_min_vblank(mira220);
> +	mira220->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &mira220_ctrl_ops,
> +					    V4L2_CID_VBLANK,
> +					    min_vblank, MIRA220_MAX_VBLANK, 1,
> +					    min_vblank);
> +
> +	link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, NULL, V4L2_CID_LINK_FREQ,
> +					   0, 0, &mira220_link_freqs[0]);
> +
> +	/*
> +	 * Scale hblank according to the number of enabled data lanes to match
> +	 * row_length.
> +	 */
> +	hblank_val = MIRA220_LLP_1600x1400_304 * (2 / mira220->lanes)
> +		   - MIRA220_PIXEL_ARRAY_WIDTH;
> +	hblank = v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_HBLANK, hblank_val,
> +				   hblank_val, 1, hblank_val);
> +
> +	/* Max exposure is determined by vblank + vsize and Tglob. */
> +	max_exposure = mira220_calc_exposure(mira220,
> +					     MIRA220_PIXEL_ARRAY_HEIGHT,
> +					     min_vblank);
> +	mira220->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &mira220_ctrl_ops,
> +					      V4L2_CID_EXPOSURE,
> +					      MIRA220_EXPOSURE_MIN,
> +					      max_exposure, 1,
> +					      MIRA220_DEFAULT_EXPOSURE);
> +
> +	v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_ANALOGUE_GAIN,
> +			  MIRA220_ANALOG_GAIN_MIN, MIRA220_ANALOG_GAIN_MAX,
> +			  MIRA220_ANALOG_GAIN_STEP,
> +			  MIRA220_ANALOG_GAIN_DEFAULT);
> +
> +	mira220->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &mira220_ctrl_ops,
> +					   V4L2_CID_HFLIP, 0, 1, 1, 0);
> +
> +	mira220->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &mira220_ctrl_ops,
> +					   V4L2_CID_VFLIP, 0, 1, 1, 0);
> +
> +	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &mira220_ctrl_ops,
> +				     V4L2_CID_TEST_PATTERN,
> +				     ARRAY_SIZE(mira220_test_pattern_menu) - 1,
> +				     0, 0, mira220_test_pattern_menu);
> +
> +	v4l2_fwnode_device_parse(&client->dev, &props);
> +	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &mira220_ctrl_ops,
> +					&props);
> +
> +	if (ctrl_hdlr->error) {
> +		ret = ctrl_hdlr->error;
> +		goto error;
> +	}
> +
> +	mira220->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> +	mira220->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> +	link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +	hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	mira220->sd.ctrl_handler = ctrl_hdlr;
> +
> +	return 0;
> +
> +error:
> +	v4l2_ctrl_handler_free(ctrl_hdlr);
> +	return ret;

You can return ctrl_hdlr->error here and omit assigning ret.

> +}
> +
> +static int mira220_parse_endpoint(struct device *dev, struct mira220 *mira220)
> +{
> +	struct fwnode_handle *endpoint __free(fwnode_handle) = NULL;
> +	struct v4l2_fwnode_endpoint ep_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY
> +	};
> +	unsigned long bitmap;
> +
> +	endpoint = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
> +	if (v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg))
> +		return dev_err_probe(dev, -EINVAL, "Failed to parse endpoint\n");
> +
> +	/* Non-continuous mode not implemented. */
> +	if (ep_cfg.bus.mipi_csi2.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK) {
> +		v4l2_fwnode_endpoint_free(&ep_cfg);

I recall I've commented about this before -- please do switch to goto-based
error handling when you need to unwind something in more than one case.

These probably apply to the mira016 driver, too. How much do these two have
in common btw.?

> +		return dev_err_probe(dev, -EINVAL,
> +				     "clock non-continuous mode not supported\n");
> +	}
> +
> +	/*
> +	 * Link frequencies: the driver supports a single link frequency,
> +	 * no need to check bitmap after this call.
> +	 */
> +	if (v4l2_link_freq_to_bitmap(dev, ep_cfg.link_frequencies,
> +				     ep_cfg.nr_of_link_frequencies,
> +				     mira220_link_freqs,
> +				     ARRAY_SIZE(mira220_link_freqs),
> +				     &bitmap)) {
> +		v4l2_fwnode_endpoint_free(&ep_cfg);
> +		return -EINVAL;
> +	}
> +
> +	/* Check the number of MIPI CSI2 data lanes */
> +	if (ep_cfg.bus.mipi_csi2.num_data_lanes != 1 &&
> +	    ep_cfg.bus.mipi_csi2.num_data_lanes != 2) {
> +		v4l2_fwnode_endpoint_free(&ep_cfg);
> +		return dev_err_probe(dev, -EINVAL,
> +				     "%u data lanes are not supported\n",
> +				      ep_cfg.bus.mipi_csi2.num_data_lanes);
> +	}
> +
> +	mira220->lanes = ep_cfg.bus.mipi_csi2.num_data_lanes;
> +	v4l2_fwnode_endpoint_free(&ep_cfg);
> +
> +	return 0;
> +}
> +
> +static int mira220_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct mira220 *mira220;
> +	int ret;
> +
> +	mira220 = devm_kzalloc(&client->dev, sizeof(*mira220), GFP_KERNEL);
> +	if (!mira220)
> +		return -ENOMEM;
> +
> +	v4l2_i2c_subdev_init(&mira220->sd, client, &mira220_subdev_ops);
> +	mira220->sd.internal_ops = &mira220_internal_ops;
> +
> +	ret = mira220_parse_endpoint(dev, mira220);
> +	if (ret)
> +		return ret;
> +
> +	mira220->regmap = devm_cci_regmap_init_i2c(client, 16);
> +	if (IS_ERR(mira220->regmap))
> +		return dev_err_probe(dev, PTR_ERR(mira220->regmap),
> +				     "failed to initialize CCI\n");
> +
> +	/* Get system clock (xclk) */
> +	mira220->xclk = devm_v4l2_sensor_clk_get(dev, NULL);
> +	if (IS_ERR(mira220->xclk))
> +		return dev_err_probe(dev, PTR_ERR(mira220->xclk),
> +				     "failed to get xclk\n");
> +
> +	mira220->xclk_freq = clk_get_rate(mira220->xclk);
> +	if (mira220->xclk_freq != MIRA220_SUPPORTED_XCLK_FREQ) {
> +		dev_err(dev, "xclk frequency not supported: %d Hz\n",
> +			mira220->xclk_freq);
> +		return -EINVAL;
> +	}
> +
> +	ret = mira220_get_regulators(mira220);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get regulators\n");
> +
> +	mira220->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> +						      GPIOD_OUT_HIGH);
> +	if (IS_ERR(mira220->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(mira220->reset_gpio),
> +				     "failed to get reset gpio\n");
> +
> +	ret = mira220_power_on(dev);
> +	if (ret)
> +		return ret;
> +
> +	/* Enable runtime PM and power on the device */
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +
> +	ret = mira220_identify_module(mira220);
> +	if (ret)
> +		goto error_power_off;
> +
> +	ret = mira220_init_controls(mira220);
> +	if (ret)
> +		goto error_power_off;
> +
> +	/* Initialize subdev */
> +	mira220->sd.internal_ops = &mira220_internal_ops;
> +	mira220->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	mira220->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +
> +	/* Initialize source pads */
> +	mira220->pad.flags = MEDIA_PAD_FL_SOURCE;
> +
> +	ret = media_entity_pads_init(&mira220->sd.entity, 1, &mira220->pad);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to init entity pads\n");
> +		goto error_handler_free;
> +	}
> +
> +	mira220->sd.state_lock = mira220->ctrl_handler.lock;
> +	ret = v4l2_subdev_init_finalize(&mira220->sd);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret, "subdev init error\n");
> +		goto error_media_entity;
> +	}
> +
> +	ret = v4l2_async_register_subdev_sensor(&mira220->sd);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret,
> +			      "failed to register sensor sub-device\n");
> +		goto error_subdev_cleanup;
> +	}
> +
> +	pm_runtime_set_autosuspend_delay(dev, 1000);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_idle(dev);
> +
> +	return 0;
> +
> +error_subdev_cleanup:
> +	v4l2_subdev_cleanup(&mira220->sd);
> +error_media_entity:
> +	media_entity_cleanup(&mira220->sd.entity);
> +error_handler_free:
> +	v4l2_ctrl_handler_free(mira220->sd.ctrl_handler);
> +error_power_off:
> +	pm_runtime_disable(dev);
> +	mira220_power_off(dev);
> +	pm_runtime_set_suspended(dev);
> +	return ret;
> +}
> +
> +static void mira220_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct mira220 *mira220 = to_mira220(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(&mira220->sd);
> +	media_entity_cleanup(&sd->entity);
> +
> +	v4l2_ctrl_handler_free(mira220->sd.ctrl_handler);
> +
> +	pm_runtime_disable(&client->dev);
> +	if (!pm_runtime_status_suspended(&client->dev))
> +		mira220_power_off(&client->dev);
> +	pm_runtime_set_suspended(&client->dev);

This needs to be conditional to the device not being suspended.

> +}
> +
> +static const struct dev_pm_ops mira220_pm_ops = {
> +	SET_RUNTIME_PM_OPS(mira220_power_off, mira220_power_on, NULL)
> +};
> +
> +static const struct of_device_id mira220_dt_ids[] = {
> +	{ .compatible = "ams,mira220" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, mira220_dt_ids);
> +
> +static struct i2c_driver mira220_i2c_driver = {
> +	.driver = {
> +		.name = "mira220",
> +		.of_match_table	= mira220_dt_ids,
> +		.pm = pm_ptr(&mira220_pm_ops),
> +	},
> +	.probe = mira220_probe,
> +	.remove = mira220_remove,
> +};
> +
> +module_i2c_driver(mira220_i2c_driver);
> +
> +MODULE_AUTHOR("Philippe Baetens <philippe.baetens@ams-osram.com>");
> +MODULE_DESCRIPTION("ams MIRA220 sensor driver");
> +MODULE_LICENSE("GPL");
> 

-- 
Kind regards,

Sakari Ailus
