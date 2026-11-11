Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794436995;
	b=FCOAg87EUux3n+Srm2jalDXKC1gXcWkwHCfHxycnJ3UwkxR7/b/e96hjrhLgQCNVS4/5
	 LkQG5te0XX4Ih9eQujCwgRiT+HSgaxogNbiKiePnHK3REpnsnPrBF1K9ODpSZhWTRtroJ
	 TGXnMTBjKHWrZ+JjXG7ZexeYpa1vn636Gwozt9hTN4AqNgty0Vx52I+iTUf2dMnCKU2jM
	 xvlsoszLAUl8fSeJmHQPs69yBdt5DrxzeHvHJasgVJDH6mZchwgNX8aSZNHjatyarzhtJ
	 UOVBtjt7LK6jlo7uhrLp0uAyk1o+GVQIWDeCi2HVDfOL/dzPiqS/xGaLTLULxUwswIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794436995;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=assGCdcm+gX8iTjpb0hYNlEGNwK5F8MMHtxVUUTgRdM=;
	b=ELh5iB3bo1Z2H25SCospYtpWlV1zu2A/jFTstrVf6tIktVEStsAdBLgBIFE9Rc5NpZ/F
	 jquamLo/y2csjtgbXT7vSJLMOav3VjkS4vA3py3B/5no/0h9TNb8Rw1R1tWusva5jB2Nm
	 4FIoKW0MQtLRcXZ9P31j/k9wNQMDLkmB99gVZX1qwHzYRR5ceCWGq/hjcWjjlJ8yh/CcY
	 D/OCsqHrgYRIT5/sEzJ/R5i52+74yKa5ew7R7Tln2u9dnupgKpPLJgq+fbPFedy4KqeyM
	 5CpnfvpwqfZAS19YB6gnhq+UyM0srR2M/53GGN0rsCd/YbhEYCWLtjpucQ040XzqgKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=knBlLdjs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C1A60A3813;
	Wed, 11 Nov 2026 22:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=knBlLdjs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6F891F00A08;
	Wed, 11 Nov 2026 22:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794436995;
	bh=assGCdcm+gX8iTjpb0hYNlEGNwK5F8MMHtxVUUTgRdM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=knBlLdjsWYDfvYYMk5ROzKwYObQVKmmiT/ns9w+szswPAkjcrj7SFXZp/R9yYrFz9
	 989dhOuGyAhem4O5TcxYW5TbYU0SMBeSGAOxKIeCxtALjGJW8Gmv4Q21b3NJKU+U2V
	 Tyhv8mLQY1uL/HRzFkzVJTZgiF3VtuG0pYblsmCcS8/bN+KXOPm0vmevgFj4lC0a5q
	 N0HP7A7Zpv8uI+ZdOEe5nLg4orY8h6uqOspeRV+T284GjuqX0iftSV2Nzi/0n/8M5S
	 cP2nExcyPOUScGacaJYlP8aogNL4abLDq0hXWbOZAZ7nGaAWncme+RlApjp/enCpmu
	 z0MlBMhF5459g==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 16:42:58 -0600
Subject: [PATCH 1/9] dt-bindings: mfd: Add Marvell AP806/CP110 system
 controller schema
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
Message-Id: <20261111-dtbs-marvell-v1-1-938788aff3ae@kernel.org>
References: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
In-Reply-To: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev

The Marvell AP806 and CP110 lack specific compatibles. Add a dedicated
schema for the Marvell AP806 and CP110 system controllers and their
child devices.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../mfd/marvell,ap806-cp110-system-controller.yaml | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/marvell,ap806-cp110-system-controller.yaml b/Documentation/devicetree/bindings/mfd/marvell,ap806-cp110-system-controller.yaml
new file mode 100644
index 000000000000..4c43986c2c0a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/marvell,ap806-cp110-system-controller.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/marvell,ap806-cp110-system-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell AP806 and CP110 system controller
+
+maintainers:
+  - Andrew Lunn <andrew@lunn.ch>
+  - Gregory Clement <gregory.clement@bootlin.com>
+  - Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - marvell,ap806-system-controller
+          - marvell,cp110-system-controller
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  clock:
+    oneOf:
+      - $ref: /schemas/clock/marvell,ap80x-clock.yaml#
+      - $ref: /schemas/clock/marvell,cp110-clock.yaml#
+
+  pinctrl:
+    oneOf:
+      - $ref: /schemas/pinctrl/marvell,ap806-pinctrl.yaml#
+      - $ref: /schemas/pinctrl/marvell,armada-7k-pinctrl.yaml#
+
+patternProperties:
+  "^gpio@[0-9a-f]+$":
+    $ref: /schemas/gpio/gpio-mvebu.yaml#
+
+  "^clock-cpu(@[0-9a-f]+)?$":
+    $ref: /schemas/clock/marvell,ap80x-clock.yaml#
+
+  "^thermal-sensor@[0-9a-f]+$":
+    $ref: /schemas/thermal/marvell,armada-ap806-thermal.yaml#
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: syscon-common.yaml#
+
+unevaluatedProperties: false

-- 
2.53.0

