Received: from mail-oi2-f5.google.com (mail-oi2-f5.google.com [74.125.231.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0D34B1CEB
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789676652; cv=none; b=i9wmjzZid8hk+LzOGOGs+APhitFgQrRHf5ZxSHxx9PnctuQkok9OjtAp4jkdc1hh+T7HUjGIjbmY7LylIY9pxhpr2dzyQn3N3vw+Is0igXzDLTPimviafouHddZZBvVSIIMno80ue/11fhQDUHebyyXaNm+/nmF6WGvXe6CHW3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789676652; c=relaxed/simple;
	bh=Yshl8u41lsc1ZIeHhJ2AbGKqFXfjn1ErfK+AnH2JZhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=opzvW6PR9IxDCKXkZtk6a0OKfLMgrfNzQ3ExZu/z0AM89Q6by02UgXiuSkJ7/dkNI2EhU7+RnhWx9eUSilbHtwBMWNxBxlSZAPNW4y4buhO4EXeIsCZmA6BP2VMw1VyWLFTLURjpje0bthwCl5GmSClpi6d/82MgUBod+HjY8qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SlHyg/tC; arc=none smtp.client-ip=74.125.231.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SlHyg/tC"
Received: by mail-oi2-f5.google.com with SMTP id 46e09a7af769-801706d7e6dso553949a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789676648; x=1790281448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7itKtlTYX9R4u2oxxBvlnWOsxUd+L61slFivLar7yO0=;
        b=SlHyg/tCnjBT4bNqKfdctuUKg3PNK4VRwtv+XOKJb+p/MiBn9JHL57ngJEyl94zd6W
         SkYQ770KtLFlHptt0zVrylWjVMouOMemyiSlnzx+6E+Xv4emRQWKXfeY9U7IvVEz8g6M
         fMur1/WOEpk88HV3+5OXMUr3LZ5HivlAGRRV4POo9ccopM7YPON0EzscapHZRrBukins
         SIHL0Ac13Dgevq9U8rzWw4OYYKx3s5Wq93dOkSrTUEXBwq9+Z2S4YWpu3BQDaJa4jBCg
         /Y8iUPGJWrjgubjUzpl7I8wVq0U0EHszkk+KPzcJ3I36bG+5qUW5okRPN9IgSbN5UlNw
         QAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789676648; x=1790281448;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7itKtlTYX9R4u2oxxBvlnWOsxUd+L61slFivLar7yO0=;
        b=1h4XW1xsORoJjdEejWHuSiSjPNJ68Hvu3+qv0yCWof0JS4sFuOAyx0PYUfUJ/wNWjV
         Kb8IV08TkIGZ0bG0QLaL8aK838SSNOOrTEIkeCBZM9Yw7xsRX2bz2bvj2OjPNoLBInLs
         1cSFxkVrFBey3k423QdmWUGBXSaRRER1kbXJjezZww5QPV2omPUOHsR1xuMA63A1Yon+
         5xnFlFfGGwR7pvAorSDc3V/ZgXUMXIKAtiJXogpt5Jfo93notFdZrHrQp2axqJ66Cy1N
         cnkSNk15qMNW1ubKViwl7erZegzOkqreYzNeigkrGYXXJsz/gO1XRUEVQaJnthz6ogrk
         BMFg==
X-Forwarded-Encrypted: i=1; AKwUvBzv2hcnp/jnFGbaBgKNoksRsW2C7qU1J33WImmb26lY8C5H1KI2QhJ2sNCo3bPUQWPJAcUckmGU42jFET4=@vger.kernel.org
X-Gm-Message-State: AFuF++mZ8KIftz3P4UWRYm3sEhe1odK62+SmhCaG/UrUSytLw+/ZbdXO
	+81+REmY0K4MZdQJh7gluFIN+VOrE1GSitgpgFWx9JFlcueh+WWdrHcE
X-Gm-Gg: AYBFou13wmwW7PjpWg+ufYMYxf07TRenwV+ehsXvLfU0aL9+udxJHQx9xZBf7soAUC0
	VPJl2hDadONWx2jJtSV7tqi4dXQ+lNMKTeF4gECSBzXxvQzEEnpu5cdIQx8tHTONfKD3N/vCy/V
	O7fPhHTdbCzXc4Sz0H5kL4tW6uvZ+g2xIA7s9/W1A+13TDvS9zcB6/EE+kWabBFfjvFI1GSQ/Bm
	rkZSvTprQFn2pnjVGydwD4gREUDVmNEZqjKzUROMN9bCOjRYO3rxbReAHBVAdwTCIGG8RTZRA2Y
	l6ZoIbE3F93SfXqOHO/fGmec5Qe2W+4U4nvxOLmhKa2qDSm5AuYPsdg7AT7bBzsyRXnv2vwduvm
	l1DFrAMDpp5cPudk2N4tek+NxBjUYzH8yzlbK6KBT+hPikw+Ni/vyuUCxkyWUMDskD6E55mSs+l
	5Kk7KRfpVGl5xpZWyDFKzQco0C9wCVG6ZhLVYmbwpiZnmySMWsObDxWuwUwsW01FW0fI6ABYRk2
	0qUPnFR9bgEWrY=
X-Received: by 2002:a05:6820:2219:b0:6b3:5475:4861 with SMTP id 006d021491bc7-6ca9aa3fb5dmr186014eaf.18.1789676648385;
        Thu, 17 Sep 2026 13:24:08 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::b712? ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c8f5cf48besm3802412eaf.4.2026.09.17.13.24.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 13:24:07 -0700 (PDT)
Message-ID: <2d1b80f2-53f6-4ed6-81bf-e35c0a9efb26@gmail.com>
Date: Thu, 17 Sep 2026 15:24:05 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] iio: adc: add mt6397 PMIC AUXADC support
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 mfd@lists.linux.dev, Roman Vivchar <rva333@protonmail.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
References: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
 <aqpmgliQW7FW53o5@ashevche-desk.local>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <aqpmgliQW7FW53o5@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/16/26 4:50 AM, Andy Shevchenko wrote:
> On Tue, Sep 15, 2026 at 11:15:25PM -0500, Ryan Brue wrote:
>> The MediaTek mt6397 PMIC has a 10-bit AUXADC that nothing in-tree can
>> reach. On boards built around it that ADC is the only path to the battery:
>> the SoC's AUXADC is wired to board thermistors, and the charger ICs these
>> boards use have no ADC at all, so without it there is no pack voltage and
>> no state of charge.
> This doesn't explain why a brand new driver? Perhaps we have existing code that
> may be updated to support this device?
I considered adding mt6397 support to either mt6323-auxadc or 
mt6359-auxadc, and both had problems.

Both mt6323-auxadc and mt6359-auxadc select channels through a request 
register (1 bit per channel), while mt6397 uses a 4-bit numeric field 
CHSEL in CON1 (10:7), and then pulses a START bit (CON1 bit 0). That was 
the biggest reason I made the new driver.

For mt6323-auxadc, which is the closest I could find to the mt6397 
(CON0..CON27), it has 13 more registers than the mt6397 (CON0..CON14). 
It uses CON22 for its request register, and reads the result value from 
the same register as the ready bit. We don't do that - the mt6397 has a 
factory calibrated value for each channel at 0x16 higher than the raw 
value. mt6323 also has a 1800 mV / 15 bit scale / resolution while we 
have 1200 mV / 10 bits. We also have some per-channel preparation that 
we have to do before the burst, that the mt6323 doesn't have to do.

For mt6359-auxadc, it has a more generic framework for describing the 
AUXADC, but it assumes requests are channel-per-bit, and so we would 
have to basically ignore req_idx, req_mask, rdy_idx, and rdy_mask.

We also have our own software sampling, which the vendor does too 
(Amazon Fire OS based on Linux 3.18). We'd have to have our own sampling 
callback to do it.

I drafted two other versions of these patches adding mt6397 support to 
both of those drivers, but the differences meant I had to add a lot of 
extra boilerplate to each driver and to me it didn't make sense.

In v2 I will add the justification to the cover letter and commits for 
why I chose a new driver.

If you'd like me to instead send the exploratory patches I made adapting 
mt6323-auxadc or mt6359-auxadc, let me know. I'm fine if it ends up 
seeming like we should adapt one of the existing drivers, but I think 
the mechanism for controlling this AUXADC is unique and merits its own 
driver.

Thanks again for the review, I am going through each one, and sorry for 
the delay. I'm rather new to kernel development.

Best regards,
Ryan
