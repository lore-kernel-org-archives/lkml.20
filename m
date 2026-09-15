Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE1A3F7AAB
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789492176; cv=none; b=A+WQRY0cIo7+weWu39d+b1y4ggwg7qaurJM2s0FW7nALkt/q3K46qXl353Ftq4lG60ygtPnBVyjEvMMUxjc1jYxJhau082IclZJNaYrijTeIIrUZvdtLDV+7pLARsqNJ1V9/mjNprEugPqC8FKj5b4+MbsLRf4uoJLQyasLy5pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789492176; c=relaxed/simple;
	bh=C3zoy/9VsAfZabk3hbv9KlBEnMZNR9UmRIwAl2VpG2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GHDsWi8ZFEvFQn2LgBlZro0KAumY2c259jqYHdA1xveuw6EfZvVxxgAqA8l9BkZsTHbPmirEb9+lmoYrVpY6tmtusQ6BAAdoSPlZ1OdHY5/7QcOHIWwPJ9nqXDLy8ShWfYmYfUZom+i0etLDhteD9R1432mMRboh0ZmHQwT/nOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AwxGMjyO; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AwxGMjyO"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccc02279so3233242a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789492170; x=1790096970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i7mmyqxL4Ir0d/CfwYClhfzZRHAjxnBiwBulaRxIKo8=;
        b=AwxGMjyO3w0ZFJysg9WSkLH+6ScUYJLSO1aqzkesrvGqdRERTAOvxMEVSrfYGrnXuj
         zjT1DITrCJ3WHAmiEXzPEhJuCAjRcCPAxHDYhbNr+u1tgDMPPuZh0k7SYk8hVPiF1waK
         FBrMYG8wwmZ5T9guURYeM6x4tlrGn/zbr/EKeenrD9y+4M3ZKczwRjfLKX+Rq6JfD3SN
         9DJnmNrdPMXoMq66qyMywYz/J6rDZVcDZTMfNSBW8LGiZRJreXiDg3ip+nS1KzO2YSeC
         INMr5rc+06I6bStcphKGh+oa0Qds0E/a+VVj5wvaxcEQrT37aht2kuAiAcmoYCXTuMEj
         oBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789492170; x=1790096970;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i7mmyqxL4Ir0d/CfwYClhfzZRHAjxnBiwBulaRxIKo8=;
        b=P0b36tzk0sq1tILmAqHPGUjHnL1qexKiQ76JJRt9EjxCBAUmKV8vygq3EgSv9EN7PH
         FrXnLuJUmH1g1Q/Wv4GxZES5mb0scjCajcnZi75wjUHb7MpWxFWCP/jhIuex6guKGHuX
         JWWa34cGzBD+rg/2IWz3fSCKsPPIiORaIUbSQoMGyL2L1HdbkvtZQ0wHwDU1bwJiKp2q
         ClRqrkwSTrfcd8AY0eBdryD5oShSXUjqVsSlP30RliKzztkx9iMYeXMaOZDmbduiDt6+
         IR11P5P7puHWzpte1hw7OBWzmrFjaO7kISK29AEzJG9DQ2EAgtiBa7sUVYScdiPvyS2B
         hBIg==
X-Forwarded-Encrypted: i=1; AKwUvBzK19KHD7C6144ZDSmjubu4rvC89FUlGHNiLWKjB9tT2P1XfDdYy7FOfWquydUi+Zq+UQE79/Y7v3pQxPI=@vger.kernel.org
X-Gm-Message-State: AFuF++lPnmalnyjii8Dbv8ODKgQzzCXo71WNrRKjO0V7Fs6rLHOECEct
	D+LTzBj8U1pH8BfOkRyNHN08eaRvgTB/LMU8mC2l1XeGl0y9/aM5BoXi
X-Gm-Gg: AYBFou3y2znAk+NzOZ9JSyfJyrCRBHFifOFU2jLk5IBcjqQ4Ly4wZawXlSTwMQ3LivT
	Dg9XEA/4FAyzdZ5PWn6xcZY0qsi/Zx6Re5ppLmc6ejlw/Hlw0TO2NDgQZxyQA17E1lJEItrVEbr
	EIt5vxZCm541IoBwVo65qODkIysXmeQi1cBYwlWk74J5c63iyJXJ4+Weg6Uyk4BAKhqNS1pJLxj
	d+VhpNR0snrxt/c8fmqapIalRuz529QUBLzPed0sNq1/fq9lhBWmXCGcO8pPTFiDi+b6Z3m0B/G
	g25BtlOh2Es/dRRpCRoKZKc7V82B/rXSGKDNDjfm/sV2R0/XGdzdheDTYxwPeMdUKk3YsHGEJPw
	3vlPfnSUQVRIf1eISNzQOPIdUwtgvsx3Vcsx0CAfWOAIhmzif7N50ot03zdnYqLGlVKbMN0kXU9
	/6UVyWSn6rz5itXz1c2uyPKpaXngjhvtna7igmhiDM87Rk5ZWQHm1RMdrv94S2VBit5Ys2/YyfR
	J5310KlXafgddoGWfXI/RZya2dqS7O03Kw/Wnsxn+x2e87d
