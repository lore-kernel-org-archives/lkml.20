Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793244588;
	b=B0RDrsZL2jyi0d45/tX/mAQQjnq0Ad86KYRq23xxSBq+qkeTOBdL07uzdc5BQIcVfifY
	 hCtQZHP+mpJ0Wld8JPjiKr3xw0YkcXPcmnEPRgtGUyxBao0sEf1eaeYLl3d+mI6vyFLHH
	 2LeJDOeyNzdlAXSR3ZgztTW44ugJJsJAYz1k/cG7+nsHWHhLYrzN0PJAPkgKVGjwzAQQJ
	 YZv6TSsjhYk6sOV/yIhN627eIk4Jx0TuIij76VekW5wEYy/y8GQ3LmLDcKeHiQJMUqW40
	 RDlrGgbasQMNmM6vGaW9ADs8YlFGc8nSqbf4JDHtGmG6Uqlmcj+97tp580P4v+KaOhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793244588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=aLxkHNwaV2Nm/4SXJqHXqRt/QoXx8VfPwy6LHI2UFFM=;
	b=pv/8sYqF7zC7kT1jSPkqCauLKJurvxkshhJE8QETzdQuRnacy24qt5AEaeiWBqs46UaT
	 pfGEVS/+C3oid9p/A/lNZ8+C0DMxjZl5UWU2VOmVpvdXOzTIRKULjuo2n4sbUIVL+1RE1
	 OE2Msz3Y2H6O1bkS86tfcnPmMEuI3ldIyYp+pI+SA7fkG+opaEARHRNpG4FznUDgWee1r
	 rhW2BkI4JfR9a+lBRRhcsUYCpDa7UJJBWuQOaFX68Pmp5+JDY5KUEfOTIKOR7Q7iqa7SA
	 RYVaKs5sVhAGycyj7tXrhG4BXox5ROdzhnA3o+KRYxrADkvpSuVE2Hi2L/wHbmiB4TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=nRg7cJN9;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9DF606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE9DF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=nRg7cJN9
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so10578745e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793244586; x=1793849386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aLxkHNwaV2Nm/4SXJqHXqRt/QoXx8VfPwy6LHI2UFFM=;
        b=nRg7cJN9SLqW61SOTpAvJUE6k+wITMzWkO1BGOzi4qowcDN2HOi2XBaTgc8oBVKBD4
         lVg7a3HC/DNhM9g3Ot9jBkrBl5hCThZUE9A6fRO7VEinLVqDjXqSs0ud2S6jaw6TJ60H
         pzOw91R3lcIl/e34GqL8gj84v4Mp7QjDNG0g1YiFaBxg25VoIXH9T75abWAOs930/1GJ
         oEfM678598TckKw1ZgQ500OfELjiRAtUWU/vHMT4zu4FxBfo3l6GHkeGBzkgyc20ffUu
         O9mV/4AE+xh3FHNK+JpuW0VvRMNCJIF6rhC+TcgJIchu9DqLUEGrsf5+dkPgmfc89BzD
         P/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793244586; x=1793849386;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aLxkHNwaV2Nm/4SXJqHXqRt/QoXx8VfPwy6LHI2UFFM=;
        b=GT40xdanAqjwxc7mWnxEbqNLiXvClh74KuvUFrpOZFSbr5qi678kXIgTeCtuEj2NJa
         ibhKkIKEuxbZlST7AZ2DjOxi3wDuk18n0tsMpYFCs/OSnUzSnsqNd6MDqcgUUIhe4i/U
         8tpUTV7chjcgvCc9DjCxGAye5ad/wdKTk2gjWXXCtCCCA80XCRgijz1k3LR3ejmgk7tf
         +bLzSDZe/Y3xUW1FCkZ7ZMGNzi5HX4P1oi69QoN6+NrmFfsgxiHZ5QjiXi+NESo8M0pR
         apgUw8jTDm23p7dZnraEqXRmmDgBoo+ELCimIj4zcW+HC3RBSnlj84cfZF+TL3ePXRRP
         g4rw==
