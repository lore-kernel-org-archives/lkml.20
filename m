Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792980160;
	b=NB6Tt+ildXwY9uNAs4w7fRA0gjK+etSPsSzCf98Gw6v7zKFRvyCq06qDeJiBgKviMr+I
	 7ZehQRjT2qhIebRHQ8oxP1hI92fYmonVro6IKi0Bgwgt0sIZsjJV22zQ/JQgrwT9c+qr9
	 EFNqHalHCjIBnKlyhKTG+qp17NhwmPlXdj07ilRvl3E933jbqK7C7cYi1C+ryKTXghEjt
	 GykrNtQRxkRbocNJK9ePluLOoXXnUKtoanxrpmfXcYEe22iY4/P/tLgBbQ7gcUbv9x2cS
	 ph8eq9BlQX98+Jht4OJjvOrDdGso0fcsTVoV6oEAQojNbuOpW33p9W0gDGmPF+jkO1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792980160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=CWTowxTtC6NKjiOQzv6EFS12o6onMf9gLtVaBHmOg1A=;
	b=op4n2nNecBMK3iJPuU9BTHvtm4LC/YnKfRf+ZS8Rt9X+01EIBqjjqGELDETrXgrj784I
	 Dbg2Q4tNShbLjKdv3Cdg9GP3Nx7yyn8xJM1cdPGR+61Z0bWFKCAHwz+IRNvSABe3PbGz/
	 K69CRBnvNFMA1BZffd3zqQ44ULkOzvhFS6gKBvnA8VBQhEYxfVDrSdiX/nIX8UYfpRVoe
	 a/3Ji04NuvrmYYsUCeddLgRt20pnsSq6gBA767ZQcl2inygPBKprfWjx5XSzdO7oHsXYt
	 HbRLoIe60ghmyCrbD8ypn3S4Q/vJs4iJyw9WnU+JVKhNKd6IzkW6JK27E3pB9cT8MUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=qW3GY0WC;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A7E606A331
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:02:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79A7E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=qW3GY0WC
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso25487305e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1792980158; x=1793584958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CWTowxTtC6NKjiOQzv6EFS12o6onMf9gLtVaBHmOg1A=;
        b=qW3GY0WCY2FcVL0TUolPGpiVn3xNun+Z3XBdwKoLcDr/eYqvOU6luSk5JDP+oowxiT
         CIYWA3AJHUH3GCymUtwDb4vHOkqj5HGAf0ZBBPibyjdV2WE5y0TnVyZvAX2kk30nHbwQ
         Vs8WrKd6aSCYli3qd459SFLxea7X0zFf6LRr0VkmEtgBsklo97+X8cePyuc53L75IY+L
         2K51YPrwyL0YWhZcj8PMMt3VWN7meBzGMHS0eVw+1MlkRELv3jlKO2pDKwbHZRYduwEI
         2i1NhQX9j4Agyt1q9H2Ogp+TG0uJopSkIAkryX7eU2nOPy0iV5fI/FCMryIYVcDSyQF+
         N5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792980158; x=1793584958;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CWTowxTtC6NKjiOQzv6EFS12o6onMf9gLtVaBHmOg1A=;
        b=oIAbmDL25sdCE9FkjCRNOjXU9fIztsnaIocHeCNV+WgJYwwRaOOSQzC66lzplKlEIr
         ej+B7U6SIGzr52Iq7MVbCX0CuGEHu+FovFNFSN2KqlUGRJqo9XpoR5kTNcyFU+CqzoFL
         TrN5UKR+PDfHYyCG0QbWKGGmXg1yOwATNpfXTit65GdifBpItzuQRk4CN+NkgRjjh9V7
         yzG7q44MmUH8kZEcC6JuLaExchYlCgR1w32PfMvdBTT6kuY1Y/cjEQdOj/+3oHWUqitH
         oWbZXAB9vcAKJR/x/Wm/ec60C2sXYBrMRR72kEdJnojVilk34rgt2jCWQX+gh2dOn0DQ
         GgXw==
X-Forwarded-Encrypted: i=1; AKwUvBz4utHBmzhVk7elgjdW/iooH2DAJjtM/nV58CHyjhrGV1cAchEuiM4dbQtnO6Sqxq3jylmG9hk7jGc/iPk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBJuTjpLkkcurdGETAJDt6P6nqbPTb36uDRtkuUzHbHziDaDbR
	52j9MUQxuq+8hmx6X4BLT/O4UZVWqpICt45/dUA62xNo5eh9b6Zdb3zjDE3H
X-Gm-Gg: AYBFou0M6w16LFz+yPxoaLFWj/Fu88omPTnEV8y637lJenqaVl4/DAvcaNYrWjKFjkV
	/dip4vKoUkGR6mwWOTKQOj+6vaqt95TvmcfvflvU5kOkAJNWW8IED0/oeDT6yNvIIVD9hnTK9/y
	GUyxEEMpCmh54JlWGZWl8UbFqZNIe8CiF/KIJMbdYuL0D3d0CM3F3OgtdKnNX7h2QL+UFHsIv+3
	zoraQVzwto7gS5i5tnM5lFxjaUpMHUsLd3UVnPTjLat/NamA02DKjt9/NqoDoWUVUXZ0NRlICt/
	QRyhaoLZ+ugmQi8pAE+2RvXcmzWVjDS54Mvf/U1bIwxsGXGmtpQuURZVGyZVPtHP4y8Ljnwfiwq
	H2rr77aRkIZGGvahLKiKrh1co4qe0Dazibs9rnjOqx92w5s1IYWHzt+zov6GN3fZnOZ5Jy0ZidU
	2LTrMwNC/b5FT02tLmP/EMekBrxBXDgqQQw/8IskoxSrc8aRhmp+bTRNYHrPK4Y0rfxr/1JXwHy
	seHDXm2ik9SwLZp2QGF4X+zg7hvCbJ3WrRj6uzwM6eLP9KLb1JA60Nbw57FYy2fZ7w+GJnOoPaK
	z1dB+NIesSfKlhWmUVM0PL8DHDQg3p8=
X-Received: by 2002:a05:600c:83c7:b0:4a1:e92b:ae4a with SMTP id 5b1f17b1804b1-4a35aca5824mr91169215e9.21.1792980157627;
        Sun, 25 Oct 2026 19:02:37 -0700 (PDT)
Received: from [192.168.1.3] (p5b2b4af3.dip0.t-ipconnect.de. [91.43.74.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm424543705e9.1.2026.10.25.19.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 19:02:37 -0700 (PDT)
Message-ID: <fa9cc4e2-c9d3-4981-9701-302a8d0f4d8e@googlemail.com>
Date: Mon, 26 Oct 2026 03:02:35 +0100
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
Subject: Re: [PATCH 7.2 000/231] 7.2.13-rc3 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261025125805.309934791@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261025125805.309934791@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 25.10.2026 um 13:58 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 7.2.13 release.
> There are 231 patches in this series, all will be posted as a response
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
