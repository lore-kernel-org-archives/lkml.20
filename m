Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287584;
	b=IsTgBa03128kyZvpN9uq3u2iuKSwT7Onh78k25+XvzqrxvxxqFMLDnaMmmzDABP26RDq
	 BOTzGLjue0+FN/ebzHD3hVqol1UZshZ69uHHS6hlwj4JVFgk7Sh4GSokm9wEBr6qwf4ds
	 pW3A1bE136qLFb5kPwwFz1WmUsBIYr++J45soXWTiA70H5FM/Femx6Hpl3MIc3103k6Bo
	 ZQ80FutoQe4z7Y+opIy8hoi2xNIcp+4gbAG720RIGWBNUxujb+3KEkkXgoidKp1X/GKvi
	 QObpW+oJIEcq37/SZUhxgpjgbVX7MCcOTvLQ1hgqybByv6YrOtEZCtFDPhJtT1BABuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ABoTDXyOtvkcn7EUfVmTDlnC7sq68l91R9Ze2UwYLLQ=;
	b=bv7r+MDqC6GsurUkCltprGISrTL3TMyTQbB2B5ZQHCtBHWZ3Vcua5DYwaupMj4TYq2yH
	 7KMJFiLFsOC6G1nfBzV21ih8wPXbVBUQjPt+07cPU1A6StxKs8IaOUsv9BpdLPDBQORzF
	 D42Ma2kxYOsRE3jHdYjzcNAPL9L4mzrzjssDc2yxEhD/dksuelAhpYoCG6M3iB4Dh+DVR
	 ssdtAGwm/8uh5Q/O1CwT+LYWZjp1b8h4x95KzAHYSpqAXREi1h7e+19IMxhKSR9dGEHa5
	 8LDqNJqBr1O6Ndxw04Bll8XxM9TfrS01r5l9AaC9WGeSw1w3RL4pM6iLkOujz06gb6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b="YXVJ/RGI";
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B071A606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B071A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=YXVJ/RGI
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-843a4ca671eso1111682a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1793287581; x=1793892381; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ABoTDXyOtvkcn7EUfVmTDlnC7sq68l91R9Ze2UwYLLQ=;
        b=YXVJ/RGIq7/qk0n7fsJn4kWm5KE0pNRcpfbCAQ6lTB8cHKmx6WeLPP4RvldpW5hBEZ
         xj1zozDJRuW8t0keGI1RgvA0Do8zlKNgUFMOdNIJRwCTJZ8gHtQVOPXlzKHormMpJkgN
         m15uciVLgJ7JiySdGCLTgZhOEJjhbOV47wOAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793287581; x=1793892381;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ABoTDXyOtvkcn7EUfVmTDlnC7sq68l91R9Ze2UwYLLQ=;
        b=tmisRHKptdhbgtrhJCBj4s/Zs/qgGxW4DG+j/ADLDF+P0avqkAKyZuzxYgwOSImOww
         aC3oD1os5k0BI1TWCSanfPduy82APwGUHix8kOfVkimvtgd5KwwKHCdpJs1aLIcX4du0
         wck24u0zQwMs5rmDBl5p+RZQTcF68SegrMsZCqzeVLBY3uiXfuJdbefudjjAeAPYd7P4
         R2fAxhcgIaFF//cayM5iC5WZTrk+RGDX1BPvosZW4P8i1Um1Gh7frTmyuAi1skJbyG3a
         PfC3nW41NuaMvPAGK5UhmFfBGIEKrk207K1hP05M0M0wWOYWMXQnhg42eJOVZwOfKQDe
         Pu9g==
X-Forwarded-Encrypted: i=1; AKwUvBwtTREGajNIrXaMlmG6Aet7B/X+Qb9EkrrbRW/6VvilIA3c8wXAp16ZKphQorT1Hp6T4RFU+ADLmUTmKEU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7TuIGvChSBlrgWCPlFeXGYLmw0f/Fjf41DhdMD1yhIAUyTsIS
	+3t9b8SLuiATHRqchORE56kjL1+gues5gMTt0tynzD/K+BDTFLp7yp9dWL7wuOxJ2/o=
X-Gm-Gg: AYBFou1Jm+xSinK6WuQUrwAETCVz3NT96/pl5rM+xrrYwesQz5XzHJg18aw9E4aObXP
	YiZ7GGyErng9odvDzlJ2Nw1rJZOpd3BJOJ8SIDD20HDScHHFaTXRbLaWXGSPSJGN73P1POtT8vP
	C7dXeGcZsmqwT+96tr306bVLPuONvu8SeP0YILdR8dcPyjgFIiyFxIxZsd46caRqpNLykuxw6Em
	Fvk9mGXrMMeS4poWb6tCTm9kaAMGFiZdHtkvybCcoP6czCbjEuXl0Hh9XZMbnnGhU1uBoeW/Xph
	5q2amp1peMcJ1xu8JupYxTlOmX+UThl7Kkjm89dOWUlpYTmBfqEiKA+8pxPWwPoyeTmVh2dvG1y
	XAy1iR9d0U9H8Ega3oUMpFDSmzjlik+zAH4yjYBlQbTNMoHag74nktkYYx8OzOcHMSUolXZdDpo
	AtiofvVAAIaRdN7Lo7SYCkIiUmUgF2pHWSJ/lKwXoQGa0HWpjpAJtYpUyz5vSesvWwnefl58GjJ
	i0p8vYblWMrsLX6Yjevt8AXtOaAdIWBUJtoRv/So//ypNodhX9hVLpiiWFBwtmHujxCQmsOw6Wu
	JqG/aVrETxPOvP7N1yF1ILv9fy3+KJAMguEWeoCGaj7eiTVthB7OCZs/WXA=
X-Received: by 2002:a05:6808:178d:b0:4e9:eb70:b98 with SMTP id 5614622812f47-56382680c8amr4552456b6e.32.1793287581613;
        Thu, 29 Oct 2026 08:26:21 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c5a4d8b7sm3701051b6e.8.2026.10.29.08.26.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 08:26:20 -0700 (PDT)
Message-ID: <554ef84c-a307-4385-b244-007adeeb8fc1@linuxfoundation.org>
Date: Thu, 29 Oct 2026 09:26:17 -0600
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
Subject: Re: [PATCH 6.12 000/247] 6.12.115-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261028165947.349197979@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261028165947.349197979@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/26 10:56, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.115 release.
> There are 247 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 30 Oct 2026 16:59:22 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.115-rc1.gz
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
