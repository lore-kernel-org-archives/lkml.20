Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010584;
	b=Fz197ozOriWvD+lhZkHsup50uClW82CcOqa4Xw46v/FAFcsqTWsaNkA4vC0e5p08lv5C
	 B8JjvhFimQh2FwQoqZdOU8u0EZZilGLmXZFOg49RLS0yTKRANHCgLFuD8IcrCX2zZadnh
	 4vHehhijCAM3/H0HKNDNo38+tJ6/lWge8GOT78Eql+2fQZDBbWQ9vSat4uCN1S1xYp3Ar
	 e2fo+WRYpwzF1bkDa+UClKJlHWFwQBLYAtrVXrxypaDfZYl5Q+hAzBM8KtxIFKMCYUl20
	 iLRHmE6ed6NnIizB/veHC4fg/b6Cfa5SeDbWsmDJgMrY83GgheBQbIwtaZ6IxUHSsVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010584;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GQUdx5goxyL+F1Ls1qx+IQbk6Wl3AZAuUzbtWYyRvIk=;
	b=eBkD/yx87zO7qR2CeSvGAzDnZrpD3/IG5y7qdCOfN+EpK774Ft6xmO3DsQKJyw/FUQu4
	 VCKKRhkzcxYf2Kr7L+choulVe+4e+GZNpxG8XuFnKVHObrr1cb36rvPU/iNQq6R50Ifgw
	 9hBe313joXeXoG3klrPTNH/rsG5Ekq21H+eR4mTZ+76oBNA2C11hZ6V1yKb6G/ISscdb+
	 zbKVp6WUoGDHAOZzQQ0zAJ9pga8LvvDfq/JfCgiGPeDH8ieMzBY0400Vj+XgRRIw6gJsW
	 Rpme5hpi1SIGPLnGe1vUnotxUlYwR53eKBhpX7/aq5F9/Ewi9FW/xsxMN2yVsZ6WpnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a7xh4jhd;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADBA606A31A;
	Mon, 26 Oct 2026 10:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ADBA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a7xh4jhd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793010583; x=1824546583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TKc7DHJUKNJIzSP9feajuDjIF5DwoRVSgnBejuFvtEY=;
  b=a7xh4jhdhbQ0UgxdFGvkxkQAMXxKy1bFpy2Z7ObBbDB0rpbhV1+SSzmR
   JhssG6jq2vLqU5iUr+Niu8/ny5aIyYx349ifI4ipSGOfNIbmjwob2Wqd7
   bbgh3FqYFmgRDOlXDlB4kQHFSRljLVMaKZuJMuli1rucx+mNYjMIO62qB
   1lMh6uQ6qPGdWay0uUt4oPTmO5wU7Gictp7RNLr7HgFCHBQP0TbVt7qmc
   OSUenmZRruh9y0Gaxc2fhQe7E+scXgNvji9uxpK+KjtwtF12PS/1JOgMG
   ce43ZFHgm+nVUJTv+HW++FEfsDm34YD6PErbA7GBcm/0ry6Ks9DYW69+l
   w==;
X-CSE-ConnectionGUID: 03kBqGXIToun85Ti7c2+lA==
X-CSE-MsgGUID: i9Lf+9YlSwyahdUNT8CsPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1557729"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1557729"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 03:29:42 -0700
X-CSE-ConnectionGUID: D7YoypCxQFiZDKMPZa/k3w==
X-CSE-MsgGUID: aAlk58YDQPeRG44CDGgHig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4262787"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.73])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 03:29:39 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 87698121CEC;
	Mon, 26 Oct 2026 12:29:40 +0200 (EET)
Date: Mon, 26 Oct 2026 12:29:40 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Lachlan Michael <lachlan.michael@sony.com>
Cc: mchehab@kernel.org, hverkuil+cisco@kernel.org,
	laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, kieran.bingham@ideasonboard.com,
	jai.luthra@ideasonboard.com, Ryuichi.Tadano@sony.com,
	Kengo.Hayasaka@sony.com, Tim.Bird2@sony.com, Kazumi.A.Sato@sony.com,
	Yuji.John.Takahashi@sony.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] media: i2c: Add Sony IMX908 image sensor driver
Message-ID: <at8rlFwbcTgXSDhO@kekkonen.localdomain>
References: <20261019014720.2635-1-lachlan.michael@sony.com>
 <20261019014720.2635-3-lachlan.michael@sony.com>
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
In-Reply-To: <20261019014720.2635-3-lachlan.michael@sony.com>

Hi Michael,

Thanks for the update.

A few minor comments below.

On Mon, Oct 19, 2026 at 10:47:20AM +0900, Lachlan Michael wrote:
> The IMX908 is an 8.39 MP (3856x2176) CMOS image sensor with a MIPI CSI-2
> output interface. The driver supports RAW10 and RAW12 output formats,
> exposure and analogue gain controls, image flipping, blanking controls
> and test pattern generation.
> 
> HDR modes and RAW16 output are not currently supported.
> 
> Signed-off-by: Lachlan Michael <lachlan.michael@sony.com>
> ---
> Changes in v5:
> - Add the IMX908 driver file to the MAINTAINERS entry (left out in v4)
> ---
>  MAINTAINERS                |    1 +
>  drivers/media/i2c/Kconfig  |   11 +
>  drivers/media/i2c/Makefile |    1 +
>  drivers/media/i2c/imx908.c | 1168 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 1181 insertions(+)
>  create mode 100644 drivers/media/i2c/imx908.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 91aaba2cf764..5fd203bdfacf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25582,6 +25582,7 @@ SONY IMX908 SENSOR DRIVER
>  M:	Lachlan Michael <lachlan.michael@sony.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
> +F:	drivers/media/i2c/imx908.c
>  
>  SONY MEMORYSTICK SUBSYSTEM
>  M:	Maxim Levitsky <maximlevitsky@gmail.com>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 5c52007f9cbe..c8bee297cf9b 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -310,6 +310,17 @@ config VIDEO_IMX678
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called imx678.
>  
> +config VIDEO_IMX908
> +	tristate "Sony IMX908 sensor support"
> +	depends on GPIOLIB
> +	select V4L2_CCI_I2C
> +	help
> +	  This is a Video4Linux2 sensor driver for the Sony
> +	  IMX908 CMOS image sensor.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called imx908.
> +
>  config VIDEO_MAX9271_LIB
>  	tristate
>  
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index d04bd5724552..d91ed1bc6427 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -63,6 +63,7 @@ obj-$(CONFIG_VIDEO_IMX412) += imx412.o
>  obj-$(CONFIG_VIDEO_IMX415) += imx415.o
>  obj-$(CONFIG_VIDEO_IMX678) += imx678.o
>  obj-$(CONFIG_VIDEO_IMX471) += imx471.o
> +obj-$(CONFIG_VIDEO_IMX908) += imx908.o
>  obj-$(CONFIG_VIDEO_IR_I2C) += ir-kbd-i2c.o
>  obj-$(CONFIG_VIDEO_ISL7998X) += isl7998x.o
>  obj-$(CONFIG_VIDEO_KS0127) += ks0127.o
> diff --git a/drivers/media/i2c/imx908.c b/drivers/media/i2c/imx908.c
> new file mode 100644
> index 000000000000..4c7e78cfdcc4
> --- /dev/null
> +++ b/drivers/media/i2c/imx908.c
> @@ -0,0 +1,1168 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * V4L2 driver for Sony IMX908
> + *
> + * Diagonal 6.42 mm (Type 1/2.8) CMOS image sensor with 8.39 M pixels.
> + *
> + * Copyright 2026 Sony Semiconductor Solutions Corporation
> + *

