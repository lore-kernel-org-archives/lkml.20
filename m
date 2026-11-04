Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781199;
	b=u+IkhLHryOQAvEEGFN3a1hjk4NV9ofQvniBPOELTHON6F6Z3FSEE4s7ktjDe3MGcjrpe
	 F4mRBDnhpxg2LFoFRxrxR5rLqXEylDWDmZKE6egSlsd1pHPVWDye/9sCBJW08hFaSIHLZ
	 23RpeIYzimo70BLU6aQ6GzzJfuAEQktIeK0x9MQHESA7uQakKq9a2Q3t5S7UQBLQqQNsd
	 gEtbAjjgcVT75BYT5qaDt/ODhmJoFnLXzf9cbYcTYXPOXX0JpBypXTZB+PqJgPD49BOTv
	 OZxRDzttvHUC0ZAtNdDNIhMbLQjuvk2yhLNk/GAee8nk2wGoD8rd9maC1HInAHs2GYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=cb4Xh9aZZNBfvBhmip68fxld1JZtIcdH9x4WHMmXxfI=;
	b=lyrBoxRLOAK9j2j6PWIzTdaOcRivK2Go1ubiIkoZhci0kMTksoAmGcrTXdGNgUG3IYHK
	 CkA+cmNktHprGZZGNrCHs+E7Ughp42XaiLLg3+VXqTWfY6ySiD2/v166V8WbN5LQ2uroH
	 hMmUhtZcz4kyu3XdUZxfAEcHWisNINSsdtxQjWrhzqdEtQoBpUqKfyrJAuDiVMdi8kEIU
	 PBfn9UBeDyV40i4WttXNHTA7jq/B4CUWG7rDvCVXpllmoqoU0J8mw/JDy6brIxxwum+xe
	 87n9AiOHmeVkPG49sT8zqiMrhtaFJ13iYmBeBaUiBBibqofnPD8fwfuk7S6w+p/MNWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LJSx1YrR;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF49606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BF49606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LJSx1YrR
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b042c0728so66668f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793781197; x=1794385997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cb4Xh9aZZNBfvBhmip68fxld1JZtIcdH9x4WHMmXxfI=;
        b=LJSx1YrRDtfxmDS6br0cC4dvIZ11gWmkIetcRfRoMDmhzdBXmok/v9otSQT/+SVnag
         maYz6bLghQyEx69WP21/CJM3IyXsPw7fq8eF7cMwf1nVxYQOKWRQL6eB0sFpR9V2lMcO
         vZru0+2maq9fqklwak/pl8D3SpXKLUtZ2g8d4zZrfjjARzisOTb9gGEqHn0g1PEzeeeX
         HucSqz8CGpAQTbdl24gfSwHekLb+Cu8TjVAdWsWwFYBYZDwfhoGoWNT5XqVwrgy2swsJ
         Hkc/bG+3M407Phgnks6EC65G8dp67EalZ6ZqBS432VPeN+dQtGaXvfJ6+4DvSlhrxYrc
         nM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781197; x=1794385997;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cb4Xh9aZZNBfvBhmip68fxld1JZtIcdH9x4WHMmXxfI=;
        b=Mi4Yg2H0uYydKPFKiHoHY2AFjClW+sCK6tsZ5Zs8x8duh/vTj8T1cYk5lNJpPiIJkE
         8YoNSPSYrGGUqHLdIMAZhlgfXo4U2TQr3+o143Ff823TJ7QcgOXRMnmzKLYs/xlaP0DB
         xwnUQeODHyCjuINo9uc7FGtFpzWzsf1VnloRKFMgp5+lEhOpw+CXY3aEEgqYTm2MTl1i
         chpWYBdkW6nJ/NtxGaNjJXKihsWsMHAczdTbliXG6ToXmzqP3s4rkXoOYa6QbPuZ15Rv
         w8tqRS5jlTd2u8PYmiatbIphWU84hbftIJ5PhaNuL7y6qfuVv5M2gflvWcvBWuZB57Fn
         kd/g==
X-Forwarded-Encrypted: i=1; AKwUvBzw+MQ9lPcrkBvhRZNy0MBn/nykGULESdnUi/w2cEJTItoVAxz5ErNMoLJa6FC6ChzwmO1jUuuiX6jZk2Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rckD69dYxljGMT0aBeDjdM0Vhe5xh3wZsiM3t6/TmNKp9aWcM
	v8s2ds/NU8cMuzZorCmTHxH2dJe2mg74vPOIs3vix/1b3iahig7mORu1CyVWwG25XEw=
