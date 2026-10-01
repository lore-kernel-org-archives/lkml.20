Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CD53655F0;
	Thu,  1 Oct 2026 23:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790895945; cv=none; b=TRwhrFoAgnOc4SWHWDljDXGw5x0yLVuF8pEDr5PI4ice7tuxHrUxQvFmOjYo0OexK50s/XDPSiY47YaGOlE4uobVuzja0k//Em8rbNed9vyWZS/WXSGm0xELJSnG8nsDJPO5OcjShIRPLX8PH4fOD0aoI89+J743JrYLB91jCV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790895945; c=relaxed/simple;
	bh=niq8tgZUbII6rGxbysHA/H3IwKXrmAsFRp+X2EYwJ+c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H/4snUfTm7qYc0J7PjbfehofWmdQCZ2axJlU1EFUuFa7UlAa98qI5xGkvwAQXEqmDnje16HcdH3KVr8g5Q1RCgKriFwW0B6cNnbjkr/QOemabmrDixvvrBV0dpP1Tq+mA9ON1p/kQL/1N3eAq0RNztmT7f6fYMHlL/6fCvtLJb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GEELnY5Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GEELnY5Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25881F000FF;
	Thu,  1 Oct 2026 23:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790895943;
	bh=I9bUbhFVQZJg6kGoX2Bb3yNAiNd/pFBIENXUoOTNEQQ=;
	h=From:To:Cc:Subject:Date;
	b=GEELnY5YKAkVNl38QFeEUq2NOKGLOxoDxdixXEB2EXIyfi+S0N3EJ9MTpYBs76iRQ
	 R5k11c8CgzaOizwURO9CFWSW+zeL7uAkZ1Tbg2UYP1f56yilWe9MxbN7w6llDuyTwn
	 8FHctB4mT/7Tku0Z1mLeRejaWLQCIexAmg7D+abU7ZYtCnt5HQN1oMZnjUkTy6czSX
	 xoWcuE38ubiVBOfmBg1InfaizdHD8cDMn7ST6NHkvbG6cHe4Ipp8AW6jMq2/SKWweq
	 s3zaNPL3v0i5bMKmfvMmogJFoK4t4Dijui+EmPzsfJwDJe1VJFSYV0rduM17369+PG
	 uW5umHTB5w5IA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: mailbox: Convert hisilicon,hi3660-mbox to DT schema
Date: Thu,  1 Oct 2026 18:05:37 -0500
Message-ID: <20261001230538.2751621-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the hisilicon,hi3660-mbox binding to DT schema format. The
binding and driver give no clue about what the 2 interrupts are, so more
details can't be added.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../mailbox/hisilicon,hi3660-mailbox.txt      | 51 -----------------
 .../mailbox/hisilicon,hi3660-mbox.yaml        | 57 +++++++++++++++++++
 2 files changed, 57 insertions(+), 51 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mailbox.txt
 create mode 100644 Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mailbox.txt b/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mailbox.txt
deleted file mode 100644
index ec2da5c9e647..000000000000
--- a/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mailbox.txt
+++ /dev/null
@@ -1,51 +0,0 @@
-Hisilicon Hi3660 Mailbox Controller
-
-Hisilicon Hi3660 mailbox controller supports up to 32 channels.  Messages
-are passed between processors, including application & communication
-processors, MCU, HIFI, etc.  Each channel is unidirectional and accessed
-by using MMIO registers; it supports maximum to 8 words message.
-
-Controller
-----------
-
-Required properties:
-- compatible:		: Shall be "hisilicon,hi3660-mbox"
-- reg:			: Offset and length of the device's register set
-- #mbox-cells:		: Must be 3
-			  <&phandle channel dst_irq ack_irq>
-			    phandle	: Label name of controller
-			    channel	: Channel number
-			    dst_irq	: Remote interrupt vector
-			    ack_irq	: Local interrupt vector
-
-- interrupts:		: Contains the two IRQ lines for mailbox.
-
-Example:
-
-mailbox: mailbox@e896b000 {
-	compatible = "hisilicon,hi3660-mbox";
-	reg = <0x0 0xe896b000 0x0 0x1000>;
-	interrupts = <0x0 0xc0 0x4>,
-		     <0x0 0xc1 0x4>;
-	#mbox-cells = <3>;
-};
-
-Client
-------
-
-Required properties:
-- compatible		: See the client docs
-- mboxes		: Standard property to specify a Mailbox
-			  Cells must match 'mbox-cells' (See Controller docs above)
-
-Optional properties
-- mbox-names		: Name given to channels seen in the 'mboxes' property.
-
-Example:
-
-stub_clock: stub_clock@e896b500 {
-	compatible = "hisilicon,hi3660-stub-clk";
-	reg = <0x0 0xe896b500 0x0 0x0100>;
-	#clock-cells = <1>;
-	mboxes = <&mailbox 13 3 0>;
-};
diff --git a/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mbox.yaml b/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mbox.yaml
new file mode 100644
index 000000000000..c42ce576a029
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mbox.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hisilicon,hi3660-mbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hisilicon Hi3660 Mailbox Controller
+
+maintainers:
+  - Wei Xu <xuwei5@hisilicon.com>
+
+description:
+  Hisilicon Hi3660 mailbox controller supports up to 32 channels.  Messages
+  are passed between processors, including application & communication
+  processors, MCU, HIFI, etc.  Each channel is unidirectional and accessed
+  by using MMIO registers; it supports maximum to 8 words message.
+
+properties:
+  compatible:
+    items:
+      - const: hisilicon,hi3660-mbox
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: Mailbox interrupt vectors for message processing
+    maxItems: 2
+
+  '#mbox-cells':
+    description: >
+      The cells content are as follows:
+        - Channel number
+        - Remote destination interrupt vector
+        - Local ack interrupt vector
+    const: 3
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - '#mbox-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    mailbox@e896b000 {
+        compatible = "hisilicon,hi3660-mbox";
+        reg = <0xe896b000 0x1000>;
+        interrupts = <GIC_SPI 0xc0 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 0xc1 IRQ_TYPE_LEVEL_HIGH>;
+        #mbox-cells = <3>;
+    };
-- 
2.53.0

