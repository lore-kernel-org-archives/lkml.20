Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13662494D8;
	Mon, 21 Sep 2026 00:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789950403; cv=none; b=exFsPF3V99S+o9brcDDA+oFPrUWNDLAl9zrkdoZm3T0NNv8DomriuBL7oo2xj4Nqec5lDeoUbCfUeA7PJDfj4bdGjJ4cXh3E42+7qX9b2501AtzcGHIE060OvFMqO0377Q30TRuOhAwi6OI2xvp/F+7nuhWZNx1Cbwh+GzCEAqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789950403; c=relaxed/simple;
	bh=dNUT0kDT3b3XLAmEsoO2sAzFA0JRGU+rhWu+Hm0JxlI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OxlkN5Sr1cZQ6Go0te7vZNdRXdQLSa/WB+65SDqWAWj4nfRs4y9jdCC9HUX2GHOzBtc8UEHEk7VjirpVe1xJ5DY/WkNXm2SWgJoXGwXYjHpbD2O8nIAr6yNJrffffUalM2bQVDtRQKMGsTVGDZsM59cA7jpv6u5RWtd5UrRonQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BsFjUt4r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BsFjUt4r"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65756C2BCB3;
	Mon, 21 Sep 2026 00:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789950402;
	bh=dNUT0kDT3b3XLAmEsoO2sAzFA0JRGU+rhWu+Hm0JxlI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=BsFjUt4rJiAAjBOfoJWNq1Xz33RmTpRwneWpqr+R5mX426Lb0bTC3wE0hEdVroAGX
	 vr07BxeW9tQJbzDSN/XPWh5EzwZUL8ANB/1uVxTZQ7oSXTJHtYQQijZx4kfx4dJuTS
	 Ct4kqfOLG2UMPmy+fuNP1UwjbHAHYJ66Hyiy3oiS1qechHCArKxl3CePmfi1ieyrbb
	 dKmATXbFuUvkVBd1D9OLm2515SVrbzrpZeySy94TDW7fJyDUthhlGN4oDcEgNH3j9W
	 xKWEndynmus+NER7l0YWp+Wcn/bWBuWC9ZgTBf6QKfRIH/Ua5aTD4eO4zMfqXQUl9W
	 L1DmSZrqecpUA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5273CC982E1;
	Mon, 21 Sep 2026 00:26:42 +0000 (UTC)
From: Nicolo Giuliani via B4 Relay <devnull+nicolo.giuliani6.studio.unibo.it@kernel.org>
Subject: [PATCH v2 0/3] arm64: dts: marvell: Add Sophos XGS 107w NPU
Date: Mon, 21 Sep 2026 02:26:40 +0200
Message-Id: <20260921-send-dt-v2-0-fb6b81002ad7@studio.unibo.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMB5sGoC/2WNQQ6CMBBFr0JmbUlboIgr72FYUDrIuGhJpxAN4
 e4CLl2+5P33V2CMhAy3bIWICzEFv4O+ZNCPnX+iILczaKmNbFQjGL0TLgljrZPXrqyl07DbU8S
 B3mfp0f6YZ/vCPh3zwxiJU4if82pRh/dfXZSQojCVUVVXlzgUd06zo5DPnmzIKUG7bdsXFNAr9
 7YAAAA=
X-Change-ID: 20260919-send-dt-6bbd08a470d2
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789950400; l=2526;
 i=nicolo.giuliani6@studio.unibo.it; s=20260919; h=from:subject:message-id;
 bh=dNUT0kDT3b3XLAmEsoO2sAzFA0JRGU+rhWu+Hm0JxlI=;
 b=jCcYMwDRL4FfG3CYkYSLcVQ165SHglPXqLKfLrqsX6uIdWB4yp8CmD5dYyhykI8Uv4NHYLPjG
 AhWGnt9VltsB2wKq0nxYpBAgb9pb3rLO7ne9Ux0GPuB1fqMZoqj7pD+
X-Developer-Key: i=nicolo.giuliani6@studio.unibo.it; a=ed25519;
 pk=D652ecdT01GkA1eoFWNFNX85xIg5ZnFwUWyjfestgQw=
X-Endpoint-Received: by B4 Relay for
 nicolo.giuliani6@studio.unibo.it/20260919 with auth_id=1040
X-Original-From: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
Reply-To: nicolo.giuliani6@studio.unibo.it

The Sophos XGS 87/107 desktop firewalls pair an AMD x86 host with a
separate network processing unit (NPU): a Marvell Armada CN9130 SoC with
its own eMMC and SPI NOR flash. The NPU serves the eight RJ45 ports and
the SFP cage through a Marvell 88E6193X switch on its MDIO bus, which is
connected to the SoC by a 10GBASE-R link, and reaches the x86 host over
PCIe.

This series adds the Sophos vendor prefix, the compatible string of the
NPU board and a device tree that describes the NPU as a standalone system:
UART console, eMMC, SPI NOR flash, the SFP cage and the switch with its
ports. The port LEDs, the USB ports and the PCIe link to the x86 host (the
CN9130 acts as a PCIe endpoint towards it, which needs endpoint support
that is not part of this series) are not described.

Tested on an XGS 107w with Linux 6.18: boot from eMMC, eMMC and SPI NOR
access, the mvpp2 link to the switch at 10 Gb/s, the 88E6193X probing with
its eight user ports, and 936 Mbit/s through a front port. The SFP cage
is untested.

dt_binding_check passes for vendor-prefixes.yaml and armada-7k-8k.yaml,
and CHECK_DTBS=y on marvell/cn9130-sophos-xgs107w.dtb reports no warning
specific to this board.

Based on the mvebu/dt branch of the mvebu tree (008e9faade).

Signed-off-by: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
---
Changes in v2:
- Patch 1: drop the second sentence of the commit message, add Acked-by
- Patch 2: move the entry before the SolidRun ones and list only
  marvell,cn9130 after the board compatible, as the other CN9130 boards do
- Patch 3: use the compatible list of patch 2; pass the switch reset as
  reset-gpios and drop the boot loader workaround; remove the LED
  expander node and the SFP address comment
- Link to v1: https://patch.msgid.link/20260919-send-dt-v1-0-365615a74ef3@studio.unibo.it

---
Nicolo Giuliani (3):
      dt-bindings: vendor-prefixes: Add Sophos
      dt-bindings: arm: marvell: Add Sophos XGS 107w NPU
      arm64: dts: marvell: Add Sophos XGS 107w NPU board

 .../bindings/arm/marvell/armada-7k-8k.yaml         |   7 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/marvell/Makefile               |   1 +
 .../boot/dts/marvell/cn9130-sophos-xgs107w.dts     | 188 +++++++++++++++++++++
 4 files changed, 198 insertions(+)
---
base-commit: 008e9faadef8c0aaa9b8a3ff05a2126e3c5b08b7
change-id: 20260919-send-dt-6bbd08a470d2

Best regards,
--  
Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>


