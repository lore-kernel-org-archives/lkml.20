Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E43B34E744
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 23:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791588185; cv=none; b=LP41HB9OfjjpHWP9Ai1oQ4uqcPOEKrfpPACRtxK0WWOfdGGFyasu6W63CWCGfFeuyd4CU0seTGQgpecZItrWm/dBshaUGyHnQJLvm2s9zihAoA4a+FmiUEYLPBHwH88TTm79ONVk6GDwb50v/hx1Sd/kGJEoOUk1wOsCFggYkOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791588185; c=relaxed/simple;
	bh=VBnbwFMLD3JSNrfnQDebdiG+E2lh/z2NfE/iMSTFfOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=geKvvhh03vV33GsfaFrAAo4Lm/JpmIV9RJnFv3IpBMWoPsdVmLPCEEt61ypFsN2v9tWBUQ/IL8qgqvhq0PpEJZXKfSCK9o5Kt3zaaNCadndDjvNj7XrI+AnKWTZ1yZ+DR25XGK92cDVoVATV0DO9NvQcTRDQBHbARRqBUXKsF1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BcDDop27; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BcDDop27"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3514b90bb89so284422eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 16:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791588183; x=1792192983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NKTLYTxvw3UCc06aTLO4FFaTc08hP3j7X8BS9ATAWjs=;
        b=BcDDop27C+2zWeWF1JrDuJDLf+//jZP3CTS1F5ZTjGWC4MZ8vgWrLMq7b+vhdrbOTi
         j3MD8JOmCNRJ7zRuLd8HMyPZJC8eUQKT/ok44NrdszLijJAzYHe5UlTfYTr8DJSgQ4bv
         Dv80klLLu3FMcOjIqvgqixm+s/LLXURFWZEa3OR3I2Ee0PaLwVt4akjlbI2dnX9ohC08
         OFqfqoCqJOUkMVxE1YCdkZ5LdtmezzpPCiuvhg+HnTgkVQl67WAcQjnlYoOCgC6EQlwg
         ulmi/zCynS3ymI4OQLDF5Em0x8kfTZjUJk/0ARQ9S4SzC7cBRVRSrBDBYBtj/bsY1BoU
         uEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791588183; x=1792192983;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NKTLYTxvw3UCc06aTLO4FFaTc08hP3j7X8BS9ATAWjs=;
        b=MK+aQn0kvv2Iva2pcq7hVg+PGgmzgNvqigGgjo5aSV29ir9H/kZfmC8NsVM4H72X50
         STRNDNfi0aWWyFiMckeK6YYXu7TmzxShQoBFWD/ImbiDPy8ees2cV4yrbJIawyZvr6+t
         itUTsfR/Nn4tkS3Zu9Xk31RLB5wH5GJ6uSCue68A1Q6eH/v0U3NGysdB49FhpwkGH+Kg
         1XrPs9YBnhFjmLPQ6IREMbgDnGi3emfoOcE2OB10CsuYlTCCTp+SJyFp7SCKF+ehcLzd
         1+YXe7AOrVGy+sA5dOXOPQcgGmyVOcWngm1/LX64vK6AW7qdcsM3P+MCC/pbCo8wV877
         t7JA==
X-Forwarded-Encrypted: i=1; AKwUvBzmqigCakj70WvN66BA3WdsAOEHsJUO2gs4Nx+Tj6nTghuNjQ221X5mk6tIEc5OW1Cs91G/d8IbbSOWFjo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6BOtFI1YRenN/++VFR3mHy2qAwZMmPURUVWXqIEHINf6TElR/
	L/03JlbHpvpgwikORJ86IY4htJaFiDYdi3jOAcDRGMLFXHFYf13qKAkX
X-Gm-Gg: AYBFou0U23SV+e1YTr3ZOgfoQg1iRk5QmGkbaxLxajQublDKyY40CZM7DvWfrIe1EFR
	bmNUNnlw+bw6HyyAeP+EMhWTCEDAZBlF1izzsixYAcDElW/OHpzRFhzkhL2nIrOTFRk3N/B7MN8
	SxaDPXw5YW7/FTs/eK96rtwjuAcTq33vN2Lu5louTJ0qJh4X9u5afQFNf2C/ZyEcywG/tBvgWlQ
	fP1IUNp0yV8FA00dPrtargJW1+Y9r9vrZYldHaDkne4eV3pyjLFT+86A5dDUu6NcHBNBajiebSk
	0BMy9LqnBSnymLq7pKJiV9lBrx1gNU8JG8Ya4w79sGcJvY0unOL8HfYSpl7uXWZ1ywURK9/uGxk
	bFJ3HK6fAjgOr1ktishjWE4Njd1+K3ja94O8kwM80k8F3NH7EzGT58DCRd/9aU9cfePIQ2OQ5+r
	KUu78lMxsou6PR8nOc1J9idpQxx1h47x+w1cvODMl9X+qkyI0Mjo7Wraqem7qlK23fRA1ClnAG8
	wzYFUT5ais8ZQa7OgeClPAW
X-Received: by 2002:a05:693c:4090:b0:351:1230:e379 with SMTP id 5a478bee46e88-3537df59719mr5073363eec.6.1791588183110;
        Fri, 09 Oct 2026 16:23:03 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca6d202sm8736839eec.13.2026.10.09.16.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 16:23:02 -0700 (PDT)
Message-ID: <bc869fb3-404a-4c81-926c-545def70956e@gmail.com>
Date: Fri, 9 Oct 2026 16:23:00 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.18 000/403] 6.18.56-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261009140952.119038291@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261009140952.119038291@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/26 07:06, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.56 release.
> There are 403 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sun, 11 Oct 2026 14:08:27 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.18.56-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.18.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

On ARCH_BRCMSTB using 32-bit and 64-bit ARM kernels, build tested on 
BMIPS_GENERIC:

Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
