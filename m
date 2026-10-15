Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C32050AC30;
	Thu, 15 Oct 2026 09:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058092; cv=none; b=T9hl/4nFbixBX2LssHfW9w2UAKZYCgjhjB1aYD4LHk2TOOGoyICmvrHs1XaXw81q3ihG1aDKhCjD1Xg9vn1HKTIOAwTmpph/W9/PR+X0wmyeFvcfSbLHffhp+hExOlliYFnX8C/vngbk4Mkyxjla/cULmr7XcFWgi5YdLWIY1wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058092; c=relaxed/simple;
	bh=x6/aeCyQgZwjy6fxaw2+9HJypG4J3n8yM7Dp7SL3cEo=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=pI5oY7uwX/4+vDDHZg139gfZKVy4uISA8Alo2DEooEAKHfNhWpNkjnq0BSBptBcnZklQNM7M2AowwaJ76nOLlUEl6iH+znjlZTohaf3BuAr1DxNLZiEm21PTvbzy8LB5boKnD1AjA149TKQ5k3ILoH6J2K1UnTKnxu8cnqyJjyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MKsGIrgE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lyuXILNX; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MKsGIrgE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lyuXILNX"
Date: Thu, 15 Oct 2026 09:54:44 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792058086;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3FXOaNfRqEGUaluPVGp/2LrFxmMlslGTBmj4nLWk+eU=;
	b=MKsGIrgE9hCQHFoUmz263iuL5f4YbQq/I7bwTR7QPj5O3PmxDhKg6yU1fWxL6pQ5TDsYQe
	LsOC+T4vW+c+Ypqo+6U9Sa4oUVqgnp/GLRVfMIr9WC+RP3MbykAWBOhFvVf85ec4NITwiX
	5hzzdq/AJ5AqTuYTj0hNKKe1fMsJo2iszX0eXd2nhKOBkEwC+UgD3/XCTRrxv0zJQaoHus
	VC5e6TJcaxMZnoUOeDXdzOINhsUaY6orE/bjKHSFnpltDdv7AHv8k5xB4Cp00ayy4J6C5m
	nk7sphw/otN/8aC/uy0/3NclF3P7LO6Ka/cRXY/7kbsH7kgOEljIiIhuJkUNww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792058086;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3FXOaNfRqEGUaluPVGp/2LrFxmMlslGTBmj4nLWk+eU=;
	b=lyuXILNX9k9GSjGYpSjVMv2f7YDv5qel3CynEHJucYh5HdP8WpLnwyAfQFUEPUuLlYbYDk
	aFY9q84IUNCgbiBw==
From: "tip-bot2 for Anirudha Sarangi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] dt-bindings: interrupt-controller: Add Xilinx
 Versal NET SMMU CSR
Cc: Anirudha Sarangi <anirudha.sarangi@amd.com>,
 Tushar Nimkar <tushar.nimkar@amd.com>, Thomas Gleixner <tglx@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260923-smmu-changes-v2-v3-1-87bd09ba9605@amd.com>
References: <20260923-smmu-changes-v2-v3-1-87bd09ba9605@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179205808439.2666988.1610246184739026452.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     ffc1ebaef0c7e62b355a94e88cb8b63a79eec5d5
Gitweb:        https://git.kernel.org/tip/ffc1ebaef0c7e62b355a94e88cb8b63a79e=
ec5d5
Author:        Anirudha Sarangi <anirudha.sarangi@amd.com>
AuthorDate:    Wed, 23 Sep 2026 12:46:31 +05:30
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 11:50:48 +02:00

dt-bindings: interrupt-controller: Add Xilinx Versal NET SMMU CSR

Add a device tree binding schema for the Xilinx Versal NET SMMU CSR
(Control and Status Register) interrupt controller.

The SMMU CSR block acts as a vendor-specific interrupt controller
in front of the ARM SMMUv3, providing registers to enable and clear
standard SMMU interrupts such as EVENTQ, CMDQ_SYNC, GERROR and PRIQ.
Interrupts must be acknowledged in this block before being forwarded
to the parent interrupt controller (e.g. GIC).

Co-developed-by: Tushar Nimkar <tushar.nimkar@amd.com>
Signed-off-by: Anirudha Sarangi <anirudha.sarangi@amd.com>
Signed-off-by: Tushar Nimkar <tushar.nimkar@amd.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Link: https://patch.msgid.link/20260923-smmu-changes-v2-v3-1-87bd09ba9605@amd=
.com
---
 Documentation/devicetree/bindings/interrupt-controller/xlnx,versal-net-smmu-=
csr.yaml | 75 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++-
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/xl=
nx,versal-net-smmu-csr.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/xlnx,vers=
al-net-smmu-csr.yaml b/Documentation/devicetree/bindings/interrupt-controller=
/xlnx,versal-net-smmu-csr.yaml
new file mode 100644
index 0000000..38b63e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/xlnx,versal-net-=
smmu-csr.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/xlnx,versal-net-smmu=
-csr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx Versal NET SMMU CSR Interrupt Controller
+
+maintainers:
+  - Anirudha Sarangi <anirudha.sarangi@amd.com>
+  - Tushar Nimkar <tushar.nimkar@amd.com>
+
+description: |
+  The Versal NET platform includes a Xilinx-specific SMMU CSR (Control and
+  Status Register) block that acts as an intermediate interrupt controller
+  for ARM SMMUv3.
+
+  The block provides registers to enable, disable and clear the
+  standard SMMUv3 interrupt sources (EVENTQ, CMDQ_SYNC, GERROR and PRIQ)
+  before forwarding them to the parent interrupt controller,
+  typically a GIC.
+
+  The controller receives one parent interrupt and demultiplexes CSR
+  status bits into the following child interrupt identifiers
+    0 - EVENTQ
+    1 - CMDQ_SYNC
+    2 - GERROR (GLOBAL)
+    3 - PRIQ
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    const: xlnx,versal-net-smmu-csr
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+    description: |
+     Single cell containing the child interrupt identifier
+      0 - EVENTQ
+      1 - CMDQ_SYNC
+      2 - GERROR (GLOBAL)
+      3 - PRIQ
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - "#interrupt-cells"
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    interrupt-controller@eca10000 {
+        compatible =3D "xlnx,versal-net-smmu-csr";
+        reg =3D <0xeca10000 0x1000>;
+        interrupt-controller;
+        #interrupt-cells =3D <1>;
+        interrupt-parent =3D <&gic>;
+        interrupts =3D <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
+    };
