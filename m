Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792458071;
	b=lJrL/7CZWNYsaduaPoZxMRDtY9FTHrZ+WZaAmC2IgTESyFUlXv705hKNPMqN9Gzvcs3g
	 RpK9cUXGPLxICcN2LA9/I0Kq3ncMvM0OwZPgIkT7zucgVsHVj7Pbe7jgS3qp2OK8vNtjl
	 O54EP/vQhDvOI/4KJRMwKbjtC+9BGKc2LVJZAtAsHM0aKv3L9yeGauV6sOnQKrBYNnlPm
	 lrEF/5NWxldW432zVfyLdpnU0aLt3w4UMLBXM4OVKgprIWbujqsbbhXcv2n+wRCrv5IVL
	 6ogwxe5M6lIz1SqaTPvlOSOkG2Q1rrq3b6PnxEbzahzFZvjeXG+YiQdPbzF89Pc7NHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792458071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=R1s7MEiNk3YEdNy8JitFCBfRyq5B3y/z+JpJ2i0d7u0=;
	b=OroLfp0E64i6gCVvITh8K2L6f+ahxjajAw9qIfupI13vjKgh43xNo+2S84fR58HepWGX
	 8elNQoq+M2ackTs/IB5PBN8EHUAQddATK7g8FoBRFY4LSzPy4Hd0RmmEc3p5FINgehL1L
	 DdlKzD87rC4dblIf3EIiV+Pkvg+L6e6xMjYMw9ZtpsEZzpZrJyTxzJdQRW7w7A1OQ3cRm
	 qbRA6WNhA9OAR/3iJo0Gnf6MVpowYjElXO6AKuUpC5hKDj+MzYEGqweNc3MOUcFhAqKai
	 AxXxes6Ka2SWCiRAYFH5H83SzXa0kDXnv5QaDyFK3wJDPt32Dcp26KJ1O61Fy6MHbCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xu0J4k5h;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60467606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:01:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60467606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xu0J4k5h
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e9ae391a05so1316135ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792458071; x=1793062871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R1s7MEiNk3YEdNy8JitFCBfRyq5B3y/z+JpJ2i0d7u0=;
        b=Xu0J4k5hM2EawMwY962trFJpQtyvGlZpuyCsaUUhwF7+hGQwGnZct6T+z/AYgWF5UF
         3qp/Xhegtz34ZSBba72MGGzV9rJNmmCeAYZqO8dkExio2cwSJ3Ja6icVoNyRirnInhjH
         6fgHQaqEPla06e6ARO8cbgw1WjR5x6kQtNVU19ekHl3+xupIPNVkykdvbwYtV1QP49XM
         3NeXuirVyWUpREFxqQ15tuMftouXJDKjkVQmFK0FwYpjs8+VpE0JvcCB9sRzkxOtpJvt
         OQodju21KcepV0jaHxa8IEQ/cZvBv+d/trWZf718v+zwT5LA8aRgkQZhkCT6Odcv3y4n
         lwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792458071; x=1793062871;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R1s7MEiNk3YEdNy8JitFCBfRyq5B3y/z+JpJ2i0d7u0=;
        b=Xovn2IDPpOChYABTTLigC4kXWhbNOaMIbG/ld08yTM5zZx/oeUeaNC+pNet/Bq2q7M
         mK3OmzXW35lftkQ1W5HeGFKl6BAVEabbtJ6/eVFgPBot5H3yLIVFo6Uoz81gHnZV3g8k
         wZdMZOVZldRqC9yuWY2ZDb1TfOGnahMw2sw6pjsTaoup5syvdhpIIicwbdWpuMbkIqI6
         SftFgHNkfVB/BPDz7ejLpJa1YSHpEPAKyfkAUg6G/0jeQYP3e8hKOOohSEEjv0zCOfXf
         aIQWiH3nxrUSXeEqZ9ANvMYhLeCKZ6sqDtKEOAT2NwzaoM6nT3fDeV/JVbhA5yDIwfHP
         dl+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzkjWi1PeL5NWIcUeMWWOhq26T3TnN0/a/ZPAEaubooXRS81wHDCBkAEUXm1m1RZqnmrgyN2FbboWY0ceU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7Zo+ktCtaAv7PRtCC0QKlS+BZajP5ioo6vJo5F7RNLxX5HCUY
	lWXZAaO8lvFceeGUFV9X8QyTx//ljF07zvdSAFTI8bq751cdC6At43dW
