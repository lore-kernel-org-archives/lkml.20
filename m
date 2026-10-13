Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FA349BD89
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791916457; cv=none; b=oobVxhlhdz8elHbmyjznjthfQ1qAcYBa1TIt8d0CyiP6I5g/7t7jNjsVlxspO/vdW8CHYkFJo8CilHuXgJ9kCC7D+HiU1ZzbpUYAOgMmdhPw7oYNeJXeO+EPHu5LmikKeIPRkvqUHpAWY62b/snNqWKRel84F0NlJnWu+cjcZCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791916457; c=relaxed/simple;
	bh=gebbGvmgTzGyJx5X3pGdjNejK98oYXopgYCQYWylHfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cpoph4nZ94kQkAM9AmWwbpCbe+ciSN+5S5HC63gG9V6r1u3IawLw4EggwCzbwDPqw10Z6FeMCdWzWJnEi6elrrQsO+GBaiJMfUOUgP0NbId52s4+YebyZR3V+sL0gFa/Ehr5AbdW0/vCibL0Z2EKxob0/+WxWrXmW5Wbl89M9Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Da42ybrT; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Da42ybrT"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91b55859245so52516876d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791916455; x=1792521255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SBk9Jd0lNDJeCaVR9wht3+TY3PnWo+nDczzO7C6GQJQ=;
        b=Da42ybrT0bVHGNPgqt3mh8KHJWOu0TQAAVHza/7urfTU2E7PCYCSoELXT51EOe7ZBi
         61wNKpRc38NNnfSC/mMA3utv8cjdv3eTNW5E0z57UWPTpKm9QNXIT9WNDU6bEGa2KJlQ
         5Q1YnmSJxmiYw7/np0L7K/p5CBUskOeC97xojAUD+JcdFuDK34F++FEyaqaE7GZ58iiY
         5DDcZjkk34N+ZOQIS7JWjfpm51Af3z+ZKtd44Na6sF9K7J/9L3DLJfW4phXLAd6odt3c
         OTww1TgmNzK+L3QDvFe/TxJBaAZZGQxYOQrPiBD/IML73/5SsDRIuYezH4K2sYcXapqK
         Ceug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791916455; x=1792521255;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SBk9Jd0lNDJeCaVR9wht3+TY3PnWo+nDczzO7C6GQJQ=;
        b=1yjbC3dfsi9HX+f69cV2mVn5ADDy/EtnUCMA5Pp78zXgKU8p3Nb6sToozatlL3WvvC
         +4RKcOqzIAJBTiVc42/C91BnbiauUaZ1q7IOUt7a0bsbPjpwK67XHPqzON1eSIx6CPCe
         /wNnt6q7fmhc8PUFXCiKGbx4VrKAa60tsPKTz85deDcr/GUT1GbFEyP4MHFc6PcN1na/
         8FztulroNz6vVjf37irKEb3nIav2x9LFdinXLNg9unRyGqiTwVyUNc/sqzAkEwyW8zpl
         LlQ0sXQnOMq9yt0RGUTe+PQJaQTTX8fDc3t+GLyrxU5TyJqreUGgbrjOwqJ6Uv/Z7FU2
         VMtw==
X-Forwarded-Encrypted: i=1; AKwUvBz+tWLqXhlTl8g6nOJv0XxqZ877ABtGVAWqST7rJHRtfBFV3xT8sPg7XCJyxEWockel4USyOz0ztHUYSbY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIptHybQHiibopBa++CaeX9g/tuUdDyd9xAQO5Yzkg5MhMufcxx
	sHee+6XIpCbNb3miixQ8QLCgnmZEclk2wE/8StNDv6D8ytSR05wuEtiz
X-Gm-Gg: AYBFou3oclTtSUvpbZLt54YybZ4Jp0qAQLjKwzDB5F+ZPyG2FEnCtHbg7yANNw6hAiN
	fJ8gnmbfCXaNwtoodPjuBxe/WA36JKlm6/sKXmKbXnGPwBfdx3bHkoQW7XWmJn6quufERlKHsNK
	FLpmR3FciXDZuif+dE6eFHOYVLEcwHhFq8M6PXallRBvtSP7YftEoQQM93lY7paaiUDOW0XrKou
	t+XePhA92U9avK0ckfal/ghozzI4IZ50JktAp5nQyFFmICnWz/0TplsKU/u2MceNWPXN27JcrAV
	v4f92LgQI2JEjDzHOXdJoly48Dx77CDO1bi1eoELyB9lz+aEvi1cPTdmbFMPihIc3uOPWAIhmUZ
	Vlzbwkx+y+LKVQHbUNZ+wSRaAwYCvQjaMZhS+Y/XKlr7Qo2XOykh3pOtLvB3XYghdEBjEULiWhn
	vYGPXfqBiFa884JvZ4UnV0k+przwAPANKPQfUOXqeeh+YkHN2dwHNfaBetS8WcEDJ8hnyHrR4Kc
	Bcck/5EoTMs6zB7IdDDVNvd
X-Received: by 2002:a05:6214:2b8b:b0:919:5ec0:bce4 with SMTP id 6a1803df08f44-91b55576506mr229759486d6.37.1791916454936;
        Tue, 13 Oct 2026 11:34:14 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b92b86sm32027046d6.30.2026.10.13.11.34.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 11:34:13 -0700 (PDT)
Message-ID: <c2380f00-6070-418b-8fea-5c48bd4dff0c@gmail.com>
Date: Tue, 13 Oct 2026 11:34:10 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.12 000/497] 6.12.113-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261013112907.864180619@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261013112907.864180619@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 04:32, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.113 release.
> There are 497 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 15 Oct 2026 11:28:22 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.113-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.12.y
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
