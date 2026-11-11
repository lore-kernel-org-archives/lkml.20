Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367001;
	b=bUh42pZSHuZqhB/NJ9/LHLKY2VGz20xvN/VMjsJDDuBW/k9PPWjIjPQcIfXca0zkr59H
	 rqvBR7MeERhGKndLgwwhZQw28uBAuEO4I+NXR421grC5wVBP5bZKVBVwCYOJQRg4/Va8F
	 iqcHgvyMwualgbSzAf53HnOTn9CzvX/d3YFebaZszxSmdumZHXc3xvg+e4ZkjIpFM18TZ
	 SIG03Tht5PvYl/8Jr2ZU/xUldeXraeq7jS6bfXvt1Byiz4WLJrgtMruXJ1HNSKqPABYlR
	 v5buDMdg8hoUOGQBuYhJCVquYx1puy0uHS4KSvadcNW22P1GJcKbQOhM+b3UwzZSDxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367001;
	h=DMARC-Filter:Received:Received:From:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:CC:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=6arbNQhtMgz8wXXZokXmBFsJFiQEOhX4Thl2tbkOhwE=;
	b=XJ37E6smyt6hItdV8Lyf7byP79xa4Kg2PCzDFvYACrq1tQGVrWTYXJwuVH1nuuslZjHl
	 /xhbRhOkk4aRoC7BAP/CjSvxBfeXLYEvBOHaNuyV5DMaB+Rb/gof1xBZFFZFEUN+VxczH
	 1xGrrjfLeTSXI7jdeT6BST0ruadlv8lue4CvvxC91VhCpTecozk+6wecolj7TqpoCG1lq
	 XUH2tTeBXCV23xe1DpmpoX7p9HMsK4kElqX/MyqiR1NNcbG3taKEFVmJU1rqyIO9ILIyD
	 Elgzqc8g78i6ECUg2ffWGcJuz7us/iMXFey0WYNphvQXdWZBmLYeg1PCv2j3i60+RqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aspeedtech.com;
	spf=pass smtp.mailfrom=aspeedtech.com;
	arc=none smtp.remote-ip=211.20.114.72
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFD0606A31C;
	Wed, 11 Nov 2026 03:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BFD0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 11 Nov
 2026 11:16:31 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 11 Nov 2026 11:16:31 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH v2 0/9] i3c: mipi-i3c-hci: Add Aspeed AST2700 support
Date: Wed, 11 Nov 2026 11:16:28 +0800
Message-ID: <20261111-b4-i3c-hci-ast2700-v2-0-4d8fff5c5196@aspeedtech.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAze82oC/22NMQ7CMAxFr1J5xsgJVaMwcQ/UIXUM8UCLkqoCV
 b07oayM70n//RWKZJUC52aFLIsWncYK9tAApzDeBTVWBku2I2daHFrUE2NixVBm64hwCNHZTiw
 xGajDZ5abvvbota+ctMxTfu8fi/naX86T+ZdbDBIa78mL4yE6uYTyFImzcDry9IB+27YPvnXzF
 bkAAAA=
X-Change-ID: 20260714-b4-i3c-hci-ast2700-bad726e20c01
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Philipp Zabel
	<p.zabel@pengutronix.de>, Miquel Raynal <miquel.raynal@bootlin.com>, "Ryan
 Chen" <ryan_chen@aspeedtech.com>
CC: <tbevis@amazon.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794366991; l=6016;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=k/05GBdEuOCHYT2tE6tl/pfCWjwczfKbQjqgNVW4GHY=;
 b=3sBYcFGi4TNh39OLSvoEkqO8purEYuhlzRuSJSSH0plJkPMGiyJrK0bWb3CdnMqmARjxwp4Xy
 2mjQX9RMXGTCVQvbKwYr4+TVl4KEQJSzYkU5ve58Pr8sr3O4Q+rBIYF
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=

The Aspeed AST2700 SoC integrates an I3C host controller based on the
MIPI I3C HCI v1.1 programming model, extended with an in-house control
block and a PHY programming window. Both extra register regions are
advertised through a standard HCI vendor extended capability. This
series teaches the existing mipi-i3c-hci driver to drive the AST2700
controller without forking the driver.

AST2700 specifics are expressed entirely as quirks in the match data:
the existing HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET, then four generic
quirks:

 - HCI_QUIRK_DAT_INDEX_IS_ADDR for address-indexed DAT slots,
 - HCI_QUIRK_DMA_64BIT to configure a 64-bit DMA mask,
 - HCI_QUIRK_TX_START_THLD to clear the TX start threshold in DMA mode, and
 - HCI_QUIRK_BOARD_PHY_TIMINGS to apply board-specific PHY timing from DT

plus six quirks for everything that depends on the ASPEED vendor
capability:

 - HCI_QUIRK_VENDOR_BUS_SETUP to bring up the bus
 - HCI_QUIRK_VENDOR_INTR_SUMMARY for ASPEED's interrupt roll-up
 - HCI_QUIRK_VENDOR_RESOURCES for further clocks and resets
 - HCI_QUIRK_VENDOR_DAA_INDEX for access to DAA index registers
 - HCI_QUIRK_IBI_PAYLOAD_THLD to bound IBI transfers at the controller
 - HCI_QUIRK_VENDOR_TX_AVAIL for precise ringbuffer operations

