Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F0C4C2268
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792009266; cv=none; b=npJj/1qK+0PMm3ritNgA+76GWzC7R1yGlCw4hhxUYRUv2DmJFcWL7L2vxn53DxU3FmAH8EQ2oEAnsX2JhsQBBHLA0eHEGjjOzljOMp9mC1GnME4okTqBiqYRcCrGW8tvp65Cl4DRs47jVCeMmKfgjPw626wTlYYlRHHFumXjeQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792009266; c=relaxed/simple;
	bh=b6kmCkWDhgvp4BzQC+zkf5s86+fwR27Qvwhre15awnE=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Z0GhZe2xOuAqGDxE8OFlnPExOUtQ7uV47jocHFemutJEgYmFzLO9mG6CxCwcvYzdqZMygS69J6Iu/LUu6KXybsElqj04S5KIcqjKRi2Nk8zqpmVUJLCfnDOHf+L8Ob3PPQNxidqHiFiSCeUicjM/VV47n1OBSjMZ1eD0seqk5DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RFMCQNbL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=28/EMIVL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RFMCQNbL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="28/EMIVL"
Date: Wed, 14 Oct 2026 20:20:59 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792009261;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zbMjJ9PFzyfDc0/8wxWSnv8B4ZofHE2TztpZ25CgJdM=;
	b=RFMCQNbLZYom7Tm0yMKYtLEd+lcBpEwwiUsCKGJrWFEPTGDaasWSXyk2mi5kpUrwA8qLXW
	3yTPsljCKcic7BBSNlYt2i1YW/dmoL+26u5Gs8RDGbOZ0RuN9eyPZqP5f8F7qW+M8UG/m6
	L95C28UxwZ9VrQ/izXf4I8H/UcoLQzmxqSMrxRSTJhfGAJ342ksS8y8QHVihDkizaEWy79
	7NqtBHrmRdQJG/U1odW6ZyQxFX2XohHjmu4bHNyXfTs70WdQHzyFa4m0j5Op/QrT/mXRPG
	+RSi4XSAvyf0qZ4yuN5H2FHhEA1f4xBrX/PUo4yMtzVcII4gp/A3+7MRgI7eWw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792009261;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zbMjJ9PFzyfDc0/8wxWSnv8B4ZofHE2TztpZ25CgJdM=;
	b=28/EMIVLTSpvMcQUT9RoBLPmQ8lhRs6FULI6DtyGV8VMnpAAS+52F12AfwQvFoacQN8oIB
	MsEiEYNqa8kipqAw==
From: "clocksource-bot for Herve Codina (Schneider Electric)"
 <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-kernel@vger.kernel.org
Subject: [clocksource: timers/drivers/next] dt-bindings: timer: Add the
 Renesas RZ/N1 timer
Cc: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 daniel.lezcano@oss.qualcomm.com
In-Reply-To: <20261001082225.125956-2-herve.codina@bootlin.com>
References: <20261001082225.125956-2-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179200925963.2666337.5954289641273099849.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/drivers/next branch of c=
locksource:

Commit-ID:     9fea79f5948bd5e0bea1cf773fd7742a6855017b
Gitweb:        https://git.kernel.org/pub/scm/linux/kernel/git/daniel.lezcano=
/linux.git//9fea79f5948bd5e0bea1cf773fd7742a6855017b
Author:        Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
AuthorDate:    Thu, 01 Oct 2026 10:22:21 +02:00
Committer:     Daniel Lezcano <daniel.lezcano@kernel.org>
CommitterDate: Fri, 02 Oct 2026 11:42:32 +02:00

dt-bindings: timer: Add the Renesas RZ/N1 timer

The Renesas RZ/N1 timer block controller is the controller in charge of
timers available in the Renesas RZ/N1 SoCs family.

This controller handles 8 timers:
 - 6 16-bit timers
 - 2 32-bit timers

Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Link: https://patch.msgid.link/20261001082225.125956-2-herve.codina@bootlin.c=
om
---
 Documentation/devicetree/bindings/timer/renesas,rzn1-timer.yaml | 74 +++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/renesas,rzn1-time=
r.yaml

diff --git a/Documentation/devicetree/bindings/timer/renesas,rzn1-timer.yaml =
b/Documentation/devicetree/bindings/timer/renesas,rzn1-timer.yaml
new file mode 100644
index 0000000..7218c0c
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/renesas,rzn1-timer.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/renesas,rzn1-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/N1 timers
+
+maintainers:
+  - Herve Codina <herve.codina@bootlin.com>
+
+description: |
+  The Renesas RZ/N1 SoCs timers block controller is composed of 8 independent
+  timers.
+    - 6 are 16-bit timers
+    - 2 are 32-bit timers
+
+  Each timer has its own interrupt line and can work in either one-shot or
+  periodic mode.
+
+properties:
+  compatible:
+    items:
+      - const: renesas,r9a06g032-timer   # RZ/N1D
+      - const: renesas,rzn1-timer
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: APB internal bus clock
+
+  clock-names:
+    items:
+      - const: pclk
+
+  power-domains:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 8
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/r9a06g032-sysctrl.h>
+
+    timer@51001000 {
+        compatible =3D "renesas,r9a06g032-timer", "renesas,rzn1-timer";
+        reg =3D <0x51001000 0x200>;
+        clocks =3D <&sysctrl R9A06G032_HCLK_TIMER0>;
+        clock-names =3D "pclk";
+        power-domains =3D <&sysctrl>;
+        interrupts =3D <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+    };
+...
