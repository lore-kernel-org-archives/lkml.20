Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90C83939C9;
	Mon, 21 Sep 2026 19:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790018730; cv=none; b=q5DRPWKEOQAqX6U727t4SHhwlUnX7V8ZhmJLo+K2mt1DJpjMe+nTCD5TW9iIdqFGH2UdGf5jd12B+fyVfdh0wHvtveTY9i1TbD8jSJrVuQIjhwmWRpdoHhoxO/F/dDIG6jLsWoo+MzQnP/BfCgoUQGkd1xmqbTbpoz28zs7Sw8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790018730; c=relaxed/simple;
	bh=rWzA0l4XZ8ZFLOywo4JzqQsNJz4x+Z1e0CXWaAYwwtE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fgcuOv21ZjDfuvOsHt8zx7TBqBukwMWkKpkJCXAvQK/t3F/d+4hMK0Ppu8lG4+t0C+nuHyYtn5S8BA4If8lbwjdGBwoszgX2Bx5BOPd3Gg3nVnKuyl+oVximkbvEjkZp+DDKgnADi5LabAfrAHuVuLY2yEG2QpfZv0b3NKDkHfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=qxJp8/iL; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="qxJp8/iL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1790018710; x=1790277910;
	bh=pziqJOG4OXRrT6ye7O/4eiicr4v667Pveenjm+rV/VA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=qxJp8/iLPLRp3932aQifT7bozhR0xMR3BJpW0EJgrtSx4iZE4ZN6RNXq8xEcAHFRh
	 9o7HAu5geGJ0FRd3mhbHYek3ohPdtSvCruEiqWUW9Fx+1oI6udgfA2vObKYxy9lF7a
	 fwsDDJAmJVIcIN3davlB1+VsxPYJ0Iv/zrHNSYQgPcGjg/Mf7+NZ8FQ6B4MzTjJk9q
	 JbRZMBwJ0XBOiuGhHy1uAKmLUdBzPyZgfJSqEOrKs2oKRKeHyvCQIB55rZ1BeuLpc2
	 WfsbkYETwyLgwNfuZsKPlycm83s0ALwZULIyOM7N2nLxOfGP+W5qS6xIBgwACSpp9i
	 ySec/F0/XTODg==
Date: Mon, 21 Sep 2026 19:25:07 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/3] media: i2c: Add Sony IMX681 sensor driver
Message-ID: <20260921192450.21811-3-lsa.uz@pm.me>
In-Reply-To: <20260921192450.21811-1-lsa.uz@pm.me>
References: <20260921192450.21811-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: a9c8509efb8f811490d1eb73e0b1d5f26bdb7405
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Andre Gilerson <andre.gilerson@gmail.com>

The Sony IMX681 is the user-facing camera on the Microsoft Surface Pro 11
for Business (Intel Lunar Lake, IPU7), where it is enumerated as ACPI
device SONY0681. Without a driver the camera does not appear at all.

There is no public documentation for this sensor. The initialisation
sequence and the mode registers were recovered from I2C traces taken under
Windows, and the driver does not pretend otherwise: imx681_init_regs[] is
21 register writes whose individual meaning is not known.

What is not from the traces is derived and written down. The link frequency
comes from the PLL configuration visible in the same traces - 19.2 MHz
EXCK, PLL2_MUL 303, PLL2_PRE_DIV 3, giving 1939.2 MHz on the bus and
therefore 969.6 MHz per lane - and the pixel rate follows from that, the
lane count and the bit depth. The gain law and the black level were
measured against the sensor rather than taken from the traces; the numbers
are in the cover letter.

The driver uses the streams API, v4l2-cci for register access, the subdev
state API and runtime PM, and validates the endpoint's lane count and link
frequency against what the firmware describes.

