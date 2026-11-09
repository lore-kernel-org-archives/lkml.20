Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254802;
	b=xcCCLNtA7jxws7mi6rgO9F/hq7P/6afZE3wrorwvH5Fgvew6zySuOqYYIB+U+tV9IJDt
	 EBVpUfn7EsU9DZC/aIfiwalWgVe8wx7XNrq5GtEYTc0ePIpvJ3S3sX+mi6+cS/H6RYJZe
	 MP/UQjOkfc0u5RMKAw7t4v8GllVTGKsHFLGjcw3u5qj9rh98K3+HvF9hZL5FN+XhaDQ/s
	 MKEapR4PHfDALx0EhvckcBYR+mWDPMls4L9ZgN/30milswOEJia8US4upWbqa4XsXoJrv
	 yq/2QQkp6zxK9CWEz6xMqZ6ji7ez/FEnP2olPqkyY0Wf1Pv6K192fud4EnVDtCUl+Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=foef8cSuDtXRvHW/3i9rIYIPK5SqXDCZtNX9m115QFs=;
	b=m1tdMudK2giKkfgM4ly/OXxNRtr+bR7QINUe9v3OO1xpWo/F4UOqNObBNqXTDObM9g+z
	 oDTvgEAFuZSqPeJXWZecSyATRBqiVrU+mlyrp88p0CoKxQKGWyt8opodo2l0L/pfAhBQP
	 zJXDUpYxGoyd/XUiteNncWFXJLTXAQKffeS6GCXt0Jb/HDBVj3x58/Dd48QKZxzmYtAPA
	 vELa+IQxgSqnSxwalf2MvtrZsZttvq61hSmHe7AJyrbZZ9sgLREfyU1p1ZnnQdvOOPaF+
	 RYBxM1rnZom2P+yVWsN/EsnYN1KauZUMFtD4lMs9jShfZ2WoCXedxkouzC6ANG8/fGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=cVvTdYl4;
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B61606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06B61606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=cVvTdYl4
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-451a49abd8aso1285548fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794254800; x=1794859600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=foef8cSuDtXRvHW/3i9rIYIPK5SqXDCZtNX9m115QFs=;
        b=cVvTdYl4kccJQlT5I7ztVkIB/bXt38Xc7QVaFvkYYF2ogaFkq+gPt0cnz9z6UtIqfq
         nxis9FJQ66sZZT7P9sfkKbJA0IojsZPj0sQimSMJ1yQKjc++kzhT1NYyQEXI/PqWvjB3
         qQpxMPtDr36zh0FrkF9HbooW4vDbBLEi7a9bc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254800; x=1794859600;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=foef8cSuDtXRvHW/3i9rIYIPK5SqXDCZtNX9m115QFs=;
        b=LFoDAmdsGIQxxeGVMGgvROwUvZMQoR1/AX52upO89KdgHm5xS/aKKKJFm36iZNgrIu
         /5yjv+nWKUOG4crNL/BMwDT1AkcrSimGvDmpfuEcZZsQrZ1t/pDuap7qoCvlGp+xtGey
         srvs9NsdcvLCKlSkSu3ky95LEIiuaZxp8rD9otSXIM/84c79IMwdhl2ltWAVdswwCMR+
         2ecYo2g50SjHONA4dVndc37zs+QTFO29FSDTVRDyA+W9lcof54ZR57oa3dJ06PSrDDlj
         MgFteT7D8OIqAwBZlUgEG41pj4agEaXr8rOGkHzPlMLh59td83KRZOUop/W1EYptTXQD
         sL/g==
X-Forwarded-Encrypted: i=1; AL+hErFGSARS+XCHoke8ltVxiiPl44wuhCCiUfTV6jGno1rh6PhJwYRIKQKtJJodyu5e4+DS/1U8gpOMUroKZ7w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DMkBmxFVvRMLD/gmxOux8/HiRslQrrNlRhY97KDaNKvm83bYK
	zYF87b9u1YE6Zy+TiwABqu3KXBYS70MSfqisYtQ5NJEoJU2i6LzCgwihVNcy4Kc3NUQ=
X-Gm-Gg: AYBFou08mmJWwLnR4Xq0xxIgcJXggPnyotI2sAXaqou1x1NMVg0a3aMG/sw45j3rNNu
	jl7v8bIumNLfhSzj+cEq5kcCG85lpYMGhEsjNvUibWCzTQsvPRCrilYhqwSl5J419el0jGxJc4K
	0AR7EPsMG2+Zhl6uO+m3Lj0we5Owp5C+1DrWg1n6UkcYU5bEMpcfloSDXCu5w46sP6mh3DprjzV
	1geskLJCP6ELEpTehryFgWRj6df1unAoif3WGYA6y2mlh0NvFoXY2g39uNWJvtgVvfNb/tFV7n0
	Ui2YLqVwx0LgcRK9TeeXkhIumgh9bfEJmuC8NOXNSPB3k0zxPWtU246U95I3N1GLrijP733Yi/g
	NnmW6vfb2SHhnPr9uq8lB2vXtTqRoOOkidEgUW4FRODKRlvVcj5pWeTPc6OO3ZBg5yjN/lhk9vQ
	qc/YUqwwwSlukYY4uU/31KQO8hPUBThSo4b26kOBmr6HyaOGpq58NjC5tJNvObDzqpxWqKWE+rQ
	qEtWQ5fRX+eEZ4Jnx3nEpfFS2gI8gQxqWqpNrtO/1+28bfIez/glRi3b2AXD3sWB1qYxaJZ8mjM
	PulsNOeskPwuiZcD5C0DIpUnWOsZ0s7E91EaTA==
X-Received: by 2002:a05:6871:d212:b0:475:e066:7711 with SMTP id 586e51a60fabf-4ae22612a18mr178123fac.24.1794254799938;
        Mon, 09 Nov 2026 12:06:39 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae2308e3ccsm85800fac.15.2026.11.09.12.06.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 12:06:39 -0800 (PST)
Message-ID: <73aaf4d1-3cfd-4128-9c2e-b8bda16d535a@linuxfoundation.org>
Date: Mon, 9 Nov 2026 13:06:35 -0700
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
Subject: Re: [PATCH 6.12 0000/1536] 6.12.117-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261107134957.653319350@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261107134957.653319350@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/7/26 06:33, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.117 release.
> There are 1536 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Mon, 09 Nov 2026 13:46:08 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.117-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.12.y
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
