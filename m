Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8FE3EFD1F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534075; cv=none; b=oraiY5LIVNR+dnxaa8pZxMWQ2axxlx9n5762c5HLr3ijZV0cka2DdI1xS6v4YZP86MZ+g5r5nyOEfQy+llZY1jCBcIaJNjRu5rQ36A8txPLOcSlG0D65mmkQ5Yu2D3LlzRM8jlGrpp9VdMNrIfV5hTKiq1ymUG1EQKBcsXd7WWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534075; c=relaxed/simple;
	bh=90rHthjt/yGjs8ruJ73s4ajxZDBI6dnx8TaoyliYuBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eZ5iUAPsck/xVBBhsif8uZaUgJRmPTHZQNwVKqyyuumQHUc/Zw9N+KypDrT6bFGPgQ5woBV+SUbC4mO9/vcMc5xsPae2VBe47mlciC83mdZgr8PqNdtlJ8SQvVL8BjVz/C0mV0u+9QaPIYuMG91iXfeKN26ncsNNRg7P5B67M+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-97e9c0da212so732621241.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:01:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534068; x=1789138868;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hlQwu8m1wQp2ta11biuk/tG/NCV6kSdttoO7IfG7LVw=;
        b=dkZ8+33fr8dQX4i5AjwWwLqJXoU/JTqLIS2sTUvYonWGVGF1QQBC3z4jwRl2CzrIqY
         rf71YRz0FiNN7LxFgcdy3dWP3cVtUbU9K3hEcVXrjX4MhLMglMqGCcz2RgjguLM+splC
         ylyyIQTkU4TXsxw79Yv/dn43wlNDQhsp4Bx/JOd5pMyyI7KBIoq2qO6WqVM9rtuDZdHO
         AYEaLsjMNTIPwn4kB8B2FySLl9W6McMfsZfEvU6WeBOjM28aRUdqfKZjmsep7O0LAlki
         qYPQcNB74R+0aRzNJ3OKIscGWsJ5Kfp6Tmk9eurUfnvba3fE6gZ3r3+Ykr7Z8I9vHiy9
         ZmLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvVJa25xZA1cEDKJTa5VHKoVKhmM7QZG5irGYa8rHO0uZ3D7d/S89QLhlynTTemegZFOhR72tnxr5sx9U=@vger.kernel.org
X-Gm-Message-State: AFuF++nSpppjuYC4UpZgy83nbfhCRqYKNUmF8y3g2mgHNqyrZqXTFBN9
	rS0Vjbzw8oKtqKD7eUt5ubL7NcKKXYkfuScWI+0KCBsJ2p+lC3Y/KKJwVz6oIlk8
X-Gm-Gg: AYBFou29VviFzKrK+38KSy7Qb1I/N+DeM6xVfAI/SeDw6ppaE+6up1/yafBUZl+1No5
	HGSVYGqY1yiXsrw1UQT/RjVuzCCJhZYVabHw8BYn9LZByA+jPptrHicQhtFfDIYHIMPjfQP+fEj
	gvw52bGDQI/ng6Hr+gnzWTyk+5EIPhQ8oGF7rAHKd7YVKNHe5PqdEBuWgUpjXdbIpkYR2ej0bXh
	vp2vqPshLsD4FhQFQqGp/xJBrI/w4FaGaJD2Ipj2B/JGIn7iM6eLL74uZi5ASO+rXkLIgIzJj+u
	vn7hdBxg3WNRSEF3Kp2jRWRDys8NrKtz34sU7rxtAZBVbVWdlqerjL0mbZON5FaUZ/WzUMexgb9
	LDO8v1brC9bczbxtx2mjYzdJU51aZ/IVkZdfr60mIjIbqANU8cEZSwYR8tP0wb8utk6JPyPCfnA
	Imo54BgkHa55uCZrB6LO/uWd1j5eavmwWkrA7hgDw6k2VsGtZeJY0v2B6V1/zrv5a6PUKDRp2qs
	yvR1Xl9eQWq2yHm+dr0hRiaxg==
X-Received: by 2002:a05:6102:54a8:b0:785:c960:ff85 with SMTP id ada2fe7eead31-78a4a8e5299mr2272420137.7.1788534067036;
        Fri, 04 Sep 2026 08:01:07 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ee1c0cdsm1762973241.8.2026.09.04.08.01.03
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:01:05 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-98089686ee7so737345241.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:01:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxqP1YmSuDpO08l+3IDrT6DlW2NPIbixfD2qCwXzgfjUMf0tiur7E1lxJLOYUGIyAVx6jnDOpZIYWI6ubg=@vger.kernel.org
X-Received: by 2002:a05:6102:570f:b0:785:e444:15de with SMTP id
 ada2fe7eead31-78a4a8b86c6mr2573960137.6.1788534062781; Fri, 04 Sep 2026
 08:01:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-2-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-2-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:00:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVuyEXPJpCaE+MGwWN1qJVyzePA5--wsRTZRtFP8woCZw@mail.gmail.com>
X-Gm-Features: AcwNN1We_3fExHm_K1_nUZIVYeTkuFzPE8r5pnBYIyrcPLEEf_cM8LoiXO9Ji0A
Message-ID: <CAMuHMdVuyEXPJpCaE+MGwWN1qJVyzePA5--wsRTZRtFP8woCZw@mail.gmail.com>
Subject: Re: [PATCH 01/10] soc: renesas: Identify RZ/G2M v3.0 SoC
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Aug 2026 at 17:05, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add support to identify the Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC.
> The RZ/G2M v3.0 is assigned the same Product ID Number in the Product
> Register as the Renesas RZ/G2M v1.3 (a.k.a. R8A774A1), so use the same
> SoC data.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
