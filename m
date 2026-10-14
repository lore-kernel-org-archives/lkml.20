Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7842341BA72
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791961436; cv=none; b=aRqJ48IT2e6Fwuue4z4S8ZY8H1liIg0S/T20l2xrpHunKsN+q8ZOuJSOgQEl9wFK94mo74t8miWpAwUe+HwXEO+tBbx4DbpaqL/Z/b8qmdujLhiou5ZUjvoMg+MGX5rtUaeumrCoRl0Td7L0RiuvoKAQxYTOhdkfheeyT0T0MO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791961436; c=relaxed/simple;
	bh=TTFre1wVPc8VoMEWdWl7FNETUfe1CwRLfZ7pj2U9bSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KouJ36KDkXRqTBBuyntfZxkBOC8EHC6o++aUpLkOJ8USHCdkOI3DSAxCbpujOVWKrIwaJrYAdCkzCVNH5ivaIsbiZ8qzpEz/bMoINyLomIXGonEwylYM6qHc/s6Cqz0UdZRRvK1fPsjUMlWP7w95IrJVMlIUD7dRoXzrr1CQcuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5e521deaa2fso1762488e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791961432; x=1792566232;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Bk0WxILScU6Y6u+duQiyaZKyaSUANhQ4Ts1Mqg6Tw0M=;
        b=FSJ0NIHlnifZJm/pN50rCZj+6vgy7QAzbv0JVmVZmMO2wNKEmOifNINM0vgovwiJsm
         fYBQn7283kKrOw3eFlBuA2tQFwOYn8wQkhH+ePt9f9B8nStJ7LRt3n8ZCPAUJbxTz9Rz
         8Iavk0Od+tDML1/Hgg/wp9A8pnIc7sJ+imTFx1ssuntDkkc17yPfIqasbbSWZ4zseBXp
         tUnT8HS5OtU4lNE51Qm/KsF3er5ta5msc1+m3YOjj4ocGxBO8kLqxlmSexiWluR5NjVZ
         jT+kHfTY3EXqxFsu9AvUSirAL8QFOZABZGg0uRQnCQ3OKyMRY4Dc4gf3PrZ1JzIjogZS
         LPYg==
X-Forwarded-Encrypted: i=1; AKwUvBwKTBHSCf7HcxsgPbE0XyR0t++xI/RBsBjCvTgBmLUY7Zgm43CtJBO0X669OhCzl0hxKWfERPbIwQH/e2E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqxDjEyvgTZbNIfmj+UXbC8oRsJOP+LJGxRoJ8iWQXFQmzjGWo
	bv5/oHGAY6aMbe/iXTwqpw+o2gpavFMPVfpqNNfDVYhN/Lsh6+9r5inDPf1A0/Cg4eI=
X-Gm-Gg: AYBFou3lWtY1V5HUbsNYGiCnHbeqKdrPKsky4Yn5ndEQz9//IHh6vYCjUtDjbQffNFe
	wE2PFL1OXidVrWMDSSaiBOmmCYbuDH3PcKl/Fnm5amV/Kl6iMs6dq0BTpEbjDcSSOH7OazA+fSQ
	+CIami3GD5A5HSWK3zhWN79SluFqnK2gEpIh0Zbir4bJjYhdJ1jCmcUeppcYDos38BS7A7WwlVq
	u8xr4xcImiHL8FFAoyVFJ0zy/KIjML0pIJ5CuGV5VtLUfVorJIzXmvoDlli2KqwcxKWYM8JUykU
	BS5hSpJsazMNqpXlg5I5ICImFegNi3kmaQjmoZ9M0s0BbV63nMBbwkpB6vTtPbmeDBkGqosZ1Pg
	OcJvJ4Bj3kjf01V7JUoxs/6kXrtW06wL+HrvBQS/33iuvvPQ+jrsJ6D0HXkqvSY5vqy0n3mL1lE
	Q4uCQqHKEU7KIemNB7bZ/NaoZHKfn+NMSwtGMO8A9P/OtsTSirN6CCZuFhkNnIHfRSd4UMoDnXi
	Bd0yt+Qi6mKB5tS6Z9qRc+XR3Zj6fJhBXpuVozBNezt3F8=
