Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5F4389106
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791489429; cv=none; b=C4GtQ/A8PfizNFq/1Nzi7UjAGkUYIL/fuXigomQBc8UmoujJoyxzLCEUfwDqTI23TvuS6SL6hBibQrirQ5dE4hPD52yBH/KsFgCUgwqoRuzcNv4sJrrDW+TYgLsVl45rHEC6cvX3c0i4VDdoNoYyjEvglMsJpC5ujV1hOnd18vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791489429; c=relaxed/simple;
	bh=t45JZa4asJQY5m2Xan0mfGL+lA9Sq2vCHMCGDDsr/6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e5+Gmb9rlxSO+oKYepWAJ8HTuqLpoa9R3CxvTuWa07KfDlU3dSvwNN5TsNk+Garc29r/pzHd12ZmovoMx1GX1hTUSVgAJ5uOg/8Cng7lKeukl2xtc9VEL7VOnnpXVOkUennmcYKHHyihPKMc0GTN0mkNVQOn3v9V833BxP0iAjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crG9U/iL; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crG9U/iL"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6acba4bf65eso2606105a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791489427; x=1792094227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6lpUD8jRO1S8/Isf95iV6WJCsldqW7LIOSCg3AW5Tl8=;
        b=crG9U/iLrp57vUJWrIFLBqU71dyGxfgBHWxtNWcVxkb5mJ/a0JOxYghPYcjHmUseMS
         j4Q8bOjUA1o+yVYRHaOOoadzI8BX1ZNkXiTqlBH/Pufo/Hxtr/Yw3x0fC+6wpcx1Ah5C
         nl5gxPbRe1YOVTR2Kxx7EL5S6Ia+oFJGkYjtqJTzkOXDa0V+r32nhtQxzumUsS557gMP
         rb4bqWmpgRV9oWAby36bbnx5wQ2aYI2dysG20VQ4EML+mlUqpItsoV9bZVnd/08f7flf
         JGqFnUuMKT9Okekhb46geAwXBNR0SGdT4fvQuFXpZqX0ZgrTgdoIdxNSaJS5NjcMIPkH
         eJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791489427; x=1792094227;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6lpUD8jRO1S8/Isf95iV6WJCsldqW7LIOSCg3AW5Tl8=;
        b=UcKhThT+cVvYn1glckjcDG7Ks5YITFmC0Zem5Nis0Ubk50WvhyNaJ1hETuQM0vMS2r
         CWVMvTCmg/vDJkyj6T77VmVxkODMxGxrYmjMwCbMyHUxTvtpnC+ezaL2J9ESecaytBCw
         9AXyMZCI0Lc/d6CDh27EGQ2uVv404KeNUF/wbzHsBpEkqyx6YdBH5HVIQCJS9k6nM9QM
         cNzNUow4QMO09aT82LYGLXCzhSeqTxLEEhr+FwncZ9yfescWRncpp6LgX0TRY3NkFWZj
         cZQYXHwTZbK/KW3Qs3BIbFj1/G/aOd6YDWp+gGVuLwXe2UWAgPrUIfnrQjS7iiuyB2tK
         TsIA==
X-Forwarded-Encrypted: i=1; AKwUvBwVhv8koaCZ4YrUCIC8f88WfCNVakbp1JjOcGR5gmhMVC0SJn12sjarJHPm6a+kp5hlNOqXSeveRFQnIOk=@vger.kernel.org
X-Gm-Message-State: AFq9FYINTIdkDfW7Xof/AG8toD/C4HHtXMr+rcvurlM5+IB4RW6XNBJC
	ogzM4wpub32Wz/HmAwb2L8SLSPtOjKcYeZbCA8neITftm0Wul6nzyeMQoy/7Rg==
