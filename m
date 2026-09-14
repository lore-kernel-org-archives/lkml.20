Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B53470139
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789391692; cv=none; b=Fi2ezdn5BiM6u1B7RmVa99dGbcLFPJUpbspD4erkuCbWhNBBR5xAVR38PfjubsBv2yRvIYPdGCSypB6/jzaYwAXn202EO4cw45fli15tKPfEBzaUD1V2diLNLdUdb5UtLZ5qdNAg+hH5d893OVdfGAT0mXjS9hqXC9sIKVyiITk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789391692; c=relaxed/simple;
	bh=JbNhrARpv6JYgXbHTtrDTe6wuqZhnPpG+LDN0UD/1q8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ia5X1dRW9hwzjYPHyooxoynDWyfNZJ4WFp/UfDls9WWuLdUoL7TKQ3DL/An0JeFkeXrIB/wj0bX4wrCKWxqEas6KiTG1r8Cg7a3T9gvHrjtM6nKiSxJIp7H/Pubc/+hOQMxL6V/Vwr9cTRh01Os1KL93ElDdUwgzRwRh4dVEVsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Bm9gTt3l; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Bm9gTt3l"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-484366874b0so1112979f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789391688; x=1789996488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QXqt/TfNNS4iK2D0KIQwOPPSsGXvQRI7uTBOlyeJv7U=;
        b=Bm9gTt3llcq6HzSZnkF8+WXQV8xXPVZ2g0D5BPBkmL/qiv6sPRq6apAExzIHrm0zU5
         XF5jJf8J2pQYlFkhhkGSyw9nlGLupgjLYryWWR/ZB32/AbhLaMVYSC+rBjWU90lVIn+D
         fdUaOlDqzhHvE0jPcNSvBEggEBNyzA8odl6LafeIDm4l//CNbfo8U3/yu18b0AMZhQk3
         Jn+AHMqBF3Bi4ihz3KG3OjPhKljDGSuQXKuMRLziUGzjTpuhtugQRnmxiBFW/6WEuz0R
         BkzekbsTk+Kh1kXEvsDECVUAfaAlejtC6UcuQTcdiTUJBPY/ODPcNlV30enUTk7zOTFW
         yIZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789391688; x=1789996488;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QXqt/TfNNS4iK2D0KIQwOPPSsGXvQRI7uTBOlyeJv7U=;
        b=K+UGqaCUtjMBnmbnLLNKD/oks/2poM8Hcm3FzLVr5EVNYLTG5Q/FcZQSIdYRygjcE6
         E9BNM0zpDfLK68htgLfdhcD0rl9Qba33pE0LRo7/948kKUsAZQJDbhQI9CRU7aknLe0p
         f3Cg3YA4gTWR//LGHjhLX2yyBTHJL2uprcAJFAklxNNPQrG4y9zTo5NuMMztmDXqYLFy
         F/GP4+T84kPrpyMbXhEJqaHLuvIfh/dc5r8tC1eiPAQt58MfNvRpWMxatqHn9aICJwL3
         evmi6FE/HlqV+XIqKDKPEEIdFZa0TUBnkGEf3vSJ17cgrDWMHeR/klBdsgyOt1npBYSu
         oZ9w==
X-Forwarded-Encrypted: i=1; AKwUvBxJkijnR4414hOmNnGZN3hKPHbiW1iXFO8+JbaNCu0q0SUwhl7FhOlNSsEUFtFgTpb2EVupiIVVUN4spH4=@vger.kernel.org
X-Gm-Message-State: AFuF++nB7kVAspJ5C2jWKhc7pfnEYRMmmMzKqDBePCXRZ8TGntAGD0Gv
	fBwjcEJHzBuLW7ER1PmBVdjjZGoY8Ft88BALV7D1YwBxPGcLhm58gR5+voqccp40RCY=
X-Gm-Gg: AYBFou18eHlqmFkMQXQchTdElz44OyQH8/8/gntY9oVenBEQezLJtJ9w/AB4O3itZ19
	3tLGCVu+164d7S6HdAbiB36vrlbEg34s89Zw2FWkg7GtbiGLMwVXVKFTfuTEOGK4EbAz+9BiEET
	y24x56ixAfR0+sQ91b4p4+gvJT/sp4BBncBAeA6xHOWUZKu5C5umZxdPN/3QuTZ/hCK1VRtMDsh
	xOyGaOazIY+wR3Us/zuhEprR67IMsjVDolNxjslJLdIFAY12LbNV7Zh+biwFq9ltzJlBvamLnS7
	N/3F0cpu+YhSoDbavbHN93HUNutgjXezYPl8gOPnzJ4svW6LO15CB6W0E1r8b7z4aq30evYJW+z
	Bd0wajDuEsmPngitG6iLdpyFVko8AiSfx7QupOkA3dlrE//zJ9H6ypBhhetVsyIfdrAl7YbOGp8
	QE4A3wZzX25uryrNuz7TQ8gjDvNVIQZeyLJeD1bC8++IDAa8g9vbJZTK/+xlirKm9WzUe05Lo=
