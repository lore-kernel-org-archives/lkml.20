Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C89F3B2FCA
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 18:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792260109; cv=none; b=jqCcyo23/7/PYB5haiOCausc52tYaHhnSX8naDiVWTz9JBdvP93SqE5vAJbPg9IiSnI2f+JEcDvRoEmBrDxQ4UEaza/UEBQkrzhLxsOjFwwJ9NA3qlL1qE/QyLJ5reBG1jXp8v85rkqFshrHEh5y3k404CP+ucK5gdsYZwRSEJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792260109; c=relaxed/simple;
	bh=OC28K9DeVAvdNt2i4HLQhvj/9KpHA1D851pZfGYKe8E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XASdyz1psSqnq/HkR/VkWg9l5cLJ1HrJVJbpFiWIrrwOgDeOwFrjDwp6QV8kIcHSYNJ76+A4wLyltMnKe6nO8Xv2ACQP/lzU9mzkPTR6w7Wo3zJ8qaKFU3o59oroKdb/wGYaiUY7H2jIeDk/FUG3ucOPMtlJox2McRlzs5iEiqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+cWFWCd; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+cWFWCd"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e5378b281aso3596655ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 11:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792260107; x=1792864907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tpd5O0R9+duoKDmKNVdsMKIxn7WvXRY/NssiY4nj4tc=;
        b=A+cWFWCdgw4rdM/pG6koANtVAvZ0B8JEN3xJ4Cdoz2SnR7QhCFGVoKJgalJsq1CQJ9
         mczG4P90fCEKKj8xwxykbNN4L/ILvGabfR1u7q+RRPmOMHzAAe0YP9epGl9XEPpOlrvI
         x5eVe72vgkO2kdsJNS7qqRVF8dcJ8qtBaYPJgtRPvzh5Yoi05bQzbQYPXtKIP2Btm0Do
         K8voe9TzJH+4mWfuEGZSd7VgtsqLHcbwpGg4dYED/X89dGX9/yQU2hKWrGvpbw9HD1YH
         zKg5SJbtHqXbjFuPel52Bws4l8KbzvUAcK/ZOKHAB36MhXw/If1XxAx2/ZlytesGzc3r
         lJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792260107; x=1792864907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tpd5O0R9+duoKDmKNVdsMKIxn7WvXRY/NssiY4nj4tc=;
        b=cUspYKEyxcYr9nGX+MJGHysxXTM66s9uTv6j1EHexg7Ebysm3LUvji9trtWAfZizCy
         6JOZ2MbbDKsrefsXCLFNIxauX1jQaaUFOw5ABcQ1pwlA8o7Rxs0GgcEAddiu/qUb4Yqs
         rb+6pWFtR5Jcxdiw1hXJKnM8xjSJSTAD1gJXdLc2H7kZOc6ZiP7YwhKZritNmsWte1Eq
         g1xfKGt5GRHjqKRAlAiRutpG05Gw3rlfUJxzHDOckH3JMwcJVYUHfdpU2NpfUvCB+4ie
         VkvVEt4skg4odH0yAaqoAxtaSjlGqebrSrFBZX+51hQU13HTa6HkXIaoTvDdeubxMltY
         PwEg==
X-Forwarded-Encrypted: i=1; AKwUvByUBhLGxOUJxWXRgC+d6ecZ5GC7Ze2dj5tnN+IFm03ju+V2bPiBZLaNbsAV93mfLnO1x/0XtUctyDeSQX4=@vger.kernel.org
X-Gm-Message-State: AFq9FYINEkOzzDRlWUzC2UIlCaMRiHELju9xMW2jmU+IrJGr2bqNlnMi
	HmA1K7JYN01pVsR7vjczNyQ+Y7Mi0wj2hm7PX1aWQs68H3kBDDzuTdVl
