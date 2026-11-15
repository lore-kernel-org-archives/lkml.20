Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794752316;
	b=d/YB28omnl5/DYF8B0AmkQODVOObryBjCsEgUy9T5iap3fEITV64WdTftBXmNrg6wdp8
	 Hjec0Q4P5gAgx7PtIrIk0Pxmmm30sx6UZTHZw7I6UfruJCDtruL/IztEAfRnWL/rdRZia
	 3ARwCbI/wrxzT7bvxzdUiF4b9yKLMvS0uDJ9XtMw+aL2WA1xwp9y5snERULIEQ+pHM7iN
	 TZNq084T6PX+wcUHM/pHiMABeJkgLa55q+XnR9lJ7iCx7unbr2ntnd7sHu7ngN8Mb5DiV
	 gaisHlPf3bSygHygCdJPKpme5VHx5FLGriGZksgcHDtdChP8Khc6Cu8EA1kP+1D8T5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=S704AU5qbUN5VbRr+2O0ZeqFrfEN5c1p3S93iVWr7So=;
	b=3/b1loUZPLdzYAtVZ+DjizYtkaAoVSXCoSlmDz7ybviMMLsbR5F6rASS0FHXHecIOADW
	 5zQB17YjmXWLyIQYZgrw6I0LOQ3qhFnQgNkSBmTPsgmph1cfq3nf5iJQuaE968uSvEpyT
	 g/PawniBfm/T4vbBGCRMUZl31R0JkWEhejhx3hG+hr7xT4z+xMud0CSpk12oPBB0eizL7
	 2tvLVAS2hnBGdlTAYghbIWV5lpzsHB+wWE/rHf49DH2RmVu2hX73Gs1cVqLo3uo7SHdEb
	 NJULoCbufs6RLgzrkzkDbNEKiC8BBxSj5pMKcLIFOt5wIVdfGITSsFub/D2/EKOqXoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=AEKq45wr;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B341606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B341606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=AEKq45wr
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso28108525e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794752313; x=1795357113; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S704AU5qbUN5VbRr+2O0ZeqFrfEN5c1p3S93iVWr7So=;
        b=AEKq45wrETpWcBoHsbmJ3tPNJ6GNH1SiKODswaqPbUOk8UJjpTOgLMM8Zt6QrBgel0
         gsHKx5HXdyfDJofwu9Vq8Fz+XJeesKYdOmSbgGGxrRgRNmLWfFEnZeus7L2SInTqmd2c
         lfQOTVjgmimMrzi7sU3sYmd7ieAFjA6Y/aoafEsWK9LXYMW/Kj2c5Csg6DqWq3Vbh6BT
         Z0ZbhCTeu3UyZLpDFEcs8R1YsoYR/OIMI9GG9+oT8cGDLozprBpjqroQeVZYkBC/VP2H
         hx3X/Sgsu1XszM5xS1/5BQbqI6C93q8OsfbqDsudSSalaloJxrVjARxbviFFI5hDS7k7
         Rsgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794752313; x=1795357113;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S704AU5qbUN5VbRr+2O0ZeqFrfEN5c1p3S93iVWr7So=;
        b=WEXLebPuN3xwB8BS6JwXUSr40AhbK2WFoo20bevZ2as4QRhkJ91nB6PQ2RdfVhzeMV
         KuEYl4NM1Xsxm0XuR4v/WkHrbwxIb+f140f+3aZV/bJlfsGn2n7QU3PN06lZczj+PmSZ
         2p8UGTMc1Mjarox18yuGTcfkWwwv1lTMXQLkzYnzYhFeWAPge7KY0b8/LkEAaVq8e05O
         ACSPfhxEnR6m9b3Qd/krrfAQZ3AUXoYI9HSxpjKpq3k/8Aay0FHjGl15DliB8MOrhY2y
         d9rMbPyAeEthu89YCFrMamF0Jd5JDOcIn/2eJ3iWtrSDGszIVWaKgPprk0LsNkweIAvC
         nORw==
X-Forwarded-Encrypted: i=1; AL+hErEyhBxfEJi3Gv7RQ2glpjykX0zt2htwS84ucUZRud7R8sTllqsM/yCZz8I2p1jS2FLN9psNKNL248f88ig=@vger.kernel.org
X-Gm-Message-State: APuU4Z87KEeW0bHIDHpYs2FpyNIKNkruqkZwS8hSWaTnqQWPt0Okf99K
	DnDY2un4BhXyzlCDADqyU0sLq2xwDnAn1fRSIPUhWRXwMaynJA7/eGJjQKHZmDbp2iI=
X-Gm-Gg: AYBFou2bY8N5swnyV9ekkBZNT7eLCP29ZHOhvuW7QvE4j1D7s/7zl07aK+Y6IhWijY3
	001LMIMEGddsxOD+UwSdmu/VP32zDY+T+53jqYZSjnN6dV50E3Qbp0ttINsJZo/OgOT6YJFdKQd
	n6D55HhbNXQlj0TllRhmwj6VYU9G1gWSRmufYu17AWVaZEHyZ6ONvC2Rhlw0zi1VOZSQFjf8N7b
	mWLHifcm9UUd9mXNGD6pPChd0sMO1IDICTYxs6SEPOW3/a6CgozYgLLzRxH2kjtguNxaDlTYbe9
	ExUkf1rNvmRIlEUtGrrx2Z4+7RMZH0jdXb6+Q/KUXZ4ajYJGrvozPG+yaDg+f55gENubSxrs+xD
	AZTPwrYSQAeNzj5KoMP0O7XMTo8gyuaGCewvRKXvRYL81sozVqfjBB/cN+OhpS8MEOuLPTrXuVH
	ILImGx2lS503M26dPUZLanXgD78uyI59be8P3kVeqJGp3nacIs1T/q+BZBZXVG20L2tq7lolOkE
	SH2QsDNWEWEacmIDgCKfTvZ2TyAP8huDKvGzZqDXJ6fUIoH3Hi0nz3GxrhP5Wb1AVqO/kc4kM6K
	ga7wZfX4h7cGm9uoKkoiWfCvXG4st5Rc2wOkGCLOpQxVI94KTw==
