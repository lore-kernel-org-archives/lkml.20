Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792488914;
	b=uFutBu577gKS9Dkftz+xQavrjiRFDyGAZy5tBGdWhwLyoB0lbICxzNe1jXeOb65gmtOq
	 BYoKdpOpM6iIdWrCFZ8WztMs8M7tWILzQv/elW4KY8hr9kaC3NWMbTYWiqBzVEtzVJnjs
	 rOBCHUNvCQZGlVuM5WY18oT9ADiXULbaArHR8rwlEFHazEUqQdsRC1qy8yyeIapKDd5+j
	 IxWVAxe22C0e+j3UgF3fiAuH14LCf0P/rLa/tiA4+LKwy6758SPsrPnpaTOiN3XPWNgih
	 tg60TKY4XpRgIs0murSeAm/G9rWp2A59IHrQqXUW1qmEdBQ0lkIN1EthGr1DDEx0C6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792488914;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=BDWYvpCyYNbdlYdFIyikLQLsNfMBmKmrC2Q4BgdAcQ4=;
	b=RqKo7Du7NqDShv9Y2F0AoEobQKzvQ0n2GuvpqZwTX0QEGqm4PS41s193Kb6jQaWNn4hH
	 4Uz5CI3x3UIHg9ioWUnmaLeQjr0dJ5816uucWOy1C026d2TFcA11UsMQZx+2DZ51jFrf+
	 bu+I9R68iGMNywVdXBMsxSsgTVjdqA2AZN7/bw7/3hr2twF70TgdEBX5cYGJ5M0E5eQZy
	 4OQoVIFi50g9LauuK5XwHIAskUM84ZXaLg9jGyljsFGU4yUOOnZKNTtm7V6yHtxZg5e/h
	 Ipa1P45sMs0HxkhWNxb7Ib4oENMUb20Lq0qsYI8Wg4hgPXyJ+N/u5aeEIUqdOvnuIGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4A0606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA4A0606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91b55859245so43548316d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:35:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792488913; x=1793093713;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BDWYvpCyYNbdlYdFIyikLQLsNfMBmKmrC2Q4BgdAcQ4=;
        b=kEh0uwQz2QY8oaB90Fxi0Bp10EObQUie+EXwjEVt0ulroMQYG6qSkASrdcTnIy2oi0
         a8ZYtrDtvjJiWifSug22n6HjdZa5oOgJjUAQVljEIGptcDAcEoxffdcv4v1mNk2xwCCA
         TR+emuKfFWORNHeEPMX0MlwwZJ9gilqkGHgopOmoJMnZqGnuzVdb7UDwwaeGK4+jW+va
         HFv8Wc3xDBPm/aAID+iALqMukqtqYv/ZWWsQcMvMsBD+aWgh4DwdsPwrzRMf5IGuajIE
         LS+Q/+Ji8OAIfB27fjVu0q7aKZU/RigpN+nAotDcGr729WN+F8VFaH8P3bFXTS20WBi2
         Tj/g==
X-Forwarded-Encrypted: i=1; AKwUvByAIBCbL8dRN0Irr6SaOhgGGTBHOVbptyZdoIPBm/luhZq1okkxIwCM3HiKLZ0Mu8z1/0M6tQ1WE/nlR6U=@vger.kernel.org
X-Gm-Message-State: AFq9FYItaZvHb/dNfwGdLlk+pi53d1FtZf0bGqAHGPXg2FiEJXTJad+d
	htE1peOydN/b1/GmmK0vqsnj9tJdqXBJhCOv1oxiUqBeuuSnFZbI1f3qMOaErR6tnM0=
