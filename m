Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794072469;
	b=2MZaBNWdsfjroz+DCha6LeH5zRrpy/qlPVqxck8wd/TKUK3j9cI8XgVa0JvDYggYKPfi
	 sJf9TenK7QBNcInMxE6fTlL0ynpoVb1BXRfytruPoQuqW+8QzpT6cFNlgtqqBVPEtqmli
	 cIhhVLN8nFIn1SU2XcSetf9/qQJO3MpC0VWkvDAqSWUW5/jCpKkGnJeDamj8XKN7kghBC
	 RPmsTFTvZc2G9I/mLsPazjChAW6C6+SEIVP6ZvfqKKKHevSavDxX06L6IjA81H5Gid477
	 Lgz5SRskNrP+wV+Lh3i+ppFb5sF++Aorp3KKK6CeWLx+o0q6vI4BMHeU6Lh6I2ejFwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794072469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=2owh4YFvS9EUc9o02yTBqgiJn10dXj2haaCLbozm9sU=;
	b=r3yYfBrVYWXin/ks04+OkivuQfp/PPt7vptYu3xd28HhB4j29WkVVTA96B1Q0nn5VJKW
	 E4ZBkVf43ZZA42keDPJq01ZGA0CIQpOyfNrL6sINPK7D2VDnbyfN5mgrb6KxXp8/HF4Cd
	 1J/L8/05gzJqSgYaNpXbdgNHW1fbtp8k0UTOh4QhwLA907gqlDGcQ2v3fbRJGmV0uEl3g
	 /SumDs/3Pm6GOftYYJsFPAkmRdMMn6PnnZHp4MVGnmfcORCR/C9yZ1NxAPyLAM9o38F9L
	 mjCZxlNpwRWtZbhk6XLlbYTqIZS2E8mELMy5EXnt1Rp7WuqJ3h87mWo1z4KNS4JmZfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=aZ7XrS9B;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38587606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 17:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38587606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=aZ7XrS9B
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so15123425e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 09:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794072468; x=1794677268; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2owh4YFvS9EUc9o02yTBqgiJn10dXj2haaCLbozm9sU=;
        b=aZ7XrS9B+HBmRsZSF26/8uIrYZfDi16AVeuc7soBbg9g2mLKRqA6Nq5mC4ZON2Th0Y
         uepR6nsr3pIHeHAoCWVuajymxDhrpucEhe1yIEFwvCvjeoBq4mhh+1YBOAZfJX0EaYwM
         A3JrxkHi3nwD9BeUtjd1xReHpxUf8MjiAG1p4DNF4PX+gRMgVqVL5/q7ubF6qWmXnT5f
         N0m+nKhouTpLHLiFJguf0i1b7YvsHv/4hLSHoDp9iD1G50hZTA1XnWlmA91AygVDU6Mv
         AQ+Bb1PyOmMheO1TQoxukcqQWM/08XgJOK78FUHPyVj4PKgfg4AosfzYDaJVyZrnIUYm
         atTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794072468; x=1794677268;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2owh4YFvS9EUc9o02yTBqgiJn10dXj2haaCLbozm9sU=;
        b=IEUEWO7s8dlAK2zz1wvVaOjSiJoqDvhXZ7uZpcklcS58wmROXqmgvazK09rGhZaQyP
         YIMLPXgydXJQJLND0j/FeCTt5nEycFOtaNlhzIZgpdfahQdgb48xrl7XOnIDOaTIU5Fq
         ZmVAgamnXISTKy0oS1AnfvqUkCV8CSlk5BvdK2/hblFwkxzwcrPr4GcWDypE9bnJ5xug
         MRg7D6UohtAhtXYb9Q8+3fJfVJuEVRgNHsY0r3HTeSOHl0AynGaoyhsCNrslBEOmKQTv
         D7KacF4MA0je7rbNZpLR23CBYzqsXWDv3e6mXW+GvUmO2J+aSdrRWEEzaDrJ3M6enP4C
         YD5w==
X-Forwarded-Encrypted: i=1; AKwUvBwrjbeoUsYSKzR2cqWWjC9cgadDDdRWODZ/rW6sgu15BhRDf/oXaMc70q+u16oRfZjp4LXtYuntl2T1kaU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+w+Dbe1wrwfwgMAQotte1wWKWodgP682MQ9A29cjWJ4OvYZ73
	UjyxB0BAtv+BseX2CioxwchYqcn4rOF70NaV8V68aECvUpppIMvKOrc=
