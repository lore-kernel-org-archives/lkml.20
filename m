Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34342D73A0
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 14:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788617071; cv=none; b=sdLz6LlRtS4l3ivGNeLXym3V0JoQeLBHW6FbbzwBBRh6xbBrP6pNk6TbfcPSjl1RMjo3uLGOOcQxIdgnEqKYIAV/K14PlL+J3yPOMzI4UeNU6GVsxSiud0+sg0EIZpPje8tKKoc6jq9GlnQ5UIbQMtA9X1LMMFXy7tHVquMyKS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788617071; c=relaxed/simple;
	bh=2EF8hQX2715PddwJ9oCsxzncsn7a4W2DF/R/kkGyUeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R2eS7cPN4jz86RD9nfmDNXe9C5aI+G5qSO+/IWf31KjidO7NX/5Qs+SB9Anoah92bwaITDaa21pc3fj/VLJWRqK/0XtfhLW4Jg+wSfQ1rMrKwKryLjKRW5cRPz2ih0poof4b20t5ojxgJiMDP7Y+Gps/KYSziitlWKbCR/oNTi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-765c077b5c1so675652137.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 07:04:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788617068; x=1789221868;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mmU5FMAneHXfUtApnTl4gKdMaEZfbVGE87dIbOYTEoc=;
        b=aGqPx5+UXW52oGwgwZFe59D18KCifdEcsEgt5oy/vf+e5i3N3QBBrxgJp17nEMY72g
         PiTWhU52hjyvI3Yl+XDvPZnMeZu5LwsAvvx7lQ5+ghFvcHcbDYxXPHN0w84Gn6u81u8Z
         oj93YyTyN1jPzFpdXhjawSObcSQTJE7Zg5xwy842x1OeuLkmubouHXdMvhydCqDuvBQh
         GXX3VVDpXabrnRQhGfeqeQMid7qUBFwbtyXv+gLwKrvrEZUDiUrbQHyR0v8NmcXB4UHz
         UkY73p88RWtUN7kr8xoVj3wG/uQPKrirVXM84+axR/RMsQt6OGnfbBWweDpKC1xxhLRD
         EaaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpZx0+ep5EG2QACMSATCnTwYipGe51mWiG/B6Tr9wlyPFM8HOVWocK7uPQzUDJvYy0FRwPGvoXOmQpLPE=@vger.kernel.org
X-Gm-Message-State: AFuF++m6IY6xYMzgqMFRJc2HMWeS3UHjjMmZLMKn9s9GljzzHuQe30Uv
	eo6UNUosxy5lDSc1alKHH8EC4Wo76ITaAHAI9AHFAPpFU5chEpGild+54EUt/zbQ
X-Gm-Gg: AYBFou3oYGQGQDgVEoBynRGR6Eb+lvSaJCJrwkexOcZP1rhejGrrD0WTS6/t+KKhubj
	NyKdr8NIOXMV741dwB5wbspENYowco9KP6thkwag1YMuKMhxunHF4eyq/lfq/ByTJBQ1xAo4xwF
	7NGVKCQNELwifaEHJkN9xUurrKt2jnPIn8aPu1S2EBzRnPhDy24+Wlxy+c5A7GiIbc95Wpqzwkl
	2JDVtMzIlD1CECAnU9ZADqdH3NaxT2oG4wzKp+izWAXNSh1hGY2+S1DAFHqe76OZsUKRvlQBV9n
	n+1pR1JJs6ie9EhmSUMgj0wFEVY78zrqkbPg+bM+DySs2HqYLrY1O9HHK7RGu8zCty+h86GOCUm
	3BNCEZ9zsp4HtiBb0PukepWIyPYRR3BertPiZLSCBEa3XoEDO2VvhckIwF7DNl3APKInr3eXND8
	FR92T7U3+qldXPivgyUTvbtL8V+D0TWskZdwZKieTZXHFgkpjYAHijaA2HvPasnx7mwtaH21iGP
	JszrE0hz3hrbarckRn1k1kCLd47mK+DyeCs
