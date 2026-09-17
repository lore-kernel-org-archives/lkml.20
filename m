Received: from mail-oi2-f10.google.com (mail-oi2-f10.google.com [74.125.231.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B85A48FF82
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678916; cv=none; b=i3Elqfc5JxIL+oTUfktqaXjOwaifTItitbJx7uR66SStxVmBz1SEmNZNo2ijwFQGygUUcvPh+EhbDJBXR7INiG88Y+03Sbcc75S+o1VUZBPe4F3QK9LaAHqJDGBcFGVXoddR9d5rCivmj2Zk2LxXLo9HCDIWrsciY+IYujtOjWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678916; c=relaxed/simple;
	bh=yg38mfNFmr0dglL3mVDQ2WSoZ5XndknsQxtQMXpd0cA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rkGkuL+cY2vAtKVFMXS0WIkTO9gK/WgGptxMqBYvoR73zz8u4tXHA+lWPyP+yIQEp8o1Ea7dayTRfQNbtBbx4jNnu6vpV0E9HVaese7c9vPQgJxUKDFWqc7D09/AGB/a4uv+VevcDIA8rr+OiopyBR/FM29fa+yvB5gTsMZQMYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3tj0i0P; arc=none smtp.client-ip=74.125.231.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3tj0i0P"
Received: by mail-oi2-f10.google.com with SMTP id 5614622812f47-4c43b4aad44so22974b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789678910; x=1790283710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+79viYgxDsziJXy6Z3ZyZxA3uUZqLw1sHaBsWajt9II=;
        b=F3tj0i0PptvQbFB/xhJ38oWr4pSo709ZEAeMa5jNJxVhO/va9+sgoFNXe84wHWmhik
         XEdGwzGiCnR05A7I/WSoH9yl64s6u8fJmHkDHyakD13MGbusn6EMw3utKADS4OWEVRsC
         BNAwDXomAuapA8KXDs/yLdA0TyNbqXGSBpAV6uv/55HFmzmOAfSQ5CSTvFrfdWlDOTrz
         hmfzUlZghw4E8wjQLlXjq4R3EMuyNA2XKj6KDuJSJqzd8wNfMlW3UKeLBnKWjTI0LWsV
         +b72+YkNi8mb4eQvHJBy0QWJv2SngLqcx2/KC4UhZCBM+dg3o0vEesusPd3saGvWuVdc
         Mh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678910; x=1790283710;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+79viYgxDsziJXy6Z3ZyZxA3uUZqLw1sHaBsWajt9II=;
        b=eIhHTVWedJ/y1a6ua/cbpLUEKsI3tG00pyO6oahdSQk2NnT9puNz07WBwyCDONKfZ3
         8kN/EKZ4r6cHJgmsp+HKkJcmzZ6qsXJjyCWgPdKICyNm7s2R+Kej/iBZk8ZeJLu3Q2TF
         zfPy9RqoazhYMyxu/5Wr8eLv0mBLhKiBs3HFyfriONqO/S16ThnmuhouFmuuOXeFpfoH
         3eDgi0LzI1p7APWRofQpH+GkaLTy626OiZQWtwRdmhd8RV8CbRiN5uH4RqqgWeB139hq
         jccNd5nyPXmz4shh5tzW9j8mOLRYmoOYwsCR0XATL/MJaC71zQEo8NbHjg7y77+LC/Qn
         X+7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxB3QQRGmtQ0FOD7w/+bS4vFLuEZqlu3mtGhlcqzuyXKwZOCN+b6iTEf5tfJz3TMtdeWhBtFrmfTRBou18=@vger.kernel.org
X-Gm-Message-State: AFuF++mo/NFXGu5H+5BcAYKkjGiAOpXJ8fAOVxucFjStR2FGDfxcuNbd
	oNpU57RgYevD+co/oq79gEO7L8hGFhJ6YOq8Nbq3+dOD+zUF7KjSc0fv
X-Gm-Gg: AYBFou05aacdDHZs8e6OJCXTKuD5bh0lf+yXf5Gd4+HlZw2G26+pnKxmPH6CTMmDvVs
	cpWnmCIoowSwhqTbBjmEZk3/+L8ZOtj/2IWZUrH4G/pqlls78SfJ1TzTb/z1tXx4Akea3hqfomY
	2K4XzQMU4wrPRnDkpZLWBuNmMbCn/3vKz89McDo53CFkObtgkT0CaFVYPOo0YYEzSCGT0HK+saQ
	EQtvxBTTZTktXcUb95AL34amWnTD6R9Amg5Jg/DYGuzVmM+BPIzpu9EFltlxoJkNoF8RvsByWFU
	NjCZ3FNbsA307H0ZSfQwUTqjSwSqJ6wAEU8PxYYqh0ic7UaH14s8eDrwm7h7vvQhimhfUxfZT+p
	OoCLrgLhZ6Qc7v3hMJq5lCXVde7NyKyVCnMFz3fUgmj+QpGK/B8vpHSZW/8BDSJlk7rNgv22Ifj
	aVxkCV71DhTj0aj2QoZLfzY/8V0FCD/UDWfdJwxzEkPQWPfGyYxP75HQtRqrbPDevgPXbMJv/wS
	/1F+LC6lzb8X0bTj4c7JpKHoV4=
X-Received: by 2002:a4a:ee12:0:b0:6ca:36f9:1799 with SMTP id 006d021491bc7-6ca90ca09fcmr332728eaf.8.1789678910429;
        Thu, 17 Sep 2026 14:01:50 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::b712? ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c8f6a5ac0esm4069086eaf.9.2026.09.17.14.01.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 14:01:49 -0700 (PDT)
Message-ID: <71a6ed12-f089-404a-85ec-546e03b4db3e@gmail.com>
Date: Thu, 17 Sep 2026 16:01:48 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] iio: adc: mt6397-auxadc: add mt6397 PMIC AUXADC
 driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 mfd@lists.linux.dev, Roman Vivchar <rva333@protonmail.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
References: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
 <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-2-d35d2ac3d6f0@gmail.com>
 <aqpnpT6hU5Z0s1TZ@ashevche-desk.local>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <aqpnpT6hU5Z0s1TZ@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/16/26 4:55 AM, Andy Shevchenko wrote:
> On Tue, Sep 15, 2026 at 11:15:27PM -0500, Ryan Brue wrote:
>> The mt6397 AUXADC is a 10-bit ADC behind the SoC's PMIC wrapper. On boards
>> built around this PMIC it is the only way to read the battery: the SoC's
>> AUXADC is wired to board thermistors and the charger ICs these boards use
>> have no ADC of their own.
>>
>> Add a driver exposing the battery voltage and battery temperature
>> channels. Only those two are described, so a channel ID in the device tree
>> is an index into the driver's channel array rather than the PMIC's channel
>> number, as mt6323-auxadc does. The ready bit lives in a channel's raw
>> result register, but the value comes from the chip's trimmed copy of it,
>> which is what the vendor driver reads for a measurement.
>>
>> Both channels need more than that, as the vendor programs them. The
>> battery voltage is measured through ISENSE, because a board with a
>> switching charger in the power path leaves BATSNS on the charger's system
>> rail instead of on the pack. The thermistor only reads correctly with the
>> PMIC's battery-detect bias and input buffer enabled, which take 20 ms to
>> settle. Both are switched back off afterwards.
>>
>> Reads average sixteen conversions in software; the chip's sample
>> accumulator makes no measurable difference at any setting, so it is left
>> at one sample per conversion.
> ...
>
>> +/*
>> + * MediaTek MT6397 PMIC AUXADC IIO driver
>> + *
>> + * Copyright (c) 2026 Ryan Brue <ryanbrue.dev@gmail.com>
>> + *
>> + * Based on drivers/iio/adc/mt6323-auxadc.c
> Why not add this device support into that driver?
Please see [1].
>> + */
> ...
>
>> +#define MT6397_AUXADC_ISENSE_SETTLE_US	USEC_PER_MSEC
> (1 * USEC_PER_MSEC)
Ack, fixed in v2
> ...
>
>> +static const struct iio_chan_spec mt6397_auxadc_channels[] = {
>> +	MTK_PMIC_IIO_CHAN(isense,   MT6397_AUXADC_ISENSE,
> One space too many.
Ack, fixed in v2
>> +			  MT6397_AUXADC_HWCHAN_BATSNS),
>> +	MTK_PMIC_IIO_CHAN(bat_temp, MT6397_AUXADC_BAT_TEMP,
>> +			  MT6397_AUXADC_HWCHAN_BAT_TEMP),
>> +};
> ...
>
>> +static int mt6397_auxadc_battemp_bias(struct mt6397_auxadc *adc, bool on)
>> +{
>> +	struct regmap *map = adc->regmap;
>> +	int ret;
>> +
>> +	if (on) {
>> +		ret = regmap_set_bits(map, MT6397_AUXADC_CON0,
>> +				      MT6397_AUXADC_CON0_BUF_PWD_ON);
>> +		if (ret)
>> +			return ret;
>> +		ret = regmap_set_bits(map, MT6397_AUXADC_CON0,
>> +				      MT6397_AUXADC_CON0_BUF_PWD_B);
>> +		if (ret)
>> +			return ret;
>> +		return regmap_set_bits(map, MT6397_CHR_CON7,
>> +				       MT6397_CHR_CON7_BATON_TDET_EN);
>> +	}
>> +
>> +	ret = regmap_clear_bits(map, MT6397_CHR_CON7,
>> +				MT6397_CHR_CON7_BATON_TDET_EN);
>> +	ret = ret ?: regmap_clear_bits(map, MT6397_AUXADC_CON0,
>> +				       MT6397_AUXADC_CON0_BUF_PWD_B);
>> +	return ret ?: regmap_clear_bits(map, MT6397_AUXADC_CON0,
>> +					MT6397_AUXADC_CON0_BUF_PWD_ON);
> Huh?! Please, use standard pattern with 'if (ret) return ret;'.
> Ditto for other weird cases like this.
Fixed in v2, and also modified to allow the regmap clears and sets to 
fall through, so one failure doesn't leave some of those bits in the 
wrong state.
>> +}
> ...
>
>> +{
>> +	unsigned int i, sum = 0;
>> +	int ret, sample;
> It's preferred not to mix ret with other semantically different variables.
Ack, thanks! Fixed in v2
>> +	/* Held across the whole burst: the channel select is shared state. */
>> +	guard(mutex)(&adc->lock);
>> +
>> +	if (chan->channel == MT6397_AUXADC_ISENSE) {
>> +		ret = mt6397_auxadc_isense_enable(adc);
>> +		if (ret)
>> +			return ret;
>> +		fsleep(MT6397_AUXADC_ISENSE_SETTLE_US);
>> +	} else {
>> +		ret = mt6397_auxadc_battemp_bias(adc, true);
>> +		if (ret)
>> +			return ret;
>> +		fsleep(MT6397_AUXADC_BATTEMP_SETTLE_US);
>> +	}
>> +	for (i = 0; i < MT6397_AUXADC_SAMPLES; i++) {
> 	for (unsigned int i = 0; i < MT6397_AUXADC_SAMPLES; i++) {
>
>
>> +		ret = mt6397_auxadc_read_once(adc, chan, &sample);
>> +		if (ret)
>> +			break;
>> +
>> +		sum += sample;
>> +	}
>> +
>> +	/* Lower START so the converter is not left armed between reads. */
>> +	regmap_clear_bits(adc->regmap, MT6397_AUXADC_CON1,
>> +			  MT6397_AUXADC_CON1_START);
>> +
>> +	if (chan->channel == MT6397_AUXADC_ISENSE)
>> +		mt6397_auxadc_isense_disable(adc);
>> +	else
>> +		mt6397_auxadc_battemp_bias(adc, false);
>> +
>> +	if (ret)
>> +		return ret;
>> +
>> +	*val = DIV_ROUND_CLOSEST(sum, MT6397_AUXADC_SAMPLES);
>> +
>> +	return 0;
>> +}
> ...
>
> Otherwise nice and small driver.
Thanks for the review, Andy!

Best regards,
Ryan
