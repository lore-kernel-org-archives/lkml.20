Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0BA35CB7C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401670; cv=none; b=hrXnAkNFSvxyU0XBcOWngWue8cwxh3FeaYCE8gKC+09/oyCQw73ONMYG3S3xH1N2aR76bUNmYXFgqNs8Q5gosrxrJT+6DVAE3Aku3ZQdHsnJ3QXyT7Iwo/kfA/oG+lB1toi85D3aGZtCCcphE9yGxASibQpGuk68lR8yVh53zXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401670; c=relaxed/simple;
	bh=tidAyrhvNd18w/RMQ3ixTcc1CJXXLRgvNSZKkAY+9zI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CIxDTw2eR075X+gE3nj9vzKzzxzUOsYJBwIVk5GlRE+kqnEZZO1nU2FUem4Q9aQOllfw/G4zMVKo0CfGkaXvpDVzALc+jH3AFF5b9goMNQzpqUkloAjQ/qffaqYHO79oBs1o6azdAbA9h8aODDHBh/qqfCQvcVLsDo5U1WPGmpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-785643199c4so627783137.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:01:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401667; x=1790006467;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qykkjFNFoMY5mcORIRq6zXUVDXiXOh0EpjPHb+vO+UU=;
        b=f+o3luBa+Z9DHk8BFvdRjveP32lfsCK6gQNkejIUX2AoJAHfzhaVxbyt5JjcXuP9fQ
         F4gGG+RMOYpImdxn90gopQMeJaZuvQcpPxIIAV3lO0TWiADg10X68tOLRMA1IphAk4oI
         qeUzF3Ch4e4d5iELfG+15BywBdoVqSUmCZ2wKvk6Sh2kbc8deFuPB9QYfuonOkf46dDn
         a24BzVBu7CnklVR+Pn4I4rVRizooGdq1/DxjYMzL+NdINV4kfE/v9b6MQVETfGPwJEov
         iIUPNN5vXecXcw2dpR6WuryzzOiUtEwMN6maCL4O1lzhvFe5/yNYenDnZnu6/niPAY54
         K+vA==
X-Forwarded-Encrypted: i=1; AKwUvBxqLzFSg/x+xojxQ2xtjUK0IVC9F6ONTpT3zBEtamhOhCQ+1F5c0u7V+v9VcYLoQqW9hK4gT3efFTdMOQI=@vger.kernel.org
X-Gm-Message-State: AFuF++npiaH8/YH3KVXQO64edKFq6BsQ6kkK63xH2MD2iIJvMDYsBoD8
	gWGIR8ziMT/ZBQzHe3wuVjyqkZ919fMDOIGxZaMJyxyyAcirhalYPixz8myHa+Jp
X-Gm-Gg: AYBFou3pMRkVMp08yoc39Vn98x1tVzMe1v8Q75eQdlJuAxHuBYnFqIBLQ6NwlOFhvVJ
	7gQucqmmxACwV3jsy4q1QFGh0OBVoboVUKsGFCBjlfS5a7vhS1YC57DnwJgywM9d8C6G59HjG4n
	gsO1hJYGbepvsdlXVYZo2rah16VIWrsqQWvt9x/zkKiyJQkliZiac9KU6xjoyoIeI1Z6E8U7Oew
	pIRC+YfZzn4WllncDK0DCgomW6IuyZopgPeNo2jCH53R+QWAeLhNuYHDqbHgjdugv0kdkewgIqm
	/GMN6L+C50r464BdeShvDJ0JRVpJab0PsaAjVehBAw2jCNOn7ILHsXMruWyodus9MQpa0JXfC8I
	SSfIaiC4bSKdYmEXweS0zg/FOoJiJIkHKLVUWMnClTiENH1eQrMujqsOQpu4A7aeE3Vod1q8ZmP
	jdp4ppt7O4HRZSXFnnkkRTzsqp9SQ32/agx/dQvoTiW1TXezKZHwI1UQHkoScqY03l0rsta26NM
	T5wUmB/fINCLph0/Y2LQM06BKbPYscFhcPdhg==
X-Received: by 2002:a05:6102:41a2:b0:785:c643:a415 with SMTP id ada2fe7eead31-79b5bc499e2mr3298174137.12.1789401666578;
        Mon, 14 Sep 2026 09:01:06 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7927cbdf149sm10712083137.4.2026.09.14.09.01.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 09:01:05 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c62dde2so680939241.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:01:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByOjRWPSMZiNRKLrbUJpaW56zK5TEzjTRbbY+8fbJwQk4vc7jbUI6y3+fV6f7JVYgBCF6CEc7xkqkspcWY=@vger.kernel.org
X-Received: by 2002:a05:6122:e266:b0:5c8:4409:602a with SMTP id
 71dfb90a1353d-5c981e978a6mr3949153e0c.8.1789401664780; Mon, 14 Sep 2026
 09:01:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913195654.3371385-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260913195654.3371385-2-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260913195654.3371385-2-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 18:00:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUa+v+dU3rYbo94ncntsi_O5jxTYz+R05Tiw5ugvbgCDg@mail.gmail.com>
X-Gm-Features: AcwNN1UsCcmNqwTW55VDblIRDqEUqSmSDNxHTD-MZM3Vsk3F4Hbvpn5nqDQZKcw
Message-ID: <CAMuHMdUa+v+dU3rYbo94ncntsi_O5jxTYz+R05Tiw5ugvbgCDg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] pinctrl: renesas: rzt2h: restore correct pin mode
 on IRQ free
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Sept 2026 at 21:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> rzt2h_gpio_irq_domain_free() calls rzt2h_pinctrl_set_gpio_en() with
> false leaving the pin in interrupt function instead of returning it to
> GPIO mode.
>
> Pass true to rzt2h_pinctrl_set_gpio_en() to take the pin out of
> interrupt function after we're done using it as an IRQ.
>
> rzt2h_pinctrl_set_pfc_mode() switches the pin to Hi-Z, losing the
> previous PM value.
>
> Save the PM value before switching to Hi-Z, and restore it after the
> IRQ is freed.
>
> Cc: stable@kernel.org
> Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
>
> V3:
>  * no changes
>
> V2:
>  * switch pm parameter in rzt2h_pin_write_pm() to unsigned int and
>    remove the u16 cast

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
