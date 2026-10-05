Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A5C23C516
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 00:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791161474; cv=none; b=QWVF0amI1+mIhFS5euernryB4YE3zHgrzel45bUr/zVOANh26VODu/eo4iqdem/8C0yKySvdFdz0gBElFMwbRLpIs8VG0dbffxQRc5+7N8orh95sxTzOfmmmDLSrz5OpIDKy4vXJe+VdUnliJEKa8v/55B/6I2tjtJEon7V285M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791161474; c=relaxed/simple;
	bh=ht2t0kmTXlePQ8I6ndsjKSo6EfG0YJfvql7JkFoBniQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tzvzvqIri5bLDHgPt5kSLeIgWOwVIx9nO3E4c4w4gFcbk8vYcLOBOQqQZdhHR2zuGlrxu8eVo091Hw1b/TsBOhYqYFahEn4fjfvtx+f7OdTrJvI9HYdt4rjyvzxBzStJ4r4vePGJSlf6qlTkIbH/6lRV2b/csQsTE8oHzp+ic/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQENbEXc; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQENbEXc"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-98a903b7e1dso641265241.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 17:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791161472; x=1791766272; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a7isb0xGzjL6lMG99IXwS6EH+P9csPknCI8tVz+3n8M=;
        b=TQENbEXcuils9AJC80GLY8jl7CHlpWgQBf0qfh70AiuHF2/oZlfy9qEGl8IPhBsGDj
         jc3vzdyBV4kmKk4T0vPLWasvzF6w1TrIokyafmuEXIcBBgeqe/3Y6X8Fzj6qnoPNmNAU
         6E9tlG+AZGnWobBs1oP1tm5LU28ZgiJ1WlVI330dsyZ2QJrENoFShfbmvVb+Xatf5AEa
         AC35mu5jlxEtUcgivcwt15MImXt3Ej1pUhzxXU9tDtpnTJNfUao41neI8Yhtg32pYdQT
         aRp0xunL7UP0zx98+Ft1MLtlExgwDiSzG2EqG7hMuSwlQwPF2JnQ2Pi+YYT3g3kXxMol
         KLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791161472; x=1791766272;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a7isb0xGzjL6lMG99IXwS6EH+P9csPknCI8tVz+3n8M=;
        b=Mxvqox26TbM7K2+tM/TZYoMigZWoFHqu6sc5bQ4CNiAguQ3gZav7f4RGehWtc2DzWs
         tvU4Lc2k+S1eST08Zkyr2nuu93LnfCOrq1ZEQAdkq+mEBRzHfrDN2Ibz43k7AOXsEsTc
         nU6DvA0g5oSsooQ1M+QkHLcZ+skKLp2xa1z65samKDUqUfuJJ+vxSbB+fMMZbbz3Ik0w
         RoqDnfIo02aYJgAcL8W8cNGFL3WzD2KOPBcy6uPUrZyYVe/MBKOe4BdMh82TBlbWbric
         koYjjXZ9QjPs9cSFvRZMfDdS69Yo42yuIMyFxvwPsPz0xIAMSaO8URZFlE74zIoU/EQ5
         hENg==
X-Forwarded-Encrypted: i=1; AKwUvBwl3ReRiDXF4OU7ZyvCxdWHMXvvR/lB2SX96qWb714o9mUqUpwyuPS4neBflV3ylG5ud5+BzrBzISnVJW4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIznwp6zWxk3S4Gauwzygt/KI9p73J/tO87o8QNZz3UDWDTfQvj
	HIX++wKQD6pod2QryguSlGlVZnYF/naN9AlaihlvRZOgkckSxpTVlQMQ
