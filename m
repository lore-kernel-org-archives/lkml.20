Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793365084;
	b=TgCL1aBybH9Yxx9jfUnS25pImWwtWBvnMCZx4lnqKJq3JSs+p0B8RAd3d2XISiIkDqt+
	 5LdPtOHFBJSZz4+rUF19CQ5e2AFEXKIa6WJJBL7SKFvIfqa2tlEv0B5+bFDtBVY7aTbOM
	 kOZozE2EQ0Bd2yQZRnEzBS7Mp61IAY+jT7j5quS5J+ixOrnwb4cfHS+LZPcv/U86Cn3JV
	 dWj49joL+VnqIk3KprNCt2mAlROwQfgDKSIe/uTB2Z6nFWvv/4ThrXofLCpS1rSSzRWag
	 XO6nPI9VQWGiVS2I5MdgWA956oPd9kYAmQ8qfN1OvD2+LDI+Ysi3n6SrAxwWiVR+neg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793365084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LpHGJG4BEsUziEetvXn6JA6Aaleh7lKdquZ/MLf5ANY=;
	b=OQl+Gvz+42XCMaF0OJKQTwv+kY5bMWFJcZFqjkOqYofOI6rEgN79E9+gMZNKuOUgOniG
	 SeeXxlfGWvYlOW+f1QwdOX2ajiLgo9I5cbqu2PxY1HPnnqR2WzheC2wGsivfqxIbt40BB
	 4fvD2rOhCFmFmsb2zQ8JSOAB0lVRv8KH+qlllV5i8eibakqbKYLDsf/O6tTFCJb9lnL/i
	 rrJQpbpHI+1xGNJLEf20v1v+mbJNgr9oRCGcA0OVVoEP2shyRnDwpO6jrp2FYr7MIPtTo
	 nrKK3HjO6fjN8DCHLQ8uiG61uEqZ6mx2q7QmNgJxEwGlJm89afIS4dIWEJed9Sy4WCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Qz334WFk;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42314606A324
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42314606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Qz334WFk
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso5572895e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793365083; x=1793969883; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LpHGJG4BEsUziEetvXn6JA6Aaleh7lKdquZ/MLf5ANY=;
        b=Qz334WFkgLIZsypknNzqsiXv24AnHflDVmpRVjVDwjHACZ5barjISGPcth5IUIotkE
         EhSxraKuiHCHdKLJY7P2/KsD1W7H0NAiWWsLfgwK1yF9cyy1V09pFNDZBFuPvIOHySnp
         agtxsfqmc+GoPDrIv3/r7/F1JUp3KoeuYv1Xvb5z3k9D0816ugXOoZsO8KvLZz0OzjSr
         sTNEJV/1cRMWs1uQyqVY0wRyooeaW17BUbF9dMsGp/r//F9etA6cKQ+NozTI9UQCDF7S
         Bge7auJdEeGdlU5UGRVe0AixqLbtQ7XFOW8mDs9XKGnsVVFnIGLYr0iJn1pZLbCbiX3T
         1JdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793365083; x=1793969883;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpHGJG4BEsUziEetvXn6JA6Aaleh7lKdquZ/MLf5ANY=;
        b=xcj/qufKz6Gziq6eSknuTSbOcPtbI6DTBTTUl/r6XSVatQug3N0DprcsihYr229yAL
         RUHt5HpGLEM+xwnwbNMlPqWAvtsuJ4DZWE5RarJ7t91mRhngBdDQv30zwJMYhHoGU235
         UzLSCyiMlrnp1F8AWUgXt1AGSD4W8DOyUE03F8PdhWV0ci5OwlSmIQkgBXQMc9NBHURW
         yqjYYO+llQPNOaYndhVBMeTuw4us0n1zUpkTeweEyMQwEB6JjgWzyjvFAKUzW82JOYK1
         XpWaRcInIGIv5t4kcCA8VhxCIMbTjXaT4TW0pSg8ek88cd3AfrxJEwN91DbM5ZbzEy+o
         P71A==
