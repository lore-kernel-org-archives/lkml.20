Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B86415746F;
	Thu, 27 Aug 2026 12:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787833840; cv=none; b=bYDJ3KbN7gYQCKIRHVtKbCdCtcLoyU3xlYpUTOjj8MGOt0BxBFU1p7YDuyI3PluLhCr2Wu4VQujvzytGaNn336g/CgPfKH2VSoWERul81CbXS9EGp6jekog8I2jHRWjFan4gxjOjybrtzcqL2A4T18VhQNu9ZVv2wWFgZwL+zBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787833840; c=relaxed/simple;
	bh=2+/LQ3kAs02R42XJaT2BOkUbLU7uK3XIyx74Wj7iXPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aHRxolP8roJPvEQbN1dxETTnEQXoPcQR/Im2yaTnzxp3+Z0bFDUSxJh18679FZG8KtTGfTj9cUk2YtswQXxlPuXvWuWJIuf5l5MaLOwdWwm1GQkMXUeDSfl60IakKxYx38rNIRmLW9J88nf8tYusULGbiL/tj0rl1+qojPXoArs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ez/zf4gZ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ez/zf4gZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787833837; x=1819369837;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2+/LQ3kAs02R42XJaT2BOkUbLU7uK3XIyx74Wj7iXPo=;
  b=Ez/zf4gZjx9vN4jGJgwcayBuNzlFmXHjH5B+C8y89cmBUiIy0fzbgadL
   3sVBJBy42IOhI1ZN0OFz8Cd9Qg7NkZ2nu8qeWl5tWOodmDJPeRF2qBzMg
   hlef2bNpgvGUCkaDZoNVor9kLurpL5xMrZRbzaH7lBkNdbnNkMdoTcwHJ
   i1p8iwusUEQfWGMPAAzTYsCCJkPtrOO+iTvqMIyPHH2kT4oeAsh3pyIfI
   Lx5TDIRoZQsHeL54cOsVpe8b0JTxkunKpd/WaZWB03htuZITTI8Ev8SjI
   ro8CMuFt7A+JCBU9YON9q9qqsI46zMFWXyj/victuluZY/209Tp8dlodo
   Q==;
X-CSE-ConnectionGUID: mO8mKZRtS5au1SNb0Wb+Yw==
X-CSE-MsgGUID: 9VsOwtwYTMyMIkVxv1Bkiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="99849367"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="99849367"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:30:36 -0700
X-CSE-ConnectionGUID: D6wTM1pqSPKyDcVsNAPFeA==
X-CSE-MsgGUID: 3M5qtFaMQSOqxBKkSfrAPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="263578105"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.174])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:30:33 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 04B6C120DF1;
	Thu, 27 Aug 2026 15:30:30 +0300 (EEST)
Date: Thu, 27 Aug 2026 15:30:29 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] media: i2c: Add WV517S lens actuator driver
Message-ID: <apAt5fsysjAjU38q@kekkonen.localdomain>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260826132256.3343451-9-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826132256.3343451-9-mauriziocasciano7@gmail.com>

Hi Maurizio,

On Wed, Aug 26, 2026 at 03:22:56PM +0200, Maurizio Casciano wrote:
> The Lenovo Yoga Book YB1-X91 rear camera contains a WV517S
> voice-coil actuator. Add a V4L2 lens subdevice exposing the standard
> 10-bit FOCUS_ABSOLUTE control and the device ringing-control mode.
> 
> Tie register access to runtime PM so the IPU bridge sensor link keeps
> shared power resources active. Propagate PM acquisition failures and
> restore the drive mode and requested focus position after resume.
> 
> The register addresses and drive-mode value are derived from Intel's
> GPL-2.0 WV517 driver. Retain its copyright notice.
> 
> Link: https://github.com/jekhor/yogabook-linux-android-kernel/blob/574bae692716f1b14093497bfab8a007fe8e460b/drivers/external_drivers/camera/drivers/media/i2c/wv517.c
> 
> Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
> Assisted-by: Codex:gpt-5.6-sol sparse
> ---
>  MAINTAINERS                |   1 +
>  drivers/media/i2c/Kconfig  |   8 ++
>  drivers/media/i2c/Makefile |   1 +
>  drivers/media/i2c/wv517s.c | 199 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 209 insertions(+)
>  create mode 100644 drivers/media/i2c/wv517s.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3785b8c1de0a..205a42646a7d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -28268,6 +28268,7 @@ S:	Maintained
>  F:	drivers/media/i2c/ak*
>  F:	drivers/media/i2c/dw*
>  F:	drivers/media/i2c/lm*
> +F:	drivers/media/i2c/wv517s.c
>  
>  V4L2 CAMERA SENSOR DRIVERS
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 5c52007f9cbe..c488452c1b38 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -949,6 +949,14 @@ config VIDEO_DW9807_VCM
>  	  capability. This is designed for linear control of
>  	  voice coil motors, controlled via I2C serial interface.
>  
> +config VIDEO_WV517S
> +	tristate "WV517S lens voice coil support"
> +	help
> +	  This is a driver for the WV517S camera lens voice coil. It supports
> +	  the 10-bit focus control used by the Lenovo Yoga Book rear camera.
> +	  The driver exposes the actuator through the standard V4L2 lens
> +	  sub-device interface.

