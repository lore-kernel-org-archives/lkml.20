Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15B1370AD4
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791639999; cv=none; b=lyzyyntk2u71U0PXT6ELaboVWtZmMQLJ5T39BK1P+zsxFx42VhuJDtT6QUFeXrAJezqGFV7+1nuHT/l/K/wuUT7n4ZnnNkty6xRfCw85UWIIA46wb6FALsP/cceHvsnbCFwy6wYZ2bnLNH5+avXDxXEvQ3quuhqEA83kI1Fcnfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791639999; c=relaxed/simple;
	bh=7hRVs3BYbYMUWytBwA6CmbA7QnVq714J9oYUdi/KtgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VEZ6VxNqyuXDvC7t3Qxf91CxxrAdP96MUykae4xXwlTnvmpU9KJo3xAFBa9QfctT8TE55dsLoedCmUFMvYGhXMhSsD+0aoV4p6+DZIChRnWnSBJ4l6rLVaUzlQLG/YRKp7gmFRljpe6LtSom+FEBC4bKq06pGZ0s7p7+0OgG/sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PBwgq+q+; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PBwgq+q+"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4f699fe49b3so561633b6e.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791639994; x=1792244794; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JAKMj+KBQiZwjesAoVsZB7P+pgbWuimzGqrZ8oXnW4s=;
        b=PBwgq+q+VXb1e2UWSFncuuXX8zVzNA/LEnkjvGi2ozydiaSkf0Ea3M6MVyQ1gPHB2O
         eo0yJv5+UfD/xpLQ+rklosCEUCCTnEjBgLYQu4fRh4jHYDtwtXmjlsWyFIyq1XPyzdwB
         178+X2cIrbX1t42m6gqR9ttKhToEfj9BPqcCJredL2eZlSQFKK8x2bv1kmS6NxGmUaPU
         TnADhNLy4zBl9aDZKIGpoN5FYVz5Ijol0W0MqQ+T8Tq6LmpJry9KYbt22Xe6BJ9ZNTbb
         AkF31lkBzhrRAIFx7e0q/JFry5XT0Yhx1A9FUANilRyNCkyjNB9+O+mrwS1YHxRa6fTc
         KWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791639994; x=1792244794;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JAKMj+KBQiZwjesAoVsZB7P+pgbWuimzGqrZ8oXnW4s=;
        b=N1R1nejOHvDMths19JU6x22F4ir0BrxJnTsSpjR9CG8rNMkGBkisAUQ8XbAQf4T4TM
         dyXe43fzWgdF7dWwSHZpSJ7njs4pPnZFDQ8/CzGiobaCBr2OP32EX1Hhgk/7Xw94TfpB
         Jiik0TlXaRZyvKs5onmXjg0beq3DVQux8RDWV1SGQNH+lEpDe0PTOT7OaJx1NCfRqC1X
         WXibQOo7n42/DtXGwgTYvzl4vhBnZThmJRRMuDzBmuhUU7HYnzOAqILOv9pwaFfoGFGE
         8sQcyoIG9u8JxZnNI4mRBjogABcza00u3aEx8KL238gcVGNuRdrlv5fmuFP01T1BwPUD
         Z8dA==
X-Forwarded-Encrypted: i=1; AKwUvByxUY91EBV6RXCl3lqwXvTUx++xbXGsEgHTYaYs1DvBCo149qzrfngDCANHDExnZRyaMjt0JCJJn5hawAY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjPofrXdhayqedotp75kqMJKCvgoCMhcZTgVFphKv0JuyaOqGM
	1Gz+j5mL7xL9xW5skxJm5C/4ptafT94AgjcdWKcFqps3FHeKSdfmotcq1Awo4MKgCf4=
