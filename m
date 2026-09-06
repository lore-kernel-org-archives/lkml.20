Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F37F3C37A5
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 14:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704157; cv=none; b=H3rBCtqJblA+jKOMiHY75/k28KV96jwsJ+ds3ZYqBhXKFlhXMQeUXiGJEcJKgRWop/hAm3BVcQVg2EVgDCvD0rEa94AF2ttbRJ4H2wCoPpR36lcZ2Wi1O9LcKGMsolBGpmfMUmn4SA0hW+Prc/rttT1BUAy7RquP18aVDoLe964=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704157; c=relaxed/simple;
	bh=5z1XyfZy9X2PAxK1/9Yh2cUeXP9XgPJuFrK5ZQ96h4g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WUZFuSAy7pDH0LCH3oz5GukjoHGlcsHlcM/IH836Fg4PCD8J+gbkw9zz+NmoO34GuzwZ8pKkGlaGeOFleYxiAWbkO+ZS1HqE2Aib62MIUec0tIRUk0BgtdQgDzaGp7VbvwNZ9O1XE8BYyM1OZLI/pyq+NB8wlhMCJ80NlHF1XFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODvUZw00; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODvUZw00"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49954b88fffso19039135e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 07:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788704154; x=1789308954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4kWMuuXK4yTjCPbPm2zu6KDXy0eIRwL1Ztz5775GY5k=;
        b=ODvUZw00KponDPjNPgvAQVWegLbPo47KInx6uaJ6/uVUQboAFY77nRmSw0l7r2fYvv
         M2RiZ97xcXFE5oaytJEbWDU+oXWObrgdKz1j0rQd+LtBa2368Hm0Jqc/9JVYk9X0fRC1
         9cixgplYj7mvGbipDLymn3WGkwnCZdUlJ7VDyDO0VGUdhRgooryBiIzPs4kJTeigXlpC
         l6Rdkqq2cUeF4z9yQwhO1f29ELaMlJlTMq6i6QngbB7LU1RGfkuytziQYw4gItTDtbFt
         8x/MVhrOnifCbO/dS3bCgaqrr7utSW/MoNR/krbvQJzj5wsvUT3bE3hI077I8vLY4l29
         74SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704154; x=1789308954;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4kWMuuXK4yTjCPbPm2zu6KDXy0eIRwL1Ztz5775GY5k=;
        b=G2F2T1LAcajtZVLvTLGJbh6S/wyOYUDitBPb4lum3fDlCdGI7rXkukMk1bZsO8j1GZ
         5Pe91JrnwCBheRl/bJh0OFvbpKN9ABIrjn/rrhettfpNSkKEvg09r/bOqR4fW7tMiBBh
         z+0UC8TDHfJxUpoWqGhsvVoIZ0ipBa1+FZ3lqpzabrGhuwNwo+nK4Cd99MF7DRSxT+6j
         uBuy17Je/KHF09qtrE0t2yoDL+aNFv/rCSJwDRSb7fOTqILGQbknWr+9tGA46xmfEInH
         eCeM1reRmcj/WzSh3Xz8IOn697UOacYmtuF0ZHoNfsz74u9slJfRW+aFvx4x2+JxIg9i
         Vszg==
X-Forwarded-Encrypted: i=1; AKwUvBwt9Uivyf+7oGjHObfjoQcwJLvhf1ZYFHObRAsvFzM2T43xU7jLNVD4XFhmQ4ZDg1UbOAbuU3VnkMDZp48=@vger.kernel.org
X-Gm-Message-State: AFuF++nvWo4/xtT5NhxgViqsqkrgptR1VeYpQVUAtA9LlAaNYxx7Fi6N
	Fe3cWQ2cQF6epn9TW6nsmNN64tCbeQ45lyaHi2pyyRNyk179wrdcbtZm
