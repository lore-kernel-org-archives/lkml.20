Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794857124;
	b=SEDHyWTzrNHcoDMV7s1aHH2qs9woW65N5/xd5A8+h1GHgycJjgvBdGdfO7enqLXHyKZ7
	 pdoB9c8DFzURK3z/21RTA9C89NL2nQHQRi2VOxfUuEvqpJ55wlT61i3e4LV+RQuvA40bl
	 bIfElkLpczCTjiR7D8MeXMM5iULSnXk6dUmNoV/EG4foCvr8BRbY+ri0Bmby5dTZgW602
	 kIcvhcXMhXmcIwDiN3+UarI5XeTGedksh9ZdZzD5kb1TCi+CPFosHZtv9FPgEQk0Ooo44
	 sDHjMjMusLHWxDK0dX0O1xYoaXBPl8woJ16zU4schxUCOIQ/2ku97M+JwQn6Tjqd++g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=q2kKAv7PWyZbI4Z7cE3h6ir6zggAj5OtxpofUg84cuM=;
	b=uXT9CBNIMlKNazp8iDwctdFq5Njlf+qt+0E4gwp1l8XuK6kkN7soS+I8yfcaErUr5M2M
	 qsSCLPEIP5uD7oU0TdaCiDzx2JAxMdIKE2fEtunhP2nBggr91QJEpzS779wOH/S+WRZir
	 +Dle8KV7nyx2O3DNu0qlo7zgQWvmAMTbHnyuzhiYiED0K2mF7aaz9ChspNwC+3PZ2FRB6
	 NbGnZjBTUE+BKrOknIp7+Td5uLpM+VOh3oUbVp9+UwQQgDXpsa8FGMLfWu7ZaPIgbMG6E
	 ql1mZvgOVM7PWH1484p2bekThvlQhLPpXXCZ3YPAu65dnChTOb5V6ZMZNemqZDEAYtg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=CT0Nt6gv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECCE606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:25:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CECCE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=CT0Nt6gv
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-71ac9e15640so1924996eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:25:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794857122; cv=none;
        d=google.com; s=arc-20260327;
        b=VfksDWNqWFm8/Dbeb4mMPHE2A+XIlyTsjdP05qlmoVjBLa8FIePhHt/c06SfqCTYYE
         CRlgOzBBiPf/5G/yZYt6DyokwXT5eOAFXczsYnnLBPafO+83pBJsLqiO+wu4bXYPyO4s
         k6Tw2S5LoaCIS1yeK2VL8ET0BwolPscNQQZfYji/EozSROHX8pP9EqtPyaIGuYv40P7r
         rteeDp/THL9HtT2qpb2JIB1NZ8iAgRyLpOqiUMMbnwdAMdZMPGkkQey/2H5ROAnINvhj
         nNIQGla9A4YWvxdPqtfQs3K7jfXBIEmebG7i+WqOIyXdB6P69jGtB21jzX/VF91vfjev
         tRKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=q2kKAv7PWyZbI4Z7cE3h6ir6zggAj5OtxpofUg84cuM=;
        fh=o1GA/KxpbJ6Mqr+L78jfk8IE5v5o0IOgYCoNt6c9LEc=;
        b=mvqGMsGnO48/Wm1FHEp7AhP8+e9H5MKl9OeGthR1f8CFk25ODSNg9TV0n7rIUHuOwG
         VDbiieATsU3vunuUcvivvHh5aZcQnxobXywEExfkwjowYJQYgIVT676yhWs1e6Sd5SeB
         jiLogPjaobSnECbQ3HJQT+i75PEc0YdBru8TqNChQZ/pxytS3wH9OUV1jfyusUg+eejX
         latOfqy9D5HWI6DREi9VqE51wRltlbdVdnzoUVN4yuGRuuSLwc40Nmq8iEO4f9AUhNFo
         zXRACt0hMcpk0Nz7kroENTEIgagdIZ1yEGJpo6Uj3FTYsTZuEUHS8gaFRJNvIPoss+wg
         OGLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1794857122; x=1795461922; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q2kKAv7PWyZbI4Z7cE3h6ir6zggAj5OtxpofUg84cuM=;
        b=CT0Nt6gvQ5vBEDmFF25h+RWvOBsiGHsVwogrtwOMAN0PKmYeyF/wyfRz7Q3ju0I4q3
         ATdiqnt6iKPEIKVGFkM6dTibA3PsTqJaeOsqUYzb2XOW+SM6UEwmNs4lCSkpgezF+J1b
         onQYWkyssh37TdpO/Ov/FzUmS7sXRvQeSad3lcjbQwNk4NUAjvp2py7U7UV/tfaKFZVg
         BB3qIZLROkHYNMvfu3WxRz54fEXstK4SFEqvlXIPnGGKVqONNRoL8WZqQu3bzxXzcz7P
         zQWPklXeDr7t8m1Ziej0Zf1X0TNMQCg65G3Nb0rw7aJWe7MvjS3cyAwD8SVKCApzwWrG
         5KOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794857122; x=1795461922;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q2kKAv7PWyZbI4Z7cE3h6ir6zggAj5OtxpofUg84cuM=;
        b=oM6WjVfNTNDBnbQz7mvQdWdgestwSqU2J9n/Bb8GSdDDxqzWXM7gfttdEF/fqBLbnN
         9oov7aAiiEJwsjA0b40rptIUfblNikRau3c3/FIdUVnPLQVu+690/ZBvqpKGk+gNUGl+
         rLiEeMn1JnBhhm+c6OhlgE+xDiAxVRrRHQdJXrN/rYJtKYHQD9gkalmziIjej8lioU0o
         mm95tgkV+DnPtA1k3G6NKuI/eZIWH7V0gwaBI5IY6NDKGfsgLiYB9sHc04iIikLz6EH8
         IiPS0WaG8NUzkt9BCpz4C+mGza9XvzNST1hH1lbklf5S87WWaVkrkv5f/zBHL4bZdSm+
         xbgA==
