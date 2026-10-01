Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F86A253B42
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 02:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790821471; cv=none; b=HAtHd9MFGnf+Rex93GYwjKLJvmKXDOgsJeUxLy0VezERG/6tpQDJgUC8P6IkN8lw5tO7odpDYtVbWITeg3BPUDl4h2MAvIx1Pc39fY7q4N7bC8Yv/+Ouas/p/BTcDpyuwR7aqKGj6wrT6WsAosAkOGL4kFzIQ68YykC0QJvvDhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790821471; c=relaxed/simple;
	bh=/6YE8tCBr0BJ9oADX1bZOmyuq86t5AUN3+v6O1cc6Lg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jDqUVwFoREojjB6D5bPh08tiWyH8OCCnSNnD7xcpmyvC0OZLWn6zD/DEdwSczj5r9PgOSfB5/wdwBgZhHqZjGUOGjZPKzVUq5T1froWLrU2sSIJV4fwpIDYEYZ0Lhr2C88YzUWkzoI5ThIfRPyjbF8bNW2GVGUIC+X/nsP3PKYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eCqYEG71; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eCqYEG71"
Received: by mail-pj2-f38.google.com with SMTP id 98e67ed59e1d1-3a4e9fbcc60so418692a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790821470; x=1791426270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JBj760CSPEhTHdB5J8bb+wCBarK2SuYvXC2QB16HtCA=;
        b=eCqYEG71HmNBY5WpgwuIx5/Fyuv26RRHZNJuqe68dyVmnFHlZTIUEVzqDzYUqcthvD
         lI1b+M41dpIFMsK1VuCBknPErVl8IlxQOlmbizaPWQGTH1lAZRD8SdBzl8b9mBhaS5la
         euiLRGRDmb8ruyau8/9SJoh49TSIKwchN8UVaMUhqX7/aJboN0lvNlIKGpHbH8CCCoO9
         KLlKx/qH+mmBnnc2bzlMvWGh/k6JpBpnl7uv58y+LS1LWqG1KgUstVPkR7JVIhvPL0lA
         +5TixfSoyKpmsCaUNzwxA+uXCcycGVe/iGYyi1DKKbf7ZXuqERWCy4jRnZnv8ob+S3f9
         aWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790821470; x=1791426270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JBj760CSPEhTHdB5J8bb+wCBarK2SuYvXC2QB16HtCA=;
        b=DyUJRud6HnBSzWLRTPqNMOnZma6HKrK6GgTzl13XCfYZYCAH9owxcNtBxdXEC6kH48
         pFv647vG07wEOiSQaz4SJBXqmeHkm14U/uUC81zbrbnBToD1zZGoZkxNzXSvRhIkjST0
         1Gme7MvoP5RRE5XVHZgk2CWOPbB+sv/Ov62OMxh4Utw5+/YrzhhpFO+AYj7mVG84MgPK
         g8gSYqRBp1XkL4wUpfddLky6sXD3LQJ7ydF66NhqV6oZigd8SnGXF/guhzpYD0OkNxDM
         rcwstETD8EeDYSevjZ5+6rNFtxpWIs9N4D/DSr89BbW0MeKaAcZh2QjekxL8uTkBIAzM
         5DQg==
X-Forwarded-Encrypted: i=1; AKwUvBxqz/W+69AjtiByTJfJ7U/RP8/hG8cJ3UxzvsSvKnY2HdO3GwErjy/RDH/H+d+qkDZlLTMkRlf7MzxKY/s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKraCTup3GZGkDFMz+iiLtPf1wBQoJ/lGbcGVcRaLiv06u/2ipw
	lhsW+ahTW5Qqdjc6UzyjME6QPOAW2BX7vOUmsN67DMiJ4CywfeU2PQC4