X-Received: by 2002:a05:600c:34d6:b0:4bb:5c92:ce22 with SMTP id 5b1f17b1804b1-4bb5c92d047mr132126085e9.8.1794752313396;
        Sun, 15 Nov 2026 06:18:33 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223b21sm18530520f8f.2.2026.11.15.06.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:18:32 -0800 (PST)
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
Subject: Re: [PATCH v1 2/6] clk: starfive: jh71x0: Move reset controller
 registration to jh71x0 common code
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
In-Reply-To: <20261013102707.9207-3-changhuang.liang@starfivetech.com>
References: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
 <20261013102707.9207-3-changhuang.liang@starfivetech.com>
Date: Sun, 15 Nov 2026 15:18:28 +0100
Message-Id: <179475230833.3873592.13070196353304136001.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3026; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=SzFQdbzAtEZ1BnfFOUSY0w8toQFX6y0M+FCu3Ru7vsw=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFk/95vzHzn/Wm9uzcPMf6oFG0Wunll3x/DbhM5fr+XsQ
 iez9HiKdpSyMIhxMciKKbLUcFeLv5PU+jJrus5tmDmsTCBDGLg4BWAiLqEM/ysdn089x/jq+N6j
 4Q1p+dVaEm9m6+e/vf7hfrst902ebEGGv3Lhkd56y34ulv/k/zPkvat185OPuy6rGDg9z594TP/
 BXFYA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> jh7110_reset_controller_register() is only tied to the JH7110 system
> clock driver by its location. Its logic is generic: hand the CRG
> register base to the reset driver through an auxiliary device.
> 
> Move it to clk-starfive-jh71x0.c as jh71x0_reset_controller_register()
> so that the clock drivers of other StarFive SoCs can reuse it, and make
> CLK_STARFIVE_JH71X0 select AUXILIARY_BUS accordingly.
> 
> While at it, replace the open-coded auxiliary device allocation, init,
> add and release handling with devm_auxiliary_device_create(), which
> already implements all of it. The register base is now passed to the
> reset driver as platform data of the auxiliary device, so struct
> jh71x0_reset_adev and the embedded auxiliary device go away.
> 
> The auxiliary device ID is dropped: every CRG already uses a distinct
> auxiliary device name, so the ID is not needed to keep the device names
> unique, and it is always 0 now.
> 
> Since the helper now lives in clk-starfive-jh71x0.c, the auxiliary
> device names are prefixed with "clk_starfive_jh71x0" instead of
> "clk_starfive_jh7110_sys". Update the auxiliary_device_id table of the
> JH7110 reset driver in the same patch to keep the tree bisectable.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/clk/starfive/Kconfig                  |  2 +-
>  .../clk/starfive/clk-starfive-jh7110-aon.c    |  2 +-
>  .../clk/starfive/clk-starfive-jh7110-isp.c    |  2 +-
>  .../clk/starfive/clk-starfive-jh7110-stg.c    |  2 +-
>  .../clk/starfive/clk-starfive-jh7110-sys.c    | 59 +------------------
>  .../clk/starfive/clk-starfive-jh7110-vout.c   |  2 +-
>  drivers/clk/starfive/clk-starfive-jh7110.h    |  4 --
>  drivers/clk/starfive/clk-starfive-jh71x0.c    | 24 ++++++++
>  drivers/clk/starfive/clk-starfive-jh71x0.h    |  2 +
>  .../reset/starfive/reset-starfive-jh7110.c    | 19 +++---
>  include/soc/starfive/reset-starfive-jh71x0.h  | 10 ++--
>  11 files changed, 45 insertions(+), 83 deletions(-)
>
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> index bd29358ffeec..51716655554f 100644
> --- a/drivers/clk/starfive/Kconfig
> +++ b/drivers/clk/starfive/Kconfig
> @@ -2,6 +2,7 @@
>  
>  config CLK_STARFIVE_JH71X0
>  	bool
> +	select AUXILIARY_BUS
>  
>  config CLK_STARFIVE_JH7100
>  	bool "StarFive JH7100 clock support"
> @@ -32,7 +33,6 @@ config CLK_STARFIVE_JH7110_PLL
>  config CLK_STARFIVE_JH7110_SYS
>  	bool "StarFive JH7110 system clock support"
>  	depends on ARCH_STARFIVE || COMPILE_TEST
> -	select AUXILIARY_BUS
>  	select CLK_STARFIVE_JH71X0
>  	select RESET_STARFIVE_JH7110 if RESET_CONTROLLER

You've switched to imply for the new controller you are introducing later in this series.
You should probably be consistent and align this one too. Not in this change though, it would
be unrelated.

This change otherwise looks good to me. It requires Philipp's opinion as it is touching reset too.

-- 
Jerome

