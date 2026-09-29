Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6AA4BD106;
	Tue, 29 Sep 2026 08:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671862; cv=none; b=odEebMW7eGP0ANHVLndtLVsY9onwmi7aYNRR9iVmIBUyOtNlWVMS8Md5sWbsdoOZomnIqzUZ8Wk4WX4BVcAn+nDQKO4XgxcTkOyO04p4mM3vF4HFqYf+Gn25UTHBGpC2ONi9m9CFW+XuTS4H7DqeTVkUhXwsXTyzsIBqpGzLYhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671862; c=relaxed/simple;
	bh=ZxKufniYDJUjM/W94zlP7DWtMkIq8VccOPZ+e1Xaqw0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YusYxMjflBw/FCCecPd79B8pqiXEu9NliLoHDeHZ8CL4ZRRlUDtk33O9h2z4XfoBnNvMhTjvcRstZu161GLEZvYagfmBub5+HI34FeLJrJhdvin6QtL2jmxhkX6+hFeCI72JI5fRKxyIRvG2ZZikp2jOFDtVd8izuffm5EomTv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qUcAPjl8; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qUcAPjl8"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A22204E410BA;
	Tue, 29 Sep 2026 08:50:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6F1E0601BD;
	Tue, 29 Sep 2026 08:50:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CF9FF1032960B;
	Tue, 29 Sep 2026 10:50:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790671848; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=kY9txcMTyWH2CmnwG+I/iwir1YJNr0vNHV6tRoyMll0=;
	b=qUcAPjl8r0uafq3gEI+Xi05oWyq2iYou3PSoVqMFtIzgUnwdHIuponMikm6xpWJMuKGdRP
	NmIxYRREgnr+GkFGOMyUBTAMStVPWLmHkkCQ1gD0LcrJ3WzVOIsjE9hiSKiyFJCuqn+MHo
	cA6qk6iBKJtCdWmMGL3F896lURF0XwROk7inVw99e5kRMo30uzgPp895YbSQxxGvmtomv7
	7H3Hpx0cyICS3LZ3Iu/nNQXuuqYDEeH9JzmGlY7Zt5IibZ3vlSTvl7RgV5YXeqcLo1kv4W
	FuECr0256UxMIu7M//8UaM+dRRU/zyAb1D2yYLphzVOva5rzJYnoIKKjglaAhg==
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
Subject: [PATCH v6 0/4] timers: Add support for RZ/N1 SoCs timers
Date: Tue, 29 Sep 2026 10:50:30 +0200
Message-ID: <20260929085035.57609-1-herve.codina@bootlin.com>
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
 drivers/clocksource/timer-rzn1.c              | 481 ++++++++++++++++++
 6 files changed, 608 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/renesas,rzn1-timer.yaml
 create mode 100644 drivers/clocksource/timer-rzn1.c

-- 
2.55.0

