Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827901;
	b=3QZaoqDZqQFRcMjybkjTqgIJWw+M9KWrrlOnt82YIeBCAeAYXP+eEha9vUyOKW9hqREz
	 VLj64jiOiP3ntcbFrmyygNZy3w+dnfDvqOgKd4aV+716RuLDsRbzLQO+C3DeQpYaHIQcK
	 VwqN3joM3gB7+k5nXA7XMGyvwlOy95HjeOnklnSR/83q2gOab4JR95pZxkPERrERo9ypf
	 LxWXLtcJBHPJwBruk6bhRKbF0/J3Vr1mjOOwVsm7UVcMhqlaFo5xW1ysj8vCqeEHKEls/
	 aTYtB8vw/ZyF0mh8+b7+wsYNlfrKkQ28yJi2dwnZNMEkQvwesIeF0tEan3jLanlZYPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827901;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=IGnOiA0x9CKr+L+HJwDstHQe2wKKE1kXCubYYWWblik=;
	b=ohT9XhkcwG0NG4MBsvj1viPXutJLlfGIaYBFWxWc3YNDp4OQEDepwapmkzFuHITCbKrb
	 I0ATzg5uugWxyI4IfC3MtNSmbSAH8rSYqzn+LyuxuFtl9rLflp1b0xczgIEIcD60VQlUA
	 x89q+R8039QFse99pdf39BNP3Y6LXV1iWrlCRyXQVlXv5GrpRdvygEsDw7iZVotBnd3S8
	 FXkI59ujf7YtyZuGz5L9aYU+KoTQ30oKTRQFyeCe0WIKv+9p0R53DZZCtWdoSGAw2V2PS
	 qWHx9RrrGjyuFQ8yhaacigW+ksjaWc0SxV2wPVSx8SqEIkVOgphMJuXPT/R1bl2evkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=jERngUQc;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9477606FE80;
	Mon, 16 Nov 2026 11:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9477606FE80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=jERngUQc
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EBA5910D4A6;
	Mon, 16 Nov 2026 12:18:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794827899; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=IGnOiA0x9CKr+L+HJwDstHQe2wKKE1kXCubYYWWblik=;
	b=jERngUQcHDXF+liNkWwQLn7p0Sfrg8qk/uCZkc93jBVbfYavQfTYJI/3A1XrNwnXB/Ped3
	hLcZmSSjfUqgroAmCum/gud97Ta02C6vmC/5izv8puQnik1jzNYSbM85BwJKU7+vtwYbLh
	pBJr5iRQd9PULMWXrmUve4vClQvGiLjLzBdM9jUbeM8le5SqzwXJvDLK9S6tdU5Avuq0eW
	2dhhHaS2wzX5xAcuLcip0l4b7I+6gnQ/sz1fHHaVjLwfjRIoVdvXjGChRws4zPhuscgpaX
	hOqg9fJGwRu354gaEE5gszC95i4oYS6b4OL7/87eLGaj+ed8xfqy/NY5NiGQEw==
From: Lukasz Majewski <lukma@nabladev.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lukasz Majewski <lukma@nabladev.com>
Subject: [PATCH v3 2/3] dt-bindings: hwmon: Add National/TI LM77 temperature sensor
Date: Mon, 16 Nov 2026 12:18:01 +0100
Message-ID: <20261116111802.2442456-2-lukma@nabladev.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116111802.2442456-1-lukma@nabladev.com>
References: <20261116111802.2442456-1-lukma@nabladev.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add binding description for National/TI LM77 temperature sensor.
When compared to LM75 - it has two output pins one for interrupt
and another one to signal the critical temperature alarm.

It also has only two I2C address pins (A0 and A1) - possible I2C
addresses are: 0x4[89ab].

Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
---
Changes for v3:
- New patch, as this IC description is added to Documentation/hwmon
  as a separate entry and not to trivial devices
---
 .../bindings/hwmon/national,lm77.yaml         | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/national,lm77.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/national,lm77.yaml b/Documentation/devicetree/bindings/hwmon/national,lm77.yaml
new file mode 100644
index 000000000000..fbb6e711342c
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/national,lm77.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/national,lm77.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: National Semiconductor / TI LM77 Temperature Sensor
+
+maintainers:
+  - Guenter Roeck <linux@roeck-us.net>
+
+description: |
+  The LM77 is a 9-bit plus sign digital temperature sensor and thermal window
+  comparator with a 2-wire (I2C) interface.
+
+  Unlike the LM75, which has a single alert output, the LM77 features two
+  separate open-drain outputs: an Interrupt (INT) output and a Critical
+  Temperature Alarm (T_CRIT_A) output.
+
+properties:
+  compatible:
+    const: national,lm77
+
+  reg:
+    maxItems: 1
+    description: |
+      I2C address of the device. Depending on the A0 and A1 pins, this
+      can be 0x48, 0x49, 0x4a, or 0x4b.
+
+  vs-supply:
+    description: +VS power supply regulator.
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+    description: |
+      The LM77 has two open-drain interrupt outputs.
+      - The first interrupt should be the INT pin (window comparator).
+      - The second (optional) interrupt is the T_CRIT_A pin (critical
+        over-temp limit).
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        temperature-sensor@49 {
+            compatible = "national,lm77";
+            reg = <0x49>;
+            vs-supply = <&vcc_3v3_reg>;
+            interrupt-parent = <&gpio1>;
+
+            /* INT routed to GPIO1_12, T_CRIT_A routed to GPIO1_13 */
+            interrupts = <12 IRQ_TYPE_LEVEL_LOW>,
+                         <13 IRQ_TYPE_LEVEL_LOW>;
+        };
+    };
-- 
2.39.5