X-Gm-Gg: AYBFou00VH3GMbND4e6md7X/ya+YOLbzjmpc9zmzCet39WEIg2Xqpavkr+4bYb1fxYT
	Ix5PRlJK6M9UUFV76+pLenIRCubD3x0eRwZII2Mjn8+pYgUFohqZWrqftrDiWk+lENV4Gx0M9lO
	yRsiFgYvGlvTFAu9n8HGYCKxonl4jW2947KXIS3JZVq8Hn5DoU5P7cQlTIwN9VFCAYwqRU0cDKt
	OG9xGOxd3wVT9TOsWRTY5CewLYPHPdGTnFw+aNiYgDLgGBYPT2D1AbOjW+yW0CBdjRy0svCYHc+
	X+KdZDxMSrniAIv5Zzct4xGKVNCHpg82Et6xcER+chj6bVs2JbbylZzvzaf3VFoO9LNYsiKkVFI
	+ywsfg5U4la16RJGRS9AR0Tw4aG86mZFeo56DV/If861O62lWMH8PiHRX/EsJnbmAyKPKbF6nDf
	TvVfbbJz/mBgl/rEs6EREB6wEhVFDGAe7VVhzzMAAL/gIpqHjxX63e/LjJn2NtUkpRO0JhlMlql
	5hnxycX/XuiXEu3LIrSmH3D8UkUUxtBfpbuPQzTlngYznylMjMplNum/dVZ10KtnDlUhOIMj46t
	3ceWNgWvtYp2GOWttd0EmDlEGjSKf0cgKymgU1zMMIlT+PWBIzrksQ==
X-Received: by 2002:a17:903:a90:b0:2e9:40ef:e44a with SMTP id d9443c01a7336-2e9a6833906mr30171515ad.3.1792260106924;
        Sat, 17 Oct 2026 11:01:46 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e5d98d9sm23030035ad.2.2026.10.17.11.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 11:01:46 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] riscv: dts: spacemit: mark K1 boot nodes bootph-pre-ram
Date: Sun, 18 Oct 2026 02:01:39 +0800
Message-ID: <20261017180141.3477743-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A bootloader SPL on the SpacemiT K1 runs from SRAM and needs a handful
of nodes before DRAM is up: the root clocks and clock controllers, the
console UART, the boot media (SD, eMMC, QSPI NOR), the board EEPROM
used to identify the board, and the PMIC rails it programs before DRAM
training. Today mainline U-Boot carries the bootph-pre-ram tags for
these in per-board -u-boot.dtsi files.

When I sent a U-Boot patch adding another such file for the Milk-V
Jupiter, E Shattow asked for the tags to go upstream first, so every
K1 board gets them and the U-Boot overlays can shrink [1]. Earlier
there was no working mainline SPL for K1 to justify them; there is now.

Patch 1 tags the SoC nodes in k1.dtsi, including i2c8, which every K1
board uses for the PMIC. Patch 2 tags the board-specific EEPROM and its
bus, the PMIC rails and the SPI NOR on the boards that have them. The
set of nodes matches what the mainline U-Boot SPL tags for the BPI-F3
and MusePi Pro. Pin control and regulator supplies are left untagged:
the K1 SPL does not enable SPL_PINCTRL, and neither the P1 PMIC driver
nor the SPI NOR and EEPROM drivers look up supplies there.

Testing: all K1 DTBs build, and dtbs_check is clean for them with and
without this series. I have not run an SPL built from these trees on
hardware. On a Milk-V Jupiter running Linux I checked that the EEPROM,
PMIC and SPI NOR answer at the addresses described.

Changes in v2:
- Tag i2c8 in k1.dtsi instead of in every board file (Yixun)
- Rebase onto the spacemit dt-for-next branch, where buck1 now carries
  the buck1_0v9 label on musepi-pro and the OrangePi boards
- Link to v1: https://lore.kernel.org/all/20261012235624.77993-1-alan.tseng.cs@gmail.com/

[1] https://lore.kernel.org/u-boot/5d323a11-da4e-4071-bdeb-ab5c03e8f85e@freeshell.de/

Hung-Chun Tseng (2):
  riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
  riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram

 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  |  4 ++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  |  5 +++++
 arch/riscv/boot/dts/spacemit/k1.dtsi              | 13 +++++++++++++
 7 files changed, 48 insertions(+)


base-commit: d05c6236496071916e19012cda7149465f15e66e
-- 
2.43.0

