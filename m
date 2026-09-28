Received: from mail-ua2-f25.google.com (mail-ua2-f25.google.com [74.125.226.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B643B4D90A0
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790605928; cv=none; b=iSSDzm5n3drOK8cHeT5s93TiJZJLFy9vLYUXJfWOXRiftHFNa3Ij57cBxzgikixmRnY/H5w0ecv/nqKHs+22/pcwV2GIclUEW72r3ZSlliRy8ZjItMk2Y0PjZmEzbD52poZb/FJwM/ToFwYxEpt5wz2PIGWbt0HsFgbztpJm/+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790605928; c=relaxed/simple;
	bh=ll5jxnO1LxSP6VOdbTEMyX5P1KDm9LihOkdaoeyDm7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MkThbfk8Y+mWx880Xn8SBxow9t2phwuS+d9s+/IJzGqIFKBtK9Pn+FfQyveqlUN/XHoGosZ8pzePV0V1mewAFFFYzDl2gFd4UB+YYMHHmvsAKfnzm72PaB9V8vnSxz0Ffq5YA2Wj1dmlp9TdjJQYKMYVuuffla6aQKjM+71PWaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f25.google.com with SMTP id a1e0cc1a2514c-982e8fa91d3so710094241.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:32:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605919; x=1791210719;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/3m9boaHoB6pESjCzvTfI8L4swM5eZahhrdnO03H/Os=;
        b=iKnNsJ+X6argBwywGRlehMPWvxH/3cBqCamp6ma3gGhJnEJVQtQ291z4vR6gdb/s1c
         jAq2SDOlE7ScYHiDkffjJXAuAOIkOZwo5qJRMabg5TJdNWIyDQSQflpoWtGgLSTNgoVA
         8oU5svUe6VYM6tvZa9g8spUh1lMsm6vB7somdTt+gfsNw/4o4K62a3G/bskyIqegIuoS
         ks8NitVgzuuv7znfOzFLWpc2Pu7/IHJoEdzu0kpYmh3X1M2jEPtVn6W6wvXfhQvr/baa
         F81lNLzgFiDVGHHxZATJbdL2oxtC/jm1epNdWamPVvw1wb5/6DwF/CsrMpVJIturmJNw
         tTpQ==
X-Forwarded-Encrypted: i=1; AKwUvByOi5PWLRVvo2ZdnXFee/P7pI4WYQmrpOl2FRbZs7HSe+gJ5VQZRQUrmufU4BusKVExgroMA3Rn4OOHTVY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL53kSCPGEtOwFZDnmoAQobyg5Js97mHWEohikNmHNu7cbMjyI2
	9YLdP9LqnmjfdXBxXDgsA4lj2kF2Yor+V+w1tLVpjU3MdXTJ+7kuKwz6xDfwG13B
X-Gm-Gg: AYBFou10FhBiEQU1qJSQSMpRsQ8v3LUSgTaEwJqxtIu6c0ZcQxgXGqKLUiY6LnURmBe
	nzqDHj/+SqkkEwttWc55OjMikUkS2n61Ji/VlJIYM01Xu1lliUSg2d6N9o6VzHJUnUPY/S6JJgZ
	wNPt7PJNmk+ZeZ2NC/A8Nv9vR4e3uvKRR+TC/bUFFHwIvu1KW3ck1Fi0P4eFsxkdOy77tTTH5d/
	St3AllDYZCy89vqoMqUjDHkCkN8yjQR6N4jGTXocVnndYBYKkhArSI2VjqxoxdLPb2eNoWtZodJ
	dViRVtJCy7aTSIuehoLRw63DXiPh+wp44qcfqXQ1q7uhL4MzaOzympJmHMn4mkqIdL7QLTqZq4z
	CMb449ztyihhLLAba3eRaQzATJgUDSad6gVoeaVN7ryYKCUfKpzBh0GSvJqHurLRAjmD9ip//r3
	WMhQGhVYVnomzUqeCkitEKcxBqEMf/nzk5YiFUrYhRVaTcyz2O7z4jeu/9/DAvtdpVFEeu6Cigh
	wZXVk5BxamRWWdUNDZiTM6ooAyejSQBXZE+9ej6M6eL1BY=
X-Received: by 2002:a05:6102:524a:b0:779:328:8a2e with SMTP id ada2fe7eead31-7af1c9a3cfbmr3620464137.5.1790605904391;
        Mon, 28 Sep 2026 07:31:44 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b39b9ae253sm9456899137.8.2026.09.28.07.31.43
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 07:31:43 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-982838c4cccso2251628241.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:31:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByX2nezVPpVqJQPxK8UIjAhPRQaVhWfIt7LtBnD+VU+gw5WVwtFQgxRTkmiGYK5gAJr2+x3KLLzJ+oXnGU=@vger.kernel.org
X-Received: by 2002:a05:6102:1a02:20b0:7af:efe6:2bbe with SMTP id
 ada2fe7eead31-7afefe63c7fmr2495728137.16.1790605902970; Mon, 28 Sep 2026
 07:31:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com>
 <20260904-rzg2-sr-boards-v8-4-94c4674927e8@solid-run.com> <CAMuHMdUGOLr6TQvfS9i2W1ihBWUUuTG0=TcfyZ-Seb02+XW_3w@mail.gmail.com>
 <133af08e-be3d-4eb5-aa64-63090aef6e97@solid-run.com>
In-Reply-To: <133af08e-be3d-4eb5-aa64-63090aef6e97@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 16:31:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW9NTOgPR_Xd+YVOZzd8V=uOnwjoJxRPL_-wy3i_n45mg@mail.gmail.com>
X-Gm-Features: AclHuK_hO01Uu8W5tQcoOhC1vcw0bnPcJI__NCNgulHZI0GJtePof15Jh2gc_yQ
Message-ID: <CAMuHMdW9NTOgPR_Xd+YVOZzd8V=uOnwjoJxRPL_-wy3i_n45mg@mail.gmail.com>
Subject: Re: [PATCH v8 04/11] arm64: dts: renesas: add support for solidrun
 rzg2l som and hb-iiot evb
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Mon, 28 Sept 2026 at 16:11, Josua Mayer <josua@solid-run.com> wrote:
> Am 23.09.26 um 16:37 schrieb Geert Uytterhoeven:
> > On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> >> Add support for the SolidRun RZ/G2L SoM [1] on HummingBoard IIoT [2].
> >>
> >> The SoM features:
> >> - 2x 1Gbps Ethernet with PHY
> >> - eMMC
> >> - 1/2GB DDR
> >> - WiFi + Bluetooth
> >> - SDHI Mux switching between eMMC and Carrier Board
> >>
> >> The HummingBoard IIoT features:
> >> - 3x USB-2.0 Type A connector
> >> - 2x 1Gbps RJ45 Ethernet
> >> - USB Type-C Console Port
> >> - microSD connector
> >> - RTC with backup battery
> >> - RGB Status LED
> >> - 1x M.2 B-Key connector with USB-2.0 + SIM card holder
> >> - 1x DSI Display Connector
> >> - GPIO header
> >> - 2x RS232/RS485 ports (configurable)
> >> - 2x CAN
> >>
> >> Descriptions for eMMC, microSD and RS485 are provided as overlays due to
> >> their dependency on configurable mux states.
> >>
> >> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> >> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
> >>
> >> Signed-off-by: Josua Mayer <josua@solid-run.com>
> > Thanks for your patch!
> >
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-common.dtsi
> >> +       aliases {
> >> +               gpio1 = &tca6408_u48;
> >> +               gpio2 = &tca6408_u37;
> >> +               gpio3 = &tca6416_u20;
> >> +               gpio4 = &tca6416_u21;
> > The TCA64xx driver does not seem to support gpio aliases,
> I have confirmed this now. My expectation was that setting gpio aliases
> helps make /dev/gpiochip numbering predictable, however this does
> not currently work.
> > so please
> > drop these.
> Is this a good reason to drop the aliases, or better to define them
> regardless?

Yes please.  Aliases are meant to identify labeled (numbered) connectors
on a device, e.g. first serial port is serial0.
A GPIO expander usually doesn't have such a connector, and the various
GPIOs are typically routed to a variety of places.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