X-Received: by 2002:a05:600c:46ce:b0:49c:dca4:94c with SMTP id 5b1f17b1804b1-49e7a6870d9mr47453825e9.13.1789391687993;
        Mon, 14 Sep 2026 06:14:47 -0700 (PDT)
Received: from [192.168.3.100] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e608sm28719703f8f.23.2026.09.14.06.14.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 06:14:47 -0700 (PDT)
Message-ID: <964d6626-202c-4d0a-aef2-86a383f405ab@baylibre.com>
Date: Mon, 14 Sep 2026 15:14:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] ASoC: meson: add audin main module and I2S formatter
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
 <20260912-audin-v1-2-7fbefe928711@baylibre.com>
 <20260913-inventive-millipede-of-certainty-dd58ce@quoll>
Content-Language: en-US
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <20260913-inventive-millipede-of-certainty-dd58ce@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for your review and feedbacks.


On 9/13/26 11:41 AM, Krzysztof Kozlowski wrote:
> On Sat, Sep 12, 2026 at 12:14:32AM +0200, Valerio Setti wrote:
>> +static int meson_gx_audin_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct resource *res;
>> +	void __iomem *mmio;
>> +	struct regmap *regmap;
>> +	struct clk *clk;
>> +	int ret;
>> +
>> +	ret = device_reset(dev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to reset device\n");
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	if (!res)
>> +		return dev_err_probe(dev, -EINVAL, "Failed to get memory resource\n");
>> +
>> +	/*
>> +	 * Do not use devm_platform_ioremap_resource() here: it would claim the
>> +	 * whole AUDIN window exclusively and the FIFO children would then fail
>> +	 * to request their own sub-ranges.
>> +	 */
> 
> And this should point you that child is not a separate device.
> 
> Please open your datasheet and read what is the address space of this
> device. You claim here ENTIRE address space. If you insist that entire
> address space is not owned by this device, then you misrepresented
> hardware in the DT anyway.

As I mentioned in the cover letter I designed it this way so that I 
could easily re-use the same driver code for all 3 FIFOs just offsetting 
the base address. I knew it was a bit hackish a solution, but IMO that 
was worth it since it was simplifying a bit driver's code. Perhaps it 
was more software-oriented rather than hardware related.
The other possible approach is to fully copy what AIU is doing and 
allocate each FIFO as a DAI. I'll follow that design then, but if you 
have any better idea please let me know.

>> +	mmio = devm_ioremap(dev, res->start, resource_size(res));
>> +	if (!mmio)
>> +		return dev_err_probe(dev, -ENOMEM, "Failed to remap memory\n");
>> +
>> +	regmap = devm_regmap_init_mmio(dev, mmio, &audin_regmap_cfg);
>> +	if (IS_ERR(regmap))
>> +		return dev_err_probe(dev, PTR_ERR(regmap), "Failed to init regmap\n");
>> +
>> +	clk = devm_clk_get_enabled(dev, NULL);
>> +	if (IS_ERR(clk))
>> +		return dev_err_probe(dev, PTR_ERR(clk), "Failed to get clock\n");
>> +
>> +	ret = gx_formatter_create(dev, &audin_dapm_widgets[0], &audin_formatter_i2s_drv, regmap);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to allocate formatter\n");
>> +
>> +	ret = devm_snd_soc_register_component(dev, &audin_component, NULL, 0);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to register component\n");
>> +
>> +	ret = devm_of_platform_populate(dev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to probe child nodes\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static void meson_gx_audin_remove(struct platform_device *pdev)
>> +{
>> +	gx_formatter_free(&audin_dapm_widgets[0]);
>> +}
>> +
>> +static const struct of_device_id meson_gx_audin_of_match[] = {
>> +	{ .compatible = "amlogic,meson-gxbb-audin" },
>> +	{ .compatible = "amlogic,meson-gxl-audin" },
> 
> Why do you have two entries here and no fallbacks? This makes no sense,
> really. I have no more doubts that your "gx" is a real SoC/

OK. Genuine question about naming here: would "amlogic,gx-audin" be 
fine? Because in "meson-gx.dtsi" I see many surrounding nodes have 
"amlogic,meson-gx-" prefix, but that doesn't seem to follow design rules 
from "writing-bindings.rst".


-- 
Valerio