X-Gm-Gg: AYBFou3WCoEHxPAeAqn8MxEv2kX01e6B720/u7deh7hh0qRm2+Nz1vtrg1e0QuMZTo5
	c2+uRCyWulvn5MDJ/4xYfMEUI1XKiryDm1mtKv0LeWFodQCwJZDy0PyfHWcilc+6gmCdL3QbP0S
	6BZi5h0CbYob//o3oj4ILph0OYgG7XcaFIZbFBil2XVP4PJ6ZFxDAJj4Q/YY0Ra2alK2EUlCRqm
	4L2wa/qNx43Lppzwb3bMRJG3cKwIam4moASqW0/ug8nDnqWE8NUKzqsMpiBWjlc+cEwZMWjx00C
	LIfSuie78vUH3cBNkm5El31SZql99AK0Qris0fxSQCrk6rcskKbGOE8N47hS1yNJRxDAjN91JD1
	JqUxzzVvpyxttffuvtQOtF/u0+W/P+ot7YkrhDe8EDxtj1r1tZO4puZ8HLSj+ENJrHd3OOIM9sW
	v/ZU0LY3AQLYKoQYWrPCqzhbA2CSxLE96ihlr0bFl6kKJQtSWHBrgN3GccnA6RNtR6jwSZLtfeR
	8eWIgC1QPUxGHmOeFlxpUqFr/w8mbghuS8yhQ7TIPAM+1UK
X-Received: by 2002:a05:6808:4fde:b0:4f3:e98f:fa26 with SMTP id 5614622812f47-50c56deebe6mr4606369b6e.58.1791639994282;
        Sat, 10 Oct 2026 06:46:34 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3b8a:e2db:776f:80fd? ([2600:8803:e7e4:500:3b8a:e2db:776f:80fd])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50c1c120ae6sm4982338b6e.17.2026.10.10.06.46.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Oct 2026 06:46:32 -0700 (PDT)
Message-ID: <cde9d00a-bfe4-4093-b03d-f76a122e4ded@baylibre.com>
Date: Sat, 10 Oct 2026 08:46:30 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] iio: adc: ti-ads112c14: add gpio support
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Chris Hall <c-hall@ti.com>,
 Patrick Edwards <pedwards@ti.com>, Kurt Borja <kuurtb@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Linus Walleij <linusw@kernel.org>
References: <20261009-iio-adc-ti-ads112c14-gpio-v2-0-3231a795fa63@baylibre.com>
 <20261009-iio-adc-ti-ads112c14-gpio-v2-2-3231a795fa63@baylibre.com>
 <CAMRc=Mfn7+uQYvLjGLxU9wMOnRwx5pyPgaLp6oNx+ZcFXyXL=A@mail.gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <CAMRc=Mfn7+uQYvLjGLxU9wMOnRwx5pyPgaLp6oNx+ZcFXyXL=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/10/26 4:00 AM, Bartosz Golaszewski wrote:
> On Sat, 10 Oct 2026 01:25:52 +0200, "David Lechner (TI)"
> <dlechner@baylibre.com> said:
>> Add support for using the AIN4/GPIO0 to AIN7/GPIO3 pins as GPIOs when
>> the gpio-controller property is present.
>>

...

>> @@ -2574,6 +2726,12 @@ static int ads112c14_probe(struct i2c_client *client)
>>  	if (ret)
>>  		return ret;
>>
>> +	if (device_property_read_bool(dev, "gpio-controller")) {
> 
> I think the right one to use is device_property_present().

I thought this was the one case where device_property_read_bool() is
actually correct because gpio-controller property is a
/schemas/types.yaml#/definitions/flag.

Otherwise, we should just remove device_property_read_bool() from the tree
because there would never be a reason to use it.

My understanding is we should use device_property_present() for non-boolean
properties when we want to know if it is present or not before reading the
value of it.

> 
>> +		ret = ads112c14_gpio_init(indio_dev);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>>  	return devm_iio_device_register(dev, indio_dev);
>>  }
>>
>>
>> --
>> 2.53.0
>>
>>
> 
> Bart

