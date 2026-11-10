Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794317969;
	b=PonCIgySuUHDHydTIyGWibnfgvOto1++q38gabJR1idH5caNLS64JEsNgBxUlMAgThRo
	 oTvUo+l/JlqLz7iuYfKG5TCpmMUVBTz6Pruy2+j2kTRop+toD6FRHMHWSZDwMv5mLxy87
	 Xtc+icC4PG2KwvmOucHVs5bTFmf8Izl4kCrmoqZKtk2Rd8sMh3+alUnNZ7US/oXLBb2MV
	 ee2A+EU1nLM+iihehEQ4l3+ncdn3trl9DdyddKozLFQg/BwU9sZuPcIlHyt8D3uExBBXE
	 VE1D7M0XxE0gFJLGBCfnQ//guGJSItdtjXwSGLnIiVcmTyrTDSyJzn5w116wDE0xthA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317969;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=kSnlaqH2icJsjwNTkwpevxyVadDJDL69yr1qt1A0z9U=;
	b=ZOTtMogH9GsYOwK0O9GBeHt4wbSNMZwtR1ACCiD1uz704AtPYfm99jZvEKwa4HjTI/IV
	 dwNEIVQ0UPufn73snEHSZmViZLFuinAoT1jkF35HrfxIg94jHjs98WCgIcd0PFDAtFNAS
	 zhZ/lJAiO/KzQJGUEil4CMEmxdL8AnFgo4lhY0c1p+Z8QfniCfUs3o7gE9G3+J7h8d0ZP
	 P8KqMcrcZFKil10vucAnZ8OLHqG8wJO9jDT+aXuloaXb1Gi7B1CVshmDXFwHoMSidMfwX
	 x6dq1klnDE+ZJfQOyqZqMbRJfwACs5EkdEnudOIVD90W7T7KDgdcRAjd9LB/h8NfKOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CF8606A339
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:39:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74CF8606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c247f6687dcso338423966b.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:39:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794317968; x=1794922768;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kSnlaqH2icJsjwNTkwpevxyVadDJDL69yr1qt1A0z9U=;
        b=y2oZsQSJwjZiT4na6D1S811hT8CV6INET7N2+9+qXjcCDOa4G/85PWhzC9qVNL0ka0
         m8aSz7y85bZASRRVvVr5ZRvhH1RXsU9BhVljHyKc3z8Vns1ergblw65ODXtOq/qac+MZ
         /e6hTkFoZP5VswVtMLxbKOIQwfOffNcem/iE5ja3EDGXxWVYvuDI1CaWtSCydvKsAADg
         3XqaRQm0HnsYaqAb/KlnuosIBfBGlRmO0HmrBg07NlMx0hAh3+clBjAbFT1IK4lwqcye
         qrFqt9apqRqx56OsE6VwCbT7HLHABPznO2R2IOezUB+vTY5tv/iSwj0W89kVh+wTwN/O
         YJDw==
X-Forwarded-Encrypted: i=1; AL+hErGbfKGCamqpIKP207yenPm0KJyXfdRV+wJZjpEpb31AqVLPG8LIPirhgEHRjXJDNcpBNKr3qnbM+sdgN78=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tJ+T2axMSROQS3esTjG/rCh1GtgGimVvKmx2SJdYqsoxJSnh3
	P0sob5ZSTX7EegwxTn/QsS551pDdpD2tgMJ9TeplLo8PLVNuNeVectivkNN7EwHhw9o=
X-Gm-Gg: AYBFou3rZxmfJI9n1XGRAHyK3EE4bomsSSI/kadaCYw+Lo9KUsU8I4MHxSNOJd86HLz
	Ozluv4WcAUBv76C8TxS87C3AzaPIhsRu6NDgSnh8i/V/nl7KKWBU77WvugpemDlb3FCeXrIox1v
	pSAF5vNkb40QTR6VI0Ky0nJBpV7Gyow9K7994dBdJyXgwXoB6tBxxR+xx90KQXqu8GpmgsEn42X
	kDVStHZwLocJ20wT5rjVmjfQCETynLUE8krFQENyOG8dKZobg6HSRyEzNEaVS/tXRdppG4f3Jl7
	5pmmtMLCbKQ+quYOkH+I7lGZf3NOuaXvsV08t3twyAMZhM75CGGp1YGXH5DWDuFENdZLW3eJXyw
	COJbqkMEFc44/b2OADNfHI/W7N1630uJZ6vPm/Soqa3YQNVPRM4Mpfqns7NxJ6HBUnEH+e2W+Jq
	0PY1D8p3eXS6Pj8EmA+hM7M+qrKt5oWjRVlsyQIsWax7rc9ucRWq/PVQhf4w6p4c+o9hB5ljETv
	uFAcHnkHw1qmjvWtVx09q2ivWpLGWH1XAhRTa8PRxLZZJAi1RqOIoJq7vYpBitBZIGZzHOBiGMR
	8CjDnpdmifXJKkO3CGYR1OCYqvF2ISHk5idFWnPA8UcPwI4q960jAiDOc/2/+5wrZK06vgv8MPi
	NbRZGOjzot6J5
X-Received: by 2002:a17:907:6e92:b0:c46:645f:cedf with SMTP id a640c23a62f3a-c504952badamr236367366b.15.1794317967677;
        Tue, 10 Nov 2026 05:39:27 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a62b303sm107603866b.58.2026.11.10.05.39.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 05:39:27 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c247f6687dcso338404166b.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:39:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEqzMyBTLFN3nETw7Ulo2FG8+aY4zHZ30AXSWLeASEEihDP2L0O53bV+paIuHcpGNiC3fKvKvgVPoAXWWA=@vger.kernel.org
X-Received: by 2002:a17:907:2d06:b0:c46:a607:6922 with SMTP id
 a640c23a62f3a-c5049585db5mr235694366b.25.1794317961521; Tue, 10 Nov 2026
 05:39:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106110923.164090-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20261106110923.164090-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20261106110923.164090-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Nov 2026 14:39:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXppNKiFH-Q+q_fZNwCABWw8KG2Jcwc9jL5+GmNFuouHw@mail.gmail.com>
X-Gm-Features: AclHuK_lqFzG1K7YY8lxHYxynu6A8iqMxQa89_kBquxOkn_I_cpIfpAejrm3I1U
Message-ID: <CAMuHMdXppNKiFH-Q+q_fZNwCABWw8KG2Jcwc9jL5+GmNFuouHw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: renesas: r9a09g056: Add ADC clocks and reset
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Nov 2026 at 12:09, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clocks and reset entries for the ADC controller.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Renamed adc_pclk_gear to pllcm33_adc_pclk_gear
> - Renamed adc_pclk_gear_div2 to pllcm33_adc_pclk_gear_div2
> - Renamed adc_adclk_gear to pllcm33_adc_adclk_gear
> - Renamed adc_0_pclk to adc_0_pclk
> - Renamed adc_0_adclk to adc_adclk

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
