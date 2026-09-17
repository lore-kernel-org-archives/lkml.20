Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923E24DE70D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789643809; cv=none; b=rVkPgCaE86Yjql3P9Ip2ttMLfSmlarXs38kil2nIaxGDs/v29IuuD3zTous2eENEm6HcA3ZCesJE5QkJbz9ZTkIbESB34Dy2DYfId5KBrZGOK88Yr6PUiVFsYfBsjM+69xvVTnEFdkYJyst42wa89Dap+mo+bpXAlLrF2Rshdb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789643809; c=relaxed/simple;
	bh=YwrASEiFTPqOLvaKbo8DOfVrCjc8jkiSh0jyFtRu46I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=esVPvUiqS+pQbUlUG0+qU5O0k6PB5z4HMDSNHaRlL7fXN64caHS8OCq78NhX5sgDqP/C+jnc064KW+FA8Dh69JMR0+cqK1O/kC+ROnoQhBToK10ZSphwYyWzBQO4Nq5QENl7V3s0s4R30u5WPPmyGd29uvwbl06c7cB6h6DusqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g7Z4lUJT; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7Z4lUJT"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso4990475e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789643801; x=1790248601; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Gq7s5uS4gkydY+KJLPBw60QeHf1NaLqQ1+aLcJdxtA=;
        b=g7Z4lUJTffclkMHTyi9MkwIXleeJf1LILjy3K5OMkXXcJ8N3VZCEDlOD1fFg9E3S+5
         ELjbiDkHO2r9j2sC2cbVNXOaa4c2ujJjzgZtONMDhvwXswhT49h7CBvuj6LNvLnVZv0l
         e6aktqgzpK3lpBEKlgI/C+Cxvf3dvC6uSDitqWZygdFUW+ggaNw56RYSrnVwFhjOg9tf
         eXfNNHmd1wjQlS6YTNSaLEuXhxV9wP3GGNs/BYaeLmqTmDF1zXnIb86PBSbyJaS/Eszq
         Q6Bve1yaJA5lJot8KP15vKeg43N181bhqhtwqvnI/08XkitbT1DbVg/T5pu0Ld1vZ9kL
         LNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789643801; x=1790248601;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Gq7s5uS4gkydY+KJLPBw60QeHf1NaLqQ1+aLcJdxtA=;
        b=0AFxy6s+n62hlM0+K8vzN8eNf1XEW6peI0U+MvY8rTAzL3v2dTHQLONFcmv1CfrVp/
         uIEQqY02GJc2mprvHUk7s/oU4/gJS1UhuEuL2JwdRjicsEqTRV+0dWI+kEgKSpqB/vmP
         I8V1xFdeYafI2L1pe9D2rRWhCPnPF8XHxIOWTcqBLt5LFLxqPeOx4ZzX7i4/DYTi7wWQ
         oGmMTqDJQ8s06wGAQRT98kGO/qlhnc9b/hmJvjQj/sknswI273Glf/JUnt6cfB7jSyHK
         1yl1BsAOR+robzA3S1wF8ozNdQ1HLiFpRWCwNusKCIe1B6yrDdCsBpCubVZ4bY1V+ULA
         BMUg==
X-Forwarded-Encrypted: i=1; AKwUvBwgHymwskXs2XtSluFYFuv5MYNYj779dYV+wiaHL5kxHm0TrKzQXNKRvIRL4ikZA0amwYxvkybsUQQpjqQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kUMhkR9U8zA6yXdIrQmSJgggIUsiBKghj1g7siw6KiFSWsyiBS
	0Gahby+/aAJLUUZpWzLHytObGP/cfC0BufI5VADcZtFcngPnlZIXakaP
