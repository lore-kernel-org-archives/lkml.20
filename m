Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227308;
	b=h4oUAV0+isxQl9/8sK7OMZHdorJ0rmzF5Y1TqElTtt1wuqzvqnpCDwHZTECmZ5jw3hE2
	 llQDCA/29L+02hSnWLMZOfDhaCzadVMwHyZqhA2thPQjG+orXuTeDpTCjHwto5CSaDmwg
	 D8WOYcYlxTe72XSbcBoFM6xIvLs3fFVYeYPjFq8E5xmXA2A+0jAYXTt3NzAOvF/Hwph+/
	 bbOdbyrBYpOeV87mzZXCSTJfKlHs/l4jBg0gDwphNuaPZZFPl6297YqZY7uxb6cBMnd6u
	 OX2dMU+PAG8P6E9NETCCLQAxM76aNHVDVZBAIy3chv55/E3Sh+a+EY/4Lqt9fpND2IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227308;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=TKHJ6/gYBaGflBTD+nmCCKlWSOPEENMW/l/5GYSk9qI=;
	b=BFieGWzpKgABgD2nu1BRJnBGjLgAbuICl0hPpelCMcO2AVBHnRAEadkQB2vEIZbh8pRb
	 HGvX7e/UhKb9LA149JcP4Uq4/5TIR7tnB1yFu2fIBkbNYldb5DACP9ipwACBDE6NW9KLi
	 EOna7OLYbtfS/2Eg0uwx9Oc+XlS8krLpb6GC+WCHzZDdI0snJac0GC3kmP3AbZgq4FJHj
	 BYGLXL2eXGdGWlToLM9WE25ZChJLp7TktNJTyJlQ9MEBYqJ+n6oykmBGmHnUBPAIhYVKS
	 QGx42owKQwfJovkmyM9COLlSf4JpkOacSQ3dPxEVylMWaCS5kZRsfKjcAcyNfNWiPpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I+4Piz08;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FC9606A322;
	Mon,  9 Nov 2026 12:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88FC9606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I+4Piz08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794227308; x=1825763308;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xin5qebVZnNrHswSAcjXGRocPNW79QGhq8ix6ABBAU4=;
  b=I+4Piz08iiIKkmAnzak/C9qjYHR6gMMN3DrzpWyaXfU1u1xzbbGMVqPY
   hRX+4xmSeMK2Z8Zl+/uqLMOrrXK+vgRCkhHU5kiMlBBkqzKReEivHiO8s
   kQbvoR5ymCIaJChRpH+hq0gBA4mE1Gv2SnZFMfRdmbwju1AyMzMywGEv0
   eNJJS7/cP2ugCP5zPvv52kwk6k5xjrUdYi5FbQDWGIdk2inuIJV2jTb1E
   ma1k+DkIcqnqQCYbjJ+eHAUbOes1p6NCbyxQVk4mrF3CXd/ckq/GWqoLL
   rVR+qlPeK86i3g0RUbOCfzZi7iVQRxrV2ZzBcQ20tzaCA9octdDoAEQGQ
   A==;
X-CSE-ConnectionGUID: 0Bkm4/xjQxev9HyepMToxQ==
X-CSE-MsgGUID: GY8amjpaTPyP+07sWrSQ4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2824455"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2824455"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 04:28:27 -0800
X-CSE-ConnectionGUID: lvti2DBeToCoiYEIAdjSnA==
X-CSE-MsgGUID: YhC5J2GdQ9yq8z5po+c5VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7979214"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.119])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 04:28:25 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3BB02121B96;
	Mon, 09 Nov 2026 14:28:22 +0200 (EET)
Date: Mon, 9 Nov 2026 14:28:22 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: tin.posavec04@gmail.com
Cc: Bingbu Cao <bingbu.cao@amd.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: i2c: ov9734: Add power on/off sequencing
 support
Message-ID: <avG8ZgDPVWCr1pja@kekkonen.localdomain>
References: <20261017-ov9734-ipu6-v1-0-86eab22ae258@gmail.com>
 <20261017-ov9734-ipu6-v1-2-86eab22ae258@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017-ov9734-ipu6-v1-2-86eab22ae258@gmail.com>

Hi Tin,

