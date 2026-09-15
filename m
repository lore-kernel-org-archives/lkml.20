Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64700351C0B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481190; cv=none; b=WeArrU/20xbEPtMtY0+ax8snHVdw6hRT/tdzPxlLGvccHJ9mw1qs3Dh58f93WHpFvHD79Fe5MtI98zbV1D5l+wA1rhML7b8B8SDmMXrtJyoO8qVP6Iv8jlDAS7PLYRoDcE7TU2VIXEilODT08Xt66+lhMqDKh4JRXl1E9NQEzN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481190; c=relaxed/simple;
	bh=J9OGQHwLd5RQh6VgnwYcZJ1/tJctHZfW70ij/Hm6Nr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fp6Ju4WMjOxngGym6BOAV/uR0PQp4kaVR5EzW+lg0d3O5k7blUwM4OxxucTaC5RhLoYjZiZZfL8g12h0cJiV4TTAmT2ZtTdafonwQQ4r05LLPDenuOtEPY52n/B5bfXgdWwntmi9jqcdqQRwm/jRaaOiXI09magNdkHUbGTHilg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sSs/X13u; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sSs/X13u"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16c72so382155e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789481186; x=1790085986; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7z0suvtQdygMfp5C2F1T6+DtNCb79uQkob7ja2atco0=;
        b=sSs/X13uEm7AXOqlsBPzp73MKg5sfTpnR094M67/q/BmWRLZig06hEGB5vN7CoqlnC
         NCy9dtCAmzPzN5gHKdSnQftEFtTSVNqvIDJX9bDUBhCYv0fFUa6sWruythZ+OPQXdcHu
         lTPi4WsQgusR6USpsrM+PcVgvNS9OFNiqJoXGpOacaHF4Gzdajtpdm418AOcfD4zMgOh
         TuJuv3YqhDZsnETAhcnejGTFcd7gJ4ZAybB6RpFJR0HQUScEFGfj+fFTwfpIB+bCJ61w
         sikym1YB6WpZeaxdeuf6q/6Vx4PxNshjOdRf9Thzgtjrc++QekfePLiEHqcUv7lLlc01
         nEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789481186; x=1790085986;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7z0suvtQdygMfp5C2F1T6+DtNCb79uQkob7ja2atco0=;
        b=M4nPncN5Per6Pc7yuOOpbyTPsdvpGfdltFdZcAA2kjzAhAPenYBfmWmQTvF9fZ8l+I
         EthjLXg3ns0jB+4GRdCJBz+jI4X2DSfqZ/v4LfB0NueSQD9sC1KBaBmwQR4mkqR/ztpD
         fO1V9fV0EfpbLtqbpJ2mfcuf4kbe1JSfdn8Odzr5EKOlRKyl7aM+C3vvO8JVy9GBlIEx
         2KFfibI7OKJueXSpNAiUJUG+E2DoxZhkRW3+0gC1ND/N/Pysa3YAptk9OfzW3q3fPpk+
         sr4aaPqHEDhg60rYlY95kvfhuVbmZu/Z7hps7aqy5oR/fWh04+0aZtvGoiSl0z8N5Cc3
         kgvg==
X-Gm-Message-State: AFuF++nDLhtAm0jFfoJo4KwoD62Zy5487FhGk/w/bBuXQ/kOBI6W9PWS
	ExWSXJKXb3fwUcWKLq1vLNUWOBn7TnZDS3SBFQ4atVDQreKPqUIGe9SrMulsBhe3uVrfcg==
