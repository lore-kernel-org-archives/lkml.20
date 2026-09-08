Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B5E39D6FC
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854491; cv=none; b=eKYi3Z1iFzD6w+v2K4DsBBq+MMmZORt99ffoB0gVtN/aa3om4ohN2MxD7vQUGk3Hzex2vbubTFiACHDU034gr8kdxeCbDyp9uNpH3YpPeNrQXYmZlfjkM6E0bTcaHiWb2oY9f3cUcMjbfwy9Mi5xuVc4V/fhZlGgEQLIMm7uLwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854491; c=relaxed/simple;
	bh=z623OSOb6uOq/0jf/wjVHRqGtaT8xKUfonIY60W2fx8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M74zBh0kKxMq54S3S43oW6XKYUOulojIXgHe/FGbwz5XC1Txpbdg8qfz7opRx5juui89yvzEt488AG5V0zb4uB0U37Ro1AcF2IdjfuprXXFuXFS1ACOmYjPaOZX73uj6beil35T53I1L8K5Gpp+wXiCa0J8hzVCTLlvsfrAmjCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sAOUHU77; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sAOUHU77"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so35095415e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 01:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788854488; x=1789459288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xDQnWL+09MRQg3JHhpcIAGJ0gQMTwutt9tXBZmD4GyU=;
        b=sAOUHU77g8AmRqosJMUKGE6wp56zgS3feonGPeYq1q4FY/1YCdgjZS5gEvJxmufqxJ
         7yd7AVxh4X8GOrnw7+c8/2YcgrFtCIJ8+cnoNrMFp51upPRyR/Yz6skp1azin1z1JiPP
         YpbWNAmD2oG7FXXgcFUZrlMwcHOpr7Rtp8Pa+tSG+Jvwd8wrmGiP08Db39A7fAY5/gRA
         gwTiuRfDK0Eg9UQcfuXD+XubUE6EzgqpHRWjHrywX90YCHsjYAGMRPYKe16RiCWnsUst
         6F3sY8vcstNKstWitiS7eMYoC9zi/JUFBLqv5Z7j9JbGPhxxiN88aKL/rz/wx8F5FCOu
         7JvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788854488; x=1789459288;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xDQnWL+09MRQg3JHhpcIAGJ0gQMTwutt9tXBZmD4GyU=;
        b=KiPHo6D1HG+9REjgYgLK/qTqaAyB1pSXxH7EbQhTQQoBXRgBWslPqUs9hTuNzXBWNK
         t7fBzh5y8Nx8U9zNV6CGIsVuF1mzU/ghWX9zu6Gi5AMK1CG5ZLxC8+wkCc7cn7MiIALD
         Ea7suG3sdY/4G+VZsYkKH0Y0aopIIgiFFLJvDVELoh7j6O/F7lBJezPrNPYqsaMOMDrQ
         inRL1NVxsiXFyY21uNWRcRyYzAwQwom7ZUx5WAsAlDC1XpqJDEOO7FrHv1MAfTfLoZNL
         UMnj6L02qMEt8B6MysF/ssXXlCWqWrMvD6CIOfs8eVJCY5LdqPkzPiPeXl0Rs1o/a8o1
         3aRw==
X-Forwarded-Encrypted: i=1; AKwUvBxn1J4QCnzp+x56XUm25u6faHJunhLGVdQg85jRdvJSTICnHVTouhxAIgMFUOFRqNNPyt4da8N9UoBFWuA=@vger.kernel.org
X-Gm-Message-State: AFuF++m0yscRhxLs+E9yGKZvSbaS1QcMHoGe2DjBTQzyled4/T0FtUWP
	g1B8SF+MA8NvHDgoF3LkFYQu/ZoipsRfuXPINxBXBAE6jqjKxrx6Sqdi
X-Gm-Gg: AYBFou0LCy5iIFsBxtluIeFrUayGxJkpNlQ3KHaGotlDw+/K0VDuk59opyhrvOjyYiO
	WmHQfbEyILJ8sqYDscfgVahtWZHoNcKOF5FNUdjgTmv7ZAHKjGr/pH2czdqLtp+6rbtjTlGfwRR
	wuGi5ydub1bUo+5N2v6xJL0ZrJcjy8IaVN/C1QZDO95yOywvJN0IF4fXHBGf+wDnKmYJ8UR7Jco
	fMmcP1Dy2sN48sCHnt5bkw9EzK4MyRQG8wbzji1b3Q4odMH42A24fVRb+ZVtL2/MjZbux0leXF0
	yXDG9gkXuoX4qNrDdqRsXqwGSUsmZoZWiQqr+8TsGwEr/fTt1rjvEFoPtBuR6G+3N8tluK+aqfi
	HX3WwszlezKYmWa8QhffCfMj1SjErNyp++SErfZD5CO16cw8jWrsBF4MHlmEjXf9pg3nrXI3DjK
	reC0vCvhS8p08cmz5SGTJ/9NaqtS9zlv4pWTQdV2DCsKYOv2yhn0yLSmD6nTYhRrFfH06a5AvZ+
	PxnX1m9/LgClLOurb0Gkb6p3bvFPzUs33dESXQMutWmTp7eHyyXTEmIhkYFfLRZTgJmXxns9ZPY
	mxjRwGIXdlu1tCQ4R7lL+QBjayGn18TokeBO7yb+klTmvRoVbV09AQ6mtSNiy0MLkpybvhQzHpL
	/CGFDYdtoWzJxIoXpncnIyWjSPhJWEaw4LX/DrlylXKW7jfPlGMil49kAMOfyJMWIIyKUtHYasa
	3ARnGr
