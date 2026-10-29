Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793288057;
	b=QrZrVCo/6nWxnH9l98PdzbtAlM6DxxfUbRP5LvzmWaxmHBaCLTB2aLVwEJlv6Ewv3+4X
	 7MHb8/fIhJ4I7+jUg3k/wjBx58IKvh+PhrlmbisqouTnZuZh+dWEyM01MGEgyGBzwxql4
	 DSnzQA/IKqHnpj7RkR4GIcH47GgbxmY34e6ZQv2HY7XbRmgA45GlL91Ry6kKPZFygmAUS
	 1geEBQWT3SjV4ppiF4ky6U1pN/kox6HHvAe7fQ4j3MfhNCQ/NKKx8hYkonPRadIl39zvn
	 YL0ZndABT3Gwoinsg8t1Ec+s61WumGzB/3p6BB08/V1UAHuD2g5FX3KHO/s4AiwH4cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793288057;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=2V4JLnzK67IJcCHq2My/KdT+6D1UK3FIaHGDhvNAL2Q=;
	b=bVDUYvdtYxMwwgemQttlgoXfDmm0meCloGuIUDxq4LFrcIKkWHK/tL/zEvkE99GEcEZi
	 rL56iZDt5AojMf1HYMS3zBd8Bhoiwf/8NNkff0SN2JhhoeBLpIyRu1Jo16HP65FXoATO8
	 be2eFWnnMANXw2tnfx3Qe6OTyOfeNXKtWH1m0kpwHr3s+vj6GzPotTHaU2I824iRM/RxQ
	 zCVeosL8Ak5VzGB1GwbgewcvYJR7S4Jo0ePHuYxi6PcTEY08MFPOYnN8J8XcfynIKAn0+
	 2kPi3j63eiB2QWPpf7PzLx/J8NLWwvAICw3oI7qQcONDQSGvQql4E3rG+ySAws1iTyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=UkBsmMXn;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5689B606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5689B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=UkBsmMXn
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso1728587eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1793288055; x=1793892855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2V4JLnzK67IJcCHq2My/KdT+6D1UK3FIaHGDhvNAL2Q=;
        b=UkBsmMXnccbCiWHhLetXNJ2WE+yUUywZCbA9ZdAwXSl9aWrv9AUrjiiRNHpRQ3/UXT
         62BkjP1O9NPrzJH0wMe71imxsPvN6QHsdXyzXTWi6uAwKCQAwpQM/OXb5z5AKK1xKvf7
         sVfh/vrUNBQY39TW6X9Gm4t3LBGUTx3yZphQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793288055; x=1793892855;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2V4JLnzK67IJcCHq2My/KdT+6D1UK3FIaHGDhvNAL2Q=;
        b=xaYuqL6GgeMXc0qnz2uZsTIxcW2pMrBL11vgR1ktOAEB2rFAWsNQjpAwKg2R4KumHq
         CORWJVM1lqgPWuH3hh4qFnRzj8ZENM5lRuJbmKypy1AnXdK9ZORVa/r+5/4w0whiq/es
         WiQeQA88oZu9ukKQd/rjvVMnMAOQi9mO13JLBFctXtXxTGE2jW0UU/zpV8+acOpfr71o
         hVNkpN3NEX5Ls4OwxKwXCDnX0w0G6cscARFhWEWGG6SQDq0rNwotddZ9zTN3JJFVJb1m
         c3gZvUl8qnicIRF+O46Zqr3CeKwH6HGrKkm7W24GQP3Qf10EDhJ2wBSJYzw6VM9w3PmR
         FeIA==
X-Forwarded-Encrypted: i=1; AKwUvBzmbUprnb53tApU9CJ+6xWFb4lZO5qmzv/YJTYFq2IQYrDqG3qcZJ6I5+GJYGLQkpICqZQXbxDMekLmNWI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIecEtepSCe9g+1lAEMHmVjeb6vtopcZ22qU/Fei4FT1OFHaNB2
	CF5k5yyqcbcBOoE38By+msCKIPXDa6zMplnTiDVINdykC3AljSptURgqwhgx0YB1gQg=
X-Gm-Gg: AYBFou2tBH6QxzxGB+s/6PjvtDTlvkWwt0qUV3trLGx00GV0a9puaAbA817ko1Vjs95
	y+DVmM1Brpg8kezpVD0CaE39qstbiFFPZSmwasvdGIzv6h49pZAkUtN8qtKpBzVf2QmrhZ5G1Uu
	QOF2PD3WvZS6d2Y0Wt/ZUDVkrtwOFe3K/KcijutDGfILN5V3o3bEit6Wf1qiw+EN2lkEuuJqnii
	EofxGGbpH7l+pnkiP+tknG1Uw99dsh3QdlzpFkFWx9ICzjeqPrNb3RT1A42oI14BTvzRdc+J+rf
	k+SrWEt4wcTBKLZ5C90Qb0i3u556SdAxGAM1izlcdIQt4A0dsPEVTze8fnkLzeIJUSZlUzlgJoo
	JqRid/zSlk8uxVQI4AfZPlJxGTpIrCr6yhSW+/6QD5OHbZUpaxbqiIGKMgBsb+PmCgAbbforNMW
	CO/kr/9z2qsnvAzFUaB4qdxYpvH/yasmd0IoasrM7b8KT7eug/PL750swaHajp+KSUJdSyOd0VD
	3vQ3oEzeUpFwh/9dWftr0gRYFmVTP9WjCUxif0+MAp0LsULitlZbCAcW4DX+01pab31vlzQ3Y5f
	5ot4Wwr5h2FCqockZv+AWhT/9isoa5I7IXGiaQ==
X-Received: by 2002:a05:6820:7093:10b0:6d8:462d:2759 with SMTP id 006d021491bc7-713ef924163mr2829588eaf.90.1793288055258;
        Thu, 29 Oct 2026 08:34:15 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d3400540asm79447a34.19.2026.10.29.08.34.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 08:34:14 -0700 (PDT)
Message-ID: <03dcc5c7-5d14-412f-bf6c-723af54a3b77@linuxfoundation.org>
Date: Thu, 29 Oct 2026 09:34:09 -0600
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

