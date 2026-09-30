Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC603C416A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751411; cv=none; b=qDw3FsHBlXaq24cX+vgst8CLul73HofGBfWKy1mikOEzxAInXXBfG8DapIHrfUhZr0dINumvfuxWu5FFmjEnBodhpKGp1rCcifJzNIR6rYj7WDaxF3bb5s9gXRDek14CA+UD9jAxbmNZ/2qQfsQkVNlHNJ9nHZADmGChKeXqDrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751411; c=relaxed/simple;
	bh=+fxZlZKcmSzpMyXlmu9ij0waNERL2gFRxhZvKqLEvEM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EKOimA1gXzrm4RflJ/M49n51MlYITMMOzJ9wqtVXv9ufvWiE1opxkbeFeCbs8b2MyZEAG8GCL660i+yYgF5rKudqY5l9PYwPlYPOavucHQcY7wlunIFcouwXwjMiUMLww8jXxqPoRWc6IkTViV8DV5LqibMHNtk6j4FPS4ks1uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fDaAn6eJ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDaAn6eJ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffb83bf7aso31249585e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790751402; x=1791356202; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yuHgAjHOVltJdZTQWjHDacQSlYBFWHEKS15iSGeBiRw=;
        b=fDaAn6eJE+OigXn54lWTVjyaiFZYNP02eHtVLhFZ/K0GSvLywAjaOUscRvr/WJ6Hjn
         jQPs640a/iR/IvLr5mrvFMJ/ApxsUDt2NBZ0ofp3r7ziWq2wwYIwHpxnoPlmq2lbk2SQ
         D0EBYP21/fYguasvOxB7cLQpRoyufw2zetdUtxSxh/1tiOn35VN3pX1VNbljPDID8dCH
         zVPXSTbpeI85p6qHu1WjBhLS8hzpPhjZieDN6yonp3n8Fddi2O9zXLDOZ71DBQWXIA/V
         gCmMP7nqc/zQDrRonnqSam6VFOndd4WOwOYiUbLSEdbNzyzRPEFt2ZT69AQRHeXnPoj7
         5pFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751402; x=1791356202;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yuHgAjHOVltJdZTQWjHDacQSlYBFWHEKS15iSGeBiRw=;
        b=Q9yQORQ3VOOqZcEs3XO4bHEIfHL+GL1/mALQ8NcI9dY3SmMigP00oGWJtMZk2kCXOx
         WupYWr3JRxQAJPVQYr1P8hPc8WXcch3xP3CklTULd/n7vO3FSvbAOa/UiQFaubxQT3lM
         LOanr5nEqQcpfUuh0XvJQoMmk20NP5rgp71/69WGgNebkqQJ0MkzVlsV9vKyfWfAyPRi
         oap+yGnGZl9R4J//SN8cP9hP7IArt5FPs7jHDAP05i2utG7mPj9FEc1dGNOzQjPklHlx
         Pr2djOY1WT2XS8fvcL7E/26i2DYXYgQWIDM9OA8mvFMVGvdn9zdLNw2dAMqxDyFDkwrp
         nK7w==
X-Forwarded-Encrypted: i=1; AKwUvBwQqOsNds02KThRc6QL/wqUXIjbHKGTfbmtmUCrZC8aABvhIvCaWnMqIhlfHFI1oq0h0y1As5hsP1vxVpc=@vger.kernel.org
X-Gm-Message-State: AFuF++mhilKYrpifjLNNLfqnHj/FxFyay83WOgRIhspuT/EkDTcyCgxv
	0Pl7KiucBSzYbqKHBfo02Eh8LqJbOP+kpMlm03Wj9cR51sVRx/dQNKko