X-Received: by 2002:a17:90a:e7d2:b0:39b:92bb:9ef0 with SMTP id 98e67ed59e1d1-39dec0bdc60mr15161562a91.20.1789492169910;
        Tue, 15 Sep 2026 10:09:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1a033df0sm58769a91.4.2026.09.15.10.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 10:09:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d45d4de8-6925-40ad-a5b7-b8cef6356175@roeck-us.net>
Date: Tue, 15 Sep 2026 10:09:28 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] hwmon: (aquacomputer_d5next) Add AMPINEL support
To: Vas Zayarskiy <contact@vasily.cc>
Cc: Aleksa Savic <savicaleksa83@gmail.com>, Jack Doan <me@jackdoan.com>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>
References: <20260914233728.22725-1-contact@vasily.cc>
 <20260914233728.22725-5-contact@vasily.cc>
 <a968a02f-c513-42f0-993f-ede4f785025c@roeck-us.net>
 <ICzeTYsqVwKewqbj_Gv2WM93k1Kr6uygPhcTJ3M8PBtvmoV3AlfEnRWAspP-fQgdmRW4IR1OPPpDLhmQiIqEAh5OuCKvwRzxAHSO-7rnYAQ=@vasily.cc>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <ICzeTYsqVwKewqbj_Gv2WM93k1Kr6uygPhcTJ3M8PBtvmoV3AlfEnRWAspP-fQgdmRW4IR1OPPpDLhmQiIqEAh5OuCKvwRzxAHSO-7rnYAQ=@vasily.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/26 22:29, Vas Zayarskiy wrote:
> Hi Guenter,
> 
> Thanks for the review. I will add the trailing comma and separate the shared report validation and handling of an unknown firmware-version offset from the AMPINEL addition. I also noted the -ENODATA and conversion/scaling wording corrections on patch 2.
> 
>> If the match function _is_ needed, the reason needs to be explained, even
>> more so since this may impact USB_PRODUCT_ID_AQUAERO.
> 
> The requirement is to keep AMPINEL's keyboard interface bound to hid-generic while the hwmon driver handles telemetry. Both interfaces share the same VID/PID and match aqc_table. With the existing __check_hid_generic(), that ID match is enough for hid-generic to decline the keyboard. Returning -ENODEV from aqc_probe(), or rejecting it in aqc_match() alone, does not make it eligible for hid-generic.
> 
> The Aquaero collection check rejects its non-telemetry interfaces during probe, but that check alone does not establish keyboard fallback to hid-generic. V3 leaves Aquaero's collection filtering in probe: aqc_match() accepts it subject to the same generic-driver override checks the core already applies when there is no match callback. I do not have Aquaero hardware and have not validated its keyboard behavior.
> 
> The matcher test demonstrates the AMPINEL rejection with the original hid-generic logic and passes with patch 1. This is a userspace harness, not a live kernel fallback test. With both revised modules loaded on the physical AMPINEL, the keyboard registration/capabilities survived hwmon reload and suspend/resume, and its capabilities were preserved on reboot. I will make the matching rationale explicit in the next revision.
> 
>> FWIW, the raw even can happen prior to this, which will result
>> in bad data. This also affetcs other devices supported by this
>> driver (and those with fans can crash when it happens).
> 
> Could you clarify the path that permits raw_event during probe here? I checked the series base, 46fde107b4e881f179bf02bca69d8a0020561b3c. include/linux/hid.h documents that callbacks are blocked during probe unless the driver calls hid_device_io_start(). In hid-core.c, hid_device_probe() holds driver_input_lock around the driver's probe, and __hid_input_report() returns -EBUSY when it cannot acquire that lock.
> 
> aqc_probe() does not call hid_device_io_start(), and neither hid_hw_start() nor hid_hw_open() releases that lock. My reading is that normal USB reports cannot reach aqc_raw_event() until initialization has completed. Is there another path that bypasses this protection? I have not reproduced the race, and would like to understand it before adding a shared initialization fix.
> 

You are correct. Sorry, I missed the part about callbacks being blocked during probe
unless hid_device_io_start() is called.

Thanks,
Guenter

