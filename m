Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA8E1940B0;
	Thu, 27 Aug 2026 20:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787862680; cv=none; b=NoiyOLxxvE6rgcn9ZyksoRjx8Ko5Lb4PaWG1Fn8o5e6gEtHDaOZv6nqj2qRTsIXyYZNf8HKjkB5zfJB0sknZhHyuVhd0s0Jqi3eDBPn+W430MQUkUWrrSBF5p/Iak9w+OvN/sJ5o7chW4qJMA5LYhZjNXLT4RAXYBB4agy7Rqbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787862680; c=relaxed/simple;
	bh=o9ZLn4/k+h2TeWv1kAj7lq3icvlpy8dz5ikG0lg5Kfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e91Y3ikpyaKWAKsKQV3psJqayop5SaiVp4Jrpp06QsegiWGm2dYCO7Ony/P/l+JOZI3t/Hq9nPcncvzxJWLnzsr1VDPbQS9Lqu/Fb56NkXUgbSeLDdsglpYLyTYGcSkm0h4AFuyaE6XtzxyUmHRAwtiGHdwQ1Wv0KJF/UbgXrdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Omx4iszI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Omx4iszI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787862678; x=1819398678;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o9ZLn4/k+h2TeWv1kAj7lq3icvlpy8dz5ikG0lg5Kfo=;
  b=Omx4iszIxOOh+srT7ctxHLTnrHSP2XNn8CHD2qjcfqZtrJRe0NTdXLzD
   1ux0b1jtmmXqy7D2U6KWnt9YeTEMxiOAp22qnwx+u6AfEOsL2Gjn30hCV
   abZH0H1dqwPlHSCwHI9IjbTi7GyQiUnixJlM6RyKBS2s16UIMUL+yqiAl
   WFqaHRfiLVlrfyIurNBScwMu9HmZigEBzMyzu6S7yQlCj1BEW8XsCMgZk
   1kU/boERAnsY6mROLq47OsKmkwXQYUUAIvVae/c//3TA1N74UfwejLaeF
   0kCi9ZlkiHmf5ZiSAhPWkagpNtZYTf1zGjpf7tM3xugOkvGFIfmEhezKc
   g==;
X-CSE-ConnectionGUID: Ter2WnKITV29g9qbeuiKJQ==
X-CSE-MsgGUID: /fvXuNk/RUeVHXcfs2r9Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88389832"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="88389832"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 13:31:18 -0700
X-CSE-ConnectionGUID: XB7kHFKqTkajqiVvOG+zOQ==
X-CSE-MsgGUID: XSFR7SFySPaYZxMzMnGBEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="272192126"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 13:31:14 -0700
Date: Thu, 27 Aug 2026 23:31:12 +0300
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
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/11] media: i2c: Add WV517S lens actuator driver
Message-ID: <apCekMRvLJ1BPo4Q@ashevche-desk.local>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-12-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827181756.2430054-12-mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Aug 27, 2026 at 08:17:56PM +0200, Maurizio Casciano wrote:
> The Lenovo Yoga Book YB1-X91 rear camera contains a WV517S voice-coil
> actuator. Add a V4L2 lens subdevice exposing the standard 10-bit
> FOCUS_ABSOLUTE control and the device ringing-control mode.
> 
> Use regmap for register access and tie control updates to runtime PM so
> the IPU bridge sensor link keeps shared power resources active. Propagate
> PM acquisition failures and restore the drive mode and controls after
> resume.
> 
> The register addresses and drive-mode value are derived from Intel's
> GPL-2.0 WV517 driver. Retain the Intel copyright notice and document the
> 2026 copyright for this V4L2/regmap implementation.

...

+ container_of.h
+ device.h // dev_get_drvdata()

> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>

+ types.h // true, false

> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>

...

> +static int wv517s_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct wv517s_device *wv517s = container_of(ctrl->handler,
> +						      struct wv517s_device,
> +						      ctrl_handler);

	struct wv517s_device *wv517s =
		container_of(ctrl->handler, struct wv517s_device, ctrl_handler);

