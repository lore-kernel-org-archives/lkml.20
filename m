Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA9B3612E0
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 14:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788703583; cv=none; b=pDSMFg//pAjVtez/oK1K33txbi+yq8bfBcs2Qh6u+kzuVuw0KowLIVmn2c8xiLGGlsGlsjIRxlBpCF70rDzcPzETGLWzEz+dFl6tjhtS/7niQeRt+dGX8rDNWOrrcPt4NXHdyDFrAAuODIJOeQDgywlENy4WJEaQus4FAvwD2p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788703583; c=relaxed/simple;
	bh=tI9FVh3+xvu74Y2zPQNif4JKysfG1IXGu46QtIN+5WI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QQ3KFoZYAWFUfYOtAKRx8biGYvPwZCXSZ/fojlLTLIkRo31KltKMQXJ/0+nD7HSW1Kvxt3N9gb5nQc28zgrn0nIItTAvJB601J4oJI/O9/1CN9wJt/hoYPF0DdUuxOMTV16CL21TRJ4gDFB4xcSVbIO3Z8jejY+H2vtyAfhw8m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qDlUIimK; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qDlUIimK"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-495590dde14so36655095e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 07:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788703581; x=1789308381; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gs6/YbhXKRDZGsRYZYKBM+a3pqzRoKUz45XvXh/D/hk=;
        b=qDlUIimKoWibq3/glCA1tvDeAfxICc5/mYBjdVuFuNQN6WbFubm0uMr+svx0hPfc/z
         sM02Iqe9Fn/t+nubygULNH7ez8u37TpvwsH/hxiRoyUxY3Roob/rw+18KTIO27Lg0fpD
         9kzb7SioV6BE94TKubE8ZOeRQepaXNHY39jDstwLfB2D1LrkLGQTT3v4nHkpyHNTD7pi
         TVoZz9vaOs79c6AyUYZvbgCYi4pZ/V0EZajxJCGCzDCGrWeZdpIMw3V9XMN1PRDk/V9W
         6lJ+IbrQKgaSidooik0x4xxok/OasUOqmMPxCvJeiGurWIaMHZu7VgJ8hPB8BaK/Yvqo
         7e4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788703581; x=1789308381;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gs6/YbhXKRDZGsRYZYKBM+a3pqzRoKUz45XvXh/D/hk=;
        b=sP35KuW8VxL1g8c56EzNMnw46dtIM18SV2lARFL8KN/4+DHyTFyeGFT4OnZAFZcCJW
         pvJqFvXghfYbb5p9QWIMHWcZQ71HplueTnC3N1gd0u6ctisOwXZDhzuhQqy+KmYNDWKR
         JXaQWZDb3RPI0apsnTDw3vE2tKVeUyFN1882jxoiLGphj1DiJGfl2nXWxem8iZxfzyHH
         VdlcMyhCd/cszPn+/ngNcIt50IiaLpADms83lYzkGzy0ijmF3U70kzXiBTe9rUnWiSdN
         JE0hfme3Ko/X2pRgpXwm2ZaJR9bF3gUweifi0F8R1cuQttYHy4Eh+0NQFXBo0WfQit9p
         8KKg==
X-Forwarded-Encrypted: i=1; AKwUvBy43ipJnkVxzp88z2nD5AsP9P4mL8qTbZMbS76XLAtjPU/HkOPUzFjbgDrusxoW5RmSizrNgtNAs/dTT0Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nnb3Y1qNoHka/5Rl4LSDzjdmKbQUUM9n9Nj9XKFnw1x1IMuBvr
	TL7o0XTbzJKw5UwIMse84Hj9PNzVexlPJCJRFYuoAU6+ETPi06NhU83w
