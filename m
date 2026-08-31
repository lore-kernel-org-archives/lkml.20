Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3098376A06
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788211880; cv=none; b=f5ESnaO2Hoc5zwdjSjeWLpLHgCNk3ubHI4U7hpvZv8eQk0YDcEEevqbq0hyNoacyygcs3ObqNA59F9utygipfR21sGEfSMgnSO6yCtPYRhIwSsLg8CHNV9ge0jC3zzs2b/ZWX01g6do1BBYq5YWEV/TxdsR8JCPLulcgUagTer8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788211880; c=relaxed/simple;
	bh=Apu7WxCKdxCNNbB8QFHVHPSllno3XZk2PlgjJEqNf9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N71qgkKflxdhrVg4hS86qU+O2kIaIg0yRWfByQOOlBDQZ2hUqMIlnVBFM8ZuO3eKCIjGQa1kvraBJbKB/M/Tu33z7/7b6XSWKXZmwqdUyiMBZw3oiwhVNI9CFugz9tE4bhmz5m69m/tAWAt3GyPinGxUPovXwOO2EI7pYyJ+e7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=TzJHbvfC; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="TzJHbvfC"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7e6b5737bb2so4681311a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788211875; x=1788816675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=36C3Oih73XUQvR24WFbEa2E1rDnHzR+Ewr6SVE+Zg6c=;
        b=TzJHbvfC9Vq1oxFA9jqn1G+xYDB+lNO7LBGOBqL9rFmA4yYlz0HC4zdDKKbPGww1Hm
         5p4VzrwOwR9zc6y2U1hidif6kE7Ui9BmJd7rkXSY6TiJejxu0tO0zDF3MSjKFAO51Rgw
         J8/zCMPBLB4c8FWiTFmzDfcLWTdaCK+QhOCsY7ScJjRXdQNqmdgz/Fwco/haHq3Dzx4P
         PVAzyCdhmgEGMtu4QxO3orr1AEjk4uulbz0YyEP035lFgnU8n/4FcDApygOkXYKxGpAb
         lW2PGL5JcCatsWFi3CHBUw9n0Z7I2g2BDs1B5owAj4ZUTr0AaWBuyy2+sfQHSOJtTc1L
         2lyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788211875; x=1788816675;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=36C3Oih73XUQvR24WFbEa2E1rDnHzR+Ewr6SVE+Zg6c=;
        b=nGqZGXaol/9R6S30liXTHBtcOw8GMykgsLw15XONngzaop+93wPyhg7qGEA6uNUhtd
         JwMNEsUjt5xElSzvuMtgE+A+aSSZkJW0Kr9zBg26ZCm3EVfece/Hnziw1TYVy6CrRMwD
         hJoeEYMFaM7yaZGNA3v5hbquUFmJpcWe5CekauV40cymvzF3xLJiwQmcfemrhCJpUurT
         G5mmFTSN6xsR6fwP9fstBJAh5WEKNyyObWF1coo17iX6Rh0q3CWDT/vqgy2q548SCiKD
         LJrQrN2IdSh6uzUH16xaslOSVN6E0DOIr8N9qNQgitiE00tzujxnH5uwlqCn+b3U652M
         hp3g==
X-Forwarded-Encrypted: i=1; AHgh+Royq/9e+6B+x3bIGHN3XZkcyH4qCN4yhVd9SRq1DolfSeGY539TL9XwH4MO8ZqWquB6h+NQnauUMVqb32A=@vger.kernel.org
X-Gm-Message-State: AFuF++nv9TA2YwICpbadkBlo6gcnLv1CyhKreP2FUnQtgktMJAO+MPjB
	Wzraxbb5+KgDq5S0jYoPT5HQH42l3a20jTPLRKZf7ytgYkUvp67Kjsatwf7gWN6VZjc=
