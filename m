Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12943ED3B4
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787745884; cv=none; b=qujU6IwzZ9aO0hrQ/kfkm1Z3e/vZzDXQYLYvQgUQ3cJnTu9onBfWELR8hlwhr3qCSyFjUwsUQxMWu7TQxqQ8f+vFh4GjK1LLihFYkokytAMOoBQkNTzcoyg6ysc68DGTZ8pLyeoCoBMsfKjc30/Mh4iNFHPGBTz3Bx3ea73CrIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787745884; c=relaxed/simple;
	bh=t8r9fwHDfwrrDslghKcdGeSg+FPh7HR538uqlbJfIIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GwyZ3IbxgJGuAUnBF5KThEcYvRtoNLJ5+1syAMkL6edaz+xXdcXgBjUPQU9ZZCI3vHYPqQyhYh85u/Uk7NUw7OOrzWqbkMwCbNlWQexut+i3G7gVxcfjqnolvckKEf26nsl9yJj+ALAtxL/b8kc96d0qB3PDRMyLNjZ8/HAQbac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=YpB2FP3J; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="YpB2FP3J"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-482c58a8683so656074f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 05:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1787745878; x=1788350678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LUtXgdw64E4AMmrHZa4KMdOAunPgCi0nfhsHNUCmvGQ=;
        b=YpB2FP3JF91g6fn77byCnODIKfo/2oR77boDv066SlwyWWsvrqhAwKxYWCZjlfgm8x
         o1xMvSoEky+bwzx5hXKH2dhpWYwt2ZiVcLXY0jPR8ObzOeI97M7vLCY43CD0f2qUGbwF
         +sE38ojbyHylnkBdNR+0mX0skd/QIbYSsAfrjyk2vUTVDLpTZja4NuY9atpJSSln5Zqw
         swItG9cjpYyIJetqLRrU4ishrPhssAyMZmc0EvibbRvguwP+Sb9AeVhVePCDMN7qU2aK
         NMElSWEsYmm0obldBnhpLsN5ihwUSXAW8G9yqD3ukxUkRBYA226ibPrsJCMsufwmHqZ9
         6h0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787745878; x=1788350678;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LUtXgdw64E4AMmrHZa4KMdOAunPgCi0nfhsHNUCmvGQ=;
        b=ovkf2sunJxURpfx+luUFKk3hTcbVfIoQpxTk+T7uDEj+1EaWWi337mXSnzj/dOaJ20
         c79U7mfkl2HhHEJLQOw5jdJQLGzk+kWYwwXoYxUAWjk/IqWBPhBT3YWLyPQABH8D67uc
         cnUjEgVKvMtI63V9wK5qeflP4zb7aZZpfa/yC1KH2nFrYWugVGJGykjwS1W5NA7js5Qm
         rJcqEdfvopb/87v03X0qkj7WwIVHo4pUlsClTh+qIeuSa/rUC1dKUmPnWCGnM4NnkAMw
         3G4Jq3pWVh7M1EzsPb5TYSPm0RxCe4bTCkmlF9kAEHE+HH3/OUAoM0Be3O73UzpYcpdK
         Ffqw==
X-Forwarded-Encrypted: i=1; AHgh+Rpm4W6eiJvGfNmwx4UqaePa4pNfTO53OSQGAg4ghw8+T9vEv5i2r1abKNgay3rK2mBL3Xwu1MOh5WTasdU=@vger.kernel.org
X-Gm-Message-State: AFuF++k5pZK4N5xxCiCTWK2Hba8Q5IaBQ50GrzEqkazeKQulkPHhgSXL
	A1l9VzeId54QZj0nZegESmJ8YYjHtM9Lfc9VXWQQF/2qVPiGwJEJ6b2ZCef2
X-Gm-Gg: AR+sD10eiFXnRl76EgBZN2IHSu7Opnid4VNPbuhVmvN50GAxjTnrXoZXpG5g9Soni8H
	GUvhlTA2WXBLe0Sivpu4iojlCfTlSK1oarpOWp2w1DTWIu4yi1IKU4XYix7+lrBFQ4U+dGgm32C
	SbfplUpRWdAV2p1ZFFKEDoUcgey+xEuwUmb2fGVYFQo4MjdrEJ+i6vHczNJEQePt5jbdAMtKv38
	nfiCdaJ03dYW1vbN0PjEMM736+HyFbixlEsLxlMtn1B8rRN9mjpFosYNoW7jRKau7vzJieRPsdY
	GeMfRQhztvapHhtuaLi/60YTJYki/2E/hkToGOlT2UwO9OliMtAyeUx9qQ+srv7wAgTULHs1mWl
	mhx5crgUMkJCPIWTkvUAnK33MKTchj8y0ExDqPNfB4M5RjbnehR78RMV4dv7HAZkktgEIURrVev
	uyS/Fk01CAzLgnhDJA6a/xNaWGhtU8rvSsgliYMiBIhojNiNBS/lR522XcQIG5KYvwTHr1FJ2Fh
	7Fthm0hv4GwoQUmlY7PFxUXtfkCfKnSaCm/E4g=
X-Received: by 2002:a17:906:9c8a:b0:c16:3187:997e with SMTP id a640c23a62f3a-c250bb69c32mr689989466b.7.1787745842844;
        Wed, 26 Aug 2026 05:04:02 -0700 (PDT)
Received: from [192.168.1.3] (p5b2ace5e.dip0.t-ipconnect.de. [91.42.206.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250dfd6e6asm350863266b.19.2026.08.26.05.04.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 05:04:02 -0700 (PDT)
Message-ID: <5c014a1c-9139-4b7d-83a7-746b4a7d14a9@googlemail.com>
Date: Wed, 26 Aug 2026 14:04:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.6 00/87] 6.6.154-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20260825132541.813800447@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20260825132541.813800447@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 25.08.2026 um 15:25 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.6.154 release.
> There are 87 patches in this series, all will be posted as a response
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