The Lenovo model where the VCM exists belongs to the cover letter, not
here.

> +
>  endif
>  
>  menu "Flash devices"
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index d04bd5724552..e480932a9540 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -173,4 +173,5 @@ obj-$(CONFIG_VIDEO_VP27SMPX) += vp27smpx.o
>  obj-$(CONFIG_VIDEO_VPX3220) += vpx3220.o
>  obj-$(CONFIG_VIDEO_WM8739) += wm8739.o
>  obj-$(CONFIG_VIDEO_WM8775) += wm8775.o
> +obj-$(CONFIG_VIDEO_WV517S) += wv517s.o
>  obj-$(CONFIG_VIDEO_INTEL_CVS) += cvs/
> diff --git a/drivers/media/i2c/wv517s.c b/drivers/media/i2c/wv517s.c
> new file mode 100644
> index 000000000000..43d15aadea30
> --- /dev/null
> +++ b/drivers/media/i2c/wv517s.c
> @@ -0,0 +1,199 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/*
> + * WV517S voice-coil motor driver
> + *
> + * Copyright (c) 2014 Intel Corporation.

Are there no other copyrights since 2014?

> + *
> + * On the Lenovo Yoga Book the IPU bridge instantiates this actuator as a
> + * secondary I2C client of the rear camera.  The bridge holds the sensor's
> + * shared power resources on while probing the actuator and adds a runtime-PM
> + * device link for subsequent accesses.

Same for this bit.

> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +
> +#define WV517S_MAX_FOCUS_POSITION	1023
> +#define WV517S_DEFAULT_FOCUS_POSITION	300
> +
> +#define WV517S_REG_FOCUS		0x41
> +#define WV517S_REG_DRIVE_MODE		0x43
> +#define WV517S_DRIVE_MODE_12_6_MS	0x0211
> +
> +struct wv517s_device {
> +	struct v4l2_ctrl_handler ctrl_handler;
> +	struct v4l2_subdev sd;
> +	struct v4l2_ctrl *focus;
> +};
> +
> +static inline struct wv517s_device *to_wv517s(struct v4l2_subdev *sd)
> +{
> +	return container_of(sd, struct wv517s_device, sd);
> +}
> +
> +static int wv517s_write(struct i2c_client *client, u8 reg, u16 value)
> +{
> +	u8 buf[] = { reg, value >> 8, value };
> +	int ret;
> +
> +	ret = i2c_master_send(client, buf, sizeof(buf));

Could you use regmap?

> +	if (ret < 0)
> +		return ret;
> +
> +	return ret == sizeof(buf) ? 0 : -EIO;
> +}
> +
> +static int wv517s_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct wv517s_device *wv517s = container_of(ctrl->handler,
> +						      struct wv517s_device,
> +						      ctrl_handler);
> +	struct i2c_client *client = v4l2_get_subdevdata(&wv517s->sd);
> +	int ret;
> +
> +	ret = pm_runtime_get_if_in_use(&client->dev);

pm_runtime_get_if_active().

> +	if (ret <= 0)

Test for !ret. If Runtime PM is disabled, ret is an error as well.

> +		return ret;
> +
> +	if (ctrl->id == V4L2_CID_FOCUS_ABSOLUTE)
> +		ret = wv517s_write(client, WV517S_REG_FOCUS, ctrl->val);
> +	else
> +		ret = -EINVAL;
> +
> +	pm_runtime_put(&client->dev);
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops wv517s_ctrl_ops = {
> +	.s_ctrl = wv517s_set_ctrl,
> +};
> +
> +static int wv517s_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +	return pm_runtime_resume_and_get(sd->dev);
> +}
> +
> +static int wv517s_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +	pm_runtime_put(sd->dev);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_internal_ops wv517s_internal_ops = {
> +	.open = wv517s_open,
> +	.close = wv517s_close,
> +};
> +
> +static const struct v4l2_subdev_ops wv517s_subdev_ops = { };
> +
> +static int wv517s_resume(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct wv517s_device *wv517s = to_wv517s(sd);
> +	struct i2c_client *client = to_i2c_client(dev);
> +	int ret;
> +
> +	/* Restore the vendor-recommended 12.6 ms ringing-control mode. */
> +	ret = wv517s_write(client, WV517S_REG_DRIVE_MODE,
> +			   WV517S_DRIVE_MODE_12_6_MS);
> +	if (ret)
> +		return ret;
> +
> +	return wv517s_write(client, WV517S_REG_FOCUS, wv517s->focus->val);

