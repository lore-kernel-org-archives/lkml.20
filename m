Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604165;
	b=W/mTd3mDrIazHdP3hzDEft7+rzdPNnUthCSD3apO3ezw+y3q+6RwwCNDqRPkexKGMDbY
	 zDMxBnKDR+Xl6Az+v5o1apL1eHGAJ44lXqCyebtV7ql8LIFvIQUUPXeDhZRdHVgppqZ8o
	 ysJQZZj9FYcZTTX6ZIfdk+JJIBd71I9/WhW8NpvJWbF5YgDyVWHXgTUvra0S9ELHYvlZ7
	 b/S9xEGoVno7JWwgs9vYVdB79fDPoBuXoFVM9mVrFfeeidg2PhxvypYpRB9VQfSmMMihw
	 rnGtcLFPihiYyOgiQ7iMAYCJ7t+aCFQj3LZ0lnKWQrs0zvj+Yh2TCVV46ol4CsxDAwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=zZvPsHrAvL0Y+kR2JA74c1k0/RF2c6JuNAyuVnG8luo=;
	b=aPAhjySeLwwhCypTcCZhaKNV2AmPE6qqmiFsQ29dINAxnxi+WVYv5mavbmYf+2cMzmoY
	 tajVDRHaiyrpdn1flE5ifKvBke9FOqZYUt6wuvL6y4f0CQb+TRLqvPbSTtyEBgMcz9HPB
	 1a57gat1wtTqF1hOwW3Rx+JjqSPl973D6oxG3o8iN5sWimrVWLl5p2TK9SFSEfzF7jKAu
	 uwzHz9favWfAw3fytVLfS91/euFORqMT9kS34bpgFwtZDWUdYshYkmi+gK+DmUVfZ/KW+
	 yLFEZRO2NV1BPN7lRer5WZyuarhI0ZvV4ZJQv/pi8ksPDV11h6JAtj0j+x38ByCE2ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o2fxX+Pq;
	arc=none smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64D160A2602
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:22:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C64D160A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o2fxX+Pq
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ab27e45e7cso22177981fa.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793604163; x=1794208963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zZvPsHrAvL0Y+kR2JA74c1k0/RF2c6JuNAyuVnG8luo=;
        b=o2fxX+PqdcK09i4Com2N8RWo4SY+zeOOj5IGn+V8TP09pTPR1C3Y7GIRdLi40k/1pf
         X6rmvBhBcoX9skcx6QG/lPsBWlrODeptAJj5F8hV7nPn7eSerLq/j8la297XRNoqhpGD
         /QqlEtM2ZqswFEXn/+nzo5UtF47lA+pIgkWL1UcA/zWG7yQaW01n1udOK0YxSh4cWZH3
         IBiJsYlU962f7muJOJQuB71kyqRyZVVk1rGu0ch4MqKoXsZF5gaspxzqT0vvzQh9bTWo
         FEDGHUZdHrZRoze5Nlt0+BLIpLSX0lrvMRadvaFzK7vmdTcUt3RtUbOd+z9PJcTQuiNE
         HYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793604163; x=1794208963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zZvPsHrAvL0Y+kR2JA74c1k0/RF2c6JuNAyuVnG8luo=;
        b=jR6WKT43B1ey9fjv64EMwiP/OAM3cDTlFOqiXqWdTfhHoqJ9CvpeQ3Pbrc1PMJ+OnY
         RRStZTFU7BIr4R0GxyVPlmuS5rBS8HxMoq/itBgZbdNUQ9BIDeo/XdSRyILgeiazj86i
         KpunTDUrOr4Ah+UpxTjfTi0VcqMBogiG6YJ3MFY0+EkPMeVy7d2o4h1utKUc4/ZcVrpB
         KIjx7Erj2WnvPyDtzl9hJvHU8QqWUTPngWBumv2VlDvXJ3uTvYtkIZo83xFQf8GFEfkI
         pfGPUqgihz/SNxIKeozBIf4KxJswdaaCkcd8i0Lsvtaxa9CVupCg0bGFUR9rE212SzLj
         gNEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwodiVBGwlTLeBAXxmp0RiLPuU1bBeb9VhalCWS6anxq9nWeuX5qa/7igfeKBd+1w/hIPJRbD0v1LWwq9c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zWE2ubLs6l85BVm46QUByTHWxS8diBAPGGSr/dT5G0xl+2gUZ
	5/2RWBquhQFLNwsmJup4HPJgC9Ox5FSbRkt+YJOTKzghFFs5FnZ0bdpd
