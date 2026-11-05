Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883528;
	b=2ShNYNUy2cHN1FSdgFeJqfYc9LDzP2HyatBSvOnCxeiRr9gTi7/ASKSrmdZGrS0wm2cs
	 SK5eNmbXeaDpiDu+FKmRmUOeLt+0UaAo58b3IE0frnXzkt2j/CJkK/hfuZ8mnSe79TU1Q
	 zhqKgBEwnH1vDK7ELLztJUWFdoggvfZg8Co2F0sx7eB33Gpsz1rUMXfmlaF/ZTCDwaJMD
	 3w7BmQ+z/+HjPZsDwGpvkTTZReFzK2cycrz78iZYBTwDn5GxYlDMRyP9YwSx/DRnnuzAG
	 G/evtoSRMKxaWsBIq7azolzsto6XCY3O/0o9dJu2jH0lRe9MP+3IFo632xfEXqDdA2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=30cvqab0GneMjzQY9b3Yhah4cXyfQoNJoQir3EuyP94=;
	b=HWbmwZ8NIP9dgjrVadPNY+Z3G8V55idQ7ErB7SnxckXgXvRDg1eCpPXwh5sbfsrWBuBH
	 qNdzAeZV1F7e5kapIyLFnXQPwhBdZxLb40IXV2uGwCeLDENEj3fkYTvlXeAbhA5K4zks4
	 qF/mw/bnE9nFjrOHLVDgWIXCShIJuIuldqzweU/fAwKVjNfc2sxDDkz3BD0+LdoEJQ4Z7
	 Mnf0MSUE95F9/wssmyiz0P9d/+6S5EyyNyHVtJsCsUPPmmpEtBPvYdfDFbhFuy/yeGIh/
	 gNEKwXLyRNj+gG7gmMB0PCVjwzvnolDGEWCUS007I10Ay46PqPxPqfQqEbkCiLvi/XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2392606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2392606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso14472805e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793883525; x=1794488325; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=30cvqab0GneMjzQY9b3Yhah4cXyfQoNJoQir3EuyP94=;
        b=L/wD4a/ylJXV0XF6/0PTSkMyL+0qSb6ZlhBosU4BX5Pj7KjRTFLwMBonjApHISxwI/
         qFX7A4EodJjv05cV1+Pvp5a9CnM4jSs7QUtlDgey5lt5MO/bWOIyVehVkIb+rUQiO7nD
         wKsQKIq2EEO0D6T13iNaiR4S2XmKG1xswSwlgamKifo8fMU5iRG2ESLyWyyF8njfzBKP
         hDhjc74qZsFhiomidhtIFh7xPrwvp3uZEhfh88UPF81e9sb+yoKFGmm0d63HpJuTTThK
         TwVr+c0za+UngVjYzur+ILK68hcWgncUpdmnjBRY0klqXtSxfQ7I1LRYEppK3SZNw9sl
         qNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793883525; x=1794488325;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=30cvqab0GneMjzQY9b3Yhah4cXyfQoNJoQir3EuyP94=;
        b=ziyVPOShHtNwqiaU9vsHP45O3lNIkfjbhOjDPYxPgUEcNiL1QZ6UGCFmi+QQ1Y/zgv
         /hyB0Hw58lNEDtds42xLLAL5j4SsFiZwokF9DD0p215HwF/XSziCjlLHuW2IgFN5qzgu
         K1fW+MOWwF+DCOtH1mo0ILx4VpbXpAFjlX+7nRKX6zY5BRaWwF9Ult2o3CaKPy00g/hZ
         GwXOYf/O5QwAh1yovk43wPjnER/++qQWgtRmUqw85bB2gC8raGnGicsCxjZ1tvsthNZC
         43VINSbt19tiN2+Xw4gGFYlvW25OWMZ9m721mOBNH7haF+BHst8quf4ssQXBdufi9xFb
         Qscw==
X-Forwarded-Encrypted: i=1; AKwUvBxipCOp8W3YSisP06+gQ4bfNGGUOjK7e3KH6AM+0z3ZmLHIoT4hhY/uJj3g7GNn3hoPhvmrhMF2YdEvIg4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tVCUoA/ZNhcsqLj/99vuvK/IhKzBXlPK4dHjbkZZNhlynwt+A
	u8pwOW5wbIOSzyw5wAkp9KNspS8DUDwySCXMPIDPDMPaPIw6d4ZunvTcAsiRZxiQrOY=
