Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8B03A9013
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791629946; cv=none; b=jihzRe7UOysj1cyjvK7rld5u1PCVLQTFgxUn9BOU83xXjdFvPhTyuQXL7MQdCA2BJba3JBDJYeX/6YwpUXJiMNJbXpu+DI1++nfPC0YXqTFvaEU08FMbZtGxSOefAL1xdElyIxi2Iza/qwn8K4vwTzjgmPIuYZx4zdaElZrAyL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791629946; c=relaxed/simple;
	bh=KDkDNZeuXKLvk0NwN7/bRIUJZ1PVg28gENlWR0G1ero=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N92Loc8KcPfHaQNUoblKSWzvlUv1O4/9IrOrKz4bUXt8v6Gf6Ko9UPJIn3TUM+3ocM2XWZ6p/6RXZBUKGYg60XQhYT2yVTIL/I+mYfqTc2i5OhmRfgAaAN+Gq+SF8U6iRzfaI0ewrJ1bM5qu3kYMvzf1W/xpPV7ii2CC6dpoCHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso463625f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629943; x=1792234743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4/Tw8zZUSYGRUw5ihGSIUwYOzEBFsG+6HaKAhA2ORMw=;
        b=cew3USm4pvoVOa9e5SgFh6lrscMXMO2P6lOcl7ePUoPviexjbDcgl3PkXb0jctgS1u
         tF66vAetPdhkSzJa4f64Q8Rd3eNpicAishotmpUpQFH9v5rnfuZPAcqQe4jYEOxUmWzF
         yvj+fV7xrHVj9SaGwoLfPUSRRo0ENeOEPKk5OiBJF1pM/9HYqC/bHcMgtHWyF9/m1ehn
         nQ2sn9FijScA3LSKaC9RbFZLQ/fRPLjSZlbV3DmvRiRLmPMScFu9sCeSYQsFs1rytLp3
         gZ17I8u+lTzsOq+ig5A0m24I73CQtnXh0BSJT6LlSqMFRcEbkNOn1imUAFoK9cEPiR3h
         20vg==
X-Forwarded-Encrypted: i=1; AKwUvByu2yeewcIoXMohyugLxI/l8oU2/gY6EcBmzmP0o33AzYRBqe6Rt3AhvJFpM4pe327+e1vGBakERXJT7oY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiMHi9uQgLwhKWAHQGm1+LquVUnQ4Gd9tNkx4jnFU6GvpaEFF9
	BZ91l8VIP67QuXctqIAqD1Y8gNH4CVnLE1S4wBc5EMVUOn6o31TR09QI
X-Gm-Gg: AYBFou0egaeoa0cQxAeXMyEVoU4S3rWyqwkbnpOAvq/LFXG7ui2YDbRCNAqEukgwK9E
	IKqJrw2z4UxYP0IDtctlRK6dVtN11thiLvYfs4AQoKXdU/RVqCk48XQdcCCUY6InjPqxlLS7GRB
	A+MEH76W5lo5KlBSyD4Bzc9Eji928yFB1O/3+WHZJM6WMDKhG/m/M+u22Ctfeq8NCh2F9pssS+Y
	Xp7kJ1UVuRs4UWFrSoFJYTVlg5HpA6Hy6EYYsfX2uPidQvJ/O1eRAzdH3wQrDDFSbt/lAswDYXq
	GKyT06oi4Rtz2nxBcCz2tnDLDI+TQ/7EwisdnIsCo/PTCVBqsAr3GU2Bjpq9C85xrSsjwUf+iXF
	F4FUJoByv+fX/JAgw6s141E+oIuViuBldDyBDi+YwRzKayIul5eMni0nUHsY343hSUrraPRclUo
	xB7copPchSS5svfq2rPH3pwCkREbwGRXzl70AcoVWeIY5AV/yKs6OasCgr5hvzK+3RvZrLQGxxH
	AGrEgI86GFcA5ln+YxT6vdHckao8vhmcig=
X-Received: by 2002:a5d:6547:0:b0:48a:fd58:a7df with SMTP id ffacd0b85a97d-48dbace0061mr6574489f8f.47.1791629942561;
        Sat, 10 Oct 2026 03:59:02 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae17e9sm8709526f8f.57.2026.10.10.03.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:59:01 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/8] Add ethernet support for the Amlogic T7
