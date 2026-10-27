Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793081137;
	b=uGo7vPBNGpq44FOPuJLeWDPtDgn50MTmzesV01wwy7mdE+Wx311VajTNJu4b79Svya07
	 2/GhyhN44P2dYFLipyoZ8VKQefJnah6b6MWwCoBnkXw1AfR3HdMBXrSnjGWiHWH/A7QJD
	 eSGBBqBuSsoKKSpHYNYgaos4rOGg0LOWwplDRcoq4EUGNY/iw7IpP23Anw+5oodGILuGN
	 7IDc48zgPPm6GRTwvwa1PXsLoHUofBa+fTZHlh35uPmq0gEoJmLg5XjRU/X1Q3aXXCFW0
	 W+Rrf72TLc5ANzhaXus59rltd5h6UCL4ToKLJk7U+D5QFM/kV7izn04qfsHv7arBHCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793081137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=FyaFjvdm32U/IxSaU5LseDLqJIT+GCnBMfwNLDa5YB8=;
	b=kFjyYLNP+nRQe6vmEhSc7KgNDBkvcuBCVzUHfR/SpWDcTPoTI6AMQWx607QXv9RFKPUG
	 dImybrVbv66bByCs97FcGVs3s65tBHt7O7EDFVIooNcQD47b6Gvze0QXtz3WeRyTiPoQB
	 5c4HR25e/LWKFOkb7s839uvmRUGViLlJ8m9M3hYLEaHWeNztuE808lzcuMAXuSYCjU8aM
	 okGKBDwWgzQlUyeStfY0pFAx8etOrY+k0iZ6a4BFXkH5Wurg2H+fJueAcAK611tgUQT3p
	 I+MQSH81D6fOfk61utEcISQLcpkmCmezjv9XEw2nDUunIlbieII4gH+ZgtuHFmncQEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PddLDvUN;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D178606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D178606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PddLDvUN
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bfbc25a76aso795664e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793081135; x=1793685935; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FyaFjvdm32U/IxSaU5LseDLqJIT+GCnBMfwNLDa5YB8=;
        b=PddLDvUNztcgtwxD95E8F+7tysvbAU/1w5sHqBY5DBDP5PDOTVF/uiG8UbCMQFZd2a
         NUUX5mW3m6woSHAhA0Fgc3x2cSiDh8KFvWq53/toFZ8t+uAQOTGx/zrgxFBqet3F8dTK
         +gYCdnqlwbdUenUT03YHUth9m6G8RaeVPK87zXnlH4gUZlZkQPwy/wc+eKofWycXpXQJ
         37m0EUzswFxTO2ETRHhituKW/TevVueSS0Y6TR1NnSvO2TSzzCKRxR7KBEbUE7dS//y2
         eSByBMvNptUqBJHpwvH9ZN89mfouv71jwZ6PjfCA/s1Ik7mD+EVStyQnKYHIDlQ77TM+
         6zlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793081135; x=1793685935;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FyaFjvdm32U/IxSaU5LseDLqJIT+GCnBMfwNLDa5YB8=;
        b=QLC9H9+zWyZB/a12DcebvK+b3kAxcx3e5SG+zmKxAfWLmT30FKXMbhGCWlGr/07d4j
         S8/F4leVP3h9ajaH28UgbDVI/0mAX/o6s/F6b0tNVeTz+EoUN6uf6Fu0iTHKgeEdSRv5
         W+JJt7bhe1CBTtBu40+v15t3TO7K3eUacAHXMPNmxr24nO+XHjnlwQ+tkFt0k/ccH0QZ
         y93MMfvlMKi7OjLzmHnTAoAONIC2DcF8ZKvPzFHb2QzU+7g4SI8DQsxIiGTBL9Z3AV+O
         a0XDeKM28qgWZWUhf+z6cMaZqEm5coCJGLduN7yqncfjrnzPShdC62rafoUOol6j5xAC
         ZkOg==
