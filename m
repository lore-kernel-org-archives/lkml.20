Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3340A36B936
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247374; cv=none; b=pCW4ZPtOrCvGIeHIB11TlsNO8WNdx6RQCszenmgfMLs1Qbpao/mCLTE/emK7CRCEq0Xe89wcRHF/QVpB60irKSFTj47QZzazIM49lRC5EmZwF68Z9rGsmp0ATVjhO3b+SpMumJ0/jzdrXUr1rwv4CWQBG1gU0CrYML2vuLWfnE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247374; c=relaxed/simple;
	bh=TJW+ZiT5oYVtElCrK2VJYF5Z8RxcnedgcUFRUh6BMIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=haS8LLdtjKGuuY9Rtnqwc/A1va84rzp1TR9p71rNTdIDPidm7xHf5w32q0nYhVmg/KiOMmlBXOsYq7DDtkOBZta8Hi+lkAB6vGM7jpWaiN6VFDGp4pQrm9i7vRXFR3Qd82MNqGwmKU22zd4kFNT10LsgatYV0kjTR8zGxmWPhtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-52f9e79ed93so43459911cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:22:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247372; x=1788852172;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jx+XoqcBBsA+m2qrM8HxfQHaaz8x8crvSJWq14ITrJ0=;
        b=EpBEpnqjJB/kqzrGPJJ+iMDmt5DzHqEIXCHReaMArSUoyBIpBp9w4KdjSkCLYWD+Fc
         IqrYHva/x2vT59NHSXf0tqnRlN1qrnEHWNeMmSpo6eONZTR/mNUYGLPRJJlcXij52pQD
         fRoQIW4fKu7DI9QgPGOsfcimU3WMSpQGBm3Vu8Qhq2uazR94+GEmRYd6rcxPUNJxfmbF
         qUI3RYndBMGWOA/ivQB59fGdcdbg4CbU2qdl6JiyFPa+lMsrxrILfn+9u93DKelMYV9P
         5y9h2/NeCGJiC9Lj2T3kL+2GYR4E4xOXtMX6JdjUXG7z3Q8W1HnOSylX4489X1+87NRu
         HL4Q==
X-Forwarded-Encrypted: i=1; AHgh+RoPO0F4vVKETd58KHRB9GrTTqpDm+0md5vXLwFUNj6aNid5TIpiSRmNh2Oi1hQbRQIb3poSIDMZ2RGv6vQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kc6Zogdi906AXa9+/YUgC+fSIbKBT833D4SxrwN9uXGrkTh/GO
	SJYS5Oi0Jvwy4io9j7zAQ1ed7dXWfWAmGg9qjUIfMXnhbbSnXLuNxC+8l7eIDA3S
X-Gm-Gg: AR+sD13yJHcRYWY/R2ngr5CkYNDdAdOqw/e0fi2rewb8Ff1LTMkegTEvAI4yxCNtcJS
	U/LhiLan2FX1C31fgpBXUhZhf+xX18sMZtygILBK84kgMWDvFBQRx4cMQHg1sAvFGpY9Iv9W5YV
	qgDZ+RTxc2/f1tHOhHp2IAM9+mnk7ovBUCLPHnDhrNCLeerpShTVyK5psBFdxxPZasUhBNODpFV
	7i32NbCeJPQmjdL/NLV/NayAS7uCzzpSZJbiaGzXFIAQhltuuLBR5pCBdsWDZLremCMZvL5Z2Y5
	V34h8KArKSLM83fjOf+sA9LmxoyFVsY/O/NQkpcwmdC6+mYCfQ4aulvyETLrhlMFSQAYmVoJfKl
	PBjVTqTcoDddd47Fx/8ZWURe26FOhaTptEtyD1ZWfFQY64Gn/FuQQGfzYLhuALVKxul+6bZOHZC
	AXVJC5eTgVYnUG/g67MZRXdpinlG47ekyfhjDIXQSzu/9u8bl7lzQ/SdI3UWmLfhrPmJqlnAI7Q
	JENePlUr94zngmdBdEtI6SncEtMy7gbY0/d8gik
X-Received: by 2002:ac8:7f44:0:b0:530:2718:8d44 with SMTP id d75a77b69052e-53027189168mr35374761cf.23.1788247372063;
        Tue, 01 Sep 2026 00:22:52 -0700 (PDT)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com. [209.85.222.179])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52fbe5495dfsm89085961cf.6.2026.09.01.00.22.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 00:22:51 -0700 (PDT)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93906e8a5feso451781285a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:22:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Roi6hIT79mA/lr/FrvAmA1bN0jQXG4hC2Zq/A589BMXOZUuN/Rtc5VllSAXe6Hxlnpk6vpNJnoO1EFiLEs=@vger.kernel.org
X-Received: by 2002:a05:6102:a50:b0:77e:6f90:4aad with SMTP id
 ada2fe7eead31-785962b2f0fmr9912673137.2.1788246874251; Tue, 01 Sep 2026
 00:14:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787239813.git.geert+renesas@glider.be> <apWfW5ahiYagw0OR@redhat.com>
In-Reply-To: <apWfW5ahiYagw0OR@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Sep 2026 09:14:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8YidsoHudY54RQW4J=G446WNgRG6Q-P5f1YEHd3sHkg@mail.gmail.com>
X-Gm-Features: AcwNN1V5M0ZQ_v_xaH6RI1jedVGh-HNyKWbpGWR_Rc-YS9IPBF0NOfuHqPh0NM0
Message-ID: <CAMuHMdX8YidsoHudY54RQW4J=G446WNgRG6Q-P5f1YEHd3sHkg@mail.gmail.com>
Subject: Re: [PATCH 00/45] clk: Make sure clk_init_data is fully initialized
 (part two)
To: Brian Masney <bmasney@redhat.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Linus Walleij <linusw@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, David Lechner <david@lechnology.com>, 
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	arm-scmi@vger.kernel.org, imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Mon, 31 Aug 2026 at 17:36, Brian Masney <bmasney@redhat.com> wrote:
> On Fri, Aug 21, 2026 at 10:53:10AM +0200, Geert Uytterhoeven wrote:
> > The clk_init_data structure contains several mutually-exclusive members
> > for different methods to specify the possible parents of a clock,
> > prompting drivers to initialize only the members they need.  However,
> > not initializing all members may cause subtle issues, which are only
> > exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> > enabled.
> >
> > Hence this series aims to make sure all members are fully initialized,
> > to avoid such bugs, and to prevent future breakage when converting
> > drivers to a different method for specifying the parents.
> >
> > Part One[1] fixed all cases that I identified to be real bugs, in
> > response to a crash I saw on BeagleBone Black.
> >
> > This series is the clock subpart of Part Two, which fixes remaining
> > cases that are currently harmless.  These are still fragile, and may
> > cause future breakage when converting drivers to a different method for
> > specifying the parents.

[...]

> 44 / 45 patches have been added to clk-next. I took it all for simplicity
> rather than everyone trying to cherry pick just their parts.

Thanks!

> Geert: The only patch that didn't apply was:
>
>   [PATCH 27/45] clk: renesas: Make sure clk_init_data is fully initialized
>
> I didn't look into it too much.

No worries, I have queued it in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
