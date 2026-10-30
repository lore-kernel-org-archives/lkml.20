Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357808;
	b=EOlu0/Jbia/aG4uyzZl66flImRx8YgEc7Tn+anICWh6f5eMxUH0evQhCzyX1TMagGUXG
	 ES92XtYYwH2YLfItl88lgUtjXSVKGSzJiFG0hRVZnwk2eXP/aWWV3TdgpHiRShl/ySihY
	 w9IqtFjij8xyBmxJ3rn7v6jbO9PsqoeEoCMDOO+Um5gI3uRjSIx9dJZhCPcGrPhMqBFm1
	 a8NAO1ndOyi8daVlZfgNugflPGbyHAxOsIwkdES4GHrq1h8JgQUp4s3BCfDM6c5ot1lV8
	 dA4CGBF22jhTwjnuyl//U0NMzoqzCEQj8uv12zAUOq1VjQsac0DnYHBMd4rHNBOu7xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357808;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=zZxX8pTnMO9FXNUIpz1udUKFf4OKo2nsyK1cnYF7t/M=;
	b=Tytdals111sox9TLKw5FbBLst5kzBJ2lrhvIosTsZdhbNuZEHh3HLR3rsBNgyTZ4E+CJ
	 M/WOJLMh4vKKi/HLMuEscGizQnh4IvXcBnhIfRvk/Y+OKu8BPZyv3ffySN/dkRkVo2SXA
	 ue+y3oBXgoLnmiXcG09+J7Am/FGb49qTIDJeF6w2NTgAH3rrPYHj+KSyR71Gfwz0vxPKD
	 qR0D/5CfRHsIpUlu76pSSaWwiUS+qWDz8sYe0eJB+s9Rgkvzhmc8YaMyhvKQPMoj4z8lq
	 lvGeqLuoZwXQu/AefOAd/dhAPVz2RXnmE5sTNWMr9V63Qgg8d6FfVJnkH1on6CoNwWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3EF606AC10
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:56:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A3EF606AC10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5ead32bc7d8so547902e0c.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357807; x=1793962607;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zZxX8pTnMO9FXNUIpz1udUKFf4OKo2nsyK1cnYF7t/M=;
        b=fQVqqB411gpJZuxEJF7l8LRMld/ioEwJ0iqeRdBh04zQjkeG1rxKjAGAxkfLv5fMI3
         9qadUVQIVYC3iDb0OXWwZJsA+iai2FEnJrqdK9zlOkZPmZSTsu85ECx5LMOm+WXfEreh
         gZDH4xpl3byULyVz9+4Lw3vzckmuJLNdsENlXEZmJCZ5zJx5Ek4pSdjbNTRKXh97B9uC
         3fF+vsrr8T2OFKLdYVnBvJZrb4ynqzYmejpjZFhclthsfX6qR3qfBDQia5tdbHZlYmFk
         T0I3wNEzNGL1y4r9todEQaR4Btvyd7Lw3L5GTZEyIVVbkCHJs37cYLsnLxFImGhh4Odg
         4h4Q==
X-Forwarded-Encrypted: i=1; AKwUvByAK89b9GubzPDTg1tvXYmwfuS9cxvxEXQFrflp+3hbTEsm307UJyB5a3yoQX00hfTzpOY8h0m/ukfyo2g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIG/Csg/g5mjDZ7xPZiNoqsOATO2REyR14VRuO1AyAS27GSJFaO
	gt0LxT7MjB44pt5ig2ISjrZMqilwXFnAHwvr/faW3F6Jx3UXTmfsOZyiXHNd/rdM
X-Gm-Gg: AYBFou3Iq7PVQN0McX8rGN+17ds+6+U9Dh5RDpWUKr0Zpjp8VWomdAu9IUZMtvY+5mg
	6cylrmi4W1EpeNz0oUyZ68v7/kR0+2f4HBJ/R+gXc4Oc2WwHXWLB/sYbE0dNLNS+NJYUgbqoqnO
	ei+g9ME07ytIdG1HSVXlP/9wfB3ooBvGUp27a0a1jFnDimbDzTXLN811c1qZOAwwYSN3DKhHjnn
	LBt1e49gjt5B3whZg+wMuFSICSpRxWnT3ePfEVg7UZ+GF1y9GusT68sTNGED8Lud4bDW+2kZy0k
	tCuDV3Y/vC/SUuYDFlfO1W3nMBoKPRYPZG9wKvTpKyZLicvpopw4pUPJkzHF/XtHHWCQ/CQS3Ur
	VwgUdq2ivVSyRyNyZKHBzck5VB0wDmynBpfkamC5qPPJFthIymz6yfM+U78PM5CMEU1oKV1MnIk
	PkK4f60efwdT7p0rCr0vZW6zofBQi5uM+tvMNRW13wFJMA4YG187qJZdOfl0IGRezyLdOXEa6tD
	ThB66X9tlufveIrVwLW7PcG4dC+A9LNHB3P+rY4x9uisleWTXwmJGkbYrAiRk5L7RF0OpsC6Cqw
	oxINtyEOvU1Spc7Qe8nkXwtWoXTAjmV/nqt1J7rlSEV/Jb+OFsl3A4PJo7jhw3EJ7/Y=
