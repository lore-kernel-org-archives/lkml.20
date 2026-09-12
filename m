Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D99F31352D
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789176586; cv=pass; b=ez7VXrZQhfbhvkG4u8/o35fbqxCMJRbR3PJTVzM/1wMnCjuHS4Wf2HRX/GO+yvyPzGPOWzwQrh/SdwCwMus9XOQJPVY96BRuA9DiOjd0m2ahTdjf1syGJi/dPhKVPgrwhixrXG/gz9pgWxxIMzFqnDmCMLabch5IL/inAV9AuDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789176586; c=relaxed/simple;
	bh=MqFZZ1MZCCOk3B2AWbqhU4vVtD/Z+SwXDy5HKI6vso0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=obWk63JuHcJczXJv5yqv1IHbsm7EMlPChMQ7ry+l9fs0kNl4x7bCrzZ/RI5ImuYdjQTnFSr5kcK1icPabz8XhqC0vw9PXqfie+7iWCPltfzJp0iahxxYj78BASX8ZCk4+16kt4AKXWcBPAlVA8k1a0R2Qojb59Ou5Y32rbcAQZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=sEaX7iP6; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="sEaX7iP6"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fe517774so6416735ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:29:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789176585; cv=none;
        d=google.com; s=arc-20260327;
        b=jONJoGM0j+iIGCmFXw8UAiUxH5HSk2AARJAyLsVCyeR3w6VNDe027sktyGDOo1a+Wc
         8MgPtBILDV4t6ztMYeK5Yz1KgVbOQ0M0lGOvn8MGx348gdQBNA5uDrZpnbnkp0xBEubV
         BlVbYZPy//WDyO4U/7Q9Eo+MpbY9lCVzPYK5AUH2d0ngr4gd2IdgUbMMczJzz9TYf9T5
         xiAM9jny+SshdtKpGp4lTflFi950+ysD6rzM9Bs6IC2VXuB3Nl9Xab1/1JiqNZfM3avC
         uWZH+6msviA+aRg+P1K5fdEzVpqU4cnTU2dHv1jE7Z86/S4bkJ4dc/7kpGknzbVwJOUk
         EDEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MqFZZ1MZCCOk3B2AWbqhU4vVtD/Z+SwXDy5HKI6vso0=;
        fh=PbVIanoHihxnKl04mpjbZDIyavTwnPXXr3/6KmEwp/Q=;
        b=QV7nMqSRSVMn3N4//2b3EOJRkS+pFHvmTJB+frVjw8P9ecYhMd3QqKtz6GezSfcJg9
         ABMXXis9/r6pX1DpBX2OZ/UNZGJYENEcLYkeKL3i5E1Dqpm2eh2uQIR2KussRmMXy7AL
         e1LfKv7NHGR+zTjO1F693bFr96+OuOmxzfOGtOGnVcuKAsd8gCt/OGwpNqitWczqLkzv
         BXz4aR+BrsO9dIce6b0inBrw4lVDP3nidVd1zgk8DX/q+Dp5hsVTs1TGFCQJRnVRtUrV
         V0RimPNGUU5nnkLdALzibwUZLooiMtOtwvmPDT6ZE1W/STmI0Xf+GS8x6iPuw/r537uh
         KjXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1789176585; x=1789781385; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MqFZZ1MZCCOk3B2AWbqhU4vVtD/Z+SwXDy5HKI6vso0=;
        b=sEaX7iP6HPXAB3Gry9yqXyc0fbdAc/pu+yiGptgmtxlZCARvAZIVpJN7AiYZYWIcLc
         mXAa7+yoBCizntDw74QJT6L4dw9XBNn2sYy4Bds9t46QI8b3Rzv0gtjZW4gZXyhGUWGI
         B8eg74G+blucnuh3r3CJOw770BhHy6kzz+JZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789176585; x=1789781385;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MqFZZ1MZCCOk3B2AWbqhU4vVtD/Z+SwXDy5HKI6vso0=;
        b=SDijUo2R1PJ1XpG9ueGQMTuoOVXk4K8YTPfg8I8qEky119s/rTcvlWFlliHq+yU1nP
         Sj0DnuCefmIWiy3YR5lozPwuq98qFL1VWvYIWlU7evL9k6wKZVuKaygSKkIB3yzoYL32
         GPi9p/xgkzAheHCf0GjbX0/3sX/J91zgfjJTXWScu8hVXu75Kk7HPuprSthTK5ASYAsM
         1iYV5jONN/ps3BKEMvAcWgR7XVog6jrV1Xrm1tT5H89oBQimA3gMPj+OxJRmJ8oy/rg+
         mKtV1cof/a30uYJSNpXXP5JKLIPChHQCwHXVVBWVEScl1wHz5C7CdP70wr4fTX9CDQdp
         Yruw==
