Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963869;
	b=KoEZOZNV4rfNkx/IjBkAHAvxWzIIBvBSznzXk3iohu+9uYZRxrTJHXW/7vDmA5iv8fyn
	 xqt2fxIzlbrgE+ZY0HY6Jsk/MUHzm+7S/go+D7e/GVBcfEuSLH0e50KLrwssrKzwVMyJ9
	 ncqKDFhUgkr2lUp9AcWcNb8vQn80SMVBa6juJOy/GRIM/vIPPdRWEwwJdcVp0FaWLYBly
	 ftK9xCru6hVppXTdyBVLRwtAKdwK5DYDflyzVbn+0eitMFncA/ppK6SbeNYgWt1uFel8Y
	 e9HJOJHcSPm54VHH483ul8qng4NXc6BL1nHX+YyxhAXcm+jHH2O88X4sd3UxL/eFZbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963869;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:From:To:Cc:
	 Subject:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=xEA4Hb7j/OrGazctFkg7tSe/TF+ozoyqkNcM1hGno8k=;
	b=VfZYR7EX8yAFym8pHUCqQTeiK0dzU3a70JRh3W1f/HJSoBj/aXKnC0KuTFdX7mzbNw9H
	 8Nm4vCQ7YPrqCLcKi2ooa4CdOaBcFVR5n+BoIdqYOJMWE8qJ0WvTDRn9z2LhbU82I2oBb
	 C+79AtTXVTXgpeSWivb38ggzAxic1+kMc/wS9iTraiSUvmGkUDLhd2U5HrtMe2Vw1iOlp
	 n4FsRNcwwdvW5WvmjJBzfc9TIALVykrMa0MPAvoHIwzzZuzHra4GZ1lBcVQxe8Q/TusnY
	 L8WPrbbHRodKAFGpHJakmgYhwyLze8NtwpdpM8iKJklhTgW0thWvRkx2N/F7c1oz/cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=oqrnw5zv;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496C5606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:17:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 496C5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=oqrnw5zv
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AD5151A13B6;
	Fri,  6 Nov 2026 11:17:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 724F95FFBC;
	Fri,  6 Nov 2026 11:17:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8E4BA1032929C;
	Fri,  6 Nov 2026 12:17:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793963864; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xEA4Hb7j/OrGazctFkg7tSe/TF+ozoyqkNcM1hGno8k=;
	b=oqrnw5zvBI98qN+3Vq6gQRfHn//FurvyjlpS38Q+U74jGI93LevoQaarBJOQXccER/bSi0
	0Bc6ES8yMIorUQB3bsqPh79D5LGBTxg8OnkKSpoTsPE0uGfSMTU7HEQM8jUzWiaCp2xvi1
	3JjLMIHXeo7G0kM2XeNrFas42wMOh6hrFPMqaJ77F1ZGU7LC3037S4/FaAmmYF+XObElND
	PC2aRGlgDSaxUnFPWTREDlMPE1YCfzXJHZZYzCyWmo339VZC8caA5va/bIGVLiXrgSB1x6
	iDlBYjYSZ1IOzgkkSMLcTwNNNNFVoqcRCC5miz80ZiS+2Dpp+KHTJx2fpv4XKw==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Nov 2026 12:17:40 +0100
Message-Id: <DMO344BLD9UQ.2X4YL7T3UZOWL@bootlin.com>
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Paul Louvel" <paul.louvel@bootlin.com>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Herve Codina"
 <herve.codina@bootlin.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v5 3/3] regulator: Add TI LM51772 support
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261106-paul-lm51772-v5-0-0e83ac9711d9@bootlin.com>
 <20261106-paul-lm51772-v5-3-0e83ac9711d9@bootlin.com>
In-Reply-To: <20261106-paul-lm51772-v5-3-0e83ac9711d9@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Nov 6, 2026 at 11:12 AM CET, Paul Louvel wrote:
> Add driver for the TI LM51772 buck-boost voltage regulator.
>
> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
> ---
>  MAINTAINERS                           |   1 +
>  drivers/regulator/Kconfig             |  11 +
>  drivers/regulator/Makefile            |   1 +
>  drivers/regulator/lm51772-regulator.c | 913 ++++++++++++++++++++++++++++=
++++++
>  4 files changed, 926 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c958e116cd66..a4c59be2551c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27465,6 +27465,7 @@ TI LM51772 BUCK-BOOST REGULATOR DRIVER
>  M:	Paul Louvel <paul.louvel@bootlin.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/regulator/ti,lm51772.yaml
> +F:	drivers/regulator/lm51772-regulator.c
> =20
>  TI LMP92064 ADC DRIVER
>  M:	Leonard G=C3=B6hrs <l.goehrs@pengutronix.de>
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index 7d151433747b..ce43a1dea33d 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -519,6 +519,17 @@ config REGULATOR_LM363X
>  	  One boost output voltage is configurable and always on.
>  	  Other LDOs are used for the display module.
> =20
> +config REGULATOR_LM51772
> +	tristate "TI LM51772 voltage regulator"
> +	depends on I2C
> +	select REGMAP_I2C
> +	help
> +	  This driver supports the TI LM51772 buck-boost controller, designed
> +	  for USB Power Delivery applications. It provides a software
> +	  configurable buck-boost output voltage and a fixed auxiliary 5 V LDO
> +	  output, both controlled over I2C. The driver supports voltage
> +	  setting, current limiting and fault/thermal reporting.
> +
>  config REGULATOR_LOCHNAGAR
>  	tristate "Cirrus Logic Lochnagar regulator driver"
>  	depends on MFD_LOCHNAGAR
> diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
> index 6aabcc54382a..783eda233e25 100644
> --- a/drivers/regulator/Makefile
> +++ b/drivers/regulator/Makefile
> @@ -61,6 +61,7 @@ obj-$(CONFIG_REGULATOR_ISL6271A) +=3D isl6271a-regulato=
r.o
>  obj-$(CONFIG_REGULATOR_ISL9305) +=3D isl9305.o
>  obj-$(CONFIG_REGULATOR_FP9931) +=3D fp9931.o
>  obj-$(CONFIG_REGULATOR_LM363X) +=3D lm363x-regulator.o
> +obj-$(CONFIG_REGULATOR_LM51772) +=3D lm51772-regulator.o
>  obj-$(CONFIG_REGULATOR_LOCHNAGAR) +=3D lochnagar-regulator.o
>  obj-$(CONFIG_REGULATOR_LP3971) +=3D lp3971.o
>  obj-$(CONFIG_REGULATOR_LP3972) +=3D lp3972.o
> diff --git a/drivers/regulator/lm51772-regulator.c b/drivers/regulator/lm=
51772-regulator.c
> new file mode 100644
> index 000000000000..4bbc3a31ecbd
> --- /dev/null
> +++ b/drivers/regulator/lm51772-regulator.c
> @@ -0,0 +1,913 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// TI LM51772 I2C regulator driver
> +//
> +// Datasheet: SNVSC22D (September 2025)
> +//
> +// Copyright (c) 2026 Bootlin
> +
> +#include <linux/array_size.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/find.h>
> +#include <linux/i2c.h>
> +#include <linux/linear_range.h>
> +#include <linux/math.h>
> +#include <linux/math64.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/regulator/coupler.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/string.h>
> +#include <linux/units.h>
> +
> +#define LM51772_SENSE_RES_DEFAULT_UOHM		10000
> +
> +#define LM51772_OVP_MIN				0x00
> +#define LM51772_OVP_DEFAULT			0x3F
> +
> +#define LM51772_VCC1_LDO_UV			5000000
> +#define LM51772_VCC1_LDO_NV			1
> +
> +#define LM51772_DISCHARGE_STRENGTH_MIN_UA	25000
> +#define LM51772_DISCHARGE_STRENGTH_STEP_UA	25000
> +#define LM51772_DISCHARGE_STRENGTH_MAX_UA	75000
> +
> +#define LM51772_ILIM_MIN_UV			5000
> +#define LM51772_ILIM_STEP_UV			500
> +#define LM51772_ILIM_MIN_SEL			0x0A
> +#define LM51772_ILIM_MAX_SEL			0x8C
> +#define LM51772_ILIM_NSEL			0x100
> +
> +#define LM51772_ILIM_UV_TO_UA(rsns_uohm, uv)	(div_u64((u64)(uv) * MICRO,=
 (rsns_uohm)))
