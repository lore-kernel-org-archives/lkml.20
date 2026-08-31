Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB1B3C456B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161927; cv=none; b=NVDjyD6W+OAUg2ge6XK/fQRM/7fgo0mYBXC+RrWw/UBrEfiF0DaUwF8LBKo33fTz5mt6kkXLN9pbE67d9OVWT/ke3i8rQsaOTS71gFrP9iKCWnhN7sdGGtkvnu5duiGaCMO5DnkS0nGPiwLB6SMbx5o0BpkyAXvhmFFUa5VhYT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161927; c=relaxed/simple;
	bh=n+bm+oD3kn40fyS7L0liJo1kS7q5/LI+20B3up/88HQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qg2SFOyLhgS9Q+nH7zL6Rp/GVB43+JVldy/bzOEn6kYQPFbY3e/cKBVMWNx3B0Xrz4QEX1DblJWeWnhX7UPzfLNsmQvP3zq9YpAHwWJ8DKn1IqMnHzmOlGbpREnsCEtntbltIXr0UkjNMKNaWK3qWLQvYD4rRrxuDRsoqXEt6iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7466771f1caso690870137.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788161924; x=1788766724;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1+Wb6c4hy/mllkEGw9UkJDy4J8V6hEIxHDRjaIVv61Q=;
        b=abr81bYDSELD3F4glx0aze1aGPa6xBG8WoJN93OXUKzqy4+wgdX997eltg8AWWdD4Q
         v2yJ3O278QZ8PB8tNAViL3YpNTv1YJZJVIOiPUXwV4piO7HDSt8eKVfTD5eTFHi5reZ7
         ZO7jrizzBpvra/cNhWE8tdhZhDotL0LH+sWoBwMbx4a3KcNFqm+wzXmPZliOr+x60Gwy
         Qb2YzxWMkDIgtm1uwsbpoq4Wka9ouanE+y+nBKEYdprOND7sXNOv/Nk40S5SJe4tb7VZ
         rC17FmB3wPPGyhegDWLlmnffer6AIkRYko19xa/dTOhMmWiix5ttStXkQwMJGdQaLaYj
         JMGA==
X-Forwarded-Encrypted: i=1; AHgh+Rqp/ZSBvKBzvJ292lOLwAP5kbE7Oe6i0CIHGqcOvjZQ2jUjv8vnsdIbNLGuH2lZ1UD7xu0B7cbzHC/cLNQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n285ahaaaZNJ+Cym0cYMF0+KsIlijK7o0HyyJ16oDxHyCuHl/I
	TlphXocDAkAD6usObb6u9aot1xhDJ44LwSQtrlMLTqnybPHoVXQc+gmlphR3nv52
X-Gm-Gg: AR+sD11BTni4lP01O7jp8UWOWN0F5iGEj7aX18WND0JYzXPXXDB2W/0m9KlJwm0tjzG
	FV7JyJbNoMhBXcceiJ7056O9iKnnQrZwFqXYqrqnhSGrcmyRXwMCMQvHVuvqaI7uLwQVVZH5izt
	gJQXnxXfY5NHR9uK6ZBjMJX7jwbFFtoUvHklwehB6EnK0UQnO9MT2lJVpjjdAC/EAGEQUT6UWxQ
	4GsP6/QqNjKReQrbUWsIC50LVRNNzWZ24mcMUzUsnDoHLSI+w4+rBfI17GQY2kF/A+oSlqKKr64
	7DaeSO6MlddR54CtALiXvwRZpNhvULCaQFpQHy5kc/99MQm9gEIZ0W4/aZG0DQb84JAwf/aiZhJ
	0kDnP+uPQzHmnO8suv+7T0iRCnC1Nkph8oh9Yd6QDpQSJmVd7+qRgiRpqQ0mfNtc/alUu0pq1EB
	yHQjIuNaZG8WvoEfCU69j2wkLVQh7KdGVZm5GxTTiREmGTBKvR1//iDRfTCs2DVG3LnV8bkc7GT
	TA/+Cv/dM7KHWBuOglkP56tTWttJg==
