Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794227251;
	b=pq0SakP9/xauaY2fBLqFtVv2WWfK6T5rJYojy7ZKsXe8uihUcczkD/yrsFbHW4WrQVsA
	 /F+uryMJn43FUX8scBb1/tLCCa9Uh5TMBFddJQAYf+j7famwQ+G7Ti1Q+1g3aeQm8f9qV
	 H9MObDkQ2q6dglmC5hubT6DCeN0gcCEt57PrQJEzNHmYnl120MYxuAdHk3BSnJRiUesVL
	 9tcCJl7yCunCX2eP0dq2Qz9weKvObQi6PA6ooq9eE0lrdJA5mzk+W5lad+p2UbXhr1ivi
	 TzybDrRFM3dWv027U4IkXFZ13379W8BKNuq7IHeBQYsvfBy0B4Et5/uzUhoFK65HNGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KRuHgKKM/Ft7bPONO48ud8NMa7YtAiG1oSVTdvzPD0g=;
	b=NXVwoNFj7r62NziMWvZkOUM/axk53sH1CpaV43f5pRFzJjjrov6D5UsnMnnUkvHauBqf
	 5HNXmr3RyBTfxS1C1Khc54X+/4JsTFF8enitcGesG1haUBANJ1+knmDPfZMbrt0QIu+Jm
	 5xHJR/wBH+1PnWZMfcUgxFKBkL2H9BuWS55CWiVwnM6n655EY4Sa9Avi5V1zloMnBJ2lw
	 NhMszNtbI0gaT4JJ+GvPmdWbKXk0UqxgUZjq9kgisSWtcPlZRF0Ode5T9YrU/0QRd0jfT
	 ebCh8yolv4Wg3bDGvrOPEnhMlfbo16ziEfCmC4wJpeFzRV+LsbYntxJpib/P4+CNwFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QOgyhbeq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82044606D801
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82044606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QOgyhbeq
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso1079436a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:27:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794227250; cv=none;
        d=google.com; s=arc-20260327;
        b=f4J8LvZq9Nda3ulgC3PqTtegyaQrg9++HhlNSw+qOe6Ub+ekgnhUQBWnmLix12Vt4c
         eq5moByNOfsSy6FBDZkVlVFAjSRQSBHipy361FvlAbw0Qx/FQ7hO6qNHQ2YwbdyL2TQl
         r/0NxZrqqkR1VlH8j5zDJYDK+RdK867Zw/TaZbADVOR70/ZcKdlXWVHhUt2X9/scTjjI
         3YmGOAuwqVke76DuP9KFW3ezDKts6zAWKXz3v1yd5EOCDcx6vT78UbSuuIwBAOvUL9aN
         4EhGrmWsJhZ8nB5ARKRCOIPv/y5UtZyPtxGWvoQDq+ztL8WFvPvMzJWDBbM1sryoun/M
         zunA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KRuHgKKM/Ft7bPONO48ud8NMa7YtAiG1oSVTdvzPD0g=;
        fh=L/NpfC0QbyUKaPKcJ4ThE+XtBJTUXGiVIAANquS+je8=;
        b=SkAOfdtw/b2Ow4d+bisB6Za5YbpdpcYzlLWsImPJ2XpVZwaxBijq5XZpaawbM1+pSL
         n/3UBESmKQT+AP/OAkJ5TbcPmIdCQhRAsZF3Q4P4tHvvG4bAewUwh8V8IQsuHiivRPtl
         xQbrB62fD9yWvULT9uBPCbhNdMaEiwM7jpdlpKSiqerHI8wCkeO9G1G//lyz08sy/e9J
         rl0Y8Sezuo/CVCgV+miYhDqU1ULQV079o7mfCL/iL61Zw2TCtD5qrM2lyh4Zoo0ag/ja
         Iepugo/8U53guL+YVry9XY1jjFyePZ/ONkkYKu/q9/RTwp0d25LgKqUs8WGp60Zflc09
         wLAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794227250; x=1794832050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KRuHgKKM/Ft7bPONO48ud8NMa7YtAiG1oSVTdvzPD0g=;
        b=QOgyhbeqOwd2Z8XLJx9wuh00POYRhyJMgoyTP2JMbJJZZwVnt12qxlUpcwNXgfG+pp
         JaMwEbHHzfXgzSVYNUUjUGAHM4w5gIiWjKVMo79/N4Kp7/QNLp74fZlfCscaySJbfldb
         xQdArFs3VDfGTOs1UtGkxdrVHUOFJ8um8haAtZ9RIzulS0FS+QUM0zZPsQpT63l+ktjO
         SVICn62kPn36QNCk9ALNSp6FdvD79vNG4ObZxi9TgEboX/0B+2bu/ByYWc9nxsh+fkt6
         CmD2fpaF5ijY1Cz96O8VMTE4HMTAPlOe0mt1ogz/3/yMi9wqTDx+W9cVvmqfelt/BCIs
         /rXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227250; x=1794832050;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KRuHgKKM/Ft7bPONO48ud8NMa7YtAiG1oSVTdvzPD0g=;
        b=npBhnLqIlIdLDLmisWEDFD/HQxMx5Q0a1YTHcrK4dQDyFxhJ8+RiSyWeQufLmksff1
         At4GKAAeSOM7xMe7rdk9IrlqsmGl5DBp1eUOWpjBAChpOcILeRN5N2Qa36wcU/cc9L1u
         2G05OJKzDL7IB2h9jHiPDrUMZkhhW12EnsrbvJra95kdh5q46DwCfQJa6OspizkFRoqt
         2KorUeFjClkiE48HwLVvTjX24uqb4E0zrNku85qUF+c/Nmxy81vVgAbYzDX5DpmvRKZa
         X+O02/y8FRIQaU3kiakRqcEQnk+hbNSsk+o47WJVGQumJVdKEcYFxQ1OF9VpKEGysk/U
         bEnQ==
