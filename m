Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485396;
	b=e4Nk8NDG6kT7TnqEFKuqRrU8WZJRrlJnyICkw5j4EsaMp34xk3M4pgOyLRYBcvXDbE+d
	 ui3w0A+alhsAeXq2JDshLeAdDupFHUYGViNk/Y1M4btjoLW28XZnEHxNsm8U3BiQpL+Kg
	 KGRjANDNb1bkE7dUXDgwDxv5rEocT2EUuXGbqNPE25ZaQ6J8gulwSB+737BdBxFv5fpYv
	 nVEO2xqEn83JwDFr6nqymYmi0ruHyItkQkAzx5rw6b7hl7d54z5fvpsN5hedcoa4/+4Qw
	 64QOqTLoxZvYyj/CZa1Zni/z79rv3q8Wq5VaT9JEHaiDlNhVIc4kUrl01DYUBcNSX7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485396;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=22y+5juPWrN/VuUPPX8ILqIV9NFhSiiV1mnmbGgPo50=;
	b=pA652a8xU+Jd0dceh8CVeCcCkbOCdmSoOFUw6fIGAfpCP4pO9OByV24Zi7Qp+JKeps6a
	 jiFMIlgRDcemKihR38gDq+wllZO9xt3wdWUdMOd7YLMERhFQA/LbtvpHoBtoRXYOSRbYs
	 WEFmS8NMUIUQ6AogK9ZLKi/qtX9A/DKa4lUbLdrFiVBA0+YikZKfZO+Ou/IozNEgFmX1Y
	 7wwk2XKm13wqVqugB7Z35cu7X8BC/eB53fPuE6N2rOpkmAWOFzIrZaPxiKvQdZ2NHaL1n
	 PZzxB2DUNcvZWg8gTyPIZoVZCZqW5WLsGsJ4PDX0QWl3uAxkh2nP6r4tm8D0zi/Xyag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99434606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99434606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5ead9f60e26so380982e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:36:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485395; x=1793090195;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=22y+5juPWrN/VuUPPX8ILqIV9NFhSiiV1mnmbGgPo50=;
        b=vIr3iP5QJzPizTyy/eubDxyABJzp6P9yQa8DQ8IuDcQ22eZo3+EinIZV0VXQ6EH75P
         NhJyPdKuhB+xbmMuEtOHPt2ERmwTYjlD3te9jBKSBf+C0FEdQID7FJXViG4wjXTRcUmk
         XJAM1y6UrFvUGwMD+jpyjO9fCK8izF3V7Mc9cO5V9qHnxWoZuUsQijWCUu5Og7//NK2Y
         5hQjbiQejOsBdOChhRm5jvT53O/xA0sXtMXq2mlMbA+N5pOM5NIZI3DOsLH/PWDxKvsw
         PE48KFVxEFmS9urqsehUaM/l7/aD68MEiXTVYL6BYvttLbsbfA4EeJlax2JQjMi4Wv+R
         tXKw==
X-Forwarded-Encrypted: i=1; AKwUvBzDeK+iiWnasVrCeCpvcBWsJcBpCyArpU4RGFWZDNP0BSAAJ1mSWcGUMoDjF0IQ9Y8Df4zw1ySktjN6I5A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFynZuM21IuSbCaYGslT4bWj+xiD1p+i2KZAUa9xix1PyqrJ+O
	O6WTbyXl0It2BA2OssZwEHVVJuf64X5pp4ZIyj/Q4y4SjX29CJM3kksQOU5E/bdH7Rg=
