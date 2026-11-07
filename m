Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794049016;
	b=j2JA7Vs1A1PqaNd60d6JLbgsWnh57qCWverGlG26j5nH4WFVL7QNlxKooFNm0ejN+u6Q
	 e7mI47dskfvKeHn8FL3V0cXqqSRuBwLv64WBLMrRDkW5zP6DQQTmANJtS5x5WQSP+xsPB
	 A9oN8Q5/DtOXzvo1kpxgjpzbXlTGDtv2fhUgaC9gO6IofxwgrsEw5nqI/DNCOBzs51OBY
	 CIO8rVw0Qa7NF/Fhse31v6d4CGWg8WSCpZztSHNkJsqYGqNpaMCw43wdpo/K8b3gsEmUR
	 9uJwLkUjxWl5WGRq6BP5Js4ZK/bRoxsC3fQZCyS0xqWNoPbwsonvcTg5FUYEtxOnnjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794049016;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=5y8ezEvpC5l0c6JCtL4jSOvi5yOAgdr9LvjwwVnUDmg=;
	b=cE8qhJTSoOR/MeuflunGczcKI5n18S5pZyS5bU4vBi7zTD78KXLVJh0X+I133UXWyr0L
	 vheCXhXKtaajvG750wpdaH0qFI3q2/MzlVRY58BcZW/KjLa79hnd3ij9fDgwkUjQ97jSk
	 BPFXhPJvezPTAZMe37nl/cbiT6pKPtph45hb5MJPpmglgpikJntn1FonyJV6yv21l1OJV
	 ioSM9PfgxrkZHajWmGF+1Znu7TQ34ujk/eiUeHdAYpdS/Hykbzi6LHc4sJxoBkwiWT6je
	 vIAAMacKw4QfN8P8LbR3EWrk5BdlBmWVdQ6dNjI6vtJU0qCwQMzA88GvPOBpcboC2JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MqQ4nqS8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FFE606A32D;
	Sat,  7 Nov 2026 10:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MqQ4nqS8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4E4C1F008A1;
	Sat,  7 Nov 2026 10:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794049016;
	bh=5y8ezEvpC5l0c6JCtL4jSOvi5yOAgdr9LvjwwVnUDmg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=MqQ4nqS8lX6SxfwqNnH3b4+d47OsL/ync5eIzExeP6nTaUgujEOwQfCCAaONJdRFO
	 eEVfLg10ehU8LADjk9KytG2B8t3wxV2lx2C/zfQ6QaSGNoYePKvbyy7tRMzwPvjnJZ
	 +QedI4xYbeyHcoC7s28xfHRH0UOUasPTH08zPyhnhmsIKuD+s8jw/16gytJJkWsBko
	 gfO+oaWaEVTw5UYV6m6ke/y3OdQcaFZ6IrXm4kx9h+slZkJ97tiVDAmxFp/aLITGsV
	 yN6Ccl7KkbdUrjXLKUwdZUAEuWtvhHHZEzPjbpqFdjTy/VxefNJcfCS+z4YlspRrD4
	 AXl0nMKsNFjkg==
