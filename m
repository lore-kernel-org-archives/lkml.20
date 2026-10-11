Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B6E43DECD
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791727038; cv=none; b=hBuQmSIke0v0POnZdhOQ1EQp/rNq2HtC2tkIdlCUwvfcjJumO83sosP9/yJGZ5JJvIvUEGsJskyCn3lE270gNp4vAHhPQTbqEUKB0UfeFL9Yt/jdUu+9CoCoTF0jdqYCMdEjI23fDX809xRZrjodSzbHir3pZp5svxEIszX3dDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791727038; c=relaxed/simple;
	bh=Ik5NDt5jIIeGeRfX/c+iUHRmdwCHh0o9ZuKnZzKdiDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZJMtQZa9qGkSuic6Fii4Qlc884EOWTJHbCgCnASYstVqYVEfMtzPoV5ccfCmwCvJt33DLgHvFCaDxoBIn3pWdyAYs+OxUKVkY85ngU9a5Tez9GT78Rn/kz1Hqbr7ItIbQPcxh9W0yfzUSPT2xJ7Mz8JIqf4ZHJbW+nhUillsfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQpeKorA; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQpeKorA"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3515f9a5d25so3228855eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791727036; x=1792331836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=17EY7M/14x7XJdpJ3Z9hIYyDfBDKBQ/HjC+pGMLWuR0=;
        b=HQpeKorA6t6a0v7gwXiSkO1vG5iKi0EyaPPcfc4GcCy2NvRFDjz2w9tj1swH6ZVtAx
         Ft4KL9PxqHmSJHubOsghMbmpICFHMlgDIQi/rHz6eH/ophbK0gtuidZGpz0SRsodncfm
         0W6BTXch8YOTlz78AyL3vNaS9HCEYP9bHc0uwRdRyZD5vpRb25JDOJaI4p4bFxazgQeg
         1wUqV7us/6icuP0m6bTpTFmvxgj7X0qE8FL94eIlagAZH8cpH1lfOkfuP882Rv9OJO3m
         nsE9s0A1wDqi7x2mMQHoEJxRYzdf+a/YY/CfKahsBEp/IQgx2400o3cUBnjn11TuWde+
         9viw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791727036; x=1792331836;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=17EY7M/14x7XJdpJ3Z9hIYyDfBDKBQ/HjC+pGMLWuR0=;
        b=y7jabzI93m3zSP+XNIfzBGlQscm/YAXB14ML6/pU9fTvq0H3S42FDsXARms3JaXZ2Y
         Gdqb7r+BaJ5aXerzS0hCUyXF6yyhnlmm+anZduVJCLYGKS+fcKur9mYfJYew5ATEdYIs
         B7UWCi6bNdRU5Aiz/U2yhbeGZxYSUQKlOIt0GOLXJp6GVQUoutTsudtRY8K8wI79sT3U
         qr/z3beJzwT/ysz4TDm+p6LnlJwrQGKaLNSzUDoNIgyKKdQMUw8p7PN9RUCJHRUxwbJz
         U6Kp7SG7pyV3qpW3DeFB+76aLrdjOVeqJvXzQ5nPPUpKEy2178tita9uqKGoLcuGbXa5
         ozdg==
X-Forwarded-Encrypted: i=1; AKwUvBwgtTCRSgDvlb0js4XMB2O7YHimRt796iHyT5ijeNx/rnp031eIwmi7XVtUonWF0wkRBA1Ib2yQ+ZpFi70=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzO6Ms4SK7QgdcTOULIKClVR0DLU91p+iokaLdiWMRVQMOK9q8
	DnjYCpUyNCqDLUkNi2YsE+hyQInvyAupq9EQ+ASh+4znwrvz3o/XfXHY
X-Gm-Gg: AYBFou2XGWyp8qHViHlgLiNByBUvgAAAu5h6c4wLU9c7EgO6sfHLBJniHtr607Rp+n2
	u/UXQbSh1/wKemUKfM8vVQn6nKGdj1AAqmvnwaC+BBhyjXNlsmxKDhATcOhgDSpkEVq7ek/260r
	ZXFbKu9pv8wC4obXCTFl4CQYU3sa/hNaP95lXb6kADahbHm2Nacxd6nPFeuhBoPb5ndUCiYnDdG
	vQ0yqdsArswKfyhZ/cM0ARKQ6JElYTHXQ08l+9CqUn3eAdcL3TnCDCMZneJ5doy+eXxLtjbZlvq
	NIgWU9jN12aPboFy2iDyQboqM+Jrn6fl6Bp6/KOlD5XL/5j/qAyHv2O7dKFM9EIN1I1ZrEcutXs
	dv71Y+KFbK8crCyu96AXUY/XrsPId++GO8lmp1WV/1B0vh3W/yH5hWaM5B3+r5vwOPIkaA467Lc
	YnunDNEwkSnTRmQOEWZ4bP8Q57tTEQ6DfFxcRwptrsV/gixBBduh4Yjj+ksEYK3ZRXy/q94+TBj
	/mU
X-Received: by 2002:a05:701b:42c1:10b0:151:2068:e81f with SMTP id a92af1059eb24-16a5e873912mr9741480c88.27.1791727035764;
        Sun, 11 Oct 2026 06:57:15 -0700 (PDT)
Received: from localhost ([2804:30c:96c:bf00:7844:c38c:894:4054])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1dd57d0sm22417351c88.8.2026.10.11.06.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 06:57:14 -0700 (PDT)
Date: Sun, 11 Oct 2026 10:57:34 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Puranjay Mohan <puranjay@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] iio: temperature: tmp117: add support for HIGH and
 LOW alerts
