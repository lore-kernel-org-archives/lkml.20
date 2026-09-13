Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C04388E61
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 04:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272674; cv=none; b=ucIEEktiPx3t/pmi+weX3NOYEGe2ECHzN+eJMMPi+WqCT7YBGPDeopnm8U9HWuLvzkZwBhXYBHIgJExPS6AUYPjn/Im0zGjyqf+TcpNdpRFfqu4k1zzJ6IuBHw9N2CbFovVOfQDKVKM425mD/s0pPiXxcAv7yLlnZcL1KodhJv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272674; c=relaxed/simple;
	bh=dITn8nBKmb8Bi6swkoIWrqcRcTGIhThkiYu+S9L/Hls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ho1atkHGghKhNv913yo4JYs40gFqkIc9Gu2WnckXQVfWEv4jh7b1y4UOZl5Cc/B3+8gdA+BLXhyoTxs5w1cutqMdF9LTMu9oOc0FGRH4YWtlPwTvuWvXPmVcF+UWVYaSwOVr2yuxCahXr+swCgFOa3CM/Ut7FpE0aMDK6pC1GLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdplOKGf; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdplOKGf"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-671061b015eso2181975d50.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 21:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272671; x=1789877471; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5TpSaHdCFjKeeELu+etDHas8LKbQ4ME9nbIH5rOB2kM=;
        b=gdplOKGfgDz0/2jcHas+of03nOvM//0D1EaLK9ujokSKESUCpvJ1MVLdh3GPAEIuyq
         IUOK6NqwTCZEuoF+NMqbgGMnBhScBYQhb6EDB/VcSy2ijG/NzmWk46NuXa3X7XB73xSh
         nnTGXdFhISGn9Dru1/zlmNInudPN4JwJzPxE2VN+3UsQ93vrOtDKG++cTi/EJwonYoc6
         6seHA69swvP3mydqdAYyUsyDVgmAJWYXI75R0wkAbKqb4hdd5BzCaNi11B2jN23GY25N
         CcMg0xuAqS8tCd5UA5YICe/N+Q6QfR45SB+jKMUqOdTSMznl2FgOjM7gmW6O05o4Cjdv
         Z9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272671; x=1789877471;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5TpSaHdCFjKeeELu+etDHas8LKbQ4ME9nbIH5rOB2kM=;
        b=KKD6wlxO+shYil11qJiRDK+U7ZGBXr2Z7HF1+6E1oQOpJlNvzuNxU46d6yAh6fbmTU
         AS/ex+Nmalk9TQo9AOhgFqrPJvUzqmEaJoYwJhbwL4GfCmtfHJ8Kp2o+PagIvGMJlY3C
         q593KTPW6ET2fpG/5DwyWRORqhOz/TTS03tOJ6b+fxR6OXlF09N53acW12VfLwhB8Bio
         uGs4Ym6B8RvEiKgljW4T1fi7kIJ5W2XuSwFKDHyGnaWVJ4u65nWJp5zyecsmeoE+WwOF
         wOGV2kKu58ozVHL6WncSz25of4dk65c8SAStR9CclgDDSWumOmiQ7XoNkGJaCzh1TTb8
         16Dw==
X-Forwarded-Encrypted: i=1; AKwUvBwp1zMVpTgGXq1V887wkHrGGBdLr877Wv2ZdKN8b8ojZxL+uNkoiby2WHz2Qk49DmJy6xoeUqWIz/dusr8=@vger.kernel.org
X-Gm-Message-State: AFuF++k4nerSvJjN+5e2bybo+lb8LtqW1Hp6LUWH9PXHdugPNo78HUZM
	fW2Ioyo6wl5LdOtx6UiQSiBj60ozBqsx8tlyAHvc32APfi/URAkuAJ8v
X-Gm-Gg: AYBFou2/i1XO34kQjyoQWoy9NUhfGcKCLqB3SSMkZSURzAA1Pr+on4ak78Jts5akC94
	38TUkVVzUFcOfBGLh+hufCZMgXZkvrBE7lPjDkTAcJpBL6H8L3zQYY7PxmUR6v9ZcrQZVJgG+5J
	N7Tg+GDEUDhh4y1X4+fMxBv9faDNu1Unltx+Oe/D/sDZLVdxoax+rcxDg+ym4EqRV/JWnXhmcgJ
	KEd4PgSBUzzbBCCDwANUioeiWfmQfiAzrSFTiXKHviiGnkm/SfBBO1N7G9iRcAJK7lK6pPLFWm4
	EjDU86QOd4TFqocyKQ54jxCGOSrkMzpI8h65b5HjQm5SUpIY8eLDXgw0RWTsfcrWKXRJRrozmt2
	Ra3xqt40KHyHAIM/iZ79gQiCo9Npk2fKdBLt9nxo81FEBeAh5C8jpxLjE85Zamm0W1UEoW/WAiz
	96S0PrHTrURj/+JZxZLhWh8vzUnKnvXJ9d9miOuiyAyP5Zva6b2pq/rrY=
