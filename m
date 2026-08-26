Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C153FBB5A
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787759757; cv=none; b=P/RN7hK+ZszJ2TeDpjZFKK3qLrPX6FyiQKOaNyrgruFOUdMSxAZQ9SowjjI9M511NOzrJt0+PrmnDeZ9fu8ZpcS/VS549zsUxr/ZnFL+ihKflVV3gKJqlLMO5iv3LBCQ6Sd9bRxdQ7lfHbX3CaS4VQ+ztwbRUd1BMNEmZQ1YJJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787759757; c=relaxed/simple;
	bh=9oaiX63GtUT1PIJRby/zgJFxpdh3yK9f51Y3hyqry+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RKOjyM3Bp9VO8onXiI7gCkdUDTHTKXKAPU0VmT6kl0ZsGUgIEqFHdd/ic0SZoZ1/JTG1XPgLept5VRexevvdTSZNTN7OnS2ksQZgRYDdFhbOrePdW5jHio76CynJ+SlEMlwO5Y2+uMPtJuBGDUoeXZU3k4DNFijwp/3av4IUY9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=ShwSFVqv; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ShwSFVqv"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c15e2dab83eso173473666b.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 08:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1787759754; x=1788364554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pDADV2/or4TSZWEIXH4l4CffO3MwLk2ZaPPDWt6sblI=;
        b=ShwSFVqvH4P8qCWLos9cmxyCwIWOASjNxR6l0BoWaRuPMYD9lw+3c80d+2NBoB2sj+
         MWcgjqWLn1wXdx+bPcX4FGd9NVOZSMKPUgHL756SAVcXOkp+caW8dGCMuxTkq8u1p4mj
         FCwTZxV8htQiUVZAwu/0PHBUvZhvrFm5OC5qCtfrKovJzwKlhkh+z9UEkoj9klaMH6kQ
         11AusgyLTqkLfJD74lWSMTF13X619VjELI+lcL3lbfGCHgOy3XFP6L08XbEVJn2W+A6K
         GHLgz7Gmf06GC7SBKLvbwIJ2GfDHUaGFgbG8ef7Gfo8aIhbusKhBFI6zlveKTNDIQ5jC
         hUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787759754; x=1788364554;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pDADV2/or4TSZWEIXH4l4CffO3MwLk2ZaPPDWt6sblI=;
        b=pVEMQK13ejrdhJ0sY44SRaNIkzgWF5PScXBkDac6DfJcmrf5Am+4eyiCxsH9DCuQVM
         LzpNHdEIxyNICmo6J4KcyMKZ98JkHyJD79dQAaldqUX18VBYHvh7SQfzzfbU2n/RC8mq
         NlNrAj0f+Gbnth2AdOWSVBszhjaHgRSvH3rZvAKcwNbdDqKMFEEXwCGSIMl57wrF6iUu
         9Abp4gFBsP4U1nMN8CTu+SGH3GFYKNtjhLtpO8pNBhRDHAcH4t2Vyb6YF5B8W5qTO5AV
         xZ90Snaxs2aQI2ZPozhIOGer0QHt0KZ5FASiuTPbWhypBRTc1LMyAyN0soAPaxUHGdG0
         46vg==
X-Forwarded-Encrypted: i=1; AHgh+RoumWZMl0ayDazWGxKIB8vWLJcYAuqOxMWGHZLojYmpM5l2thp/JOEsouRiFl1m3X3MVp2HgFEoA3uN8Lg=@vger.kernel.org
X-Gm-Message-State: AFuF++lFdWnIN+vyyCPGbkdPBJFVRj+Qx0UrNxioIwHd0e58osT2XLDb
	krcUZoHdn+OIVjtcvyFhsjK8j8/MRkNvWNfjRM8B0YhlWGBEuG5G8Ok=
X-Gm-Gg: AR+sD11Q+pIh7IKj/zNtYxTyMAbhCqkz8irlKGHtD0ccO6Wzfi9PptDC1Ju4V7tgRyA
	/syfcGX/CtPkZBaOywvTqXL7LpALLuz9RAZ5b19Q/OkUE5RyYVSLcDGAItdctQocuIpH+fOZdjM
	ZI0Tgko/BpzqjYorDp3ddTiN9KGn2TIOTRih6UCGl+/Yk3lnfyUmqXeWvBIT0IMlGLWtdL3aGf8
	K24IbWsieDHxumeGidXZov7aFQUI2B7rjwnLdE1MgG+3R3mCjIs66m7u/DLln7rtgz9F9mfV6Ft
	/qa5o5yE/TT2Z2NnVQe7EMUON3YWQ05Brrvi9cDC3UdPjvjio3oZ9PhGhRqZzpSwnFlLNhJaq+j
	+N7tp2+j4nt4T2PSb5Wdh+0OOrC2Jh13284lqW28E5s+2yOwgiq5lDpD0F58mawyIxcBd1H9jhZ
	whMtA5kpN1kCRYK7xj8ycDHpGHxu04CJwOFBAIIshcLHtmGektjaHTZmcJCFcfD+NwzzbRvNJLe
	sEm4Pmy1XN/35SRbZdqYhwnM6oNKVVay8MFXI0=
X-Received: by 2002:a17:906:fd88:b0:c25:437:3dcf with SMTP id a640c23a62f3a-c250c3c07fcmr998270766b.21.1787759753471;
        Wed, 26 Aug 2026 08:55:53 -0700 (PDT)
Received: from [192.168.1.3] (p5b2ace5e.dip0.t-ipconnect.de. [91.42.206.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d62easm572120366b.6.2026.08.26.08.55.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 08:55:53 -0700 (PDT)
Message-ID: <1e8ce437-3f87-4963-8f36-ed629bb9a984@googlemail.com>
Date: Wed, 26 Aug 2026 17:55:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 7.1 000/101] 7.1.11-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20260825132541.986300899@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20260825132541.986300899@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 25.08.2026 um 15:24 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 7.1.11 release.
> There are 101 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.

Builds, boots and works on my 2-socket Ivy Bridge Xeon E5-2697 v2 server. No dmesg oddities or regressions found.

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
