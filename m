Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793852953;
	b=U/chE4GbVSNo6uHPyxwv4okZo76qZoRfJOHRGXppp5I21Exm6TaMV1ovi8qmDtzO8Ha3
	 KZaIKEXjQj24q3YQmLrl0CrKDcsw1AaSMa/D9vDI+S9j5uLSYT19eDjwjujEROix2pl2X
	 LrBLXjGjIZtEgGr/vLYRlmsPESk9FVSfT4T15qNMXGmvsOvobBGEH2tlrzVbYqE558Qpe
	 eciIxhXD4QU/uETJ19ytPqiug2x2OwH2z96o2HWgdGhcz/7q65FC7LhwP0fSaIsldD0kf
	 MqAMV5XYojx5HCgh6T8yr0zxLf1wTHmvVEgOz3vHDr0n68RPqFNSlTb/ammBd/7AlFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793852953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=JMo4bIblf20Ox/wHcnXswTyrH1vkkJSSvlX7wiz1Kyg=;
	b=5N++FqmFnBiG2pvdnLSWfXr25Y7A9kKrT73PyR1LnsZerhdMedL5OL2xZBqI/gPMU8PG
	 nwTCpDCreF0i5/3tVUHmk45rOMtPEo3SqBuU2AcBsuwv7M9TFq3/FpxxmRxltdhZ0UtrO
	 FgNdF56sxIfq6NuECX4oJle+ctssBK6YtVQLz/w/HtVYe0xq2I45w3n7myeQLvnyWcM/P
	 FIhJNL2pv73WJtMtFKbGsyN3JNaH2nzwO4AU6Pj+uWGKnNIqPNpV0cB4L9ABUBDzSACsH
	 qmoTvA0QJO42/LR4FvruhcojfIOgQJtmiJAQPia9rxgAvhWJZFrnywGELztxWoQs3CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tof0ZRuF;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCEA606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 04:29:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CCEA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tof0ZRuF
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so1278622a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 20:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793852952; x=1794457752; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JMo4bIblf20Ox/wHcnXswTyrH1vkkJSSvlX7wiz1Kyg=;
        b=tof0ZRuFm308akvK86pHS8lOvkDLODF7X76iDUMsZeoOAL5PeMPvKicgb+VR7eA8CE
         CDZC4KeK2881mFNc4MHX8cmbbUI2qbshedQ/ofBO8Mq5HF4rC2Z+moQTT0ckFab2R5JR
         fAPGQIoEe7N94vCvCdMy3q7kKIbMV3/p0/vvankyrxL6JVdvhKLjZ8BJCqAe8sDx5zDF
         xsjq+wFej52YMT6lCH6GXSplD8aF8FkG7ure/XRkcPVwjxaXKUKuPuiSFPTLRnW4M5b/
         gQ/Q8blQ6krBTOD7JQYVAhoGoHVRLdaU+XTeTnuOJrm0uaKCo/o0A3l5PAkQofZGm437
         8nkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793852952; x=1794457752;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JMo4bIblf20Ox/wHcnXswTyrH1vkkJSSvlX7wiz1Kyg=;
        b=P/uzmBsFHgjAkT84XEj8SHB5oOaxr3HV/bK0WPToTDroBIuebc9JuC386qqwppKdGb
         jA+tFWSrwfQAPx7CPV9pnQrdvFS6custcF/dmFbNYJIqbnr/Cv0k0cQuxuUyeUbH7De4
         /+lgJ8K0YXMuE+fIBoNMFIOlDIWag1TLvC5ap1zW/MeMPpJklUmo4dgMlnI0689ryqmr
         m/asVJJ/5vN6ZyrHYgi7SKbEmI/WiwgMujWM8eeCklPg/p4BRBecU4iac2Auk2waoNOl
         tOkIw0uWj4Z3u0u383M8ITtnBs5+04sk5ytD0Amin9mkdJdaE85HI7whjXni+Qxr+Fcm
         HkPg==
X-Forwarded-Encrypted: i=1; AKwUvBxanxqtIzo/HpDIDOLa8whCWmBjFGw2Gl1BUFGEP0L78zNPrJzjh7wklFqKKpGDYpoERVH/1vuZYKY36Pk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pxNDh74mOpkGAFWRPPLajKofTjaHrPkJr9BcQxXQDmA98yDyW
	w70glYpiZ5HT6Huno4pvHDZ0F28aD1r3XRSJ/0i1vKBcrGQJDNDgDVly
X-Gm-Gg: AYBFou1lpf3h11ftwQPiHr90x3HWC3J2xHWoR5dezAmyd4A0MMamIe6iubVbNGn62kn
	XhgefnqK5unBaklYAono/qq8YX5VUkV3pCHAYHF0ZEZunbA2DlyowXqgx92DngaLJ0GUyk/cRRN
	WO6MLiwBsStj26eY5AoBF61ZAefzvgpg+tLYtuxwqzv4bpO3gQuysIINuoDR4HEsa9I91hkpJEc
	+HmA8Jgk/VF1ssPH9XyonFCshLVSRTW9PmgzrY0VIY+0l0wJRPNKqEXjW8UD9RUF7n4/SnOogvw
	o3pqCo+eJI0fWXs/NKHMmHNIo81xvkX2C0X5vFmdTb8gW2LqQxBGwkD+XwBHtQxjKGpFBm8MsM9
	73tOfR9XlnY614OqY/EctHc0YuqHubqy/GpFvRHDKIg1eAEhyB5eiVnx6gXJFDKgP4QGDVYVEyN
	IIOm5Oo0xftwsqlJAbht9Z30wxykTYFa8kR8gvNdyRDrsXXrrl2DCJerOQ8AEzJtElwDg4pLVd2
	KtU5GYe+5p4n2Bc/12PF9v1nqZvXIUlO2NlUW4ZUp9CKTZylffFjgmhrAYqIY/tJJhN1todmz3t
	aj1ygdahXtthp3xJTGNzs6UCYbAqa+GB77EbJVkNwHU/KA7g
