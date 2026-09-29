Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B40472072
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790663883; cv=none; b=Tvg18LlP8m4ZNbjlBeZ9DjxanbC9ZsfSJO/DGQ31nRBfVs04n5OEF/xtNv+mGoxr9cMUJlXh3sCs4mCnYqtpKiau/TK7NagzcrtbRNlgqYbEEfq9zkKtSvc2GkMkYXdxvH4GzaQgKvp1vfVeHJwClUfv0WrZdnX5o+t02tBBw70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790663883; c=relaxed/simple;
	bh=bqhULqgYPRmo0s4rEMZ5rCjpuavKM/NbPA3+QVXdkZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f9gB/bLEYN0PaJ93Bd9d9wYy1+WGY1FkMscKq8jo/ZF/oqGilngAA4btVHzsmirZyvAi+9mtSs/4b69+QXwDXotBHMuY95l7ftMQOeL60FZ/NvZVMAP1jAqPZ9CFrN9xlnfvdEmFXXYqev8HjkuyGT/KWwxkwigHgQzfZ3hH2NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XAvXtaRF; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XAvXtaRF"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8631d0023daso1906741b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790663881; x=1791268681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ggM22qaVGaHjihmi1lkkmx3+x10+vUrFkk5gh3pgiME=;
        b=XAvXtaRFqjtQfpNUucK4IWoph5FZxOxOgsTOpisWDbqArOa5ynjKkEyFobVqo0Iuk1
         rH/eQ3VqKnNqLI9vdkjXzgBDEOuiRVzOJCyBMrM3XU/oaup1wNgmjBU3QY4Dg0Hc6BMP
         JIENQj4mODKnnLieJRrBpVYNkCGCs5ZMLPtY8VF1VeV4TyfILmZD6EK3aCS+x2NR0IPx
         0AW6DsM+gIuWkZaHxhXNo7u6uersMyQbKZBGByh0UQZ5LU4oK07RG7w6YTp/TLAnKqxS
         bKePvm2b0ksqSUMIV13Q4ARbwzWwARxoi9NPUzwgVtq0MKQcdU8XPq2s3OnjL+Us2qU6
         67LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790663881; x=1791268681;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ggM22qaVGaHjihmi1lkkmx3+x10+vUrFkk5gh3pgiME=;
        b=0R9AL9doduHT2AtV/B21+atdxBrdHrqwlPcd044rT5+l4yMbu/4Jd/hVrWAD3s9FCV
         BBWln1pC5KEzxJMlzp/IMylfyYcKn7+s6Mfkt7FCb3TpyEaXLcjskDNPZs0t6O/c2Z/n
         JRlnGea1a83lSRCzGolzTezpPtwGhgjaxpgyaaKNYnCDBpMhQA6Sp+vM/VOEPsbyekSs
         T3qEMK5uwfUCvtiQR9JHQXD2np00OIMiFNl7kblZYicfGYcH0ikhPUj0jWlX1M8gVPue
         KlAgaMxZexk5+mD2agwl/lWci1fW/VB1imMky0hcSWZ3xX1XcAsQlRSALT5R0JeGvGul
         6bJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNRUBi++0o4yrsmjEG9v34OVgRdgkP+J7Y94v19FIVLpX51Y4ymDYTds7NlrchhWScst0GTak8H5627dg=@vger.kernel.org
X-Gm-Message-State: AFuF++lwmUxVH6oD/PNIVy9jtpcp+8YDasw8Zbyw+St9h75Unzw7Kn0C
	kwl4Kiu01jjcOOQPZ8rVz9AwR/EtJm/c5Z2iYWDJOyA305pf44QpPzhm
