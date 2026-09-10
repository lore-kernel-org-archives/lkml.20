Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889344718D0
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789076331; cv=none; b=NRnTBjK04Q2DZUiK9R+QfVt1b+vcXvFRbK+VOxpAwnUyi0ER7Er2IJzMBVeHvJLG5e2t9YgToJlsH/IqnzSam/z0FrsV57xh8OGkkzlsrylhrHTm35kw/PCHa4jO8b4kvXUfdwybqAvBmosU+gRK74KkXqJ/Yk/fq9DYqrtj1Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789076331; c=relaxed/simple;
	bh=TwF73I4ajjLYWDOyxKhP4935d9YqmNdNbY7Jf4XSCb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cQZDGZ8V5vyc+25SACfLUm/sJIGPB/OPql+vLskK9j/3L9lvOLLQoIUFC+44aJ64cFTS7M2YJjwQZFVnk1jK9Om0gmqGiVIc3TGxIZF+Oz1BDRHTOfKkidtCxEXjQD+/1RKfg1bm4C9sPukyTl8EK6He3LGUBsDr1SzEPXLccLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=i5NOCd1k; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="i5NOCd1k"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4a4cb36ae00so261253b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789076328; x=1789681128; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TdEmSJjF4d66nV7pT4E9U+BV4p4vFJmFBRk0ViaHxC0=;
        b=i5NOCd1kwtZAR70O/ZCm6dl1q4/scC/5Uta763/1v/+HtAPF6asAuoaFSUzlrvrQ1D
         lsrGMLFvd9Qt/WljoeloD5FKKUuHGrTCJTciQ8kKJSchGYc03WXZmV+3zrR1HTySpFz/
         zu7ZuCzzAdFLaEsy0UlELVmH3zpoLYADLCUuoalPNLqJpYE8rmo7vGqljBoCqRXekL07
         iJfb4GqQFD3AoAD2AQjnTisitFuKw1EBWZq+XhzGzdRfapCh6P8uW5YE/om8MLSdLmlM
         PmnSvTdt4bh83fTAvkejZFrfhPjSh4HfT9qpOfnUhTUasNacwK3INtBuTJflk+ycEeJu
         6h9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789076328; x=1789681128;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TdEmSJjF4d66nV7pT4E9U+BV4p4vFJmFBRk0ViaHxC0=;
        b=aiSmPSmVlqokl3Uam5zjzIzEfNZFVkSgPBrBMSHXAzp4pWnhLPtSpaW2MingKqwQTG
         l2VkAVRsU7UGF5hYF+FFhnZtZ0J+Zl5G2wNUoM/STCiEANHD/eR9CGVuWBKgWWvtBkPW
         o+ZeoTHoPOMtQ3weZbHnyw++2driEfXV3xASctDawFdKPUayuHX0odX1LI2X5zL16RqV
         iS1Q0D8lv3pjm/Xx+k54EGG8+Zn3aZYjh0mQ81CO2Ahd7rwASGWZTrOot5gNIR8WSZLh
         773ACaUEfd+6dKOrAGsML/AAy74SqUKE/Q00XdXS06EKDRsr3CFMQA7aoKfMmsIaJJzN
         QY8g==
X-Forwarded-Encrypted: i=1; AKwUvBwRr+8XDhLJnWTBxmDRk5Z1HjBy2sVzoqDzxC8BFsNFeWjJnTxcf5DdcPhMSU74KRiOWmrdD8nOllBwDuY=@vger.kernel.org
X-Gm-Message-State: AFuF++n9kw8ZVMQQ/sn7tnInMbxLuWaDZal6xVTUQJ+wwbJZOFQfp8MR
	gKViC+0YZMj4B934ib1sdpcAo4avYWNRdwhsmYrFdIcDg0j5v2/4ajiejrSpY7HWG0Q=
X-Gm-Gg: AYBFou1ilBpWDlNbkB/KAbZZKzZIbkvCvHG5mVQnpLkbhU06sce6k/V493mpymtnTy1
	PdDdx/0DvDdK1IL/0ABTXJQ6J6cQNVOkmJV9sLrNh1Q8UX4yDb6ZCJX5XmaHUz435JjPsBNH58b
	DTIVuzMsjzhg6+J9L3rAYtHgWj/Zpt3L5aHyfM99ecB1t0dZKZxBGXye+UjfBzbZBTYyJrFQHPE
	thdN7OE4bTfYY8ShDaLLQUpewWuORUEwG1WwSbPA6jlnLX39yaIN65TRloiPlCNDaoTLQIQkFbH
	dSOffZZjIXV5V1WEVN60I/moXCUdFxh9h6zBHGhYZMftc3NMKlQcC7G4t8sYqgfSCppiUgX1leF
	5l+EinpShgvIU13HCEgj8KQZUr0rxNCMJFABMVw+pFhax5RYNNhWuVjSwOk7xLcYaayo39WISkj
	hb8lpA40ruOJtZeyINAJJpRVCiqQo0yjD6U4+Y9vDTwRaN3vSO6I+nWUUVFAtAfjJJTOFOcrdWf
	lI92yNOznnwOhR/hcq0+G+M8eFpHSe8ZPyO9fJUehzHilOJHho=
X-Received: by 2002:a05:6820:997:b0:6be:47ed:f3f8 with SMTP id 006d021491bc7-6c0b5ff5c8cmr733298eaf.0.1789076328077;
        Thu, 10 Sep 2026 14:38:48 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:fbf1:d0da:69e0:11a0? ([2600:8803:e7e4:500:fbf1:d0da:69e0:11a0])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c095e17791sm1189487eaf.2.2026.09.10.14.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 14:38:47 -0700 (PDT)
