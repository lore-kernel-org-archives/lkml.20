Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835944A5C27
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442773; cv=none; b=IxkeZ3EiLdbIj/Vg/hMZWPsRIBz8jh2yYMD5FjtsYKi5Hs68JoeIgw3H1facKbCPCTOYi/X/o0F1NA8XSb9orZE/zficsoG8AV17pVNZzl7dayheoL65uE25vsITpMp+kdHE3fzYDOQnKvdsOaOWHLdvdYTdqLWRh6y3paicU1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442773; c=relaxed/simple;
	bh=ImQDDFj9qVjPIWDEX0xwmDVNDBDG8sj0eUt9eSQ9/DY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=evu2hAtHjQw6Y9ovdAd1+bKjtqdu6cg4wXB/c7SgGxOKpzOeRY8rjwuFP79am70J4iAglOInlJ+UTFPl4S3ztOHSSo9amfweFApfPdp9BxP92S43JTtST6TlCrZJp4o36md6xhN+vS27+QXPccjEgvqNyRvofUTFp69pnnoDu1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c252e703fa3so349876466b.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:39:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788442766; x=1789047566;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3kI/3YoXSD5l4MUFY+JdTBHSS/S10bVdqe61ILAQItw=;
        b=fs+B7WM03nZRjIaAtzVqStQoZiV5OulCRjx+Hp4S0od4td64OMcxVL/ina6z/254Jb
         FlTIJwgJ8p1gu4Ax9vjqWj5k6JEwuDiETyyVyDPd05qs1Fs8hzzDxZ0KW9q359hJ8F1A
         n6bH6fGzCmG1+V7jOI5cFIBG3ahtqwjldiNoQQ4AGtuboX4xI6oH5fImkqdd1HwUJBEV
         +B6A2RUvt9Q5vs0zhVFCOZb+TZftdMflry8ID9ejwkd0ttDQEpEBB6fYEy5ir3eRq3iM
         PfYAxDwwwKZ3iLxUfBvF0Dy7hhj9urMYVqCpzoWDP3DgsUICBkTvDbOZlcKKGoZklTOi
         4N2g==
X-Forwarded-Encrypted: i=1; AKwUvBxRkT6T/s114CqqCOBE674qOolLNPjaS9x0sTI6KEG0QCHJ3EAMm9LV1PV6+5PenjvoE4wskhKBx/H0zNQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nAZ4pGTwIlo5fwgk0oHyd9e+HGHBrFrvDoZzG3+nh3Uus3ECO4
	VeEc6tWdUW7W0AStTeKCuCbjRBuhRl43Z2LSAlW5ITtRbdPh7hjzNy3kQTNEQEa7bQ4=
X-Gm-Gg: AYBFou1na9TynTvICzLuIu3EzZINfhqeNfLJgcvJFUmY5tWs3ZHG+iBsgykNVakAt4P
	U+VAB7Mt5wpltqCwcgEx0iK301uGagbK/0AiYk2XjXkVAxC+dXnxT6E+PhWxMKZM6L9ZLukAqYV
	WeLW0DCkat3Blxbv9e4ybJFUnu/ZJMGoQlWXtM96YX4gz25pNPNnjeAvvIkWvnXwJEODsW7OmHs
	KfGCWfzYiDqD0PEkdPKmppDbP7kOUHoC+BG8ZSjRCphPkTKQaQ/tBPekvl/pOaJG94wdsaLNalN
	Ke5yGQgdqcemW1K+OtTmv3fV1xSJanm+xGV2oyQwT7x9SLxXqmwJSH8zK98vQXs8bpxPdzkUBD0
	ibsz+pDZ68GeP8EJ3ko38Ysr/4FpdrmZi0WJ2xP+v5Ts7u4Li+gUKbFVify41FIVSHcspJCLAEb
	LtNATJxk8HA9ecaozKLbCv37s1X4Ykpsw5bu29eNAOFEz2y7l8KPCY/UhJUQ9XmqssudTtv2457
	dMBVx8leXT/fwJtbg7rgXxKCg==
X-Received: by 2002:a17:907:7b8a:b0:c16:101d:7afa with SMTP id a640c23a62f3a-c25d54fc0d8mr817949066b.16.1788442765645;
        Thu, 03 Sep 2026 06:39:25 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f41a363dsm101873666b.34.2026.09.03.06.39.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 06:39:22 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a38098734bso4464936a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:39:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwONOIvhb9qbAXNFWW0JBoh12YLdMYWo8y6/Zh+Hnz3Dxt7oRungtlYFq+cvJaBiJr7X3PbY70/bLPxFNA=@vger.kernel.org
X-Received: by 2002:a05:6402:24d7:b0:6a5:fbc6:cad1 with SMTP id
 4fb4d7f45d1cf-6a68254b68bmr7079678a12.7.1788442762167; Thu, 03 Sep 2026
 06:39:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902104939.25522-1-ovidiu.panait.rb@renesas.com> <20260902104939.25522-3-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260902104939.25522-3-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 15:39:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUZrmXfpmuxQdw6phK1YGJHyhndT64vmsdzHE9FO19jJQ@mail.gmail.com>
X-Gm-Features: AcwNN1XvRbtPP7ZOjowl3YDbtGxIvYTtX57sf45BGJvcFDqDNY8G0uf9IogwGTU
Message-ID: <CAMuHMdUZrmXfpmuxQdw6phK1YGJHyhndT64vmsdzHE9FO19jJQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: rzv2h: Convert to clk_hw based provider API
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, John Madieu <john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Ovidiu,

On Wed, 2 Sept 2026 at 12:50, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> From: John Madieu <john.madieu.xa@bp.renesas.com>
>
> The driver mixes the clk consumer API with the clk_hw provider API for
> its internal clock storage and OF lookup callback. Convert it to use
> clk_hw consistently.
>
> No functional change intended.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Nice, thanks a lot for picking up John's legacy!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