X-Gm-Gg: AYBFou3l0ZDbeAQTAqLxb5wUjE0NHhtldavZ5GVfMDjvHKsVVfhodupblGI4IpKx0Ho
	nw20A2yAIwG6MMOTUGInKf8EK7MwbguVsLlGkQPATWi7VzqaVqlifIhwmnl2HebAQJ5JIVMl7wV
	D8A0ReJmfeM+znYzpNFv8C7LvvloJJKHGzraDTjbehXhf5WgduSSjG60o5uqx0LhlJo6gH+86Si
	DZ/rz7BW4PYxAhbZgfWV+GqD9JMowr/W5Br8bAwbuX9a3p8NSYzrxi1YqQPsFQA4O/GqlLjreAI
	B6+V3jh4GW/XtGsSaBmuJ6Bm0owcjTiAxVh9PrfPZnLqszKRlRjYw2SzAA2Z3LDdjrjujD3JX/z
	O5UZfwhe1kIqKO7eKPguEV0PC+EE932kMJyBmEdY8M40A1RR47oP60aNcakH7WSyrFTBIQVG2be
	eWzr97FPEZkjBFD/tiAMlUid73ri1jckpkOyJMfl0pKnlVmbEIP0WW3zKf3VzS2b2ymHToXjKrC
	hJoHPDG5IEfy80XjC7sDyt6Oh9IMJXxfcbSeIrYf9TroGQ=
X-Received: by 2002:a05:6a20:2450:b0:3d3:ad3c:49a9 with SMTP id adf61e73a8af0-3de0e744e71mr14694613637.23.1790663880945;
        Mon, 28 Sep 2026 23:38:00 -0700 (PDT)
Received: from [172.19.1.48] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885e20f2068sm246849b3a.42.2026.09.28.23.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 23:38:00 -0700 (PDT)
Message-ID: <c382ec53-dae0-45eb-86ca-de04f5b42360@gmail.com>
Date: Tue, 29 Sep 2026 14:37:58 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/3] i2c: ma35d1: Add Nuvoton MA35D1 I2C driver
 support
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
References: <20260921083753.1109826-1-zychennvt@gmail.com>
 <20260921083753.1109826-3-zychennvt@gmail.com>
 <aro-QitaRwK87gdO@zenone.zhora.eu>
Content-Language: en-US
From: zychen <zychennvt@gmail.com>
In-Reply-To: <aro-QitaRwK87gdO@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andi,
Thanks for your review. 

Andi Shyti 於 2026/9/28 下午 08:24 寫道:
> Hi Zi-Yu,
> 
> ...
> 
>> +/* Constants */
>> +#define MA35_CLKDIV_MSK		GENMASK(9, 0)
>> +#define I2C_PM_TIMEOUT_MS	5000
>> +#define STOP_TIMEOUT_MS		50
> 
> these two defines are the only ones without the MA35 prefix.

