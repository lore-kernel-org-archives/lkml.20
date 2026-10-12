Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8159D4F30F2
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791842130; cv=none; b=joh02ee2gUrB/FtOlwlMnt3mWKrbwSDDlj+Xd5+24oYnvXKJ5/JTvujHj/zK7SYUrNuUy71z7CxPbHNLKOuADxjjevwUS6o7flhD15KKiumuPzUu94tOJ9Ip7geR8zLoEJc36Lw9CklMeihvTp4TSyfZ2G7t7dlQlkatfl63/2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791842130; c=relaxed/simple;
	bh=v7mSnixZGMtaMz8xX1r2GGHZjopVTLHny2iDACGM2iU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ltdxGMZuNVbW0zn95grBYNhikxySoav0Z3Tv55Y4JB8Q71m4nGnGIyvtcklBdVwEojKWH8e/8FdNX4J3icYODrSPrNbNaYl5ckSBTYzhTxgEQ+BlBo86JolqTGcCvS5qvyR9cZbTTC3z/Mv9BopWudCN1utwIcy9XfnTq1wm0O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WoPWWc5z; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WoPWWc5z"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1517bda04a0so1164107c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791842127; x=1792446927; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kbVgtJX2q8ylQI0zobsXx8l1hr9HiDdvcbYq5xBa+EA=;
        b=WoPWWc5zM6PBxHQn64cGSZEAn0SOe8cirC7Gdh6qQofC2tVqz+PrkISD46hVEKYB2m
         QXKUxOl1tGr5fAaCTgd23MkQi+DcUubTEkTb+R9iUoUmi9Q2eapYk0/gaSCr+21UdmKa
         /bTe9s0GabJIzzi2OUh9f5SgvBgk1q7U9mIrUetN4sNZZyoRJOjpksNEsx2/r+KPixIc
         v7Jp0ZZwJK7gx22H5w31ZOgNCGymyiDzC0mJnfvN++qgIesDw2RGCKh6N9rm4YjWMKKo
         9+wTu2YoZKyqH2kt1Zs7aDV8R6mCjCAI8M6ldtds9pEqknmMwKOhuwkzDJcmGYFDHm4b
         X1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791842127; x=1792446927;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kbVgtJX2q8ylQI0zobsXx8l1hr9HiDdvcbYq5xBa+EA=;
        b=bSQCDr0amD1v9XWdCXW8s2PsmwsFS8lbJvUy1dd7HlPzIaBeSus5TgnHetjzmCgrHD
         Y1eYf6Ln/S4Kflv3bhcuVyULyEkTGTkTQJCzr41If4d9PgmUrEf0m/rKet43pD6YGk1O
         TkuvACcZAg6e2d3qH2QXqVlIaRs7h2RHui+cX3evWrxblKtP796/X2oE61aX4Re/MajC
         pDOx7XttNVQoWjlgZf3Swn3wkdg4P5V5XOWpcufr5hVT9VKI7zQghRs6ClB3wZc9jXgL
         HkYr4Wfzv0UsRo39AaZ5KHx4+/QiAG5oPYQJPqDvVk5wbHNqYoTaHizpJJOwcg0A7lmv
         yJOw==
X-Forwarded-Encrypted: i=1; AKwUvBzliXuvcJc/mh1ZapbKf39dv6gUs7tKuU6GHS+4JZWd7zcP09HNEEAUi6tuRwVue8ZOs7q3gEiU/w1TpUE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsFN8yRWgUljiSyN4g08JaD6p3O6cFwAiq6lWi2TlHPhsnhVAW
	2bgmEqaX3PhSsHDmduRjCK4Tebq5SGprD0rqDYm46qK8cuflL8txpHJW
X-Gm-Gg: AYBFou2Hq/mnDcS+SO5emHNaoaZt2EXHRsK2fGQ1vejNLd6hzUiwsoxTaiiz/fjPmYt
	C/61nb/Ks7LkCKxaz9vicrCx8TpOi9nq+jRlv1qgIP+jsWL3x7gCakDl2t8nSMiziAHari0EcVN
	KJLgZxd/RYBQPw5RDvpG1eCD0aNPKeMVJ7Hyl5xgSjwlZ5eKPajyUwzy4RbGDAk0paOzhFM0owM
	38MWBkGSGBf8+xHULDm+RboIVw9zzf5N/TWOraJ+0syOjChM/5pcEyYXt4OahpBTZ9tzWNnrEcB
	1f8kBzmL0E/9yCwqo+PIOBnRf0NYIvO4nxOYm8tjkCEe/vz/co+foKBbfIEbW5pSYujvLim6DIG
	Jh9eGPsZFnzB8DPW8iX5GZ1DVspfAHzXdAWz9BvWTGUI3/gkwAPwcfNs06KCHv4HpyiPrCuJkwy
	/8wX/EFsCyl9mnHFffk+wx3cWZt6SW8hSqNeHjpEcmJHIbW2wh64fysuHM/NTrrZkMT0F3EBgfn
	A0sXw==
X-Received: by 2002:a05:7022:285:20b0:15d:f053:18b6 with SMTP id a92af1059eb24-16a5adfbebdmr13879181c88.9.1791842126992;
        Mon, 12 Oct 2026 14:55:26 -0700 (PDT)
