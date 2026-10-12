Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251BB48EC6F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817769; cv=none; b=HIkQWoOb0lxyG9xI6MGgm5h4d+KQOJjGYhtubmNwur5lCbFb/3pJZJuWA8BevOSDaP3ydw6PMYRm8I+mWJPyc7uQPUbIileU19qZKRwcC+nMhsqyjDv+Pyz7A3SiNbj1blJMpnTyBoy5NViZPZmG2jIeOljLrCt02/8NKpYvNFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817769; c=relaxed/simple;
	bh=6ZzGWj2KyFb3x1LVvqRQFc3xOZD6b8MHnWTNwekNgUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ep+0UDTORsNACbqMUF32WmdqxK6kYw9Up2aOLPvS5NoFpsbYRXK0PbrscTGVbPjinXTHZnPGYSjymHKW8aCdZPr41qWA7sR1JDP57PFvpbpBBMR0kd/iGVG6CHE6qQt5p98PlIC59he0EDKBjmA0onU6QLVw2OihIglj2f0cXro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dBnKknMS; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBnKknMS"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so3186167eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791817767; x=1792422567; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G+8cKI+uUXNgJDViP9p4hXOsSaebL/Io/WyETAiUv4E=;
        b=dBnKknMSGi2LmRV3Uwl//b96Lql/VsYWIWDhkaG9POGsmoQvXdP/plAgVQw2xQubcl
         ZpjDjnKeBTbcSLCRhBAtKCsDXPBQ9JzorekQUKbu4WHbw2fKL2hzcqWrBUKXf+bEa72P
         O7gyJRGGTO1nPwEzLq7VeWDRoyVdEI3krI2cRVmr2djoRzHjNcqirFNLgrsAMYsK3aQR
         mHvui5iUUzmNrby7Rfra3L5tB7axcsRHBYSkqIwmToLm06r+zHRihRRaG6sbFHu6Kr4K
         CLAO3bLLbm4ks2jzgzQ64J0EMJBa9IFeW8CiZIz+KU0Bd6Ah9/fGepUz2/yBhGI9EOmS
         hzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791817767; x=1792422567;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G+8cKI+uUXNgJDViP9p4hXOsSaebL/Io/WyETAiUv4E=;
        b=u5yFyIVCGJt4lxA+1aelr4AlCTXuPQAyMySuezRZrKQ12m5T42MmyEyZVh4LPETmw0
         uOOSgrXyQSRjKkVI6M2mPjckIfgJPwaKK489iTk2oN0gV/ykCwFKI+/Oz2UNvJBFOG/s
         uurdyedT5d+bS5nO+eSmR3vNqs4GPA3UyWJLI9GUyKXtE8ejM7VgKmvJ7TrEDf261HJ2
         VpnKE8+g8GGYUukhVVM6ewT1TjN/kJh2FQsVXDJtKwcp4Y0RpTZwSZDi1AbKNLoHWnmL
         5fJksyXgDGgVW9Mi3+YulFtPgyyxTfcCBc/qCJ8+RxqAnuK2zGiiAvKeo0wy34oOEqcx
         j8KA==
X-Forwarded-Encrypted: i=1; AKwUvBw2ieToHhiWdrpIKlB26YsH6PI2i1FCPK/pR1TuSbBQByrhbExxBI0F83N8yfQPWZMvnv7cvQsDghi2iWM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMcSVQnQPb1cwVPBq1SI40PZsx5DVV9XRvpvkA2z4qFgfA/091
	f2QHR3Kxdn2NSvBumyrHEg2c9kRO9p+FxOk7ukYGGkkSyhY5YDNTu/80
