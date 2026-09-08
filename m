Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA31156661
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 12:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788868989; cv=none; b=SBEr9sLyvliMlLKunxYwt02h4r6LjRoTDqsOCjLDKfIPUK/m12gOkdV1L6GTY0W6+7qLc/iF55zTuPYMsmGwDKpb0TyFHekKXC1sx6PmJqRNq2XJ1nNzlHa/f9WYrl3rg+qGwhDNYO7MulvHAryiCCuaBuZL6QwSfeLbKT6e08w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788868989; c=relaxed/simple;
	bh=1KjGT4jEmlgZm57thkTt2U42w8uocIKFVbOmxzSyT6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j/0gIfAT1Sjuk9rbzYHCGydQyLItssuICfeFQtMlunUC4WjX9uKDig1vcS00+243KnpRQ7oNzVZqx7euorG+BW6LrVLp6Vpv8fIe2XN3kSkGBjR+0BiLirD+vLqsFOQlViyHvL2KdJW2uF95fRUM7B6UcFJH8kgX6LnGCSeK9qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7466771f1caso1403006137.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 05:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788868984; x=1789473784;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2ewf6TAC6datJbrIguz8TlCYfKFGg/5aYhxsRPBSYo4=;
        b=jKRqF7xPksBWLQLlxHS3MMpeogQ2QVmmDg9azEMnkikvYAgsu7C3zlwXx3febXbnui
         N3QsmPVy1ZDrlakPgzn4IoxYfuzyaXqPj5mfMwkoGH2W6OPDikaLmtzB4CkHHwkAg5/e
         A8aWt0TYlyqgjK43MDuJc2cJ8fP0rSCNg1N2pLMw9X0rcIujwJ7/ETBIjGX9E2GOgqtR
         h+kG6NzzN6+UgTdGu2lNxjwF61tIhV0S2oeB1nlMsY5HAZq8DfYG3LuwBLduEnvUqlNG
         Uv1kj8dSbJMEl0tB9AZWZ1ZbebwAwgmcXJXoFHxcZZY/B36wP7h/OYXReIFqT4Foy7BR
         0yQw==
X-Forwarded-Encrypted: i=1; AKwUvBx2oU/gM+ZZUx5AiRNbKlZUaF+QVqqAMQYRq86rw5fKZ/XHwAh1dX/iD8mQYsKmEaNc+0OB2xn+Qci6RCE=@vger.kernel.org
X-Gm-Message-State: AFuF++m8QzrTbf8E1vOL99ny9P+rOX2BHbokL/VrUB3v4qddTFcjc9MY
	5fvwplW430G1b4jXS7tVZ8RgznRcqAtnR1/3IkHjBugmOJ9Tt43sUswfQbsyfqPr
X-Gm-Gg: AYBFou1u4sOCos7Zjy4cpYBItD4XzFfN5wUOFjchxezN+58AcUNvVuci5i1tj0TgJBD
	hcsAOW1iZu0cY4K27Phxk8+PQJoa27g0d4BhX8SfYDL3SvlpigbeG/CF0l5cCbdWajzgdLAxfOl
	LER7+v6VtKCQYQg74bZX0o+wT1laoGkhFtbVbse9Ymy+2vX5f0rKJp740iAJ2WUJBQRvQPCXSTm
	9lvOwVtYbtyL2/zjzA6zwdqM02D0yT/Z8oXADGgNXvAi5dqZRkdmq1kyQ9r5ijh0nnr2FVAumF+
	qd2vRrcT8BquTvUlKUiy5BoLXZ9xJX8pq8IzAF0lN8jo+fW54qxL9dWr9NkabSUf0dMTQZG2bNj
	eDjBvHDnf3jXrDGxfIAIA3HxgMkeNO72iOM+RC2Mz2babWG4fA2Vaj6pIMsoKEfqzrMnQ7yhbfp
	CfQE49mKCGaZCMRXF5nl2B0A3eWQ4OBcOMDZmhlSdcDTEpPm5lXVz2fLOnlBF4T6od4vmfUZ4W6
	2Oh5X4QmIraFTTvrMvWqine7LCfBg==
