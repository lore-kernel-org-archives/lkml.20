Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239106;
	b=vQFlC6lroSz7qQ6FhtRLXJryAd5REieC3ttlR2Ocyf2GkHn48Gz+VgrLshN0CtazMaTI
	 0vQPfkuKtCeXLmh3aE1ocRLD82prGmrga+TYxci5IlKo6+5j9L03EMF/tOxKlxeDDoMon
	 9FkZp0Q+98DgFFezmPwqp06dieA/afe3dFMBkRs9OGQXtSGeLR0T9+EtwHwk1YrQkjgJg
	 iNJNSdPd8BDlfFBxqYlP2BQ+wh/C5bQeLlldgu5TDBL8TPt4dfcXfPSZoOudq44V4IIVQ
	 zizMOI/qNOAJ1Rrl2CkRxEtHF2u5tQS2qigkJIru1MkJXkIGrElzjiEFHolUlyvhOQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rKfLZbQgYUYCC33oLQtFHXrdM0UQjzaXcbXsbGQdHjk=;
	b=gkk+73dkRCgRHIZyx4dKF3PUD0dlOBmUFPGuIJISfy18gljcW2eoIItDsrVaYDV9bx0B
	 bEAeUIUgPqtpYOP5/twH8UhUbozx/XUYWoPb8HxppY+32TZslwljQc1f7ojSs5oIIz5hE
	 L/YtUeKKJEhszrMxssCakW4V8m5Rpy00A2QK26smENeGo+Qv4qBkKAJgKZxzzJ7fUgIqC
	 OA78pG4i9DA9UY70DGPGkvfhmIsosvOfsne7xx5ynvCfkUy66IMz6XJ5mhUcVdJ+6Mo9N
	 0L9zAdbpPkAujGzD9YMo7gxKqRYY3S7t1VjEz6EgUMORY//CMG0Uiw/68ew/ytpjbFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="kSco/aPR";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8602606A338
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8602606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kSco/aPR
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so10428475e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794239104; x=1794843904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rKfLZbQgYUYCC33oLQtFHXrdM0UQjzaXcbXsbGQdHjk=;
        b=kSco/aPRed7aKGpqjXFcYCWpeSXf4f6oONj5r25xKurUKJXNRTttgl000KMome1nia
         DD6FfhhgoYOA/xuvx/Bnr4N5DWd622HmuNAtU8m9g8Wgh2c9KDhd+bFFW3cKLqMY9dAX
         CG88pSgH+dBsguCWtNgsxdgLclbDp4TQwEngOXDN9+YLC0qkn6YKeQwzGkOQFs+yBmgg
         mOtsq4OcVSo1/2OyXrdQa1wyHSkE4qJj02eRpY4hnjH6TldObpX4tVtZrIFtfQmd4S/I
         CdKTqq8UfVdNxaA9b0FIklb5ZJwfj0r70HCVQ+K99o3VbVfH9+rwd244vJENKM1nvD/Y
         WKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239104; x=1794843904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rKfLZbQgYUYCC33oLQtFHXrdM0UQjzaXcbXsbGQdHjk=;
        b=X7uxE/4im/j8O+uxKt8U0JLscDGh0pOjzW9xylsBO/0APPs88nuAQqWCFRIHOF7WgJ
         jPFoVwFpx16rlVObVAx5Jnlan1KR3Ls6V8/oKTO7Hy+4shn4o08dZ1lSojsgTvtNGuLc
         Khtadh3ZiVeE0CrzpeN9utO5dpnkGXUho9BKM0lCyXxtpczrWYxsBYKyBET5ibdb8nyU
         FCqo9KxbHOx6IeJXaAEVPgyTV0pFf04M3BDyjdkuPSuM9KZZwIrJGfiuGo48477Yubsn
         17LeSSV/0NztCZxdZlilLmy6IJb6PomYKfMmh7LQkyjk2boXwJnNmlYuE3mIgyKPrN0f
         5NYw==
X-Forwarded-Encrypted: i=1; AL+hErEOknFL4HD11TTTikBNQjSzl5GDyG/H3NAjxM5BN5BswxAMRQ5+SHF8IpIfFM+SyG7bNpn1J4hBOD5T/ik=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LCP+2ap4LyqVIuG/eVhAVEyE7EpY1Zpv59T3fMVjWbw2/4lam
	Vhwl17CdjEj1hcHnuAAvAgd4BCSjGOsWjJ86TzkA1mlgQ7L/GkfA3DcWAQ9aWR/4
