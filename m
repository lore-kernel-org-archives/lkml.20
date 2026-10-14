Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6644A4A92FC
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792016015; cv=none; b=r1A/w1gDZbnyaDepizS48DbXRyeiLGtyjo/Grh6suk/f75IAlm7tD2TeroOkVsWHw1UTZcKsKht+XtASvs138M94KQRcZTBeppGtjcK//vOV+zUg7yviVehTXjlpOJXW6YBzeYZ6wRXs3Z0/XcqtM4eqzejkG9NNYJvOLoDPQPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792016015; c=relaxed/simple;
	bh=OJJLDBSVtpI8wz96AabglhUFLbr4QIfvWBzdT8ARCdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xftni2a44CG6Gwl9N6kLkIQ1M6OyU2OG6ru0rK9US9n1U3ZwdOnE4dN1EN3a414f01K7OCZ4Vp73u+Ed0VlYHHF959SGk7LcsEN5RNQmhyFf4wmzE3d1VwyRDKIbPOiu1mbER7S5cTs4yveHftJZRgOkFmT+2yGooy5/gy800PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+lj3t/l; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+lj3t/l"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-14394530ec6so3894103c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792016012; x=1792620812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QxweolJrlHVj2MNzfSYncB6B+aQ1Kt9zKOvPMQbgcwo=;
        b=N+lj3t/lIENMHblKKnEzLHQtsFWe8h7GsS5lyghCxwvTrqMA5aOJlRLOh9ixLjubhV
         SDB9uy8p1ueUH4DPGJRwEorR3CrFL3kJbK9wqsynAgZxjjX3zGEPnkj0uN0YKhlW8dCK
         Z++yACGXvkeG89mdtBzT5y992fw3FKP/VGVnQH0zegWS2eXdhxkbD3wEaqiFp+zGLMbq
         /5VQPjwsE8jBHiT6Hm2W5GBOhwwPPj1NgEcSpgQPyGa0OrkhfZFYlpQKuQhqKv72NZv+
         7GoVVTN5o6qAwrGpWa7agutnOtdpTEBOS5toSe8YyiYT9ojaQ9d3newrdMX6lExMrE1G
         pegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792016012; x=1792620812;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QxweolJrlHVj2MNzfSYncB6B+aQ1Kt9zKOvPMQbgcwo=;
        b=UgGu5dnOIvWX4jGXT4qRgzObHe1vSBosMV89oJpuBCkT8mD2GF5L3OPtfUXSMu3P3y
         XutKu1zjU6tF/X4o/hRwt7JnEZcu+JgG8ZFgWlOU84xOzqbX4omledH0EglrrvD6oLlU
         60vpvJ+eXFmj8BR+TMFRlp75nb9OEJHd+63lEq9TcK5mwNqgAhh9yX1bIPMfTy4SMZEV
         SbCsU0agZkvzo1dxJRNqRdhDquvcM9L8R0yzAtOJAFP/8TBFYAe5mDyGFDun86yvQ+Tb
         CfJpDB/8513jJU5VB2sVNbiTWwqo4n/YIURRCelki5c4gSZ+OG2kQg76TVpl3IQIxH8W
         zLyA==
X-Forwarded-Encrypted: i=1; AKwUvBzKcq08YxT/bHiE7wd3LZEk+F8qPHNXQG3J+dQECnjIJ84m1NOnIqOjC75nkO7ZjUXHRStziBrKbgXrewo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBFq9JumRuRS7EFajrpx9yAmjeovksqMzYqZshor+vR/kBmuQN
	vLMuWHTz2ttdhaR6H4Lg4DmedaNhrkgUEgcZGPpiG8ebB6rlSTokfj/A
X-Gm-Gg: AYBFou3V5sBMpapVMGf9DHHopr+8QA0Hjp2iNTif9RkkWf9OUBXdR2I3T0RVObaJXUM
	Egge1os+DoBTihBoP0DCtivZNBK2oUC8CNtb0dvQB6TvU1iJI8TgXJetBQlrKX9DrdL2/y+dWyA
	YB8Om7akeXgR9a4ryMtr9lnuCan1NBCH2RoG3I1XSw/f/pbAcJHnPCOoejDloE7YH2Nck8d2Go3
	hF/hlHjoEffguLowmqF+8/qsMWWohhEodK8myEnjWw0yxzDfn7St0v48h+RclQRHz6VAM82kRmf
	wmk2+Z9bYXsFu6csvZLX4XU0lZ/07tDIE8DQZcz1StzxYNbfD69y+P3+6SOQsFHdpkkPrwpYXaU
	HtIm1imoLe1GepCYvseEECTlFQV8IKZewz/L1xzHZbJFOxi7BaS5OyFvOvsx1mDX83F58jQU+9k
	fqK+8jquv9EK3UlpCv1+hW4JSw1Xtw94Ranutaowll/nMxFbrHqKos6BtQXuehGy1tv0LgmibIO
	N0f8RmDfIrh1J6meICfyuku
X-Received: by 2002:a05:701b:2713:b0:143:26cf:8615 with SMTP id a92af1059eb24-16a6169558fmr24799867c88.25.1792016012151;
        Wed, 14 Oct 2026 15:13:32 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a4429603sm47377549c88.17.2026.10.14.15.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 15:13:31 -0700 (PDT)
Message-ID: <08247c8e-3719-4c8e-9782-962c648d1c84@gmail.com>
Date: Wed, 14 Oct 2026 15:13:29 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7.2 000/284] 7.2.11-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261014123758.782265692@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261014123758.782265692@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/26 05:50, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.2.11 release.
> There are 284 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 16 Oct 2026 12:37:26 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.2.11-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.2.y
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
