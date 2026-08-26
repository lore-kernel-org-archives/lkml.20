Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD413B5846
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 19:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787772836; cv=none; b=W/DHpqQbd1dvmCDUEBCtBU/37qym16sDOfVIThT+EFdHil9G4iQFkAIGg9+sK9NnNzL3C1P2XOms0OydBFxvk1QaAiVd3pdAI/LYgxlMPmmEJx1AUuAAwXK1hvVTZVVfz50F1aiJm8eYVmrNdofRI9QuZoSXUBQZK+mR6DkQelg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787772836; c=relaxed/simple;
	bh=5OoHPncp9QD6PL7OJKrlnuCelFdwbO5jF1abK4OZpKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LWB5Mq2AjKQdGQVm2R0z8d44saQ7rHKwEANIWdHnadO6Q3kZ7a6v6GMzzFgsJx0QvITDAHuQrOKj4WkjpkQ6BiQDwd603P7MiQWP4STUQqG34cfEm0qL/UTiDtHp2+4p8MiM8UfjNbLtvO0sgkOWd5tomUNQkoQFDvLzplG0D5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Vz9Qlq1L; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Vz9Qlq1L"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso2158523a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1787772824; x=1788377624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u+83bvx92ZvGFRFIAdgfKyFZQ/ks4CIryMAh2oO7ljc=;
        b=Vz9Qlq1L+EsVYYP1MgMhYEADMEJGBcHVeH8M0dQnI2amK1zZU3mge9WcDAc7ZQreIx
         L2kABrXNoXWyaXmrjQgBrS2Oml6thhDNECdDBuFlkemD9ZCRlGtgB4He3Gk9WtN64s9n
         vevV9NBGpPE2UYU7z+Zcl53d3bWbmDfakbZknQ0uoyvzsbPYaiYMDM7vyKGDnE99Ec8p
         hR6ZApJrhI1FICd3RnnlEYEMD28QchmPUmC1esuSsYBRkaUcOTmdZSa6DksSbiOcmYgB
         O0xPwMbkUjkLKpZRfjXlg6BFbENxwLxE7hulIGEzRnnORv0KC2uGL5saicZQIdBz6MgK
         aqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787772824; x=1788377624;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u+83bvx92ZvGFRFIAdgfKyFZQ/ks4CIryMAh2oO7ljc=;
        b=GtemlADLg+5ipSRfbN0GlURl2LadmOEJwEQO8bezhSPY7xQyVO1mDS7XZTh4UnhykQ
         RVAncj6ZYfL6pZXoGArBmzfamh+ai7pSjmHMDjKpl5IaKm6tejD2vv9/SYyYP/JTYtlL
         6RPnpd/QEzTGKSeby+0xgGTCy3901HhTiX37jhYZFL3DQjEKVavkfI4+1zG67HBgDEun
         dsNLq2CgnptftVrZKfNAv3TAFsn8sYRCO//kekSyQcVZz5fzakoT5Mysnli56tN7eFKH
         K5zT5GMQHqvMXxRr9Js513nc3mMSDfqlR3ix+oAAqsQlXUFebKbUCm1NudBrOdl0LS8G
         CM+Q==
X-Forwarded-Encrypted: i=1; AHgh+RoEEcDv1Dqj1ja1KM7MvAkcA0n26JwLvOW1siy/P0pVqbVYj6zmTxXb8WNkIBO60pFlrc6h5q9FjkVeCJg=@vger.kernel.org
X-Gm-Message-State: AFuF++krWg4HFeWSdn4Iks2SY04dU1WVGwL/pEldlAaLX6cuUr0K1sdC
	UQefl/QCuN3rwCsbISYrwNEP/Yba/uBU+Ez2neCj6Qq5pxebux+QNM8=
X-Gm-Gg: AR+sD11X5l71AM/FAtQ61b8FUDX5qwffFevPaxV1L1Cw/kxR5H0UDcxeF61WrF3VJif
	4w1/dH8e8uKm26mldU20K50Z/+RJDHiyMYK9e831AJ5GW65IQMWYUpD6UQKyhL2uC80wZijKClw
	fqEMKOAuMZYT2zUWlYHH6+BalA06tY7UDL+i8bgsIpk1DBDdmZUTEoA+A8g4Q4g/XY058y3Oq6W
	D0ihCqT3NEBI0kfGmrDQmXaMY8xPWmd7KoxW63rMPs4U7lbh9252W7ejLL5a4dUhjfNmny+xpUU
	mIddmDksnFLHDhCbI3f+hkDCWtPhWJqv5O6hYI0tJeUtx5m358fUDJyYGYfk+1td6pcg0G/bYkE
	R9XK5aiT7hS4jVsIGdf1kO5bdgvEyETx/QkTE4AJn2VcCGNxC2SXuCOkhhPk44UezvLdKy1P3Gu
	Uw4wZLK1kzyPM/cpWtYjNjpWW6vnQkWOpw2RFIk54w6wWAaec8MyRFZ00uvKzJFYkSRwyl4oEsw
	0XgP8URZPpcADShKDbPcUT3PA1HyQS0aywF9Fg=
X-Received: by 2002:a17:907:84e:b0:c24:c24f:e176 with SMTP id a640c23a62f3a-c250bc30e7fmr984052566b.15.1787772823754;
        Wed, 26 Aug 2026 12:33:43 -0700 (PDT)
Received: from [192.168.1.3] (p5b2ace5e.dip0.t-ipconnect.de. [91.42.206.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ae4dsm842539766b.39.2026.08.26.12.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 12:33:43 -0700 (PDT)
Message-ID: <2ed27071-4636-44af-9b7d-bed4d5035732@googlemail.com>
Date: Wed, 26 Aug 2026 21:33:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 7.2 00/82] 7.2.1-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20260825132541.560541185@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20260825132541.560541185@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 25.08.2026 um 15:24 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 7.2.1 release.
> There are 82 patches in this series, all will be posted as a response
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
