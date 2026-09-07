Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E0846C851
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779883; cv=none; b=WZ0Rw95z2swLL8NwLi2lwg4AGT0DlY8S6ePG1hLwfI9x1P9JXe4GyqxKzY19FPHAl2I7+AnrcB+3iQCSqJKjtxI0sINKREgrgSuIn65MSb1CjyecVGAMTXljb3ND/IdvM0gFFgzjs2YvC3wX6MJaOVmJptgLz8ouksPKY15vppk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779883; c=relaxed/simple;
	bh=vc/u2+6K3u9duPkyjAm1VSzu2f/ZyL4eiCIH6p0kCCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=buWD3Y8AQmieodQVOJ7nKdkKZHpET8HnBUp/VBPcWQOBd93DZX1UuNep4HsohToctHGdNff3RLMpaWjUShgS4ZnvWPpOBaG79Ki7t2xlQjzD+qV8U+kdf1/EFi3pDKJIADHSbAsVd8fJTXtWwMCVdPgfri2YXa6cufS8PMzMMZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=de2MEp7Q; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="de2MEp7Q"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so3880537f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788779879; x=1789384679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZeKG88pQvz+t3Gm/KrMtRBK71hTluhBWfm1A4t1QXw=;
        b=de2MEp7QCbYxhT5Uaog3gIdpkYeUO0mVMVQtiCMgH5BJo4MLMu0GREGhdFYPLS2Fua
         cxA/Pdft+yc3I+Zr3i3LCX/V9CDxAURVLJKTpP0pEGp7/pUJ2Zia5amibAXFRo7GNTIn
         bbgNa6YiKBYgCOOx7JHcYR3sFNer6TirsXmCrtfmL1iPQx5qelkve5peqcyZ4HITw6Dw
         QROMDiYlC8mkzpX8RO59w4qY5GWHM91SKo4XPP258xs0JXB5J+AwGxhKErj/qTtsqHKP
         ihyTQ2cqlwiXs3QUOsRHJVWEqTRsbBPFs+VpgL9lu2dTBq+akrYPKlUZpnkEnKkvEeBT
         4nVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788779879; x=1789384679;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kZeKG88pQvz+t3Gm/KrMtRBK71hTluhBWfm1A4t1QXw=;
        b=Mj1hfC2T8Kor+AllcnWaow676mj2I6bq7986nUj7PIYjnrhZsh0jQZW/SA+LMOn4CA
         5n5+5BaT3xIF8MHBukKfBYrDk19xwsjSUsOS5LNJrht+s1PP8aSPcxSU6MyAEK+O7NTU
         hGlRAMtlPc7lKVTyqhaljnVQm7IEBrvqqNCNwPbMkFPY6cCVZdO701EQrZCLJxbzq+Aj
         7jwC2qrJ2683i2KoPn5W1/xYQFG1BjgkJ4W8FwpHgXkEJTlK1n0QCgbPTayW7ERZ6UKd
         0UX++toke5oIdNLzRldg04NvIA9BnBw2eQbFtkE0loNh7pSKrwbksHY/03NeRnAkbhB7
         9QVA==
X-Forwarded-Encrypted: i=1; AKwUvByXz7JQu1bXxw13ggWr+aMrJB46x/8v3XWpGACwXzCP71RuSDGm7Kv70CkKV+ofr+xMEGkVhaj4n81coxw=@vger.kernel.org
X-Gm-Message-State: AFuF++kJKJTM+DBRt4VO/dDAHjzHWRvBNsj8rm/Hq2UcUf2EJiNZmTEN
	SQPP5TEiz2OPhVYNtqs5lfzQAZgfcEzCUO5wQkM9H+/vR/hXfWv2+Z+G
