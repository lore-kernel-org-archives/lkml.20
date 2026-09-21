Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5864848986E;
	Mon, 21 Sep 2026 16:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790008109; cv=none; b=t/ypRta+/jdY4Zy2oTZTXjndXAi2+29JfIs4AsqkxxcLFhwq/f8INC+sqNhMDG3fwGfUT88cIAuDeKCzfGwRzr/XMKdC+uG5AkLGnqRHMJM7962+S5FTG5hHc7u6m5WkLo9uVe22NO+sOqnj6OXLd3+cabEj8I4s+cOtLwOXEMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790008109; c=relaxed/simple;
	bh=0P31LfzF2eAOsutpMs79/InR1adPCdxmEifQi4XLeFc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=aFa/XuUFtb8QeI7q+zzcRw0Q++DxeEPR/CqSAiGGW/62MZFr/rleJl0Qm6AIfYH69MT+SC5KWNm9IesWBxO0VR0BbTSW0GnIIxxAHAMcE3Fnja+QMTwyvEV5OdbFV+kLiul/TuCpLZ8DqvGD5FZuHhHvQ1M7imCL2ftG7AMVlkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=k9RlmwQ2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="k9RlmwQ2"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:85de:a3c9:9357:b164:bf0b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74056104C;
	Mon, 21 Sep 2026 18:26:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790007997;
	bh=0P31LfzF2eAOsutpMs79/InR1adPCdxmEifQi4XLeFc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=k9RlmwQ2zqK9HCJe65i8eRhnTNU+NN1xLXa1v2eX7wtMcWaCTCqDUJhT0l4jh2DSH
	 eqGyMC1tRj2oRd7tY/yRgIzhoEVssgwapUFY80XTfOquQzLevYNlCWTmKtqC/BaOD7
	 smAlgCZGHqCBp0mYpav4Es09WF2soAn7YRmZ4JqQ=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260828064843.65047-3-lachlan.michael@sony.com>
References: <20260828064843.65047-1-lachlan.michael@sony.com> <20260828064843.65047-3-lachlan.michael@sony.com>
Subject: Re: [PATCH v3 2/2] media: i2c: Add Sony IMX908 image sensor driver
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, kieran.bingham@ideasonboard.com, Ryuichi.Tadano@sony.com, Kengo.Hayasaka@sony.com, Tim.Bird@sony.com, Kazumi.A.Sato@sony.com, Yuji.John.Takahashi@sony.com, linux-kernel@vger.kernel.org, Lachlan Michael <lachlan.michael@sony.com>
To: Lachlan Michael <lachlan.michael@sony.com>, devicetree@vger.kernel.org, hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com
Date: Mon, 21 Sep 2026 21:58:16 +0530
Message-ID: <179000809637.3701737.17026819145311474886@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Lachlan,

Thank you for your patch.

And thanks for fixing my comments from v2. I have a few more, some I missed
the last time around, but some are new.

Quoting Lachlan Michael (2026-08-28 12:18:43)
> The Sony IMX908 is an 8.39 megapixel (3856x2176) CMOS image sensor
> with a MIPI CSI-2 output interface, configurable as either 2 or 4
> data lanes.
>=20
> Add a V4L2 sub-device driver for the sensor. The driver supports
> RAW10 and RAW12 output formats, exposure and analogue gain controls,
> horizontal and vertical flipping, horizontal and vertical blanking
> controls, window cropping and test pattern generation.
>=20
> HDR modes and RAW16 output are not currently supported.
>=20
> Signed-off-by: Lachlan Michael <lachlan.michael@sony.com>
> ---
> Changes in v3:
> - Correct link-frequency indexing mapping to match the sensor
>   DATARATE_SEL values and the frequency ordering
> - Changed the pixel_rate to 16-pixel-per-clocks based on datasheet
>   mode values
> - Clean up the constant names, register definitions and comments in
>   response to review feedback.
> - Remove various (uneeded) checks in code based on feedback
> - Remove cached vmax/hmax and recalculated where necessary
> - Drop pixel_rate and test_pattern pointers from struct
> - Remove read-only controls set_ctrl switch
> - Remove event handlers
> - Remove uneeded delays at startup=20
> - Simplify runtime_resume/suspend functions
> - Remove the 4k recording-area in favour of larger active area
> - Use the same constraints for VMAX for crop and all pixel mode to
>   simplify the driver logic by removing branching
> - Rework HMAX based on the fact that the whole line is always read
>   even in crop mode. HMAX varies in all modes now, but not with=20
>   horizontal crop.
> - Minor edits and bugfixes=20
> ---
>  MAINTAINERS                |    1 +
>  drivers/media/i2c/Kconfig  |   11 +
>  drivers/media/i2c/Makefile |    1 +
>  drivers/media/i2c/imx908.c | 1367 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 1380 insertions(+)
>  create mode 100644 drivers/media/i2c/imx908.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bb7adcfd4767..a17c31234ec7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25542,6 +25542,7 @@ SONY IMX908 SENSOR DRIVER
>  M:     Lachlan Michael <lachlan.michael@sony.com>
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
> +F:     drivers/media/i2c/imx908.c
> =20
>  SONY MEMORYSTICK SUBSYSTEM
>  M:     Maxim Levitsky <maximlevitsky@gmail.com>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 5c52007f9cbe..cfa1359d8c7d 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -310,6 +310,17 @@ config VIDEO_IMX678
>           To compile this driver as a module, choose M here: the
>           module will be called imx678.
> =20
> +config VIDEO_IMX908
> +        tristate "Sony IMX908 sensor support"
> +        depends on GPIOLIB
> +        select V4L2_CCI_I2C
> +        help
> +          This is a Video4Linux2 sensor driver for the Sony
> +          IMX908 CMOS image sensor.
> +
> +          To compile this driver as a module, choose M here: the
> +          module will be called imx908.
> +
>  config VIDEO_MAX9271_LIB
>         tristate
> =20
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index d04bd5724552..d91ed1bc6427 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -63,6 +63,7 @@ obj-$(CONFIG_VIDEO_IMX412) +=3D imx412.o
>  obj-$(CONFIG_VIDEO_IMX415) +=3D imx415.o
>  obj-$(CONFIG_VIDEO_IMX678) +=3D imx678.o
>  obj-$(CONFIG_VIDEO_IMX471) +=3D imx471.o
> +obj-$(CONFIG_VIDEO_IMX908) +=3D imx908.o
>  obj-$(CONFIG_VIDEO_IR_I2C) +=3D ir-kbd-i2c.o
>  obj-$(CONFIG_VIDEO_ISL7998X) +=3D isl7998x.o
>  obj-$(CONFIG_VIDEO_KS0127) +=3D ks0127.o
> diff --git a/drivers/media/i2c/imx908.c b/drivers/media/i2c/imx908.c
> new file mode 100644
> index 000000000000..ca85a5cd058a
> --- /dev/null
> +++ b/drivers/media/i2c/imx908.c
> @@ -0,0 +1,1367 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * V4L2 driver for Sony IMX908
> + *
> + * Diagonal 6.42 mm (Type 1/2.8) CMOS image sensor with 8.39 M pixels.
> + *
> + * Copyright 2026 Sony Semiconductor Solutions Corporation
> + *
> + */
> +
> +#include <linux/align.h>
> +#include <linux/array_size.h>
> +#include <linux/bitops.h>
> +#include <linux/clk.h>
> +#include <linux/container_of.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/math.h>                /* DIV_ROUND_UP */
> +#include <linux/math64.h>      /* DIV64_U64_ROUND_UP */
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
> +#define IMX908_REG_STANDBY     CCI_REG8(0x3000)
> +#define IMX908_STANDBY_EN      BIT(0)          /* Standby mode */
> +#define IMX908_STANDBY_CANCEL  0x00            /* Operating mode */
> +#define IMX908_REG_XMSTA       CCI_REG8(0x3002)        /* [0] Init 1h */
> +#define IMX908_XMSTA_START     0x00
> +#define IMX908_XMSTA_STOP      0x01
> +#define IMX908_REG_XMASTER     CCI_REG8(0x3003)        /* [0] Init 0h */
> +#define IMX908_CONTROLLER_MODE 0x00
> +#define IMX908_REG_INCK_SEL    CCI_REG8(0x3014)        /* 0:74.25 1:37.1=
25 2:72 3:27 4:24 */
> +#define IMX908_REG_DATARATE_SEL        CCI_REG8(0x3015)
> +
> +/* ---- Crop */
> +#define IMX908_REG_WINMODE     CCI_REG8(0x3018)        /* [3:0] */
> +#define IMX908_WINMODE_ALLPIX  0x00    /* All-pixel readout mode */
> +#define IMX908_WINMODE_CROP    0x04    /* Window cropping mode */
> +
> +/* ---- Flip */
> +#define IMX908_REG_HREVERSE    CCI_REG8(0x3020)
> +#define IMX908_HREVERSE_NORMAL 0x00
> +#define IMX908_HREVERSE_INV    0x01
> +#define IMX908_REG_VREVERSE    CCI_REG8(0x3021)
> +#define IMX908_VREVERSE_NORMAL 0x00
> +#define IMX908_VREVERSE_INV    0x01
> +
> +/* ---- Internal Analog to Digital conversion bit width */
> +#define IMX908_REG_ADBIT       CCI_REG8(0x3022)
> +#define IMX908_ADBIT_10BIT     0x00    /* 10-bit */
> +#define IMX908_ADBIT_12BIT     0x01    /* 11-bit + digital dither */
> +
> +#define IMX908_REG_MDBIT       CCI_REG8(0x3023)
> +#define IMX908_MDBIT_RAW10     0x00
> +#define IMX908_MDBIT_RAW12     0x01
> +
> +/* ---- VMAX  Frame length in lines */
> +#define IMX908_REG_VMAX                CCI_REG24_LE(0x3028)    /* [19:0]=
 */