> +
> +#define LM51772_PCM_WINDOW_LOW_MAX		0x1F
> +#define LM51772_PCM_WINDOW_LOW_DFLT		0xC
> +#define LM51772_PCM_WINDOW_LOW_STEP_PERMILLE	25
> +
> +#define LM51772_IVP_VOLTAGE_DEFAULT		0xFF
> +
> +#define LM51772_DIV10_MIN_UV			1000000
> +#define LM51772_DIV10_STEP_UV			10000
> +
> +#define LM51772_DIV20_MIN_UV			3300000
> +#define LM51772_DIV20_STEP_UV			20000
> +
> +#define LM51772_N_REGS				2
> +
> +/* Register map (datasheet table 8-1) */
> +#define LM51772_REG_CLEAR_FAULTS		0x03
> +#define LM51772_REG_ILIM_THRESHOLD		0x0A
> +#define LM51772_REG_VOUT_TARGET1_LSB		0x0C
> +#define LM51772_REG_VOUT_TARGET1_MSB		0x0D
> +#define LM51772_REG_USB_PD_STATUS_0		0x21
> +#define LM51772_REG_STATUS_BYTE			0x78
> +#define LM51772_REG_USB_PD_CONTROL_0		0x81
> +#define LM51772_REG_MFR_SPECIFIC_D0		0xD0
> +#define LM51772_REG_MFR_SPECIFIC_D1		0xD1
> +#define LM51772_REG_MFR_SPECIFIC_D2		0xD2
> +#define LM51772_REG_MFR_SPECIFIC_D3		0xD3
> +#define LM51772_REG_MFR_SPECIFIC_D5		0xD5
> +#define LM51772_REG_MFR_SPECIFIC_D6		0xD6
> +#define LM51772_REG_MFR_SPECIFIC_D8		0xD8
> +#define LM51772_REG_MFR_SPECIFIC_D9		0xD9
> +#define LM51772_REG_IVP_VOLTAGE			0xDA
> +
> +#define LM51772_ILIM_THRESHOLD_MASK		GENMASK(7, 0)
> +
> +#define LM51772_VOUT_TARGET1_MASK		GENMASK(11, 0)
> +
> +/* USB_PD_CONTROL_0 bits */
> +#define LM51772_CONV_EN2			BIT(0)
> +
> +/* STATUS_BYTE bits */
> +#define LM51772_STAT_OTHER			BIT(0)
> +#define LM51772_STAT_CML			BIT(1)
> +#define LM51772_STAT_TEMP			BIT(2)
> +#define LM51772_STAT_IOUT			BIT(4)
> +#define LM51772_STAT_VOUT			BIT(5)
> +#define LM51772_STAT_OFF			BIT(6)
> +
> +/* MFR_SPECIFIC_D0 bits */
> +#define LM51772_IMON_LIMITER_EN			BIT(6)
> +#define LM51772_EN_VCC1				BIT(5)
> +#define LM51772_CONV_EN				BIT(0)
> +
> +/* MFR_SPECIFIC_D1 bits */
> +#define LM51772_EN_THER_WARN			BIT(7)
> +#define LM51772_THW_THRESHOLD_MASK		GENMASK(6, 5)
> +#define LM51772_EN_NINT				BIT(4)
> +
> +/* MFR_SPECIFIC_D2 bits */
> +#define LM51772_EN_ACTIVE_DVS			BIT(6)
> +#define LM51772_DVS_SLEW_RAMP_MASK		GENMASK(5, 4)
> +#define LM51772_DISCHARGE_STRENGTH_MASK		GENMASK(3, 2)
> +/* Discharge when either CONV_EN or CONV_EN2 is disabled. */
> +#define LM51772_DISCHARGE_CONFIG0		BIT(1)
> +/* Stop discharging when Vout approaches the threshold (Vout ~=3D 0.5V).=
 */