X-Gm-Gg: AYBFou2wB9Wf4LCj4dAw23halbUe6BmGlWxq/h+aLOBWSePseQMx2Q8oNUTPGrVi8Zc
	ClARP6orOvpoXCet2GzJ54nZDBM9wOzspUN2echQDTF0xKka7ESbepukuUkcasrSLMnIlpYepiS
	ne5wwnZKWSN731aWgCmiU00wu3/2yqe4ha6R10NXqi2gIuyhoKXd0DT4k4O9lusFbV1EPyHpC0F
	fra7cGJcThvNbEWk/O4KwBq5tsrq2NYgYc2YxURze9g7VwR0Mjb+3oOPwj/hTVuowbX0Amccy+d
	k5yYpLfkDObU9UQl6k6mn/ae5Gn3FAmNoqzs5P7z/H8b+LJcuF1m4miap87oD0GcDdFTejZVhFp
	YmaQne3A1p8syYIUoMtgnV12/aGPXZe5va19b5hwufYhF+jtiOOr1MW4KURww89d8VO75tSYKtt
	XO6pUona0aK0aD8pZ0a+mYUJep0V6J+uP/2HVI9UrolhkruMXNnISVCUdHhvBfLW8dMmjdQtKNX
	vJkYNuklq+A0mlKzQEoIedvPCdypV5g7gJsjew6+DGsFgc=
X-Received: by 2002:a05:6830:6005:b0:7f4:e4a4:5d9c with SMTP id 46e09a7af769-7f68783b958mr4855411a34.6.1788211875154;
        Mon, 31 Aug 2026 14:31:15 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:778b:da9:a8a1:bc78? ([2600:8803:e7e4:500:778b:da9:a8a1:bc78])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f4fa96ce3dsm9340835a34.18.2026.08.31.14.31.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 14:31:14 -0700 (PDT)
Message-ID: <9576dc33-f622-4578-9dff-526046ff0689@baylibre.com>
Date: Mon, 31 Aug 2026 16:31:13 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] iio: adc: ti-ads112c14: add continuous mode
 support
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Chris Hall <c-hall@ti.com>,
 Patrick Edwards <pedwards@ti.com>, Kurt Borja <kuurtb@gmail.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260827-iio-adc-ti-ads112c14-continuous-mode-v4-0-1e51a6e20a69@baylibre.com>
 <20260827-iio-adc-ti-ads112c14-continuous-mode-v4-3-1e51a6e20a69@baylibre.com>
 <178812363490.2788519.7648614173312615575.b4-review@b4>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <178812363490.2788519.7648614173312615575.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/30/26 4:00 PM, Jonathan Cameron wrote:
