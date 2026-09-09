Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C05455638
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940583; cv=none; b=cko5qhSdE0INwaYM0rB7FohKva0SYx9UCKe9R6N5qNEHySdwFzFGjFpW564QJFh5y4mkyikKHNEcDWX9uthOrndCu/btHue4FFtfNkg91rdrptHlpM+LljOFQjArjFDm4WrR2UHjGowkWjDilwzLH45k1CmQuoldjHDwxuCVOHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940583; c=relaxed/simple;
	bh=jIL/ineDSN9RSASWLEndVFHVKkHoHz+xKZ4KgMvLjJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QnJcaqbUvf/T16LXWTx3lP9wTo9gTlSpeetFoyb3XztNS0l9JLP7/9zHHSRaNFpAAMk7rFKUMVZKZ9KxChJLHTOfa2MC52QWMRjqzv4OEYW+i788Jb8HFo1jQEbVLtstIhunXfpzk/esTHayqVw1aY9VlE9Y9EeU2LUhkBN0PsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a082b3671fso7100570a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 00:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940580; x=1789545380;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FFRHIlgUH34gNIFpS8cBfqFWe89JRGpFMu8JNscE7T8=;
        b=E/Z3tl3qSEqm+ZN080SQAHG8smorpz8fHJO07ZP+NYoEORDRNM4bgYN6i67cEs0lj4
         EkRn3axJ7iKA+HDZBXd4KoOSQJ1+O0L7uuru71wZjDfn750ovxFp7AIT9qyp/yS3bxDm
         Z3gwXgF0qQqDFZUj8/PuH+Xtf2+Uuyrlr14YlFUAZUUbVGIJCSqim1AR69+tBLwPxYof
         H1tmtBl2/3Awx7nMlXYk9l4ilOyIXaN/LUB+bcFuaAGmG4YBYl749I4KO53x0dlD2aPo
         ADyqwEFlLXBQeI6e1mKnDYNZ0w+RJYnW9/mJYYu0bGeBLeLW/tO/FvlbPgmoeImXTUg8
         nOhg==
X-Forwarded-Encrypted: i=1; AKwUvBwz7fFJuQFpLNXFMdEULJjMzoNM5YKALw1u2Ae3S15txjCYpg+EOdqPLpaqjdW57CFiLaz3cXzBJitHgNs=@vger.kernel.org
X-Gm-Message-State: AFuF++ncY/RoBPm/QVmEDcemf3FeYCc38o+4uph+2vfl6ABl0WwarnHW
	LqAGDa3z/YUMV3uBcWIKkk54DZjvpOzsM7gJ3VW7ILqyjIVCbuJ0DE8z7GdfxC/Tf4s=
X-Gm-Gg: AYBFou3FDOrBLVT2rhq9yiyJJJvdrXOUNo9X2FJPk3gpXFWtqjfdAVuoWLm/7l1GJ6D
	cVzroLVjtaT+qoc4W6xzDCv01BUsTo5FIBueI46REDL1d1KMHhg/66IKOLgM7WJgjtDSNTTe7Dk
	FxMQxvi/ZnpKAeWFTTs+/lOrgIJ9CiIGE8mcL/6T2KGBmLfqPUuVCG25uNtHinTio2d08NaNPDh
	mF7yFcHtvJf3jpzS7/6FYQ3MnPbfSJfjEAz59RODVEdDXEHpGWmrdgByRAueesyv056w44ghJQ/
	l6E6aDh0+KUmCv29dQgmAaDPCT3K3e3LsYGCcJzA4o8uBzjuwzDd2siyJCyxfXMoqv00BTGVqZF
	c84GKtbFIHi7/q/uG0/ixK3NszNP6Hv+zoCvsvxvdAG7mOYApznt5vAOejMNMIHy5okcF69Bgdh
	JH4ysiW1OfMd40SckCS9oVl8RVrxMdIOs9QxC/EmSOW8Y7r63dTYUCaIzniz3TnrjEDByCg4tjw
	zA5MO0d9UawZChmwHCmuQjsOhsHTEQGb1Sf
X-Received: by 2002:a05:6402:4549:b0:6a6:4783:b6ff with SMTP id 4fb4d7f45d1cf-6a7e8d25a9fmr21424849a12.4.1788940580165;
        Wed, 09 Sep 2026 00:56:20 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68e8f2fsm7237784a12.19.2026.09.09.00.56.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 00:56:19 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a63c610b8dso7687886a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 00:56:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzmbCW3c93z/rrytCF32qVMD09JJEmWZA/V6hl/4QMfguN4Yx9NVFkmfwDFuSCrdM9awYVSImjeAn05F5E=@vger.kernel.org
X-Received: by 2002:a05:6402:44db:b0:6a6:7fa6:f0ac with SMTP id
 4fb4d7f45d1cf-6a7e8f9e843mr19491213a12.22.1788940578727; Wed, 09 Sep 2026
 00:56:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808025724.131943-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdWvLX7OZSkfEBA34wKtnoZ4asB6rWFJiLa=2+=fezqsCA@mail.gmail.com> <f82ae578-fbe7-4834-bdde-d11e194a507f@mailbox.org>
In-Reply-To: <f82ae578-fbe7-4834-bdde-d11e194a507f@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 09:56:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQKL_srr80mUmsnznqJ_qxAoh0TdwyvJ41=CN=2pDjCQ@mail.gmail.com>
X-Gm-Features: AcwNN1VBlUkOuc1dFERdA1IT0JCfCvNrtGVHmcnj2K9AZQ9QnT8wN-u_7o86Wro
Message-ID: <CAMuHMdXQKL_srr80mUmsnznqJ_qxAoh0TdwyvJ41=CN=2pDjCQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Add overlay for
 WaveShare 2CH CANFD HAT
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Tue, 8 Sept 2026 at 19:02, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/8/26 2:02 PM, Geert Uytterhoeven wrote:
> >> +&pfc {
> >> +       msiof0_pins: spi-ws-2ch-canfd0 {        /* SPI_0 */
> >
> > Node name should be "msiof0".
>
> Do we also have to fix up
> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts this:
>
> "
>   755         msiof1_pins: sound {
>                            ^^^^^
> "
> ?

Might be a good idea, to increase consistency.

> But I wonder, shouldn't the DTOs contain unique pinmux node names, which
> cannot accidentally overlap with the base DT or other DTO node names ?

In general, the answer is yes.
In this case it is about pin control subnodes. If the base DTS already
uses msiof0, its original user needs to be disabled by the overlay
anyway.

> >> +               groups = "msiof0_clk", "msiof0_txd", "msiof0_rxd";
> >> +               function = "msiof0";
> >> +       };
> >> +};
> >> +
> >> +/*
> >> + * PWM1 uses PWM1_B pin configuration for pin GP2_13. This conflicts
> >> + * with SPI_1 CE_1 signal which is also on pin GP2_13. Disable PWM1
> >> + * in case this hat is in use.
> >> + */
> >> +&pwm1 {
> >> +       status = "disabled";
> >> +};
> >
> > Please move this node disabling pwm1 to the top, for compatibility
> > with dynamic DT overlays.
> Could you expand on that a bit ? What difference does the placement of
> this node make within the DTSO ? Please pardon my ignorance.

In case of a dynamic overlay, pwm1 must be disabled before SPI_1 is
probed.  Otherwise the latter will fail with -EBUSY due to the
conflicting pin being still in use.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
