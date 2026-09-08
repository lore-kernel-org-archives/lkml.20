Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875F125B0B8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788853771; cv=none; b=FiIfjpbZ9fQZCrajv3Huo3Pkt5XoepkocbgYmsebV7+d/IRF372wESZYvJwDx2Zyd6u3et4pD+lYkziuAWNwZxq3DjMUF16yZBB+4ywrcwGb4zpQjLvBiXla8TlcK16q5nm718kcMfYiO55vU2GtCgvDW+E6UTzs2/bR2tnDoR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788853771; c=relaxed/simple;
	bh=w/a+1msjGoAq5RLfsEPT89FQwvNcgfDXVDAMK+BH8PQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YgrY1amcT8MMHMykHWplb5p2G9iQQWj0oJg+mnOyQP14q5pkpHSn7D3M3wtEpLRDu1+0LNyGT+TxVDSGetU2DrjhQfEqzAwJc9Lgcy3CjXmfxtpCal9lk0jL8w1vpY6f7FAgpY2j+VaZ1TvIys3Lylg6i5m/FVfIgyv1ko9okzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-97c441e66f0so2618830241.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788853768; x=1789458568;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jvWdv2bTFNskO/RaDsnSTq+0xZGM/I73gHnrYZO6XAc=;
        b=U7B1ihtKt1Vs+LV9nWxws/LVuA9jWLQtSvQdsSA1QlKc9XDQSR6M5J+lft/Ty8GOIO
         BVfejrKELygcmf/O6cnWFcdTnFe8zupNlWCX4F6TeOU67RzjOx1vWbRnBWKqaBwe8KZT
         M3c5zTFwe/M5WvLx7CweTUPJaiRWpRhm3KjDbemCJZdVkLxnpPjK5hcejxLMv+iu8rJl
         OrPp1g20IAU7ZjExzx0NsUIjc7pz8sxmxyLS2R4t87H0vkiaK4fCOGLS/kGXZghLb2sg
         qh2ni9q9+1N3C8c9ju6UEc3Ua4Efl/IspnwWlNZ/TGWmrCAauEg3Yaf3L2otcHH+vGV0
         cZzA==
X-Forwarded-Encrypted: i=1; AKwUvBwm0JfpTFgBAY/e8LwTsbBIAMD/phNpgSjtGlZlwXvgtMh+HTSNfgOyFCKNcj28ouw/Gi1GGNJ4jz2QLhY=@vger.kernel.org
X-Gm-Message-State: AFuF++ldMZpGpTNa4BZr87lKiKKHOE7pwAvAnadlgfsENF19CLIu4Ekm
	adM+ADWOKDmGJXYHt0QLAo2+8ztm7c2u1yJ+kmu9NsY4FMrSnxfUqLmWZi+8+Doe
X-Gm-Gg: AYBFou2bqdz8t8yEypkhfX0JZXRIroBSwiTNe55AJWIaO8nnYc+b8myyRR2kX9Tx4C8
	fddjphbWpGs6VPVefbhEnK8H9MJX8psHW6a4y1pmmoRX94PkMmq3zmzuemMZzeRMJFgKYEBxLO3
	himidCzRNvFXp92WE0R9wbu9LAD0LukkDFwRpcpH0Zj13xyzXmMilGK6w3gMPvvltQ6K0Hk2iNY
	niMghqXDHCdL58KUfgVkeDrK3ki/qP2WDw0ugdlKxcEdKnYm+FWwXERCIv1UC58SRPMBTTjDr8y
	noCw5EXKqn0SCLCAxkISkIZzqqsdIgnGPbS2mSk2kd6BbeqHk/+9QG8lzu9E/K0t5Sqdd1VNgt6
	FUpSr62CjovX4dOXDqbV2DX4DcBOuynXtPKnnm3N2CHFfygvqFR7R746uJToMkPiBGxkOTnSkrQ
	2XebFfrpkzGirEKaoysY/FM9M/YDVarT/8EvYES90E4ec7ZRNdlNoC6MfGyMY6/b/vCG/hswEen
	5N5n9d24SglG2UyvnW17TtXUnDHfnj6i9nU
X-Received: by 2002:a05:6102:2b9c:b0:785:1a50:3f56 with SMTP id ada2fe7eead31-78a4aa53ca4mr12727903137.12.1788853768227;
        Tue, 08 Sep 2026 00:49:28 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ee8039csm9043435241.11.2026.09.08.00.49.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 00:49:28 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-73720e58dafso2915650137.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:49:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy3XPLClKHHrXFZo/jnbOGgJYv0/haIMa6DPbY0TR2OKh2l6IyoyIYltktloNg5DkmNm1se59X3jBv8qZY=@vger.kernel.org
X-Received: by 2002:a05:6102:1481:b0:784:b9ec:9144 with SMTP id
 ada2fe7eead31-78a4a9c3a45mr12132706137.8.1788853767856; Tue, 08 Sep 2026
 00:49:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
 <20260704151521.211335-2-marek.vasut+renesas@mailbox.org> <CAMuHMdUapaP-8kkWT5cXtEO1h58aAzzm34XqO_mcrgbVSyXEwg@mail.gmail.com>
 <b516bf77-fb15-41f2-80ac-b80c621fedd1@mailbox.org> <CAMuHMdWb2Qk=heWhwFh4TsEggHOmzTd4Lj-vG6kXjRVMDDUG2A@mail.gmail.com>
 <43eccc85-fca3-4c69-9114-b45ab5e1b487@mailbox.org>
