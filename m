Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E882374758
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 01:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790817021; cv=none; b=eoi5WgbafyJzo8qQv+wrTc9sBhO9n92yzePlIrJIUvl94QXXHwa/u/NpBIf7h307UbqBjdr/AL3p53K4ht+zU5qZdbAEVrC/S+qK1rIrD7/UtsDArLhuuExhyjOVoGZZPswsuCqJO5XsxZDvEFJC4Qcr9MxpsmNvoX9u7AXrc/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790817021; c=relaxed/simple;
	bh=Tq+EEQZZUSkW/OHULP4X5a3jFtNXvLlkqUIM3wN+i+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QP/hMGsrAHBTDqxflEvAz4xRHbbToaLEC97kIR5qq+9fLtKEFsziasK2WQZNAdEmAErQw1ld8l/y/ghFXXOfabyKLfA/WyZpdg1v+lqBvhJxXsmimeBk6oQ/5ya0ejd1Cg7kqyQzarQdESzrK4XhPI+iih0nnU5mTyNFZ3NY86M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=k6xd6uAN; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="k6xd6uAN"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so38177665e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1790817015; x=1791421815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Hqg7fvezYx0gMAe4vTkP11iGpswB7iKcMQUSEGGhy4=;
        b=k6xd6uAN2j9hAboy+qkp71mKUnYkHa23MOSi8NYL0SrQC9P3OuoiNrhzBo38iyxFDr
         Q5t8uX+EgqWNH+kpAwzIb/oLn3TrM+VlVpcYuLuFNeKBEz7r+XNQGuSl+0aIqndBuaWJ
         phrXRC/WfJABx8wCv8Rksf2G1m0v7m7OrwzxBcBAd7WQueWsnExLzR2ldMI8woc60D+y
         GEBAqHTBChCGu9xb6ClC9D4T5s/5AX8OKsjQP2Zg7e9nZWKGjvMXpFH3XAjbPeopbtiP
         /gioLEM1m0MgF8l/dkve0AfIjzdLHV3wud1mJFmTncqsXxcfr29WAi5k0tU5iqL7L2Kt
         6HMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790817015; x=1791421815;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Hqg7fvezYx0gMAe4vTkP11iGpswB7iKcMQUSEGGhy4=;
        b=tqorG2sf4NCv3VRE081iDVwmaDh2vj0fbeiIwhZffAa9Wa0mqrZpdP/NDbaZ50K7sz
         E6/HnUlEUuc1CiHcCrIs3CwyKxnnvR7JpXCku4Upd3kWCJY3k2Jtnykw15eosEM9qreI
         SxwSWVsfH+qQHAkYDeurgA1ZIoizBKhXyJjzrcw7piEw8eBMdABh5m6N+Ct0uOYufB7P
         pTEx2KTFDmVRSE4JG9ke/LTdbW7OzCtrmUdv4x6Q/7LQH0e+hENJ2TnmLvw01a3IsVTY
         LNKu4t6Ytmya2xt7NzpMzrcK6igdK49lLbpze73pHPCOpAhHImvnxb3/IH/LH0hgwCi+
         zYrA==
X-Forwarded-Encrypted: i=1; AKwUvBzFtJKF5MSykJFf2poRktXp4Hfd5qRBbnUiFgoBkjtnJgJK/SWelz4/1KFhQFWn1amOWNaE+OT/pLhhe+Y=@vger.kernel.org
X-Gm-Message-State: AFuF++n0hfP9pbwglz7F0tFHv7DICEMkqsmB0YJgqx1lYI6kuhifbWd1
	pfKr9R4a7bcL3tTeOM93MkN1kyz4laKD93pjyyawov7HVcfQATC0hVE=
X-Gm-Gg: AYBFou2DjFaehE2sz12D0/FYHE3ofiuejhWSPacdB5N2t50dLTJFo2wcMWsVM0iSKkD
	ImzD+cMSqmVtPeixAOqmAW9SdQBo5a3HsZiqopzPEhqb/s8+NgCyb34ddwRNaJlBNv5H0q4aTqF
	LKsntu8cYuSMuzYFiV4JxMPf5/zjoZ1oV8xoQ5FImGqqzhbu18zz7T5+gywZG1fWUQDLij6pgb2
	5EpvFUNX5M5zQ8k4hVghJ87hy94RTW38AtQJy5eI5y6Nti6GrSw3xz7Z+XlfGhwo21pjWNfLTyS
	Y5eLmzXG8kXAkPfT5PdI4ZZAqPkM3ZTCaFHcuWDOogpBbfPl0mJ8YrgmNvA8qOVN3xd1bydLGO8
	oPk6D8c+UDBabmV6nimBeNyG5z9tHfkxpwlU0AT2Eo95rjoSiX1+atU/5tPf2+PRlMDGt5hfkh3
	w9qPK/qcrFKPXQGf4RrxTh2azFIUDtXFfX1SYGlauvbj3o7E1snKNEI+zDhjQEZ6wHm+7H4jE4b
	iO4t8VnZWq8GNiARP7kaZm7VHv+mLbUXYhFXV64zp7qwLrqSvCDOQpDyy8F
X-Received: by 2002:a05:600c:8b88:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4a01ad98373mr50081855e9.4.1790817015182;
        Wed, 30 Sep 2026 18:10:15 -0700 (PDT)
Received: from [192.168.1.3] (p5b057568.dip0.t-ipconnect.de. [91.5.117.104])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f952931sm26870905e9.13.2026.09.30.18.10.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 18:10:14 -0700 (PDT)
Message-ID: <f7456596-f978-4d75-b949-f61e21f4c798@googlemail.com>
Date: Thu, 1 Oct 2026 03:10:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.18 000/395] 6.18.55-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20260930152340.591469096@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20260930152340.591469096@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 30.09.2026 um 17:24 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.18.55 release.
> There are 395 patches in this series, all will be posted as a response
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