X-Forwarded-Encrypted: i=1; AL+hErG5Jieqowzb21KHN1OkqoMyI32yzNnSIBCEuPKi9Fl0Q7M/KmKWIpfqkYNQKW0BT4WOFyydZyxzpD5aQ5E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ud3ZL4EhUOyQGUIUFa7OBzQajCloPdSN/OpTFvNHYeTrJyJ7K
	Pxu2cFtP0sWfoTQ9rgfhYAgZATaVa2Chv8VvscZNe3/4G5oWHTY4PQ+X6T7RmxU0S7TEsbS4viQ
	mO+0B82hST0pmuRohAU9t772nqWJBGwA=
X-Gm-Gg: AYBFou05rLmlBFRna3dtz+0WMUbPBLNStAD1zkmC/Hrz1vnPI7rw3/7BamhOHH41RpP
	fm/a7Qeibx9/WkLAHUsBgDQK+ZnTHuN9ghoGf4djLQJQjdyHC0+61PPAenyy5j5JgN4ePrrjqEz
	735olTtvxeppqw/C8PKVYurKMfvI/DKR5zYPPA5GeGaFOmmKMgxJRjtcfNJUrHnpQoLHZPb7C9S
	3iiXsal9V9A56eVeVTeOYvpwn10BToqVOST+q00hCypMxH0qDuQkdtAcy0dVYdM0ieHM3iyIPB5
	/PQxhves1zVuQThfg83MnB1wU5LzhTRlF2WSPcDDusRm660znDRkdRkgPdtPg7ajq6o5fQ+pa0h
	nq16StH7AH5JZ7VKA1Fwjdqa7g2jGoLJE6jCT/6XZHeaISrB2rN2DeV3agrTzbdPKcFExZLy7iH
	aXRywF2IrN3ECEAuD6weyQqnUNinZ2rNL4DGrCTZIIGKMo2qxvJ35DGytpHIg=