X-Gm-Gg: AYBFou0OHI3ENeT4uCz9wHm8Oe2s0bS/AAXQC1XvjYJEFQ4ebZEs5/6XlL2PY4f286Q
	prhI1tYoCRlXrFX7ZHlGFX5SQl6g1XKMpfHBfplxHOK8OG8/yr8EemTnfhUlRv18y2cIIwzzS48
	AfLyMl84FYHWNz3kk9EESi6ZX1UwE9LJ+cBdi+ke93UOBJO4+6yU0npGHcMHz3THkHEgT/6dG5w
	h/gBgfWEBjMCPWMaQC01U/E6M5o3zIkEpRbP0V0LMAOvsFz3m1Ne/C2TruvMyxXi87LADyHjgki
	ovoo3lUQpPcL2GXmsLpZGawJknhG6LyNUQpjIPHnxcad3dsXnMS/WAJxhdNR0UBGNmDsKA4XrRB
	kOsk9cnScs1hiT7taSBPd/248/V1Q3Uc1hE0ptylfXuYLOUkmbM0DaZIL+2kCEpujN5LNlmJA0+
	9fQfnYFttXXyUq3e6TkQMphNV5bYa+Ie0rhNEDCpSowZ0Y5XN9OMxY9I5n8+BCI86TK1krsDavY
	2y4UkA8LA==
X-Received: by 2002:a05:6402:11cb:b0:6ac:73f8:2e4f with SMTP id 4fb4d7f45d1cf-6aff47d1960mr6234217a12.29.1791489426354;
        Thu, 08 Oct 2026 12:57:06 -0700 (PDT)
Received: from [192.168.0.193] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b178d1605fsm48335a12.2.2026.10.08.12.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 12:57:04 -0700 (PDT)
Message-ID: <18da135d-dc3f-4975-a36a-c680926fac40@gmail.com>
Date: Thu, 8 Oct 2026 21:57:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] leds: aat1290: Add support for AAT1270 Current
 Regulator for Flash LEDs
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261007085457.98762-1-clamor95@gmail.com>
 <20261007085457.98762-4-clamor95@gmail.com>
 <e69041a4-c03e-46ae-b83a-3d8363070e80@gmail.com>
 <CAPVz0n2t5tcQB+YhNCFoQCStizEjTdyx7pDzLHtYkoz=B2MPwg@mail.gmail.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <CAPVz0n2t5tcQB+YhNCFoQCStizEjTdyx7pDzLHtYkoz=B2MPwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/8/26 10:15 AM, Svyatoslav Ryhel wrote:
> ср, 7 жовт. 2026 р. о 22:04 Jacek Anaszewski <jacek.anaszewski@gmail.com> пише:
>>
>> Hi Svyatoslav,
>>
>> On 10/7/26 10:54 AM, Svyatoslav Ryhel wrote:
>>> The AAT1270 is quite similar to the AAT1290, but it does not support the
>>> Advanced Simple Serial Control (AS2C) used in the AAT1290. The AAT1270
>>> uses an earlier version of AS2C, namely Simple Serial Control, which lacks
>>> address-sending capabilities.
>>
>> It seems that it is not possible to set brightness level and flash
>> timeout. Those values are controlled by the values of RSET and CT
>> elements attached to the controller.
> 
> This is not entirely true. S2C allows setting brightness level
> perfectly fine, I have tested it on my LG Optimus 2X P990 (star) that
> has this LED flash driver. Flash timeout is fixed, that is true, but
> both AAT1270 and AAT1290 feature mandatory flash inhibit logic which
> is not implemented by this driver and can be used to set emergency
> flash disable.
OK, let me try to perform more thorough review, after consulting data
sheet, in the coming days.

>> Those values should be conveyed
>> via Device Tree, and the LED device API should reflect that accordingly.
>>
> 
> They are calculated same way as AAT1290 does and set in the device
> tree. Being fixed does not mean they should be removed. Device tree
> describes hardware and those values are part of hw description.
> 
>> The question is whether it is worth a hassle to add support for this
>> older chipset version. Could you let as know on which device it is
>> present.
>>
> 
> LG Optimus 2X P990 (star). It is a Tegra smartphone, it is not yet
> supported by mainline Linux kernel, but it will be in near future. I
> am currently upstreaming missing parts for better support.

Ack.

-- 
Best regards,
Jacek Anaszewski

