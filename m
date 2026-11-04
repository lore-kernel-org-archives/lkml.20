Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793813139;
	b=u8u4E+54Mq+NVAJE9PtR8UpyuM6XHN0+/iOgBGXpqfvmx8dMu5k5QuCpwncewcxncIwq
	 BB+hHmIOjsj7fU6peo1MM0Ze84hkPRTw17tPLIpSty76vIK0zn734+u5/8+OzQeM8uODX
	 +EWK6Lar7nyru0orqbyexR/YZY+235VY00ThvH+ILJBB/CPl3T6BdQY7DvGINqY1GG7Mj
	 mkSuquiUYBlxmJNr4oq4hL15vavq46L7jcpOOyY+zI4keAR25jgksQswC9J9R4YyjuQuv
	 Ux7AAqceheQalMLJdriC/6rwt/4BNVrOA0kENwFs3k19hc/4Guf/29CJ1Tfqmzq5WAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793813139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=JR9FR7Y8ZGIM/Kx586GDDxG8hubel43MCCYiHjjhwQc=;
	b=zOyAKoPiAZO9GHXX4v/yzHA5CAOw4oHYoMU/SjGfNXSq88a1iwPsGHZP1BxkHnZjGR6L
	 FIRGXqNlAJgw3ym3j0f4R7xM79phCfNp3URk9a4RiVR9HBcM9ORC8lGR/72PV1l4Vbtvg
	 BnH2152++ovqaW7SydeohrtzixgR+wacHXHmgnS8xOExHAkEKQlhLjrRxKOHX0v0E3l7T
	 QtdQFp3++w05PDlVr81RICliB9fFYsJvlkBTyPjKHezpxl4CjGdvex/OQ1BoHqzXSa3AN
	 hkEJSU0fDM1grf1XJ3+dKBMF06/XAryJmDoQyqeN71qT1nz5DI2ThHWV+ES8UG7abnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NCGyZFH2;
	arc=none smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24E6606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E24E6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NCGyZFH2
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4a76f63b243so1607102fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793813132; x=1794417932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JR9FR7Y8ZGIM/Kx586GDDxG8hubel43MCCYiHjjhwQc=;
        b=NCGyZFH2OA5UEgQGPZeCcVQnIxXDqUKyCRP8vcTEEjFX8UIJgPxXKWQl3TC8FiHyNl
         G5t+7XlvglJwVoIAVubQAw9fnMlTFXrGdXNHoV103fff2zlMD8Gsg+Yk0AjWjCSlfcxS
         RG/u+z1rcQLchR8mnITnmChHIgVGYeeSN6TKktGvd5wV/IMtFc6Bp6ariSgCaAXqdCf/
         dJ+BkUrRBLn7hNDnjTYu6j/12twMRpkOiJQQHTWDWH+oOaOeAr3Mwluga5UEVfqTLLg2
         vTYHKBGp5slMNzzoAwIZ3TZISOxOfcHoAp6JUasw6FidWAPe7V/ZEAQsbWHAQVnj/c7M
         gAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793813132; x=1794417932;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JR9FR7Y8ZGIM/Kx586GDDxG8hubel43MCCYiHjjhwQc=;
        b=uZsMvha7AMKWlxQ2vSbNiYYvfUR4VhWowV1q6Zp4aDkekIXAki6OFeEVYoW29x5KZ7
         pABpvFFAJsCMBs8rajvxRR7t4STj2E2etHW29PtqqS9TljpiNkuvHpppxnTtZFkQY9p7
         usTu0tsh1+qGAiC5cMPz9JkrsxgGKYw6v2Fvn/inShvBrCG8rdSDI63VHchYsIqPIsh0
         1i0+KKJfxgF7XUGMEm0KY2dPYXWqyGvzwSj+3/udal7aeOh+QiKg+XSwK+i/IoAkbIJU
         I+xuTtaT7ADu3ofXTkOuywJYCo/sozAh4eTkWwJ6sdY2Cb2Wt/4L3gwk++5QS0gY1uH6
         fJuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwryJSpsSrbmpzkB7lwI38K1qeM8ULS0DbR67RK91WZT0TbUz3nBmOMsAopiGpptMt8D4XLlKkwVWJ1pUE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qHtQoEM8/ru1elq2KNfUrcNDIBdNvCDyoB8c4R4vpIIbg5fYx
	yC6X49g/Iaf4Mw4igJkXiQgGHa1v9MplW+DZ3FkWQfVHEFoMLcEB7gIjMikmNpF8TW8=