Message-ID: <0505ad77-8ae8-44bb-88b8-210f5cba023f@baylibre.com>
Date: Thu, 10 Sep 2026 16:38:46 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] iio: adc: add the ti-ads1262 driver
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260828-ads126x-v4-0-1dc27e9c0260@gmail.com>
 <20260828-ads126x-v4-3-1dc27e9c0260@gmail.com>
 <bc00d888-9944-4a22-88e3-8f4d7384d037@baylibre.com>
 <DL8IE3OUIUZ4.2SND39L7P03VL@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <DL8IE3OUIUZ4.2SND39L7P03VL@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/6/26 3:17 PM, Kurt Borja wrote:
> On Mon Aug 31, 2026 at 5:22 PM -03, David Lechner wrote:
>> On 8/28/26 1:38 AM, Kurt Borja wrote:
>>> Add the ti-ads1262 driver with initial support for the primary ADC
>>> (ADC1). The ADS1263 auxiliary ADC (ADC2) is handled by a separate driver
>>> and interoperability considerations were taken into account.
>>>
>>
>> ...
>>
>>> +#define ADS1262_FW_CHANNEL_COUNT		16
>>> +#define ADS1262_MON_CHANNEL_COUNT		4
>>> +#define ADS1262_REGMAP_WRITE_SZ			8
>>> +#define ADS1262_MONITOR_ADDR_OFFSET		100
>>
>> Where does this offset come from? I would make the address the value that
>> gets written to MUXP/MUXN. But it looks like we are using the same value
>> for the .channel, so setting .address to that would be redundant.
> 
> I'm using .address to map the firmware 'reg' to channels in
> fwnode_xlate. That's why I would need to move the monitors forward. More
> on this discussion below.
> 
>>
>>> +
>>> +#define ADS1262_ADC1_RESOLUTION			32
>>> +
>>> +struct ads1262 {
>>> +	struct spi_device *spi;
>>> +	struct regmap *regmap;
>>> +	struct gpio_desc *start_gpiod;
>>> +	/* protects concurrent SPI transfers */
>>> +	struct mutex xfer_lock;
>>> +	/* protects channel state */
>>> +	struct mutex chan_lock;
>>> +	struct completion drdy;
>>> +	unsigned long clk_rate;
>>> +	u8 dev_id;
>>> +};
>>> +
>>> +static const char * const ads1262_device_id_to_name[] = {
>>> +	[ADS1262_DEV_ID] = "ads1262",
>>> +	[ADS1263_DEV_ID] = "ads1263",
>>> +};
>>> +
>>> +static const struct iio_chan_spec ads1262_monitor_chan_specs[] = {
>>> +	{
>>> +		.type = IIO_TEMP,
>>> +		.channel = ADS1262_INPMUX_TEMP,
>>> +		.channel2 = ADS1262_INPMUX_TEMP,
>>
>> Since these are the same, I would just not set .channel2 and later say
>> MUXN = spec->differential ? spec->channel2 : spec->channel. Same applies
>> to others below.
>>
>>> +		.address = ADS1262_MONITOR_ADDR_OFFSET + 0,
>>> +		.scan_type = {
>>> +			.format = IIO_SCAN_FORMAT_SIGNED_INT,
>>> +			.realbits = ADS1262_ADC1_RESOLUTION,
>>> +			.storagebits = 32,
>>> +			.endianness = IIO_BE,
>>> +		},
>>> +		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
>>
>> Where is SCALE and OFFSET?
> 
> Missing.
> 
> I'm pretty sure I tested this channel though so maybe there's something
> wrong in my tests.

I think it was just added in a later patch.

> 
>>
>>> +	},
>>> +	{
>>> +		.type = IIO_VOLTAGE,
>>> +		.channel = ADS1262_INPMUX_AVDD,
>>> +		.channel2 = ADS1262_INPMUX_AVDD,
>>> +		.indexed = 1,
>>> +		.address = ADS1262_MONITOR_ADDR_OFFSET + 1,
>>> +		.scan_type = {
>>> +			.format = IIO_SCAN_FORMAT_SIGNED_INT,
>>> +			.realbits = ADS1262_ADC1_RESOLUTION,
>>> +			.storagebits = 32,
>>> +			.endianness = IIO_BE,
>>> +		},
>>> +		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
>>> +	},
>>> +	{
>>> +		.type = IIO_VOLTAGE,
>>> +		.channel = ADS1262_INPMUX_DVDD,
>>> +		.channel2 = ADS1262_INPMUX_DVDD,
>>> +		.indexed = 1,
>>> +		.address = ADS1262_MONITOR_ADDR_OFFSET + 2,
>>> +		.scan_type = {
>>> +			.format = IIO_SCAN_FORMAT_SIGNED_INT,
>>> +			.realbits = ADS1262_ADC1_RESOLUTION,
>>> +			.storagebits = 32,
>>> +			.endianness = IIO_BE,
>>> +		},
>>> +		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
>>> +	},
>>> +	{
>>> +		.type = IIO_VOLTAGE,
>>> +		.channel = ADS1262_INPMUX_TDAC,
>>> +		.channel2 = ADS1262_INPMUX_TDAC,
>>
>> Hmm... a differential where channel == channel2 usually means a shorted
>> input. TDACP and TDACN can be controlled indepedantly, so really are two
>> separate channels.
> 
> They can be controlled independently but the user would have to define a
> common mode channel for that. I went with this because its only a test
> channel and we making these channels static. Otherwise we would have to
> allow the TDAC channel in devicetree. Would that be preferable?
> 
Sounds like Jonathan is OK with it, so OK with me too to leave it as-is.