X-Gm-Gg: AYBFou149a5YhPK5uFWiL0yCPL+P09Jvw/guhqByPseC//ImT9GJAiM/fRU/RaFmbBh
	tUPX00M68j80hl0qpVQcz5oTodO/rrAW9rH2QVtjV3TTas7lb8sV8fIehVDBVIFgAeoro38dftu
	Ah6RLa5uQKDcVGxdGurh3pt4VPZa+8NLeAezG1XRWCf3IV1QxM5TtrDt/PzMdaM8gmpOehmwpjQ
	iYOcPytCeLgCTx6hw4zrsupac4KaNO4/gIKdYAsRJ9ReTUS1tcyB/ac6M93pbOycZpmZ+O2H9X3
	BHRLJ+wTORTv+flj3rgez5IDuV40U34+XS6qfRp5EHCJ7eqzS1/YX+R1HesXgUeQceWniYxxISd
	SM3GgVaJyjJsk/EVBe2CxKDh+ZoE0gKPVpvzKdFUc6r2DI+/pyLya5A0PVX+Lr4j1r8qU+KXI7p
	9RXjpyrnTLtF8QEC0c0hmvfOBwWQZNSiqN5ySuyYHbbD0wckp8jiy3CP9aezgreMi10BRTJzv8F
	9l7jgic5lhgyTQAM2W5q7buQ2gipiKmuMmHls6e
X-Received: by 2002:a05:6122:2891:b0:5e9:6d96:a7cc with SMTP id 71dfb90a1353d-5eadcb7109fmr406720e0c.9.1792485395535;
        Tue, 20 Oct 2026 01:36:35 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eaca7cc59asm5184427e0c.5.2026.10.20.01.36.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:36:33 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5eadea8f0edso187781e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:36:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByP8ezOqFbSnVLe3B3IolfuEOhhuLCwC+MeWFpQx5DocUq4attfhj1HYqC605AGHmj4xNCzf2IkSxDtJ3w=@vger.kernel.org
X-Received: by 2002:a05:6122:8019:20b0:5ea:a09b:39cc with SMTP id
 71dfb90a1353d-5eadccde839mr253998e0c.19.1792485392657; Tue, 20 Oct 2026
 01:36:32 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019170139.473808-1-biju.das.jz@bp.renesas.com> <20261019170139.473808-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20261019170139.473808-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Oct 2026 10:36:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJAYL7L8q0ShxF8vJ-nhmyCiTgTNLJxLv9wLcshLfLGQ@mail.gmail.com>
X-Gm-Features: AclHuK-f5PxeHKGz-JsdxG5WRVgKsmMVDA3pua2BFWop-pdvR8thY-1maktQwAQ
Message-ID: <CAMuHMdVJAYL7L8q0ShxF8vJ-nhmyCiTgTNLJxLv9wLcshLfLGQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] serial: sh-sci: Skip TDxE status clear for PORT_SCI
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Au Dang <au.dang.jx@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Frank Li <Frank.Li@nxp.com>, 
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 19 Oct 2026 at 19:01, Biju <biju.das.au@gmail.com> wrote:
> From: Au Dang <au.dang.jx@renesas.com>
>
> On PORT_SCI, the TDxE (Transmit Data Empty) flag in SCxSR is cleared
> automatically by hardware when data is written to TDR. Clearing it
> again from software via clear_SCxSR() generates a spurious TXI
> interrupt, which causes the last character to be transmitted twice.
>
> Skip the clear_SCxSR() call for PORT_SCI in sci_transmit_chars() and
> sci_poll_put_char(), as the hardware already handles it after each TDR
> write.
>
> Signed-off-by: Au Dang <au.dang.jx@renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -913,7 +913,8 @@ static void sci_poll_put_char(struct uart_port *port, unsigned char c)
>         } while (!(status & SCxSR_TDxE(port)));
>
>         sci_serial_out(port, SCxTDR, c);
> -       s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port) & ~SCxSR_TEND(port));
> +       if (s->type != PORT_SCI)
> +               s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port) & ~SCxSR_TEND(port));

Is this issue present on both classic SCI and RZ RSCI?
s->ops->clear_SCxSR() points to either sci_clear_SCxSR() or
rsci_clear_CFC(). The former already has an internal check for
PORT_SCI, the latter has not. So probably it should be handled there.

>  }
>  #endif /* CONFIG_CONSOLE_POLL || CONFIG_SERIAL_SH_SCI_CONSOLE ||
>           CONFIG_SERIAL_SH_SCI_EARLYCON */
> @@ -1049,7 +1050,8 @@ static void sci_transmit_chars(struct uart_port *port)
>                 port->icount.tx++;
>         } while (--count > 0);
>
> -       s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port));
> +       if (s->type != PORT_SCI)
> +               s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port));
>
>         if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
>                 uart_write_wakeup(port);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
