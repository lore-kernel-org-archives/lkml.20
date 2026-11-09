Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254572;
	b=aKXRuKFBstLerqAyfLFLIeaS9/ysAZI/hdampH612gX7uMEVsrAMrNQVEm2cdXv1Z1+j
	 0SNE6y9EliuwE8+4bh6eb+ST6Adz/8YTSfqsk3smNXV7KfBCUjFbPakOaY7lxn7F78Jt5
	 QPOiV7G8ZdtBG+3hVAIanlrweZXjJabfKzIE61ojwiAHob+ieXZPWqbiY2onaRJpZfmPE
	 QARXMZR10VAQLCDNd3QtFHBcEYNfPnUGuBpAt7c42Pe9a6/u5F4aajdu/pFrJkD0USC0B
	 tFffrI4iXb6dXP0V+HoEFbWctYzZYoLMRIffBsMrGRXRBCid4ooT4rfcwLDm+e+z4HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=erhI7CgGmnjEIhSdlY+i5ow50tWs7bchacWIGAhyT1Y=;
	b=Zkj5aIPNrnO7X1lL+88ZX96WhLG2p47dMSXM0xOsPIxw9pDtLE2C8dyzShzd46nayKK9
	 J3ghVE988OVSPwY7T7ZRi2KWlN/NyVKsutsHS02dcGII1WcXL40o5tWWCndGB0sq1JYjY
	 9pG4mfptdZqFoZsI0PA1h7B6glSkPcIUdlF5j1jgOf0UO+SF8Qwc7vcdfDHswBJq4gtXm
	 5sj5VGFoaMOIhVAc5vzxe4d8kcVUWBZLpPmynVApHehwr5s2cmjTdxJLdyMZ0s58iFr2f
	 2bE1VouriY8bGIP4qSz/1+eQtfQq94iq0b0venld4+TSBMzpeB38mfloQ6NazksKKSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=NkwQf4nG;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C7860A2608
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78C7860A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=NkwQf4nG
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6ddef424972so1120169eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794254569; x=1794859369; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=erhI7CgGmnjEIhSdlY+i5ow50tWs7bchacWIGAhyT1Y=;
        b=NkwQf4nGPmAtZiWcPVVUOW1mb9v/UEMjXpTwCEjLg5/GenLJQ3M9liEkWkEEHB6qPi
         qI5v7uwsEXE8WZcGoIHbKE3+RibPy6ykDG7ZVLsJzn5LTNzWGrALHUoSlleVZ1LuJtqK
         JetSAEqm0zTeCrF1NUoeKTzPFMoGxg+DcS5DU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254569; x=1794859369;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=erhI7CgGmnjEIhSdlY+i5ow50tWs7bchacWIGAhyT1Y=;
        b=uGyCi19guzBaXzdh68PV1YN+JtmfMk3w/M1DndIkygaG0llkkzs0ZMLlsJ3/OcNqOH
         2oLTo0XLR1fBc9k7bLfS/vBNxNBcrWy4Ecea3igTIiI5ivXgA3P4Cxmr7LsKYwKTiTui
         Ni4wbZjyQgH7RXYOJEgBC9MrYijg1IbiXq5toDSiGGrPCU2axJBKBbbjCPJgTmYwHgRQ
         LywVjS56lhOQuzsga25zsCyd50XRC3OBIitM1y7u5l7IniAA9Xum4JIBmI6252NkcnoQ
         4Ag3bYVFv4apmSs4Xle1GvkiQWsrURQ6i8D6Hm/3pzl6jZkB8AikWyYAQvqm79na0Kms
         3ESA==
X-Forwarded-Encrypted: i=1; AL+hErHgek6zqRKKrxAL4eaQbJKX0wXPuPidhWDddf5VYpLMDlLVW+1Gqc9QBeJv+EGjk+bjHwZv4HN4Y4ruLwI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+5Y7l3+VUtARZDqAmwECSJNZQUWnOfK1/4cAWv2zl6bNd1UCD
	EAY9Ua8FvAF+yaXtv7W9blpiNlEQiyPdFti1KNmIf0y1pIKl8FYfSxk5yoFI8hBgG+E=
X-Gm-Gg: AYBFou1p2f8tReeBpyxOtBoY5DMBJB4flQ6H/9QxR1D0tDF6dt7hUUCldlUFM3b6aT3
	me2n4Yq2RtwgeEUK2VLrCGZ66GO+dUKM7wTcZ9XgDQ4rb5GI6Ig0DEWdZxvbYjH+vBr/1jIy/Kz
	h2YUyD/Xg7fhxaTIQ07tzkLTmVryIpGouWKakSod2t3xECHbjsZAbC/TV3XFloS4NUq0XdnO3ju
	/wJiLDRyWVfYIGzM9DcJWnrt5cwy9xyNZ+W0gBYr83tH8he4Uh2+XDgh64k9KQgi02bmNVtl9qI
	ypQNetZByTm2HywdN53Dz1XAjV4syRPWkWHP56f2AJaGk0kY2j1W/BMFFR4gsdWJs+hB/1uOdyM
	XOu5VzcfdPAoaWfhZjcG8Ctm4i/b1is5SkJuuW7dtPC1WBEglaRKPBkniMFjv8XlNKnSQwkzdA8
	i9BhccWx0V/VnGlo1TXkGzTzH55baDfSjL4RMSa8j0378gVy7qDSulTxp7LruUd+4Q9mCG+cMsA
	dzaaD9KcJPh/AhDCnTcYs+g566vvAaNwixxC9+iElfEZ462dcScyvQbFEocxkwkYDX5M1A4FDYt
	5FmjGk1XMffdZbKGnp02M39sgf9pNLPfK6lsug==
X-Received: by 2002:a05:6820:1391:b0:6b7:8415:d78b with SMTP id 006d021491bc7-718a5a6057fmr114851eaf.54.1794254569267;
        Mon, 09 Nov 2026 12:02:49 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718a8f660b2sm109293eaf.4.2026.11.09.12.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 12:02:47 -0800 (PST)
Message-ID: <0860d94e-c972-4159-8fc2-75885451eb64@linuxfoundation.org>
Date: Mon, 9 Nov 2026 13:02:44 -0700
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
Subject: Re: [PATCH 7.3 0000/1257] 7.3.4-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261107134939.434104957@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261107134939.434104957@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/7/26 06:38, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.3.4 release.
> There are 1257 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Mon, 09 Nov 2026 13:46:08 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.3.4-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.3.y
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