On Sat, Oct 17, 2026 at 10:31:58AM +0200, Tin Posavec via B4 Relay wrote:
> From: Tin Posavec <tin.posavec04@gmail.com>
> 
> So far the driver has relied on ACPI to power the sensor on and off. On
> the Intel NUC M15 (LAPRC710), however, the sensor's ACPI device has
> neither _PS0 nor _PR0. Its avdd supply and clock are provided by an
> INT3472 discrete device instead, and as the driver does not enable
> them, reading the chip ID in probe fails with -EREMOTEIO.
> 
> Get the dovdd, avdd and dvdd supplies and the optional reset and
> powerdown GPIOs, and power the sensor on and off in the runtime PM
> callbacks. Also power it on in probe before identifying it, and off on
> probe errors and in remove() if it is still powered on. The 2 ms reset
> assertion time and the 20 ms start-up delay are taken from ov01a10.
> 
> Move pm_runtime_idle() after the sub-device registration, so that the
> sensor is not powered off twice if the registration fails, and drop the
> comment saying that the I2C core has already powered the device on.
> 
> Assisted-by: LLM
> Signed-off-by: Tin Posavec <tin.posavec04@gmail.com>
> ---
>  drivers/media/i2c/ov9734.c | 125 ++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 118 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov9734.c b/drivers/media/i2c/ov9734.c
> index f9280ef0e..feb15de2c 100644
> --- a/drivers/media/i2c/ov9734.c
> +++ b/drivers/media/i2c/ov9734.c
> @@ -4,9 +4,12 @@
>  #include <linux/acpi.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/time.h>
>  #include <linux/unaligned.h>
>  
>  #include <media/v4l2-ctrls.h>
> @@ -322,9 +325,18 @@ static const struct ov9734_mode supported_modes[] = {
>  	},
>  };
>  
> +static const char * const ov9734_supply_names[] = {
> +	"dovdd",	/* Digital I/O power */
> +	"avdd",		/* Analog power */
> +	"dvdd",		/* Digital core power */
> +};
> +
>  struct ov9734 {
>  	struct device *dev;
>  	struct clk *clk;
> +	struct gpio_desc *reset;
> +	struct gpio_desc *powerdown;
> +	struct regulator_bulk_data supplies[ARRAY_SIZE(ov9734_supply_names)];
>  
>  	struct v4l2_subdev sd;
>  	struct media_pad pad;
> @@ -878,6 +890,88 @@ static int ov9734_check_hwcfg(struct device *dev)
>  	return ret;
>  }
>  
> +static int ov9734_get_pm_resources(struct ov9734 *ov9734)
> +{
> +	int ret;
> +
> +	ov9734->reset = devm_gpiod_get_optional(ov9734->dev, "reset",
> +						GPIOD_OUT_HIGH);
> +	if (IS_ERR(ov9734->reset))
> +		return dev_err_probe(ov9734->dev, PTR_ERR(ov9734->reset),
> +				     "failed to get reset gpio\n");
> +
> +	ov9734->powerdown = devm_gpiod_get_optional(ov9734->dev, "powerdown",
> +						    GPIOD_OUT_HIGH);
> +	if (IS_ERR(ov9734->powerdown))
> +		return dev_err_probe(ov9734->dev, PTR_ERR(ov9734->powerdown),
> +				     "failed to get powerdown gpio\n");
> +
> +	for (unsigned int i = 0; i < ARRAY_SIZE(ov9734_supply_names); i++)
> +		ov9734->supplies[i].supply = ov9734_supply_names[i];
> +
> +	ret = devm_regulator_bulk_get(ov9734->dev,
> +				      ARRAY_SIZE(ov9734_supply_names),
> +				      ov9734->supplies);
> +	if (ret)
> +		return dev_err_probe(ov9734->dev, ret,
> +				     "failed to get regulators\n");
> +
> +	return 0;
> +}
> +
> +static int ov9734_power_on(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov9734 *ov9734 = to_ov9734(sd);
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ov9734_supply_names),
> +				    ov9734->supplies);
> +	if (ret) {
> +		dev_err(dev, "failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(ov9734->clk);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clock: %d\n", ret);
> +		regulator_bulk_disable(ARRAY_SIZE(ov9734_supply_names),
> +				       ov9734->supplies);
> +		return ret;
> +	}
> +
> +	if (ov9734->reset || ov9734->powerdown) {
> +		/*
> +		 * Keep reset/powerdown asserted for at least 2 ms on a
> +		 * back-to-back off-on cycle.
> +		 */

The comment isn't useful. Please drop it.

> +		fsleep(2 * USEC_PER_MSEC);
> +		gpiod_set_value_cansleep(ov9734->powerdown, 0);
> +		gpiod_set_value_cansleep(ov9734->reset, 0);

The sensor appears to need a single GPIO (xshutdown). I wonder what's the
other one.

> +	}
> +
> +	/* Give the sensor time to start up before accessing it */