X-Forwarded-Encrypted: i=1; AKwUvBw5HWfhVM5+7FO6LoYzowexfAqw1zH1hLjMJy6n20QMyVV+zCl18CRqA+mvOFRph3toxReCHwapZ0TsUQ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0WRd7Zw9q00QwzatVd54FB+ZwXZkC9aNPSMw+f5SRXs+DN/X3
	09ld7LH6oUNfSxpgRdkRTxTz/gZ7SJh+sPQQ1JYiTPLYUK8PcIvaOTI=
X-Gm-Gg: AYBFou39jM3M6pGf1x8DyxQnkxfbK8IM3QBHUR5NU9L4iqP17HAFpynz2/8akUMh3Kv
	m+1GhNNuLNMR0jzqptvKxzfglSll89SgxQKnG5xMFcJJc8duX0ONTYYUMX8FBiB56CMJ2OAwvCf
	9GYzvc/GHZcuukqOIccDV0Q8046+SSc2w+TRHM2BKlaig0j7IyajpSjLWuCgy+rSjUOUbBPIc/6
	SXfcIzFk4q4xNYOvS5JK3nJeaaRtYNofQy2GkdaJNQtx9EiTMYba3dmthTgBtqMNY91Sqm+Ahzf
	ITF9ckKbLstw8QRqYw8QWucOtyrXKmV+yZjXDiqlPC9J9PP6ZJqSXzzB+4RmpD8DuCjLGK2JBau
	d+16zpHu1sNutvic0BVnIK61F8YR7DP+noayFqamHj7Hljmd3sn80k15Q1ldD6OkaoNRKXa17sP
	e6B589gepm2WwgY4JOrRV03ho0EzzCbTtWc41d3UqUELUZ0UrydcZ3Z0EwYofjzJAtaQ5uaaKJd
	GXLrljWqcFl9wPFKRYSzdqQtPxakbv+IyIguWGmsHrrV3PTMp9J9B0A5IAXWCZe5Tn4UDx8RVka
	bBeksqew8WIUXiU4Lcup38jsHiEZEakGKxqWuFZ3scZ2GerA2TSYciZJjLeZenAmr94B+yAIrI1
	dYPA=
X-Received: by 2002:a05:600c:1910:b0:4a7:4697:dae3 with SMTP id 5b1f17b1804b1-4ac17a360d9mr51142165e9.24.1793365082439;
        Fri, 30 Oct 2026 05:58:02 -0700 (PDT)
Received: from [192.168.1.3] (p5b057761.dip0.t-ipconnect.de. [91.5.119.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8bd8esm3027169f8f.42.2026.10.30.05.58.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 05:58:01 -0700 (PDT)
Message-ID: <9a349321-21eb-4897-a897-74d6d4416138@googlemail.com>
Date: Fri, 30 Oct 2026 13:58:00 +0100
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
Subject: Re: [PATCH 7.2 00/10] 7.2.15-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
 linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
 akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
 patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@nabladev.com,
 jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261030121255.257615100@linuxfoundation.org>
 <e24362cb-bce4-4a9f-b9f5-040aaa2823e0@googlemail.com>
 <2026103019-badge-android-5e34@gregkh>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <2026103019-badge-android-5e34@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 30.10.2026 um 13:51 schrieb Greg Kroah-Hartman:
> On Fri, Oct 30, 2026 at 01:20:49PM +0100, Peter Schneider wrote:
>> Am 30.10.2026 um 13:15 schrieb Greg Kroah-Hartman:
>>> This is the start of the stable review cycle for the 7.2.15 release.
>>
>> Three minutes after the release of 7.2.14? Really? That's, well... ambitious.
> 
> Yes it is :)
> 
> I want this to be the last 7.2.y release, and everyone move to 7.3.y
> after it is out in a day or so.  We have just too many stable kernels
> "in flight" right now, and too many pending patches based on the huge
> number of bugfixes flowing through the system right now.  This is an
> attempt to keep on top of that by reducing our release load (and your
> testing load).

Ah ok, understood. That makes perfect sense.

I was wondering, anyway, how on earth you and Sasha manage that immense workload. I guessed that you must have, 
together, at least twelve arms and five heads to be able to do what you are doing.

I have to say, that I am damn glad that I don't have your job! 😉😁

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