> +#define IMX908_VMAX_MAX                0xfffff
> +#define IMX908_VMAX_DEFAULT    2250
> +/*
> + * VMAX restrictions, documented for window cropping mode:
> + * VMAX >=3D PIX_VWIDTH + 70
> + * VMAX >=3D 1206
> + */
> +#define IMX908_VMAX_MARGIN     70
> +#define IMX908_VMAX_MIN                1206
> +
> +/* ---- HMAX Line length in clocks */
> +#define IMX908_REG_HMAX                CCI_REG16_LE(0x302c)    /* [15:0]=
 */
> +#define IMX908_HMAX_MAX                0xffff
> +#define IMX908_HMAX_DEFAULT    1100
> +
> +/* ---- Cropping related */
> +#define IMX908_REG_PIX_HST     CCI_REG16_LE(0x303c)    /* [12:0] Init 0h=
 */
> +#define IMX908_REG_PIX_HWIDTH  CCI_REG16_LE(0x303e)    /* [12:0] Init 0F=
10h */
> +#define IMX908_REG_LANEMODE    CCI_REG8(0x3040)
> +#define IMX908_LANEMODE_2LANE  0x01
> +#define IMX908_LANEMODE_4LANE  0x03
> +#define IMX908_REG_PIX_VST     CCI_REG16_LE(0x3044)    /* [12:0] Init 0h=
 */
> +#define IMX908_REG_PIX_VWIDTH  CCI_REG16_LE(0x3046)    /* [12:0] Init 08=
84h */
> +#define IMX908_CROP_ALIGN_VSTART       4
> +#define IMX908_CROP_ALIGN_VWIDTH       4
> +#define IMX908_CROP_ALIGN_HSTART       4
> +#define IMX908_CROP_ALIGN_HWIDTH       16
> +#define IMX908_CROP_MIN_HEIGHT         1136
> +#define IMX908_CROP_MIN_WIDTH          1040
> +
> +/* ---- Shutter */
> +#define IMX908_REG_SHR0                CCI_REG24_LE(0x3050)    /* [19:0]=
 */
> +#define IMX908_MIN_SHR0                7
> +
> +/*
> + * Analogue gain control
> + * Range is from 0 to 100 (0dB - 30dB) with 0.3dB step size
> + * Values from 101 to 240 are valid but correspond to additional digital=
 gain
> + * (0.3dB - 42dB) so don't expose it to userspace
> + */
> +#define IMX908_REG_GAIN                CCI_REG16_LE(0x3070)    /* [10:0]=
 */
> +#define IMX908_ANA_GAIN_MAX    100
> +#define IMX908_ANA_GAIN_MIN    0
> +#define IMX908_ANA_GAIN_STEP   1
> +#define IMX908_ANA_GAIN_DEFAULT        0
> +
> +/* ---- XVS/XHS output mode */
> +#define IMX908_XXS_DRV         CCI_REG8(0x30a6)        /* [1:0] XVS_DRV =
[3:2] XHS_DRV */
> +
> +#define IMX908_REG_BLKLEVEL    CCI_REG16_LE(0x30dc)    /* [15:0] black l=
evel */
> +
> +/* ---- Test Pattern Generator (TPG) registers */
> +#define IMX908_REG_TPG_EN      CCI_REG8(0x30e0)
> +#define IMX908_TPG_EN_BIT      BIT(0)
> +#define IMX908_REG_TPG_PATSEL  CCI_REG8(0x30e2)        /* [4:0] pattern =
idx */
> +#define IMX908_REG_TESTCLKEN   CCI_REG8(0x4900)
> +#define IMX908_TESTCLKEN_BIT   BIT(3)
> +
> +#define IMX908_REG_TYPE_ID     CCI_REG16_LE(0x4c0c)
> +#define IMX908_CHIP_ID         0x038c
> +
> +/* ---- IMX908 Common Register List ---- */
> +static const struct cci_reg_sequence imx908_common_regs[] =3D {
> +       { IMX908_XXS_DRV, IMX908_CONTROLLER_MODE },
> +       { CCI_REG8(0x039c), 0x03 },
> +       { CCI_REG8(0x3416), 0x20 },
> +       { CCI_REG8(0x3417), 0x00 },
> +       { CCI_REG8(0x3456), 0xf4 },
> +       { CCI_REG8(0x345d), 0x01 },
> +       { CCI_REG8(0x3460), 0x00 },
> +       { CCI_REG8(0x3461), 0x0b },
> +       { CCI_REG8(0x3471), 0x00 },
> +       { CCI_REG8(0x3472), 0x23 },
> +       { CCI_REG8(0x347b), 0x02 },
> +       { CCI_REG8(0x3481), 0x01 },
> +       { CCI_REG8(0x380c), 0x00 },
> +       { CCI_REG8(0x380f), 0x0c },
> +       { CCI_REG8(0x381c), 0x11 },
> +       { CCI_REG8(0x3820), 0x22 },
> +       { CCI_REG8(0x3824), 0x33 },
> +       { CCI_REG8(0x3828), 0x22 },
> +       { CCI_REG8(0x382c), 0x33 },
> +       { CCI_REG8(0x3830), 0x33 },
> +       { CCI_REG8(0x3838), 0x05 },
> +       { CCI_REG8(0x383c), 0x07 },
> +       { CCI_REG8(0x3840), 0x06 },
> +       { CCI_REG8(0x3848), 0x17 },
> +       { CCI_REG8(0x384c), 0x0b },
> +       { CCI_REG8(0x3850), 0x10 },
> +       { CCI_REG8(0x3854), 0x12 },
> +       { CCI_REG8(0x385c), 0x20 },
> +       { CCI_REG8(0x38c4), 0x64 },
> +       { CCI_REG8(0x38c5), 0x64 },
> +       { CCI_REG8(0x38c6), 0x64 },
> +       { CCI_REG8(0x3c4a), 0x15 },
> +       { CCI_REG8(0x3c4c), 0x13 },
> +       { CCI_REG8(0x3c4d), 0x13 },
> +       { CCI_REG8(0x3c4e), 0x13 },
> +       { CCI_REG8(0x3c50), 0x77 },
> +       { CCI_REG8(0x3c51), 0x07 },
> +       { CCI_REG8(0x3db4), 0x00 },
> +       { CCI_REG8(0x4419), 0x06 },
> +       { CCI_REG8(0x441c), 0x00 },
> +       { CCI_REG8(0x4426), 0x00 },
> +       { CCI_REG8(0x4538), 0x20 },
> +       { CCI_REG8(0x4539), 0x19 },
> +       { CCI_REG8(0x453a), 0x19 },
> +       { CCI_REG8(0x453b), 0x19 },
> +       { CCI_REG8(0x453c), 0x19 },
> +       { CCI_REG8(0x453d), 0x19 },
> +       { CCI_REG8(0x453e), 0x19 },
> +       { CCI_REG8(0x453f), 0x19 },
> +       { CCI_REG8(0x4540), 0x19 },
> +       { CCI_REG8(0x4544), 0x11 },
> +       { CCI_REG8(0x4545), 0x11 },
> +       { CCI_REG8(0x4546), 0x11 },
> +       { CCI_REG8(0x463c), 0x20 },
> +       { CCI_REG8(0x465e), 0xcf },
> +       { CCI_REG8(0x4684), 0x20 },
> +       { CCI_REG8(0x46a6), 0xcf },
> +       { CCI_REG8(0x46e2), 0xf3 },
> +};
> +
> +static const u32 imx908_bit_depth_regs[] =3D {
> +       CCI_REG8(0x3d78),
> +       CCI_REG8(0x3d79),
> +       CCI_REG8(0x3d80),
> +       CCI_REG8(0x3d81),
> +       CCI_REG8(0x3d88),
> +       CCI_REG8(0x3d89),
> +       CCI_REG8(0x3d90),
> +       CCI_REG8(0x3d91),
> +};
> +
> +#define IMX908_EXPOSURE_MIN    1
> +#define IMX908_EXPOSURE_STEP   1
> +
> +/* ---- Internal image-data interface clock */
> +#define IMX908_VTPXCK_HZ       74250000ULL
> +
> +/* Fixed pixel rate: 16 pixels per video timing pixel clock cycle */
> +#define IMX908_PIX_PER_CLK     16
> +#define IMX908_PIXEL_RATE      (IMX908_VTPXCK_HZ * IMX908_PIX_PER_CLK)
> +
> +/* ---- Subdev Pads */
> +#define IMX908_SOURCE_PAD      0
> +
> +#define IMX908_DEFAULT_MBUS_CODE MEDIA_BUS_FMT_SRGGB10_1X10
> +
> +/*
> + * IMX908 total area includes active area height plus
> + *  4 pixels effective pixel ignored area
> + * 10 pixels vertical direction effective OB
> + * 10 pixels OB side ignored area
> + */
> +static const struct v4l2_rect imx908_total_area =3D {
> +       .top =3D 0,
> +       .left =3D 0,
> +       .width =3D 3856,
> +       .height =3D 2200,
> +};
> +

