Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D03941A92C;
	Thu, 27 Aug 2026 10:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787825822; cv=none; b=iUkms0gJho0FHTKlxVXZ83uUXtoo8Qn6pMbPRJaEzibM1jHbeczSBBLakCsxLZJhQhAzCsNQ6A+ysJqFqD4nW3L8arhzwRIvIwkqgH1ZXWGfc8FkEoVzfs2iF811iC3ptre65lrYM/IqKjlQa9fhk1PsgnyEb1e1qGNJwc+8RZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787825822; c=relaxed/simple;
	bh=l3/YrC1PPPK71x8oD74z4pQvhnpdj6gch8cUe1f2b6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R7bkiKptqvDLe1g4uvMrEcwo1GrLS/IwhPJA/rNWA0smlCllP/OC3pXNhIWzzC3ieR1hTz0edY08GeqTcyisvujCVWMuVWhAWjvhLnZTXfKYqXxgTkDC+772/B5YfY+CpDfUQGW8YCxfxCGy6R0opQH5IUkrpaHamItGR3P/uC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bP0BDM7v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bP0BDM7v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE6341F000E9;
	Thu, 27 Aug 2026 10:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787825813;
	bh=GSFSKsvDnlEU0y2eCld40uwcZtAwLvmq/TjVFtBgspM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=bP0BDM7vNHP/mN3GiCBJ/mfXhaWrYj+52OBTl+4mUAeGaEtWDRXwES3i9V3gA9a6U
	 dQsmgDQC7n0cwIhJkxjsNGhQPmPhUeKyrwl6DSAs0JI+qk7hhV7W6aOuRFi6Okju8V
	 ZKkovTImFNQ7qRTI9IxOE/J/9CjwHUWwU0KIP/Lu4oXzvh4uZWNRwYev4w0n8LZ048
	 RNdUGvLVffUeZSzb1XnYaVarFts3QLevcR0gFfpGvyZUsrD039AbDb4ZnidQlSfLjF
	 lP/fpif7S8rpYEUSce41duCYIKhV9IaXHTv4L2SIOKe46KmB6YiiQKO4kEIO9Qi5zF
	 URlhqA7LmR4Fg==
Message-ID: <91090730-b8b5-4346-a151-c11489abf2b3@kernel.org>
Date: Thu, 27 Aug 2026 12:16:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 7/8] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x
 I3C hub functionality
To: Lakshay Piplani <lakshay.piplani@nxp.com>, linux-kernel@vger.kernel.org,
 linux-i3c@lists.infradead.org, alexandre.belloni@bootlin.com,
 krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, broonie@kernel.org, lee@kernel.org,
 Frank.Li@nxp.com, lgirdwood@gmail.com
Cc: vikash.bansal@nxp.com, priyanka.jain@nxp.com, aman.kumarpandey@nxp.com
References: <20260826103819.1614843-1-lakshay.piplani@nxp.com>
 <20260826103819.1614843-8-lakshay.piplani@nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260826103819.1614843-8-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/08/2026 12:38, Lakshay Piplani wrote:
> +
> +static int p3h2x4x_configure_ldo(struct device *dev)
> +{
> +	static const char * const supplies[] = {
> +		"vcc1",
> +		"vcc2",
> +		"vcc3",
> +		"vcc4"
> +	};
> +	int ret, i;
> +
> +	for (i = 0; i < ARRAY_SIZE(supplies); i++) {
> +		ret = devm_regulator_get_enable_optional(dev, supplies[i]);
> +		if (ret && ret != -ENODEV)
> +			return dev_err_probe(dev, ret, "Failed to enable %s\n",
> +					     supplies[i]);
> +	}
> +
> +	/* This delay is required for the regulator to stabilize its output voltage */
> +	fsleep(5000);

Instead your regulators miss ramp delays.

> +
> +	return 0;
> +}


...