X-Forwarded-Encrypted: i=1; AKwUvBxupqYWwdcg+UG8p/mo57kV+ZsiAWkZhIVHhS1150DjvmKwh6fIqeMDRX6jSSfjhoqcjWXjp9+VzyxFKK4=@vger.kernel.org
X-Gm-Message-State: AFuF++kV2I4/cLkQtbuNXckOboh3fEBXzWQIgoZQpEEL3K2Wpm6yh4yU
	y42Nq0dmCM+7jw4mPi3QRZXi61ATrGAUUmnS4S9zUgeJyzekXuEaZsR4O8xKbeo8oTUln6aN6Yx
	S4fYzjD1o07NvkuoMzNPzPJ8P9Cfc0Q2tlyvUrPuTww==
X-Gm-Gg: AYBFou3ffWpGHSUYPvVjUuvQE3182FF2X6ENXSM5LwCa8OZtip9qfRsTQJm89L7sXsi
	Unx8r/DiPqSdPDAGqRHkpRT0qQ2xclNWyPRfPJdu5VR+Yx7a+zMAIGYNpSRmfYvvaHJgkUsK9hw
	0w9/lg7ISrMWUcXP/V2kxHPgvH/Qa/c2mqRZo03Lt+IHP8PY4zYbDESrbT7tn8roWiNzcRD1PWa
	ikMBInW/QbaGZFhDmyAKkVO2uftbTkox32OqcFn29YO4rdkiSWasb/6ELh+JAzI4uGV7EvxVwYf
	GOtMG0tyWZsR0+rz5QPUG7tTu7dkXlGD5HqlmPrO4Z4QvrxL2M7Xow==
X-Received: by 2002:a17:90b:4fc2:b0:381:6c5:3f63 with SMTP id
 98e67ed59e1d1-39d9bc42d1bmr12376403a91.6.1789176583130; Fri, 11 Sep 2026
 18:29:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-4-arnd@kernel.org>
 <CADkSEUjYhRk-ezaXZkHzFTFQnySFSisKtZfEP-_NtLnQF+6-1Q@mail.gmail.com>
 <CAD++jL=ysmPgs8yKH5KBobuv-eeCHHgZwvo1kvHOFuTwhkaOew@mail.gmail.com>
 <CAFr9PX=_FmMdR4TeP+tqURZdZCTjw8UYxAxeszs_vcpTbX+_aw@mail.gmail.com> <CAD++jL=zaF1zcTv6Mta5Xw69WeLC30NRcH0_pkSkLJJ0UtnZHQ@mail.gmail.com>
In-Reply-To: <CAD++jL=zaF1zcTv6Mta5Xw69WeLC30NRcH0_pkSkLJJ0UtnZHQ@mail.gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 12 Sep 2026 10:29:30 +0900
X-Gm-Features: AcwNN1UYIuhyU3FVES8GlXYNI9phDxlCK3dBrZsiSwUakZtphqfaiRPyo96Awf4
Message-ID: <CAFr9PX=tVOzqGU4k0zSzXheuU5z5LZi4LSGdUvjChrSTrbyjJg@mail.gmail.com>
Subject: Re: [PATCH 03/13] ARM: remove riscpc
To: Linus Walleij <linusw@kernel.org>
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Alexander Sverdlin <alexander.sverdlin@siemens.com>, Shawn Guo <shawnguo@kernel.org>, 
	Karl Mehltretter <kmehltretter@gmail.com>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	Ian Molton <spyro@f2s.com>, Jens Axboe <axboe@kernel.dk>, Helge Deller <deller@gmx.de>, 
	Thomas Zimmermann <tzimmermann@suse.de>, "Paul E. McKenney" <paulmck@kernel.org>, linux-block@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

On Sat, 12 Sept 2026 at 03:15, Linus Walleij <linusw@kernel.org> wrote:
> I would say using generic entry would be a prerequisite for
> doing m68k SMP so we don't introduce *more* entry
> oddities, but after that I'm game.

I have started this for one part of the m68k tree (68000), but it's
one of those things that is hard/frustrating to test on real hardware.
For the last few weeks I've had claude create a QEMU that can boot all
of the m68k supported machines to Linux, Netbsd and their original OS.
It already found this:
https://lore.kernel.org/linux-m68k/20260828094940.3882602-1-daniel@0x0f.com/

> As SoC maintainer I see that m68k has a lot of technical debt
> like drivers under arch/m68k and no proper hardware description
> (such as device tree)

I have m68k machines using devicetree... :)

> There are things like
> amiints.c, cia.c, ataints.c, q40ints.c etc that should be in
> drivers/irqchip. So many time.c that should be in
> drivers/clocksource/* and many other unmodern things.

Would be easier with devicetree. But is anyone crazy enough to go
through the pain of merging the devicetree support and then arguing
about devicetree bindings for each of those drivers only to be told
m68k should just be removed?

> Albeit I think actually going and fixing that can't be super-hard
> in the age of LLMs. So listing things like this likely will just make
> someone go and do it. :D

Once you have an emulator that the LLM can operate it can do the
change/build/test/debug cycle all on its own.
With a test harness it can even test the changes work on the real hardware.
But I don't think that's enough to convince people the changes are
worth reviewing/merging.

Cheers,

Daniel