X-Received: by 2002:a05:600c:3b07:b0:49c:fa20:cbfb with SMTP id 5b1f17b1804b1-49cfa20cd04mr250384235e9.18.1788854487057;
        Tue, 08 Sep 2026 01:01:27 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75ce49esm641964095e9.1.2026.09.08.01.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:01:26 -0700 (PDT)
Date: Tue, 8 Sep 2026 10:01:23 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Chang Yu <marcus.yu.56@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shi Hao <i.shihao.999@gmail.com>, "Jose A.
 Perez de Azpillaga" <azpijr@gmail.com>
Subject: Re: [PATCH v2 2/2] iio: light: add AS7343 multi-spectral sensor
 driver
Message-ID: <20260908100123.00005af7@gmail.com>
In-Reply-To: <20260907210042.32552-3-marcus.yu.56@gmail.com>
References: <20260907210042.32552-1-marcus.yu.56@gmail.com>
	<20260907210042.32552-3-marcus.yu.56@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Chang,

Please check out Sashiko's review, there are some PM runtime things that
should be resolved + some comments inline.

https://sashiko.dev/#/patchset/20260907210042.32552-1-marcus.yu.56%40gmail.com

Thanks!

Josh

On Mon,  7 Sep 2026 14:00:42 -0700
Chang Yu <marcus.yu.56@gmail.com> wrote:

...

> +#include <linux/array_size.h>
> +#include <linux/bitfield.h>
> +#include <linux/dev_printk.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/pm.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/sysfs.h>

+ bits.h, types.h, <asm/byteorder.h> (asm headers go separately, as IIO headers).

> +
> +#include <linux/iio/iio.h>
> +

...

> +struct as7343_data {
> +	struct regmap *regmap;
> +};
> +
> +static int as7343_read_raw(struct iio_dev *indio_dev,
> +			   struct iio_chan_spec const *chan, int *val,
> +			   int *val2, long mask)
> +{
> +	struct as7343_data *data = iio_priv(indio_dev);
> +	int ret;
> +	unsigned int unused;
> +	u16 result;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW: {

The device should resume here, otherwise you'll be reading while suspended.

> +		/*
> +		 * Reading ASTATUS latches all data registers to this read.
> +		 * We don't care about the returned saturation/gain status for
> +		 * now.
> +		 */

Sashiko points out that a mutex here would come in handy. If you're going to add
a mutex, use the guard(mutex) macro for automatic unlocking on scope exit.

> +		ret = regmap_read(data->regmap, AS7343_ASTATUS, &unused);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_bulk_read(data->regmap, chan->address, &result, 2);
> +		if (ret)
> +			return ret;
> +
> +		*val = le16_to_cpu(result);
> +		return IIO_VAL_INT;
> +	}
> +
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static const char *as7343_channel_label(struct iio_chan_spec const *chan)
> +{
> +	switch (chan->channel) {
> +	case AS7343_CHAN_IDX_FZ:
> +		return "FZ";
> +	case AS7343_CHAN_IDX_FY:
> +		return "FY";
> +	case AS7343_CHAN_IDX_FXL:
> +		return "FXL";
> +	case AS7343_CHAN_IDX_NIR:
> +		return "NIR";
> +	case AS7343_CHAN_IDX_F2:
> +		return "F2";
> +	case AS7343_CHAN_IDX_F3:
> +		return "F3";
> +	case AS7343_CHAN_IDX_F4:
> +		return "F4";
> +	case AS7343_CHAN_IDX_F6:
> +		return "F6";
> +	case AS7343_CHAN_IDX_F1:
> +		return "F1";
> +	case AS7343_CHAN_IDX_F7:
> +		return "F7";
> +	case AS7343_CHAN_IDX_F8:
> +		return "F8";
> +	case AS7343_CHAN_IDX_F5:
> +		return "F5";
> +	default:
> +		return NULL;
> +	}
> +}
> +
> +static int as7343_read_label(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan, char *label)
> +{
> +	const char *name;
> +
> +	name = as7343_channel_label(chan);
> +	if (!name)
> +		return -EINVAL;

A blank line here would be better.

> +	return sysfs_emit(label, "%s\n", name);
> +}
> +
> +static const struct iio_info as7343_info = {
> +	.read_raw = as7343_read_raw,
> +	.read_label = as7343_read_label,
> +};
> +
> +static const struct regmap_config as7343_regmap_config = {
> +	.name = "as7343",
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = AS7343_MAX,
> +	.reg_format_endian = REGMAP_ENDIAN_LITTLE,
> +	.val_format_endian = REGMAP_ENDIAN_LITTLE,
> +	.cache_type = REGCACHE_NONE,
> +};
> +
> +static int as7343_setup_device(struct device *dev, struct as7343_data *data)
> +{
> +	unsigned int val;
> +	u16 step;

__le16 instead of u16.

> +	int ret;
> +
> +	/* Power on */
> +	ret = regmap_set_bits(data->regmap, AS7343_ENABLE, AS7343_ENABLE_PON);
> +	if (ret)
> +		return ret;
> +
> +	/* Need to set REG_BANK to 1 before we can access ID */
> +	ret = regmap_set_bits(data->regmap, AS7343_CFG0, AS7343_CFG0_REG_BANK);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_read(data->regmap, AS7343_ID, &val);

You should check the value of ret as well in case of a regmap failure.

-- 
Kind regards,
Joshua Crofts
