Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7851A43F4A9;
	Fri, 28 Aug 2026 12:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787918770; cv=none; b=emkYHn2uytJ0dAu8wKml9xQvVafKy9FBCUcZXFiuU7FEPkUpeJQTIrstWpdAqHsGpqADSvMMVp40ma3PFyRBrZUGi3mz3vMKQ2nIzbSwje6+XaAK2CaiHwxtBHEX1I3Qh+Lj59zp7BzCJIJHclZOlm/RsdEu+D6UVyLa6eYWlf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787918770; c=relaxed/simple;
	bh=b9dEQwv8yULWAvnOy7yz0oXSQomKF0iiQpwFZo9W8BU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EoUuM8owoKUTmE2qCfZWSHc/pAdnx7q6u27zyR8hbNJcIWLn8H0/owobSa0Z8KgdxJRxYlahv3BfGHsk353YUeX3RMHS8zdJX6mLX7BpyM//eH5mgkAtli9MqvYGZO5uSs8AHpWhxFw6o9umzmPzyehkrMQDXWREDbmpLOl5ZSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xs/A8GG7; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xs/A8GG7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787918766; x=1819454766;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b9dEQwv8yULWAvnOy7yz0oXSQomKF0iiQpwFZo9W8BU=;
  b=Xs/A8GG7R0jV3hKFyccjPU1Enn2xnAHECK5djQwGQL62XQoW4c0cc6t0
   0TcjE7OwKbP9rMRXeDyMeU5mnAKNjqSSowY98+h/RGgvIi0NUJZlSjkX5
   zRRHDk4Vw1dgF7oBKL8pn0cnHrA6nboeIGNvCI8sOQr9i5yKQpUYQ3CYM
   ED5ry9g+B4o64kJeyACGjnD+b6lUEhHZioyiVTJK0TtJPKwseftKP1qBj
   8kys+WKka0z0pv8Xt0P6PKtC2IBakI4IZX8HJOpwSqUKr73PwXbPS7sj9
   YHlDHOWcwcVlLoEtKXzFjs+LSfydUEXXb8H9zze9zyvGt1OSOAS3DZfo2
   g==;
X-CSE-ConnectionGUID: QloeilKmSZeq1U7H78ybvg==
X-CSE-MsgGUID: LpKj3YELRIyKpL1b/Gg9NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88631858"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="88631858"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 05:06:03 -0700
X-CSE-ConnectionGUID: leNdu+mfSMuBHkKjWzcrKQ==
X-CSE-MsgGUID: GhmbyLvbTqCh+smbzTGK2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="261992159"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.92])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 05:06:00 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9264511F817;
	Fri, 28 Aug 2026 15:05:55 +0300 (EEST)
Date: Fri, 28 Aug 2026 15:05:55 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: muzafferkadir@mainlining.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, git@luigi311.com,
	pavel@ucw.cz, tomm.merciai@gmail.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
	=?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
Subject: Re: [PATCH] media: i2c: imx258: Add reset-gpio support
Message-ID: <apF5oxsCf7MJt1lk@kekkonen.localdomain>
References: <20260828-imx258-add-reset-gpio-patch-v1-1-633972d2a700@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828-imx258-add-reset-gpio-patch-v1-1-633972d2a700@mainlining.org>

Hi Muzaffer,

Thanks for the set.

On Fri, Aug 28, 2026 at 01:51:47PM +0300, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> reset-gpio is already documented in dt-bindings but never implemented
> in the driver.
> Reset deassert delay comes from Luis Garcia's and Ondrej Jirman's patch.
> 
> Link: https://lore.kernel.org/all/20240602201345.328737-22-git@luigi311.com
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
> ---
> I have a device that is not upstreamed yet (General Mobile Shamrock)
> whose camera needs reset gpio to probe, it is documented for
> dts check but not implemented for some reason.
> With adding it rear camera on the device probes correctly.
> 
> I created this patch without knowing the older one that submitted
> before: https://lore.kernel.org/all/20240602201345.328737-22-git@luigi311.com/
> 
> I don't fully know the correct reset timing so I was using a random wait before,
> after I discovered existing patch I reused previous work for delay time after reset.
> ---
>  drivers/media/i2c/imx258.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index bc9ee449a87c..af3f12c7452a 100644
> --- a/drivers/media/i2c/imx258.c
> +++ b/drivers/media/i2c/imx258.c
> @@ -9,6 +9,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/unaligned.h>
> +#include <linux/gpio/consumer.h>
>  
>  #include <media/v4l2-cci.h>
>  #include <media/v4l2-ctrls.h>
> @@ -681,6 +682,7 @@ struct imx258 {
>  
>  	struct clk *clk;
>  	struct regulator_bulk_data supplies[IMX258_NUM_SUPPLIES];
> +	struct gpio_desc *reset_gpio;
>  };
>  
>  static inline struct imx258 *to_imx258(struct v4l2_subdev *_sd)
> @@ -1128,6 +1130,18 @@ static int imx258_power_on(struct device *dev)
>  	if (ret) {
>  		dev_err(dev, "failed to enable clock\n");
>  		regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
> +		return ret;
> +	}
> +
> +	if (imx258->reset_gpio) {
> +		ret = gpiod_set_value_cansleep(imx258->reset_gpio, 0);
> +		if (ret) {
> +			dev_err(dev, "failed to deassert reset\n");
> +			clk_disable_unprepare(imx258->clk);
> +			regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
> +			return ret;

This warrants reworking error handling; please use gotos and move it to the
end of the function. Same for clock error handling.

> +		}
> +		usleep_range(400, 500);

The delay seems right. Can you use fsleep()?

In fact the delay should always have been there so this is a bugfix. It
should go to a separate patch.

>  	}
>  
>  	return ret;
> @@ -1138,6 +1152,7 @@ static int imx258_power_off(struct device *dev)
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>  	struct imx258 *imx258 = to_imx258(sd);
>  
> +	gpiod_set_value_cansleep(imx258->reset_gpio, 1);
>  	clk_disable_unprepare(imx258->clk);
>  	regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
>  
> @@ -1382,6 +1397,11 @@ static int imx258_probe(struct i2c_client *client)
>  		return ret;
>  	}
>  
> +	imx258->reset_gpio = devm_gpiod_get_optional(imx258->dev, "reset", GPIOD_OUT_HIGH);

Over 80, please wrap (there's another earlier, too).

> +	if (IS_ERR(imx258->reset_gpio))
> +		return dev_err_probe(imx258->dev, PTR_ERR(imx258->reset_gpio),
> +				     "Failed to get reset-gpios\n");
> +
>  	ret = imx258_get_regulators(imx258);
>  	if (ret)
>  		return dev_err_probe(imx258->dev, ret,
> 

-- 
Kind regards,

Sakari Ailus