X-Received: by 2002:a17:90b:224f:b0:3ab:27f0:c90b with SMTP id 98e67ed59e1d1-3ae8983cf4emr16977504a91.53.1793852952411;
        Wed, 04 Nov 2026 20:29:12 -0800 (PST)
Received: from rigel (194-223-74-160.tpgi.com.au. [194.223.74.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32812a6sm1611635a91.11.2026.11.04.20.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 20:29:11 -0800 (PST)
Date: Thu, 5 Nov 2026 12:29:05 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Adrian Ambrozewicz <aambrozewicz@nvidia.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 4/5] gpiolib: don't overwrite the entire flags field in
 gpiod_free_commit()
Message-ID: <20261105042905.GB8436@rigel>
References: <20261104-gpio-desc-flags-atomic-v1-0-e23cedf619ba@oss.qualcomm.com>
 <20261104-gpio-desc-flags-atomic-v1-4-e23cedf619ba@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104-gpio-desc-flags-atomic-v1-4-e23cedf619ba@oss.qualcomm.com>

On Wed, Nov 04, 2026 at 04:36:59PM +0100, Bartosz Golaszewski wrote:
> Use gpiod_update_flags() to clear all request-related flags in one go
> instead of risking racing with concurrent users and overwriting any
> changes they could have done between READ_ONCE() and WRITE_ONCE().
> 
> Cc: stable@vger.kernel.org
> Fixes: 35b545332b80 ("gpio: remove gpio_lock")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/gpio/gpiolib.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 63b65b646fbcfa9ea0f724d1d3e1ac22ba28f638..28d4cf0cef70f437dc4271f82975d09dc55125ea 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2693,23 +2693,23 @@ void gpiod_free_commit(struct gpio_desc *desc)
>  		if (guard.gc->free)
>  			guard.gc->free(guard.gc, gpiod_hwgpio(desc));
>  
> -		clear_bit(GPIOD_FLAG_ACTIVE_LOW, &flags);
> -		clear_bit(GPIOD_FLAG_REQUESTED, &flags);
> -		clear_bit(GPIOD_FLAG_OPEN_DRAIN, &flags);
> -		clear_bit(GPIOD_FLAG_OPEN_SOURCE, &flags);
> -		clear_bit(GPIOD_FLAG_PULL_UP, &flags);
> -		clear_bit(GPIOD_FLAG_PULL_DOWN, &flags);
> -		clear_bit(GPIOD_FLAG_BIAS_DISABLE, &flags);
> -		clear_bit(GPIOD_FLAG_EDGE_RISING, &flags);
> -		clear_bit(GPIOD_FLAG_EDGE_FALLING, &flags);
> -		clear_bit(GPIOD_FLAG_EVENT_CLOCK_REALTIME, &flags);
> -		clear_bit(GPIOD_FLAG_EVENT_CLOCK_HTE, &flags);
> -		clear_bit(GPIOD_FLAG_IS_HOGGED, &flags);
>  #ifdef CONFIG_OF_DYNAMIC
>  		WRITE_ONCE(desc->hog, NULL);
>  #endif
>  		desc_set_label(desc, NULL);
> -		WRITE_ONCE(desc->flags, flags);
> +		gpiod_update_flags(desc,
> +				   BIT(GPIOD_FLAG_ACTIVE_LOW) |
> +				   BIT(GPIOD_FLAG_REQUESTED) |
> +				   BIT(GPIOD_FLAG_OPEN_DRAIN) |
> +				   BIT(GPIOD_FLAG_OPEN_SOURCE) |
> +				   BIT(GPIOD_FLAG_PULL_UP) |
> +				   BIT(GPIOD_FLAG_PULL_DOWN) |
> +				   BIT(GPIOD_FLAG_BIAS_DISABLE) |
> +				   BIT(GPIOD_FLAG_EDGE_RISING) |
> +				   BIT(GPIOD_FLAG_EDGE_FALLING) |
> +				   BIT(GPIOD_FLAG_EVENT_CLOCK_REALTIME) |
> +				   BIT(GPIOD_FLAG_EVENT_CLOCK_HTE) |
> +				   BIT(GPIOD_FLAG_IS_HOGGED), 0);
>  #ifdef CONFIG_GPIO_CDEV
>  		WRITE_ONCE(desc->debounce_period_us, 0);
>  #endif
> 

Not directly related to your change, but the debounce_period_us is
protected by the GPIOD_FLAG_REQUESTED flag, so it should be cleared
before the flag, else it could potentially race with a new request.
Not sure if you want to fix it here or in a separate patch.

Cheers,
Kent.