Message-ID: <b214585d-4944-4c86-8ed8-58701974ccc4@kernel.org>
Date: Sat, 7 Nov 2026 11:56:50 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] usb: typec: add CIX Type-C PD controller driver
To: Gary Yang <gary.yang@cixtech.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fugang Duan <fugang.duan@cixtech.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 cix-kernel-upstream@cixtech.com
References: <20261107011012.3655873-1-gary.yang@cixtech.com>
 <20261107011012.3655873-3-gary.yang@cixtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGPBBMBCgA5AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJp2mE8AAoJEBuTQ307QWKbeaIP
 /ihHTkTW4KsN/DQ945JJbyu5tI0J80Wue7QyyLPglyKfhgb5cLLNPpOC8cCIJsc7+W3i2P38
 s2c1cOH6CYGE7E9ur3Vfme8NW2S2I/Z8VC7bZnzyS23wT17LrsdS/qCpx4o8U+pt/xdXDKph
 EGRYrIEmMpUWvyYzyYKGIe25FtaayIIKpq8eZYyFcp2f/sG5IkOW5uZzHPMPdcm87jU7fyuQ
 rAU2vx9r+ulUfQ/q9Z2roC/ode3l7t2pN7BCBCsUDp6JCrUyZrtT1e7EbA0ZRP3aOBNk2P2E
 DQOgJGjGdO5Yx2Y9LFtltu6JbsBJHi1syGRX3AtQYOMc4Y1WGoeZJmMlvKj2ZqqXNkcWi2DS
 IQEWB0uW6CqFsBBIMGDa+6OzdaVO/uAVXWDWml02Men3CILdI1MbVjoh8ECqYUY7OQ+JJvNN
 vnliuq5WM3Ghd3jg/LZZrxXjdIginRHFQCjIJYLKpLZWm1/iDFedcfzqRNYmTtqscdCNHW41
 oT3Z7BmO9xwdjuwBS6nmS6JJwkbf5Ot2QR4pB/DRU7ZwjT1qHe+9r9gF32wXVQatHNGK/VVu
 sfwOnkdxCWkp/qb2gdQRmZh+SedStWshigH6sNfuHBloF/q+hjMRc8b2m326OZdrbSHwY1Sz
 vti8Hn7n8NjdHO9LKB7BIdjkA9DA5WsqOuVCzsFNBFVDXDQBEADNkrQYSREUL4D3Gws46JEo
 Z9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLueMNsWLJBv
 BaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6eiOMheesVS
 5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wAGldWsRxb
 f3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA6z6lBZn0
 WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9YegxWKvX
 XHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt91pFzBSO
 IpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gUBLHFTg2h
 YnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/JoFzZ4B0
 p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu4vXVFBYI
 GmpyNPYzRm0QPwARAQABwsF2BBgBCgAgAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmna
 YUkACgkQG5NDfTtBYptX+BAApg32CkxwNucNEi8WfWA8oKkW0y8YDuY6ORMo9FWNGiT/OTy0
 vyJrLocrpn86zwfjVp+eCrssPYh8eqJfnWqmYv6ACQtHPYzPZQ3mSo8H97Z01oUxITzCxpXm
 ZkLgPIqtDPcC2E3dPM/fVxcyowM8XsaMA9wcsaUYrta8toOq2b9tKcjleKMfMrm0gQ9u7wUc
 QbLkwj6TCLOwucb07GXzLTNF9PZmaDUpKAZjMjmrW+le+SFvQbhamx0rxLWPR0NWntXpbCn+
 +ACch03p/JyTBVktxFsFyCt7pTPE1kEaeuXBTe/a2D9iQvRxRW19LvuO2e59/u1wYUiH/orz
 wbIC2S4dBsPAPihL3ztOU1yE86GPyQtSE0kU+/7snnLt4QGi6PChf3t5gnNjAzjUUovO8rgI
 c+5yN5heq5loYHgK6OQ9OlHzsPHO9e9MOQcKlFycs1pyijFGzDwdNUm/SchK8iWT2QApTx4A
 K9bCVaboTA2T77QYkRcRJYSsO1alGX0ome/hMLD1daXlkrNUp1HWa3K4iytLRXjCSIorWiGs
 n+q3krnpXu3TFkA8qtOFZMdnIiFuiq1yLT8hptsV5xh1TA2nsVvSYiaCr3q4s4BKjS/KrLDb
 qoxzw8ISjdUp4pA85vb6YLCmb39NgidD+7PmAr65lBNveIFynTgsja1rRQ4=
