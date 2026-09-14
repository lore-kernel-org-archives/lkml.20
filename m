Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81613932FA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789410685; cv=none; b=fgjRk3tqtiMqpCTeQu14Hpj4flNPAvIUcrja7MRuZMJOBt0fN9YTvgxR4fi6rbaQTmPLcy7y1PVRPSSo90zKJrswqBZo1HrLON1tNx6P2IYJoMwhewIX3o03GNuP0P5K0kvL4BoJfjDCRPcQ8PYyiEJ1Dyh7JJQe9MrpRDdjCmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789410685; c=relaxed/simple;
	bh=ZRTmTgpXAIHI5PwDlZl3mxTARuuSCtuzR8f+OYUlUCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MdERR509Gh7vM7SKyBoqQQoxxoZbUoIvDzcjSov8hQ1X5UpGmFqHN4s0re0byzjanKDOwGWNbZt1Xdg4bphCfBM/Wh/n8vDfDP6M+WHFmEJ2rDQCWfNdk1xyGbKFQAUnHH/HwO4v9yEFVaboXM3h+aC+ZpBiYJJDHwuvlzRm+lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BSKHjr9C; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BSKHjr9C"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-90e9e042ee1so42097216d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789410681; x=1790015481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qkJteh6h5Gfo3xV7o+rs+ZpT2JdE1CQXCwGXk9wGX2g=;
        b=BSKHjr9CWlAv8yrPfkgRxiN4X2zIdo9fcHKOHUcVgEmFE6UPk68LSB7+HVacCwf14N
         4Om89g6vDrjqBWktgRu04QVCL1On6Lffhuux6/i9FfAJlJo95P4sc3D9xe+YFyKnPlWM
         rqwxhvTnAK9U+vQzA+t0IFUpOKbZKdWzjad6z6CMJvQ9pb0iunDRD9JXViDsjiGF8VUy
         U8AjCCiz8k3OobMlj1c828qmAvkmJnLh7OJwQ+8tH/skVVRJk9DD2IL9fTz3R9/FXNyD
         ynI1KQl3RfN+8tYYPY9lqLs5EAYZZLesiNo0CI+og2xszNVZHkK+0vMAqmL3ThnaDzul
         RCPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789410681; x=1790015481;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qkJteh6h5Gfo3xV7o+rs+ZpT2JdE1CQXCwGXk9wGX2g=;
        b=LcPHW7dOxjq/nY2BCWGTblB6BVR9RA/5haA5vU+zy+E0Qguz6+5Pc0BjnsRmMTpkYp
         KyggpDkeCB4rqGKRhtwzjkj5memibW6q2YF+JMXWWnNeZswbtvhqGVYlu18jJCrBBCEy
         cfqANxY0MXT0BShPZqLd1lu8XSLbAmpl7S2hWncfv/ZEjuu48a31JerXWtdjgETcmMAN
         g7zR5jObJiVD+yIf11V0qEcFRpFcmhPbsY3D+5y1CQCLN6hKII6OmkW6lSOjMRBXthfG
         dwLmbr5kmC51C8vVkrSNst8xd01L2l2P3T3vECXDYPz1ufjNW4rZHFN+jjDQSm43VHc+
         IhbQ==
X-Forwarded-Encrypted: i=1; AKwUvByzy4e7jil2JXG9F49bda16HgtuyZnn2ts9Ex9sEtFGvIk8y37yG3wvRTkEbeKe2yJn+E6BoC0kk+CeEC0=@vger.kernel.org
X-Gm-Message-State: AFuF++m6kIm0WZu1O3HL465yg9k7bwoUuwC6+jZkx0Ie0yZV6Zy1VgEY
	4eMwumX38l73xonnhV3ue9BPbUZYbMt6KZtx0BVddOqRmirs5raV5OFI
X-Gm-Gg: AYBFou2wC7WcukNFsi2uhJTEAs7tUj26O20iE9YCLCnfvVJ+dGosW/ewkD6fp1O3yKj
	a3SuZhzBt9plfzCyHi0sdpuloyr6jTRXYVdhURMfHuP7VrSOXA7x+cUH0aCYbIA2aVSH1QtTH8L
	jhuykNlelG2y7XhBxriDF8GA4VBiW7DCTijE6AXqv4LKqzanCqT1m9a0RyqG5UBaXQC5Hd+WUNF
	xDtMrZ+luuBhMJ6ldGB+dzRGgDbAN/upzbWtCfsh/oWC+WOTkSvslAMIyDVJWVriu3USW2yWafn
	fnYpOfGRjGTs/shQjqWwYPeg3WD2yFKNEu3B4ABv9i0Uuhbxnwyp1wqS6NjUBs7Zrfk6PPNPhNh
	187sT7stP+6k/enA4g95cAudY/7OBEe+HrTWHNK0YqPPLkadsEXe9OUyibc2UQ/ZwziNgOwOlIN
	mpyccALYV7wtHLwy/p7eVangqJO6VWXEaM0JWPOIy1ppx0awnVOXkvNcI3ykE+/ADweuVKjBJj5
	evBzzbg3xm1Ly4OvMubC53q9A==
X-Received: by 2002:a05:620a:268d:b0:939:993e:bffb with SMTP id af79cd13be357-93a29804240mr566801385a.22.1789410681357;
        Mon, 14 Sep 2026 11:31:21 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939ed67a93dsm960651085a.43.2026.09.14.11.31.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 11:31:20 -0700 (PDT)
Message-ID: <f687d3d9-b4da-4549-a40f-fd9254e7fda0@gmail.com>
Date: Mon, 14 Sep 2026 11:31:17 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7.2 0000/1815] 7.2.6-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20260912065648.999753832@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20260912065648.999753832@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/11/26 23:29, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.2.6 release.
> There are 1815 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Mon, 14 Sep 2026 06:54:17 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.2.6-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.2.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

perf fails to build with arm/arm64/mips:

ui/browsers/hists.c: In function 'evsel__hists_browse':
ui/browsers/hists.c:3191:41: error: 'hotkey_act' undeclared (first use 
in this function)
  3191 |                                 memset(&hotkey_act, 0, 
sizeof(hotkey_act));
       |                                         ^~~~~~~~~~
ui/browsers/hists.c:3191:41: note: each undeclared identifier is 
reported only once for each function it appears in
   CC 
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/trace/beauty/clone.o
make[7]: *** 
[/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/build/Makefile.build:95: 
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/ui/browsers/hists.o] 
Error 1
make[7]: *** Waiting for unfinished jobs....

this is caused by b8ad2bfb11e0868b595b4cd9dfcb9e80f174b2d5 ("perf ui 
hists: In report UI ensure thread is set with reference counting")
-- 
Florian