Generic MIPI I3C HCI controllers are unaffected.

The series is organised as follows:

 - Patch 1 defines timing properties for the devicetree to manage the
   impact of board design on bus operation.

 - Patch 2 documents the AST2700 devicetree binding.

 - Patches 3-5 add the generic HCI quirks AST2700 needs --
   address-indexed DAT slots, 64-bit DMA addressing, and clearing the
   TX start threshold in DMA mode -- with no AST2700-specific code yet;
   nothing sets these quirks until patch 6.

 - Patch 6 adds support for the AST2700 I3C controller by implementing
   the controller-specific quirks and enabling all necessary quirks in
   the MIPI HCI driver to drive the AST2700 controller. It recognizes
   the ASPEED vendor extended capability, brings the controller up for
   transfers (master mode, PHY timing, reset/clock resources, the
   interrupt summary path, master clock stall), and enables all eleven
   quirks for the "aspeed,ast2700-i3c-hci" compatible.

 - Patch 7 adds the IBI termination threshold, a safeguard against a
   misbehaving device that never terminates a payload IBI on its own.

 - Patches 8-9 tune bus behaviour: PIO TX queue utilization, and the
   PHY's built-in pull-ups for boards without external resistors.

Tested on an AST2700 EVB: the controller probes in both DMA and PIO modes,
completes DAA, and runs CCC, IBI, and private transfers in DMA mode.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
Changes in v2:
- Rebase onto the latest i3c/next
- New patch: move the AST2700 timing properties into the generic
  i3c.yaml binding, renamed to match its existing i3c-prefixed naming
  convention
- Remove is_aspeed(), replace it with seven discrete quirk bits
- Rename vendor_aspeed.{c,h} to aspeed.{c,h}; keep struct
  aspeed_i3c_vendor_data private to aspeed.c
- Add a probe-time check for the ASPEED vendor capability being
  missing, ahead of the first vendor register access
- Drop the NULL check in hci_extcap_vendor_ASPEED(); vendor_data is
  always allocated by the time it runs
- Fix aspeed_i3c_set_daa_index() to clear all four DAA index register
  banks, not just the one it is about to set
- Drop the dma_set_mask_and_coherent() return value check; it cannot
  fail for a 64-bit mask
- Revert the pio.h register split; add an accessor function instead
- Drop the unused HCI_DAT_ANY_ADDRESS macro
- Make the Open Drain PHY timing pair all-or-nothing, matching the
  Push-Pull pair
- Acquire the vendor clock as mandatory, matching the binding's
  required clocks
- Acquire the dma reset with
  devm_reset_control_get_optional_shared_deasserted(), instead of a
  manual deassert and cleanup action
- Pulse the core reset at probe instead of only deasserting it, and
  reassert it on driver detach.
- Limit the SDA hold time override (i3c-pp-sda-hold-ns) to Push-Pull
  timing; Open Drain always uses its hardware default
- Link to v1: https://lore.kernel.org/r/20260901-b4-i3c-hci-ast2700-v1-0-19909e7cbd7e@aspeedtech.com

---
Billy Tsai (9):
      dt-bindings: i3c: Document generic bus timing properties
      dt-bindings: i3c: Document the AST2700 I3C controller
      i3c: mipi-i3c-hci: Support address-indexed DAT slots
      i3c: mipi-i3c-hci: Add a quirk for 64-bit DMA addressing
      i3c: mipi-i3c-hci: Add a quirk to clear the TX start threshold
      i3c: mipi-i3c-hci: Add support for the AST2700 I3C controller
      i3c: mipi-i3c-hci: Program AST2700 IBI termination threshold
      i3c: mipi-i3c-hci: Improve AST2700 PIO TX queue utilization
      i3c: mipi-i3c-hci: Support the AST2700 internal pull-ups

 .../bindings/i3c/aspeed,ast2700-i3c-hci.yaml       |  89 ++++
 Documentation/devicetree/bindings/i3c/i3c.yaml     |  86 ++++
 drivers/i3c/master/mipi-i3c-hci/Makefile           |   2 +-
 drivers/i3c/master/mipi-i3c-hci/aspeed.c           | 500 +++++++++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/aspeed.h           | 177 ++++++++
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c           |  38 +-
 drivers/i3c/master/mipi-i3c-hci/core.c             | 195 +++++++-
 drivers/i3c/master/mipi-i3c-hci/dat.h              |   6 +-
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c           |  63 ++-
 drivers/i3c/master/mipi-i3c-hci/ext_caps.c         |   2 +
 drivers/i3c/master/mipi-i3c-hci/ext_caps.h         |   1 +
 drivers/i3c/master/mipi-i3c-hci/hci.h              |  11 +
 drivers/i3c/master/mipi-i3c-hci/pio.c              |  32 +-
 13 files changed, 1153 insertions(+), 49 deletions(-)
---
base-commit: c899ff589ac6922c7ff72badd8f0664b974bc850
change-id: 20260714-b4-i3c-hci-ast2700-bad726e20c01

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>