X-Gm-Gg: AYBFou1usSOO+U+2tGMV52XmVanisA2wSh7cemkJfLAFFGTLmJodoEloSiqNERKbU/D
	9hQftzFyRsnhbEUcjfehREtgTcqAkED8lqqNA8kaoXzNr4r0wmgjkIrNi41M9ynMRC5ZeoKZjWm
	YE0y4FZ7Z//uAyVELRtIdnRw8w5E+mWgiEzUkZH/x6v+pjsVs8Y49V3LQpS1s+HEG6s89Hw3wRZ
	bpoOFC845Ui6tZ+gWncxBCz/xNQwjhpiQpkRrSMq9dj7vm1MAcPiR7GG68d8dit8Z0XXO0sGddN
	dGeZfNTFUPyrAC6DqnnTMGHoAfl73pSJ8NDfeoK2D6bq7rbe5gxVV+JRTfOFXVDpdgnkXm5Bnu/
	YEtpN5WSz5UoOR8C/MJAlEVrgEqEylxj3+JApZnQtvXa2HRg5zWGjllj1lSFU2DTJAUCYYKlk9z
	uLoFVCGPVUqDm8jyzyXZ941DEv86Yk/n/nNhonjdWiRc/7OUYlmctbv0F80tuFI2uLeNmfbNNBG
	8RwXYIRrPVPPE/xtP+E+7RO4TBR15G1QDJN2ecqtQCB1VIVplJV4s6KArPRjtK3pdgcff2SfFDF
	QwcPh0N+Y0PRsh2LWF638rvrEbTttANpZwTUyuO6KjXh4iUVUhrM54welwi1CJ/QURBVAW3ygJe
	0X+asNjBg
X-Received: by 2002:a05:651c:1508:b0:3a9:9b74:1ba1 with SMTP id 38308e7fff4ca-3acb7a9da5bmr22751851fa.8.1793604162695;
        Sun, 01 Nov 2026 23:22:42 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbebea12sm20385851fa.10.2026.11.01.23.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 23:22:41 -0800 (PST)
Message-ID: <e444c08d-3891-488a-b334-09f3ddd36584@gmail.com>
Date: Mon, 2 Nov 2026 09:22:39 +0200
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
Subject: Re: [PATCH v2 2/2] iio: adc: add driver for Texas Instruments TLA2528
 adc
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Rodolfo Giometti <giometti@enneenne.com>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Angelo Dureghello <adureghello@baylibre.com>,
 Tobias Sperling <tobias.sperling@softing.com>,
 Eason Yang <j2anfernee@gmail.com>,
 Marilene Andrade Garcia <marilene.agarcia@gmail.com>,
 Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
 duje@dujemihanovic.xyz, herve.codina@bootlin.com,
 thomas.petazzoni@bootlin.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261030164705.297354-1-maxime.chevallier@bootlin.com>
 <20261030164705.297354-3-maxime.chevallier@bootlin.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20261030164705.297354-3-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/10/2026 18:47, Maxime Chevallier wrote:
> Add a new driver for the TI TLA2528 ADC chip. It has 8 12-bit
> channels, that can also be configured as 16-bit averaging channels.
> 
> This is a very simple driver, allowing reading raw values for each
> channel. GPIO mode isn't supported for now, as well as buffered mode and
> the 16-bit averaging mode.
> 
> Co-developed-by: Rodolfo Giometti <giometti@enneenne.com>
> Signed-off-by: Rodolfo Giometti <giometti@enneenne.com>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Looks very nice and clean to me. I made couple of remarks below but they 
are very minor and I do not require them to be addressed. Nice job!

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

