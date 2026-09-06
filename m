Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09A9375F83
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 20:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788725849; cv=none; b=aok+4YWC8iqEK6IipIgVy0cJsbqM7rPNg87adTuw8VZizgJ+fMvVwnnlHbVoXdOmiLTKUR7E2wiAz7rvbrfDNGK/uBoH/JOzZ0wc/AziWY4enbHnAVW6FI3XjEWzE+tz7wBiNYOAmaIGTdK659XZ+OuxvAbIEHIRY/b6QySQJdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788725849; c=relaxed/simple;
	bh=wkLEf7Cce830x5+Op1r9rQeBFGWbFYN1zMc56AIdU6s=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 References:In-Reply-To; b=D7hEUYTmVL6vkuwg5Rm0v2pVNUUBWqEWMI91Vk8nm9En+3yd+IokFQ6WwzDMzkzO68mHDTbL+GCvPJi0HYc5U0I1Zvq4ad3RcU3cCtNUuf6BTG42otQtN3Ez3q5jKEUor/2hNCSv2Fo16cIsWbUZFmJ/e3HPyuq2HIjwwwBvGY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UVooxfDe; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVooxfDe"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5c65d654c23so1175645e0c.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 13:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788725847; x=1789330647; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OtM9+DOyHnsUttC9flbAkQXpB58f1zzxgUqWVtOHupk=;
        b=UVooxfDeMcQgvySEvZXD7l3XJjMxV+iDzW5i0HQZE8b6f5P3xAHJ2CaCILmEvonO5I
         xdRcz4MC/4iV+KqBG3ctHowfoSDI7EQzWZYg2JbNLJStzLjpUVAmk29Hi5Kzpz2JW7Dh
         IGmlRn+wM375TKkLJjW46lDcU3jXG3+8BMKvOY3UX8rjnXh0kBN5mA/aGKNB/Lwyqq+Z
         RoJcuuxiJJCP8Yy5FpNog0Z5CPdoA84rUB04JaZzSWD2V3JVy4+9cg5CRCbp6Pi4qvQV
         OXXj5IhWtT6ZbBTSjVWalL3fywCf5IrrhuDXpx7EyIF6zr29mEmKNeHM4LIVN99BDl1h
         s94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788725847; x=1789330647;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OtM9+DOyHnsUttC9flbAkQXpB58f1zzxgUqWVtOHupk=;
        b=bCNGfTCykDD7bgad9l5GfwkomoFM39aemTfs/DqIuSnf9BY+k8CwBx47OWVc1G9SZr
         964H959EYb8b9yR9+fyilbxsrspVw40J7w4oA9AGc7QaUicd14vi5W2VoHV3tSdHpkvM
         E1Usheuvf6JYFnF2S6bT6PYIeLaodlDF6ktfw984e8YYg/ShTJB423rS5n5bOnNRpFfv
         MvqaKElR6kCRMsUFEbJO8VsTjrOAetxBz+8duY7HFRIvvnkflxoZNYqZlU6zQR9C4Jxc
         UQPUlURQOu1GApMBDiKrytWsjO53Bo1eU5ToDsLdrZG26FIue2DYhWKx3LTJCQBirQW+
         V/mQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLqDJThzFBbJIpoJh+u6U2nAPH//XgUOnY32Ic3+OnylslXwWq2AClcl0KW+AbNyYIV/0b7OorkEL3kVs=@vger.kernel.org
X-Gm-Message-State: AFuF++lCQJ2/St4mSDI7M33jTmbvYX+qNeIRUqm8ojeZgnskFkw1DyJ6
	oXJVEeBZM5iGSwgt1DIO9UCaDePcgR1eGOz7OqKs7oDKtrETAdiJ7uy4
X-Gm-Gg: AYBFou3Xo3yr/ntIz+3kezoMeheMD//Yl4bTxAsi4yqMaG402Xv4Nx8+xj1W7CmwqJI
	98ZNsOH1DY3hSJkfopSYIu+fqIzUkr6cRMQZ8GVfX3dgx6bdYkkG+bRlkRtyXulExZL48/Fks1F
	dZDKouE30gd14DblqrwAEvAwrtzc9lXCz2s1Uo/Iy+Erx6xGXgA+nBHxwqjp6efdv8dfgpYSPeT
	RVi/5pj4KbhgmHHNlU5+NgvU/ZczSrJ/k5hHg0krY1NmGhdzyIupaXZZJ+oYl1B9rXNP6ouEWWq
	FQJrpSd2wDe9L6TUscECne4aXgSMQHybYLCLPYt6TEXyMg/BKIOSAFlgBi7KcjcTmf+sO9/Rl5s
	LlIJRVf+X8w8CXtDz7GDVbEoNv5dblN6I1bNWaKV4y19fHJaL8t+yA6mr6MyllLzHJ4KUL8l4hA
	EAjf6xJz2X3USq2sFiabUAzJ7YUpQWOrvO2RzVXlOJFU4cvOyw5g==
