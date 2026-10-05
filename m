Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84574E431E
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232079; cv=none; b=mljNWrE/WdQzYCtmoylHWZwa7MuWpYTcc+fa/MbBNUJO7OaWhduvb9gBNBjzkwBbw2nh3IBDDTXb2KeTDacRjHeMsKQ03Rq1xm3fSpxoxpItAR37Cy5LeR3DNxzvjqU5FfvHQkWPDBhl/kw+1f+Bae/Fl1BHz5N/6KaEd6y5crE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232079; c=relaxed/simple;
	bh=vyjTkoj7j9nxAAMFzNtiZqtsGSfD+2Kyb3Sj1miR6HU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eS3HErZUgbY3M+4EhqdHj2OctyD/mVgdCnH5tOshB42Yw30jLdFgptHmKV1mOGFmVIXFCk13nJtqB6SYmFtK5JZ0dWItL7CEpe+XHJ9Fu+6AvKpGfo+ubYZipRHsPUbKCRV9pf8eVofdt7VAon/m0RjeimGXJ455Xy3QyOKrXjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s8YMBJx1; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s8YMBJx1"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29703cb796so327249766b.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232063; x=1791836863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K7axOho0K/uDLrMIbHkmVZuTbDKVS4ybpfgzmkJPTMs=;
        b=s8YMBJx1kPNarW1mg2k70KZMIvzQ/eQGBnOtztxa+ILHMHkdzkVWGkaEU/66Wfab81
         cL4OmK/ycgsjFhoH5BZ23tNQ8RaO7kNCyXESsee+MbbXNc3As1tXnHPNJk/G0I/9I5/2
         HQ71ihhQ10PTXooRoU1i5nfIZV0F/X1t7fh2qOCoXkbD3bWPS6qDCmlXwXja4vsXo9GZ
         v0O0dk5WsyA3T07+joHDv0goimf2i2yG4M6GH7QE2HkfLBGPPh/5dpENFtB5sfiP2uJM
         g/vc4eHgx3KuejktbiO1NgzIA/ltKCCn4EJVJcYtt4NbsGlnK/rMzzsCA9Pj9trgh262
         DSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232063; x=1791836863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K7axOho0K/uDLrMIbHkmVZuTbDKVS4ybpfgzmkJPTMs=;
        b=t2IkyTI7p07YB426smWn119xHFxWrv4ml8syzXoEyyfD8EdyCFsn7XEGih5MM7Nvsq
         r5aolpK33DMEUXweodw9FhZPcCbabGKQyUt6anXoCDEjbS/1DrPPStJOOiJ1qPYuojs1
         8TbbNwu55y7b7W7+1pXJoq4en3s/tdyygxzxEtexuGp2yV68G0PGg/5R/wxwbkG+kN8q
         VQnXYaYSIgSwUHHs3YyPx/PNdlNY97M6H9/mm3JBfszcGXVO3Gp/UV8Mxx3miZWQNujA
         W3nYP1htUZnCJ7AVQ6TlEFhkbBrDm73PD2hoiBcP27TS5LBRuRT0izEbcHODAOFz7x0k
         OseQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2Ut94VklpUTmhig8Qghnk0bWpcNwF4KnWsPhZ7rPjAA3YXYRGCXUO3UJj69ZS7vgeCByk40MP13Ln/WM=@vger.kernel.org
X-Gm-Message-State: AFuF++nyCLgZrRSEaMZ72/GfCE0jS6tTsDM210YxqHSF44tC6HiGazvw
	fQJYFv9MA3+Tbvnad6w8q57M7dAqYH0/NgV4WERdOf/5WssQK93EtHtD
X-Gm-Gg: AYBFou2oVNVyNuRRCxH/X5eH1J0/d1BIRJetZLkiKwM/SaNeyTH6pLetMYc0Rh3VXwI
	rK88e1GMPyJXfLarl/KmmmF2Dx0NXBQVv8En97HfIzwYh/AIG0KvW6Dv/TOtOkJohMvBknkqC+E
	8VyRv/n7HYvd1qmocznB/GhUnsSvkuQYynOBSM1kHyHQnOIK9Al2WoCvXqMHzViIhVDWp5S4nuP
	QoZNUuLaJAjthEsetT1gpmIgZvCWCq6K7cKPFHGfWjfJ1589xKIFWx4aWNWNKk2TqJEwQV4Ormc
	zuVBfz2SyGTi8Wu50rvfuEsWDqrVGWI9wnfoBpQSaiFLZ7uK7J6Gkffvd9fbIsDLcaj73+hze2D
	elgPB67BiUC+ky4sCnNmNt4to/P+5lL/WZ4a9WW7Hd+apLX2SGyD2EwSTvyDVU62cTdzQfYnmJS
	plb4ksD0zIRxTPsmYOIpCV3/WHxQv5O7YJKRSBozfsvk+r/Ba0dr+HSzBUThhate0ldCOROVecy
	dBPdWH38bw38RXm2ZA93ngeace/6aCSGNBvQYoUJM4=
