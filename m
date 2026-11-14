Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794674688;
	b=Vzo5BPnWPtsQRUUDbvjqK1mSUUaDbS4P/0OTfuz/0XMrXpXcroK5HErrzWHEi/U9fkwq
	 rUdzl3MMMW6IZbRFnPj7RWh6qEK2xmB6My80m1Z5Fle7wnA4NDkoIMsvgo5uo6DiXIMjn
	 s+NpCJwd8s3yDRKRKqh1tMbGsNmZYLOIa4oMJaYUAA/xJSti2ru1uwZLR+XbGDmIKsGgL
	 hN6GjFYtqN+glTMp6sWsA3d8BE71zlEVmoDi1dTKbc9B/e8Hu4TJkqre3xDOdXjEJ2io4
	 BXhBKwgFZ0MkEDs+iUFMh0rUBrLnhVldJttao85dxe/Vexnp9WGwKO7nm7c1rJt7aIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=h4axWdmxX9gtDkNwklTEbzWCcmvgV4kr9k9kh9hjp2s=;
	b=ypjUEugEfIzKaefSbwRcH6YMgtLDbwDPn4dsFediSSW8heev2TndVIGuY51SfZiln3w0
	 /czGK8JBHYIxinq+r1XyylIGWHM3YXPt3KnVCihguqQVGgDenxHN3M9tQnrC+HVjoID1m
	 iioUXxmo8yq+HkLz63Uqs4/OUL9Moi1kvvbfr/LMt4d2jPeeUmz+GJOTUOccc2eLom877
	 nJZ0KwYY/gI/DZIN1PIzyR/3frruKuvTni7/aTMND9tV+smUWEIWBrsH834d8MFXG/7Ki
	 BC/IOeyN+8ftInrC+whyLVIGZg/c3FYMtfdyAmrgCMN8k3o9R6sILzugS/dQUqNv1FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=WapXwFRy;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823C2606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 823C2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=WapXwFRy
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490a0e72588so864562f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794674687; x=1795279487; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h4axWdmxX9gtDkNwklTEbzWCcmvgV4kr9k9kh9hjp2s=;
        b=WapXwFRyLE4UMSQQp6q74hJxJZKhvMEzr8td3rBwUpnZtlQt82GSLJ09wU1d/BwnqN
         ckJXxMSsygktQmcmqJXu42j0g7IlbU2xj4zPInT14vpP7NFmnNqKyteWm9kZ7eiZVSD/
         INaA6H3c6NYOM9/fZeotBlWUHZ4mFZr7BgLQrWCkcVEyISboFdYV5e+9umRO85qajUn/
         3p8VxS1xieGaSvdrnt+y/cNNUTWC8ufdx7TCgdbR4MYdFPHfRmUHm2PKDmCK6zcnEeTK
         XmkUHcij75iAp1eEqMoHLj/XCDD6sF+s1GX3viZcxmbx5ZXh1SXpC2CdL2Mtgt0rab14
         +HrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794674687; x=1795279487;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h4axWdmxX9gtDkNwklTEbzWCcmvgV4kr9k9kh9hjp2s=;
        b=Z4vj0OZBPhhgGsykXa/85PWM0LUxv6l5vAcVToLVe86lmQEqVOe4gevEBm7ekKFsMq
         8cinUlzPhYTk5wtf6kIfxbXeIqV28tOfY4qpjiMreLsvy4PFAnuD0aHa50+d3IFHGcfl
         RReqF+gBlLubLYm97SU3+yle0rfFobQCOFD/NqxIFH4eiUjECQ1AyD3tX5e5xWRpgdPH
         fjyVQsemEoJENZ4aF258ZyP/wgdwnvOzHoXcN0CNUNm4FkiWVlSzoqgoqRkgKQxWDK66
         nJcRfmKHaiLjJ9uwC1FQE09gAt0jevTnVlbBSjtXazKbuINIqSZupwYUA5q0+0ok+pUt
         WPNw==
X-Forwarded-Encrypted: i=1; AL+hErGb61e/f3aG7FGChFYojvDz4nLmB4DQFBoaUasxZlKJZmc0wmfBLjLw5WVCGtx7FBHiczuqhI37MdxyAGc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9a0gDUktzLo+pCF6EALDwO78nKYXtL1pL63dE1KW7/vvwP/qKB
	Wnqz7nJ7K6Cj1vPOBpD0bkGcAoeijcn+WMVJqwjQP8i8UVoQCSAnj+I=
X-Gm-Gg: AYBFou1ywJk1DmxKI8bIf2Ol+2tdp5YvhrFTX3LggXTm9rzKR6xmdrkNvZwX3uZCPl/
	RsSe03Y9ePpyQ/BXy/6y+8za/8hnCjXZPDpvaIrkOU78dDtXo+6y2UiJvH2C1bVgQcab9VsQtYx
	N6TUyBCnbJIVYakZVy4BPG/CvS01omCTSy7zTF/NV3DHdWgvH/NHDTpcUcOUfkTT5xSHSFfHRh3
	GAAEgsWhnJrCsfxS6BgtzLAYHNx/jDIBJthd1OB4WMQICkvS2pEKX7RZDBIfiG4bHlHuYuvmW8h
	RnX/j2rruERZC4ZJfKI+kEd0GM0fJ/FNXrOi7V4VxanN41P8J8qPbu0mJdIzStZgK/Rfu8TOaxC
	kkG+6uIbmhSfMvYifnN1bCJK5uqc+MW69J05z+T4j+dkH4iTTOOzt4i+NsT0HbQrobmg6p+vMYM
	R1rRkjXnG6b7+SriohaXEiVG7HdBfbkrolC4lFvscWToNXht+eJeGyWZuNiZciUlGwqQTTSPkRo
	eWU+o9eSXncX+Ygtll4SehHAE8O4Ti+HQeNFhA4+MHTVtDHUtatktjKrg87Y1Wrg1aGf9Z0W18F
	RZchXwQDkNj5jSRy/XLnjgAn0agEAsPYbjSw+D7JH1ORiXMQaDk69v+FJZmQS9jHUlvWGwU1tVP
	ksqy3kw==
X-Received: by 2002:a05:6000:2007:b0:491:7ab7:81a1 with SMTP id ffacd0b85a97d-49c72c9be63mr11913231f8f.46.1794674686748;
        Sat, 14 Nov 2026 08:44:46 -0800 (PST)
Received: from [192.168.1.3] (p5b2ac4c4.dip0.t-ipconnect.de. [91.42.196.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8e794sm11806540f8f.59.2026.11.14.08.44.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 08:44:46 -0800 (PST)
Message-ID: <6bd63228-03f5-42e8-a7b1-367007d8dcc0@googlemail.com>
Date: Sat, 14 Nov 2026 17:44:44 +0100
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
Subject: Re: [PATCH 6.18 000/686] 6.18.64-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261113153820.902362109@linuxfoundation.org>
Content-Language: de-DE
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261113153820.902362109@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 13.11.2026 um 16:42 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.18.64 release.
> There are 686 patches in this series, all will be posted as a response
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
