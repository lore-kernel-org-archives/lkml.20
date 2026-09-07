Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E35E4FC8FD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788793828; cv=none; b=WXWOe1Gofl1BSOGB6LSRWboeCzsYUvJluX6Z7CA1LYdgww4pYnAycvJ0CFRq/jn4I0yQm5cjwYZbn0/mas7oZyzA4UHT+l27OTrpxk1stsmL2XwDPO91Yfua04UO9LqrcUPM0aIasr9LddogDiy05Xg7vvP8jS9osUTWkjbFfU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788793828; c=relaxed/simple;
	bh=9oy5qButklff8GfbM0z4UX0XLV0AKreE357ixiVYz+g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n3WBD0Co3USzefpCo4HSEN+Oc7AQ4Uvz7CR6bHoIU8C2ywodmS6S6fB6XI5g3vl8V3equFat0nSN1XWP1iO5KUkPeEG/B80lYlRIJrfY1uyOj4+4zxOy4P4Q2z2NJh/8RjT4dvDUg9B6fg4JRIKtB6ZGqZ2OJQ3IaUv7lJbIX1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qSEl4jDi; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qSEl4jDi"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4859245e493so1661983f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788793825; x=1789398625; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jMzNA5pqITvRuO+ddPK9SULMMrrO+6pkpf8K1+l6RNg=;
        b=qSEl4jDiK/u0HPAvp6tWHHHl8bZKP4M/Tt4AGAAqjjy9xs03mHyY9PugHq4E/HkT/t
         l1O3xY5u2i0cvbm+WybdwgySnZDI1pdXULVToavF4s7j5FmtTVrnfCuGmVCjixZXLgdi
         1CnMCquH47FC8EK3ltzIZdBRpaDVjbBYZ3MniSTWR4ngErUKzMw28J1SzlIcYa1C/2Ev
         svsJAuk4LDrHbt0W81Jy0cQm0nREWEhnRus42R/KLI8KBJPiR0Yeo5W3dAvrIOJr0zFV
         8i+mHjKTHiNY+vq+iFYaP1GSUuoAh8YoBi3FAK4/g6VF1+awvc/fKrLf1rlrBmkpO5T3
         j+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788793825; x=1789398625;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jMzNA5pqITvRuO+ddPK9SULMMrrO+6pkpf8K1+l6RNg=;
        b=r2h9QjCbOtcM2g2tuWevYz2RrRNg4vJ/UwaMcSH2mRZvwsd4rUUBGfzq43UO5AUt+j
         8ijFPLsQKhSjFoXrJp0vEE57EK3NguR9O7J+frlVseu8LxFJdJ1I+GHUGiJVONILnYQP
         kyVgvnqnOTup+j7ZIbkO6RFYxazPiap2pVzHq0l6hca8jJ8IJaKimpsaDlilZoUzyJ1b
         Aed196LCqEawbe69j0dw34c7y+AUhatGV6Lgb5JdFAolRnqbOqKXqyqofLb+mJwYEYVE
         7r7wL/enbhysYoXLX6p8p8RdtE3GxnLAEZa5GgEZ7h0HNLP9ev9Cyf/dkKD6OCERnY4v
         plrg==
X-Forwarded-Encrypted: i=1; AKwUvBxyhwV4xn0msFZLCQ3/LdTlPbix9FFcnN8Wy2wf6snlvlDIeOXoWUYEd2zsJ/dVp3PH/yBew/74h1Fub+w=@vger.kernel.org
X-Gm-Message-State: AFuF++ma5uvuv/bj5dTGRY8UY2tdByRgnu22vtvQ9Lpmc05elBzmzLCN
	FYLlZD/er+gwRmAPw19qf65gNZ1PZd4cviitZx0GjsklrwPx6As0+07a
