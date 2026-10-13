Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57C1556BBC
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 21:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791926046; cv=none; b=ma0x9UdKq+X4OPBwKCq1fKf2Bhd3nj11EtLQPD3V3XkJZhGhZz3N7g831z1THtVWNsrCCeblIaPUotu2b/8R2GrV3eXFxYM2S2UichdPGiLyQXAs0PYFpDFsGZHfEImi/XrLTg0juq6TlRqH7wK50H2xD/TDcIGvslAhbwlqgxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791926046; c=relaxed/simple;
	bh=wtDO/XheizURatCXX4Jzfa7CVHBQQP21bcg3i3dm/6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=svXCw8F1X3I0THc5rsKmp/OIcV1L0l1NQDuJbZbkX7Stc7dtwI3B94YetdkaUlZhEANoseLQbTMIHz8J0ZdzzQld66saIYSfgQmbvv9OmjBc9Rb3S76KWHWXMJ9BixYIi4tfBl0EEaoweJgrzoxvBGJur769TlfMazKSIJ3ic7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zg81wZQL; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zg81wZQL"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7c4818e4165so2934195137.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791926042; x=1792530842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mBZ+Ja3pWo5DhIXLBhsh9mXAwHfVET/lEBUnoTD/0RY=;
        b=Zg81wZQLlyxg/v9PXXQnY+HLHpL+WWzupKI7xJIqM4KVgu2K1GLojSDbACUO7mRVqd
         HMraK8xoTsUk/EMR/09Hw496aVXnpUh+9RqUo+MPd6QUr1FI2B0RU1WzPmJPWnKu/eaz
         gk1faNDH0UUJHi7010AUD7HVbK0mUwhXQwK08xnTgYdYHp01MppWql4OgBE5/Rt+AaEr
         VKypYhD2wTtY0Y84Ufl/bZORcXuA3ttjiMZfeBMybwQnAxvqH7idXcamuWgu9/9jm4G1
         KlYRfP62Mx1mFv9wdWS9bX4WqgE+ac1456t9JjHTM5Na5w95oK6LPnPpDm6iUGyzrm65
         pzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791926042; x=1792530842;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mBZ+Ja3pWo5DhIXLBhsh9mXAwHfVET/lEBUnoTD/0RY=;
        b=g59YjNYWqfTB9wyGudaS/dulzSQEEzFcEH/RewgMLcNPVM2ZDF19h1Dr7gWJb7Un0a
         uJTFto84zayGq0b+aUjaoYT08/oGf8vE1OZekjH6hq0rFw+lidgzMJF9XNqpjlFik4Qv
         NE2COvHiGczBGIw52ytC6nPXEVNUcLhclC3ZmINnnTjufNc9r3lHbYH3jbYJSO2VYkcx
         e+AHK0tu59uo/bRkWxWPi5IJdzsfBPw3UOAEwAFpSD+S43bbRfQCcFuEZM8Gp9qTAe8a
         LPWs9tr30y8eSMqxQVxvvp2X4Om4fUUVYNJzazixOu3KwUzKillUWSnZWAsxaFE7PU8t
         tyDw==
X-Forwarded-Encrypted: i=1; AKwUvBwn1rtu9Xh4U8benvXPzwiwM3aqPRBS1IZkZ7VHmFwxKCVSaaBjGFSZ6VR+E2/Cl6dxvaCR1vKgnpPWzig=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGEwKnPOeqOEthBSmrgczSh+4SKFnO0vOXSGtR5G9oAYT9yL02
	CCacvcGKmaGN8uv1qq74yd+3gis/F6+RCclDQ6OLue5SHu3TTlDbeQan9hJC5Zmf
