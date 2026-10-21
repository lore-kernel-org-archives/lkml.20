Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792612595;
	b=L3l0sn8yrCKL4p4apF0Ar4hdZrwXsMrYA15TPqGFfn5ES1YZWPMtAaq/CFscRsjkdKpz
	 mQpudT7MeWHPpFHg3eO6iqDGwOm/1hk1t3fuZpMmXPm6M2Ue16lRSvTmqr4J+sUAJHpqu
	 v9o+ZE1IXz/p1HklNeToypqmY7tZ17zXlE8UEWsUpsbtPhVTIhZOvkSAzwMJVf29cUABj
	 nHXrbI8pTZTQmx7VJKuePDJtkp5/FpEyIZ2PtZR3EUV1IEfNCVCMwSXJ7k1MZvE2cFw7h
	 M9ECA9YFHZmpWwks7IF2WlRSN0LHhKSPH7DayKUgeTsCd+ikMCDHi08k00w+wO7kYOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612595;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=F+fZ7cATZZGOwmmMeKK9TVEqoAVaUobzpdR7AdsDoIU=;
	b=mUJ+bMHT7d+BSRhdZ/hnWxWBv3Fv5xWsK2LGUFsjXakS5CEQUW+zYVB2HEMhiv/y9DXI
	 OLgLKENlc80Tc3/BfE+GODQqDv6MVFCnCWDcJMQ99CMfqs8o1r873oWv/ASKEdluSMYU4
	 PSuY+/C8pjRA/avrXCfbU1UhzF6aSru6fCdWU6CNmlEGlqdZaGxvL74ejak1hghO/kjmr
	 PWFqfBf7L/96aATKx6zq+3gfgCqYFafp3c+bJYeDxVg/gsZXtDvP65ioH2bIBZD/FLKho
	 RE6hVnLGrgZAY7JX3BV2Cd+/a7jXPW/BhFWdW5k2ss2WTAW9HWnlyKpAK0M3Ty6D5Jg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SMS8wqec;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7256A606A321;
	Wed, 21 Oct 2026 19:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SMS8wqec
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792612595;
	b=kuBbef4JEHsVKgSzV+9sfO2GBP6y56RbRe3X6c0aMzSdVTQOizRgrQLmaP+H0DDKM/WW
	 Rj+6Xk8odkvsPC/7Eor/pe0BeF7xZn/Dn3IhPCFwa1NSlOcRRJcdqYaeGtHsf+vpvq9Ju
	 aOw4xULzwelr0W+hu5/TY8DI1g1m/HVJcqA5I+4BQmdkLfAqwygroJZzc9Jg0cTJFh2WU
	 5AkDW9ZfpDa2G6sty1sldYDt28XITobwhDiMu+86JdOPSTy1OABK6j/L1/NZW2Qp4H1bh
	 +/T1bioNBPvopAfdNGZgwQ26XXZsD4N3HO/RNP57+GsY+UzzNuB7c9xSiybBBraXqlw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792612595;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=F+fZ7cATZZGOwmmMeKK9TVEqoAVaUobzpdR7AdsDoIU=;
	b=PoonLF7BCFi/VpfYBlAgytxEYlfxJqnHVD/4fsajpZZHqr1jEZgXHkGIF7Wk5hM1HePN
	 vddNndqjK3GDpEN+TUn8PkyAKPSo6GhaK1PeLaMhRost3i7pqQNfwryarT1Q4u1eS2p5z
	 XmZLwM9trO+Krm69e3pvPK2nlzSPTsVffhtuv+DSDvyAI5tp5ks++6buARIvjy0f99p8q
	 BAWgVQiObkWcFPNp3Vwmqsd+UsPiyPLD6+DFAgugy03d/uc9fGVIJoRZpHz6nVP9VL9Ee
	 l+Cimg+/0AMy/9ORTU+JxfSYv8OpxDTg+zjgh3Il6ZSmAJCZ/a9TIfD3BlzHoYC0l8g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 454241F000C3;
	Wed, 21 Oct 2026 19:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792612595;
	bh=F+fZ7cATZZGOwmmMeKK9TVEqoAVaUobzpdR7AdsDoIU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=SMS8wqecEu1hKH4FFaHUl8Y5Crb63kp+Vagz/2siwRj603HL+2148NxtESp4+tiB7
	 rionZTxtnnm4iIHd6i2sVB6NSiQm8nzqwCmeHxNackyiNOfZHvIJ9sjtyk/BUeb0xq
	 faeHfCjyx+hJvyFK74uQH7TuhvTYNlgXD/fs8hTYFwkmueA0BBsPi95xk8sCGKnqgg
	 vB/5SafNnDECahzotriVCnr7ympXUGxRikYxbScw7vyrWe9trvOZlayRDzE96xoBdm
	 G7cEEpIWuc/kCgbUby2Gd+zBSEIXsdtSY8J15mTGbMtDO85OKVlpEgFwPKdBSCL1xn
	 HvmRtGgfER23g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A2ECD4343F;
	Wed, 21 Oct 2026 19:56:33 +0000 (UTC)
