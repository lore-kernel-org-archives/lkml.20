Received: from mail-ej2-f16.google.com (mail-ej2-f16.google.com [74.125.228.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1EE2165EA
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 05:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.144
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832625; cv=pass; b=j3++21Kh7ic4ws2JCkLOyL8KPaQASgZp4n7nBIxHc03B2pTQdkuX1N+nQ6Gab2h3QZ42ja6YDmM9b+vEvik/jI2WGfmsehc/xJMc4PnwjnG75bE59/FL5JGx6KL6fgOdj/JLMT7qKvqpXkZjgONDIE/OjX3RQulDUufFmtYeA9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832625; c=relaxed/simple;
	bh=9KKOiQW6JWUAmxCX0H3TFFi9+4/x91ZOis+GOrQ6iOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=FhgdEja7B9P74anqIL+tIDglKydiDDC170FBF59voQnG7Qij1glCfgW7KNCOevsqiNoOP3xu9DQfwe5QZY2V90jsgOU4kRLdgPA+35ey4mdm+RldvYJUQwbSLBbv3f8leRTG9q/mS7YOnRfCCZhwD4kKq5swDgWAXft8liNYVPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Atxi0rDO; arc=pass smtp.client-ip=74.125.228.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Atxi0rDO"
Received: by mail-ej2-f16.google.com with SMTP id a640c23a62f3a-c2afe9fa8e0so723554966b.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:30:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790832620; cv=none;
        d=google.com; s=arc-20260327;
        b=HQEyxxpBCuRgcMyMxiw0y7hpXegcwdcQMKfgWGAVflD+yuA1Q92P/hP70GEgjQ9dY9
         /xz2OoT5LdkmiL/5PAFxHVs1bRPimsv2RhkfeMDuy4RBh3rMAbs3wF7fu6BZH1odNh6/
         VbtZETXQB/DfTRfHd79BAw+PN5XJNqcgCe20IW0RVMlGCaxSQe4bDZRaDWJJ7h4zAGuw
         CY9ILEfGTdX1El5V+QJlqgB/senZf+rgBuHY0ag1ZU0sElvxoxrgfj/Ss6vaPELJtXq5
         MDOUjjOkP9hAUvD/J4AF8idqFQBy3JFqGNFomJ+y/+WuGdP+nK93B1YFzAmbJCh20AzF
         CBTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kfoSROgl453VmQeN6S9RMdTsWbS9rDS39I2c9MZP7sw=;
        fh=NFgwcJLTlhUiICdhWbImXXreA5P1Me8IFqxTe73bNik=;
        b=Xw5PwIX5KzgJdElKxBY35myBhPMxot5Ob7Z2kFX079UNKQKnZjDPa3SndTuCIdwr25
         KWCrXHEjRTq8F0ASUI4FeCi3jNBOILngUFRIrfexDT9n15U3qzxXmnpEMRv3HL9hts6I
         QNLKjJ0pdAW+bQiz0sWBWIN5Y/A4IK5pGJm/NHxmjtSHz2BoCIzSe16K2WbaxxW+zX+Q
         sSKRcWs3G8Y+LNmq0ja4Af0iZc15fiwhlRpY1mJhzOyqRiTcUsgpb33SLyhY7VVgUwpc
         JSXSuIQeeUdWE1iXRmvrfjFTJP2a0yOKKvzytys/1TJMg7sn3dLH45vVh1AP8RWPxUwf
         cOwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790832620; x=1791437420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kfoSROgl453VmQeN6S9RMdTsWbS9rDS39I2c9MZP7sw=;
        b=Atxi0rDO68sP6KJh7Y8bvfHEONL6VwLy19w7RHUxDqh4k5libg1vdZFdrylnkYHWcc
         dhlSwMV/ZOPQrP/5ExQb5Ha/KF2lxB05bHe8+Ktz5TCHPQiI1gFq1dQoTeQIsyuro3Zo
         Fqwy73C4LDClThF2cI0ugEJwYpiRcd193fTl47iCrlY0HiQtIqrXAEkwYfQf/93CZD0o
         rlfK8ZaG3qSRux4C1Q/NLKYBc2ydnt8GZjKdi+QAKISbi67zk7ohEFRrHVimfLSZcubC
         WMdL9KV/gMKDkJWKLVC4MKsqpqDtmvC4mgQ/TSkjcp8a6o0l/NFrtEtOzU5J1kwh2x6u
         q+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832620; x=1791437420;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kfoSROgl453VmQeN6S9RMdTsWbS9rDS39I2c9MZP7sw=;
        b=v8nvbZWVhUJJfha5Pti4dbsaYgAXqCCjORsitFl7fU6laE8mGm7tQkauUPEvehKXDn
         rYJPKdXLe2RE98SfRUv4dsHMobjQjYDDhCMHL3w6Zmg7luBuBAVJje5bWhvjG/Q7TX4K
         W0DxndmXk8ilORrZKA21o/0ck4Hh98BNqjeRj/gn2epjaY5lq4fyH/7idxo9VLdjfeS8
         1nabeqkyX0//ycAQyFXruUYcENahjmLdNblgJXvoSwn/tBX8lmAzwmNiAaNDZ0XHdDn4
         SlnaoW/UL5QraHNfAbO6IxEAif7Jk8sIVZicnx3jCK5mieDeLuNMdw9lPmNkW6Ad0Df2
         nd4g==
X-Forwarded-Encrypted: i=1; AKwUvByBJwGG0seRijQCpc4XleCqccGeRspdzEkfDoaPj9boY1yoXn9j4I/vlKmJQ3mVv72tJgXRTZtIh+caLLM=@vger.kernel.org
X-Gm-Message-State: AFuF++k4HtJtL+NKYfHHF/a/mN87PeS3irPp6d+s/Dna+oOi2L1ZOLJY
	4g7bvjYAqr5807JKIHvbm7mPlkA7WI56FE3Da3W7vXYKoukKnHFIVaA4bAk8FTbhWnrXSYHFbxZ
	uhhGbH5BBJsqqqz89aUcgpXBuIxjtZ+A=
X-Gm-Gg: AYBFou10VyedAmLaBj6l9fkVBLaV1m/gPBImwoQEXW695VQCg+qMoVpXb79kO9iuEWz
	yIIwWcvAL5rFXXT8zEdkcGcbIJMvkGhTX0RYH1KiHOEGBDRXZPH12NqzyYFFXedXAwMFfjLm21s
	bhivvAJloy8bCk5VdJwJ5j/sWUgyVGxMGsp9CYDvAuFqwZoF6kvN9REx5gegLRgnii17WWa6cy1
	TZsEsJeTMogsfgM5VlGETxjyULluIv5WhTUM8uri0ULfibIuEproqwkbiSP/8a5WkxmDqx7dG2B
	pQljmmWNuiMJSImSSSgiejO4CKgwWlLEFiNTDPObtfp4jpbPsA6/jUU=
X-Received: by 2002:a17:907:720f:b0:c2d:d27d:ef88 with SMTP id
 a640c23a62f3a-c2e23dee17emr269082266b.42.1790832617364; Wed, 30 Sep 2026
 22:30:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923211816.89954-1-lsa.uz@pm.me> <20260923211816.89954-3-lsa.uz@pm.me>
 <CAKNG7X97UBgW6=+hnLwgCNBwk_aRMj90QBa0cj4j9W-AAHWLHA@mail.gmail.com>
In-Reply-To: <CAKNG7X97UBgW6=+hnLwgCNBwk_aRMj90QBa0cj4j9W-AAHWLHA@mail.gmail.com>
From: Andre Gilerson <andre.gilerson@gmail.com>
Date: Thu, 1 Oct 2026 07:30:05 +0200
X-Gm-Features: AclHuK8Grc1IPZnWCz0vgQWsRUyD7SMmOnevIlYMb8XgK1NqUgjKhzQcQDTPLpU
Message-ID: <CAKNG7X8_fNSNKK8FGtm4pey+Pq1PP+38PFTn8O2yP8L04rpcpg@mail.gmail.com>
Subject: Fwd: [PATCH v7 2/3] media: i2c: Add Sony IMX681 sensor driver
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everybody,

am not yet familiar with the entire etiquette on this mailing list, so
i hope i am not comitting any major faux pas here. Some input on the
open questions as well as a some incremental changes for v8:

- The regulator comment from an older bring-up. I did not see any
failures on the hardware and suggest keeping it as in v7.
- The gain split is a shortcut because the IPU7 HAL already limits
analogue sensitivity to 960 and separate DIGITAL_GAIN changes nothing.
- I think dropping the group hold is fine as Sakari requested.
- On the maintainers: As mentioned in the other mail I think we proper
way is to include both Sergey and me.
- I think keeping .set_fmt, and the comment above
pm_runtime_get_if_active()) is fine either way. The exposure default
is the same. The slow first start that German saw really needs the
libcamera sensor helper.

I tested v7 plus the change below on a Surface Pro 11 for Business,
running mainline 7.3-rc5 merged with media/next and libcamera 0.7.2:

- v4l2-compliance 1.32.0 on the sensor subdev: 46 tests, 46 succeeded,
0 failed, 0 warnings.
- cam captures 3844x2640 at 30.00 fps. qcam, with the CPU software
ISP,  shows a correctly colored image once AE settles.
- All four HFLIP/VFLIP combinations give the right Bayer code, in both
enum_mbus_code and the stored format. Changing a flip while streaming
returns EBUSY.
- Runtime PM auto suspends after streaming stops. Unbind, bind and
capture again works.

One thing to know about. IPU7 ISYS logs "csi2-2 error: Received packet
is too long" once per frame while this sensor streams, but the frames
arrive correctly. I loaded my original downstream driver on the same
kernel to compare, and the count was the same. The flips make no
difference either. My guess is a packet from the sensor that the
receiver doesn't expect, possibly embedded data. I believe this does
not need to hold up the entire patch series, but will be continuing to
work on this in the meantime.

I suggest the following changes for v8:

> + imx681->xclk =3D devm_clk_get_optional(imx681->dev, NULL);

Could this use devm_v4l2_sensor_clk_get(), as most sensor drivers in
media/next do now, with the 19.2 MHz check made unconditional? The
INT3472 registers the clock through clkdev.

One smaller thing: the probe error path (error_pm) should also call
pm_runtime_dont_use_autosuspend(), to match remove().

The diff below, on top of v7 2/3, does both. It builds with W=3D1,
passes checkpatch --strict, and is what I tested above. Please fold it
into v8 if you agree.

Also since Sergey by now has contributed a lot of work is suggest the add

  Co-developed-by: Sergey Lebedev <lsa.uz@pm.me>

above the Signed-off-by on 2/3.

Best regards,
Andre

PS. sorry for the doubling the email, the first one was rejected due
to HTML formatting

diff --git a/drivers/media/i2c/imx681.c b/drivers/media/i2c/imx681.c
index fee409f8a536..06fdf1856aec 100644
--- a/drivers/media/i2c/imx681.c
+++ b/drivers/media/i2c/imx681.c
@@ -854,6 +854,7 @@ static int imx681_parse_endpoint(struct imx681 *imx681)
 static int imx681_probe(struct i2c_client *client)
 {
  struct imx681 *imx681;
+ unsigned long xclk_freq;
  int ret;

  imx681 =3D devm_kzalloc(&client->dev, sizeof(*imx681), GFP_KERNEL);
@@ -871,27 +872,20 @@ static int imx681_probe(struct i2c_client *client)
  return dev_err_probe(imx681->dev, PTR_ERR(imx681->cci),
      "failed to init CCI\n");

- /* Get clock (optional - INT3472 provides it on Surface devices) */
- imx681->xclk =3D devm_clk_get_optional(imx681->dev, NULL);
+ imx681->xclk =3D devm_v4l2_sensor_clk_get(imx681->dev, NULL);
  if (IS_ERR(imx681->xclk))
  return dev_err_probe(imx681->dev, PTR_ERR(imx681->xclk),
      "failed to get clock\n");

  /*
  * Both PLLs in imx681_init_regs[] and the value written to
- * EXTCLK_FREQUENCY_MHZ assume this rate, so a different one would
- * configure the part for a clock it is not being given. Where the
- * clock is not ours to see - INT3472 on this machine hands it over
- * outside the clk framework - there is nothing to check.
+ * EXTCLK_FREQUENCY_MHZ assume this rate.
  */
- if (imx681->xclk) {
- unsigned long rate =3D clk_get_rate(imx681->xclk);
-
- if (rate !=3D IMX681_XCLK_FREQ)
- return dev_err_probe(imx681->dev, -EINVAL,
-     "external clock is %lu Hz, this driver needs %u\n",
-     rate, IMX681_XCLK_FREQ);
- }
+ xclk_freq =3D clk_get_rate(imx681->xclk);
+ if (xclk_freq !=3D IMX681_XCLK_FREQ)
+ return dev_err_probe(imx681->dev, -EINVAL,
+     "external clock %lu Hz not supported, expected %u Hz\n",
+     xclk_freq, IMX681_XCLK_FREQ);

  /* Get regulators */
  for (unsigned int i =3D 0; i < ARRAY_SIZE(imx681_supply_names); i++)
@@ -977,6 +971,7 @@ static int imx681_probe(struct i2c_client *client)
 error_handler_free:
  v4l2_ctrl_handler_free(imx681->sd.ctrl_handler);
 error_pm:
+ pm_runtime_dont_use_autosuspend(imx681->dev);
  pm_runtime_disable(imx681->dev);
  pm_runtime_set_suspended(imx681->dev);
 error_power_off:

On Wed, 23 Sept 2026 at 23:18, Sergey Lebedev <lsa.uz@pm.me> wrote:
>
> From: Andre Gilerson <andre.gilerson@gmail.com>
>
> Add a V4L2 sub-device driver for the Sony IMX681, a 10-bit Bayer sensor
> on a two-lane CSI-2 bus. It offers a single 3844x2640 mode at 30 fps and
> controls for exposure, analogue and digital gain, vertical blanking,
> both flips and the sensor's test patterns. The part is enumerated as
> ACPI device SONY0681 on Intel platforms and by the sony,imx681
> compatible elsewhere.
>
> There is no public documentation for this sensor. The initialisation
> sequence was recovered from I2C traces taken under Windows, so
> imx681_init_regs[] keeps the writes whose meaning is not known; the
> registers that are CCS are written by name instead. The pixel rate is
> measured on the part rather than computed from the CSI-2 link, because
> the pixel array is clocked from a second PLL - the comment above
> IMX681_PIXEL_RATE records the measurement.
>
> Signed-off-by: Andre Gilerson <andre.gilerson@gmail.com>
> Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
> Tested-by: German Pablo Lindo <germanpapulindez@gmail.com>
> ---
>  MAINTAINERS                |    7 +
>  drivers/media/i2c/Kconfig  |   10 +
>  drivers/media/i2c/Makefile |    1 +
>  drivers/media/i2c/imx681.c | 1037 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 1055 insertions(+)
>  create mode 100644 drivers/media/i2c/imx681.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4cc4a2dc6d3..4479f96d0d1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25609,6 +25609,13 @@ S:     Maintained
>  F:     Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
>  F:     drivers/media/i2c/imx678.c
>
> +SONY IMX681 SENSOR DRIVER
> +M:     Andre Gilerson <andre.gilerson@gmail.com>
> +L:     linux-media@vger.kernel.org
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml
> +F:     drivers/media/i2c/imx681.c
> +
>  SONY MEMORYSTICK SUBSYSTEM
>  M:     Maxim Levitsky <maximlevitsky@gmail.com>
>  M:     Alex Dubov <oakad@yahoo.com>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 4d994647916..c759a2d2398 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -321,6 +321,16 @@ config VIDEO_IMX678
>           To compile this driver as a module, choose M here: the
>           module will be called imx678.
>
> +config VIDEO_IMX681
> +       tristate "Sony IMX681 sensor support"
> +       select V4L2_CCI_I2C
> +       help
> +         This is a Video4Linux2 sensor driver for the Sony
> +         IMX681 camera.
> +
> +         To compile this driver as a module, choose M here: the
> +         module will be called imx681.
> +
>  config VIDEO_MAX9271_LIB
>         tristate
>
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index fd1cb25718c..98bcecf0c43 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -64,6 +64,7 @@ obj-$(CONFIG_VIDEO_IMX412) +=3D imx412.o
>  obj-$(CONFIG_VIDEO_IMX415) +=3D imx415.o
>  obj-$(CONFIG_VIDEO_IMX678) +=3D imx678.o
>  obj-$(CONFIG_VIDEO_IMX471) +=3D imx471.o
> +obj-$(CONFIG_VIDEO_IMX681) +=3D imx681.o
>  obj-$(CONFIG_VIDEO_IR_I2C) +=3D ir-kbd-i2c.o
>  obj-$(CONFIG_VIDEO_ISL7998X) +=3D isl7998x.o
>  obj-$(CONFIG_VIDEO_IT6625) +=3D it6625.o
> diff --git a/drivers/media/i2c/imx681.c b/drivers/media/i2c/imx681.c
> new file mode 100644
> index 00000000000..fee409f8a53
> --- /dev/null
> +++ b/drivers/media/i2c/imx681.c
> @@ -0,0 +1,1037 @@
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
> +#define IMX681_REG_CHIP_ID             CCI_REG16(0x0016)
> +#define IMX681_CHIP_ID                 0x0681
> +
> +/* Mode select */
> +#define IMX681_REG_MODE_SELECT         CCI_REG8(0x0100)
> +#define IMX681_MODE_STANDBY            0x00
> +#define IMX681_MODE_STREAMING          0x01
> +
> +/* Exposure (coarse integration time, 24-bit) */
> +#define IMX681_REG_EXPOSURE            CCI_REG24(0x0229)
> +/*
> + * The external clock frequency, in MHz, as a Q8.8 fixed-point number: t=
he
> + * sensor takes 19.2 MHz as 19 in the high byte and 0.2 * 256 in the low=
 one.
> + */
> +#define IMX681_XCLK_FREQ               19200000
> +#define IMX681_XCLK_FREQ_ENC           ((IMX681_XCLK_FREQ / 1000000) << =
8 | \
> +                                        (IMX681_XCLK_FREQ % 1000000) * 2=
56 / 1000000)
> +
> +#define IMX681_EXPOSURE_MIN            4
> +/* The exposure may not come within this many lines of the frame length.=
 */
> +#define IMX681_EXPOSURE_MARGIN         4
> +#define IMX681_EXPOSURE_DEFAULT                IMX681_EXPOSURE_MIN
> +
> +/* Analog gain */
> +#define IMX681_REG_ANALOG_GAIN         CCI_REG16(0x0204)
> +#define IMX681_ANA_GAIN_MIN            0
> +#define IMX681_ANA_GAIN_MAX            960     /* 16x, where the analogu=
e stage ends */
> +#define IMX681_ANA_GAIN_DEFAULT                0
> +
> +/* Digital gain */
> +#define IMX681_REG_DIGITAL_GAIN                CCI_REG16(0x020E)
> +#define IMX681_DIG_GAIN_MIN            0x0100  /* 1.0x */
> +#define IMX681_DIG_GAIN_MAX            0x0FFF
> +#define IMX681_DIG_GAIN_DEFAULT                0x0100
> +
> +/* Test pattern, and the colour the solid-colour mode shows */
> +#define IMX681_REG_TEST_PATTERN                CCI_REG16(0x0600)
> +#define IMX681_REG_TESTP_RED           CCI_REG16(0x0602)
> +#define IMX681_REG_TESTP_GREENR                CCI_REG16(0x0604)
> +#define IMX681_REG_TESTP_BLUE          CCI_REG16(0x0606)
> +#define IMX681_REG_TESTP_GREENB                CCI_REG16(0x0608)
> +#define IMX681_TESTP_COLOUR_MIN                0
> +#define IMX681_TESTP_COLOUR_MAX                0x03ff
> +#define IMX681_TESTP_COLOUR_STEP       1
> +
> +/*
> + * Frame length and exposure are 24-bit and at vendor addresses; everyth=
ing
> + * else this driver touches is a CCS register at its CCS address, and is
> + * named for it here.
> + */
> +#define IMX681_REG_FRAME_LENGTH                CCI_REG24(0x033D)
> +#define IMX681_REG_LINE_LENGTH         CCI_REG16(0x0342)
> +#define IMX681_REG_ORIENTATION         CCI_REG8(0x0101)
> +#define IMX681_REG_CSI_SIGNALING_MODE  CCI_REG8(0x0111)
> +#define IMX681_REG_EXTCLK_FREQ_MHZ     CCI_REG16(0x0136)
> +#define IMX681_REG_PLL_MULTIPLIER      CCI_REG16(0x0306)
> +#define IMX681_REG_OP_PRE_PLL_CLK_DIV  CCI_REG16(0x030c)
> +#define IMX681_REG_OP_PLL_MULTIPLIER   CCI_REG16(0x030e)
> +#define IMX681_REG_X_ADDR_START                CCI_REG16(0x0344)
> +#define IMX681_REG_Y_ADDR_START                CCI_REG16(0x0346)
> +#define IMX681_REG_X_ADDR_END          CCI_REG16(0x0348)
> +#define IMX681_REG_Y_ADDR_END          CCI_REG16(0x034a)
> +#define IMX681_REG_X_OUTPUT_SIZE       CCI_REG16(0x034c)
> +#define IMX681_REG_Y_OUTPUT_SIZE       CCI_REG16(0x034e)
> +#define IMX681_REG_DIGITAL_CROP_WIDTH  CCI_REG16(0x040c)
> +#define IMX681_REG_DIGITAL_CROP_HEIGHT CCI_REG16(0x040e)
> +
> +/* PLL, as the Windows traces configure it and the part reads back. */
> +#define IMX681_PLL_MULTIPLIER          225
> +#define IMX681_OP_PRE_PLL_CLK_DIV      3
> +#define IMX681_OP_PLL_MULTIPLIER       303
> +
> +/*
> + * Where the read-out window sits in the pixel array, and how much array
> + * there is. The bounds are the part's own answer: X_ADDR_MIN, X_ADDR_MA=
X,
> + * Y_ADDR_MIN and Y_ADDR_MAX at the CCS addresses read 8, 4039, 64 and 3=
087,
> + * so 4032x3024 of readable pixels at (8, 64), and the window below sits
> + * inside that. What lies beyond the readable area is not documented, so=
 the
> + * native size is the smallest rectangle that contains it.
> + */
> +#define IMX681_CROP_X_START            100
> +#define IMX681_CROP_Y_START            256
> +#define IMX681_PIXEL_ARRAY_LEFT                8
> +#define IMX681_PIXEL_ARRAY_TOP         64
> +#define IMX681_PIXEL_ARRAY_WIDTH       4032
> +#define IMX681_PIXEL_ARRAY_HEIGHT      3024
> +#define IMX681_NATIVE_WIDTH            4040
> +#define IMX681_NATIVE_HEIGHT           3088
> +
> +/* Image dimensions =E2=80=94 native sensor output */
> +#define IMX681_WIDTH                   3844
> +#define IMX681_HEIGHT                  2640
> +#define IMX681_LINE_LENGTH_PCK         7552    /* 0x1D80 */
> +#define IMX681_FRAME_LENGTH_LINES      3177    /* 0x0C69 */
> +#define IMX681_FRAME_LENGTH_MAX                0xFFFF  /* 24-bit reg, li=
mit to 16-bit */
> +
> +/* MIPI lanes */
> +#define IMX681_NUM_LANES               2
> +
> +/*
> + * Link frequency derived from PLL settings in Windows trace:
> + * EXCK=3D19.2MHz, PLL2_MUL=3D303, PLL2_PRE_DIV=3D3
> + * OP output =3D 19.2 * 303 / 3 =3D 1939.2 MHz (MIPI bit rate)
> + * Link freq =3D 1939.2 / 2 (DDR) =3D 969.6 MHz
> + */
> +#define IMX681_LINK_FREQ               969600000LL
> +
> +/*
> + * The pixel rate cannot be derived from the CSI-2 link: this part runs =
two
> + * PLLs, and the pixel array is clocked from the video-timing one while =
the
> + * link is clocked from the other. It cannot be derived from the video-t=
iming
> + * PLL either, because these registers are at the CCS addresses without
> + * having the CCS meaning. Read back from the part at its operating poin=
t
> + * they are PRE_PLL_CLK_DIV 2 and PLL_MULTIPLIER 225, so a 2160 MHz VCO,=
 then
> + * VT_SYS_CLK_DIV 2 and VT_PIX_CLK_DIV 6 - by the CCS formula 180 MHz, w=
hich
> + * would be 7.5 fps. The sensor runs at 30.
> + *
> + * So it is measured: LINE_LENGTH_PCK x FRAME_LENGTH_LINES x the frame r=
ate
> + * the part achieves, which is 29.95 fps over 300 frames and 720 MHz.
> + */
> +#define IMX681_PIXEL_RATE              720000000LL
> +
> +/* Power-on delay after reset deassert */
> +#define IMX681_RESET_DELAY_US          1000
> +#define IMX681_RESET_DELAY_RANGE_US    1000
> +
> +/* Post-standby-cancel stabilisation delays */
> +#define IMX681_INIT_DELAY_US           10000
> +
> +#define IMAGE_PAD                      0
> +
> +static const s64 imx681_link_frequencies[] =3D {
> +       IMX681_LINK_FREQ,
> +};
> +
> +/*
> + * Sensor init register sequence, captured from Windows I2C traces.
> + * This configures the sensor for 3844x2640 RAW10 output at ~30fps
> + * with 2-lane MIPI CSI-2, 19.2MHz input clock.
> + */
> +static const struct cci_reg_sequence imx681_init_regs[] =3D {
> +       { IMX681_REG_EXTCLK_FREQ_MHZ, IMX681_XCLK_FREQ_ENC },
> +       /* Vendor specific configuration */
> +       { CCI_REG16(0x002C), 0x0505 },
> +       /* 0x02 is D-PHY, which is the only mode this part offers. */
> +       { IMX681_REG_CSI_SIGNALING_MODE, 0x02 },
> +       /* Vendor access unlock sequence */
> +       { CCI_REG8(0x30EB),  0x05 },
> +       { CCI_REG8(0x30EB),  0x0C },
> +       /* Vendor specific */
> +       { CCI_REG16(0x300A), 0xFFFF },
> +       { CCI_REG16(0x3532), 0xFFFF },
> +       /*
> +        * The analogue crop, its digital counterpart and the output size=
, at
> +        * the CCS addresses. The traces wrote these as overlapping parti=
al
> +        * writes - 0x0345 and 0x0349 carry only the low byte of a 16-bit
> +        * register, so the window was right only while the high bytes he=
ld
> +        * their reset values. Written whole here, and the values read ba=
ck
> +        * from the part at the operating point agree: the window is
> +        * 3943 - 100 + 1 by 2895 - 256 + 1, which is the output size.
> +        */
> +       { IMX681_REG_X_ADDR_START, IMX681_CROP_X_START },
> +       { IMX681_REG_Y_ADDR_START, IMX681_CROP_Y_START },
> +       { IMX681_REG_X_ADDR_END, IMX681_CROP_X_START + IMX681_WIDTH - 1 }=
,
> +       { IMX681_REG_Y_ADDR_END, IMX681_CROP_Y_START + IMX681_HEIGHT - 1 =
},
> +       { IMX681_REG_DIGITAL_CROP_WIDTH, IMX681_WIDTH },
> +       { IMX681_REG_DIGITAL_CROP_HEIGHT, IMX681_HEIGHT },
> +       { IMX681_REG_X_OUTPUT_SIZE, IMX681_WIDTH },
> +       { IMX681_REG_Y_OUTPUT_SIZE, IMX681_HEIGHT },
> +       /*
> +        * Both of these were partial writes in the traces too: 0x0307 is=
 the
> +        * low byte of PLL_MULTIPLIER and 0x030d the low byte of
> +        * OP_PRE_PLL_CLK_DIV, and each was right only while its high byt=
e
> +        * held the reset value. Written whole, and the part reads back
> +        * 225, 3 and 303 at the operating point either way.
> +        */
> +       { IMX681_REG_PLL_MULTIPLIER, IMX681_PLL_MULTIPLIER },
> +       { IMX681_REG_OP_PRE_PLL_CLK_DIV, IMX681_OP_PRE_PLL_CLK_DIV },
> +       { IMX681_REG_OP_PLL_MULTIPLIER, IMX681_OP_PLL_MULTIPLIER },
> +       /* Vendor specific registers */
> +       { CCI_REG8(0x7E9B),  0x02 },
> +       { CCI_REG8(0x0368),  0x00 },
> +       { CCI_REG8(0xD383),  0x01 },
> +};
> +
> +/*
> + * The CCS numbering, which this part follows: 1 solid colour, 2 colour =
bars,
> + * 3 bars fading to grey. Mode 4, PN9, is not offered because it produce=
s a
> + * black frame on this sensor where 2 and 3 produce their patterns, and
> + * TEST_PATTERN_CAPABILITY reads zero here so it cannot be asked.
> + */
> +static const char * const imx681_test_pattern_menu[] =3D {
> +       "Disabled",
> +       "Solid Colour",
> +       "Eight Vertical Colour Bars",
> +       "Colour Bars With Fade to Grey",
> +};
> +
> +/*
> + * The pixel array reads out RGGB. Mirroring moves the Bayer phase by on=
e
> + * column and flipping by one row, so the code the sensor delivers follo=
ws
> + * the two controls: index =3D vflip << 1 | hflip.
> + */
> +static const u32 imx681_mbus_codes[] =3D {
> +       MEDIA_BUS_FMT_SRGGB10_1X10,
> +       MEDIA_BUS_FMT_SGRBG10_1X10,
> +       MEDIA_BUS_FMT_SGBRG10_1X10,
> +       MEDIA_BUS_FMT_SBGGR10_1X10,
> +};
> +
> +/* Regulator supplies */
> +static const char * const imx681_supply_names[] =3D {
> +       "avdd",         /* Analog 2.8V */
> +       "dvdd",         /* Digital 1.05V */
> +       "dovdd",        /* I/O 1.8V */
> +};
> +
> +struct imx681 {
> +       struct device *dev;
> +       struct regmap *cci;
> +
> +       struct v4l2_subdev sd;
> +       struct media_pad pad;
> +
> +       struct clk *xclk;
> +       struct gpio_desc *reset_gpio;
> +       struct regulator_bulk_data supplies[ARRAY_SIZE(imx681_supply_name=
s)];
> +
> +       /* V4L2 Controls */
> +       struct v4l2_ctrl_handler ctrl_handler;
> +       struct v4l2_ctrl *exposure;
> +       struct v4l2_ctrl *vblank;
> +       struct v4l2_ctrl *hblank;
> +       struct v4l2_ctrl *hflip;
> +       struct v4l2_ctrl *vflip;
> +
> +       unsigned long link_freq_bitmap;
> +};
> +
> +static inline struct imx681 *to_imx681(struct v4l2_subdev *sd)
> +{
> +       return container_of_const(sd, struct imx681, sd);
> +}
> +
> +static int imx681_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       struct imx681 *imx681 =3D container_of(ctrl->handler, struct imx6=
81,
> +                                            ctrl_handler);
> +       s64 exposure_max;
> +       int pm_status;
> +       int ret =3D 0;
> +
> +       /* Update exposure max when VBLANK changes (even when not streami=
ng) */
> +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> +               exposure_max =3D IMX681_HEIGHT + ctrl->val - IMX681_EXPOS=
URE_MARGIN;
> +               ret =3D __v4l2_ctrl_modify_range(imx681->exposure,
> +                                              IMX681_EXPOSURE_MIN, expos=
ure_max,
> +                                              1, IMX681_EXPOSURE_DEFAULT=
);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       /*
> +        * 1 with a reference taken, 0 if the device is not active, or -E=
INVAL
> +        * if runtime PM is unavailable. Only the 0 means there is nothin=
g to
> +        * do: without runtime PM the sensor is powered from probe and ne=
ver
> +        * suspended, so the write still has to go out - but no reference=
 was
> +        * taken then, and none may be dropped.
> +        */
> +       pm_status =3D pm_runtime_get_if_active(imx681->dev);
> +       if (!pm_status)
> +               return 0;
> +
> +       switch (ctrl->id) {
> +       case V4L2_CID_VBLANK:
> +               ret =3D cci_write(imx681->cci, IMX681_REG_FRAME_LENGTH,
> +                               IMX681_HEIGHT + ctrl->val, NULL);
> +               break;
> +
> +       case V4L2_CID_EXPOSURE:
> +               ret =3D cci_write(imx681->cci, IMX681_REG_EXPOSURE, ctrl-=
>val,
> +                               NULL);
> +               break;
> +
> +       case V4L2_CID_ANALOGUE_GAIN:
> +               /* Gain formula: gain =3D 1024/(1024-code); code 960 is 1=
6x. */
> +               ret =3D cci_write(imx681->cci, IMX681_REG_ANALOG_GAIN, ct=
rl->val,
> +                               NULL);
> +               break;
> +
> +       case V4L2_CID_DIGITAL_GAIN:
> +               ret =3D cci_write(imx681->cci, IMX681_REG_DIGITAL_GAIN, c=
trl->val,
> +                               NULL);
> +               break;
> +
> +       case V4L2_CID_HFLIP:
> +       case V4L2_CID_VFLIP:
> +               /*
> +                * Read from imx681_start_streaming(). These are grabbed =
while
> +                * streaming, so this runs only when the part is idle and=
 the
> +                * value is applied at the next stream start.
> +                */
> +               break;
> +
> +       case V4L2_CID_TEST_PATTERN:
> +               ret =3D cci_write(imx681->cci, IMX681_REG_TEST_PATTERN,
> +                               ctrl->val, NULL);
> +               break;
> +
> +       case V4L2_CID_TEST_PATTERN_RED:
> +               ret =3D cci_write(imx681->cci, IMX681_REG_TESTP_RED, ctrl=
->val,
> +                               NULL);
> +               break;
> +
> +       case V4L2_CID_TEST_PATTERN_GREENR:
> +               ret =3D cci_write(imx681->cci, IMX681_REG_TESTP_GREENR,
> +                               ctrl->val, NULL);
> +               break;
> +
> +       case V4L2_CID_TEST_PATTERN_BLUE:
> +               ret =3D cci_write(imx681->cci, IMX681_REG_TESTP_BLUE, ctr=
l->val,
> +                               NULL);
> +               break;
> +
> +       case V4L2_CID_TEST_PATTERN_GREENB:
> +               ret =3D cci_write(imx681->cci, IMX681_REG_TESTP_GREENB,
> +                               ctrl->val, NULL);
> +               break;
> +
> +       default:
> +               break;
> +       }
> +
> +       if (pm_status > 0)
> +               pm_runtime_put(imx681->dev);
> +
> +       return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops imx681_ctrl_ops =3D {
> +       .s_ctrl =3D imx681_set_ctrl,
> +};
> +
> +static u32 imx681_get_format_code(struct imx681 *imx681)
> +{
> +       return imx681_mbus_codes[(imx681->vflip->val ? 2 : 0) |
> +                                (imx681->hflip->val ? 1 : 0)];
> +}
> +
> +static int imx681_enum_mbus_code(struct v4l2_subdev *sd,
> +                                struct v4l2_subdev_state *state,
> +                                struct v4l2_subdev_mbus_code_enum *code)
> +{
> +       struct imx681 *imx681 =3D to_imx681(sd);
> +
> +       if (code->index > 0)
> +               return -EINVAL;
> +
> +       code->code =3D imx681_get_format_code(imx681);
> +
> +       return 0;
> +}
> +
> +static bool imx681_is_valid_mbus_code(struct imx681 *imx681, u32 code)
> +{
> +       return code =3D=3D imx681_get_format_code(imx681);
> +}
> +
> +static int imx681_enum_frame_size(struct v4l2_subdev *sd,
> +                                 struct v4l2_subdev_state *state,
> +                                 struct v4l2_subdev_frame_size_enum *fse=
)
> +{
> +       if (fse->index > 0)
> +               return -EINVAL;
> +
> +       if (!imx681_is_valid_mbus_code(to_imx681(sd), fse->code))
> +               return -EINVAL;
> +
> +       fse->min_width =3D IMX681_WIDTH;
> +       fse->max_width =3D IMX681_WIDTH;
> +       fse->min_height =3D IMX681_HEIGHT;
> +       fse->max_height =3D IMX681_HEIGHT;
> +
> +       return 0;
> +}
> +
> +static int imx681_init_state(struct v4l2_subdev *sd,
> +                            struct v4l2_subdev_state *state)
> +{
> +       struct v4l2_mbus_framefmt *format;
> +
> +       format =3D v4l2_subdev_state_get_format(state, IMAGE_PAD);
> +       format->width =3D IMX681_WIDTH;
> +       format->height =3D IMX681_HEIGHT;
> +       format->code =3D imx681_get_format_code(to_imx681(sd));
> +       format->field =3D V4L2_FIELD_NONE;
> +       format->colorspace =3D V4L2_COLORSPACE_RAW;
> +       format->ycbcr_enc =3D V4L2_YCBCR_ENC_601;
> +       format->quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
> +       format->xfer_func =3D V4L2_XFER_FUNC_NONE;
> +
> +       return 0;
> +}
> +
> +/*
> + * There is nothing to configure on the part here - the size is fixed an=
d the
> + * code follows the flips - but the stored format still has to be told w=
hich
> + * Bayer order the flips have produced, or the pipeline validates the st=
ate
> + * against a code the sensor is no longer delivering.
> + */
> +static int imx681_set_pad_format(struct v4l2_subdev *sd,
> +                                const struct v4l2_subdev_client_info *ci=
,
> +                                struct v4l2_subdev_state *state,
> +                                struct v4l2_subdev_format *fmt)
> +{
> +       struct imx681 *imx681 =3D to_imx681(sd);
> +       struct v4l2_mbus_framefmt *format;
> +
> +       fmt->format.width =3D IMX681_WIDTH;
> +       fmt->format.height =3D IMX681_HEIGHT;
> +       fmt->format.code =3D imx681_get_format_code(imx681);
> +       fmt->format.field =3D V4L2_FIELD_NONE;
> +       fmt->format.colorspace =3D V4L2_COLORSPACE_RAW;
> +       fmt->format.ycbcr_enc =3D V4L2_YCBCR_ENC_601;
> +       fmt->format.quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
> +       fmt->format.xfer_func =3D V4L2_XFER_FUNC_NONE;
> +
> +       format =3D v4l2_subdev_state_get_format(state, fmt->pad);
> +       *format =3D fmt->format;
> +
> +       return 0;
> +}
> +
> +static int imx681_get_selection(struct v4l2_subdev *sd,
> +                               const struct v4l2_subdev_client_info *ci,
> +                               struct v4l2_subdev_state *state,
> +                               struct v4l2_subdev_selection *sel)
> +{
> +       switch (sel->target) {
> +       case V4L2_SEL_TGT_CROP:
> +       case V4L2_SEL_TGT_CROP_DEFAULT:
> +               sel->r.left =3D IMX681_CROP_X_START;
> +               sel->r.top =3D IMX681_CROP_Y_START;
> +               sel->r.width =3D IMX681_WIDTH;
> +               sel->r.height =3D IMX681_HEIGHT;
> +               return 0;
> +       case V4L2_SEL_TGT_CROP_BOUNDS:
> +               sel->r.left =3D IMX681_PIXEL_ARRAY_LEFT;
> +               sel->r.top =3D IMX681_PIXEL_ARRAY_TOP;
> +               sel->r.width =3D IMX681_PIXEL_ARRAY_WIDTH;
> +               sel->r.height =3D IMX681_PIXEL_ARRAY_HEIGHT;
> +               return 0;
> +       case V4L2_SEL_TGT_NATIVE_SIZE:
> +               sel->r.left =3D 0;
> +               sel->r.top =3D 0;
> +               sel->r.width =3D IMX681_NATIVE_WIDTH;
> +               sel->r.height =3D IMX681_NATIVE_HEIGHT;
> +               return 0;
> +       default:
> +               return -EINVAL;
> +       }
> +}
> +
> +static int imx681_start_streaming(struct imx681 *imx681)
> +{
> +       int ret;
> +
> +       /*
> +        * The orientation goes in before the register list, because the =
crop
> +        * window in it is interpreted in the orientation then in force. =
The
> +        * downstream driver had this write inside the list, ahead of the=
 crop
> +        * registers, for the same reason.
> +        */
> +       ret =3D cci_write(imx681->cci, IMX681_REG_ORIENTATION,
> +                       imx681->hflip->val | imx681->vflip->val << 1, NUL=
L);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D cci_multi_reg_write(imx681->cci, imx681_init_regs,
> +                                 ARRAY_SIZE(imx681_init_regs), NULL);
> +       if (ret) {
> +               dev_err(imx681->dev, "failed to write init regs: %d\n", r=
et);
> +               return ret;
> +       }
> +
> +       /* Wait for sensor to stabilise after configuration */
> +       usleep_range(IMX681_INIT_DELAY_US, IMX681_INIT_DELAY_US + 1000);
> +
> +       /*
> +        * The blanking is the controls' to set, not the register list's:
> +        * HBLANK gives the line length, and VBLANK the frame length thro=
ugh
> +        * imx681_set_ctrl() below, along with the exposure and the gains=
.
> +        */
> +       ret =3D cci_write(imx681->cci, IMX681_REG_LINE_LENGTH,
> +                       IMX681_WIDTH + imx681->hblank->val, NULL);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D __v4l2_ctrl_handler_setup(imx681->sd.ctrl_handler);
> +       if (ret) {
> +               dev_err(imx681->dev, "failed to apply controls: %d\n", re=
t);
> +               return ret;
> +       }
> +
> +       /* Start streaming */
> +       ret =3D cci_write(imx681->cci, IMX681_REG_MODE_SELECT,
> +                       IMX681_MODE_STREAMING, NULL);
> +       if (ret) {
> +               dev_err(imx681->dev, "failed to start streaming: %d\n", r=
et);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int imx681_stop_streaming(struct imx681 *imx681)
> +{
> +       int ret;
> +
> +       ret =3D cci_write(imx681->cci, IMX681_REG_MODE_SELECT,
> +                       IMX681_MODE_STANDBY, NULL);
> +       if (ret)
> +               dev_err(imx681->dev, "failed to stop streaming: %d\n", re=
t);
> +
> +       return ret;
> +}
> +
> +static int imx681_enable_streams(struct v4l2_subdev *sd,
> +                                struct v4l2_subdev_state *state,
> +                                u32 pad, u64 streams_mask)
> +{
> +       struct imx681 *imx681 =3D to_imx681(sd);
> +       int ret;
> +
> +       ret =3D pm_runtime_resume_and_get(imx681->dev);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D imx681_start_streaming(imx681);
> +       if (ret) {
> +               pm_runtime_put_autosuspend(imx681->dev);
> +               return ret;
> +       }
> +
> +       /*
> +        * The flips are read once, in imx681_start_streaming(), and they
> +        * choose the media bus code. Accepting a change now would report
> +        * success, leave the part as it is and leave the stored format
> +        * naming a code the sensor is no longer delivering.
> +        */
> +       __v4l2_ctrl_grab(imx681->hflip, true);
> +       __v4l2_ctrl_grab(imx681->vflip, true);
> +
> +       return 0;
> +}
> +
> +static int imx681_disable_streams(struct v4l2_subdev *sd,
> +                                 struct v4l2_subdev_state *state,
> +                                 u32 pad, u64 streams_mask)
> +{
> +       struct imx681 *imx681 =3D to_imx681(sd);
> +       int ret;
> +
> +       __v4l2_ctrl_grab(imx681->hflip, false);
> +       __v4l2_ctrl_grab(imx681->vflip, false);
> +
> +       ret =3D imx681_stop_streaming(imx681);
> +
> +       /* The reference goes back whether or not the part acknowledged. =
*/
> +       pm_runtime_put_autosuspend(imx681->dev);
> +
> +       return ret;
> +}
> +
> +static const struct v4l2_subdev_video_ops imx681_video_ops =3D {
> +       .s_stream =3D v4l2_subdev_s_stream_helper,
> +};
> +
> +static const struct v4l2_subdev_pad_ops imx681_pad_ops =3D {
> +       .enum_mbus_code =3D imx681_enum_mbus_code,
> +       .get_fmt =3D v4l2_subdev_get_fmt,
> +       .set_fmt =3D imx681_set_pad_format,
> +       .get_selection =3D imx681_get_selection,
> +       .enum_frame_size =3D imx681_enum_frame_size,
> +       .enable_streams =3D imx681_enable_streams,
> +       .disable_streams =3D imx681_disable_streams,
> +};
> +
> +static const struct v4l2_subdev_ops imx681_subdev_ops =3D {
> +       .video =3D &imx681_video_ops,
> +       .pad =3D &imx681_pad_ops,
> +};
> +
> +static const struct v4l2_subdev_internal_ops imx681_internal_ops =3D {
> +       .init_state =3D imx681_init_state,
> +};
> +
> +/* Power management */
> +static int imx681_power_on(struct device *dev)
> +{
> +       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +       struct imx681 *imx681 =3D to_imx681(sd);
> +       int ret;
> +
> +       ret =3D regulator_bulk_enable(ARRAY_SIZE(imx681_supply_names), im=
x681->supplies);
> +       if (ret) {
> +               dev_err(imx681->dev, "failed to enable regulators: %d\n",=
 ret);
> +               return ret;
> +       }
> +
> +       ret =3D clk_prepare_enable(imx681->xclk);
> +       if (ret) {
> +               dev_err(imx681->dev, "failed to enable clock: %d\n", ret)=
;
> +               goto err_reg_disable;
> +       }
> +
> +       /* Deassert reset (active low) */
> +       gpiod_set_value_cansleep(imx681->reset_gpio, 0);
> +
> +       usleep_range(IMX681_RESET_DELAY_US,
> +                    IMX681_RESET_DELAY_US + IMX681_RESET_DELAY_RANGE_US)=
;
> +
> +       return 0;
> +
> +err_reg_disable:
> +       regulator_bulk_disable(ARRAY_SIZE(imx681_supply_names), imx681->s=
upplies);
> +
> +       return ret;
> +}
> +
> +static int imx681_power_off(struct device *dev)
> +{
> +       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +       struct imx681 *imx681 =3D to_imx681(sd);
> +
> +       /* Assert reset */
> +       gpiod_set_value_cansleep(imx681->reset_gpio, 1);
> +       clk_disable_unprepare(imx681->xclk);
> +       regulator_bulk_disable(ARRAY_SIZE(imx681_supply_names), imx681->s=
upplies);
> +
> +       return 0;
> +}
> +
> +static int imx681_identify_module(struct imx681 *imx681)
> +{
> +       u64 val;
> +       int ret;
> +
> +       ret =3D cci_read(imx681->cci, IMX681_REG_CHIP_ID, &val, NULL);
> +       if (ret)
> +               return dev_err_probe(imx681->dev, ret,
> +                                    "failed to read chip ID register 0x0=
016\n");
> +
> +       if (val !=3D IMX681_CHIP_ID) {
> +               return dev_err_probe(imx681->dev, -EIO,
> +                                    "chip ID mismatch: 0x%04llx !=3D 0x%=
04x\n",
> +                                    val, IMX681_CHIP_ID);
> +       }
> +
> +       return 0;
> +}
> +
> +static int imx681_init_controls(struct imx681 *imx681)
> +{
> +       struct v4l2_ctrl_handler *ctrl_hdlr =3D &imx681->ctrl_handler;
> +       struct v4l2_fwnode_device_properties props;
> +       struct v4l2_ctrl *link_freq;
> +       s64 hblank, vblank;
> +       int ret;
> +
> +       ret =3D v4l2_fwnode_device_parse(imx681->dev, &props);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D v4l2_ctrl_handler_init(ctrl_hdlr, 16);
> +       if (ret)
> +               return ret;
> +
> +       /* Pixel rate (read-only) */
> +       v4l2_ctrl_new_std(ctrl_hdlr, &imx681_ctrl_ops,
> +                         V4L2_CID_PIXEL_RATE, IMX681_PIXEL_RATE,
> +                         IMX681_PIXEL_RATE, 1, IMX681_PIXEL_RATE);
> +
> +       /* Link frequency (read-only) */
> +       link_freq =3D v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx681_ctrl_ops,
> +                                          V4L2_CID_LINK_FREQ,
> +                                          __fls(imx681->link_freq_bitmap=
),
> +                                          __ffs(imx681->link_freq_bitmap=
),
> +                                          imx681_link_frequencies);
> +       if (link_freq)
> +               link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> +
> +       /* Horizontal blanking (read-only, fixed) */
> +       hblank =3D IMX681_LINE_LENGTH_PCK - IMX681_WIDTH;
> +       imx681->hblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx681_ctrl_ops,
> +                                          V4L2_CID_HBLANK, hblank, hblan=
k,
> +                                          1, hblank);
> +       if (imx681->hblank)
> +               imx681->hblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> +
> +       /* Vertical blanking (writable to allow longer exposures) */
> +       vblank =3D IMX681_FRAME_LENGTH_LINES - IMX681_HEIGHT;
> +       imx681->vblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx681_ctrl_ops,
> +                                          V4L2_CID_VBLANK, vblank,
> +                                          IMX681_FRAME_LENGTH_MAX - IMX6=
81_HEIGHT,
> +                                          1, vblank);
> +
> +       /* Exposure */
> +       imx681->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx681_ctrl_op=
s,
> +                                            V4L2_CID_EXPOSURE,
> +                                            IMX681_EXPOSURE_MIN,
> +                                            IMX681_FRAME_LENGTH_LINES -
> +                                            IMX681_EXPOSURE_MARGIN, 1,
> +                                            IMX681_EXPOSURE_DEFAULT);
> +
> +       /*
> +        * Both flips move the Bayer phase, so the media bus code changes=
 with
> +        * them and the layout flag has to say so.
> +        */
> +       imx681->hflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx681_ctrl_ops,
> +                                         V4L2_CID_HFLIP, 0, 1, 1, 0);
> +       imx681->vflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx681_ctrl_ops,
> +                                         V4L2_CID_VFLIP, 0, 1, 1, 0);
> +       if (imx681->hflip)
> +               imx681->hflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> +       if (imx681->vflip)
> +               imx681->vflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> +
> +       /* Analog gain */
> +       v4l2_ctrl_new_std(ctrl_hdlr, &imx681_ctrl_ops, V4L2_CID_ANALOGUE_=
GAIN,
> +                         IMX681_ANA_GAIN_MIN, IMX681_ANA_GAIN_MAX, 1,
> +                         IMX681_ANA_GAIN_DEFAULT);
> +
> +       /* Digital gain */
> +       v4l2_ctrl_new_std(ctrl_hdlr, &imx681_ctrl_ops, V4L2_CID_DIGITAL_G=
AIN,
> +                         IMX681_DIG_GAIN_MIN, IMX681_DIG_GAIN_MAX, 1,
> +                         IMX681_DIG_GAIN_DEFAULT);
> +
> +       /* Test pattern */
> +       v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &imx681_ctrl_ops,
> +                                    V4L2_CID_TEST_PATTERN,
> +                                    ARRAY_SIZE(imx681_test_pattern_menu)=
 - 1,