The "Pixel Arrangement" section in the datasheet for IMX678 (Starvis 2,
same resolution) mentioned a horizontal margin of 8 and 9, and vertical
margin of 10 + 10 + 4 + 8 and 9, thus the total came out to be 3857x2201

Which also explained why the CFA readout stays R->G->G->B irrespective of
VFLIP and HFLIP, the extra pixel allowed shifting the readout start.

> +static const struct v4l2_rect imx908_active_area =3D {
> +       .top =3D 0,
> +       .left =3D 0,
> +       .width =3D 3856,
> +       .height =3D 2176,

Shouldn't this have .top =3D 24 (10 + 10 + 4)?

At least on IMX678, while the diagram shows the OB area at bottom, that's
where the scan starts from (N12 pin) when HREVERSE/VREVERSE are 0.

It would be good to confirm if IMX908 is indeed different in its behaviour
from Starvis2 sensors.

> +};
> +
> +static const char *const imx908_supply_names[] =3D {
> +       "avdd",  /* Analog (3.3V) supply */
> +       "dvdd",  /* Digital Core (1.1V) supply */
> +       "ovdd",  /* IF (1.8V) supply */
> +};
> +
> +static const u32 imx908_mbus_codes[] =3D {
> +       MEDIA_BUS_FMT_SRGGB10_1X10, /* RAW10 */
> +       MEDIA_BUS_FMT_SRGGB12_1X12, /* RAW12 */
> +};
> +
> +/*
> + * Link frequency indices, ordered so that the index is also the
> + * DATARATE_SEL register value. Keep in descending frequency order.
> + */
> +enum {
> +       IMX908_LINK_FREQ_1188MHZ =3D 0x00,
> +       IMX908_LINK_FREQ_1039MHZ =3D 0x01,
> +       IMX908_LINK_FREQ_891MHZ  =3D 0x02,
> +       IMX908_LINK_FREQ_720MHZ  =3D 0x03,
> +       IMX908_LINK_FREQ_594MHZ  =3D 0x04,
> +       IMX908_LINK_FREQ_445MHZ  =3D 0x05,
> +       IMX908_LINK_FREQ_360MHZ  =3D 0x06,
> +       IMX908_LINK_FREQ_297MHZ  =3D 0x07,
> +};
> +
> +static const s64 imx908_link_freqs[] =3D {
> +       [IMX908_LINK_FREQ_1188MHZ] =3D 1188000000LL,
> +       [IMX908_LINK_FREQ_1039MHZ] =3D 1039500000LL,
> +       [IMX908_LINK_FREQ_891MHZ]  =3D  891000000LL,
> +       [IMX908_LINK_FREQ_720MHZ]  =3D  720000000LL,
> +       [IMX908_LINK_FREQ_594MHZ]  =3D  594000000LL,
> +       [IMX908_LINK_FREQ_445MHZ]  =3D  445500000LL,
> +       [IMX908_LINK_FREQ_360MHZ]  =3D  360000000LL,
> +       [IMX908_LINK_FREQ_297MHZ]  =3D  297000000LL,
> +};
> +
> +/* Allowed clock values in Hz */
> +static const u32 imx908_inck_table[] =3D {
> +       74250000,
> +       37125000,
> +       72000000,
> +       27000000,
> +       24000000,
> +};
> +
> +struct imx908 {
> +       struct v4l2_subdev sd;
> +       struct media_pad pad;
> +       struct device *dev;
> +
> +       struct regmap *cci;
> +
> +       struct clk *xclk;
> +       struct gpio_desc *reset_gpio;
> +       struct regulator_bulk_data supplies[ARRAY_SIZE(imx908_supply_name=
s)];
> +
> +       u8 inck_sel;
> +
> +       u8 num_lanes;
> +       unsigned long link_freq_bitmap;
> +       unsigned int link_freq_idx;
> +
> +       struct {
> +               struct v4l2_ctrl_handler handler;
> +
> +               struct v4l2_ctrl *exposure;
> +               struct v4l2_ctrl *vblank;
> +               struct v4l2_ctrl *hblank;
> +       } ctrls;
> +};
> +
> +static inline struct imx908 *to_imx908(struct v4l2_subdev *_sd)
> +{
> +       return container_of(_sd, struct imx908, sd);
> +}
> +
> +/* ----------------------- Basic Helper Functions ----------------------=
----- */
> +static bool imx908_mbus_code_supported(struct imx908 *imx, u32 code)
> +{
> +       for (unsigned int i =3D 0; i < ARRAY_SIZE(imx908_mbus_codes); i++=
) {
> +               if (imx908_mbus_codes[i] =3D=3D code)
> +                       return true;
> +       }
> +
> +       return false;
> +}
> +
> +static u16 imx908_calc_hmax(u32 width, u32 hblank)
> +{
> +       u32 hmax =3D DIV_ROUND_UP(width + hblank, IMX908_PIX_PER_CLK);
> +
> +       return min_t(u32, hmax, IMX908_HMAX_MAX);
> +}
> +
> +/* Horizontal cropping is digital, so the full width is always read out =
*/
> +static u16 imx908_calc_min_hmax(struct imx908 *imx, u8 bpp)
> +{
> +       u64 link_hz =3D imx908_link_freqs[imx->link_freq_idx];
> +       u64 num =3D (u64)imx908_active_area.width * bpp * IMX908_VTPXCK_H=
Z;
> +       u64 den =3D (u64)imx->num_lanes * link_hz * 2; /* DDR */
> +
> +       /*
> +        * den can exceed 32 bits (e.g. 4 lanes * 720 MHz * 2 =3D 5.76 GH=
z), so
> +        * DIV_ROUND_UP_ULL / do_div would truncate the divisor to u32. U=
se a
> +        * full 64/64 division.
> +        */
> +       return DIV64_U64_ROUND_UP(num, den);
> +}
> +
> +static u32 imx908_calc_min_vblank(const struct v4l2_rect *crop)
> +{
> +       u32 min_vmax =3D max_t(u32, crop->height + IMX908_VMAX_MARGIN,
> +                        IMX908_VMAX_MIN);
> +
> +       return min_vmax - crop->height;
> +}
> +
> +static int imx908_set_exposure_lines(struct imx908 *imx, u32 exposure_li=
nes)
> +{
> +       const struct v4l2_mbus_framefmt *format;
> +       struct v4l2_subdev_state *state;
> +       u32 vmax, max_lines;
> +
> +       state =3D v4l2_subdev_get_locked_active_state(&imx->sd);
> +       format =3D v4l2_subdev_state_get_format(state, IMX908_SOURCE_PAD);
> +
> +       vmax =3D format->height + imx->ctrls.vblank->val;
> +       max_lines =3D vmax - IMX908_MIN_SHR0;
> +
> +       /* Guards SHR0 underflow when VBLANK+EXPOSURE are set together */
> +       exposure_lines =3D clamp_t(u32, exposure_lines, 1, max_lines);
> +
> +       u32 shr0 =3D vmax - exposure_lines;
> +
> +       return cci_write(imx->cci, IMX908_REG_SHR0, shr0, NULL);
> +}
> +
> +static u8 imx908_bits_per_pixel(u32 code)
> +{
> +       switch (code) {
> +       case MEDIA_BUS_FMT_SRGGB12_1X12:
> +               return 12;
> +       case MEDIA_BUS_FMT_SRGGB10_1X10:
> +       default:
> +               return 10;
> +       }
> +}
> +
> +static u32 imx908_hmax_to_hblank(u16 hmax, u32 width)
> +{
> +       return hmax * IMX908_PIX_PER_CLK - width;
> +}
> +
> +static int imx908_update_hblank_limits(struct imx908 *imx, u32 old_width,
> +                                      u32 width, u8 bpp)
> +{
> +       u16 min_hmax =3D imx908_calc_min_hmax(imx, bpp);
> +       u32 max_hblank =3D imx908_hmax_to_hblank(IMX908_HMAX_MAX, width);
> +       u32 min_hblank =3D imx908_hmax_to_hblank(min_hmax, width);
> +       /* Re-derive the line period at the old width to preserve line ti=
me */
> +       u16 hmax =3D imx908_calc_hmax(old_width, imx->ctrls.hblank->val);
> +       u32 hblank =3D imx908_hmax_to_hblank(hmax, width);
> +       int ret;
> +
> +       hblank =3D clamp_t(u32, hblank, min_hblank, max_hblank);
> +
> +       ret =3D __v4l2_ctrl_modify_range(imx->ctrls.hblank, min_hblank,
> +                                      max_hblank, IMX908_PIX_PER_CLK, hb=
lank);
> +       if (ret)
> +               return ret;
> +
> +       if (imx->ctrls.hblank->val !=3D hblank)
> +               __v4l2_ctrl_s_ctrl(imx->ctrls.hblank, hblank);
> +
> +       return 0;
> +}
> +
> +static int imx908_update_vblank_limits(struct imx908 *imx,
> +                                      const struct v4l2_rect *crop,
> +                                      u32 old_height)
> +{
> +       u32 min_vblank =3D imx908_calc_min_vblank(crop);
> +       u32 max_vblank =3D IMX908_VMAX_MAX - crop->height;
> +       /* Preserve frame length across height changes when possible. */
> +       u32 vmax =3D old_height + imx->ctrls.vblank->val;
> +       u32 vblank =3D clamp_t(u32, vmax - crop->height,
> +                            min_vblank, max_vblank);
> +       int ret;
> +
> +       ret =3D __v4l2_ctrl_modify_range(imx->ctrls.vblank, min_vblank,
> +                                      max_vblank, 1, vblank);
> +       if (ret)
> +               return ret;
> +
> +       if (imx->ctrls.vblank->val !=3D vblank)
> +               __v4l2_ctrl_s_ctrl(imx->ctrls.vblank, vblank);
> +
> +       return 0;
> +}
> +
> +/* ------------------ Pattern Generator (TPG) ----------------------- */
> +static const char * const imx908_tpg_menu[] =3D {
> +       "Disabled",
> +       "All 000h",
> +       "All FFFh",
> +       "All 555h",
> +       "All AAAh",
> +       "555h / AAAh Toggle",
> +       "AAAh / 555h Toggle",
> +       "000h / 555h Toggle",
> +       "555h / 000h Toggle",
> +       "000h / FFFh Toggle",
> +       "FFFh / 000h Toggle",
> +       "Horiz Color Bars",
> +       "Vert Color Bars",
> +};
> +
> +static int imx908_update_test_pattern(struct imx908 *imx, u32 index)
> +{
> +       int ret =3D 0;
> +
> +       if (index =3D=3D 0) {
> +               /* Picture (not TPG) output setting */
> +               cci_update_bits(imx->cci, IMX908_REG_TPG_EN, IMX908_TPG_E=
N_BIT,
> +                               0x00, &ret);
> +
> +               /* Disable TESTCLKEN (write-only register) */
> +               cci_write(imx->cci, IMX908_REG_TESTCLKEN, 0x00, &ret);
> +
> +               return ret;
> +       }
> +
> +       cci_write(imx->cci, IMX908_REG_TESTCLKEN, IMX908_TESTCLKEN_BIT, &=
ret);
> +       cci_write(imx->cci, IMX908_REG_TPG_PATSEL, index - 1, &ret);
> +       cci_update_bits(imx->cci, IMX908_REG_TPG_EN, IMX908_TPG_EN_BIT,
> +                       IMX908_TPG_EN_BIT, &ret);
> +
> +       return ret;
> +}
> +
> +static int imx908_update_framing_limits(struct imx908 *imx,
> +                                       struct v4l2_subdev_state *state,
> +                                       u32 old_width,
> +                                       u32 old_height)
> +{
> +       const struct v4l2_mbus_framefmt *fmt;
> +       const struct v4l2_rect *crop;
> +       int ret;
> +
> +       fmt =3D v4l2_subdev_state_get_format(state, IMX908_SOURCE_PAD);
> +       crop =3D v4l2_subdev_state_get_crop(state, IMX908_SOURCE_PAD);
> +       u8 bpp =3D imx908_bits_per_pixel(fmt->code);
> +
> +       ret =3D imx908_update_hblank_limits(imx, old_width, fmt->width, b=
pp);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D imx908_update_vblank_limits(imx, crop, old_height);
> +       if (ret)
> +               return ret;
> +
> +       u32 vmax =3D fmt->height + clamp_t(u32, imx->ctrls.vblank->val,
> +                                        imx908_calc_min_vblank(crop),
> +                                        IMX908_VMAX_MAX - fmt->height);
> +
> +       return __v4l2_ctrl_modify_range(imx->ctrls.exposure,
> +                                       IMX908_EXPOSURE_MIN,
> +                                       vmax - IMX908_MIN_SHR0,
> +                                       IMX908_EXPOSURE_STEP,
> +                                       imx->ctrls.exposure->default_valu=
e);
> +}
> +
> +/* ----------------------- HW Programming ---------------------- */
> +static int imx908_set_mode(struct imx908 *imx,
> +                          const struct v4l2_mbus_framefmt *fmt)
> +{
> +       u8 adbit, mdbit, value;
> +       u16 blklevel;
> +       int ret =3D 0;
> +
> +       switch (fmt->code) {
> +       case MEDIA_BUS_FMT_SRGGB10_1X10:
> +               adbit =3D IMX908_ADBIT_10BIT;
> +               mdbit =3D IMX908_MDBIT_RAW10;
> +               blklevel =3D 50; /* datasheet recommended value for 10-bi=
t */
> +               value =3D 0x0c;  /* register map value for 10-bit */
> +               break;
> +       case MEDIA_BUS_FMT_SRGGB12_1X12:
> +       default:
> +               adbit =3D IMX908_ADBIT_12BIT;
> +               mdbit =3D IMX908_MDBIT_RAW12;
> +               blklevel =3D 200; /* datasheet recommended value for 12-b=
it */
> +               value =3D 0x05;   /* register map value for 12-bit */
> +               break;
> +       }
> +
> +       cci_write(imx->cci, IMX908_REG_XMASTER, IMX908_CONTROLLER_MODE, &=
ret);
> +       cci_write(imx->cci, IMX908_REG_ADBIT, adbit, &ret);
> +       cci_write(imx->cci, IMX908_REG_MDBIT, mdbit, &ret);
> +
> +       for (unsigned int i =3D 0; i < ARRAY_SIZE(imx908_bit_depth_regs);=
 ++i)
> +               cci_write(imx->cci, imx908_bit_depth_regs[i], value, &ret=
);
> +
> +       cci_write(imx->cci, IMX908_REG_INCK_SEL, imx->inck_sel, &ret);
> +       cci_write(imx->cci, IMX908_REG_DATARATE_SEL, imx->link_freq_idx, =
&ret);
> +       cci_write(imx->cci, IMX908_REG_LANEMODE, imx->num_lanes =3D=3D 2 ?
> +                 IMX908_LANEMODE_2LANE : IMX908_LANEMODE_4LANE, &ret);
> +       cci_write(imx->cci, IMX908_REG_BLKLEVEL, blklevel, &ret);

Has the BLKLEVEL register handling changed from Starvis2 -> Starvis3?

For IMX678 the default value recommended by datasheet were the same, 50 and
200, but with a note that increasing register by 1 in 12-bit mode meant an
increase of 4 in the output. Thus the register always reads 50 (or 0x32) by
default.

> +
> +       if (ret)
> +               dev_err(imx->dev, " register write failed: %d\n", ret);
> +
> +       return ret;
> +}
> +
> +static int imx908_program_window(struct imx908 *imx,
> +                                const struct v4l2_rect *crop)
> +{
> +       bool all_pixel_mode =3D v4l2_rect_equal(crop, &imx908_active_area=
);
> +       int ret =3D 0;
> +
> +       cci_write(imx->cci, IMX908_REG_WINMODE,
> +                 all_pixel_mode ? IMX908_WINMODE_ALLPIX : IMX908_WINMODE=
_CROP,
> +                 &ret);
> +
> +       if (!all_pixel_mode) {
> +               cci_write(imx->cci, IMX908_REG_PIX_HST,    crop->left,   =
&ret);
> +               cci_write(imx->cci, IMX908_REG_PIX_HWIDTH, crop->width,  =
&ret);
> +               cci_write(imx->cci, IMX908_REG_PIX_VST,    crop->top,    =
&ret);
> +               cci_write(imx->cci, IMX908_REG_PIX_VWIDTH, crop->height, =
&ret);
> +       }
> +
> +       return ret;
> +}
> +
> +/* ----------------------- Start/Stop streaming ---------------------- */
> +static int imx908_start_streaming(struct imx908 *imx,
> +                                 struct v4l2_subdev_state *sd_state)
> +{
> +       const struct v4l2_mbus_framefmt *format;
> +       const struct v4l2_rect *crop;
> +       int ret =3D 0;
> +
> +       crop =3D v4l2_subdev_state_get_crop(sd_state, IMX908_SOURCE_PAD);
> +       format =3D v4l2_subdev_state_get_format(sd_state, IMX908_SOURCE_P=
AD);
> +
> +       cci_multi_reg_write(imx->cci, imx908_common_regs,
> +                           ARRAY_SIZE(imx908_common_regs), &ret);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D imx908_set_mode(imx, format);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D imx908_program_window(imx, crop);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D __v4l2_ctrl_handler_setup(imx->sd.ctrl_handler);
> +       if (ret)
> +               return ret;
> +
> +       cci_write(imx->cci, IMX908_REG_STANDBY, IMX908_STANDBY_CANCEL, &r=
et);
> +       fsleep(24 * USEC_PER_MSEC); /* >=3D24 ms stabilization after stan=
dby cancel */
> +
> +       cci_write(imx->cci, IMX908_REG_XMSTA, IMX908_XMSTA_START, &ret);
> +
> +       return ret;
> +}
> +
> +static int imx908_stop_streaming(struct imx908 *imx)
> +{
> +       int ret =3D 0;
> +
> +       cci_write(imx->cci, IMX908_REG_STANDBY, IMX908_STANDBY_EN, &ret);
> +       cci_write(imx->cci, IMX908_REG_XMSTA, IMX908_XMSTA_STOP, &ret);
> +
> +       return ret;
> +}
> +
> +/* --------------------------- V4L2 controls ---------------------------=
--- */
> +static int imx908_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       struct imx908 *imx =3D container_of(ctrl->handler, struct imx908,
> +                                         ctrls.handler);
> +       const struct v4l2_mbus_framefmt *format;
> +       struct v4l2_subdev_state *state;
> +       int ret =3D 0;
> +
> +       state =3D v4l2_subdev_get_locked_active_state(&imx->sd);
> +       format =3D v4l2_subdev_state_get_format(state, IMX908_SOURCE_PAD);
> +
> +       /* Update exposure control limits even if the sensor is not strea=
ming */
> +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> +               const struct v4l2_rect *crop;
> +
> +               crop =3D v4l2_subdev_state_get_crop(state, IMX908_SOURCE_=
PAD);
> +
> +               u32 min_vblank =3D imx908_calc_min_vblank(crop);
> +               u32 max_vblank =3D IMX908_VMAX_MAX - format->height;
> +               u32 vblank =3D clamp_t(u32, ctrl->val, min_vblank, max_vb=
lank);