In-Reply-To: <20261107011012.3655873-3-gary.yang@cixtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/11/2026 02:10, Gary Yang wrote:
>  CLANG CONTEXT ANALYSIS
>  M:	Marco Elver <elver@google.com>
>  R:	Bart Van Assche <bvanassche@acm.org>
> diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
> index 2f80c2792dbd..b81a0d946d00 100644
> --- a/drivers/usb/typec/Kconfig
> +++ b/drivers/usb/typec/Kconfig
> @@ -110,6 +110,17 @@ config TYPEC_WUSB3801
>  	  If you choose to build this driver as a dynamically linked module, the
>  	  module will be called wusb3801.ko.
>  
> +config TYPEC_CIX_PD
> +	tristate "CIX Type-C PD controller driver"
> +	depends on I2C

depends on your ARCH || COMPILE_TEST

> +	select REGMAP_I2C
> +	help
> +	  Say Y or M here if your system has a CIX Type-C PD controller.
> +	  This driver currently supports the Realtek RTS5453H controller.
> +
> +	  If you choose to build this driver as a dynamically linked module, the
> +	  module will be called cix_pd.ko.


...


> +static int cix_pd_init_ports(struct cix_pd *typec)
> +{
> +	struct device *dev = typec->dev;
> +	struct typec_altmode_desc desc = cix_pd_dp_altmode;
> +	int ret, nports;
> +
> +	nports = device_get_child_node_count(dev);
> +	if (nports == 0) {
> +		dev_err(dev, "No port entries found.\n");
> +		return -ENODEV;
> +	}
> +
> +	if (nports > 1) {
> +		dev_err(dev, "More ports listed than can be supported.\n");
> +		return -EINVAL;
> +	}
> +
> +	device_for_each_child_node_scoped(dev, fwnode) {
> +		ret = fwnode_property_read_u32(fwnode, "reg", &typec->id);
> +		if (ret)
> +			goto unregister_ports;
> +
> +		ret = cix_pd_typec_parse_port_props(&typec->caps, fwnode,
> +						    dev);
> +		if (ret)
> +			goto unregister_ports;
> +
> +		typec->port = typec_register_port(dev, &typec->caps);
> +		if (IS_ERR(typec->port)) {
> +			ret = PTR_ERR(typec->port);
> +			typec->port = NULL;
> +			dev_err(dev, "Failed to register port: %d\n", ret);
> +			goto unregister_ports;
> +		}
> +
> +		desc.roles = typec->caps.data;
> +		typec->port_altmode = typec_port_register_altmode(typec->port,
> +								  &desc);
> +		if (IS_ERR(typec->port_altmode)) {
> +			ret = PTR_ERR(typec->port_altmode);
> +			typec->port_altmode = NULL;
> +			dev_err(dev, "Failed to register DP altmode: %d\n", ret);
> +			goto unregister_ports;
> +		}
> +
> +		ret = cix_pd_typec_get_handles(typec, fwnode, dev);
> +		if (ret)
> +			goto unregister_ports;
> +	}
> +
> +	return 0;
> +
> +unregister_ports:
> +	cix_pd_unregister_ports(typec);
> +	return ret;
> +}
> +
> +/*
> + * The IRQ is disabled when either the user asked for it or the device is
> + * suspended. Keep the disable/enable calls balanced and idempotent.
> + */
> +static void cix_pd_sync_irq(struct cix_pd *rts)
> +{
> +	bool disable = rts->pd_int_disabled || rts->suspended;
> +
> +	if (!rts->irq_requested || rts->irq_disabled == disable)
> +		return;
> +
> +	rts->irq_disabled = disable;
> +	if (disable)
> +		disable_irq(rts->irq);
> +	else
> +		enable_irq(rts->irq);
> +}
> +
> +static ssize_t disable_pd_interrupt_show(struct device *dev,
> +					 struct device_attribute *attr,
> +					 char *buf)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct cix_pd *rts = i2c_get_clientdata(client);
> +	const char *p;
> +
> +	if (rts->pd_int_disabled)
> +		p = "disabled";
> +	else
> +		p = "enabled";
> +
> +	return sysfs_emit(buf, "%s\n", p);
> +}
> +
> +static ssize_t disable_pd_interrupt_store(struct device *dev,
> +					  struct device_attribute *attr,
> +					  const char *buf, size_t count)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct cix_pd *rts = i2c_get_clientdata(client);
> +	bool value;
> +	int ret;
> +
> +	ret = kstrtobool(buf, &value);
> +	if (ret)
> +		return ret;
> +
> +	mutex_lock(&rts->irq_lock);
> +	rts->pd_int_disabled = value;
> +	cix_pd_sync_irq(rts);
> +	mutex_unlock(&rts->irq_lock);
> +
> +	dev_alert(dev, "Only for USB Compliance test, PD int is %s\n",
> +		  value ? "disabled" : "enabled");

