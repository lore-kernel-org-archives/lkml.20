Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794699751;
	b=GYFEN9fpEOeFUBG1VB5w8IA1a+e8I0pmq1/TjhIeZFTK3z9vdbzfZZqwWroVvB+ADCtF
	 AZ4LdkGzrctyvGJ5wg5IMIbraNKgGiVtlarqHnRWTIt1YYh07fa+YWoRnAdGn8aA5h+o2
	 k8H/u0dctxR+MAPtU1y1p7iRsuwDorRgac8wTdYVh4ymeXkOsP1DcawzpA+hRFQy3EHXy
	 SzJUDkLo6L5+pq92K2r2yuQYHAurmBnBVpSuQBxeI/roEVNuoHxjEZwoiLBI4Hn8bdRWB
	 h2MGAmDlxfe5hrsWLTQgzqHPjz8bIZO571S8xzy5C0bFveADGkJfYtARnG8gxuDk35g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794699751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=JIdwViW3MwPcND+fB4xrX/lkNYexl/I2+Vos84GFCrU=;
	b=O0Ih63af8W1CiVzWldojg7yCwJNDzDbwhY31txa9wtC0K4lTm+Dm4lNqyoIDTNmik/u9
	 89KVBibwJ8BsUByJfP3MFfBHVphqLp7VuVdxfiWBJwFefTmA3edf/NZvpakPZd7dFG377
	 7OLv+JQNL3ZzCirGWN5lLZQ58SS5alZvi7dhnaNxums+Q4LYbXUjgVHN0XJZMqOSYUdVC
	 A1x9LLWyOKqUSnzZqWb5TRIxWYne+9zvIXVdow+b472f9kroeiqZCGAJmnX00XwgjNTyP
	 kIh+cZ5Y8zvcGyne0Z5FZ87yrpcs/GBJlB3vVlvwZSzVFFXnYkyZqaqj6+nW7yD3ocg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n478R7Ht;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03548606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03548606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n478R7Ht
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b0b3438540so2042205a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794699750; x=1795304550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JIdwViW3MwPcND+fB4xrX/lkNYexl/I2+Vos84GFCrU=;
        b=n478R7HtBE31VtoF09RFDgvxLOdNJoP0n6hcHMrmUrktIseH+Qot5DT3T45JARLpxK
         EYwmhr50HgrfShPJAUdrCoDd2KsN7eEeFQDpaLiUDvchx+qtvulWhlizHuXtyj7mMeYl
         n6RvHqXXfrfvyoPYgV/VRU8cswKUutBBdt7rdDXUlZW4Nc2SCtzhBDzkNNCyr8XtvsKr
         zTtrSucpEADd71MimhQc3qA/+Q6kz2rt8IHIKacsVFhb3ssD0B7vAHEoumEZof9coiFQ
         yvPbgVJlMWFwMV85in1/o6mZr3cUBIdUkL4jiqIdmvvXc0siKwLF4D1ci3eSv1SbVp74
         E2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794699750; x=1795304550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIdwViW3MwPcND+fB4xrX/lkNYexl/I2+Vos84GFCrU=;
        b=Mj838o7Qh+Pxv6rnakkVsNuety2sDGtc9PTb3VrQ4UKHJ05KRv9cOLOO+4YExSfKZk
         onulDVEtXXaygsB54ZEk3Cn6M4TW+hU397BORdFZ9d/f18myqrsF1CP2Y+V6nTGbTsgz
         OoX3+3wqbAE6ynn9wnpL6Q1g5m03Bzikrch9pdKDcqCt9ap0tf9fbq6uZbl5kKQ1vsqx
         xBb7oVP0NzoHuDQnSCOeNIMRzm9PkMbGgs6KHMFcZiDasiStcBg3bsxffGa09CCUxn5y
         q/q+M4QzengtwHutAwBBPRGphtFfR2WVcjPKbg1PxGWdNFw+5qp9fkAL2mwSG0gVd3Qn
         JZhQ==