X-Received: by 2002:a05:6102:808d:b0:781:210d:2897 with SMTP id ada2fe7eead31-78a4aa07b1dmr3788597137.9.1788617065743;
        Sat, 05 Sep 2026 07:04:25 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47b32678sm3839116137.10.2026.09.05.07.04.21
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 07:04:22 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-97e9fb0fc58so587662241.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 07:04:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByOX+jH55kq5H7BYqRQ6wTPrc93AgYEtq9V+k5i6DrXWO632oOjL3DZz6sgxg5bUMZyMf6PMh5OSw83KeQ=@vger.kernel.org
X-Received: by 2002:a05:6102:6d6:b0:737:783d:1916 with SMTP id
 ada2fe7eead31-78a4aa56803mr4238100137.11.1788617060541; Sat, 05 Sep 2026
 07:04:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <upsCxxaJjg2FJWhfCx6KjFXLlh8o4IhaHKJi@bugs.sh>
In-Reply-To: <upsCxxaJjg2FJWhfCx6KjFXLlh8o4IhaHKJi@bugs.sh>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 5 Sep 2026 16:04:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVVqfqvueX-jk_XfM5tE9XScZPe1OLqGw1MUC=Kd2reBQ@mail.gmail.com>
X-Gm-Features: AcwNN1Vfd3xEhZZ7PrZAi9kkNEISK6U0ldP6Y81De9Zfs-x-Bx4rSr-QXAnQulU
Message-ID: <CAMuHMdVVqfqvueX-jk_XfM5tE9XScZPe1OLqGw1MUC=Kd2reBQ@mail.gmail.com>
Subject: Re: [BUG] drivers/net: out-of-bounds in pcan_usb_decode_buf()
To: co <co+5e2bcf11e7027510@bugs.sh>
Cc: linux-can@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Petr Mladek <pmladek@suse.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, =?UTF-8?Q?St=C3=A9phane_Grosjean?= <s.grosjean@peak-system.fr>, 
	Oleg Nesterov <oleg@redhat.com>, Biju Das <biju.das.jz@bp.renesas.com>, Song Liu <song@kernel.org>, 
	linux-kernel@vger.kernel.org, cedalion@bugs.sh
Content-Type: text/plain; charset="UTF-8"

Hi Co,

On Fri, 4 Sept 2026 at 23:17, co <co+5e2bcf11e7027510@bugs.sh> wrote:
> We found a bug reachable in:
>
>     path    drivers/net/can/usb/peak_usb
>     crash   out-of-bounds in pcan_usb_decode_buf()
>     commit  2f1baf1fc892 ("Merge tag 'trace-v7.2-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace")
>
> Config, environment, the sanitizer report and a C reproducer follow.
>
> == Notes ===============================================================
>     If you patch the bug based on our artifacts, a tag would be
>     appreciated:
>
> Reported-by: co+5e2bcf11e7027510@bugs.sh
>
>     Everything in this mail is validated by the reproducer below.
>
>     We also hold an LLM-generated root-cause analysis and a candidate
>     patch. The patch passes an A/B test: the same reproducer panics the
>     unpatched kernel and runs clean on the patched one. Neither has had
>     human review, so both still require validation before you send or
>     apply them. Available on:
>
>         patch.diff  https://bugs.sh/b/5e2bcf11e7027510/patch.diff
>         report.md   https://bugs.sh/b/5e2bcf11e7027510/report.md
>
>     This is an open science project. The code and the full set of PoCs
>     are not public at this moment, as we intend to disclose our findings
>     in an ethical way.
>
>     Happy to test patches. Complaints and suggestions about our work
>     are welcome at:
>
>         cedalion@bugs.sh

Please read Documentation/process/submitting-patches.rst, especially
https://elixir.bootlin.com/linux/v7.2.2/source/Documentation/process/submitting-patches.rst#L928

Thanks a lot!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