>> Add support for continuous mode in the TI ADS112C14 ADC driver. In this
>> mode the ADC itself is starting each conversion, so we add a trigger
>> based on the DRDY interrupt to read each sample. This mode is also
>> limited in that only one channel can be enabled at a time since the
>> chip does not have a sequencer or simultaneous sampling capability.
>> Continuous mode will only be used when this new trigger is the current
>> trigger.
>>
>> Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
> Sashiko caught some interesting things in this one.
> 
> See inline.
> 
>>
>> diff --git a/drivers/iio/adc/ti-ads112c14.c b/drivers/iio/adc/ti-ads112c14.c
>> index 23f15be303fb..878764deffc5 100644
>> --- a/drivers/iio/adc/ti-ads112c14.c
>> +++ b/drivers/iio/adc/ti-ads112c14.c
>> @@ -9,6 +9,7 @@
>>   */
>>  
>>  #include <linux/bitfield.h>
>> +#include <linux/bitmap.h>
>>  #include <linux/cleanup.h>
>>  #include <linux/completion.h>
>>  #include <linux/crc8.h>
>> @@ -18,6 +19,7 @@
>>  #include <linux/i2c.h>
>>  #include <linux/iio/buffer.h>
>>  #include <linux/iio/iio.h>
>> +#include <linux/iio/trigger.h>
>>  #include <linux/iio/trigger_consumer.h>
>>  #include <linux/iio/triggered_buffer.h>
>>  #include <linux/interrupt.h>
>> @@ -257,6 +259,7 @@ struct ads112c14_measurement {
>>  struct ads112c14_data {
>>  	const struct ads112c14_chip_info *chip_info;
>>  	struct regmap *regmap;
>> +	struct iio_trigger *drdy_trig;
>>  	/* Synchronizes access to register value fields. */
>>  	struct mutex lock;
>>  	int drdy_irq;
>> @@ -280,11 +283,18 @@ static irqreturn_t ads112c14_drdy_irq_handler(int irq, void *private)
>>  	struct iio_dev *indio_dev = private;
>>  	struct ads112c14_data *data = iio_priv(indio_dev);
>>  
>> -	complete(&data->drdy_completion);
>> +	if (indio_dev->trig && iio_trigger_using_own(indio_dev))
> 
> 
> This indeed needs more guarding given we hit these interrupts for
> a normal read (to get to the completion)
> 
> 
> Likewise seems valid.

I figured it didn't need guarding since we are claiming direct mode. The
trigger can't be assigned until buffer mode is claimed. and we can't
switch to buffer mode if direct mode is claimed.


> 
>> +		iio_trigger_poll(data->drdy_trig);
>> +	else
>> +		complete(&data->drdy_completion);
>>  
>>  	return IRQ_HANDLED;
>>  }
> 
> ...
> 
>>  static irqreturn_t ads112c14_trigger_handler(int irq, void *private)
>>  {
>>  	struct iio_poll_func *pf = private;
>> @@ -961,6 +984,26 @@ static irqreturn_t ads112c14_trigger_handler(int irq, void *private)
>>  	u32 i;
>>  	int ret;
>>  
>> +	if (iio_trigger_using_own(indio_dev)) {
> 
>  | sashiko.dev <sashiko@sashiko.dev>:
>  |
>  | [Severity: High]
>  | Will this check incorrectly enable continuous mode processing for any
>  | external trigger that belongs to its own device?
>  |
>  | If a user assigns an external trigger that sets its attached_own_device
>  | property to true, iio_trigger_using_own() will evaluate to true. Could this
>  | misroute the interrupt handler into assuming continuous mode when it should
>  | not?
>  |
>  | via: https://sashiko.dev/#/message/20260827-iio-adc-ti-ads112c14-continuous-mode-v4-3-1e51a6e20a69@baylibre.com
> 
> I think this is triggered by the more complex handling you have
> to detect use of the dataready trigger below.  There is only one trigger
> currently so they end up the same, but perhaps we should make the handling
> more similar?

I'll just create our own local flag instead of relying on IIO internals.

> 
>> +		const struct iio_chan_spec *chan;
>> +
>> +		chan = ads112c14_first_active_channel(indio_dev);
>> +		if (!chan)
>> +			goto out;
>> +
>> +		ret = ads112c14_scan_read(data, (u8 *)&data->scan[0]);
> 
>  | sashiko.dev <sashiko@sashiko.dev>:
>  |
>  | [Severity: High]
>  | This is a pre-existing issue, but is there a missing length check in the
>  | underlying I2C block read that leaves stack memory partially uninitialized?
>  |
>  | If i2c_smbus_read_i2c_block_data() (called by ads112c14_scan_read()) returns
>  | a positive value smaller than the requested length, the condition if (ret < 0)
>  | fails to catch the short read. Does this leak uninitialized stack memory to
>  | userspace when data->scan is later pushed to the IIO buffers?
>  |
>  | via: https://sashiko.dev/#/message/20260827-iio-adc-ti-ads112c14-continuous-mode-v4-3-1e51a6e20a69@baylibre.com
> 
> I haven't chased this one through - but in a similar example in a review
> I did yesterday I suggested just initializing the memory anyway
> so we don't have to care one way or the other.

This uses i2c_smbus_xfer() in the end which returns 0 or negative error.
No partial reads. So I don't see how we could be leaking.

> 
>> +		if (ret) {
>> +			dev_err_once(indio_dev->dev.parent,
>> +				     "failed to read channel %d: %pe; additional errors will be suppressed\n",
>> +				     chan->channel, ERR_PTR(ret));
>> +			goto out;
>> +		}
>> +
>> +		iio_push_to_buffers_with_ts(indio_dev, data->scan,
>> +					    sizeof(data->scan), pf->timestamp);
>> +		goto out;
>> +	}
>> +
>>  	iio_for_each_active_channel(indio_dev, i) {
>>  		const struct iio_chan_spec *chan = &indio_dev->channels[i];
>>  