X-Gm-Message-State: APuU4Z9HlftnErPpsp2uhX+85cjSXlnxOdAhC3GMJMK+jxTdiaU3PPsK
	mUATa5hHFXzLqL8h2B568VhHYC7QRByZCKAqx93SAt5evziIeUNHVlt3
X-Gm-Gg: AYBFou3Yw2JVqrmfadJ4Jc8uFK9sQ1P1iIDx8XLJmfoq4olfhXu2uHSCK4PCh2Sq8ud
	FBxCGEaBnQ/s5iOH5NTFoQbEGIi8BiVCBcbYO2BT6NnMMn6YLm26lbajRDxPvAD7l2anl8aXB+7
	c/lZYwu2ju/szCRmsY+QVaio+b0QFTEHSNpI1VWIzNGkpKgoEw0u7+7s0kD6mK/LP7WHURmRiCs
	Go4fh2WbSGoatFnmH6JwLonOV0xTVdNd6JykDqNFgj4pWxiPn49RgRRo8zCFt9jJM0TaQ8AVk/c
	iqZG75w02KD1hGTInTQZDsBG1MrSVIcK3WRrUJ7mXRKZ+uPpKWsn9bS9RF7TG0PZix9ZL3NnKMg
	MxtjeDhaBxaCdZibuyt9HFxPsGQvkeUDJ3bOC4O012r0oRGIDpFgSs5GJlWvrDHRL4Yy6fEWp5L
	Ed9QjvOewtfNX1Gq2QTw0rFRc0eO4ScQn3SoL1VLFadkQ7OyunxKgICBNvbcrzOYxQtYrvkKLuI
	1+WQmDrgF+BCrDX+CPGPLnB0/nfoR1UFWEO02S80z5W52wtRZzwEVuJJulR/GxpbBbRwHUnfaAe
	ErPWXL1cDsD7uS/xpWaERhXkapFoL46u+CC90MtQ34TJrN/oQ8QdxFugw7LBJ/vd1i7Yxh3z+Ef
	YBJnpsLJCo0fmm59YICgBC0UoK8BVNezB1/mHpWdmubsZmzvcs9Xp3V5tWommQA4YS1SpCcerx3
	sJMw==
X-Received: by 2002:a17:90b:3ec9:b0:3ac:83c1:2c0 with SMTP id 98e67ed59e1d1-3b1b0b8695cmr6283495a91.64.1794699750313;
        Sat, 14 Nov 2026 15:42:30 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm15755574a91.7.2026.11.14.15.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:42:29 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 0/7] clk: add a driver for the ath79 PLL controller
Date: Sat, 14 Nov 2026 15:42:15 -0800
Message-ID: <20261114234222.88337-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The clocks of the Atheros/Qualcomm ath79 MIPS SoCs are set up by
arch/mips/ath79/clock.c, a CLK_OF_DECLARE driver that registers every
clock before the driver core is up. This series replaces it with a new
driver in drivers/clk.

Only the reference and CPU clocks are registered early, with
CLK_OF_DECLARE_DRIVER(), because the MIPS timer needs the CPU rate from
plat_time_init(). A platform driver bound to the same node registers the
DDR, AHB, MDIO, UART1 and PCIe clocks. Until it does, the early provider
returns -EPROBE_DEFER for them. clk-mt7621 uses the same scheme.

Patches 1 and 2 move the two remaining non-clock duties out of the arch
clock code, so that it only uses its own registers and the clk API: the
QCA956x timer interrupt workaround, and the reference clock that is
read from the bootstrap pins when the device tree has no rate. Patches 3
and 4 drop ATH79_CLK_END, which is not ABI, from the binding header, and
patch 5 adds the UART1 and PCIe PLL clock IDs. Patch 6 adds the new
driver, and patch 7 removes the old code.

