Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085D9481AB0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788281107; cv=none; b=fX03NxcsRshKE+nkAhXC/0Eu8C42Dg0nuLwbqZE8xoubEf6tSsRKGNi5LUYRZDTaIMVgA61BV9oKGjOMHsN6SgVf/o9NMJpm5g5pZ6LzFQ+3IJcoWc5vA+e2JotmvV9t/U/MW20acCahCJPJmpjIYqtCLr6itDdF+VPpKKF7tmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788281107; c=relaxed/simple;
	bh=+cWilfnQ/mR+0hb4VBv4GItJT+g95OWow+vJ1CeRz9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lUqIcXHDay2+jUa+1V5gDGrVym/KL8LBgliknnDmTzrXqwDZzdc4LkbzfRZssVRWIITLkR2KSIjdSTlhdFltvWWT0R7MkNn2FLYlg3UosPJsgFCVp2YyJuSrYP1lns6RjTmT4XrNzHmDbYDHhu4q5DnLkeVYcZJCva2SYNkGxTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KnNOV/4s; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KnNOV/4s"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-46aef784ddcso32409fac.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788281105; x=1788885905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1KdrPp5VH0W2M2cwjXR0uBfZIVa68tdnukc7QI0Ndt0=;
        b=KnNOV/4sM3Z0U/Q2fYYTLXQQyF/HI5iBZoZuoa5t5uYdCw77rpt6foOff+hKWyHB1S
         coogfdC4rUY+coEvdyFtNPMlVRYKYYSftbVuQ+QzMZ7/FxtygZjJwgv8kV/UocBA8YaI
         PcXn9UE+W7EwiyXxEc+5bobRkKM3OiZaN/X9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788281105; x=1788885905;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1KdrPp5VH0W2M2cwjXR0uBfZIVa68tdnukc7QI0Ndt0=;
        b=P5kOHF8/uyIrDh1KN5NQR4wQGj9AlRM7ONfwroJAs+xgFc6JOmOEC7H+C9mqi8b+Zq
         deUMrTPfNVz8bxPvhRBLzz5/xItGjHGSjxX62csp4FO/knUWTAdzyY4RZCve1kSlDZwW
         kdCW5MQnnLjpEKwOu1Fcau806XylNIjmtf4kxD7yMrYHtjmRFQe/67HxvKDjszSwZosp
         b0K8pKyyntP3PPfYRzu17xoIBmBYlY3iDDgXQF/kdKW90QunMR1LklpLJ+RZjUcfcLWb
         Kbzb46/gAJCkApPm/k6GlNYEViukE94lwf/Rz1QDJQnlWmJCOo2ikOGDqvU7FiWevUQc
         aFtQ==
X-Forwarded-Encrypted: i=1; AHgh+RoZjBj5wnFwGrw02IDqZOxa3aAAs+StUigSqYs3PlBiyTVU3C/6Akhom5vpnGR0++o8g/zxayKspL3TKCk=@vger.kernel.org
X-Gm-Message-State: AFuF++k30VjDyLrbJT/U/yhiLKQC1o1O0ZB4jCiI0bLT59+DBHWniEfH
	11K9OwFgtLYQLQAbAnl9yv2GK89BGgQa88cg8BYmSuR+kMWOq3nGBntQJoPo0tELvMI=
X-Gm-Gg: AR+sD11n0g1MoGaN7ugr6UKfguZcsbHvf+1fRCHzqHwt+XoKOg2dHthqfh9nRiR/wPR
	0kgy1FvNq30WzrR/M5D4vMrAtkm6c3n5O54pYtqytOCDrqCfE104D+y4h3/k5QuxgsZ3QNqLoEd
	0KVGiW4EvnY78aVfuNL0g+DqLjLCyj+GREdUknEoIEGekcbFImfWFa4EaJGubTxQmF8hHDCXFyZ
	3zPx4VVvDZEU01G/m2HCmEp6in1DMVwxVJsrnzy5qQtZ4054EZxMswbO+ilDn9wCPLRJrTWmrJl
	HJd3BR/uSTalSyJ6/p7gjV5Wl+siyWovSfPyGskb+hsK461oEK4ouSlUaZo5++xKjZiZ1bz6RP0
	Ft6qVKcDkNZdsGCMBt/KO9RmlwmX5obE8wZRiC1DOOz1hXCYTazbZgdNhktO/2Z3XWMmoM2UOXE
	CvI+/EIqBVTSLiWYZ9KFJBcB/7ggJgKg95BMBf+JezgJNbBAyWMc4gnLNXIm/Hd+37tPgD
X-Received: by 2002:a05:6870:1652:b0:46a:ed7a:e632 with SMTP id 586e51a60fabf-46aed7aeb61mr10900715fac.14.1788281104747;
        Tue, 01 Sep 2026 09:45:04 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46f30cb5a17sm189702fac.8.2026.09.01.09.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 09:45:04 -0700 (PDT)
Message-ID: <304db74d-2a7a-4fb2-afd5-e21489619c83@linuxfoundation.org>
Date: Tue, 1 Sep 2026 10:44:56 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.18 00/83] 6.18.49-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260831133359.207714926@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260831133359.207714926@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/31/26 07:33, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.49 release.
> There are 83 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 02 Sep 2026 13:32:19 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.18.49-rc1.gz
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
