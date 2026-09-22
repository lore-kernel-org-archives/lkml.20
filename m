Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A17443C12
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790068996; cv=none; b=cbs/wXdNckYpHKJ0faWJd3Gqvp4v0kGHWE3rYqZb1CQFmiTkKOOHrdK/N5jTbMQmih/6iZ+ElYjcwgReCUDD1mNRliesiAuProOvIXEMEDcfmX6UwKehH9/kUEOZB+KVUGWp73Q4Jjzo7yNSSn/IQvVuy/pOKZHdlA7Z7rHYVsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790068996; c=relaxed/simple;
	bh=zQAGAJqK01u1hsgk9tM79y+qHgIMow8bJd7VCIfEqak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lu9STeC7UyYUehxTJpqSSKOde6ZNJHXsfiLtRczrBLkvjsgtVp3C3LPqMi79wxgOOr+9gdgoEB956VJIX5vpqxWGAQLoAGXC7plohMXkNOBeJh6JPDk4kefR0ysTP5nZMFfPCrYco6EmmFuXJD4uAET2r2U2YQMEBY53ZWTRfJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c7b4ed2so2292410241.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:23:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790068994; x=1790673794;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gxG2KWqjG9DQXNsqNUjR1bwSMAhv13VrmESGniF7QY0=;
        b=Ioknj8dGlErg0Zz5xL8QDKxYgpSdvLHDed7NiJJEoSm37gRBKmu5k1npHScyJR2LmN
         b5YPxFKzrFllUwd+/Xrh3N70JsfHL9XGdVeDz06jZHkAM4TrDBfTEhIDcYR2DRgK/IgP
         qgy3I6YTKuuOZaxnaW28AbkGXnky8EFqTH+VmaRrRDPZbtZaJCw3JrWvM84IGDRuIvkR
         y/zpyuY8z0/lgjaawzxTH8Vum1omjYfFpScFTgHjZoSmVlsmW+kXgbFJisz8vJVgnZD5
         pjZdL4m2VeLHiMiilAn2jfaGsVcxjaOd6/C9v+Zqw+FvXBBtYCNi/gn+6DMIQzgbdt3h
         EBwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNPz54NbxO8dSsx7RC1s1Cxiqg01/NE/HVJ7p1V5n3NMXVQnxGarJO5sJ827Mk/FdfgmPC5m8txqXYWZk=@vger.kernel.org
X-Gm-Message-State: AFuF++nI+SfDmtKEAJXBhxFARQ726wEu8SOdgzD2XJ4g/J8e/VDR3F9h
	OaltGsYoikT9OEBoQ6/rfrWyLACt2J+mOCSXuG+w3hsIy28TyP2HhidYc57nOYWIGcM=
X-Gm-Gg: AYBFou08YxGhDB8e073PgcGhsQ2rAYCu++usSqiT4zFSCpkyz9T5abFU4ypo1845EgT
	28jlQtjRId/LliUAMRJRB6jqe8Kja54QvcJMRUhppyd55TXNjXsvgmbzUwCOjAVFSrCvEkVhttf
	7r//XEBGHA2AZzPpsw1vFjOXHFhf7DZgSE+wkH8jAQ8uobCvvOCweqUXZ/hJUUTeS9Seqy8BAN9
	YDtqdgTKibQR5LNcVrgGnoC1t8ZE67UlYyF2uO4O8QrR/8b5Ky4ps97TACQWuojoPQz/JtIT+/v
	EAUG63M1UmlaSI0dRPe0YoDsfQHorlQ+wt+Jnx86ikMt2ccy/Ciw07nsHR29bETaccpCfVK7LRk
	1KY1kDodEXvo0xNfoU748Mf4IaHALjeBcB0K+nZQOIzK2bSnnSKUH1BHkeJXv+VS1ouPSITdWtz
	r75D93v4NPIGH9O/vTShUOB2w1Tg728/dZ5JoimoB1t1JrRY1QeGBnvtfwO8k1xu4QyLPFwIrVi
	G2AaFH8gcmWgAZjfhvNAR2Q+vsK/qbX8yR/