Tested on a TP-Link Archer C7 v2 (QCA9558) with an LLVM build. The CPU,
DDR, AHB and reference rates (960, 800, 266.67 and 40 MHz) match those
of the old code. The serial console, both GMACs, the PCIe PLL with a
QCA9880 behind it, and the WMAC all work, and no devices are left
deferred. The debugfs clk_summary, consumers included, is the same as
with v2, and stays the same when the clock-frequency of the reference
clock node is removed. These results are from v3; v4 only changes the
QCA956x rate calculation, which the C7 doesn't use. The other SoCs are
not tested on hardware. For each SoC the rate calculation was compiled
in userspace together with the old code and fed 2 million random
register sets. The results are identical, except where the old code
overflowed 32 bits with register values that no real setup uses, and on
QCA956x, where v4 fixes the upper fractional part of the PLLs.

Changes in v4:
- Fix the upper fractional part of the QCA956x PLLs, which the old
  code computed as (hfrac >> 13), always 0, and follow the formula in
  the QCA9563 datasheet. NFRAC[17:5] is not zero at reset, so rates now
  differ from the old code on QCA956x (review feedback). This part tested on
  Archer C7 v4.

v3: https://lore.kernel.org/linux-clk/20261111215729.10683-1-rosenp@gmail.com/

Changes in v3:
- Register the reference clock read from the bootstrap pins as the
  provider of the reference clock node instead of with clkdev, so that
  its other consumers, such as the AR933x UART, find it and fw_devlink
  doesn't hold the platform driver back when the device tree has no
  rate. Drop the clk_get_sys() fallbacks (review feedback).
- Wait for the PCIe PLL update to finish after each write in unprepare
  too (review feedback).
- Add the UART1 and PCIe PLL clock IDs in one patch (review feedback).
- Drop ATH79_CLK_END from the binding header instead of growing it, as
  the number of clocks is not ABI, after moving the old clock code off
  it (review feedback).

v2:https://lore.kernel.org/linux-clk/20261110013646.1582970-1-rosenp@gmail.com/

Changes in v2:
- Post the new driver as one patch, instead of moving
  arch/mips/ath79/clock.c to drivers/clk and cleaning it up over six
  patches (review feedback).
- Register only the reference and CPU clocks with CLK_OF_DECLARE, and
  the others from a platform driver (review feedback).
- Describe the SoCs with match data, and read the CPU, DDR and AHB
  selection of AR934x and later with one function.
- Keep mapping the AR934x SRIF block from its fixed address. It lies
  inside the wireless MAC registers, which ath9k claims, so it can't be
  a reg entry of the PLL node.
- Drop the clkdev registrations, which have no users.

Claude Code (Claude Opus 5.5) was used while preparing this series. It
wrote most of the new driver from the old one, together with the
userspace test of the rate calculation. I reviewed and tested every
change and take responsibility for it.


Rosen Penev (7):
  MIPS: ath79: apply the QCA956x timer workaround in setup
  MIPS: ath79: move the bootstrap reference clock to setup
  MIPS: ath79: stop using ATH79_CLK_END
  dt-bindings: clock: ath79: drop ATH79_CLK_END
  dt-bindings: clock: ath79: add the UART1 and PCIe PLL clocks
  clk: add a driver for the Atheros/Qualcomm ath79 PLL controller
  MIPS: ath79: remove the old clock code

 MAINTAINERS                           |   8 +
 arch/mips/ath79/Makefile              |   2 +-
 arch/mips/ath79/clock.c               | 673 ----------------------
 arch/mips/ath79/setup.c               | 107 ++++
 drivers/clk/Kconfig                   |  12 +
 drivers/clk/Makefile                  |   1 +
 drivers/clk/clk-ath79.c               | 782 ++++++++++++++++++++++++++
 include/dt-bindings/clock/ath79-clk.h |   4 +-
 8 files changed, 913 insertions(+), 676 deletions(-)
 delete mode 100644 arch/mips/ath79/clock.c
 create mode 100644 drivers/clk/clk-ath79.c


base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.56.1

