Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0359381C4;
	Thu,  1 Oct 2026 23:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790895952; cv=none; b=VNOGgoHt5efq4LcNWI2YekAqMfqVHRzwoVD0u+kNCMq3g/vGS952sJU0PAeIUVWcrsjEPpW+fWxtWhog9U2fY4Kc/KRF737VtrFMMU2Gu0QKRa1R7Tna5qC9XSH7uAEeIUBCxmhOw0PrrYGHH/B8lqDYAERpRKJslDkKcLi0fi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790895952; c=relaxed/simple;
	bh=uYaat273uNePPk3KqoAUS2LpVYQon3YxtaTOOAuB3lQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LfNwaKTbi0yiC4xv8uFKUhhbAmwG7fIrPkZr9cCwJ84mupUynFCIVsdfNtnYjp/D1U5kDBdKBoB0XN4VZNxA0PPO1v4LkYQLXDM4ykB463A8ZfoHKAL4slYKRgnuf88VfiMGQ+I0dEeQSI4BPjFmq7sWp19r+En25hnSgofSR38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CBf9WxTL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CBf9WxTL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40A951F000FF;
	Thu,  1 Oct 2026 23:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790895950;
	bh=jrrZDVwpsiVTk2VhMpsaqDimIYibs8O5wPtcS+90ojw=;
	h=From:To:Cc:Subject:Date;
	b=CBf9WxTLvzEh/iBUjSm7D3z8ZDt55Ig3JUnmLtsEsWpU1fBIZRZX7jaf2GMTGqi1S
	 BGaIi7XHzNE1FhU23ki3TEbJtWfz5GOrnP3ZcjWjz+fx6pVkVy+ngJeJmGK/7aEgAV
	 lYhjojZHRuXiY1tX1MRzGyXhHsQjROBx/UPxhgDuOuxl8IKknqs+MwFWqcALEnpAJy
	 XDDqhLxJPDixU69YlTWsUzENPQ6sC7UfNUoRjt1GtxUtG/hMyW2Ug+OoSuGlEATRfG
	 CVhvhKv4X+DaQ5AvqPvn9FFkZ4sjHE5XlChpgHKgYUu+/obHsbXNDQijffTrdof0OO
	 G0TTzsFfiZWYg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: mailbox: Convert hisilicon,hi6220-mbox to DT schema
Date: Thu,  1 Oct 2026 18:05:46 -0500
Message-ID: <20261001230547.2752114-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the hisilicon,hi6220-mbox binding to DT schema format. It's a
straight forward conversion.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../mailbox/hisilicon,hi6220-mailbox.txt      | 74 -------------------
 .../mailbox/hisilicon,hi6220-mbox.yaml        | 63 ++++++++++++++++
 2 files changed, 63 insertions(+), 74 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mailbox.txt
 create mode 100644 Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mailbox.txt b/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mailbox.txt
deleted file mode 100644
index de9fbf722bee..000000000000
--- a/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mailbox.txt
+++ /dev/null
@@ -1,74 +0,0 @@
-Hisilicon Hi6220 Mailbox Driver
-===============================
-
-Hisilicon Hi6220 mailbox supports up to 32 channels. Each channel
-is unidirectional with a maximum message size of 8 words. I/O is
-performed using register access (there is no DMA) and the cell
-raises an interrupt when messages are received.
-
-Mailbox Device Node:
-====================
-
-Required properties:
---------------------
-- compatible:		Shall be "hisilicon,hi6220-mbox"
-- reg:			Contains the mailbox register address range (base
-			address and length); the first item is for IPC
-			registers, the second item is shared buffer for
-			slots.
-- #mbox-cells:		Common mailbox binding property to identify the number
-			of cells required for the mailbox specifier. Must be 3.
-			<&phandle slot_id dst_irq ack_irq>
-			  phandle: Label name of mailbox controller
-			  slot_id: Slot id used either for TX or RX
-			  dst_irq: IRQ identifier index number which used by MCU
-			  ack_irq: IRQ identifier index number with generating a
-			           TX/RX interrupt to application processor,
-				   mailbox driver uses it to acknowledge interrupt
-- interrupts:		Contains the interrupt information for the mailbox
-			device. The format is dependent on which interrupt
-			controller the SoCs use.
-
-Optional Properties:
---------------------
-- hi6220,mbox-tx-noirq: Property of MCU firmware's feature, so mailbox driver
-			use this flag to ask MCU to enable "automatic idle
-			flag" mode or IRQ generated mode to acknowledge a TX
-			completion.
-
-Example:
---------
-
-	mailbox: mailbox@f7510000 {
-		compatible = "hisilicon,hi6220-mbox";
-		reg = <0x0 0xf7510000 0x0 0x1000>, /* IPC_S */
-		      <0x0 0x06dff800 0x0 0x0800>; /* Mailbox */
-		interrupt-parent = <&gic>;
-		interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
-		#mbox-cells = <3>;
-	};
-
-
-Mailbox client
-===============
-
-Required properties:
---------------------
-- compatible:		Many (See the client docs).
-- mboxes:		Standard property to specify a Mailbox
-			Cells must match 'mbox-cells' (See Mailbox Device Node above).
-
-Optional Properties:
---------------------
-- mbox-names:		Name given to channels seen in the 'mboxes' property.
-
-Example:
---------
-
-	stub_clock: stub_clock {
-		compatible = "hisilicon,hi6220-stub-clk";
-		hisilicon,hi6220-clk-sram = <&sram>;
-		#clock-cells = <1>;
-		mbox-names = "mbox-tx", "mbox-rx";
-		mboxes = <&mailbox 1 0 11>, <&mailbox 0 1 10>;
-	};
diff --git a/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mbox.yaml b/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mbox.yaml
new file mode 100644
index 000000000000..f4c8f1f29baa
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mbox.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/hisilicon,hi6220-mbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hisilicon Hi6220 Mailbox Controller
+
+maintainers:
+  - Wei Xu <xuwei5@hisilicon.com>
+
+description:
+  Hisilicon Hi6220 mailbox supports up to 32 channels. Each channel is
+  unidirectional with a maximum message size of 8 words. I/O is performed using
+  register access (there is no DMA) and the cell raises an interrupt when
+  messages are received.
+
+properties:
+  compatible:
+    const: hisilicon,hi6220-mbox
+
+  reg:
+    items:
+      - description: IPC registers
+      - description: Shared buffer for mailbox slots
+
+  interrupts:
+    maxItems: 1
+
+  "#mbox-cells":
+    const: 3
+    description: >
+      The cells content are as follows:
+        - Slot number
+        - Remote destination interrupt vector
+        - Local ack interrupt vector
+
+  hi6220,mbox-tx-noirq:
+    description:
+      Flag to request MCU to enable automatic idle flag mode instead of IRQ for
+      TX completion.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    mailbox@f7510000 {
+        compatible = "hisilicon,hi6220-mbox";
+        reg = <0xf7510000 0x1000>,
+              <0x06dff800 0x0800>;
+        interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+        #mbox-cells = <3>;
+    };
-- 
2.53.0