> ---
>   MAINTAINERS                  |   1 +
>   drivers/iio/adc/Kconfig      |  12 ++
>   drivers/iio/adc/Makefile     |   1 +
>   drivers/iio/adc/ti-tla2528.c | 245 +++++++++++++++++++++++++++++++++++
>   4 files changed, 259 insertions(+)
>   create mode 100644 drivers/iio/adc/ti-tla2528.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 471585b29c19..1ebb6418ab1f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27720,6 +27720,7 @@ M:	Maxime Chevallier <maxime.chevallier@bootlin.com>
>   L:	linux-iio@vger.kernel.org
>   S:	Supported
>   F:	Documentation/devicetree/bindings/iio/adc/ti,tla2528.yaml
> +F:	drivers/iio/adc/ti-tla2528.c
>   
>   TEXAS INSTRUMENTS' TMP117 TEMPERATURE SENSOR DRIVER
>   M:	Puranjay Mohan <puranjay@kernel.org>
> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index a802d8ee4dd9..8633267d6056 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -2016,6 +2016,18 @@ config TI_LMP92064
>   	  This driver can also be built as a module. If so, the module will be called
>   	  ti-lmp92064.
>   
> +config TI_TLA2528
> +	tristate "Texas Instruments TLA2528 ADC driver"
> +	depends on I2C
> +	select REGMAP_I2C
> +	select IIO_ADC_HELPER
> +	help
> +	  Say yes here to build support for Texas Instruments TLA2528
> +	  12-Bit 8-Channel ADC.
> +
> +	  To compile this driver as a module, choose M here: the module will be
> +	  called ti-tla2528.

I deeply dislike repetitive boilerplate text, which often, in my 
opinion, provides no real value. This last chapter (which is also 
present in many other drivers, and which is preferred by some 
developers) is for me an example of wasted lines. I believe writing the 
"choose M here: ..." is guidance, specific to menuconfig tool. The 
purpose of this file is not to explain menuconfig tool usage, but 
explain what the configuration option enables. Perhaps we some day have 
different config tool, with no option labeled as 'M' at all.

Furthermore, I do dislike also the "module will be called "foo", which I 
think is just unnecessary noise. You probably want to still keep it, to 
avoid comments from other reviewers, who claim someone (if not them) has 
once used this information for something. ;)

> +
>   config TI_TLC4541
>   	tristate "Texas Instruments TLC4541 ADC driver"
>   	depends on SPI
> diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
> index 9e82c21dbd37..b98cded4d0c7 100644
> --- a/drivers/iio/adc/Makefile
> +++ b/drivers/iio/adc/Makefile
> @@ -171,6 +171,7 @@ obj-$(CONFIG_TI_ADS8344) += ti-ads8344.o
>   obj-$(CONFIG_TI_ADS8688) += ti-ads8688.o
>   obj-$(CONFIG_TI_AM335X_ADC) += ti_am335x_adc.o
>   obj-$(CONFIG_TI_LMP92064) += ti-lmp92064.o
> +obj-$(CONFIG_TI_TLA2528) += ti-tla2528.o
>   obj-$(CONFIG_TI_TLC4541) += ti-tlc4541.o
>   obj-$(CONFIG_TI_TSC2046) += ti-tsc2046.o
>   obj-$(CONFIG_TWL4030_MADC) += twl4030-madc.o
> diff --git a/drivers/iio/adc/ti-tla2528.c b/drivers/iio/adc/ti-tla2528.c
> new file mode 100644
> index 000000000000..287e52dc9d6d
> --- /dev/null
> +++ b/drivers/iio/adc/ti-tla2528.c
> @@ -0,0 +1,245 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Driver for Texas Instruments TLA2528 ADC
> + *
> + * Copyright (C) 2020-2021 Rodolfo Giometti <giometti@enneenne.com>
> + * Copyright (C) 2025 Maxime Chevallier <maxime.chevallier@bootlin.com>
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/types.h>
> +#include <linux/units.h>
> +
> +#include <linux/iio/adc-helpers.h>
> +#include <linux/iio/iio.h>
> +
> +#define TLA2528_OP_WRITE_REG		0x08
> +#define TLA2528_OP_READ_REG		0x10
> +
> +#define TLA2528_SYSTEM_STATUS_ADR	0x00
> +#define TLA2528_GENERAL_CFG_ADR		0x01
> +#define TLA2528_GENERAL_CFG_RST		BIT(0)
> +#define TLA2528_GPI_VALUE_ADR		0x0d