Signed-off-by: Andre Gilerson <andre.gilerson@gmail.com>
Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
Tested-by: German Pablo Lindo <germanpapulindez@gmail.com>
---
 MAINTAINERS                |   7 +
 drivers/media/i2c/Kconfig  |  10 +
 drivers/media/i2c/Makefile |   1 +
 drivers/media/i2c/imx681.c | 876 +++++++++++++++++++++++++++++++++++++
 4 files changed, 894 insertions(+)
 create mode 100644 drivers/media/i2c/imx681.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 4cc4a2dc6d..4479f96d0d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25609,6 +25609,13 @@ S:=09Maintained
 F:=09Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
 F:=09drivers/media/i2c/imx678.c
=20
+SONY IMX681 SENSOR DRIVER
+M:=09Andre Gilerson <andre.gilerson@gmail.com>
+L:=09linux-media@vger.kernel.org
+S:=09Maintained
+F:=09Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml
+F:=09drivers/media/i2c/imx681.c
+
 SONY MEMORYSTICK SUBSYSTEM
 M:=09Maxim Levitsky <maximlevitsky@gmail.com>
 M:=09Alex Dubov <oakad@yahoo.com>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 4d99464791..c759a2d239 100644
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
index fd1cb25718..98bcecf0c4 100644
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
index 0000000000..825d8c80a2
--- /dev/null
+++ b/drivers/media/i2c/imx681.c
@@ -0,0 +1,876 @@
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
+/* Group parameter hold */
+#define IMX681_REG_GROUP_HOLD=09=09CCI_REG8(0x0104)
+
+/* Exposure (coarse integration time, 24-bit) */
+#define IMX681_REG_EXPOSURE=09=09CCI_REG24(0x0229)
+#define IMX681_EXPOSURE_MIN=09=094
+#define IMX681_EXPOSURE_MAX=09=093173=09/* frame_length - 4 */
+#define IMX681_EXPOSURE_OFFSET=09=094=09/* frame_length - exposure_max */
+#define IMX681_EXPOSURE_DEFAULT=09=091907=09/* from Windows trace */
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
+/* Test pattern */
+#define IMX681_REG_TEST_PATTERN=09=09CCI_REG16(0x0600)
+
+/* Frame length (24-bit, for streaming updates) */
+#define IMX681_REG_FRAME_LENGTH=09=09CCI_REG24(0x033D)
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
+/* Pixel rate =3D link_freq * 2 (DDR) * num_lanes / bpp */
+#define IMX681_PIXEL_RATE=09=09(IMX681_LINK_FREQ * 2 * IMX681_NUM_LANES / =
10)
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
+=09/* Software standby */
+=09{ CCI_REG8(0x0100),  0x00 },
+=09/* External clock frequency =3D 19.2 MHz (encoded as MHz * 256) */
+=09{ CCI_REG16(0x0136), 0x1333 },
+=09/* Vendor specific configuration */
+=09{ CCI_REG16(0x002C), 0x0505 },
+=09/* CSI-2 signaling mode */
+=09{ CCI_REG8(0x0111),  0x02 },
+=09/* Image orientation: H-flip to match Windows AIQB (RGGB native =
=E2=86=92 GRBG) */
+=09{ CCI_REG8(0x0101),  0x01 },
+=09/* Vendor access unlock sequence */
+=09{ CCI_REG8(0x30EB),  0x05 },
+=09{ CCI_REG8(0x30EB),  0x0C },
+=09/* Vendor specific */
+=09{ CCI_REG16(0x300A), 0xFFFF },
+=09{ CCI_REG16(0x3532), 0xFFFF },
+=09/* LINE_LENGTH_PCK =3D 7552 */
+=09{ CCI_REG16(0x0342), 0x1D80 },
+=09/* Frame length =3D 3177 */
+=09{ CCI_REG16(0x033E), 0x0C69 },
+=09/* Crop window start: X_ADD_STA[7:0]=3D100, Y_ADD_STA=3D256 */
+=09{ CCI_REG24(0x0345), 0x640100 },
+=09/* Crop window end: X_ADD_END[7:0]=3D103, Y_ADD_END=3D2895 */
+=09{ CCI_REG24(0x0349), 0x670B4F },
+=09/* Digital crop / vendor config */
+=09{ CCI_REG24(0x040D), 0x040A50 },
+=09/* X_OUTPUT_SIZE=3D3844, Y_OUTPUT_SIZE=3D2640 */
+=09{ CCI_REG32(0x034C), 0x0F040A50 },
+=09/* PLL multiplier =3D 225 */
+=09{ CCI_REG8(0x0307),  0xE1 },
+=09/* PLL2: pre_div=3D3, multiplier=3D303 (0x012F) */
+=09{ CCI_REG24(0x030D), 0x03012F },
+=09/* Frame duration initial */
+=09{ CCI_REG16(0x022A), 0x0C61 },
+=09/* Vendor specific registers */
+=09{ CCI_REG8(0x7E9B),  0x02 },
+=09{ CCI_REG8(0x0368),  0x00 },
+=09{ CCI_REG8(0xD383),  0x01 },
+};
+
+/*
+ * First exposure settings applied before stream-on.
+ * Uses group parameter hold to ensure atomic update.
+ */
+static const struct cci_reg_sequence imx681_first_exposure[] =3D {
+=09{ CCI_REG8(0x0104),  0x01 },=09=09/* Group hold ON */
+=09{ CCI_REG24(0x033D), 0x000C69 },=09/* Frame length =3D 3177 */
+=09{ CCI_REG24(0x0229), 0x000773 },=09/* Exposure =3D 1907 lines */
+=09{ CCI_REG16(0x0204), 0x0000 },=09=09/* Analog gain =3D 0 (1x) */
+=09{ CCI_REG16(0x020E), 0x0100 },=09=09/* Digital gain =3D 1.0x */
+=09{ CCI_REG8(0x0104),  0x00 },=09=09/* Group hold OFF */
+};
+
+static const char * const imx681_test_pattern_menu[] =3D {
+=09"Disabled",
+=09"Solid Colour",
+=09"Eight Vertical Colour Bars",
+=09"Colour Bars With Fade to Grey",
+=09"Pseudorandom Sequence (PN9)",
+};
+
+static const u32 imx681_mbus_codes[] =3D {
+=09MEDIA_BUS_FMT_SGRBG10_1X10,
+};
+
+/* Regulator supplies */
+static const char * const imx681_supply_names[] =3D {
+=09"avdd",=09=09/* Analog 2.8V */
+=09"dvdd",=09=09/* Digital 1.05V */
+=09"dovdd",=09/* I/O 1.8V */
+};
+
+#define IMX681_NUM_SUPPLIES ARRAY_SIZE(imx681_supply_names)
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
+=09struct regulator_bulk_data supplies[IMX681_NUM_SUPPLIES];
+
+=09/* V4L2 Controls */
+=09struct v4l2_ctrl_handler ctrl_handler;
+=09struct v4l2_ctrl *exposure;
+=09struct v4l2_ctrl *vblank;
+=09struct v4l2_ctrl *hblank;
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
+=09=09exposure_max =3D IMX681_HEIGHT + ctrl->val - IMX681_EXPOSURE_OFFSET;
+=09=09__v4l2_ctrl_modify_range(imx681->exposure,
+=09=09=09=09=09 IMX681_EXPOSURE_MIN, exposure_max,
+=09=09=09=09=09 1, IMX681_EXPOSURE_DEFAULT);
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
+=09=09cci_write(imx681->cci, IMX681_REG_GROUP_HOLD, 0x01, &ret);
+=09=09cci_write(imx681->cci, IMX681_REG_FRAME_LENGTH,
+=09=09=09  IMX681_HEIGHT + ctrl->val, &ret);
+=09=09cci_write(imx681->cci, IMX681_REG_GROUP_HOLD, 0x00, &ret);
+=09=09dev_dbg(imx681->dev, "set frame_length: %d, ret=3D%d\n",
+=09=09=09IMX681_HEIGHT + ctrl->val, ret);
+=09=09break;
+
+=09case V4L2_CID_EXPOSURE:
+=09=09cci_write(imx681->cci, IMX681_REG_GROUP_HOLD, 0x01, &ret);
+=09=09cci_write(imx681->cci, IMX681_REG_EXPOSURE, ctrl->val, &ret);
+=09=09cci_write(imx681->cci, IMX681_REG_GROUP_HOLD, 0x00, &ret);
+=09=09dev_dbg(imx681->dev, "set exposure: %d, ret=3D%d\n",
+=09=09=09ctrl->val, ret);
+=09=09break;
+
+=09case V4L2_CID_ANALOGUE_GAIN:
+=09=09/* Gain formula: gain =3D 1024/(1024-code); code 960 is 16x. */
+=09=09cci_write(imx681->cci, IMX681_REG_GROUP_HOLD, 0x01, &ret);
+=09=09cci_write(imx681->cci, IMX681_REG_ANALOG_GAIN, ctrl->val,
+=09=09=09  &ret);
+=09=09cci_write(imx681->cci, IMX681_REG_GROUP_HOLD, 0x00, &ret);
+=09=09dev_dbg(imx681->dev, "set analogue gain code %d, ret=3D%d\n",
+=09=09=09ctrl->val, ret);
+=09=09break;
+
+=09case V4L2_CID_DIGITAL_GAIN:
+=09=09cci_write(imx681->cci, IMX681_REG_GROUP_HOLD, 0x01, &ret);
+=09=09cci_write(imx681->cci, IMX681_REG_DIGITAL_GAIN, ctrl->val,
+=09=09=09  &ret);
+=09=09cci_write(imx681->cci, IMX681_REG_GROUP_HOLD, 0x00, &ret);
+=09=09dev_dbg(imx681->dev, "set digital gain: %d, ret=3D%d\n",
+=09=09=09ctrl->val, ret);
+=09=09break;
+
+=09case V4L2_CID_TEST_PATTERN:
+=09=09ret =3D cci_write(imx681->cci, IMX681_REG_TEST_PATTERN,
+=09=09=09=09ctrl->val, NULL);
+=09=09break;
+
+=09default:
+=09=09dev_dbg(imx681->dev, "unhandled ctrl id: 0x%x val: 0x%x\n",
+=09=09=09ctrl->id, ctrl->val);
+=09=09break;
+=09}
+
+=09if (pm_status > 0)
+=09=09pm_runtime_put(imx681->dev);
+=09return ret;
+}
+
+static const struct v4l2_ctrl_ops imx681_ctrl_ops =3D {
+=09.s_ctrl =3D imx681_set_ctrl,
+};
+
+static int imx681_enum_mbus_code(struct v4l2_subdev *sd,
+=09=09=09=09 struct v4l2_subdev_state *state,
+=09=09=09=09 struct v4l2_subdev_mbus_code_enum *code)
+{
+=09if (code->index >=3D ARRAY_SIZE(imx681_mbus_codes))
+=09=09return -EINVAL;
+
+=09code->code =3D imx681_mbus_codes[code->index];
+=09return 0;
+}
+
+static bool imx681_is_valid_mbus_code(u32 code)
+{
+=09unsigned int i;
+
+=09for (i =3D 0; i < ARRAY_SIZE(imx681_mbus_codes); i++)
+=09=09if (imx681_mbus_codes[i] =3D=3D code)
+=09=09=09return true;
+=09return false;
+}
+
+static int imx681_enum_frame_size(struct v4l2_subdev *sd,
+=09=09=09=09  struct v4l2_subdev_state *state,
+=09=09=09=09  struct v4l2_subdev_frame_size_enum *fse)
+{
+=09if (fse->index > 0)
+=09=09return -EINVAL;
+
+=09if (!imx681_is_valid_mbus_code(fse->code))
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
+=09format->code =3D MEDIA_BUS_FMT_SGRBG10_1X10;
+=09format->field =3D V4L2_FIELD_NONE;
+=09format->colorspace =3D V4L2_COLORSPACE_RAW;
+=09format->ycbcr_enc =3D V4L2_YCBCR_ENC_601;
+=09format->quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
+=09format->xfer_func =3D V4L2_XFER_FUNC_NONE;
+
+=09return 0;
+}
+
+static int imx681_set_pad_format(struct v4l2_subdev *sd,
+=09=09=09=09 const struct v4l2_subdev_client_info *ci,
+=09=09=09=09 struct v4l2_subdev_state *state,
+=09=09=09=09 struct v4l2_subdev_format *fmt)
+{
+=09struct v4l2_mbus_framefmt *format;
+
+=09/* Fixed resolution, fixed Bayer order */
+=09fmt->format.width =3D IMX681_WIDTH;
+=09fmt->format.height =3D IMX681_HEIGHT;
+=09if (!imx681_is_valid_mbus_code(fmt->format.code))
+=09=09fmt->format.code =3D imx681_mbus_codes[0];
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
+=09case V4L2_SEL_TGT_CROP_BOUNDS:
+=09case V4L2_SEL_TGT_NATIVE_SIZE:
+=09=09sel->r.top =3D 0;
+=09=09sel->r.left =3D 0;
+=09=09sel->r.width =3D IMX681_WIDTH;
+=09=09sel->r.height =3D IMX681_HEIGHT;
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
+=09dev_dbg(imx681->dev, "starting stream: %dx%d RAW10 2-lane\n",
+=09=09IMX681_WIDTH, IMX681_HEIGHT);
+
+=09/* Write init register sequence */
+=09ret =3D cci_multi_reg_write(imx681->cci, imx681_init_regs,
+=09=09=09=09  ARRAY_SIZE(imx681_init_regs), NULL);
+=09if (ret) {
+=09=09dev_err(imx681->dev, "failed to write init regs: %d\n", ret);
+=09=09return ret;
+=09}
+
+=09dev_dbg(imx681->dev, "init registers written successfully\n");
+
+=09/* Wait for sensor to stabilise after configuration */
+=09usleep_range(IMX681_INIT_DELAY_US, IMX681_INIT_DELAY_US + 1000);
+
+=09/* Apply first exposure settings with group hold */
+=09ret =3D cci_multi_reg_write(imx681->cci, imx681_first_exposure,
+=09=09=09=09  ARRAY_SIZE(imx681_first_exposure), NULL);
+=09if (ret) {
+=09=09dev_err(imx681->dev, "failed to write exposure: %d\n", ret);
+=09=09return ret;
+=09}
+
+=09/* Apply any pending V4L2 control values */
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
+=09dev_dbg(imx681->dev, "streaming started\n");
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
+=09if (pad !=3D IMAGE_PAD)
+=09=09return -EINVAL;
+
+=09ret =3D pm_runtime_get_sync(imx681->dev);
+=09if (ret < 0) {
+=09=09pm_runtime_put_noidle(imx681->dev);
+=09=09return ret;
+=09}
+
+=09ret =3D imx681_start_streaming(imx681);
+=09if (ret)
+=09=09pm_runtime_put_autosuspend(imx681->dev);
+
+=09return ret;
+}
+
+static int imx681_disable_streams(struct v4l2_subdev *sd,
+=09=09=09=09  struct v4l2_subdev_state *state,
+=09=09=09=09  u32 pad, u64 streams_mask)
+{
+=09struct imx681 *imx681 =3D to_imx681(sd);
+
+=09if (pad !=3D IMAGE_PAD)
+=09=09return -EINVAL;
+
+=09imx681_stop_streaming(imx681);
+=09pm_runtime_put_autosuspend(imx681->dev);
+
+=09return 0;
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
+=09dev_dbg(imx681->dev, "power on\n");
+
+=09ret =3D regulator_bulk_enable(IMX681_NUM_SUPPLIES, imx681->supplies);
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
+=09regulator_bulk_disable(IMX681_NUM_SUPPLIES, imx681->supplies);
+=09return ret;
+}
+
+static int imx681_power_off(struct device *dev)
+{
+=09struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
+=09struct imx681 *imx681 =3D to_imx681(sd);
+
+=09dev_dbg(imx681->dev, "power off\n");
+
+=09/* Assert reset */
+=09gpiod_set_value_cansleep(imx681->reset_gpio, 1);
+=09clk_disable_unprepare(imx681->xclk);
+=09regulator_bulk_disable(IMX681_NUM_SUPPLIES, imx681->supplies);
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
+=09ret =3D v4l2_ctrl_handler_init(ctrl_hdlr, 9);
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
+=09=09=09=09=09     IMX681_EXPOSURE_MAX, 1,
+=09=09=09=09=09     IMX681_EXPOSURE_DEFAULT);
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
+=09if (ctrl_hdlr->error) {
+=09=09ret =3D ctrl_hdlr->error;
+=09=09ret =3D dev_err_probe(imx681->dev, ret, "control init failed\n");
+=09=09goto error;
+=09}
+
+=09ret =3D v4l2_fwnode_device_parse(imx681->dev, &props);
+=09if (ret)
+=09=09goto error;
+
+=09ret =3D v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx681_ctrl_ops,
+=09=09=09=09=09      &props);
+=09if (ret)
+=09=09goto error;
+
+=09imx681->sd.ctrl_handler =3D ctrl_hdlr;
+=09return 0;
+
+error:
+=09v4l2_ctrl_handler_free(ctrl_hdlr);
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
+=09ep =3D fwnode_graph_get_next_endpoint(fwnode, NULL);
+=09if (!ep) {
+=09=09return dev_err_probe(imx681->dev, -ENXIO,
+=09=09=09=09     "no endpoint found in firmware node\n");
+=09}
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
+=09return ret;
+}
+
+static int imx681_probe(struct i2c_client *client)
+{
+=09struct imx681 *imx681;
+=09unsigned int i;
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
+=09/* Get clock (optional - INT3472 provides it on Surface devices) */
+=09imx681->xclk =3D devm_clk_get_optional(imx681->dev, NULL);
+=09if (IS_ERR(imx681->xclk))
+=09=09return dev_err_probe(imx681->dev, PTR_ERR(imx681->xclk),
+=09=09=09=09     "failed to get clock\n");
+
+=09/* Get regulators */
+=09for (i =3D 0; i < IMX681_NUM_SUPPLIES; i++)
+=09=09imx681->supplies[i].supply =3D imx681_supply_names[i];
+
+=09ret =3D devm_regulator_bulk_get(imx681->dev, IMX681_NUM_SUPPLIES,
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
+=09pm_runtime_get_noresume(imx681->dev);
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
+=09pm_runtime_put_autosuspend(imx681->dev);
+
+=09dev_info(imx681->dev,
+=09=09 "IMX681 probed successfully: %dx%d @ %lld Hz link freq\n",
+=09=09 IMX681_WIDTH, IMX681_HEIGHT, IMX681_LINK_FREQ);
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
+=09pm_runtime_disable(imx681->dev);
+=09pm_runtime_put_noidle(imx681->dev);
+=09pm_runtime_set_suspended(imx681->dev);
+error_power_off:
+=09imx681_power_off(imx681->dev);
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
+=09if (!pm_runtime_status_suspended(imx681->dev))
+=09=09imx681_power_off(imx681->dev);
+=09pm_runtime_set_suspended(imx681->dev);
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