X-Gm-Gg: AYBFou2AV9yApk8nergpuXMMamq8ICG+pYcoZZoDu9h8Qu8Rf0TwqAyWPFtKGpcsj1A
	/GSB6ZimMTpExuvOZBCUSuTYACy6MHtqTAO8nA3yuMuUqeoezdUvuNOZ9KOIoQjyM+D8i1lEdNH
	lz46ElKPSETF6eqdxB2i1ls+x6CbqVldZG+u0GrjV0G6XIHNV18lgpQp9XhiwHL5bCRJxHQjyq5
	NM8dAYsWn6JyrjUQhHEv7Ao3sX69aE0693+tOEOj4DX0uqkGk0Oa1LM78ZBXAjTbK7qcF0/3rVU
	rRHjFTUJBpfqpXeTABeNy7/SxardMebZ4/ZGi5AeNM/Sx7ypIJM218qAPjS2iSHZFHHaF00J2/b
	84Ywspe0m1qZjSNUFpOyCao/1fVWUr5HiTlX8TPPgBjmLAONBQAKckHuS6AAB+AnQ1T+P1wTcmW
	gbpIwf8ZvePrHcLfxcQl0Fq+2o4H2V/1yWTtfBWWroGQNK421YyD+FBeSvtKAZ14Whfhd2jRVh1
	GpA
X-Received: by 2002:a05:6102:8603:10b0:784:a925:3f0c with SMTP id ada2fe7eead31-7bf7df582c6mr2147719137.0.1791161471650;
        Sun, 04 Oct 2026 17:51:11 -0700 (PDT)
Received: from localhost ([2804:30c:96c:bf00:7844:c38c:894:4054])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98c7031853asm2042611241.12.2026.10.04.17.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 17:51:09 -0700 (PDT)
Date: Sun, 4 Oct 2026 21:51:24 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Kanak Shilledar <kanak.shilledar@axis.com>
Cc: Henrik Grimler <henrik.grimler@axis.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>, kernel@axis.com,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 6/6] iio: imu: inv_icm42607: Add accelerometer
 calibbias support
Message-ID: <asL0jC7Qa8YQP0fy@debian-BULLSEYE-live-builder-AMD64>
References: <20261002-b4-inv_icm42370p-v5-0-c65281b745c9@axis.com>
 <20261002-b4-inv_icm42370p-v5-6-c65281b745c9@axis.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261002-b4-inv_icm42370p-v5-6-c65281b745c9@axis.com>

On 10/02, Kanak Shilledar wrote:
> Expose IIO_CHAN_INFO_CALIBBIAS on the accelerometer channels. The
> registers are stored in MREG1. The calibration bias is written to
> OFFSET_USER4 to OFFSET_USER8 registers in MREG1. Reject the out of
> limit calibbias values instead of clamping it.
> 
> Note: The accelerometer functionality is tested with Invensense,
> ICM42370-P development board.
Good to know, but this should probably go below the '---'. Not within the commit
message.

> 
> Datasheet: https://www.invensense.tdk.com/en-us/products/3-axis/icm-42370-p
> Datasheet: https://www.lcsc.com/product-detail/C5129967.html
> Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>
> ---
Here