Not sure having the GPI_VALUE_ADR or SYSTEM_STATUS_ADR here is worth it. 
They seem to be unused.

> +#define TLA2528_CHANNEL_SEL_ADR		0x11
> +#define TLA2528_CHANNEL_SEL_MANUAL_CHID	GENMASK(3, 0)
> +#define TLA2528_AUTO_SEQ_CH_SEL_ADR	0x12
> +
> +#define TLA2528_NUM_CHANNELS		8
> +
> +struct tla2528 {
> +	struct i2c_client *client;
> +	struct regmap *regmap;
> +	int vref_mv;
> +
> +	/* Protects manual channel selection */
> +	struct mutex lock;
> +};
> +
> +static bool tla2528_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case TLA2528_SYSTEM_STATUS_ADR:
> +	case TLA2528_GENERAL_CFG_ADR:
> +	case TLA2528_GPI_VALUE_ADR:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}

My personal preference for static volatile/read-only/write-only register 
information, is to use range tables. Seeing a function makes me always 
think there is some runtime logic involved.

This is still nice and clean function, with not much room for confusion 
so I suppose it is fine.

> +static const struct regmap_config tla2528_regmap_config = {
> +	.reg_bits = 16,
> +	.val_bits = 8,
> +	.read_flag_mask = TLA2528_OP_READ_REG,
> +	.write_flag_mask = TLA2528_OP_WRITE_REG,
> +	.max_register = TLA2528_AUTO_SEQ_CH_SEL_ADR,
> +	.volatile_reg = tla2528_volatile_reg,
> +	.cache_type = REGCACHE_MAPLE,
> +};
> +
> +static int tla2528_read_sample(const struct i2c_client *client)
> +{
> +	__be16 data;
> +	int ret;
> +
> +	ret = i2c_master_recv(client, (char *)&data, sizeof(data));
> +	if (ret < 0)
> +		return ret;
> +
> +	return be16_to_cpu(data) >> 4;
> +}
> +
> +static int tla2528_read(struct tla2528 *tla2528, u8 channel, int *val)
> +{
> +	int ret;
> +
> +	ret = regmap_update_bits(tla2528->regmap, TLA2528_CHANNEL_SEL_ADR,
> +				 TLA2528_CHANNEL_SEL_MANUAL_CHID, channel);
> +	if (ret)
> +		return ret;
> +
> +	ret = tla2528_read_sample(tla2528->client);
> +	if (ret < 0)
> +		return ret;
> +
> +	*val = ret;
> +
> +	return 0;
> +}
> +
> +static int tla2528_read_raw(struct iio_dev *indio_dev,
> +			    struct iio_chan_spec const *chan,
> +			    int *val, int *val2, long mask)
> +{
> +	struct tla2528 *tla2528 = iio_priv(indio_dev);
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		mutex_lock(&tla2528->lock);
> +		ret = tla2528_read(tla2528, chan->channel, val);
> +		mutex_unlock(&tla2528->lock);
> +		if (ret < 0)
> +			return ret;
> +
> +		return IIO_VAL_INT;
> +
> +	case IIO_CHAN_INFO_SCALE:
> +		*val = tla2528->vref_mv;
> +		*val2 = 12;
> +
> +		return IIO_VAL_FRACTIONAL_LOG2;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +#define TLA2528_CHAN(chan) {					\
> +	.type = IIO_VOLTAGE,					\
> +	.channel = (chan),					\
> +	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
> +	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
> +	.indexed = 1,						\
> +}
> +
> +static const struct iio_chan_spec tla2528_chan_template = TLA2528_CHAN(0);
> +
> +static const struct iio_chan_spec tla2528_channel[] = {
> +	TLA2528_CHAN(0),
> +	TLA2528_CHAN(1),
> +	TLA2528_CHAN(2),
> +	TLA2528_CHAN(3),
> +	TLA2528_CHAN(4),
> +	TLA2528_CHAN(5),
> +	TLA2528_CHAN(6),
> +	TLA2528_CHAN(7),
> +};
> +
> +static const struct iio_info tla2528_info = {
> +	.read_raw = tla2528_read_raw,
> +};
> +
> +static int tla2528_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct iio_chan_spec *channels;
> +	struct iio_dev *indio_dev;
> +	struct tla2528 *tla2528;
> +	int ret;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
> +		return -EOPNOTSUPP;
> +
> +	if (i2c_check_quirks(client->adapter, I2C_AQ_NO_CLK_STRETCH))
> +		return dev_err_probe(dev, -EOPNOTSUPP,
> +				     "adapter does not support clock stretching\n");
> +
> +	indio_dev = devm_iio_device_alloc(dev, sizeof(*tla2528));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	tla2528 = iio_priv(indio_dev);
> +	tla2528->client = client;
> +
> +	tla2528->regmap = devm_regmap_init_i2c(client, &tla2528_regmap_config);
> +	if (IS_ERR(tla2528->regmap))
> +		return PTR_ERR(tla2528->regmap);
> +
> +	ret = devm_mutex_init(dev, &tla2528->lock);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_regulator_get_enable(dev, "dvdd");
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_regulator_get_enable_read_voltage(dev, "avdd");
> +	if (ret < 0)
> +		return ret;
> +
> +	tla2528->vref_mv = ret / (MICRO / MILLI);
> +
> +	ret = devm_iio_adc_device_alloc_chaninfo_se(dev, &tla2528_chan_template,
> +						    TLA2528_NUM_CHANNELS - 1,
> +						    &channels);
> +	if (ret < 0 && ret != -ENOENT)
> +		return ret;
> +
> +	if (ret == -ENOENT) {
> +		indio_dev->channels = tla2528_channel;
> +		indio_dev->num_channels = ARRAY_SIZE(tla2528_channel);

I think just requiring the channels to be there would be simpler. It's 
only 8 chans so it's not that huge description - and this would make it 
simpler to support "all GPIOs" -case later.

> +	} else {
> +		indio_dev->channels = channels;
> +		indio_dev->num_channels = ret;
> +	}
> +
> +	indio_dev->name = "tla2528";
> +	indio_dev->info = &tla2528_info;
> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +
> +	ret = regmap_write(tla2528->regmap, TLA2528_GENERAL_CFG_ADR,
> +			   TLA2528_GENERAL_CFG_RST);
> +	if (ret)
> +		return ret;
> +
> +	fsleep(5 * USEC_PER_MSEC);
> +
> +	return devm_iio_device_register(dev, indio_dev);
> +}
> +
> +static const struct i2c_device_id tla2528_id[] = {
> +	{ "tla2528" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, tla2528_id);
> +
> +static const struct of_device_id tla2528_of_match[] = {
> +	{ .compatible = "ti,tla2528" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, tla2528_of_match);
> +
> +static struct i2c_driver tla2528_driver = {
> +	.driver = {
> +		.name = "tla2528",
> +		.of_match_table = tla2528_of_match,
> +	},
> +	.probe = tla2528_probe,
> +	.id_table = tla2528_id,
> +};
> +module_i2c_driver(tla2528_driver);
> +
> +MODULE_AUTHOR("Maxime Chevallier <maxime.chevallier@bootlin.com>");
> +MODULE_AUTHOR("Rodolfo Giometti <giometti@enneenne.com>");
> +MODULE_DESCRIPTION("Texas Instruments TLA2528 ADC driver");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("IIO_DRIVER");


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