X-Forwarded-Encrypted: i=1; AL+hErF/YcI4hmBcX2DJdzFgbZlVPf7H4npCAdaZDcgbD1Xgq7IwB3dDmmqgC6UInkpTu4yjroGSTnfbpXGwrDw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qDJBJGOW5Mdhi2OWznWbCkvYiLXjZsABx3bCnosJgfjhUO/Z1
	yHUFQcydxaJkuGzv2N3DE7MEpYSiYpeoQ4gaAeXjIv2SH8YrrC9oK774MNuZJcDjWPpPX7C+6br
	eW0bWdamDvMsan/ik/ZEV9wXkKqjidWObM4ASZ9VjQw==
X-Gm-Gg: AYBFou2kO9Y9AnnGCRAgab9nriDQBg3soqDWaWhO2G7GlFT+ZtkpZYTeBb68gIxhfsI
	fkVSM5z1hWHl/R3qsHbj/SSyG0g8trXSbmPNxPYXD8eCHJ6heL+0H295D1FxFq85kmneeDH1sfN
	FrEwrnN5D9vZmFWBV6aMBmioMyO0kgzX4iI25bqw8rpFEoGRhilr/pHQZrkpm6khifzHcH0Dxrn
	k5e96hQ3x9GJVe4HtIeVUZi9fVXNtPAXwrBEi1t8VlG+bavDeRvIx7lm7XgNJJha88M65lYys4f
	E6JMdHWa/x+wxiPgk8Ly753vkgNbrx8NN+veSJM+W7y/1XMK0ppSfqsUAqAlV3KLRGx2JUsd5jH
	kcTDqWZrvsC+WRb/8mlzY6+YldyxSj/wkJz5eYvAddBIimxM5NwONjs7gcvUeTNIKAQOj6WSVdE
	tO2qTwpMu8SwPBu+AtHkDeMmi0fWVoeugJJMGtn40grFqLrkQ8EZk=
X-Received: by 2002:a05:6820:824:b0:710:8db7:5f57 with SMTP id
 006d021491bc7-71ad1e56cf7mr5485687eaf.78.1794857121458; Mon, 16 Nov 2026
 11:25:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116175151.20150-1-volodymyrchapman@gmail.com> <20261116175151.20150-2-volodymyrchapman@gmail.com>
In-Reply-To: <20261116175151.20150-2-volodymyrchapman@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 16 Nov 2026 19:25:04 +0000
X-Gm-Features: Aa3M54pgj7nN4CjwbPjVmApzpaOujCHMpFVkSYjcOmN2kloaZd6DPwuVO7onqlU
Message-ID: <CAPY8ntApAUvZ5z9OkMPQfvhZJHcX6V6giY3V3N-Q0gVt0YPt7w@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: i2c: Add Sony IMX175 sensor driver
To: Volodymyr Chapman <volodymyrchapman@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, 
	Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Volodymyr

A couple of things jumped out from a very quick read through.

