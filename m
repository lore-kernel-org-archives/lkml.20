Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE373BF695;
	Tue, 22 Sep 2026 09:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790067913; cv=none; b=J4sVJ5xrtBZPY/0FDhgxMjLUs61fntAVSEM0R9I6cWQ87JLEOVrmpVo+ikW170mXC+wniNRcZxzoxamuDuAA2qg+ZlHUQ7TN9hmGyVvAopuIeXF1/YsdzpFeBTaV4DLB8Xtsbt09z/zrNNd0BoxDeOT0sGMhHOjWtxCukvo6RaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790067913; c=relaxed/simple;
	bh=jyJdOl9GWqsWtiihgK2SD59jOR0wQH8oDZDuFK6QGC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQfbejcGmn0l6Z8lXk/zA11QacUDrtBxAoWhHBRTVnNO0SKdaJjnhczTkW5PGrYsjrF+zisY0EYhm4kifxEPqnP146JwB2/bjXsaVpn6Na20LfjJIDIzxc53ExCaqgfBi1Pe4w8IfApFWlE4s/Dh4kWDicMASshg8uJl1m7LN6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q/hvboT6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q/hvboT6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790067911; x=1821603911;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jyJdOl9GWqsWtiihgK2SD59jOR0wQH8oDZDuFK6QGC4=;
  b=Q/hvboT6BezSnxsie2a6UnOBy0K3WHbw6mOwVk72CZSObPKuYveXqTSu
   9ZvPi3nDPnVVHSZZ/KTjm3ZMN6NCiNtP2G/hOwWs62L6dCaCz5EFuQlFJ
   5ILrn6EBv4xjbuGM8meO/OCgZvpFLGhbSM648zd5Cw0F2LuT61WxFrAqp
   4ogjdG0+zqL86PC8UVylXXJ9VwnRW1xxJEhgp2MN8LPvPIvKWo0QYGqEy
   BbYVS1YTV5N+SPc/fLHDum7TpHLTM1w00xj5e9V67RukwLdN4VedukDX+
   Yy2fmq6469ectt9WtpwxbzszZKJidfYWlAmsiSsUjR/UDeCXg2dbpcfsj
   A==;
X-CSE-ConnectionGUID: 9tTAHq6xTvCA5Mvjv9Yv2Q==
X-CSE-MsgGUID: LhFkRxLpQo2jKDoywYLL6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="116174223"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="116174223"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 02:05:10 -0700
X-CSE-ConnectionGUID: roSbWIR5TGazFZ2RpWFccQ==
X-CSE-MsgGUID: wN8g6y8RR7axb00bYVz0Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="4352495"
Received: from carterle-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.41])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 02:04:22 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id ED9E2121B9F;
	Tue, 22 Sep 2026 12:04:20 +0300 (EEST)
Date: Tue, 22 Sep 2026 12:04:20 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andre Gilerson <andre.gilerson@gmail.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	German Pablo Lindo <germanpapulindez@gmail.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] media: i2c: Add Sony IMX681 sensor driver
Message-ID: <arJElIQgkq2uqwQT@kekkonen.localdomain>
References: <20260921192450.21811-1-lsa.uz@pm.me>
 <20260921192450.21811-3-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260921192450.21811-3-lsa.uz@pm.me>

Hi Sergey, Andre,

Thanks for the patch.

On Mon, Sep 21, 2026 at 07:25:07PM +0000, Sergey Lebedev wrote:
> From: Andre Gilerson <andre.gilerson@gmail.com>
> 
> The Sony IMX681 is the user-facing camera on the Microsoft Surface Pro 11
> for Business (Intel Lunar Lake, IPU7), where it is enumerated as ACPI
> device SONY0681. Without a driver the camera does not appear at all.

That's no surprise. A commit message should describe a patch; the rest
should go to the cover letter.

