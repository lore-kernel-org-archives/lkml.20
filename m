Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793000511;
	b=40MnxctZ+YWWpsC8JLdbUhinp2cCcsHUKRfOWjEL1o8a3aQFviWeaug5Nzx7OP9z9ahW
	 AHXMeBqbO+mRRPciqBHdKACMXybPslD6jAKcSloil+cemZ6PBrRwpTcOWNhqnvJ1HUMru
	 0UcoqYGeb3RskuIXMO8MA2CgHZy4Hlu4+kig+0lXO8eC4Wxwlbv8un6JHlAqcYJNdOjH3
	 TLuisYNIh6UKVhIRf8v/dH+wyVbIEwtrd7KOpvcIqrPbLHdwap756XAuFMq/x12gdpRO2
	 cx2DwNrJYEhnM50ZN1K1XlTEZXLe56DpWok3TDVmuUIRNSKb8oXuPz+x08WM8I+lTYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793000511;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=mJPXNqAntv/pB7MkRj4J7sm2kiaRxc+Y0M5em4L/PmI=;
	b=D5C/9ULWoj9AHdYK2BgCItBvedP97S7oofs6JCaD9T8esPnF2bNSqR1B8pO3w9hP41xe
	 iRQEHDLHcvmHE2oLWtdpc8cmQOSkn0BfQ7G98XSjC7vwFfOO+J2v8rSRHsgCBE1GdKzbH
	 A3z6C90CLGbCcVlVHw7hX42lA5vuJn5OZbwZl9IMhNcHO+ldZ5IbMi2LDmx0vIk45LfGA
	 yDsM3jtkwyU+byVH2TNAoYcAqj3cFfnEWATuM14v1l0A0WDSp7t3mNz8ykhc6/jS9AmHi
	 trJbpn23PaFs952VHl1np9FHDXzjQyrFqAqYL4fbietrkOTCD5OBKPR7lVoIWCBok/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=iJELw3v9;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B50606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5B50606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=iJELw3v9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=mJPXNqAntv/pB7MkRj4J7sm2kiaRxc+Y0M5em4L/PmI=; t=1793000510; x=1794210110; 
	b=iJELw3v9gdm5RG648XlMFgGj2trhsNwbY3JyFmt5SxFZ6NyxEjXmu0zXgPhbeFSzoU5IjmNT9MS
	A7VMMcjm1T9cre19NZhGZxgV8gQMCxzPBLZe0EhVeaGErkb8h/tCYJLR8oAQRyNBIab7FV4pzkubv
	Vdexl4diuO0KL3Qu1Z7AO4DqBlPiAq2+BTK9+5EeuFrVmMANwlL3Ghr8580EiojVOiZXESzh7Xs5G
	gtxte78Pi9B5lIGpqORW+dtdk8nHKsL/PNn7R3xhkobqNP8vt4ZHwsNQXkd3BA7EmcvWgogIenEy/
	LQd8vCGlldLW4MDjG7SsyZDuGVhsZRkQOpWQ==;
Date: Mon, 26 Oct 2026 08:41:47 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] regulator: sy7636a: add VCOM voltage control
Message-ID: <20261026084147.01f33f9a@kemnade.info>
In-Reply-To: <20261026003918.155321-4-pmazzini@gmail.com>
References: <20261026003918.155321-1-pmazzini@gmail.com>
	<20261026003918.155321-4-pmazzini@gmail.com>
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

On Mon, 26 Oct 2026 00:39:14 +0000
Pablo Mazzini <pmazzini@gmail.com> wrote:

> VCOM is panel specific, so let boards set it in the devicetree. Switch
> to the selector ops and add the write side.
> 
> Per the datasheet, VCOM bit 8 is bit 7 of register 0x02, not bit 0.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  drivers/regulator/sy7636a-regulator.c | 31 +++++++++++++++++++++++----
>  1 file changed, 27 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/regulator/sy7636a-regulator.c b/drivers/regulator/sy7636a-regulator.c
> index 015227cb113e..382bab017784 100644
> --- a/drivers/regulator/sy7636a-regulator.c
> +++ b/drivers/regulator/sy7636a-regulator.c
> @@ -24,7 +24,7 @@ struct sy7636a_data {
>  	struct gpio_desc *vcom_en_gpio;
>  };
>  
> -static int sy7636a_get_vcom_voltage_op(struct regulator_dev *rdev)
> +static int sy7636a_get_vcom_voltage_sel(struct regulator_dev *rdev)
>  {
>  	int ret;
>  	unsigned int val, val_h;
> @@ -37,9 +37,20 @@ static int sy7636a_get_vcom_voltage_op(struct regulator_dev *rdev)
>  	if (ret)
>  		return ret;
>  
> -	val |= (val_h << VCOM_ADJUST_CTRL_SHIFT);
> +	/* VCOM[8] is bit 7 of register 0x02 */
> +	return val | (val_h & BIT(7)) << 1;
> +}
>  
> -	return (val & VCOM_ADJUST_CTRL_MASK) * VCOM_ADJUST_CTRL_SCAL;
> +static int sy7636a_set_vcom_voltage_sel(struct regulator_dev *rdev, unsigned int sel)
> +{
> +	int ret;
> +
> +	ret = regmap_write(rdev->regmap, SY7636A_REG_VCOM_ADJUST_CTRL_L, sel & 0xff);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_update_bits(rdev->regmap, SY7636A_REG_VCOM_ADJUST_CTRL_H, BIT(7),
> +				  (sel & BIT(8)) >> 1);
>  }
>  
>  static int sy7636a_get_status(struct regulator_dev *rdev)
> @@ -55,19 +66,31 @@ static int sy7636a_get_status(struct regulator_dev *rdev)
>  }
>  
>  static const struct regulator_ops sy7636a_vcom_volt_ops = {
> -	.get_voltage = sy7636a_get_vcom_voltage_op,
> +	.list_voltage = regulator_list_voltage_linear_range,
> +	.map_voltage = regulator_map_voltage_linear_range,
> +	.get_voltage_sel = sy7636a_get_vcom_voltage_sel,
> +	.set_voltage_sel = sy7636a_set_vcom_voltage_sel,
>  	.enable = regulator_enable_regmap,
>  	.disable = regulator_disable_regmap,
>  	.is_enabled = regulator_is_enabled_regmap,
>  	.get_status = sy7636a_get_status,
>  };
>  
> +/* 10 mV steps up to 5 V, higher codes also give 5 V */
> +static const struct linear_range sy7636a_vcom_ranges[] = {
> +	REGULATOR_LINEAR_RANGE(0, 0x000, 0x1f4, VCOM_ADJUST_CTRL_SCAL),
> +	REGULATOR_LINEAR_RANGE(5000000, 0x1f5, 0x1ff, 0),
> +};
> +
>  static const struct regulator_desc desc = {
>  	.name = "vcom",
>  	.id = 0,
>  	.ops = &sy7636a_vcom_volt_ops,
>  	.type = REGULATOR_VOLTAGE,
>  	.owner = THIS_MODULE,
> +	.n_voltages = VCOM_ADJUST_CTRL_MASK + 1,
> +	.linear_ranges = sy7636a_vcom_ranges,
> +	.n_linear_ranges = ARRAY_SIZE(sy7636a_vcom_ranges),
>  	.enable_reg = SY7636A_REG_OPERATION_MODE_CRL,
>  	.enable_mask = SY7636A_OPERATION_MODE_CRL_ONOFF,
>  	.regulators_node = of_match_ptr("regulators"),

