Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E95F5226B6
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069368; cv=none; b=XqIJeBt8oMfSr1gQjiUtkpu9R4FxZCQ4OHrvs+dSCbx5GVH7vgu5LWB5n/kenL6vOZqinnNsoAaFfFj5Q6p8qXuDwZUDNF93pxH8G2XngvgA4aZ3LpAzwDxmiU3++CnUWoXsEtETMqaNElCeUBWKroAAjhnW/WUbKhw9dSBrtC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069368; c=relaxed/simple;
	bh=sNHkM2NSJVz1FH0SzB8TgpwxSIcu6W92qD2xJF5gKMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q8yorY2Cn5ooub0pp+ciJiGvWquw5aJ3+xXynmtvCMaIrY58vdgkZJ9XapGr3Yj5pzHEISWzBUwz/rwQ6Q8aqrnva9h7b9fFX+2ed5CN8hA/rPngZMqJxj7CHGICDObJTz2LNeMbj2loRooH+yck46iI1JmHZTlTikO4k3Nsy90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=pvlGVDHB; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="pvlGVDHB"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so3328837b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792069366; x=1792674166; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=at9NDBQGEaYtN0ifydUv/WOhJYVf5LHHhPf50pPTXz8=;
        b=pvlGVDHBZX0vieQEbBCSmfO+0tX7LhcWO1Ck/yHebhBhSLj+M1w/MYwdCZYaZTw1dY
         F+L4U+qA7O5uRbSeXSPof15nopieIrkDdSwjLA3NwyiYLPceH0Xwrke72Muue2rfnNnB
         flggkYggYa8tZqFFXL6atV4qYewvDqRCX13mDfFRMdYoWsZA+tXY6J9egHEfnq7zSkvV
         0G3uGCNC3hHZGisB7ApD7ax37NgJJ9oeLZOtVSRhZW2Qn1eG6ZAwsls0O4bT3RC3sOE4
         8dOjaibkNGBUEZ9p4fkegE4aqLzdhuU1nTxP1ZbUiG7F9Bd7eDgkvV1xT1ysJywP/DK4
         qHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069366; x=1792674166;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=at9NDBQGEaYtN0ifydUv/WOhJYVf5LHHhPf50pPTXz8=;
        b=bLRIwdN8ma5qGC2x/m/yY+26BemyaEOHbCgfyS6pRvq4/XNNJ8GlDNe0Ceo34/PUla
         bjol4I/e+2a1GhXNj7ae5RrhgkO10HYZbrYM7VsT386hfElG54iw2FdArgGkJ/yYQFdL
         alWftFbVfSu3vxc26YRsqco3w9sagqzLTbwz2B64ZSysChhKz82BJBaWkioUdv6IQ38o
         jvphAZxpZh4NvPZM1efYBVV7ZhwExS0xpFFc+/+hSCpuCvsGSwIfqKB/ipcgw/hoRpbT
         kgFYazxpahzaWM/TAHprUdTi6p/cIHBG1E6q0XmhUM3e9bmrFajfwsUR+UxMYUq7VgZ9
         4SsA==
X-Forwarded-Encrypted: i=1; AKwUvBwkSOsypgfZVqC5ptzWMdeRUoNpN+vJ7DFwGUf6YFMaqZbCKm/hGKH5QLSeGgrIBi/ev1SnX+1zs0GHVWo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5Hl1KTG1ru5JImmghukUTqkl56FbAK9kpLFA2U9atDITtXxJE
	L/A76vdNNmCJ9Kr8SGj2Oaz9uyUNt1Akh5t9D0AB9jbZfsCauEo52cyhMFDWkVGLBsw=
X-Gm-Gg: AYBFou31lHdH4h6DZWgKJfbhJXBPROit6CsJ4IRapU8Rmb5Rd+hxxNdg3I2oDTi6tPR
	I6utcll1BXZox+tJZQxJMminT07gDZrQ+si5EscKPPWOZAOJA4Nwj+bODhN0naq202GtP7OsBkb
	4OiMaXdSxLVGIkCcqYQ2rsxDKsvXBSxQfUThP8k/k8SF0Sqt/+qfZz7pCuWN/PDsGTklfN6xCD7
	Embeb0ps1CaSgh6zqkUdSH0Rjei+O0CLZ8ef3BZtV/eD5RJzIFe01g4Ha2rTTNaFmcf81xQng2T
	ll0+Q94zX3LGHDcsvNd8ysmOBVWl5FmZvx6UEmWJMvxnqYQQ1U0RQfUH93HIpw13uTKRC+uYV7e
	WjtGjp6RnOoULzh265mdD2BOs+TiiVbl5jMOhByol5BOLLaTqGa9qWp11czU1yej2vYDZD/rAl8
	oPuEXz4/mHbqfIdvmzp5U6Ju5ATggoGOkuviZulnukdBW4hnD5Cab9Ja43paU47cebfzGEuxB/n
	lN/EqIJCCnc8hLa8fqHZjSfilT9Fu8VPa/hqOtrCISF0VQb
X-Received: by 2002:a05:6808:15a9:b0:4f1:7cd5:8e0b with SMTP id 5614622812f47-50c4dfb9a1cmr17338045b6e.22.1792069366316;
        Thu, 15 Oct 2026 06:02:46 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:7a64:39ea:e5ac:f974? ([2600:8803:e7e4:500:7a64:39ea:e5ac:f974])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50c1a325a38sm19891522b6e.12.2026.10.15.06.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 06:02:44 -0700 (PDT)
Message-ID: <92a8384e-17d1-47e6-bebd-406941f349f1@baylibre.com>
Date: Thu, 15 Oct 2026 08:02:42 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] iio: adc: ti-ads112c14: add gpio support
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Chris Hall <c-hall@ti.com>,
 Patrick Edwards <pedwards@ti.com>, Kurt Borja <kuurtb@gmail.com>
References: <20261009-iio-adc-ti-ads112c14-gpio-v2-0-3231a795fa63@baylibre.com>
 <20261009-iio-adc-ti-ads112c14-gpio-v2-2-3231a795fa63@baylibre.com>
 <as47IMM9rtBCAH0-@ashevche-desk.local>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <as47IMM9rtBCAH0-@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/13/26 9:07 AM, Andy Shevchenko wrote:
> On Fri, Oct 09, 2026 at 06:25:52PM -0500, David Lechner (TI) wrote:
>> Add support for using the AIN4/GPIO0 to AIN7/GPIO3 pins as GPIOs when
>> the gpio-controller property is present.
>>
>> Pins that are already used for something else according to the
>> devicetree are excluded from the valid GPIO mask. This includes analog
>> inputs and excitation current outputs used by channels, REFP/REFN when
>> an external reference is used, the /FAULT and /DRDY interrupts and the
>> external clock input.
> 
> ...
> 
>> +	for (unsigned int i = 0; i < ADS112C14_NUM_GPIO; i++) {
>> +		data->gpio_names[i] = devm_kasprintf(dev, GFP_KERNEL, "%s:GPIO%u",
>> +						     dev_name(&indio_dev->dev), i);
>> +		if (!data->gpio_names[i])
>> +			return -ENOMEM;
>> +	}
> 
> I am sorry, I still didn't get what's wrong with the dash (technically
> speaking)? So, this may use devm_kasprintf_strarray().
> 

Nothing technical per say. I just want it to match the datasheet pin name
without the extra character in the middle of it.