X-Received: by 2002:a05:6402:3895:b0:6b7:8b1:aa79 with SMTP id
 4fb4d7f45d1cf-6b7223c1832mr2314095a12.5.1794227249763; Mon, 09 Nov 2026
 04:27:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 9 Nov 2026 12:27:03 +0000
X-Gm-Features: AclHuK_ZRUUlCMH4HvENtZrOvYlrEIYJCdD6Zdsj2qnZgU93aq494AwRB7CTooo
Message-ID: <CA+V-a8u-3NFryZA_8GN=fR09+fcyvNGLMV-09z-mPXTePxkgvg@mail.gmail.com>
Subject: Re: [PATCH v8 0/7] Add syscon support for Renesas WDT driver
To: Geert Uytterhoeven <geert+renesas@glider.be>, Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Brian Masney <bmasney+clk@redhat.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, Oct 1, 2026 at 5:52=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Hi all,
>
> This series adds syscon support for the Renesas RZ/T2H and RZ/N2H SoCs in
> the WDT driver. The WDTDCR register is part of the CPG/MSSR block for
> which the CPG driver registers SYSC regmap. WDT driver now uses this
> syscon to access the WDTDCR register.
>
> These patches were part of two seprate series [0] and [1], out of which
> certain patches have been queued separately, so I have included rest of
> the patches into this single series.
>
> Merge strategy, as the WDT driver now includes renesas.h header file,
> the driver patches can go via renesas-soc.
>
> Note, patches have been rebased on top of next-20260930.
>
> v7->v8:
> - Dropped patch "watchdog: rzv2h: Drop enabling clocks in the
>   restart handler" addressing Sashiko's comments
>
> v6->v7:
> - Added a new patch to introduce rzt2h_cpg_wdtdcr_count_start() function
> - Added new patch to drop pm_runtime_resume_and_get() &
>   pm_runtime_put_sync() calls while accessing the WDTDCR register.
> - Dropped propagating WDTDCR access errors.
> - Dropped converting WDTDCR handling to regmap as this would require
>   resource address comparison to get WDT index to call
>   rzt2h_cpg_wdtdcr_count_start().
> - Made use of rzt2h_cpg_wdtdcr_count_start() in restart handler
> - Added if regmap is available, use it for WDTDCR access
> - Updated commit message
>
> v5->v6:
> - Used pm_runtime_put_sync() in rzv2h_wdt_stop() function.
> - rebased on top of next-20260922
>
> v4->v5:
> - patch #1 is new addressing Sashiko's comments to avoid potential deadlo=
ck
> - patch #4 is new addressing Sashiko's comments
> - Dropped checking rzt2h_wdt_wdtdcr_count_start() return value in
>   restart path.
> - Handled the regmap locking in the driver and introduced nolock
>   version to be used in the restart path.
> - Added review-by tag.
>
> [0] https://lore.kernel.org/all/20260817192540.423994-1-prabhakar.mahadev=
-lad.rj@bp.renesas.com/
> [1] https://lore.kernel.org/all/20260814191415.2110732-1-prabhakar.mahade=
v-lad.rj@bp.renesas.com/
>
> Cheers,
> Prabhakar
>
> Lad Prabhakar (7):
>   clk: renesas: r9a09g077: Add helper to start WDTDCR counter
>   watchdog: rzv2h: Use pm_runtime_put_sync()
>   watchdog: rzv2h: Drop WDTRCR_RSTIRQS define
>   watchdog: rzv2h: Drop runtime PM handling from WDTDCR init
>   watchdog: rzv2h_wdt: Add syscon based WDTDCR access
>   arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
>   arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access
>
Gentle ping.

Cheers,
Prabhakar

>  arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 24 +++---
>  arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 24 +++---
>  drivers/clk/renesas/r9a09g077-cpg.c        | 35 +++++++--
>  drivers/watchdog/rzv2h_wdt.c               | 85 ++++++++++++++++++----
>  include/linux/clk/renesas.h                |  6 ++
>  5 files changed, 129 insertions(+), 45 deletions(-)
>
> --
> 2.55.0
>
