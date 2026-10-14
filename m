Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95F2434999
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792006476; cv=none; b=DW5iUvPR6//l92xrZ8ihiCIm8eDHwm1OQZo69m/j1n9op2de+M74/1uZJ3GYlUt3w9m/5bx/jwPCMFpi4j1DbZJDyjw+MqcyXBf1GsEk3hShBhLMzpWESL4v4tNEzMyzq1DcBOC+D/6YJqxiB3LztuM8tFlR+U0O2rOnGtm/qg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792006476; c=relaxed/simple;
	bh=MOW6D0kMBn3vCsCufgeAMRP4i0amK/GMfVl/UCveKu4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MWyJUbsXla9Gv3s+ra+yie2n+EccEEl33UVJmj68yOaQIRi7RTeK7NRc31BCwEMsBMgRediEduCDrzX2tg85eCAyFrxNKoSWW8y5nUNLtTSrmhlh1atN7AlDEIRcVRjM4c0EAw4XLdsuYQ3qKW/aYKCmYoWqJxBMXy9boPBShHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=EbeEMR0K; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="EbeEMR0K"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a061a13884so38436045e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1792006473; x=1792611273; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NU8LV9dpKx/X09ybSNY/HI7ZWl3/GON7UI3V5fKSxxQ=;
        b=EbeEMR0KkvZ1EGdVXA20XmAma570taEXmEGCuPp5F1N7HNyGe19nd6xDBFOwH6G2cN
         S1Cm6gI+DA+m98fPw70Q2CfOnhAr/HTcEuWDn1JojJmX+aPtG0oytaCHsFFwJmowEhKy
         raOgI75lyxVxTNaohH1PhQdhd+hnbvQTYJPnbJxO/e50dBbS39ElfUDETNwrItKXzS/w
         Eduv3hOLGx//pEtuBP/cA0yyI1Qfuy1ULxYaNuyTEZG8b6oVPRTDjW/2r/o8eeqhSlvc
         xh7xpZSppTYeIf6/jNO7OcXhQIoIKQLAPIgPuoo48d3sUxSe76ZwYmv/lZZ4uKNLOsZM
         xyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792006473; x=1792611273;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NU8LV9dpKx/X09ybSNY/HI7ZWl3/GON7UI3V5fKSxxQ=;
        b=fYQTF1JPQ6TZHQiAvUqvP0F5MiqScsTXNdHluf4ETfSckiuczL/GJ2IUxEEz/P5lkA
         FRqicIJjaLCnJsvhyndqPuYsCx9OwRjpBRzTjQzC21RWFYznMoq2muF4G8LabuKbe/W7
         CPG9XosjvTlqU5AhStvu3ANT1lRjM6dmlBLCAYVqOts5XhvwiywMBkmFZMn7Myp4JnPv
         GqNklPxRJlBuSpvpopcXUTiD8eJTb1vJ++5O8YXQAQ0XemzhRCPrsJzNKP353xgFEQm7
         1oJnbXyZdb5JmRH6CtoD10F16CxIs9FmoB4FkgvoNBdB7KG5/O5xTdXi85xEgcMNPe4E
         XDlA==
X-Forwarded-Encrypted: i=1; AKwUvBwzwX5+HJuyCdLlgXufWQvfWt4kfCAD4fgWd0PgQ+/RGmFsssDiY0xmEjR9mZfEuSz2rJ5NZezm11FvYEs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9vOwSbrqr+30+NEApQKYcdlXA9TWVaRzAFmaLcSsvbIvNJKdT
	4WrUw16BEXHBTlzuqvJTVHMfndTmzwnrwRAONwtHaVZyPQgI+DSSzI4=
X-Gm-Gg: AYBFou158Wisy+VpMmgnfoSf7MymvgnJgPXBwVlffT63zqIVRXopWJirEHzAmlJuFYe
	xV1t97R+ySvTlR8UlUKFus12GwvSdZwhmovzBSrCStDNaihplbDzCErmrA2+eZiTklAbbkVPPJz
	luj/vHwb1HnC4XSnnxlXupbTea7P0I9T3kqgMLWVM7KLzcyeUPVqr3rfI9KVi0u83dSw7hx6jke
	ytzLPMrPaZBqgjwxobgIoXuzEZsT2wZKD5h/y4eUfWgzw3LO7xdO0KR1Sld2WHAgPJhN3jkqPbB
	eM9TMoO6VOYF2rM2Q3+/EP99gkW/ipVW1D7J5nOhmTRPfxsNh0jSA777C2H1A5FlYALSDwvsBRS
	HXYn+FYRRhZr1H/ofcoeUjwdaMY7jbdQVsrgj0xFILpKTdO7rYr6S7GyTsFvHw8IW8tfUbrUbaG
	jzo2u3U3jROeiMZop6Vw+SMmjsTvEqn7jdotS9fdEVEe6YL/CwMUVOlcjXcWA0kvMGFLX56MhIH
	uQgv2bkGnt+DGlcfLiBJnz8D+uhgtqV/+vbd7ti/ne1lCCw3/Q=
X-Received: by 2002:a05:600c:6208:b0:4a1:698d:3042 with SMTP id 5b1f17b1804b1-4a18e493143mr311724465e9.6.1792006472931;
        Wed, 14 Oct 2026 12:34:32 -0700 (PDT)
Received: from [192.168.1.3] (p5b2acf7e.dip0.t-ipconnect.de. [91.42.207.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd66c5e6sm9984825e9.2.2026.10.14.12.34.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 12:34:32 -0700 (PDT)
Message-ID: <628066be-fc84-492c-8b03-1aedaefad4ca@googlemail.com>
Date: Wed, 14 Oct 2026 21:34:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.18 000/632] 6.18.57-rc2 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <20261014123820.008483134@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261014123820.008483134@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Greg,

Am 14.10.2026 um 14:50 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.18.57 release.
> There are 632 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.

Builds, boots and works on my 2-socket Ivy Bridge Xeon E5-2697v2 server.

However, I do see the same warning message again that we already had in
6.18.52-rc1, and where you finally dropped the patch causing it.

[   83.881266] Driver 'ses' needs updating - please use bus_type methods

That patch was "scsi: core: sysfs: Make use of bus callbacks", and it is now in here again?! Was this intended?
Please see https://lore.kernel.org/stable/2026091451-gauging-grumbly-41dc@gregkh/

I guess it is not a big deal though...

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
