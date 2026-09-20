Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6623C584F
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789923727; cv=none; b=d4IQdG+EIHQz/uVdeG2wny0pAxRvIfUsAvv2a4I9VQk3UerALPAyCwJ0QBmNWu4a6PIDwDHN0s9ZSMsthzMnO8vVaks1LD8FlwM3cT9Y9nanUyzy0d0ZMdYYCjZsSeKpeFzuGAKabwwCvf3x07EfMqJFr6iaB86/AynApQqlq0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789923727; c=relaxed/simple;
	bh=Hwepoi05XJzQFBKNDY51EwqDHlxM4/AUrIMff0K76dA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fo/kXtipLa5zgbafXGPBKlVUhZG4hYTw78Pk7vKXFwOgYhn15PuenG9Y0twMGcXrnwtI0vAjIctKlxbarWSmGAk6RjiHTz5PDQpKlHa6u2zOYnrqKuNd2dLQD939CK76Cq1c+DFmPqobGkBLZQh1L12CBBATzhUrrSf7FzHSSko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OWAVyjHX; arc=none smtp.client-ip=74.125.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OWAVyjHX"
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cc4f2a5c3c8so1643735a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 10:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789923725; x=1790528525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zvaA1R/5NGHCUWO468vfak0l7lZ8RN7fNc21wJSy80Q=;
        b=OWAVyjHXPPoY3UHl3BAQlrx7WdEgqOWxnEH5aZY182QRubRSHsON9WUSC+xQ3SIS9F
         qWub6wqGXXNDD8slRWmhSbRek2l3T3dhhMhBiVMOSq9iXijw0gzdBMyIPLJuq8I7+bN6
         uAZHHlo+DY5BhfHS8UoHEzb/t2k00GKxL1gGwnRlbGSSz1JiMJzGq0/KTMwYtzuDaMjJ
         9fNaMcMg8V908V3Jt/ySgtmpt+Y/sq6ClsyhAAIdnKU7eHClBCyNoazePXF67C46hqDo
         Ko5OYP8xYWVpbDFvy44d2sJcqvq4O6aeQmTY7iaNtq3QVRACw2WdcWHCljBpJHmQ/U8I
         LMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789923725; x=1790528525;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zvaA1R/5NGHCUWO468vfak0l7lZ8RN7fNc21wJSy80Q=;
        b=cgcCicCsAnjoXD/JxnXZmrtF3br+xy2Qj6MzryAgEODvDr7mj962/bt38mmRoSO/jE
         70rhJTuDRd4NpiFvvNlX+XrnEKGHPHs3XzVuR214ZR3eBjByE/kSLLJthYnqBchglzmA
         DTu3kCCdnN4nCS55yRbv0uSDgQPdzbHN4qiysCuTEiU10jwyEzYEqzaJ/Hs8nGtQaEWW
         aMSbW09cX5ubU5HO/Bo8YZkD2rWqKdi3ljqyLD9pHEAVgvh5FIp5NOul/+HYbu+k0dQA
         HqufTp9ypdIgBkT1ymXH/JflnHDHT97lHYMHAlLFnbP2fRS6xLxcrXGzLtnghAMFoRU+
         cLUA==
X-Forwarded-Encrypted: i=1; AKwUvBxVx2hudd/Gk3eC6vGy5gylpZtxQ5fv7KHt+MzFDqu2XvHltoE2eU2amHTn1okEH28AbnECOJAqYNwmbc0=@vger.kernel.org
X-Gm-Message-State: AFuF++nDJrujVT3jRuwdYmF7oFAn+Hu9kp5gW705kIdibBHHUaECl7bz
	4IxR3djKFiq20sGffUuRM+JI7LnsXKZFDqTN/uHcKsSD86rgHuGmOYml
