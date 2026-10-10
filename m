Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3004142AF9B
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 09:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791622816; cv=none; b=nFeD3B+dsoA+GX7uVrn9u3ooD3FQYqIze7DRMWnxpqluS4esvcQfi5aRaRML9DbPYp+4uUmvR4bvTFL6MmMnT/dn6MgWp2Va1yogbgDbPBasklW37SBSCr5nKxSeXKe9grD0LmwfqQbA2Nht6m2HgVXwulY8sdWMS+jw/3IAWdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791622816; c=relaxed/simple;
	bh=HPKN8qqbp1OZ6mj83pCopw0Dqz/C60wucp8yh1YM5ss=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bJc6HzzCm/O4NgnXosODVqxjfB3iFSbbS2BtyKwxNrsYbscqDx+JSFf8GMwjRrbxJFm0ZVaP6mtQ80wFYL68hE7XFTuU662VLFgGRGpyqFH+tqMzIUhg3aK4LvX4AvSKtg79Ncmr4w0oIuPdSBX+pGGi5XuiGhv2eZksWTd4RQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XOHOiQw0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XOHOiQw0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B982D1F000FF
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 09:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791622814;
	bh=xrc4YrsS8AqDYXjf3P4iDZHWmnLb5Or5fMg7qB8z0lw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=XOHOiQw0UdDx2q5Le5gS0nkEM1JtdUCcGwF8GvGCVCBA7UDMefpCixjxl5+K4tECN
	 5NgAj2LlHUmrHsyKih6l1i4Ba1iWe5lmwj0obmkK+LeHK7czEs5NDjtHVZSRmWB5r1
	 JcROXVxOj5j/qsrxQjMt+ohuSrnMCRkRlZn6R75C3mrO9dgQeUOurgye4KXSbkRqVR
	 1f6ORpc2N3f57cC31Qsmr6gWPDmhsFPHs5mn4/5hHxIkk2bXB9m6nT5BF4RfAP+1Ax
	 Pzz2Ea3UJE929hS52lsY7Xyv7QAmeebz+0FGnMXC62d2rDkIoBJDarMq46w6Xgbv3r
	 KNTm7l60pxxzA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bcb0f245e0so276772e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 02:00:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxPatz192YE2x1NIawuivcqJkze4u+rLrPx/hRnbWNTbpnMdleFPccB2W6nzR4chJZ0pu8zb3fm3EbT91g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUKfTwHw06Xhgf4fgGDFlbm5btpdLX+X/2Jae5XDxr5DdIozvx
	uSAxR4SMm+ZJqgb6QVj5g8MTmSPhD3vJNRUVg4FZFGNDlDoHYZtHdeGOjrpS+u3/u0mLy9fa2X8
	oYJFHjosVylke0K3M2dGV/wcKJ6dmiYS6jkM3bwFs4A==
X-Received: by 2002:a2e:b8c9:0:b0:3a6:67d9:af17 with SMTP id
 38308e7fff4ca-3a9c5707284mr10024491fa.12.1791622803249; Sat, 10 Oct 2026
 02:00:03 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 10 Oct 2026 02:00:02 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 10 Oct 2026 02:00:02 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261009-iio-adc-ti-ads112c14-gpio-v2-2-3231a795fa63@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009-iio-adc-ti-ads112c14-gpio-v2-0-3231a795fa63@baylibre.com>
 <20261009-iio-adc-ti-ads112c14-gpio-v2-2-3231a795fa63@baylibre.com>
Date: Sat, 10 Oct 2026 02:00:02 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mfn7+uQYvLjGLxU9wMOnRwx5pyPgaLp6oNx+ZcFXyXL=A@mail.gmail.com>
X-Gm-Features: AclHuK81q1CrtScE9_anb9V9Q4poEkdXKVStPyHSpCLcNZVRkENxGg61ER2R2ns
Message-ID: <CAMRc=Mfn7+uQYvLjGLxU9wMOnRwx5pyPgaLp6oNx+ZcFXyXL=A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] iio: adc: ti-ads112c14: add gpio support
To: "David Lechner (TI)" <dlechner@baylibre.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Chris Hall <c-hall@ti.com>, 
	Patrick Edwards <pedwards@ti.com>, Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 10 Oct 2026 01:25:52 +0200, "David Lechner (TI)"
