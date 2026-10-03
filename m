Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEBB346AC2;
	Sat,  3 Oct 2026 20:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791058773; cv=none; b=agEEcmnrd6ZfA3qU249zKrjO4Fiq3B8XD7mInuxqwHUk2D61xFBjM3pWD1IMkmu7p6BSZEaMDWEYAWBk5TRiKLyDni5WSbKvSZU+Tl6KYiur8s2X6MeJB7y7gS6JuBB7J0FG441J3Y4m/Lj2eP82KtgxQDKdcyZmLlGsyicN1gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791058773; c=relaxed/simple;
	bh=eRgzPtIgyLHN/g4WwJ8RSVGuDhTsx2ULqVsfN1AWRds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FJpHL3Kz5VgtW0pfOQbFO2Uin/J+tmycSrMlfafF+OMrIKGErPCRnY4nECm4pi0LOIChTgHEC6HCoBt79O+h+MXKvQGgVHe7JFtIbksNyYfXk0XNiT950X0a4DZUXTcBard0shmB8k6fbahRycxXL85aaPkYphTjHsMRJOxepok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZnCboqww; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZnCboqww"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53733C2BCF6;
	Sat,  3 Oct 2026 20:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791058773;
	bh=eRgzPtIgyLHN/g4WwJ8RSVGuDhTsx2ULqVsfN1AWRds=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZnCboqww9hk8fjIzUqOj5Q5ZEuqMCIJaYDJcYNIec4uIL0DBBm9/J3N/3kNyoYw2E
	 W4LRkXu5PcxEsuyFGd0mttLlVcz+9dL8WsAj5QAkDdUm+7hNPaSH1iZQo+MiDP7jgO
	 3fsi0LVq5SEdjc/d9rOh6/cGJqneMGWqTKw+OuyZhnJ/AP7mtmvAsPThePKGHKji9z
	 iqmqixXtRxBuYQda8zSN7k3dd4/TVKJ/LvU4wFLaBr6TCrAOaAloUo+TcHjtxTtF6x
	 fqwPNHHTUuQHaOYFcW7FkMIcCt3bgnO+9qMXItmwJZ2x0wyF1794pFdIPo+S34/MAx
	 BTZ3/Ic4LdTvg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32FEFCA5FE6;
	Sat,  3 Oct 2026 20:19:33 +0000 (UTC)
From: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
Date: Sat, 03 Oct 2026 20:19:19 +0000
Subject: [PATCH 1/2] dt-bindings: bus: Add binding for Altera AXI Timeout
 Bridge
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-feature-timeout-ip-v1-1-8837c311d571@bruker.com>
References: <20261003-feature-timeout-ip-v1-0-8837c311d571@bruker.com>
In-Reply-To: <20261003-feature-timeout-ip-v1-0-8837c311d571@bruker.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>, 
 Vyacheslav Yurkov <uvv.mail@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791058772; l=2392;
 i=V.Yurkov.EXT@bruker.com; s=20260318; h=from:subject:message-id;
 bh=hyHA3ZNQrL78Zg2YOSELcUPMZWCWSUYAq0Hsjp/nUOM=;
 b=cvf/Id9QP8pU/4/tX392HduDdEsbDnEUv5FyrtPGTdMHLSWTuRPvL3JOOLYMpFiGFVRipEEuM
 4K6X/pLNpSpD1M+Rp1vFE4gjZO4cLvJKxYfKpAf+mwg5DEJyCoyLJPP
X-Developer-Key: i=V.Yurkov.EXT@bruker.com; a=ed25519;
 pk=snJmgYVOKlp7aQtK9tWnEI7QTYxpPpJJvxdVsnxA7Fk=
X-Endpoint-Received: by B4 Relay for V.Yurkov.EXT@bruker.com/20260318 with
 auth_id=686
X-Original-From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Reply-To: V.Yurkov.EXT@bruker.com

From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

Add a device tree binding for the Altera timeout bridge, which connects
an Avalon bus to the HPS and provides an address space for child
devices with a fall back to a simple bus.

Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
---
 .../bindings/bus/altera-timeout-bridge.yaml        | 82 ++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/Documentation/devicetree/bindings/bus/altera-timeout-bridge.yaml b/Documentation/devicetree/bindings/bus/altera-timeout-bridge.yaml
new file mode 100644
index 000000000000..b57a0966ba6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/altera-timeout-bridge.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/altera-timeout-bridge.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Altera Timeout Bridge
+
+maintainers:
+  - Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
+
+description: |
+  Altera timeout bridge bus.
+
+properties:
+  compatible:
+    items:
+      - const: altera-timeout-bridge
+      - const: simple-bus
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  ranges: true
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-parent
+  - ranges
+  - "#address-cells"
+  - "#size-cells"
+
+patternProperties:
+  "^[a-zA-Z][a-zA-Z0-9,+._-]*@[0-9a-f]+$":
+    type: object
+    description: |
+      Device connected to the timeout bridge.
+
+    required:
+      - compatible
+      - reg
+
+    additionalProperties: true
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    intc: interrupt-controller {
+        interrupt-controller;
+        #interrupt-cells = <3>;
+    };
+
+    timeout_bridge_hps@10000 {
+        compatible = "altera-timeout-bridge", "simple-bus";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        reg = <0x10000 0xF>;
+
+        interrupts = <0 12 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-parent = <&intc>;
+
+        ranges = <0x0 0x10010 0x1000>;
+
+        timeout-device@100 {
+            compatible = "timeout-device";
+            reg = <0x100 0x10>;
+        };
+    };

-- 
2.34.1