Ditto.

> +	fsleep(20 * USEC_PER_MSEC);

8192 external clock cycles are required for this.

> +
> +	return 0;
> +}
> +
> +static int ov9734_power_off(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov9734 *ov9734 = to_ov9734(sd);
> +
> +	gpiod_set_value_cansleep(ov9734->reset, 1);
> +	gpiod_set_value_cansleep(ov9734->powerdown, 1);
> +
> +	clk_disable_unprepare(ov9734->clk);
> +
> +	regulator_bulk_disable(ARRAY_SIZE(ov9734_supply_names),
> +			       ov9734->supplies);
> +
> +	return 0;
> +}
> +
>  static void ov9734_remove(struct i2c_client *client)
>  {
>  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> @@ -887,7 +981,10 @@ static void ov9734_remove(struct i2c_client *client)
>  	media_entity_cleanup(&sd->entity);
>  	v4l2_ctrl_handler_free(sd->ctrl_handler);
>  	pm_runtime_disable(ov9734->dev);
> -	pm_runtime_set_suspended(ov9734->dev);
> +	if (!pm_runtime_status_suspended(ov9734->dev)) {
> +		ov9734_power_off(ov9734->dev);
> +		pm_runtime_set_suspended(ov9734->dev);
> +	}
>  	mutex_destroy(&ov9734->mutex);
>  }
>  
> @@ -918,11 +1015,20 @@ static int ov9734_probe(struct i2c_client *client)
>  				     "external clock %lu is not supported",
>  				     freq);
>  
> +	ret = ov9734_get_pm_resources(ov9734);
> +	if (ret)
> +		return ret;
> +
>  	v4l2_i2c_subdev_init(&ov9734->sd, client, &ov9734_subdev_ops);
> +
> +	ret = ov9734_power_on(ov9734->dev);
> +	if (ret)
> +		return ret;
> +
>  	ret = ov9734_identify_module(ov9734);
>  	if (ret) {
>  		dev_err(ov9734->dev, "failed to find sensor: %d", ret);
> -		return ret;
> +		goto probe_error_power_off;
>  	}
>  
>  	mutex_init(&ov9734->mutex);
> @@ -944,13 +1050,8 @@ static int ov9734_probe(struct i2c_client *client)
>  		goto probe_error_v4l2_ctrl_handler_free;
>  	}
>  
> -	/*
> -	 * Device is already turned on by i2c-core with ACPI domain PM.
> -	 * Enable runtime PM and turn off the device.
> -	 */
>  	pm_runtime_set_active(ov9734->dev);
>  	pm_runtime_enable(ov9734->dev);
> -	pm_runtime_idle(ov9734->dev);
>  
>  	ret = v4l2_async_register_subdev_sensor(&ov9734->sd);
>  	if (ret < 0) {
> @@ -959,6 +1060,8 @@ static int ov9734_probe(struct i2c_client *client)
>  		goto probe_error_media_entity_cleanup_pm;
>  	}
>  
> +	pm_runtime_idle(ov9734->dev);
> +
>  	return 0;
>  
>  probe_error_media_entity_cleanup_pm:
> @@ -970,9 +1073,16 @@ static int ov9734_probe(struct i2c_client *client)
>  	v4l2_ctrl_handler_free(ov9734->sd.ctrl_handler);
>  	mutex_destroy(&ov9734->mutex);
>  
> +probe_error_power_off:
> +	ov9734_power_off(ov9734->dev);
> +
>  	return ret;
>  }
>  
> +static const struct dev_pm_ops ov9734_pm_ops = {
> +	RUNTIME_PM_OPS(ov9734_power_off, ov9734_power_on, NULL)
> +};
> +
>  static const struct acpi_device_id ov9734_acpi_ids[] = {
>  	{ "OVTI9734", },
>  	{}
> @@ -983,6 +1093,7 @@ MODULE_DEVICE_TABLE(acpi, ov9734_acpi_ids);
>  static struct i2c_driver ov9734_i2c_driver = {
>  	.driver = {
>  		.name = "ov9734",
> +		.pm = pm_ptr(&ov9734_pm_ops),
>  		.acpi_match_table = ov9734_acpi_ids,
>  	},
>  	.probe = ov9734_probe,
> 

-- 
Regards,

Sakari Ailus