What?

> +
> +	return count;
> +}
> +
> +DEVICE_ATTR_RW(disable_pd_interrupt);

You need to document the ABI. But really, we do not enable/disable
interrupts through custom sysfs hooks. Drop.

> +
> +static int cix_pd_probe(struct i2c_client *client)
> +{
> +	struct cix_pd *rts;
> +	int ret;
> +
> +	dev_dbg(&client->dev, "IRQ %d supplied\n", client->irq);

Drop

> +	rts = devm_kzalloc(&client->dev, sizeof(*rts), GFP_KERNEL);
> +	if (!rts)
> +		return -ENOMEM;
> +
> +	rts->dev = &client->dev;
> +	rts->irq = client->irq;
> +	mutex_init(&rts->lock);
> +	mutex_init(&rts->irq_lock);
> +	cix_pd_typec_init_state(rts);
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
> +		return dev_err_probe(&client->dev, -ENODEV,
> +				     "i2c check functionality failed\n");
> +
> +	rts->regmap = devm_regmap_init_i2c(client, &cix_pd_regmap_config);
> +	if (IS_ERR(rts->regmap))
> +		return dev_err_probe(&client->dev, PTR_ERR(rts->regmap),
> +				     "failed to init regmap\n");
> +
> +	i2c_set_clientdata(client, rts);
> +
> +	ret = cix_pd_init_ports(rts);
> +	if (ret)
> +		return ret;
> +
> +	ret = cix_pd_event_handler(rts, 0);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to read initial status: %d\n", ret);
> +		if (ret == -ESHUTDOWN)
> +			ret = -EIO;
> +		goto err_unregister_ports;
> +	}
> +
> +	if (client->irq > 0) {
> +		irq_set_status_flags(client->irq, IRQ_DISABLE_UNLAZY);
> +		ret = request_threaded_irq(client->irq, NULL, cix_pd_irq_handle,
> +					   IRQF_SHARED | IRQF_ONESHOT,
> +					   dev_name(&client->dev), rts);
> +		if (ret) {
> +			dev_err(&client->dev, "failed to request irq: %d\n", ret);
> +			goto err_unregister_ports;
> +		}
> +		rts->irq_requested = true;
> +	}
> +
> +	ret = device_create_file(&client->dev, &dev_attr_disable_pd_interrupt);
> +	if (ret)
> +		dev_warn(&client->dev,
> +			 "Failed to create sysfs attribute, ret = %d\n", ret);
> +
> +	device_set_wakeup_capable(&client->dev, true);
> +
> +	return 0;
> +
> +err_unregister_ports:
> +	cix_pd_unregister_ports(rts);
> +	return ret;
> +}
> +
> +static void cix_pd_remove(struct i2c_client *client)
> +{
> +	struct cix_pd *rts = i2c_get_clientdata(client);
> +
> +	device_remove_file(&client->dev, &dev_attr_disable_pd_interrupt);
> +
> +	mutex_lock(&rts->irq_lock);
> +	if (rts->irq_requested) {
> +		rts->suspended = true;
> +		cix_pd_sync_irq(rts);
> +		if (rts->wake_enabled) {
> +			disable_irq_wake(rts->irq);
> +			rts->wake_enabled = false;
> +		}
> +		free_irq(rts->irq, rts);
> +		rts->irq_requested = false;
> +	}
> +	mutex_unlock(&rts->irq_lock);
> +
> +	cix_pd_unregister_ports(rts);
> +}
> +
> +static const struct of_device_id cix_pd_of_match[] = {
> +	{ .compatible = "realtek,rts5453h", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, cix_pd_of_match);
> +
> +static const struct i2c_device_id cix_pd_id[] = {
> +	{ "rts5453h" },
> +	{}
> +};
> +
> +static int __maybe_unused cix_pd_suspend(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct cix_pd *rts = i2c_get_clientdata(client);
> +
> +	mutex_lock(&rts->irq_lock);
> +	if (rts->irq_requested) {
> +		rts->suspended = true;
> +		cix_pd_sync_irq(rts);
> +		if (device_may_wakeup(dev)) {
> +			enable_irq_wake(rts->irq);
> +			rts->wake_enabled = true;
> +		}
> +	}
> +	mutex_unlock(&rts->irq_lock);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused cix_pd_resume(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct cix_pd *rts = i2c_get_clientdata(client);
> +
> +	mutex_lock(&rts->irq_lock);
> +	if (rts->irq_requested) {
> +		if (rts->wake_enabled) {
> +			disable_irq_wake(rts->irq);
> +			rts->wake_enabled = false;
> +		}
> +		rts->suspended = false;
> +		cix_pd_sync_irq(rts);
> +	}
> +	mutex_unlock(&rts->irq_lock);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused cix_pd_restore(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct cix_pd *rts = i2c_get_clientdata(client);
> +	int ret;
> +
> +	ret = cix_pd_resume(dev);
> +	if (ret)
> +		return ret;
> +
> +	/* Re-trigger PD event if PD event occurs during std */
> +	ret = cix_pd_event_handler(rts, 0);
> +	if (ret)
> +		dev_err(&client->dev, "typec event handling error %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static void cix_pd_shutdown(struct i2c_client *client)
> +{
> +	struct cix_pd *rts = i2c_get_clientdata(client);
> +
> +	mutex_lock(&rts->irq_lock);
> +	rts->suspended = true;
> +	cix_pd_sync_irq(rts);
> +	mutex_unlock(&rts->irq_lock);
> +}
> +
> +static const struct dev_pm_ops cix_pd_pm_ops = {
> +	.suspend = pm_sleep_ptr(cix_pd_suspend),
> +	.resume = pm_sleep_ptr(cix_pd_resume),
> +	.freeze = pm_sleep_ptr(cix_pd_suspend),
> +	.thaw = pm_sleep_ptr(cix_pd_resume),
> +	.restore = pm_sleep_ptr(cix_pd_restore),
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, cix_pd_id);

This is placed next to the table.

> +static struct i2c_driver cix_pd_i2c_driver = {
> +	.driver = {
> +		.name = "rts5453h",
> +		.of_match_table = cix_pd_of_match,
> +		.pm = pm_ptr(&cix_pd_pm_ops),
> +	},
> +	.id_table = cix_pd_id,
> +	.probe = cix_pd_probe,
> +	.remove = cix_pd_remove,
> +	.shutdown = cix_pd_shutdown,
> +};
> +
> +module_i2c_driver(cix_pd_i2c_driver);
> +MODULE_DESCRIPTION("CIX Type-C PD controller driver");
> +MODULE_AUTHOR("Chao Zeng <Chao.Zeng@cixtech.com>");
> +MODULE_AUTHOR("Gary Yang <gary.yang@cixtech.com>");
> +MODULE_LICENSE("GPL");


Best regards,
Krzysztof
