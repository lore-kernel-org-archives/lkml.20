Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC96468C26
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792392975; cv=none; b=reYA2UWvnCZj6nYv29Tz7q29q4LwVWsXTZ62rOx6CsIrulBdIBKELqcr7dIArITnPDeuVcpm7BOfx9Q2tyjOVdvSOtFoEXTK8OY+Y40bKjQxnCBPph4ROtjQxXnmOiFQssnTj6Ny5UmV7j80QrSgcU+ppULoJ7ISQlj8ZsIFktk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792392975; c=relaxed/simple;
	bh=M1tBQqzBGiCpQaTKxk2z3UZV5Za8hjx2LmCMzlbWuaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Us4J9CzlwOIgOR2FLreKrNkw27a86RUBd09N4BUsoE9tmQbAN5ChAgyl+euojntVfWAGG6T3MCYbdVsupqYWpQUDD0W2LrIslzZDyXj9IUrm9oUCllNP9Tetg8IoXG/Oq8dx4eKbZu2bF9RwfPJ135WXjyEP0dxeVPWgV7SaDek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-78fb1fb9508so222925137.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792392973; x=1792997773;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e1sVMAfuH6WXhZbotLQobiSRzr1r+7aDu2aCsNTstok=;
        b=mVbTO5xVe9x3G4goEB3f6O0AuTkRqQtOlrBjDftnuz4OXG6gx9JukDK3lTHv4xpL+k
         E/JN/FZw5SuSmyGNrfLddcDNphqvXkfpy0cKzoOgaZqbagHrODYA2Ryqi6eRka+VNmt6
         P87DewDD1d/Y9Fov45WL6FQVOTNmW330fdbw07bfREbiLr7JsPkJZjTx52CqOE0UsNQ7
         mlNKqNK99+dMcAQjAaafqQnAEe36FkoezbuURm6Fab+iZf182FOnVT/+XGAofU7bPwuW
         XhqxXLo/SKUE9nnftUF4e//7WrDLTs0wu7cFxYwYU7/rULzWX8j1NWKOtXy82acxZ+Hz
         Ht4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxfMG2KxU0Qw7XjHCaS8a/KfK25WElnIcddLruwKGVKWKtzGTd4rKz/bjvcHJ2Q3PJAnDXEDtMGl+HjI2o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaa5GtLJ19QXsLnzcFFcBDqVpkk0nWy2q/TPB994fO6Bp5TdwW
	dUnXNUZ43cAPOXMXLGOxDGi8IsJUtqHtBkMepEdlmLbH9PFAtnCT/1DMmw8pG/GD
X-Gm-Gg: AYBFou23Yj3ID6QQcwQmzfi10qzprUfrRkTknINFZZ8u+JsfavYoSrE/v8PrtYbLtd8
	WGine3P+MrQ89RWAMgyBneqVeUp6CS/n9i9xtyBZMW2eO1v3nopFL+s6pOLyjKQ3X4w3HQ6esPk
	diTWkO43ZUHLgCYp+QzixmwM7GxIZ6zmebqYY4KeA3Wk65a94XfeHPzv6qPdc1bvhyYP69oWW7w
	jfmE2Z7AhzNkkrxwWPPrOmvOrLN310Apus4tkpCVnbe/8Lnhta2U4V1NtshrROwIUVzYANOcK2E
	gG5o3/DTyDB92xBOD27naasVcssvtPoUrh6YqoIB7P5fxODiQRQ1oTt7rztO3ZdMAM44snNMVsC
	mrwAf/0ZhMx3OYAJnGOriEqbnl065JUu15w0/SF+wOmcFLX1bcMl+9sZPgS/6LNzwrUz1XdtObR
	VuP1eSUjiTR5Sst8tNj4AIMYxxSaq/FMPdvH0vd996z86eQY5u2wq2upt43tvVdGTHccLfLgSPw
	lpLTS2iAGULozqw8NpS7fPRCVETZ3/WKRA9
X-Received: by 2002:a05:6102:50a1:b0:7c2:799c:9018 with SMTP id ada2fe7eead31-7cc3644943cmr1698034137.0.1792392972709;
        Sun, 18 Oct 2026 23:56:12 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc197e9288sm8892138137.5.2026.10.18.23.56.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 23:56:12 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9906a5410f5so2776064241.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:56:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwq7fZ9oBxKNWwySRVTQLPYNrS4jLOj4LGoCZSmv7bFxpaKWLfxqyexa4qKgR8IHBX/qkmpMFj/ZlyQuJ0=@vger.kernel.org
X-Received: by 2002:a05:6102:312e:b0:7aa:d0a9:c5aa with SMTP id
 ada2fe7eead31-7cc18121fa2mr2108461137.18.1792392972220; Sun, 18 Oct 2026
 23:56:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261018161042.3298045-1-sahaj123.sc@gmail.com>
In-Reply-To: <20261018161042.3298045-1-sahaj123.sc@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 08:56:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXdB+1zib0AtA5zoJ0UeZR4TYeUSiP2w1DEHZ=1yKGYBA@mail.gmail.com>
X-Gm-Features: AclHuK9VSv0QigMKGBrmgQqHURXBQJfLZxnvzcmSGSBGel5gQdO-OSfdEC31cxs
Message-ID: <CAMuHMdXdB+1zib0AtA5zoJ0UeZR4TYeUSiP2w1DEHZ=1yKGYBA@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Preserve wakeup accounting on parent IRQ failure
To: Sahaj Chaudhari <sahaj123.sc@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Ulf Hansson <ulfh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 18 Oct 2026 at 18:10, Sahaj Chaudhari <sahaj123.sc@gmail.com> wrote:
> pca953x_irq_set_wake() updates wakeup_path before asking the parent
> IRQ controller to change its wake state. If irq_set_irq_wake() fails,
> the IRQ core rolls back its wake state but the driver's counter remains
> changed.
>
> A failed enable can therefore leave the expander marked as part of the
> wakeup path when no child IRQ has successfully enabled wakeup. A failed
> disable can make the driver stop retaining power even though wakeup is
> still enabled. The suspend and resume paths use this counter to decide
> whether to disable or enable the regulator.
>
> Update wakeup_path only after the parent operation succeeds, leaving it
> unchanged on error.
>
> Fixes: f70fbc15bae2 ("gpio: pca953x: Configure wake-up path when wake-up is enabled")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>

My bad...
Fixes: f70fbc15bae2c89f ("gpio: pca953x: Configure wake-up path when
wake-up is enabled")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