X-Received: by 2002:a17:907:6e94:b0:c29:8d4:7c03 with SMTP id a640c23a62f3a-c2e4af4330amr1014256666b.26.1791232062936;
        Mon, 05 Oct 2026 13:27:42 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm3801024a12.13.2026.10.05.13.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:27:42 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v3 00/11] ARM: sunxi: add Allwinner B288 and the PocketBook Verse
Date: Mon,  5 Oct 2026 21:27:20 +0100
Message-ID: <20261005202731.153971-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner B288 (sun8iw10p1) is a dual Cortex-A7 SoC used in e-book
readers. This series adds the CCU and pin controller drivers, the RTC,
I2C, NMI and watchdog compatibles, the SoC .dtsi, and one board: the
PocketBook Verse (PB629), a 6" reader.

The B288 is closest to the A64: most of its PLLs are bit-identical.
The clock and pin descriptions come from Allwinner's BSP, cross-checked
against ccu-sun50i-a64.c. Tested on a PB629, boots to userspace.

The pin controller relies on "pinctrl: sunxi: dt: number the IRQ banks
from the first one that has IRQs" for correct PIO interrupt mapping.

Changes since v2:
  - Drop the MMC binding patch, applied by Ulf.
  - Rebase onto sunxi/for-next.
  - Constrain the RTC clock outputs and pinctrl interrupts in the
    bindings (Sashiko).
  - Add a B288 watchdog compatible (Andre).
  - DTS: drop the memory node, the arch timer workaround and the
    sunxi.c entry; add disable-wp and the eMMC 1.8V modes; DLDO1 no
    longer always-on; mainline pin function names (Andre).

Changes since v1:
  - Add this cover letter.
  - Drop both new bindings; add the compatibles to the existing
    allwinner,sun4i-a10-{ccu,pinctrl}.yaml instead.
  - Rewrite the pinctrl driver in the DT-provided pinmux style.

Pablo Mazzini (11):
  dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
  clk: sunxi-ng: add Allwinner B288 CCU driver
  dt-bindings: pinctrl: sun4i-a10: add Allwinner B288
  pinctrl: sunxi: add Allwinner B288 pin controller driver
  dt-bindings: rtc: sun6i-a31: add Allwinner B288
  rtc: sun6i: add Allwinner B288 compatible
  dt-bindings: i2c: mv64xxx: add Allwinner B288
  dt-bindings: interrupt-controller: add Allwinner B288 NMI
  dt-bindings: watchdog: sun4i-a10-wdt: add Allwinner B288
  dt-bindings: arm: sunxi: add PocketBook Verse
  ARM: dts: allwinner: add B288 and the PocketBook Verse

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../clock/allwinner,sun4i-a10-ccu.yaml        |   1 +
 .../bindings/i2c/marvell,mv64xxx-i2c.yaml     |   1 +
 .../allwinner,sun7i-a20-sc-nmi.yaml           |   1 +
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  |  22 +
 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml |   3 +
 .../watchdog/allwinner,sun4i-a10-wdt.yaml     |   1 +
 arch/arm/boot/dts/allwinner/Makefile          |   1 +
 .../allwinner/sun8i-b288-pocketbook-verse.dts | 114 ++++
 arch/arm/boot/dts/allwinner/sun8i-b288.dtsi   | 290 ++++++++
 drivers/clk/sunxi-ng/Kconfig                  |   5 +
 drivers/clk/sunxi-ng/Makefile                 |   1 +
 drivers/clk/sunxi-ng/ccu-sun8i-b288.c         | 644 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-b288.h         |  10 +
 drivers/pinctrl/sunxi/Kconfig                 |  10 +
 drivers/pinctrl/sunxi/Makefile                |   1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c    |  49 ++
 drivers/rtc/rtc-sun6i.c                       |   1 +
 include/dt-bindings/clock/sun8i-b288-ccu.h    |  82 +++
 include/dt-bindings/reset/sun8i-b288-ccu.h    |  45 ++
 20 files changed, 1287 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-b288-pocketbook-verse.dts
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-b288.dtsi
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.h
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
 create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h

-- 
2.52.0

