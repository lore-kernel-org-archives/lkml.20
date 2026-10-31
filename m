Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793408505;
	b=GSWVhdLT3pPUsKNdBpEHZEcoGtwd4w59ZFmrzO0UR+MaJgGZR6/1mGK9anPGGMW8PnhY
	 nY2qGib9A5eELTH0jDHi/nvD7LlNJT7CW8ZWHUBJG8nZlDxyvcP1emJJ7g4e2INaBfEFd
	 6epRvLogojMRbnWlxhom/gPvkwq6mAwugkjQJUXLpUFJQcBUSEILtywW6JyQZ9c512kdH
	 3+cNALQKcIj/vx0zjZku7Ulf52KV4CG+gQMHIS9mIrb7XnqgvrX6hXSiVhUwCjtenq9hV
	 tJMPSQ75rucNTiatPlNSTaoudvL9dbJ17Vx+d8eFl3HxBU/00JMLCdvoOqvZLYMXMJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793408505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LZfsTBRamD15PPndPrII3yvEWmYbhtdxrXyNeJy7iMk=;
	b=AKDDfbMv9FlH4IJw2XhA0ti8jJiLJjNXfrf2cy57OEJIQQTgEulf9aIzBjUFmS25jPg2
	 lSLMSRw7oKOPBEpcXleXy9BHSJSUo8zAwHhyAbe9SOTna9SD8e8N6whtPigy/OJbrqDYV
	 dx3t2OA5M9TIXeBAeglBYrVUZUszwbkCSs2t2KkaQkglyk+ZU5dpLgmSp2+aloOq+3wcy
	 ISxmVH5mYxisDtSK8pcN9XzAq0ALRB7XBnKppvH6ff4i+uVg9vJ8uFMhni3HBkoa9xlTQ
	 52d+6QjY+kq7kjP8f2DisyFtKb6mTtIwys47cnoTWBFk2Hz4j90OBB6H4XVlQx7UNrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=F0Y7D4D1;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3B9606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 01:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E3B9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=F0Y7D4D1
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so14482795e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793408499; x=1794013299; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZfsTBRamD15PPndPrII3yvEWmYbhtdxrXyNeJy7iMk=;
        b=F0Y7D4D1WpvD68HyCqk/6sbetNEWS3Lm3B/x8NuTjvGaU2zNv10or/rcVPfy8jPGar
         MT0/AOmi2oXnoSVQ0PUW9u9NSg7/DLTIwjEwe7Tf6MGUhYkP5HiAG9gsbA5dyC6zXjD8
         raKZN1ffprH5QTxdJyaTqsNuQAyoTd9torSq1RmwbgTwTO3FUV9Fd0gzh9pFXW14N2/9
         p/Y7xM3cULiLH5joXcqMPCWsV3bGPLw/TBauugYaITc0/J1ZBh4uicDwsIHJkwoYzJ58
         8Wv9Oj9xT9DES8kerqQwU3UTYhqHmtO6fSbSLD4tfGxK1mL93M5GUKR2PAhGUIIyyYB5
         CT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793408499; x=1794013299;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZfsTBRamD15PPndPrII3yvEWmYbhtdxrXyNeJy7iMk=;
        b=jdV6/A9doR5S4lMIOrDCTMxAmRdLfOL91KHWDiaQ1clGNimpsSFkgm8CjUplhcVN8z
         8OvsZZYqmXzWtduOHsnBNQpkFA9lITBzP1Dw/IpLs2bRiN+L5/SFd0Dim2TTmJXLTxvC
         DPhBq9YQgc3afxdfiNDzzlUFUBWuREkHT22imKMEq/rb2wTi7TSxYsxYZgWBwSL/h1p1
         RKjVLJecQPaAV01THrLHJSMj9GU2jhx/GTiAPol5L4ycUPOLVrensNq46Pql9+G4phXu
         3dqU7opi6Pchs6UhWvtwkM/9AunZpYF2Gc0/1PB86Nmkj31wqbC8TuHdf2/D9Ru0X/wx
         /UkA==
X-Forwarded-Encrypted: i=1; AKwUvBwh8zpmIs+OQUEfBAPt6G8SOewBW0tPEkndQ9tNpKncfaPhjzDZtpte3qm85UDN7vsEe71KynHLineYdjw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhqgtOTiGnE1L4ukbMPeEqmejEmHNqysgLTwXFqObxsWGqwg9f
	q2WQe+7rzpP81dG2R3COgt19cavWmyz9lpQkdEHesFNxWp9maDMmX1k=
X-Gm-Gg: AYBFou3vLg9KL9VXIMg2bzoou6fYYsBhicZRlJ5EK55TXEjw3iW2GBd91+8ggtc18Zt
	dpECeQS1or2ffn0gqpY863lWqGmE8SUQ5c1yyGfTC0U09QHnHwtxVmmVY4zlWSZnGmKgowDKyBG
	ZkjtE5EfyJ4zGCb21Atu/8seUznu3xLkbMUCuo242G2y42lTNMlAVlpL5JxiUNRDbY8S9pyASva
	//uAbdviGRfThMHusXpIdmAxRU2ATkXl6NqH9Jm0xs7D9Qx3fb6KHgZgiW5p1FisCEyyWVFAaa6
	Wwd0dutOtgl9e7QQK60QKAJ6nmAlZp5oCngAe1pGSlizGspyxM1m9sQs0T7nbKfCY7Ctd3zZVBN
	o26cJ+DF2R5zV1AoePgzCqtKtpuGshy06BI+8qEotVqdNVZVmtO5qEzUuomFCTQhBvt4vqrSk4u
	12+vFUfneflgQ2xKZ6MHcR4NZA68T1YTiuuVlM6PRfbDLuSbmp/0hYbeV/vrGPDPeogW3dawfyV
	4oYPhD8xW7SKvRwug9FQinsdMrVL1J1W97VARyVVgVl0RnMf5kLSpjsHpY1v07Yq2B1wFa55Nh5
	EQhAdYopk1ceeEdRtu2MGSLp8JkIlN5muFqc/XrBBSl2qyhbOBfvsWytvS3F92DFKvO1SoG+hyP
	tcN0=
X-Received: by 2002:a05:600c:198c:b0:4a2:5ca:767f with SMTP id 5b1f17b1804b1-4ac151a9a36mr94244865e9.4.1793408498561;
        Fri, 30 Oct 2026 18:01:38 -0700 (PDT)
Received: from [192.168.1.3] (p5b057761.dip0.t-ipconnect.de. [91.5.119.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm146688815e9.3.2026.10.30.18.01.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 18:01:38 -0700 (PDT)
Message-ID: <0db80581-4d82-4771-a495-4dd1c4a1c282@googlemail.com>
Date: Sat, 31 Oct 2026 02:01:37 +0100
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
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261030121255.257615100@linuxfoundation.org>
Content-Language: de-DE
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261030121255.257615100@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 30.10.2026 um 13:15 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 7.2.15 release.
> There are 10 patches in this series, all will be posted as a response
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