X-Gm-Gg: AYBFou0bWjfSg97kVUnN5DkLFVJUd6e+gRs2YFxuKNX/Ge65/Gujcqi/vfNJwnawmV5
	6yXjIPmh8meAnC/f+kIg4IPNwhvYjRRdj7wH4yVLIiMhSQrXaG6KMH9Wa7l+397gwYSDYvsLKZO
	V0rtwRpB6qUfFNypw7w8BDpNNtnYb2I3DfSOdIgzO5CYfy5Lx69Hwbw2Szhpz8evR3vA6NMoxYu
	W+lW2bCIX6FmOooKyneuTRfZlxEcZPm9A9gvMzOGJ6Ow0LSw4R0KRLkNaZf9x5+G4n6q7gsBqgj
	K0jmOxxQ2jP09BXowy4pNY/UQapIr3SS6eDw/rBOb1fg4BgmcrOiI8QWf9eDDHYzQ7eDEBdV+ou
	BaOyudptVtS6QxYMEigsCJxyCac/yJnVaNWpUD58y1aBXvMRf9HptkwymeXxipLZFHGrFQjsYxm
	Qrg5JFkVFKnsNbuSB88Xt2/BKJUK1gXjSv0WEEMI261r0tQeiBWr6lcS5mh9aOrg==
X-Received: by 2002:a17:90b:28c4:b0:3a4:8c41:fab6 with SMTP id 98e67ed59e1d1-3a4d18bde23mr2612397a91.46.1790821469669;
        Wed, 30 Sep 2026 19:24:29 -0700 (PDT)
Received: from archlinux ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f43a12c9sm2153230a91.2.2026.09.30.19.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 19:24:29 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 0/4] arm64: dts: allwinner: add Teclast P85T (A523) support
Date: Thu,  1 Oct 2026 10:24:11 +0800
Message-ID: <20261001022415.913959-1-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds initial support for the Teclast P85T, an 8-inch tablet
based on the Allwinner A523 (sun55i) SoC.

This initial submission enables only what has a binding today.
Display (DE/TCON/DSI), PWM backlight, audio codec, camera (CSI/VIN)
and LRADC keys are deliberately left out, as those blocks is not ready
yet. They will be sent separately.

Patches 1 and 2 overlap with Andre's series
https://lore.kernel.org/linux-sunxi/20260914210115.28151-1-andre.przywara@arm.com/T/#ma8a2554315eccbccdb15ee7ac212a4d0afb45a5c
They are included for compatibility and differ only in the full company
name in the description.

Touchscreen operation requires firmware extracted from the Android
firmware; the file will be added to a public repository later.

The touchscreen values below were obtained experimentally via evtest
and may be inaccurate:
  touchscreen-size-x = <1786>;
  touchscreen-size-y = <1128>;

With the values below the touchscreen and display coordinates match:
  touchscreen-inverted-y;
  touchscreen-swapped-x-y;

The battery values are taken from the battery label
(5000 mAh, 4.4 V max charge) and the Android DTB
(pmu_runtime_chgcur = <0x320>, i.e. 800 mA safe charge current).

U-Boot support requires an LPDDR3 driver for the A523, which will be
sent a bit later.

A ready-to-use image with working display, audio and touchscreen can be
found on the Manjaro forum. Patches will be added as other contributors
add their parts.

Changes since v1 [1]:
  - Added Reviewed-by from Andre Przywara for patch 3;
  - Replaced the dummy 1.8V pio-18 regulator with the real PMIC rails;
  - Dropped reg_dcdc4: no consumers, the kernel would turn it off;
  - Dropped AXP323 aldo1/dldo1: no consumers - the board is verified
    to work with both rails disabled;
  - Renamed bldo2 to "vcc-dram-1v8" (needs to be kept always-on).
  - Renamed cldo1 from "vcc-codec-sd" to "vcc-codec-mmc";
  - Described AXP323 dcdc3 as the RISC-V management core supply, like
    on the other A523 boards;
  - USB: removed the inbound 5V rail from usb0_vbus-supply and dropped
    ehci0/ohci0; the port is works like peripheral-only, using
    usb0_vbus_det-gpios for VBUS sensing;
  - Dropped the iio-hwmon node due to invalid values;
  - Commit message wording: those blocks "don't have a binding yet".

[1] https://lore.kernel.org/linux-sunxi/20260918165414.1129076-1-iuncuim@gmail.com/

Based on 7.3-rc3.

Mikhail Kalashnikov (4):
  dt-bindings: vendor-prefixes: Add vendor prefix for Teclast
  dt-bindings: arm: sunxi: Add Teclast P85T tablet
  arm64: dts: allwinner: sun55i-a523: add I2C0 and I2C1 pin groups
  arm64: dts: allwinner: add Teclast P85T tablet

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../allwinner/sun55i-a523-teclast-p85t.dts    | 386 ++++++++++++++++++
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |  18 +
 5 files changed, 412 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-a523-teclast-p85t.dts

-- 
2.55.0
