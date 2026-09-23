Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B124837F726
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790139216; cv=none; b=EDcQbaewM5qjv7sA4aOv7U7bEedvZI9bpp6kZMbdI7m7xwp7OijtSD8yroJhoDBeW/ui6aLMZZm10taUL5vojIuHhjJmvi87EHyQV/qz02H7MGH8rsPKzX6jEIqcKCtpQXLp0Bzg9DSi5tBLiRGJvVr/2CdCo/zVLPYm8+v+nH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790139216; c=relaxed/simple;
	bh=SrOtEX/ghHHp/7OJ1oFoNqlawokWvnWr4PS8cN8dABU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GR0R896+XJofBXJyJFGCEWTfCapo8NmAYmPqdbrSzwp2//NVgbIDMBMrZNVw/7ESbYLZ9n18O3UujkKK8thS8F0ukoUYgwJEKctbrIAz7ZwL+AmimbVWoptoaVZOF9cmmOpqQQKzhkA36O4YHHKhWhjGJ4ULqX6W3JPOOrdQMYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nqOqehCp; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nqOqehCp"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a354118856so4057871fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790139212; x=1790744012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AylAKepIyU+pHcAiXkxcY1iALnL/FJ5BBVyeQ6kjQtY=;
        b=nqOqehCpC91FGfrfMkgvcifeVHX7COAgRZPt0vgV7ZZCzWzLOQLd4WLVLMaQ3uab0g
         HF0qCY1WyfOSE4RnbEqY8mLh6O+C9V+Ucf2/skSVC61/aw/tjtckkF8tAXC+mi+nvmRq
         rFf+rT/Q71oCNbgWVnodt7QJTSuhy39ZDdDO57HBpqdFHPOWcxjYKkVrHBYgY69sga54
         18eQTQjaw6SuSybo7uBsEaExlHKBMALjOj64HD5FHua2kukA3YefOkwVJYBYoOUD60AF
         6XAUxBzLQFisq7C30vuTw8B1qRqhpxZdkLSVOwhVphtXIm7mOCiObE/ap2dm8jfKld22
         PuRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790139212; x=1790744012;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AylAKepIyU+pHcAiXkxcY1iALnL/FJ5BBVyeQ6kjQtY=;
        b=r0Yj8KaRLSWCETl9hIOSgghwNSW99MFfCbxbpFXoue2G76B+9DAnnUaiCUtzNOM4d+
         HKIgGNs4Gf0fnspK4Ek4gkuAZ+4AnhbIIan3NlZQpTcU9VU9N2dcioYb4nAgAO1OLVXZ
         BUYQZA+Y63Rgor44gHYXjezZominDIjj81yG8RSG6ct8pX6b5FxC7n78Sm3bQ1mxdK49
         OKZOKB0veh1v20sXgMFnhrphHhEMgUPQbgyf3ZMWlvR3DFlL8oNn0BO1ueUegQAzCUxh
         QKy9VNmTJCvfacjg55JXH5KtlJzRzPe8hiRRqEObqzTaV6eTNQmuLUFtsIUcLbn/3zW4
         +Wrg==
X-Forwarded-Encrypted: i=1; AKwUvBzzglqgrmP2gWQwQZSFYRAYO0XICM1FjOsuAp2f5JGFpEaXpqobgdQKgTcY077DdJ5d/92/iQuz+xUu9x8=@vger.kernel.org
X-Gm-Message-State: AFuF++mV3WnFJnfLWUaFuMlzReyA83w69D5VWzmsy8C99Xrevp6Rgyjo
	PC89x/VL5Z5jwk97cnSsrs5HPsTItzmM0E+CRRR+Ins54hvOXB7FNuwK
X-Gm-Gg: AYBFou3jblxFc8j8UyPDJ4u67kq+WIcg0Oz35dNpjms+uO38zP+5HPqKMtY9Mpul5Gv
	ZFSiod64HvS+E8HKk1D7rJtw3Dub+sm8hZrOh67ua5Spd+qwm6voW9atnegGdwbC8ylYjMaSdPl
	23TG9cRScgfcGtyvsW6znNHy7zjbHy9buWmaISdPYT7G4LG26wh78ZyEPu5Lrr9HKS5tUyWaSGM
	Bdjdp5cp61rwjAT77pz/10Sz4WlVLqcJSn1uxFLV4LiMoqGAdlZG/9IDx5hgn89kRs4jmnPxbLj
	wMAo+LgNW5NPIu+d/Bv7qIdrVe15r60gNaShxOj0DSlo8usELGzzGXHnrEIwCBzgevBV3NvrELM
	+5tccVdWJQR7OzBjP3VB0QW1w9CT5LL+sTEICYljl2YGvToX9+ZoI1uLMQ9/dk/ig58yndEJVc0
	jYqCpObmWMfYXs5mnBplalyj2KqOg2Q4/MQnGl7zD6Xm7aJAJ8tts7zvce8fXH0ch+m4ubrd3P4
	yDqIJtGJrJ3ztFxvPhXx4Z7T+qj6dmeCVbXWrPsWQWkybLRPbnJKBg=
