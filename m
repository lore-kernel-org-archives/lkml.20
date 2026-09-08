Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5424E56F7
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858354; cv=none; b=au20eL1OJj9wXNVadheZkWnIVrifZvAGkWAcMtQ5G5GXmyeSCX6WCa/5s/uY72HYB4caXiLp0h9dpZmdgXjKJQUOObJQCaazbeQqmhHaV4hUM9+a+gwh9+HOc3AzgVuur7f/cCq+aog/BJimKujowlvWBXtKdhGcYUcPV+czgmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858354; c=relaxed/simple;
	bh=qENNEDqTfSxOEMOZqWtlSya5/dlWse6hSfPNt8qgY38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pRiwixCi4/LyXOqAV7Oj9QbyQKsb43Hk6zDWJ7zQ2+cddNlD+CsPyNPYT1K8/TEquUiqAbXLEtRjNn0tni0t5zQAz0tl5xJGAC06lqa6SSfwswdq4M8VrOZN6T4XUDCa8NaU0xsb7U0jFDmsO93Vi2ktU4FDi3VYzD121SArDGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c2c46a428eso3490195e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858352; x=1789463152;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A2RG0cKt2fiedWBmPN2R9LrrqHBfbGuuDFwRG5wsY+8=;
        b=AjsJrhP5JNUpPQY3ngOlI27kP8pwXT9mBxbN4/AcM+uhpCdRg/x57mI50LAhoOobEP
         a59pPMRaD21CTnrJnOyTDbJ+rRnVzy5Mbfmw1UMF7iRT63vhPnLORvnNjYYOAyaYvPpY
         N90NNmEMW6lVx4XGJMelK711PS5FxwI9f1NDTP90sE5SfLy4vETM5wqRPnZa+Hw8ksjb
         2vx/5m/nYLRPoS6QdRe5xr678m3s7MDH2NaXBYT6K6hVjmVxWMYb1DMoMTMyYyQRFn2x
         KsLuEkO9Jnc1bQ3EBoPD873mbkJ1NZRzefyeuc4+f/WVDMoXRcl3mwOmpxveiGdh87oS
         2I9g==
X-Forwarded-Encrypted: i=1; AKwUvBwh77MP7UB5zY2rZMeJorwAcczPPshWIU7fnRxcn77M59/nslHWZr7sewufVRg0GYXA+kTGyM8jE7tLUkI=@vger.kernel.org
X-Gm-Message-State: AFuF++nAcQGITScUMqqtPUWHOBQqXOzs4FtjhYH9Cc+O9jASaim5R0OZ
	Mf2wEvTsR1yAr+1JtLmSa+uMhty5LdeApXWVZNnzQNSss7tJUqY8tg5HkhAmgUCY
X-Gm-Gg: AYBFou1uOMf7LvBaV+SpErAeL2ro/CMZWbr8yzCDgMeZItSR+DR5gYpUa1Vf3a5zvc8
	rwC3FdpRFSpRBNwbLhmh3PT5MSYxlMYDSq3BWk0330mVBn2xeuuwxGjoaWrnMXXBjgSbNhCnG5b
	YLMUeiZKB5wM5pzQSgotajCa4Qh48lcSScuPexPsA1CnlK+M3O5RaB+3zCrjp5lYqyYO5EzNBIy
	2XWDs61spwoC7Hjf2GvzrDz/AwAgo3hyFQy472y+X25u+RfLN8b8gCPJWZ8Otb9UsZ+4rL7/nYx
	mf0o+4lmtJrdq/hn/nCbpkad5ACKx3wZQzoDfbbLmVgs9lEdL8JLbVjRBFbp5y8oRqswdZIW//W
	4zOcSTxamO9kbUWsmSOqQBEqF5iP2X1e+JmT+zQhxsUPeM8+abdDmyXNJr/sZrcuxh5if6iD42b
	sCnRQGlXc76ClUCxJvR+L5ZnDIe3zrpte8BXdKBa1QcuiKklqmDF/t9jWcL/6pEUnQ+ZTFMoGmI
	MT8Z14WC2JnYs4nVJHuBLurIpYsl2ljNCTh
X-Received: by 2002:a05:6122:1d08:b0:5c7:98a9:cf95 with SMTP id 71dfb90a1353d-5c7ed603f9dmr14546112e0c.4.1788858351833;
        Tue, 08 Sep 2026 02:05:51 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1ef771sm9325736e0c.3.2026.09.08.02.05.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:05:51 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-746d77537f8so2604008137.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:05:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByxQezsv+296IJW1k4xx1ZtE3LjeFIXRTVrLACQo8tJOlTG+Y6BuL67IfgNvxdVVrQiz3lERmbOZ0IiqEM=@vger.kernel.org
X-Received: by 2002:a05:6102:54a8:b0:785:c960:ff85 with SMTP id
 ada2fe7eead31-78a4a8e5299mr11703243137.7.1788858350778; Tue, 08 Sep 2026
 02:05:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260817185700.322370-2-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260817185700.322370-2-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 11:05:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVRtHVn_Xr8LgnUwYgQJ7nMYLPA0_psoe2Ovb6784YL5w@mail.gmail.com>
X-Gm-Features: AcwNN1VaOQFPsjNEjqZlOpJmCYxPCszYgVUjW-z18bFw1ijCstg7Yj1NvjUamz0
Message-ID: <CAMuHMdVRtHVn_Xr8LgnUwYgQJ7nMYLPA0_psoe2Ovb6784YL5w@mail.gmail.com>
Subject: Re: [PATCH 1/7] pinctrl: renesas: rzt2h: fix used_irqs indexing in
 clear path
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 at 20:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> struct rzt2h_pinctrl::used_irqs is supposed to be indexed based on the
> parent IRQ number. Do the translation using rzt2h_gpio_irq_map and
> clear it properly.
>
> Cc: stable@kernel.org
> Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