> 
> There is no public documentation for this sensor. The initialisation
> sequence and the mode registers were recovered from I2C traces taken under
> Windows, and the driver does not pretend otherwise: imx681_init_regs[] is
> 21 register writes whose individual meaning is not known.
> 
> What is not from the traces is derived and written down. The link frequency
> comes from the PLL configuration visible in the same traces - 19.2 MHz
> EXCK, PLL2_MUL 303, PLL2_PRE_DIV 3, giving 1939.2 MHz on the bus and
> therefore 969.6 MHz per lane - and the pixel rate follows from that, the
> lane count and the bit depth. The gain law and the black level were
> measured against the sensor rather than taken from the traces; the numbers
> are in the cover letter.
> 
> The driver uses the streams API, v4l2-cci for register access, the subdev
> state API and runtime PM, and validates the endpoint's lane count and link
> frequency against what the firmware describes.
> 
> Signed-off-by: Andre Gilerson <andre.gilerson@gmail.com>
> Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
> Tested-by: German Pablo Lindo <germanpapulindez@gmail.com>
> ---
>  MAINTAINERS                |   7 +
>  drivers/media/i2c/Kconfig  |  10 +
>  drivers/media/i2c/Makefile |   1 +
>  drivers/media/i2c/imx681.c | 876 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 894 insertions(+)
>  create mode 100644 drivers/media/i2c/imx681.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4cc4a2dc6d..4479f96d0d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25609,6 +25609,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
>  F:	drivers/media/i2c/imx678.c
>  
> +SONY IMX681 SENSOR DRIVER
> +M:	Andre Gilerson <andre.gilerson@gmail.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml
> +F:	drivers/media/i2c/imx681.c
> +
>  SONY MEMORYSTICK SUBSYSTEM
>  M:	Maxim Levitsky <maximlevitsky@gmail.com>
>  M:	Alex Dubov <oakad@yahoo.com>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 4d99464791..c759a2d239 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -321,6 +321,16 @@ config VIDEO_IMX678
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called imx678.
>  
> +config VIDEO_IMX681
> +	tristate "Sony IMX681 sensor support"
> +	select V4L2_CCI_I2C
> +	help
> +	  This is a Video4Linux2 sensor driver for the Sony
> +	  IMX681 camera.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called imx681.
> +
>  config VIDEO_MAX9271_LIB
>  	tristate
>  
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index fd1cb25718..98bcecf0c4 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -64,6 +64,7 @@ obj-$(CONFIG_VIDEO_IMX412) += imx412.o
>  obj-$(CONFIG_VIDEO_IMX415) += imx415.o
>  obj-$(CONFIG_VIDEO_IMX678) += imx678.o
>  obj-$(CONFIG_VIDEO_IMX471) += imx471.o
> +obj-$(CONFIG_VIDEO_IMX681) += imx681.o
>  obj-$(CONFIG_VIDEO_IR_I2C) += ir-kbd-i2c.o
>  obj-$(CONFIG_VIDEO_ISL7998X) += isl7998x.o
>  obj-$(CONFIG_VIDEO_IT6625) += it6625.o
> diff --git a/drivers/media/i2c/imx681.c b/drivers/media/i2c/imx681.c
> new file mode 100644
> index 0000000000..825d8c80a2
> --- /dev/null
> +++ b/drivers/media/i2c/imx681.c
> @@ -0,0 +1,876 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Sony IMX681 CMOS Image Sensor Driver
> + *
> + * Front camera on Surface Pro 11 Business (Intel/Lunar Lake).
> + * Register sequences reverse-engineered from Windows I2C traces.
> + *
> + * Copyright (C) 2025
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/property.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <media/v4l2-cci.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
> +
> +/* Chip ID register and expected value */
> +#define IMX681_REG_CHIP_ID		CCI_REG16(0x0016)
> +#define IMX681_CHIP_ID			0x0681
> +
> +/* Mode select */
> +#define IMX681_REG_MODE_SELECT		CCI_REG8(0x0100)
> +#define IMX681_MODE_STANDBY		0x00
> +#define IMX681_MODE_STREAMING		0x01
> +
> +/* Group parameter hold */
> +#define IMX681_REG_GROUP_HOLD		CCI_REG8(0x0104)
> +
> +/* Exposure (coarse integration time, 24-bit) */
> +#define IMX681_REG_EXPOSURE		CCI_REG24(0x0229)
> +#define IMX681_EXPOSURE_MIN		4
> +#define IMX681_EXPOSURE_MAX		3173	/* frame_length - 4 */

You should define a margin instead, which is subtracted from frame length
to come up with the maximum exposure time. Frame length in lines could
later be made dynamic if it isn't now.

> +#define IMX681_EXPOSURE_OFFSET		4	/* frame_length - exposure_max */
> +#define IMX681_EXPOSURE_DEFAULT		1907	/* from Windows trace */

You could just set it to 0 (or other minimum); the userspace will set it in
any case.

