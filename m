Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC04537A48A;
	Sun, 18 Oct 2026 16:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792339692; cv=none; b=A5+/P0h7JQdiCfJzvQZQAlCZMHepCATkmoqYLEo8xkujRcbpbHXm2XX8zyaxw5GgheANq4kbAIervnG/NzrEim4QIEnKRfitsQf561FeKELRl63Y5WZVZwOhvrHRNip4THqAfjYZ1eeTKh69LK8yFDTHUJ/gkaxr0OpF7cAHnYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792339692; c=relaxed/simple;
	bh=Qr66KH9SN2KQWnULHvnoUjvnpzcnZKqoAGIOusMAt8E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YivGnjsrhxyNDPYu69QMZjRgVUidJABH2S4BlQaYZ2DVcbCHPEZNhaRin99x/GwtnpVzRxRqyMtLmRdmJrMun81AN9tzo83JudTdSRUIe1juOc5bEfYkB9Mp8vprhSaie9v+dw0OEXZ6x3UCiR6W9cZ548ZRl+9xfDr6gs0TRpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=rHDQEZHI; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="rHDQEZHI"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 69IG6rQsA1115117, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1792339613; bh=C9UuggtjA5BUR3FlYtPx3V69I5O1p0ZlO3eT1rAZTu8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=rHDQEZHIYjlpEKDlEp+ZJeKcpmLp1PL1GoynW20BmaH17MsEmlMurpXb3YhdqLqtA
	 Jcr7Im0EmjyTfDdod9OBEUtHBZ/KzNUvMKO2yqvOnMw3QQ0IlYyphCzRP0FYCjBLKe
	 AjdBWIyvjye7Kxw4dAHyW5XdZCbOKSylquCDrExRNNhxMLKmVM85PlQc0S9x6FsU3/
	 04QLk2k38gwCwd/YPErZHpZ1oOYXZgeOT02L78t92bgL6AoeUNgCr2TjZqaBuX9L82
	 G7QLEzd0t/O4k9bO1I2EkNinFPp7Gkr1eVw6DeSYuQHIbnmyLNuytgP9LesgeX+SPs
	 9BCrMKawcSybA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 69IG6rQsA1115117
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Oct 2026 00:06:53 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 00:06:54 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 00:06:53 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 19 Oct 2026 00:06:53 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <tglx@kernel.org>, <radu@rendec.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <lee@kernel.org>,
	<afaerber@suse.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<mfd@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v5 0/8] Initial support for the Realtek interrupt controller
Date: Mon, 19 Oct 2026 00:06:45 +0800
Message-ID: <20261018160653.3940371-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

I am taking over this patch series from James Tai, who originally
submitted v4 in 2023.

This patch series introduces the initial driver support for the interrupt
controller found on Realtek DHC (Digital Home Center) SoCs.

---
The major updates in this v5 series are:
1. Add support for RTD1625 SoCs.
2. Drop the RTD1325 interrupt controller driver, as the hardware is identical
to RTD1319D.
3. Refactored register access to use the regmap API. Since the interrupt
registers are scattered, the interrupt controller is now modeled as a
child of a "syscon", "simple-mfd" node. The driver retrieves the regmap
from its parent for register operations.
4. Reworked the intc-common architecture to properly accommodate the
specific hardware design and routing of the RTD1625 SoC.

v4: https://lore.kernel.org/lkml/20231228060825.1380439-1-james.tai@realtek.com/
v3: https://lore.kernel.org/lkml/20231129054339.3054202-1-james.tai@realtek.com/
v2: https://lore.kernel.org/lkml/20231117162709.1096585-1-james.tai@realtek.com/
v1: https://lore.kernel.org/lkml/20231102142731.2087245-1-james.tai@realtek.com/

James Tai (6):
  dt-bindings: interrupt-controller: Add support for Realtek DHC SoCs
  irqchip/realtek-intc-common: Add basic support for Realtek DHC SoCs
  irqchip/realtek-rtd1319: Add driver for Realtek DHC RTD1319 SoC
  irqchip/realtek-rtd1319d: Add driver for Realtek RTD1319D and RTD1325
    SoCs
  irqchip/realtek-rtd1619b: Add driver for Realtek DHC RTD1619B SoC
  irqchip/realtek-rtd1625: Add driver for Realtek DHC rtd1625 SoC

Yu-Chun Lin (2):
  dt-bindings: mfd: realtek,rtd1xxx: Add new SoCs
  dt-bindings: mfd: realtek,rtd1xxx: Add interrupt controller child node

 .../realtek,rtd1319-intc-iso.yaml             | 170 +++++++++
 .../bindings/mfd/realtek,rtd1xxx.yaml         |  37 ++
 MAINTAINERS                                   |   2 +
 drivers/irqchip/Kconfig                       |  50 +++
 drivers/irqchip/Makefile                      |   5 +
 drivers/irqchip/irq-realtek-intc-common.c     | 353 ++++++++++++++++++
 drivers/irqchip/irq-realtek-intc-common.h     |  93 +++++
 drivers/irqchip/irq-realtek-rtd1319.c         | 188 ++++++++++
 drivers/irqchip/irq-realtek-rtd1319d.c        | 197 ++++++++++
 drivers/irqchip/irq-realtek-rtd1619b.c        | 187 ++++++++++
 drivers/irqchip/irq-realtek-rtd1625.c         | 261 +++++++++++++
 11 files changed, 1543 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/realtek,rtd1319-intc-iso.yaml
 create mode 100644 drivers/irqchip/irq-realtek-intc-common.c
 create mode 100644 drivers/irqchip/irq-realtek-intc-common.h
 create mode 100644 drivers/irqchip/irq-realtek-rtd1319.c
 create mode 100644 drivers/irqchip/irq-realtek-rtd1319d.c
 create mode 100644 drivers/irqchip/irq-realtek-rtd1619b.c
 create mode 100644 drivers/irqchip/irq-realtek-rtd1625.c

-- 
2.43.0

