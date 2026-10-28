Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793220211;
	b=TTWzxRRc1elaFsSqjNPA5pcuNlnzSveeZr1t0Qd9GqtJxr061ujmNLVu67TcdMm8qGZ8
	 djt3QR5BRJ7VlNhJIhrTuMhdQ2HJxINO+1t9pG8468f4Ujz0Lo1GzNQcvjyNJWrCQRUoS
	 c3Iv1Wkx5+KnucLGuMY5pYt8P9qZtFvooJbOi3O9ohN3E6lyE+kBivUNeiYjUy7ZVPbNg
	 eD/fWNnswF/e6mutSCawLAgHiRbXwdUBjLrUqf6L2/TDZEpsydQi/pn4pAfTt+9z1B9Hv
	 oIPO6Bxmu1VtqhtBrG/TmrZhLvdhH9BxAyJr2QdDcoxhc5MMosXwgs26VfgZ1XCj9yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793220211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+Knq+SFx3pxVCNywq9r2730akCFH+DH4I66drqpj7+c=;
	b=iVRHdJUoVkyFv9O2t0XeJ8f5SVubtjPZEydrbvq6TX/7NkT6Z+W6+88Vs5FuOrrxS562
	 ulgXatoKQZjaUORlTPgXVFulNxwPZnWsqqHjt9LvGAz5kphUo4ykFuaKp/gP+jFiG8xFp
	 dDpBIlGXksv6TAI47AtiiCcediy5LnTRpBIwj2VwvWzAVNxDlU5drzUUld0l0AlPjv49F
	 two0OJvajGgbE2qM6Cw+uPvQ05/b2lmDa45risnIMhTimVVutB2xBMLAEKGmgG0w//Oei
	 NK1Uo4D1S6EK6+W5ibA7www66bQ/X6FP1POrzWoNQPLW+ZMm4T8tlAxhuKv+Pgpim3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a8Kuqc1e;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFD4606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFFD4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a8Kuqc1e
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so1173312a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793220210; x=1793825010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Knq+SFx3pxVCNywq9r2730akCFH+DH4I66drqpj7+c=;
        b=a8Kuqc1eLE3E9yn23c4DdCuufVsh/81buWsKxhRdissNPzDf/Dpjt3IQ4uKm7yNBVS
         RPsMNyPKv1Kp/gZVDmPPrYNPCuU635i69KB8fa5nUf5kL2ySGVmZAnacJ/AiZarq/TPv
         frIgaqt2KLHMudDc31qR60TLoQwt9bcz/TeyULii+G+X6tQF1AwrQ0HJ1doxEUX9QKyZ
         lkvvuEkBY5ZRY1wJNP7czfkQnET9S0CX4o3kHGEwnUfELK34uqkabBwwltFNc2k464i2
         GYUn12taERH0UzF2c6HvBJ0XXt7mTE4iTbOpy2XLizuZbr8VIsBPucJ2MwRhQfrs6YSm
         Urxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793220210; x=1793825010;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Knq+SFx3pxVCNywq9r2730akCFH+DH4I66drqpj7+c=;
        b=iOBotqULOeWio56CNtb41EeCgBIxgxJy3Xtb/gsNchCm5G6SRJUbzavZragSRA5bjo
         5Bp6CPZEu1T96+5aVqo3JdQHJrzSBKIRVYUIG4jIqOggl+9QWkb2y/BUyjAKiGl58kAM
         bI475wZBypW9/Rmkve3GbXz0NyowvTbLZxvMTIaPWG9/FB/EEFWEmjxfjyV0t6YHADNf
         lKMqWJ//ufepF4sz2Zitv+bfp+6chcOrEAj/UCMG4bHP8OwZ8O2YQdMAZ6AZmeJ+yGDE
         GnowsaKBgwqNAeYzy6BLQsLyt4JF5EWNOnpwLn5mUY6GQKxss8ZmJ2/bq08i7rvDlGvH
         D0qQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNcLqvJ6/8XHLljDyl2luZz6EpwTECNf4zgaOIpJ9hCmfgt6malVfMacInPYtArrpSFt5lfEkwkQ/DXu4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2cz6ryfDW92yGXQOGsc/j/6X58ohsRBXszUfq+JjgGYd3kHNg
	GGxlYqEuxJyuCWe/Fh6NYWXz4sFdLdBQkuiGXWERdvt4mvDHpVbev7IX
X-Gm-Gg: AYBFou1P7vUQaO635DCbYO3MbaWRHCGER++ZQ6r9UHkTC4+hh5tvznONm4grmkIaHPv
	I+iTgqprGhbOfXfTqXadvvTchKbGh9oWmKC6OXNPvYdOK0+YLhRwvZVCswRX8ztf6v/eeOC8KY1
	RfJbUqRoyZYek+Fg7ic1oxtH+jZLjbffaalfrhRnjSdMQtqyiAfa1svn6AC/8gtM2UDqe2xXIcL
	9fwacK6YygP9k5rb6yroAA1JZIRN5+oE/OLzkS/G6evOD+vzTkd1s8MIna2Pu0XQn+IbB/Mwz66
	3vR8MphngFo5b5qWVzquT4+AKYUj7R4wuBhanVvybYAVsy9TXMBjCTY4D6BvpHV3L81GwsEYSss
	RuRc1iNJ5I0dFlhrxpxyWXaOjuUKcNKfhTs+fQEgwpOphwu/gFJMlliGKCYsBCpuDZhwiHyEDbV
	jcdbaeIVezboMgAeQaqRbG1of63VKMsPhODB+1cyM2420nZ1gLt2TGsekpvty5AsgRmBJRBxfXT
	UZDulDGatI+b5psYAItGZnTcfSzRG3dCG8vgQQDASXeDsr80HXDDvcHGihP5Qskl6BQg07aiwIw
	3zcmq6Lx9+Mh5q+fEeSHsPG+Mv/gGHPte0jfSRWOmteolN64hmNjFan/
X-Received: by 2002:a17:90b:1d44:b0:3ad:ce24:acfa with SMTP id 98e67ed59e1d1-3ae57f638cbmr2422136a91.20.1793220210245;
        Wed, 28 Oct 2026 13:43:30 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e898317sm940454a91.16.2026.10.28.13.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 13:43:29 -0700 (PDT)
Message-ID: <7cec1e35-fbb9-4e9f-ab90-c81b7af10aa3@gmail.com>
Date: Wed, 28 Oct 2026 13:43:27 -0700
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
Subject: Re: [PATCH 5.15 000/571] 5.15.224-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261028170008.009143722@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261028170008.009143722@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/26 09:52, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.15.224 release.
> There are 571 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 30 Oct 2026 16:59:22 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.15.224-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
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
