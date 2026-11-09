Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794239099;
	b=WILIPBXEUcVCMmz5gOTuNBUdSzQdjiehRn2JeUl2/t13hTm27b2TnR57u0VnHupWrYNG
	 UKrdFVe1UOtvKJR9eGpPyTO98J/1VwD7beGp5lFFbqbDs/HUvdm/Zlj9tm9irN2l2mPUz
	 VbYjJKd6QO1+qlj946m0Z7M/lstHRWGV5Dl1siDoCivTGlvYCClIDQnR3ViNyZ/GyO2ou
	 c/fMKG2IfqKJcxdm1Hw+K9+o49rgeucBxBHuZ/3blWaIvvUiVxfsZa4ZmDTReRwkn1nXQ
	 ZSzMmjv8QZMy6PEVXbYm8ILUkLieBR8wEEjZwvG2CZbBQMAc90KQlC/WOSkPgY1dYew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239099;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=NUErs7NoE/3bV36QmlDjG5zSS9BL+CCDMLSs4x6fzbQ=;
	b=vVX/sygXygFheawCE5nirfZmyHsTCarQozY1GrmhUGV2tde9Xz6tHkZETO48k9xQ9NXH
	 DmHF1lBoUUBsqD4TrRKHpiarLiw1mka+w1DqeaOFQmW+B8pqlOPbkg+IxF0O9mwnpLo+U
	 mcB2k5owEUxGyqBRKiYOLGn3+2utUPD6Gd8tHVV0/Ct1VNOBArD5JiphyzjrH5V6YzX29
	 gryjBRB1Tj0zjNFyd5IcEf40P0jyzkdjERgNO+kSzJ2tRpbaXht5YhPcbRhrlhwabQSsv
	 FTYxhgiMR8LsUzitQyfUoeSTP5WKhKXtEeovTXvBUeXhcqjC0Sg2QoBnnTV75FKu5ew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=djbvy4bw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA03606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECA03606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=djbvy4bw
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so2020310eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:44:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794239098; cv=none;
        d=google.com; s=arc-20260327;
        b=ebi3K2yXaxx2t3EAowKvBtRyS9mDkpD0Hv1YrE2xE4b2S/zKUzk+5BWiBSzmP4mnBH
         9Tjn3KfybftDWNvHtEd48mv2XyxdjfMjz/XhBwAD16QFTZwXeMvbMW0ewSZD3L42LJWr
         YpSvX6TomjAW+cG6x/j2cX3aXNkz3gye8uPZsar+7M4IVtCkITLht4Gktx4KyQ6fOr1h
         SboNJ040Eo1HxbUclVbVtcxeHctuJdEhEQXr0iHggUTd5HUqW2pO5fA2wf90JyzK60Ok
         ke0LedAFCHVdCXMElL8lWmQJxzMXaT3SQy63Desqmc2sA+H24DR0If+RzFSVv+iMJ6Tm
         bZoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NUErs7NoE/3bV36QmlDjG5zSS9BL+CCDMLSs4x6fzbQ=;
        fh=6Qkx/lpKJBiqYP7LHmDjWIvj57zQYoMdvQzsc/e5UsM=;
        b=mrHdkOQDSqh7ICYLzd1N8OCSTJN5TaztJLFqGAHEJTHGsvmhmdTDdppkCyc7jM9DZb
         xjozBaNyp1hQE59IQra8JPJlmnnKZOg/L+g5W8fdBPo3V8MkKQxBB7FIYHQsNdhlAoT7
         7WRBLw6cHjydmOEVpPaR872RK1N0jh25l75RFTC/YqBwXvUxeaOgZ9bWSGMItE5hKAQ8
         FSjEBpUAehac9Yy4VsY+F42h9QBXA4Dp0IYMG0oyt9GiPnQypIry9Rrr3IBOJy+k8mcq
         lhTa8Xym0LVuXQhcHBHj93SBP12TSRX9U3bL6PxUG39pjRp+v1duVE3LPN6obD+t3vee
         4J/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794239098; x=1794843898; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NUErs7NoE/3bV36QmlDjG5zSS9BL+CCDMLSs4x6fzbQ=;
        b=djbvy4bwkHrZROZXukKzRSHh2GUcPF03DKtky9fbjTceOp33XSQPCXoAdSN77x4T33
         LctwVm6RKcbmcj69zO/r9OSQE96RNK4cryEgnUJ4VIjlvXN6HJuz4COF8XIywfjPcWgj
         TnC19638IQRnLdrPykQ+FnRI2ki8Aa+AOUZUjD0Bjfa+8Mje384QKNaWOs+3eyceTKAa
         42+IM5oNSdk8HgJ+YNwhAI0YDSIQZkKhWlGf84WQSH01H0Ahi0RjWdWsrxapEygkeEBy
         V8ud9zrJzjx5o3O2dzZFLVWNYOXJXUvE6y7hAKV6dRLU5Z8l/zJXkFoCmQCGYbwuhQAw
         rgzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239098; x=1794843898;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NUErs7NoE/3bV36QmlDjG5zSS9BL+CCDMLSs4x6fzbQ=;
        b=IaPNHu2Gm1icOxrcjtqTe73kItwX6M0YSDwV/4HlcZsE91D8RhsrZpEsBn2wJWXMS8
         QNPjWrAfYNv1R4/eDKZZEdjAAMCIWD1Qv7gGKCwgz39OaoGn34Zeck4kRm9AZdnUggx5
         szvhGUPCdH/N4611efI4sgE7ja2SGuPSpPBzu43nYeChzEzsOd7vkg5+/v2SKH+bFzTz
         zjLkDH2KEG2ylNQ8vqq5wO9lqLTQsabUDRDIpXyErVPwJB22DrSoYLaltcpjByi4Tbvf
         /t2Cbd2MWgcQ6GAkgVjHbLA+pck14XPRFd73/G++BwRCqXBv9SWzOi266ILbDAsGJ5rA
         P1tA==
