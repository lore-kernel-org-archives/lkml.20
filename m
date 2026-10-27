Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793127407;
	b=C6+yhCABY0qIzvJGM05cViOtPwCq8kNHvGJzmJONTkSN4Cdc85p0zSXd+AteATrDsL+2
	 X9gz+DbKXfrMDJNBjQEj94WYjcwAVmeEjsetXqqD8xlteO3hqCCZ3HFM6qh4wRQ/38Xyv
	 iBV3mMOlMUw0FQ4khHoEHxVrOmJ3Nw6LHMs3fSZed0HhQxFwCbXcwfuxxKGAg7tYLIzyL
	 qDMfccz5GQl8OA8ErfSSvgmnIiA3k7Tn2W+9sA9pUdYe6y66iQh3dHIiiIfR6aMxF2kUu
	 pDe9pWVaUqXHdDohTSR4y6BFEtL9ACwadh5eJUNv6QZhkj9p6hkL1gZqRQe709gohOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793127407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=sdw0zAFeaxdWH5BaxHh21oqt1eSDwMTyb26USwQqQls=;
	b=HCHXPjg9z5wWgFA71Uz2b7iSB4/M1tIoSVDKYTZ6l9GVrzSsuU1QAyivKeiSN7eoQvP8
	 YO+mIZt1Oh1gjVPM2/r09hVhaSVpKldGMt1A9EzC/jtqO08QsqSHxcpIv3NEAVU6xkeMp
	 IMwt8npIsM3BwmatAPpe429+Sgechva+OTNhueyeg94NPkMFEkimItx9vAqXtvYoUo7Mb
	 XnRoyBtJkXkivmI2Jg2U920XJw+gUNhdYVpLxejRQcpQaXAqk/dshqkj/4wHNQ+wdEj1D
	 p1iWec5iwYK0fF7eSe7QKmCY8xkuB5cvD/Az1qeFiyQBACXSnS8xSI3kuOk66aSlRJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N9SogX0m;
	arc=none smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC6F606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EC6F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N9SogX0m
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-99071945aa7so151239241.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793127406; x=1793732206; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sdw0zAFeaxdWH5BaxHh21oqt1eSDwMTyb26USwQqQls=;
        b=N9SogX0mUYzznMLkCdxnScars4a5lypSOARFKHHvLWqKISy4u1LwAvblttViiOhgl2
         g/lvPyHzbh8cNa6FInQy2Sq1Qo9tBkgQJOoh5RE2FD4JSf+G8O7ryBOMvUCRKRLcDKoe
         Pf7CwrapxrNaBM+H1gWvl8mifiXFt4uIESOQFCX8PIAWvNSzrJb13NcfpfCSKqQ6Q7ir
         kKqUu3wbO++S1Dnc5yo4zFpwfXr4XaCx6mw3RnLysxAAEJCj+9/lYr8AQRZRmf/WQHWq
         zo0dQf0FhrNmLjDhQemzgPrDhphJv1bHmpkZWzLVKS6WsUkZEIIwfzXPETjBzoGDZdIr
         cl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793127406; x=1793732206;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sdw0zAFeaxdWH5BaxHh21oqt1eSDwMTyb26USwQqQls=;
        b=02AjX6XLfyI2+zE/3f/52KgJAzVkimYecXHDAP9SDPBbhYM54Hek7VDKo3oFJa75X1
         47jpzo9B+sMQqSpg09uCfQzqCrjB6BJRX5I+vZhBb2iV+pr97c0yubXQdM5p7Ll5tJOT
         9X5U8iF6cY9zRQ1gFG3U8dKmjjyfj5B0qMm37v8APANGswz2e4Xs1X9KTNu34rDOg4kw
         WzijqftJTGJfTZcZnewar5QiBNlA8RpySmtuNu7xqGBmQeOlcvnVRy/Nh3toOmYGSd9O
         +0zj/d88Vi9qIZtYVMbqvuYHhODxu3quLtl/qDHzOTfC6vYzs+CP2IFvDcrhzcCA0mR/
         TZ7w==
X-Forwarded-Encrypted: i=1; AKwUvBzQguw7W6iPSp0zaYlBtiHLV7rzsZnoEpV+7oyhaqsDVdMMrEjAJzX6P5yY1co4kJxMUVP7Mx1WzFldab4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIj92yLMXAn/n5QecCyaboRux9WJ3zpRKBE9fRS5Cen/RYX/Vhh
	OhF6u9Wwas6D96HzTWJDhYiNdpEJNU8FMJSsOkYZnaaqF2APC7ZMRL5E
X-Gm-Gg: AYBFou27Fyxcq5u5jzzfrbJUe3v4xgp58cFBHAmi2FmkcJNAb8sMLHiQhD6xr2wZ1b0
	Nvxp1FS/dP/DUhYHl5ar4J2XxsItBCGbVT3q/elHNaPYZrnWVygtsvagNi3hCBlruQ5vCsDRI60
	tzH9h6llg+GXs1CTCskZAByvNoV0yh7qygTiU4gkZdT1An/5KYGrH91UQkgP1BIi3/K9KNwT+rU
	MFl8QbLB9a0UA5PTf/M4o5k64QaUscLviwKTkJG3K3404YPxfYLv1utIlqgV7x0Dxz1eaK7Tn7k
	QfXuRrYyto2KMRluEUHsKLp1gbDw1X/4YIejc368F2l/sEFMyI4tHyGPUi/HFxzlN43pdX/WBjs
	t9casrI5pCgFGP8jMorIM5DTOJLwXTRpXOYxfzbNXRTcG1CUj/z9rvPYaAVux2/XkLNd17X4+j9
	OghgLfzihsWkpKphPwmMpXy+kJAIt2TO7/j0hLsWDrSwcJCRNCLMBk+JRcopTy+Aul5hsHfgKL5
	2hXFT/3G671iSEhfIcoxreA/Gi6wX41ez6AaBfXtLeQ6jlFqqRtP3rxY67rG4WFE60dJvF5njes
	qdo3lKlPAesoHn3a+Qxa3HuKDQIyjbUUf4CV75TYc6FR0xTR69By5SPOMfTkZd5C
