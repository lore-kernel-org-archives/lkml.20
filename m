Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013CF44F55B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125531; cv=none; b=r7jnwVwksg5Eom1/F21nVRpiIQyQk6yykj3WyHkqMMyBsPQZpGPsad3l/KEOXqZGhO+VdPzRRz2bVm+2zrWWkDHKRMd4zHjdxurS/mpie0wVHgKKdJevDZLDbuOZCvus8gdgFUbOyCtIg/jFjlYbiIZgi2ON4oK/STmm+OJoN88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125531; c=relaxed/simple;
	bh=wV3pBxQrqLKd1wlVew6gdqs8o3bVNN2kXSEU1dTZDR8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e12UHtjqk4OCaaKi9a01kJCALfQjqFW3lV97BD1I/63r4GOO/26RvxAoaWc40nGtb0iSsdabpf2gJ0nmJvQzU0dLzE2SZ+qJLI4voX+njd+v9XIcEjt1b0B0Y733nYU4nXinBOYtyeQ25FhASuWaEqj3/E4WgMEVNMR1pJb7Hf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CkYCL5DQ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CkYCL5DQ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49d0b98d6d0so9885165e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789125516; x=1789730316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xHdOC9EWQWOJTpdYs0NFS1/xOzQRIwZJ+gUTthcv/kY=;
        b=CkYCL5DQL+tW0oOT8/vIkSbIF6lZU9z2hcLnIdzOZUtKm2TgbZGTb0qhh/ROcUJtLG
         5xagpA0y8AtYw9QPbYJofKdQEVztUj4hkPrJHWAErZj6qdQna5K2xzfrWuwknH1Ur3TP
         FHO52/axSuKKVh32zBwx1W4PWbyIo09ImfUb3PC50WzMlvHoJNLJgrv7YwYjhnNrlnip
         w55uKw5bftlWzY/FuaAiK8R29Ft6hnG2haB26F5ngA8fypL3zuAZ7tseKX4siP1gZWin
         XwrCtVdA6NzQ2C3gDm75kJA0da96Ak5IlEoED88jcxqy/MrcDNK0rhwNrdai9f6kxjAo
         i0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789125516; x=1789730316;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xHdOC9EWQWOJTpdYs0NFS1/xOzQRIwZJ+gUTthcv/kY=;
        b=KNmE5PKRrsXHuY7+2yozRk2uDrlaVwFMc6YnNf+nnOPSrfLAWYoElxjbtXZT/e3NL2
         rYBdCXYQ8AePnUTo5ix7H7B9QIpafp9mqaXM6JV7hF5YT/4dRe+wCdJz7d/4haOkAoiY
         yx5JNq63P14CspnozSsvwClSElsSUYW7Kauo7p+f23/5Y0nww+e2WRLbCmm02+TjPyfA
         yZPvjmINKVjZREqdF7uE3CXG4yA15nRuqMtaHkqpYSTHx3PvoLcJyzZuFSS4I0ROm2aq
         UFxCFIguf1SPQseCB63a5KA1mvv0OIhjDEQ3dw9LbPn1+ykj5x3JS66MdT5Fiyvi3PSJ
         owvQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7VpmdCbzU/+ixZQ5oeQYqTtoxNPv7QUBRApf59jlYW3MD1hWWlL2dIRnIugbdnmV/p/BigvAi3RWKmdk=@vger.kernel.org
X-Gm-Message-State: AFuF++k5bWxiZ8kJRpop7PAd5I4KGxgWsf+FEOOr242bt3msqCoM+nps
	Ol4ycKW4GrgLEmRoUrZwKehbD+Xag5cim7/pfTdDu1II3PjzeOClkD6x
