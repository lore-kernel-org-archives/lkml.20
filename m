Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287288;
	b=fGHSkoF0SGF1hl6l+N0IGV9rj6lcJHkTbhJV4hn8/N2GbWMUaVlmMp2jhr+dri86BD+A
	 ePCXOwASQrZDtC14ftEuHxWfrb4Hhct5NgNzkFe8nJ9tZUQyeRbXJAZnTfy5tR594hDhU
	 PjvXeiGTFmnrWHSUb6+gESlMMXkw7sBf4fu4VH1phtj1T1Fclp5oUEG2+ohLkHGssp88G
	 Or/I2mlpcnHe++xGg2r8M+aVqJjlRtGfPUuMqtwG/EynZEHARy4PlifdfFZrGfz/hyn84
	 4oRjRBpxweUDk6+Ic0zAZ2g/X+Gdfnx+RtBtvXNfzAIMv8PFt+i4pedwJ2qUL1QbwHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=6BGV7yfySv9YIO2Ud9WZxlpBcZd34hv06GQf4K+p8/M=;
	b=GtKah6zUbEYXHkiQQMhnFgxYnmeV2YM/9h7l+b7B3w0i0L6ulrtlxv4OoqcG2hL2FL26
	 0imyFJ0Z2ebdSlfaf72E/G4vjSN5Cobz+8L7EqqI33AlfL7I93NWoLq8HWElHvAK89BAt
	 Vwqaj4pCF7WKvHDHADAsKbzzm/UlPwTh8DSXzVLwcKXP3p21tPVTOf4qUMi6Ac/8SgWDP
	 JKjvRUvv0P+R+SjpnCtRVl7FIlYjPjhymtv0Z2Iz7dHgsDk9m8TMR+auz2QBQqPb2eZU+
	 4nughdm7z3NKSKRaIiUOFyUttcEwMNVgRFof8LjONVYntRUJhmK1Pd27whum3np1T6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=A1S7+qRt;
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EB0606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4EB0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=A1S7+qRt
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4911df1e196so1333858fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1793287286; x=1793892086; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6BGV7yfySv9YIO2Ud9WZxlpBcZd34hv06GQf4K+p8/M=;
        b=A1S7+qRtnIsdQvEP1VI/2eKRAeBOJCsndrd/ICGYTejBeWEHhztjEAtqmgXkk5LDM8
         HYhQwoadq1Rq7zby1ycJswsNJ9xreM8MQj9uoo/o75LX4U9EZFqYXDNZ29978lz+kZTY
         O+vXwcwJedpWNsOO1TjEPjR2X7KbhZyy8et2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793287286; x=1793892086;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6BGV7yfySv9YIO2Ud9WZxlpBcZd34hv06GQf4K+p8/M=;
        b=bxAXTBRMfnT/rRxzIx2lGWy8ug9qwyHzOPCk3wXwrQ1It6+isgm/6Ln1jnCOs6kMTg
         qmbF9d/00QYG9wcjm7s2fEs0QMnSNfVVolUGVv4rbk/jwE1CwARvySB+9HNwkUxcfvk3
         GoeReUWP1OwXBvYE27PMTCDhgOJVd/WHzrSl0DLpfaygp2Bsp7YwhgpWI3GcQBcBwWdO
         0tKvd/eF/0cgfNIzXOIgkvIAO9aXfatj6pHfnoWqZqx2zFJ1/ICNnsrMVGiaD3h+IEfy
         9w5TJRHbt1yVu+iQjS1VkGYU9SaC3jWdmNnCchrIKWPPVQk/Hmt4xybikasvgluy/8qH
         kYHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwk54vcvFBvkFxNG7E9eobTD5NB9e9KVl+A2McnfGT2d4heV3VeRzkzQdiRAoNf8OWHBNrK5ZEFkfO4XwQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjAXILoTH8vand3KjwtqeC9u0JRlUwRTQDyrlPecQn1oYQ56wf
	Y8vPs9TvJO5Ch9xDZDQN9dKCIVQzQyR8jVD8DdqxkJn6DR/7gEQM4O7knLZm12vAC1A=
X-Gm-Gg: AYBFou1uXeRuPQCvuP7tiXhZlOR56M36LUXG02DKdqW26/REja4wRTrMKjTq1M8PlJe
	wuJVyKSs95k4Xw17TpCINUEajKD62alZKYNnztIRu3yI5ZP8tX1OuoyZ5xEHjFa18kVqIrQkz0w
	DeHtDs1+Oo3gvZtuuKG3ePVOhLzhqhhilgKrpWcO14MdnUButFcd1ymy8W8elAIDUXkdvHr26oR
	AmgzWZRYScbvGsfwcU1dJd6xr6MOyEB6/pEUEwEolUs6fqYA0/G8m3gj9qNGt2/Y9ngkhTyseVw
	rDp8jtyXnKx1TrnQ9AQfPwOHgKNTcUuDhaRddDiGRed1Djpt82LXEwpolfcjuGhs5OFOPvobVC8
	RP4FTfkEK4o450dvgVSsBrmzVJtfbBwbfs/autGS+MxE9gzbAB/zjwfGNh1Nzw5xCDjDi1w8+L1
	LL1vWSoL2UU6NU6Phdzs4R9/KsyP47QfdJZCjPSWeZYK3/Etrf7bNxDgpjAm+dwEvrhKnGaxzOw
	PdC8t4VJH3gViRUdXbFOM+hmrnDUfMJAGpzDMeA1E/0HQ5ym2KicdLSTWYbBSif4HLjZPWtDVrd
	PwiZTw025DC0rtbBjbf4dvsHbfBGRBlFWDiLXEg=
X-Received: by 2002:a05:6870:314:b0:47d:b8a7:40f5 with SMTP id 586e51a60fabf-4a8bb9f0b69mr3976866fac.22.1793287285561;
        Thu, 29 Oct 2026 08:21:25 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a901ff3779sm1006fac.4.2026.10.29.08.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 08:21:24 -0700 (PDT)
Message-ID: <111e33a2-72a8-43a9-8a10-a065339c3ca0@linuxfoundation.org>
Date: Thu, 29 Oct 2026 09:21:21 -0600
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
Subject: Re: [PATCH 6.18 000/109] 6.18.60-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261028165942.357251485@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261028165942.357251485@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/26 10:59, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.60 release.
> There are 109 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 30 Oct 2026 16:59:22 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.18.60-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.18.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h
> 

Compiled and booted on my test system. No dmesg regressions.

Tested-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