X-Gm-Gg: AYBFou0zeYyaKkVRo9QoedS+ifZa86ARGKyvYn5ptNrQfwbDeJ2GrqXVBt/CHc5bneI
	oH0Jl8B//XnUpfHyXNxQgstob8RJ1f7DYGICmQaeWw995gLpeRG/yBMMrSIrytikQHom6It1j1X
	CP3bMcsb4zLp1uBhjsepT9cZIELnB/pPBo4fPv/2kI4dvqugPBwc+bdBl1gOf3+tEr7gX1xWXor
	jkLjUItmt97iuWYa6fNHVy9D44VRAYoBX/zQehHp6xHylMLDIK4dd73NjUw+VVTsacvkr3NUEvB
	/jGHei6m9OWazx3KgTW+oMHMxFm+5AA39apvemPhZ4PnyjnvKBgZQ+v88bsq6TJhht/6bHGBIB/
	zkNbld4FPMVA9YgnH/v8iuOV9OGkLyplhRNUhHGCJ1RJ296Q1VdzjnJMByXlxWzqhFZAp77+pqO
	esAused/mt4wgi6D2ixzVMtgHz5ZHL4l6YRmKJoawSDHlL9+llrzHKLgNM4+wsVvTjdQfbedg/n
	Y+W
X-Received: by 2002:a05:6102:855c:20b0:7cb:91a5:7cb1 with SMTP id ada2fe7eead31-7cb91a593f1mr1394942137.39.1791926042511;
        Tue, 13 Oct 2026 14:14:02 -0700 (PDT)
Received: from localhost ([2804:30c:96c:bf00:7844:c38c:894:4054])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cb354681e4sm9971342137.10.2026.10.13.14.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 14:14:01 -0700 (PDT)
Date: Tue, 13 Oct 2026 18:14:23 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux@analog.com, jic23@kernel.org, nuno.sa@analog.com,
	dlechner@baylibre.com, andy@kernel.org,
	Michael.Hennerich@analog.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org
Subject: Re: [PATCH v4 07/13] iio: adc: ad4134: Support buffered data read
Message-ID: <as6fLwTZ-L_MdA--@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1791309733.git.marcelo.schmitt@analog.com>
 <5d31212a27c2099c226cce189aa96677e75ca529.1791309733.git.marcelo.schmitt@analog.com>
 <as3bu1imLnoBE1lb@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as3bu1imLnoBE1lb@ashevche-desk.local>

On 10/13, Andy Shevchenko wrote:
> On Tue, Oct 06, 2026 at 03:17:56PM -0300, Marcelo Schmitt wrote:
> > Enable users to run buffered data captures triggered by IIO trigger device.
> > Add an IIO timestamp channel so each data scan is provided with measurement
> > time information. Require single-read operations to be in IIO device direct
> > access mode to prevent buffered and single-shot data captures to disrupt
> > each other.
> 
> ...
> 
> > +static irqreturn_t ad4134_trigger_handler(int irq, void *p)
> > +{
> > +	IIO_DECLARE_BUFFER_WITH_TS(u32, channels, AD4134_NUM_CHANNELS) = { };
> > +	unsigned int chan_bytes = BITS_TO_BYTES(AD4134_CHAN_PRECISION_BITS);
> > +	struct iio_poll_func *pf = p;
> > +	struct iio_dev *indio_dev = pf->indio_dev;
> > +	struct ad4134_state *st = iio_priv(indio_dev);
> > +	struct spi_transfer xfer = {
> > +		.rx_buf = st->rx_buf,
> > +		.cs_off = true,
> > +		.len = chan_bytes * AD4134_NUM_CHANNELS,
> > +	};
> > +	int ret;
> > +
> > +	gpiod_set_value_cansleep(st->odr_gpio, 1);
> > +	fsleep(1);
> > +	gpiod_set_value_cansleep(st->odr_gpio, 0);
> > +
> > +	/* Run enough DCLK cycles to match the data frame length. */
> > +	ret = spi_sync_transfer(st->spi, &xfer, 1);
> > +	if (ret)
> > +		goto out;
> 
> > +	for (int ch = 0, i = 0; ch < AD4134_NUM_CHANNELS; ch++) {
> > +		if (!test_bit(ch, indio_dev->active_scan_mask))
> > +			continue;
> 
> for_each_set_bit() ?

Will use that for v5 (or maybe even iio_for_each_active_channel()).

Thanks,
Marcelo