X-Gm-Gg: AYBFou1nW7T7LCJW9PvzwH1crAc4Qsb1Bry0jQCikkSQwHM3Okzq2v2IhGPY9QqkXZ1
	YmJrzeRWaq/b9/VAcJ+Klqokla5STFWQlEUuZjFpvpcraXTuDShi7HLrs4KiD/c4RfYJPeboc+r
	muwVb9ccSubRAHxEzieVxz27uUQ/JDhZOcd7DIsaD3Jdz+ceki6DqYccZsqpdf1Yvf4mjVQtbpQ
	u9CGQjxHyDTXCx09aY527hFR2ixwKaXjyKlcgkfFfT+jtA5z8PpwKHQi1UT89fG1+N2DPNxSB3r
	Iucu7ynhMDJ8iC3MYJz9kvUiIjMlN0V3tSRAzJq8eyph6XGjpT3R1oECKPc5z8TLForFPcuQUwE
	zOlKAHAXCYtXdzgvlVfxX7cI1y6ELufK+/Txo2rIYO5/VGY7uTTKwEf29+8ZJUfpeAwpFe2iTG/
	xEBbX2aP8f0QWuNIKkxnv/cRmy2kgqOdVQdtTyip8gX3AQXXv29n0Xa4+fcJX9vdkSgcnxY1up1
	+Jc
X-Received: by 2002:a05:7301:4e88:b0:35a:efce:6190 with SMTP id 5a478bee46e88-35aefce65c3mr4495527eec.28.1791817766765;
        Mon, 12 Oct 2026 08:09:26 -0700 (PDT)
Received: from localhost ([2804:30c:96c:bf00:7844:c38c:894:4054])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358ee8a3387sm23709722eec.15.2026.10.12.08.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 08:09:25 -0700 (PDT)
Date: Mon, 12 Oct 2026 12:09:47 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Muhammad Abu Bakar <m.abubakar365@yahoo.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v6 2/2] iio: pressure: add Sensirion SDP31 driver
Message-ID: <asz4O0zceqa5lz8m@debian-BULLSEYE-live-builder-AMD64>
References: <20261007205104.4694-1-m.abubakar365@yahoo.com>
 <20261007205104.4694-3-m.abubakar365@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007205104.4694-3-m.abubakar365@yahoo.com>

On 10/08, Muhammad Abu Bakar wrote:
> Add an IIO driver for the Sensirion SDP3x family of differential pressure
> sensors (SDP31, SDP32 and SDP33). The devices are accessed over I2C and
> report differential pressure and temperature. Each measurement is
> validated using the sensor's CRC-8 checksum. The scale factor is read
> from the sensor at runtime, so all three parts are supported.
> 
> Tested on an SDP31 connected to a Raspberry Pi 4 I2C bus.
> 
> Assisted-by: LLM
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Muhammad Abu Bakar <m.abubakar365@yahoo.com>
> ---
...
> +static int sdp31_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct iio_dev *indio_dev;
> +	struct sdp31_data *data;
> +	int ret;
> +
> +	ret = devm_regulator_get_enable(dev, "vdd");
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable regulator\n");
> +
> +	msleep(SDP31_POWERUP_TIME_MS);
> +
> +	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	data = iio_priv(indio_dev);
> +	data->client = client;
> +
> +	ret = devm_mutex_init(dev, &data->lock);
> +	if (ret)
> +		return ret;
> +
> +	DO_ONCE(crc8_populate_msb, sdp31_crc8_table, SDP31_CRC8_POLY);
> +
> +	ret = sdp31_read_scale(data, &data->dp_scale);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to read from sensor\n");
> +	if (!data->dp_scale)
> +		return dev_err_probe(dev, -EINVAL, "invalid scale factor\n");
> +
> +	indio_dev->name = "sdp31";
Hmm, I'm not sure whether it is a big deal or not but, the hardcoded name might
cause confusion if the part connected is sdp32 or sdp33. That's because the
device name will be sdp31, but the scale will be SDP32 scale for differential
pressure (or SDP33 scale if one of those would be connected). The full
disambiguation solution would probably be to read the product identifier bits
and match those against a table of supported devices. It could have some sort of
chip_info struct to hold the device name and maybe the pressure scale as well.
That will probably require some boilerplate code that might not have been
necessary otherwise.

The other parts of the device driver look good to me. So, if the naming thing is
not needed,

Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>

> +	indio_dev->info = &sdp31_info;
> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +	indio_dev->channels = sdp31_channels;
> +	indio_dev->num_channels = ARRAY_SIZE(sdp31_channels);
> +
> +	return devm_iio_device_register(dev, indio_dev);
> +}
> +
> +static const struct i2c_device_id sdp31_id[] = {
> +	{ .name = "sdp31" },
> +	{ }
> +};