X-Gm-Gg: AYBFou3WCWE4LNSwHVn47J/xPMqbAIg2ygaraifVzx9dB6KZc2mJB4w6X+cPBnnmg/F
	u/1xhHNP+P2dXL/aSLI32FYbua6cmwrXoBpFqGjzPvdqi2IME7NOguYMGuCkqTCGtavoxdp0f/5
	99/G4yaVKB7iMLxNen+7lsVYLGy/cbMt0sdnRd6I/+VhUBmyyV6irCWqOxgxhlXhG+y3Quj5fRq
	t6Gigwzsejc/8JSt/XCwhve6oMBnM0HYS2SxspW/eFkAdtpfhzSvpzQGlQpYOfTD72N/pK0sElg
	KkRogccwJanEcP2i5EiKIfoN5Xq+QCH7ft2FDVzu69utNszsJaUtMmjGQTsyqjWKJrhgj8bwBJe
	tXV3zcQDdx5h/KThMtIvnqve3cUaU3suISGl/jaX82QVgtKMnLjfH6x4OjVwQAVBRzhvosn+80M
	Uic/kj5TL/fV4B4UeH71iKzip2ZHeM9ac+8VCk5vSqlH5a3f451aLMbL6/xG/BPT/5P05hOEAzr
	8f/MwspPWRM3n0bmwkaF2Xkb59YToW4gHt2AoJ8HiuFRypRLexo+BWckGlmqaSvCTYqO12uGSIm
	1jnAU9lEJhX46TRWZAEgRM+vEqe28YMFaObiqTVJ47YgeiLPRK52OIMO0qNButLOFNiNKQWgD09
	uoEFZYiNlRNw=
X-Received: by 2002:a05:6808:bc5:b0:55c:88c:dbf0 with SMTP id 5614622812f47-567be5fc06bmr85940b6e.28.1793813131875;
        Wed, 04 Nov 2026 09:25:31 -0800 (PST)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567ab6a5270sm1979485b6e.0.2026.11.04.09.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:25:30 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: =?utf-8?q?Orkun_Emin_Sar=C4=B1?= <sariorkunemin@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261104-io-uring-wait-inflight-v2-1-f38f29fe8018@gmail.com>
References: <20261104-io-uring-wait-inflight-v2-1-f38f29fe8018@gmail.com>
Subject: Re: [PATCH v2] io_uring: only wait for in-flight requests if the
 closing task uses the ring
Message-Id: <179381312996.4111762.12728825247345389604.b4-ty@b4>
Date: Wed, 04 Nov 2026 10:25:29 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2


On Wed, 04 Nov 2026 19:51:42 +0300, Orkun Emin Sarı wrote:
> Since commit 13d3783a55b7 ("io_uring: wait for in-flight requests on
> ring release"), the task dropping the last reference to a ring waits
> for every request on it to complete. A process that only received the
> ring fd, e.g. over a UNIX socket, can then block in close(2) on
> requests owned by other tasks, such as a read from an unresponsive
> FUSE server.
> 
> [...]

Applied, thanks!

[1/1] io_uring: only wait for in-flight requests if the closing task uses the ring
      commit: cf6542493e35ab9e72ac07da10a178ac78db5a16

Best regards,
-- 
Jens Axboe



