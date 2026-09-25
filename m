Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2E03CFF77
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326004; cv=none; b=ssOkoeDsVy9U0xoruSst04IQoj9XgzSGB/W0IoEa3LGRBz5xScPapY5y6geZ473awayupEStfrKOSNuLI6JB1/gnU/+Ru3cIq4mIGuTwDvdI56P2TuiZdkEUJtVKtcvQ6TEm1Hxmp2WdLuPXeWIMwXH+18A4woUMXjqN75w0ulc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326004; c=relaxed/simple;
	bh=fsHAtjy8ZJ3iBBgzdKw/N55I4rdruDDrj4ZO0IR0gcM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VqI9rPjsoIQtQcpiJlbhNTq9IYTYy0ciL7o05ltqCNqj8XJ3R20mat9/xk6G7AVgwX8j3bMHXM1bXEsajHPdUIT53HBEOL3aK2dPtUiubSwsGh+0PEHLz1FvdRdfbkPwwL3F4cSXMf3eatzBujQFM4nu4Ezu+Zr7C/fL9Ydgudw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U3KVwRa1; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U3KVwRa1"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so3845185e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 01:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790325995; x=1790930795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3nhBTvLS7wgRfFCoQqzBky9Qcop4dSXD6DBM5ddgQE=;
        b=U3KVwRa1O0QmxiMsz/Y8NzUOYnuYl4MtDVCZPKpHF1Q617xtmw7qm9SjAwmjEbgkX9
         YNPwG50zHWWKRxFqs75VReqXGGkXz82bsKMtgje6R0o0b0XCmYsAxSb9ZT2VQWj8tuOr
         UkUMb2lLNlcjk7JctN0IvSGNGKcshc6iJtmV1tLhpwCqLxTEgiMmAlGeN0/QNJFbyhdF
         P3l6H9HAa6V5gQTCzRvd/61TtYZf8jhglrWIPSw8OouM0ElS7wRe1x4t8WkwTORxLYra
         zEm24YpXMoRV6VRGqXACdnWCYQ5lrA832pDTyN6z4LHeZCmP88vtNzlFRbXNniK/spEk
         vFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790325995; x=1790930795;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K3nhBTvLS7wgRfFCoQqzBky9Qcop4dSXD6DBM5ddgQE=;
        b=bwFdLfLllHOeftv++pQIyAHOXPRIVoGe5tpxn4k89puWV6r2Cw/DRKH3wwC/XDoOpR
         C4phRvzmINbPe7bXvc7AVtXyqUW3hMFHU+Esmh2ZVSTkciRhev4+qOBCOG/nj3bdubI/
         +qsC1pkcLoW7VIy5BPfUFHudgZsYZ3EE0e3hzesovrD6pKFft7MOlDbS/Ma4arO/Hx/3
         laYKQM5pK1KugiytNE6ovCgjWBMNfqZFu+4nUcWgQRA21PNSalZsjDuslQSUKT65MfPO
         T85H03ShcZvZCHOCoVPMvLu0JNBSDCqqoy7Zo3DzAFnPoVHC8uiZSQ4rXoBeaTPf9oBC
         Eomw==
X-Forwarded-Encrypted: i=1; AKwUvBz+hz6zbCsDR9tf8Keqj/G4xy0NMvP2coEPg2mWdaziwja071dWudupH77Zh+dxFpGmIQ2Htmn7b8mAYdw=@vger.kernel.org
X-Gm-Message-State: AFuF++lWjVdBOnwbaYlcfz91BBk5EoYCsbKqce+PMU/OeMMRtwWM1+Uj
	BDP6W7Dh4Ftn35VXljZlE9Fy+46T/bTWQFFEaAxmjHFmPReYf8mhrmWfOupGvpM6lhD83jrM145
	rb1iqci+VuQ==