X-Gm-Gg: AYBFou3Srd/AymEsmN4d0bOsv+iZVWWjov9RAR/2jLIPZbAzH7+z5rRPYjLy9QSxXe6
	gbXD319twddt+ZtXWM1M/8krZEH9audc+B3fQUxsS5tsUzKBrAfIzxutMDRlE0/raTktdau15HO
	OEnX0Re84rk4VMKqaPFIG5L+OGssGuj7xksAz9efJ40J5o+4HLbyQQjOUXljusRRSX8UK45pnky
	Jdq5jSu+b6YvdKL2Ci8mNuET9GVr32ttRd5D8lMD60nE9dmHXWqo7M0NuWjG9IBvL20d+wm8NUk
	wkYlrdN1DrkRCwLO6IDxIvxeiG7sanPyNSWIVkgt7EEx3m6P/967N5i6yqitYWnla6027mwiP4A
	Um0fFmm7/TjSBGyOVPvFfyIYAbz1wwOy0Y2C87F5v4f0brPLORseBFwLAVB/dNXtsMyna1vsN12
	9iwuXg6jlW9yz4aBsaBzViglfb+IYoWTeyek4+8SFnoKDvEFAVrWV1WbeTCgehydwjzkfO9uKp8
	TmpNQcv7xCqX/hXsOu5HGor7A+VDQD5CNdHFpvvjRBaRM+yYouTyi0U/mDcK+C7CXTO6Y1pdu6w
	gEOLl3xt6awSksCCJwlRDLF/tOUYFFEl3z6xhAAnA3hBWxdpfdjaFumkmrVZ8de9B8wPmMJYbjl
	69X2Cerln