> +
> +/* Analog gain */
> +#define IMX681_REG_ANALOG_GAIN		CCI_REG16(0x0204)
> +#define IMX681_ANA_GAIN_MIN		0
> +#define IMX681_ANA_GAIN_MAX		960	/* 16x, where the analogue stage ends */
> +#define IMX681_ANA_GAIN_DEFAULT		0
> +
> +/* Digital gain */
> +#define IMX681_REG_DIGITAL_GAIN		CCI_REG16(0x020E)
> +#define IMX681_DIG_GAIN_MIN		0x0100	/* 1.0x */
> +#define IMX681_DIG_GAIN_MAX		0x0FFF
> +#define IMX681_DIG_GAIN_DEFAULT		0x0100
> +
> +/* Test pattern */
> +#define IMX681_REG_TEST_PATTERN		CCI_REG16(0x0600)
> +
> +/* Frame length (24-bit, for streaming updates) */
> +#define IMX681_REG_FRAME_LENGTH		CCI_REG24(0x033D)
> +
> +/* Image dimensions — native sensor output */
> +#define IMX681_WIDTH			3844
> +#define IMX681_HEIGHT			2640
> +#define IMX681_LINE_LENGTH_PCK		7552	/* 0x1D80 */
> +#define IMX681_FRAME_LENGTH_LINES	3177	/* 0x0C69 */
> +#define IMX681_FRAME_LENGTH_MAX		0xFFFF	/* 24-bit reg, limit to 16-bit */
> +
> +/* MIPI lanes */
> +#define IMX681_NUM_LANES		2
> +
> +/*
> + * Link frequency derived from PLL settings in Windows trace:
> + * EXCK=19.2MHz, PLL2_MUL=303, PLL2_PRE_DIV=3
> + * OP output = 19.2 * 303 / 3 = 1939.2 MHz (MIPI bit rate)
> + * Link freq = 1939.2 / 2 (DDR) = 969.6 MHz
> + */
> +#define IMX681_LINK_FREQ		969600000LL
> +
> +/* Pixel rate = link_freq * 2 (DDR) * num_lanes / bpp */
> +#define IMX681_PIXEL_RATE		(IMX681_LINK_FREQ * 2 * IMX681_NUM_LANES / 10)
> +
> +/* Power-on delay after reset deassert */
> +#define IMX681_RESET_DELAY_US		1000
> +#define IMX681_RESET_DELAY_RANGE_US	1000
> +
> +/* Post-standby-cancel stabilisation delays */
> +#define IMX681_INIT_DELAY_US		10000
> +
> +#define IMAGE_PAD			0
> +
> +static const s64 imx681_link_frequencies[] = {
> +	IMX681_LINK_FREQ,
> +};
> +
> +/*
> + * Sensor init register sequence, captured from Windows I2C traces.
> + * This configures the sensor for 3844x2640 RAW10 output at ~30fps
> + * with 2-lane MIPI CSI-2, 19.2MHz input clock.
> + */
> +static const struct cci_reg_sequence imx681_init_regs[] = {
> +	/* Software standby */
> +	{ CCI_REG8(0x0100),  0x00 },

The sensor is already in software stand-by mode here.

> +	/* External clock frequency = 19.2 MHz (encoded as MHz * 256) */
> +	{ CCI_REG16(0x0136), 0x1333 },

Please write the actual clock frequency here.

> +	/* Vendor specific configuration */
> +	{ CCI_REG16(0x002C), 0x0505 },
> +	/* CSI-2 signaling mode */
> +	{ CCI_REG8(0x0111),  0x02 },
> +	/* Image orientation: H-flip to match Windows AIQB (RGGB native → GRBG) */
> +	{ CCI_REG8(0x0101),  0x01 },

This should be set using V4L2 HFLIP controls.

> +	/* Vendor access unlock sequence */
> +	{ CCI_REG8(0x30EB),  0x05 },
> +	{ CCI_REG8(0x30EB),  0x0C },
> +	/* Vendor specific */
> +	{ CCI_REG16(0x300A), 0xFFFF },
> +	{ CCI_REG16(0x3532), 0xFFFF },
> +	/* LINE_LENGTH_PCK = 7552 */
> +	{ CCI_REG16(0x0342), 0x1D80 },

This should come from the HBLANK control.

> +	/* Frame length = 3177 */
> +	{ CCI_REG16(0x033E), 0x0C69 },

And this from the VBLANK control.

> +	/* Crop window start: X_ADD_STA[7:0]=100, Y_ADD_STA=256 */
> +	{ CCI_REG24(0x0345), 0x640100 },
> +	/* Crop window end: X_ADD_END[7:0]=103, Y_ADD_END=2895 */
> +	{ CCI_REG24(0x0349), 0x670B4F },
> +	/* Digital crop / vendor config */
> +	{ CCI_REG24(0x040D), 0x040A50 },
> +	/* X_OUTPUT_SIZE=3844, Y_OUTPUT_SIZE=2640 */
> +	{ CCI_REG32(0x034C), 0x0F040A50 },

These registers are the same as in CCS. See discussion here
<URL:https://lore.kernel.org/linux-media/20260827-imx355-ccsify-v2-1-3a97bc708315@ixit.cz/>.

> +	/* PLL multiplier = 225 */
> +	{ CCI_REG8(0x0307),  0xE1 },
> +	/* PLL2: pre_div=3, multiplier=303 (0x012F) */

Looks like the sensor has dual PLL configuration. The PIXEL_RATE then is
unlikely to be what can be calculated from the CSI-2 configuration.

> +	{ CCI_REG24(0x030D), 0x03012F },
> +	/* Frame duration initial */
> +	{ CCI_REG16(0x022A), 0x0C61 },
> +	/* Vendor specific registers */
> +	{ CCI_REG8(0x7E9B),  0x02 },
> +	{ CCI_REG8(0x0368),  0x00 },
> +	{ CCI_REG8(0xD383),  0x01 },
> +};
> +
> +/*
> + * First exposure settings applied before stream-on.
> + * Uses group parameter hold to ensure atomic update.
> + */
> +static const struct cci_reg_sequence imx681_first_exposure[] = {
> +	{ CCI_REG8(0x0104),  0x01 },		/* Group hold ON */
> +	{ CCI_REG24(0x033D), 0x000C69 },	/* Frame length = 3177 */
> +	{ CCI_REG24(0x0229), 0x000773 },	/* Exposure = 1907 lines */
> +	{ CCI_REG16(0x0204), 0x0000 },		/* Analog gain = 0 (1x) */
> +	{ CCI_REG16(0x020E), 0x0100 },		/* Digital gain = 1.0x */

These should all be written programmatically, not through a register list.

Group hold should make no difference if the sensor isn't streaming.

> +	{ CCI_REG8(0x0104),  0x00 },		/* Group hold OFF */
> +};
> +
> +static const char * const imx681_test_pattern_menu[] = {
> +	"Disabled",
> +	"Solid Colour",
> +	"Eight Vertical Colour Bars",
> +	"Colour Bars With Fade to Grey",
> +	"Pseudorandom Sequence (PN9)",
> +};
> +
> +static const u32 imx681_mbus_codes[] = {
> +	MEDIA_BUS_FMT_SGRBG10_1X10,
> +};
> +
> +/* Regulator supplies */
> +static const char * const imx681_supply_names[] = {
> +	"avdd",		/* Analog 2.8V */
> +	"dvdd",		/* Digital 1.05V */
> +	"dovdd",	/* I/O 1.8V */
> +};
> +
> +#define IMX681_NUM_SUPPLIES ARRAY_SIZE(imx681_supply_names)

Just use ARRAY_SIZE(imx681_supply_names) where you need it.

