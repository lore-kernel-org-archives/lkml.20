Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0297194C96
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789958615; cv=none; b=SpRKacVH8AYVwrpydJlyrsQa4n/x3hLxgjrQ1VF6E73vf6CWfmjHFbRNq7kGPn2es0iuwr9n6JZI/AaGjuV3I/4j/OjZcYNy5U/UFjP+YzOOF6tul/i6sDbiIqZxPCBdhUP5rE9OsZA5DkDM7LhtuXGY33ostge+GUZtO2Msb8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789958615; c=relaxed/simple;
	bh=2qCydK8u3BZHbP6bXSOaSC6oTwDHyDpQPRSmcbNzz4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FK386o2byauexwnJcSrZQ6N1EnuegpEq5QlgmR7HV5qqTtuEd37vRjWIRueYb+wRI2Hoe2/0A+0A9And12EduWNlCa5GrTrMezzJPKpJlTvPWXr6Mg9QBaXYvN7mbltIery1hClmx8JI+MxfddzjqQFVbTCDsfjsbWtx+wLjmp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ilc4uIPV; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ilc4uIPV"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccdaea76so1053202a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789958613; x=1790563413; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XjC/UZqLFtMb5vJyxy966HHDm1SdiObcPJD69fIKS4Q=;
        b=ilc4uIPV7qgnbFjNemL4roqgUH/7xxEyFoDY90lrVFHRKoRnr4Ad3fC0eBopA0Tfqv
         5+N6FAWOw4GpqY0sdI77MwZa+Lr0zMIlTsgN/V9aXcVP4OyzW5LQD5izc3M75Ik/9Oyw
         Zg4Vuf4nrWZaiA38L120csPNf0mCCjnsbVBLDGH8LCWlk5Ij0C3Ax3kPAJU9p3rKAKtI
         CirlX/Mko1ECH99rbezGtyXc7TEhiA7A1BoqJixXPJoIdBZDoRY8PEMkjBC+ggTj65Hv
         jsTJs5kZQTb67lELMratPfX6j67E9FIt8AwkOQHZOHNWsKJJn7JX86CYVMZvqPPS1GBV
         e1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789958613; x=1790563413;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XjC/UZqLFtMb5vJyxy966HHDm1SdiObcPJD69fIKS4Q=;
        b=bUwlCU+8KoDHPDE7AdjmpTomvm+CWK0N3/1fW8wyka+RF8AJUeI1heA/NHB/cxZQr0
         tihwsQWRkirxbWmWVfwxzV8kAHiDOJDr7UlrTvOi0B+WAASxvluDgfkeQcKqbZtGjU8L
         uROFm2g2mg/KpN7WVkmojGk/FfmwFKSktKW6VnsRlAUaFQkEviM6ciFo+FcvpzH29Akl
         IQqX39mHshLysaq0r1Hwpqg3o/mDENuAfXkT5N8AfyuWJ7sFTMwf0V1oLTbM8zQ416FV
         8l4EG3XEbQinpODQEgwwOvpWDd8HPuotYx29O5/PdHy3Xvd/RyqC9fbeVaGcoqWS6sku
         5Drw==
X-Forwarded-Encrypted: i=1; AKwUvBwNCA+R4H4T56kfcAumQ34npHeAxk3JqChrH+jlRC64O4T7nEvreEHnI8usHjLqBrZt8tHvLTR2GavpKYA=@vger.kernel.org
X-Gm-Message-State: AFuF++ku2sKv76NbRz5P3e7s4RFKefFYUEXAqumkzuu662ayCXc/Nmux
	I2ldEtpMdvFvGze3Q0uON3RXI+9uak0LEwsJbs5ecyVHenJ3cuxaylaEckZ7dg==