The above 3 lines are redundant for simple VBLANK control updates. V4L2
control framework would ensure new values are within the defined min/max
range before the drivers .s_ctrl is triggered.

> +
> +               u32 vmax =3D format->height + vblank;
> +               u32 max_exposure =3D vmax - IMX908_MIN_SHR0;
> +               u32 current_exposure =3D clamp_t(u32, imx->ctrls.exposure=
->cur.val,
> +                                       IMX908_EXPOSURE_MIN, max_exposure=
);

Same here. No reason the exposure->cur.val would be out of bounds when user
requests an update to VBLANK value. So this should be:

    u32 current_exposure =3D imx->ctrls.exposure->cur.val

> +
> +               ret =3D __v4l2_ctrl_modify_range(imx->ctrls.exposure,
> +                                              IMX908_EXPOSURE_MIN,
> +                                              max_exposure,
> +                                              IMX908_EXPOSURE_STEP,
> +                                              current_exposure);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       /* Hardware writes only when powered; cached ctrls applied on res=
ume */
> +       if (!pm_runtime_get_if_active(imx->dev))
> +               return 0;
> +
> +       switch (ctrl->id) {
> +       case V4L2_CID_EXPOSURE:
> +               ret =3D imx908_set_exposure_lines(imx, ctrl->val);
> +               break;
> +
> +       case V4L2_CID_ANALOGUE_GAIN:
> +               cci_write(imx->cci, IMX908_REG_GAIN, ctrl->val, &ret);
> +               break;
> +
> +       case V4L2_CID_VBLANK: {
> +               u32 vmax =3D format->height + ctrl->val;
> +
> +               ret =3D cci_write(imx->cci, IMX908_REG_VMAX, vmax, NULL);
> +               /* SHR0 derived from VMAX, re-apply exposure after change=
s */
> +               if (!ret)
> +                       ret =3D imx908_set_exposure_lines(imx,
> +                                                       imx->ctrls.exposu=
re->val);
> +               break;
> +       }
> +
> +       case V4L2_CID_HBLANK: {
> +               u16 hmax =3D imx908_calc_hmax(format->width, ctrl->val);
> +
> +               cci_write(imx->cci, IMX908_REG_HMAX, hmax, &ret);
> +               break;
> +       }
> +
> +       case V4L2_CID_TEST_PATTERN:
> +               ret =3D imx908_update_test_pattern(imx, ctrl->val);
> +               break;
> +
> +       case V4L2_CID_HFLIP:
> +               cci_write(imx->cci, IMX908_REG_HREVERSE,
> +                         ctrl->val ? IMX908_HREVERSE_INV
> +                         : IMX908_HREVERSE_NORMAL, &ret);
> +               break;
> +
> +       case V4L2_CID_VFLIP:
> +               cci_write(imx->cci, IMX908_REG_VREVERSE,
> +                         ctrl->val ? IMX908_VREVERSE_INV
> +                         : IMX908_VREVERSE_NORMAL, &ret);
> +               break;
> +

Any reason the register values for HREVERSE/VREVERSE are inverted now w.r.t
the userspace HFLIP/VFLIP settings?

Ah, and is this why imx908_active_area.top was 0 and not 24 ?

What v2 did (writing ctrl->val directly to the registers) seemed okay to
me. It's usually a good idea to mention functional changes in the
changelog. If there is a valid reason for the swap, maybe also add a code
comment here explaining why.

> +       default:
> +               dev_warn(imx->dev,
> +                        "ctrl(id:0x%x,val:0x%x) is not handled\n",
> +                        ctrl->id, ctrl->val);
> +               break;
> +       }
> +
> +       pm_runtime_put(imx->dev);
> +
> +       return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops imx908_ctrl_ops =3D {
> +       .s_ctrl =3D imx908_set_ctrl,
> +};
> +
> +/* ------------------------ Pad/video ops ------------------ */
> +static int imx908_enum_mbus_code(struct v4l2_subdev *sd,
> +                                struct v4l2_subdev_state *sd_state,
> +                                struct v4l2_subdev_mbus_code_enum *code)
> +{
> +       if (code->index >=3D ARRAY_SIZE(imx908_mbus_codes))
> +               return -EINVAL;
> +       code->code =3D imx908_mbus_codes[code->index];
> +       return 0;
> +}
> +
> +static int imx908_enum_frame_size(struct v4l2_subdev *sd,
> +                                 struct v4l2_subdev_state *sd_state,
> +                                 struct v4l2_subdev_frame_size_enum *fse)
> +{
> +       struct imx908 *imx =3D to_imx908(sd);
> +       const struct v4l2_rect *crop;
> +
> +       if (fse->index > 0)
> +               return -EINVAL;
> +
> +       if (!imx908_mbus_code_supported(imx, fse->code))
> +               return -EINVAL;
> +
> +       crop =3D v4l2_subdev_state_get_crop(sd_state, IMX908_SOURCE_PAD);
> +
> +       fse->min_width  =3D crop->width;
> +       fse->max_width  =3D crop->width;
> +       fse->min_height =3D crop->height;
> +       fse->max_height =3D crop->height;
> +
> +       return 0;
> +}
> +
> +static int imx908_set_pad_format(struct v4l2_subdev *sd,
> +                                struct v4l2_subdev_state *sd_state,
> +                                struct v4l2_subdev_format *fmt)
> +{
> +       struct imx908 *imx =3D to_imx908(sd);
> +       struct v4l2_mbus_framefmt *format;
> +
> +       if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE &&
> +           v4l2_subdev_is_streaming(sd))
> +               return -EBUSY;
> +
> +       format =3D v4l2_subdev_state_get_format(sd_state, fmt->pad);
> +
> +       if (imx908_mbus_code_supported(imx, fmt->format.code))
> +               format->code =3D fmt->format.code;
> +       else
> +               format->code =3D IMX908_DEFAULT_MBUS_CODE;
> +
> +       /* Fully define metadata */
> +       format->field        =3D V4L2_FIELD_NONE;
> +       format->colorspace   =3D V4L2_COLORSPACE_RAW;
> +       format->ycbcr_enc    =3D V4L2_YCBCR_ENC_DEFAULT;
> +       format->quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
> +       format->xfer_func    =3D V4L2_XFER_FUNC_NONE;
> +
> +       /* Limits track the real controls only for the ACTIVE state, not =
TRY */
> +       if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
> +               /* set_pad_format() never changes width, so old =3D=3D ne=
w here */
> +               u32 old_width =3D format->width;
> +               u32 old_height =3D format->height;
> +               int ret =3D imx908_update_framing_limits(imx, sd_state,
> +                                              old_width, old_height);
> +
> +               if (ret)
> +                       return ret;
> +       }

