Received: from mail-244122.protonmail.ch (mail-244122.protonmail.ch [109.224.244.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AAC26AC5;
	Fri,  2 Oct 2026 08:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929577; cv=none; b=W8TK/0sUcyEL4IawpPgMdAQV/XeafRxJWjbYK9uobXnqSOXhan2+F9VFlFdIfVQHNoHLhmLiy5oRxVGEHeHZN2Rhqzmjq7DmH2O6lMpVv50hwgAbLF1LxFsgynGUMMj2TwEMAU1KGjuKjgSFbAWWBfo4cr76pTBYIsd2Azbq4BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929577; c=relaxed/simple;
	bh=5+9nbR+osMNjYq51nb1DTQ3XbYdxK2Q22pZcBsMBuQI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R/xGVmDKlyX6Uoen5usTUVbWrMZDsiyMOju4jWp92bZUXyx7CNGyjxsWVQFSa3sxRPNmsEWDSgULZgGfMMb7TYtCrYas0pBms5WKINKX42vPIJkEWMRng+vpLp4D7wdOnaJqeYjZBuiNHYEou3uoTokWr9xnFOjRguhqUpRlXvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=QhzzQMDi; arc=none smtp.client-ip=109.224.244.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="QhzzQMDi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1790929566; x=1791188766;
	bh=7ZhtBib5+YsqSwWFciRA5horHSQ/cOK20JZy7cwE7/g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QhzzQMDiCnXs47a68iCmQLuFljTQh5TnPq1k/+ZPr0NiQitoujaaHyP/M2SyifHmP
	 ALPzbWzylHr82sVih+Xqq5/2bIIY8dn9XV4JNgABlNNkfBWu/1+zHsi3eNJMGBaRki
	 C17b/9eEFWgGuiBEkvrdYOX86Z8rWTvTaojukg3gMV8lg+GhZixUxat27Ly2VCGTKp
	 MLEW19To0RLi3r8AC+Ll+693YeEZGmMOojZQYtuIuEWxzqjOudbK+lvk4xW6DvC+iO
	 XB7W8F/m/FOTNKfAFU1ooZl7eyaXqeHdrq7RdeT6nBde+kH5yeLhupTDa5NR8S9DQz
	 CebRLGUQyv/PQ==
Date: Fri, 02 Oct 2026 08:26:01 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, sashiko-bot@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8 2/3] media: i2c: Add Sony IMX681 sensor driver
Message-ID: <20261002082537.74084-3-lsa.uz@pm.me>
In-Reply-To: <20261002082537.74084-1-lsa.uz@pm.me>
References: <20261002082537.74084-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 6bb2d039b38c975683ff21a53e20efd5ec467113
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Andre Gilerson <andre.gilerson@gmail.com>

Add a V4L2 sub-device driver for the Sony IMX681, a 10-bit Bayer sensor
on a two-lane CSI-2 bus. It offers a single 3844x2640 mode at 30 fps and
controls for exposure, analogue and digital gain, vertical blanking,
both flips and the sensor's test patterns. The part is enumerated as
ACPI device SONY0681 on Intel platforms and by the sony,imx681
compatible elsewhere.

There is no public documentation for this sensor. The initialisation
sequence was recovered from I2C traces taken under Windows, so
imx681_init_regs[] keeps the writes whose meaning is not known; the
registers that are CCS are written by name instead. The pixel rate is
measured on the part rather than computed from the CSI-2 link, because
the pixel array is clocked from a second PLL - the comment above
IMX681_PIXEL_RATE records the measurement.

Signed-off-by: Andre Gilerson <andre.gilerson@gmail.com>
Assisted-by: Claude:claude-opus-5-5
Co-developed-by: Sergey Lebedev <lsa.uz@pm.me>
Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
Tested-by: German Pablo Lindo <germanpapulindez@gmail.com>
---
 MAINTAINERS                |    8 +
 drivers/media/i2c/Kconfig  |   10 +
 drivers/media/i2c/Makefile |    1 +
 drivers/media/i2c/imx681.c | 1032 ++++++++++++++++++++++++++++++++++++
 4 files changed, 1051 insertions(+)
 create mode 100644 drivers/media/i2c/imx681.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 4cc4a2dc6d3..580e36a3b6d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25609,6 +25609,14 @@ S:=09Maintained
 F:=09Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
 F:=09drivers/media/i2c/imx678.c
=20
+SONY IMX681 SENSOR DRIVER
+M:=09Andre Gilerson <andre.gilerson@gmail.com>
+M:=09Sergey Lebedev <lsa.uz@pm.me>
+L:=09linux-media@vger.kernel.org
+S:=09Maintained
+F:=09Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml
+F:=09drivers/media/i2c/imx681.c
+
 SONY MEMORYSTICK SUBSYSTEM
 M:=09Maxim Levitsky <maximlevitsky@gmail.com>
 M:=09Alex Dubov <oakad@yahoo.com>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 4d994647916..c759a2d2398 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -321,6 +321,16 @@ config VIDEO_IMX678
 =09  To compile this driver as a module, choose M here: the
 =09  module will be called imx678.
=20
+config VIDEO_IMX681
+=09tristate "Sony IMX681 sensor support"
+=09select V4L2_CCI_I2C
+=09help
+=09  This is a Video4Linux2 sensor driver for the Sony
+=09  IMX681 camera.
+
+=09  To compile this driver as a module, choose M here: the
+=09  module will be called imx681.
+
 config VIDEO_MAX9271_LIB
 =09tristate
=20
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index fd1cb25718c..98bcecf0c43 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -64,6 +64,7 @@ obj-$(CONFIG_VIDEO_IMX412) +=3D imx412.o
 obj-$(CONFIG_VIDEO_IMX415) +=3D imx415.o
 obj-$(CONFIG_VIDEO_IMX678) +=3D imx678.o
 obj-$(CONFIG_VIDEO_IMX471) +=3D imx471.o
+obj-$(CONFIG_VIDEO_IMX681) +=3D imx681.o
 obj-$(CONFIG_VIDEO_IR_I2C) +=3D ir-kbd-i2c.o
 obj-$(CONFIG_VIDEO_ISL7998X) +=3D isl7998x.o
 obj-$(CONFIG_VIDEO_IT6625) +=3D it6625.o
diff --git a/drivers/media/i2c/imx681.c b/drivers/media/i2c/imx681.c
new file mode 100644
index 00000000000..06fdf1856ae
--- /dev/null
+++ b/drivers/media/i2c/imx681.c
@@ -0,0 +1,1032 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Sony IMX681 CMOS Image Sensor Driver
+ *
+ * Front camera on Surface Pro 11 Business (Intel/Lunar Lake).
+ * Register sequences reverse-engineered from Windows I2C traces.
+ *
+ * Copyright (C) 2025
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/property.h>
+#include <linux/regulator/consumer.h>
+
+#include <media/v4l2-cci.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+
+/* Chip ID register and expected value */
+#define IMX681_REG_CHIP_ID=09=09CCI_REG16(0x0016)
+#define IMX681_CHIP_ID=09=09=090x0681
+
+/* Mode select */
+#define IMX681_REG_MODE_SELECT=09=09CCI_REG8(0x0100)
+#define IMX681_MODE_STANDBY=09=090x00
+#define IMX681_MODE_STREAMING=09=090x01
+
+/* Exposure (coarse integration time, 24-bit) */
+#define IMX681_REG_EXPOSURE=09=09CCI_REG24(0x0229)
+/*
+ * The external clock frequency, in MHz, as a Q8.8 fixed-point number: the
+ * sensor takes 19.2 MHz as 19 in the high byte and 0.2 * 256 in the low o=
ne.
+ */
+#define IMX681_XCLK_FREQ=09=0919200000
+#define IMX681_XCLK_FREQ_ENC=09=09((IMX681_XCLK_FREQ / 1000000) << 8 | \
+=09=09=09=09=09 (IMX681_XCLK_FREQ % 1000000) * 256 / 1000000)
+
+#define IMX681_EXPOSURE_MIN=09=094
+/* The exposure may not come within this many lines of the frame length. *=
/
+#define IMX681_EXPOSURE_MARGIN=09=094
+#define IMX681_EXPOSURE_DEFAULT=09=09IMX681_EXPOSURE_MIN
+
+/* Analog gain */
+#define IMX681_REG_ANALOG_GAIN=09=09CCI_REG16(0x0204)
+#define IMX681_ANA_GAIN_MIN=09=090
+#define IMX681_ANA_GAIN_MAX=09=09960=09/* 16x, where the analogue stage en=
ds */
+#define IMX681_ANA_GAIN_DEFAULT=09=090
+
+/* Digital gain */
+#define IMX681_REG_DIGITAL_GAIN=09=09CCI_REG16(0x020E)
+#define IMX681_DIG_GAIN_MIN=09=090x0100=09/* 1.0x */
+#define IMX681_DIG_GAIN_MAX=09=090x0FFF
+#define IMX681_DIG_GAIN_DEFAULT=09=090x0100
+
+/* Test pattern, and the colour the solid-colour mode shows */
+#define IMX681_REG_TEST_PATTERN=09=09CCI_REG16(0x0600)
+#define IMX681_REG_TESTP_RED=09=09CCI_REG16(0x0602)
+#define IMX681_REG_TESTP_GREENR=09=09CCI_REG16(0x0604)
+#define IMX681_REG_TESTP_BLUE=09=09CCI_REG16(0x0606)
+#define IMX681_REG_TESTP_GREENB=09=09CCI_REG16(0x0608)
+#define IMX681_TESTP_COLOUR_MIN=09=090
+#define IMX681_TESTP_COLOUR_MAX=09=090x03ff
+#define IMX681_TESTP_COLOUR_STEP=091
+
+/*
+ * Frame length and exposure are 24-bit and at vendor addresses; everythin=
g
+ * else this driver touches is a CCS register at its CCS address, and is
+ * named for it here.
+ */
+#define IMX681_REG_FRAME_LENGTH=09=09CCI_REG24(0x033D)
+#define IMX681_REG_LINE_LENGTH=09=09CCI_REG16(0x0342)
+#define IMX681_REG_ORIENTATION=09=09CCI_REG8(0x0101)
+#define IMX681_REG_CSI_SIGNALING_MODE=09CCI_REG8(0x0111)
+#define IMX681_REG_EXTCLK_FREQ_MHZ=09CCI_REG16(0x0136)
+#define IMX681_REG_PLL_MULTIPLIER=09CCI_REG16(0x0306)
+#define IMX681_REG_OP_PRE_PLL_CLK_DIV=09CCI_REG16(0x030c)
+#define IMX681_REG_OP_PLL_MULTIPLIER=09CCI_REG16(0x030e)
+#define IMX681_REG_X_ADDR_START=09=09CCI_REG16(0x0344)
+#define IMX681_REG_Y_ADDR_START=09=09CCI_REG16(0x0346)
+#define IMX681_REG_X_ADDR_END=09=09CCI_REG16(0x0348)
+#define IMX681_REG_Y_ADDR_END=09=09CCI_REG16(0x034a)
+#define IMX681_REG_X_OUTPUT_SIZE=09CCI_REG16(0x034c)
+#define IMX681_REG_Y_OUTPUT_SIZE=09CCI_REG16(0x034e)
+#define IMX681_REG_DIGITAL_CROP_WIDTH=09CCI_REG16(0x040c)
+#define IMX681_REG_DIGITAL_CROP_HEIGHT=09CCI_REG16(0x040e)
+
+/* PLL, as the Windows traces configure it and the part reads back. */
+#define IMX681_PLL_MULTIPLIER=09=09225
+#define IMX681_OP_PRE_PLL_CLK_DIV=093
+#define IMX681_OP_PLL_MULTIPLIER=09303
+
+/*
+ * Where the read-out window sits in the pixel array, and how much array
+ * there is. The bounds are the part's own answer: X_ADDR_MIN, X_ADDR_MAX,
+ * Y_ADDR_MIN and Y_ADDR_MAX at the CCS addresses read 8, 4039, 64 and 308=
7,
+ * so 4032x3024 of readable pixels at (8, 64), and the window below sits
+ * inside that. What lies beyond the readable area is not documented, so t=
he
+ * native size is the smallest rectangle that contains it.
+ */
+#define IMX681_CROP_X_START=09=09100
+#define IMX681_CROP_Y_START=09=09256
+#define IMX681_PIXEL_ARRAY_LEFT=09=098
+#define IMX681_PIXEL_ARRAY_TOP=09=0964
+#define IMX681_PIXEL_ARRAY_WIDTH=094032
+#define IMX681_PIXEL_ARRAY_HEIGHT=093024
+#define IMX681_NATIVE_WIDTH=09=094040
+#define IMX681_NATIVE_HEIGHT=09=093088
+
+/* Image dimensions =E2=80=94 native sensor output */
+#define IMX681_WIDTH=09=09=093844
+#define IMX681_HEIGHT=09=09=092640
+#define IMX681_LINE_LENGTH_PCK=09=097552=09/* 0x1D80 */
+#define IMX681_FRAME_LENGTH_LINES=093177=09/* 0x0C69 */
+#define IMX681_FRAME_LENGTH_MAX=09=090xFFFF=09/* 24-bit reg, limit to 16-b=
it */
+
+/* MIPI lanes */
+#define IMX681_NUM_LANES=09=092
+
+/*
+ * Link frequency derived from PLL settings in Windows trace:
+ * EXCK=3D19.2MHz, PLL2_MUL=3D303, PLL2_PRE_DIV=3D3
+ * OP output =3D 19.2 * 303 / 3 =3D 1939.2 MHz (MIPI bit rate)
+ * Link freq =3D 1939.2 / 2 (DDR) =3D 969.6 MHz
+ */
+#define IMX681_LINK_FREQ=09=09969600000LL
+
+/*
+ * The pixel rate cannot be derived from the CSI-2 link: this part runs tw=
o
+ * PLLs, and the pixel array is clocked from the video-timing one while th=
e
+ * link is clocked from the other. It cannot be derived from the video-tim=
ing
+ * PLL either, because these registers are at the CCS addresses without
+ * having the CCS meaning. Read back from the part at its operating point
+ * they are PRE_PLL_CLK_DIV 2 and PLL_MULTIPLIER 225, so a 2160 MHz VCO, t=
hen
+ * VT_SYS_CLK_DIV 2 and VT_PIX_CLK_DIV 6 - by the CCS formula 180 MHz, whi=
ch
+ * would be 7.5 fps. The sensor runs at 30.
+ *
+ * So it is measured: LINE_LENGTH_PCK x FRAME_LENGTH_LINES x the frame rat=
e
+ * the part achieves, which is 29.95 fps over 300 frames and 720 MHz.
+ */
+#define IMX681_PIXEL_RATE=09=09720000000LL
+
+/* Power-on delay after reset deassert */
+#define IMX681_RESET_DELAY_US=09=091000
+#define IMX681_RESET_DELAY_RANGE_US=091000
+
+/* Post-standby-cancel stabilisation delays */
+#define IMX681_INIT_DELAY_US=09=0910000
+
+#define IMAGE_PAD=09=09=090
+
+static const s64 imx681_link_frequencies[] =3D {
+=09IMX681_LINK_FREQ,
+};
+
+/*
+ * Sensor init register sequence, captured from Windows I2C traces.
+ * This configures the sensor for 3844x2640 RAW10 output at ~30fps
+ * with 2-lane MIPI CSI-2, 19.2MHz input clock.
+ */
+static const struct cci_reg_sequence imx681_init_regs[] =3D {
+=09{ IMX681_REG_EXTCLK_FREQ_MHZ, IMX681_XCLK_FREQ_ENC },
+=09/* Vendor specific configuration */
+=09{ CCI_REG16(0x002C), 0x0505 },
+=09/* 0x02 is D-PHY, which is the only mode this part offers. */
+=09{ IMX681_REG_CSI_SIGNALING_MODE, 0x02 },
+=09/* Vendor access unlock sequence */
+=09{ CCI_REG8(0x30EB),  0x05 },
+=09{ CCI_REG8(0x30EB),  0x0C },
+=09/* Vendor specific */
+=09{ CCI_REG16(0x300A), 0xFFFF },
+=09{ CCI_REG16(0x3532), 0xFFFF },
+=09/*
+=09 * The analogue crop, its digital counterpart and the output size, at
+=09 * the CCS addresses. The traces wrote these as overlapping partial
+=09 * writes - 0x0345 and 0x0349 carry only the low byte of a 16-bit
+=09 * register, so the window was right only while the high bytes held
+=09 * their reset values. Written whole here, and the values read back
+=09 * from the part at the operating point agree: the window is
+=09 * 3943 - 100 + 1 by 2895 - 256 + 1, which is the output size.
+=09 */
+=09{ IMX681_REG_X_ADDR_START, IMX681_CROP_X_START },
+=09{ IMX681_REG_Y_ADDR_START, IMX681_CROP_Y_START },
+=09{ IMX681_REG_X_ADDR_END, IMX681_CROP_X_START + IMX681_WIDTH - 1 },
+=09{ IMX681_REG_Y_ADDR_END, IMX681_CROP_Y_START + IMX681_HEIGHT - 1 },
+=09{ IMX681_REG_DIGITAL_CROP_WIDTH, IMX681_WIDTH },
+=09{ IMX681_REG_DIGITAL_CROP_HEIGHT, IMX681_HEIGHT },
+=09{ IMX681_REG_X_OUTPUT_SIZE, IMX681_WIDTH },
+=09{ IMX681_REG_Y_OUTPUT_SIZE, IMX681_HEIGHT },
+=09/*
+=09 * Both of these were partial writes in the traces too: 0x0307 is the
+=09 * low byte of PLL_MULTIPLIER and 0x030d the low byte of
+=09 * OP_PRE_PLL_CLK_DIV, and each was right only while its high byte
+=09 * held the reset value. Written whole, and the part reads back
+=09 * 225, 3 and 303 at the operating point either way.
+=09 */
+=09{ IMX681_REG_PLL_MULTIPLIER, IMX681_PLL_MULTIPLIER },
+=09{ IMX681_REG_OP_PRE_PLL_CLK_DIV, IMX681_OP_PRE_PLL_CLK_DIV },
+=09{ IMX681_REG_OP_PLL_MULTIPLIER, IMX681_OP_PLL_MULTIPLIER },
+=09/* Vendor specific registers */
+=09{ CCI_REG8(0x7E9B),  0x02 },
+=09{ CCI_REG8(0x0368),  0x00 },
+=09{ CCI_REG8(0xD383),  0x01 },
+};
+
+/*
+ * The CCS numbering, which this part follows: 1 solid colour, 2 colour ba=
rs,
+ * 3 bars fading to grey. Mode 4, PN9, is not offered because it produces =
a
+ * black frame on this sensor where 2 and 3 produce their patterns, and
+ * TEST_PATTERN_CAPABILITY reads zero here so it cannot be asked.
+ */
+static const char * const imx681_test_pattern_menu[] =3D {
+=09"Disabled",
+=09"Solid Colour",
+=09"Eight Vertical Colour Bars",
+=09"Colour Bars With Fade to Grey",
+};
+
+/*
+ * The pixel array reads out RGGB. Mirroring moves the Bayer phase by one
+ * column and flipping by one row, so the code the sensor delivers follows
+ * the two controls: index =3D vflip << 1 | hflip.
+ */
+static const u32 imx681_mbus_codes[] =3D {
+=09MEDIA_BUS_FMT_SRGGB10_1X10,
+=09MEDIA_BUS_FMT_SGRBG10_1X10,
+=09MEDIA_BUS_FMT_SGBRG10_1X10,
+=09MEDIA_BUS_FMT_SBGGR10_1X10,
+};
+
+/* Regulator supplies */
+static const char * const imx681_supply_names[] =3D {
+=09"avdd",=09=09/* Analog 2.8V */
+=09"dvdd",=09=09/* Digital 1.05V */
+=09"dovdd",=09/* I/O 1.8V */
+};
+
+struct imx681 {
+=09struct device *dev;
+=09struct regmap *cci;
+
+=09struct v4l2_subdev sd;
+=09struct media_pad pad;
+
+=09struct clk *xclk;
+=09struct gpio_desc *reset_gpio;
+=09struct regulator_bulk_data supplies[ARRAY_SIZE(imx681_supply_names)];
+
+=09/* V4L2 Controls */
+=09struct v4l2_ctrl_handler ctrl_handler;
+=09struct v4l2_ctrl *exposure;
+=09struct v4l2_ctrl *vblank;
+=09struct v4l2_ctrl *hblank;
+=09struct v4l2_ctrl *hflip;
+=09struct v4l2_ctrl *vflip;
+
+=09unsigned long link_freq_bitmap;
+};
+
+static inline struct imx681 *to_imx681(struct v4l2_subdev *sd)
+{
+=09return container_of_const(sd, struct imx681, sd);
+}
+
+static int imx681_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+=09struct imx681 *imx681 =3D container_of(ctrl->handler, struct imx681,
+=09=09=09=09=09     ctrl_handler);
+=09s64 exposure_max;
+=09int pm_status;
+=09int ret =3D 0;
+
+=09/* Update exposure max when VBLANK changes (even when not streaming) */
+=09if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
+=09=09exposure_max =3D IMX681_HEIGHT + ctrl->val - IMX681_EXPOSURE_MARGIN;
+=09=09ret =3D __v4l2_ctrl_modify_range(imx681->exposure,
+=09=09=09=09=09       IMX681_EXPOSURE_MIN, exposure_max,
+=09=09=09=09=09       1, IMX681_EXPOSURE_DEFAULT);
+=09=09if (ret)
+=09=09=09return ret;
+=09}
+
+=09/*
+=09 * 1 with a reference taken, 0 if the device is not active, or -EINVAL
+=09 * if runtime PM is unavailable. Only the 0 means there is nothing to
+=09 * do: without runtime PM the sensor is powered from probe and never
+=09 * suspended, so the write still has to go out - but no reference was
+=09 * taken then, and none may be dropped.
+=09 */
+=09pm_status =3D pm_runtime_get_if_active(imx681->dev);
+=09if (!pm_status)
+=09=09return 0;
+
+=09switch (ctrl->id) {
+=09case V4L2_CID_VBLANK:
+=09=09ret =3D cci_write(imx681->cci, IMX681_REG_FRAME_LENGTH,
+=09=09=09=09IMX681_HEIGHT + ctrl->val, NULL);
+=09=09break;
+
+=09case V4L2_CID_EXPOSURE:
+=09=09ret =3D cci_write(imx681->cci, IMX681_REG_EXPOSURE, ctrl->val,
+=09=09=09=09NULL);
+=09=09break;
+
+=09case V4L2_CID_ANALOGUE_GAIN:
+=09=09/* Gain formula: gain =3D 1024/(1024-code); code 960 is 16x. */
+=09=09ret =3D cci_write(imx681->cci, IMX681_REG_ANALOG_GAIN, ctrl->val,
+=09=09=09=09NULL);
+=09=09break;
+
+=09case V4L2_CID_DIGITAL_GAIN:
+=09=09ret =3D cci_write(imx681->cci, IMX681_REG_DIGITAL_GAIN, ctrl->val,
+=09=09=09=09NULL);
+=09=09break;
+
+=09case V4L2_CID_HFLIP:
+=09case V4L2_CID_VFLIP:
+=09=09/*
+=09=09 * Read from imx681_start_streaming(). These are grabbed while
+=09=09 * streaming, so this runs only when the part is idle and the
+=09=09 * value is applied at the next stream start.
+=09=09 */
+=09=09break;
+
+=09case V4L2_CID_TEST_PATTERN:
+=09=09ret =3D cci_write(imx681->cci, IMX681_REG_TEST_PATTERN,
+=09=09=09=09ctrl->val, NULL);
+=09=09break;
+
+=09case V4L2_CID_TEST_PATTERN_RED:
+=09=09ret =3D cci_write(imx681->cci, IMX681_REG_TESTP_RED, ctrl->val,
+=09=09=09=09NULL);
+=09=09break;
+
+=09case V4L2_CID_TEST_PATTERN_GREENR:
+=09=09ret =3D cci_write(imx681->cci, IMX681_REG_TESTP_GREENR,
+=09=09=09=09ctrl->val, NULL);
+=09=09break;
+
+=09case V4L2_CID_TEST_PATTERN_BLUE:
+=09=09ret =3D cci_write(imx681->cci, IMX681_REG_TESTP_BLUE, ctrl->val,
+=09=09=09=09NULL);
+=09=09break;
+
+=09case V4L2_CID_TEST_PATTERN_GREENB:
+=09=09ret =3D cci_write(imx681->cci, IMX681_REG_TESTP_GREENB,
+=09=09=09=09ctrl->val, NULL);
+=09=09break;
+
+=09default:
+=09=09break;
+=09}
+
+=09if (pm_status > 0)
+=09=09pm_runtime_put(imx681->dev);
+
+=09return ret;
+}
+
+static const struct v4l2_ctrl_ops imx681_ctrl_ops =3D {
+=09.s_ctrl =3D imx681_set_ctrl,
+};
+
+static u32 imx681_get_format_code(struct imx681 *imx681)
+{
+=09return imx681_mbus_codes[(imx681->vflip->val ? 2 : 0) |
+=09=09=09=09 (imx681->hflip->val ? 1 : 0)];
+}
+
+static int imx681_enum_mbus_code(struct v4l2_subdev *sd,
+=09=09=09=09 struct v4l2_subdev_state *state,
+=09=09=09=09 struct v4l2_subdev_mbus_code_enum *code)
+{
+=09struct imx681 *imx681 =3D to_imx681(sd);
+
+=09if (code->index > 0)
+=09=09return -EINVAL;
+
+=09code->code =3D imx681_get_format_code(imx681);
+
+=09return 0;
+}
+
+static bool imx681_is_valid_mbus_code(struct imx681 *imx681, u32 code)
+{
+=09return code =3D=3D imx681_get_format_code(imx681);
+}
+
+static int imx681_enum_frame_size(struct v4l2_subdev *sd,
+=09=09=09=09  struct v4l2_subdev_state *state,
+=09=09=09=09  struct v4l2_subdev_frame_size_enum *fse)
+{
+=09if (fse->index > 0)
+=09=09return -EINVAL;
+
+=09if (!imx681_is_valid_mbus_code(to_imx681(sd), fse->code))
+=09=09return -EINVAL;
+
+=09fse->min_width =3D IMX681_WIDTH;
+=09fse->max_width =3D IMX681_WIDTH;
+=09fse->min_height =3D IMX681_HEIGHT;
+=09fse->max_height =3D IMX681_HEIGHT;
+
+=09return 0;
+}
+
+static int imx681_init_state(struct v4l2_subdev *sd,
+=09=09=09     struct v4l2_subdev_state *state)
+{
+=09struct v4l2_mbus_framefmt *format;
+
+=09format =3D v4l2_subdev_state_get_format(state, IMAGE_PAD);
+=09format->width =3D IMX681_WIDTH;
+=09format->height =3D IMX681_HEIGHT;
+=09format->code =3D imx681_get_format_code(to_imx681(sd));
+=09format->field =3D V4L2_FIELD_NONE;
+=09format->colorspace =3D V4L2_COLORSPACE_RAW;
+=09format->ycbcr_enc =3D V4L2_YCBCR_ENC_601;
+=09format->quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
+=09format->xfer_func =3D V4L2_XFER_FUNC_NONE;
+
+=09return 0;
+}
+
+/*
+ * There is nothing to configure on the part here - the size is fixed and =
the
+ * code follows the flips - but the stored format still has to be told whi=
ch
+ * Bayer order the flips have produced, or the pipeline validates the stat=
e
+ * against a code the sensor is no longer delivering.
+ */
+static int imx681_set_pad_format(struct v4l2_subdev *sd,
+=09=09=09=09 const struct v4l2_subdev_client_info *ci,
+=09=09=09=09 struct v4l2_subdev_state *state,
+=09=09=09=09 struct v4l2_subdev_format *fmt)
+{
+=09struct imx681 *imx681 =3D to_imx681(sd);
+=09struct v4l2_mbus_framefmt *format;
+
+=09fmt->format.width =3D IMX681_WIDTH;
+=09fmt->format.height =3D IMX681_HEIGHT;
+=09fmt->format.code =3D imx681_get_format_code(imx681);
+=09fmt->format.field =3D V4L2_FIELD_NONE;
+=09fmt->format.colorspace =3D V4L2_COLORSPACE_RAW;
+=09fmt->format.ycbcr_enc =3D V4L2_YCBCR_ENC_601;
+=09fmt->format.quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
+=09fmt->format.xfer_func =3D V4L2_XFER_FUNC_NONE;
+
+=09format =3D v4l2_subdev_state_get_format(state, fmt->pad);
+=09*format =3D fmt->format;
+
+=09return 0;
+}
+
+static int imx681_get_selection(struct v4l2_subdev *sd,
+=09=09=09=09const struct v4l2_subdev_client_info *ci,
+=09=09=09=09struct v4l2_subdev_state *state,
+=09=09=09=09struct v4l2_subdev_selection *sel)
+{
+=09switch (sel->target) {
+=09case V4L2_SEL_TGT_CROP:
+=09case V4L2_SEL_TGT_CROP_DEFAULT:
+=09=09sel->r.left =3D IMX681_CROP_X_START;
+=09=09sel->r.top =3D IMX681_CROP_Y_START;
+=09=09sel->r.width =3D IMX681_WIDTH;
+=09=09sel->r.height =3D IMX681_HEIGHT;
+=09=09return 0;
+=09case V4L2_SEL_TGT_CROP_BOUNDS:
+=09=09sel->r.left =3D IMX681_PIXEL_ARRAY_LEFT;
+=09=09sel->r.top =3D IMX681_PIXEL_ARRAY_TOP;
+=09=09sel->r.width =3D IMX681_PIXEL_ARRAY_WIDTH;
+=09=09sel->r.height =3D IMX681_PIXEL_ARRAY_HEIGHT;
+=09=09return 0;
+=09case V4L2_SEL_TGT_NATIVE_SIZE:
+=09=09sel->r.left =3D 0;
+=09=09sel->r.top =3D 0;
+=09=09sel->r.width =3D IMX681_NATIVE_WIDTH;
+=09=09sel->r.height =3D IMX681_NATIVE_HEIGHT;
+=09=09return 0;
+=09default:
+=09=09return -EINVAL;
+=09}
+}
+
+static int imx681_start_streaming(struct imx681 *imx681)
+{
+=09int ret;
+
+=09/*
+=09 * The orientation goes in before the register list, because the crop
+=09 * window in it is interpreted in the orientation then in force. The
+=09 * downstream driver had this write inside the list, ahead of the crop
+=09 * registers, for the same reason.
+=09 */
+=09ret =3D cci_write(imx681->cci, IMX681_REG_ORIENTATION,
+=09=09=09imx681->hflip->val | imx681->vflip->val << 1, NULL);
+=09if (ret)
+=09=09return ret;
+
+=09ret =3D cci_multi_reg_write(imx681->cci, imx681_init_regs,
+=09=09=09=09  ARRAY_SIZE(imx681_init_regs), NULL);
+=09if (ret) {
+=09=09dev_err(imx681->dev, "failed to write init regs: %d\n", ret);
+=09=09return ret;
+=09}
+
+=09/* Wait for sensor to stabilise after configuration */
+=09usleep_range(IMX681_INIT_DELAY_US, IMX681_INIT_DELAY_US + 1000);
+
+=09/*
+=09 * The blanking is the controls' to set, not the register list's:
+=09 * HBLANK gives the line length, and VBLANK the frame length through
+=09 * imx681_set_ctrl() below, along with the exposure and the gains.
+=09 */
+=09ret =3D cci_write(imx681->cci, IMX681_REG_LINE_LENGTH,
+=09=09=09IMX681_WIDTH + imx681->hblank->val, NULL);
+=09if (ret)
+=09=09return ret;
+
+=09ret =3D __v4l2_ctrl_handler_setup(imx681->sd.ctrl_handler);
+=09if (ret) {
+=09=09dev_err(imx681->dev, "failed to apply controls: %d\n", ret);
+=09=09return ret;
+=09}
+
+=09/* Start streaming */
+=09ret =3D cci_write(imx681->cci, IMX681_REG_MODE_SELECT,
+=09=09=09IMX681_MODE_STREAMING, NULL);
+=09if (ret) {
+=09=09dev_err(imx681->dev, "failed to start streaming: %d\n", ret);
+=09=09return ret;
+=09}
+
+=09return 0;
+}
+
+static int imx681_stop_streaming(struct imx681 *imx681)
+{
+=09int ret;
+
+=09ret =3D cci_write(imx681->cci, IMX681_REG_MODE_SELECT,
+=09=09=09IMX681_MODE_STANDBY, NULL);
+=09if (ret)
+=09=09dev_err(imx681->dev, "failed to stop streaming: %d\n", ret);
+
+=09return ret;
+}
+
+static int imx681_enable_streams(struct v4l2_subdev *sd,
+=09=09=09=09 struct v4l2_subdev_state *state,
+=09=09=09=09 u32 pad, u64 streams_mask)
+{
+=09struct imx681 *imx681 =3D to_imx681(sd);
+=09int ret;
+
+=09ret =3D pm_runtime_resume_and_get(imx681->dev);
+=09if (ret)
+=09=09return ret;
+
+=09ret =3D imx681_start_streaming(imx681);
+=09if (ret) {
+=09=09pm_runtime_put_autosuspend(imx681->dev);
+=09=09return ret;
+=09}
+
+=09/*
+=09 * The flips are read once, in imx681_start_streaming(), and they
+=09 * choose the media bus code. Accepting a change now would report
+=09 * success, leave the part as it is and leave the stored format
+=09 * naming a code the sensor is no longer delivering.
+=09 */
+=09__v4l2_ctrl_grab(imx681->hflip, true);
+=09__v4l2_ctrl_grab(imx681->vflip, true);
+
+=09return 0;
+}
+
+static int imx681_disable_streams(struct v4l2_subdev *sd,
+=09=09=09=09  struct v4l2_subdev_state *state,
+=09=09=09=09  u32 pad, u64 streams_mask)
+{
+=09struct imx681 *imx681 =3D to_imx681(sd);
+=09int ret;
+
+=09__v4l2_ctrl_grab(imx681->hflip, false);
+=09__v4l2_ctrl_grab(imx681->vflip, false);
+
+=09ret =3D imx681_stop_streaming(imx681);
+
+=09/* The reference goes back whether or not the part acknowledged. */
+=09pm_runtime_put_autosuspend(imx681->dev);
+
+=09return ret;
+}
+
+static const struct v4l2_subdev_video_ops imx681_video_ops =3D {
+=09.s_stream =3D v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_pad_ops imx681_pad_ops =3D {
+=09.enum_mbus_code =3D imx681_enum_mbus_code,
+=09.get_fmt =3D v4l2_subdev_get_fmt,
+=09.set_fmt =3D imx681_set_pad_format,
+=09.get_selection =3D imx681_get_selection,
+=09.enum_frame_size =3D imx681_enum_frame_size,
+=09.enable_streams =3D imx681_enable_streams,
+=09.disable_streams =3D imx681_disable_streams,
+};
+
+static const struct v4l2_subdev_ops imx681_subdev_ops =3D {
+=09.video =3D &imx681_video_ops,
+=09.pad =3D &imx681_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops imx681_internal_ops =3D {
+=09.init_state =3D imx681_init_state,
+};
+
+/* Power management */
+static int imx681_power_on(struct device *dev)
+{
+=09struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
+=09struct imx681 *imx681 =3D to_imx681(sd);
+=09int ret;
+
+=09ret =3D regulator_bulk_enable(ARRAY_SIZE(imx681_supply_names), imx681->=
supplies);
+=09if (ret) {
+=09=09dev_err(imx681->dev, "failed to enable regulators: %d\n", ret);
+=09=09return ret;
+=09}
+
+=09ret =3D clk_prepare_enable(imx681->xclk);
+=09if (ret) {
+=09=09dev_err(imx681->dev, "failed to enable clock: %d\n", ret);
+=09=09goto err_reg_disable;
+=09}
+
+=09/* Deassert reset (active low) */
+=09gpiod_set_value_cansleep(imx681->reset_gpio, 0);
+
+=09usleep_range(IMX681_RESET_DELAY_US,
+=09=09     IMX681_RESET_DELAY_US + IMX681_RESET_DELAY_RANGE_US);
+
+=09return 0;
+
+err_reg_disable:
+=09regulator_bulk_disable(ARRAY_SIZE(imx681_supply_names), imx681->supplie=
s);
+
+=09return ret;
+}
+
+static int imx681_power_off(struct device *dev)
+{
+=09struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
+=09struct imx681 *imx681 =3D to_imx681(sd);
+
+=09/* Assert reset */
+=09gpiod_set_value_cansleep(imx681->reset_gpio, 1);
+=09clk_disable_unprepare(imx681->xclk);
+=09regulator_bulk_disable(ARRAY_SIZE(imx681_supply_names), imx681->supplie=
s);
+
+=09return 0;
+}
+
+static int imx681_identify_module(struct imx681 *imx681)
+{
+=09u64 val;
+=09int ret;
+
+=09ret =3D cci_read(imx681->cci, IMX681_REG_CHIP_ID, &val, NULL);
+=09if (ret)
+=09=09return dev_err_probe(imx681->dev, ret,
+=09=09=09=09     "failed to read chip ID register 0x0016\n");
+
+=09if (val !=3D IMX681_CHIP_ID) {
+=09=09return dev_err_probe(imx681->dev, -EIO,
+=09=09=09=09     "chip ID mismatch: 0x%04llx !=3D 0x%04x\n",
+=09=09=09=09     val, IMX681_CHIP_ID);
+=09}
+
+=09return 0;
+}
+
+static int imx681_init_controls(struct imx681 *imx681)
+{
+=09struct v4l2_ctrl_handler *ctrl_hdlr =3D &imx681->ctrl_handler;
+=09struct v4l2_fwnode_device_properties props;
+=09struct v4l2_ctrl *link_freq;
+=09s64 hblank, vblank;
+=09int ret;
+
+=09ret =3D v4l2_fwnode_device_parse(imx681->dev, &props);
+=09if (ret)
+=09=09return ret;
+
+=09ret =3D v4l2_ctrl_handler_init(ctrl_hdlr, 16);
+=09if (ret)
+=09=09return ret;
+
+=09/* Pixel rate (read-only) */
+=09v4l2_ctrl_new_std(ctrl_hdlr, &imx681_ctrl_ops,
+=09=09=09  V4L2_CID_PIXEL_RATE, IMX681_PIXEL_RATE,
+=09=09=09  IMX681_PIXEL_RATE, 1, IMX681_PIXEL_RATE);
+
+=09/* Link frequency (read-only) */
+=09link_freq =3D v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx681_ctrl_ops,
+=09=09=09=09=09   V4L2_CID_LINK_FREQ,
+=09=09=09=09=09   __fls(imx681->link_freq_bitmap),
+=09=09=09=09=09   __ffs(imx681->link_freq_bitmap),
+=09=09=09=09=09   imx681_link_frequencies);
+=09if (link_freq)
+=09=09link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
+
+=09/* Horizontal blanking (read-only, fixed) */
+=09hblank =3D IMX681_LINE_LENGTH_PCK - IMX681_WIDTH;
+=09imx681->hblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx681_ctrl_ops,
+=09=09=09=09=09   V4L2_CID_HBLANK, hblank, hblank,
+=09=09=09=09=09   1, hblank);
+=09if (imx681->hblank)
+=09=09imx681->hblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
+
+=09/* Vertical blanking (writable to allow longer exposures) */
+=09vblank =3D IMX681_FRAME_LENGTH_LINES - IMX681_HEIGHT;
+=09imx681->vblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx681_ctrl_ops,
+=09=09=09=09=09   V4L2_CID_VBLANK, vblank,
+=09=09=09=09=09   IMX681_FRAME_LENGTH_MAX - IMX681_HEIGHT,
+=09=09=09=09=09   1, vblank);
+
+=09/* Exposure */
+=09imx681->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx681_ctrl_ops,
+=09=09=09=09=09     V4L2_CID_EXPOSURE,
+=09=09=09=09=09     IMX681_EXPOSURE_MIN,
+=09=09=09=09=09     IMX681_FRAME_LENGTH_LINES -
+=09=09=09=09=09     IMX681_EXPOSURE_MARGIN, 1,
+=09=09=09=09=09     IMX681_EXPOSURE_DEFAULT);
+
+=09/*
+=09 * Both flips move the Bayer phase, so the media bus code changes with
+=09 * them and the layout flag has to say so.
+=09 */
+=09imx681->hflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx681_ctrl_ops,
+=09=09=09=09=09  V4L2_CID_HFLIP, 0, 1, 1, 0);
+=09imx681->vflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx681_ctrl_ops,
+=09=09=09=09=09  V4L2_CID_VFLIP, 0, 1, 1, 0);
+=09if (imx681->hflip)
+=09=09imx681->hflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+=09if (imx681->vflip)
+=09=09imx681->vflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+
+=09/* Analog gain */
+=09v4l2_ctrl_new_std(ctrl_hdlr, &imx681_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
+=09=09=09  IMX681_ANA_GAIN_MIN, IMX681_ANA_GAIN_MAX, 1,
+=09=09=09  IMX681_ANA_GAIN_DEFAULT);
+
+=09/* Digital gain */
+=09v4l2_ctrl_new_std(ctrl_hdlr, &imx681_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
+=09=09=09  IMX681_DIG_GAIN_MIN, IMX681_DIG_GAIN_MAX, 1,
+=09=09=09  IMX681_DIG_GAIN_DEFAULT);
+
+=09/* Test pattern */
+=09v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &imx681_ctrl_ops,
+=09=09=09=09     V4L2_CID_TEST_PATTERN,
+=09=09=09=09     ARRAY_SIZE(imx681_test_pattern_menu) - 1,
+=09=09=09=09     0, 0, imx681_test_pattern_menu);
+
+=09/*
+=09 * The solid-colour mode shows whatever is in these, and they reset to
+=09 * zero - so without them the mode this driver advertises can only
+=09 * ever produce a black frame. Default to white, as imx219 does.
+=09 */
+=09v4l2_ctrl_new_std(ctrl_hdlr, &imx681_ctrl_ops,
+=09=09=09  V4L2_CID_TEST_PATTERN_RED, IMX681_TESTP_COLOUR_MIN,
+=09=09=09  IMX681_TESTP_COLOUR_MAX, IMX681_TESTP_COLOUR_STEP,
+=09=09=09  IMX681_TESTP_COLOUR_MAX);
+=09v4l2_ctrl_new_std(ctrl_hdlr, &imx681_ctrl_ops,
+=09=09=09  V4L2_CID_TEST_PATTERN_GREENR, IMX681_TESTP_COLOUR_MIN,
+=09=09=09  IMX681_TESTP_COLOUR_MAX, IMX681_TESTP_COLOUR_STEP,
+=09=09=09  IMX681_TESTP_COLOUR_MAX);
+=09v4l2_ctrl_new_std(ctrl_hdlr, &imx681_ctrl_ops,
+=09=09=09  V4L2_CID_TEST_PATTERN_BLUE, IMX681_TESTP_COLOUR_MIN,
+=09=09=09  IMX681_TESTP_COLOUR_MAX, IMX681_TESTP_COLOUR_STEP,
+=09=09=09  IMX681_TESTP_COLOUR_MAX);
+=09v4l2_ctrl_new_std(ctrl_hdlr, &imx681_ctrl_ops,
+=09=09=09  V4L2_CID_TEST_PATTERN_GREENB, IMX681_TESTP_COLOUR_MIN,
+=09=09=09  IMX681_TESTP_COLOUR_MAX, IMX681_TESTP_COLOUR_STEP,
+=09=09=09  IMX681_TESTP_COLOUR_MAX);
+
+=09if (ctrl_hdlr->error) {
+=09=09ret =3D dev_err_probe(imx681->dev, ctrl_hdlr->error,
+=09=09=09=09    "control init failed\n");
+=09=09goto error;
+=09}
+
+=09ret =3D v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx681_ctrl_ops,
+=09=09=09=09=09      &props);
+=09if (ret)
+=09=09goto error;
+
+=09imx681->sd.ctrl_handler =3D ctrl_hdlr;
+
+=09return 0;
+
+error:
+=09v4l2_ctrl_handler_free(ctrl_hdlr);
+
+=09return ret;
+}
+
+static int imx681_parse_endpoint(struct imx681 *imx681)
+{
+=09struct fwnode_handle *fwnode =3D dev_fwnode(imx681->dev);
+=09struct v4l2_fwnode_endpoint bus_cfg =3D {
+=09=09.bus_type =3D V4L2_MBUS_CSI2_DPHY,
+=09};
+=09struct fwnode_handle *ep;
+=09int ret;
+
+=09ep =3D fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);
+
+=09ret =3D v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+=09fwnode_handle_put(ep);
+=09if (ret)
+=09=09return dev_err_probe(imx681->dev, ret,
+=09=09=09=09     "failed to parse endpoint\n");
+
+=09if (bus_cfg.bus.mipi_csi2.num_data_lanes !=3D IMX681_NUM_LANES) {
+=09=09ret =3D dev_err_probe(imx681->dev, -EINVAL,
+=09=09=09=09    "expected %d data lanes, got %d\n",
+=09=09=09=09    IMX681_NUM_LANES,
+=09=09=09=09    bus_cfg.bus.mipi_csi2.num_data_lanes);
+=09=09goto done;
+=09}
+
+=09ret =3D v4l2_link_freq_to_bitmap(imx681->dev,
+=09=09=09=09       bus_cfg.link_frequencies,
+=09=09=09=09       bus_cfg.nr_of_link_frequencies,
+=09=09=09=09       imx681_link_frequencies,
+=09=09=09=09       ARRAY_SIZE(imx681_link_frequencies),
+=09=09=09=09       &imx681->link_freq_bitmap);
+=09if (ret)
+=09=09ret =3D dev_err_probe(imx681->dev, ret,
+=09=09=09=09    "link frequency mismatch\n");
+
+done:
+=09v4l2_fwnode_endpoint_free(&bus_cfg);
+
+=09return ret;
+}
+
+static int imx681_probe(struct i2c_client *client)
+{
+=09struct imx681 *imx681;
+=09unsigned long xclk_freq;
+=09int ret;
+
+=09imx681 =3D devm_kzalloc(&client->dev, sizeof(*imx681), GFP_KERNEL);
+=09if (!imx681)
+=09=09return -ENOMEM;
+
+=09imx681->dev =3D &client->dev;
+
+=09/* Initialise V4L2 subdev */
+=09v4l2_i2c_subdev_init(&imx681->sd, client, &imx681_subdev_ops);
+
+=09/* Initialise CCI regmap for 16-bit register addresses */
+=09imx681->cci =3D devm_cci_regmap_init_i2c(client, 16);
+=09if (IS_ERR(imx681->cci))
+=09=09return dev_err_probe(imx681->dev, PTR_ERR(imx681->cci),
+=09=09=09=09     "failed to init CCI\n");
+
+=09imx681->xclk =3D devm_v4l2_sensor_clk_get(imx681->dev, NULL);
+=09if (IS_ERR(imx681->xclk))
+=09=09return dev_err_probe(imx681->dev, PTR_ERR(imx681->xclk),
+=09=09=09=09     "failed to get clock\n");
+
+=09/*
+=09 * Both PLLs in imx681_init_regs[] and the value written to
+=09 * EXTCLK_FREQUENCY_MHZ assume this rate.
+=09 */
+=09xclk_freq =3D clk_get_rate(imx681->xclk);
+=09if (xclk_freq !=3D IMX681_XCLK_FREQ)
+=09=09return dev_err_probe(imx681->dev, -EINVAL,
+=09=09=09=09     "external clock %lu Hz not supported, expected %u Hz\n",
+=09=09=09=09     xclk_freq, IMX681_XCLK_FREQ);
+
+=09/* Get regulators */
+=09for (unsigned int i =3D 0; i < ARRAY_SIZE(imx681_supply_names); i++)
+=09=09imx681->supplies[i].supply =3D imx681_supply_names[i];
+
+=09ret =3D devm_regulator_bulk_get(imx681->dev, ARRAY_SIZE(imx681_supply_n=
ames),
+=09=09=09=09      imx681->supplies);
+=09if (ret)
+=09=09return dev_err_probe(imx681->dev, ret,
+=09=09=09=09     "failed to get regulators\n");
+
+=09/* Get reset GPIO (optional) */
+=09imx681->reset_gpio =3D devm_gpiod_get_optional(imx681->dev, "reset",
+=09=09=09=09=09=09     GPIOD_OUT_HIGH);
+=09if (IS_ERR(imx681->reset_gpio))
+=09=09return dev_err_probe(imx681->dev,
+=09=09=09=09     PTR_ERR(imx681->reset_gpio),
+=09=09=09=09     "failed to get reset GPIO\n");
+
+=09/* Parse CSI-2 endpoint */
+=09ret =3D imx681_parse_endpoint(imx681);
+=09if (ret)
+=09=09return dev_err_probe(imx681->dev, ret,
+=09=09=09=09     "endpoint parse failed\n");
+
+=09/* Power on and verify chip ID */
+=09ret =3D imx681_power_on(imx681->dev);
+=09if (ret)
+=09=09return dev_err_probe(imx681->dev, ret, "power on failed\n");
+
+=09ret =3D imx681_identify_module(imx681);
+=09if (ret)
+=09=09goto error_power_off;
+
+=09/* Enable runtime PM */
+=09pm_runtime_set_active(imx681->dev);
+=09pm_runtime_enable(imx681->dev);
+=09pm_runtime_set_autosuspend_delay(imx681->dev, 1000);
+=09pm_runtime_use_autosuspend(imx681->dev);
+
+=09/* Init V4L2 controls */
+=09ret =3D imx681_init_controls(imx681);
+=09if (ret)
+=09=09goto error_pm;
+
+=09/* Setup subdev */
+=09imx681->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
+=09imx681->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
+=09imx681->sd.internal_ops =3D &imx681_internal_ops;
+
+=09/* Init media entity */
+=09imx681->pad.flags =3D MEDIA_PAD_FL_SOURCE;
+=09ret =3D media_entity_pads_init(&imx681->sd.entity, 1, &imx681->pad);
+=09if (ret) {
+=09=09ret =3D dev_err_probe(imx681->dev, ret,
+=09=09=09=09    "media entity init failed\n");
+=09=09goto error_handler_free;
+=09}
+
+=09imx681->sd.state_lock =3D imx681->ctrl_handler.lock;
+=09ret =3D v4l2_subdev_init_finalize(&imx681->sd);
+=09if (ret < 0) {
+=09=09ret =3D dev_err_probe(imx681->dev, ret,
+=09=09=09=09    "subdev init finalize failed\n");
+=09=09goto error_media_entity;
+=09}
+
+=09ret =3D v4l2_async_register_subdev_sensor(&imx681->sd);
+=09if (ret < 0) {
+=09=09ret =3D dev_err_probe(imx681->dev, ret,
+=09=09=09=09    "async register subdev failed\n");
+=09=09goto error_subdev_cleanup;
+=09}
+
+=09pm_runtime_idle(imx681->dev);
+
+=09return 0;
+
+error_subdev_cleanup:
+=09v4l2_subdev_cleanup(&imx681->sd);
+error_media_entity:
+=09media_entity_cleanup(&imx681->sd.entity);
+error_handler_free:
+=09v4l2_ctrl_handler_free(imx681->sd.ctrl_handler);
+error_pm:
+=09pm_runtime_dont_use_autosuspend(imx681->dev);
+=09pm_runtime_disable(imx681->dev);
+=09pm_runtime_set_suspended(imx681->dev);
+error_power_off:
+=09imx681_power_off(imx681->dev);
+
+=09return ret;
+}
+
+static void imx681_remove(struct i2c_client *client)
+{
+=09struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
+=09struct imx681 *imx681 =3D to_imx681(sd);
+
+=09v4l2_async_unregister_subdev(sd);
+=09v4l2_subdev_cleanup(&imx681->sd);
+=09media_entity_cleanup(&sd->entity);
+=09v4l2_ctrl_handler_free(imx681->sd.ctrl_handler);
+
+=09pm_runtime_disable(imx681->dev);
+=09if (!pm_runtime_status_suspended(imx681->dev)) {
+=09=09imx681_power_off(imx681->dev);
+=09=09pm_runtime_set_suspended(imx681->dev);
+=09}
+=09pm_runtime_dont_use_autosuspend(imx681->dev);
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(imx681_pm_ops, imx681_power_off,
+=09=09=09=09 imx681_power_on, NULL);
+
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id imx681_acpi_ids[] =3D {
+=09{ "SONY0681" },
+=09{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(acpi, imx681_acpi_ids);
+#endif
+
+static const struct of_device_id imx681_dt_ids[] =3D {
+=09{ .compatible =3D "sony,imx681" },
+=09{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx681_dt_ids);
+
+static struct i2c_driver imx681_i2c_driver =3D {
+=09.driver =3D {
+=09=09.name =3D "imx681",
+=09=09.pm =3D pm_ptr(&imx681_pm_ops),
+=09=09.acpi_match_table =3D ACPI_PTR(imx681_acpi_ids),
+=09=09.of_match_table =3D imx681_dt_ids,
+=09},
+=09.probe =3D imx681_probe,
+=09.remove =3D imx681_remove,
+};
+module_i2c_driver(imx681_i2c_driver);
+
+MODULE_DESCRIPTION("Sony IMX681 CMOS Image Sensor Driver");
+MODULE_AUTHOR("Andre Gilerson <andre.gilerson@gmail.com>");
+MODULE_LICENSE("GPL");
--=20
2.54.0 (Apple Git-157)