X-Received: by 2002:a05:6102:508b:b0:787:74cc:2cff with SMTP id ada2fe7eead31-78774cc4a2amr4234887137.3.1788161924204;
        Mon, 31 Aug 2026 00:38:44 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-785f532aafcsm6207829137.1.2026.08.31.00.38.43
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 00:38:44 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5c6559620e3so1301261e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:38:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqCgQzqdpYAi8LCZO0ES7Ws8dy2gefF78Tsxh2eOmRFaBxw1CNvkobIUjQHot9uyxHJ32lXV8Utgdtsecw=@vger.kernel.org
X-Received: by 2002:a05:6102:418b:b0:778:721:53db with SMTP id
 ada2fe7eead31-7859426191emr7077458137.0.1788161923583; Mon, 31 Aug 2026
 00:38:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1786929430.git.fthain@linux-m68k.org> <1e349506a7cc6aa574aacbd4c69c240b5a1e3eb8.1786929430.git.fthain@linux-m68k.org>
In-Reply-To: <1e349506a7cc6aa574aacbd4c69c240b5a1e3eb8.1786929430.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Aug 2026 09:38:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXgtstGtcbRkrtKtQ+d1c=mCe5zgYZCx4dyUQ_YnVhbbw@mail.gmail.com>
X-Gm-Features: AcwNN1XVC3wu-2rZS0i2vSr8DmQmHBettg6W2uihbfihhqw2AlLs5EB1RzHcC7M
Message-ID: <CAMuHMdXgtstGtcbRkrtKtQ+d1c=mCe5zgYZCx4dyUQ_YnVhbbw@mail.gmail.com>
Subject: Re: [PATCH v2 07/32] swim: Enable clock divider only where appropriate
To: Finn Thain <fthain@linux-m68k.org>
Cc: Jens Axboe <axboe@kernel.dk>, Laurent Vivier <laurent@vivier.eu>, 
	Joshua Thompson <funaho@jurai.org>, linux-block@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Finn,

Thanks for your patch!

On Mon, 17 Aug 2026 at 03:55, Finn Thain <fthain@linux-m68k.org> wrote:
> Some models have a 16 MHz FCLK oscillator and others 32 MHz. Put this
> information into the swim device platform_data so that the driver can
> correctly enable the clock divider. When this is enabled incorrectly,
> nothing can be read and failures from the Error Correction Machine are
> flagged in the error register.
>
> This is chip initialization, so do this in swim_floppy_init() rather
> than floppy_open(). Drop the udelay() which was apparently copied and
> pasted from swim3.c, where it relates to interrupts (of which this chip
> has none).

This move should be a separate patch.

> Cc: Joshua Thompson <funaho@jurai.org>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Fixes: 8852ecd97488 ("m68k: mac - Add SWIM floppy support")
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
>  arch/m68k/mac/config.c | 31 ++++++++++++++++++++++++++++++-

For the m68k part:
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- a/arch/m68k/mac/config.c
> +++ b/arch/m68k/mac/config.c
> @@ -984,8 +984,37 @@ static int __init mac_platform_init(void)
>                         .start = swim_base,
>                         .end   = swim_base + 0x1FFF,
>                 };
> +               unsigned int data = 0;

Nit: in the absence of a real platform_data structure, please use a
more explanatory name.

Perhaps s/data/s_fclk/, and store S_FCLK_DIV2 or zero?
Or s/data/setup/, and store the full register value?

> --- a/drivers/block/swim.c
> +++ b/drivers/block/swim.c

> @@ -807,8 +806,10 @@ static void swim_set_parameters(struct swim __iomem *base)
>                 swim_write(base, parameter, mem[i]);
>  }
>
> -static int swim_floppy_init(struct swim_priv *swd)
> +static int swim_floppy_init(struct platform_device *pdev)
>  {
> +       struct swim_priv *swd = platform_get_drvdata(pdev);
> +       unsigned int *data = pdev->dev.platform_data;

Likewise.

>         struct queue_limits lim = {
>                 .features               = BLK_FEAT_ROTATIONAL,
>         };
> @@ -816,6 +817,8 @@ static int swim_floppy_init(struct swim_priv *swd)
>         int drive;
>         struct swim __iomem *base = swd->base;
>
> +       swim_write(base, setup, S_IBM_DRIVE | (*data ? S_FCLK_DIV2 : 0));
> +
>         swim_set_parameters(base);
>
>         /* scan floppy drives */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
