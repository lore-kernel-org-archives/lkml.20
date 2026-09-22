Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626EB531625;
	Tue, 22 Sep 2026 10:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072105; cv=none; b=mL7mnbyeM5guv3TmdzLwlJ0nuoqm2b072xzla4wLDTGqdpzg8782WhEsZ+wPha5/5WHY5/rJqNT3rs7epFmAeX1612j9fVaCwpRG5zrZQpnNyIYfqwpVXAcb7sgQJ7ffIHbqM9A4QSQPrldch7LCHWYnydBmGxhmUwQD36QcKZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072105; c=relaxed/simple;
	bh=B8PZIFaBD2VXHHaQdRYASlQthcO8el0btXkEdvfzK4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iyoEAYHeXB9E6ST/AoFYsSQAI64sXe3jWFNPsDv3r91/mhIOFvjjhmsg1r2oBwWQh41d4/Tnkti7wHCogg+s18xYvcN0Mf4GaXqekH52bhvg7N3vkj9wAEk0sC3nPuXsQ2Ei4nyWmibUBOn14zX520W1hB6G5a7ksaiOZnDsZw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZBubiN0w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZBubiN0w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FFD91F000FF;
	Tue, 22 Sep 2026 10:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790072103;
	bh=f1pdLGa0UEMpnQgZG2KeGnY+1YE0FhA/JOcJvCMadWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZBubiN0wiULnLXbRqfMLX/fKTN42G2ywVepNyljhkpE1eZnAOVKBCB7teXak1x7iF
	 n9eK/Q8jNhbBeaEspN7sSW0Jt1mx4BBv15iG5Hl35TyRMdkN5XVszcc9N0excbUQzg
	 M+PB+7X6F7cFrVygIMiXXeX8DxnGhJS2BQw7BGEMfCd7SFioYwTJNWsZze+Vmo65rb
	 Qjmxiv8wnfFhdOvhn42457gO6lzdXbi8gDq3Qm8Vyx2fU7LYo0ccIHybH92kcqtRwZ
	 p0gLmV8GqZ6fNhkdh0FmvExM1f3zHs2vBdz302/OCzqtvITkkvPZC0ZjE5q1od9W2O
	 l8QDPJ9RyMVHQ==
Date: Tue, 22 Sep 2026 11:14:59 +0100
From: Lee Jones <lee@kernel.org>
To: Oleg Keri <okerixx@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mfd: qcom-pm8008: support PMICs with no interrupt
 line
Message-ID: <20260922101459.GB2730113@google.com>
References: <20260908130745.2545-1-okerixx@gmail.com>
 <20260908130745.2545-3-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908130745.2545-3-okerixx@gmail.com>

On Tue, 08 Sep 2026, Oleg Keri wrote:

> The interrupt is only needed for the temperature alarm and the two GPIOs.
> Where the pin is not routed the regulators are still perfectly usable, but
> probe fails: client->irq is 0 and request_threaded_irq() rejects it.
> 
> Skip the IRQ chip in that case and register the regulator cell alone. The
> temperature alarm cannot be registered without a domain either, because
> its IORESOURCE_IRQ would be handed to the platform device as a raw number
> rather than being mapped, and the GPIO cell needs the domain for the same
> reason.
> 
> Signed-off-by: Oleg Keri <okerixx@gmail.com>

What on earth is going on here:

https://lore.kernel.org/r/20260907-glymur_camss-v2-5-75f7982dc983@oss.qualcomm.com

> ---
>  drivers/mfd/qcom-pm8008.c | 63 +++++++++++++++++++++++++--------------
>  1 file changed, 40 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
> index 60204cc9a2dc..b51a9657ee56 100644
> --- a/drivers/mfd/qcom-pm8008.c
> +++ b/drivers/mfd/qcom-pm8008.c
> @@ -183,6 +183,10 @@ static const struct mfd_cell pm8008_cells[] = {
>  	MFD_CELL_NAME("pm8008-gpio"),
>  };
>  
> +static const struct mfd_cell pm8008_regulator_cells[] = {
> +	MFD_CELL_NAME("pm8008-regulator"),
> +};
> +
>  static void devm_irq_domain_fwnode_release(void *data)
>  {
>  	struct fwnode_handle *fwnode = data;
> @@ -195,9 +199,12 @@ static int pm8008_probe(struct i2c_client *client)
>  	struct regmap_irq_chip_data *irq_data;
>  	struct device *dev = &client->dev;
>  	struct regmap *regmap, *regmap2;
> +	const struct mfd_cell *cells;
>  	struct fwnode_handle *fwnode;
> +	struct irq_domain *domain;
>  	struct i2c_client *dummy;
>  	struct gpio_desc *reset;
> +	int num_cells;
>  	char *name;
>  	int ret;
>  
> @@ -231,33 +238,43 @@ static int pm8008_probe(struct i2c_client *client)
>  	 */
>  	usleep_range(1000, 2000);
>  
> -	name = devm_kasprintf(dev, GFP_KERNEL, "%pOF-internal", dev->of_node);
> -	if (!name)
> -		return -ENOMEM;
> -
> -	name = strreplace(name, '/', ':');
> -
> -	fwnode = irq_domain_alloc_named_fwnode(name);
> -	if (!fwnode)
> -		return -ENOMEM;
> -
> -	ret = devm_add_action_or_reset(dev, devm_irq_domain_fwnode_release, fwnode);
> -	if (ret)
> -		return ret;
> -
> -	ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
> -				IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
> -	if (ret) {
> -		dev_err(dev, "failed to add IRQ chip: %d\n", ret);
> -		return ret;
> +	if (client->irq > 0) {
> +		name = devm_kasprintf(dev, GFP_KERNEL, "%pOF-internal", dev->of_node);
> +		if (!name)
> +			return -ENOMEM;
> +
> +		name = strreplace(name, '/', ':');
> +
> +		fwnode = irq_domain_alloc_named_fwnode(name);
> +		if (!fwnode)
> +			return -ENOMEM;
> +
> +		ret = devm_add_action_or_reset(dev, devm_irq_domain_fwnode_release, fwnode);
> +		if (ret)
> +			return ret;
> +
> +		ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap,
> +						      client->irq, IRQF_SHARED, 0,
> +						      &pm8008_irq_chip, &irq_data);
> +		if (ret) {
> +			dev_err(dev, "failed to add IRQ chip: %d\n", ret);
> +			return ret;
> +		}
> +
> +		domain = regmap_irq_get_domain(irq_data);
> +		cells = pm8008_cells;
> +		num_cells = ARRAY_SIZE(pm8008_cells);
> +	} else {
> +		domain = NULL;
> +		cells = pm8008_regulator_cells;
> +		num_cells = ARRAY_SIZE(pm8008_regulator_cells);
>  	}
>  
>  	/* Needed by GPIO driver. */
> -	dev_set_drvdata(dev, regmap_irq_get_domain(irq_data));
> +	dev_set_drvdata(dev, domain);
>  
> -	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, pm8008_cells,
> -				ARRAY_SIZE(pm8008_cells), NULL, 0,
> -				regmap_irq_get_domain(irq_data));
> +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, cells,
> +				num_cells, NULL, 0, domain);
>  }
>  
>  static const struct of_device_id pm8008_match[] = {
> -- 
> 2.55.0
> 

-- 
Lee Jones
