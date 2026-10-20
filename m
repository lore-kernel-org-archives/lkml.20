Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792487570;
	b=snnl9AnT9gzSVtZsfzXF4tRKmXz2GJ8fIuqzlJJKo8AipvIeD9vOc6yxexNqdy6f2LlN
	 Dk7ecXdNcaHeSLDCU96QNHEkZ8wQExjtaJnoCZeVGFW1jOt242DexdVr3PhaQBJZ5u9jZ
	 Xi950j+Vsl5uQppDnE/9N93RACwEaaOB1OKlnCBLZxhZgV/vEdcbpL/K/KT9cWWbkOVZU
	 p4FeRCn8JCOpvoEHHO5tz+xbvNlhVG6hwvrNi4rbx1NSZR0BFCkvI6WreyiEH/DlawkyI
	 VZL1gcbB6nyLy0I7fsRwqDiniETFHnjUXB0SS+276OhtJ8d4TOwfNebPEr3cpyVaUng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487570;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Z2Yo1/XiOrcUXheVTn9+xY9fWp3kcxzw8c0Qs8GbwAY=;
	b=O68EkngGxqjiCf3TyNzbUuItYANetsahla9JUH0jCXcA4SFxMM6tZ3w8WAO06QZrcD4R
	 mA77UTToO4ADnhCmhVGIfTv5Y0ZgIGeaeyUxuROHhOaBaBAuJMY8FtHvyxksO2uhCmjSp
	 jgn7ZswdxfeVQ/ZR0SyjNQivzLjFXLO9yCIruorRkOCYCy92JicJEk+XS2W5VRkjUKYBP
	 dpcb0E+E8s1135KErI0qo2G3zR5cjsE90yDhkjkFafhT1xDPsOwQJ6B8EG/FzoXEihr/X
	 GHue/vfgmBqHsKJFNP9kQOBNQJPtJBp+M3GjlvkGsMqXT1w6pjYQL03SptPDNZkbaRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k5aC7rgR;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32261606A323;
	Tue, 20 Oct 2026 09:12:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32261606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k5aC7rgR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792487569; x=1824023569;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PYDSE242dk2ojzWGw071/FezZUjihxz5hqfoejj52PQ=;
  b=k5aC7rgRnk5bPf6hMRHSTQmFXOgdFB+MhZi+D309cNZ2omuUTG+GpCCE
   CFDzvK/G1GeBX7JojIxGDjNbls/D3f6uMRgQ+6UKkGu0jJqaH8p+H13cf
   3fxKtRguBQzzrUMquCA9k324Na7yt31Nmox9grmit+87Y+Lmt0ZSZ2+ga
   gW9aU9gGgRSup8sSLK2xtWUiKYy/xs7OPcSFR4pJFDbT1C+L2Rtd6cehc
   pwwB7sqTmAXFlNJpr8VVwTO9xvYnNqAL7UfKfo05D4Ob0XTRk1SXR8Vda
   6jbu3LQMbfCYZet2u4iqGrYcsbQB4vXc7bb9Z8qeH1z0wclrA4EdWlhn9
   Q==;
X-CSE-ConnectionGUID: Q29NaabsQGOlaOKMPhlqgw==
X-CSE-MsgGUID: PZ/TKTLyTU+CguUkvhHSxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1196818"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1196818"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 02:12:48 -0700
X-CSE-ConnectionGUID: kyXz+3AtRQ2m2UZJ9f6aJA==
X-CSE-MsgGUID: V8cMHt+SSH+Z6mTOG6ItyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2729765"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.132])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 02:12:46 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B02F311F7E8;
	Tue, 20 Oct 2026 12:12:42 +0300 (EEST)
Date: Tue, 20 Oct 2026 12:12:42 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 01/16] media: imx678: Rework into generic Starvis 2
 sensor driver.
Message-ID: <atcwiviV8CG9Bddj@kekkonen.localdomain>
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
 <20261015-media-starvis2-v4-1-75fcdb4163f3@raspberrypi.com>
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
In-Reply-To: <20261015-media-starvis2-v4-1-75fcdb4163f3@raspberrypi.com>

