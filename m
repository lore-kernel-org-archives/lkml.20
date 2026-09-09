Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC2447F762
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788947099; cv=none; b=SN1nztive14uMjwLftYDjRpFwkQPfT0NPV1bD0c6rdabYeDNIx+sitSA+zn9sp9HJwGTYhudwSpqnhy9WGByBu8IlcxlrH+vHhAW1CgHP9XwkL5b7G80AO3GvIqI6Mt/omzy/fAMdU/wLlfIEhTSviujpwQUlOJcKZLzYh/qv70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788947099; c=relaxed/simple;
	bh=nM2s8gx/Je8WGIJgPhRplMW74WrpUlMHbbNcaKQ3dko=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fG84N2tp/euUyhUm7UgACH6z7z0zZfG5JwKSk/1rFCBPmRmKsJobm3e8u2UsZ7ZGGCBI93s5BDJZ9QsgHXxWtKwTVm5fq77ynFW8n83CC/mEz7nik7IGRRs6Z1xh6TLL1vxsgLC/BrQAtPKGzc5XJ7yHHgi9UQn8m5haqO2EXuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CGnKozlO; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CGnKozlO"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D5FC74E415AA;
	Wed,  9 Sep 2026 09:44:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8B5EB60448;
	Wed,  9 Sep 2026 09:44:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DE30411C7AF71;
	Wed,  9 Sep 2026 11:44:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788947094; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xxFbznEhAZfeywSFuyPBm4t7F5rpiDH6ysWr9B6AUuQ=;
	b=CGnKozlOYqqcSG0ChL7uhiqNVGxfovumWhW5cx4pPMyONFltGfzCB4YgT/C+iQ0Y2q9SKr
	kuGLAacjCePZn284Yyk2a3apc7bcDD8fsN69bmS5e+vqlhZUAl9wCYo2b6yrWECACEknc3
	kXxiAWhkmDxyTd0Id1oKc+nJOF4dooWpKtjWSYic/xyKs9EYuNnfYJooC0+BPjfnH2PLAf
	Cv0eTTOvaFJPeQ0oU4i0y2wP247VOqEu1aNMU1NZusMb3XcHN6uzp6dt0rB354h7gQIWCm
	TFd44CxmuG8n8ZanQwWuv+iRC9VfdOjOJT3ohH4BsvI6Z73E+gS6iHwnvwqV7g==
Date: Wed, 9 Sep 2026 11:44:49 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Herve Codina
 <herve.codina@bootlin.com>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 2/4] clocksource/drivers: Add support for the Renesas
 RZ/N1 timers
Message-ID: <20260909114449.1d1ff12d@bootlin.com>
In-Reply-To: <20260721082952.215691-3-herve.codina@bootlin.com>
References: <20260721082952.215691-1-herve.codina@bootlin.com>
	<20260721082952.215691-3-herve.codina@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Thomas, Daniel,

On Tue, 21 Jul 2026 10:29:48 +0200
"Herve Codina (Schneider Electric)" <herve.codina@bootlin.com> wrote:

> The Renesas RZ/N1 timer block controller is the controller in charge of
> timers available in the Renesas RZ/N1 SoCs family.
> 
> This controller handles 8 timers:
>   - 6 16-bit timers
>   - 2 32-bit timers
> 
> Each timer has its own interrupt, its own prescaler that can be used to
> divide the clock by 25 and all of them can work in either one-shot or
> periodic mode.
> 
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> ---
>  drivers/clocksource/Kconfig      |  11 +
>  drivers/clocksource/Makefile     |   1 +
>  drivers/clocksource/timer-rzn1.c | 487 +++++++++++++++++++++++++++++++
>  3 files changed, 499 insertions(+)
>  create mode 100644 drivers/clocksource/timer-rzn1.c
> 

Sashiko as reported issues [0] and among them, I really don't know what to do.
--- 8< ---
  [Severity: High]
  Will using a 16-bit timer for the system clocksource break NO_HZ_IDLE?

  Since the 16-bit timer is fed by a 1 MHz clock (clock_rate / 25), it will
  wrap every ~65.5 milliseconds. Will this short wrap period force the core
  timekeeping code to wake the system extremely frequently just to accumulate
  time?

  Would it be better to dedicate one of the available 32-bit timers to act
  as the system clocksource and sched_clock?
--- 8< ---

Those 32-bit timers are assigned by the driver code to per-cpu clockevent
timers.

I could use one of the 32-bit timers for clocksource and sched_clock but this
also means the per-cpu clockevent timers will be 16-bit instead of 32-bit
timers.

Maintainers, what is better to do ?
  a) 16-bit clocksource and sched_clock + 32-bit per-cpu clockevent timers
or
  b) 32-bit clocksource and sched_clock + 16-bit per-cpu clockevent timers

[0] https://lore.kernel.org/all/20260721084351.CDA391F00A3A@smtp.kernel.org/

Best regards,
Hervé

