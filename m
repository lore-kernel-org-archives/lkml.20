Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDA451EE09;
	Thu, 15 Oct 2026 10:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058446; cv=none; b=fLyGtrT7iX/pCGtQkdMEG+8THFqchTnTseHC7vpF/1L5vtJr4bKe1vK8zXkinhqBvfOHLAFiRrZP1IosiLgZNP50y7oQzgC9zsJErOk1xDuYE9C1k2avcoCI8cHVbJA38NZ1372ey6SHy6ucFOwuS668eI2T4244b07ByfGWggM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058446; c=relaxed/simple;
	bh=kVOFu0wAcfJu7sJ7xfZh5YFhOEE/QC90zKOdAzQyCpU=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=H0iJu78ndmJXks4Dcjcr5Mb5rojQUYbrXt87Dru4zWDvBT+73Ycwai7T5po12yyOV3lDcFgzozjUh8JSz8yoq3QlYsXV8+relViaaJbbcOtBsPZMUH0HinBuwJI1COjoCObIMDyeFIN1wEhry06wk4CWaI4HebaMew9XeUhFbTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IfYhq+lg; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JadGoyNc; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IfYhq+lg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JadGoyNc"
Date: Thu, 15 Oct 2026 10:00:33 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792058435;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VKxEt+FaZUs5tAdTSmlt5QUbvB4cyakwgFkEXr/fyM4=;
	b=IfYhq+lgEHf2LdD7yeea8k2Qxlza6VCYiVGkKA0Gz1yTzckqTv5Bm17VY+pB9u2nUerKL9
	DoVEAo7S9BM3HsgEnOSVyvjT3+e5JQT/8XJqQF4AngiRx+gPlfeldbp4z5SNdZ7NUaHPuU
	sKfkx+wbTQJLUrx3gspPJQF9dmoxOs9oPze8+Hz4IcTmHWRHonpJbU9eMlxH8QTMKSf2rh
	c76ORQ5ynzdwLt83eMZ/0rCPaJKasQHyn4a6ZPvaMMF9r9rkj/O6RFNqHocQjqbqmru61i
	zR/OUbIqv3Cq5KTeQ3jjA0BiFDYVWmnxf/pRs443YasrWCVYyAM+jcFOvHP7AQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792058435;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VKxEt+FaZUs5tAdTSmlt5QUbvB4cyakwgFkEXr/fyM4=;
	b=JadGoyNc6KpxiFv+6XLBdm612mkHXeheWD9L4/43K8/Cb2OwWUwgr7wEUtA4pvmcsxIuT4
	2HQ/fhZUljE92MDA==
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
In-Reply-To: <20260928-smmu-changes-v2-v4-1-3c79a14cd806@amd.com>
References: <20260928-smmu-changes-v2-v4-1-3c79a14cd806@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179205843332.2666988.11635736954701951306.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     675b45ab71f3b17482dde264d6ee7f98690c487c
Gitweb:        https://git.kernel.org/tip/675b45ab71f3b17482dde264d6ee7f98690=
c487c
Author:        Anirudha Sarangi <anirudha.sarangi@amd.com>
AuthorDate:    Mon, 28 Sep 2026 15:03:03 +05:30
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 11:59:22 +02:00

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
Link: https://patch.msgid.link/20260928-smmu-changes-v2-v4-1-3c79a14cd806@amd=
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