X-Gm-Gg: AYBFou2B5VF7A1lYwIvRNiqb62lBHxXJX5bbW7kMqMZoL0VHBzAKvxHMz4oOs8r9mdi
	8yq7k49UwS6kOqie6eXdA7ejT1bPExmNRF/p5JlYIetetqNBk/s5r3yH5b4Sz823Nqq1ijpFjKb
	X22j0GcNqm/yc7a0LRndBCFjtj2C70drnL6yboN+e8/IPuBYDvIroWL28qjYzAcmqKZi0qZW9Po
	ZZGfOVKiUxY+vcOcZ8g76zcjYJ98XlBWi/xGpCvXFJO3bh2gluegXpC+couyxhap2ta8Gle2YuV
	cAF0gwlRXFUf+Uywc9w2+A1Tvv1iI1U7Z/MsdNBDt+gKrMY5jID09yohUx1U0235ifx5UCpSli8
	lLICN54SDIpUqb7srIReVNclAbowP7NcDawEaa/BtneIlybb/fO2lNOaIoVolC624JHu0IimtOb
	dvSXaRWvvLPKlLzBu/Ufr7aVmehxQS/CONAj550MUhnPmL9wCuk9WxBwxTRR1eACdIQrTzQOgB/
	U9mZQVr/3rz6dFJLbxFTn8Hn6sX0Wcy280eNxbC8B2N7Z1y333NtoVhsZGbl2HKlZ6b3CEp1EzG
	piOsK5FFUOgxNFB9v/zMh1gcyw0O+g==
X-Received: by 2002:a17:902:eb8b:b0:2e9:199c:f800 with SMTP id d9443c01a7336-2ea1dda3ad9mr4561775ad.37.1792458070568;
        Mon, 19 Oct 2026 18:01:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea145b5099sm7107725ad.6.2026.10.19.18.01.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 18:01:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6991e32c-cc2f-44d0-a266-4e13e30916ba@roeck-us.net>
Date: Mon, 19 Oct 2026 18:01:07 -0700
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
Subject: Re: [PATCH 1/5] watchdog: gpio: Allow devices described by software
 nodes
To: Florian Fainelli <f.fainelli@gmail.com>, linux-mips@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Eric Biggers <ebiggers@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mingyu Wang <25181214217@stu.xidian.edu.cn>,
 Robert Marko <robert.marko@sartura.hr>,
 "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 manuel.lauss@gmail.com
References: <20261016221617.2223004-1-f.fainelli@gmail.com>
 <20261016221617.2223004-2-f.fainelli@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261016221617.2223004-2-f.fainelli@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/26 15:16, Florian Fainelli wrote:
> The driver reads its configuration through device properties and obtains
> its GPIO with the descriptor API. Neither operation requires ACPI or OF,
> so allow the driver to be selected on platforms using software nodes.
> 
> Add a platform module alias so a non-OF platform device can also load the
> driver when it is built as a module.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/Kconfig    | 2 +-
>   drivers/watchdog/gpio_wdt.c | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index f7d0a0c2c0ef..f50709c635e5 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -267,7 +267,7 @@ config DA9062_WATCHDOG
>   
>   config GPIO_WATCHDOG
>   	tristate "Watchdog device controlled through GPIO-line"
> -	depends on GPIOLIB && (ACPI || OF)
> +	depends on GPIOLIB
>   	select WATCHDOG_CORE
>   	help
>   	  If you say yes here you get support for watchdog device
> diff --git a/drivers/watchdog/gpio_wdt.c b/drivers/watchdog/gpio_wdt.c
> index 1abc7d0b78a6..ff323d6e692e 100644
> --- a/drivers/watchdog/gpio_wdt.c
> +++ b/drivers/watchdog/gpio_wdt.c
> @@ -191,3 +191,4 @@ module_platform_driver(gpio_wdt_driver);
>   MODULE_AUTHOR("Alexander Shiyan <shc_work@mail.ru>");
>   MODULE_DESCRIPTION("GPIO Watchdog");
>   MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:gpio-wdt");