Date: Sat, 10 Oct 2026 11:58:52 +0100
Message-ID: <20261010105900.247342-1-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The T7 pairs a Synopsys gigabit MAC with the same glue registers the
G12A has, but nothing described it. This adds the binding, the driver
support and the device tree nodes, and enables the port on the Khadas
VIM4.

Two clocks set the T7 apart from the G12A. The controller reaches DRAM
through a pipeline stage with a gate of its own, sys_ampipe_eth;
nothing else claims it, so clk_disable_unused switches it off and
transfers stop. The glue registers sit in a block gated by sys_ethphy,
so far owned only by the MDIO multiplexer, which probes after the
controller has programmed them. Every write to PRG_ETH0/1 was lost and
the port ran on the bootloader's values; v2 passed my tests only
because a debug knob rewrote the register later. The T7 node now owns
that clock as "pclk", which the stmmac core enables before any glue
code runs.

The RGMII delays stay as in v2: phy-mode describes the board, so the
VIM4 is rgmii-id, and the controller adds the transmit delay because
the RTL8211F transmit delay does not work on this board. A sweep of the
controller's receive delay against the CRC counter puts the PHY receive
delay where it should be, about 2.2ns, while the transmit side never
gave a clean link. As Andrew asked, this logic now lives in a T7-only
path, so no other board changes behaviour.

Patch 8 is generic: a table in the informative section of
ethernet-controller.yaml showing who adds each delay for every phy-mode
and property combination. It is independent of the rest and can be
taken separately.

Tested on next-20261002 with "clk: meson: t7: keep the memory fabric
clocks running" (clk-meson-next) on top: 933/935Mbit/s with iperf3,
5s each way, no CRC error in 432k frames, nothing written by hand.

Overlaps with Xianwei Zhao's "[PATCH v2 0/3] t7: add some nodes for
Amlogc t7.", which defines amlogic,t7-dwmac with the axg fallback and
three clocks. I will drop or rebase whatever overlaps once we agree.

Changes since v2:
 - the controller-side delays are applied on a T7-only path instead of
   changing every Amlogic board (Andrew); the PHY mode left over comes
   from phy_fix_phy_mode_for_mac_delays() (Maxime)
 - tx-internal-delay-ps is checked against the four values the hardware
   has, in the binding and in the driver, instead of being truncated
   (Sashiko)
 - amlogic,tx-delay-ns and amlogic,rx-delay-ns are not valid for the T7
   (Neil, Andrew)
 - the on-chip PHY no longer carries max-speed, phylib reads what the
   chip reports (Andrew); same for the RTL8211F on the VIM4
 - the PHY interrupt line, GPIOH_6, is described on the VIM4 (Sashiko)
 - new: the T7 node owns sys_ethphy as "pclk", see above
 - new patch 8: the delay ownership table in ethernet-controller.yaml
 - no longer RFC
 - Conor's Acked-by dropped from patch 2 and Neil's Reviewed-by from
   patch 6, as both patches changed. Patches 1, 3 and 5 only moved in
   the series, so their tags stay.

Changes since v1:
 - new patch 1: honour tx-internal-delay-ps and rx-internal-delay-ps in
   the rgmii-*id modes, and pass the PHY whatever delay is left over
 - vim4: phy-mode rgmii -> rgmii-id, and amlogic,tx-delay-ns plus
   rx-internal-delay-ps replaced by tx-internal-delay-ps = <2000>.
   Neil's Reviewed-by dropped from this one, the change is not cosmetic

Lucas Tanure (8):
  dt-bindings: net: amlogic,meson-dwmac: list the compatible
    combinations
  dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
  net: stmmac: dwmac-meson8b: add support for the Amlogic T7
  net: stmmac: dwmac-meson8b: apply the RGMII delays the T7 way
  arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
  arm64: dts: amlogic: t7: add the ethernet controller
  arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
  dt-bindings: net: ethernet-controller: tabulate who adds the RGMII
    delays

 .../bindings/net/amlogic,meson-dwmac.yaml     |  86 ++++++++++---
 .../bindings/net/ethernet-controller.yaml     |  18 +++
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts |  20 +++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   |  88 +++++++++++++
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 120 ++++++++++++++----
 5 files changed, 291 insertions(+), 41 deletions(-)

-- 
2.56.0

