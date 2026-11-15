Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794752322;
	b=fesmU2WcOZm01KfrDvq0074nWQrOI+fvUesBgTmTPBMiARGN0/f41ky3ASJyYeD2hIYi
	 xYwKyLBjTjzESDI/27up1YFP/3WhvL+W7pfYlKw5Jg+LDiYGtnhBTccpztrzuT2kLsjuS
	 yj391enjeS3b6JnbGcgf0E5UMbTWZhmbmuW10YR2cBgYURf7m8lNCHKDbV1De0TLNlijg
	 RvWBNSNB3Xi8ewB195ctqM22O3ATLU3izYr4bNt3kTcwI7bVUXxpKHd4U6g3dWukgKAUA
	 3fGn9Jr0nCeXdcZKH35YIiMq6FvyHCVa0umD/d/ZKmelV/0eWNAawVNJn7172pBm5mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yg+6x1taFPz1aG2RIqr++6bIa3IK0w7NjTUlcchGBio=;
	b=uDJZmWVym6c2NF8TZyGpfs6mpkvksxCXIm0NQoz3PY2m1VzwJSeJY7Ow/b6U+YPSsLS1
	 E4YkTnM6kF4MoI9McD66fz3ZXi6sbaPCy/dv0DKkTbD/11yFc1xT8qEFWgcM3YaBnP9Lo
	 i2mDiUhXbofbJJTermYq+hisu9tJVsCUNzZ8bsnJDSmRq5n8/CgOOyXDntDaeZzopP962
	 5CeQuUOzV6xCPrsQ/3Z0oNRatyA7yWjv3hW8sgDNmzvNkYkKiduga+q9SwAbJ+j90U31p
	 uvM/okjxWJiD64RTgQQk5y3S4VrE3vrDWqAOlL0r9qXBQvxgQ/JMQG6RWtuA5Y9gPAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Dzm8NTv0;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A285A606A33D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A285A606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Dzm8NTv0
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso925512f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794752320; x=1795357120; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yg+6x1taFPz1aG2RIqr++6bIa3IK0w7NjTUlcchGBio=;
        b=Dzm8NTv0uKn0CqPPjh2nKHSOmCFi47zZLQ7/cmoD7K9DiSpoDhf8Bmgm9a7f66fVfl
         ZYmc3X0SIUfXGTKbae1gphVhc8IBsi89pnZLru6mScrct/MPwWa1GcqbMIo8B/MerJSo
         xS8710j4f2asPuW7drnMQ/yzxP0UrDkQm9b5J/Rw/UthN/ZBqIvf6YqG9z683iPQtktE
         r2q5yTMiwQt+/TT+hcZNpLut5G18P9zvifIF+tLl+jzmwbKRBqmppd23qk3gWfJknVsO
         AIxA/KZM27D5whv/1eG6qkecSC+VtWsGkLjW/sU/idrxJjcCoaWSP/aADpfQQq1VKYvh
         RjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794752320; x=1795357120;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yg+6x1taFPz1aG2RIqr++6bIa3IK0w7NjTUlcchGBio=;
        b=Xs+iSNga0oHfkqg2+hBZDpj9ssUD5aATI2qhjOD8BMHS7nCHvGOJysBGdONT1uHVye
         4CTbqwR/eS1oTYbO6JWewL1JzcB43sauAB5FwjwKTRd+RI1nZdT5PRf3JfPUxGzjl1qL
         eBx8zln3F2gklhiTdVBDoMjjb0HcqlN8toyJsyxfMtDI3j5HWmTb1Acpljd/pt87aAAD
         LEiY0CMEvlqtPvwaLoTyO6B66g4pWrbfaeEzhNbjRdwlNrGPv/iDZeMzkKH3z1rWxiww
         /oC1OXofsjfAkTWjliUpX5YTyuFLSGfRPzpt3VYfsDBidK64WhRqv9HToAvbxqV3IPgc
         gqig==
X-Forwarded-Encrypted: i=1; AL+hErH56fBe59DtiEc0K888frqINazD6+YEeMal0u4JC9UlXc8yakvu5oIfBPgIGpKiqS0yGBFaXZd9MAc0M3U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+V8uWnjcRbPPZCVDYINt68ZtxWxDX8MoEuwHWQDZSJn8rOkMIa
	fY/DTJEISS5NPSDO0qIh8a9t8f2TBZK2RweX7RmTjS1q8PGk5qeQwBRL0t0QcNSfh1o=