X-Gm-Gg: AYBFou2cTfCTBgZSPOLJk8KDnS+KnHYIQQs67wLjHhNm+noK09llVRDsFbWqqE+oqO6
	nfnfllR6+3yqjYknZ5TJnm7oRr7HOgU2CE2lOTGnvz6Ees0IkwmIBd3u5aTsDXBN6Z91obf+40t
	GcwUyBJoFNMR2MwYiQOxJjKWO8DtW3t41zOGc/9UekbB5sbk3lZC7EGoCBGrY0oZSJ+4J54z9qi
	2/GVNKUL12FN2ok9MjrTgzFatCkJ55HjCdSJxzPbtQoJDanSbA4cO8ZSiprpfS6UtmmhseNAodT
	E2oySJfJfED5aeCKPMmlY3os6Q0SB+4eULFTRnct/uRHu7GzXDCuN71Wt4P9e2HMYjBrILGrAD6
	OxN5Ep1eA2Fw5BfLC15uNxHBU/hYKitkN3rbFOW/oe4Xt8RrAD6t/G4xLmCkggKMgmRhIOG0NyB
	VcfH4X9okV9KoiuzyGqsHBkP0p/Ml02td4lQ09kEnux+I3d3fC/LwQXmVH4EmdHLIOxZb3Ru4QP
	83pzIx7JJhIcSYGiYnJlUadq6azDslDSeEEVYMexUPWpyFJX7x0mbTZoCjIDILGpN5JAcbVMKP1
	eBAmESuJeJXWTwotkctwr8xB4kOmaJqUDuxHNEuEa5MIdB7LWo4Omm0akIVZSSOk00wGZ0zvgUh
	taYAAhsdpALaMe8nHsIBoANU79BY4tuwvQy6hrcSYV+h4JvNiAa+Bca89+LspnOSNNI3tCsTiw1
	gNpYH5
X-Received: by 2002:a05:600c:3f0d:b0:49c:fa21:1c86 with SMTP id 5b1f17b1804b1-49e619cee90mr36362105e9.27.1789125515648;
        Fri, 11 Sep 2026 04:18:35 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33fd3bsm5335426f8f.19.2026.09.11.04.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 04:18:35 -0700 (PDT)
Date: Fri, 11 Sep 2026 13:18:34 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: jic23@kernel.org, gregkh@linuxfoundation.org, nuno.sa@analog.com,
 Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org,
 linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] staging: iio: adc: ad7816: Serialize SPI read
 operations
Message-ID: <20260911131834.0000514b@gmail.com>
In-Reply-To: <20260911110456.24873-2-abdelnasserhussein11@gmail.com>
References: <20260911110456.24873-1-abdelnasserhussein11@gmail.com>
	<20260911110456.24873-2-abdelnasserhussein11@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 11 Sep 2026 14:04:55 +0300
Abdelnasser Hussein <abdelnasserhussein11@gmail.com> wrote:

...

> -#include <linux/interrupt.h>
> -#include <linux/gpio/consumer.h>
> +#include <linux/cleanup.h>
>  #include <linux/device.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/interrupt.h>
>  #include <linux/kernel.h>
> -#include <linux/slab.h>
> -#include <linux/sysfs.h>
>  #include <linux/list.h>
> -#include <linux/spi/spi.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/spi/spi.h>
> +#include <linux/sysfs.h>
>  

Ideally the addition of new headers should go in a separate precursor patch.
(excluding cleanup.h and mutex.h, you'd add those in this patch).

>  #include <linux/iio/iio.h>
>  #include <linux/iio/sysfs.h>
> @@ -50,6 +52,7 @@ struct ad7816_chip_info {
>  	u8  oti_data[AD7816_CS_MAX + 1];
>  	u8  channel_id;	/* 0 always be temperature */
>  	u8  mode;
> +	struct mutex lock; /* protect device state during SPI transfers */
>  };
>  
>  enum ad7816_type {
> @@ -67,6 +70,8 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
>  	int ret;
>  	__be16 buf;
>  
> +	guard(mutex)(&chip->lock);
> +
>  	gpiod_set_value(chip->rdwr_pin, 1);
>  	gpiod_set_value(chip->rdwr_pin, 0);
>  	ret = spi_write(spi_dev, &chip->channel_id, sizeof(chip->channel_id));
> @@ -91,7 +96,7 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
>  
>  	gpiod_set_value(chip->rdwr_pin, 0);
>  	gpiod_set_value(chip->rdwr_pin, 1);
> -	ret = spi_read(spi_dev, &buf, sizeof(*data));
> +	ret = spi_read(spi_dev, &buf, sizeof(buf));

No, you're mixing changes again.

-- 
Kind regards,
Joshua Crofts
