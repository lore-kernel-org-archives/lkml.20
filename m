Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793288278;
	b=wF7Ggk67gVYu/SxTk4TjqMMAnQR+uQqq/+INQuvbJEJhFc+pB/EPa0eMci30TnejLiHl
	 W3UP5vHyP215HRERehO90bRdCNvMkYrP9jgSwHWC17kKF5r4SkFBRNHzYgpDItpvr+f2F
	 faf+OhqX1GEZAVMwykS7Mny6AgaBCtcMYMna8+qBerYT7NX8dstry+GMWNdyqdx9eB95a
	 boDWzKbnvm2dd9QDM2DhZvCj1iE1Bon4TXwlaePq3EQ1sVQtpSGjc2lsu3QK94IxwOV/U
	 OR53xsJoggsG6h/VOfHXeTcxXq8Q1XBhBaT9CMppG1evn6gJ4aYLTwgCkp31oJEU/yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793288278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=2V4JLnzK67IJcCHq2My/KdT+6D1UK3FIaHGDhvNAL2Q=;
	b=KNpe8nCGfBYmP4yTy6frF4As+rdGWYqPRRbHx8cyeVYF1KBM0sMT6b6x9k/p0MoPclYS
	 NUutQ1DjLbePvUWK6pBNIb7bPIlWYVLiCjepGgaIbplW+57jsL+FqqR4uLNH3HGnCqM8+
	 2CWkJpblxzxlNRMmm55AIznkhG5nzP3O/w+MbQvSeGTgSiZtfMWjHRyoNp1PJVuZL5DTb
	 KF7yF/WSCVZZwfPaDwUmj4KBjnDnQ/A3d8NJNw6RVB4lRUlF8h+eHXmFxnsr8m/r7lPmM
	 fkyjIJWXzB5/E5y1KVXCIbOkVwakz7u/Q/4TW3mv1mII57+ajz39zDE6cde3sJD3ZqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=a5b5fqfb;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60660606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60660606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=a5b5fqfb
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4697404c2bso312168566b.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1793288275; x=1793893075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2V4JLnzK67IJcCHq2My/KdT+6D1UK3FIaHGDhvNAL2Q=;
        b=a5b5fqfbsM6YQCnbgxPKayZv9HBXtdBbkQ5uP7WiwYd/FTVKTaChh/k/qTm103PiUU
         adAkhwfWNJgdrCwUs8m1xhYF0kP9zMP5DbmTiieQq2746Vh24R8U2JOyAuq5v3JHDVtR
         0Hse91EQGwWg9aTMy39xg1F3OXlIZD0jQba1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793288275; x=1793893075;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2V4JLnzK67IJcCHq2My/KdT+6D1UK3FIaHGDhvNAL2Q=;
        b=JgUl8V9oknIiyWE/7nbFMQoDBkMZdg1fYFVd/CypOZMb0n9etAlaJInFx4bjfrICyp
         Ifx+BJoflhVt0Z6Wb03PGSBKqoFW5Gqc3pzLJLmiYJ1dhiMjRsSaThR/JTTFW1F6m4sI
         PAmWca6GEtJn71VArs+j2Q0sWdL3c/CsGI/qMsnf/cEP58C4oy9iCXbhZ48m08JxWD2D
         3n9chzMNJ3BLwvQogR4Fs8zAsJ9/c3XTe/N0YdTMaXPCByTHP0KYC9BlROEh2h4ggxOV
         760UV4qD7flqjsShyKBoROwN15liVLsj+0JxRYEMGiBBYFBto7gHoUGszdDliMX/r6wq
         9KcA==
X-Forwarded-Encrypted: i=1; AKwUvBzV0VxxqCss4+EEhsr1hHTDoLDsUa9P2CqX/meOfcVuX/smH08Lca/kG6Rnt99j3yKr0uTbDT3oBcLwrSw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIl10QpioReEMuAiR+2iFD5TPBWeeULqV2RhaYP6AvNF71rOkUE
	B6C6ah4tdQ4bIXJ7Lj4F/R2Ud5lZVgQO2Wvf1R2aiZQO0OgciSAHmeXm3XshtYIJpwM=
X-Gm-Gg: AYBFou2ywOR9LRo1Q+qaScJF/bdSXTLq1iYM6rHHbr2AWxqO/AyJCEsTC/JUK++nEQD
	Wf3x/m1MQkxzLHDld6JeDPIYO+hOWsnCJWX1MABghrAfpELEP2FPEP4+A0YWlsfDRmHfYtS2Wu4
	QZY1vdrocB56wrWcGy9B3wR7o6GkBG6f3aq4wzT1wDR8K8DizggEa0t/DI4B89xnI7zb/3Hi4Hs
	RuLDGReYeYQeX5vPn96/AgaOCdTKiFRnn/JDVaxOoGCjLfkFqEYbMIu7bYKoKNkj1gZWBWi863C
	npKO9ZZBuJaXVgVqrpv3Zy+uT9cATUXSUbOFvVT61Yk+/2oY9ElCaPGFZc9+lsJv4EBvmrzqECI
	8CFcaOUMMP3FBto+M0b+JWqlwLsg5qLDl1XftxHUTPZtU3Xylsvqzezb/RXa5Y1MHuS5FNDou05
	Tu/CDb5BguEmIb/Z0T6PQ1/IvEN2CB+2ZkV5pWSauIeA8vecZXELeruaDVJJ+8j3epnFZXHiKkL
	p208K8pUwUxhfCbwD5syIqp3gykiTK+VUMrsPmH30xkl2y3uWIr63Z8Cz3kR+9gHSWddB7O+1Xt
	7LroL6aLZh0d1JXPrJ8f1Ox8p8AzxRvJ64tsFQ==
X-Received: by 2002:a17:907:3f88:b0:c40:80eb:c54e with SMTP id a640c23a62f3a-c49bddac533mr513399766b.4.1793288274113;
        Thu, 29 Oct 2026 08:37:54 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4ca26498edsm3437966b.21.2026.10.29.08.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 08:37:52 -0700 (PDT)
Message-ID: <5ad973b7-4e0f-4122-8abf-5c5d59b51ee6@linuxfoundation.org>
Date: Thu, 29 Oct 2026 09:37:45 -0600
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
Subject: Re: [PATCH 6.1 0000/1887] 6.1.191-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261028170459.200466217@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261028170459.200466217@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/26 10:34, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.1.191 release.
> There are 1887 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 30 Oct 2026 17:02:34 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.1.191-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.1.y
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

