Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7C03783CC
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 20:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788639224; cv=none; b=rzKPJEGXmxMJdlOPEI+KguKjtPA5B9cCRvRVMo82VXVuzjX9QdHaoSBI35kyj4oQPtfnYaLUwqALt5M5B3PJ1tnKd6J+p3b1U434uiuYHd8J7Lz6DsRGd5P/8BavKMElZRPlV/g9LcMRe4hlIs9yKLEXbl7KjyztpD5rKxF1lWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788639224; c=relaxed/simple;
	bh=3PKFXcmHlUz3OfVy3HJ0w8Q/d1ojlG+0EylTJLYM3SI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wlh/5UdKcxzMK9XNIiwBzbvenXpkgvWlCH827pIOiBHf047s4aOKAr9K1j0FyQr0wGjMeER8Psr+gU6ABov8BpM4/GXrf6F5GgpxL/pPxuTcSKWFDwLHqq/60VjncTg/g+7KbModAe0ILja4dP9/he7TKEH/leBBcZvUf6r4L0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=dmdFl6QZ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="dmdFl6QZ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso27403315e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 13:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1788639221; x=1789244021; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AYLQLVPrMZqzYFFCaoEPigRERkkXFvdO1k2M4yUI9oI=;
        b=dmdFl6QZXKDFYW7ZXcLx4SgmtzM9XmrjpVDyhnN3zr2IFJTPBgLnbqNpOGrATEomtI
         7uVhlNU0Y5Ua8ffPbYq/aAMdTLrekF9FDflA8R0zynvovdy6jvTd94AzdiCDIX3+0Aj1
         nei79Vd6st3S1DULfr4GzMTI5kUOMt3DJaVTpV10VBF7iPpCT8Xp4pKukKO80+zs73zH
         VHocThow9yOBBCV6vOZGhLjpzml0V0qV4V/JJnu2ltZkkPYVVgAU3fEOd4ZpSCT91U5W
         z0eWQERO8nEF1rERvsqOTDqnVsM7+Mhku+yajDzAhYLpcxyX5c226LLlpl4oBw7tqZfD
         2KsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788639221; x=1789244021;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AYLQLVPrMZqzYFFCaoEPigRERkkXFvdO1k2M4yUI9oI=;
        b=GYEKFrm0MuHmEzp45FUI++ycLZAiaJdthzx2cMV01X2ZXaJzgsa0rq+I0Z3Bn2zG5j
         1jh2kweAy8+abcMkLBaKndb5oxce1NwbG4l3FCLaZhEj43QSDUxNbHCeHR5iH5+GMeK1
         /W3ZnZ5kL1y0J0jarfHBoKNoBMxk5fyBS6dsiPRVd3xS6o9em28b+j+Y90jwN6K1J3Is
         B9jiaZOpYWd3gVEfM7mLPNkjzdkzNLo4d/sVReHsv1VUj6AFD8vm2LXRzWfLv4yBWK3F
         445y0g2ncZvRQHWIKcNHNoT96uSr+LN6WZOsSbWWsVL/2n774r7o/NSUBjg4JadHhbz7
         YCpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbJvVCI4ujASfaMN+U7kyA7l2QN77/OL9AnFsWLU1LiY+RpJGD8zAqhu3300EXP5IDvsZI+V4ZI1j3vXU=@vger.kernel.org
X-Gm-Message-State: AFuF++mEPZBk5UtO6xZPNPlx1R3L67GIqkMH22OsUIiE81JzJbOEE3uw
	d3eZTGID+5RzqQYO4EpR1drWuS3sMq+1YYjUp7Qb6V1ep3ITsrffp0Y=
X-Gm-Gg: AYBFou0MyWlwKkFLZHh+Cf6Vx78CpXex8To0Y2lWSRKBrmCOY5U0FLsTRrQBspnLljK
	l4EUF1e1QqhVk6sVCrzoz3aj28bnZI1G09yyHmH3iMM0FhHpiiiT2WxEXUDwTPVtYmfV0pcQ/4P
	E69nTAtnsjmuvPkkTRJF1uxIGtETZ24eYqKaFsJinzyIJD54IFGkqr6Z+oL8Hus1SEU+rc1fJNE
	zdZZwYJtmSJzNy81tzybdIe2kJuahjLr+SKdZYTAnxtxNcM3cZOGVtwPiIhkvFEpeFbsiw7xYfz
	tDnBuqBhGh38362ahk2LcpB+kXUU7TTgPTj0n49TSn610HzEq5vWUoitnqPgVqJxixCXwvOfX0i
	mGSroCJJ5MBtjbsYlHQW0d7dueuYgj39dXtFtYlMMvZ1vPFzxAjEHF11w7qPkoIT4q6fQekCkLA
	/4CO+8FV5H1EDCKn5qrJX6Op+u6XEdbeSJNHu6dQIDROrtITqyRVKev0j0gVAewoyl2oYPdQQME
	XQZO0pDvdSrWtZjVXGuF4bAiBX7k43/lOCuKr83
X-Received: by 2002:a05:600c:4684:b0:49c:fc6c:be14 with SMTP id 5b1f17b1804b1-49cfc6cc10bmr112637755e9.26.1788639221125;
        Sat, 05 Sep 2026 13:13:41 -0700 (PDT)
Received: from [192.168.1.3] (p5b2acda4.dip0.t-ipconnect.de. [91.42.205.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6023edsm253975395e9.7.2026.09.05.13.13.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 13:13:40 -0700 (PDT)
Message-ID: <6b05880f-daa4-468c-bf98-389111b2646c@googlemail.com>
Date: Sat, 5 Sep 2026 22:13:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.18 000/551] 6.18.50-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20260905115635.269562615@linuxfoundation.org>
Content-Language: de-DE
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20260905115635.269562615@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 05.09.2026 um 13:58 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.18.50 release.
> There are 551 patches in this series, all will be posted as a response
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