X-Forwarded-Encrypted: i=1; AL+hErF7VI+q/hJahw6V4fRiB2LxNjlKuxNdR5RQ68LUEj6P7kabP7IqmZHTih7MD352q8ef5kzYhwTS5DsAtp0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hZ8g6t25WWhVN44OGKbYE/XfLKBWcwZ1Ote0cMlx5RkAQt/wO
	/rrR2mIMxeF+S++ihibkUWtwgMrXu7UJ/XqY5MUFeeNZHl71oHI5iZ40P5XNALWpyD+IPwNtlvM
	AuaubfUNdWWUSXxGxiD6vOb2q4dJo9+0=
X-Gm-Gg: AYBFou1//XkC3jtjmK+B1xhSso28sFC0ooukh43X7G3bNmW7rusgspKrSY8z+wAh+ND
	unQ3orjg7cgGF8mKNz9jFl8zziMRLL5GMSW3mCSpxgUydurFORqB4mCT3JTwNpDF1gKIwlONuU4
	eOqwsqVceMuJNej6NlOw/hQyqK9vGCcxRpE4ARFmG+1ZHlOoLfvV1jU3L7ONDVkJ3EyiLKdXnR/
	3rgZiUVlMld5gnYUPkro/ywwTDKwijpNKdIqJgX6Qs7jTEZHEIqqP79iwpCgv/v9abXrvKJflxk
	gHayzmQqI9AiN12gaZ59a64sWuUK/ElcO3d73snzMFj310sZLhNRRoI6kr8gp6OwfgJvDyp0K56
	lKs3OxNoWgBX6K6u2sSrM3KYI7MVs7Ynk1QXH
X-Received: by 2002:a05:7301:da8b:b0:36f:4d62:2884 with SMTP id
 5a478bee46e88-372575c62b8mr8103918eec.30.1794239097992; Mon, 09 Nov 2026
 07:44:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108212826.15890-1-oo.hehir@gmail.com> <20261108212826.15890-5-oo.hehir@gmail.com>
 <d9f4a750-5f9d-4749-929e-330c8776971e@freeshell.de>
In-Reply-To: <d9f4a750-5f9d-4749-929e-330c8776971e@freeshell.de>
From: "Owen O'Hehir" <oo.hehir@gmail.com>
Date: Mon, 9 Nov 2026 15:44:20 +0000
X-Gm-Features: AclHuK9x9EpRxZ7OnBIKVHuPQ20ucbS7TGPBTpDY5y8PK69Mzss7MIfYBHErfIg
Message-ID: <CALp3LZ6HRs9pxPHj-4TYPS483cEaVBJ_kOGYmaWr--MhfQ6hCQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] riscv: dts: starfive: jh7110: Add the RTC node
To: E Shattow <e@freeshell.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Hal Feng <hal.feng@starfivetech.com>, "ziv.xu" <ziv.xu@starfivetech.com>, 
	Conor Dooley <conor@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

Hi E,

> Is status property applicable to SoC rtc? If not, then is 'rtc' label
> appropriate when there's no status applicable?

The RTC is in the SoC always-on domain and its clocks come from aoncrg;
the 32 kHz oscillator is set in jh7110-common.dtsi, which every JH7110
board includes, so no board needs to enable it. It is left enabled in
the dtsi like the other always-on nodes (aoncrg, aongpio, pwrc). Other
SoC RTCs do the same, e.g. Allwinner (including the D1), Sophgo CV180x
and i.MX snvs_rtc; the ones disabled by default, such as STM32, depend
on board parts that not every board has.

An alias is only needed when a board has more than one RTC, and none of
the JH7110 boards in the tree do. A board can still disable the node or
alias it through the label.

> Note that Mars CM / CM-Lite System-on-Modules may be used commonly with
> board carriers which implement a battery-backed RTC on the I2C bus, and
> so another 'rtc' label may be applicable, something to consider.

Good point. v3 renames the label to soc_rtc, leaving rtc free for a
carrier board's RTC.


Owen