Redundant line.

> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/bitops.h>
> +#include <linux/clk.h>
> +#include <linux/container_of.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/math.h>		/* DIV_ROUND_UP */
> +#include <linux/math64.h>	/* DIV64_U64_ROUND_UP */
> +#include <linux/minmax.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/property.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <media/media-entity.h>
> +#include <media/v4l2-cci.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mediabus.h>
> +#include <media/v4l2-rect.h>
> +#include <media/v4l2-subdev.h>
> +
> +/* ---- IMX908 Registers --------- */
> +#define IMX908_REG_STANDBY	CCI_REG8(0x3000)
> +#define IMX908_STANDBY_EN	BIT(0)		/* Standby mode */
> +#define IMX908_STANDBY_CANCEL	0x00		/* Operating mode */
> +#define IMX908_REG_XMSTA	CCI_REG8(0x3002)	/* [0] Init 1h */
> +#define IMX908_XMSTA_START	0x00
> +#define IMX908_XMSTA_STOP	0x01
> +#define IMX908_REG_XMASTER	CCI_REG8(0x3003)	/* [0] Init 0h */
> +#define IMX908_CONTROLLER_MODE	0x00
> +#define IMX908_REG_INCK_SEL	CCI_REG8(0x3014)	/* 0:74.25 1:37.125 2:72 3:27 4:24 */
> +#define IMX908_REG_DATARATE_SEL	CCI_REG8(0x3015)
> +
> +/* ---- Crop */
> +#define IMX908_REG_WINMODE	CCI_REG8(0x3018)	/* [3:0] */
> +#define IMX908_WINMODE_ALLPIX	0x00	/* All-pixel readout mode */
> +
> +/* ---- Flip */
> +#define IMX908_REG_HREVERSE	CCI_REG8(0x3020)
> +#define IMX908_HREVERSE_NORMAL	0x00
> +#define IMX908_HREVERSE_INV	0x01
> +#define IMX908_REG_VREVERSE	CCI_REG8(0x3021)
> +#define IMX908_VREVERSE_NORMAL	0x00
> +#define IMX908_VREVERSE_INV	0x01
> +
> +/* ---- Internal Analog to Digital conversion bit width */
> +#define IMX908_REG_ADBIT	CCI_REG8(0x3022)
> +#define IMX908_ADBIT_10BIT	0x00	/* 10-bit */
> +#define IMX908_ADBIT_12BIT	0x01	/* 11-bit + digital dither */
> +
> +#define IMX908_REG_MDBIT	CCI_REG8(0x3023)
> +#define IMX908_MDBIT_RAW10	0x00
> +#define IMX908_MDBIT_RAW12	0x01
> +
> +/* ---- VMAX  Frame length in lines */
> +#define IMX908_REG_VMAX		CCI_REG24_LE(0x3028)	/* [19:0] */
> +#define IMX908_VMAX_MAX		0xfffff
> +#define IMX908_VMAX_DEFAULT	2250
> +/*
> + * VMAX restrictions, documented for window cropping mode:
> + * VMAX >= PIX_VWIDTH + 70
> + * VMAX >= 1206
> + */
> +#define IMX908_VMAX_MARGIN	70
> +#define IMX908_VMAX_MIN		1206
> +
> +/* ---- HMAX Line length in clocks */
> +#define IMX908_REG_HMAX		CCI_REG16_LE(0x302c)	/* [15:0] */
> +#define IMX908_HMAX_MAX		0xffff
> +#define IMX908_HMAX_DEFAULT	1100
> +
> +#define IMX908_REG_LANEMODE	CCI_REG8(0x3040)
> +#define IMX908_LANEMODE_2LANE	0x01
> +#define IMX908_LANEMODE_4LANE	0x03
> +
> +/* ---- Shutter */
> +#define IMX908_REG_SHR0		CCI_REG24_LE(0x3050)	/* [19:0] */
> +#define IMX908_MIN_SHR0		7
> +
> +/*
> + * Analogue gain control
> + * Range is from 0 to 100 (0dB - 30dB) with 0.3dB step size
> + * Values from 101 to 240 are valid but correspond to additional digital gain
> + * (0.3dB - 42dB) so don't expose it to userspace
> + */
> +#define IMX908_REG_GAIN		CCI_REG16_LE(0x3070)	/* [10:0] */
> +#define IMX908_ANA_GAIN_MAX	100
> +#define IMX908_ANA_GAIN_MIN	0
> +#define IMX908_ANA_GAIN_STEP	1
> +#define IMX908_ANA_GAIN_DEFAULT	0
> +
> +/* ---- XVS/XHS output mode */
> +#define IMX908_XXS_DRV		CCI_REG8(0x30a6)	/* [1:0] XVS_DRV [3:2] XHS_DRV */
> +
> +#define IMX908_REG_BLKLEVEL	CCI_REG16_LE(0x30dc)	/* [15:0] black level */
> +
> +/* ---- Test Pattern Generator (TPG) registers */
> +#define IMX908_REG_TPG_EN	CCI_REG8(0x30e0)
> +#define IMX908_TPG_EN_BIT	BIT(0)
> +#define IMX908_REG_TPG_PATSEL	CCI_REG8(0x30e2)	/* [4:0] pattern idx */
> +#define IMX908_REG_TESTCLKEN	CCI_REG8(0x4900)
> +#define IMX908_TESTCLKEN_BIT	BIT(3)
> +
> +#define IMX908_REG_TYPE_ID	CCI_REG16_LE(0x4c0c)
> +#define IMX908_CHIP_ID		0x038c
> +
> +/* ---- IMX908 Common Register List ---- */
> +static const struct cci_reg_sequence imx908_common_regs[] = {
> +	{ IMX908_XXS_DRV, IMX908_CONTROLLER_MODE },
> +	{ CCI_REG8(0x309c), 0x03 },
> +	{ CCI_REG8(0x3416), 0x20 },
> +	{ CCI_REG8(0x3417), 0x00 },
> +	{ CCI_REG8(0x3456), 0xf4 },
> +	{ CCI_REG8(0x345d), 0x01 },
> +	{ CCI_REG8(0x3460), 0x00 },
> +	{ CCI_REG8(0x3461), 0x0b },
> +	{ CCI_REG8(0x3471), 0x00 },
> +	{ CCI_REG8(0x3472), 0x23 },
> +	{ CCI_REG8(0x347b), 0x02 },
> +	{ CCI_REG8(0x3481), 0x01 },
> +	{ CCI_REG8(0x380c), 0x00 },
> +	{ CCI_REG8(0x380f), 0x0c },
> +	{ CCI_REG8(0x381c), 0x11 },
> +	{ CCI_REG8(0x3820), 0x22 },
> +	{ CCI_REG8(0x3824), 0x33 },
> +	{ CCI_REG8(0x3828), 0x22 },
> +	{ CCI_REG8(0x382c), 0x33 },
> +	{ CCI_REG8(0x3830), 0x33 },
> +	{ CCI_REG8(0x3838), 0x05 },
> +	{ CCI_REG8(0x383c), 0x07 },
> +	{ CCI_REG8(0x3840), 0x06 },
> +	{ CCI_REG8(0x3848), 0x17 },
> +	{ CCI_REG8(0x384c), 0x0b },
> +	{ CCI_REG8(0x3850), 0x10 },
> +	{ CCI_REG8(0x3854), 0x12 },
> +	{ CCI_REG8(0x385c), 0x20 },
> +	{ CCI_REG8(0x38c4), 0x64 },
> +	{ CCI_REG8(0x38c5), 0x64 },
> +	{ CCI_REG8(0x38c6), 0x64 },
> +	{ CCI_REG8(0x3c4a), 0x15 },
> +	{ CCI_REG8(0x3c4c), 0x13 },
> +	{ CCI_REG8(0x3c4d), 0x13 },
> +	{ CCI_REG8(0x3c4e), 0x13 },
> +	{ CCI_REG8(0x3c50), 0x77 },
> +	{ CCI_REG8(0x3c51), 0x07 },
> +	{ CCI_REG8(0x3db4), 0x00 },
> +	{ CCI_REG8(0x4419), 0x06 },
> +	{ CCI_REG8(0x441c), 0x00 },
> +	{ CCI_REG8(0x4426), 0x00 },
> +	{ CCI_REG8(0x4538), 0x19 },
> +	{ CCI_REG8(0x4539), 0x19 },
> +	{ CCI_REG8(0x453a), 0x19 },
> +	{ CCI_REG8(0x453b), 0x19 },
> +	{ CCI_REG8(0x453c), 0x19 },
> +	{ CCI_REG8(0x453d), 0x19 },
> +	{ CCI_REG8(0x453e), 0x19 },
> +	{ CCI_REG8(0x453f), 0x19 },
> +	{ CCI_REG8(0x4540), 0x19 },
> +	{ CCI_REG8(0x4544), 0x11 },
> +	{ CCI_REG8(0x4545), 0x11 },
> +	{ CCI_REG8(0x4546), 0x11 },
> +	{ CCI_REG8(0x463c), 0x20 },
> +	{ CCI_REG8(0x465e), 0xcf },
> +	{ CCI_REG8(0x4684), 0x20 },
> +	{ CCI_REG8(0x46a6), 0xcf },
> +	{ CCI_REG8(0x46e2), 0xf3 },
> +	{ CCI_REG8(0x4746), 0xf3 },
> +	{ CCI_REG8(0x4774), 0xcd },
> +	{ CCI_REG8(0x4776), 0xe3 },
> +	{ CCI_REG8(0x4780), 0xff },
> +	{ CCI_REG8(0x4781), 0x03 },
> +	{ CCI_REG8(0x4782), 0x00 },
> +	{ CCI_REG8(0x4783), 0x00 },
> +	{ CCI_REG8(0x47ce), 0xe3 },
> +	{ CCI_REG8(0x4804), 0x0b },
> +	{ CCI_REG8(0x481e), 0xeb },
> +	{ CCI_REG8(0x4846), 0xeb },
> +};
> +
> +static const u32 imx908_bit_depth_regs[] = {
> +	CCI_REG8(0x3d78),
> +	CCI_REG8(0x3d79),
> +	CCI_REG8(0x3d80),
> +	CCI_REG8(0x3d81),
> +	CCI_REG8(0x3d88),
> +	CCI_REG8(0x3d89),
> +	CCI_REG8(0x3d90),
> +	CCI_REG8(0x3d91),
> +};
> +
> +#define IMX908_EXPOSURE_MIN	1
> +#define IMX908_EXPOSURE_STEP	1
> +
> +/* ---- Internal image-data interface clock */
> +#define IMX908_VTPXCK_HZ	74250000ULL
> +
> +/* Fixed pixel rate: 16 pixels per video timing pixel clock cycle */
> +#define IMX908_PIX_PER_CLK	16
> +#define IMX908_PIXEL_RATE	(IMX908_VTPXCK_HZ * IMX908_PIX_PER_CLK)
> +
> +/* ---- Subdev Pads */
> +#define IMX908_SOURCE_PAD	0
> +
> +#define IMX908_DEFAULT_MBUS_CODE MEDIA_BUS_FMT_SRGGB10_1X10
> +
> +/*
> + * IMX908 total area includes active area height plus
> + *  4 pixels effective pixel ignored area
> + * 10 pixels vertical direction effective OB
> + * 10 pixels OB side ignored area
> + */
> +static const struct v4l2_rect imx908_total_area = {
> +	.top = 0,
> +	.left = 0,
> +	.width = 3856,
> +	.height = 2200,
> +};
> +
> +static const struct v4l2_rect imx908_active_area = {
> +	.top = 24,
> +	.left = 0,
> +	.width = 3856,
> +	.height = 2176,
> +};
> +
> +static const char *const imx908_supply_names[] = {
> +	"avdd",  /* Analog (3.3V) supply */
> +	"dvdd",  /* Digital Core (1.1V) supply */
> +	"ovdd",  /* IF (1.8V) supply */
> +};
> +
> +static const u32 imx908_mbus_codes[] = {
> +	MEDIA_BUS_FMT_SRGGB10_1X10, /* RAW10 */
> +	MEDIA_BUS_FMT_SRGGB12_1X12, /* RAW12 */
> +};
> +
> +/*
> + * Link frequency indices, ordered so that the index is also the
> + * DATARATE_SEL register value. Keep in descending frequency order.
> + */
> +enum {
> +	IMX908_LINK_FREQ_1188MHZ = 0x00,
> +	IMX908_LINK_FREQ_1039MHZ = 0x01,
> +	IMX908_LINK_FREQ_891MHZ  = 0x02,
> +	IMX908_LINK_FREQ_720MHZ  = 0x03,
> +	IMX908_LINK_FREQ_594MHZ  = 0x04,
> +	IMX908_LINK_FREQ_445MHZ  = 0x05,
> +	IMX908_LINK_FREQ_360MHZ  = 0x06,
> +	IMX908_LINK_FREQ_297MHZ  = 0x07,
> +};
> +
> +static const s64 imx908_link_freqs[] = {
> +	[IMX908_LINK_FREQ_1188MHZ] = 1188000000LL,
> +	[IMX908_LINK_FREQ_1039MHZ] = 1039500000LL,
> +	[IMX908_LINK_FREQ_891MHZ]  =  891000000LL,
> +	[IMX908_LINK_FREQ_720MHZ]  =  720000000LL,
> +	[IMX908_LINK_FREQ_594MHZ]  =  594000000LL,
> +	[IMX908_LINK_FREQ_445MHZ]  =  445500000LL,
> +	[IMX908_LINK_FREQ_360MHZ]  =  360000000LL,
> +	[IMX908_LINK_FREQ_297MHZ]  =  297000000LL,
> +};
> +
> +/* Allowed clock values in Hz */
> +static const u32 imx908_inck_table[] = {
> +	74250000,
> +	37125000,
> +	72000000,
> +	27000000,
> +	24000000,
> +};
> +
> +struct imx908 {
> +	struct v4l2_subdev sd;
> +	struct media_pad pad;
> +	struct device *dev;
> +
> +	struct regmap *cci;
> +
> +	struct clk *xclk;
> +	struct gpio_desc *reset_gpio;
> +	struct regulator_bulk_data supplies[ARRAY_SIZE(imx908_supply_names)];
> +
> +	u8 inck_sel;
> +
> +	u8 num_lanes;
> +	unsigned long link_freq_bitmap;
> +	unsigned int link_freq_idx;
> +
> +	struct {
> +		struct v4l2_ctrl_handler handler;
> +
> +		struct v4l2_ctrl *exposure;
> +		struct v4l2_ctrl *vblank;
> +		struct v4l2_ctrl *hblank;
> +	} ctrls;
> +};
> +
> +static inline struct imx908 *to_imx908(struct v4l2_subdev *_sd)
> +{
> +	return container_of(_sd, struct imx908, sd);
> +}
> +
> +/* ----------------------- Basic Helper Functions --------------------------- */
> +static bool imx908_mbus_code_supported(struct imx908 *imx, u32 code)
> +{
> +	for (unsigned int i = 0; i < ARRAY_SIZE(imx908_mbus_codes); i++) {
> +		if (imx908_mbus_codes[i] == code)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static u16 imx908_calc_hmax(u32 width, u32 hblank)
> +{
> +	u32 hmax = DIV_ROUND_UP(width + hblank, IMX908_PIX_PER_CLK);
> +
> +	return min_t(u32, hmax, IMX908_HMAX_MAX);
> +}
> +
> +/* Horizontal cropping is digital, so the full width is always read out */
> +static u16 imx908_calc_min_hmax(struct imx908 *imx, u8 bpp)
> +{
> +	u64 link_hz = imx908_link_freqs[imx->link_freq_idx];
> +	u64 num = (u64)imx908_active_area.width * bpp * IMX908_VTPXCK_HZ;
> +	u64 den = (u64)imx->num_lanes * link_hz * 2; /* DDR */
> +
> +	/*
> +	 * Note that the denominator (den) can exceed 32 bits
> +	 * (e.g. 4 lanes * 720 MHz * 2 = 5.76 GHz), so DIV_ROUND_UP_ULL / do_div
> +	 * would truncate the divisor to u32. Use a full 64/64 division.
> +	 */
> +	return DIV64_U64_ROUND_UP(num, den);
> +}
> +
> +static u32 imx908_calc_min_vblank(const struct v4l2_rect *crop)
> +{
> +	u32 min_vmax = max_t(u32, crop->height + IMX908_VMAX_MARGIN,
> +			     IMX908_VMAX_MIN);
> +
> +	return min_vmax - crop->height;
> +}
> +
> +static int imx908_set_exposure_lines(struct imx908 *imx, u32 exposure_lines)
> +{
> +	const struct v4l2_mbus_framefmt *format;
> +	struct v4l2_subdev_state *state;
> +	u32 vmax, max_lines;
> +
> +	state = v4l2_subdev_get_locked_active_state(&imx->sd);
> +	format = v4l2_subdev_state_get_format(state, IMX908_SOURCE_PAD);
> +
> +	vmax = format->height + imx->ctrls.vblank->val;
> +	max_lines = vmax - IMX908_MIN_SHR0;
> +
> +	/* Guards SHR0 underflow when VBLANK+EXPOSURE are set together */
> +	exposure_lines = clamp_t(u32, exposure_lines, 1, max_lines);
> +
> +	u32 shr0 = vmax - exposure_lines;
> +
> +	return cci_write(imx->cci, IMX908_REG_SHR0, shr0, NULL);
> +}
> +
> +static u8 imx908_bits_per_pixel(u32 code)
> +{
> +	switch (code) {
> +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> +		return 12;
> +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> +	default:
> +		return 10;
> +	}
> +}
> +
> +static u32 imx908_hmax_to_hblank(u16 hmax, u32 width)
> +{
> +	return hmax * IMX908_PIX_PER_CLK - width;
> +}
> +
> +static int imx908_update_hblank_limits(struct imx908 *imx, u32 width, u8 bpp)
> +{
> +	u16 min_hmax = imx908_calc_min_hmax(imx, bpp);
> +	u32 min_hblank = imx908_hmax_to_hblank(min_hmax, width);
> +	u32 max_hblank = imx908_hmax_to_hblank(IMX908_HMAX_MAX, width);
> +	u32 def_hblank = imx908_hmax_to_hblank(IMX908_HMAX_DEFAULT, width);
> +
> +	def_hblank = clamp_t(u32, def_hblank, min_hblank, max_hblank);
> +
> +	return __v4l2_ctrl_modify_range(imx->ctrls.hblank, min_hblank,
> +					max_hblank, IMX908_PIX_PER_CLK,
> +					def_hblank);
> +}
> +
> +/* ------------------ Pattern Generator (TPG) ----------------------- */
> +static const char * const imx908_tpg_menu[] = {
> +	"Disabled",
> +	"All 000h",
> +	"All FFFh",
> +	"All 555h",
> +	"All AAAh",
> +	"555h / AAAh Toggle",
> +	"AAAh / 555h Toggle",
> +	"000h / 555h Toggle",
> +	"555h / 000h Toggle",
> +	"000h / FFFh Toggle",
> +	"FFFh / 000h Toggle",
> +	"Horiz Color Bars",
> +	"Vert Color Bars",
> +};
> +
> +static int imx908_update_test_pattern(struct imx908 *imx, u32 index)
> +{
> +	int ret = 0;
> +
> +	if (index == 0) {
> +		/* Picture (not TPG) output setting */
> +		cci_update_bits(imx->cci, IMX908_REG_TPG_EN, IMX908_TPG_EN_BIT,
> +				0x00, &ret);
> +
> +		/* Disable TESTCLKEN (write-only register) */
> +		cci_write(imx->cci, IMX908_REG_TESTCLKEN, 0x00, &ret);
> +
> +		return ret;
> +	}
> +
> +	cci_write(imx->cci, IMX908_REG_TESTCLKEN, IMX908_TESTCLKEN_BIT, &ret);
> +	cci_write(imx->cci, IMX908_REG_TPG_PATSEL, index - 1, &ret);
> +	cci_update_bits(imx->cci, IMX908_REG_TPG_EN, IMX908_TPG_EN_BIT,
> +			IMX908_TPG_EN_BIT, &ret);
> +
> +	return ret;
> +}
> +
> +/* ----------------------- HW Programming ---------------------- */
> +static int imx908_set_mode(struct imx908 *imx,
> +			   const struct v4l2_mbus_framefmt *fmt)
> +{
> +	u8 adbit, mdbit, bit_depth_value, reg359c_value;
> +	u16 blklevel;
> +	int ret = 0;
> +
> +	switch (fmt->code) {
> +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> +		adbit = IMX908_ADBIT_10BIT;
> +		mdbit = IMX908_MDBIT_RAW10;
> +		blklevel = 50; /* datasheet recommended value for 10-bit */
> +		bit_depth_value = 0x0c;  /* 10-bit register map value */
> +		reg359c_value = 0x2c;
> +		break;
> +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> +	default:
> +		adbit = IMX908_ADBIT_12BIT;
> +		mdbit = IMX908_MDBIT_RAW12;
> +		blklevel = 200; /* datasheet recommended value for 12-bit */
> +		bit_depth_value = 0x05;   /* 12-bit register map value */
> +		reg359c_value = 0x2f;
> +		break;
> +	}
> +
> +	cci_write(imx->cci, IMX908_REG_XMASTER, IMX908_CONTROLLER_MODE, &ret);
> +	cci_write(imx->cci, IMX908_REG_WINMODE, IMX908_WINMODE_ALLPIX, &ret);
> +	cci_write(imx->cci, IMX908_REG_ADBIT, adbit, &ret);
> +	cci_write(imx->cci, IMX908_REG_MDBIT, mdbit, &ret);
> +	cci_write(imx->cci, CCI_REG8(0x359c), reg359c_value, &ret);
> +
> +	for (unsigned int i = 0; i < ARRAY_SIZE(imx908_bit_depth_regs); ++i)
> +		cci_write(imx->cci, imx908_bit_depth_regs[i], bit_depth_value, &ret);
> +
> +	cci_write(imx->cci, IMX908_REG_INCK_SEL, imx->inck_sel, &ret);
> +	cci_write(imx->cci, IMX908_REG_DATARATE_SEL, imx->link_freq_idx, &ret);
> +	cci_write(imx->cci, IMX908_REG_LANEMODE, imx->num_lanes == 2 ?
> +		  IMX908_LANEMODE_2LANE : IMX908_LANEMODE_4LANE, &ret);
> +	cci_write(imx->cci, IMX908_REG_BLKLEVEL, blklevel, &ret);
> +
> +	return ret;
> +}
> +
> +/* --------------------------- V4L2 controls ------------------------------ */
> +static int imx908_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct imx908 *imx = container_of(ctrl->handler, struct imx908,
> +					  ctrls.handler);
> +	const struct v4l2_mbus_framefmt *format;
> +	struct v4l2_subdev_state *state;
> +	int ret = 0;
> +
> +	state = v4l2_subdev_get_locked_active_state(&imx->sd);
> +	format = v4l2_subdev_state_get_format(state, IMX908_SOURCE_PAD);
> +
> +	/* Update exposure control limits even if the sensor is not streaming */
> +	if (ctrl->id == V4L2_CID_VBLANK) {
> +		u32 vmax = format->height + ctrl->val;
> +		u32 max_exposure = vmax - IMX908_MIN_SHR0;
> +		u32 current_exposure = clamp_t(u32, imx->ctrls.exposure->cur.val,
> +					       IMX908_EXPOSURE_MIN, max_exposure);
> +
> +		/* Use clamped current exposure as the default fallback when VBLANK shrinks */
> +		ret = __v4l2_ctrl_modify_range(imx->ctrls.exposure,
> +					       IMX908_EXPOSURE_MIN,
> +					       max_exposure,
> +					       IMX908_EXPOSURE_STEP,
> +					       current_exposure);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* Hardware writes only when powered; cached ctrls applied on resume */
> +	if (IS_ENABLED(CONFIG_PM) && !pm_runtime_get_if_active(imx->dev))

Is there a need to check for CONFIG_PM? pm_runtime_get_if_active() returns
-EINVAL when CONFIG_PM is disabled.

> +		return 0;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_EXPOSURE:
> +		ret = imx908_set_exposure_lines(imx, ctrl->val);
> +		break;
> +
> +	case V4L2_CID_ANALOGUE_GAIN:
> +		cci_write(imx->cci, IMX908_REG_GAIN, ctrl->val, &ret);
> +		break;
> +
> +	case V4L2_CID_VBLANK: {
> +		u32 vmax = format->height + ctrl->val;
> +
> +		ret = cci_write(imx->cci, IMX908_REG_VMAX, vmax, NULL);
> +		/* SHR0 derived from VMAX, re-apply exposure after VMAX change */
> +		if (!ret)
> +			ret = imx908_set_exposure_lines(imx,
> +							imx->ctrls.exposure->val);
> +		break;
> +	}
> +
> +	case V4L2_CID_HBLANK: {
> +		u16 hmax = imx908_calc_hmax(format->width, ctrl->val);
> +
> +		cci_write(imx->cci, IMX908_REG_HMAX, hmax, &ret);
> +		break;
> +	}
> +
> +	case V4L2_CID_TEST_PATTERN:
> +		ret = imx908_update_test_pattern(imx, ctrl->val);
> +		break;
> +
> +	/* Hardware REVERSE registers: NORMAL (0) = no flip, INV (1) = flip */
> +	case V4L2_CID_HFLIP:
> +		cci_write(imx->cci, IMX908_REG_HREVERSE,
> +			  ctrl->val ? IMX908_HREVERSE_INV
> +			  : IMX908_HREVERSE_NORMAL, &ret);
> +		break;
> +
> +	case V4L2_CID_VFLIP:
> +		cci_write(imx->cci, IMX908_REG_VREVERSE,
> +			  ctrl->val ? IMX908_VREVERSE_INV
> +			  : IMX908_VREVERSE_NORMAL, &ret);
> +		break;
> +
> +	default:
> +		dev_warn(imx->dev,
> +			 "ctrl(id:0x%x,val:0x%x) is not handled\n",
> +			 ctrl->id, ctrl->val);
> +		break;
> +	}
> +
> +	if (IS_ENABLED(CONFIG_PM))

Ditto.

> +		pm_runtime_put(imx->dev);
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops imx908_ctrl_ops = {
> +	.s_ctrl = imx908_set_ctrl,
> +};
> +
> +/* ------------------------ Pad/video ops ------------------ */
> +static int imx908_enum_mbus_code(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	if (code->index >= ARRAY_SIZE(imx908_mbus_codes))
> +		return -EINVAL;
> +
> +	code->code = imx908_mbus_codes[code->index];
> +
> +	return 0;
> +}
> +
> +static int imx908_enum_frame_size(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *sd_state,
> +				  struct v4l2_subdev_frame_size_enum *fse)
> +{
> +	struct imx908 *imx = to_imx908(sd);
> +	const struct v4l2_rect *crop;
> +
> +	if (fse->index > 0)
> +		return -EINVAL;
> +
> +	if (!imx908_mbus_code_supported(imx, fse->code))
> +		return -EINVAL;
> +
> +	crop = v4l2_subdev_state_get_crop(sd_state, IMX908_SOURCE_PAD);
> +
> +	fse->min_width  = crop->width;
> +	fse->max_width  = crop->width;
> +	fse->min_height = crop->height;
> +	fse->max_height = crop->height;
> +
> +	return 0;
> +}
> +
> +static int imx908_set_pad_format(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_format *fmt)
> +{
> +	struct imx908 *imx = to_imx908(sd);
> +	struct v4l2_mbus_framefmt *format;
> +
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
> +	    v4l2_subdev_is_streaming(sd))
> +		return -EBUSY;
> +
> +	format = v4l2_subdev_state_get_format(sd_state, fmt->pad);
> +
> +	if (imx908_mbus_code_supported(imx, fmt->format.code))
> +		format->code = fmt->format.code;
> +	else
> +		format->code = IMX908_DEFAULT_MBUS_CODE;
> +
> +	format->width = imx908_active_area.width;
> +	format->height = imx908_active_area.height;
> +
> +	/* Fully define metadata */
> +	format->field        = V4L2_FIELD_NONE;
> +	format->colorspace   = V4L2_COLORSPACE_RAW;
> +	format->ycbcr_enc    = V4L2_YCBCR_ENC_DEFAULT;
> +	format->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +	format->xfer_func    = V4L2_XFER_FUNC_NONE;
> +
> +	/* Limits track the real controls only for the ACTIVE state, not TRY */
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> +		int ret = imx908_update_hblank_limits(imx, format->width,
> +						      imx908_bits_per_pixel(format->code));
> +
> +		if (ret)
> +			return ret;
> +	}
> +
> +	fmt->format = *format;
> +
> +	return 0;
> +}
> +
> +static int imx908_get_selection(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_state *sd_state,
> +				struct v4l2_subdev_selection *sel)
> +{
> +	switch (sel->target) {
> +	case V4L2_SEL_TGT_CROP:
> +		sel->r = *v4l2_subdev_state_get_crop(sd_state,
> +						     IMX908_SOURCE_PAD);
> +		return 0;
> +
> +	case V4L2_SEL_TGT_NATIVE_SIZE:
> +		sel->r = imx908_total_area;
> +		return 0;
> +
> +	case V4L2_SEL_TGT_CROP_DEFAULT:
> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> +		sel->r = imx908_active_area;
> +		return 0;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int imx908_enable_streams(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *sd_state,
> +				 u32 pad,
> +				 u64 streams_mask)
> +{
> +	const struct v4l2_mbus_framefmt *format;
> +	struct imx908 *imx = to_imx908(sd);
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(imx->dev);
> +	if (ret)
> +		return ret;
> +
> +	cci_multi_reg_write(imx->cci, imx908_common_regs,
> +			    ARRAY_SIZE(imx908_common_regs), &ret);
> +	if (ret)
> +		goto err_rpm_put;
> +
> +	format = v4l2_subdev_state_get_format(sd_state, IMX908_SOURCE_PAD);
> +	ret = imx908_set_mode(imx, format);
> +	if (ret)
> +		goto err_rpm_put;
> +
> +	ret = __v4l2_ctrl_handler_setup(imx->sd.ctrl_handler);
> +	if (ret)
> +		goto err_rpm_put;
> +
> +	cci_write(imx->cci, IMX908_REG_STANDBY, IMX908_STANDBY_CANCEL, &ret);
> +	fsleep(24 * USEC_PER_MSEC); /* >=24 ms stabilization after standby cancel */
> +
> +	cci_write(imx->cci, IMX908_REG_XMSTA, IMX908_XMSTA_START, &ret);
> +
> +	if (ret)
> +		goto err_rpm_put;
> +
> +	return 0;
> +
> +err_rpm_put:
> +	pm_runtime_put_autosuspend(imx->dev);
> +	return ret;
> +}
> +
> +static int imx908_disable_streams(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *sd_state,
> +				  u32 pad,
> +				  u64 streams_mask)
> +{
> +	struct imx908 *imx = to_imx908(sd);
> +	int ret = 0;
> +
> +	cci_write(imx->cci, IMX908_REG_STANDBY, IMX908_STANDBY_EN, &ret);
> +	cci_write(imx->cci, IMX908_REG_XMSTA, IMX908_XMSTA_STOP, &ret);
> +
> +	pm_runtime_put_autosuspend(imx->dev);
> +
> +	return ret;
> +}
> +
> +static int imx908_init_state(struct v4l2_subdev *sd,
> +			     struct v4l2_subdev_state *sd_state)
> +{
> +	struct v4l2_subdev_format fmt = {
> +		.which = V4L2_SUBDEV_FORMAT_TRY,
> +		.pad   = IMX908_SOURCE_PAD,
> +		.format = {
> +			.code   = IMX908_DEFAULT_MBUS_CODE,
> +			.width  = imx908_active_area.width,
> +			.height = imx908_active_area.height,
> +		},
> +	};
> +
> +	*v4l2_subdev_state_get_crop(sd_state, IMX908_SOURCE_PAD) = imx908_active_area;
> +
> +	return imx908_set_pad_format(sd, sd_state, &fmt);
> +}
> +
> +static const struct v4l2_subdev_video_ops imx908_video_ops = {
> +	.s_stream = v4l2_subdev_s_stream_helper,
> +};
> +
> +static const struct v4l2_subdev_pad_ops imx908_pad_ops = {
> +	.enum_mbus_code      = imx908_enum_mbus_code,
> +	.enum_frame_size     = imx908_enum_frame_size,
> +	.get_fmt             = v4l2_subdev_get_fmt,
> +	.set_fmt             = imx908_set_pad_format,
> +	.get_selection       = imx908_get_selection,
> +	.enable_streams      = imx908_enable_streams,
> +	.disable_streams     = imx908_disable_streams,
> +};
> +
> +static const struct v4l2_subdev_internal_ops imx908_internal_ops = {
> +	.init_state = imx908_init_state,
> +};
> +
> +static const struct v4l2_subdev_ops imx908_subdev_ops = {
> +	.video = &imx908_video_ops,
> +	.pad   = &imx908_pad_ops,
> +};
> +
> +/* ----------------------- Power management ---------------------- */
> +static int imx908_runtime_resume(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct imx908 *imx = to_imx908(sd);
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(imx908_supply_names),
> +				    imx->supplies);
> +	if (ret) {
> +		dev_err(imx->dev, "failed to enable regulators\n");
> +		return ret;
> +	}
> +	/* XCLR already asserted by GPIOD_OUT_HIGH */
> +	udelay(1); /* >= 500ns T_low */
> +	gpiod_set_value_cansleep(imx->reset_gpio, 0); /* Sensor start */
> +
> +	ret = clk_prepare_enable(imx->xclk);
> +	if (ret) {
> +		dev_err(imx->dev, "failed to enable xclk: %d\n", ret);
> +		goto err_reset;
> +	}
> +
> +	fsleep(20); /* T_1 >= 20us before first SDA/SCL */
> +
> +	return 0;
> +
> +err_reset:
> +	gpiod_set_value_cansleep(imx->reset_gpio, 1);
> +	regulator_bulk_disable(ARRAY_SIZE(imx908_supply_names), imx->supplies);
> +	return ret;
> +}
> +
> +static int imx908_runtime_suspend(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct imx908 *imx = to_imx908(sd);
> +
> +	clk_disable_unprepare(imx->xclk);
> +	gpiod_set_value_cansleep(imx->reset_gpio, 1);
> +	regulator_bulk_disable(ARRAY_SIZE(imx908_supply_names), imx->supplies);

A newline here?

> +	return 0;
> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(imx908_pm_ops,
> +				 imx908_runtime_suspend,
> +				 imx908_runtime_resume, NULL);
> +
> +/* ------------------------------- Probe/remove --------------------------- */
> +static int imx908_get_inck_sel(struct imx908 *imx, u32 xclk_freq)
> +{
> +	for (unsigned int i = 0; i < ARRAY_SIZE(imx908_inck_table); i++) {
> +		if (imx908_inck_table[i] == xclk_freq) {
> +			imx->inck_sel = i;
> +			return 0;
> +		}
> +	}
> +
> +	return dev_err_probe(imx->dev, -EINVAL, "unsupported xclk %u Hz\n",
> +			     xclk_freq);
> +}
> +
> +static int imx908_get_regulators(struct imx908 *imx)
> +{
> +	for (unsigned int i = 0; i < ARRAY_SIZE(imx908_supply_names); i++)
> +		imx->supplies[i].supply = imx908_supply_names[i];
> +
> +	return devm_regulator_bulk_get(imx->dev,
> +				       ARRAY_SIZE(imx908_supply_names),
> +				       imx->supplies);
> +}
> +
> +static int imx908_parse_fwnode(struct imx908 *imx)
> +{
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY
> +	};
> +	struct fwnode_handle *ep;
> +	int ret;
> +
> +	ep = fwnode_graph_get_next_endpoint(dev_fwnode(imx->dev), NULL);
> +
> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	fwnode_handle_put(ep);
> +	if (ret)
> +		return ret;
> +
> +	imx->num_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
> +
> +	if (imx->num_lanes != 2 && imx->num_lanes != 4) {
> +		dev_err(imx->dev,
> +			"only 2 or 4 CSI-2 data lanes are supported (got %u)\n",
> +			imx->num_lanes);
> +		ret = -EINVAL;
> +		goto out_free;
> +	}
> +
> +	ret = v4l2_link_freq_to_bitmap(imx->dev,
> +				       bus_cfg.link_frequencies,
> +				       bus_cfg.nr_of_link_frequencies,
> +				       imx908_link_freqs,
> +				       ARRAY_SIZE(imx908_link_freqs),
> +				       &imx->link_freq_bitmap);
> +	if (ret)
> +		goto out_free;
> +
> +	imx->link_freq_idx = __ffs(imx->link_freq_bitmap);
> +
> +out_free:
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +	return ret;
> +}
> +
> +static int imx908_init_controls(struct imx908 *imx)
> +{
> +	struct v4l2_ctrl_handler *hdl = &imx->ctrls.handler;
> +	struct v4l2_fwnode_device_properties props;
> +	struct v4l2_ctrl *ctrl;
> +	int ret;
> +
> +	/* Read rotation and orientation properties from the firmware node */
> +	ret = v4l2_fwnode_device_parse(imx->dev, &props);
> +	if (ret)
> +		return ret;
> +
> +	ret = v4l2_ctrl_handler_init(hdl, 11);
> +	if (ret)
> +		return ret;
> +
> +	/* PIXEL_RATE is always read-only, so it needs no s_ctrl() handling */
> +	v4l2_ctrl_new_std(hdl, NULL, V4L2_CID_PIXEL_RATE,
> +			  IMX908_PIXEL_RATE, IMX908_PIXEL_RATE, 1,
> +			  IMX908_PIXEL_RATE);
> +
> +	/* LINK_FREQ is informational only and has no s_ctrl() handling */
> +	ctrl = v4l2_ctrl_new_int_menu(hdl, NULL, V4L2_CID_LINK_FREQ,
> +				      ARRAY_SIZE(imx908_link_freqs) - 1,
> +				      imx->link_freq_idx, imx908_link_freqs);
> +	if (ctrl)
> +		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	u32 min_vblank = imx908_calc_min_vblank(&imx908_active_area);
> +	u32 max_vblank = IMX908_VMAX_MAX - imx908_active_area.height;
> +	/* Default to the datasheet 30 fps operating point */
> +	u32 def_vblank = IMX908_VMAX_DEFAULT - imx908_active_area.height;
> +
> +	imx->ctrls.vblank = v4l2_ctrl_new_std(hdl, &imx908_ctrl_ops,
> +					      V4L2_CID_VBLANK, min_vblank,
> +					      max_vblank, 1, def_vblank);
> +
> +	u8 bpp = imx908_bits_per_pixel(IMX908_DEFAULT_MBUS_CODE);
> +	u16 min_hmax = imx908_calc_min_hmax(imx, bpp);
> +	u32 min_hblank = imx908_hmax_to_hblank(min_hmax,
> +					       imx908_active_area.width);
> +	u32 max_hblank = imx908_hmax_to_hblank(IMX908_HMAX_MAX,
> +					       imx908_active_area.width);
> +	u32 def_hblank = imx908_hmax_to_hblank(IMX908_HMAX_DEFAULT,
> +					       imx908_active_area.width);
> +
> +	/* Default HMAX can be infeasible at low link freqs; clamp into range */
> +	def_hblank = clamp_t(u32, def_hblank, min_hblank, max_hblank);
> +
> +	imx->ctrls.hblank = v4l2_ctrl_new_std(hdl, &imx908_ctrl_ops,
> +					      V4L2_CID_HBLANK, min_hblank,
> +					      max_hblank, IMX908_PIX_PER_CLK,
> +					      def_hblank);
> +
> +	u32 max_exp = IMX908_VMAX_DEFAULT - IMX908_MIN_SHR0;
> +
> +	imx->ctrls.exposure = v4l2_ctrl_new_std(hdl, &imx908_ctrl_ops,
> +						V4L2_CID_EXPOSURE,
> +						IMX908_EXPOSURE_MIN,
> +						max_exp,
> +						IMX908_EXPOSURE_STEP,
> +						max_exp / 2);
> +
> +	v4l2_ctrl_new_std(hdl, &imx908_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
> +			  IMX908_ANA_GAIN_MIN, IMX908_ANA_GAIN_MAX,
> +			  IMX908_ANA_GAIN_STEP, IMX908_ANA_GAIN_DEFAULT);
> +
> +	/* Set test pattern. Menu (13 entries: Disabled + 12 patterns) */
> +	v4l2_ctrl_new_std_menu_items(hdl, &imx908_ctrl_ops,
> +				     V4L2_CID_TEST_PATTERN,
> +				     ARRAY_SIZE(imx908_tpg_menu) - 1, 0, 0,
> +				     imx908_tpg_menu);
> +
> +	v4l2_ctrl_new_std(hdl, &imx908_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
> +	v4l2_ctrl_new_std(hdl, &imx908_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
> +
> +	v4l2_ctrl_new_fwnode_properties(hdl, &imx908_ctrl_ops, &props);
> +	if (hdl->error)
> +		return v4l2_ctrl_handler_free(hdl);
> +
> +	imx->sd.ctrl_handler = hdl;
> +
> +	return 0;
> +}
> +
> +static int imx908_identify_model(struct imx908 *imx)
> +{
> +	u16 chip_id;
> +	u64 val;
> +	int ret;
> +
> +	/*
> +	 * The TYPE_ID registers are not accessible after power-up while
> +	 * the device remains in standby. Exit standby and wait for the
> +	 * required stabilization period before reading the chip ID.
> +	 */
> +	ret = cci_write(imx->cci, IMX908_REG_STANDBY, IMX908_STANDBY_CANCEL, NULL);
> +	if (ret)
> +		return ret;
> +
> +	fsleep(24 * USEC_PER_MSEC); /* >=24 ms stabilization after standby cancel */
> +
> +	ret = cci_read(imx->cci, IMX908_REG_TYPE_ID, &val, NULL);
> +	if (ret)
> +		return ret;
> +
> +	chip_id = val;
> +	dev_dbg(imx->dev, "IMX908 chip ID: 0x%04x\n", chip_id);
> +
> +	if (chip_id != IMX908_CHIP_ID) {
> +		dev_err(imx->dev, "unexpected chip ID 0x%04x (expected 0x%04x)\n",
> +			chip_id, IMX908_CHIP_ID);
> +		return -ENXIO;
> +	}
> +
> +	/* Set to standby mode to save power */
> +	ret = cci_write(imx->cci, IMX908_REG_STANDBY, IMX908_STANDBY_EN, NULL);
> +	if (ret) {
> +		dev_err(imx->dev, "failed to enter standby state: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int imx908_probe(struct i2c_client *client)
> +{
> +	struct imx908 *imx;
> +	int ret;
> +
> +	imx = devm_kzalloc(&client->dev, sizeof(*imx), GFP_KERNEL);
> +	if (!imx)
> +		return -ENOMEM;
> +	imx->dev = &client->dev;
> +
> +	v4l2_i2c_subdev_init(&imx->sd, client, &imx908_subdev_ops);
> +	imx->sd.internal_ops = &imx908_internal_ops;
> +
> +	imx->cci = devm_cci_regmap_init_i2c(client, 16);
> +	if (IS_ERR(imx->cci))
> +		return dev_err_probe(imx->dev, PTR_ERR(imx->cci),
> +				     "CCI regmap init failed\n");
> +
> +	imx->xclk = devm_v4l2_sensor_clk_get(imx->dev, NULL);
> +	if (IS_ERR(imx->xclk))
> +		return dev_err_probe(imx->dev, PTR_ERR(imx->xclk),
> +				     "failed to get clock\n");
> +
> +	ret = imx908_get_inck_sel(imx, clk_get_rate(imx->xclk));
> +	if (ret)
> +		return ret;
> +
> +	imx->reset_gpio = devm_gpiod_get_optional(imx->dev, "reset",
> +						  GPIOD_OUT_HIGH);
> +	if (IS_ERR(imx->reset_gpio))
> +		return dev_err_probe(imx->dev, PTR_ERR(imx->reset_gpio),
> +				     "failed to get reset gpio\n");
> +
> +	ret = imx908_get_regulators(imx);
> +	if (ret)
> +		return dev_err_probe(imx->dev, ret, "failed to get regulators\n");
> +
> +	ret = imx908_parse_fwnode(imx);

I'd suggest to do fwnode parsing right after allocating the device's
context struct. Parsing the fwnode could fail with -EPROBE_DEFER in some
cases.

> +	if (ret)
> +		return dev_err_probe(imx->dev, ret, "device tree parse failed\n");
> +
> +	if (!IS_ENABLED(CONFIG_PM)) {
> +		ret = imx908_runtime_resume(imx->dev);

You should call the runtime_resume callback here unconditionally, and then
set the device's Runtime PM status to active and finally call
pm_runtime_idle() at the end of probe(). See e.g. imx219 for an example.

> +		if (ret)
> +			return dev_err_probe(imx->dev, ret, "power-on failed\n");
> +	}
> +
> +	pm_runtime_enable(imx->dev);
> +	ret = pm_runtime_resume_and_get(imx->dev);
> +	if (ret) {
> +		pm_runtime_disable(imx->dev);
> +		return dev_err_probe(imx->dev, ret, "power-on failed\n");
> +	}
> +
> +	ret = imx908_identify_model(imx);
> +	if (ret) {
> +		dev_err(imx->dev, "failed to identify model: %d\n", ret);
> +		goto err_put_pm;
> +	}
> +
> +	ret = imx908_init_controls(imx);
> +	if (ret)
> +		goto err_put_pm;
> +
> +	imx->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	imx->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +	imx->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&imx->sd.entity, 1, &imx->pad);
> +	if (ret)
> +		goto err_hdl;
> +
> +	/* Share the ctrl handler lock so s_ctrl can access the locked state */
> +	imx->sd.state_lock = imx->ctrls.handler.lock;
> +
> +	ret = v4l2_subdev_init_finalize(&imx->sd);
> +	if (ret)
> +		goto err_entity;
> +
> +	ret = v4l2_async_register_subdev_sensor(&imx->sd);
> +	if (ret)
> +		goto err_subdev;
> +
> +	pm_runtime_set_autosuspend_delay(imx->dev, 1000);
> +	pm_runtime_use_autosuspend(imx->dev);
> +	pm_runtime_put_noidle(imx->dev);
> +	pm_runtime_idle(imx->dev);
> +
> +	return 0;
> +
> +err_subdev:
> +	v4l2_subdev_cleanup(&imx->sd);
> +
> +err_entity:
> +	media_entity_cleanup(&imx->sd.entity);
> +
> +err_hdl:
> +	v4l2_ctrl_handler_free(imx->sd.ctrl_handler);
> +
> +err_put_pm:
> +	if (IS_ENABLED(CONFIG_PM))
> +		pm_runtime_put_sync_suspend(imx->dev);
> +	else
> +		imx908_runtime_suspend(imx->dev);
> +	pm_runtime_disable(imx->dev);
> +	return ret;
> +}
> +
> +static void imx908_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct imx908 *imx = to_imx908(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(sd);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_ctrl_handler_free(sd->ctrl_handler);
> +
> +	pm_runtime_dont_use_autosuspend(imx->dev);
> +	pm_runtime_disable(imx->dev);
> +	if (!pm_runtime_status_suspended(imx->dev)) {
> +		imx908_runtime_suspend(imx->dev);
> +		pm_runtime_set_suspended(imx->dev);
> +	}
> +}
> +
> +static const struct of_device_id imx908_of_ids[] = {
> +	{ .compatible = "sony,imx908" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx908_of_ids);
> +
> +static struct i2c_driver imx908_i2c_driver = {
> +	.driver = {
> +		.name           = "imx908",
> +		.pm             = pm_ptr(&imx908_pm_ops),
> +		.of_match_table = imx908_of_ids,
> +	},
> +	.probe  = imx908_probe,
> +	.remove = imx908_remove,
> +};
> +module_i2c_driver(imx908_i2c_driver);
> +
> +MODULE_AUTHOR("Lachlan Michael <Lachlan.Michael@sony.com>");
> +MODULE_DESCRIPTION("Sony IMX908 Sensor Driver");
> +MODULE_LICENSE("GPL");

-- 
Kind regards,

Sakari Ailus