I see program_window() only looks at crop size, so changing format
width/height to something else using S_FMT will not change anything on the
CSI-2 bus.

For freely-configurable sensor drivers like these, I think the usual
pattern is to allow S_SELECTION to configure the window size, and S_FMT
always snaps format->width =3D crop->width (same for height).

> +
> +       fmt->format =3D *format;
> +
> +       return 0;
> +}
> +
> +static int imx908_set_selection(struct v4l2_subdev *sd,
> +                               struct v4l2_subdev_state *sd_state,
> +                               struct v4l2_subdev_selection *sel)
> +{
> +       struct imx908 *imx =3D to_imx908(sd);
> +       struct v4l2_mbus_framefmt *format;
> +       struct v4l2_rect *r =3D &sel->r;
> +       struct v4l2_rect *crop;
> +
> +       if (sel->target !=3D V4L2_SEL_TGT_CROP)
> +               return -EINVAL;
> +
> +       if (sel->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE &&
> +           v4l2_subdev_is_streaming(sd))
> +               return -EBUSY;
> +
> +       crop =3D v4l2_subdev_state_get_crop(sd_state, sel->pad);
> +       format =3D v4l2_subdev_state_get_format(sd_state, sel->pad);
> +
> +       /*
> +        * Round the crop rectangle size down to the hardware alignment
> +        * constraints, then clamp it to the supported size range.
> +        */
> +       r->width =3D clamp_t(s32, ALIGN_DOWN(r->width, IMX908_CROP_ALIGN_=
HWIDTH),
> +                          IMX908_CROP_MIN_WIDTH, imx908_active_area.widt=
h);
> +       r->height =3D clamp_t(s32, ALIGN_DOWN(r->height, IMX908_CROP_ALIG=
N_VWIDTH),
> +                           IMX908_CROP_MIN_HEIGHT, imx908_active_area.he=
ight);
> +
> +       /*
> +        * Round and clamp the crop position similarly, with the maximum =
value
> +        * chosen so that the crop rectangle remains fully inside the act=
ive
> +        * pixel array.
> +        */
> +       r->left =3D clamp_t(s32, ALIGN_DOWN(r->left, IMX908_CROP_ALIGN_HS=
TART), 0,
> +                         imx908_active_area.width - r->width);
> +       r->top =3D clamp_t(s32, ALIGN_DOWN(r->top, IMX908_CROP_ALIGN_VSTA=
RT), 0,
> +                        imx908_active_area.height - r->height);
> +
> +       u32 old_width =3D crop->width;
> +       u32 old_height =3D crop->height;
> +
> +       *crop =3D *r;
> +
> +       /* IMX908 has no binning, so the output size matches the crop 1:1=
 */
> +       format->width  =3D crop->width;
> +       format->height =3D crop->height;
> +
> +       if (sel->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
> +               int ret =3D imx908_update_framing_limits(imx, sd_state,
> +                                              old_width, old_height);
> +
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int imx908_get_selection(struct v4l2_subdev *sd,
> +                               struct v4l2_subdev_state *sd_state,
> +                               struct v4l2_subdev_selection *sel)
> +{
> +       switch (sel->target) {
> +       case V4L2_SEL_TGT_CROP:
> +               sel->r =3D *v4l2_subdev_state_get_crop(sd_state,
> +                                                    IMX908_SOURCE_PAD);
> +               return 0;
> +
> +       case V4L2_SEL_TGT_NATIVE_SIZE:
> +               sel->r =3D imx908_total_area;
> +               return 0;
> +
> +       case V4L2_SEL_TGT_CROP_DEFAULT:
> +               sel->r =3D imx908_active_area;
> +               return 0;
> +
> +       case V4L2_SEL_TGT_CROP_BOUNDS:
> +               sel->r =3D imx908_active_area;
> +               return 0;

nitpick: can be simplified as

       case V4L2_SEL_TGT_CROP_DEFAULT:
       case V4L2_SEL_TGT_CROP_BOUNDS:
               sel->r =3D imx908_active_area;
               return 0;

> +       default:
> +               return -EINVAL;
> +       }
> +}
> +
> +static int imx908_enable_streams(struct v4l2_subdev *sd,
> +                                struct v4l2_subdev_state *sd_state,
> +                                u32 pad,
> +                                u64 streams_mask)
> +{
> +       struct imx908 *imx =3D to_imx908(sd);
> +       int ret;
> +
> +       ret =3D pm_runtime_resume_and_get(imx->dev);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D imx908_start_streaming(imx, sd_state);
> +       if (ret) {
> +               pm_runtime_put_autosuspend(imx->dev);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int imx908_disable_streams(struct v4l2_subdev *sd,
> +                                 struct v4l2_subdev_state *sd_state,
> +                                 u32 pad,
> +                                 u64 streams_mask)
> +{
> +       struct imx908 *imx =3D to_imx908(sd);
> +       int ret;
> +
> +       ret =3D imx908_stop_streaming(imx);
> +
> +       pm_runtime_put_autosuspend(imx->dev);
> +
> +       return ret;
> +}
> +
> +static int imx908_init_state(struct v4l2_subdev *sd,
> +                            struct v4l2_subdev_state *sd_state)
> +{
> +       struct v4l2_subdev_selection sel =3D {
> +               .which  =3D V4L2_SUBDEV_FORMAT_TRY,
> +               .pad    =3D IMX908_SOURCE_PAD,
> +               .target =3D V4L2_SEL_TGT_CROP,
> +               .r      =3D imx908_active_area,
> +       };
> +       struct v4l2_subdev_format fmt =3D {
> +               .which =3D V4L2_SUBDEV_FORMAT_TRY,
> +               .pad   =3D IMX908_SOURCE_PAD,
> +               .format =3D {
> +                       .code   =3D IMX908_DEFAULT_MBUS_CODE,
> +                       .width  =3D imx908_active_area.width,
> +                       .height =3D imx908_active_area.height,
> +               },
> +       };
> +
> +       imx908_set_selection(sd, sd_state, &sel);
> +       imx908_set_pad_format(sd, sd_state, &fmt);
> +
> +       return 0;
> +}
> +
> +static const struct v4l2_subdev_video_ops imx908_video_ops =3D {
> +       .s_stream =3D v4l2_subdev_s_stream_helper,
> +};
> +
> +static const struct v4l2_subdev_pad_ops imx908_pad_ops =3D {
> +       .enum_mbus_code      =3D imx908_enum_mbus_code,
> +       .enum_frame_size     =3D imx908_enum_frame_size,
> +       .get_fmt             =3D v4l2_subdev_get_fmt,
> +       .set_fmt             =3D imx908_set_pad_format,
> +       .get_selection       =3D imx908_get_selection,
> +       .set_selection       =3D imx908_set_selection,
> +       .enable_streams      =3D imx908_enable_streams,
> +       .disable_streams     =3D imx908_disable_streams,
> +};
> +
> +static const struct v4l2_subdev_internal_ops imx908_internal_ops =3D {
> +       .init_state =3D imx908_init_state,
> +};
> +
> +static const struct v4l2_subdev_ops imx908_subdev_ops =3D {
> +       .video =3D &imx908_video_ops,
> +       .pad   =3D &imx908_pad_ops,
> +};
> +
> +/* ----------------------- Power management ---------------------- */
> +static int imx908_power_on(struct device *dev)
> +{
> +       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +       struct imx908 *imx =3D to_imx908(sd);
> +       int ret;
> +
> +       ret =3D regulator_bulk_enable(ARRAY_SIZE(imx908_supply_names),
> +                                   imx->supplies);
> +       if (ret) {
> +               dev_err(imx->dev, "failed to enable regulators\n");
> +               return ret;
> +       }
> +       /* XCLR already asserted by GPIOD_OUT_HIGH */
> +       udelay(1); /* >=3D 500ns T_low */
> +       gpiod_set_value_cansleep(imx->reset_gpio, 0); /* Sensor start */
> +
> +       ret =3D clk_prepare_enable(imx->xclk);
> +       if (ret) {
> +               dev_err(imx->dev, "failed to enable xclk: %d\n", ret);
> +               goto err_reset;
> +       }
> +
> +       fsleep(20); /* T_1 >=3D 20us before first SDA/SCL */
> +
> +       return 0;
> +
> +err_reset:
> +       gpiod_set_value_cansleep(imx->reset_gpio, 1); /* assert reset */
> +       regulator_bulk_disable(ARRAY_SIZE(imx908_supply_names), imx->supp=
lies);
> +       return ret;
> +}
> +
> +static void imx908_power_off(struct device *dev)
> +{
> +       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +       struct imx908 *imx =3D to_imx908(sd);
> +
> +       clk_disable_unprepare(imx->xclk);
> +       gpiod_set_value_cansleep(imx->reset_gpio, 1);
> +       regulator_bulk_disable(ARRAY_SIZE(imx908_supply_names), imx->supp=
lies);
> +}
> +
> +static int imx908_runtime_resume(struct device *dev)
> +{
> +       return imx908_power_on(dev);
> +}
> +
> +static int imx908_runtime_suspend(struct device *dev)
> +{
> +       imx908_power_off(dev);
> +       return 0;
> +}
> +

You could use imx908_power_off and imx908_power_on directly as the
RUNTIME_PM_OPS below.

> +static DEFINE_RUNTIME_DEV_PM_OPS(imx908_pm_ops,
> +                                imx908_runtime_suspend,
> +                                imx908_runtime_resume, NULL);
> +
> +/* ------------------------------- Probe/remove ------------------------=
--- */
> +
> +static int imx908_get_inck_sel(struct imx908 *imx, u32 xclk_freq)
> +{
> +       for (unsigned int i =3D 0; i < ARRAY_SIZE(imx908_inck_table); i++=
) {
> +               if (imx908_inck_table[i] =3D=3D xclk_freq) {
> +                       imx->inck_sel =3D i;
> +                       return 0;
> +               }
> +       }
> +
> +       return dev_err_probe(imx->dev, -EINVAL, "unsupported xclk %u Hz\n=
",
> +                            xclk_freq);
> +}
> +
> +static int imx908_get_regulators(struct imx908 *imx)
> +{
> +       for (unsigned int i =3D 0; i < ARRAY_SIZE(imx908_supply_names); i=
++)
> +               imx->supplies[i].supply =3D imx908_supply_names[i];
> +
> +       return devm_regulator_bulk_get(imx->dev,
> +                       ARRAY_SIZE(imx908_supply_names),
> +                       imx->supplies);
> +}
> +
> +static int imx908_parse_fwnode(struct imx908 *imx)
> +{
> +       struct v4l2_fwnode_endpoint bus_cfg =3D {
> +               .bus_type =3D V4L2_MBUS_CSI2_DPHY
> +       };
> +       struct fwnode_handle *ep;
> +       int ret =3D 0;
> +
> +       ep =3D fwnode_graph_get_next_endpoint(dev_fwnode(imx->dev), NULL);
> +
> +       /* Only data-lanes and link-frequencies are used from the endpoin=
t */
> +       ret =3D v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +       fwnode_handle_put(ep);
> +       if (ret)
> +               return ret;
> +
> +       imx->num_lanes =3D bus_cfg.bus.mipi_csi2.num_data_lanes;
> +
> +       if (imx->num_lanes !=3D 2 && imx->num_lanes !=3D 4) {
> +               dev_err(imx->dev,
> +                       "only 2 or 4 CSI-2 data lanes are supported (got =
%u)\n",
> +                       imx->num_lanes);
> +               ret =3D -EINVAL;
> +               goto out_free;
> +       }
> +
> +       ret =3D v4l2_link_freq_to_bitmap(imx->dev,
> +                                      bus_cfg.link_frequencies,
> +                                      bus_cfg.nr_of_link_frequencies,
> +                                      imx908_link_freqs,
> +                                      ARRAY_SIZE(imx908_link_freqs),
> +                                      &imx->link_freq_bitmap);
> +       if (ret)
> +               goto out_free;

The above two lines could be dropped.

> +
> +       imx->link_freq_idx =3D __ffs(imx->link_freq_bitmap);
> +       dev_dbg(imx->dev, "using %u lanes at link freq %llu Hz\n",
> +               imx->num_lanes, imx908_link_freqs[imx->link_freq_idx]);
> +
> +out_free:
> +       v4l2_fwnode_endpoint_free(&bus_cfg);
> +       return ret;
> +}
> +
> +static int imx908_init_controls(struct imx908 *imx)
> +{
> +       struct v4l2_ctrl_handler *hdl =3D &imx->ctrls.handler;
> +       struct v4l2_fwnode_device_properties props;
> +       struct v4l2_ctrl *ctrl;
> +       int ret;
> +
> +       /* Read rotation and orientation properties from the firmware nod=
e */
> +       ret =3D v4l2_fwnode_device_parse(imx->dev, &props);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D v4l2_ctrl_handler_init(hdl, 11);
> +       if (ret)
> +               return ret;
> +
> +       /* PIXEL_RATE is always read-only, so it needs no s_ctrl() handli=
ng */
> +       v4l2_ctrl_new_std(hdl, NULL, V4L2_CID_PIXEL_RATE,
> +                         IMX908_PIXEL_RATE, IMX908_PIXEL_RATE, 1,
> +                         IMX908_PIXEL_RATE);
> +
> +       /* LINK_FREQ is informational only and has no s_ctrl() handling */
> +       ctrl =3D v4l2_ctrl_new_int_menu(hdl, NULL, V4L2_CID_LINK_FREQ,
> +                                     ARRAY_SIZE(imx908_link_freqs) - 1,
> +                                     imx->link_freq_idx, imx908_link_fre=
qs);
> +       if (ctrl)
> +               ctrl->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> +
> +       u32 min_vblank =3D imx908_calc_min_vblank(&imx908_active_area);
> +       u32 max_vblank =3D IMX908_VMAX_MAX - imx908_active_area.height;
> +       /* Default to the datasheet 30 fps operating point */
> +       u32 def_vblank =3D IMX908_VMAX_DEFAULT - imx908_active_area.heigh=
t;
> +
> +       imx->ctrls.vblank =3D v4l2_ctrl_new_std(hdl, &imx908_ctrl_ops,
> +                                             V4L2_CID_VBLANK, min_vblank,
> +                                             max_vblank, 1, def_vblank);
> +
> +       u8 bpp =3D imx908_bits_per_pixel(IMX908_DEFAULT_MBUS_CODE);
> +       u16 min_hmax =3D imx908_calc_min_hmax(imx, bpp);
> +       u32 min_hblank =3D imx908_hmax_to_hblank(min_hmax,
> +                                              imx908_active_area.width);
> +       u32 max_hblank =3D imx908_hmax_to_hblank(IMX908_HMAX_MAX,
> +                                              imx908_active_area.width);
> +       u32 hblank =3D imx908_hmax_to_hblank(IMX908_HMAX_DEFAULT,
> +                                          imx908_active_area.width);
> +
> +       /* Default HMAX can be infeasible at low link freqs; clamp into r=
ange */
> +       hblank =3D clamp_t(u32, hblank, min_hblank, max_hblank);
> +
> +       imx->ctrls.hblank =3D v4l2_ctrl_new_std(hdl, &imx908_ctrl_ops,
> +                                             V4L2_CID_HBLANK, min_hblank,
> +                                             max_hblank, IMX908_PIX_PER_=
CLK,
> +                                             hblank);
> +       u32 max_exp =3D IMX908_VMAX_DEFAULT - IMX908_MIN_SHR0;
> +
> +       imx->ctrls.exposure =3D v4l2_ctrl_new_std(hdl, &imx908_ctrl_ops,
> +                                               V4L2_CID_EXPOSURE,
> +                                               IMX908_EXPOSURE_MIN,
> +                                               max_exp,
> +                                               IMX908_EXPOSURE_STEP,
> +                                               max_exp / 2);
> +
> +       v4l2_ctrl_new_std(hdl, &imx908_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
> +                         IMX908_ANA_GAIN_MIN, IMX908_ANA_GAIN_MAX,
> +                         IMX908_ANA_GAIN_STEP, IMX908_ANA_GAIN_DEFAULT);
> +
> +       /* Set test pattern. Menu (13 entries: Disabled + 12 patterns) */
> +       v4l2_ctrl_new_std_menu_items(hdl, &imx908_ctrl_ops,
> +                                    V4L2_CID_TEST_PATTERN,
> +                                    ARRAY_SIZE(imx908_tpg_menu) - 1, 0, =
0,
> +                                    imx908_tpg_menu);
> +
> +       v4l2_ctrl_new_std(hdl, &imx908_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1,=
 0);
> +       v4l2_ctrl_new_std(hdl, &imx908_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1,=
 0);
> +
> +       v4l2_ctrl_new_fwnode_properties(hdl, &imx908_ctrl_ops, &props);
> +       if (hdl->error) {
> +               ret =3D hdl->error;
> +               goto err_free;

Instead of the goto you could directly return here:

        v4l2_ctrl_handler_free(hdl);
        return ret;


> +       }
> +
> +       imx->sd.ctrl_handler =3D hdl;
> +
> +       return 0;
> +
> +err_free:
> +       v4l2_ctrl_handler_free(hdl);
> +       return ret;
> +}
> +
> +static int imx908_identify_model(struct imx908 *imx)
> +{
> +       u16 chip_id;
> +       u64 val;
> +       int ret;
> +
> +       /*
> +        * The TYPE_ID registers are not accessible after power-up while
> +        * the device remains in standby. Exit standby and wait for the
> +        * required stabilization period before reading the chip ID.
> +        */
> +       ret =3D cci_write(imx->cci, IMX908_REG_STANDBY, IMX908_STANDBY_CA=
NCEL, NULL);
> +       if (ret)
> +               return ret;
> +
> +       fsleep(24 * USEC_PER_MSEC); /* >=3D24 ms stabilization after stan=
dby cancel */
> +
> +       ret =3D cci_read(imx->cci, IMX908_REG_TYPE_ID, &val, NULL);
> +       if (ret)
> +               return ret;
> +
> +       chip_id =3D val;
> +       dev_dbg(imx->dev, "IMX908 chip ID: 0x%04x\n", chip_id);
> +
> +       if (chip_id !=3D IMX908_CHIP_ID) {
> +               dev_err(imx->dev, "unexpected chip ID 0x%04x (expected 0x=
%04x)\n",
> +                       chip_id, IMX908_CHIP_ID);
> +               return -ENXIO;
> +       }
> +
> +       /* Set to standby mode to save power */
> +       ret =3D cci_write(imx->cci, IMX908_REG_STANDBY, IMX908_STANDBY_EN=
, NULL);
> +       if (ret) {
> +               dev_err(imx->dev, "failed to enter standby state: %d\n", =
ret);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int imx908_probe(struct i2c_client *client)
> +{
> +       struct imx908 *imx;
> +       int ret;
> +
> +       imx =3D devm_kzalloc(&client->dev, sizeof(*imx), GFP_KERNEL);
> +       if (!imx)
> +               return -ENOMEM;
> +       imx->dev =3D &client->dev;
> +
> +       v4l2_i2c_subdev_init(&imx->sd, client, &imx908_subdev_ops);
> +       imx->sd.internal_ops =3D &imx908_internal_ops;
> +
> +       imx->cci =3D devm_cci_regmap_init_i2c(client, 16);
> +       if (IS_ERR(imx->cci))
> +               return dev_err_probe(imx->dev, PTR_ERR(imx->cci),
> +                                    "CCI regmap init failed\n");
> +
> +       imx->xclk =3D devm_v4l2_sensor_clk_get(imx->dev, NULL);
> +       if (IS_ERR(imx->xclk))
> +               return dev_err_probe(imx->dev, PTR_ERR(imx->xclk),
> +                                    "failed to get clock\n");
> +
> +       ret =3D imx908_get_inck_sel(imx, clk_get_rate(imx->xclk));
> +       if (ret)
> +               return ret;
> +
> +       imx->reset_gpio =3D devm_gpiod_get_optional(imx->dev, "reset",
> +                                                 GPIOD_OUT_HIGH);
> +
> +       if (IS_ERR(imx->reset_gpio))
> +               return dev_err_probe(imx->dev, PTR_ERR(imx->reset_gpio),
> +                                    "failed to get reset gpio\n");
> +
> +       ret =3D imx908_get_regulators(imx);
> +       if (ret)
> +               return dev_err_probe(imx->dev, ret, "failed to get regula=
tors\n");
> +
> +       ret =3D imx908_parse_fwnode(imx);
> +       if (ret)
> +               return dev_err_probe(imx->dev, ret, "device tree parse fa=
iled\n");
> +
> +       ret =3D imx908_power_on(imx->dev);
> +       if (ret)
> +               return dev_err_probe(imx->dev, ret, "power-on failed\n");
> +
> +       ret =3D imx908_identify_model(imx);
> +       if (ret) {
> +               dev_err(imx->dev, "failed to identify model: %d\n", ret);
> +               goto err_power_off;
> +       }
> +
> +       /* Device is powered; keep it resumed across registration, releas=
e at end */
> +       pm_runtime_set_active(imx->dev);
> +       pm_runtime_get_noresume(imx->dev);
> +       ret =3D devm_pm_runtime_enable(imx->dev);
> +       if (ret)
> +               goto err_pm_put;
> +
> +       pm_runtime_set_autosuspend_delay(imx->dev, 1000);
> +       pm_runtime_use_autosuspend(imx->dev);
> +
> +       ret =3D imx908_init_controls(imx);
> +       if (ret)
> +               goto err_pm_put;
> +
> +       imx->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> +       imx->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> +       imx->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> +       ret =3D media_entity_pads_init(&imx->sd.entity, 1, &imx->pad);
> +       if (ret)
> +               goto err_hdl;
> +
> +       /* Share the ctrl handler lock so s_ctrl can access the locked st=
ate */
> +       imx->sd.state_lock =3D imx->ctrls.handler.lock;
> +
> +       ret =3D v4l2_subdev_init_finalize(&imx->sd);
> +       if (ret)
> +               goto err_entity;
> +
> +       ret =3D v4l2_async_register_subdev_sensor(&imx->sd);
> +       if (ret)
> +               goto err_subdev;
> +
> +       /* Balance get_noresume; allow the sensor to suspend after probe =
*/
> +       pm_runtime_put_autosuspend(imx->dev);
> +
> +       return 0;
> +
> +err_subdev:
> +       v4l2_subdev_cleanup(&imx->sd);
> +
> +err_entity:
> +       media_entity_cleanup(&imx->sd.entity);
> +
> +err_hdl:
> +       v4l2_ctrl_handler_free(imx->sd.ctrl_handler);
> +
> +err_pm_put:
> +       pm_runtime_put_noidle(imx->dev);
> +
> +err_power_off:
> +       imx908_power_off(imx->dev);
> +
> +       return ret;
> +}
> +
> +static void imx908_remove(struct i2c_client *client)
> +{
> +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +       struct imx908 *imx =3D to_imx908(sd);
> +
> +       v4l2_async_unregister_subdev(sd);
> +       v4l2_subdev_cleanup(sd);
> +       media_entity_cleanup(&sd->entity);
> +       v4l2_ctrl_handler_free(sd->ctrl_handler);
> +
> +       pm_runtime_disable(imx->dev);

This should be dropped given devm_pm_runtime_enable() was used in probe().

> +       if (!pm_runtime_status_suspended(imx->dev))
> +               imx908_power_off(imx->dev);
> +       pm_runtime_set_suspended(imx->dev);
> +}
> +
> +static const struct of_device_id imx908_of_ids[] =3D {
> +       { .compatible =3D "sony,imx908" },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx908_of_ids);
> +
> +static struct i2c_driver imx908_i2c_driver =3D {
> +       .driver =3D {
> +               .name           =3D "imx908",
> +               .pm             =3D pm_ptr(&imx908_pm_ops),
> +               .of_match_table =3D imx908_of_ids,
> +       },
> +       .probe  =3D imx908_probe,
> +       .remove =3D imx908_remove,
> +};
> +module_i2c_driver(imx908_i2c_driver);
> +
> +MODULE_AUTHOR("Lachlan Michael <Lachlan.Michael@sony.com>");
> +MODULE_DESCRIPTION("Sony IMX908 Sensor Driver");
> +MODULE_LICENSE("GPL");
> --=20
> 2.47.3
>=20

Thanks,
    Jai
