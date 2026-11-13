Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794608786;
	b=GMRo7SvXabUn5MH9YYTXukXaXv3nbNyGnZxaugFVBqy4FWhpKl6qHkKsTsDHp5CCCbgk
	 c2DqXBNQ4SnA+wKtwX7+E8d70KyUAmy0bUbdjDgUj4O9cMG+ep/sAFDx5j6JLNHmLh9TW
	 tfOmxcZuk5ot7tUolARsORXO4RSiSuSOovRJ5f+lngbY8yuhT/AafPB0ALxkB63EZUR6J
	 w3k5FFFXNMCZ2D9SUjdP/+nL/WRLseinCJm7h7V4CcY/ISWjpT239n3hEryEMduND3dR3
	 +w8vH37zX2OiWF8Ad7iMydSGKD23l9kdxpJ4SAho4WbEpvCqq7y+e5KPEPiJjNxnwcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qN6krYwEOOaADQfooIYZcB5GNu+bZMz584ofrhIVz5M=;
	b=IIMgCioHrmfFiwh+dp6vSSRuXuZPmsuTSzU193xoSUAJCgqT4aC93kI04Q4guB9H1MAX
	 Dt9VSVXJ9ShMFHuPixxQcTvsqnP5X474zaT2JTmpLLkberKuF2Bvt4lYORWadYRdILxOm
	 sQKRa8ARuyywrWtoag3w0mxrNjtNo+pfyKjpD4ZI4DVc4/LmGfo27zWVv/unZrEhCK8ZC
	 KIGLcdIndhrqXGzz4dT6XF8URw5YhjUYsLOeCcEH/Sex3cHrYlVPj/FNqz/c2nlgxuXiQ
	 gQX2TY6aJFeXDckU0C9qUXLQEHRSMkcb2IFXtuzvA3NKoaDokt6K7CQtbb+Ac4r2aKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=OckkWaHq;
	arc=none smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374E2606A881
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 374E2606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=OckkWaHq
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4b28d9537bcso1807517b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794608784; x=1795213584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qN6krYwEOOaADQfooIYZcB5GNu+bZMz584ofrhIVz5M=;
        b=OckkWaHqZj+lDpiXsd8AHfca0d7kYcQjpoucf/9ciX0JzXnhg2Bl4aE/aEVvygOCNN
         3Ls887fyzlSVFf3e16mt3Dypj59OPQnRj8LhlSGTJVHzYwv8+R94EQsteMw+TzDr9nI4
         FOcnYGMY6e4egR3OAXhqVhVUyjscsfM2626x4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794608784; x=1795213584;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qN6krYwEOOaADQfooIYZcB5GNu+bZMz584ofrhIVz5M=;
        b=uOIYWs12/+ny+mHDBwNFIXN28L9pMKSXOsbr+ZYKylQgWtSi50vcTKFMkflbs1r030
         Gy8O8phl3jZ4auglg5H/FmbF6w9vJzZfFkfuljC5ebva0a7kbM2noTfbl31072mUMZGQ
         B0HnQ6dLDnBJjILFW7P2560PwUpSr86AQr6x1KQoDnkq68H2kmhDHhw5veCOcuH9JA+J
         GsYdNfpoCgN6nhFLyPrmwiotua0SMJNftPvMaEn2Jch4QgozegDkhKz0kPJ9maivYKvo
         6IGQqKcIehnld+eG7n/Ak4lOZ+4sn91iRMkVfFfiHxBf+QgIE3G9hDUmVyWuNzbMg/xG
         oVgw==
X-Forwarded-Encrypted: i=1; AL+hErEdfH9f1sTLqqq9ffQc9HjyXh4cILYiE/meirHIW2yd6Sodw2GP9GWovTxRtvUqBEcSw9InyTU+a8aFkjg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UfR3omPrR9hNAa+QeTfCzhfKf85nLcbyquqiQqOK0PlzpkHOC
	1o3l7zz+Hwa/Fi1hrmifropeZpgp1duiHw72kcQqyGe/XP7HEDwI8ZPJ2paKrOEb1RU=
X-Gm-Gg: AYBFou0Ih41AHFyNm5KjMKgDx8B99IRzx2+KOoId1wPVyHN31tWwOBMnseu9jnBURBT
	jHMamKyFs31CWVS3vryrwJS07JvKFXD/4mzG4Vh+8Cx2ZlNhFkRpbdiRyxSePpXkhYBJ0KrcVm1
	Iub+ViuvcE82Hiz5t2uhL2CmX7zoIXdDfW0lL3Kj84GWPfsVFtyUahQ8/71eDlqs9g7F7V2lW6Q
	l0/8XIqxMKPDTiJjhxxeoQXZ8HM2TuAmDTWx8fgoiHlDUC7qjeaEiR/nTxZmMLbJco+DtpABoYc
	iUejIU5I2B+dFhKm6upgGoaybJBquRUFekGiSeKChJmg1mWuBbTWtZpyN3mfiqlAfSo5FFi4Exc
	ZVNrmDJWBxxF+aVjZyiHXood0yJt0guwJg4llWKXc+3+vRL5Ay/dxRXdcYPhAZN5PQK9ibvl/y4
	HqpzbKn/uecIMJJSFkPH3n4I0TwWi8BH25On7KMFDzeg25D8nMMTDQ1JqWutubK17BRVnwZ+nT0
	IYS4Z/m6p7QnNTWhjnnlxDXQymBX+/bQAccMkq5xjULC/B3Iil90+O4ZJgioOKXPI9ALec/cWlr
	RcrzhDbRFvzHKtDK/iW59YKNcqeJokM4wPqB8mM=
X-Received: by 2002:a05:6808:1520:b0:4b2:8dbf:ffd with SMTP id 5614622812f47-56cd557713cmr4332703b6e.1.1794608784082;
        Fri, 13 Nov 2026 14:26:24 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e7024673csm3195795b6e.8.2026.11.13.14.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 14:26:23 -0800 (PST)
Message-ID: <695f8bdd-edda-44b7-8cee-e7557c963a1f@linuxfoundation.org>
Date: Fri, 13 Nov 2026 15:26:20 -0700
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
Subject: Re: [PATCH 7.3 000/507] 7.3.5-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261113153753.358973689@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261113153753.358973689@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 08:45, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.3.5 release.
> There are 507 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sun, 15 Nov 2026 15:36:17 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.3.5-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.3.y
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