> +#define LM51772_DISCHARGE_CONFIG1		BIT(0)
> +
> +/* MFR_SPECIFIC_D3 bits */
> +#define LM51772_EN_IVP				BIT(7)
> +#define LM51772_SEL_IVR				BIT(6)
> +
> +/* MFR_SPECIFIC_D6 bits */
> +#define LM51772_CONFIG_SYNC_PIN_MASK		GENMASK(7, 6)
> +
> +/* MFR_SPECIFIC_D8 bits */
> +#define LM51772_SEL_FB_DIV20			BIT(7)
> +#define LM51772_EN_CDC				BIT(6)
> +
> +/* MFR_SPECIFIC_D9 bits */
> +#define LM51772_SEL_ISET_PIN			BIT(5)
> +#define LM51772_PCM_WINDOW_LOW_MASK		GENMASK(4, 0)
> +
> +struct lm51772_priv {
> +	bool nint;
> +	unsigned int ov_lim_uv;
> +	unsigned int vout_curr_table[LM51772_ILIM_NSEL];
> +	struct regulator_desc desc[LM51772_N_REGS];
> +};
> +
> +static int lm51772_regulator_set_thermal_protection(struct regulator_dev=
 *rdev, int lim,
> +						    int severity, bool enable)
> +{
> +	static const struct linear_range thw_range_celsius =3D LINEAR_RANGE(95,=
 0, 3, 15);
> +	unsigned int regval =3D 0, mask =3D 0, selector =3D 0;
> +	struct regmap *regmap =3D rdev_get_regmap(rdev);
> +	long celsius =3D 0;
> +	bool found;
> +	int ret;
> +
> +	if (severity !=3D REGULATOR_SEVERITY_WARN)
> +		return -EOPNOTSUPP;
> +
> +	if (lim !=3D 0) {
> +		celsius =3D kelvin_to_celsius(lim);
> +
> +		ret =3D linear_range_get_selector_low_array(&thw_range_celsius, 1, cel=
sius, &selector,
> +							  &found);
> +		if (ret || !found)
> +			return -EINVAL;
> +
> +		selector =3D thw_range_celsius.max_sel - selector;
> +
> +		regval |=3D FIELD_PREP(LM51772_THW_THRESHOLD_MASK, selector);
> +		mask |=3D LM51772_THW_THRESHOLD_MASK;
> +	}
> +
> +	regval |=3D FIELD_PREP(LM51772_EN_THER_WARN, enable ? 1 : 0);
> +	mask |=3D LM51772_EN_THER_WARN;
> +
> +	return regmap_update_bits(regmap, LM51772_REG_MFR_SPECIFIC_D1, mask, re=
gval);
> +}
> +
> +/*
> + * CONV_EN2 and CONV_EN are internally OR'ed, so if one of them if set, =
the
> + * converter operation is enabled.
> + * For the get path, also OR the two bits because a previous user might =
have
> + * set just one of them, and we can't know which one.
> + * For the set path, set both bits to be consistent.
> + */
> +
> +static int lm51772_set_conv_en(struct regmap *regmap, bool enable)
> +{
> +	int ret;
> +
> +	ret =3D regmap_update_bits(regmap, LM51772_REG_USB_PD_CONTROL_0, LM5177=
2_CONV_EN2,
> +				 FIELD_PREP(LM51772_CONV_EN2, enable));
> +	if (ret)
> +		return ret;
> +
> +	return regmap_update_bits(regmap, LM51772_REG_MFR_SPECIFIC_D0, LM51772_=
CONV_EN,
> +				  FIELD_PREP(LM51772_CONV_EN, enable));
> +}
> +
> +static int lm51772_get_conv_en(struct regmap *regmap)
> +{
> +	unsigned int pd_ctrl, cfg0;
> +	int ret;
> +
> +	ret =3D regmap_read(regmap, LM51772_REG_USB_PD_CONTROL_0, &pd_ctrl);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_read(regmap, LM51772_REG_MFR_SPECIFIC_D0, &cfg0);
> +	if (ret)
> +		return ret;
> +
> +	return FIELD_GET(LM51772_CONV_EN2, pd_ctrl) || FIELD_GET(LM51772_CONV_E=
N, cfg0);
> +}
> +
> +static int lm51772_regulator_enable(struct regulator_dev *rdev)
> +{
> +	return lm51772_set_conv_en(rdev_get_regmap(rdev), true);
> +}
> +
> +static int lm51772_regulator_disable(struct regulator_dev *rdev)
> +{
> +	return lm51772_set_conv_en(rdev_get_regmap(rdev), false);
> +}
> +
> +static int lm51772_regulator_is_enabled(struct regulator_dev *rdev)
> +{
> +	return lm51772_get_conv_en(rdev_get_regmap(rdev));
> +}
> +
> +static int lm51772_regulator_get_ramp_delay(struct regulator_dev *rdev, =
int old_uV, int new_uV)
> +{
> +	struct regmap *regmap =3D rdev_get_regmap(rdev);
> +	unsigned int reg, slew_rate_uv_per_us, sel;
> +	int ret, delay_us;
> +
> +	ret =3D regmap_read(regmap, LM51772_REG_MFR_SPECIFIC_D2, &reg);
> +	if (ret)
> +		return ret;
> +
> +	sel =3D FIELD_GET(LM51772_DVS_SLEW_RAMP_MASK, reg);
> +	slew_rate_uv_per_us =3D rdev->desc->ramp_delay_table[sel];
> +
> +	delay_us =3D DIV_ROUND_UP(abs(new_uV - old_uV), slew_rate_uv_per_us);
> +
> +	return delay_us;
> +}
> +
> +static int lm51772_regulator_set_voltage_time(struct regulator_dev *rdev=
, int old_uV, int new_uV)
> +{
> +	struct lm51772_priv *priv =3D rdev_get_drvdata(rdev);
> +
> +	if (!priv->ov_lim_uv)
> +		return lm51772_regulator_get_ramp_delay(rdev, old_uV, new_uV);
> +
> +	/* set_voltage_sel() already waited for the ramp when OVP is used. */
> +
> +	return 0;
> +}
> +
> +static int lm51772_set_ov(struct regulator_dev *rdev, int lim_uV)
> +{
> +	static const struct linear_range ovp_ranges[] =3D {
> +		LINEAR_RANGE(4000000, 0, 0x18, 500000),
> +		LINEAR_RANGE(16000000, 0x18, 0x3F, 1000000),
> +	};
> +	struct regmap *regmap =3D rdev_get_regmap(rdev);
> +	unsigned int sel;
> +	bool found;
> +	int ret;
> +
> +	ret =3D linear_range_get_selector_high_array(ovp_ranges, ARRAY_SIZE(ovp=
_ranges), lim_uV, &sel,
> +						   &found);
> +	if (ret)
> +		return ret;
> +
> +	if (!found)
> +		sel =3D LM51772_OVP_MIN;
> +
> +	return regmap_write(regmap, LM51772_REG_MFR_SPECIFIC_D5, sel);
> +}
> +
> +static int lm51772_regulator_set_voltage_sel(struct regulator_dev *rdev,=
 unsigned int sel)