From: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
Date: Wed, 21 Oct 2026 19:56:23 +0000
Subject: [PATCH v2 1/2] dt-bindings: bus: Add Altera AXI Timeout Bridge
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
Message-Id: <20261021-feature-timeout-ip-v2-1-a037be089518@bruker.com>
References: <20261021-feature-timeout-ip-v2-0-a037be089518@bruker.com>
In-Reply-To: <20261021-feature-timeout-ip-v2-0-a037be089518@bruker.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792612593; l=2961;
 i=V.Yurkov.EXT@bruker.com; s=20260318; h=from:subject:message-id;
 bh=ngeh3x8lLAi1v/DII3EVjt3BSrPj52yBImEXu20kSEw=;
 b=HyOXa2GhxlJ2krK6XYIkhk/j5DYU723wAlA2JTIxbfnIig/htM2aMep77ChhfCq6VQPm4QTm2
 p6wimlVtQ5JDATHdfA7MQQqBq6xl6fXj2qf2GgeC/Y40cCHeoYUemh+
X-Developer-Key: i=V.Yurkov.EXT@bruker.com; a=ed25519;
 pk=snJmgYVOKlp7aQtK9tWnEI7QTYxpPpJJvxdVsnxA7Fk=
X-Endpoint-Received: by B4 Relay for V.Yurkov.EXT@bruker.com/20260318 with
 auth_id=686
X-Original-From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Reply-To: V.Yurkov.EXT@bruker.com
Content-Transfer-Encoding: 7bit

From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

The Altera AXI Timeout Bridge is an FPGA IP core placed between an AXI
host, such as the HPS-to-FPGA bridge, and peripherals implemented in
the FPGA fabric. It forwards transactions unchanged and monitors each
one for completion. If a peripheral does not respond in time, the
bridge terminates the transaction with an error response so that the
host does not hang, raises an interrupt, and reports the address of
the timed-out transaction in its control and status registers.

Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
---
 .../bindings/bus/altr,axi-timeout-bridge-1.0.yaml  | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/Documentation/devicetree/bindings/bus/altr,axi-timeout-bridge-1.0.yaml b/Documentation/devicetree/bindings/bus/altr,axi-timeout-bridge-1.0.yaml
new file mode 100644
index 000000000000..3512494442d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/altr,axi-timeout-bridge-1.0.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/altr,axi-timeout-bridge-1.0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Altera AXI Timeout Bridge
+
+maintainers:
+  - Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
+
+description: |
+  The Altera AXI Timeout Bridge is an FPGA soft IP placed between an AXI
+  host, such as the HPS-to-FPGA bridge, and the downstream peripherals
+  implemented in the FPGA fabric. It forwards transactions unchanged and
+  monitors each one for completion.
+
+  If a downstream peripheral does not respond within a configured number
+  of clock cycles, the bridge terminates the outstanding transaction with
+  an error response so that the host does not hang,
+  and raises an interrupt.
+
+properties:
+  compatible:
+    const: altr,axi-timeout-bridge-1.0
+
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
+required:
+  - compatible
+  - reg
+  - interrupts
+  - ranges
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    timeout-bridge@10000 {
+        compatible = "altr,axi-timeout-bridge-1.0";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        reg = <0x10000 0x10>;
+        interrupts = <0 12 IRQ_TYPE_LEVEL_HIGH>;
+        ranges = <0x0 0x10010 0x1000>;
+
+        timeout-device@100 {
+            compatible = "timeout-device";
+            reg = <0x100 0x10>;
+        };
+    };

-- 
2.34.1


