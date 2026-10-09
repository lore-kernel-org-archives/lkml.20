Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D6F3D5C31
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791582026; cv=none; b=fPVthCB5BlF8hYoT0S8Yd0Hs9+O5A+L9iPViObTyaxjTffupiIleOJKvO0lRXexph8PHJew5zgIyIYpQJUepZlIICklJvfm0R5AsfKphjHRxsSrHK0HNwfNoxaW5Gs4XiAsT609Xcd/P8jVWR6f0y4FGukii8en32xwGxFiC9/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791582026; c=relaxed/simple;
	bh=GEDqi6cQqEPhJR0cVLsj6fg4aKUXmns5XxXs2jZVVBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=euaLkM77f6NjUv6oNglDGClGDQTWYQP9KVZw2hGij2S0/7JGM6fhkicfJi3tkHDsVrdig6nEzuJLiJVC25rLIVVlcPxhmqMDLY413MDi4v4AgvyFEDI+xTkh7RGIqFAQ3lrzqxWYINcrCNZ/Z6JoBzA//2788QOVyYHfnlaa/8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=ZjI15pq9; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ZjI15pq9"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so2398325e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791582024; x=1792186824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XYNRxEaVrIcFOPoWfTYwk6GJOOGVb1oRxSuSiudg7mM=;
        b=ZjI15pq9ILESwcVmVsNj6ThEtCE1tv29V51LOzwKtEDsDmSEzUp4zoWYCHwvQK0mTQ
         2WCsSi2zQTc5Ntu0eCE/KLvXof0Pu/6xzgT+GocoKwMLtMTjBYC1pPOwGUcWLQJcv6co
         zfkv4go4kSp/E0fL4snBpwe2EodksJY7xRioyMZmjsuzwEX4jwlPqNZime8P+ACRDRQV
         8w8rCI2GMYJLhi1Htd5ZDjTpzVY2OxGtwRaLzHTIv5TOPqHGXSKAKZ2K17WibkhEZenJ
         r0rb0ew9nykZ8kk8OiFBmaSmOylbUZaWMAJde7GLzMHLEK+K26GQlxOpiZK790FsKriG
         dF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791582024; x=1792186824;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XYNRxEaVrIcFOPoWfTYwk6GJOOGVb1oRxSuSiudg7mM=;
        b=ol9S0K/pIFEYHSbAMzmkyKdGsLSet4SOZITVbINenRuljVqRTxxo9UlKnPtTMOawAI
         O/eOyZ7rijbsnN2D/famLo6Y00iaLZtp6i6zlXVUwu027x3hr1c34VG7WV97jVdTDnOz
         Jn5Y9tr+0eBGD2ogq8YrgWwiRkLhYKiXhz8MMPGHWKPuhQeJncONii44BGbRfdM2i1so
         Zpq1KoaUR82OjjF46NJ9c0/kD6svHLU3huUbPyugeexTFTpRncpKrFCv6wqZK7zA8lW9
         3Ox//ZInL3yEP1F0XUp49RQdapMW8xX3ustXXrlC+h65UFdYLD8lIHRQkVqD8MRDx2fJ
         qCsg==
X-Forwarded-Encrypted: i=1; AKwUvBxId5B/zbUA17MaJOnj1TL0fZiaK6yoPLSHIuK37x3K7mT4BDP3Xj9I14+7DUv8VD57w4AJpQJfJgaHq4s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJ1wmtUqDsXLemR0QNfFKvmwn0NcBjwhWyDlkVUZVTXE0ZDOeI
	qJolQiOeCUVZLr8ibtrW7SobQJlR7b8L/WezlFk9poqsVPwrmAf8TTg=
X-Gm-Gg: AYBFou3Nl2NQpzUlSxwbjRyzbSjYyOipAKxKeOkGoFoeU5qRad9pSUjVPvodhydmCCO
	RhmUf5VIwFHCYsnvWaogtdzNxlQarwMMXy/4qx7DytyAi1jEJPnw6tB6FA6i39krLaNztHMgzUh
	5WGXNQfPOgjcaGmlfJrLY9npI04Js5Qw8scbXwLxNLzkF43ZYFj5KSMHBKwUxtVahG4n76zc7nq
	tWOyC/AZh6alKjpZK4OKhZ2ByJUT58HWkw1VjLKSNxp8uvUUmonDmCNZN50cNhkpnbBf/qRCeXm
	QJqsUf3FoqwUrNPwUbFLLqHYTlSbehXyCNgDCKmiC/shRv6yav0AR5UCDLnUKi5lg5TCM1F3EU9
	8TLEGit4S2X2kQc6lPY13L2G6bIATgK2XzAH9Fjmz0ONBR1EGfogYppGKYZqBmWFMRVI4eP7txk
	4djDDlsItWfQA7X3nQpnlfCLLPkxDQIc6Z1Lq5a2rHuc/IWFpEYRpcrOB5EfNEyVk4IZNnxGIo1
	TW1O8XcXhleSC33xDwZxKM2T40yqf7PMEKkQtjTDfnRaJkkvg==
X-Received: by 2002:a05:600c:8209:b0:4a0:2375:dc1a with SMTP id 5b1f17b1804b1-4a18e4cb771mr62672595e9.21.1791582023679;
        Fri, 09 Oct 2026 14:40:23 -0700 (PDT)
Received: from [192.168.1.3] (p5b2b4680.dip0.t-ipconnect.de. [91.43.70.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18f3b43efsm91051495e9.1.2026.10.09.14.40.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 14:40:23 -0700 (PDT)
Message-ID: <0f8c15f3-702f-407f-8c1d-e64627294ba8@googlemail.com>
Date: Fri, 9 Oct 2026 23:40:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.18 000/403] 6.18.56-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261009140952.119038291@linuxfoundation.org>
Content-Language: de-DE
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261009140952.119038291@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 09.10.2026 um 16:06 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.18.56 release.
> There are 403 patches in this series, all will be posted as a response
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
