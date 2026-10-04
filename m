Received: from mail-wr2-f41.google.com (mail-wr2-f41.google.com [74.125.225.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0B13C2BAF
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791130323; cv=none; b=AMaxKcgeXTRGqNgeNyrt10Hw/wX92DXhx/MBfOIdlwWvlabt1hA7/hVTEuopqiM56thBluzq2UpL45WsClNDeN1Qd746l2vXfZZuqNNLjaw/GkgZRCY+jOSK9UvUySZG/zh7dTumsNx+RLIVoR4OSjcc94OkAclIVT7/TztvCQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791130323; c=relaxed/simple;
	bh=NOyWwXPnoxMjXglshU0WsvSqrqmGNX3DT0uCqhPD8qI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q7ENNwJrQJJFlh3dBAup+O8hRYd9M9QyHI869T1yMyVyy5zF6FMS7hTmIheVhytZ4OWiqrb8zNsY0xsPBYzOvz7zedVqPupfjRXq4VtpiQJIhbeqstJDI77fF9popdJX7m0uzMGSCaOURN7qv8nc1sbcxAPtUdxr0/yElSmdHyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qj/m8DkL; arc=none smtp.client-ip=74.125.225.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qj/m8DkL"
Received: by mail-wr2-f41.google.com with SMTP id ffacd0b85a97d-4834977ae75so446995f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 09:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791130317; x=1791735117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SFJPZ85mXAU4ZGN5RqoO6kBnTnwcMDemIX6Rzrz1AgI=;
        b=Qj/m8DkLp3um80hT5jC9gEdUpcNYLblZmOd82Q8jEWMo7DYY6U7ZMdWiOAeciyeDBD
         XqfEEUkQBuRWuq8/W+zCpM85bbdtKgJ3B4FqajM0AfUuVrdyc6KbKXNGBI1f7Ppn3Z3V
         PVeIiJZx6amym26bRJrGBR6Xm1oeCex6HO597NoKBoNZXikF6CL1Fuee3boMZd7IgSMM
         z9BlIYm5I1MmSQa8FdAUPSS2GfzH8WAwvUoWJuGDU58YsgNF5p256LU2i48JgVSQ+LxS
         4Gj56pSte1WPZPCnzqYAH+sOWP4AGbwxpmr513a0qrNI4KcYBkAHMh0kqd/4K0ZMLYR6
         f8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791130317; x=1791735117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SFJPZ85mXAU4ZGN5RqoO6kBnTnwcMDemIX6Rzrz1AgI=;
        b=MHxmN/UhqPXdLN0Y/j1qJZXFTZI0xDSr1LZWuyJV7znQKiV+MsOXCGSPBtqwGK3K0A
         ZCqz+eqMSITiDyUkwQr/JQOPJP3My0wl8MwpNyG8zNjPNtd/vcuo5cQOPGOuRf1ZEO55
         VXpJyuBq5GiXPccGeoRtUP+0RUkqjdfl1yP53SmaT3FuQ+0K3pysjcThr/HOUd8V/cDa
         p2FVBXgKLB5343DU+vwEx2YFpBEg1688ussfzxSAfmBYcnUBf2zRU/ulyg3z95uP6yTM
         +sbrEbl/V578hLQ3z6jsyRJ99p+wryNEvs/SbfJbn0UfKzlEIPG9i49DfnnOTPShs/gO
         hJ/Q==
X-Forwarded-Encrypted: i=1; AKwUvByCudpDP09aNZyDPPNbVvef0S1/l3c4o2gujPBoWEqpUQsmb9F9aUTO++1XmnXI4xxoGA5XbEvXY1ObwPY=@vger.kernel.org
X-Gm-Message-State: AFuF++kAwhiPkme5W/SpJOv52JQouh/xUxGQXxcxJdGBoEoyK23YLtfN
	bfouM61lvTf1SdyScHwAiCmXUYUtko15zd6u2sKRR92G3D/tgpr4Z0L9
X-Gm-Gg: AYBFou1FjdZF/JJF3dxr4rLtiwlHCdPp5RC3Y80WCyKBUJU9VbEI3+a91UF8bi1SunG
	RW1ajMHitrRgrR/tbjbbEWJcE3dyBKAVnOxOUCms/2QIGDl7eRkrW1W7ep4oh4UdZGYO1CI7ucD
	v6rfTOpzIl5bq5cMs4HQjmOKApRQYkf1qd1lgq1sWEXRDwx7314dffUSUum/1njkr3OF4PLzVS6
	4lJ7nuK4OC2pcakkcoBY3iXIm3t6lqvd0WOdzQGNro6wVMt68vWI7ofII6OElukf+n6X2Z03fDU
	pcHT5maI0QA3PStShf+KUkYEsjn9g2IiWmzHkt/eYNsqkaVMiin5bFADBhyFZratMqmUr9NKUjT
	va1DYNJeRERnn1I2zFJOKTCYticOHxIqLs1MUR+HoJPr7cTnNXr4SOI8JhpY5Foztzy6chtTAsH
	6QIdS1uNrV4ju8eGB+8MOCkZleVtKcJpGWQXTpw/mRgbvkjG9YPmSjD/N+uDFQUgBsvT/XymVpg
	2LR9pzG0EJTPvNIGWC1/KGW2Q==
X-Received: by 2002:a05:600c:6098:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4a0274e9d3dmr140205015e9.1.1791130316569;
        Sun, 04 Oct 2026 09:11:56 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027725c6asm308438195e9.8.2026.10.04.09.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:11:56 -0700 (PDT)
From: IS20 Tomer Maimon <tmaimon77@gmail.com>
X-Google-Original-From: IS20 Tomer Maimon <tomer.maimon+nuvoton@nuvoton.com>
To: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v10 0/6] arm64: dts: nuvoton: add NPCM845 SoC and EVB support
Date: Sun,  4 Oct 2026 19:11:45 +0300
Message-Id: <20261004161151.803563-1-tomer.maimon+nuvoton@nuvoton.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomer Maimon <tmaimon77@gmail.com>

This series fixes the remaining timer binding issue and adds device tree
support for peripherals on the Nuvoton NPCM845 SoC and its Evaluation
Board (EVB).

The first patch drops the undocumented timer0 clock-names property.
The second patch splits the two APB address windows into separate bus
nodes before any peripheral nodes are added.
The third patch reorders timer0 and PECI so the APB child nodes stay in
ascending unit-address order.
The fourth patch introduces peripheral nodes for Ethernet, MMC, SPI,
USB, RNG, ADC, PWM-FAN, I2C, and OP-TEE firmware in the NPCM845 SoC
device tree.
The fifth patch cleans up the pre-existing NPCM845 EVB DTS property
ordering to match strict dt-check-style expectations.
The sixth patch enables the NPCM845-EVB peripherals, adding MDIO nodes,
reserved memory, aliases, and board-specific configurations such as PHY
modes and SPI flash partitions.

The NPCM8XX device tree was tested on the NPCM845 evaluation board.

Changes since version 9:
        - Split the F0000000 and FFF00000 APB address windows in a
          separate patch before adding any peripheral nodes.
        - Add peripheral nodes directly under their final APB bus.
        - Renumber the timer/PECI ordering and peripheral patches.
        - Renumber the EVB coding-style and peripheral patches.

Changes since version 8:
        - Split the EVB changes into a DTS coding-style cleanup patch
          for the pre-existing board file and a separate peripheral
          enablement patch.
        - Fix strict dt-check-style issues in the EVB DTS by reordering
          properties and nodes, normalizing blank lines and continuation
          alignment, and lowercasing hex literals.
        - Drop the unused tip_reserved label.
        - Keep patches 1-3 unchanged.
        - The remaining refclk unused-label report is a false positive
          because the label is referenced from the included common DTSI.

Changes since version 7:
        - Move timer0 to keep APB child nodes in unit-address order.
        - Add PSPI to the commit message.

Changes since version 6:
        - Remove IPMI I2C device.
        - Add FIX enable property.
        - Keep patches 1-3 unchanged.

Changes since version 5:
        - Add no-map to the tip_reserved firmware memory region.
        - Drop the unsupported snps,eee-force-disable property from
          gmac1.
        - Rework the FIU0 boot flash layout into nested fixed-partitions
          under the bmc container.
        - Keep patches 1-3 unchanged.

Changes since version 4:
        - Split the timer0 clock-names cleanup into a separate first
          patch.
        - Remove nuvoton,sysgcr from udc8 and udc9.
        - Rename apb: bus@f0000000 back to apb.
        - Rename spix-mode to nuvoton,spix-mode.
        - Keep cooling-levels as 32-bit cells while encoding fan-tach-ch
          as /bits/ 8.

Changes since version 3:
        - Remove tmp100.

Changes since version 2:
        - Fix DTS warning.
        - Arrange node order by ascending unit address.

Changes since version 1:
        - Fix commit message.
        - Fix dtbs_check warnings.

Tomer Maimon (6):
  arm64: dts: nuvoton: npcm845: Drop redundant timer clock-names
  arm64: dts: nuvoton: npcm845: Split APB address ranges
  arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes
  arm64: dts: nuvoton: npcm845: Add peripheral nodes
  arm64: dts: nuvoton: npcm845-evb: Fix DTS coding style
  arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes

 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 731 +++++++++++++++++-
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 441 ++++++++++-
 .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     |   6 +
 3 files changed, 1155 insertions(+), 23 deletions(-)

-- 
2.34.1