> +
> +static void p3h2x4x_get_target_port_dt_conf(struct device *dev,
> +					    const struct device_node *node)
> +{
> +	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub = dev_get_drvdata(dev);
> +	struct p3h2x4x *p3h2x4x = dev_get_drvdata(dev->parent);
> +	u64 tp_port;
> +
> +	for_each_available_child_of_node_scoped(node, dev_node) {

Why do you need scoped loop?

> +		if (of_property_read_reg(dev_node, 0, &tp_port, NULL))
> +			continue;
> +
> +		if (tp_port < p3h2x4x->num_target_ports) {
> +			if (p3h2x4x_i3c_hub->tp_bus[tp_port].of_node) {
> +				dev_warn(dev, "Duplicate target port %llu in DT\n", tp_port);
> +				continue;
> +			}
> +
> +			p3h2x4x_i3c_hub->tp_bus[tp_port].of_node = of_node_get(dev_node);
> +			p3h2x4x_i3c_hub->tp_bus[tp_port].tp_mask = P3H2X4X_SET_BIT(tp_port);
> +			p3h2x4x_i3c_hub->tp_bus[tp_port].p3h2x4x_i3c_hub = p3h2x4x_i3c_hub;
> +			p3h2x4x_i3c_hub->tp_bus[tp_port].tp_port = tp_port;
> +		}
> +	}
> +}
> +
> +static int p3h2x4x_parse_tp_dt_settings(struct device *dev,
> +					const struct device_node *node,
> +					struct tp_configuration tp_config[])
> +{
> +	struct p3h2x4x *p3h2x4x = dev_get_drvdata(dev->parent);
> +	u64 id;
> +	int ret;
> +
> +	for_each_available_child_of_node_scoped(node, tp_node) {
> +		enum p3h2x4x_tp_mode mode;
> +
> +		/*
> +		 * Only "i3c" and "smbus" children describe target ports. Skip any
> +		 * other child (for example the MFD "regulators" container), which
> +		 * has no "reg" property.
> +		 */
> +		if (of_node_name_eq(tp_node, "i3c"))
> +			mode = P3H2X4X_TP_MODE_I3C;
> +		else if (of_node_name_eq(tp_node, "smbus"))
> +			mode = P3H2X4X_TP_MODE_SMBUS;
> +		else
> +			continue;
> +
> +		ret = of_property_read_reg(tp_node, 0, &id, NULL);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "Failed to read reg for %pOF\n",
> +					     tp_node);
> +
> +		if (id >= p3h2x4x->num_target_ports)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "Invalid target port index %llu\n",
> +					     id);
> +
> +		tp_config[id].mode = mode;
> +		tp_config[id].pullup_en =
> +			of_property_read_bool(tp_node, "nxp,pullup-enable");
> +	}
> +
> +	return 0;
> +}
> +
> +static int p3h2x4x_get_hub_dt_conf(struct device *dev,
> +				   const struct device_node *node)
> +{
> +	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub = dev_get_drvdata(dev);
> +
> +	of_property_read_u32(node, "nxp,tp0145-pullup-ohms",
> +			     &p3h2x4x_i3c_hub->hub_config.tp0145_pullup);
> +	of_property_read_u32(node, "nxp,tp2367-pullup-ohms",
> +			     &p3h2x4x_i3c_hub->hub_config.tp2367_pullup);
> +	of_property_read_u32(node, "nxp,cp0-io-strength-ohms",
> +			     &p3h2x4x_i3c_hub->hub_config.cp0_io_strength);
> +	of_property_read_u32(node, "nxp,cp1-io-strength-ohms",
> +			     &p3h2x4x_i3c_hub->hub_config.cp1_io_strength);
> +	of_property_read_u32(node, "nxp,tp0145-io-strength-ohms",
> +			     &p3h2x4x_i3c_hub->hub_config.tp0145_io_strength);
> +	of_property_read_u32(node, "nxp,tp2367-io-strength-ohms",
> +			     &p3h2x4x_i3c_hub->hub_config.tp2367_io_strength);
> +
> +	return p3h2x4x_parse_tp_dt_settings(dev, node,
> +					    p3h2x4x_i3c_hub->hub_config.tp_config);
> +}
> +
> +static void p3h2x4x_default_configuration(struct device *dev)
> +{
> +	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub = dev_get_drvdata(dev);
> +	int tp_count;
> +
> +	p3h2x4x_i3c_hub->hub_config.tp0145_pullup = P3H2X4X_DFT_TP_PULLUP_OHMS;
> +	p3h2x4x_i3c_hub->hub_config.tp2367_pullup = P3H2X4X_DFT_TP_PULLUP_OHMS;
> +	p3h2x4x_i3c_hub->hub_config.cp0_io_strength = P3H2X4X_DFT_IO_STRENGTH_OHMS;
> +	p3h2x4x_i3c_hub->hub_config.cp1_io_strength = P3H2X4X_DFT_IO_STRENGTH_OHMS;
> +	p3h2x4x_i3c_hub->hub_config.tp0145_io_strength = P3H2X4X_DFT_IO_STRENGTH_OHMS;
> +	p3h2x4x_i3c_hub->hub_config.tp2367_io_strength = P3H2X4X_DFT_IO_STRENGTH_OHMS;
> +
> +	for (tp_count = 0; tp_count < P3H2X4X_TP_MAX_COUNT; ++tp_count)
> +		p3h2x4x_i3c_hub->hub_config.tp_config[tp_count].mode = P3H2X4X_TP_MODE_I3C;
> +}
> +
> +static void p3h2x4x_unregister_smbus_adapters_action(void *data)
> +{
> +	p3h2x4x_unregister_smbus_adapters(data);
> +}
> +
> +static void p3h2x4x_put_target_port_of_nodes(void *data)
> +{
> +	struct p3h2x4x_i3c_hub_dev *hub = data;
> +	int tp;
> +
> +	for (tp = 0; tp < P3H2X4X_TP_MAX_COUNT; tp++) {
> +		of_node_put(hub->tp_bus[tp].of_node);
> +		hub->tp_bus[tp].of_node = NULL;
> +	}
> +}
> +
> +static void p3h2x4x_clear_i3c_hub_priv(void *data)
> +{
> +	struct p3h2x4x *p3h2x4x = data;
> +
> +	/* Drop the IBI handler backpointer; see the ordering note at the registration site. */
> +	p3h2x4x->i3c_hub_priv = NULL;
> +}
> +
> +static int p3h2x4x_i3c_hub_probe(struct platform_device *pdev)
> +{
> +	struct p3h2x4x *p3h2x4x = dev_get_drvdata(pdev->dev.parent);
> +	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node;
> +	int ret, i;
> +
> +	p3h2x4x_i3c_hub = devm_kzalloc(dev, sizeof(*p3h2x4x_i3c_hub), GFP_KERNEL);
> +	if (!p3h2x4x_i3c_hub)
> +		return -ENOMEM;
> +
> +	p3h2x4x_i3c_hub->regmap = p3h2x4x->regmap;
> +	p3h2x4x_i3c_hub->dev = dev;
> +
> +	platform_set_drvdata(pdev, p3h2x4x_i3c_hub);
> +	device_set_of_node_from_dev(dev, dev->parent);
> +
> +	p3h2x4x_default_configuration(dev);
> +
> +	ret = devm_mutex_init(dev, &p3h2x4x_i3c_hub->etx_mutex);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < P3H2X4X_TP_MAX_COUNT; i++) {
> +		ret = devm_mutex_init(dev, &p3h2x4x_i3c_hub->tp_bus[i].port_mutex);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* get hub node from DT */
> +	node = dev_of_node(dev);
> +	if (!node)
> +		return dev_err_probe(dev, -ENODEV, "No Device Tree entry found\n");
> +
> +	ret = p3h2x4x_get_hub_dt_conf(dev, node);
> +	if (ret)
> +		return ret;
> +
> +	p3h2x4x_get_target_port_dt_conf(dev, node);
> +
> +	ret = devm_add_action_or_reset(dev,
> +				       p3h2x4x_put_target_port_of_nodes,
> +				       p3h2x4x_i3c_hub);
> +	if (ret)
> +		return ret;
> +
> +	ret = p3h2x4x_configure_hw(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to configure the HUB\n");
> +
> +	/* Register virtual I3C master controllers for I3C target ports */
> +	if (p3h2x4x->i3cdev) {
> +		p3h2x4x_i3c_hub->i3cdev = p3h2x4x->i3cdev;
> +		/*
> +		 * Publish the hub context in the MFD parent struct rather than
> +		 * via i3cdev_set_drvdata(), which would overwrite the parent's
> +		 * drvdata (struct p3h2x4x) that the IBI handler and other MFD
> +		 * callbacks rely on. Publish it before p3h2x4x_tp_i3c_algo()
> +		 * enables IBI, since the IBI handler dereferences it.
> +		 */
> +		p3h2x4x->i3c_hub_priv = p3h2x4x_i3c_hub;
> +
> +		/*
> +		 * Register the clear action before enabling IBI so that, on the
> +		 * devm LIFO unwind (probe failure or removal), the pointer is
> +		 * cleared only after IBI has been disabled and freed.
> +		 */
> +		ret = devm_add_action_or_reset(dev, p3h2x4x_clear_i3c_hub_priv,
> +					       p3h2x4x);
> +		if (ret)
> +			return ret;
> +
> +		ret = p3h2x4x_tp_i3c_algo(p3h2x4x_i3c_hub);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Failed to register i3c bus\n");
> +	}
> +
> +	/* Register virtual I2C adapters for SMBus target ports */
> +	ret = p3h2x4x_tp_smbus_algo(p3h2x4x_i3c_hub);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to add i2c adapter\n");
> +
> +	ret = devm_add_action_or_reset(dev,
> +				       p3h2x4x_unregister_smbus_adapters_action,
> +				       p3h2x4x_i3c_hub);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static const struct platform_device_id p3h2x4x_i3c_hub_id[] = {
> +	{ "p3h2x4x-i3c-hub" },

Use named initializers. In every patch of yours.

> +	{ }
> +};

..


> +
> +/**
> + * p3h2x4x_tp_i3c_algo - Register I3C virtual masters for I3C target ports.
> + * @p3h2x4x_hub: p3h2x4x device structure.
> + * Return: 0 in case of success, negative error code on failure.
> + */
> +int p3h2x4x_tp_i3c_algo(struct p3h2x4x_i3c_hub_dev *p3h2x4x_hub)
> +{
> +	struct i3c_master_controller *parent = i3c_dev_get_master(p3h2x4x_hub->i3cdev->desc);
> +	struct p3h2x4x *p3h2x4x = dev_get_drvdata(p3h2x4x_hub->dev->parent);
> +	u8 tp, ntwk_mask = 0;
> +	int ret;
> +
> +	p3h2x4x_hub->hub = devm_kzalloc(p3h2x4x_hub->dev,
> +					sizeof(*p3h2x4x_hub->hub),
> +					GFP_KERNEL);
> +

In multiple places you added blank lines between the call and if()
check. Don't.

> +	if (!p3h2x4x_hub->hub)
> +		return -ENOMEM;


Best regards,
Krzysztof