> +
> +struct imx681 {
> +	struct device *dev;
> +	struct regmap *cci;
> +
> +	struct v4l2_subdev sd;
> +	struct media_pad pad;
> +
> +	struct clk *xclk;
> +	struct gpio_desc *reset_gpio;
> +	struct regulator_bulk_data supplies[IMX681_NUM_SUPPLIES];
> +
> +	/* V4L2 Controls */
> +	struct v4l2_ctrl_handler ctrl_handler;
> +	struct v4l2_ctrl *exposure;
> +	struct v4l2_ctrl *vblank;
> +	struct v4l2_ctrl *hblank;
> +
> +	unsigned long link_freq_bitmap;
> +};
> +
> +static inline struct imx681 *to_imx681(struct v4l2_subdev *sd)
> +{
> +	return container_of_const(sd, struct imx681, sd);
> +}
> +
> +static int imx681_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct imx681 *imx681 = container_of(ctrl->handler, struct imx681,
> +					     ctrl_handler);
> +	s64 exposure_max;
> +	int pm_status;
> +	int ret = 0;
> +
> +	/* Update exposure max when VBLANK changes (even when not streaming) */
> +	if (ctrl->id == V4L2_CID_VBLANK) {
> +		exposure_max = IMX681_HEIGHT + ctrl->val - IMX681_EXPOSURE_OFFSET;
> +		__v4l2_ctrl_modify_range(imx681->exposure,
> +					 IMX681_EXPOSURE_MIN, exposure_max,
> +					 1, IMX681_EXPOSURE_DEFAULT);

Presumably this can fail, too.

> +	}
> +
> +	/*
> +	 * 1 with a reference taken, 0 if the device is not active, or -EINVAL
> +	 * if runtime PM is unavailable. Only the 0 means there is nothing to
> +	 * do: without runtime PM the sensor is powered from probe and never
> +	 * suspended, so the write still has to go out - but no reference was
> +	 * taken then, and none may be dropped.
> +	 */

You can omit this comment; there's nothing special about this driver or
device here.

> +	pm_status = pm_runtime_get_if_active(imx681->dev);
> +	if (!pm_status)
> +		return 0;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_VBLANK:
> +		cci_write(imx681->cci, IMX681_REG_GROUP_HOLD, 0x01, &ret);
> +		cci_write(imx681->cci, IMX681_REG_FRAME_LENGTH,
> +			  IMX681_HEIGHT + ctrl->val, &ret);
> +		cci_write(imx681->cci, IMX681_REG_GROUP_HOLD, 0x00, &ret);

I don't think you don't need group hold for these.

> +		dev_dbg(imx681->dev, "set frame_length: %d, ret=%d\n",
> +			IMX681_HEIGHT + ctrl->val, ret);

Similarly, the dev_dbg() call here can be dropped, same below.

> +		break;
> +
> +	case V4L2_CID_EXPOSURE:
> +		cci_write(imx681->cci, IMX681_REG_GROUP_HOLD, 0x01, &ret);
> +		cci_write(imx681->cci, IMX681_REG_EXPOSURE, ctrl->val, &ret);
> +		cci_write(imx681->cci, IMX681_REG_GROUP_HOLD, 0x00, &ret);
> +		dev_dbg(imx681->dev, "set exposure: %d, ret=%d\n",
> +			ctrl->val, ret);
> +		break;
> +
> +	case V4L2_CID_ANALOGUE_GAIN:
> +		/* Gain formula: gain = 1024/(1024-code); code 960 is 16x. */
> +		cci_write(imx681->cci, IMX681_REG_GROUP_HOLD, 0x01, &ret);
> +		cci_write(imx681->cci, IMX681_REG_ANALOG_GAIN, ctrl->val,
> +			  &ret);
> +		cci_write(imx681->cci, IMX681_REG_GROUP_HOLD, 0x00, &ret);
> +		dev_dbg(imx681->dev, "set analogue gain code %d, ret=%d\n",
> +			ctrl->val, ret);
> +		break;
> +
> +	case V4L2_CID_DIGITAL_GAIN:
> +		cci_write(imx681->cci, IMX681_REG_GROUP_HOLD, 0x01, &ret);
> +		cci_write(imx681->cci, IMX681_REG_DIGITAL_GAIN, ctrl->val,
> +			  &ret);
> +		cci_write(imx681->cci, IMX681_REG_GROUP_HOLD, 0x00, &ret);
> +		dev_dbg(imx681->dev, "set digital gain: %d, ret=%d\n",
> +			ctrl->val, ret);
> +		break;
> +
> +	case V4L2_CID_TEST_PATTERN:
> +		ret = cci_write(imx681->cci, IMX681_REG_TEST_PATTERN,
> +				ctrl->val, NULL);
> +		break;
> +
> +	default:
> +		dev_dbg(imx681->dev, "unhandled ctrl id: 0x%x val: 0x%x\n",
> +			ctrl->id, ctrl->val);
> +		break;
> +	}
> +
> +	if (pm_status > 0)
> +		pm_runtime_put(imx681->dev);

A newline here (before return, unless it was conditional)? Same elsewhere,
too.

> +	return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops imx681_ctrl_ops = {
> +	.s_ctrl = imx681_set_ctrl,
> +};
> +
> +static int imx681_enum_mbus_code(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *state,
> +				 struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	if (code->index >= ARRAY_SIZE(imx681_mbus_codes))
> +		return -EINVAL;
> +
> +	code->code = imx681_mbus_codes[code->index];
> +	return 0;
> +}
> +
> +static bool imx681_is_valid_mbus_code(u32 code)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(imx681_mbus_codes); i++)

