Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604211;
	b=QrRJ7NYzfrZdk3Hh//85y/K+8a3Rm5t2iuwIe00iuBBBtIutrlfibKweVBB6K2qH70R0
	 lTM+94EtYXx6vHUiPq6c0XstZY2Wkot/9kwEEM8IXq4UDWAus5l8Ov/QvZHn4QwixGC8C
	 3LL7DHnD5gcE6zFQuzh+v9bVe68o0YozGa1yxcxcLiCnltg5ixY66oCzBR1ela5Ep5rHL
	 SSsWrWKsMfkEhbLfR8DS3xR+rLDhd2FBrVK1nsLHg43kJlrXuVCcfDxvaNWv4J3YBFVdI
	 8j7q001wsSi9ebDUVjJu8OGP66oT6o9avzgkH984hLCIHoF+QYrE4gP7LbglexqjKvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=UP0VIkxwdkwdfopi/I7Ka3p31rBuKNZ6NklI8tykK3M=;
	b=UMwMM6SuNzPtfjZdzAJbXnVuDskLWTlTWp1nhig7xbXKAnuKbszQC2X1hR1PJqkPIgw/
	 /5ywfQCwU12bEln0V+w8qzo1DBOzFwtQyFSqi2DlFvhvMsN+Jmfl+5HH2ZQLmvO59v9fz
	 3A6N07teJIyEOWWL1ITLYZJ5hXv8VyIQOZk5PpgVFzNbJsEOR8q+xknHgMz+R3LGNFJn8
	 Ej398EKkyhnWuxtKkafpFj4T7MWQgddXJZZAY7W0SKY5tgc4fBobfRDiR5HOU6cGb25ro
	 5BetCRct5n1XXztoN5rSiGw8eorP7h6t6geCQhyB2lkMoUBQ8KjaUEiXBhIe5cX65dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ssct7muW;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A20606A336
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:10:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02A20606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ssct7muW
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso728901a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794604209; x=1795209009; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UP0VIkxwdkwdfopi/I7Ka3p31rBuKNZ6NklI8tykK3M=;
        b=Ssct7muWtqu41TdDORIwlGCvJQicZwHvSWsLHQ+31G4vP9JnMKCu2AKxtHKU1ew7Yt
         UnQe91w3zBFdpa6nzBJ0mOyBF7aGhhM8yBNuqSO2TZ3fx4H1Ocv9odM8GDXoGevVvB9H
         zsmMbtW4cV2edkyEkyrSWH+UMUMs8jcFTJEdvDQ9r+RasVoJ+8Uie1GO0rIppCgNyHxG
         L52y+wA3FWpcs6jHZIfEkRfN0geKCvWH3L1nb7ohVrLvyup3QZqGOlNoCMWIdKh5Drab
         9Ga1gaSeDmElWenkjuUhhIX1wx2Fr7PApg6N4tRL+zK5A6v/QfPDvzZvknjKDepXl/0M
         CCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604209; x=1795209009;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UP0VIkxwdkwdfopi/I7Ka3p31rBuKNZ6NklI8tykK3M=;
        b=LmWbEIOJ64u83bZctFAFobIY2JJ9POGQ/nGuvpmYshKZIliaJYQeymIL4ZEilt0rzt
         I8Kpw4qbafFpZ0dfn7T5o8TwLFgkjXooJzHgy1o6LGFJ66jObU/3jGB8P6kdHOIsVoo0
         HP7COEjYEcnUxWSZS1iM9Jx61WJXnP9JaUYUu/BinfJrqlUKxu+ZksjfjAjEr80ODZnR
         rznLpwU++5HqjCi0PH6FdaSZwngehicboF5rTL/bJJ+sRgHiM6yDYxyCGIiwT/LMh2P+
         mdkyFF2Q/BnRS0BwY9gTJV6qj+gC6L1IG+TlnfAZE6FYksUTcZNFeKtrCJM/NTTNdK8q
         vmxA==
X-Forwarded-Encrypted: i=1; AL+hErF6o52NsDs2jkCWmHeILYbG+UQtsh83WvZuWPgbtfwLyBWc8tH24MRDPQZoFbaMrSHt2b46wzDYfteHEqA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Z6mlsI8nzZk4mrxJG95oHM/lj3cDDveZva9hp/YXY10PivhV2
	Cyi5P4kI1TFaMz90HeqFpmRqV33hHHRVFt7ZsMHmdBTboJKdf0C6vB0c
X-Gm-Gg: AYBFou2yKOGrTxpSwdKytjFgDjivHPhiZX8O514S2G8Lgusg93IaoYhPt2M1DZE796A
	xRLE/1kJ1HGdsoLDLwA3FMO403QxxoMxhBkGvFWnGtYMyCKHVwMJE38yfKPIjSRSQGXZj7SVfrA
	qCJZodrKkt+r2CKX1vupfbEHvLLqc3DDKVle7NzjbxLRxdr54btVSVkSiHY/IyqZEqtd7ToLFIw
	80ZxDj25Pz274buXCLDt9c8266quoQ6udceaXQ/a5lGK8SkPWAPxjP1Nv1V3u+tFuDulXL6BLxl
	3BCHUPg8RSOvUny9Vx5VGkpmJRjLfvYafMXVa515YufKD+hi+MRy1knfwrn7hNdVCHYF64cNIeZ
	Vc1QwzTjlij7x07R7lCi3LK4O9fF5NGiyDF9ggq/IDClmpf+VAPRboUII+V48W7WPI0jeo7vt/c
	LqjBYpCeW0idJSk2nwcRs+NhwXWCOfBN0QBv74QzdClpgnNmNGSv5Llb5y+/xdv4AYRAg9JiTMD
	2XOSABknkyDXgN2QeBKcEaF2ZG9mX/sK7EHcEsX+r1URj8jmG1lHhhLazMKzafq2c3B3dsx6VHv
	Du3XelTUOmUlZSWKlOV4rsedxrmdoCW7/pM5/XZlS3VH6H+bb6ciSkRi
X-Received: by 2002:a17:90b:4a:b0:3a7:bb1d:3688 with SMTP id 98e67ed59e1d1-3b1b0a0db47mr3267098a91.27.1794604209023;
        Fri, 13 Nov 2026 13:10:09 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm11082549a91.1.2026.11.13.13.10.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 13:10:08 -0800 (PST)
Message-ID: <41448f6c-347c-4dbe-bbf6-d9429c7f1608@gmail.com>
Date: Fri, 13 Nov 2026 13:10:06 -0800
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
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261113153753.358973689@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261113153753.358973689@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 07:45, Greg Kroah-Hartman wrote:
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

On ARCH_BRCMSTB using 32-bit and 64-bit ARM kernels, build tested on 
BMIPS_GENERIC:

Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