X-Gm-Gg: AYBFou0HwPbzrSPgx7fID5KwrqApQQQotjacKUT+L86C8mRzrQMZ6Qmw3uqAGYQpoA1
	mI2oW0EWSj1aROASfINpoGiKXpcPFmAB0dRDRtSNkT4DRN8NlBEtQBPXg741tqpldSwDbEZg5I9
	SBmiUZJt+oXhCKXXc5b6ya+UOEz3CGRO1xZvW/8uNpgvZINBeTZk7Ndlw73bTst/WWyaT1V9qD1
	3w171D6epmaSBRMp06WeX+Ng96t+m2Cg8iAhnGtzo5CadzvDk5Rak4aAyI6aN2DqTaRf/1Pi/B1
	RfY4VsuSYQ7ccPdLiCk1nSw85YESOuQmbaATpOls1AsGHzkJHuEf7TWa1B3e2vUmPAjm4xepoKv
	0rGQi0BSrkNu2lixEaVkPy4Vbs7TBFXMdGkHWHgp4HqVKv+PUZLzTAQuBeGu1q1BnpCL4EoQiB+
	vErw9xp3lqZhD5G0HeR9kdLfEetOnbW2gbtS4MSHQ5y75lGaHg1WowuB/zevgJ4Ot6/k7wvJWXN
	tsKGLH9OAyTBTh85CGVZ/oabsFdgqAHofgPwm1yinm60Jn4jCpLreo=
X-Received: by 2002:a17:90b:55c4:b0:3a0:34a4:187e with SMTP id 98e67ed59e1d1-3a034a41dc3mr3254394a91.15.1789958613234;
        Sun, 20 Sep 2026 19:43:33 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a02900f84fsm10384623a91.2.2026.09.20.19.43.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 19:43:32 -0700 (PDT)
Message-ID: <1d988dfb-c930-4c17-ae77-47b93ff9f159@gmail.com>
Date: Mon, 21 Sep 2026 10:43:28 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/7] drm/verisilicon: fix DC8200 primary plane disable
 clearing FB_EN
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260918030125.315978-1-a0987203069@gmail.com>
 <20260918030125.315978-8-a0987203069@gmail.com>
 <4a7b271d2a90eff94c27dec3bf24114ce44df1fd.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <4a7b271d2a90eff94c27dec3bf24114ce44df1fd.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Icenowy Zheng 於 2026/9/18 下午 01:52 寫道:
> 在 2026-09-18五的 11:01 +0800，Joey Lu写道：
>> vs_dc8200_primary_plane_disable_ex() calls regmap_set_bits() on
>> VSDC_FB_CONFIG_EX_FB_EN instead of regmap_clear_bits(), so disabling
>> the primary plane on DC8200-family hardware actually leaves the
>> framebuffer enable bit instead of clearing it.
>>
>> This bug predates this series: it was carried over unchanged from
>> vs_primary_plane_atomic_disable() when patch "drm/verisilicon:
>> introduce per-variant hardware ops table" split the DC8200-specific
>> implementation out into vs_dc8200.c.
>>
>> Fixes: dbf21777caa8 ("drm: verisilicon: add a driver for Verisilicon
>> display controllers")
> Maybe it'd be better to fix this before adding DC variant abstraction,
> for easier backporting.
>
> Thanks,
> Icenowy
Makes sense. Should I send it as a standalone patch targeting
drm-misc-fixes (separate from this series), or do you have a
different preference for how to split it?
>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   drivers/gpu/drm/verisilicon/vs_dc8200.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/verisilicon/vs_dc8200.c
>> b/drivers/gpu/drm/verisilicon/vs_dc8200.c
>> index f72da10295e1b..25b5906a1c5fc 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_dc8200.c
>> +++ b/drivers/gpu/drm/verisilicon/vs_dc8200.c
>> @@ -70,8 +70,8 @@ static void
>> vs_dc8200_primary_plane_enable_ex(struct vs_dc *dc, unsigned int out
>>   
>>   static void vs_dc8200_primary_plane_disable_ex(struct vs_dc *dc,
>> unsigned int output)
>>   {
>> -	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>> -			VSDC_FB_CONFIG_EX_FB_EN);
>> +	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>> +			  VSDC_FB_CONFIG_EX_FB_EN);
>>   
>>   	vs_dc8200_plane_commit(dc, output);
>>   }