On Mon, 16 Nov 2026 at 17:52, Volodymyr Chapman
<volodymyrchapman@gmail.com> wrote:
>
> Add a V4L2 sub-device driver for the Sony IMX175, an 8 Mpixel raw Bayer
> image sensor with a 4-lane MIPI CSI-2 interface. It is used for example
> as the rear camera of the Lenovo ThinkPad 10 (20C1/20C3), where ACPI
> describes it as INTCF1A.
>
> The driver supports a 3280x2464 mode and a 2x2 binned 1640x1232 mode,
> both at about 30 fps, with a 19.2 MHz external clock and a 320 MHz link
> frequency on 4 data lanes (RAW10). It implements exposure, analogue and
> digital gain, vertical blanking, horizontal and vertical flip (which
> change the Bayer order), the SMIA test patterns and runtime PM.
>
> The register settings are derived from the IMX175 support in Intel's
> atomisp imx driver (drivers/staging/media/atomisp/i2c/imx/imx175.h),
> which was added in commit a49d25364dfb ("staging/atomisp: Add support for
> the Intel IPU v2") and removed in commit 3a81c7660f80 ("media: staging:
> atomisp: Remove IMX sensor support").
>
> The voice coil motor and the LM3554 flash on the ThinkPad 10 camera
> module are not supported.
>
> Tested on a Lenovo ThinkPad 10 (20C3, Atom Z3795) with atomisp, on a
> media.git next kernel with the other two patches of this series:
> - the binned mode streams; the colour bar test pattern comes out in the
>   correct colour order, and real scenes have plausible colours;
> - v4l2-compliance 1.32.0 on the sensor sub-device: 46 tests, 0 failures,
>   0 warnings;
> - horizontal and vertical flip mirror the image with correct colours
>   through atomisp, and VIDIOC_SUBDEV_G_FMT reports the same Bayer order
>   as VIDIOC_SUBDEV_ENUM_MBUS_CODE for all four flip combinations (the
>   test pattern itself is not affected by the flips);
> - the 3280x2464 mode was tested as a single still capture, as atomisp
>   limits continuous capture to 1920 pixels wide.
>
> This driver was written with the help of an AI coding assistant (Claude),
> based on the register tables mentioned above and on existing sensor
> drivers; it was tested on the hardware by the submitter.
>
> Signed-off-by: Volodymyr Chapman <volodymyrchapman@gmail.com>
> ---
>  MAINTAINERS                |   7 +
>  drivers/media/i2c/Kconfig  |  10 +
>  drivers/media/i2c/Makefile |   1 +
>  drivers/media/i2c/imx175.c | 797 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 815 insertions(+)
>  create mode 100644 drivers/media/i2c/imx175.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index af302622c..286926a01 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26061,6 +26061,13 @@ S:     Maintained
>  F:     drivers/ssb/
>  F:     include/linux/ssb/
>
> +SONY IMX175 SENSOR DRIVER
> +M:     Volodymyr Chapman <volodymyrchapman@gmail.com>
> +L:     linux-media@vger.kernel.org
> +S:     Maintained
> +T:     git git://linuxtv.org/media.git
> +F:     drivers/media/i2c/imx175.c
> +
>  SONY IMX208 SENSOR DRIVER
>  M:     Sakari Ailus <sakari.ailus@linux.intel.com>
>  L:     linux-media@vger.kernel.org
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 11c302525..8047a12e2 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -158,6 +158,16 @@ config VIDEO_IMX111
>           To compile this driver as a module, choose M here: the
>           module will be called imx111.
>
> +config VIDEO_IMX175
> +       tristate "Sony IMX175 sensor support"
> +       select V4L2_CCI_I2C
> +       help
> +         This is a Video4Linux2 sensor driver for the Sony
> +         IMX175 camera.
> +
> +         To compile this driver as a module, choose M here: the
> +         module will be called imx175.
> +
>  config VIDEO_IMX208
>         tristate "Sony IMX208 sensor support"
>         help
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index 59e31af45..af107440c 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -48,6 +48,7 @@ obj-$(CONFIG_VIDEO_HI847) += hi847.o
>  obj-$(CONFIG_VIDEO_HM1246) += hm1246.o
>  obj-$(CONFIG_VIDEO_I2C) += video-i2c.o
>  obj-$(CONFIG_VIDEO_IMX111) += imx111.o
> +obj-$(CONFIG_VIDEO_IMX175) += imx175.o
>  obj-$(CONFIG_VIDEO_IMX208) += imx208.o
>  obj-$(CONFIG_VIDEO_IMX214) += imx214.o
>  obj-$(CONFIG_VIDEO_IMX219) += imx219.o
> diff --git a/drivers/media/i2c/imx175.c b/drivers/media/i2c/imx175.c
> new file mode 100644
> index 000000000..b0b80ddeb
> --- /dev/null
> +++ b/drivers/media/i2c/imx175.c
> @@ -0,0 +1,797 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Sony IMX175 8MP raw image sensor driver
> + *
> + * Register settings derived from the Intel atomisp imx driver
> + * (drivers/staging/media/atomisp/i2c/imx/imx175.h in Linux v4.14),
> + * Copyright (c) 2010-2014 Intel Corporation.

No Copyright from you? Or are you representing Intel here, in which
case the end date should be 2026.

> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/units.h>
> +
> +#include <media/v4l2-cci.h>
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-subdev.h>
> +
> +#define IMX175_REG_MODEL_ID            CCI_REG16(0x0000)

Most of these registers are following the standard CCS register
definitions (see drivers/media/i2c/ccs/ccs-regs.h). Can you use the
standard defines rather than adding your own?

> +#define IMX175_MODEL_ID                        0x0175
> +#define IMX175_REG_MODE_SELECT         CCI_REG8(0x0100)
> +#define IMX175_MODE_STANDBY            0x00
> +#define IMX175_MODE_STREAMING          0x01
> +#define IMX175_REG_ORIENTATION         CCI_REG8(0x0101)
> +#define IMX175_HFLIP                   BIT(0)
> +#define IMX175_VFLIP                   BIT(1)
> +#define IMX175_REG_SW_RESET            CCI_REG8(0x0103)
> +#define IMX175_REG_GROUP_HOLD          CCI_REG8(0x0104)
> +#define IMX175_REG_EXPOSURE            CCI_REG16(0x0202)
> +#define IMX175_EXPOSURE_MIN            1
> +#define IMX175_EXPOSURE_MARGIN         4
> +#define IMX175_REG_ANALOG_GAIN         CCI_REG8(0x0205)
> +#define IMX175_ANA_GAIN_MIN            0
> +#define IMX175_ANA_GAIN_MAX            224     /* 256 / (256 - 224) = 8x */
> +#define IMX175_ANA_GAIN_DEFAULT                0
> +#define IMX175_REG_DGAIN_GR            CCI_REG16(0x020e)
> +#define IMX175_REG_DGAIN_R             CCI_REG16(0x0210)
> +#define IMX175_REG_DGAIN_B             CCI_REG16(0x0212)
> +#define IMX175_REG_DGAIN_GB            CCI_REG16(0x0214)
> +#define IMX175_DGAIN_MIN               0x0100
> +#define IMX175_DGAIN_MAX               0x0fff
> +#define IMX175_DGAIN_DEFAULT           0x0100
> +#define IMX175_REG_FRAME_LENGTH                CCI_REG16(0x0340)
> +#define IMX175_FLL_MAX                 0xffff
> +#define IMX175_REG_LINE_LENGTH         CCI_REG16(0x0342)
> +#define IMX175_REG_X_OUTPUT_SIZE       CCI_REG16(0x034c)
> +#define IMX175_REG_Y_OUTPUT_SIZE       CCI_REG16(0x034e)
> +#define IMX175_REG_BINNING_MODE                CCI_REG8(0x0390)
> +#define IMX175_REG_TEST_PATTERN                CCI_REG16(0x0600)
> +
> +#define IMX175_XCLK_FREQ               (19200 * HZ_PER_KHZ)
> +#define IMX175_LINK_FREQ               (320 * HZ_PER_MHZ)
> +#define IMX175_DATA_LANES              4
> +#define IMX175_BPP                     10
> +/* pixel rate = link freq * 2 (DDR) * lanes / bpp */
> +#define IMX175_PIXEL_RATE              (IMX175_LINK_FREQ * 2 * IMX175_DATA_LANES / IMX175_BPP)
> +
> +#define IMX175_NATIVE_WIDTH            3280
> +#define IMX175_NATIVE_HEIGHT           2464
> +#define IMX175_LLP                     3430
> +#define IMX175_FLL_DEFAULT             2500
> +
> +static const char * const imx175_supply_names[] = {
> +       "avdd",         /* Analog power */
> +       "dovdd",        /* Digital I/O power */
> +       "dvdd",         /* Digital core power */
> +};
> +
> +struct imx175_mode {
> +       u32 width;
> +       u32 height;
> +       bool binning;
> +       u32 fll_default;
> +};
> +
> +static const struct imx175_mode imx175_modes[] = {
> +       {
> +               .width = 3280,
> +               .height = 2464,
> +               .binning = false,
> +               .fll_default = IMX175_FLL_DEFAULT,
> +       },
> +       {
> +               .width = 1640,
> +               .height = 1232,
> +               .binning = true,
> +               .fll_default = IMX175_FLL_DEFAULT,
> +       },

This is probably another case where adding the binning mode will have
to wait until the Common Raw Sensor Model patches are merged, and then
binning (and cropping?) be implemented using that.

> +};
> +
> +/* Static settings, applied after a software reset */
> +static const struct cci_reg_sequence imx175_init_regs[] = {
> +       /* misc control */
> +       { CCI_REG8(0x3020), 0x10 },
> +       { CCI_REG8(0x302d), 0x02 },
> +       { CCI_REG8(0x302f), 0x80 },
> +       { CCI_REG8(0x3032), 0xa3 },
> +       { CCI_REG8(0x3033), 0x20 },
> +       { CCI_REG8(0x3034), 0x24 },
> +       { CCI_REG8(0x3041), 0x15 },
> +       { CCI_REG8(0x3042), 0x87 },
> +       { CCI_REG8(0x3050), 0x35 },
> +       { CCI_REG8(0x3056), 0x57 },
> +       { CCI_REG8(0x305d), 0x41 },
> +       { CCI_REG8(0x3097), 0x69 },
> +       { CCI_REG8(0x3109), 0x41 },
> +       { CCI_REG8(0x3148), 0x3f },
> +       { CCI_REG8(0x330f), 0x07 },
> +       /* CSI-2 and INCK */
> +       { CCI_REG8(0x3364), 0x00 },
> +       { CCI_REG8(0x3368), 0x13 },
> +       { CCI_REG8(0x3369), 0x33 },
> +       /* ZNR */
> +       { CCI_REG8(0x4100), 0x0e },
> +       { CCI_REG8(0x4104), 0x32 },
> +       { CCI_REG8(0x4105), 0x32 },
> +       { CCI_REG8(0x4108), 0x01 },
> +       { CCI_REG8(0x4109), 0x7c },
> +       { CCI_REG8(0x410a), 0x00 },
> +       { CCI_REG8(0x410b), 0x00 },
> +       /*
> +        * PLL for a 19.2 MHz INCK: pre_pll_clk_div 9, pll multiplier 300,
> +        * vt_pix_clk_div 5, vt_sys_clk_div 1, op_pix_clk_div 5,
> +        * op_sys_clk_div 1 -> 640 Mbps/lane, 4 lanes.
> +        */
> +       { CCI_REG8(0x0301), 0x05 },
> +       { CCI_REG8(0x0303), 0x01 },
> +       { CCI_REG8(0x0305), 0x09 },
> +       { CCI_REG8(0x0309), 0x05 },
> +       { CCI_REG8(0x030b), 0x01 },
> +       { CCI_REG16(0x030c), 0x012c },
> +       { CCI_REG8(0x030e), 0x01 },
> +       { CCI_REG16(0x0342), IMX175_LLP },
> +       /* analog crop: full 3280x2464 array */
> +       { CCI_REG16(0x0344), 0 },
> +       { CCI_REG16(0x0346), 0 },
> +       { CCI_REG16(0x0348), IMX175_NATIVE_WIDTH - 1 },
> +       { CCI_REG16(0x034a), IMX175_NATIVE_HEIGHT - 1 },
> +       /* no scaling */
> +       { CCI_REG8(0x0401), 0x00 },
> +       { CCI_REG8(0x0405), 0x10 },
> +       /* timer */
> +       { CCI_REG8(0x3344), 0x57 },
> +       { CCI_REG8(0x3345), 0x1f },
> +       /* timing */
> +       { CCI_REG8(0x3370), 0x77 },
> +       { CCI_REG8(0x3371), 0x2f },
> +       { CCI_REG8(0x3372), 0x4f },
> +       { CCI_REG8(0x3373), 0x2f },
> +       { CCI_REG8(0x3374), 0x2f },
> +       { CCI_REG8(0x3375), 0x37 },
> +       { CCI_REG8(0x3376), 0x9f },
> +       { CCI_REG8(0x3377), 0x37 },
> +       { CCI_REG8(0x33c8), 0x01 },
> +       { CCI_REG16(0x33d4), IMX175_NATIVE_WIDTH },
> +       { CCI_REG16(0x33d6), IMX175_NATIVE_HEIGHT },
> +       { CCI_REG8(0x41c0), 0x01 },
> +};
> +
> +static const s64 imx175_link_freqs[] = {
> +       IMX175_LINK_FREQ,
> +};
> +
> +static const char * const imx175_test_pattern_menu[] = {
> +       "Disabled",
> +       "Solid Colour",
> +       "Colour Bars",
> +       "Fade to Grey Colour Bars",
> +       "PN9",
> +};
> +
> +/* RGGB is the native order; flips shift the pattern */
> +static const u32 imx175_mbus_codes[] = {
> +       MEDIA_BUS_FMT_SRGGB10_1X10,     /* no flip */
> +       MEDIA_BUS_FMT_SGRBG10_1X10,     /* hflip */
> +       MEDIA_BUS_FMT_SGBRG10_1X10,     /* vflip */
> +       MEDIA_BUS_FMT_SBGGR10_1X10,     /* hflip + vflip */
> +};
> +
> +struct imx175 {
> +       struct device *dev;
> +       struct regmap *regmap;
> +       struct clk *xclk;
> +       struct gpio_desc *reset;
> +       struct regulator_bulk_data supplies[ARRAY_SIZE(imx175_supply_names)];
> +
> +       struct v4l2_subdev sd;
> +       struct media_pad pad;
> +
> +       struct v4l2_ctrl_handler ctrls;
> +       struct v4l2_ctrl *link_freq;
> +       struct v4l2_ctrl *pixel_rate;
> +       struct v4l2_ctrl *exposure;
> +       struct v4l2_ctrl *vblank;
> +       struct v4l2_ctrl *hblank;
> +       struct v4l2_ctrl *hflip;
> +       struct v4l2_ctrl *vflip;
> +
> +       const struct imx175_mode *mode;
> +};
> +
> +static inline struct imx175 *to_imx175(struct v4l2_subdev *sd)
> +{
> +       return container_of(sd, struct imx175, sd);
> +}
> +
> +static u32 imx175_mbus_code(struct imx175 *imx175)
> +{
> +       unsigned int idx = 0;
> +
> +       if (imx175->hflip && imx175->hflip->val)

Is there a path where this is called before imx175->hflip has been
initiialised? I couldn't see one by inspection.

> +               idx |= 1;
> +       if (imx175->vflip && imx175->vflip->val)
> +               idx |= 2;
> +
> +       return imx175_mbus_codes[idx];
> +}
> +
> +static void imx175_update_pad_format(struct imx175 *imx175,
> +                                    const struct imx175_mode *mode,
> +                                    struct v4l2_mbus_framefmt *fmt)
> +{
> +       fmt->width = mode->width;
> +       fmt->height = mode->height;
> +       fmt->code = imx175_mbus_code(imx175);
> +       fmt->field = V4L2_FIELD_NONE;
> +       fmt->colorspace = V4L2_COLORSPACE_RAW;
> +       fmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> +       fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +       fmt->xfer_func = V4L2_XFER_FUNC_NONE;
> +}
> +
> +static int imx175_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       struct imx175 *imx175 = container_of(ctrl->handler, struct imx175, ctrls);
> +       int ret = 0;
> +
> +       if (ctrl->id == V4L2_CID_VBLANK) {
> +               s64 max = imx175->mode->height + ctrl->val - IMX175_EXPOSURE_MARGIN;
> +
> +               ret = __v4l2_ctrl_modify_range(imx175->exposure,
> +                                              imx175->exposure->minimum, max,
> +                                              imx175->exposure->step,
> +                                              min(imx175->exposure->default_value, max));

I'd suggest you adopt the minimum as the default value, rather than
trying to retain the default from when the control was initialised.
Currently you default to the full 3280x2464 mode, and set the default
exposure to be "mode->fll_default - IMX175_EXPOSURE_MARGIN". Switch to
the binned mode and reduce the VBLANK, and you'll be in a situation
where the default value won't be in the valid range, and this call
will fail.

> +               if (ret)
> +                       return ret;
> +       }
> +
> +       /* Flips change the Bayer order, keep the active format in sync */
> +       if (ctrl->id == V4L2_CID_HFLIP || ctrl->id == V4L2_CID_VFLIP) {
> +               struct v4l2_subdev_state *state =
> +                       v4l2_subdev_get_locked_active_state(&imx175->sd);
> +
> +               v4l2_subdev_state_get_format(state, 0)->code =
> +                       imx175_mbus_code(imx175);
> +       }
> +
> +       if (!pm_runtime_get_if_in_use(imx175->dev))
> +               return 0;
> +
> +       switch (ctrl->id) {
> +       case V4L2_CID_EXPOSURE:
> +               cci_write(imx175->regmap, IMX175_REG_EXPOSURE, ctrl->val, &ret);
> +               break;
> +       case V4L2_CID_ANALOGUE_GAIN:
> +               cci_write(imx175->regmap, IMX175_REG_ANALOG_GAIN, ctrl->val, &ret);
> +               break;
> +       case V4L2_CID_DIGITAL_GAIN:
> +               cci_write(imx175->regmap, IMX175_REG_DGAIN_GR, ctrl->val, &ret);
> +               cci_write(imx175->regmap, IMX175_REG_DGAIN_R, ctrl->val, &ret);
> +               cci_write(imx175->regmap, IMX175_REG_DGAIN_B, ctrl->val, &ret);
> +               cci_write(imx175->regmap, IMX175_REG_DGAIN_GB, ctrl->val, &ret);
> +               break;
> +       case V4L2_CID_VBLANK:
> +               cci_write(imx175->regmap, IMX175_REG_FRAME_LENGTH,
> +                         imx175->mode->height + ctrl->val, &ret);
> +               break;
> +       case V4L2_CID_HFLIP:
> +       case V4L2_CID_VFLIP:

Use v4l2_ctrl_cluster for these so that updating both only results in
one call through set_ctrl. See imx290 for an example.

> +               cci_write(imx175->regmap, IMX175_REG_ORIENTATION,
> +                         (imx175->hflip->val ? IMX175_HFLIP : 0) |
> +                         (imx175->vflip->val ? IMX175_VFLIP : 0), &ret);
> +               break;
> +       case V4L2_CID_TEST_PATTERN:
> +               cci_write(imx175->regmap, IMX175_REG_TEST_PATTERN, ctrl->val, &ret);
> +               break;
> +       default:
> +               ret = -EINVAL;
> +               break;
> +       }
> +
> +       pm_runtime_put(imx175->dev);
> +       return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops imx175_ctrl_ops = {
> +       .s_ctrl = imx175_set_ctrl,
> +};
> +
> +static int imx175_init_controls(struct imx175 *imx175)
> +{
> +       const struct imx175_mode *mode = &imx175_modes[0];
> +       struct v4l2_ctrl_handler *hdl = &imx175->ctrls;
> +       struct v4l2_fwnode_device_properties props;
> +       s64 vblank_def, hblank, exposure_max;
> +       int ret;
> +
> +       ret = v4l2_fwnode_device_parse(imx175->dev, &props);
> +       if (ret)
> +               return ret;
> +
> +       v4l2_ctrl_handler_init(hdl, 12);
> +
> +       imx175->link_freq = v4l2_ctrl_new_int_menu(hdl, &imx175_ctrl_ops,
> +                                                  V4L2_CID_LINK_FREQ,
> +                                                  ARRAY_SIZE(imx175_link_freqs) - 1,
> +                                                  0, imx175_link_freqs);
> +       if (imx175->link_freq)
> +               imx175->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;

If the control is read-only, then pass NULL instead of
&imx175_ctrl_ops as the control ops. Otherwise there are some paths
where set_ctrl can be called and it'll hit your "default: ret =
-EINVAL" case.
Ditto for the other read only controls below.

> +
> +       imx175->pixel_rate = v4l2_ctrl_new_std(hdl, &imx175_ctrl_ops,
> +                                              V4L2_CID_PIXEL_RATE,
> +                                              IMX175_PIXEL_RATE, IMX175_PIXEL_RATE,
> +                                              1, IMX175_PIXEL_RATE);
> +
> +       vblank_def = mode->fll_default - mode->height;
> +       imx175->vblank = v4l2_ctrl_new_std(hdl, &imx175_ctrl_ops, V4L2_CID_VBLANK,
> +                                          IMX175_EXPOSURE_MARGIN,

The minimum VBLANK period being the same as the exposure margin feels
a little strange. It may be the case, but the two are usually
disassociated.

> +                                          IMX175_FLL_MAX - mode->height, 1,
> +                                          vblank_def);
> +
> +       hblank = IMX175_LLP - mode->width;
> +       imx175->hblank = v4l2_ctrl_new_std(hdl, &imx175_ctrl_ops, V4L2_CID_HBLANK,
> +                                          hblank, hblank, 1, hblank);
> +       if (imx175->hblank)
> +               imx175->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +       exposure_max = mode->fll_default - IMX175_EXPOSURE_MARGIN;
> +       imx175->exposure = v4l2_ctrl_new_std(hdl, &imx175_ctrl_ops,
> +                                            V4L2_CID_EXPOSURE,
> +                                            IMX175_EXPOSURE_MIN, exposure_max, 1,
> +                                            exposure_max);
> +
> +       v4l2_ctrl_new_std(hdl, &imx175_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
> +                         IMX175_ANA_GAIN_MIN, IMX175_ANA_GAIN_MAX, 1,
> +                         IMX175_ANA_GAIN_DEFAULT);
> +
> +       v4l2_ctrl_new_std(hdl, &imx175_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
> +                         IMX175_DGAIN_MIN, IMX175_DGAIN_MAX, 1,
> +                         IMX175_DGAIN_DEFAULT);
> +
> +       imx175->hflip = v4l2_ctrl_new_std(hdl, &imx175_ctrl_ops, V4L2_CID_HFLIP,
> +                                         0, 1, 1, 0);
> +       if (imx175->hflip)
> +               imx175->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> +
> +       imx175->vflip = v4l2_ctrl_new_std(hdl, &imx175_ctrl_ops, V4L2_CID_VFLIP,
> +                                         0, 1, 1, 0);
> +       if (imx175->vflip)
> +               imx175->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> +
> +       v4l2_ctrl_new_std_menu_items(hdl, &imx175_ctrl_ops, V4L2_CID_TEST_PATTERN,
> +                                    ARRAY_SIZE(imx175_test_pattern_menu) - 1,
> +                                    0, 0, imx175_test_pattern_menu);
> +
> +       v4l2_ctrl_new_fwnode_properties(hdl, &imx175_ctrl_ops, &props);
> +
> +       if (hdl->error) {
> +               ret = hdl->error;
> +               v4l2_ctrl_handler_free(hdl);
> +               return ret;
> +       }
> +
> +       imx175->sd.ctrl_handler = hdl;
> +       return 0;
> +}
> +
> +static int imx175_enable_streams(struct v4l2_subdev *sd,
> +                                struct v4l2_subdev_state *state, u32 pad,
> +                                u64 streams_mask)
> +{
> +       struct imx175 *imx175 = to_imx175(sd);
> +       const struct imx175_mode *mode = imx175->mode;
> +       int ret;
> +
> +       ret = pm_runtime_resume_and_get(imx175->dev);
> +       if (ret)
> +               return ret;
> +
> +       ret = cci_write(imx175->regmap, IMX175_REG_SW_RESET, 0x01, NULL);
> +       if (ret)
> +               goto err_put;
> +       usleep_range(5000, 6000);
> +
> +       ret = cci_multi_reg_write(imx175->regmap, imx175_init_regs,
> +                                 ARRAY_SIZE(imx175_init_regs), NULL);

The reset and imx175_init_regs could be sent from imx175_power_on. If
combined with pm_runtime_autosuspend, then switching mode becomes just
a handful of register writes.

> +       cci_write(imx175->regmap, IMX175_REG_X_OUTPUT_SIZE, mode->width, &ret);
> +       cci_write(imx175->regmap, IMX175_REG_Y_OUTPUT_SIZE, mode->height, &ret);
> +       cci_write(imx175->regmap, IMX175_REG_BINNING_MODE, mode->binning ? 1 : 0,
> +                 &ret);
> +       if (ret)
> +               goto err_put;
> +
> +       ret = __v4l2_ctrl_handler_setup(imx175->sd.ctrl_handler);
> +       if (ret)
> +               goto err_put;
> +
> +       ret = cci_write(imx175->regmap, IMX175_REG_MODE_SELECT,
> +                       IMX175_MODE_STREAMING, NULL);
> +       if (ret)
> +               goto err_put;
> +
> +       /* Flips change the Bayer order; don't allow them while streaming */
> +       __v4l2_ctrl_grab(imx175->hflip, true);
> +       __v4l2_ctrl_grab(imx175->vflip, true);
> +       return 0;
> +
> +err_put:
> +       pm_runtime_put(imx175->dev);
> +       return ret;
> +}
> +
> +static int imx175_disable_streams(struct v4l2_subdev *sd,
> +                                 struct v4l2_subdev_state *state, u32 pad,
> +                                 u64 streams_mask)
> +{
> +       struct imx175 *imx175 = to_imx175(sd);
> +       int ret;
> +
> +       ret = cci_write(imx175->regmap, IMX175_REG_MODE_SELECT,
> +                       IMX175_MODE_STANDBY, NULL);
> +
> +       __v4l2_ctrl_grab(imx175->hflip, false);
> +       __v4l2_ctrl_grab(imx175->vflip, false);
> +
> +       pm_runtime_put(imx175->dev);
> +       return ret;
> +}
> +
> +static int imx175_set_format(struct v4l2_subdev *sd,
> +                            const struct v4l2_subdev_client_info *ci,
> +                            struct v4l2_subdev_state *state,
> +                            struct v4l2_subdev_format *fmt)
> +{
> +       struct imx175 *imx175 = to_imx175(sd);
> +       const struct imx175_mode *mode;
> +       struct v4l2_mbus_framefmt *format;
> +       int ret;
> +
> +       mode = v4l2_find_nearest_size(imx175_modes, ARRAY_SIZE(imx175_modes),
> +                                     width, height,
> +                                     fmt->format.width, fmt->format.height);
> +
> +       imx175_update_pad_format(imx175, mode, &fmt->format);
> +       format = v4l2_subdev_state_get_format(state, 0);
> +       *format = fmt->format;
> +
> +       if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> +               return 0;
> +
> +       imx175->mode = mode;
> +
> +       ret = __v4l2_ctrl_modify_range(imx175->vblank, IMX175_EXPOSURE_MARGIN,
> +                                      IMX175_FLL_MAX - mode->height, 1,
> +                                      mode->fll_default - mode->height);
> +       if (ret)
> +               return ret;
> +       ret = __v4l2_ctrl_s_ctrl(imx175->vblank, mode->fll_default - mode->height);
> +       if (ret)
> +               return ret;
> +
> +       return __v4l2_ctrl_modify_range(imx175->hblank,
> +                                        IMX175_LLP - mode->width,
> +                                        IMX175_LLP - mode->width, 1,
> +                                        IMX175_LLP - mode->width);
> +}
> +
> +static int imx175_enum_mbus_code(struct v4l2_subdev *sd,
> +                                struct v4l2_subdev_state *state,
> +                                struct v4l2_subdev_mbus_code_enum *code)
> +{
> +       if (code->index > 0)
> +               return -EINVAL;
> +
> +       code->code = imx175_mbus_code(to_imx175(sd));
> +       return 0;
> +}
> +
> +static int imx175_enum_frame_size(struct v4l2_subdev *sd,
> +                                 struct v4l2_subdev_state *state,
> +                                 struct v4l2_subdev_frame_size_enum *fse)
> +{
> +       if (fse->index >= ARRAY_SIZE(imx175_modes))
> +               return -EINVAL;
> +
> +       if (fse->code != imx175_mbus_code(to_imx175(sd)))
> +               return -EINVAL;
> +
> +       fse->min_width = imx175_modes[fse->index].width;
> +       fse->max_width = fse->min_width;
> +       fse->min_height = imx175_modes[fse->index].height;
> +       fse->max_height = fse->min_height;
> +       return 0;
> +}
> +
> +static int imx175_get_selection(struct v4l2_subdev *sd,
> +                               const struct v4l2_subdev_client_info *ci,
> +                               struct v4l2_subdev_state *state,
> +                               struct v4l2_subdev_selection *sel)
> +{
> +       switch (sel->target) {
> +       case V4L2_SEL_TGT_CROP:
> +       case V4L2_SEL_TGT_CROP_DEFAULT:
> +       case V4L2_SEL_TGT_CROP_BOUNDS:
> +       case V4L2_SEL_TGT_NATIVE_SIZE:
> +               sel->r.left = 0;
> +               sel->r.top = 0;
> +               sel->r.width = IMX175_NATIVE_WIDTH;
> +               sel->r.height = IMX175_NATIVE_HEIGHT;
> +               return 0;
> +       }
> +
> +       return -EINVAL;
> +}
> +
> +static int imx175_init_state(struct v4l2_subdev *sd,
> +                            struct v4l2_subdev_state *state)
> +{
> +       struct v4l2_subdev_format fmt = {
> +               .which = V4L2_SUBDEV_FORMAT_TRY,
> +               .pad = 0,
> +               .format = {
> +                       .width = imx175_modes[0].width,
> +                       .height = imx175_modes[0].height,
> +               },
> +       };
> +
> +       return imx175_set_format(sd, NULL, state, &fmt);
> +}
> +
> +static const struct v4l2_subdev_video_ops imx175_video_ops = {
> +       .s_stream = v4l2_subdev_s_stream_helper,
> +};
> +
> +static const struct v4l2_subdev_pad_ops imx175_pad_ops = {
> +       .enum_mbus_code = imx175_enum_mbus_code,
> +       .enum_frame_size = imx175_enum_frame_size,
> +       .get_fmt = v4l2_subdev_get_fmt,
> +       .set_fmt = imx175_set_format,
> +       .get_selection = imx175_get_selection,
> +       .enable_streams = imx175_enable_streams,
> +       .disable_streams = imx175_disable_streams,
> +};
> +
> +static const struct v4l2_subdev_ops imx175_subdev_ops = {
> +       .video = &imx175_video_ops,
> +       .pad = &imx175_pad_ops,
> +};
> +
> +static const struct v4l2_subdev_internal_ops imx175_internal_ops = {
> +       .init_state = imx175_init_state,
> +};
> +
> +static int imx175_power_on(struct device *dev)
> +{
> +       struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +       struct imx175 *imx175 = to_imx175(sd);
> +       int ret;
> +
> +       ret = regulator_bulk_enable(ARRAY_SIZE(imx175->supplies),
> +                                   imx175->supplies);
> +       if (ret)
> +               return ret;
> +
> +       ret = clk_prepare_enable(imx175->xclk);
> +       if (ret) {
> +               regulator_bulk_disable(ARRAY_SIZE(imx175->supplies),
> +                                      imx175->supplies);
> +               return ret;
> +       }
> +
> +       usleep_range(1000, 2000);
> +       gpiod_set_value_cansleep(imx175->reset, 0);
> +       /* Wait for the sensor to come out of reset before using I2C */
> +       usleep_range(10000, 12000);
> +
> +       return 0;
> +}
> +
> +static int imx175_power_off(struct device *dev)
> +{
> +       struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +       struct imx175 *imx175 = to_imx175(sd);
> +
> +       gpiod_set_value_cansleep(imx175->reset, 1);
> +       clk_disable_unprepare(imx175->xclk);
> +       regulator_bulk_disable(ARRAY_SIZE(imx175->supplies), imx175->supplies);
> +
> +       return 0;
> +}
> +
> +static int imx175_identify(struct imx175 *imx175)
> +{
> +       u64 id;
> +       int ret;
> +
> +       ret = cci_read(imx175->regmap, IMX175_REG_MODEL_ID, &id, NULL);
> +       if (ret)
> +               return dev_err_probe(imx175->dev, ret, "failed to read model id\n");
> +
> +       if (id != IMX175_MODEL_ID)
> +               return dev_err_probe(imx175->dev, -ENODEV,
> +                                    "unexpected model id 0x%04llx\n", id);
> +
> +       return 0;
> +}
> +
> +static int imx175_check_hwcfg(struct imx175 *imx175)
> +{
> +       struct v4l2_fwnode_endpoint bus_cfg = {
> +               .bus_type = V4L2_MBUS_CSI2_DPHY,
> +       };
> +       struct fwnode_handle *ep;
> +       unsigned long link_freq_bitmap;
> +       int ret;
> +
> +       /* The endpoint is created by ipu-bridge on ACPI systems */
> +       ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(imx175->dev), 0, 0, 0);
> +       if (!ep)
> +               return dev_err_probe(imx175->dev, -EPROBE_DEFER,
> +                                    "waiting for fwnode graph endpoint\n");
> +
> +       ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +       fwnode_handle_put(ep);
> +       if (ret)
> +               return dev_err_probe(imx175->dev, ret, "parsing endpoint\n");
> +
> +       if (bus_cfg.bus.mipi_csi2.num_data_lanes != IMX175_DATA_LANES) {
> +               ret = dev_err_probe(imx175->dev, -EINVAL,
> +                                   "%u data lanes not supported\n",
> +                                   bus_cfg.bus.mipi_csi2.num_data_lanes);
> +               goto out;
> +       }
> +
> +       ret = v4l2_link_freq_to_bitmap(imx175->dev, bus_cfg.link_frequencies,
> +                                      bus_cfg.nr_of_link_frequencies,
> +                                      imx175_link_freqs,
> +                                      ARRAY_SIZE(imx175_link_freqs),
> +                                      &link_freq_bitmap);
> +out:
> +       v4l2_fwnode_endpoint_free(&bus_cfg);
> +       return ret;
> +}
> +
> +static int imx175_probe(struct i2c_client *client)
> +{
> +       struct device *dev = &client->dev;
> +       struct imx175 *imx175;
> +       unsigned long rate;
> +       unsigned int i;
> +       int ret;
> +
> +       imx175 = devm_kzalloc(dev, sizeof(*imx175), GFP_KERNEL);
> +       if (!imx175)
> +               return -ENOMEM;
> +
> +       imx175->dev = dev;
> +       imx175->mode = &imx175_modes[0];
> +
> +       ret = imx175_check_hwcfg(imx175);
> +       if (ret)
> +               return ret;
> +
> +       imx175->regmap = devm_cci_regmap_init_i2c(client, 16);
> +       if (IS_ERR(imx175->regmap))
> +               return PTR_ERR(imx175->regmap);
> +
> +       imx175->xclk = devm_v4l2_sensor_clk_get(dev, NULL);
> +       if (IS_ERR(imx175->xclk))
> +               return dev_err_probe(dev, PTR_ERR(imx175->xclk),
> +                                    "failed to get xclk\n");
> +
> +       rate = clk_get_rate(imx175->xclk);
> +       if (rate != IMX175_XCLK_FREQ)
> +               return dev_err_probe(dev, -EINVAL,
> +                                    "unsupported xclk rate %lu Hz\n", rate);
> +
> +       imx175->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> +       if (IS_ERR(imx175->reset))
> +               return dev_err_probe(dev, PTR_ERR(imx175->reset),
> +                                    "failed to get reset gpio\n");
> +
> +       for (i = 0; i < ARRAY_SIZE(imx175_supply_names); i++)
> +               imx175->supplies[i].supply = imx175_supply_names[i];
> +
> +       ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(imx175->supplies),
> +                                     imx175->supplies);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to get regulators\n");
> +
> +       v4l2_i2c_subdev_init(&imx175->sd, client, &imx175_subdev_ops);
> +       imx175->sd.internal_ops = &imx175_internal_ops;
> +
> +       ret = imx175_power_on(dev);
> +       if (ret)
> +               return ret;
> +
> +       ret = imx175_identify(imx175);
> +       if (ret)
> +               goto err_power_off;
> +
> +       ret = imx175_init_controls(imx175);
> +       if (ret)
> +               goto err_power_off;
> +
> +       imx175->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +       imx175->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +       imx175->pad.flags = MEDIA_PAD_FL_SOURCE;
> +
> +       ret = media_entity_pads_init(&imx175->sd.entity, 1, &imx175->pad);
> +       if (ret)
> +               goto err_free_ctrls;
> +
> +       imx175->sd.state_lock = imx175->ctrls.lock;
> +       ret = v4l2_subdev_init_finalize(&imx175->sd);
> +       if (ret)
> +               goto err_entity_cleanup;
> +
> +       pm_runtime_set_active(dev);
> +       pm_runtime_enable(dev);