> +{
> +	struct lm51772_priv *priv =3D rdev_get_drvdata(rdev);
> +	struct device *dev =3D rdev_get_dev(rdev);
> +	int curr_uv, new_uv, delay_us, ret;
> +
> +	if (!priv->ov_lim_uv)
> +		return regulator_set_voltage_sel_pickable_regmap(rdev, sel);
> +
> +	curr_uv =3D regulator_get_voltage_rdev(rdev);
> +	if (curr_uv < 0)
> +		return curr_uv;
> +
> +	new_uv =3D regulator_list_voltage_pickable_linear_range(rdev, sel);
> +	if (new_uv < 0)
> +		return new_uv;
> +
> +	delay_us =3D lm51772_regulator_get_ramp_delay(rdev, curr_uv, new_uv);
> +	if (delay_us < 0)
> +		return delay_us;
> +
> +	if (new_uv > curr_uv) {
> +		ret =3D lm51772_set_ov(rdev, new_uv + priv->ov_lim_uv);
> +		if (ret) {
> +			/* Abort the voltage change, because it will trip the OVP. */
> +			return ret;
> +		}
> +	}
> +
> +	ret =3D regulator_set_voltage_sel_pickable_regmap(rdev, sel);
> +	if (ret)
> +		return ret;
> +
> +	fsleep(delay_us);
> +
> +	if (new_uv < curr_uv) {
> +		ret =3D lm51772_set_ov(rdev, new_uv + priv->ov_lim_uv);
> +		if (ret) {
> +			/* The OVP is not precise anymore, but it is still > new voltage. */
> +			dev_warn(dev, "failed to set OVP after voltage change\n");
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int lm51772_regulator_set_over_voltage_protection(struct regulato=
r_dev *rdev, int lim_uV,
> +							 int severity, bool enable)
> +{
> +	struct lm51772_priv *priv =3D rdev_get_drvdata(rdev);
> +	int ret;
> +
> +	if (!enable)
> +		return -EOPNOTSUPP;
> +
> +	if (severity !=3D REGULATOR_SEVERITY_PROT)
> +		return -EOPNOTSUPP;
> +
> +	priv->ov_lim_uv =3D lim_uV;
> +
> +	/* Use default OVP threshold when no limit is requested. */
> +	if (!lim_uV)
> +		return regmap_write(rdev_get_regmap(rdev), LM51772_REG_MFR_SPECIFIC_D5=
,
> +				    LM51772_OVP_DEFAULT);
> +
> +	ret =3D regulator_get_voltage_rdev(rdev);
> +	if (ret < 0)
> +		return ret;
> +
> +	return lm51772_set_ov(rdev, ret + lim_uV);
> +}
> +
> +static unsigned int lm51772_status2err(unsigned int status_reg)
> +{
> +	unsigned int errors =3D 0;
> +
> +	/*
> +	 * The BUSY bit (bit 7) is only meaningful during device startup.
> +	 * The INPUT bit (bit 3) reports a VIN_UV condition, which is not a
> +	 * regulator output error. Ignore both.
> +	 */
> +
> +	if (status_reg & LM51772_STAT_TEMP)
> +		errors |=3D (status_reg & LM51772_STAT_OFF) ? REGULATOR_ERROR_OVER_TEM=
P :
> +							    REGULATOR_ERROR_OVER_TEMP_WARN;
> +
> +	if (status_reg & LM51772_STAT_IOUT)
> +		errors |=3D REGULATOR_ERROR_OVER_CURRENT;
> +
> +	if (status_reg & LM51772_STAT_VOUT)
> +		errors |=3D REGULATOR_ERROR_OVER_VOLTAGE_WARN;
> +
> +	if (status_reg & LM51772_STAT_CML || status_reg & LM51772_STAT_OTHER)
> +		errors |=3D REGULATOR_ERROR_FAIL;
> +
> +	return errors;
> +}
> +
> +static int lm51772_get_error_flags(struct regulator_dev *rdev, unsigned =
int *flags)
> +{
> +	struct regmap *regmap =3D rdev_get_regmap(rdev);
> +	unsigned int reg;
> +	int ret;
> +
> +	ret =3D regmap_read(regmap, LM51772_REG_STATUS_BYTE, &reg);
> +	if (ret)
> +		return ret;
> +
> +	*flags =3D lm51772_status2err(reg);
> +
> +	return 0;
> +}
> +
> +static int lm51772_irq_map_event(int irq, struct regulator_irq_data *rid=
, unsigned long *dev_mask)
> +{
> +	struct regmap *regmap =3D rid->data;
> +	unsigned int status, reg, errors;
> +	size_t bit;
> +	int ret;
> +
> +	ret =3D regmap_read(regmap, LM51772_REG_STATUS_BYTE, &status);
> +	if (ret)
> +		return REGULATOR_FAILED_RETRY;
> +
> +	ret =3D regmap_read(regmap, LM51772_REG_CLEAR_FAULTS, &reg);
> +	if (ret)
> +		return REGULATOR_FAILED_RETRY;
> +
> +	errors =3D lm51772_status2err(status);
> +
> +	rid->states[0].notifs =3D (status & LM51772_STAT_OFF) ? REGULATOR_EVENT=
_DISABLE : 0;
> +	rid->states[1].notifs =3D 0;
> +
> +	rid->opaque =3D status;
> +
> +	for (size_t i =3D 0; i < rid->num_states; i++) {
> +		rid->states[i].errors =3D errors & rid->states[i].possible_errs;
> +
> +		for_each_set_bit(bit, &rid->states[i].errors, BITS_PER_TYPE(rid->state=
s[i].errors))
> +			rid->states[i].notifs |=3D regulator_err2notif(BIT(bit));
> +
> +		if (rid->states[i].errors || rid->states[i].notifs)
> +			*dev_mask |=3D BIT(i);
> +	}
> +
> +	return 0;
> +}
> +
> +static int lm51772_irq_renable(struct regulator_irq_data *rid)
> +{
> +	struct regmap *regmap =3D rid->data;
> +	unsigned int reg;
> +	int ret;
> +
> +	ret =3D regmap_read(regmap, LM51772_REG_STATUS_BYTE, &reg);
> +	if (ret)
> +		return REGULATOR_FAILED_RETRY;
> +
> +	if (rid->opaque && rid->opaque =3D=3D reg) {
> +		ret =3D regmap_read(regmap, LM51772_REG_CLEAR_FAULTS, &reg);
> +		if (ret)
> +			return REGULATOR_FAILED_RETRY;
> +
> +		return REGULATOR_ERROR_ON;
> +	}
> +
> +	rid->opaque =3D 0;
> +
> +	return REGULATOR_ERROR_CLEARED;
> +}
> +
> +static int lm51772_vout_of_parse(struct device_node *np, const struct re=
gulator_desc *desc,
> +				 struct regulator_config *cfg)
> +{
> +	u32 active_discharge_strength, pcm_window_low;
> +	unsigned int mask, val;
> +	int ret;
> +
> +	ret =3D of_property_read_u32(np, "ti,active-discharge-strength-microamp=
",
> +				   &active_discharge_strength);
> +	if (ret && ret !=3D -EINVAL)
> +		return ret;
> +
> +	if (ret =3D=3D -EINVAL) {
> +		active_discharge_strength =3D 0;
> +	} else {
> +		if (active_discharge_strength < LM51772_DISCHARGE_STRENGTH_MIN_UA ||
> +		    active_discharge_strength > LM51772_DISCHARGE_STRENGTH_MAX_UA ||
> +		    active_discharge_strength % LM51772_DISCHARGE_STRENGTH_STEP_UA)
> +			return -EINVAL;
> +
> +		active_discharge_strength =3D
> +			active_discharge_strength / LM51772_DISCHARGE_STRENGTH_STEP_UA - 1;
> +	}
> +
> +	ret =3D of_property_read_u32(np, "ti,pcm-window-low-permille", &pcm_win=
dow_low);
> +	if (ret && ret !=3D -EINVAL)
> +		return ret;
> +
> +	if (ret =3D=3D -EINVAL) {
> +		pcm_window_low =3D LM51772_PCM_WINDOW_LOW_DFLT;
> +	} else {
> +		if (pcm_window_low % LM51772_PCM_WINDOW_LOW_STEP_PERMILLE)
> +			return -EINVAL;
> +
> +		pcm_window_low /=3D LM51772_PCM_WINDOW_LOW_STEP_PERMILLE;
> +		if (pcm_window_low > LM51772_PCM_WINDOW_LOW_MAX)
> +			return -EINVAL;
> +	}
> +
> +	mask =3D LM51772_DISCHARGE_STRENGTH_MASK | LM51772_EN_ACTIVE_DVS;
> +	val =3D FIELD_PREP(LM51772_DISCHARGE_STRENGTH_MASK, active_discharge_st=
rength) |
> +	      FIELD_PREP(LM51772_EN_ACTIVE_DVS, 1);
> +
> +	ret =3D regmap_update_bits(cfg->regmap, LM51772_REG_MFR_SPECIFIC_D2, ma=
sk, val);
> +	if (ret)
> +		return ret;
> +
> +	mask =3D LM51772_PCM_WINDOW_LOW_MASK;
> +	val =3D FIELD_PREP(LM51772_PCM_WINDOW_LOW_MASK, pcm_window_low);
> +
> +	ret =3D regmap_update_bits(cfg->regmap, LM51772_REG_MFR_SPECIFIC_D9, ma=
sk, val);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static const struct regulator_ops lm51772_reg_default_ops =3D {
> +	.list_voltage =3D regulator_list_voltage_pickable_linear_range,
> +	.map_voltage =3D regulator_map_voltage_pickable_linear_range,
> +	.get_voltage_sel =3D regulator_get_voltage_sel_pickable_regmap,
> +	.set_voltage_sel =3D lm51772_regulator_set_voltage_sel,
> +	.set_over_voltage_protection =3D lm51772_regulator_set_over_voltage_pro=
tection,
> +	.set_thermal_protection =3D lm51772_regulator_set_thermal_protection,
> +	.set_active_discharge =3D regulator_set_active_discharge_regmap,
> +	.get_current_limit =3D regulator_get_current_limit_regmap,
> +	.set_current_limit =3D regulator_set_current_limit_regmap,
> +	.set_voltage_time =3D lm51772_regulator_set_voltage_time,
> +	.get_error_flags =3D lm51772_get_error_flags,
> +	.set_ramp_delay =3D regulator_set_ramp_delay_regmap,
> +	.is_enabled =3D lm51772_regulator_is_enabled,
> +	.enable =3D lm51772_regulator_enable,
> +	.disable =3D lm51772_regulator_disable
> +};
> +
> +static const struct regulator_ops lm51772_reg_iset_ops =3D {
> +	.list_voltage =3D regulator_list_voltage_pickable_linear_range,
> +	.map_voltage =3D regulator_map_voltage_pickable_linear_range,
> +	.get_voltage_sel =3D regulator_get_voltage_sel_pickable_regmap,
> +	.set_voltage_sel =3D lm51772_regulator_set_voltage_sel,
> +	.set_over_voltage_protection =3D lm51772_regulator_set_over_voltage_pro=
tection,
> +	.set_thermal_protection =3D lm51772_regulator_set_thermal_protection,
> +	.set_active_discharge =3D regulator_set_active_discharge_regmap,
> +	.set_voltage_time =3D lm51772_regulator_set_voltage_time,
> +	.get_error_flags =3D lm51772_get_error_flags,
> +	.set_ramp_delay =3D regulator_set_ramp_delay_regmap,
> +	.is_enabled =3D lm51772_regulator_is_enabled,
> +	.enable =3D lm51772_regulator_enable,
> +	.disable =3D lm51772_regulator_disable
> +};
> +
> +static int lm51772_of_parse(struct lm51772_priv *priv, struct device *de=
v, struct regmap *regmap)
> +{
> +	static const char *const sync_pin_modes[] =3D {
> +		"input-rising",
> +		"input-falling",
> +		"output-rising",
> +		"output-falling",
> +	};
> +	static const char *const input_voltage_modes[] =3D {
> +		"protection",
> +		"regulation",
> +	};
> +	static const struct linear_range ivp_ranges[] =3D {
> +		LINEAR_RANGE(4750000, 0x00, 0x94, 125000),
> +		LINEAR_RANGE(23500000, 0x95, 0xff, 250000)
> +	};
> +	bool ivp =3D false, ivr =3D false, cable_drop_compensation, found, iset=
_pin;
> +	const char *input_voltage_mode, *sync_pin_mode;
> +	struct regulator_desc *vout =3D &priv->desc[0];
> +	unsigned int sync_pin, selector, uv;
> +	u32 ivp_thres, sense_res_micro_ohms;
> +	int ret;
> +
> +	ret =3D device_property_read_string(dev, "ti,input-voltage-mode", &inpu=
t_voltage_mode);
> +	if (ret && ret !=3D -EINVAL)
> +		return ret;
> +
> +	if (ret =3D=3D 0) {
> +		ret =3D match_string(input_voltage_modes, ARRAY_SIZE(input_voltage_mod=
es),
> +				   input_voltage_mode);
> +		if (ret < 0)
> +			return -EINVAL;
> +
> +		/* IVP is required for IVR to operate. */
> +		ivp =3D true;
> +		ivr =3D ret =3D=3D 1;
> +	}
> +
> +	iset_pin =3D device_property_read_bool(dev, "ti,iset-pin");
> +	priv->nint =3D device_property_read_bool(dev, "ti,nint");
> +	cable_drop_compensation =3D device_property_read_bool(dev, "ti,cable-dr=
op-compensation");
> +
> +	ret =3D device_property_read_string(dev, "ti,sync-pin", &sync_pin_mode)=
;
> +	if (ret && ret !=3D -EINVAL)
> +		return ret;
> +
> +	if (ret =3D=3D -EINVAL) {
> +		sync_pin =3D 0;
> +	} else {
> +		ret =3D match_string(sync_pin_modes, ARRAY_SIZE(sync_pin_modes), sync_=
pin_mode);
> +		if (ret < 0)
> +			return -EINVAL;
> +
> +		sync_pin =3D ret;
> +	}
> +
> +	ret =3D device_property_read_u32(dev, "shunt-resistor-micro-ohms", &sen=
se_res_micro_ohms);
> +	if (ret && ret !=3D -EINVAL)
> +		return ret;
> +
> +	if (ret =3D=3D -EINVAL)
> +		sense_res_micro_ohms =3D LM51772_SENSE_RES_DEFAULT_UOHM;
> +	else
> +		if (!sense_res_micro_ohms)
> +			return -EINVAL;
> +
> +	ret =3D device_property_read_u32(dev, "ti,ivp-thres-microvolt", &ivp_th=
res);
> +	if (ret && ret !=3D -EINVAL)
> +		return ret;
> +
> +	if (ret =3D=3D -EINVAL) {
> +		ivp_thres =3D LM51772_IVP_VOLTAGE_DEFAULT;
> +	} else {
> +		ret =3D linear_range_get_selector_low_array(
> +			ivp_ranges, ARRAY_SIZE(ivp_ranges), ivp_thres,
> +			&selector, &found);
> +		if (ret || !found)
> +			return -EINVAL;
> +
> +		ret =3D linear_range_get_value_array(
> +			ivp_ranges, ARRAY_SIZE(ivp_ranges), selector, &uv);
> +		if (ret)
> +			return -EINVAL;
> +
> +		if (uv !=3D ivp_thres)
> +			return -EINVAL;
> +
> +		ivp_thres =3D selector;
> +	}
> +
> +	if (iset_pin) {
> +		vout->ops =3D &lm51772_reg_iset_ops;
> +	} else {
> +		unsigned int curr_uV =3D LM51772_ILIM_MIN_UV;
> +
> +		for (size_t i =3D 0; i < LM51772_ILIM_NSEL; i++) {
> +			priv->vout_curr_table[i] =3D
> +				LM51772_ILIM_UV_TO_UA(sense_res_micro_ohms, curr_uV);
> +
> +			if (i >=3D LM51772_ILIM_MIN_SEL && i < LM51772_ILIM_MAX_SEL)
> +				curr_uV +=3D LM51772_ILIM_STEP_UV;
> +		}
> +
> +		vout->csel_mask =3D LM51772_ILIM_THRESHOLD_MASK;
> +		vout->csel_reg =3D LM51772_REG_ILIM_THRESHOLD;
> +		vout->n_current_limits =3D LM51772_ILIM_NSEL;
> +		vout->curr_table =3D priv->vout_curr_table;
> +
> +		vout->ops =3D &lm51772_reg_default_ops;
> +	}
> +
> +	ret =3D regmap_update_bits(
> +		regmap, LM51772_REG_MFR_SPECIFIC_D3, LM51772_EN_IVP | LM51772_SEL_IVR,
> +		FIELD_PREP(LM51772_EN_IVP, ivp) | FIELD_PREP(LM51772_SEL_IVR, ivr));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_update_bits(regmap, LM51772_REG_MFR_SPECIFIC_D0, LM51772=
_IMON_LIMITER_EN,
> +				 FIELD_PREP(LM51772_IMON_LIMITER_EN, 1));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_update_bits(regmap, LM51772_REG_MFR_SPECIFIC_D6, LM51772=
_CONFIG_SYNC_PIN_MASK,
> +				 FIELD_PREP(LM51772_CONFIG_SYNC_PIN_MASK, sync_pin));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_update_bits(regmap, LM51772_REG_MFR_SPECIFIC_D8, LM51772=
_EN_CDC,
> +				 FIELD_PREP(LM51772_EN_CDC, cable_drop_compensation));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_update_bits(regmap, LM51772_REG_MFR_SPECIFIC_D9, LM51772=
_SEL_ISET_PIN,
> +				 FIELD_PREP(LM51772_SEL_ISET_PIN, iset_pin));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_write(regmap, LM51772_REG_IVP_VOLTAGE, ivp_thres);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int lm51772_setup_irq(struct device *dev, struct regmap *regmap, =
int irq,
> +			     struct regulator_dev *rdev[LM51772_N_REGS], bool nint)
> +{
> +	int common_errs =3D REGULATOR_ERROR_OVER_TEMP | REGULATOR_ERROR_OVER_TE=
MP_WARN |
> +			  REGULATOR_ERROR_FAIL;
> +	int per_rdev_errs[] =3D {
> +		REGULATOR_ERROR_OVER_CURRENT | REGULATOR_ERROR_OVER_VOLTAGE_WARN,
> +		0,
> +	};
> +	struct regulator_irq_desc irq_desc =3D {
> +		.name =3D "lm51772-irq",
> +		.data =3D regmap,
> +		.map_event =3D lm51772_irq_map_event,
> +		.irq_off_ms =3D 1000,
> +	};
> +	void *retp;
> +	int ret;
> +
> +	if (!nint) {
> +		irq_desc.renable =3D lm51772_irq_renable;
> +		irq_desc.reread_ms =3D 200;
> +	}
> +
> +	ret =3D regmap_update_bits(regmap, LM51772_REG_MFR_SPECIFIC_D1, LM51772=
_EN_NINT,
> +				 FIELD_PREP(LM51772_EN_NINT, nint));
> +	if (ret)
> +		return ret;
> +
> +	retp =3D devm_regulator_irq_helper(dev, &irq_desc, irq, 0, common_errs,=
 per_rdev_errs, rdev,
> +					 LM51772_N_REGS);
> +
> +	return IS_ERR(retp) ? PTR_ERR(retp) : 0;
> +}
> +
> +static const struct regmap_range lm51772_readable_ranges[] =3D {
> +	regmap_reg_range(LM51772_REG_CLEAR_FAULTS, LM51772_REG_CLEAR_FAULTS),
> +	regmap_reg_range(LM51772_REG_ILIM_THRESHOLD, LM51772_REG_ILIM_THRESHOLD=
),
> +	regmap_reg_range(LM51772_REG_VOUT_TARGET1_LSB, LM51772_REG_VOUT_TARGET1=
_MSB),
> +	regmap_reg_range(LM51772_REG_USB_PD_STATUS_0, LM51772_REG_USB_PD_STATUS=
_0),
> +	regmap_reg_range(LM51772_REG_STATUS_BYTE, LM51772_REG_STATUS_BYTE),
> +	regmap_reg_range(LM51772_REG_USB_PD_CONTROL_0, LM51772_REG_USB_PD_CONTR=
OL_0),
> +	regmap_reg_range(LM51772_REG_MFR_SPECIFIC_D0, LM51772_REG_IVP_VOLTAGE)
> +};
> +
> +static const struct regmap_access_table lm51772_readable_table =3D {
> +	.yes_ranges =3D lm51772_readable_ranges,
> +	.n_yes_ranges =3D ARRAY_SIZE(lm51772_readable_ranges)
> +};
> +
> +static const struct regmap_range lm51772_writeable_ranges[] =3D {
> +	regmap_reg_range(LM51772_REG_CLEAR_FAULTS, LM51772_REG_CLEAR_FAULTS),
> +	regmap_reg_range(LM51772_REG_STATUS_BYTE, LM51772_REG_STATUS_BYTE),
> +	regmap_reg_range(LM51772_REG_ILIM_THRESHOLD, LM51772_REG_ILIM_THRESHOLD=
),
> +	regmap_reg_range(LM51772_REG_VOUT_TARGET1_LSB, LM51772_REG_VOUT_TARGET1=
_MSB),
> +	regmap_reg_range(LM51772_REG_USB_PD_CONTROL_0, LM51772_REG_USB_PD_CONTR=
OL_0),
> +	regmap_reg_range(LM51772_REG_MFR_SPECIFIC_D0, LM51772_REG_IVP_VOLTAGE)
> +};
> +
> +static const struct regmap_access_table lm51772_writeable_table =3D {
> +	.yes_ranges =3D lm51772_writeable_ranges,
> +	.n_yes_ranges =3D ARRAY_SIZE(lm51772_writeable_ranges)
> +};
> +
> +static const struct regmap_range lm51772_volatile_ranges[] =3D {
> +	regmap_reg_range(LM51772_REG_USB_PD_STATUS_0, LM51772_REG_USB_PD_STATUS=
_0),
> +	regmap_reg_range(LM51772_REG_STATUS_BYTE, LM51772_REG_STATUS_BYTE),
> +	regmap_reg_range(LM51772_REG_CLEAR_FAULTS, LM51772_REG_CLEAR_FAULTS)
> +};
> +
> +static const struct regmap_access_table lm51772_volatile_table =3D {
> +	.yes_ranges =3D lm51772_volatile_ranges,
> +	.n_yes_ranges =3D ARRAY_SIZE(lm51772_volatile_ranges)
> +};
> +
> +static const struct regmap_range lm51772_precious_ranges[] =3D {
> +	regmap_reg_range(LM51772_REG_CLEAR_FAULTS, LM51772_REG_CLEAR_FAULTS)
> +};
> +
> +static const struct regmap_access_table lm51772_precious_table =3D {
> +	.yes_ranges =3D lm51772_precious_ranges,
> +	.n_yes_ranges =3D ARRAY_SIZE(lm51772_precious_ranges)
> +};
> +
> +static const struct regmap_config lm51772_regmap_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +	.rd_table =3D &lm51772_readable_table,
> +	.wr_table =3D &lm51772_writeable_table,
> +	.volatile_table =3D &lm51772_volatile_table,
> +	.precious_table =3D &lm51772_precious_table,
> +	.max_register =3D LM51772_REG_IVP_VOLTAGE,
> +	.cache_type =3D REGCACHE_MAPLE
> +};
> +
> +static const struct regulator_ops lm51772_fixed_ops =3D {
> +	.enable =3D regulator_enable_regmap,
> +	.disable =3D regulator_disable_regmap,
> +	.is_enabled =3D regulator_is_enabled_regmap
> +};
> +
> +/*
> + * For < 24V, voltages are set in 10mV monotonous steps.
> + * For >=3D 24V, voltages are set in 20mV monotonous steps.
> + */
> +static const struct linear_range lm51772_voltage_ranges[] =3D {
> +	REGULATOR_LINEAR_RANGE(LM51772_DIV10_MIN_UV, 0, 99, 0),
> +	REGULATOR_LINEAR_RANGE(LM51772_DIV10_MIN_UV, 100, 2400, LM51772_DIV10_S=
TEP_UV),
> +
> +	REGULATOR_LINEAR_RANGE(LM51772_DIV20_MIN_UV, 0, 164, 0),
> +	REGULATOR_LINEAR_RANGE(LM51772_DIV20_MIN_UV, 165, 2400, LM51772_DIV20_S=
TEP_UV)
> +};
> +
> +static const unsigned int lm51772_voltage_ranges_sel[] =3D { 0,  0, 1, 1=
 };
> +
> +static const unsigned int lm51772_ramp_delays[] =3D { 40000, 20000, 1000=
, 500 };
> +
> +static const struct regulator_desc lm51772_regulator_template[] =3D {
> +	{ .name =3D "vout",
> +	  .of_match =3D of_match_ptr("vout"),
> +	  .of_parse_cb =3D lm51772_vout_of_parse,
> +	  .regulators_node =3D of_match_ptr("regulators"),
> +	  .id =3D 0,
> +	  .type =3D REGULATOR_VOLTAGE,
> +	  .owner =3D THIS_MODULE,
> +	  .linear_ranges =3D lm51772_voltage_ranges,
> +	  .linear_range_selectors_bitfield =3D lm51772_voltage_ranges_sel,
> +	  .n_linear_ranges =3D ARRAY_SIZE(lm51772_voltage_ranges),
> +	  .n_voltages =3D 100 + 2301 + 165 + 2236,
> +	  .vsel_reg =3D LM51772_REG_VOUT_TARGET1_LSB,
> +	  .vsel_mask =3D LM51772_VOUT_TARGET1_MASK,
> +	  .vsel_reg_oversize =3D true,
> +	  .vsel_range_reg =3D LM51772_REG_MFR_SPECIFIC_D8,
> +	  .vsel_range_mask =3D LM51772_SEL_FB_DIV20,
> +	  .active_discharge_reg =3D LM51772_REG_MFR_SPECIFIC_D2,
> +	  .active_discharge_mask =3D LM51772_DISCHARGE_CONFIG1 | LM51772_DISCHA=
RGE_CONFIG0,
> +	  .active_discharge_on =3D
> +		  FIELD_PREP_CONST(LM51772_DISCHARGE_CONFIG1, 1) |
> +		  FIELD_PREP_CONST(LM51772_DISCHARGE_CONFIG0, 1),
> +	  .active_discharge_off =3D
> +		  FIELD_PREP_CONST(LM51772_DISCHARGE_CONFIG1, 0) |
> +		  FIELD_PREP_CONST(LM51772_DISCHARGE_CONFIG0, 0),

Maybe would it be better if the core could also change the active discharge
strength:

  int (*set_active_discharge)(struct regulator_dev *rdev, bool enable,
            int strength_uA);

That would remove the need for introducing a vendor-specific property:
'ti,active-discharge-strength-microamp'.

> +	  .ramp_reg =3D LM51772_REG_MFR_SPECIFIC_D2,
> +	  .ramp_mask =3D LM51772_DVS_SLEW_RAMP_MASK,
> +	  .ramp_delay_table =3D lm51772_ramp_delays,
> +	  .n_ramp_values =3D ARRAY_SIZE(lm51772_ramp_delays)
> +	},
> +	{
> +		.name =3D "vcc1",
> +		.of_match =3D of_match_ptr("vcc1"),
> +		.regulators_node =3D of_match_ptr("regulators"),
> +		.id =3D 1,
> +		.type =3D REGULATOR_VOLTAGE,
> +		.owner =3D THIS_MODULE,
> +		.ops =3D &lm51772_fixed_ops,
> +		.fixed_uV =3D LM51772_VCC1_LDO_UV,
> +		.n_voltages =3D LM51772_VCC1_LDO_NV,
> +		.enable_reg =3D LM51772_REG_MFR_SPECIFIC_D0,
> +		.enable_mask =3D LM51772_EN_VCC1,
> +	},
> +};
> +
> +static int lm51772_probe(struct i2c_client *client)
> +{
> +	struct regulator_dev *rdev[LM51772_N_REGS];
> +	struct regulator_config config =3D {};
> +	struct device *dev =3D &client->dev;
> +	struct lm51772_priv *priv;
> +	struct regmap *regmap;
> +	int ret;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	memcpy(priv->desc, lm51772_regulator_template, sizeof(lm51772_regulator=
_template));
> +
> +	ret =3D devm_regulator_get_enable_optional(dev, "vin");
> +	if (ret < 0 && ret !=3D -ENODEV)
> +		return dev_err_probe(dev, ret, "unable to get vin regulator\n");
> +
> +	regmap =3D devm_regmap_init_i2c(client, &lm51772_regmap_config);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "unable to init regmap\n");
> +
> +	config.dev =3D dev;
> +	config.driver_data =3D priv;
> +	config.regmap =3D regmap;
> +
> +	ret =3D lm51772_of_parse(priv, dev, regmap);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "unable to parse dt node\n");
> +
> +	for (size_t i =3D 0; i < LM51772_N_REGS; i++) {
> +		rdev[i] =3D devm_regulator_register(dev, &priv->desc[i], &config);
> +		if (IS_ERR(rdev[i]))
> +			return dev_err_probe(dev, PTR_ERR(rdev[i]),
> +					     "unable to register regulator %s\n",
> +					     priv->desc[i].name);
> +	}
> +
> +	ret =3D lm51772_setup_irq(dev, regmap, client->irq, rdev, priv->nint);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "unable to request irq\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id lm51772_of_match[] =3D {
> +	{ .compatible =3D "ti,lm51772" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, lm51772_of_match);
> +
> +static const struct i2c_device_id lm51772_id[] =3D {
> +	{ .name =3D "lm51772" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(i2c, lm51772_id);
> +
> +static struct i2c_driver lm51772_driver =3D {
> +	.driver =3D {
> +		.name =3D "lm51772",
> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +		.of_match_table =3D lm51772_of_match,
> +	},
> +	.probe =3D lm51772_probe,
> +	.id_table =3D lm51772_id,
> +};
> +
> +module_i2c_driver(lm51772_driver);
> +
> +MODULE_AUTHOR("Paul Louvel <paul.louvel@bootlin.com>");
> +MODULE_DESCRIPTION("TI LM51772 I2C regulator driver");
> +MODULE_LICENSE("GPL");





--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

