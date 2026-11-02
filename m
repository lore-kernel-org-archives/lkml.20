Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635404;
	b=HvyT83mR9BLuCU6QwvjdDBjhDalrTtTZvTPBOHbxjPChKy+izXGRCLEuXBZcBP5nETha
	 sZEY6H3TohKmLLhy+DAJNM2wG7XFyBL13wNe1jNfJRxBRmYVRJsFOYNBs4kDw08BOiCkh
	 s70aIIPw6U+ydUDiQjTpOLYRovQLCrhzrM4gBGXll7kp/hT2cEcPMhDUyf4dvVBBVAi1T
	 2B6MK1SBG5IcJIe+Gbz7xWK/cx4rdNtBXdzt1f90m3FF2XZTFh1dYsqRoYBGFuZuvVRoV
	 jQYu0TUf2si4/9VleteL9Yhw5oAe5Qg7q0rlk1fPaBxmQgkoKvmK4y8aoaYbhXXvMdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635404;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=3vbLOX9hUXZuFkvJUQUq81vQYgMMNAerq8+/A9OKKiU=;
	b=O9LDUazEJ48xP+oZGur6hXBM+KsCR6DeYmLNW9OXdNLT3Q9UC0qf6YrUB/2fOrzxTHf9
	 KwcO081n2QFPMzUZeyFL8hkAzYDPC34b0PsJg6dKWOokRgFs3nZ6dJhp3ruTRkxL2HpXx
	 swTBgXTIMHPpYJiRsHchP0kO5w9K1Kc5bXVUwf5O82up59xeVsHYdZvh/LAvctg+aom1a
	 Kj5zqC4G1GclE7L5qbX9R0SguSUDT+ZatjlUVaFse6ZTZO6OvsjtWC1AyxJb+HmUt8uhr
	 5lIfUwf//gExugsVP10uUwH2iYv7nWQZgPrAoR7zOnMVcrSUTI8EOKAECP0x4AhnJcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23DA606C555
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A23DA606C555
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c169ae1cb26so673112166b.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:03:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793635403; x=1794240203;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3vbLOX9hUXZuFkvJUQUq81vQYgMMNAerq8+/A9OKKiU=;
        b=FqPhyXjMRhAW+URu2Kktup6+xFBbEcF+d3MXLbOnbDHY1KMOzIfxFzThUd89WVH6pP
         +iLe0rC2yLbXoVLM4DCzyqQR1ErrmwzZ93VLDEPb9nkdT9JFyfJyDfd5F4LQMoCLCIuZ
         bSefvvo+47nVVzm49hLsxBUosBtSAQDKt4FFhR8jXW1ZCNQZufYaAsiCnYaOR25zJRmQ
         PchlW4xeh6MIeafI645J6pLpaHYg57Ttiw6qzoEz48Z1sQgUsZjzaZbUt4JF+dqsRfGN
         eTeaSiJFYyXTdhMsqaWw/X9vVwWRQLFTojN91sS4E/aDMvReAgz+BJMmsIUx8t+9covb
         6fig==
X-Forwarded-Encrypted: i=1; AKwUvByOTtotHBxBTKUpTS41A1me2BtxlELR7qHEW2XtKVPvi/Fm7XfcR4fGquZiP/+zRxKiZF9QPhs6Gc3byd8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnragiqFTFvpvg8njiGnhx1A6vE9sTut0zYOKgiNQAiyXUrAWK
	8zqNNbWDG4ngZqR2hzwveGe6xmsdWu9ZrszgphLPF3BCKjBbbzZx3EQWSnjom1mLARE=
X-Gm-Gg: AYBFou2YlGxU4qSVVInGqaDRpdDcNyl7NdWluNmfJqPLho88awnJE+Ga1yoTNKsjIfR
	C9uvCI8xyTMFCxsxg+RA0NMQ9kjeh65NqFVq12TZ6VmP+4eUO9yPUyE49r/p3YFjiYxu2MVSEOZ
	2MQ8H5Xs3CrMm7ckDmAkAT5gvIzgr3QDDv5j8nsRbH4NBcGI5Ijl+ijpWgC2QTou2rgELaxluSM
	3g917FIzWmaeR1fTFN4cuexKhpWdc3EASPbW8Cdrre7Oi+zVIFifG0+7VZarZ8Mgpz0Hs7pYnJI
	O+jXekOmNFlF/br5TlQoOiZtnowaLAd8+4y4rrxKlEWdF4Axy1+E7COvQO5ryhJ2URok1PF9FPX
	XWGXIkJ7gTe7KwW9d+do5oD+bWyGP8uPNHQZWrNrGgFgzf7z1AWyGuDqR9iPjloEqGZfIzEVl2C
	9aXHZ/KEjziCeqGSvOAiUuq0XbHq3yv4hg7MmghNJlFCQgrWfzHoArwpfeeZgTBt9UpYFq52uwo
	+u477PxHpdYagM0255b1R1cZB4PbH0Jo+HrbyRTj8YA/Bmg1fnweYe5a4Ral19YNkUPAmTCkMLX
	Uc2CN/6wKaqytJz9fHTP4QXYcZP1/4eEwjMSGG52AOSn4rOsAU5kLgVGzBaWy3K42Q==
X-Received: by 2002:a17:906:eec1:b0:c31:5918:86d1 with SMTP id a640c23a62f3a-c4ca7a6a5c2mr891514066b.10.1793635402900;
        Mon, 02 Nov 2026 08:03:22 -0800 (PST)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cec15a904sm3873766b.70.2026.11.02.08.03.21
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 08:03:21 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b1aa27963eso7521812a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:03:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBztiy4h7S03R5UKVT9uBLamYFi4na2Us0lGwqFVx/6ygHmK9Jo8jS552n3eGgPPwFm7uW+vLLmVw4n1VVs=@vger.kernel.org
X-Received: by 2002:a05:6402:234a:b0:6b1:a67b:d378 with SMTP id
 4fb4d7f45d1cf-6b4d6d83607mr7493394a12.17.1793635401030; Mon, 02 Nov 2026
 08:03:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-v1-0-47f23de6bdb1@bp.renesas.com>
 <20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-v1-1-47f23de6bdb1@bp.renesas.com>
In-Reply-To: <20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-v1-1-47f23de6bdb1@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Nov 2026 17:03:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVv8JW2fdZ80qw+TUBjG3Rt7o3wKvbbm+T9vQCzd_mMYw@mail.gmail.com>
X-Gm-Features: AclHuK9e8kCdmujm3UbBsCP_C2y2QUNK5imSGIGpgUeiTEwk-YufKAJHK9WyYf0
Message-ID: <CAMuHMdVv8JW2fdZ80qw+TUBjG3Rt7o3wKvbbm+T9vQCzd_mMYw@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: rzv2h: Forward PLLDSI mux rate requests
 to the parent
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, tomm.merciai@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Oct 2026 at 15:26, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> The PLLDSI mux determines rates itself, and on the LVDS path it reads the
> PLL instance from a parent that is not the PLL, addressing the per instance
> parameters past their end.
>
> Forward both inputs to clk_mux_ops.determine_rate() and let the parents
> carry the request up to the PLL. The parent encodes the output type and is
> selected through .set_duty_cycle(), hence CLK_SET_RATE_NO_REPARENT.
>
> The mux wrapper is left unused, so register a plain struct clk_mux.
>
> Fixes: 3afccee4a3b8 ("clk: renesas: rzv2h: Add PLLDSI clk mux support")
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
