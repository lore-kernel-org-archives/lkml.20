Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794218111;
	b=fMzFMSwgJEpz0pf5LgJ+L4QbR8ilhp4Du4LtD3AwOWQr5BkfxGOC/6r1DuUa/9r4G0oU
	 9AKxuKcrj0mnpjBdQJ1BC6J7WXgDxnkrxi+Q8iRFl0mhCI3vm9whaL8soVaVn2/3mCOxv
	 IhQqLm6lmfJsXXSFbh1DnADRL2lIpR41HyQme13oUmd4I6AqemTGB5u8cETglShjyedzo
	 yU4XjF0se92QN3Ag2gf+qURXMbFltDk6gYca3g3J/dR5kzqZJAsOxJFEkq112TMYZx/Q7
	 GENn/naHGr9UINf6tS8rtQ2poJMVn511SArsCzv+4IR7OkUe+w+7IRADJy88GOubZOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6+yKcd34YBJDbehP0dz+di+4vqNJ4KlYRH/PR+seNMI=;
	b=XidqK1AX3C6S6bUJhu7moXa9Hhv5RqxZKEgaEy74JwrH7pGTezsbiwdFIJAN14NcoWNv
	 RFpeXdyJrBKdp280sq2SdmbGJf03c+5No86m3bRzRnb+hbp/zTvpoAyHiNlaJPzIpeX0u
	 doGQsdzN9IsiAB3BJMquyrE4nAjF1sS9uvjBKlP0icwFkQerhDJ7X2WNSTa8bs66JpAfs
	 vdLGK5MPBOJw8JMqRCEZVss7e22iDBV/y5euyDL9BGliGSNMSMREzzO0TgUCem8LlO7Ug
	 qEDq2nxN18uPJmbJIDJCtYkvjlzPsaP8A/nu7mUpt8MsYO9jx8onokpDiOYa5mgPW/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=diaSaGqU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC06606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:55:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BC06606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=diaSaGqU
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67bf27f179aso584487d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:55:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794218110; cv=none;
        d=google.com; s=arc-20260327;
        b=CkNnrBh2oBFB7XXFhS14AgUg8GBe7+dBh4fE35fGwF46TGb20l8wRX58YcwWrqAY6a
         E4/ANPF8xPWC9mv1G4hOt/bkEEttbL+PFCre1tiSx7cqNKZqWCckzilHwqSf9musFhEL
         aWjRkNKWJvz+HVkYePUu9FKQdqIvRXa3GVKmIQxngpI9nmUnNIBF2o9K1u0AKr+oZCRx
         1dH3C8rd783rVVgsRfBGn6kfFshkvYnBK8l3XL9vUNS7GWs8gfw6xrFGp0FXr20K4Uh9
         fbYotJ0zKl1g2w5pFt+GrPLomdtQJb88UKnxO7qGaM/m1Xt4IkJgN2VA/d7g5jnyGfiT
         AGMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6+yKcd34YBJDbehP0dz+di+4vqNJ4KlYRH/PR+seNMI=;
        fh=9OPWVJ7aPa+nfF7TytGyG63l1YxoCVODj79XY5xnSS0=;
        b=SXrD5fM+rpVdEDg8q/a4U2/W9kscJFGvP6A2roAXuJMsUbV7fauJtL6oRicz6HcgPB
         /DmXTnbrlWEXPqZHEiWCvNldmRbOpp1wV6GhHK5JGeq+QmwFxixml+FzGJzckPt1wY4x
         kzAwNICbjVYHzNjqNqR68UR/+3YTaFZiKlnIrCJEyxTyAnVXl7BXIbGPcO69qIqYudMY
         qzjk3oMRbYLuOuk2J7QKVDPQMR7Fm10Zc1rmj59tKq7TBamK4Tb0NhnMwD8ww78DOHun
         xT8/CRjuT2bRqOfzqiwF85dqkGzGwsBXEdsDhpSeemcy1mcvKyFxW4kTM7Cz4das55an
         f91Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794218110; x=1794822910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6+yKcd34YBJDbehP0dz+di+4vqNJ4KlYRH/PR+seNMI=;
        b=diaSaGqU6y00ZmSXdj/WhM8ViNbnXUVMV1BQtk7Ev/Ctv8zsTsnmR09ghmL5OnuASY
         m/hN6lDzlbYzrUlIkImjiO7Qd8T9b5kqA9XqtnXJiKsbCPSq/Hih1/Fx9huoAQm3XmqQ
         9ORWnJuSDFrDNDzni/FLlR6alEp0l9cBZU2sQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218110; x=1794822910;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6+yKcd34YBJDbehP0dz+di+4vqNJ4KlYRH/PR+seNMI=;
        b=2ix71P21g1YJpo75P9vuyybe46iWGXUSQxfbYWvDzZ388K/Y1I/nijNt0ZdrRA6MYH
         VbirL22JISFta58dudR3t88R7jVMYJXrfFX95gYkdYS8kKbOvlD9TdjQzH8rTEiJKjK/
         heQL3cJuIJjJkuKrCPtBXi2AQxqtEyfZOCmzTvTEf4HzLGe+8Ng95Y9ryuqciXFw+yeT
         NeAPEMgJaMXET/+/P8jqZIaT3pPYZjMhWvpFS2YKfKPiEmV5oN3w+tkW6Hzu6SfKlQCB
         cFW3weIQJdtEE3KmNilFxQdjMySx8X+3KBUutxLkiV/c1B0Ax4njVaI58FzXtsPDZSy1
         WR1g==
