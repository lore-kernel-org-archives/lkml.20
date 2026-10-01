Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7283C442135;
	Thu,  1 Oct 2026 10:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852299; cv=none; b=OWekzRvYzr+mdsA0TKpwFIo7BL1zYiNUNZm/lA3Bimx+fiETS6opRuQJBptdyHA5OPTVAhaiZxHU0LjM5/jjexKE8dzH6tOTsM7CAZJp/PLJAlq6i5p5Xx79jCv7doMrrVjj5LNY5k1RN1lKKS0wYL2/Nq88gK5eJaqreiPXM6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852299; c=relaxed/simple;
	bh=RqRxynyai8pcaz/HuEMQJirMhdcOCbstIy/jm0yIGmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nq2u5zluRs8+jumuqxcyD8lVWxZli9Yd88mLQk/x3vyjD2YEhupQ0GxlBPyWc+H4+NmHmNchEK9FNFLIfQbXUrFRzYvjy9jAX5grHqyapowWV0qaiKWV881VtrHF9jpUmm1s9TTWBFhoWMbuwmI+8zb1iZssm3b6L54nOI6/3lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fTSDu/Kq; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fTSDu/Kq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790852297; x=1822388297;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RqRxynyai8pcaz/HuEMQJirMhdcOCbstIy/jm0yIGmU=;
  b=fTSDu/KqITgK47qA2Dumtty5pW2+paMNXE8P0ArCo+KIiM6W33FhZCwN
   Os+Q02XIdZ7redmzjGX7N/d2p0H+rKq4W9k3aN6i8Y5EB/0lxYiHTOlM0
   O64YkLq0wG0XZWsC5c0hujqDa5okszvnEj8poZKXmZkFO9DWhMZ4WZbMy
   T+zkOUMZliesh9QwwCatLSmWXPywTRUHD4NyW97QSwn8yl2SBBct8t2xd
   eTMXTZHmBCEHBOVnZ49gWH3tQASIhKHXxiej073GO8abl+pjyeqHLnQ/I
   5JcltEFw/S/0oeJcM6sU2GPXty6EMMrEYqTjS1UyJ91bLTqvRDPrQepXX
   w==;
X-CSE-ConnectionGUID: CiIf6tHcTF2xND/MB1Q3Lw==
X-CSE-MsgGUID: xsP18LmvQHSTBE5HH26BiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91702417"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="91702417"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 03:58:15 -0700
X-CSE-ConnectionGUID: keXulf5wSTCfmwb1+qeL+w==
X-CSE-MsgGUID: lWw6cLGCSrGK4wTFXYhUKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="276007649"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.7])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 03:58:13 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3FA01121BA0;
	Thu, 01 Oct 2026 13:58:10 +0300 (EEST)
Date: Thu, 1 Oct 2026 13:58:10 +0300
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
Subject: Re: [PATCH v5 2/2] media: i2c: mira016: Add driver for Mira016
Message-ID: <ar48wuZ5ExmCXyY7@kekkonen.localdomain>
References: <20260930-mira016-v5-0-499a34ab8204@ideasonboard.com>
 <20260930-mira016-v5-2-499a34ab8204@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-mira016-v5-2-499a34ab8204@ideasonboard.com>

Hi Jacopo,

One more small issue...

On Wed, Sep 30, 2026 at 12:51:20PM +0200, Jacopo Mondi wrote:

...

> +static int mira016_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct mira016 *mira016;
> +	int ret;
> +
> +	mira016 = devm_kzalloc(&client->dev, sizeof(*mira016), GFP_KERNEL);
> +	if (!mira016)
> +		return -ENOMEM;
> +
> +	mira016->dev = &client->dev;
> +
> +	ret = mira016_parse_endpoint(dev, mira016);
> +	if (ret)
> +		return ret;
> +
> +	v4l2_i2c_subdev_init(&mira016->sd, client, &mira016_subdev_ops);
> +
> +	mira016->regmap = devm_cci_regmap_init_i2c(client, 16);
> +	if (IS_ERR(mira016->regmap))
> +		return dev_err_probe(dev, PTR_ERR(mira016->regmap),
> +				     "failed to initialize CCI\n");
> +
> +	mira016->xclk = devm_v4l2_sensor_clk_get(dev, NULL);
> +	if (IS_ERR(mira016->xclk))
> +		return dev_err_probe(dev, PTR_ERR(mira016->xclk),
> +				     "failed to get xclk\n");
> +
> +	mira016->xclk_freq = clk_get_rate(mira016->xclk);
> +	if (mira016_validate_xclk_freq(mira016)) {
> +		dev_err(dev, "xclk frequency not supported: %d Hz\n",
> +			mira016->xclk_freq);
> +		return -EINVAL;
> +	}
> +
> +	ret = mira016_get_regulators(mira016);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get regulators\n");
> +
> +	mira016->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> +						      GPIOD_OUT_HIGH);
> +	if (IS_ERR(mira016->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(mira016->reset_gpio),
> +				     "failed to get reset gpio\n");
> +
> +	/*
> +	 * Calculate the PLL configuration based on the link frequency
> +	 * selected by .dts and compute the sensor timing bases.
> +	 *
> +	 * Initialize row_length to a value matching the default format for
> +	 * exposure and frame time limits calculations.
> +	 */
> +	mira016_pll_calc(mira016);
> +	mira016_timings_calc(mira016);
> +	mira016->timings.row_length = 1262;
> +
> +	ret = mira016_power_on(dev);
> +	if (ret)
> +		return ret;
> +
> +	/* Enable runtime PM and power on the device */
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +
> +	ret = mira016_identify_module(mira016);
> +	if (ret)
> +		goto error_power_off;
> +
> +	ret = mira016_init_controls(mira016);
> +	if (ret)
> +		goto error_power_off;
> +
> +	/* Initialize subdev */
> +	mira016->sd.internal_ops = &mira016_internal_ops;
> +	mira016->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	mira016->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +
> +	/* Initialize source pads */
> +	mira016->pad.flags = MEDIA_PAD_FL_SOURCE;
> +
> +	ret = media_entity_pads_init(&mira016->sd.entity, 1, &mira016->pad);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to init entity pads\n");
> +		goto error_handler_free;
> +	}
> +
> +	mira016->sd.state_lock = mira016->ctrl_handler.lock;
> +	ret = v4l2_subdev_init_finalize(&mira016->sd);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret, "subdev init error\n");
> +		goto error_media_entity;
> +	}
> +
> +	ret = v4l2_async_register_subdev_sensor(&mira016->sd);
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
> +	v4l2_subdev_cleanup(&mira016->sd);
> +error_media_entity:
> +	media_entity_cleanup(&mira016->sd.entity);
> +error_handler_free:
> +	v4l2_ctrl_handler_free(mira016->sd.ctrl_handler);
> +error_power_off:
> +	pm_runtime_disable(dev);
> +	if (!pm_runtime_status_suspended(&client->dev))
> +		mira016_power_off(dev);
> +	pm_runtime_set_suspended(dev);

These two come in pairs effectively. The sensor has been powered on earlier
and not powered off, so you can omit the suspended check above.

> +	return ret;
> +}

-- 
Regards,

Sakari Ailus