X-Received: by 2002:a05:6102:554a:b0:785:c39b:6a1 with SMTP id ada2fe7eead31-78a4a8bb304mr9960997137.6.1788868983985;
        Tue, 08 Sep 2026 05:03:03 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a478ad217sm8307744137.2.2026.09.08.05.03.03
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 05:03:03 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c6559620e3so1915252e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 05:03:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy1VZfZsw9qiq5z06e61ICJZoK3KtBSLXlMR8rHITvgZUpokGVcI5RD+UJ8k6bmkaC/ScjzJmgRga0v/0A=@vger.kernel.org
X-Received: by 2002:a05:6122:2187:b0:5c1:25d4:e29c with SMTP id
 71dfb90a1353d-5c7ed0b2b83mr13290597e0c.0.1788868982949; Tue, 08 Sep 2026
 05:03:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808025724.131943-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260808025724.131943-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 14:02:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWvLX7OZSkfEBA34wKtnoZ4asB6rWFJiLa=2+=fezqsCA@mail.gmail.com>
X-Gm-Features: AcwNN1Ut5SdzvrXN_MrghHd3UEoZOGWpEZlnNMWeOIWmWWDEytJDRzefIJak2-I
Message-ID: <CAMuHMdWvLX7OZSkfEBA34wKtnoZ4asB6rWFJiLa=2+=fezqsCA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Add overlay for
 WaveShare 2CH CANFD HAT
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sat, 8 Aug 2026 at 04:57, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add a DT overlay to bind the WaveShare 2-Channel Isolated CAN FD
> Expansion HAT on the Retronix R-Car V4H Sparrow Hawk board.
>
> Current device link is at https://www.waveshare.com/2-ch-can-fd-hat.htm
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-2ch-canfd.dtso

> +&{/} {
> +       /* Fixed clock dedicated to SPI CAN on 2-CH CAN FD HAT */
> +       clk_can0: clk-ws-2ch-canfd0 {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <40000000>;
> +       };
> +
> +       clk_can1: clk-ws-2ch-canfd1 {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <40000000>;
> +       };
> +
> +       /*
> +        * SPI_1 is operated as GPIO SPI, because MSIOF5 can not be
> +        * muxed on the pins allocated for SPI_1 on this CANFD HAT.
> +        */
> +       spi-ws-2ch-canfd {      /* SPI_1 */
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               compatible = "spi-gpio";

Please list the "compatible" property first (everywhere).

> +               sck-gpios = <&gpio0 10 0>;              /* CN7 pin 40 */
> +               miso-gpios = <&gpio0 9 0>;              /* CN7 pin 35 */
> +               mosi-gpios = <&gpio0 12 0>;             /* CN7 pin 38 */
> +               cs-gpios = <&gpio2 13 GPIO_ACTIVE_LOW>; /* CN7 pin 12 */
> +               num-chipselects = <1>;
> +
> +               can@0 {
> +                       compatible = "microchip,mcp2518fd";
> +                       clocks = <&clk_can1>;
> +                       /* CN7 pin 18 */
> +                       interrupts-extended = <&gpio1 25 IRQ_TYPE_EDGE_FALLING>;

Datasheet says active low, so IRQ_TYPE_LEVEL_LOW.

> +                       reg = <0>;

Please list the "reg" property second (everywhere).

> +                       spi-max-frequency = <20000000>;
> +               };
> +       };
> +};
> +
> +&msiof0 {      /* SPI_0 */
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       pinctrl-0 = <&msiof0_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +
> +       /*
> +        * Native MSIOF chipselect does not work with MCP2518FD
> +        * because MCP251xFD driver needs to keep the chipselect
> +        * line asserted between transfers. This requirement is
> +        * fulfilled only by using GPIO chipselect.
> +        */
> +       cs-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
> +
> +       can@0 {
> +               compatible = "microchip,mcp2518fd";
> +               clocks = <&clk_can0>;

Please insert a comment "/* CN7 pin 22 */".

> +               interrupts-extended = <&gpio1 26 IRQ_TYPE_EDGE_FALLING>;

IRQ_TYPE_LEVEL_LOW.

> +               reg = <0>;
> +               spi-max-frequency = <20000000>;
> +       };
> +};
> +
> +&pfc {
> +       msiof0_pins: spi-ws-2ch-canfd0 {        /* SPI_0 */

Node name should be "msiof0".

> +               groups = "msiof0_clk", "msiof0_txd", "msiof0_rxd";
> +               function = "msiof0";
> +       };
> +};
> +
> +/*
> + * PWM1 uses PWM1_B pin configuration for pin GP2_13. This conflicts
> + * with SPI_1 CE_1 signal which is also on pin GP2_13. Disable PWM1
> + * in case this hat is in use.
> + */
> +&pwm1 {
> +       status = "disabled";
> +};

Please move this node disabling pwm1 to the top, for compatibility
with dynamic DT overlays.

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
