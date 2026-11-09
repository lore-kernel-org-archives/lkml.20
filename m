Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254678;
	b=D27r+oqilHIbIA46v8CrfoHTuLeDVmPiz6v/jtQDLFbzaWFJ/cT0fHx771C0crTXXuZj
	 4PWqYWviqODVe3YclMiEvM1d8qNTHIleG5hTccdyMd7gB+s5EkDx9G+xCKAVMsoV4kFvR
	 XLU1cce9lgmp8LpDIGF3eHHUZxEGNwkU25sB2Zh1xljSQ9+HGpdtiv2Wto6Wlrln/05gH
	 rshCBLaadRS5e/lzdV7FwkAcKvbHbgnDSEkiWpGdk9ek7jd6JNaeBa5Ihi+ITShUvpn6m
	 YGVAcm3pHgpQxNC03NRX1k+iXSOUL0EvZUNS89KpfeMqRUz+pepeX2B2DvRPrF0xtjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=xd+uOmFlCTqBx35VwbGKRTAdMuAG82Z60bA1tWcaoFU=;
	b=bzKqYQSBrs2WI59NJgkM9qqNxukHkEcH5KTTmVnXxhvvSstXLGvqcabF9XMYNFZTBG+z
	 KUSW0hXNK7kS8eM8cDtmGAE/ufGyOSY2chSdLARO29DI71hkjDsJEXoWzQ3/nnoqeuyYJ
	 qblnzZA8rfuhkDOAXRE/5Rdb7vNwx2KbyxXt8+GCjVRjn9o7HgV910ycoLVpLR8szHntE
	 qadx4wizynELHeEFCsUIXWIMnfLLFI0LcnK8XKWUVF/L1Kf/v8CVci5KrepnV3mn0ez2p
	 iXJLZltBYm9uyDVutRoxDzMNHvciTslZ1zrG/Cz5ab97EfZ4VPq7UtEisSrL1YA1yEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=blTvc6Bl;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06D360A2600
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A06D360A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=blTvc6Bl
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4932b13c4ccso710755fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794254675; x=1794859475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xd+uOmFlCTqBx35VwbGKRTAdMuAG82Z60bA1tWcaoFU=;
        b=blTvc6BlYcGGI6KJg5dM+qWKET4pDY1ud2Oj/a1unbJMmw46E+WLG8z9eFbr8sYS8h
         pOW6VbchIsKbbpCd26NAkGgZYp+1wJZ9Yi3P5BJRN4Bo9ib4V3OnYYoZx2t9/L30c1pi
         89ek8Eld6YRVJr+WCzwVvwHPDu5RtRs7eVsYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254675; x=1794859475;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xd+uOmFlCTqBx35VwbGKRTAdMuAG82Z60bA1tWcaoFU=;
        b=CSJ7q7ZxlxibVhbGVEKKa4lBH6PEQ9P4+RsRXR1Y+8D04dNoIs/D0Y829D7HldateJ
         Yhscgsg6a3szu0zd0vvJXsgGFRI5/Y+R1MZ62QX4J0scq70GMrvdBjSj14CEJLOZNqjK
         HmwPxfRjziWG10eC9ofCP2Ihk3ZuvMkTTfxYplcBSUMZEMh8/if0jgCptviquUG10cqc
         P3ygbHHl8YqWemRCMzeNHDUBjKMQSIWWA97OYodOMGibFWKNadENOZhwH5hlJ0s0lTtA
         l9fn7sjctmNhajIytlRUapFiVmAEcuoFyHcplFXKGjRL3Gx+xrDt+vdMjJBX/Wt+l1fr
         0sKw==
X-Forwarded-Encrypted: i=1; AL+hErFrii7bcNpd/WoKUhTVpimJc05LocupEtyWBbNb7sy7B6u0Sm96LeMdJDXynbubfleFVLlpbNokHkp0ngE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ItabZbnsvf9tWapxyjJiJXizyVtkehoqXVMpRzmhG3T/W+k/d
	ap788j5zi+kiaTn/mFkIT/q+mh/+Hb/YnTOggzh+be32O11ZEgD0v9TT23YZXjNplsE=
X-Gm-Gg: AYBFou0jcVp73TjD7Cl6X1NHGo1u9spjqQpr6BUZg5TvX2sH3tjr09JUqsLUICK9yvs
	Fa3kIcSjPgkF2N3gBuALolAi/kRThK2pD/gEo2Uvd7OnzKxOeuoTuPKQy/Jew22QhYnm8G8yaYX
	4QUPoZuILJRJx1aI5+hV+/IjNJi/j+w0VSP4kEEUQeljzNhK8bVeGicMKjwM5P22sp097BKEbgU
	cPbbboi94FGCBcdkvyX7u9gGgTonyuMxys8Js9VqybmJHlCnkK0bEwUbJh+4WK8Lw8f9eluG9/h
	0XLIcfgWVlQX0qEK7mYeCc4iqy//CBi6MYbVEsGV0Cd9GB21g4qlHdHJcOOZc0soeOqefTDZ3Sd
	OTmMZtTaepMGaJd7yGZjeCK/WB6GndjCYlUWapvmDH9qO/a432u3wLOosqiHePQyidpMdNowflK
	FB6iAe4pdUg0mFa2q9n1KeVCzglYcnk2mAv9sXlUMh57T1szQ4rikxJDVbrm3vynpzZXL3qngRD
	Q/qo74B6xZnaaz+B+pp9UbwwjQU9aEbNIfX2TkmBqAU3/j7DGkDYVLuOF0IuriNDcmm1gfNBl7t
	zWnJQifTA+SmLLB9oxyvV3p5sS022MgZ4EMN
X-Received: by 2002:a05:6870:b4a5:b0:494:a2cf:8dce with SMTP id 586e51a60fabf-4ae222eb9f3mr174206fac.4.1794254675391;
        Mon, 09 Nov 2026 12:04:35 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae22d1d541sm114412fac.2.2026.11.09.12.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 12:04:34 -0800 (PST)
Message-ID: <5dc4a979-d814-44de-bb4c-8cb8141a6f0b@linuxfoundation.org>
Date: Mon, 9 Nov 2026 13:04:31 -0700
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
Subject: Re: [PATCH 6.18 000/869] 6.18.63-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261107134852.069646174@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261107134852.069646174@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/7/26 06:44, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.63 release.
> There are 869 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Mon, 09 Nov 2026 13:46:08 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.18.63-rc1.gz
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