X-Forwarded-Encrypted: i=1; AL+hErGrfFRjOfELcGaHKnbP9dZiiTFbtNwKH/pynt7tvOwGXVBIN+OABgwGYA84CxlM0d6eqTD6Bc7jVgEBg0A=@vger.kernel.org
X-Gm-Message-State: APuU4Z92nNihEKFBvh/xdy75Clz529xnnlIKrol3OQakXN4sA9NCJska
	kE0NKXy8DsyyMt6xwL4cZS8Hu6klJRpyb0lJqh2PWv9fdZRk3mKS0tOQ+0zwI3Eca+hKbLQWOdT
	LjdGRZ17imwZaVrPEdVdW370Uxdg1uxCP5p4oSVsx
X-Gm-Gg: AYBFou2Mabil+cevPfPcmJMO9vlRx1u/ZxDuU3SeanGk24kfONG540R3ZgOYaZspHaq
	v126NXHkT/5RTHeM8kKq7nz5jLnJ9l2Z7Ird5az+z3duA5uHrR4hs9Vwr7QhG33anIqyaRqGLdZ
	EVhmwOl+nynZr+uBIB90c2SsMHIZf1y05tokL+GgddTX+MOCQDNnPWHSoqbfTdOKwfoj/vdLqbp
	WoD7lwJxxIXN++kBmz4pq3JqKAQnmmRloip0y/E7VqGwo8ASa/Kv5XupWHnymeALP1EQqRSCJOU
	0PFvshFAk/htd6bT/twoxsOLLWMj4NouLIN2RgnwFOvNbMdfoD/Oc2eLA75UCyd7NTni+fwPxwB
	0DpFGKxsCnTtkSjpf2ElrZEHNgzAfQH/xBr6a3A==
X-Received: by 2002:a05:690e:304:b0:679:9ad9:b103 with SMTP id
 956f58d0204a3-67c3da632ffmr1254960d50.136.1794218110297; Mon, 09 Nov 2026
 01:55:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-timer-mediatek-gpt-irq-order-v1-1-6d1ddf977224@gmail.com>
In-Reply-To: <20261103-timer-mediatek-gpt-irq-order-v1-1-6d1ddf977224@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 9 Nov 2026 18:54:59 +0900
X-Gm-Features: AclHuK-bIXuY3rwirQbdsttFwHYyj6lmMzuR08wUI0ixSLbLjL_ihv4G533qIVU
Message-ID: <CAGXv+5FSG5P3-4-eijurDA68NzcFOXJN5k12WV9SJ+_3wmTjPQ@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/timer-mediatek: Enable the GPT irq
 before registering
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Luca Leonardo Scorcia <l.scorcia@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 8:18=E2=80=AFAM Ryan Brue <ryanbrue.dev@gmail.com> w=
rote:
>
> Since the driver probes as a platform device, the GPT clock event is
> registered late in boot, when PSCI CPU idle may already have put CPUs
> into a state that stops their local timer. Those CPUs wait in the
> oneshot broadcast mask on the hrtimer broadcast, and
> tick_install_broadcast_device() arms the new broadcast device to expire
> at once so that it wakes them.
>
> mtk_gpt_init() sets the timer's bit in GPT_IRQ_EN only after
> clockevents_config_and_register(). The forced event fires while the bit
> is clear, nothing is latched in the status register, and the waiting
> CPUs are never woken. On an MT8173 tablet with the CPU_SLEEP_0 idle
> state in use, this hung the boot in 20 of 40 boots, and in none of 16
> with this change.
>
> Enable the interrupt before registering the clock event. The IRQ line
> stays disabled until enable_irq(), so the handler still can't run before
> the clock event is set up.
>
> Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF p=
robing")
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

This seems to have fixed the cpuidle related stalls I was seeing. I
didn't do that many rounds of boot tests though.

Tested-by: Chen-Yu Tsai <wenst@chromium.org> # on Hana (Telesu)
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

I do think we should expedite this into the kernel, as a 50% chance
of stalling is not great. It was even higher for me and somehow I
had to do a hard power cycle by rebooting the EC to get it unstuck.

> ---
> Since v7.4-rc1 the MediaTek timer probes as a platform device, and on
> MT8173 with PSCI CPU idle the boot then hangs about half the time: the
> broadcast device is armed at once to wake CPUs that are already idle,
> and that event is lost because the GPT's interrupt is enabled only after
> registration. Traced on the board with prints in
> tick_install_broadcast_device() and mtk_gpt_init().
> ---
>  drivers/clocksource/timer-mediatek.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/t=
imer-mediatek.c
> index 842d6ee4259e..1b2cbcc2795a 100644
> --- a/drivers/clocksource/timer-mediatek.c
> +++ b/drivers/clocksource/timer-mediatek.c
> @@ -339,10 +339,10 @@ static int mtk_gpt_init(struct platform_device *pde=
v)
>
>         /* Configure clock event */
>         mtk_gpt_setup(&to, TIMER_CLK_EVT, GPT_CTRL_OP_REPEAT);
> +       mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
>         clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
>                                         TIMER_SYNC_TICKS, 0xffffffff);
>
> -       mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
>         enable_irq(timer_of_irq(&to));
>
>         return 0;
>
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261103-timer-mediatek-gpt-irq-order-a878ed869f84
>
> Best regards,
> --
> Ryan Brue <ryanbrue.dev@gmail.com>
>
>