X-Gm-Gg: AYBFou1/StiDvVHTPUTGLLKAy8cQX0Pj1qnJgEGWdKDdr9sD9SHCJn5QzDtObAt+y4f
	usfPz28QaFjmFTEMGiV8I6V2z1TdKBgW4EH9g++Qr1yFTSa3CmceTt9moKyCiK9mtrfAsKXvX77
	RUnKdr3YGmETWm1OMTD8L/+f4hCzJFTnHebTTSFlzw/xqQMwE2igRZGDhCtvn2jhBdd6pPHGtGm
	/0qzhhAbK9KBnjz8sW4V5ZoJa4lxiiXiKHeUJn/jiz31PDsThK7WJi0JOtfvR2H+OR9EO31FcZ7
	Wju4C2koIoXcxbuslMA6e9sykLVIYnjOA8E1JSZWh4r9ry1Q+4zgiz8JX81XBuKyrgVzdrFYz06
	2902oFthu4o8tScUFFC3csCkoj7Mp5zVFnbEptITfm+wnmrye+0GFiezH9u2XKjXshXMEv16nkw
	uWscM5nTFjhSb7klAm/COoqsgpdtbZbVj2chCehLCT90jcOGyTN4BjJYPrJtbuJOiGvb/NxEGCs
	5Ynpda9gAbnawJKYhXFcBr4fIp9Z5f3k5avWKEEuM9I13Zqcv9NzBgrHRXvZQLGtLIl97gKfM9p
	l6TCbDVQ57k7r8yKBxmeTah1K9tS+WPzZ/3ZmCzVnaKrmrdTTnmBdjMO0yFQnq9/TrtoU1DSHIF
	PwBKQJM1p8Afdh9cwhlX6eb5mRWqhedg+UnfnK0MAV51sh1mMZRtp06uEBDqJrKObtts/ipi4bS
	qU2xQo8ViWHl8XGXg=
X-Received: by 2002:a05:600c:8b8a:b0:49d:17d4:aff2 with SMTP id 5b1f17b1804b1-49eac46376fmr141199765e9.1.1789643800568;
        Thu, 17 Sep 2026 04:16:40 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd1d0978sm66774905e9.2.2026.09.17.04.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:16:40 -0700 (PDT)
Date: Thu, 17 Sep 2026 13:16:38 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Salah Triki <salah.triki@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: temperature: tsys02d: Fix state
 desynchronization on resolution write error
Message-ID: <20260917131638.000034e5@gmail.com>
In-Reply-To: <20260917091609.626043-1-salah.triki@gmail.com>
References: <20260917091609.626043-1-salah.triki@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Sep 2026 10:16:08 +0100
Salah Triki <salah.triki@gmail.com> wrote:

> In tsys02d_write_raw(), dev_data->res_index is updated before checking
> the return value of ms_sensors_write_resolution(). If the hardware I2C
> write operation fails, dev_data->res_index remains updated with the
> new index despite the physical sensor remaining in its previous state.
> 
> This leads to a state desynchronization where subsequent reads via
> tsys02d_read_raw() return an incorrect sampling frequency.
> 
> Fix this by handling the error path first, updating dev_data->res_index
> only on success, and using guard(mutex) to clean up locking.
> 
> This was found through manual code review.
> 
> Fixes: 53bf4d067d51 ("Add tsys02d meas-spec driver support")
> Signed-off-by: Salah Triki <salah.triki@gmail.com>
> ---
> v1 -> v2:
>  - Use error-first pattern (if (ret) return ret) instead of if (!ret).
>  - Use guard(mutex) for clean locking and simplified return path.
>  - Add note stating the issue was found through manual code review.
>  - Add proper blank lines.
> 
>  drivers/iio/temperature/tsys02d.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/temperature/tsys02d.c b/drivers/iio/temperature/tsys02d.c
> index 3ef72347456e..20f67134affd 100644
> --- a/drivers/iio/temperature/tsys02d.c
> +++ b/drivers/iio/temperature/tsys02d.c
> @@ -72,12 +72,14 @@ static int tsys02d_write_raw(struct iio_dev *indio_dev,
>  				break;
>  		if (i < 0)
>  			return -EINVAL;
> -		mutex_lock(&dev_data->lock);
> -		dev_data->res_index = i;
> +
> +		guard(mutex)(&dev_data->lock);

Please wrap the case in curly brackets to define the scope for guard().

Additionally, add a <linux/cleanup.h> include. I recently removed kernel.h
from this driver and cleaned the headers, so I'd recommend basing this on
the iio/togreg branch to get the changes if you haven't yet.

https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?id=6b5856d16c2e9213fd7eed8a4121aa3ad41081b4

>  		ret = ms_sensors_write_resolution(dev_data, i);
> -		mutex_unlock(&dev_data->lock);
> +		if (ret)
> +			return ret;
>  
> -		return ret;
> +		dev_data->res_index = i;

You're missing a return, this will just fall through to the default
case below.

>  	default:
>  		return -EINVAL;
>  	}



-- 
Kind regards,
Joshua Crofts
