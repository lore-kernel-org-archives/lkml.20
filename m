Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794674762;
	b=wJUT8+D3jz6BefeKKTBQES8pZxQm8NhPm51D18ie5Mh3YF+bHHnvtPpalrqae5RjCHRV
	 Sn9GapkDaIdQgeAxU17u03Z491Vz4dLQKNYiKglmijgsvNDBGguyakQK5Hx45QdrmlTf1
	 kEc9xfmda6SxikRFgeuccoUB+PhqFSBf4kFZDMyCZ/NX2YSAzwfjeprkMHgb3UghNcLYO
	 P/w6Cujqj6a7QWSlc8BkjzgoY5xXXLWnr2+SajcRHndezqJ095JfZi9Wx9vKyyKFye4qC
	 mkhZNeX/qqSEpspORF4++g/S8phcCNC8kugPh9Jxw54B/nd5/57guPl14Le6guTpCGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=RByEtiTC/lcrF+PYQ/coAaO5YWg4gnthMLJRYovYsjs=;
	b=YSIjncu+tlQwnZZEyDs4rBC9WQXcXXcuVCxIM3/1D92ZIoYTW1qhDVHRGoj74ppiPyuz
	 JwxzdBtbn8cwF3++2HeVf0kNh3f/iWvDqI6+QYe17w+NCrg1lh8kYmtbA5XZ1uJ7Dy+3k
	 zso3BO86hMxiPqUY2PP5STPW/AHz+S44SG2RwFrBW7wa5f/A67HxKROluNXk26SjaTOsQ
	 HQZeYiDitjDolHcqz5n5wGhzKC3McNGCnzh2nCk55zwG80m73h1UrYxfW5nGtScVMLFY0
	 MG9wEto4NpmJCSS9gI8U3s94qrLD8Vr6YS14POcDPURsQEwXobDr2yNpJBldQObIPnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Cbxcdnqy;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C1C606A331
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34C1C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Cbxcdnqy
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso11978285e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794674760; x=1795279560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RByEtiTC/lcrF+PYQ/coAaO5YWg4gnthMLJRYovYsjs=;
        b=Cbxcdnqycu3CSSKd3j9AJ5uG63AY8wYfqmnRP+qdHPUguRQ+2TSevx+U0qieiWUUHE
         DlqEHqG8HOR4PHQVsrasg9AWi+Iy8BGpsfUe0JWkilN3KL7DFNp4OjmQ36B5pVbtegvg
         fDlX2gEMq77gz1N2TgQOxfgTKiVisTDAf+fDYuJD/bNlq6xrCCdCeEW3zGwX6uTHiJxL
         4rsc8jklNG/lcBBqF8rWfP4FLgBe0lHaKvKimdwAsNN5XAswkDW2jbin/kJuNyNePM+H
         Hgo4tzFCs92EVGXq3fDOKWjMMX/cSJSa4f7AyOewXhtYD03TnFoLLK0BzQxvz+YE1qsJ
         x/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794674760; x=1795279560;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RByEtiTC/lcrF+PYQ/coAaO5YWg4gnthMLJRYovYsjs=;
        b=pksBD49uarmL6sBbG4nlhmDZpzNLBOr+AnPZdVgorRXkmyduyZRZX9ATIUtdsSaAw8
         1BuVOYwzEMIYy2waFZt4zsu+D+CjA/QrGmYVvJVbdsH0MNOqN/hwHAacsvKgNtM6oga9
         Bqwro5itlfiA+FeSg6rcSXijwEm6T3tI93rwN/olVVrsnavcufQ1sLmnjVZzQxMrF9DR
         w9eUC6+Wo74/NCptgHNwtENaZkCY6BjZ5JQC09jGu1TeWLNtRMvBDSgf859yKB/XIIwx
         Dy56DbgA414yeFL6onercv3Uca3eer7HrubqMcTfVsSJQbgE6kgWz8cgNoje2OwmUFX/
         1BpQ==
X-Forwarded-Encrypted: i=1; AL+hErGlKa4bjv59zcrn51cozGpuS8C/7cVDKobTSwAgppCKNAHuWFM0f3SvQ1jZ8PoVr4ik4ahP8229bXY/hb0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rybnz7o7A5n2ig69Y9rXl46oK1r+hqKcRmUIH1Kt3CYXAJV0t
	L5+Nd7fXmESudlpbo2yZ+fEiqe9irGRbqmLMlabphxFhIN4smvHo3H0=
X-Gm-Gg: AYBFou0Kj/vn09ddfbCxqPSG8MEvQPMQYq6dqKA26OPVDc4toL7RP4oOhgbi/0R3aGA
	ahSEYgMrnwbanRkEjeH7zWRSSlWOy0XnlOtrt86orwDaIiKEZDVUCATQSRGn29VoXI3ere52luH
	269C+1Q2fa/Gdwj29fbs3hP81MBzJTfaqECO2bzyTUIEEMh1Y/5mK5KBZBRF+fPTGIhtxta+pcc
	2PG/goScZI+hXhP8zpIyHD09sHevDpYOlZxkjGX6ELzdqSJkFHonIC0nkGQbaZGvvoCqQ4kV6GV
	4VEXxcM/0Rymo1cJV89XibnjDLVhapeMLt0gazsUTVNL/S60P587L9IDWfLE0+IVoaqkpMcVgm/
	o0Y3D4Fv8kScouqBCcseJbHtkjIhaYuF8In373Z6dtPxXgY18iWuR0dasxd86TMOmLMVWY2fHF1
	G/4itvl71bRpJ8CGXsyAY9X1MamuGw/XeEVFwMcB741SJm1NFvFgBZ4n/nygliuX2y2uESqq7bD
	n8heEnzWGIUVtVh+t7n1Rglvb3pu0ktf+1XVjmG2kOAHNqm7wQR2eBjBnzlSntgJgAdCop8moQC
	Ua0FfIUeBu7DTrKmKK7IjAnzBMqyfW7hAv1T4T4sRpbSQczf84Y2FrWz++Fvz3HYFLm9gooPQSR
	FEqqZeegrdMF5pRDh6Uw1/MiV3Z4=
X-Received: by 2002:a05:600c:628c:b0:4ba:6d8:dfad with SMTP id 5b1f17b1804b1-4bb55a6b67fmr136565715e9.14.1794674760452;
        Sat, 14 Nov 2026 08:46:00 -0800 (PST)
Received: from [192.168.1.3] (p5b2ac4c4.dip0.t-ipconnect.de. [91.42.196.196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb52bab8bbsm171491635e9.13.2026.11.14.08.45.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 08:46:00 -0800 (PST)
Message-ID: <848521d2-239f-402f-ba0b-3e0bab7dc18f@googlemail.com>
Date: Sat, 14 Nov 2026 17:45:58 +0100
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
Subject: Re: [PATCH 6.12 000/670] 6.12.118-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261113153811.177190860@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261113153811.177190860@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 13.11.2026 um 16:42 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.12.118 release.
> There are 670 patches in this series, all will be posted as a response
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
