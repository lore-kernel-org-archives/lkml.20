Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080F84EB85A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789661981; cv=none; b=SwMBf5+R9agsxIqgPuOkGO5bsw8b1MIJHS+RomfDUevUwg/IW5CiEHEueHkIILbyx4GrsX55m3yvyMA5GtLxHBn80FrYv8+jjjyfW1sFVjWBzb9JSVofpDez+m/TqkjQ3gqtouUjQ6Od+owOqm5jNmLYZ95dBg1y7CsbdooqfUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789661981; c=relaxed/simple;
	bh=sBK9rAYvIWibzdWVpiEd2/Z/LGtFEqTtl0liEEnA1+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qlZSJ4LUEc+DEwpn72nrkVjGrmI+ug6TVyRteHMKzP/1l9/AFqLVWTTvEDIocsERzFJ06Hgnv8n7MFVA3F4JybqzPrB5MGIh92V4MEgZqAXpyfh9FwHTg8uRgFVmG0KBV62yz77fYqS6sQpGAuRBMaQsHy/vmmo2vTwXwTLE8Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwplOKYo; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwplOKYo"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d91ede8035so12330725ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789661978; x=1790266778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n3Q3dw1h6lNTZbcjfSRox23JL1XpMzI4Vd4A66LaGv8=;
        b=HwplOKYoxJhe1KJJOEsXC6M43wJ8UnI0iw1dx8vf75gpBB4QaUiRK4cTBYCdosYS9C
         0Asu+buG4fmTdYjbKsrKDN0S6Fm8uYxw4rOZc7AsiCGnzBhUv/lNjXV1fgkjAiGPWzWT
         EgPEx1hFo5WbXYhMCoff2G1cANi620pr0Uv2aZt+Oq9pw/LkwGddbk5gTriCjwOY3sLX
         LcpYYvxKMo4z4cxQvRK7JE5Nxhga6TP+gkfk0Fqt9Eozca+ibPwdwLuAU9dppKr7eUmf
         NiIfzDOkLgIPzbz8A97FmQTnsI60xbVsFlhMSY/rlamoNHXVW7cJAFeZRWozfCBecFoa
         NqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789661978; x=1790266778;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n3Q3dw1h6lNTZbcjfSRox23JL1XpMzI4Vd4A66LaGv8=;
        b=WphSEevMvlgajjE5EyvCtqz+4C/+SWf4f3nGAZPxcpJ+NMbDEc15Qlch96Wwur1BjK
         bZZAhtblG3ujS9XRjv0XW+g4jA6QB0JiQgKFoubA4Pcfw9me/zDsT3NLtkfl52hmwsIC
         1JkaBxyDlOORc0RJeslvZuYJiS7FPeARkrmvydhzzThaIAEg2/pe+3TGCLIlSeBo5m6R
         5a0gOQTLDQn3pBUYb5wShE4tS5thmsFJiWzq9DFyzt7a/c5PE9Kdl0vulD8TNu1+0ob0
         GElfx4Clx6exdfs9NuwVqqjf/zvakWZKFrKdczwvFATFOMK5K3AwHGJHnY/ZlAHGOxBK
         VLRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCOexxHOmLXC0n+VMkRDyCj5tsS2FVe7UXtZebUmp9RvzIKVVZnd37O7rpe2fAKfho5Z3k6MCUm58mvJY=@vger.kernel.org
X-Gm-Message-State: AFuF++m/XzDpE6+QwBAs5Fl8DUsNbXcgEZmhZUfoFdjlRIkYDbR6zEoH
	L1y3akTeDfCzFLiP4kdm+fmRIXgXH8NOZIdUDEc1K6L9yWU8Vbs3OoKR
X-Gm-Gg: AYBFou0bCtLTuk3lAKZlqrGPrqY1bqfK2nm0yMLkMPKI9Th4ILwW0mWUmvf8Ph2sLg6
	7dCzgyF3ljIWBcSv/ob3Tkz4znzQgC71ZnDLV2nVJQ18TTcz3lc6bq+HdbQaTknpURZOSv9aB9l
	lUz+uuQdxVdmJWp3fMYWIxgSxIoeTxDUMgvOf+wWpavnVTHqJ6zh2a88FsKwLPyDvci9BWemCJV
	lYhPXbZsH8E4Qj2Nyam73LW8ESPOO8ZMFHrv6M1+j63IK5Z8nUmn0cI+XPWMCNFSAzWtYAhjEAk
	QgUKjw+QyXwzWi5krgl5R9wyA+delGNdalsLQwceByq08H+VlOg5cSzDWcNPB4fgVdH12OR65B/
	05AeWpglzGUHBisYB//g+qEUs/thuOUMUB/SmlgZ2bq75igNqv1qd7X/vh2c0Da0I5DS+hRr54s
	SlYlF3KnPIjN53XpD6n3rOQFv9NzEwS5L5DILv3kYpY06L8x87i+dnqof1BIs/Y7MwIZArCnmRh
	NQltX6eOQFCjP1oqh3/Sl8cjw==
X-Received: by 2002:a17:903:32cb:b0:2dd:ad74:ac80 with SMTP id d9443c01a7336-2ddad74adcbmr14361355ad.27.1789661977897;
        Thu, 17 Sep 2026 09:19:37 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89c3316dsm29772185ad.0.2026.09.17.09.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 09:19:36 -0700 (PDT)
Message-ID: <6edcfdb5-f73b-474c-96c2-96913ca5ed25@gmail.com>
Date: Thu, 17 Sep 2026 09:19:34 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7.2 000/733] 7.2.7-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20260917151350.597953846@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20260917151350.597953846@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/26 08:05, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.2.7 release.
> There are 733 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sat, 19 Sep 2026 15:12:28 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.2.7-rc1.gz
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