In-Reply-To: <43eccc85-fca3-4c69-9114-b45ab5e1b487@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 09:49:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVWm1JzmXx1++dhvHbnBbVqQnVVAANfmH5Y24bhJU7pXQ@mail.gmail.com>
X-Gm-Features: AcwNN1V14nvpkxMTS1YJ9lEZFP5Wka8HrashHqoyW3yt83iI5VS79ckl8xfvtwY
Message-ID: <CAMuHMdVWm1JzmXx1++dhvHbnBbVqQnVVAANfmH5Y24bhJU7pXQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Mon, 7 Sept 2026 at 18:37, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/7/26 9:53 AM, Geert Uytterhoeven wrote:
> > On Sat, 5 Sept 2026 at 23:57, Marek Vasut <marek.vasut@mailbox.org> wrote:
> >> On 9/4/26 1:15 PM, Geert Uytterhoeven wrote:
> >>>> +++ b/drivers/gpio/gpio-rcar.c
> >>>
> >>>> @@ -65,14 +66,59 @@ struct gpio_rcar_priv {
> >>>>
> >>>>    #define RCAR_MAX_GPIO_PER_BANK         32
> >>>>
> >>>> +static inline int gpio_rcar_remap_offset(struct gpio_rcar_priv *p, int *offs)
> >>>
> >>> IMO passing a pointer to offs complicates the code.  Perhaps pass offs
> >>> by value, and return the adjusted offset or a negative error code?
> >>
> >> I want to avoid that, since if I only return error value, I can then do
> >> simple:
> >>
> >> ret = gpio_rcar_remap_offset(...);
> >> if (ret)
> >>     return ret;
> >>
> >> in gpio_rcar_read() and gpio_rcar_write(), which are the only two call
> >> sites of this function.
> >
> > gpio_rcar_read() and gpio_rcar_write() do not return error codes.
> > I was thinking of
> >
> >      offs = gpio_rcar_remap_offset(p, offs);
> >      if (offs < 0)
> >              return 0;
> >
> > which is almost the same, but avoids passing offs by address.
>
> Is there any benefit to it, compared to keeping the value and return
> code separate ?

Naive me (I am not a compiler writer) thinks the compiler may have a
harder time to optimize the code when addresses are involved.

> >>>> +{
> >>>> +       /* R-Car Gen4 and older do not need any offset remap. */
> >>>> +       if (!p->info.has_layout_gen5)
> >>>> +               return 0;
> >>>> +
> >>>> +       /*
> >>>> +        * R-Car Gen5 register layout is slightly different and the offsets
> >>>> +        * that have to be added to or subtracted from each register offset
> >>>> +        * can be divided into five groups, listed below.
> >>>> +        */
> >>>> +       switch (*offs) {
> >>>> +       case IOINTSEL...OUTDT:
> >>>> +               return 0;
> >>>> +       case INDT:
> >>>> +               *offs += 0x10;
> >>>> +               return 0;
> >>>> +       case INTDT...EDGLEVEL:
> >>>> +               fallthrough;
> >>>> +       case BOTHEDGE:
> >>>> +               *offs += 0x70;
> >>>> +               return 0;
> >>>> +       case OUTDTSEL:
> >>>> +               *offs -= 0x34;
> >>>> +               return 0;
> >>>> +       case INEN:
> >>>> +               *offs -= 0x38;
> >>>> +               return 0;
> >>>> +       default:
> >>>> +               /*
> >>>> +                * This here must never be reached, if this is reached, that
> >>>> +                * means there is a catastrophic failure in the driver. Skip
> >>>> +                * any IO read/write to prevent further damage.
> >>>> +                */
> >>>> +               WARN_ON(1);
> >>>
> >>> A build-time failure would be better.  I tried BUILD_BUG() instead,
> >>> but unfortunately gcc is not smart enough to notice this case is
> >>> never reached.  __always_inline doesn't seem to help either.
> >> I had one more idea -- how about we convert the driver to mmio regmap,
> >> use opaque register numbers throughout the driver to identify registers
> >> to the regmap (maybe not a great idea), and then implement .read/.write
> >> callbacks in the regmap_config which instead of doing plain
> >> readl()/writel() for register IO would instead do this remapping ?
> >> Regmap could validate that the opaque register numbers are only the
> >> expected register numbers and reject all the others. Maybe the opaque
> >> register numbers could instead of Gen4 register offsets. What do you think ?
> >
> > That's similar (but more complex?) than the array look-up
> > in drivers/tty/serial/sh-sci.c I pointed to before.
> > drivers/i2c/busses/i2c-riic.c uses the same method.
>
> Those do not use regmap (drivers/base/regmap/), do they ?

No they don't.

> > I.e. just convert the existing register defines into an enum, and use
> > that to index a table with the family-specific offsets?
>
> Are we back to the table look up discussion instead of remap function ?

Yes, I think that's the simplest and best-performing solution: one
extra table look-up (array indexing) in gpio_rcar_{read,write}(),
compared to an extra function call to gpio_rcar_remap_offset().

As a bonus, storing -1 for a non-existing register in the look-up table
would let us get rid of the four existing .has_<reg> booleans, e.g.

   -        if (p->info.has_both_edge_trigger)
   +        if (p->info.regs[BOTHEDGE] >= 0)
                    gpio_rcar_modify_bit(p, BOTHEDGE, hwirq, both);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
