Received: from mail-qv2-f41.google.com (mail-qv2-f41.google.com [74.125.230.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930B34657EA
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790800320; cv=none; b=IxI4rlOBd8qynw5pkCfepZTsNDT4byyrTF0cykP4opzlaOyVjdTPgmmzLnJ7ACHzzJQJ1Xp/qrWI9YYsyiFrzgG+Z8Dle+QTwAbNCwUMCgXqeVv45MwsF4k3XpMGAlqPHY8MS2+NwPPWrZGABh8WSaxVgB+XrvPPqoemLfcYDzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790800320; c=relaxed/simple;
	bh=EKlcz5CBEcnRCHzlR10r/eowVg5c846H0vKVV3ugVE4=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=HclTlNF7agcjMvoGJBGkwWyNc9NKM0SgsOCihEYp0u95IkX54W/ZkuW3M2g7VTFqIsVr3/HcKy5zykFoVV+9sw5xK96jan1nW0AKquUliB4CylsMlkQeWgUzQE2Cyt1j2vtQBeDZ0uvqI8uw3iS+zaRptzoUpZHAIPl4TwMtOzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hq5NM1Wk; arc=none smtp.client-ip=74.125.230.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hq5NM1Wk"
Received: by mail-qv2-f41.google.com with SMTP id 6a1803df08f44-91786d375bbso19197366d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790800317; x=1791405117; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bzhRivw0MBLgjbe/iyV7ysat9gpf94TLhhGWQJh7iRM=;
        b=hq5NM1Wk2w/bG7zm6byUGaOVpF9QApJcIbY7eGKjIy/YAn2jdYlyZj0S40d2S/xZyV
         pCKlIc2ZV5qByiE8SY0Vr62oVgeFUZBEszd4vv5ikh4X6XoK0h4xq++PRsm0W9wLcxQB
         mycS7NRty+K6mibYlSxM2EJBAj492uLwVWWBA9XhDm6VVsFHWdmdz5g6Df5pgcPP7YsW
         5bnnou2YndcfPhT+TlWHa4sa5RaV5zrVV5+mJY30ANyDRFKx5ilemFzCBWVPBB0cjbMs
         fYhnQ5cd3jTGmN55rD+PF6lexGfN6cBz/JqLRp5wJuHEzK4o0dJKRNOCPmgMuSKFTevv
         Tv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790800317; x=1791405117;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bzhRivw0MBLgjbe/iyV7ysat9gpf94TLhhGWQJh7iRM=;
        b=Tia/WMIXQPQPM3mw/Xet3hsFpeCYbIU7KlBKs9XCcsqVBH7mfGNZ6rxvr3nZ/yviih
         GHQFiUnIBKz7+FPr4Xq3YYEk1XiloOMl0GyAFlfsRV/2YrX6H+cfKQhAF4i8sELeomql
         X9HpIW2QFmH7VyPTFyvNMFG0OqOprDRFreZ5b0D5mgOkWlEvqc993vBHhUdhpmj6Got3
         QK9RS0ud65jbcnot71FJGZZhHcv+JH0a+8PJ7t9fdU+bfHT29YcTzWeyprqmyOdZLrQA
         +DTo3CtiGPozBRdnhgtgd+Q6FuYFz8P0kjoWJarSC2PdPO/hVD1TiiEbkFSSG2a+tNsE
         bzxA==
X-Forwarded-Encrypted: i=1; AKwUvBzRk7ej6yQIvwv85a6P+lpp4u0TnNqe+RcWQhxX8QQTpO9ssTCgKydiqtrkvyoWxNO+obriFbTnNDrrCbk=@vger.kernel.org
X-Gm-Message-State: AFuF++nL+BLMQNafI+/yMRWqeOuTrgDbPvF811buSA5EaEky+wcrDOT5
	YHjTD8DwqArd5JDq0KEHTtv0IprgDz0orf2S4+EIrYpkqff2+210a4o=
X-Gm-Gg: AYBFou3grUmumWAkOLWanXVZmgoeDMEGGxtJ5wVSZjdEFu1crTuo/3Eiw3PMaY+s1Kq
	oYkMUidGb2RZD6hb38YQShYQl72evPrg2t3aHSddIyQPbDvuDDqFJWC9F3zGza5jTazyfbcfu2I
	2Pmp041t1z62VKbFowPcCCBe0RZ/z9n6C9QivNOm2ELfeMwB0JrGh2O3M2dCGu4LiKa9z4ZN4pi
	a7Nr/v6mEtXCGTuvAe4ISxhWO9B/oHtrpVuJrbu+PdKqxFSYCUCt6Zp5pYC405gBNLiXv5ngBZx
	6RoTn1hPsLApTZhSNanrudcBekI6zHqmIF9px6exDSNa8xXA/O2HYSCLecYm0vW6058pNPv9JI8
	LvjMtVKAPSSmDe97DY0LmBGtmB/diyVtlusnj0tph7f5sBYelCbJ4n1CDNpG0UhmAyl8JKl6LAw
	QQ06taJhybKOsewJ/t/CIlnCVOdmpXHvHarYhGzYQ6to6fHNsqo1ViL2qoK+oNhEqbMly2ZS6mk
	7bRP/5moDVj2KU20OYXv9szAHg=
X-Received: by 2002:a05:620a:43a9:b0:93c:771e:b672 with SMTP id af79cd13be357-93ca9899d69mr494177385a.54.1790800317375;
        Wed, 30 Sep 2026 13:31:57 -0700 (PDT)
Received: from [120.7.1.23] (135-23-94-154.cpe.pppoe.ca. [135.23.94.154])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cb8826b52sm16187185a.1.2026.09.30.13.31.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 13:31:57 -0700 (PDT)
Subject: Re: [PATCH 5.10 000/595] 5.10.271-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20260930152347.700140858@linuxfoundation.org>
From: Woody Suwalski <terraluna977@gmail.com>
Message-ID: <6eaeba9d-7778-88ec-d5ad-5433bd18d507@gmail.com>
Date: Wed, 30 Sep 2026 16:31:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:140.0) Gecko/20100101
 Firefox/140.0 SeaMonkey/2.53.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260930152347.700140858@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.10.271 release.
> There are 595 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
>
Built a i386 kernel and installed on a 32-bit EeePC.
No new problems noticed.

Tested-by: Woody Suwalski <terraluna977@gmail.com>

