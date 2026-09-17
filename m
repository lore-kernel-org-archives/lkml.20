Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC61D49502E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789685149; cv=none; b=JziDRcPP0xCdig0xccObQmDA1ozfNjLW0ZkxCebLD4dEz5Uxcj3y/6KikxuK42pPA7KAuq1LiFTGMNPdv4wAklLZnv/KkTubjLBB944mayVNK1UvAUwG88xB8FhBatbmgQs4Oo2dfTFjjpQ2qzb9gVfsgaoo0v2CbmhuOpbgLHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789685149; c=relaxed/simple;
	bh=akcJ0MmLlenQNjkoQU/ZAksKJ827LifeS7rmDdrnKsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UcUnZZaJrFxieC/v6ND6LyX2Yv2w7UBi6i2DxKEOesJsOPlKb5N95utYFFToY0jeUZs9cKZu8Akr8WPhdRYntrQAcytKyNNqnWTJc/qW31sI2xTsJCFbMGpVnehKU9puP/kVBugyWomgupEKmI3jgZBhARiTX5wtn34alUid+nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=USxhVeJm; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="USxhVeJm"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso575405e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1789685144; x=1790289944; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8vbbmySAgXmsI40pXiFD1Hh73sth3K7z+LhNCUvEReA=;
        b=USxhVeJmggC5w3jyf5Qj4kn/VSOFlT1TP/AO6x28X5ESvJ8jLDomNouucpxpL/0DaY
         X1cpEbXVldPJzvdEL8MZLZE/caC0enI7eymF1wht5DhfpaBPVtta6Vjh1EfMan4kJTu1
         I5s20KoKXwrYiPPMHY0PK+8kiaZEg6o+BeC6iSjHH7vuh47DoY62atLK1w75m94+jFgK
         H829jYbO+Zl2ebOOrV5rF90i9vQ7J5gLM/HiT8eRDxsqLRWVKkoIv6poh8ybFe5VzTRL
         LofcJAH6w5cZzfABpSYl4B+t4JmyGCSEJDe2ejOe0W9j4z6uzSQNaUSDN/A0XGzWB1zw
         JIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789685144; x=1790289944;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8vbbmySAgXmsI40pXiFD1Hh73sth3K7z+LhNCUvEReA=;
        b=aaPcMXdPlZ2ZCbUZ8/qL28GWzNniSIY8oynnPHGI8qJxAC0ZpvdCPxsftDofzmX9xF
         V4owU+qqIRUF6lFcYB4YyxrQOnvLmey4BLjw7Uz/vFaC8HSHpCdtyHiFbtg1av+eVo22
         1TrC08EzN1wC9hMJjXtAQs4Oir8TImZZ4+rnIQSp2AknCx5PZM7gKcNm/B0dnBGXkTZY
         dExPKuwKDnm4pghc3Beqh/VEBuuYiqumJ17T92UnK5pEFQpGDAjl/JQm7/foYTJFbKq3
         dcS3YSuYvA3ZdsHPM8THmyVYyvXDlwH2zBBBaoEUSbSeVvAi/HzFWkH/0mokdv4eYyja
         isOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSOEKfiwUXuOKPiJAdnuc4HWVPjKhVChlg77mV9qWWPmrAHecCNLwoHlshyJ10Yz0Jq9DDjLdJA87vsgs=@vger.kernel.org
X-Gm-Message-State: AFuF++kf54dudkVC/pDLN6lGhvQ3U/NGpm5AmTvTOk8xnCp+VxgFnmdb
	vmPN/p99uNiKyyO7CYo/Nr2ualnEGK1J8u+Bz3wvr6k2F8h18AweTA4=
X-Gm-Gg: AYBFou3iZi2Q3UZB5uILer4k2zYzh+ijBfAmcQx1r1qxA5LBL+AX9onT+pBd31yaOsl
	uHv15Gj1BXdxbo3DWiUgDUcub1nMKs5MUJ5AN9Gwy1Ha8hUj6ToXwmEc+QZXQiPyQfQSXMqQXfM
	lkGcfqMW+HoB81Shfsn2W+aPIMUXL0wNSH6Jc/oKmeecIrpjVWVGy4CPiAyEEJhyCYb1aUF0llI
	cObPX1tSqAcCLv6ZxixmheMcqfIyu5SXuiP83AY8R57Gi3X0SNtHzHyoMo+nFz0iNTJL8MTT46V
	icsX5b0ql27G596+6fMBBJVDgXnKR4bOgx0uziD580T+8Z5wZTr2WBV43tU5AMFacB3fup3L784
	ESefY5C+SwhsgwVQ8x70FrQRioKQ8z7ZrF6q9qVTNQGi5Ob5Ws6JqSzGmHmoqdF/wxxrfYEgpXj
	8mzD84damfWBb5T5KfQ5BZK3TdrAWyYaTeEzeMWaOIFIHRMbU+4du3YIailiBlquaFL/0qLBG8i
	Mw9eEgZ2p6u5eJ/3rgJGJifyOEqdC9atpep0tAzOBFdinM=
X-Received: by 2002:a05:600c:34c3:b0:49c:fa21:e74a with SMTP id 5b1f17b1804b1-49fc5757f73mr4006775e9.32.1789685143622;
        Thu, 17 Sep 2026 15:45:43 -0700 (PDT)
Received: from [192.168.1.3] (p5b057001.dip0.t-ipconnect.de. [91.5.112.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm8484455e9.3.2026.09.17.15.45.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 15:45:42 -0700 (PDT)
Message-ID: <047bf331-375b-4dea-b847-e5102f377411@googlemail.com>
Date: Fri, 18 Sep 2026 00:45:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 7.2 000/733] 7.2.7-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20260917151350.597953846@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20260917151350.597953846@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 17.09.2026 um 17:05 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 7.2.7 release.
> There are 733 patches in this series, all will be posted as a response
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