X-Gm-Gg: AYBFou0iF/t1Bo8nZ1UHYcCtO4bc8xX8dSmrZEuyUCDvmhiJVCKOBD4/f/JUeq+ksWy
	U5JSXn6pbs/+4pHOhAtH6/q8ezPR4drglMy207Sbbcp+HxQEEw4RVxezLK0EvM/PLTQDA9gS+eJ
	ZN6kmZdOPonsmMtOpoVOUZgBA41SUUef5Fu/LR058stAT8mOgsUU1S3UyrnzYqYOZqUi7fzynbp
	yI8+Lysun9YtT/w2TJUyxpv6xlfL3IY5euiPkrTAH0eTNYHixL7Eq7MeOpT383kX7Pl2ZdCUvSF
	F6zD01dTRd04KjPBT9KrY2qf7dIR5M5OpyFVIqMak4Wj0+7UFbeTEyRrLY/ULHXJnIwXLdW2k6z
	I/WvUL2fRuNNdP3jYGKOtchoMv1E+K9KVbqcxbabcIZ09X8jfECbtmk0D9KQmHeD201HuWBrVxF
	wPgNHxHv1cx/ZGgVy7hJ4OnuK2oIWZcOhTRIjbK7TSfRw/qGDc0cjZQ3NrNSeekLr/R/07JL44W
	IUeGpvGc8JLairiQt2ExpzG5Fb++AmSnj2EbLqtAUiP5DFKKoO+9LmFKReW7TvHMiJqxV16cInr
	fwJNm94Ih8foo05m+9Ed67Jfw/WZhYKXKpQUDOqNRm9FOrnY93qyWxU=
X-Received: by 2002:a05:600c:4505:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4b963c85de8mr84815385e9.33.1794239104072;
        Mon, 09 Nov 2026 07:45:04 -0800 (PST)
Received: from hp-z640.fritz.box ([51.37.204.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad4d1sm257163645e9.5.2026.11.09.07.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:45:03 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	"ziv.xu" <ziv.xu@starfivetech.com>,
	Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	E Shattow <e@freeshell.de>
Subject: [PATCH v3 0/4] rtc: Add StarFive JH7110 RTC support
Date: Mon,  9 Nov 2026 15:44:57 +0000
Message-ID: <20261109154501.63762-1-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The JH7110 has an RTC in its always-on domain that mainline does not
support. This series adds a binding, a driver, a MAINTAINERS entry and
the SoC DT node.

The driver is based on the StarFive vendor driver (rtc-starfive.c,
commit ebac2b5 in the StarFive 6.12 tree), reworked for mainline:
- hardware calibration and the default time set in probe are dropped
- wakeup uses the generic wake IRQ helpers instead of the irq_desc hack
- set_time waits for the counter to load the new time
- read_time re-reads if the time rolls over between TIME and DATE
- the offset rounds to the nearest step and follows the sysfs sign
  convention (positive = slower)
- the 32.768 kHz counter clock is described in the binding and enabled

Thanks to ziv.xu and Hal Feng at StarFive for the original driver.

Tested on a VisionFive 2 v1.3B with next-20261105 and v7.3.1: setting
and reading the time across the 2000-2099 range (out-of-range years
refused), leap day and century rollover, the alarm interrupt with
cancel, the offset, the rate over 60 s, and setting the system clock at
boot. Not tested: suspend wakeup, drift over hours, and keeping time
across a power-off, as the board has no RTC battery connector.

Known behaviour: the RTC loses about the length of a reboot across a
warm reboot; the counter appears to stop during reset. After the
StarFive vendor kernel the first boot found an invalid time. I would
appreciate an opinion on whether this is expected of the hardware or
something the driver should handle.

Changes in v3:
- dt-bindings: add Conor's Acked-by
- driver: add my copyright line; drop the extra space before the
  register bit field defines (as requested by E Shattow)
- dts: rename the node label from rtc to soc_rtc, leaving rtc free for
  a carrier board's RTC (as requested by E Shattow)

Changes in v2:
- dt-bindings: list myself as maintainer instead of the RTC subsystem
  maintainer (as requested by Conor)
- MAINTAINERS: new patch adding an entry for the driver & binding
- driver: drop the <linux/mod_devicetable.h> include (as requested by Uwe)

v1: https://lore.kernel.org/r/20261106175600.3877614-0-oo.hehir@gmail.com
v2: https://lore.kernel.org/r/20261108212826.15890-1-oo.hehir@gmail.com

Owen O'Hehir (3):
  dt-bindings: rtc: Add StarFive JH7110 RTC
  MAINTAINERS: Add entry for the StarFive JH7110 RTC driver
  riscv: dts: starfive: jh7110: Add the RTC node

ziv.xu (1):
  rtc: Add StarFive JH7110 RTC driver

 .../bindings/rtc/starfive,jh7110-rtc.yaml     |  85 +++++
 MAINTAINERS                                   |   7 +
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  14 +
 drivers/rtc/Kconfig                           |  11 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-jh7110.c                      | 324 ++++++++++++++++++
 6 files changed, 442 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml
 create mode 100644 drivers/rtc/rtc-jh7110.c


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.43.0