Message-ID: <asuVzmd1L1hn_4ux@debian-BULLSEYE-live-builder-AMD64>
References: <20261005-add-tmp117-notif-v1-0-c6cef6fad64c@bootlin.com>
 <20261005-add-tmp117-notif-v1-2-c6cef6fad64c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005-add-tmp117-notif-v1-2-c6cef6fad64c@bootlin.com>

On 10/05, Thomas Bonnefille wrote:
> The TMP117/116/119 chips allow the user to set an alert if the
> temperature reaches a HIGH or LOW limit.
> 
> Add support for setting the high and low alert limits.
> An IIO event is generated when the temperature crosses either limit
> thanks to an interrupt on the Alert pin.
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
...
> +static int tmp117_read_thresh(struct iio_dev *indio_dev,
> +			      const struct iio_chan_spec *chan,
> +			      enum iio_event_type type,
> +			      enum iio_event_direction dir,
> +			      enum iio_event_info info,
> +			      int *val, int *val2)
> +{
> +	struct tmp117_data *data = iio_priv(indio_dev);
> +	s32 ret;
> +	u8 reg;
> +
> +	switch (dir) {
> +	case IIO_EV_DIR_RISING:
> +		reg = TMP117_REG_HIGH_LIM;
> +		break;
> +	case IIO_EV_DIR_FALLING:
> +		reg = TMP117_REG_LOW_LIM;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (info != IIO_EV_INFO_VALUE || type != IIO_EV_TYPE_THRESH)
> +		return -EINVAL;
> +	ret = i2c_smbus_read_word_swapped(data->client, reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * Report the threshold in millidegrees Celsius as an exact fraction:
> +	 * value = raw * TMP117_LIMIT_LSB_NUM / TMP117_LIMIT_LSB_DEN.
> +	 */
The IIO temperature channel provides single-read data in (raw) device units
(i.e. not scaled to mili degrees Celsius). Now, in contrast with the single-read
interface, the event configuration being proposed reads/writes data in milli
degrees Celsius. And, since the event ABI doesn't yet provide clear indication
about IIO event data unit types, users might get confused when using the
different interfaces.

There are two main options for avoiding/mitigating the potential interface mismatch:
(1) provide/get raw device units in tmp117_read/write_thresh().

(2) add IIO_CHAN_INFO_PROCESSED to the IIO channel mask and implement the
handling for the channel _input interface to provide single-read data in
milli degrees Celsius units. Though, this option will also need an updated
IIO event interface. Probably something like [1] or [2]. I'll respin on that
next week. The event specs would be updated to something like


+static const struct iio_event_spec tmp11x_obj_event[] = {
+	{
+		.type = IIO_EV_TYPE_THRESH,
+		.dir = IIO_EV_DIR_RISING,
+		.unit = IIO_EV_UNIT_PROCESSED,
+		.mask_separate = BIT(IIO_EV_INFO_VALUE),
+	},
+	{
+		.type = IIO_EV_TYPE_THRESH,
+		.dir = IIO_EV_DIR_FALLING,
+		.unit = IIO_EV_UNIT_PROCESSED,
+		.mask_separate = BIT(IIO_EV_INFO_VALUE),
+	},
+};
+


[1]: https://lore.kernel.org/linux-iio/cover.1768759292.git.marcelo.schmitt1@gmail.com/
[2]: https://lore.kernel.org/linux-iio/e359fa003ebc61c8b0e37ba9810a04c70e5a300e.1791437050.git.marcelo.schmitt@analog.com/

With best regards,
Marcelo

> +	*val = sign_extend32(ret, 15) * TMP117_LIMIT_LSB_NUM;
> +	*val2 = TMP117_LIMIT_LSB_DEN;
> +
> +	return IIO_VAL_FRACTIONAL;
> +}
> +
> +static int tmp117_write_thresh(struct iio_dev *indio_dev,
> +			       const struct iio_chan_spec *chan,
> +			       enum iio_event_type type,
> +			       enum iio_event_direction dir,
> +			       enum iio_event_info info,
> +			       int val, int val2)
> +{
> +	struct tmp117_data *data = iio_priv(indio_dev);
> +	s64 tmp;
> +	u8 reg;
> +
> +	switch (dir) {
> +	case IIO_EV_DIR_RISING:
> +		reg = TMP117_REG_HIGH_LIM;
> +		break;
> +	case IIO_EV_DIR_FALLING:
> +		reg = TMP117_REG_LOW_LIM;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (info != IIO_EV_INFO_VALUE || type != IIO_EV_TYPE_THRESH)
> +		return -EINVAL;
> +
> +	/*
> +	 * The threshold is passed in millidegrees Celsius as
> +	 * value = val + val2 / 1000000 (val2 holds the fractional part, with
> +	 * the sign taken from val). Convert it back with the same LSB ratio:
> +	 * raw = value / (TMP117_LIMIT_LSB_NUM / TMP117_LIMIT_LSB_DEN).
> +	 */
> +	tmp = (val < 0) ? (s64)val * 1000000 - val2
> +			: (s64)val * 1000000 + val2;
> +	tmp = DIV_ROUND_CLOSEST(tmp * TMP117_LIMIT_LSB_DEN,
> +				(s64)TMP117_LIMIT_LSB_NUM * 1000000);
> +	tmp = clamp_t(s64, tmp, S16_MIN, S16_MAX);
> +
> +	return i2c_smbus_write_word_swapped(data->client,
> +					    reg, tmp);
> +}
> +