X-Gm-Gg: AYBFou04oaTH4V8+Suo6wqMaGN+9AfFTKkE6NEzZ6J1quhA7efFSLgOWRDjGOZNJrBM
	H9EuwKv8mE8c5aCA9sDxHFepmdbNewboyiXJiMZzEImG1q7WmLO3zQPtibR7/+Y4Hg2CZZxbJVO
	BKitrnjscAt5psvPqlsfX4aknNk6+KPXMhV+SlPjgMbMcMDmqXN/wSM63dCwOhRV33eJQs0Tr1w
	lGYGnuIvegNGGRA5/QLMpt7hET0tihOQFAiwUfT6lBBXjy+ztxMC5rHbpZYF6TA23biyKvzZSpG
	nM3FMx9MX3vTA8GKXFrGxvxBpQRI7WQe05RdliQZD63k6K6+mZ/vERaVEWkdUNZF9wsle2ncUyb
	ofs65t4VvJ5X5ZGdzhfWkX5cEViRRXfdOzHXZn2i3gAgdmFO/PVvHR2V/7WBFBcCKmd+NHzcQsy
	FOA4vhL7Jgar6d4/uzRN/BK0vZ/Qc6DTqz4+V8w5FLUe2PYSHj5+V9MGUUOepXY/GmmnDdrSoxN
	SHjA6Jgwo1E7y7V6YRUg6fw7fQTinnnewxDUacnE1Y6XVB0np83+3f1+nzztpGQVnyOL9Ebj5Rd
	iCTGhjmzL+X64izdDqEBOpddb81k5uCalRaPHirH/k1OiuZIHK6jiyaJoGT06ir2XnqEna/9BqI
	iqPWrusyApJ5qFlRCBpkGtMA9NGHDZmbPZCRltU0gl/v9l2zG/FeWQscP8NkTqX4SDrkviQ==
X-Received: by 2002:a05:6000:2dc4:b0:485:8a47:5b8d with SMTP id ffacd0b85a97d-4858ddea668mr18452129f8f.42.1788793824528;
        Mon, 07 Sep 2026 08:10:24 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48591eb3d3bsm17177278f8f.0.2026.09.07.08.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:10:24 -0700 (PDT)
Date: Mon, 7 Sep 2026 17:10:22 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Esben Haabendal <esben@geanix.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Martin Kepplinger
 <martink@posteo.de>, Sean Nyekjaer <sean@geanix.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Martin Kepplinger
 <martin.kepplinger@theobroma-systems.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 9/9] iio: accel: mma8452: Support interrupt sharing
Message-ID: <20260907171022.00007100@gmail.com>
In-Reply-To: <20260907-mma8452-open-drain-v8-9-c17407e22118@geanix.com>
References: <20260907-mma8452-open-drain-v8-0-c17407e22118@geanix.com>
	<20260907-mma8452-open-drain-v8-9-c17407e22118@geanix.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 07 Sep 2026 16:51:04 +0200
Esben Haabendal <esben@geanix.com> wrote:

> Adding support for sharing interrupt line with other device requires the
> interrupt handler to handle runtime PM suspension properly, ignoring the
> irq if the device is suspended (maybe even off). And while at it, we use
> the PM reference to ensure we do not get suspended while processing an irq.
> 
> In order to prevent the chip from raising irq while suspended (that is when
> using fixed regulator, where suspend just means setting the device in
> STANDBY mode), we disable all interrupt sources by clearing CTRL_REG4, and
> then restores the value again when resuming.
> 
> With that in place, it is safe to add the IRQF_SHARED flag.
> 
> Keep in mind that the device by default is using push-pull for the irq pin,
> which might require additional hardware design to allow interrupt sharing.
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---

...

> @@ -1784,29 +1796,62 @@ static void mma8452_remove(struct i2c_client *client)
>  #ifdef CONFIG_PM
>  static int mma8452_runtime_suspend(struct device *dev)
>  {
> -	struct iio_dev *indio_dev = i2c_get_clientdata(to_i2c_client(dev));
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct iio_dev *indio_dev = i2c_get_clientdata(client);
>  	struct mma8452_data *data = iio_priv(indio_dev);
>  	int ret;
>  
> -	scoped_guard(mutex, &data->lock)
> -		ret = mma8452_standby(data);
> +	guard(mutex)(&data->lock);
> +

Hmm, this patch might benefit from breaking it into multiple patches
(the change from scoped_guard to guard, the local pointers etc. along
the fact that these aren't mentioned in the commit message), but
that's up to Jonathan.


-- 
Kind regards,
Joshua Crofts
