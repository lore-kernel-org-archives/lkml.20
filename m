Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604522;
	b=GyksN1Kxp0sFgitk2g44Dlc2PQ7lCKISSCyJa9lToSK/4AqP7OxounJi02TeUav0Qqsi
	 /XtwgwY/iPTugpUYXMmU13D9qmOgXqHSILmaAvOtKcmRC/5iQIW6tZZjZe9CEr1SDtfCt
	 YUbAZXxGDAal7K8qxIcrXbv3N2/q/J6zEW+mraXOBEuMABVu69b0LkQ53kfQo2u0Xs4zi
	 ZBLt/m69aOWrK2jvy97lRk1uMGnxdgtlcRiWksEIfqc/gRxLQBogA6s4FRWv7uq85J1AF
	 Z9I+tcCfAypITsPrawNUZw7bOIEs35l+IzG/5Gbk8Kin0m1S/G1abYpjycQZgh+Hodw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604522;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=YuNzsHdXThbxVSWqGRgWX9IUvgRrbytIdHxh4dUYIng=;
	b=Lr6pVmsU4/nCjfRbOv7oDOxIbTxPXp1r2DuZiIFQeuHWfKKvfZZRW1rST4NFAmCRtaPq
	 kx47cXeZ17emhyJ4xr87kb66+KameZhfVmHNwK+ySrZxfZEthsUwqQd3rW45piFgdJ8VP
	 mCn3+QtDa2SAl8UiqRWt6HWrbhwq+lQJFsMhWwgTKIBcX46u1MunF2CjtB/Vpj1TUQn7Q
	 NFaHgp8Or+McVDaqnXCgvl7WeGoxJfeF5ywAo+e44Ml4Mn+GoRACsfTwIcSISDuZVoUvd
	 AUGxeTMctr6qSp5NlOKi3Rfd9VnNac9TLI04U2uqABgG6+ctUOsj2rJWvqHr8vOzsuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=yUQ0pRhh;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DD9606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2DD9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=yUQ0pRhh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=YuNzsHdXThbxVSWqGRgWX9IUvgRrbytIdHxh4dUYIng=; t=1793604521; x=1794814121; 
	b=yUQ0pRhhkMCwfuZWMrtKZb9rfH7fU0+ALn8hmTU7VKtyY0j7RxeLPhVsfSyF3A51NG97YLEBenO
	9T+bUWAsW3UeWa01YX4alyE4loOL+hTzYtjHcsal0xsDvf9VovEq0JtyZtqakJifEMcfbbuOgr6FV
	UagBpduvZx7hs9yUNQf4qb6oe32CNE9dOgCxqSmm+E13QULibZsBpjExOat36T44iocV1BNXYUG1a
	OfRxdFu648i2xXQ20bEvdoU4ZszJFrexRTum2os8+Dr+Tc8V/w90ipU1HGUPMX+PfyQfvcq6PaFzP
	NGL71nuvtCGe9tObGiGf6VRj5v5II+AiFQog==;
Date: Mon, 2 Nov 2026 08:28:34 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] regulator: sy7636a: wait for power good on
 enable
Message-ID: <20261102082834.0f808c8a@kemnade.info>
In-Reply-To: <20261101223125.302001-4-pmazzini@gmail.com>
References: <20261101223125.302001-1-pmazzini@gmail.com>
	<20261101223125.302001-4-pmazzini@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  1 Nov 2026 22:31:21 +0000
Pablo Mazzini <pmazzini@gmail.com> wrote:

> Wait for power good on enable, as the TPS65185 and FP9931 drivers do,
> so that consumers can use the rails once the enable returns.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

Regards,
Andreas

> ---
>  drivers/regulator/sy7636a-regulator.c | 52 +++++++++++++++++++++++++--
>  1 file changed, 50 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/regulator/sy7636a-regulator.c b/drivers/regulator/sy7636a-regulator.c
> index 382bab017784..f87144e921da 100644
> --- a/drivers/regulator/sy7636a-regulator.c
> +++ b/drivers/regulator/sy7636a-regulator.c
> @@ -7,8 +7,10 @@
>  // Authors: Lars Ivar Miljeteig <lars.ivar.miljeteig@remarkable.com>
>  //          Alistair Francis <alistair@alistair23.me>
>  
> +#include <linux/completion.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
> +#include <linux/interrupt.h>
>  #include <linux/mfd/sy7636a.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> @@ -17,11 +19,14 @@
>  #include <linux/regulator/machine.h>
>  #include <linux/regmap.h>
>  
> +#define PGOOD_TIMEOUT_MSECS 200
> +
>  struct sy7636a_data {
>  	struct regmap *regmap;
>  	struct gpio_desc *pgood_gpio;
>  	struct gpio_desc *en_gpio;
>  	struct gpio_desc *vcom_en_gpio;
> +	struct completion pgood_completion;
>  };
>  
>  static int sy7636a_get_vcom_voltage_sel(struct regulator_dev *rdev)
> @@ -65,12 +70,43 @@ static int sy7636a_get_status(struct regulator_dev *rdev)
>  	return ret;
>  }
>  
> +static irqreturn_t sy7636a_pgood_handler(int irq, void *dev_id)
> +{
> +	struct sy7636a_data *data = dev_id;
> +
> +	complete(&data->pgood_completion);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +/* return once the rails are good, so that consumers can use them */
> +static int sy7636a_enable(struct regulator_dev *rdev)
> +{
> +	struct sy7636a_data *data = dev_get_drvdata(rdev->dev.parent);
> +	int ret;
> +
> +	reinit_completion(&data->pgood_completion);
> +	ret = regulator_enable_regmap(rdev);
> +	if (ret)
> +		return ret;
> +
> +	wait_for_completion_timeout(&data->pgood_completion,
> +				    msecs_to_jiffies(PGOOD_TIMEOUT_MSECS));
> +	ret = gpiod_get_value_cansleep(data->pgood_gpio);
> +	if (ret <= 0) {
> +		regulator_disable_regmap(rdev);
> +		return ret ? ret : -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct regulator_ops sy7636a_vcom_volt_ops = {
>  	.list_voltage = regulator_list_voltage_linear_range,
>  	.map_voltage = regulator_map_voltage_linear_range,
>  	.get_voltage_sel = sy7636a_get_vcom_voltage_sel,
>  	.set_voltage_sel = sy7636a_set_vcom_voltage_sel,
> -	.enable = regulator_enable_regmap,
> +	.enable = sy7636a_enable,
>  	.disable = regulator_disable_regmap,
>  	.is_enabled = regulator_is_enabled_regmap,
>  	.get_status = sy7636a_get_status,
> @@ -104,7 +140,7 @@ static int sy7636a_regulator_probe(struct platform_device *pdev)
>  	struct regulator_dev *rdev;
>  	struct gpio_desc *gdp;
>  	struct sy7636a_data *data;
> -	int ret;
> +	int irq, ret;
>  
>  	if (!regmap)
>  		return -EPROBE_DEFER;
> @@ -156,6 +192,18 @@ static int sy7636a_regulator_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	irq = gpiod_to_irq(data->pgood_gpio);
> +	if (irq < 0)
> +		return dev_err_probe(&pdev->dev, irq, "no power good interrupt\n");
> +
> +	init_completion(&data->pgood_completion);
> +	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, sy7636a_pgood_handler,
> +					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
> +					"sy7636a-pgood", data);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to request power good interrupt\n");
> +
>  	config.dev = &pdev->dev;
>  	config.regmap = regmap;
>  

