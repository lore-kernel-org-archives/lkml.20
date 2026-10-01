Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7C2377018
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790838506; cv=none; b=k4sKCfhNJ55OxEekj70NaSn5wC9mySAGV8n7ADGmyTo8By4aQI0HyH4LwigcdAk7hQ3MA3MC9GbJfH1ENmR9W9B+94gvpa3+qZxYyRyxLGiHWnfDNp/LKn2GayPErcVVHUAcjrkHhPVIwJ65yEBI3o3eSN2h9MNO9g3rbX5N8n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790838506; c=relaxed/simple;
	bh=EGJJRokvBeMuto49N6+sTpxm8e0HrHHXkZH0oOqELDI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d312KrYbIs+zFrqVovmt8lq2c5C3fWDSCqSSgdZgXfoywdFRj931oZyBqwv66E3XZke4jT8A9kFrA4xsQd6hvTpYpKa+xdu40MYKFwrfDqnDiShaFOKgnML6zFVdSkrEgj8zNsxPlkWoe3LWduRo8ORMC8q0DnlIo8f1mS/8ZIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Il8KRa9I; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Il8KRa9I"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so57696545e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 00:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790838503; x=1791443303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CQNdVgaRBZ+BMSEVZ852Rz0UPaYSaRNjBg4ZUiywQmg=;
        b=Il8KRa9IAjf/YZupc6QdYJope62runpJmnE5naiM6vHXyKVfwd2f8FiTKzzeAsTqg6
         w19GuAQ6Vf/lpKtlWyreIyTGs3+n7Kl15hV08nG9LZ66IlUzoRZcB6ME0keaqNaMPBEx
         kmls7cHBjHTRUDWAn8LyVEQOLLZ+PB/3aVLeB5Yw0E1BUZGje9sqVHcYIgpHmxjsghyb
         Qe6HtvQ/S7BcxBLuZbfffkoVHX63P1/7zmbQwEIr9ifNqPWpRr4EVUzldh7xLym/VTOA
         ouG6fNlLMea641z2MwRis94hLYiT9tKSxTEQaI0QdjaLW6dSHoHU9rAco+Rp4znLOP6E
         gn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790838503; x=1791443303;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CQNdVgaRBZ+BMSEVZ852Rz0UPaYSaRNjBg4ZUiywQmg=;
        b=HQCeUPujWE8YrArszBWGFkXCdqEG7v7bF7+tJ46ZU//quO99KPrZJuJLzXbwdVVejW
         39hcYB8bQtZGYRMqDvCplYlP679YhKY2tpI1ywtf4bmyVkiCUgBNB2LS+MVjlbP6Zu1o
         cd23k2Tm2T2tQYc7GJG4McMDNvtEoD99xuR1z3ph4ip5jJHYKtbReeVQ5vg1yD/sAQrq
         x+4G+PxvapbjMDxoi4noMGC2+T0pZmaKO4qwlYPprfsC7KM/16Qz5E1SUySLQJeC4wVf
         4i0GcCjP21gAAOKzfp3MIDYg9nYUuOE6pZo2sU01UDV3lzAT2fxEWbGQegH71fGBYHG2
         j/zg==
X-Forwarded-Encrypted: i=1; AKwUvBzelEYcv8qi9ZBXCj4Gj9NHSY22ALnC0AtOLPbKBxNcHqDZth+ou3hJa9gCRC8gxWhRHH1e70mISEpbbsI=@vger.kernel.org
X-Gm-Message-State: AFuF++mrkMvHopeaPQ8/oAOj5NlL4mivs8HHoDPaN/ocomDfc3pI6l7x
	SR99Karfayz22a+eCPOddjU7/B2rrcbTb9LvE0BqhmIVN369yV5PPEiB