You can declare i here.

> +		if (imx681_mbus_codes[i] == code)
> +			return true;
> +	return false;
> +}
> +
> +static int imx681_enum_frame_size(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state,
> +				  struct v4l2_subdev_frame_size_enum *fse)
> +{
> +	if (fse->index > 0)
> +		return -EINVAL;
> +
> +	if (!imx681_is_valid_mbus_code(fse->code))
> +		return -EINVAL;
> +
> +	fse->min_width = IMX681_WIDTH;
> +	fse->max_width = IMX681_WIDTH;
> +	fse->min_height = IMX681_HEIGHT;
> +	fse->max_height = IMX681_HEIGHT;
> +
> +	return 0;
> +}
> +
> +static int imx681_init_state(struct v4l2_subdev *sd,
> +			     struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_mbus_framefmt *format;
> +
> +	format = v4l2_subdev_state_get_format(state, IMAGE_PAD);
> +	format->width = IMX681_WIDTH;
> +	format->height = IMX681_HEIGHT;
> +	format->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> +	format->field = V4L2_FIELD_NONE;
> +	format->colorspace = V4L2_COLORSPACE_RAW;
> +	format->ycbcr_enc = V4L2_YCBCR_ENC_601;
> +	format->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +	format->xfer_func = V4L2_XFER_FUNC_NONE;
> +
> +	return 0;
> +}
> +
> +static int imx681_set_pad_format(struct v4l2_subdev *sd,
> +				 const struct v4l2_subdev_client_info *ci,
> +				 struct v4l2_subdev_state *state,
> +				 struct v4l2_subdev_format *fmt)
> +{
> +	struct v4l2_mbus_framefmt *format;
> +
> +	/* Fixed resolution, fixed Bayer order */
> +	fmt->format.width = IMX681_WIDTH;
> +	fmt->format.height = IMX681_HEIGHT;
> +	if (!imx681_is_valid_mbus_code(fmt->format.code))
> +		fmt->format.code = imx681_mbus_codes[0];
> +	fmt->format.field = V4L2_FIELD_NONE;
> +	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
> +	fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_601;
> +	fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
> +
> +	format = v4l2_subdev_state_get_format(state, fmt->pad);
> +	*format = fmt->format;

The init_state() callback should do this as there's nothing to configure on
hardware. You can drop the set_fmt() callback, too.

> +
> +	return 0;
> +}
> +
> +static int imx681_get_selection(struct v4l2_subdev *sd,
> +				const struct v4l2_subdev_client_info *ci,
> +				struct v4l2_subdev_state *state,
> +				struct v4l2_subdev_selection *sel)
> +{
> +	switch (sel->target) {
> +	case V4L2_SEL_TGT_CROP:
> +	case V4L2_SEL_TGT_CROP_DEFAULT:
> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> +	case V4L2_SEL_TGT_NATIVE_SIZE:
> +		sel->r.top = 0;
> +		sel->r.left = 0;
> +		sel->r.width = IMX681_WIDTH;
> +		sel->r.height = IMX681_HEIGHT;
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int imx681_start_streaming(struct imx681 *imx681)
> +{
> +	int ret;
> +
> +	dev_dbg(imx681->dev, "starting stream: %dx%d RAW10 2-lane\n",
> +		IMX681_WIDTH, IMX681_HEIGHT);

Please drop.

> +
> +	/* Write init register sequence */
> +	ret = cci_multi_reg_write(imx681->cci, imx681_init_regs,
> +				  ARRAY_SIZE(imx681_init_regs), NULL);
> +	if (ret) {
> +		dev_err(imx681->dev, "failed to write init regs: %d\n", ret);
> +		return ret;
> +	}
> +
> +	dev_dbg(imx681->dev, "init registers written successfully\n");

Ditto.

> +
> +	/* Wait for sensor to stabilise after configuration */
> +	usleep_range(IMX681_INIT_DELAY_US, IMX681_INIT_DELAY_US + 1000);
> +
> +	/* Apply first exposure settings with group hold */
> +	ret = cci_multi_reg_write(imx681->cci, imx681_first_exposure,
> +				  ARRAY_SIZE(imx681_first_exposure), NULL);
> +	if (ret) {
> +		dev_err(imx681->dev, "failed to write exposure: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Apply any pending V4L2 control values */
> +	ret = __v4l2_ctrl_handler_setup(imx681->sd.ctrl_handler);
> +	if (ret) {
> +		dev_err(imx681->dev, "failed to apply controls: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Start streaming */
> +	ret = cci_write(imx681->cci, IMX681_REG_MODE_SELECT,
> +			IMX681_MODE_STREAMING, NULL);
> +	if (ret) {
> +		dev_err(imx681->dev, "failed to start streaming: %d\n", ret);
> +		return ret;
> +	}
> +
> +	dev_dbg(imx681->dev, "streaming started\n");

Ditto.

> +	return 0;
> +}
> +
> +static int imx681_stop_streaming(struct imx681 *imx681)
> +{
> +	int ret;
> +
> +	ret = cci_write(imx681->cci, IMX681_REG_MODE_SELECT,
> +			IMX681_MODE_STANDBY, NULL);
> +	if (ret)
> +		dev_err(imx681->dev, "failed to stop streaming: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int imx681_enable_streams(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *state,
> +				 u32 pad, u64 streams_mask)
> +{
> +	struct imx681 *imx681 = to_imx681(sd);
> +	int ret;
> +
> +	if (pad != IMAGE_PAD)

The sensor currently supports no other pads so you can drop this check.
Elsewhere, too -- the framework already does this.

> +		return -EINVAL;
> +
> +	ret = pm_runtime_get_sync(imx681->dev);

You could use pm_runtime_resume_and_get() instead...

> +	if (ret < 0) {
> +		pm_runtime_put_noidle(imx681->dev);

And drop this call.

> +		return ret;
> +	}
> +
> +	ret = imx681_start_streaming(imx681);
> +	if (ret)
> +		pm_runtime_put_autosuspend(imx681->dev);
> +
> +	return ret;
> +}
> +
> +static int imx681_disable_streams(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state,
> +				  u32 pad, u64 streams_mask)
> +{
> +	struct imx681 *imx681 = to_imx681(sd);
> +
> +	if (pad != IMAGE_PAD)
> +		return -EINVAL;
> +
> +	imx681_stop_streaming(imx681);
> +	pm_runtime_put_autosuspend(imx681->dev);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_video_ops imx681_video_ops = {
> +	.s_stream = v4l2_subdev_s_stream_helper,
> +};
> +
> +static const struct v4l2_subdev_pad_ops imx681_pad_ops = {
> +	.enum_mbus_code = imx681_enum_mbus_code,
> +	.get_fmt = v4l2_subdev_get_fmt,
> +	.set_fmt = imx681_set_pad_format,
> +	.get_selection = imx681_get_selection,
> +	.enum_frame_size = imx681_enum_frame_size,
> +	.enable_streams = imx681_enable_streams,
> +	.disable_streams = imx681_disable_streams,
> +};
> +
> +static const struct v4l2_subdev_ops imx681_subdev_ops = {
> +	.video = &imx681_video_ops,
> +	.pad = &imx681_pad_ops,
> +};
> +
> +static const struct v4l2_subdev_internal_ops imx681_internal_ops = {
> +	.init_state = imx681_init_state,
> +};
> +
> +/* Power management */
> +static int imx681_power_on(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct imx681 *imx681 = to_imx681(sd);
> +	int ret;
> +
> +	dev_dbg(imx681->dev, "power on\n");

Please drop this.

> +
> +	ret = regulator_bulk_enable(IMX681_NUM_SUPPLIES, imx681->supplies);
> +	if (ret) {
> +		dev_err(imx681->dev, "failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(imx681->xclk);
> +	if (ret) {
> +		dev_err(imx681->dev, "failed to enable clock: %d\n", ret);
> +		goto err_reg_disable;
> +	}
> +
> +	/* Deassert reset (active low) */
> +	gpiod_set_value_cansleep(imx681->reset_gpio, 0);
> +
> +	usleep_range(IMX681_RESET_DELAY_US,
> +		     IMX681_RESET_DELAY_US + IMX681_RESET_DELAY_RANGE_US);
> +
> +	return 0;
> +
> +err_reg_disable:
> +	regulator_bulk_disable(IMX681_NUM_SUPPLIES, imx681->supplies);
> +	return ret;
> +}
> +
> +static int imx681_power_off(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct imx681 *imx681 = to_imx681(sd);
> +
> +	dev_dbg(imx681->dev, "power off\n");

Ditto.

> +
> +	/* Assert reset */
> +	gpiod_set_value_cansleep(imx681->reset_gpio, 1);
> +	clk_disable_unprepare(imx681->xclk);
> +	regulator_bulk_disable(IMX681_NUM_SUPPLIES, imx681->supplies);
> +
> +	return 0;
> +}
> +
> +static int imx681_identify_module(struct imx681 *imx681)
> +{
> +	u64 val;
> +	int ret;
> +
> +	ret = cci_read(imx681->cci, IMX681_REG_CHIP_ID, &val, NULL);
> +	if (ret)
> +		return dev_err_probe(imx681->dev, ret,
> +				     "failed to read chip ID register 0x0016\n");
> +
> +	if (val != IMX681_CHIP_ID) {
> +		return dev_err_probe(imx681->dev, -EIO,
> +				     "chip ID mismatch: 0x%04llx != 0x%04x\n",
> +				     val, IMX681_CHIP_ID);
> +	}
> +
> +	return 0;
> +}
> +
> +static int imx681_init_controls(struct imx681 *imx681)
> +{
> +	struct v4l2_ctrl_handler *ctrl_hdlr = &imx681->ctrl_handler;
> +	struct v4l2_fwnode_device_properties props;
> +	struct v4l2_ctrl *link_freq;
> +	s64 hblank, vblank;
> +	int ret;
> +
> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 9);
> +	if (ret)
> +		return ret;
> +
> +	/* Pixel rate (read-only) */
> +	v4l2_ctrl_new_std(ctrl_hdlr, &imx681_ctrl_ops,
> +			  V4L2_CID_PIXEL_RATE, IMX681_PIXEL_RATE,
> +			  IMX681_PIXEL_RATE, 1, IMX681_PIXEL_RATE);
> +
> +	/* Link frequency (read-only) */
> +	link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx681_ctrl_ops,
> +					   V4L2_CID_LINK_FREQ,
> +					   __fls(imx681->link_freq_bitmap),
> +					   __ffs(imx681->link_freq_bitmap),
> +					   imx681_link_frequencies);
> +	if (link_freq)
> +		link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	/* Horizontal blanking (read-only, fixed) */
> +	hblank = IMX681_LINE_LENGTH_PCK - IMX681_WIDTH;
> +	imx681->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx681_ctrl_ops,
> +					   V4L2_CID_HBLANK, hblank, hblank,
> +					   1, hblank);
> +	if (imx681->hblank)
> +		imx681->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	/* Vertical blanking (writable to allow longer exposures) */
> +	vblank = IMX681_FRAME_LENGTH_LINES - IMX681_HEIGHT;
> +	imx681->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx681_ctrl_ops,
> +					   V4L2_CID_VBLANK, vblank,
> +					   IMX681_FRAME_LENGTH_MAX - IMX681_HEIGHT,
> +					   1, vblank);
> +
> +	/* Exposure */
> +	imx681->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &imx681_ctrl_ops,
> +					     V4L2_CID_EXPOSURE,
> +					     IMX681_EXPOSURE_MIN,
> +					     IMX681_EXPOSURE_MAX, 1,
> +					     IMX681_EXPOSURE_DEFAULT);
> +
> +	/* Analog gain */
> +	v4l2_ctrl_new_std(ctrl_hdlr, &imx681_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
> +			  IMX681_ANA_GAIN_MIN, IMX681_ANA_GAIN_MAX, 1,
> +			  IMX681_ANA_GAIN_DEFAULT);
> +
> +	/* Digital gain */
> +	v4l2_ctrl_new_std(ctrl_hdlr, &imx681_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
> +			  IMX681_DIG_GAIN_MIN, IMX681_DIG_GAIN_MAX, 1,
> +			  IMX681_DIG_GAIN_DEFAULT);
> +
> +	/* Test pattern */
> +	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &imx681_ctrl_ops,
> +				     V4L2_CID_TEST_PATTERN,
> +				     ARRAY_SIZE(imx681_test_pattern_menu) - 1,
> +				     0, 0, imx681_test_pattern_menu);
> +
> +	if (ctrl_hdlr->error) {
> +		ret = ctrl_hdlr->error;
> +		ret = dev_err_probe(imx681->dev, ret, "control init failed\n");

Uh-oh.

> +		goto error;
> +	}
> +
> +	ret = v4l2_fwnode_device_parse(imx681->dev, &props);

Call this before initialising the handler and error handling is simplified.

> +	if (ret)
> +		goto error;
> +
> +	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx681_ctrl_ops,
> +					      &props);
> +	if (ret)
> +		goto error;
> +
> +	imx681->sd.ctrl_handler = ctrl_hdlr;
> +	return 0;
> +
> +error:
> +	v4l2_ctrl_handler_free(ctrl_hdlr);
> +	return ret;
> +}
> +
> +static int imx681_parse_endpoint(struct imx681 *imx681)
> +{
> +	struct fwnode_handle *fwnode = dev_fwnode(imx681->dev);
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY,
> +	};
> +	struct fwnode_handle *ep;
> +	int ret;
> +
> +	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);

	ep = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);

> +	if (!ep) {
> +		return dev_err_probe(imx681->dev, -ENXIO,
> +				     "no endpoint found in firmware node\n");

You can omit this check.

> +	}
> +
> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	fwnode_handle_put(ep);
> +	if (ret)
> +		return dev_err_probe(imx681->dev, ret,
> +				     "failed to parse endpoint\n");
> +
> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != IMX681_NUM_LANES) {
> +		ret = dev_err_probe(imx681->dev, -EINVAL,
> +				    "expected %d data lanes, got %d\n",
> +				    IMX681_NUM_LANES,
> +				    bus_cfg.bus.mipi_csi2.num_data_lanes);
> +		goto done;
> +	}
> +
> +	ret = v4l2_link_freq_to_bitmap(imx681->dev,
> +				       bus_cfg.link_frequencies,
> +				       bus_cfg.nr_of_link_frequencies,
> +				       imx681_link_frequencies,
> +				       ARRAY_SIZE(imx681_link_frequencies),
> +				       &imx681->link_freq_bitmap);
> +	if (ret)
> +		ret = dev_err_probe(imx681->dev, ret,
> +				    "link frequency mismatch\n");
> +
> +done:
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +	return ret;
> +}
> +
> +static int imx681_probe(struct i2c_client *client)
> +{
> +	struct imx681 *imx681;
> +	unsigned int i;
> +	int ret;
> +
> +	imx681 = devm_kzalloc(&client->dev, sizeof(*imx681), GFP_KERNEL);
> +	if (!imx681)
> +		return -ENOMEM;
> +
> +	imx681->dev = &client->dev;
> +
> +	/* Initialise V4L2 subdev */
> +	v4l2_i2c_subdev_init(&imx681->sd, client, &imx681_subdev_ops);
> +
> +	/* Initialise CCI regmap for 16-bit register addresses */
> +	imx681->cci = devm_cci_regmap_init_i2c(client, 16);
> +	if (IS_ERR(imx681->cci))
> +		return dev_err_probe(imx681->dev, PTR_ERR(imx681->cci),
> +				     "failed to init CCI\n");
> +
> +	/* Get clock (optional - INT3472 provides it on Surface devices) */
> +	imx681->xclk = devm_clk_get_optional(imx681->dev, NULL);
> +	if (IS_ERR(imx681->xclk))
> +		return dev_err_probe(imx681->dev, PTR_ERR(imx681->xclk),
> +				     "failed to get clock\n");
> +
> +	/* Get regulators */
> +	for (i = 0; i < IMX681_NUM_SUPPLIES; i++)
> +		imx681->supplies[i].supply = imx681_supply_names[i];
> +
> +	ret = devm_regulator_bulk_get(imx681->dev, IMX681_NUM_SUPPLIES,
> +				      imx681->supplies);
> +	if (ret)
> +		return dev_err_probe(imx681->dev, ret,
> +				     "failed to get regulators\n");
> +
> +	/* Get reset GPIO (optional) */
> +	imx681->reset_gpio = devm_gpiod_get_optional(imx681->dev, "reset",
> +						     GPIOD_OUT_HIGH);
> +	if (IS_ERR(imx681->reset_gpio))
> +		return dev_err_probe(imx681->dev,
> +				     PTR_ERR(imx681->reset_gpio),
> +				     "failed to get reset GPIO\n");
> +
> +	/* Parse CSI-2 endpoint */
> +	ret = imx681_parse_endpoint(imx681);
> +	if (ret)
> +		return dev_err_probe(imx681->dev, ret,
> +				     "endpoint parse failed\n");
> +
> +	/* Power on and verify chip ID */
> +	ret = imx681_power_on(imx681->dev);
> +	if (ret)
> +		return dev_err_probe(imx681->dev, ret, "power on failed\n");
> +
> +	ret = imx681_identify_module(imx681);
> +	if (ret)
> +		goto error_power_off;
> +
> +	/* Enable runtime PM */
> +	pm_runtime_set_active(imx681->dev);
> +	pm_runtime_get_noresume(imx681->dev);

Please drop this call and...

> +	pm_runtime_enable(imx681->dev);
> +	pm_runtime_set_autosuspend_delay(imx681->dev, 1000);
> +	pm_runtime_use_autosuspend(imx681->dev);
> +
> +	/* Init V4L2 controls */
> +	ret = imx681_init_controls(imx681);
> +	if (ret)
> +		goto error_pm;
> +
> +	/* Setup subdev */
> +	imx681->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	imx681->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +	imx681->sd.internal_ops = &imx681_internal_ops;
> +
> +	/* Init media entity */
> +	imx681->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&imx681->sd.entity, 1, &imx681->pad);
> +	if (ret) {
> +		ret = dev_err_probe(imx681->dev, ret,
> +				    "media entity init failed\n");
> +		goto error_handler_free;
> +	}
> +
> +	imx681->sd.state_lock = imx681->ctrl_handler.lock;
> +	ret = v4l2_subdev_init_finalize(&imx681->sd);
> +	if (ret < 0) {
> +		ret = dev_err_probe(imx681->dev, ret,
> +				    "subdev init finalize failed\n");
> +		goto error_media_entity;
> +	}
> +
> +	ret = v4l2_async_register_subdev_sensor(&imx681->sd);
> +	if (ret < 0) {
> +		ret = dev_err_probe(imx681->dev, ret,
> +				    "async register subdev failed\n");
> +		goto error_subdev_cleanup;
> +	}
> +
> +	pm_runtime_put_autosuspend(imx681->dev);

