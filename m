Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792804908;
	b=kcZRZSUV9FQRqGwQMSYD+aqlhMdtAOs4101iDvGTLiq9LN5sFR0lnZq9urzwSAt/1Rhk
	 1i6+2THDGczvdm6/ACaIDYqdm1bprIdSi5DrwGWAhMdmqrgAvMMcLt/xf1v3cSaQOw9Us
	 9ODKbMIFSDVCx1HDlI0ZdHSPz1zbGiKiDBs8ynM4wuYOLxh/V0okAA91HU4+WND2f1gmp
	 Vwq839JW9r3ELJYM/me542CTSrHdr9cazweaYjSU/3MN7kQKEdJ3Uqc9xxDcQkt49jp2b
	 Y73NSE2F6ea//oYGs4rK+xXQxiFIwsFGKbz43USbJbzQtcojU+m+Uz9leECQhFQzGyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792804908;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+1pFIlfxPdgrE17LxWPeou9jlG9PtRn+Bk4wjcL2E4U=;
	b=GUKC3O2N4X2JLI3o/+v2iVIXaPc6mREHBwH2ev1HMuRiMFbw7LK6J78l71Bfarbv9Bp5
	 6NagMF1xXvJzSmD0WX0Zam0rq1YU6kUNw4XVj+E0QjppD+IOCgwm+78ecHAk8PR7AuKnF
	 KEHX4Oh7tMM4Myg8FbMo74BzaazDNonmym6b2hpTNDHXm1FER2xIsM8cd5+LGaqYsptzR
	 Uq8nyOYibf/wM4vi2h2/KFmny9Dvwq0vEXsbhITLUZ0Tp0XllCDvih2uhLKycZh/tiKI+
	 BKXkU6trAgnzr6yEwWHIQoYFiSed1NwkWqwZL+yhLp5+thwxjX/YxZlZGdPmRv0WfUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=oWSGdFib;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A366606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 01:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A366606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=oWSGdFib
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dc202a60eso716127f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1792804907; x=1793409707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+1pFIlfxPdgrE17LxWPeou9jlG9PtRn+Bk4wjcL2E4U=;
        b=oWSGdFib3uUaQyYoDruz8ZbgvJ6ZPVPFpEseRpF5LDMBnKx4Tqix9anmcaTrdQ/Z73
         rr/ybL5tJPla9lQx3l+ONTW2/PZ3fgQtgumhY1OuNuX4/cs/yhFUJe0zUmk33XZUpLfz
         MmT1XJS1FwVGsGmxz4yMGAaNRsG9y2X6vVMpnjV3EvXbtgxibLuFjsZcizch6Edwct6X
         UQE8Ooj5Iyo/N1HlATKPNAAAC5D+9eRIO01k6DiLB9O8gSQDu7QgkakqLxjW8+Yh+1CU
         JQhazLgUa8FxcP5rFEX7xtbpK0iYz/J7NSyGfYp2KKnq2ZUsRVWox85FpUKTyGkSbHgL
         Dzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792804907; x=1793409707;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+1pFIlfxPdgrE17LxWPeou9jlG9PtRn+Bk4wjcL2E4U=;
        b=SEPrUuMq5P/qIvVSrJJcJBLFyn+zj5HPW6HZ1bYBucAB4bgQXJXeGTSJa0Tg2huEYE
         aDFthmPVXe845mBnv1LkFPGmGulIavIAWwz3vRNZlrvFiya3eqATri6OddmSBNk4H6H/
         GhMNJsU+QFtRlaGnBhvVm8W8VgopZ+FarQ8i7FAvCY+Uh/GIJPXT2jMQrdP1lvrD687H
         GTD+GKD8Wq063CbYKtHhsdkFQbkWXXdJxGAo8EnUsbxVBm0l+E2n7IJXK0si15+h3H4i
         xIYcG423Vw0+M5Ykf7xflyLWdp5UaYtWt6KDGNBGbR2cJIOPAdnaqDxxv13wVQaOP7UX
         qSng==