X-Forwarded-Encrypted: i=1; AKwUvBz3hZUtKVjwzGaJ6Yw8e8UT7864qFauKf6wNtgertpyRKzs4tRSAzejccUqfwPmExZE06eKl7vqKX1LJiM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBkSbaKyXggRQyd8EnnYzXY7deBw1p1/71oI1TovHwDwYQzHnx
	spQa+vmpc7QZuoGB6XH/ruACt2xF50ypelb7XTbPMeiTx3Trj6DCbsDl
X-Gm-Gg: AYBFou1TCIN1k29UZfHp+1FgdR/EPLnAGG1jWP+/mVb2c62QahR1I5F2TzeLp06i8kH
	GWJb4q8CqLE7zNlHrImlctXMdZ5F+BgpYtfqMIQRymUoyyICWQDCOvi4NVwPwOOnMYe1Eq90rFI
	+2oDGhTS91TSca+FQv2FqUvluQU9+yNn4CKX9ssqktbvJufqhfetdYbjJRoHuOHYYZZIbyk6+FN
	6CJLJaoVM02GXzIYXx0280wZTVv7Pj0f1Hs5X0WDyob4wJR+1puDLOxKqwebbapWT51LrYwK/La
	SY5QjTdgsdeDUifOtbaKUCdxl10n7BdKlbgoa8/tFC6H3nm6G65Fb057Z70a9FymE9z1NIp4mno
	15VnT0r28TpMK8aydFlk6TfMYgvBYI0Oy99+xdpuOpbkfpLVIeuqvIrH4dCdrf5gyLgR5i5IJS0
	IJ/NVRFXAfQgTh1yhzIrfTmrc7wwALRqNY3rbm8New+fH0e1Q4OnqFbSLyhDvmOJ1U6xzFfpdwY
	sCm/WyrFoIp4pB263j3b90LMpQ1BIMxyCl2p/ZSr9tjoIsGiRyP52mMjp3hTZlxeE9FCO8ocfXa
	qyYjeznELLld5vI4BqaQqzHzBV9hCfUFN0Bh
X-Received: by 2002:a05:6512:350a:b0:5be:3cd0:e4f4 with SMTP id 2adb3069b0e04-5bfc617eb26mr436454e87.38.1793081135106;
        Mon, 26 Oct 2026 23:05:35 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a9ce9esm1913515e87.79.2026.10.26.23.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 23:05:32 -0700 (PDT)
Message-ID: <a4a176ab-d826-4f83-ba56-e86e9c6b764c@gmail.com>
Date: Tue, 27 Oct 2026 08:05:31 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/22] gpio: bd73800: Use named initializers for
 platform_device_id array
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
 <fc1ffd672a11b0f89524c6295e4070c954eb81c0.1793030820.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <fc1ffd672a11b0f89524c6295e4070c954eb81c0.1793030820.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/10/2026 18:28, Uwe Kleine-König (The Capable Hub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
> 
> The mentioned robustness is relevant for a planned change to struct
> platform_device_id that replaces .driver_data by an anonymous union
> (though this driver doesn't use .driver_data, so this patch isn't
> strictly necessary for the plan, but still ok for consistency).
> 
> This patch doesn't modify the compiled array, only its representation
> in source form benefits.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Thanks!

> ---
>   drivers/gpio/gpio-bd73800.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-bd73800.c b/drivers/gpio/gpio-bd73800.c
> index 2be2a885820e..c960ea6e8426 100644
> --- a/drivers/gpio/gpio-bd73800.c
> +++ b/drivers/gpio/gpio-bd73800.c
> @@ -189,8 +189,8 @@ static int gpo_bd73800_probe(struct platform_device *pdev)
>   }
>   
>   static const struct platform_device_id bd73800_gpio_id[] = {
> -	{ "bd73800-gpio" },
> -	{ },
> +	{ .name = "bd73800-gpio" },
> +	{ }
>   };
>   MODULE_DEVICE_TABLE(platform, bd73800_gpio_id);
>   


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