... call pm_runtime_idle() here instead. Error handling changes, too.

> +
> +	dev_info(imx681->dev,
> +		 "IMX681 probed successfully: %dx%d @ %lld Hz link freq\n",
> +		 IMX681_WIDTH, IMX681_HEIGHT, IMX681_LINK_FREQ);
> +
> +	return 0;
> +
> +error_subdev_cleanup:
> +	v4l2_subdev_cleanup(&imx681->sd);
> +error_media_entity:
> +	media_entity_cleanup(&imx681->sd.entity);
> +error_handler_free:
> +	v4l2_ctrl_handler_free(imx681->sd.ctrl_handler);
> +error_pm:
> +	pm_runtime_disable(imx681->dev);
> +	pm_runtime_put_noidle(imx681->dev);
> +	pm_runtime_set_suspended(imx681->dev);
> +error_power_off:
> +	imx681_power_off(imx681->dev);
> +	return ret;
> +}
> +
> +static void imx681_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct imx681 *imx681 = to_imx681(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(&imx681->sd);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_ctrl_handler_free(imx681->sd.ctrl_handler);
> +
> +	pm_runtime_disable(imx681->dev);
> +	if (!pm_runtime_status_suspended(imx681->dev))
> +		imx681_power_off(imx681->dev);
> +	pm_runtime_set_suspended(imx681->dev);

Call pm_runtime_set_suspended() conditionally, with imx681_power_off().

> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(imx681_pm_ops, imx681_power_off,
> +				 imx681_power_on, NULL);
> +
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id imx681_acpi_ids[] = {
> +	{ "SONY0681" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(acpi, imx681_acpi_ids);
> +#endif
> +
> +static const struct of_device_id imx681_dt_ids[] = {
> +	{ .compatible = "sony,imx681" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx681_dt_ids);
> +
> +static struct i2c_driver imx681_i2c_driver = {
> +	.driver = {
> +		.name = "imx681",
> +		.pm = pm_ptr(&imx681_pm_ops),
> +		.acpi_match_table = ACPI_PTR(imx681_acpi_ids),
> +		.of_match_table = imx681_dt_ids,
> +	},
> +	.probe = imx681_probe,
> +	.remove = imx681_remove,
> +};
> +module_i2c_driver(imx681_i2c_driver);
> +
> +MODULE_DESCRIPTION("Sony IMX681 CMOS Image Sensor Driver");
> +MODULE_AUTHOR("Andre Gilerson <andre.gilerson@gmail.com>");
> +MODULE_LICENSE("GPL");

-- 
Kind regards,

Sakari Ailus