X-Received: by 2002:a05:6102:8696:10b0:7a6:85d6:84c3 with SMTP id ada2fe7eead31-7a685d6a551mr4789995137.3.1790068994033;
        Tue, 22 Sep 2026 02:23:14 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ab17a0cc1fsm1110432137.5.2026.09.22.02.23.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 02:23:13 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-7856441f7dcso1518261137.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:23:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwIkaCedb78Wq4wgCJahDlh5gVfkr9x7/e5cT1Yd8loa5W+y/bUzgq3MyUK8t/zsZaiiofHUfteoJYpRyY=@vger.kernel.org
X-Received: by 2002:a05:6102:e10:b0:7a8:1817:276f with SMTP id
 ada2fe7eead31-7a8181729a3mr5004222137.37.1790068993345; Tue, 22 Sep 2026
 02:23:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-mb-rcar-sysc-v1-1-fb25996bb2f4@vt.edu>
In-Reply-To: <20260921-mb-rcar-sysc-v1-1-fb25996bb2f4@vt.edu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Sep 2026 11:23:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUSA=firVaQ8HQ-ztKd+Em16Xj3LTfcLLk9SHBw2gCE=w@mail.gmail.com>
X-Gm-Features: AclHuK-dqoaxKnjPGxgLEKwBtvJRMWUy2-_GWvI3MviqiUfHAePyiKA8wtVLn60
Message-ID: <CAMuHMdUSA=firVaQ8HQ-ztKd+Em16Xj3LTfcLLk9SHBw2gCE=w@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: renesas: rcar-sysc: publish the external
 request mask
To: jaidevshastri@vt.edu
Cc: Ulf Hansson <ulfh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jaidev,

On Tue, 22 Sept 2026 at 03:18, Jaidev Shastri via B4 Relay
<devnull+jaidevshastri.vt.edu@kernel.org> wrote:
> From: Jaidev Shastri <jaidevshastri@vt.edu>
>
> rcar_sysc_pd_init() maps the SYSC registers and stores rcar_sysc_base,
> rcar_sysc_extmask_offs and rcar_sysc_extmask_val with plain stores,
> before it registers the power domains. rcar_sysc_power() tests
> rcar_sysc_extmask_val and then writes through rcar_sysc_base at that
> offset, from genpd on any CPU.
>
> Publish the mask value last with smp_store_release() and read it once
> with smp_load_acquire() in rcar_sysc_power().
>
> Found with MBCheck, a static herd7-based memory consistency checker.
>
> Signed-off-by: Jaidev Shastri <jaidevshastri@vt.edu>

Thanks for your patch!

Have you tested it?

> --- a/drivers/pmdomain/renesas/rcar-sysc.c
> +++ b/drivers/pmdomain/renesas/rcar-sysc.c
> @@ -106,15 +106,19 @@ static int rcar_sysc_power(const struct rcar_sysc_pd *pd, bool on)
>         unsigned int chan_mask = BIT(pd->chan_bit);
>         unsigned int status, k;
>         unsigned long flags;
> +       u32 extmask_val;
>         int ret;
>
>         spin_lock_irqsave(&rcar_sysc_lock, flags);

Isn't the spin_lock acquisition a sufficient barrier?

>
> +       /* Pairs with the smp_store_release() in rcar_sysc_pd_init(). */
> +       extmask_val = smp_load_acquire(&rcar_sysc_extmask_val);
> +
>         /*
>          * Mask external power requests for CPU or 3DG domains
>          */
> -       if (rcar_sysc_extmask_val) {
> -               iowrite32(rcar_sysc_extmask_val,
> +       if (extmask_val) {
> +               iowrite32(extmask_val,
>                           rcar_sysc_base + rcar_sysc_extmask_offs);
>         }
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