X-Gm-Gg: AYBFou09s4n01YQq1JFuIjrMN17PFhlRXsioQGl7hWxdVZYBQpWaXfr3QDgL/ACNa6V
	yy1GPLc4AKzfDkT2RN11/+FPSTCXXFDXVybpnHG5ELDANrX9Lu+y2WKfVlWVCtKM1aR+EM+7KkL
	CFiVN+XrNPQQDPJkJw5wkxl17BRjmuoAHHmfXktOwJ8yptcUQY+NHWX3Rk+PAnlizVmznV+TaLT
	6OHAMYQGYupg6kjdMc1m+Q9aOW9nU2tu4/UXlLh7OE33Z16ERjWVpatLl6jLNV27G5+7Ggysz9W
	iAAzVyejYqfNVlhaFjEawfhbfjUMMMPzmhlklyxDa4ewYMN++25Y2FgDneARGuaUEB1AImOEsL0
	a+ejxPUPbYF4m0ILIe+rYTVLSSyMWQx3SL+k76zZqId9IjFPEjs10R8pp6Xs75aUuDT0s8CXnle
	4pBy9dddIWoPrIe7Cb7inX2mcZsCh4gsVbKXZ1OBw4JwYKsmRAKJ/McHnkJswUf3Pn9dNaa+JdU
	JAGPo9aOygx00oWeJuzIlIEBbKiCLtSDPthNRYhJWrUk/hBRqIaw9dLphkcYpRCM+KpCaxwEG+M
	ch7VO3ZWIl5BnPm0YxcSjeZCq58QTBsIu04vPWCzlBkylDuiT5p3bOr2VUw0EtZCjJ/lEG/IXxD
	Xje8=
X-Received: by 2002:a05:600c:310f:b0:4b6:bb67:bb9 with SMTP id 5b1f17b1804b1-4b6ded4a3b0mr105329935e9.29.1794072467520;
        Sat, 07 Nov 2026 09:27:47 -0800 (PST)
Received: from [192.168.1.3] (p5b2acf48.dip0.t-ipconnect.de. [91.42.207.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32b46a3sm88407715e9.6.2026.11.07.09.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Nov 2026 09:27:47 -0800 (PST)
Message-ID: <0e21a66d-5f93-40e0-8991-aac8a464b7c4@googlemail.com>
Date: Sat, 7 Nov 2026 18:27:46 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 7.3 0000/1257] 7.3.4-rc1 review
Content-Language: de-DE
To: Ronald Warsow <rwarsow@gmx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261107134939.434104957@linuxfoundation.org>
 <68c2efb8-e54f-40bc-9c36-76c719a590d5@gmx.de>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <68c2efb8-e54f-40bc-9c36-76c719a590d5@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 07.11.2026 um 16:34 schrieb Ronald Warsow:
> Hi
> 
> kernel build / boot test on x86_64 (Intel).
> 
> I need to revert (here)
> 
> 1564da6afd7ce5297ba24f2d1e61d6a79a9ff6db
> 
> 
> otherwise I get:
> 
> In file included from kernel/sched/build_policy.c:71:
> kernel/sched/ext/ext.c: In function ‘check_rq_for_timeouts’:
> kernel/sched/ext/ext.c:3852:41: error: implicit declaration of function ‘scx_exec_sched’; did you mean ‘scx_prog_sched’? 
> [-Wimplicit-function-declaration]
>   3852 |                 struct scx_sched *sch = scx_exec_sched(scx_task_sched(p), cpu_of(rq));
>        |                                         ^~~~~~~~~~~~~~
>        |                                         scx_prog_sched
> kernel/sched/ext/ext.c:3852:41: error: initialization of ‘struct scx_sched *’ from ‘int’ makes pointer from integer 
> without a cast [-Wint-conversion]
> make[4]: *** [scripts/Makefile.build:290: kernel/sched/build_policy.o] Error 1
> make[3]: *** [scripts/Makefile.build:551: kernel/sched] Error 2
> make[2]: *** [scripts/Makefile.build:551: kernel] Error 2
> make[2]: *** Waiting for unfinished jobs....


I do see the same build error on my machine (2-socket Ivy Bridge Xeon E5-2697v2 server), and the same revert helps.


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