X-Received: by 2002:a05:6122:54f:b0:5c9:a60b:e5d8 with SMTP id 71dfb90a1353d-5e91f5057a2mr4606593e0c.18.1791961432281;
        Wed, 14 Oct 2026 00:03:52 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e91cb93832sm10987343e0c.12.2026.10.14.00.03.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 00:03:51 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-98a8c72a04cso1321331241.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:03:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwRa6H8cXRjTUqzpizBKIBlQAF381e91onqCiHhibxQMOAH6bd3MDLp98EfeArr/Fw9flDVJVBMEY4gcX0=@vger.kernel.org
X-Received: by 2002:a05:6102:3c91:b0:7c3:9b8d:5124 with SMTP id
 ada2fe7eead31-7cb3a0aed1dmr3343010137.18.1791961431528; Wed, 14 Oct 2026
 00:03:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927191359.6144-1-kmehltretter@gmail.com>
In-Reply-To: <20260927191359.6144-1-kmehltretter@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Oct 2026 09:03:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXfpChkH-Ad5x7p579+4rBQtfF5CKwwRrdZ6CxDPDWMCg@mail.gmail.com>
X-Gm-Features: AclHuK-JPX25FVbWtEZgw5SZJYvwRgJ9Oj-OYRi5HkMjQopQgwpR2Z7Y6E2CNek
Message-ID: <CAMuHMdXfpChkH-Ad5x7p579+4rBQtfF5CKwwRrdZ6CxDPDWMCg@mail.gmail.com>
Subject: Re: [PATCH] sh: intc: sort the prio and sense lists after filling them
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Karl,

On Sun, 27 Sept 2026 at 21:14, Karl Mehltretter <kmehltretter@gmail.com> wrote:
> register_intc_controller() sorts d->prio and d->sense right after
> allocating them, with hw->nr_prio_regs and hw->nr_sense_regs as the
> element count. The lists hold hw->nr_vectors entries and are only
> filled later, by intc_register_irq().
>
> On SH7785, sh7785-irq0123 and sh7785-irq4567 have four vectors but the
> SoC's eleven priority registers, so sort() swaps 88 bytes in a 32 byte
> kmalloc object at boot. slub_debug=FZPU reports "Right Redzone
> overwritten" in kmalloc-32, and v6.5 and v6.6 panic in
> __kmem_cache_alloc_node() while registering sh7785-irq0123.
>
> Found with a custom QEMU model of the SH7785LCR. On it, v6.4
> sh7785lcr_defconfig boots with SLAB, the defconfig default before v6.5,
> and hangs before the console is up when built with SLUB.
>
> Sort the lists once all vectors are registered, with the number of
> entries that were added.
>
> Fixes: b59f9f9775e6 ("sh: intc: optimize intc IRQ lookup")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Thanks for your patch!

> --- a/drivers/sh/intc/core.c
> +++ b/drivers/sh/intc/core.c
> @@ -275,9 +275,6 @@ int __init register_intc_controller(struct intc_desc *desc)
>                         k += save_reg(d, k, hw->prio_regs[i].set_reg, smp);
>                         k += save_reg(d, k, hw->prio_regs[i].clr_reg, smp);
>                 }
> -
> -               sort(d->prio, hw->nr_prio_regs, sizeof(*d->prio),
> -                    intc_handle_int_cmp, NULL);

Yeah, if hw->nr_prio_regs > hw->nr_vectors, this overflows d->prio[].
Furthermore, this sorting is useless, as d->prio[] is still empty
(all zeroes).

>         }
>
>         if (hw->sense_regs) {
> @@ -287,9 +284,6 @@ int __init register_intc_controller(struct intc_desc *desc)
>
>                 for (i = 0; i < hw->nr_sense_regs; i++)
>                         k += save_reg(d, k, hw->sense_regs[i].reg, 0);
> -
> -               sort(d->sense, hw->nr_sense_regs, sizeof(*d->sense),
> -                    intc_handle_int_cmp, NULL);

Similar.

>         }
>
>         if (hw->subgroups)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