X-Gm-Gg: AYBFou2v6FVTbu5AVRLoGJEpi3THWNxNb/lk3JjDj7Oba19p4DesSLKVAMGFF58fkMm
	h/3mAixIpxrve97FmHHVADoJJTY3Z5lyHPtKqP6xwCQiEZQb6sSrbZQLpJ4p3EWr6RKLVfVi21l
	eOEATgbLBFnRgdYCmTJwVjxDs88D4oZR1y2YhG5PRfRW95QiPD7I38SfG5GDWGSiVLcSAFK5mqz
	tS9fY8jg/XLAiGzSIYiPagPfVlrzzgj/5t39aZayYq0TdCXA4gMU3d7urhbrrPSU3DC6nCk+xIS
	YDQzM7I12tZdBw/rjNN/peyTvu0kp9YueJD1p67PgZBwDwEs7h4EdiKvsqfkCGjXtCR1JsaeFSF
	cs+udaSlWQTWnetrovLBY64TjoNtAcctCHNdEirvUXg6nal4b4Lv2rkCsWCp839cKDUNr5ULFQo
	VYYNU7xQSHuh4so2VSDm4ooWdU6bQSh5Xl1KL4ZTI53woxj5p9oVK1w7p6T9Nc6Eh+zU76jsDkD
	w1Wv/dqqRDcNZFGz/6ABV2cS8M=
X-Received: by 2002:a17:907:3ea7:b0:c28:e01d:1d08 with SMTP id a640c23a62f3a-c29d7a166d7mr87629266b.49.1789480709299;
        Tue, 15 Sep 2026 06:58:29 -0700 (PDT)
Received: from [10.43.61.105] ([185.94.190.187])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4e3d8sm608169766b.9.2026.09.15.06.58.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 06:58:28 -0700 (PDT)
Message-ID: <e697d892-fbd2-432a-b71c-8547ead22ea0@gmail.com>
Date: Tue, 15 Sep 2026 15:58:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] clk: Add gpio-locked fixed clock driver
To: Jerome Brunet <jbrunet@baylibre.com>,
 Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Jyri Sarha <jsarha@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
References: <20260915-feature-clock-guard-v5-0-42ab5dc3a6aa@bruker.com>
 <20260915-feature-clock-guard-v5-2-42ab5dc3a6aa@bruker.com>
 <1j33vaesh7.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <1j33vaesh7.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15.09.2026 12:09, Jerome Brunet wrote:
> On mar. 15 sept. 2026 at 09:27, Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org> wrote:
> 
>> From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
>>
>> A gpio-locked clock exposes a clock, which status is determined by a
>> GPIO signal. The common use-case is a FPGA-assisted clocking design
>> where peripheral clocks are generated by FPGA PLLs that are outside
>> CPU control, with clock-valid/PLL-lock status exposed through GPIO signals.
>> Consumers can use the output clock to wait until the input clock is locked
>> and only then initialize dependent peripherals.
>>
> 
> We already have gpio gate driver in drivers/clk/clk-gpio.c
> 
> It would be much better if you could just extend that one that take
> optionally take a clock input like you do here.

It is a bit more than that. The gated clock requires "enable-gpios" 
property, while gpio-locked clock needs "locked-gpios". Technically I 
could re-use the "enable-gpios", but that might lead to a confusion, 
because semantically they are used for different purpose. Do you think 
the extension of clk-gpio.c would be still better in this case?

>> Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
>> ---
>>   drivers/clk/Makefile          |   1 +
>>   drivers/clk/clk-gpio-locked.c | 169 ++++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 170 insertions(+)
>>
>> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
>> index b18af485d7f0..b904f292d683 100644
>> --- a/drivers/clk/Makefile
>> +++ b/drivers/clk/Makefile
>> @@ -46,6 +46,7 @@ obj-$(CONFIG_CLK_FD_KUNIT_TEST) += clk-fractional-divider_test.o
>>   obj-$(CONFIG_COMMON_CLK)	+= clk-gpio.o
>>   ifeq ($(CONFIG_OF), y)
>>   obj-$(CONFIG_COMMON_CLK)	+= clk-conf.o
>> +obj-$(CONFIG_COMMON_CLK)	+= clk-gpio-locked.o
>>   endif
>>   
>>   # KUnit specific helpers
>> diff --git a/drivers/clk/clk-gpio-locked.c b/drivers/clk/clk-gpio-locked.c
>> new file mode 100644
>> index 000000000000..b648f8763922
>> --- /dev/null
>> +++ b/drivers/clk/clk-gpio-locked.c
>> @@ -0,0 +1,169 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +/*
>> + * Clock Controller Guard Driver
>> + *
>> + * Copyright 2026 Bruker Corporation
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/device.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/slab.h>
>> +
>> +/**
>> + * struct gpio_locked_clk_priv - private state for the whole driver
>> + * @dev:		platform device
>> + *
>> + * @input_clk	input clock
>> + * @gpios:		input GPIO descriptor
>> + *
>> + * @output_hw_clk:      output clock HW descriptor
>> + * @output_clock_name:  output clock name
>> + */
>> +struct gpio_locked_clk_priv {
>> +	struct device *dev;
>> +
>> +	struct clk *input_clk;
>> +	struct gpio_desc *gpios;
>> +
>> +	struct clk_hw output_hw_clk;
>> +	const char *output_clock_name;
>> +};
>> +
>> +#define to_gpio_locked_clk_priv(_hw) \
>> +	container_of(_hw, struct gpio_locked_clk_priv, output_hw_clk)
>> +
>> +static int gpio_locked_clk_is_enabled(struct clk_hw *hw)
>> +{
>> +	struct gpio_locked_clk_priv *priv = to_gpio_locked_clk_priv(hw);
>> +
>> +	int data = gpiod_get_value(priv->gpios);
>> +
>> +	if (data < 0) {
>> +		dev_err(priv->dev, "Failed to get data gpio val: %d\n",
>> +				data);
>> +		return data;
>> +	} else if (!data) {
>> +		dev_warn(priv->dev, "GPIO is not ready");
>> +		return -EBUSY;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/* We can't enable the clock, but the Common Clock Framework calls only
>> + * enable() not is_enabled()
>> + */
>> +static int gpio_locked_clk_enable(struct clk_hw *hw)
>> +{
>> +	return gpio_locked_clk_is_enabled(hw);
>> +}
>> +
>> +/* We have to implement it, but we are not going to control
>> + * parent clock selection
>> + */
>> +static u8 gpio_locked_clk_get_parent(struct clk_hw *hw)
>> +{
>> +	return 0;
>> +}
>> +
>> +static const struct clk_ops gpio_locked_clk_ops = {
>> +	.enable =	gpio_locked_clk_enable,
>> +	.is_enabled =	gpio_locked_clk_is_enabled,
>> +	.get_parent =	gpio_locked_clk_get_parent,
>> +};
>> +
>> +static int gpio_locked_clk_parse_outputs(struct gpio_locked_clk_priv *priv)
>> +{
>> +	struct device *dev = priv->dev;
>> +	struct device_node *np = dev->of_node;
>> +	int ret;
>> +
>> +	of_property_read_string_index(np, "clock-output-names", 0,
>> +		&priv->output_clock_name);
>> +
>> +	if (!priv->output_clock_name)
>> +		priv->output_clock_name = dev_name(priv->dev);
>> +
>> +	priv->output_hw_clk.init =
>> +		CLK_HW_INIT_FW_NAME(priv->output_clock_name,
>> +				    __clk_get_name(priv->input_clk),
>> +				    &gpio_locked_clk_ops, 0);
>> +
>> +	ret = devm_clk_hw_register(dev, &priv->output_hw_clk);
>> +	if (ret) {
>> +		dev_err(dev, "failed to register output clk'%s': %d\n",
>> +			priv->output_clock_name, ret);
>> +		return ret;
>> +	}
>> +
>> +	dev_info(priv->dev, "Output clock '%s' registered\n", priv->output_clock_name);
>> +
>> +	return 0;
>> +}
>> +
>> +static int gpio_locked_clk_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct gpio_locked_clk_priv *priv;
>> +	int ret;
>> +
>> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	priv->dev = dev;
>> +	platform_set_drvdata(pdev, priv);
>> +
>> +	priv->input_clk = devm_clk_get_enabled(priv->dev, NULL);
>> +	if (IS_ERR(priv->input_clk))
>> +		return dev_err_probe(priv->dev, PTR_ERR(priv->input_clk),
>> +				"Failed to get locked fixed clock, not yet ready\n");
> 
> In your use case it might be fixed, but nothing says it is in general
> 
Good point, thanks.
