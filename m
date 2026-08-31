Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EF5381B1A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788210093; cv=none; b=jxKOKqd1WTDtY3A9WHVNgFKlJZJb0Pn78NBLLiZdYTyRf5JTpjf5S+m/Bmu/fmRYc3IQpf+jQVa7MFEX6W0uMYBWib4rxXH6unENjP7UEF95qfsqiUnoulGbDVytZfNMX1pRpAuWMMl+kEJFLdNfQYOg8BAgy8xCNPSM1BNaPb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788210093; c=relaxed/simple;
	bh=pE+8eFdRKh1hGGyR4Z+bhB2cCRSgLo/w1hS3iEaFlJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uvEU6NoFDcrRlaTBJrGLpmJuNc5n1GVSgY//ORixCMxYcAE7eUz9Q1bOQyM7tlRRa6SpyJQbq9L885R3jbN1CTvvEeoe8hxduWW8CNNX531Pk3QL6+kURV8M1YMXoMG9TyJa3mCXEbztvwZU4YMo8hJvluiR8owEEfw36Rdwor8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=FGTdeU20; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="FGTdeU20"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47de0093c42so225870f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1788210090; x=1788814890; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T16UHF6O50SV9JqJ2L46KlCjGiQzlMBW+cyH7AwVLTc=;
        b=FGTdeU2021I/13KuWB/bs6SBNPDulLPcst9tCt0x4grsho00cAsY6ZZfrVnCuIItPq
         vM1/n4G2SIeEWJ8zbtd0CIvvDX/6WdSqmKy6/JUJUeXyMxHmlH9EJlBuONJK5QIiimyc
         YEBOMiZlDGKg8xTzTQIDCFKBmrXn8DTWzHRKRhMdsV7k3WRxNvvHne4+RP5POXD68ztn
         nLXzMIjl6uig3cPrInzAOWGYy3Ko+6jdk48l8NJoXr00u6apF4Cmklupk96hJknvlJ4Z
         /xKwnwO3xzvgKunIYD/jknGHXy0Hxz/nIj5VFPbLgc2sZyHz/XSVi1S5jnh+RTDa5ojR
         z5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788210090; x=1788814890;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T16UHF6O50SV9JqJ2L46KlCjGiQzlMBW+cyH7AwVLTc=;
        b=sOTLjt9fZ1ekdU5HV0HLMNjldK/YC9ezs3uRRg11MPHe5JvH9JHpFnXJ9I/g675gBB
         0Ikp87jSk5bhxSt16vy1q4YrpuVGHO3UoI2ERY5Enl7XKDKfMG4ZAUHwp3FC8Rg2lmPb
         YD5xvHJ09dpGl7QGe/ElgW/QryF3B6wHOsjc+Pc9imhdWsXBng37HdQS7jBYVmTLOMOx
         jrR7UKwAYDA6eFOtSjQYdZhiGO9ipXLzeDiZRwewHxHr3aNeUjbxeiV9gxA1Pxc0YvH4
         E1xKns6oKcFYFLnHWnHDeBR7vfYa5zmWPV+vpn3afmWSKAFAjfVmCOcoE/RrFRk+yQlN
         U90Q==
X-Forwarded-Encrypted: i=1; AHgh+RrxBG1BRc2tQKB1QwWNEqekGpoYxCvuJ6mur1znERVyfDSmQa44vPEHWsb+QfFYT510pTZYgekEzBrXG9I=@vger.kernel.org
X-Gm-Message-State: AFuF++keZknkjs4k3mbvy2VV9wWEMv8nc5yr0Iepyo12geJ4UFTcVDmI
	vdAcDHZJXnLl+aFboeWxNNdntqMsqRHc7ZHwilxIg7xTI7797ZPZshI=
X-Gm-Gg: AR+sD108k2BnLWUKBDWO+lKbx1ss1JfRAmo4VPT00AtJHjEbr7Ge5436VtuOd6EzZEx
	hdsIF06TYHKrRHmYEeENMgQ5IQAS3AGBoqHjYDFMWM/8s2qUPzdM+SSNL5IoOmP8RO0k4DCpiwf
	YZqgsAWYMOU4bbr+SPRmnY1AAi9SVd49TktrfeFhn7iqhOjDAfMXouCjaTnBIW8FQ56L35FCrmB
	hVVy4sAW2jownNWXQ8v8wB5WZgUkNcsCzhKfrLdTrKcKGDQbzFdFAbHW1Roh1wAdD8Z+nbKjaJP
	U5n3qSngjKS2xI9jEVwgCVB9xekZeDJsW8sxX+ckOqaylBnwlHgvEy2k9JfV58WW5RnT7XiSi4r
	4IqrzKxzfJkH+sZWFo+Pu+5ZL18w1aHsbljCcxsrO5UmnKfhylS6Z7YYPB1S0tZXP0RnjhD3SPc
	jFJ08C1+vCvKmGwWerFpeVOnPfLDgw/Nlz/goxNZM8DMh1TFiSWDfdhyWi07DFIsGHK6kMxVrMR
	W5p2xduXoHxRKrVA6/XsC/Sh2Whs81kS+cVnmI=
X-Received: by 2002:a05:600c:5490:b0:49c:cf18:494e with SMTP id 5b1f17b1804b1-49ccf18498emr290412295e9.12.1788210089521;
        Mon, 31 Aug 2026 14:01:29 -0700 (PDT)
Received: from [192.168.1.3] (p5b057bfe.dip0.t-ipconnect.de. [91.5.123.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49c5a903eebsm196381175e9.4.2026.08.31.14.01.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 14:01:29 -0700 (PDT)
Message-ID: <22743da4-c97a-4e89-a43a-31ef43bd576f@googlemail.com>
Date: Mon, 31 Aug 2026 23:01:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.6 00/91] 6.6.156-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20260831133359.468089036@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20260831133359.468089036@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 31.08.2026 um 15:33 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.6.156 release.
> There are 91 patches in this series, all will be posted as a response
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