X-Gm-Gg: AYBFou35K7UoFEgBxuArDUAu0OodjXoHcsr9fpk/tlvfsMHE8jylhaE20LOzWO02Co4
	LNyCgtOUaZEp6SOAGtOkC/hB4lk5v9Bmj3tuzNFeqq0EOWGs+xbxOlfjPQgx5Yga6O1LJ2HR93L
	KLQn7ck8M5yJ9WPl32O5NqBlfdkINO6jI0wxmhQBoYTpTMSE+jqqGm9ssMow/tshTPc+RyqGGiY
	r7eSsXGBuUK3YtBcQAtc5qZ12wNg923KP1U3bBJ7M6KLnh7LwcC85tFr9v0e/hM3UL8ZgTc01kn
	QdUS3aUPTQHXICNQ2S+OGQ8/6tldQ1E5MXFb98Z+hR0Youq3db0pxQeQhNp+LLWlfPg4B7343Mn
	x+xENoa+zKGb4E+OBHk1QF1ysuUcMpTJtesdsb3gB4TiNq9R5KvbuLsFiqjsA1P1pFhXnvbiD++
	8d2pmay3HhUuzZKxka3ChHcMsNwMgVnm6DCRi6sd53/fABm1im4yC9b4bDZLlYaHEFl72+Q19y
X-Received: by 2002:a05:600c:3e06:b0:49c:fc6c:be1b with SMTP id 5b1f17b1804b1-49cfc6cc0e9mr176101505e9.33.1788779878713;
        Mon, 07 Sep 2026 04:17:58 -0700 (PDT)
Received: from [172.24.138.145] ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7736132sm296957105e9.12.2026.09.07.04.17.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 04:17:58 -0700 (PDT)
Message-ID: <4056ce28-cbf6-46cc-8bcf-a3db35410275@gmail.com>
Date: Mon, 7 Sep 2026 13:17:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/17] iio: adc: Add AD7768 and AD7768-4 core support
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Janani Sunil <janani.sunil@analog.com>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Michael Walle <mwalle@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux@analog.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>
References: <20260904-ad7768-driver-v6-0-e4378f946bfb@analog.com>
 <20260904-ad7768-driver-v6-5-e4378f946bfb@analog.com>
 <ap0lp5THO64olugK@ashevche-desk.local>
Content-Language: en-US
From: Janani Sunil <jananisunil.dev@gmail.com>
In-Reply-To: <ap0lp5THO64olugK@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/6/26 10:34, Andy Shevchenko wrote:
> On Fri, Sep 04, 2026 at 04:14:57PM +0200, Janani Sunil wrote:
>> Add core support for the AD7768 and AD7768-4 simultaneous sampling ADCs.
>> Configure supplies, clock and reset, use a custom regmap bus for the SPI
>> protocol, and parse the enabled channels and input buffer settings from
>> devicetree.
>>
>> Connect the converter to an IIO backend for buffered capture with CRC,
>> provide a fixed safe wideband sampling configuration and add runtime
>> power management.
> ...
>
>> +	/*
>> +	 * DCLK(min) is ODR * channels per DOUTx * 32. With fast mode
>> +	 * (fMOD = MCLK / 4) and x64 decimation, this gives:
>> +	 * MCLK / DCLK = 8 * data lines / channels.
>> +	 */
>> +	dclk_div = 8 * st->datalines / st->chip_info->num_channels;
>> +	dclk_div_reg = AD7768_INTERFACE_CFG_DCLK_DIV(dclk_div);
> So, this one is (4 - ffs(dclk_div)). If num_channels == 1, this will always give 0.
> If num_channels == 2, this might give 0, 8, ... Since ffs(0) implementation is defined
> to return 0, this will return... 0! So, tell me how this code may return
> anything than 0?

The st->chip_info->num_channels is fixed at either 8 (AD7768) or 4 (AD7768-4) and not the number of channels described in the firmware. The supported dataline configurations produce dclk_div of 1, 2 or 8 and register values of 3, 2 or 0.
However, I agree that using the ffs() obscures this mapping, so I will replace it with an explicit switch over the supported divider values.

Regards,
Jan