<dlechner@baylibre.com> said:
> Add support for using the AIN4/GPIO0 to AIN7/GPIO3 pins as GPIOs when
> the gpio-controller property is present.
>
> Pins that are already used for something else according to the
> devicetree are excluded from the valid GPIO mask. This includes analog
> inputs and excitation current outputs used by channels, REFP/REFN when
> an external reference is used, the /FAULT and /DRDY interrupts and the
> external clock input.
>
> Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
> ---
>  drivers/iio/adc/Kconfig        |   2 +-
>  drivers/iio/adc/ti-ads112c14.c | 168 +++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 164 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index a802d8ee4dd9..b0242b2fdb2d 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -1878,7 +1878,7 @@ config TI_ADS112C04
>
>  config TI_ADS112C14
>  	tristate "Texas Instruments ADS112C14/ADS122C14"
> -	depends on I2C
> +	depends on I2C && GPIOLIB
>  	select CRC8
>  	select REGMAP
>  	help
> diff --git a/drivers/iio/adc/ti-ads112c14.c b/drivers/iio/adc/ti-ads112c14.c
> index cbd82de03127..e0cadc445a44 100644
> --- a/drivers/iio/adc/ti-ads112c14.c
> +++ b/drivers/iio/adc/ti-ads112c14.c
> @@ -17,6 +17,7 @@
>  #include <linux/delay.h>
>  #include <linux/dev_printk.h>
>  #include <linux/device/devres.h>
> +#include <linux/gpio/driver.h>
>  #include <linux/i2c.h>
>  #include <linux/iio/buffer.h>
>  #include <linux/iio/iio.h>
> @@ -157,6 +158,8 @@
>  #define ADS112C14_INT_REF0_mV				1250
>  #define ADS112C14_INT_REF1_mV				2500
>
> +#define ADS112C14_NUM_GPIO				4
> +
>  enum {
>  	ADS112C14_VREF_SOURCE_INTERNAL_2_5V,
>  	ADS112C14_VREF_SOURCE_INTERNAL_1_25V,
> @@ -357,6 +360,9 @@ struct ads112c14_channel_state {
>  struct ads112c14_data {
>  	const struct ads112c14_chip_info *chip_info;
>  	struct regmap *regmap;
> +	struct gpio_chip gc;
> +	const char *gpio_names[ADS112C14_NUM_GPIO];
> +	DECLARE_BITMAP(gpio_reserved, ADS112C14_NUM_GPIO);
>  	struct iio_trigger *drdy_trig;
>  	/* Synchronizes access to register value fields. */
>  	struct mutex lock;
> @@ -384,6 +390,135 @@ struct ads112c14_data {
>  						 ARRAY_SIZE(ads112c14_sys_mon_channels));
>  };
>
> +static u32 ads112c14_reserve_ain_pin(unsigned long *reserved, u32 ain)
> +{
> +	if (ain >= 4 && ain <= 7)
> +		bitmap_set(reserved, ain - 4, 1);
> +
> +	return ain;
> +}
> +
> +static int ads112c14_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct iio_dev *indio_dev = gpiochip_get_data(gc);
> +	struct ads112c14_data *data = iio_priv(indio_dev);
> +	unsigned int reg_val;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, ADS112C14_REG_GPIO_CFG, &reg_val);
> +	if (ret)
> +		return ret;
> +
> +	switch (field_get(ADS112C14_GPIO_CFG_GPIO_CFG(offset), reg_val)) {
> +	case ADS112C14_GPIO_CFG_GPIO_CFG_INPUT:
> +		return GPIO_LINE_DIRECTION_IN;
> +	case ADS112C14_GPIO_CFG_GPIO_CFG_OUTPUT_PUSH_PULL:
> +	case ADS112C14_GPIO_CFG_GPIO_CFG_OUTPUT_OPEN_DRAIN:
> +		return GPIO_LINE_DIRECTION_OUT;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int ads112c14_gpio_direction_input(struct gpio_chip *gc,
> +					  unsigned int offset)
> +{
> +	struct iio_dev *indio_dev = gpiochip_get_data(gc);
> +	struct ads112c14_data *data = iio_priv(indio_dev);
> +
> +	return regmap_update_bits(data->regmap, ADS112C14_REG_GPIO_CFG,
> +				  ADS112C14_GPIO_CFG_GPIO_CFG(offset),
> +				  field_prep(ADS112C14_GPIO_CFG_GPIO_CFG(offset),
> +					     ADS112C14_GPIO_CFG_GPIO_CFG_INPUT));
> +}
> +
> +static int ads112c14_gpio_direction_output(struct gpio_chip *gc,
> +					   unsigned int offset, int value)
> +{
> +	struct iio_dev *indio_dev = gpiochip_get_data(gc);
> +	struct ads112c14_data *data = iio_priv(indio_dev);
> +	int ret;
> +
> +	ret = regmap_assign_bits(data->regmap, ADS112C14_REG_GPIO_DATA_OUTPUT,
> +				 ADS112C14_GPIO_DATA_OUTPUT_GPIO_DAT_OUT(offset),
> +				 value);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_update_bits(data->regmap, ADS112C14_REG_GPIO_CFG,
> +				  ADS112C14_GPIO_CFG_GPIO_CFG(offset),
> +				  field_prep(ADS112C14_GPIO_CFG_GPIO_CFG(offset),
> +					     ADS112C14_GPIO_CFG_GPIO_CFG_OUTPUT_PUSH_PULL));
> +}
> +
> +static int ads112c14_gpio_get(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct iio_dev *indio_dev = gpiochip_get_data(gc);
> +	struct ads112c14_data *data = iio_priv(indio_dev);
> +	unsigned int reg_val;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, ADS112C14_REG_STATUS_LSB, &reg_val);
> +	if (ret)
> +		return ret;
> +
> +	return field_get(ADS112C14_STATUS_LSB_GPIO_DAT_IN(offset), reg_val);
> +}
> +
> +static int ads112c14_gpio_set(struct gpio_chip *gc, unsigned int offset,
> +			      int value)
> +{
> +	struct iio_dev *indio_dev = gpiochip_get_data(gc);
> +	struct ads112c14_data *data = iio_priv(indio_dev);
> +
> +	return regmap_assign_bits(data->regmap, ADS112C14_REG_GPIO_DATA_OUTPUT,
> +				  ADS112C14_GPIO_DATA_OUTPUT_GPIO_DAT_OUT(offset),
> +				  value);
> +}
> +
> +static int ads112c14_gpio_init_valid_mask(struct gpio_chip *gc,
> +					  unsigned long *valid_mask,
> +					  unsigned int ngpios)
> +{
> +	struct iio_dev *indio_dev = gpiochip_get_data(gc);
> +	struct ads112c14_data *data = iio_priv(indio_dev);
> +
> +	bitmap_andnot(valid_mask, valid_mask, data->gpio_reserved, ngpios);
> +
> +	return 0;
> +}
> +
> +static int ads112c14_gpio_init(struct iio_dev *indio_dev)
> +{
> +	struct ads112c14_data *data = iio_priv(indio_dev);
> +	struct device *dev = indio_dev->dev.parent;
> +
> +	for (unsigned int i = 0; i < ADS112C14_NUM_GPIO; i++) {
> +		data->gpio_names[i] = devm_kasprintf(dev, GFP_KERNEL, "%s:GPIO%u",
> +						     dev_name(&indio_dev->dev), i);
> +		if (!data->gpio_names[i])
> +			return -ENOMEM;
> +	}
> +
> +	data->gc = (struct gpio_chip) {
> +		.owner = THIS_MODULE,
> +		.label = dev_name(dev),
> +		.parent = dev,
> +		.base = -1,
> +		.ngpio = ADS112C14_NUM_GPIO,
> +		.names = data->gpio_names,
> +		.can_sleep = true,
> +		.init_valid_mask = ads112c14_gpio_init_valid_mask,
> +		.get_direction = ads112c14_gpio_get_direction,
> +		.direction_input = ads112c14_gpio_direction_input,
> +		.direction_output = ads112c14_gpio_direction_output,
> +		.get = ads112c14_gpio_get,
> +		.set = ads112c14_gpio_set,
> +	};
> +
> +	return devm_gpiochip_add_data(dev, &data->gc, indio_dev);
> +}
> +
>  static irqreturn_t ads112c14_drdy_irq_handler(int irq, void *private)
>  {
>  	struct iio_dev *indio_dev = private;
> @@ -1965,7 +2100,7 @@ static int ads112c14_parse_channels(struct iio_dev *indio_dev,
>  				return dev_err_probe(dev, -EINVAL,
>  						     "single-channel value must be between 0 and 7\n");
>
> -			spec->channel = pair[0];
> +			spec->channel = ads112c14_reserve_ain_pin(data->gpio_reserved, pair[0]);
>  			/*
>  			 * NB: channel2 is unused by iio core code in this case.
>  			 * Let's us avoid special case for negative input mux
> @@ -1984,8 +2119,8 @@ static int ads112c14_parse_channels(struct iio_dev *indio_dev,
>  						     "diff-channels values must be between 0 and 7\n");
>
>  			spec->differential = 1;
> -			spec->channel = pair[0];
> -			spec->channel2 = pair[1];
> +			spec->channel = ads112c14_reserve_ain_pin(data->gpio_reserved, pair[0]);
> +			spec->channel2 = ads112c14_reserve_ain_pin(data->gpio_reserved, pair[1]);
>  		} else {
>  			return dev_err_probe(dev, -EINVAL,
>  					     "channel node missing channel type property\n");
> @@ -2014,8 +2149,11 @@ static int ads112c14_parse_channels(struct iio_dev *indio_dev,
>  				return dev_err_probe(dev, -EINVAL,
>  						     "excitation-channels values must be between 0 and 7\n");
>
> -			measurement->idac1_mux = pair[0];
> -			measurement->idac2_mux = measurement->iadc_count > 1 ? pair[1] : 0;
> +			measurement->idac1_mux =
> +				ads112c14_reserve_ain_pin(data->gpio_reserved, pair[0]);
> +			if (measurement->iadc_count > 1)
> +				measurement->idac2_mux =
> +					ads112c14_reserve_ain_pin(data->gpio_reserved, pair[1]);
>
>  			ret = fwnode_property_read_u32_array(child, "excitation-current-nanoamp",
>  							     pair, measurement->iadc_count);
> @@ -2420,6 +2558,10 @@ static int ads112c14_probe(struct i2c_client *client)
>  		return dev_err_probe(dev, -EINVAL,
>  				     "external reference measurements require either refp-supply or ti,refp-refn-resistor-ohms property\n");
>
> +	/* REFP and REFN share pins with GPIO0 and GPIO1. */
> +	if (data->ext_ref_uV || data->ext_ref_ohms)
> +		bitmap_set(data->gpio_reserved, 0, 2);
> +
>  	clk = devm_clk_get_optional_enabled(dev, NULL);
>  	if (IS_ERR(clk))
>  		return dev_err_probe(dev, PTR_ERR(clk), "failed to get clk\n");
> @@ -2496,12 +2638,19 @@ static int ads112c14_probe(struct i2c_client *client)
>  	if (ret)
>  		return ret;
>
> +	/* FAULT shares a pin with GPIO2. */
> +	if (fwnode_property_match_string(dev_fwnode(dev), "interrupt-names", "fault") >= 0)

With device_property_match_string() you avoid the dev_fwnode().

> +		bitmap_set(data->gpio_reserved, 2, 1);
> +
>  	if (fwnode_property_match_string(dev_fwnode(dev), "interrupt-names", "drdy") >= 0) {
>  		data->drdy_irq = fwnode_irq_get_byname(dev_fwnode(dev), "drdy");
>  		if (data->drdy_irq < 0)
>  			return dev_err_probe(dev, data->drdy_irq,
>  					     "failed to get drdy interrupt\n");
>
> +		/* DRDY shares a pin with GPIO3. */
> +		bitmap_set(data->gpio_reserved, 3, 1);
> +
>  		if (clk)
>  			return dev_err_probe(dev, -EINVAL,
>  					     "cannot use both DRDY and CLK - they share the same pin\n");
> @@ -2546,6 +2695,9 @@ static int ads112c14_probe(struct i2c_client *client)
>  	}
>
>  	if (clk) {
> +		/* CLK shares a pin with GPIO3. */
> +		bitmap_set(data->gpio_reserved, 3, 1);
> +
>  		ret = regmap_update_bits(data->regmap, ADS112C14_REG_GPIO_CFG,
>  					 ADS112C14_GPIO_CFG_GPIO_CFG(3),
>  					 FIELD_PREP(ADS112C14_GPIO_CFG_GPIO_CFG(3),
> @@ -2574,6 +2726,12 @@ static int ads112c14_probe(struct i2c_client *client)
>  	if (ret)
>  		return ret;
>
> +	if (device_property_read_bool(dev, "gpio-controller")) {

I think the right one to use is device_property_present().

> +		ret = ads112c14_gpio_init(indio_dev);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	return devm_iio_device_register(dev, indio_dev);
>  }
>
>
> --
> 2.53.0
>
>

Bart