X-Received: by 2002:a05:6122:4892:b0:5c9:a7af:8178 with SMTP id 71dfb90a1353d-5ec6851cd6cmr934765e0c.2.1793357807371;
        Fri, 30 Oct 2026 03:56:47 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69bf54casm1971043e0c.9.2026.10.30.03.56.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 03:56:47 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7c3b75caad1so406076137.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:56:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwnW4n9qAzuABEQeeNMS/bu3cyyK+GiNgIO91JyaWceXZTPvsSl6xMxtL5nbLSUmdbCzx57ah/Fn4ZgD8s=@vger.kernel.org
X-Received: by 2002:a05:6102:2906:b0:7d0:57e3:d480 with SMTP id
 ada2fe7eead31-7d072bc7545mr969116137.11.1793357806982; Fri, 30 Oct 2026
 03:56:46 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022051021.322705-1-artem122novak@gmail.com>
In-Reply-To: <20261022051021.322705-1-artem122novak@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Oct 2026 11:56:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXjtb6JeQzQEGtOUZDBTdkbrqn74prgXjs834oM6VH-MA@mail.gmail.com>
X-Gm-Features: AclHuK-raKkavqAnXA5yb8ziHt_cunR7fYe8AA3WmHlqSjTPKtCXGrUItohDcxw
Message-ID: <CAMuHMdXjtb6JeQzQEGtOUZDBTdkbrqn74prgXjs834oM6VH-MA@mail.gmail.com>
Subject: Re: [PATCH] sh: sh7305: add TMU0 module clock gate
To: Artem Novak <artem122novak@gmail.com>
Cc: glaubitz@physik.fu-berlin.de, dalias@libc.org, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Artem,

On Thu, 22 Oct 2026 at 07:10, Artem Novak <artem122novak@gmail.com> wrote:
> Register the SH7305 TMU0 module-stop clock using MSTPCR0 bit 15.
>
> Provide the fck clock lookup for the sh-tmu.0 platform device.
>
> Signed-off-by: Artem Novak <artem122novak@gmail.com>

Thanks for your patch!

> --- a/arch/sh/kernel/cpu/clock-cpg.c
> +++ b/arch/sh/kernel/cpu/clock-cpg.c

This file is only compiled if CONFIG_SH_CLK_CPG_LEGACY=y.
Probably you should not use it for new SoC support.
E.g. the similar sh7724 has:
arch/sh/kernel/cpu/sh4a/clock-sh7724.c: CLKDEV_ICK_ID("fck",
"sh-tmu.0", &mstp_clks[HWBLK_TMU0]),

> @@ -58,7 +72,15 @@ int __init __deprecated cpg_clk_init(void)
>         clkdev_add_table(lookups, ARRAY_SIZE(lookups));
>
>         clk_add_alias("fck", "sh-tmu-sh3.0", "peripheral_clk", NULL);
> +#ifdef CONFIG_CPU_SUBTYPE_SH7305
> +       if (!ret) {
> +               ret = sh_clk_mstp_register(&sh7305_tmu0_clk, 1);
> +               if (!ret)
> +                       clkdev_add(&sh7305_tmu0_lookup);
> +       }
> +#else
>         clk_add_alias("fck", "sh-tmu.0", "peripheral_clk", NULL);
> +#endif

... and thus there is no need to sprinkle #ifdefs in this file.

>         clk_add_alias("fck", "sh-tmu.1", "peripheral_clk", NULL);
>         clk_add_alias("fck", "sh-tmu.2", "peripheral_clk", NULL);
>         clk_add_alias("fck", "sh-mtu2", "peripheral_clk", NULL);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