X-Gm-Gg: AYBFou1yzzXpvD5hgUNj0OVWI3fzJcde5GWBw6MiNY3BMSyobA5EBTfLDbFYFC1KQPc
	JxpgC6jRaK4vl1X2+R4Ku+XKTG5Fw4HlRd649P7T2Rxe4P/zfKY7y2KBiOSEx5uB1UtUBQQWgJj
	RRIN8ZN4Z28qa4iYR/ER+QjdU2l8bMovtCdSl9DxKX3eVIjXAxioA3yDZ8f+l+gm3OkL2Pz+BtH
	fsBQ5AA11a16Sz0/jPQbdzZxGR0Vn+dERCipJI032tqlZQn28rUI2Md5mtTyBglTf22x46u8MUq
	5L7ZLw0/+Yeq+1iiHxaAg1mN64C4DZm4lVlwILlm9uxFh/hQH7yvGwBcjmBthe2KsHIJ9lwB7kZ
	c0e+I3MhPQJXF9Z1C7UUQfcrUPyVIVjvG3o4uwu8nfl6USKLix6PWi0YLsxvA7ufYAmIIql8fL0
	elG1FBspo+3dOcUEhewR+emyruZJfddmhUpZx9t6nbVjxkgTOf9k56sDgD/dh+9fJn0HUzLdOKr
	y/ts2Jv7Pp2ix+mp/NDkXe0XSWBrL/kq4DfsbnSP3MaupKUz7+FYw==