X-Received: by 2002:a05:6102:3fa2:b0:7cc:3eb0:6ece with SMTP id ada2fe7eead31-7d03a585266mr85277137.33.1793127406463;
        Tue, 27 Oct 2026 11:56:46 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (158.95.44.31.netskope-rdns.com. [158.95.44.31])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99125a07478sm3462145241.12.2026.10.27.11.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:56:45 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Tue, 27 Oct 2026 15:56:35 -0300
To: Victor Chernyakin <chernyakin.victor.j@outlook.com>, 
	Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] iio: prepare iio_format_value to handle
 higher-precision IIO_VAL_DECIMAL64_* formats
Message-ID: <25g6fr7y4bmd6bzomvlvoejtps7wzbnbuuxxipmcrnozujno2l@klcfyrmqsifd>
References: <SN1PR12MB252882C0E885BF3368E036E5A5612@SN1PR12MB2528.namprd12.prod.outlook.com>
 <SN1PR12MB2528906BE220765FAF201080A5612@SN1PR12MB2528.namprd12.prod.outlook.com>
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
In-Reply-To: <SN1PR12MB2528906BE220765FAF201080A5612@SN1PR12MB2528.namprd12.prod.outlook.com>

On 26/10/26 11:51, Victor Chernyakin wrote:
> Prepare iio_format_value for an upcoming patch that adds formats up
> to IIO_VAL_DECIMAL64_YOCTO (a scale of 24 digits) by avoiding
> computing 10^scale when doing so would overflow, and by avoiding
> undefined behavior due to abs(LLONG_MIN) (which couldn't happen
> previously).

...

> +/*
> + * Regular abs(LLONG_MIN) causes signed overflow, which is undefined
> + * behavior. This variant avoids that by performing the computation in an
> + * unsigned type, for which negation is always well-defined.
> + */
> +static inline u64 abs_s64_no_overflow(s64 x)
> +{
> +	return x < 0 ? -(u64)x : (u64)x;
> +}

I think I've seen Andy doing mentions to a needed 'safe' abs() a couple of times.
Don't we have something in the tree already? if not, Why not adding a
'unsigned' abs function to math.h? something like:

/**
 * uabs - return absolute value of an argument as an unsigned type
 * @x: the value.
 *
 * Unlike abs(), the result is well defined when @x is the minimum value of
 * a signed type, since the negation is done in the unsigned domain.
 *
 * Return: an absolute value of @x, as the unsigned counterpart of its type.
 */
#define uabs(x)	__uabs_choose_expr(x, long long,			\
		__uabs_choose_expr(x, long,				\
		__uabs_choose_expr(x, int,				\
		__uabs_choose_expr(x, short,				\
		__uabs_choose_expr(x, char,				\
		__builtin_choose_expr(					\
			__builtin_types_compatible_p(typeof(x), char),	\
			({ signed char __x = (x);			\
			   (unsigned char)(__x < 0 ? -(unsigned char)__x :	\
						     (unsigned char)__x); }),	\
			((void)0)))))))

#define __uabs_choose_expr(x, type, other) __builtin_choose_expr(	\
	__builtin_types_compatible_p(typeof(x),   signed type) ||	\
	__builtin_types_compatible_p(typeof(x), unsigned type),		\
	({ signed type __x = (x);					\
	   (unsigned type)(__x < 0 ? -(unsigned type)__x :		\
				     (unsigned type)__x); }), other)

> +
> +#define GREATEST_POWER_OF_10_THAT_FITS_IN_S64 18
> +

that is readable! being local to this file, maybe define this as
IIO_VAL_INTLOG10_S64_MAX or something to indicate the scope of its usage?

>  static ssize_t __iio_format_value(char *buf, size_t offset, unsigned int type,
>  				  int size, const int *vals)
>  {
> @@ -720,13 +732,19 @@ static ssize_t __iio_format_value(char *buf, size_t offset, unsigned int type,
>  		int scale = type - IIO_VAL_DECIMAL64_BASE;
>  		s64 frac;
>  
> -		tmp2 = div64_s64_rem(iio_val_s64_compose(vals[0], vals[1]),
> -				     int_pow(10, scale), &frac);
> +		if (scale <= GREATEST_POWER_OF_10_THAT_FITS_IN_S64) {
> +			tmp2 = div64_s64_rem(iio_val_s64_compose(vals[0], vals[1]),
> +					     int_pow(10, scale), &frac);
> +		} else {
> +			tmp2 = 0;
> +			frac = iio_val_s64_compose(vals[0], vals[1]);
> +		}
> +
>  		if (tmp2 == 0 && frac < 0)
>  			l += sysfs_emit_at(buf, offset, "-");
>  
> -		l += sysfs_emit_at(buf, offset + l, "%lld.%0*lld", tmp2, scale,
> -				   abs(frac));
> +		l += sysfs_emit_at(buf, offset + l, "%lld.%0*llu", tmp2, scale,
> +				   abs_s64_no_overflow(frac));

...

-- 
Kind regards,

Rodrigo Alencar
