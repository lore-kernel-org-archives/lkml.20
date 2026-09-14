Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB18E490C1C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404761; cv=none; b=l+Fsc+UYLTJUQaQ4c1U0Ks4AboOTF3+fC7H1gvk9do45nxK7wLY4U7BmRPMhyIkJ1PVEeh43xO1qGvnWY/JzV5+/5mfdBQKc4xphOvmtHYzZ8dxQvsDec1XTXJ+aObIjEml+dElKROsPSj4QjytYDAekQ7FUxt+fnG9xyVVWTiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404761; c=relaxed/simple;
	bh=Fd2S2NXGFBalIowiEWphlMNoSm/GpBg0YH4nqBrZ3ls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aVuMheTbBPQx+abdoyplmlOFJVOlVPugkkhoznLD/rxbJx/BuqRp4HkBAXXFycctBPzD7S57/aVtHgJaC94WuUWqjoLdAbsRVjt1enYeD0cOkZumv7aQgLVOpiFvVNJW3suNUrT3iKlq/rcjulfzLeYow8u1CnwXGoRnJX3cQ1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c8319dd4a5so907467e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789404758; x=1790009558;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W3a3IBWWzJToy5a1Wctoyn07sbyxrLzeKnit0JiQFO8=;
        b=oVdGgHs2peg/5wIihWGbv2fUhz9b0NBRcrvwOcK40+9NoUcIDiUQotxNIQpF5u4Gqg
         AxQt0G2+TOgAgCB9mIj2UYj4stqSGXKneke4U9+NXVtkke6YAArqP7fkl1UD/EcoXGA5
         gnxDV06rcyfkL3smWgHWxKvrJRVjm8j8ET6NN9LFrvrn2p3UDttJlmwed1MseIMpUFul
         l6fyC/6BZMR48H66dRCsCC3qx3+B2cXH9XXrUQ8uF+vsc8npOBQFUupW5pisaMVGb55d
         xSAqkVchoE+W3Gchv62YnhX+HuqmVt21IUtgI/MEeOPsvn03nCIqfYAUD3eh1f68Jtkc
         jgBA==
X-Forwarded-Encrypted: i=1; AKwUvBypxh6oWxclCmzTMfmXi98u67C8uabmY6hMXdD9xzy3/L6WAp9PhswfCp/OqzprQJixZ/LtjKFpelL+89s=@vger.kernel.org
X-Gm-Message-State: AFuF++kUnRJeXAjdZTjpUpQcwyrQyjuMZX1gvfy8wAlbwHs1FLG+ZtxW
	ZSbzmYtpkmiL+Fv2Ikpn+uWtEd8Y6Vv/ePIREUWTbvoCqUwjRjk/q21q2xZLLwaz
X-Gm-Gg: AYBFou0tzFaSaYlh/XkC5vhP88MK9b90Ez9IGa8i9kbmjS9qh3QnDpA1moqKnnji5oa
	Y6W7LSUPJFZMXQoZMngQJ/g8SZExTEDqyLyKIlstB0eIBMNR0Pi+YPe9BetdaozyKG8fdIp3qSM
	qjgPB1jm2Lb1rDFQZQYivhUU+SvJ4RY4Orym9xqKPovWpW14yiCfpu8wyn1naJAoP2UyEDuKVzI
	NI7dY9iXsqLYA4oIaKEPtgm6/GFad0cZTA/x6kRUChh1QfmChfXwyejogi57sXT+luxfJ5cbKpW
	b08oL+SVLEiL0P147M7Er0brytP3qQ3elbFek/5MjZleSRtBxwC1Y5fsIrYkTGhwlKSLiv3hpkG
	6Qv5w54GGDD/bmTQ5OweL+OiI+qqL19uyklRoaq9GPGNKAh93r+3dvdi8tJ5valZmntRiNy9OYT
	TP3vu2koACAMhbATZ8RF57tiXcSYswfmP2o46ZdMoRrFvPbX57LRcjh08/c1N03SR6Q1DcRlR5a
	eEQKA/oiNH1IwzBXqv4F7xNpxQwz1/hJQ9W
X-Received: by 2002:a05:6122:20a3:b0:5bc:42be:f758 with SMTP id 71dfb90a1353d-5c981b4a171mr4118116e0c.3.1789404758175;
        Mon, 14 Sep 2026 09:52:38 -0700 (PDT)
Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com. [74.125.227.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c8470e7ef4sm12828660e0c.9.2026.09.14.09.52.38
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 09:52:38 -0700 (PDT)
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-785643199baso728616137.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:52:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy5eOg9eCzl2uVIZC8/GaBQzCnDBTvWhhRBPXEN5txO06dteLspIi553iEx6grtoJteWdLKuTw52QlKLp4=@vger.kernel.org
X-Received: by 2002:a05:6102:e0f:b0:799:b918:687b with SMTP id
 ada2fe7eead31-79b5878ab25mr4331172137.7.1789404757823; Mon, 14 Sep 2026
 09:52:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913195654.3371385-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260913195654.3371385-4-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260913195654.3371385-4-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 18:52:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWi8Jz6GVGJj0VsXOEiOw4ghJgz895m36m2hDvVCkxpxA@mail.gmail.com>
X-Gm-Features: AcwNN1Unuk-LkzOotScnYJj-MKknR-KC4le6kfYxk1N80HhcIpZu4mg1zP5BRtg
Message-ID: <CAMuHMdWi8Jz6GVGJj0VsXOEiOw4ghJgz895m36m2hDvVCkxpxA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] pinctrl: renesas: rzt2h: fix reading pin value in
 IRQ function
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Sept 2026 at 21:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> rzt2h_gpio_get() only reports a level for pins in input or output mode
> and returns -EINVAL otherwise. When a pin is requested as an interrupt
> it is switched to IRQ function and its I/O mode is set to Hi-Z, so its
> value can no longer be read.
>
> gpiolib calls gpiod_get_value_cansleep() to determine the edge's
> direction when a line is watched with GPIO_V2_LINE_FLAG_EDGE_BOTH.
> Non-zero values are translated to a rising edge, zero to a falling edge.
>
> Since gpiod_get_value_cansleep() ends up calling rzt2h_gpio_get() which
> returns -EINVAL when the pin is in IRQ function, every edge is reported
> as rising.
>
> When using the IRQ function, the input buffers are enabled and the PINm
> registers reflect the live state of the input.
>
> Report the input level even when the pin is used as an IRQ.
>
> Cc: stable@kernel.org
> Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
>
> V3:
>  * move leftover unused function to a later patch
>
> V2:
>  * remove the PFC_FUNC_INTERRUPT check in rzt2h_gpio_get()

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
