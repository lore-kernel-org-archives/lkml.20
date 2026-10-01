Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7321B4C9E03;
	Thu,  1 Oct 2026 08:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790842967; cv=none; b=qQPv9vDWHaSLc7ZzEck2vSKJmbzkZNydgZGptMwUHnYKTvhKApKxgZQNn1QpbpXJ2dT4nNOwaJ+sp06wn0oeTglul9fHd0+6oKQQCU8WQIhBOXqA9OUHzsu/ZKBoGqCaEK5hbP554BrXu/qUYQnPGykpG0mgjHqtc4kpxXqb3yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790842967; c=relaxed/simple;
	bh=73yC1vIQqtbY6qEyWiefnUlu1pre7bKQ2na8VNpVpL0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=n1WMKtU+qLHta5hIyyIBH1VW0+7zaLY5dfYnsUyNRhMGs9e+P8v7ggJpd/rg41F4Iu3/HzTM169kCcbk9HImiiwfjxXZeK7S8UYWaRu32cwP3dnxwsMT9AN4jPjFRRXL7efVRcOSjDpnSB1qeg9NsOf71KG2RUGwsAH/820Uqe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fhsveCrc; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fhsveCrc"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B68921A109E;
	Thu,  1 Oct 2026 08:22:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 868AB60341;
	Thu,  1 Oct 2026 08:22:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 07B5610329863;
	Thu,  1 Oct 2026 10:22:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790842952; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=iiAwsiQMgYV9VGi6vyrhArKRXYKpln5jXLIREbqrMWE=;
	b=fhsveCrcz96epTM91AYz6/ThU5MjFMp3RUYu6eZS8zICI8mIvRAcHMUH07zGqBTrNVxH1w
	gnyvolKeCHaNKHqbpjrb63VroLPD4WBbEt8nzBVn5b1EiPpAPTBeEnPVa79NV7LEWuVOo5
	jN4MIDF5BA14dckv1d9rRbqj4hGJPeJhJrOALw9Jok+RMV9ipRTKw9uquphRBNXLBRlAud
	aECCxmURE4IhNfK0hH4dU86ZG0ABixtVMlpaX0F96lggzMlHYggMqv2DLSeyT1QY+kzuVB
	TawPrlyVs6KK/r4vIiXpBPJZRi0Ghi1WDEzhg9WD6cFlB/MxV7YH1N1C7vCYcw==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v7 0/4] timers: Add support for RZ/N1 SoCs timers
Date: Thu,  1 Oct 2026 10:22:20 +0200
Message-ID: <20261001082225.125956-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The Renesas RZ/N1 SoCs family has two timers block controller
available.

Each controller is charge of 8 timers (six 16-bit timers + two 32-bit
timers).

Each timer has its own interrupt, its own prescaler that can be used to
divide the clock by 25 (timers block are fed with a 25 MHz clock) and
all timers can work in either one-shot or periodic mode.

This series adds support for those timers blocks.

Best regards,
Hervé

Changes v6 -> v7
  v6: https://lore.kernel.org/all/20260929085035.57609-1-herve.codina@bootlin.com/

  Patch 2:
   - Fix a NULL pointer dereference issue reported by Sashiko in
     rzn1_timer_interrupt() [0].
     Even if the issue cannot be triggered with the hardware used,
     avoid the potential NULL pointer dereference in the code itself.
     [0] https://lore.kernel.org/all/20260929090618.011BA1F000FF@smtp.kernel.org/

Changes v5 -> v6
  v5: https://lore.kernel.org/all/20260911150456.893761-1-herve.codina@bootlin.com/

  Patch 2:
   - Fix a comment
   - Add 'Tested-by: Wolfram Sang'

  Patch 1, 3 and 4:
   No changes

Changes v4 -> v5
  v4: https://lore.kernel.org/all/20260721082952.215691-1-herve.codina@bootlin.com/

  Rebase on top of v7.3-rc1

  Wolfram sent his 'Tested-by' tag for patch 2 in the v4 iteration but
  because of timers re-assignment done this v5, I haven't add his tag
  in patch 2.

  Patch 1:
   - Reduce the reg area size
   - Add 'Reviewed-by: Wolfram Sang'

  Patch 2:
   - Take into account Shashiko's feedback and avoid paths which could
     lead to a NULL pointer dereference in the interrupt handle. Even if
     these paths cannot be reached with our hardware timers, remove
     them from the driver.
   - Reassign timers usage for the first timers instance probed:
       * First and second 16-bit timers: clock events per CPU
       * Last (second one) 32-bit timer: clocksource and sched_clock
       * Other timers: clock events for all possible CPUs

  Patch 3:
   - Reduce the reg area size
   - Remove some empty lines in commit log
   - Add 'Reviewed-by: Wolfram Sang'
   - Add 'Tested-by: Wolfram Sang'

  Patch 4:
   - Add 'Reviewed-by: Wolfram Sang'.

Changes v3 -> v4
  v3: https://lore.kernel.org/all/20260717095552.767475-1-herve.codina@bootlin.com/

  Patches 1, 3 and 4:
   No changes.

  Patch 2:
   Took into account Shashiko's feedback
    - Remove CLOCK_SOURCE_SUSPEND_NONSTOP flag
    - Fix CPU ids checks against number of 32-bit timers (avoid
      out-of-bound accesses)
    - Enable IRQ in CPU hotpluig startup function
    - Add CPU hotplug teardown function and disable IRQ in this
      function.
    - Adapt probe() to avoid IRQ handled by CPU hotplug startup/teardown
      been enabled by default.

Changes v2 -> v3
  v2: https://lore.kernel.org/all/20260429115054.158160-1-herve.codina@bootlin.com/

  Rebase on top of v7.2-rc1.

  Patch 1, 3 and 4:
    - Add 'Reviewed-by: Geert Uytterhoeven'

  Patch 2:
    - Fix typos in commit log.
    - Split Kconfig 'depends on' in 2 lines.
    - Fix indentation, space and alignment in code.
    - Fix dev_err_probe() conversion format.
    - Introduce rzn1_timer_setup_timers() and rzn1_timer_register_clkevt()
      to avoid code duplication in rzn1_timer_probe_{first,other}()
    - Add '.suppress_bind_attrs = true'.

Changes v1 -> v2
  v1: https://lore.kernel.org/all/20260331152616.197031-1-herve.codina@bootlin.com/

  Rebase on top of v7.1-rc1.

  Patch 1:
    - Drop minItems related to interrupts property
    - Add 'Reviewed-by: Krzysztof Kozlowski'

  Patches 2, 3 and 4:
    No changes

Herve Codina (Schneider Electric) (4):
  dt-bindings: timer: Add the Renesas RZ/N1 timer
  clocksource/drivers: Add support for the Renesas RZ/N1 timers
  ARM: dts: r9a06g032: Add support for timers
  MAINTAINERS: Add the Renesas RZ/N1 timers driver entry

 .../bindings/timer/renesas,rzn1-timer.yaml    |  74 +++
 MAINTAINERS                                   |   7 +
 arch/arm/boot/dts/renesas/r9a06g032.dtsi      |  34 ++
 drivers/clocksource/Kconfig                   |  11 +
 drivers/clocksource/Makefile                  |   1 +
 drivers/clocksource/timer-rzn1.c              | 483 ++++++++++++++++++
 6 files changed, 610 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/renesas,rzn1-timer.yaml
 create mode 100644 drivers/clocksource/timer-rzn1.c

-- 
2.55.0