X-Received: by 2002:a05:600c:4ec6:b0:49d:e0c:e55e with SMTP id 5b1f17b1804b1-49fe66f9ddcmr85359565e9.23.1790325994673;
        Fri, 25 Sep 2026 01:46:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:3151:fc9b:d41c:770b? ([2a01:e0a:106d:1080:3151:fc9b:d41c:770b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef5fc189sm36506075e9.3.2026.09.25.01.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 01:46:34 -0700 (PDT)
Message-ID: <7abb65ec-e212-4af9-aedc-0a62ed44d1c1@linaro.org>
Date: Fri, 25 Sep 2026 10:46:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] iio: adc: add driver for the MAX34417 Four-Channel
 High Dynamic Range Power Accumulator
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260924-topic-sm8x50-iio-max34417-adc-v2-0-9a0609e72f5c@linaro.org>
 <20260924-topic-sm8x50-iio-max34417-adc-v2-2-9a0609e72f5c@linaro.org>
 <20260925042653.15608e9b@jic23-hlaptop>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260925042653.15608e9b@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 9/25/26 05:26, Jonathan Cameron wrote:
> On Thu, 24 Sep 2026 15:14:16 +0200
> Neil Armstrong <neil.armstrong@linaro.org> wrote:
> 
>> The MAX34417 is a specialized current and voltage monitor used to
>> determine power consumption of portable systems. The driver support
>> getting the channels voltage and accumulated average power over an
>> I2C/SMBUS serial interface.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> A few comments inline.  For a new driver I'd wait a week before sending an
> update. Whilst you've gotten quite a few reviews already it is good to make
> sure any discussion has died down before moving on to the next version.
> 
> 
> Thanks,
> 
> Jonathan
> 
>> diff --git a/drivers/iio/adc/max34417.c b/drivers/iio/adc/max34417.c
>> new file mode 100644
>> index 000000000000..98d961c5ecee
>> --- /dev/null
>> +++ b/drivers/iio/adc/max34417.c
>> @@ -0,0 +1,374 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * IIO driver for Maxim MAX34417 ADC, 4-Channels High Dynamic Range Power Accumulator
>> + *
>> + * Datasheet: https://www.analog.com/en/products/max34417.html
>> + *
>> + * TODO: Slow Mode, Continuous Accumulate Mode, Park Feature, Bulk Update, Perr_Verr Correction
>> + */
> 
>> +#define MAX34417_CHANNEL(_index, _v_address, _power_address)	\
>> +	{							\
>> +		.type = IIO_VOLTAGE,				\
>> +		.info_mask_separate	= BIT(IIO_CHAN_INFO_RAW) | \
>> +					  BIT(IIO_CHAN_INFO_SCALE), \
>> +		.channel = (_index),				\
>> +		.address = (_v_address),			\
>> +		.indexed = 1,					\
>> +	},							\
>> +	{							\
>> +		.type = IIO_POWER,				\
> 
> As below. This smells like it might not be an actual power channel if it
> is accumulated on a fixed frequency.  It'll be some sort of scaled IIO_ENERGY
> channel.  If you want to present it as power (which may make sense) then
> it may need a little maths.

So as I understand the ENERGY would need to provide Joules. Which would
be doable if we take in account the accumulator sample rate (1024sps) from the
datasheet.

But this implementation tries to provide an initial support following
the MAX34417 datasheet which provides calculation for Average Power (page 18),
this is why I sticked to POWER and IIO_CHAN_INFO_AVERAGE_RAW.

But you're right, knowing the sample rate we could indeed calculate the energy.

I can try to do the math, but with manual updates it may no be very accurate so
the Continuous Accumulate Mode should be implemented to provide
accurate Energy measurements over time and would be enabled via an
IIO_CHAN_INFO_ENABLE.
> 
>> +		.info_mask_separate	= BIT(IIO_CHAN_INFO_AVERAGE_RAW) | \
>> +					  BIT(IIO_CHAN_INFO_SCALE), \
>> +		.channel = (_index),				\
>> +		.address = (_power_address),			\
>> +		.indexed = 1,					\
>> +	}
>> +
>> +static const struct iio_chan_spec max34417_channels[] = {
>> +	MAX34417_CHANNEL(0, MAX34417_V_CH1_REG, MAX34417_PWR_ACC_1_REG),
>> +	MAX34417_CHANNEL(1, MAX34417_V_CH2_REG, MAX34417_PWR_ACC_2_REG),
>> +	MAX34417_CHANNEL(2, MAX34417_V_CH3_REG, MAX34417_PWR_ACC_3_REG),
>> +	MAX34417_CHANNEL(3, MAX34417_V_CH4_REG, MAX34417_PWR_ACC_4_REG),
>> +};
>> +
>> +/* TODO Implement trigger to update accumulator once and get all channels at once */
>> +
>> +static int max34417_accumulator_update(struct max34417_data *max34417)
>> +{
>> +	int rc;
>> +
>> +	rc = regmap_write(max34417->regmap, MAX34417_UPDATE_REG, 1);
>> +	if (rc) {
>> +		dev_err(max34417->dev, "Error (%d) writing update register\n", rc);
>> +		return rc;
>> +	}
>> +
>> +	/* Wait for accumulator update */
>> +	fsleep(1000);
>> +
>> +	return 0;
>> +}
>> +
>> +static int max34417_read_voltage(struct max34417_data *max34417,
>> +				 const struct iio_chan_spec *chan, int *val)
>> +{
>> +	uint16_t voltage;
>> +	uint8_t buf[3];
>> +	int rc;
>> +
>> +	guard(mutex)(&max34417->lock);
>> +
>> +	rc = max34417_accumulator_update(max34417);
>> +	if (rc)
>> +		return rc;
>> +
>> +	rc = regmap_noinc_read(max34417->regmap, chan->address, &buf, 3);
>> +	if (rc)
>> +		return rc;
>> +
>> +	voltage = buf[2] | ((uint64_t)buf[1] << 8);
> 
> get_unaligned_be16();
> 
>> +	voltage >>= 2;
>> +
>> +	*val = voltage;
>> +
>> +	return IIO_VAL_INT;
>> +}
>> +
>> +static int max34417_read_power(struct max34417_data *max34417,
>> +			       const struct iio_chan_spec *chan,
>> +			       int *val, int *val2)
>> +{
>> +	uint32_t acc_count;
>> +	uint64_t power;
>> +	uint8_t buf[8];
> Kernel types so u32, u64, u8
> 
>> +	int rc;
>> +
>> +	guard(mutex)(&max34417->lock);
>> +
>> +	rc = max34417_accumulator_update(max34417);
>> +	if (rc)
>> +		return rc;
>> +
>> +	rc = regmap_noinc_read(max34417->regmap, MAX34417_ACC_COUNT_REG,
>> +			       &buf, 4);
>> +	if (rc)
>> +		return rc;
>> +
>> +	acc_count = buf[3] | ((uint64_t)buf[2] << 8) | ((uint64_t)buf[1] << 16);
> 
> get_unaligned_be24(buf);
> 
>> +	if (!acc_count)
>> +		return -EIO;
>> +
>> +	rc = regmap_noinc_read(max34417->regmap, chan->address, &buf, 8);
>> +	if (rc)
>> +		return rc;
>> +
>> +	power = buf[7];
>> +	power |= ((uint64_t)buf[6] << 8UL);
>> +	power |= ((uint64_t)buf[5] << 16UL);
>> +	power |= ((uint64_t)buf[4] << 24UL);
>> +	power |= ((uint64_t)buf[3] << 32UL);
>> +	power |= ((uint64_t)buf[2] << 40UL);
>> +	power |= ((uint64_t)buf[1] << 48UL);
> 
> Hmm. i think this is the second 56 bit endian reader we've had
> recently.  Time to add get_unaligned_be56()

Indeed

> 
>> +
>> +	power = div_u64(power, acc_count);
>> +
>> +	*val = FIELD_GET(GENMASK_ULL(31, 0), power);
>> +	*val2 = FIELD_GET(GENMASK_ULL(55, 32), power);
>> +
>> +	return IIO_VAL_INT_64;
>> +}
>> +
>> +static int max34417_read_raw(struct iio_dev *indio_dev,
>> +			     struct iio_chan_spec const *chan,
>> +			     int *val, int *val2, long mask)
>> +{
>> +	struct max34417_data *max34417 = iio_priv(indio_dev);
>> +
>> +	switch (mask) {
>> +	case IIO_CHAN_INFO_RAW:
>> +		if (chan->type == IIO_VOLTAGE)
> To reduce indent I'd flip it
> 		if (chan->type != IIO_VOLTAGE)
> 			return -EINVAL;
> 
>> +			return max34417_read_voltage(max34417, chan, val);
>> +
>> +		return -EINVAL;
>> +	case IIO_CHAN_INFO_AVERAGE_RAW:
>> +		if (chan->type == IIO_POWER)
>> +			return max34417_read_power(max34417, chan, val, val2);
>> +
>> +		return -EINVAL;
>> +	case IIO_CHAN_INFO_SCALE:
>> +		if (chan->type == IIO_VOLTAGE) {
>> +			/* Scale to mA */
> 
> On a voltage channel?  That is unlikely to be correct.

Indeed

> 
>> +			*val = MAX34417_VOLTAGE_CORRECTION_SCALE * MILLI;
>> +			*val2 = MAX34417_VOLTAGE_FULL_SCALE_BITS;
>> +
>> +			return IIO_VAL_FRACTIONAL_LOG2;
>> +		} else if (chan->type == IIO_POWER) {
> 
> Actually power or accumulated power (otherwise known as energy!)
> 
>> +			/* Scale to mW */
>> +			*val = max34417->input_correction[chan->channel] * MILLI;
>> +			*val2 = MAX34417_PWR_AVG_FULL_SCALE_BITS;
>> +
>> +			return IIO_VAL_FRACTIONAL_LOG2;
>> +		}
>> +
>> +		return -EINVAL;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +}
> 
> 
>> +
>> +static unsigned int max34417_calc_input_correction(u32 rsense)
>> +{
>> +	/* (100 milliOhm / rsense) * MAX34417_PWR_CORRECTION_SCALE */
>> +	return (100 * MILLI * MAX34417_PWR_CORRECTION_SCALE) / rsense;
>> +}
>> +
>> +static int max34417_probe(struct i2c_client *client)
>> +{
>> +	struct device *dev = &client->dev;
>> +	struct max34417_data *max34417;
>> +	struct iio_dev *indio_dev;
>> +	struct regmap *regmap;
>> +	int rc, i;
>> +
>> +	regmap = devm_regmap_init_i2c(client, &max34417_regmap_config);
>> +	if (IS_ERR(regmap))
>> +		return dev_err_probe(dev, PTR_ERR(regmap), "regmap_init failed\n");
>> +
>> +	indio_dev = devm_iio_device_alloc(dev, sizeof(*max34417));
>> +	if (!indio_dev)
>> +		return -ENOMEM;
>> +
>> +	rc = devm_regulator_get_enable(dev, "vdd");
>> +	if (rc)
>> +		return dev_err_probe(dev, rc, "failed to get vdd regulator\n");
>> +
>> +	rc = devm_regulator_get_enable(dev, "vio");
>> +	if (rc)
>> +		return dev_err_probe(dev, rc, "failed to get vio regulator\n");
>> +
>> +	max34417 = iio_priv(indio_dev);
>> +	max34417->regmap = regmap;
>> +	max34417->dev = dev;
>> +	mutex_init(&max34417->lock);
> For new code
> 	ret = devm_mutex_init(...)
> 	if (ret)
> 		return ret;
> 
> Brings some debug logic in which might be a little bit useful to someone
> and it's cheap to do.
> 
>> +
>> +	/* Set default input correction for all channels */
>> +	for (i = 0; i < MAX34417_CHANNEL_COUNT; ++i)
> 	for (unsigned int i = 0; .... i++)
> 
>> +		max34417->input_correction[i] =
>> +			max34417_calc_input_correction(MAX34417_DEFAULT_RSENSE);
>> +
>> +	device_for_each_child_node_scoped(dev, node) {
>> +		u32 rsense, index;
>> +
>> +		if (fwnode_property_read_u32(node, "reg", &index))
>> +			return dev_err_probe(dev, -EINVAL, "missing reg property of %pfwP\n",
>> +					     node);
> 
> returned, so no need to chase with an else.
> 
>> +		else if (index >= MAX34417_CHANNEL_COUNT)
>> +			return dev_err_probe(dev, -EINVAL, "invalid reg %d of %pfwP\n",
>> +					     index, node);
>> +
>> +		fwnode_property_read_string(node, "label", &max34417->input_label[index]);
>> +
>> +		rc = fwnode_property_read_u32(node, "shunt-resistor-micro-ohms", &rsense);
> For optional properties, we generally now check for them first then if the property is
> there can make errors reasons to fail

Will switch to that

> 
> 		if (fwnode_property_present()) {
> 			rc = fwnode_property_read_u32();
> 			if (rc)
> 				return dev_err_probe();
> 
> etc
> 
>> +		if (!rc) {
>> +			if (!rsense || rsense < 1000 || rsense > 100000)
>> +				return dev_err_probe(dev, -EINVAL,
>> +						     "invalid shunt value %d of %pfwP\n",
>> +						     rsense, node);
>> +
>> +			max34417->input_correction[index] =
>> +				max34417_calc_input_correction(rsense);
>> +		}
>> +	}
>> +
>> +	indio_dev->channels = max34417_channels;
>> +	indio_dev->num_channels = ARRAY_SIZE(max34417_channels);
>> +	indio_dev->name = "max34417";
>> +	indio_dev->info = &max34417_info;
>> +	indio_dev->modes = INDIO_DIRECT_MODE;
>> +
>> +	/* Set as default Manual Mode & Wide ADC */
>> +	rc = regmap_write(max34417->regmap, MAX34417_CONTROL_REG, MAX34417_DEFAULT_CMM_WIDE);
>> +	if (rc)
>> +		return dev_err_probe(max34417->dev, rc, "Error writing control register\n");
>> +
>> +	return devm_iio_device_register(dev, indio_dev);
>> +}
> 

Thanks,
Neil