Hi Dave,

On Thu, Oct 15, 2026 at 04:57:27PM +0100, Dave Stevenson wrote:
> The register layout and programming model for multiple of the
> Sony Starvis2 sensors is identical, so prepare for supporting
> those by renaming all common parts of the driver to a starvis2_
> prefix, and renaming the driver.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  MAINTAINERS                                     |  14 +-
>  drivers/media/i2c/Kconfig                       |  19 +-
>  drivers/media/i2c/Makefile                      |   2 +-
>  drivers/media/i2c/{imx678.c => sony-starvis2.c} | 773 ++++++++++++------------
>  4 files changed, 422 insertions(+), 386 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 760791e3635f..bba095bc1a63 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25640,13 +25640,6 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml
>  F:	drivers/media/i2c/imx576.c
>  
> -SONY IMX678 SENSOR DRIVER
> -M:	Jai Luthra <jai.luthra@ideasonboard.com>
> -L:	linux-media@vger.kernel.org
> -S:	Maintained
> -F:	Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> -F:	drivers/media/i2c/imx678.c
> -
>  SONY MEMORYSTICK SUBSYSTEM
>  M:	Maxim Levitsky <maximlevitsky@gmail.com>
>  M:	Alex Dubov <oakad@yahoo.com>
> @@ -25657,6 +25650,13 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git
>  F:	drivers/memstick/
>  F:	include/linux/memstick.h
>  
> +SONY STARVIS 2 SENSOR DRIVER
> +M:	Jai Luthra <jai.luthra@ideasonboard.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> +F:	drivers/media/i2c/sony-starvis2.c

Can you also add drivers/media/i2c/sony-starvis2.c to the generic V4L2
CAMERA SENSOR DRIVERS entry, please? Or maybe
drivers/media/i2c/sony-starvis*?

