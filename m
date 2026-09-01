Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A523D9DC0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 02:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788229610; cv=none; b=efXlgM/R9wIRXoRlSK5zB84S2aEFEnqEQldy/Pbk/drBCrdYXm0RAJNUUvKgAKf1m9DDFg4YcA9D8jUOMFQDVFG988PQrZpIcAGRcsdCc6L3KWW4C8oHNPfDsKYGq+shbvrtOeth/EI1mtzT8wdgjq6eoohQYnxI7J4w6/h0ZWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788229610; c=relaxed/simple;
	bh=1ivU+b0VUEHSpmznsrcD2siFu4zCj1n7MJ79jTDXJQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NTwcDxJZ4C1O3CZhnMBL0jcsdcdsbgD0EnZs4CCYG12IZRMr6G0tLt5Nk82lQ9yDddAS+HmxvybyRG4fdVRxmDOQR37xe+J0wqJ0EHcQ75wN48Vfz3+aRgHUwRKrhtKTjMkGHmg8yaokh6qml5lI+TUd2zmsTu5G69RnpnHlckY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9RlQtVH; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9RlQtVH"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-855de2d0d4dso8506757b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788229608; x=1788834408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jDt+CxLSf4w3iJAIBpJcXGUG31tyCk7fy3CEY8EdRVs=;
        b=Q9RlQtVHp5uxy5UiwvwkX/lENyhAiUiKmAP+55IA6lvoguQaBJamzC1Wm+0fatIdXN
         8/RKdSSrAvdlxfOh5f9lgqtnbf90UEsEeqzjwsZaUMTUD8hGXW2WDOZLAffm7TV3UClR
         0WikKPLraBpwlLqFFDazf4bhIknTU1xCuBjKl5u3lF53i2W2LXBtQ74OHw4dS747E1i5
         ZCcw6lOdXF2FfsFz60LSLtVg4ij466oF78w9DmVBoTa2BtJcjPi2fzw8KbsAfp2jc906
         bJCMHcbG6l5S/KcV6SJWIJbqY2Kh6rkK73EbLYmCcz+HNAcuxNUdwEiRYbtPzCBl4nNj
         4QbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788229608; x=1788834408;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDt+CxLSf4w3iJAIBpJcXGUG31tyCk7fy3CEY8EdRVs=;
        b=lTG25/X6f2vwmNQKO5n1/KhWALK+j18rxyCgbQv1ru1YAH0XGHx7wChH86B2VfWUYl
         5lgwT1Eee6umHzVD4spmLqcunBx4OhKbU2ZBKL5wZixYcwmsh64WzzH0Dr6KOIXSGfPc
         /ZS8RiPTd1LnC7iwG67MlQKhdzDONXl03f0dfETsTtiVRL9yAuHivP8iZbTRkUS+bWo0
         GJwWDngNzb3f20Q1oFCSqrCuyvAmrRmlko2ZgOwsMlVSelJfKaJCsA47KgDl9nbrVUr6
         QmmNEoSSqArdm/ju7qHSQgRl/grlEgOHjilnv13OkyOnwtlBXr3cA/tH/fE8pU0F722U
         E9Ig==
X-Forwarded-Encrypted: i=1; AKwUvBxFYET8hWIDFw12m+F7SCZ95JGpI4H5yBP7Hy4E4Lb1RfdXbTVouH7itTis7SItW4HA/87a0l9a6VSunRg=@vger.kernel.org
X-Gm-Message-State: AFuF++mWVXbRXEWLc+cc8f3zJAil3s/q+c0sFDD6U8KpccrCioiLi5fI
	vD5ayoH1MbtCoO4Q4zlMp86FbTpK0rgoM7IYOl2LlOKdK9LcFp7QCpuE
X-Gm-Gg: AYBFou3eIaLeGKd6dZr9a8zd8IzDHaxLCjv3j0UisYazT96qo6yABQWv15jxTjIAGMJ
	0JaXhrMzCcEtYskCD96q+IAxgShFMFSW9lW9OGTSOMz1WmP6ipZ20s0XEL823LcSu/Nj7428NBA
	2tGfVIVsrmSftH4XJ66ZJItVvmVhpTTjRFAKR+NJzwsHdE2DO4fJjPRVylgBhZU6UjWizSvgZZN
	/bz7IqbTy6qiKrvMt3Jy6NZniZD5CFBdM5bE/8bLw3E5FFVj9WCuxcJlvzmVppBMPrZ5SnHsOyb
	N4hC8ERtTw8mWCBSqB3UGdWyYv4oa4Yx4KCC4G+TEk0ZcqhjoQ0lW+XzwbzA41uYXdg6+1Vk1xN
	YpvAP6qjX/52qT7r0/lhTaIjijRJx04KcSq/CE1vff/5hETYm8mPacgyWJ2Pe6vH/a3NLypkDBw
	WmpSbj+YUxu0Ft4+dq4v6c642xWlH666FOUPqpMwwWtW24/jh9lFhiz9D8yVsUYmR/x0ZVqQYUM
	bt4jHc=
X-Received: by 2002:a05:690c:a65a:b0:834:fadf:603c with SMTP id 00721157ae682-86948ae2315mr9271507b3.2.1788229608300;
        Mon, 31 Aug 2026 19:26:48 -0700 (PDT)
Received: from localhost ([2804:30c:94d:7300:da0f:c2c1:1aa6:43da])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e66abc938sm64653947b3.37.2026.08.31.19.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 19:26:46 -0700 (PDT)
Date: Mon, 31 Aug 2026 23:27:37 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: mdshahid03@gmail.com
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] iio: adc: bcm_iproc_adc: fix include dependencies
Message-ID: <apY4GY-0_XMSfE9B@debian-BULLSEYE-live-builder-AMD64>
References: <20260830170919.470974-1-mdshahid03@gmail.com>
 <20260830170919.470974-3-mdshahid03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830170919.470974-3-mdshahid03@gmail.com>

On 08/30, mdshahid03@gmail.com wrote:
> From: Mohammad Shahid <mdshahid03@gmail.com>
> 
> Add the headers required directly by the driver for completion and
> mutex APIs.
> 
> Remove the unused `linux/io.h` header now that register access is
> handled through regmap APIs.
> 
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> ---
>  drivers/iio/adc/bcm_iproc_adc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
> index e46e3761993a..2b59819c4ca4 100644
> --- a/drivers/iio/adc/bcm_iproc_adc.c
> +++ b/drivers/iio/adc/bcm_iproc_adc.c
> @@ -4,11 +4,12 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/completion.h>
>  #include <linux/delay.h>
>  #include <linux/interrupt.h>
> -#include <linux/io.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>

I think that's okay. Though, if you go for a v3, you may also add 
#include <linux/bits.h>
#include <linux/types.h>
#include <linux/array_size.h>
#include <linux/device-id/of.h>
#include <linux/iio/types.h>
which mostly completes the list of includes iwyu tool reports to be missing.

With best regards,
Marcelo