Received: from localhost ([2804:30c:96c:bf00:7844:c38c:894:4054])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1746482c978sm12428271c88.13.2026.10.12.14.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:55:26 -0700 (PDT)
Date: Mon, 12 Oct 2026 18:55:47 -0300
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
Subject: Re: [PATCH v6 6/6] iio: imu: inv_icm42607: Add accelerometer
 calibbias support
Message-ID: <as1XY5EfKwfnb2DX@debian-BULLSEYE-live-builder-AMD64>
References: <20261009-b4-inv_icm42370p-v6-0-e53884f185ff@axis.com>
 <20261009-b4-inv_icm42370p-v6-6-e53884f185ff@axis.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261009-b4-inv_icm42370p-v6-6-e53884f185ff@axis.com>

On 10/09, Kanak Shilledar wrote:
> Expose IIO_CHAN_INFO_CALIBBIAS on the accelerometer channels. The
> registers are stored in MREG1. The calibration bias is written to
> OFFSET_USER4 to OFFSET_USER8 registers in MREG1. Reject the out of
> limit calibbias values instead of clamping it.
> 
> Datasheet: https://www.invensense.tdk.com/en-us/products/3-axis/icm-42370-p
> Datasheet: https://www.lcsc.com/product-detail/C5129967.html
> Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>
> ---
...
> +static int inv_icm42607_accel_read_offset(struct inv_icm42607_state *st,
> +		struct iio_chan_spec const *chan, int *val, int *val2)
> +{
> +	struct device *dev = regmap_get_device(st->map);
> +	unsigned int msb_reg, lsb_reg, nib, byte;
> +	int offset;
> +	s64 val64;
> +	s32 bias;
> +	int ret;
> +	u32 raw;
> +
> +	if (chan->type != IIO_ACCEL)
> +		return -EINVAL;
> +
> +	switch (chan->channel2) {
> +	case IIO_MOD_X:
> +		msb_reg = INV_ICM42607_REG_OFFSET_USER4;
> +		lsb_reg = INV_ICM42607_REG_OFFSET_USER5;
> +		break;
> +	case IIO_MOD_Y:
> +		msb_reg = INV_ICM42607_REG_OFFSET_USER7;
> +		lsb_reg = INV_ICM42607_REG_OFFSET_USER6;
> +		break;
> +	case IIO_MOD_Z:
> +		msb_reg = INV_ICM42607_REG_OFFSET_USER7;
> +		lsb_reg = INV_ICM42607_REG_OFFSET_USER8;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dev, pm);
> +	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	ret = regmap_read(st->map, msb_reg, &nib);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_read(st->map, lsb_reg, &byte);
> +	if (ret)
> +		return ret;
> +
> +	/* 12 bits signed value */
> +	if (chan->channel2 == IIO_MOD_Y)
> +		raw = FIELD_PREP(INV_ICM42607_OFFSET_MSB,
> +				 FIELD_GET(INV_ICM42607_OFFSET_USER_NIBBLE_LO, nib));
> +	else
> +		raw = FIELD_PREP(INV_ICM42607_OFFSET_MSB,
> +				 FIELD_GET(INV_ICM42607_OFFSET_USER_NIBBLE_HI, nib));
> +
> +	raw |= FIELD_PREP(INV_ICM42607_OFFSET_LSB, byte);
> +	offset = sign_extend32(raw, 11);
> +
> +	/*
> +	 * Convert raw offset to g then to m/s²
> +	 * 12 bits signed raw step 0.5mg to g: 5 / 10000
> +	 * g to m/s²: 9.806650
> +	 * Result in micro (1000000)
> +	 * (offset * 5 * 9.806650 * 1000000) / 10000
> +	 */
Maybe add a comment here highlighting that this is an exception among IIO ABI
and provide an additional patch extending the note on in_accel_x_calibbias ABI
doc to include icm42370. Having to amend the ABI doc that way looks to have been
an unfortunate need (also according to commit 69c93a7df74b).

icm42370 seems to be similar to icm42600 so extending the exception might be
okay in this case. Creating new ABI is probably too much.

> +	val64 = (s64)offset * 5LL * 9806650LL;
> +	/* For rounding, add + or - divisor (10000) divided by 2 */
> +	bias = DIV_S64_ROUND_CLOSEST(val64, 10000L);
> +	*val = bias / (long)MEGA;
> +	*val2 = bias % (long)MEGA;
> +
> +	return IIO_VAL_INT_PLUS_MICRO;
> +}
> +
> +static int inv_icm42607_accel_write_offset(struct iio_dev *indio_dev,
> +					   struct iio_chan_spec const *chan,
> +					   int val, int val2)
> +{
> +	struct inv_icm42607_state *st = iio_device_get_drvdata(indio_dev);
> +	struct device *dev = regmap_get_device(st->map);
> +	s32 min, max;
> +	u8 msb, lsb;
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
Unless Jonathan thinks it to be too verbose, we can also have an ABI comment here.

With the ABI exception somehow highlighted,
Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>

> +	val64 *= 10000LL;
> +	offset = DIV_S64_ROUND_CLOSEST(val64, 9806650 * 5);

With best regards,
Marcelo