X-Gm-Gg: AYBFou3LZGOsyRh1Oa9TKRvqPcedwSP2F0R7kToMPnQuCzmMfJ6wwyC0KMavzR3r8CC
	uliRK+FnOq9n7g47JnkcgewmFF8TqTddEc0OcIwcQBrCCwKPFgjXqH3oXHeNRuNRRtTjej534hE
	i6urWaW8nQ2nkMbQrgGz6bSlNfxompubUtsObzCo3w52T1C2lvq7+LMV2fuHe2x6wMTrcYQZGOq
	XprySW7Bhqu7sSCfPUYflnm6bg0ewW4excLbMw6q3sdr5wUFPXwhDViGbom8gsW5fF7bf6GBCWn
	750B2gMO3cJkKh8IeOYwCgM/nToOQ/rpKgHQIrwxJk+2fDrqd13sD6jGm7GOVg44lQtk1IDKAle
	LUASfNhvw/W2+r5C0dMwESnPRfD1g0b0+6FL+NYBrr/Osk0o3882YUUUFoR0oTaSwlWMrR7fL1R
	tY1E4SNzSeaeJeKO6Gw2oEQdI70aDSUGffITTNjJnu1/v2OxH9EmaZrdWHEFafZmRCfgUbXfAbh
	hwZdMaoZrJdEKyurzEP+lfh80B4HmLX2b6yu380BhbetFGuy3yXDKKRIcc4lfTzu83dJxGVkhZ1
	A5c+vLSFX5zkAYlYPLtWAKqFTlQTTELnJWtzMOWQ7hKXgo0iiMY6KCZhUuTSTbGO9hlXbwgMz9M
	aKmVzzGiE3U9INVdot3Iog7m2g05zNNfxjPrIgtJ19J9+3w9VB5J8QaraN/gS9KP2/YKrIQ0gOK
	LE9OcZ
X-Received: by 2002:a05:600c:4691:b0:49e:799a:8951 with SMTP id 5b1f17b1804b1-4a01aff4450mr54837075e9.11.1790838503244;
        Thu, 01 Oct 2026 00:08:23 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f98224csm39045465e9.3.2026.10.01.00.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 00:08:23 -0700 (PDT)
Date: Thu, 1 Oct 2026 09:08:24 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Archit Anant <architanant5@gmail.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, andy@kernel.org,
 nuno.sa@analog.com, u.kleine-koenig@baylibre.com,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 02/10] iio: adc: ti-ads1015: sort headers
 alphabetically
Message-ID: <20261001090824.00002477@gmail.com>
In-Reply-To: <20260930171204.12863-3-architanant5@gmail.com>
References: <20260930171204.12863-1-architanant5@gmail.com>
	<20260930171204.12863-3-architanant5@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 30 Sep 2026 22:41:56 +0530
Archit Anant <architanant5@gmail.com> wrote:

> Reorder include headers alphabetically to comply with the preferred
> coding style and improve maintainability.
> 
> No functional changes.
> 
> Signed-off-by: Archit Anant <architanant5@gmail.com>
> ---
>  drivers/iio/adc/ti-ads1015.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
> index 93a165c5416a..ef03b74bda3e 100644
> --- a/drivers/iio/adc/ti-ads1015.c
> +++ b/drivers/iio/adc/ti-ads1015.c
> @@ -11,24 +11,24 @@
>   *	* 0x4B - ADDR connected to SCL
>   */
>  
> -#include <linux/module.h>
>  #include <linux/cleanup.h>
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
>  #include <linux/init.h>
>  #include <linux/irq.h>
> -#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/property.h>
>  #include <linux/regmap.h>
> -#include <linux/pm_runtime.h>
> -#include <linux/mutex.h>
> -#include <linux/delay.h>
>  
> +#include <linux/iio/buffer.h>
> +#include <linux/iio/events.h>
>  #include <linux/iio/iio.h>
> -#include <linux/iio/types.h>
>  #include <linux/iio/sysfs.h>
> -#include <linux/iio/events.h>
> -#include <linux/iio/buffer.h>
> -#include <linux/iio/triggered_buffer.h>
>  #include <linux/iio/trigger_consumer.h>
> +#include <linux/iio/triggered_buffer.h>
> +#include <linux/iio/types.h>

Small nit, but I'd drop iio/types.h as it is included by iio/iio.h
(No need to send a new version though, this can be addressed in the
future).

>  #define ADS1015_DRV_NAME "ads1015"
>  



-- 
Kind regards,
Joshua Crofts