X-Forwarded-Encrypted: i=1; AKwUvBy6ndWlQ8UpB+rYvFCAdQG1W242MNOjXrFI8J9fT1oUMLUBSlsQyQvecdnodZ0gWH7djr9azC8FEVJZ3Vk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTPB4aYZehqVDxnMqttOeUhNGLNVwf++YTTwdnuxbEwZ54dAbp
	tIv5x7W9esit/GDoHX17m7IB4OgVYNA5AZkWOoQENnDd7D88XnOHAoI=
X-Gm-Gg: AYBFou1UD6pQsqe0XsZukZ4zJG9iCFVfHID2xAkyUWb5F/Z47Rq5f3Rm2EyGllelw67
	yfd2zrZn0smt8aOAX98D+QAKSvZP/jf6Nd7ZDvUh+fKhfVdvG+tq140zxKMausoYstCUlRS9Yc6
	gTArhGWeuHLfSaTsDP5XHFuZT6kgY5akEcZ9g25xdm8b4w76yq9qCK2Nz9Z1xUdlwpiTlnpgJCe
	zhvocvxe+OpoNDOUYN9Ad50fHuGJ5nPttqfLj3IX+pGODY2/6AwEuDNSt3JfcIkfNZgyXGeF3gn
	XxgFBJnweHDxLYMh2S0QE5BYWImWh47lPUKiyp2byjCDgNEiTmp75HOR2qEn/0+zOGvgEQouTdH
	Oi4fXU4VqJljxeXrGQwpchKcrok/Lng0TIUFV7wOkm6aikF6kpFgPmbUUcE7CuYqplYZC6/ZQWZ
	8rY3rgERtqKUl2eIAlNhWwKNBE5lMvBbH/zTNWEp49WCyqElg+KhByTtG5CH39hLgMvoxZAKTbj
	W8qgPrhDYT9KKjOJ/ZT6JYBC8eHJEVkWFIwjLknSUua5B1H6Len8RjJaujQh5pEGediNKw1pMHa
	50kQAmSPlRlhGzI3VuI9yC2pXkgBfoj6
X-Received: by 2002:a05:6000:2990:20b0:48e:2bf4:e7f1 with SMTP id ffacd0b85a97d-48e3eb924c5mr625887f8f.39.1792804906661;
        Fri, 23 Oct 2026 18:21:46 -0700 (PDT)
Received: from [192.168.1.3] (p5b2ac6b7.dip0.t-ipconnect.de. [91.42.198.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4d8dsm1343707f8f.36.2026.10.23.18.21.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 18:21:46 -0700 (PDT)
Message-ID: <bd58565b-d6b8-4736-a745-bcac9ac89e0e@googlemail.com>
Date: Sat, 24 Oct 2026 03:21:37 +0200
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
Subject: Re: [PATCH 7.2 000/242] 7.2.13-rc1 review
To: "Barry K. Nathan" <barryn@pobox.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Salvatore Bonaccorso <carnil@debian.org>, Pavel Machek <pavel@nabladev.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "stable # v4 . 9+" <stable@vger.kernel.org>
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261023163713.816071858@linuxfoundation.org>
 <atvHKoRHHjKV4l8A@duo.ucw.cz> <atvS68GhCvmAphrQ@eldamar.lan>
 <7540e723-054e-43a2-859d-616010fc7bea@gmail.com>
 <d2810142-fd45-485d-b325-f6d494690747@pobox.com>
Content-Language: de-DE
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <d2810142-fd45-485d-b325-f6d494690747@pobox.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 24.10.2026 um 01:42 schrieb Barry K. Nathan:
> On 10/23/26 3:44 PM, Florian Fainelli wrote:
>> Same here as well, bisected down to: a0c935bd1f76 ("fs: add umh argument to struct kernel_clone_args"), it looks like 
>> we need to cherry-pick 14adbd5341aa ("fs: stop sharing fs_struct between init_task and pid 1"), with that I can boot a 
>> kernel.
> 
> I'm experiencing the same problem as everyone else on 7.2.13-rc1, and
> I can confirm that cherry-picking 14adbd5341aa fixes booting for me too
> (tested on both amd64 and arm64).

I see the same boot failure on my 2-socket Ivy Bridge Xeon E5-2697v2 server, and I confirm that applying 14adbd5341aa 
("fs: stop sharing fs_struct between init_task and pid 1") on top of 7.2.13-rc1 fixes the issue for me, too.

The kernel then boots and everything seems to work normal.

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
