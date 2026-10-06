Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C0539A7F2
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791285542; cv=none; b=kZEbNCsdT52CW8mbob7190jLEDmNFGp2KV6I/30G6+X1OeYCpJ5hkkXI49JDzmgEaSMQhqyqTpUS4WNDcX8O4g/hwJX8/pOB3hNObCTcCL2uONmxB4mAW3RFOw+Xpj9obNIVtxOj1KiJnv9PUpNdg6vlgNDQ748boQwbD8jjmm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791285542; c=relaxed/simple;
	bh=T9pQLHtkTws6ReeUvx+8dHa8B2SrtK8aEWmbBiNo0o4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NdAdnYFaOpoHjdcYzwtOxGvH1WGyHAQ4RwGnB9fjs/8pmC+EL9PRgWW0MH69fYTifCd/WRppmPk+rIKrZktV9uNoaQSJONB6aHyxsTVMEuSckL9Cz3ZnXiHY2l0ZvnSxRk6skOxQq+0wz1pbFEEpP2CxJt5eJQji1eiafdUOiJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LxzelV5a; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LxzelV5a"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so2254549f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791285539; x=1791890339; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lbWPBQuVRiue4AC08Y5e154S6RcmoKslymnN0Vvmfhw=;
        b=LxzelV5aud9Wnv1J9wVSZXTPhQvi7hAFXQOpvPF0YTwXFfs9ye9oI+Prou4aw++EcB
         1wqQRopugMAcPy4zlA32Cwy/kjuDnSs+MpNkPQKbJTB/MdvDRZKsmoC5Y/Q/AhTA5PQ0
         9qBMb3aWTR/M79nQVJuV3qjz8tRw4MoZ4a36NmadUR2fpLEOHgrmqXs/felXOdtZvlMG
         MivoqHKygUV8c7pZuW8K+4S8BZ5hpfPUCTgXiy1sKTGoqbxmIvda59XqlnMTSBJZ4XtF
         gKS/9fpzeeEUhHqw7aVrp2af567EwKFuR3mLe2YwDwlFHPQdM8Rk/UTUvT0c1Zh+5/yL
         nyyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791285539; x=1791890339;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lbWPBQuVRiue4AC08Y5e154S6RcmoKslymnN0Vvmfhw=;
        b=SwYE5ZkAMmYUq9ogGwAPLiG6f6jz66ImJJzCQDL3dgsIyf3YYOVxSBIWnVQocrgCXR
         R1C/TsOd2ekCgCnepYtgEDcdwYh+99CysKl5HcCqqewp+q8nWnXVdZYEprWQmpQPOkSL
         UXc48BLuGw1xW5LmRmvDmTQQ3n+yzOhep+ZtLkqc6bLhVOgxycpe1mJRsvb1kZzbVy3n
         cgLJTIrdbmC6/vBKog03wrM6Ir6nKvJLTBfcmDmXgH8N/qV5SaEIqq1mwvx1E2wfhxgg
         9K0/enl0ZnCzunn/5HmbT44CWZ1mBOUjTIeeCRiWP2YE8HKNHn7Z0D3WVXD+hE85ouBm
         wEbg==
X-Forwarded-Encrypted: i=1; AKwUvBzrRPpuyYPdSe27ofa/6zXgbu/i3p5Ruc8cfn9F3ft32auRT9JaoCneKCPjV7dLEYYR5BvLFVTrxVgEAWY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhS0KT+xcQUrUkmvPX6+WPvCEPaDAxHM4XtF0gENivZ5kGRHpk
	GIfVsfbk7vwGGIhtep6afZQJHl+442oseFzFtaso0SWE0OIRpJuA5WDx
X-Gm-Gg: AYBFou3DC5W32wi2EMu6wzctdXo9ZE6oOFJWcfBfTQPLmyvKvqx5aqMrmBKkTTUgRdn
	k+P4N5cytFdFzmizW6Il2yTbt+xFUrWsu8loKlMvcLgA1Gbd8+Ykj4XLRBA5YYj7M2Sr3eEWW60
	8GAgyv1okyxGc6jHdlR5DgAI+M4KjgyOZaKD75g40T1L9HW3TrcFdb+71XRqF6/RsTQn55m7sav
	H3uHSSNPe5f7eK+lJu7B1feJD1+GQkwQzCkU7sN+LrV6GBFs81mGCFR9X8ISXOOw6O4i8OjmJJv
	pXJqQ98kr+NpaYrPSvhMtlbyQXL1vNJY4aZfA2tY1+6e2XWBBJRdZOkCla/8h/dkrZBhD/yRfw4
	HOGw5K5w4hpEiGso6CHq/vzBH1qT28LUNLWtpwou6guwvzy/hfhNor+IZ4/O44vIlon0adWExgB
	HAKi2gcpimlrUeugllbBJ+ZmvCZH4c+ttlF8ZSLBFcOTknfK7e2+VzTBj8O9uz0L/WxJdEPnI1+
	Tq94A==
X-Received: by 2002:a05:6000:1a85:b0:487:490:8391 with SMTP id ffacd0b85a97d-48c6d160060mr2104906f8f.16.1791285538622;
        Tue, 06 Oct 2026 04:18:58 -0700 (PDT)
Received: from [192.168.1.50] ([81.196.40.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6d264fcbsm2172381f8f.47.2026.10.06.04.18.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 04:18:58 -0700 (PDT)
Message-ID: <3a57c874-ab57-4ca2-98a9-d5cf4fdf285b@gmail.com>
Date: Tue, 6 Oct 2026 14:18:55 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH rtw-next v7 4/6] wifi: rtw88: 8723b: add the RTL8723B chip
 driver
To: Ping-Ke Shih <pkshih@realtek.com>, Luka Gejak <luka.gejak@linux.dev>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Michael Straube <straube.linux@gmail.com>,
 Peter Robinson <pbrobinson@gmail.com>
References: <20261002073845.31486-1-luka.gejak@linux.dev>
 <20261002073845.31486-5-luka.gejak@linux.dev>
 <aa7d919d98304ee095990735f39095ac@realtek.com>
 <DLWXWMOGZGX9.UANQJR9PZYWG@linux.dev>
 <359ea3a6857d4aba9c83876a10f7f9e8@realtek.com>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <359ea3a6857d4aba9c83876a10f7f9e8@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/10/2026 03:39, Ping-Ke Shih wrote:
> Luka Gejak <luka.gejak@linux.dev> wrote:
>> On Mon Oct 5, 2026 at 8:08 AM CEST, Ping-Ke Shih wrote:
>>> Luka Gejak <luka.gejak@linux.dev> wrote:
>> [...]
>>>> +/*
>>>> + * Shares the receive PHY status layout, the SDIO aggregation burst fields
>>>> + * and a few baseband registers with the RTL8703B; reuse that header.
>>>> + */
>>>> +#include "rtw8703b.h"
>>>
>>> Which layout you are using?
>>> Should you move the layout to rtw8723x.h ?
>>>
>>
>> The layout I reuse is the RTL8703B receive PHY status structure, struct
>> phy_status_8703b, together with the SDIO aggregation burst fields and four
>> baseband registers. 
> 
> Let's use another patch to move the struct out of rtw8703b.h, and rename
> to phy_status_8723x for example.
> 

The same struct could be used by other chips in the future, like
RTL8192EE/RTL8192EU and RTL8188FU/RTL8189FS.