X-Gm-Gg: AYBFou03/2YdMMMB0Qr2pRzj/odSP4iu4RMPIFhNOdKC+Uc2gxBCxaOCaPqGjT3Swqi
	SBvzLEHHvHXHbjIy2i/iJWUOXrZsoIkFeqbJYlxgxj0tKTj/2WyaXdYnrZOgWXxKCoaVt5LzV18
	2ibH3nnaBmImfCDz8UhbsQ3TjfHJ/TFA/3hYTkZwLexJm3MI5I0zBHVoQL4ImkgZeWp6pNGw0Um
	vPF6s85sLMAHEOTJ10urAjXCLqBtaCq/Ge6E0MY2L/eYDZjvlyu6K9jojFbyhZa95zEe+J64jbC
	djmfO710fZWJvDPOOTdDGksE+xT6pcKOLkEPKfx0N/aHpb00LvaxJvwtGXxZeap2dUnUpnbxO7V
	KPjBb4a4sIal+OfCxQBTw+VXw6MfTgHmI4BLvKShgv3BrFzVQCJ8OucVW0Q17hqN22eBhHLiWhG
	+QH98yss2uN8Q8BnajY3/0O2XBFrY2QBjQ4jp0UpyOxAldIuU4D2JBfZCtTreUbyKjpwMb6uakh
	rSMir79k1o4rhzAnuqzJzk1zipHlufSw0e0Z/iV
X-Received: by 2002:a05:620a:2805:b0:93e:c12c:f142 with SMTP id af79cd13be357-93f29e10c8amr1734963485a.76.1792488912626;
        Tue, 20 Oct 2026 02:35:12 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com. [209.85.160.174])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f4b058148sm179905685a.14.2026.10.20.02.35.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 02:35:12 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-53644b28706so33958951cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:35:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxw88m2Ev+ztLnwQqjSEwOIA5GYWru6HjP5Ol3tD5LMgIetLssqk8i7QM7e0qjy1M8mBFBdEjCKn8CgvyI=@vger.kernel.org
X-Received: by 2002:a05:6102:1625:b0:7af:fef2:8ecf with SMTP id
 ada2fe7eead31-7cc3691cf50mr3455060137.8.1792488445010; Tue, 20 Oct 2026
 02:27:25 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com> <20261020-divo-ssgrlpcsrc-2966-i3c-v1-1-30a47f25e515@renesas.com>
In-Reply-To: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-1-30a47f25e515@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Oct 2026 11:27:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWt8KV02C+N1dj=gcdJwX4s-_=+zRpsh+Za+f0HeHOkuw@mail.gmail.com>
X-Gm-Features: AclHuK-aAi-Edh8uIEyKFfeZ8ZpBiAefIme6DU1Cm8luHP5VW0oo3t3lyPOBTwA
Message-ID: <CAMuHMdWt8KV02C+N1dj=gcdJwX4s-_=+zRpsh+Za+f0HeHOkuw@mail.gmail.com>
Subject: Re: [PATCH 1/8] i3c: renesas: Fix zero I2C SCL rate on pure I3C buses
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Linus Walleij <linusw@kernel.org>, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Diogo,

On Tue, 20 Oct 2026 at 11:15, Diogo Ivo <diogo.ivo.sx@renesas.com> wrote:
> On a pure I3C bus there are no I2C devices, so the I3C core leaves
> bus->scl_rate.i2c at zero if i2c-scl-hz is not specified in DT.
> Deriving i2c_total_ticks from that zero rate programs a zero-width
> open-drain SCL into the STDBR open-drain fields, which are still used
> in pure I3C mode for example in DAA.
>
> Fall back to the 1 MHz FM+ limit instead, the fastest rate an I2C
> device could have, so that a sane open-drain timing is programmed.
>
> Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>

Thanks for your patch!

> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -579,7 +579,18 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>         if (!i3c->rate)
>                 return -EINVAL;
>
> -       i2c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i2c);
> +       /*
> +        * A pure I3C bus has no I2C devices, so the I3C core leaves
> +        * scl_rate.i2c at zero if not explicitly defined in DT. The
> +        * open-drain SCL fields of STDBR, which are used for the DAA
> +        * pending read, are derived from it though, so fall back to
> +        * the 1 MHz FM+ limit instead of programming a zero-width clock.
> +        */
> +       if (!bus->scl_rate.i2c)
> +               i2c_total_ticks = DIV_ROUND_UP(i3c->rate, I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE);
> +       else
> +               i2c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i2c);
> +
>         i3c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i3c);

This looks like a good opportunity to use the shortened tertiary ?:-operator:

    bus->scl_rate.i2c ?: I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE

>
>         i2c_parse_fw_timings(&m->dev, &t, true);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