X-Received: by 2002:a05:690e:14c7:b0:671:2eed:f701 with SMTP id 956f58d0204a3-6712eedfdd3mr2190714d50.71.1789272671600;
        Sat, 12 Sep 2026 21:11:11 -0700 (PDT)
Received: from gmail.com ([2600:1700:5431:250::3e])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-884871190acsm25559397b3.23.2026.09.12.21.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:11:10 -0700 (PDT)
Date: Sat, 12 Sep 2026 21:11:07 -0700
From: Chang Yu <marcus.yu.56@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Chang Yu <marcus.yu.56@gmail.com>, Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shi Hao <i.shihao.999@gmail.com>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] iio: light: add AS7343 multi-spectral sensor
 driver
Message-ID: <aqYiWwIkP1HQtRrk@gmail.com>
References: <20260912013912.51887-1-marcus.yu.56@gmail.com>
 <20260912013912.51887-3-marcus.yu.56@gmail.com>
 <20260913034714.2fa2fcb5@jic23-hlaptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913034714.2fa2fcb5@jic23-hlaptop>

On Sun, Sep 13, 2026 at 03:47:14AM +0100, Jonathan Cameron wrote:
> On Fri, 11 Sep 2026 18:39:12 -0700
> Chang Yu <marcus.yu.56@gmail.com> wrote:
> > +static int as7343_read_raw(struct iio_dev *indio_dev,
> > +			   struct iio_chan_spec const *chan,
> > +			   int *val, int *val2, long mask)
> > +{
> > +	struct as7343_data *data = iio_priv(indio_dev);
> > +	unsigned int unused;
> > +	struct regmap *map;
> 	struct regmap *map = data->regmap;
> 	struct device *dev = regmap_get_device(map);
> 
> Neither is checked so no point in waiting until a few lines
> later to initialize them.
> 

I was trying to preserve the reverse christmas tree order and
was unsure how the rules apply here. Is the following OK:

  struct as7343_data *data = iio_priv(indio_dev);
  struct regmap *map = data->regmap;
  struct device *dev = regmap_get_device(map);

  struct device *dev;
  __le16 result;
  int ret;

> ...
> > +	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
> > +	if (ret)
> > +		return ret;
> > +
> > +	switch (mask) {
> > +	case IIO_CHAN_INFO_RAW: {
> > +		/* Wait until integration time passes for all 3 cycles. */
> > +		msleep(160);
> > +
> > +		/*
> > +		 * Reading ASTATUS latches all data registers to this read.
> > +		 * We don't care about the returned saturation/gain status for
> > +		 * now.
> 
> Why do we care given only reading one channel and...
> 
> > +		 */
> > +		guard(mutex)(&data->mutex);
> > +		ret = regmap_read(map, AS7343_ASTATUS, &unused);
> > +		if (ret)
> > +			return ret;
> > +
> > +		ret = regmap_bulk_read(map, chan->address,
> .. it seems that if you read the low byte first (as this does) it is latched anyway.
> There is a statement about this in the i2c intro part section 9.
> 
> so we get a consistent register pair.  Thus not needing the latch astatus
> gives us.
> With that in place reads can't stomp on each other as only
> one regmap read is required, so the mutex isn't needed either.
> It may be necessary once you add more features - hard to tell yet.
> 
When testing on hardware I discovered, for whatever reason, register
values for other channels won't refresh unless I read ASTATUS or the
FZ channel first. The only thing I can find in the datasheet pertaining
to this is 10.2.7 page 41.

"Reading the ASTATUS register (0x94) latches all 36 spectral data bytes
to that status read. Reading these bytes consecutively (0x94 to 0xB8)
ensures that the data is concurrent."

My most charitable interpretation is that by "latches" they also mean
"updates". I have no idea why reading FZ also works though. Could be
a hardware bug since ASTATUS (0x94) and FZ DATA_0_L (0x95) are next
to each other.