X-Gm-Gg: AYBFou096QE1/iaPpNjzfO73VMGIVRoFOpwCG8knICjf/DcSdkOfuLnsFB3Wkhbl4Fw
	dW4LE0b8WrG1VYdxa3apLwxLieNcFF+91b55z8lgotJ48to4mBP+4JV5r61vnsdrFodFHJ7x0Pq
	0TVrziDSxM8lJKwtdKfqji3Pumx8K4CPJqx8dHDNsvhllfIH8nNGN4wHHH0OU5EKoEgJeEacp/i
	aVu4dy4CgiROlzZyScWFgcJDqH9iN+ca5QD9/Oj7EWjuObdQeYYgVjcZV+iq1QtWL1vqL3P8tJr
	PW3GMiZgLH2FTzAwfcdCMvlQ6l/pojbq4guqGTe815CbJ0jC9RA7S3WXCuj1SPDZ9vqy0jVA0Xg
	Xhk6s/HPFsGpHGNWvjkWAAIEt09lmtHoYQWpzBE0k53MZbBfRQiX4NsqJjFjYXY1FCqVZxeKYC1
	shv6Io7ZPJYUWstvxuVczChSyerhDGMch6p/ygp+Ncw2k6921CWA0rRaUd33cVUUuM4nSSNyOcQ
	GI6ng0QAQF9r00xyv73cmSTpeiquEldeLhvcKw6GO3ehteTPam2C4WI5PH6omkPRZrupzhqu7jV
	YJ76CJ2E1LoMGSlpVm1ixnd4cCKFvR8Ro9PxG6873322hbS6x3962BvppcZf8p6GLMG5t3PgncQ
	qlsjm3a1B3DfbM9ihf4qAE9p0LFHux4hBUWFMWQEFPRuWoJoMr30b/v7dxdA3EUClLIF7u03jF2
	tOJf0l/QsXugC1j8M=
X-Received: by 2002:a05:600c:1c01:b0:49f:fdca:c361 with SMTP id 5b1f17b1804b1-4a01aff256fmr6408235e9.12.1790751401995;
        Tue, 29 Sep 2026 23:56:41 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0174e165fsm34856325e9.6.2026.09.29.23.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:56:41 -0700 (PDT)
Date: Wed, 30 Sep 2026 08:56:40 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: jic23@kernel.org, gregkh@linuxfoundation.org, nuno.sa@analog.com,
 Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org,
 linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, error27@gmail.com,
 narcisaanamaria12@gmail.com
Subject: Re: [PATCH 2/3] staging: iio: accel: adis16203: add missing
 spi_device_id table
Message-ID: <20260930085640.00000377@gmail.com>
In-Reply-To: <20260929184900.39515-3-abdelnasserhussein11@gmail.com>
References: <20260929184900.39515-1-abdelnasserhussein11@gmail.com>
	<20260929184900.39515-3-abdelnasserhussein11@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 29 Sep 2026 21:48:59 +0300
Abdelnasser Hussein <abdelnasserhussein11@gmail.com> wrote:

> The driver currently relies on OF/DT matching but lacks an SPI device
> ID table. This prevents module auto-loading on systems without device
> tree support.
> 
> Add the spi_device_id table to resolve this and ensure the driver loads
> properly across all supported platforms.
> 
> Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
> ---
>  drivers/staging/iio/accel/adis16203.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/staging/iio/accel/adis16203.c b/drivers/staging/iio/accel/adis16203.c
> index eddb786d4747..905485fd556f 100644
> --- a/drivers/staging/iio/accel/adis16203.c
> +++ b/drivers/staging/iio/accel/adis16203.c
> @@ -11,6 +11,7 @@
>  #include <linux/iio/imu/adis.h>
>  
>  #include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>

No need for mod_devicetable.h, this is imported using spi.h

>  #include <linux/module.h>
>  #include <linux/spi/spi.h>
>  
> @@ -292,12 +293,19 @@ static const struct of_device_id adis16203_of_match[] = {
>  
>  MODULE_DEVICE_TABLE(of, adis16203_of_match);
>  
> +static const struct spi_device_id adis16203_id[] = {
> +	{ "adis16203", 0 },

C99 initializers please.

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(spi, adis16203_id);
> +
>  static struct spi_driver adis16203_driver = {
>  	.driver = {
>  		.name = "adis16203",
>  		.of_match_table = adis16203_of_match,
>  	},
>  	.probe = adis16203_probe,
> +	.id_table = adis16203_id,
>  };
>  module_spi_driver(adis16203_driver);
>  

Additionally, you should delete the MODULE_ALIAS("spi:adis16203") line.

-- 
Kind regards,
Joshua Crofts