You could use v4l2_ctrl_handler_setup() for this and drop the focus field.

> +}
> +
> +static int wv517s_probe(struct i2c_client *client)
> +{
> +	struct wv517s_device *wv517s;
> +	int ret;
> +
> +	wv517s = devm_kzalloc(&client->dev, sizeof(*wv517s), GFP_KERNEL);
> +	if (!wv517s)
> +		return -ENOMEM;
> +
> +	v4l2_i2c_subdev_init(&wv517s->sd, client, &wv517s_subdev_ops);
> +	wv517s->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	wv517s->sd.internal_ops = &wv517s_internal_ops;
> +	wv517s->sd.entity.function = MEDIA_ENT_F_LENS;
> +
> +	v4l2_ctrl_handler_init(&wv517s->ctrl_handler, 1);
> +	wv517s->focus = v4l2_ctrl_new_std(&wv517s->ctrl_handler,
> +					  &wv517s_ctrl_ops,
> +					  V4L2_CID_FOCUS_ABSOLUTE, 0,
> +					  WV517S_MAX_FOCUS_POSITION, 1,
> +					  WV517S_DEFAULT_FOCUS_POSITION);
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
> +	ret = wv517s_resume(&client->dev);
> +	if (ret)
> +		goto err_cleanup_entity;
> +
> +	pm_runtime_set_active(&client->dev);
> +	pm_runtime_enable(&client->dev);
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
> +err_cleanup_entity:
> +	media_entity_cleanup(&wv517s->sd.entity);
> +err_free_ctrl_handler:
> +	v4l2_ctrl_handler_free(&wv517s->ctrl_handler);
> +
> +	return ret;
> +}
> +
> +static void wv517s_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct wv517s_device *wv517s = to_wv517s(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	pm_runtime_disable(&client->dev);
> +	v4l2_ctrl_handler_free(&wv517s->ctrl_handler);
> +	media_entity_cleanup(&sd->entity);
> +}
> +
> +static const struct i2c_device_id wv517s_id_table[] = {
> +	{ "wv517s" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, wv517s_id_table);
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(wv517s_pm_ops, NULL, wv517s_resume, NULL);
> +
> +static struct i2c_driver wv517s_i2c_driver = {
> +	.driver = {
> +		.name = "wv517s",
> +		.pm = pm_ptr(&wv517s_pm_ops),
> +	},
> +	.probe = wv517s_probe,
> +	.remove = wv517s_remove,
> +	.id_table = wv517s_id_table,
> +};
> +module_i2c_driver(wv517s_i2c_driver);
> +
> +MODULE_AUTHOR("Maurizio Casciano");
> +MODULE_DESCRIPTION("WV517S VCM driver");
> +MODULE_LICENSE("GPL");

-- 
Regards,

Sakari Ailus