X-Gm-Gg: AYBFou1IzhZIGVQHop3bQt6Ceg488WZpvpIz+jwBheEwIZGGw0jvW/lgFsS/SVOzB7P
	A2+CC+AheoqJk87GHPEpELO0u751mo07Tz1UjnWD0PwlADsrGAq3xLaSLzBf/Y61h+tuZ3GiVoJ
	ns/UrxRkOd3VXTc/N3uze7keN4wx/8Ue3MCtuy2lxU8Zc3eRgJErYAjMk4v7k/soSAcFjyLqHEy
	XqWqBTx84p1c+tcvNlvqV0SXJc4OSH5XzXEJcODULlHUeVOZUnfbtpVhA7JaZ3mjg2s3lbUS5eT
	qLswFCZtif4GYAXqmutAw0/YHZgEYi3wbeOQZp1+ETviqEr6rSVvmhn3ygLnIjvkxuZjdsncPu+
	Zty3fsNOjtbGYkhRPArVzqL4odx7j5R056wV/A8Ef2plW8JepUywUxVTy2Rhee1VIIOeNinIG86
	GV4ahDFWJRH1vvaC9v8spfC2kirL2XzjrN084kMVQ3MF2rBkKIM/uebtpbBQrD31DiV9O9rUSdY
	v8C88IvXKpmqEP/7ipDClNG7LCP0g+9rcAvv4Ji9O4naK3qAxs3bbdSrKiJKZz4J50uuViemTwV
	V/zxpgOQp4lfX4NVZlpA/AKM8CDWlEo3PPNXtSDmjjxysqsoDwh295SQbBvQkgSVSDvRo8G0zTH
	TyOdmW2ApCyXAfUw+n7GTi9fJiVRDwFoXmEb1iLcKHtjPu87tBmqzdZ2DCJsfOt5rVVys
X-Received: by 2002:a05:6000:29d9:b0:484:3310:710f with SMTP id ffacd0b85a97d-485872934dcmr27595134f8f.27.1788703580544;
        Sun, 06 Sep 2026 07:06:20 -0700 (PDT)
Received: from systembl0wer (78-80-112-223.customers.tmcz.cz. [78.80.112.223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883927a3sm16599300f8f.11.2026.09.06.07.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:06:20 -0700 (PDT)
Date: Sun, 6 Sep 2026 16:06:15 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, nuno.sa@analog.com,
 Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org,
 linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] staging: iio: adc: ad7816: Serialize SPI read
 operations
Message-ID: <20260906160615.2fb5555d@systembl0wer>
In-Reply-To: <20260906114049.32912-2-abdelnasserhussein11@gmail.com>
References: <20260906114049.32912-1-abdelnasserhussein11@gmail.com>
	<20260906114049.32912-2-abdelnasserhussein11@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  6 Sep 2026 14:40:48 +0300
Abdelnasser Hussein <abdelnasserhussein11@gmail.com> wrote:

> Add a mutex to serialize SPI read operations and prevent data corruption. Used guard(mutex) and devm_mutex_init() for safer and automatic cleanup.

Please wrap your commit message to ~75 characters per line.

> Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
> ---
>  drivers/staging/iio/adc/ad7816.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
> index 0e32a2295990..ab80b3a889bb 100644
> --- a/drivers/staging/iio/adc/ad7816.c
> +++ b/drivers/staging/iio/adc/ad7816.c
> @@ -14,6 +14,8 @@
>  #include <linux/list.h>
>  #include <linux/spi/spi.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/cleanup.h>

Even if the header list isn't sorted, try to add the headers
in the approximate location if the list were sorted. Better yet, 
you could send a patch that orders and cleans up the include list.

>  
>  #include <linux/iio/iio.h>
>  #include <linux/iio/sysfs.h>
> @@ -65,7 +67,8 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
>  {
>  	struct spi_device *spi_dev = chip->spi_dev;
>  	int ret;
> -	__be16 buf;

Stray change? I believe this goes into patch 2.

> +
> +	guard(mutex)(&chip->lock);
>  	gpiod_set_value(chip->rdwr_pin, 1);
>  	gpiod_set_value(chip->rdwr_pin, 0);
> @@ -360,6 +363,10 @@ static int ad7816_probe(struct spi_device *spi_dev)
>  		return -ENOMEM;
>  	chip = iio_priv(indio_dev);
>  
> +	ret = devm_mutex_init(&spi_dev->dev, &chip->lock);
> +	if (ret)
> +		return ret;
> +
>  	chip->spi_dev = spi_dev;
>  	for (i = 0; i <= AD7816_CS_MAX; i++)
>  		chip->oti_data[i] = 203;



-- 
Kind regards,
Joshua Crofts