X-Received: by 2002:a05:6000:41c8:b0:488:8437:b8b7 with SMTP id ffacd0b85a97d-48e6e2bc714mr34536225f8f.7.1793781196603;
        Wed, 04 Nov 2026 00:33:16 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:6762:47bb:1e06:ff70? ([2a01:e0a:106d:1080:6762:47bb:1e06:ff70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda20567sm2741237f8f.51.2026.11.04.00.33.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:33:16 -0800 (PST)
Message-ID: <676555ed-aa24-4654-a8bd-0606f1436396@linaro.org>
Date: Wed, 4 Nov 2026 09:33:15 +0100
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
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 3/3] iio: adc: add driver for the MAX34417 Four-Channel
 High Dynamic Range Power Accumulator
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux@analog.com
References: <20261102-topic-sm8x50-iio-max34417-adc-v5-0-0ffa5e5f2d5c@linaro.org>
 <20261102-topic-sm8x50-iio-max34417-adc-v5-3-0ffa5e5f2d5c@linaro.org>
 <20261104023032.0a21da0d@jic23-hlaptop>
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
In-Reply-To: <20261104023032.0a21da0d@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 03:30, Jonathan Cameron wrote:
> On Mon, 02 Nov 2026 15:49:06 +0100
> Neil Armstrong <neil.armstrong@linaro.org> wrote:
> 
>> The MAX34417 is a specialized current and voltage monitor used to
>> determine power consumption of portable systems. The driver support
>> getting the channels voltage, average power, accumulated average
>> power and energy over an I2C/SMBUS serial interface.
>>
>> The MAX34417 datasheet only specified on how to calculate the
>> accumulated average power, but with the Sample Per Second rate
>> we can easily get accumulated Energy in mJ.
>>
>> By default the IIO driver only supports single-shot Voltage
>> and Power sensing, but the accumulation can be enabled by
>> enabling the Energy IIO channel which then enables the
>> Continuous Accumulation Mode.
>>
>> The counter is common to all channels, so when reading a single
>> channel we will copy all accumulators to registers, so in order
>> to permit reading individual channels we must accumulate the
>> other channels in the driver when Continuous Accumulation Mode
>> is enabled.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> The use of the regmap_noinc stuff to deal with the variable
> size 'registers' is novel.  Might be worth just adding a little
> commentary on that to somewhere. Perhaps the regmap_config as a comment.
> 
> Other than that, just a question about why we need the postfixes
> for the labels. That seems superfluous.
> 
> Thanks,
> 
> Jonathan
> 
> 
>> diff --git a/drivers/iio/adc/max34417.c b/drivers/iio/adc/max34417.c
>> new file mode 100644
>> index 000000000000..e679cf142141
>> --- /dev/null
>> +++ b/drivers/iio/adc/max34417.c
> 
>> +
>> +static const struct regmap_config max34417_regmap_config = {
>> +	.reg_bits	= 8,
>> +	.val_bits	= 8,
> As noted above. This isn't really true.  You are just use noinc
> reads to pretend it is.  Those are normally only used for
> fifo registers so I think we should have a comment here talking
> about that choice.

Well, reg_bits is 8, but val_bits is 8 for the control & status registers,
for the data registers the value bits is variable, so it's kind of true.

But I should add the readable_noinc_reg callback, yes it's not FIFOs,
but both 3 data registers have different data width which should be
read using the noinc to use i2c_smbus_read_i2c_block_data().

I can provide my custom register read/write copied from regmap-i2c if
you find it better to avoid abusing regmap...

> 
> It is pretty neat so I'm not against it but it might rather
> surprise anyone looking at the datasheet!
> 
> 
> 
>> +	.max_register	= MAX34417_BULK_VOLTAGE_READOUT_REG,
>> +	.writeable_reg	= max34417_writeable_reg,
>> +	.readable_reg	= max34417_readable_reg,
>> +	.volatile_reg	= max34417_volatile_reg,
>> +	/* No cache since the only non-volatile register is read-only */
>> +};
> 
> 
> 
>> +
>> +static int max34417_read_label(struct iio_dev *indio_dev,
>> +			       struct iio_chan_spec const *chan,
>> +			       char *label)
>> +{
>> +	struct max34417_data *max34417 = iio_priv(indio_dev);
>> +	const char *input_label = max34417->input_label[chan->channel];
>> +
>> +	if (input_label) {
>> +		switch (chan->type) {
>> +		case IIO_VOLTAGE:
>> +			return sysfs_emit(label, "%s-voltage\n", input_label);
> 
> Why add the postfix? The channel type will turn up in the file name anyway.
> I don't think anything prevents us having the same label for channels of
> different types.  Is this a copy of something elsewhere?

It sounded better, but you're right I'll drop those.

> 
> 
>> +		case IIO_POWER:
>> +			return sysfs_emit(label, "%s-power\n", input_label);
>> +		case IIO_ENERGY:
>> +			return sysfs_emit(label, "%s-energy\n", input_label);
>> +		default:
>> +			return 0;
>> +		}
>> +	}
>> +
>> +	switch (chan->type) {
>> +	case IIO_VOLTAGE:
>> +		return sysfs_emit(label, "channel%d-voltage\n", chan->channel);
> Same applies here.  The postfix seems excessive.
>> +	case IIO_POWER:
>> +		return sysfs_emit(label, "channel%d-power\n", chan->channel);
>> +	case IIO_ENERGY:
>> +		return sysfs_emit(label, "channel%d-energy\n", chan->channel);
>> +	default:
>> +		return 0;
>> +	}
>> +}
> 
>> +
>> +static int max34417_probe(struct i2c_client *client)
>> +{
>> +	struct device *dev = &client->dev;
>> +	struct max34417_data *max34417;
>> +	struct iio_dev *indio_dev;
>> +	struct regmap *map;
>> +	int rc;
>> +
>> +	map = devm_regmap_init_i2c(client, &max34417_regmap_config);
>> +	if (IS_ERR(map))
>> +		return dev_err_probe(dev, PTR_ERR(map), "regmap_init failed\n");
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
>> +	max34417->regmap = map;
>> +	max34417->indio_dev = indio_dev;
>> +
>> +	rc = devm_mutex_init(dev, &max34417->lock);
>> +	if (rc)
>> +		return rc;
>> +
>> +	/* Set default input correction for all channels */
>> +	for (int i = 0; i < MAX34417_CHANNEL_COUNT; i++)
>> +		max34417->input_correction[i] =
>> +			max34417_calc_input_correction(MAX34417_DEFAULT_RSENSE);
>> +
>> +	device_for_each_child_node_scoped(dev, node) {
>> +		u32 rsense_uOhm, index;
>> +
>> +		rc = fwnode_property_read_u32(node, "reg", &index);
>> +		if (rc)
>> +			return dev_err_probe(dev, rc, "failure reading reg property of %pfwP\n",
>> +					     node);
>> +
>> +		if (index >= MAX34417_CHANNEL_COUNT)
>> +			return dev_err_probe(dev, -ECHRNG, "invalid reg %d of %pfwP\n",
>> +					     index, node);
>> +
>> +		if (fwnode_property_present(node, "label")) {
>> +			rc = fwnode_property_read_string(node, "label",
>> +							 &max34417->input_label[index]);
>> +			if (rc)
>> +				return dev_err_probe(dev, rc,
>> +						"failure reading label property of %pfwP\n",
> 
> Don't worry about going a bit longer - stcik to aligning after (
> Or.. Maybe use a helper function for the per channel parsing.

Ack

Thanks,
Neil

> 
> 
>> +						node);
>> +		}
>> +
>> +		if (fwnode_property_present(node, "shunt-resistor-micro-ohms")) {
>> +			rc = fwnode_property_read_u32(node, "shunt-resistor-micro-ohms",
>> +						      &rsense_uOhm);
>> +			if (rc)
>> +				return dev_err_probe(dev, rc,
>> +						"failure reading shunt property of %pfwP\n",
>> +						node);
>> +
>> +			if (rsense_uOhm < MAX34417_MIN_RSENSE ||
>> +			    rsense_uOhm > MAX34417_MAX_RSENSE)
>> +				return dev_err_probe(dev, -EINVAL,
>> +						     "invalid shunt value %d of %pfwP\n",
>> +						     rsense_uOhm, node);
>> +
>> +			max34417->input_correction[index] =
>> +				max34417_calc_input_correction(rsense_uOhm);
>> +		}
>> +	}