X-Gm-Gg: AYBFou3xDISR6/iSL/bW8jtsnGa2TZej3OBLiHw4Nn+rdzEwXPS2+2oHrhNXz++Ilzg
	Js0DB+hA9jQl2PtlapvzyxWeLcMR21HLfmrQ53UpNl2oVSVaMWdBVBw/x+C+ZQm15AcYBbd7xXH
	DUNwn8YuwOBkTKMAm7o0BaA58VJ6A4mJrWckNBseU+ndHaPlDN/WzOP3lVaAx24OMptI6xuseaJ
	yGrgwayRghoThesvzWvylokRWViAJvZbYgipzyO++N/wBnS8si1VtrbBbfXy7mbfKjmc1ldguKP
	iIhB58+7zWUML4mBy4v/yRE9D87uIKBevHE0HJEsqCzhs4/CYuMyPT4zXaAT+HfTMXPEv9/1NNE
	sLnkY/wTXp3tTrjx/blxOnTY06PkcGX5Zj1wuSYLguvmVl9epoOcE5EAD/YsGU7VMTxjaV+RYVa
	uCxT4bvIxr1igkNwL6f0oUNxxwCZDRJFPiHjPJJ6rLSQ+45YNd4FMafNyZMBx3Ah9xD2L3HkGX5
	2fu4R59R5ak1R+PWmgHw8lAmrvGan4mHD4c/t4MgQSUAvBQgsH8rZgQ3NpZ7Qcp+LqfMOensOxH
	ADbGr3kYlTim6cpqXhxWOYXfhJi628D6Aqowwt51IjSYWZKb
X-Received: by 2002:a05:6000:26c7:b0:492:f563:cfa1 with SMTP id ffacd0b85a97d-49c73ed0ba9mr17977136f8f.55.1794752320034;
        Sun, 15 Nov 2026 06:18:40 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm17400553f8f.8.2026.11.15.06.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:18:39 -0800 (PST)
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
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v1 6/6] reset: starfive: Add StarFive JHB100 System-0
 reset driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20261013102707.9207-7-changhuang.liang@starfivetech.com>
References: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
 <20261013102707.9207-7-changhuang.liang@starfivetech.com>
Date: Sun, 15 Nov 2026 15:18:28 +0100
Message-Id: <179475230833.3873592.14107280802504551112.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2441; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Apxx3Ov1ydC3jlD163T+qDu/ZuqndG5aUGB/PTRcBEc=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFk/95snLg5eWf6gfN/cd7eNeK+7ct2XeLhA9fyZ2Ifdw
 aUXGnamdpSyMIhxMciKKbLUcFeLv5PU+jJrus5tmDmsTCBDGLg4BWAi3zUYGd79iDxWUNy96YPo
 jLWvixQltj48/ErwXcDMiA5r1t3qoZkMf8VXaTvsaJ0547OP7Yxb39Ws+j6E33qolafOZLHo8CP
 LY4wA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Add the auxiliary reset driver for the StarFive JHB100 SoC. It binds to
> the auxiliary devices registered by the JHB100 clock generator drivers
> and uses the register base handed over as platform data.
> 
> Start with the System-0 clock and reset generator (SYS0CRG). Its reset
> IDs do not map one-to-one to the hardware reset bits, so the controller
> is registered with a reset ID map.
> 
> The other JHB100 reset controllers are added by follow-up patches, each
> right after the clock driver of the same CRG.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  MAINTAINERS                                   |  6 ++
>  drivers/reset/starfive/Kconfig                |  9 +++
>  drivers/reset/starfive/Makefile               |  1 +
>  .../reset/starfive/reset-starfive-jhb100.c    | 75 +++++++++++++++++++
>  4 files changed, 91 insertions(+)
>  create mode 100644 drivers/reset/starfive/reset-starfive-jhb100.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f66998e8eb64..c2ab9cbccf49 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26858,6 +26858,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/pinctrl/starfive,jhb1*.yaml
>  F:	drivers/pinctrl/starfive/pinctrl-starfive-jhb1*
>  
> +STARFIVE JHB100 RESET CONTROLLER DRIVERS
> +M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> +S:	Supported
> +F:	drivers/reset/starfive/reset-starfive-jhb1*
> +F:	include/dt-bindings/reset/starfive,jhb1*.h
> +
>  STATIC BRANCH/CALL
>  M:	Peter Zijlstra <peterz@infradead.org>
>  M:	Josh Poimboeuf <jpoimboe@kernel.org>
> diff --git a/drivers/reset/starfive/Kconfig b/drivers/reset/starfive/Kconfig
> index d832339f61bc..84baefbaee14 100644
> --- a/drivers/reset/starfive/Kconfig
> +++ b/drivers/reset/starfive/Kconfig
> @@ -19,3 +19,12 @@ config RESET_STARFIVE_JH7110
>  	default ARCH_STARFIVE
>  	help
>  	  This enables the reset controller driver for the StarFive JH7110 SoC.
> +
> +config RESET_STARFIVE_JHB100
> +	bool "StarFive JHB100 Reset Driver"
> +	depends on CLK_STARFIVE_JH71X0 || COMPILE_TEST

This would mean it can't build without the starfive clock being compiled too.
There should just be a shared header, unless I'm missing something and the
clock already imply this driver, that should be enough ? no ?

If so, 'default ARCH_STARFIVE' can go too. and just

depends on ARCH_STARFIVE || COMPILE_TEST

-- 
Jerome