Use pm_runtime_autosuspend? It saves a little bit of time when
switching modes on the sensor.

> +
> +       ret = v4l2_async_register_subdev_sensor(&imx175->sd);
> +       if (ret)
> +               goto err_pm;
> +
> +       pm_runtime_idle(dev);
> +       return 0;
> +
> +err_pm:
> +       pm_runtime_disable(dev);
> +       pm_runtime_set_suspended(dev);
> +       v4l2_subdev_cleanup(&imx175->sd);
> +err_entity_cleanup:
> +       media_entity_cleanup(&imx175->sd.entity);
> +err_free_ctrls:
> +       v4l2_ctrl_handler_free(&imx175->ctrls);
> +err_power_off:
> +       imx175_power_off(dev);
> +       return ret;
> +}
> +
> +static void imx175_remove(struct i2c_client *client)
> +{
> +       struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +       struct imx175 *imx175 = to_imx175(sd);
> +
> +       v4l2_async_unregister_subdev(sd);
> +       v4l2_subdev_cleanup(sd);
> +       media_entity_cleanup(&sd->entity);
> +       v4l2_ctrl_handler_free(&imx175->ctrls);
> +
> +       pm_runtime_disable(&client->dev);
> +       if (!pm_runtime_status_suspended(&client->dev))
> +               imx175_power_off(&client->dev);
> +       pm_runtime_set_suspended(&client->dev);
> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(imx175_pm_ops, imx175_power_off,
> +                                imx175_power_on, NULL);
> +
> +static const struct acpi_device_id imx175_acpi_ids[] = {
> +       { "INTCF1A" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(acpi, imx175_acpi_ids);
> +
> +static struct i2c_driver imx175_i2c_driver = {
> +       .driver = {
> +               .name = "imx175",
> +               .acpi_match_table = imx175_acpi_ids,
> +               .pm = pm_ptr(&imx175_pm_ops),
> +       },
> +       .probe = imx175_probe,
> +       .remove = imx175_remove,
> +};
> +module_i2c_driver(imx175_i2c_driver);
> +
> +MODULE_DESCRIPTION("Sony IMX175 sensor driver");
> +MODULE_LICENSE("GPL");

MODULE_AUTHOR?

Hope that's helpful.
  Dave

> --
> 2.43.0
>
>