> +
>  SONY VAIO CONTROL DEVICE DRIVER
>  M:	Mattia Dongili <malattia@linux.it>
>  L:	platform-driver-x86@vger.kernel.org
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 7de2d095c969..8c43ae77b47e 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -324,13 +324,11 @@ config VIDEO_IMX576
>  config VIDEO_IMX678
>  	tristate "Sony IMX678 sensor support"
>  	depends on GPIOLIB
> -	select V4L2_CCI_I2C
> +	select VIDEO_SONY_STARVIS2
>  	help
>  	  This is a Video4Linux2 sensor driver for the Sony
> -	  IMX678 camera.
> -
> -	  To compile this driver as a module, choose M here: the
> -	  module will be called imx678.
> +	  IMX678 camera. This sensor is now supported by the common
> +	  Sony Starvis 2 sensor driver.
>  
>  config VIDEO_MAX9271_LIB
>  	tristate
> @@ -879,6 +877,17 @@ config VIDEO_S5KJN5
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called s5kjn5.
>  
> +config VIDEO_SONY_STARVIS2
> +	tristate "Sony Starvis 2 sensor support"
> +	depends on GPIOLIB
> +	select V4L2_CCI_I2C
> +	help
> +	  This is a Video4Linux2 sensor driver for the Sony Starvis
> +	  2 image sensors.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called sony-starvis2.
> +
>  config VIDEO_T4KA3
>  	tristate "Toshiba T4KA3 sensor support"
>  	depends on ACPI || COMPILE_TEST
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index 59e31af457cd..609208dabd07 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -64,7 +64,6 @@ obj-$(CONFIG_VIDEO_IMX412) += imx412.o
>  obj-$(CONFIG_VIDEO_IMX415) += imx415.o
>  obj-$(CONFIG_VIDEO_IMX471) += imx471.o
>  obj-$(CONFIG_VIDEO_IMX576) += imx576.o
> -obj-$(CONFIG_VIDEO_IMX678) += imx678.o
>  obj-$(CONFIG_VIDEO_IR_I2C) += ir-kbd-i2c.o
>  obj-$(CONFIG_VIDEO_ISL7998X) += isl7998x.o
>  obj-$(CONFIG_VIDEO_IT6625) += it6625.o
> @@ -146,6 +145,7 @@ obj-$(CONFIG_VIDEO_SAA7127) += saa7127.o
>  obj-$(CONFIG_VIDEO_SAA717X) += saa717x.o
>  obj-$(CONFIG_VIDEO_SAA7185) += saa7185.o
>  obj-$(CONFIG_VIDEO_SONY_BTF_MPX) += sony-btf-mpx.o
> +obj-$(CONFIG_VIDEO_SONY_STARVIS2) += sony-starvis2.o
>  obj-$(CONFIG_VIDEO_ST_MIPID02) += st-mipid02.o
>  obj-$(CONFIG_VIDEO_T4KA3) += t4ka3.o
>  obj-$(CONFIG_VIDEO_TC358743) += tc358743.o
> diff --git a/drivers/media/i2c/imx678.c b/drivers/media/i2c/sony-starvis2.c
> similarity index 56%
> rename from drivers/media/i2c/imx678.c
> rename to drivers/media/i2c/sony-starvis2.c
> index 8413fd44d657..b4733990d03a 100644
> --- a/drivers/media/i2c/imx678.c
> +++ b/drivers/media/i2c/sony-starvis2.c
> @@ -1,8 +1,13 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * V4L2 driver for Sony IMX678
> + * V4L2 driver for Sony Starvis 2 sensors
>   *
> - * Diagonal 8.86 mm (Type 1/1.8) CMOS image sensor with 8.40 M effective pixels.
> + * Many of the Sony Starvis 2 sensors share a common register layout, so
> + * many can be supported by a common driver.
> + *
> + * Currently supported are:
> + * IMX678: Diagonal 8.86 mm (Type 1/1.8) CMOS image sensor with 8.40 M effective
> + *         pixels.
>   *
>   * Copyright (C) 2026 Ideas On Board Oy.
>   *
> @@ -26,25 +31,25 @@
>  #include <media/v4l2-subdev.h>
>  
>  /* Standby or streaming mode */
> -#define IMX678_REG_MODE_SELECT          CCI_REG8(0x3000)
> -#define IMX678_MODE_STANDBY             0x01
> -#define IMX678_MODE_STREAMING           0x00
> -#define IMX678_STREAM_DELAY_US          25000
> -#define IMX678_STREAM_DELAY_RANGE_US    1000
> +#define STARVIS2_REG_MODE_SELECT          CCI_REG8(0x3000)
> +#define STARVIS2_MODE_STANDBY             0x01
> +#define STARVIS2_MODE_STREAMING           0x00
> +#define STARVIS2_STREAM_DELAY_US          25000
> +#define STARVIS2_STREAM_DELAY_RANGE_US    1000
>  
>  /* XVS/XHS sync control */
> -#define IMX678_REG_XMSTA                CCI_REG8(0x3002)
> -#define IMX678_REG_XXS_DRV              CCI_REG8(0x30a6)
> -#define IMX678_REG_XXS_OUTSEL           CCI_REG8(0x30a4)
> +#define STARVIS2_REG_XMSTA                CCI_REG8(0x3002)
> +#define STARVIS2_REG_XXS_DRV              CCI_REG8(0x30a6)
> +#define STARVIS2_REG_XXS_OUTSEL           CCI_REG8(0x30a4)

It'd be nice to use tabs here, even though the old driver didn't (I wonder
what happened there).

...

> -module_i2c_driver(imx678_i2c_driver);
> +module_i2c_driver(starvis2_i2c_driver);
>  
>  MODULE_AUTHOR("Will Whang <will@willwhang.com>");
>  MODULE_AUTHOR("Tetsuya NOMURA <tetsuya.nomura@soho-enterprise.com>");
>  MODULE_AUTHOR("Jai Luthra <jai.luthra@ideasonboard.com>");

I guess you'll add yours at some point in the set?

> -MODULE_DESCRIPTION("Sony imx678 sensor driver");
> +MODULE_DESCRIPTION("Sony Starvis 2 sensor driver");
>  MODULE_LICENSE("GPL");
> 

-- 
Regards,

Sakari Ailus