X-Gm-Gg: AYBFou1G5jqkbksnkzGzqyfVUbOAcZaWDHPX3bhzBg5ucEk8shyeK1+Ecum41kS4i0o
	IX8413FNlGfmGM5J/p34cHvcZNzEnB5KBOXOsm5S5b3q7vfR33P5Q1nubvMw1TWD/a9HtJKTzoP
	xW4zkiJS93j4zqXzwMiE8S/dMZCOfH65naPHVxzR5Rk81msQQs3O8Wkdsi7s09AM9eIVUPK392w
	KdWC8mJ5gdaFNmkAdqzf5qbJGeN77K+YNwFByb9jEAAfy8N9pQHHF8BzJeEHfsVYqoPQ9syFYeN
	eQFl9PILpTO94I+LQLz+PGJaH2004AvzvqshEF/FE/L6dyqIZCtbRO3yLfeODZPY7SzAt4mf41W
	HTv9jkvMbKRpJ7KsVxx1bjNQbWZ7aEePpAeercHwnqqLnUh4WwTyKrS80+8CYcHMRhfBvvnaGqc
	3tzO1fop7wQ0hlm5RIvkWLcftSHZ9NShi/EmlLF607749u2KCQOdsHABFudzGvBiwfZJZCynQ9S
	a3nP0wnWd4dVSU9LOwA8/vGSLqD2SkpI3TveESpxNUsHKoCuiWQQyZyQHSD4ZAUwxWFttZopxmv
	J7D+bJGf8Jmn+ljhGh1HWyk0BY86Joj3z5O0LsRnDbFbMhHWn36GUGeXncpN3UhH3rVNPyMrHCK
	Tu1RvGHjEFbDS71ycMU21dGVvxa+7ZAwwffic8H6YGI6xyJIZlS9wGh4cEovcqG9U2o24YCkXln
	ASBzQ=
X-Received: by 2002:a05:600c:46d5:b0:49c:fc6c:be06 with SMTP id 5b1f17b1804b1-49cfc6cc142mr141792295e9.29.1788704153980;
        Sun, 06 Sep 2026 07:15:53 -0700 (PDT)
Received: from systembl0wer (78-80-112-223.customers.tmcz.cz. [78.80.112.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7740d44sm534138115e9.15.2026.09.06.07.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:15:53 -0700 (PDT)
Date: Sun, 6 Sep 2026 16:15:29 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, nuno.sa@analog.com,
 Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org,
 linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] staging: iio: adc: ad7816: Use DMA-safe buffer
 for SPI read
Message-ID: <20260906161529.5d2c874e@systembl0wer>
In-Reply-To: <20260906114049.32912-3-abdelnasserhussein11@gmail.com>
References: <20260906114049.32912-1-abdelnasserhussein11@gmail.com>
	<20260906114049.32912-3-abdelnasserhussein11@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  6 Sep 2026 14:40:49 +0300
Abdelnasser Hussein <abdelnasserhussein11@gmail.com> wrote:

> diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
> index ab80b3a889bb..e14ae805f076 100644
> --- a/drivers/staging/iio/adc/ad7816.c
> +++ b/drivers/staging/iio/adc/ad7816.c
> @@ -52,6 +52,8 @@ struct ad7816_chip_info {
>  	u8  oti_data[AD7816_CS_MAX + 1];
>  	u8  channel_id;	/* 0 always be temperature */
>  	u8  mode;
> +	struct mutex lock; /* protect device state during SPI transfers */

See my 2 replies to the previous patch. This change shouldn't be here.

> +	__be16 rx_buf __aligned(IIO_DMA_MINALIGN);
>  };
>  
>  enum ad7816_type {
> @@ -94,13 +96,13 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
>  
>  	gpiod_set_value(chip->rdwr_pin, 0);
>  	gpiod_set_value(chip->rdwr_pin, 1);
> -	ret = spi_read(spi_dev, &buf, sizeof(*data));

As well as the fact you removed buf in the first patch, causing build
errors.

-- 
Kind regards,
Joshua Crofts