X-Received: by 2002:a05:651c:a20c:10b0:3a5:da9c:4659 with SMTP id 38308e7fff4ca-3a63068020emr1910501fa.27.1790139212242;
        Tue, 22 Sep 2026 21:53:32 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d85893cbsm327531e87.47.2026.09.22.21.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 21:53:30 -0700 (PDT)
Message-ID: <a71d93ad-815d-4f6b-8046-e331d165a1d2@gmail.com>
Date: Wed, 23 Sep 2026 07:53:28 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: gts-helper: add __counted_by_ptr to struct iio_gts
To: Bill Wendling <morbo@google.com>, Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, codemender-patching+linux@google.com
References: <20260923041630.2553973-1-morbo@google.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260923041630.2553973-1-morbo@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/09/2026 07:16, Bill Wendling wrote:
> The compiler attribute __counted_by_ptr can be used by KASAN and UBSAN
> to detect out-of-bounds accesses to pointer fields in structs where a
> corresponding element count field is available.
> 
> In "struct iio_gts", there are multiple pointer fields associated with
> an element count. This patch annotates these pointer fields with
> "__counted_by_ptr" to improve runtime safety:
> 
> - 'hwgain_table': counted by 'num_hwgain'
> - 'itime_table': counted by 'num_itime'
> - 'per_time_avail_scale_tables': counted by 'num_itime'
> - 'avail_all_scales_table': counted by 'num_avail_all_scales'
> - 'avail_time_tables': counted by 'num_avail_time_tables'
> 
> To ensure that the count is set correctly before any pointer is
> accessed or assigned, we update "iio_init_iio_gts()" to set the counts
> prior to assigning the pointers.
> 
> Cc: codemender-patching+linux@google.com
> Assisted-by: LLM
> Signed-off-by: Bill Wendling <morbo@google.com>

I like this! Thanks!

Acked-by: Matti Vaittinen <mazziesaccount@gmail.com>

> ---
>   drivers/iio/industrialio-gts-helper.c |  4 ++--
>   include/linux/iio/iio-gts-helper.h    | 10 +++++-----
>   2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iio/industrialio-gts-helper.c b/drivers/iio/industrialio-gts-helper.c
> index 4f52dc373abf..4de6324fd923 100644
> --- a/drivers/iio/industrialio-gts-helper.c
> +++ b/drivers/iio/industrialio-gts-helper.c
> @@ -652,10 +652,10 @@ static int iio_init_iio_gts(int max_scale_int, int max_scale_nano,
>   	if (ret)
>   		return ret;
>   
> -	gts->hwgain_table = gain_tbl;
>   	gts->num_hwgain = num_gain;
> -	gts->itime_table = tim_tbl;
> +	gts->hwgain_table = gain_tbl;
>   	gts->num_itime = num_times;
> +	gts->itime_table = tim_tbl;
>   
>   	return iio_gts_sanity_check(gts);
>   }
> diff --git a/include/linux/iio/iio-gts-helper.h b/include/linux/iio/iio-gts-helper.h
> index 66f830ab9b49..7e7d3396ff1a 100644
> --- a/include/linux/iio/iio-gts-helper.h
> +++ b/include/linux/iio/iio-gts-helper.h
> @@ -58,14 +58,14 @@ struct iio_itime_sel_mul {
>   
>   struct iio_gts {
>   	u64 max_scale;
> -	const struct iio_gain_sel_pair *hwgain_table;
> +	const struct iio_gain_sel_pair *hwgain_table __counted_by_ptr(num_hwgain);
>   	int num_hwgain;
> -	const struct iio_itime_sel_mul *itime_table;
> +	const struct iio_itime_sel_mul *itime_table __counted_by_ptr(num_itime);
>   	int num_itime;
> -	int **per_time_avail_scale_tables;
> -	int *avail_all_scales_table;
> +	int **per_time_avail_scale_tables __counted_by_ptr(num_itime);
> +	int *avail_all_scales_table __counted_by_ptr(num_avail_all_scales);
>   	int num_avail_all_scales;
> -	int *avail_time_tables;
> +	int *avail_time_tables __counted_by_ptr(num_avail_time_tables);
>   	int num_avail_time_tables;
>   };
>   


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
