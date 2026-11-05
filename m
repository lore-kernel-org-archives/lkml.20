Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793920845;
	b=3XoRFhohdoM8nBIhPPSeWFCqF/FU7nwIzjXdIG2Q5CMgYYzEHdzbJlLNoBqyH7R4pK8Q
	 FxX1ZLI9JirPKgLpt1nSr4ygzhQcPNq9MeeP2WPps/6BpN2YCwWsqr1pTGldvQ9QxfJ0w
	 wJALCF1xjEQkMGBsK16V6vnnSoS2R0syY9O+TzGEMRAdiE/8wI3viTqhNU0wVUQfr5lqL
	 BAfLHqic+89Dp8lcSepzSKOGympWqMZi19y0dDV+EaewqwnmHTsbV2erG96IDMNFW/2zx
	 NUC4x5LBO6q0Nhb+Q7rWV1sfGcVCm/NAgdBu0/7gYUffVoOAET6zUtaaLOXJAKNiOqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793920845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7TboJa7vOyFx21F/S29MlnKjYaribdRj3iyzdvB38D4=;
	b=gQaKP1Y18GwTdE91LbwZLIkfooY+HjH9M3FgxMdvXsX95430GSfUhwoA8pPZ1bLm6S8y
	 tf6yuuK//1j6ARuEyvAWI1rXGlzRnp1WAtVnp1takO5GTsKe6JD/cRlzoYXe2IhnWZIW2
	 /L06bTeHzsz4FsjDHRMbelvNu435b35vjJonXhbbg+bOfdHPqdXy9WLbG9NRWt16bVL25
	 63jJqhRMMKtLugPe2Pu0SsjXC9QaZsU6NZOC8bDBHaW8U/oONpx/5jvWHxldlxcQeSGVk
	 1lhHVvyxnvfC+/bY7KwT2/Mi80d52elwM+TzcW3so8kOQLEhdkWocpxmzZrfugf3Uag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=Sbhi7Bem;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA90606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AA90606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=Sbhi7Bem
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6e560e00a86so71932eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1793920842; x=1794525642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7TboJa7vOyFx21F/S29MlnKjYaribdRj3iyzdvB38D4=;
        b=Sbhi7Bemt5Hc8toMS4S0rRJ2XTLFzyPGH0jI1PTygk48WLjylo+FnbXK1IKakGxOxa
         ysCaCsIDBg3jc9KZFgVQKQNQTeREXL3dBvj8/r+a6+JUq0qMliQPfsLkoq7sKv7iq7xJ
         l1HbBcWLbFLq4djDTy744RksTIjLGJBbQ3sSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793920842; x=1794525642;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7TboJa7vOyFx21F/S29MlnKjYaribdRj3iyzdvB38D4=;
        b=aRiZMzV0bEPuDDXt6YYnqaoa1WJ2gptb7inpMalMGjm+m5Yar0adxJk1FYFCT2AK7g
         3Ezn7iJBZYPBTq1+/pd8s7l9pbcR6/+mtZuO8DGyMdnCeHmIoarzWPQvB0dTdp7k/s6n
         B1S8Wvi7+vj2Bv3ayRiqD67WEOwdDAWFSGJpyoX0Fpo/rF7n0u+mfKHcvf95bHFG2TNw
         fLSf8d5mZuNONN5gQcYsA9cIt76+AI4KPFSJ47GvhqiZQy9VlvpDKUsfcWq5UGndGk1k
         hjpItr+14Rxuqa+zbnHHBqPqYdaojVWu2R666q9TWFiowJWUWtIEI5rcZFvM3CpVKutQ
         ueuQ==
X-Forwarded-Encrypted: i=1; AKwUvByQJCjLiDsCDMmNMxZbm2qZF4sHAKZzWnc6feJA9O9u2JJkLLYV/yqWavhONVSm2FHDADuWcYpAJAC9RIg=@vger.kernel.org
X-Gm-Message-State: APuU4Z920DxPv7PdTatDLtcWKkL7oMgKp5m8JyGwMM3gcbxipIAK/TH1
	f3kugYtWtn06Q2EJ/1DXwa4pnejnchqrbpNHzcEt6pd7jxvp7/2myMf+0YsgQQxrC0A=
X-Gm-Gg: AYBFou0tRredYUZueAdH4EiQuvY58/zf3DLjNe9ncrasjfSj/n4ncyBRdFaBNzuECZX
	FM42HVraCNFe34HFwYkDgm1dMnypc5EqQ7tmsTRmcpOtPzT58rQUYK6s2tXiezswTrP80it5Ha/
	yTz/O+cH/U55xpxeCTXY3bWZ6+0bdT2dlRjDsiEG8mIVZMhStKHLWOTRBYkMcjEN2tZlVPMcz/o
	2hwcmMrLkGgzGn0YlstrUi15i1PrGt/H6s93gYMDfXhS41TTo9+lP8X57ALxYBTZoR7XCy4xI6f
	yZqQ2ruAbfgG4ujFoApsYNLQD/+7oQZ7sQPn7HJI2Rkk0PtOGzpSyvtzVvYRpALyEUMhDuCpjjF
	vDDvR/+k1XXO/fIHw3OicV5Y7+0RcyfpCrgbqBcKJFXw2eiQ027FU3njCGJCoignaQDs8d6RLnl
	0hTIPdQZ9mnakZuv6Y0YaI4KyoNd6ZZzc03ObyPSkgHXTCLKTFX4I6CIqtx0EtuxajI4PeONOG5
	xyLkjfuTc8c32IfDCJ3Q0sca1WDrP1VN9/ZgxgpW7qTjy3mkb5RHY779hWVOE6JCI1Vp0S4CG0M
	2iyGRqbSgl0LUZvDtQIGRu+amRxW+uk+DDK3SkLxNQ==
X-Received: by 2002:a05:6820:1346:b0:6fd:4277:16e7 with SMTP id 006d021491bc7-716e78e3963mr715043eaf.23.1793920842324;
        Thu, 05 Nov 2026 15:20:42 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716ea18a791sm484293eaf.14.2026.11.05.15.20.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 15:20:41 -0800 (PST)
Message-ID: <76fbb257-cbe6-465d-97f4-f8ca51df01c1@linuxfoundation.org>
Date: Thu, 5 Nov 2026 16:20:39 -0700
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
Subject: Re: [PATCH 6.18 0000/1005] 6.18.61-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261104211043.516122098@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261104211043.516122098@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 13:55, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.61 release.
> There are 1005 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 06 Nov 2026 21:07:23 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.18.61-rc1.gz
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