X-Received: by 2002:a05:6122:da0:b0:5c7:ae9a:a056 with SMTP id 71dfb90a1353d-5c7ed457809mr7449250e0c.8.1788725846519;
        Sun, 06 Sep 2026 13:17:26 -0700 (PDT)
Received: from localhost ([2800:40:44:f1f5:f400:4c49:91c1:9905])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec219c12sm6402922e0c.8.2026.09.06.13.17.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 13:17:26 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 06 Sep 2026 17:17:21 -0300
Message-Id: <DL8IE3OUIUZ4.2SND39L7P03VL@gmail.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 03/10] iio: adc: add the ti-ads1262 driver
From: "Kurt Borja" <kuurtb@gmail.com>
To: "David Lechner" <dlechner@baylibre.com>, "Kurt Borja"
 <kuurtb@gmail.com>, "Jonathan Cameron" <jic23@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260828-ads126x-v4-0-1dc27e9c0260@gmail.com>
 <20260828-ads126x-v4-3-1dc27e9c0260@gmail.com>
 <bc00d888-9944-4a22-88e3-8f4d7384d037@baylibre.com>
In-Reply-To: <bc00d888-9944-4a22-88e3-8f4d7384d037@baylibre.com>

On Mon Aug 31, 2026 at 5:22 PM -03, David Lechner wrote:
> On 8/28/26 1:38 AM, Kurt Borja wrote:
>> Add the ti-ads1262 driver with initial support for the primary ADC
>> (ADC1). The ADS1263 auxiliary ADC (ADC2) is handled by a separate driver
>> and interoperability considerations were taken into account.
>>=20
>
> ...
>
>> +#define ADS1262_FW_CHANNEL_COUNT		16
>> +#define ADS1262_MON_CHANNEL_COUNT		4
>> +#define ADS1262_REGMAP_WRITE_SZ			8
>> +#define ADS1262_MONITOR_ADDR_OFFSET		100
>
> Where does this offset come from? I would make the address the value that
> gets written to MUXP/MUXN. But it looks like we are using the same value
> for the .channel, so setting .address to that would be redundant.

I'm using .address to map the firmware 'reg' to channels in
fwnode_xlate. That's why I would need to move the monitors forward. More
on this discussion below.