>  drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c | 194 +++++++++++++++++++++-
>  1 file changed, 192 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c b/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c
> index 9a3ace3e7fcf9..98cef0058b64c 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c
> @@ -13,6 +13,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/types.h>
> +#include <linux/units.h>
>  
...
> +	/* 12 bits signed value */
> +	switch (chan->channel2) {
> +	case IIO_MOD_X:
> +	case IIO_MOD_Z:
> +		offset = sign_extend32(((lo_val & 0xF0) << 4) | hi_val, 11);
> +		break;
> +	case IIO_MOD_Y:
> +		offset = sign_extend32(((hi_val & 0x0F) << 8) | lo_val, 11);
Can the mask and shifting be done with some combination of FIELD_PREP/_GET/_MODIFY?
See comment below.

...
> +static int inv_icm42607_accel_write_offset(struct iio_dev *indio_dev,
> +					   struct iio_chan_spec const *chan,
> +					   int val, int val2)
> +{
> +	struct inv_icm42607_state *st = iio_device_get_drvdata(indio_dev);
> +	struct device *dev = regmap_get_device(st->map);
> +	s32 min, max;
> +	s16 offset;
> +	s64 val64;
> +	int ret;
> +
> +	if (chan->type != IIO_ACCEL)
> +		return -EINVAL;
> +
> +	/* inv_icm42607_accel_calibbias: min - step - max in micro */
> +	min = inv_icm42607_accel_calibbias[0] * (long)MEGA -
> +	      inv_icm42607_accel_calibbias[1];
> +	max = inv_icm42607_accel_calibbias[4] * (long)MEGA +
> +	      inv_icm42607_accel_calibbias[5];
> +
> +	val64 = val * (s64)MEGA;
> +	if (val >= 0)
> +		val64 += val2;
> +	else
> +		val64 -= val2;
> +
> +	if (val64 < min || val64 > max)
> +		return -EINVAL;
> +
> +	/*
> +	 * Convert m/s² to g then to raw value
> +	 * m/s² to g: 1 / 9.806650
> +	 * g to raw 12 bits signed, step 0.5mg: 10000 / 5
> +	 * val in micro (1000000)
> +	 * val * 10000 / (9.806650 * 1000000 * 5)
> +	 */
> +	val64 *= 10000LL;
> +
> +	/* For rounding, add + or - divisor (9806650 * 5) divided by 2 */
> +	if (val64 >= 0)
> +		val64 += 9806650 * 5 / 2;
> +	else
> +		val64 -= 9806650 * 5 / 2;
> +	offset = div_s64(val64, 9806650 * 5);
> +
> +	/* Value is limited to 12 bits signed, return -EINVAL if out of range */
> +	if (offset < -2048 || offset > 2047)
> +		return -EINVAL;
> +
> +	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dev, pm);
> +	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	switch (chan->channel2) {
> +	case IIO_MOD_X:
> +		/* OFFSET_USER4 upper nibble is shared. */
> +		ret = regmap_update_bits(st->map, INV_ICM42607_REG_OFFSET_USER4,
> +					 GENMASK(7, 4), (offset & 0xF00) >> 4);
> +		if (ret)
> +			return ret;
> +
> +		return regmap_write(st->map, INV_ICM42607_REG_OFFSET_USER5,
> +				    offset & 0xFF);
> +	case IIO_MOD_Y:
> +		/* OFFSET_USER7 lower nibble is shared. */
> +		ret = regmap_update_bits(st->map, INV_ICM42607_REG_OFFSET_USER7,
> +					 GENMASK(3, 0), (offset & 0xF00) >> 8);
> +		if (ret)
> +			return ret;
> +
> +		return regmap_write(st->map, INV_ICM42607_REG_OFFSET_USER6,
> +				    offset & 0xFF);
> +	case IIO_MOD_Z:
> +		/* OFFSET_USER7 upper nibble is shared. */
> +		ret = regmap_update_bits(st->map, INV_ICM42607_REG_OFFSET_USER7,
> +					 GENMASK(7, 4), (offset & 0xF00) >> 4);
I see the register map for this chip is a bit odd. The above bit masking and
shifting can be easy to write once one is familiar with the part being
supported. Though, this really looks like one of the cases where we can declare
a bitmask and use FIELD_PREP (or even FIELD_MODIFY). Maybe something like
INV_ICM42607_REG_OFFSET_HIGH	GENMASK(7, 4)
INV_ICM42607_REG_OFFSET_LOW	GENMASK(3, 0)

INV_ICM42607_ACCEL_OFFSET_HB	GENMASK(15, 8)
INV_ICM42607_ACCEL_OFFSET_LB	GENMASK(7, 0)

reg_val = FIELD_PREP(INV_ICM42607_REG_OFFSET_HIGH,
		     FIELD_GET(INV_ICM42607_ACCEL_OFFSET_HB, offset));

Please, also take this suggestion to the other similar mask and shifting above.

> +		if (ret)
> +			return ret;
> +
> +		return regmap_write(st->map, INV_ICM42607_REG_OFFSET_USER8,
> +				    offset & 0xFF);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
...
> @@ -266,6 +454,8 @@ static int inv_icm42607_accel_write_raw_get_fmt(struct iio_dev *indio_dev,
>  		return IIO_VAL_INT_PLUS_NANO;
>  	case IIO_CHAN_INFO_SAMP_FREQ:
>  		return IIO_VAL_INT_PLUS_MICRO;
> +	case IIO_CHAN_INFO_CALIBBIAS:
Minor neat, if we move the line above up one line we can drop the line below.
> +		return IIO_VAL_INT_PLUS_MICRO;
>  	default:
>  		return -EINVAL;
>  	}