X-Gm-Gg: AYBFou2ujHkNUFfsU53ro+YcMc4TfcEQfJ6vCDxuGY5KdmEbR+P5F0xn6/qhhR117Pe
	DlXGe2rLcu7JT0WwyhJSwyx3H03it+QPLEQYjh078ryilI8Pwccu7szwTwqTD6ZZuqiqlMI+k8z
	pprUmCUuXlDkyw8/Jj/INjLW6CtYKGrVgMCOlE+VBbEcDrIkyfFTu8Ltb1H0T6BwAGWD9w5KMtF
	//87mvVMWmOzJZ8gNfHa+9yrDqC9rPFx6li5oPB3tA8j2rUCaJq8PVhUrwna7ao+zHLK/gRcG4O
	WiCCLEix5v2GkYpl3s/vuo6izmWdyo/vKtUXczxcPPZ/Oi5X/h0m0lYoYZD2Sow6ErqICvGizCi
	In9+kwLZK3SP/pjeAyRWng0Cr8xkZE9HBziHH0xdk8OrOJSlCJZnPI4NJwKLcdV0zj09lox0U4r
	jje/+yzLB4wN6+rmh4AGUWFn9pJsZSgnI54V/tvMsL4AmZ/hnCCHdSigL616ua4c6ACul7WQ==
X-Received: by 2002:a05:6a00:3a18:b0:871:41fa:d1c9 with SMTP id d2e1a72fcca58-874ddffca64mr11441916b3a.25.1789923725129;
        Sun, 20 Sep 2026 10:02:05 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a9d07425sm2140646b3a.42.2026.09.20.10.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 10:02:03 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v9 00/11] net: pcs: add basic support for RK3568 XPCS
Date: Mon, 21 Sep 2026 01:01:04 +0800
Message-ID: <20260920170116.3624104-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds proper SGMII support for the Rockchip RK3568 SoC
using the integrated Synopsys DesignWare XPCS, along with necessary
fixes and refactoring in the stmmac core and XPCS driver.

Motivation
==========
The RK3568 integrates a DW XPCS accessed via APB3 and connected to
a Naneng Combo SerDes PHY.  Several boards (e.g., Ariaboard
Photonicat) use this interface for Gigabit Ethernet.  However, the
current upstream stmmac driver does not support this configuration,
and the XPCS driver has issues in SGMII poll mode that cause the
link to be reported incorrectly.

This series addresses these issues by:
- Refactoring stmmac PCS lifetime management to allow platform drivers
  full control over PCS creation/destruction
- Fixing the XPCS driver's SGMII link recovery
- Adding a Rockchip XPCS platform glue driver and wiring it up in
  dwmac-rk

Series overview
===============

Generic:
  Patch 1: move XPCS lifetime management to platform drivers

PHY:
  Patch 2: DT binding for Naneng Combo PHY SGMII MAC selection
  Patch 3: implement the PHY SGMII MAC selection in driver

RK3568 XPCS/SGMII:
  Patch 4: DT binding for Rockchip RK3568 XPCS
  Patch 5: add XPCS and fixed-clock nodes to rk3568.dtsi
  Patch 6: add ANRESTART support for SGMII link recovery
  Patch 7: implement the Rockchip XPCS platform glue driver
  Patch 8: DT binding for Rockchip DWMAC PCS
  Patch 9: wire up SGMII support in dwmac-rk
  Patch 11: update MAINTAINERS

Board enablement:
  Patch 10: enable SGMII LAN port on Photonicat board

Changelog
=========

Changes since v8:

Patch 7 (net: pcs: xpcs: add Rockchip RK3568 platform glue driver)
- Replace the device_lock()/device_is_bound() check in xpcs_rk_create()
  with a check on link->supplier->links.status. device_is_bound() only
  tests whether the supplier's driver pointer is set, and that pointer
  is cleared at the very end of the unbind path, after devres has
  already freed the drvdata. Checking the device link's supplier state
  instead tells us whether the link actually pins the supplier: if the
  supplier was DL_DEV_DRIVER_BOUND when the link was created, the link
  is in DL_STATE_CONSUMER_PROBE and unbind waits for this probe; any
  other state means the supplier is not usable and we defer.
