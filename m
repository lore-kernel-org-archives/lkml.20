Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF2C37CD45
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933623; cv=none; b=Z9Hka3x7sISqIedaZcqG4v8gjlTHFSQyfDY3a2J//MQjCm0J0emJlwrSsSKPrdbYTbHioPlJklmhJWtkB+uieu0D0eF5fxWyc/Kzv6SwbUDCMv4W8TshOdgVLPrKiBQzcS3Dm6aj70sbXVNwxu3ZDYq5KHTL2PwQKtLRzR0P3ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933623; c=relaxed/simple;
	bh=G0s42t5nQ8kHD3g1ShaWMV+krS9UeiaR/0CiKyAWd50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PSTanfs3WKYV+oXEOijTvBa7eLSubiBDbtySltk/wSlQasfiEZj+B6c2Op3iLW9NHNbzdyWXBw394OGqxi9qw6I/5IYgeXh0M/9tmAEYhycCojXZIuBN4OFMpfNqafo/s3tqlO1k4AHsZZgKporcMR/BRl5G2YHjCZprY3av3UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IDTaicV2; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IDTaicV2"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-39675172593so917449a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933621; x=1788538421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=876wq0iLRJuIP8eFu38VO90/obuQPYSDuoCJYLsRS+c=;
        b=IDTaicV2Dfm3CK95QVpooOkfzk5AJt+GW12ElIcCoHHuagU54SmlCmonbZBX5XyWYl
         83CtVdZDB5/Y1DUklim1J5Kt2SBkPf1geVAamzTLiE07JV38zNhMRXQexxTtd0cQys7e
         ke4Qea6CidBEHQ3drum+dY+IZ/3wcKObfb1P5gqWpzEkPH/Br9eGCq9HWoJoX2M9Ii5U
         PGPrDjcH3un61lyxZfavmuoKnbi96DtxVxcmRrbiU5eJXYK4kNVylIq6j32Onp8m6jfn
         A1ISEHFrv+T2JNZ9MizAl/q9rqvSaP/4DH0GSf3d83U3ZnV2C3DT2+Cn62AP5Mdc0LX7
         6orw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933621; x=1788538421;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=876wq0iLRJuIP8eFu38VO90/obuQPYSDuoCJYLsRS+c=;
        b=bdVbJkwRlHDI8Z6SMF21eY8FYoMaW6hMmH4YIPER1Ipte2R5+dICHkDxN896HG82dw
         YJcADOwabpAFTEjD4BIJPLkL9QXEvfV6ay1P793YezFaVeeNkYziWknlnefdLcv/3uaq
         8pXTGtmJwbGyISBOd+pSWTIdI/t/lqIapUBOzzqcCh0QP5AfJPX5V2NqbZsKs5B4SyDa
         baNsLkMdlH9N9FASNnpqWTh6FeEGOhnTSYnsUD4gn/rdz+DlJ7wD4TI1mdvZ+ICM4ykD
         L2yqg8Xx4IDTmWtV+IQUIErji5em7POBLv71JFcGL94RruoAlMU0wtNnbkypWbhjzWGh
         sAlw==
X-Gm-Message-State: AFuF++l7N9XtMWMcZYr3jEy5mbPT8pqgJlccV7ftF0qPy19vWToNwhqe
	rmNy57eVOrxA7/lklUeMabNYthB/u32X0MN/J/Qk4D9kgt+PCVaH8/1N
X-Gm-Gg: AR+sD10vudkSczfSUEiyuZVHQx0ngYG/v0vWJimDlME0XMLj3LWfdlmGrNNCDqyx5pR
	wT/UcZGDOTBi/mc53sv2cdfcbf5imcYcxkR36ZTWpC5CoIRsZL3CXfAJWmNS36VHqYhXM5FFReR
	uNi1KVoP8Xdu6UCgNbE3A5OmSwObsheyFLLTMCr2pDxDPLVd3Vv7n92TsIjglCP98E52/YVQMpe
	1dsoxaIDDBeGU+akDF6VTzHEwg4drSFLiA2xL6ZFuEiotXQS1PxVgS2s9BjQsImG1sXrvhXmy5M
	CWuCbhzP9qBRznQVjRW0S60YVRcAo3Nhthrr+tI+JlQOPwsxbojoFWpFidaf6JKnBcQbYEyzKgp
	S3FCLcIiuUii0JvQiEQpddX/v0hZswgpJIkjT8IjwR34SzBamwHPi4OeDk30kU3WpA4My5kBrIk
	7LkFXqzYa5cKOj/4afTpVEwgwE/ykuk3bvf/2PILTIcwTV3OHaLjsofxtUUi/QPXdWNM1Ufz1us
	lX/7FqK2u68Z3zPIkDUL1zsDnhjHj8qDAdbZuhPHQY/FlZi
X-Received: by 2002:a17:90a:14f:b0:398:9c00:29f0 with SMTP id 98e67ed59e1d1-3989c003c60mr786146a91.24.1787933621257;
        Fri, 28 Aug 2026 09:13:41 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d22eacbfsm1458584a91.0.2026.08.28.09.13.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 09:13:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <61d21976-2c48-4d58-8582-2009e36a20ef@roeck-us.net>
Date: Fri, 28 Aug 2026 09:13:39 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (pmbus/mp29502) fix potential division by zero
To: Yang Zi <2959243019@qq.com>, wenswang@yeah.net,
 linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <tencent_AAC779A9883986227B9F9C29CDF4A4AA660A@qq.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <tencent_AAC779A9883986227B9F9C29CDF4A4AA660A@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/25/26 02:07, Yang Zi wrote:
> The vout_bottom_div and ovp_div divider values are read back from the
> device during identify and later used as divisors in several
> DIV_ROUND_CLOSEST() calls. If the device reports a zero divider, these
> divisions trigger a divide-by-zero error.
> 
> Validate the divider values as soon as they are read and return -EINVAL
> if they are zero, so the driver fails probe instead of crashing later.
> 
> Signed-off-by: Yang Zi <2959243019@qq.com>
> ---
> diff --git a/drivers/hwmon/pmbus/mp29502.c b/drivers/hwmon/pmbus/mp29502.c
> index afc5e8c07e25..d606fef82b35 100644
> --- a/drivers/hwmon/pmbus/mp29502.c
> +++ b/drivers/hwmon/pmbus/mp29502.c
> @@ -134,6 +134,8 @@ mp29502_identify_vout_divider(struct i2c_client *client, struct pmbus_driver_inf
>           return ret;
>   
>       data->vout_bottom_div = FIELD_GET(GENMASK(11, 0), ret);
> +    if (!data->vout_bottom_div)
> +        return -EINVAL;
>   
>       ret = i2c_smbus_read_word_data(client, MFR_VOUT_PROT2);
>       if (ret < 0)
> @@ -160,6 +162,8 @@ mp29502_identify_ovp_divider(struct i2c_client *client, struct pmbus_driver_info
>           return ret;
>   
>       data->ovp_div = FIELD_GET(GENMASK(9, 0), ret);
> +    if (!data->ovp_div)
> +        return -EINVAL;
>   

The question here is: What does the chip do if this ever happens ?
Was this observed, or was it reported by some analysis software
as potential problem ?

The datasheet is not public, so you'll have to provide that information.
Either the returned values need to be adjusted based on the chip behavior
if any of the values is 0, or some other error code needs to be returned.
Note that -EINVAL (Invalid Argument) is wrong. Please use either -ENXIO
or -ENODEV.

Thanks,
Guenter