>
>> +
>> +#define ADS1262_ADC1_RESOLUTION			32
>> +
>> +struct ads1262 {
>> +	struct spi_device *spi;
>> +	struct regmap *regmap;
>> +	struct gpio_desc *start_gpiod;
>> +	/* protects concurrent SPI transfers */
>> +	struct mutex xfer_lock;
>> +	/* protects channel state */
>> +	struct mutex chan_lock;
>> +	struct completion drdy;
>> +	unsigned long clk_rate;
>> +	u8 dev_id;
>> +};
>> +
>> +static const char * const ads1262_device_id_to_name[] =3D {
>> +	[ADS1262_DEV_ID] =3D "ads1262",
>> +	[ADS1263_DEV_ID] =3D "ads1263",
>> +};
>> +
>> +static const struct iio_chan_spec ads1262_monitor_chan_specs[] =3D {
>> +	{
>> +		.type =3D IIO_TEMP,
>> +		.channel =3D ADS1262_INPMUX_TEMP,
>> +		.channel2 =3D ADS1262_INPMUX_TEMP,
>
> Since these are the same, I would just not set .channel2 and later say
> MUXN =3D spec->differential ? spec->channel2 : spec->channel. Same applie=
s
> to others below.
>
>> +		.address =3D ADS1262_MONITOR_ADDR_OFFSET + 0,
>> +		.scan_type =3D {
>> +			.format =3D IIO_SCAN_FORMAT_SIGNED_INT,
>> +			.realbits =3D ADS1262_ADC1_RESOLUTION,
>> +			.storagebits =3D 32,
>> +			.endianness =3D IIO_BE,
>> +		},
>> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),
>
> Where is SCALE and OFFSET?

Missing.

I'm pretty sure I tested this channel though so maybe there's something
wrong in my tests.

>
>> +	},
>> +	{
>> +		.type =3D IIO_VOLTAGE,
>> +		.channel =3D ADS1262_INPMUX_AVDD,
>> +		.channel2 =3D ADS1262_INPMUX_AVDD,
>> +		.indexed =3D 1,
>> +		.address =3D ADS1262_MONITOR_ADDR_OFFSET + 1,
>> +		.scan_type =3D {
>> +			.format =3D IIO_SCAN_FORMAT_SIGNED_INT,
>> +			.realbits =3D ADS1262_ADC1_RESOLUTION,
>> +			.storagebits =3D 32,
>> +			.endianness =3D IIO_BE,
>> +		},
>> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),
>> +	},
>> +	{
>> +		.type =3D IIO_VOLTAGE,
>> +		.channel =3D ADS1262_INPMUX_DVDD,
>> +		.channel2 =3D ADS1262_INPMUX_DVDD,
>> +		.indexed =3D 1,
>> +		.address =3D ADS1262_MONITOR_ADDR_OFFSET + 2,
>> +		.scan_type =3D {
>> +			.format =3D IIO_SCAN_FORMAT_SIGNED_INT,
>> +			.realbits =3D ADS1262_ADC1_RESOLUTION,
>> +			.storagebits =3D 32,
>> +			.endianness =3D IIO_BE,
>> +		},
>> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),
>> +	},
>> +	{
>> +		.type =3D IIO_VOLTAGE,
>> +		.channel =3D ADS1262_INPMUX_TDAC,
>> +		.channel2 =3D ADS1262_INPMUX_TDAC,
>
> Hmm... a differential where channel =3D=3D channel2 usually means a short=
ed
> input. TDACP and TDACN can be controlled indepedantly, so really are two
> separate channels.

They can be controlled independently but the user would have to define a
common mode channel for that. I went with this because its only a test
channel and we making these channels static. Otherwise we would have to
allow the TDAC channel in devicetree. Would that be preferable?

>
>> +		.indexed =3D 1,
>> +		.differential =3D 1,
>> +		.address =3D ADS1262_MONITOR_ADDR_OFFSET + 3,
>> +		.scan_type =3D {
>> +			.format =3D IIO_SCAN_FORMAT_SIGNED_INT,
>> +			.realbits =3D ADS1262_ADC1_RESOLUTION,
>> +			.storagebits =3D 32,
>> +			.endianness =3D IIO_BE,
>> +		},
>> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),
>> +	},
>> +};
>> +
>
> ...
>
>> +static int ads1262_channel_read(struct iio_dev *indio_dev,
>> +				const struct iio_chan_spec *spec, __be32 *val)
>> +{
>> +	struct ads1262 *st =3D iio_priv(indio_dev);
>> +	int ret;
>> +
>> +	IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
>> +	if (IIO_DEV_ACQUIRE_FAILED(claim))
>> +		return -EBUSY;
>> +
>> +	ret =3D ads1262_set_runmode(st, ADS1262_RUNMODE_PULSE);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret =3D ads1262_channel_enable(st, spec);
>> +	if (ret)
>> +		return ret;
>> +
>> +	reinit_completion(&st->drdy);
>> +
>> +	ret =3D ads1262_dev_start_one(st);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret =3D ads1262_wait_for_conversion(st);
>> +	if (ret)
>
> Since wait is interruptable, do we need to do something to stop the
> conversion here?

The conversions are already stopped by ads1262_dev_start_one(). I
believe there is no way to cancel the current conversion. The only
downside here would the stale data stuff pointed out by Sashiko.

>
>> +		return ret;
>> +
>> +	return ads1262_dev_read_by_cmd(st, ADS1262_OPCODE_RDATA1, val);
>> +}
>> +
>
> ...
>
>> +static int ads1262_fwnode_xlate(struct iio_dev *indio_dev,
>> +				const struct fwnode_reference_args *iiospec)
>> +{
>> +	/* REVISIT: the auxiliary ADC (ADC2) is currently not supported */
>> +	if (iiospec->nargs > 1 && iiospec->args[1])
>> +		return -EINVAL;
>> +
>> +	if (!iiospec->nargs)
>> +		return 0;
>> +
>> +	for (unsigned int i =3D 0; i < indio_dev->num_channels; i++) {
>
> Won't this include the timestamp channel?

Yes, I'll fix it.

>
>> +		if (indio_dev->channels[i].address =3D=3D iiospec->args[0])
>
> I don't think .address is the right thing to use here (it is coming from
> reg in the devcietree). I would expect channel. Otherwise consumers in th=
e
> devicetree have to be away of how channels were assigned rather than pick=
ing
> the datasheet channel number.

I was very confused about what approach should I take here. All channels
in this chip are actually differential. In that case should I make
#io-channel-cells =3D 3 i.e. positive, negative and ADC?

>
> And the devicetree bindings should mention the monitor channel numbers (1=
1 - 14).
>
>> +			return i;
>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> +
>
> ...
>
>> +static int ads1262_spi_probe(struct spi_device *spi)
>> +{
>> +	struct device *dev =3D &spi->dev;
>> +	struct iio_dev *indio_dev;
>> +	struct ads1262 *st;
>> +	unsigned long rate;
>> +	struct clk *clk;
>> +	int irq;
>> +	int ret;
>> +
>> +	indio_dev =3D devm_iio_device_alloc(dev, sizeof(*st));
>> +	if (!indio_dev)
>> +		return -ENOMEM;
>> +	indio_dev->modes =3D INDIO_DIRECT_MODE;
>> +	indio_dev->info =3D &ads1262_iio_info;
>> +
>> +	st =3D iio_priv(indio_dev);
>> +	st->spi =3D spi;
>> +	init_completion(&st->drdy);
>> +
>> +	ret =3D devm_mutex_init(dev, &st->chan_lock);
>> +	if (ret)
>> +		return ret;
>> +	ret =3D devm_mutex_init(dev, &st->xfer_lock);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret =3D ads1262_parse_channels(indio_dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret =3D ads1262_supply_setup(st);
>> +	if (ret)
>> +		return ret;
>> +
>> +	clk =3D devm_clk_get_optional_enabled(dev, NULL);
>> +	if (IS_ERR(clk))
>> +		return dev_err_probe(dev, PTR_ERR(clk), "failed to get external clock=
\n");
>> +
>> +	rate =3D clk_get_rate(clk);
>> +	if (clk && !rate)
>> +		return dev_err_probe(dev, -EINVAL, "failed to get clock rate\n");
>> +	st->clk_rate =3D rate ? rate : ADS1262_NOMINAL_CLK_RATE;
>> +
>> +	st->start_gpiod =3D devm_gpiod_get_optional(dev, "start", GPIOD_OUT_LO=
W);
>> +	if (IS_ERR(st->start_gpiod))
>> +		return dev_err_probe(dev, PTR_ERR(st->start_gpiod),
>> +				     "failed to get start GPIO\n");
>> +
>> +	st->regmap =3D devm_regmap_init(dev, &ads1262_regmap_bus, st,
>> +				      &ads1262_regmap_config);
>> +	if (IS_ERR(st->regmap))
>> +		return PTR_ERR(st->regmap);
>> +
>> +	ret =3D ads1262_dev_configure(st);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to configure device\n");
>> +
>> +	indio_dev->name =3D ads1262_device_id_to_name[st->dev_id];
>
> Not so sure about this. Almost always, this is coming from the compatible
> match data. So unless we plan on trusting the device ID returned by the
> chip over the devicetree when we add more to the device id tables and loo=
king
> up per-chip behavior from there instead of the compatible, I would go wit=
h
> the traditional approach. That way the name userpace sees match the drive=
r
> behavior that goes with the other chip-specific match data that is likely
> to be added in the future.

You're right. I'll revert this.

>
>> +
>> +	/*
>> +	 * REVISIT: This chip has software polling capabilities, which could b=
e
>> +	 * used to stop depending on the DRDY signal.
>> +	 *
>> +	 * Additionally, the MISO pin also can be used as a DRDY IRQ, in which
>> +	 * case the interrupt would be named 'doutdrdy', but requires extra
>> +	 * timing and synchronization considerations to be reliable.
>> +	 */
>> +	irq =3D fwnode_irq_get_byname(dev_fwnode(dev), "drdy");
>> +	if (irq < 0)
>> +		return dev_err_probe(dev, irq,
>> +				     "the 'drdy' IRQ is currently required for operation\n");
>> +
>> +	ret =3D devm_request_irq(dev, irq, ads1262_irq_handler, IRQF_NO_THREAD=
,
>> +			       indio_dev->name, st);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return devm_iio_device_register(dev, indio_dev);
>> +}
>> +

--=20
Thanks,
 ~ Kurt
