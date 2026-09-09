Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25C84657E5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 22:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788992623; cv=none; b=hEPjBpN0ZUuZUOYkCKhFdcHOmxtuiojwnfQjDP5Uus+qYsIDYdLRH1wXBv6DbO+nFa1zdqKKyHkRosgeJi6th+Zjlj1vVxg27BpzspNAqIf5gZUr4kCMDJrlyDLfMqNfmDNZ0d+5BRit8BAa1dsD3E1xSA0d6Yqh6YclwmGlveU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788992623; c=relaxed/simple;
	bh=jyZXnNk97yXcYJ3VFSCOyUv/maueSIIrc4Yrg9UCJBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qamAJ71MKJI04HAH5uUXQ/3ggTqEqjLDY3i46wjHAO1J+JM/vfBW+l2aixOJOWfYu56ZL8kVVs3Hzkt5MWNMnezEjpDjqmoj0yUdRfm5oGEKk8r/IzFpy070W4lkyRNADdTeQsDV5itECK9e0+TApwn++rmz6W+tnVaUq6dcGj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SbZNK0tG; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SbZNK0tG"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-7fc4034841cso799092a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 15:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788992620; x=1789597420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ij5mdruxx0QOfzgtgcdh5/VG5w9myB0k3AU4Kebg3MY=;
        b=SbZNK0tGOr0mkEihQpUVT551NacfPI2gDSI8ecrr4zsgIfOBwhTUhsMBGdceq7dRVu
         y3SDnmipxj5OTZyf5hNH/WTVxETgAhdOnaDi/ojJCv4vSF6XpRHVFuJIOsUlBYRu094Z
         /XJFjuTksuwGMM/HHsrqvlN1Q4bZljZaNpeqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788992620; x=1789597420;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ij5mdruxx0QOfzgtgcdh5/VG5w9myB0k3AU4Kebg3MY=;
        b=r577hlCe6W5xWn4VACvfho79SChKFl8GBNRo8iR2JQOhn/MMqDSGU9Nz23ei5cbV3E
         nqwJKPPfK145Pr+zYN31Yw25/yKVdB2B+iKFJfsrBKvOJ0njhmpqENAimWXm2k8cFvas
         TROwRWPp+dDBGb4mCWpa2JfGAHoDP9G+PGTMqaYNBiTcGzI0E2upbXzSlF1LbrtDFYaO
         6tBrmOtkYa/ePk8Qlb+BIoQoB3IQ/CbMcOg+L0HrKlmYVnqrtXC48UewTY8seNEJyWAj
         bvHDw60NBOTtwjNsIZkoDDTutmLpybptyFq2pL6zGMXqFu0kP2eQXjsThtqSXkMKzQBa
         uNtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsBZV2HtXEBh6O3BEENowWaYaUYm8ETik6CR4ruMz1s4FDJ18JYavVgcYroNsX4wedZFwT6eBIwP3Xu84=@vger.kernel.org
X-Gm-Message-State: AFuF++mbwASKosdbrrlIOvraOHnISKBxy7DvPa6Mpt2E4itsw+C3S43s
	uqi3TMbZ0TPH2vv31F9Nmw5D1eoHLrM6JMK+m6fXK5D89scpBSqtasLDNHbZ2gUBFTs=
X-Gm-Gg: AYBFou3+SLb0WCNg2vxn4oquiH17A3AroDr4zBoVoW3Th/XwxKrx/bS3KtUqIs5NwYW
	vpnJGCmZoeiy0VYZpRjS3VWbzbaAiPFFk0pIZM5Q2Bf2Qj7F1VA/U12rHqQz5agx9H7+eIkqcu4
	dUkzXQf9sOr9q8nhbWuhZ4mMMn2pMCFgnLQMij5AwYpY7GMqlupYdQ5228T1/WVVrdEqcKODfSB
	zv1tzHouuaS6AzfjwK0YYByrS3H21mhocCtjIQFlui0VR9V6Ykdqnja1pPckwbEA3ajXTrImtsF
	nhjCcGQqZ1SecgxGTgFh1IuAsXJ0vyyNYQv6yEQLIp2DE/xKEjM3KoA3LW5TP2JzRBn4fTc6Wqz
	O8xCE/scwJYlRoruFY0lj5cqUd9FLRpLCCc3BOGVrIk4NkRS5hMzIyujhLXAJ+H3F9AZB8HxSsb
	2s4otR8r8nVymKEX3V7WHGt9a49p+4RefuVM6SGcJz9AZX1W/o/hoM6Hid4BzdXc6aLO4WqhE3+
	J1UDR00
X-Received: by 2002:a05:6830:6404:b0:7eb:3af8:8c09 with SMTP id 46e09a7af769-8020daad7b4mr3472081a34.3.1788992620614;
        Wed, 09 Sep 2026 15:23:40 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7fcef193dc2sm12594318a34.19.2026.09.09.15.23.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 15:23:40 -0700 (PDT)
Message-ID: <8b138fb3-a5c6-45b9-b881-1c4d76bd1921@linuxfoundation.org>
Date: Wed, 9 Sep 2026 16:23:36 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.18 000/583] 6.18.51-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260909134237.773280130@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260909134237.773280130@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/26 07:34, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.51 release.
> There are 583 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 11 Sep 2026 13:40:31 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.18.51-rc1.gz
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