- Drop the device_lock()/device_unlock() pair, which is no longer
  needed since the link state itself carries the protection.
- Update the comment above device_link_add() to describe the new
  reasoning.

Key design decisions
====================
- The stmmac core now delegates XPCS creation entirely to platform
  drivers via pcs_init/pcs_exit.  This is necessary because the
  generic XPCS creation logic would override any XPCS set up by the
  platform driver.

- The Rockchip XPCS driver creates a virtual MDIO bus over the APB3
  registers and implements address remapping.  The generic XPCS core
  handles all PCS configuration via phylink_pcs_ops.

- On RK3568 in SGMII mode, the MAC clock is fixed at 125 MHz and
  cannot be dynamically changed.  In-band mode is used, and the
  generic stmmac set_clk_tx_rate callback is disabled to prevent
  incorrect clock updates that would break RX.

- The SerDes and power domain are attached to the XPCS device tree
  node rather than the MAC node. This reflects the actual hardware
  topology and simplifies the dwmac-rk driver by keeping all PCS-related
  resources self-contained. It also prepares for possible future QSGMII
  support, where a single SerDes serves multiple MACs and would be
  more naturally managed under the XPCS node.

Testing
=======
Board: Ariaboard Photonicat (RK3568)
OS: Armbian (trixie)
Kernel: 6.18 (backports)
Result: The SGMII interface obtains an IP address, SSH works, and
        ping traffic passes without loss.

Notes
=====
- When testing out-band mode with set_clk_tx_rate, only 1000Mbps
  works on both TX/RX; 10/100Mbps only works on TX side.

Dependencies
============
None. All patches apply cleanly on top of torvalds master tree (v7.3).

Acknowledgments
===============
This work was inspired by and builds upon the excellent work of others:
- Serge Semin's Synopsys DesignWare XPCS platform driver (pcs-xpcs-plat.c)
- Clément Léger's Renesas MIIC driver (pcs-rzn1-miic.c)
- The Rockchip TRM and downstream OEM drivers

Thanks in advance,
Coia Prant
---
Coia Prant (11):
  net: stmmac: move XPCS lifetime management to platform drivers
  dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel
    property
  phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
  dt-bindings: net: pcs: add rockchip,rk3568-xpcs support
  arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
  net: pcs: xpcs: add ANRESTART support for SGMII link recovery
  net: pcs: xpcs: add Rockchip RK3568 platform glue driver
  dt-bindings: net: rockchip-dwmac: document pcs-handle
  net: stmmac: dwmac-rk: add SGMII support for RK3568
  arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port
  MAINTAINERS: add entry for Rockchip XPCS driver

 .../net/pcs/rockchip,rk3568-xpcs.yaml         | 110 ++++
 .../bindings/net/rockchip-dwmac.yaml          |  18 +
 .../phy/phy-rockchip-naneng-combphy.yaml      |  13 +
 MAINTAINERS                                   |   9 +
 .../boot/dts/rockchip/rk3568-photonicat.dts   |  74 ++-
 arch/arm64/boot/dts/rockchip/rk3568.dtsi      |  45 ++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |   1 +
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c |  44 +-
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      |   7 +-
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 130 +++-
 .../net/ethernet/stmicro/stmmac/dwmac-rzn1.c  |   7 +-
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |   7 +-
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c |  39 +-
 drivers/net/pcs/Kconfig                       |  25 +
 drivers/net/pcs/Makefile                      |   5 +-
 drivers/net/pcs/pcs-xpcs-rk.c                 | 599 ++++++++++++++++++
 drivers/net/pcs/pcs-xpcs.c                    |  35 +-
 .../rockchip/phy-rockchip-naneng-combphy.c    |   8 +
 include/linux/pcs/pcs-xpcs-rk.h               |  11 +
 19 files changed, 1115 insertions(+), 72 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
 create mode 100644 drivers/net/pcs/pcs-xpcs-rk.c
 create mode 100644 include/linux/pcs/pcs-xpcs-rk.h

-- 
2.47.3