X-Gm-Gg: AYBFou3lFpsRCvnfwToGUyYNqskjFu0I7s47AqCwVXBMClKIt6Uy3w7dIs/zAeVD85F
	1j3Ij5ffplLnpZDazHyGTbObbvMqlD61vbtF56hp9Kx8kAALqrxQgbIoutqBWV9YYZTiW7f1eJN
	h53m4LGvME2x1jg00w3Oa6JeBY1HkuJHJLRcgbTRnKm+pG8ALpwBTE3PFBx8+pQp5k6EvlGTDOJ
	2+XzfPwX7KukZg7y6ndfWPgkOjss4IvWM2yk0oagRLAaTAaQ3GqWOZ6JXLPsSUotu3rvONCj5DU
	vBgWmI6+pJnA5Rj34aZg3WByw+u5leEjaSOwCR4FVXgZAf5exZCxYCZoLJ1KuqquSROni1iyaTz
	JoAjU7ggOP+lEOF35XNQVNWCzN/4oB/1QnbMtTbAJg8tDkCreI4PVbXSS3D6PEJMgxiL5Rg4i0z
	5EHrey+oWGymwqB/hFr9xoWJd+4towr4xSYxzyTr5RLNrn7C1rMhnc9JVFf6UVubjW91DDRsFty
	S++S9J0yfaH6txZNkBBQUNnBU89XYkgyliM8vy9CMQ+EKpNw3vyie5lrPDuLZ7xPk+rb8Ep5XiR
	+m0LWlyG5WIYa4pzrfguB5xFEil64p4+xBCC2Ew9UTf7WawZfQHDOEp5
X-Received: by 2002:a05:600c:6212:b0:4a4:de70:2ad4 with SMTP id 5b1f17b1804b1-4ac17ffa395mr401888755e9.22.1793883525271;
        Thu, 05 Nov 2026 04:58:45 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b63863d490sm27861675e9.2.2026.11.05.04.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 04:58:44 -0800 (PST)
Message-ID: <56932f47-2e35-4152-afc6-6cd41c8393cf@baylibre.com>
Date: Thu, 5 Nov 2026 13:58:44 +0100
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
Subject: Re: [PATCH 11/11] pinctrl: scmi: select the GPIO function on GPIO
 requests
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
 Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-11-52d92843ad97@baylibre.com>
 <aunIVW4JeM_P2WOa@ashevche-desk.local>
 <73888927-18ec-44b1-bb14-72e72860bfc2@baylibre.com>
 <ausPFWOj-usp084X@ashevche-desk.local>
Content-Language: en-US, fr
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Autocrypt: addr=clegoffic@baylibre.com; keydata=
 xjMEafx9bxYJKwYBBAHaRw8BAQdAtc85GIwDXLz0rh9thWXC80Lji0otVDVncXT4qaS4j1fN
 K0Nsw6ltZW50IExlIEdvZmZpYyA8Y2xlZ29mZmljQGJheWxpYnJlLmNvbT7ClgQTFgoAPhYh
 BJjMiHuM4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsDBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEH6EW4KtCh6Tt+sA/jVC35rY1npFlOy7YnncTdrID8Qf855JA78IzXgvzpGp
 AP9FkuuT80m66PP3DvgYX9kVnG17mSDKO0+v2W18v6ZgCM44BGn8fW8SCisGAQQBl1UBBQEB
 B0DMwF4u//aQyzsFlO8rPJ/cqsAuPH80IeIA3HOEo5mlVgMBCAfCfgQYFgoAJhYhBJjMiHuM
 4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsMBQkJZgGAAAoJEH6EW4KtCh6TdSgBAMDS0MiWCivt
 LjzZc9bs+P/xdXywUjDKq3lpQGJ6vZ0GAP9vI6DnN7vwVK6jt6/+0aBGkog5Ura9+WwRFEdM
 vLfPDQ==
In-Reply-To: <ausPFWOj-usp084X@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/4/26 11:55 AM, Andy Shevchenko wrote:
> On Wed, Nov 04, 2026 at 10:38:11AM +0100, Clément Le Goffic wrote:
>> On 11/3/26 12:41 PM, Andy Shevchenko wrote:
>>> On Fri, Oct 30, 2026 at 04:58:42PM +0100, Clément Le Goffic wrote:
> 
> ...
> 
>>>> +	int nr_functions, func, ret;
>>>> +
>>>> +	nr_functions = pinctrl_ops->count_get(pmx->ph, FUNCTION_TYPE);
>>>
>>> Is nr_functions signed for a purpose? Can it hold an error code?
>>
>> No indeed, will fix in v2.
> 
>>>> +	for (func = 0; func < nr_functions; func++) {
>>>
>>> 	for (int func = 0; func < nr_functions; func++) {
> 
> With the above in mind, the type of func has to be adjusted accordingly.
> 

Yes will do

Best regards,
Clément