> +                                    0, 0, imx681_test_pattern_menu);
> +
> +       /*
> +        * The solid-colour mode shows whatever is in these, and they res=
et to
> +        * zero - so without them the mode this driver advertises can onl=
y
> +        * ever produce a black frame. Default to white, as imx219 does.
> +        */
> +       v4l2_ctrl_new_std(ctrl_hdlr, &imx681_ctrl_ops,
> +                         V4L2_CID_TEST_PATTERN_RED, IMX681_TESTP_COLOUR_=
MIN,
> +                         IMX681_TESTP_COLOUR_MAX, IMX681_TESTP_COLOUR_ST=
EP,
> +                         IMX681_TESTP_COLOUR_MAX);
> +       v4l2_ctrl_new_std(ctrl_hdlr, &imx681_ctrl_ops,
> +                         V4L2_CID_TEST_PATTERN_GREENR, IMX681_TESTP_COLO=
UR_MIN,
> +                         IMX681_TESTP_COLOUR_MAX, IMX681_TESTP_COLOUR_ST=
EP,
> +                         IMX681_TESTP_COLOUR_MAX);
> +       v4l2_ctrl_new_std(ctrl_hdlr, &imx681_ctrl_ops,
> +                         V4L2_CID_TEST_PATTERN_BLUE, IMX681_TESTP_COLOUR=
_MIN,
> +                         IMX681_TESTP_COLOUR_MAX, IMX681_TESTP_COLOUR_ST=
EP,
> +                         IMX681_TESTP_COLOUR_MAX);
> +       v4l2_ctrl_new_std(ctrl_hdlr, &imx681_ctrl_ops,
> +                         V4L2_CID_TEST_PATTERN_GREENB, IMX681_TESTP_COLO=
UR_MIN,
> +                         IMX681_TESTP_COLOUR_MAX, IMX681_TESTP_COLOUR_ST=
EP,
> +                         IMX681_TESTP_COLOUR_MAX);
> +
> +       if (ctrl_hdlr->error) {
> +               ret =3D dev_err_probe(imx681->dev, ctrl_hdlr->error,
> +                                   "control init failed\n");
> +               goto error;
> +       }
> +
> +       ret =3D v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx681_ctrl_o=
ps,
> +                                             &props);
> +       if (ret)
> +               goto error;
> +
> +       imx681->sd.ctrl_handler =3D ctrl_hdlr;
> +
> +       return 0;
> +
> +error:
> +       v4l2_ctrl_handler_free(ctrl_hdlr);
> +
> +       return ret;
> +}
> +
> +static int imx681_parse_endpoint(struct imx681 *imx681)
> +{
> +       struct fwnode_handle *fwnode =3D dev_fwnode(imx681->dev);
> +       struct v4l2_fwnode_endpoint bus_cfg =3D {
> +               .bus_type =3D V4L2_MBUS_CSI2_DPHY,
> +       };
> +       struct fwnode_handle *ep;
> +       int ret;
> +
> +       ep =3D fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);
> +
> +       ret =3D v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +       fwnode_handle_put(ep);
> +       if (ret)
> +               return dev_err_probe(imx681->dev, ret,
> +                                    "failed to parse endpoint\n");
> +
> +       if (bus_cfg.bus.mipi_csi2.num_data_lanes !=3D IMX681_NUM_LANES) {
> +               ret =3D dev_err_probe(imx681->dev, -EINVAL,
> +                                   "expected %d data lanes, got %d\n",
> +                                   IMX681_NUM_LANES,
> +                                   bus_cfg.bus.mipi_csi2.num_data_lanes)=
;
> +               goto done;
> +       }
> +
> +       ret =3D v4l2_link_freq_to_bitmap(imx681->dev,
> +                                      bus_cfg.link_frequencies,
> +                                      bus_cfg.nr_of_link_frequencies,
> +                                      imx681_link_frequencies,
> +                                      ARRAY_SIZE(imx681_link_frequencies=
),
> +                                      &imx681->link_freq_bitmap);
> +       if (ret)
> +               ret =3D dev_err_probe(imx681->dev, ret,
> +                                   "link frequency mismatch\n");
> +
> +done:
> +       v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +       return ret;
> +}
> +
> +static int imx681_probe(struct i2c_client *client)
> +{
> +       struct imx681 *imx681;
> +       int ret;
> +
> +       imx681 =3D devm_kzalloc(&client->dev, sizeof(*imx681), GFP_KERNEL=
);
> +       if (!imx681)
> +               return -ENOMEM;
> +
> +       imx681->dev =3D &client->dev;
> +
> +       /* Initialise V4L2 subdev */
> +       v4l2_i2c_subdev_init(&imx681->sd, client, &imx681_subdev_ops);
> +
> +       /* Initialise CCI regmap for 16-bit register addresses */
> +       imx681->cci =3D devm_cci_regmap_init_i2c(client, 16);
> +       if (IS_ERR(imx681->cci))
> +               return dev_err_probe(imx681->dev, PTR_ERR(imx681->cci),
> +                                    "failed to init CCI\n");
> +
> +       /* Get clock (optional - INT3472 provides it on Surface devices) =
*/
> +       imx681->xclk =3D devm_clk_get_optional(imx681->dev, NULL);
> +       if (IS_ERR(imx681->xclk))
> +               return dev_err_probe(imx681->dev, PTR_ERR(imx681->xclk),
> +                                    "failed to get clock\n");
> +
> +       /*
> +        * Both PLLs in imx681_init_regs[] and the value written to
> +        * EXTCLK_FREQUENCY_MHZ assume this rate, so a different one woul=
d
> +        * configure the part for a clock it is not being given. Where th=
e
> +        * clock is not ours to see - INT3472 on this machine hands it ov=
er
> +        * outside the clk framework - there is nothing to check.
> +        */
> +       if (imx681->xclk) {
> +               unsigned long rate =3D clk_get_rate(imx681->xclk);
> +
> +               if (rate !=3D IMX681_XCLK_FREQ)
> +                       return dev_err_probe(imx681->dev, -EINVAL,
> +                                            "external clock is %lu Hz, t=
his driver needs %u\n",
> +                                            rate, IMX681_XCLK_FREQ);
> +       }
> +
> +       /* Get regulators */
> +       for (unsigned int i =3D 0; i < ARRAY_SIZE(imx681_supply_names); i=
++)
> +               imx681->supplies[i].supply =3D imx681_supply_names[i];
> +
> +       ret =3D devm_regulator_bulk_get(imx681->dev, ARRAY_SIZE(imx681_su=
pply_names),
> +                                     imx681->supplies);
> +       if (ret)
> +               return dev_err_probe(imx681->dev, ret,
> +                                    "failed to get regulators\n");
> +
> +       /* Get reset GPIO (optional) */
> +       imx681->reset_gpio =3D devm_gpiod_get_optional(imx681->dev, "rese=
t",
> +                                                    GPIOD_OUT_HIGH);
> +       if (IS_ERR(imx681->reset_gpio))
> +               return dev_err_probe(imx681->dev,
> +                                    PTR_ERR(imx681->reset_gpio),
> +                                    "failed to get reset GPIO\n");
> +
> +       /* Parse CSI-2 endpoint */
> +       ret =3D imx681_parse_endpoint(imx681);
> +       if (ret)
> +               return dev_err_probe(imx681->dev, ret,
> +                                    "endpoint parse failed\n");
> +
> +       /* Power on and verify chip ID */
> +       ret =3D imx681_power_on(imx681->dev);
> +       if (ret)
> +               return dev_err_probe(imx681->dev, ret, "power on failed\n=
");
> +
> +       ret =3D imx681_identify_module(imx681);
> +       if (ret)
> +               goto error_power_off;
> +
> +       /* Enable runtime PM */
> +       pm_runtime_set_active(imx681->dev);
> +       pm_runtime_enable(imx681->dev);
> +       pm_runtime_set_autosuspend_delay(imx681->dev, 1000);
> +       pm_runtime_use_autosuspend(imx681->dev);
> +
> +       /* Init V4L2 controls */
> +       ret =3D imx681_init_controls(imx681);
> +       if (ret)
> +               goto error_pm;
> +
> +       /* Setup subdev */
> +       imx681->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> +       imx681->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> +       imx681->sd.internal_ops =3D &imx681_internal_ops;
> +
> +       /* Init media entity */
> +       imx681->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> +       ret =3D media_entity_pads_init(&imx681->sd.entity, 1, &imx681->pa=
d);
> +       if (ret) {
> +               ret =3D dev_err_probe(imx681->dev, ret,
> +                                   "media entity init failed\n");
> +               goto error_handler_free;
> +       }
> +
> +       imx681->sd.state_lock =3D imx681->ctrl_handler.lock;
> +       ret =3D v4l2_subdev_init_finalize(&imx681->sd);
> +       if (ret < 0) {
> +               ret =3D dev_err_probe(imx681->dev, ret,
> +                                   "subdev init finalize failed\n");
> +               goto error_media_entity;
> +       }
> +
> +       ret =3D v4l2_async_register_subdev_sensor(&imx681->sd);
> +       if (ret < 0) {
> +               ret =3D dev_err_probe(imx681->dev, ret,
> +                                   "async register subdev failed\n");
> +               goto error_subdev_cleanup;
> +       }
> +
> +       pm_runtime_idle(imx681->dev);
> +
> +       return 0;
> +
> +error_subdev_cleanup:
> +       v4l2_subdev_cleanup(&imx681->sd);
> +error_media_entity:
> +       media_entity_cleanup(&imx681->sd.entity);
> +error_handler_free:
> +       v4l2_ctrl_handler_free(imx681->sd.ctrl_handler);
> +error_pm:
> +       pm_runtime_disable(imx681->dev);
> +       pm_runtime_set_suspended(imx681->dev);
> +error_power_off:
> +       imx681_power_off(imx681->dev);
> +
> +       return ret;
> +}
> +
> +static void imx681_remove(struct i2c_client *client)
> +{
> +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +       struct imx681 *imx681 =3D to_imx681(sd);
> +
> +       v4l2_async_unregister_subdev(sd);
> +       v4l2_subdev_cleanup(&imx681->sd);
> +       media_entity_cleanup(&sd->entity);
> +       v4l2_ctrl_handler_free(imx681->sd.ctrl_handler);
> +
> +       pm_runtime_disable(imx681->dev);
> +       if (!pm_runtime_status_suspended(imx681->dev)) {
> +               imx681_power_off(imx681->dev);
> +               pm_runtime_set_suspended(imx681->dev);
> +       }
> +       pm_runtime_dont_use_autosuspend(imx681->dev);
> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(imx681_pm_ops, imx681_power_off,
> +                                imx681_power_on, NULL);
> +
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id imx681_acpi_ids[] =3D {
> +       { "SONY0681" },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(acpi, imx681_acpi_ids);
> +#endif
> +
> +static const struct of_device_id imx681_dt_ids[] =3D {
> +       { .compatible =3D "sony,imx681" },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx681_dt_ids);
> +
> +static struct i2c_driver imx681_i2c_driver =3D {
> +       .driver =3D {
> +               .name =3D "imx681",
> +               .pm =3D pm_ptr(&imx681_pm_ops),
> +               .acpi_match_table =3D ACPI_PTR(imx681_acpi_ids),
> +               .of_match_table =3D imx681_dt_ids,
> +       },
> +       .probe =3D imx681_probe,
> +       .remove =3D imx681_remove,
> +};
> +module_i2c_driver(imx681_i2c_driver);
> +
> +MODULE_DESCRIPTION("Sony IMX681 CMOS Image Sensor Driver");
> +MODULE_AUTHOR("Andre Gilerson <andre.gilerson@gmail.com>");
> +MODULE_LICENSE("GPL");
> --
> 2.54.0 (Apple Git-157)
>
>