Will add the MA35 prefix to these two definitions.
> 
> ...
> 
>> +static irqreturn_t ma35d1_i2c_irq_target_trx(struct ma35d1_i2c *i2c,
>> +					     unsigned long i2c_status)
>> +{
>> +	unsigned char byte = 0;
>> +
>> +	switch (i2c_status) {
>> +	case MA35_S_RECE_ARB_LOST:
>> +		/*
>> +		 * Arbitration lost during address transmission phase.
>> +		 * The hardware switches to Target Transmitter mode when
>> +		 * our own SLA+W is detected on the bus.
>> +		 */
>> +		i2c->err = -EAGAIN;
>> +		ma35d1_i2c_controller_complete(i2c);
>> +		i2c_slave_event(i2c->target, I2C_SLAVE_WRITE_REQUESTED, &byte);
> 
> All the return values of these i2c_slave_event()'s are ignored.
> 
>> +		break;
>> +
>> +	case MA35_S_RECE_ADDR_ACK:
>> +		/* Own SLA+W has been receive; ACK has been return */
>> +		i2c_slave_event(i2c->target, I2C_SLAVE_WRITE_REQUESTED, &byte);
>> +		break;
>> +
>> +	case MA35_S_TRAN_DATA_NACK:
>> +	case MA35_S_RECE_DATA_NACK:
>> +		/*
>> +		 * Data byte or last data in I2CDAT has been transmitted and NACK received,
>> +		 * or previously addressed with own SLA address and NACK returned.
>> +		 */
>> +		break;
>> +
> 
> ...
> 
>> +	default:
>> +		dev_err(i2c->dev, "Status 0x%02lx is NOT processed\n",
>> +			i2c_status);
>> +		ma35d1_i2c_restore_idle(i2c);
>> +		return IRQ_NONE;
>> +	}
>> +	ma35d1_i2c_write_ctl(i2c, MA35_CTL_SI_AA);
> 
> As far as I understood, this this is an unconditional ACK enabled
> for the next bytes received, right? In that case are we ignoring
> failed communications as above where we are supposed to send
> NACKs?
> 
Regarding the two comments above:
I will add handling for the return value of `I2C_SLAVE_WRITE_REQUESTED`. When it returns an error, subsequent bytes will be NACKed until the transfer ends.

For `I2C_SLAVE_WRITE_RECEIVED`, the MA35D1 hardware has already generated the ACK when this event is reported, so it is not possible to NACK the received byte at this point. Therefore, its return value can only be temporarily ignored.

>> +	return IRQ_HANDLED;
>> +}
> 
> ...
> 
>> +	i2c->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>> +	if (IS_ERR(i2c->regs))
>> +		return PTR_ERR(i2c->regs);
>> +
>> +	i2c->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
>> +	if (IS_ERR(i2c->rst))
>> +		return dev_err_probe(dev, PTR_ERR(i2c->rst),
>> +				     "failed to get reset control\n");
>> +
>> +	ret = reset_control_deassert(i2c->rst);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to deassert reset line\n");
>> +
>> +	/* Setup info block for the I2C core */
>> +	strscpy(i2c->adap.name, "ma35d1-i2c", sizeof(i2c->adap.name));
>> +	i2c->adap.owner = THIS_MODULE;
>> +	i2c->adap.algo = &ma35d1_i2c_algorithm;
>> +	i2c->adap.quirks = &ma35d1_i2c_quirks;
>> +	i2c->adap.retries = 2;
>> +	i2c->adap.algo_data = i2c;
>> +	i2c->adap.dev.parent = &pdev->dev;
>> +	i2c->adap.dev.of_node = pdev->dev.of_node;
>> +	i2c_set_adapdata(&i2c->adap, i2c);
>> +
>> +	if (!device_property_read_u32(dev, "clock-frequency", &val)) {
>> +		if (val != 0 && val <= MEGA)
>> +			busfreq = val;
>> +	}
>> +	/* Calculate divider based on the current peripheral clock rate */
>> +	clkdiv = DIV_ROUND_CLOSEST(clk_get_rate(i2c->clk), busfreq * 4) - 1;
>> +	if (clkdiv < 0 || clkdiv > 0x3ff)
>> +		return dev_err_probe(dev, -EINVAL, "invalid clkdiv value: %d\n",
>> +				     clkdiv);
>> +
>> +	i2c->irq = platform_get_irq(pdev, 0);
>> +	if (i2c->irq < 0)
>> +		return dev_err_probe(dev, i2c->irq, "failed to get irq\n");
>> +
>> +	platform_set_drvdata(pdev, i2c);
>> +
>> +	pm_runtime_set_autosuspend_delay(dev, I2C_PM_TIMEOUT_MS);
>> +	pm_runtime_use_autosuspend(dev);
>> +	pm_runtime_set_active(dev);
>> +	pm_runtime_enable(dev);
>> +
>> +	ret = devm_add_action_or_reset(dev, ma35d1_i2c_pm_cleanup, dev);
>> +	if (ret)
>> +		return ret;
> 
> you are printing an error message everywhere, except of here.

Right. I’ll add an error message here as well.

> 
>> +
>> +	writel(MA35_CTL_I2CEN | MA35_CTL_INTEN, i2c->regs + MA35_CTL0);
>> +	writel(FIELD_PREP(MA35_CLKDIV_MSK, clkdiv), i2c->regs + MA35_CLKDIV);
>> +
>> +	ret = devm_request_irq(dev, i2c->irq, ma35d1_i2c_irq, 0, dev_name(dev),
>> +			       i2c);
>> +	if (ret) {
>> +		dev_err_probe(dev, ret, "cannot claim IRQ %d\n", i2c->irq);
>> +		return ret;
>> +	}
>> +
>> +	ret = devm_i2c_add_adapter(dev, &i2c->adap);
>> +	if (ret) {
>> +		dev_err_probe(dev, ret, "failed to add bus to i2c core\n");
>> +		return ret;
> 
> return dev_err_probe(...)
will do.

> 
> Thanks,
> Andi
> 
>> +	}
>> +
>> +	dev_info(&i2c->adap.dev, "%pa MA35D1 I2C adapter registered\n",
>> +		 &res->start);
>> +	return 0;
>> +}