X-Forwarded-Encrypted: i=1; AKwUvBxArDdOxY5cGZ9LyUXRrErxAwBCFSmqAp/jBS2umsRT+gL7PGOmWlY80yGZ6Q11z+xR6bGC35TLBgocr0Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6cM9zw/qsfsAgayn3//2r8eIKKfEkMtyg/LpTnAiHZephJvMn
	IyKPNKjAFTGF7/FZgrZOT8+/0LUpT1ULoq+f111Xf2JjqQ138W2MpWs=
X-Gm-Gg: AYBFou3SpxhfJhNJvBBKCvxviOK+dCn9+R8s0yYyW5qQ3Duqm00V0D2/6/6aIzO58U6
	CRpnOpa7oNPnLmb64/Ycsfbvvr6nd9oBMAYOdeAIrWMBJPQiKE5AChqoqbS98rsIUs/ECLzctr4
	ChWDl1yv39AWkxFtll+VthCHVxDP+ExLyQ5KY04idk7rEySp7ubybwkHkZXmSYEZJhQKevJ3AYj
	iGExyetrMwVBOe+YvHWy+1KpFhBkgr1uSWMVl8NnP2USWsYN+4G8SScXzRF7za/Ppkjqq34TR4r
	EYXyYYeudgWpUM8wKt2Y+PtN7sd2Yarf6VLlnp93rCvXNVfmS3CA2r51N1oeKerAmoewhe2Z/e7
	i+SEwVdtELf0/TdimlPYCTIOVAwQlwmDhLsZZK3W+3JYfY7VoV1TcjtAkGyr+C54S57B1ee2dM5
	9Lwrab4sz6Qx1CjXArOAwDrlFmkO7Ogub+kCtwW5lUeQGKD4RVod7q6NaaldPSr2bmVCAEjw2wO
	LWQfx2Z+e5eV/bY1LmV6Jps1d5pwwYatrV1ec54IlNdiYcK+dvqbgPR8FtCunqlKT9Ma1gi74oD
	0oQB4hdD+8TBoD/9JbCx1L94QFrJcF7tdiawXoYLjI9xdsKr/7ZGWjXpQOYT1mXv2NuEeNF3i5h
	x6Exffbg=
X-Received: by 2002:a05:600c:4f94:b0:4a3:5a42:b29c with SMTP id 5b1f17b1804b1-4a967202997mr98238455e9.26.1793244585802;
        Wed, 28 Oct 2026 20:29:45 -0700 (PDT)
Received: from [192.168.1.3] (p5b2ac3f1.dip0.t-ipconnect.de. [91.42.195.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7ee57589sm37717095e9.2.2026.10.28.20.29.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 20:29:45 -0700 (PDT)
Message-ID: <a58da4e9-8fa4-4aaf-a0c5-f2f443a79504@googlemail.com>
Date: Thu, 29 Oct 2026 04:29:44 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.6 000/168] 6.6.161-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261028165943.089486480@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261028165943.089486480@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 28.10.2026 um 17:58 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.6.161 release.
> There are 168 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.

Builds, boots and works on my 2-socket Ivy Bridge Xeon E5-2697v2 server. No dmesg oddities or regressions found.

Tested-by: Peter Schneider <pschneider1968@googlemail.com>


Beste Grüße,
Peter Schneider

-- 
Climb the mountain not to plant your flag, but to embrace the challenge,
enjoy the air and behold the view. Climb it so you can see the world,
not so the world can see you.                    -- David McCullough Jr.

OpenPGP:  0xA3828BD796CCE11A8CADE8866E3A92C92C3FF244
Download: https://www.peters-netzplatz.de/download/pschneider1968_pub.asc
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@googlemail.com
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@gmail.com