> +	struct device *dev = wv517s->sd.dev;
> +	int pm_ret;
> +	int ret;
> +
> +	/* Runtime resume restores controls while the PM state is RPM_RESUMING. */
> +	pm_ret = pm_runtime_get_if_active(dev);
> +	if (!pm_ret && !wv517s->resuming)
> +		return 0;
> +	if (pm_ret < 0)
> +		return pm_ret;

> +	if (ctrl->id == V4L2_CID_FOCUS_ABSOLUTE)
> +		ret = regmap_write(wv517s->regmap, WV517S_REG_FOCUS,
> +				   ctrl->val);
> +	else
> +		ret = -EINVAL;

The else branch can be done before even trying runtime PM.

> +	if (pm_ret > 0)
> +		pm_runtime_put(dev);
> +
> +	return ret;
> +}

...

> +static int wv517s_probe(struct i2c_client *client)
> +{

	struct device *dev = &client->dev;

> +	struct wv517s_device *wv517s;
> +	int ret;
> +
> +	wv517s = devm_kzalloc(&client->dev, sizeof(*wv517s), GFP_KERNEL);

	wv517s = devm_kzalloc(dev, sizeof(*wv517s), GFP_KERNEL);

and so on...

> +	if (!wv517s)
> +		return -ENOMEM;
> +
> +	wv517s->regmap = devm_regmap_init_i2c(client, &wv517s_regmap_config);
> +	if (IS_ERR(wv517s->regmap))
> +		return dev_err_probe(&client->dev, PTR_ERR(wv517s->regmap),
> +				     "failed to initialize regmap\n");
> +
> +	v4l2_i2c_subdev_init(&wv517s->sd, client, &wv517s_subdev_ops);
> +	wv517s->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	wv517s->sd.internal_ops = &wv517s_internal_ops;
> +	wv517s->sd.entity.function = MEDIA_ENT_F_LENS;
> +
> +	v4l2_ctrl_handler_init(&wv517s->ctrl_handler, 1);
> +	v4l2_ctrl_new_std(&wv517s->ctrl_handler, &wv517s_ctrl_ops,
> +			  V4L2_CID_FOCUS_ABSOLUTE, 0,
> +			  WV517S_MAX_FOCUS_POSITION, 1,
> +			  WV517S_DEFAULT_FOCUS_POSITION);
> +	if (wv517s->ctrl_handler.error) {
> +		ret = wv517s->ctrl_handler.error;
> +		goto err_free_ctrl_handler;
> +	}
> +	wv517s->sd.ctrl_handler = &wv517s->ctrl_handler;
> +
> +	ret = media_entity_pads_init(&wv517s->sd.entity, 0, NULL);
> +	if (ret)
> +		goto err_free_ctrl_handler;
> +
> +	pm_runtime_set_active(&client->dev);
> +	pm_runtime_enable(&client->dev);
> +
> +	ret = wv517s_resume(&client->dev);
> +	if (ret)
> +		goto err_disable_pm;
> +
> +	ret = v4l2_async_register_subdev(&wv517s->sd);
> +	if (ret)
> +		goto err_disable_pm;
> +
> +	pm_runtime_idle(&client->dev);
> +
> +	return 0;
> +
> +err_disable_pm:
> +	pm_runtime_disable(&client->dev);
> +	media_entity_cleanup(&wv517s->sd.entity);
> +err_free_ctrl_handler:
> +	v4l2_ctrl_handler_free(&wv517s->ctrl_handler);
> +
> +	return ret;
> +}

...

> +static const struct i2c_device_id wv517s_id_table[] = {
> +	{ "wv517s" },

Use C99 initialisers.

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, wv517s_id_table);

> +static DEFINE_RUNTIME_DEV_PM_OPS(wv517s_pm_ops, NULL, wv517s_resume, NULL);

Move it up, closer to the implementation of the resume callback.

-- 
With Best Regards,
Andy Shevchenko


