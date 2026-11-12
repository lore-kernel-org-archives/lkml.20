Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492628;
	b=zDz9M+08dR64EZ0Y8m3fHL8wQ1rdHFyyzIQZHnZPvSOABCDlEtzlbib0h0Vas1RHNn9p
	 ojLlO/Rg+KET1Nf5YSy9s9kIFrsSWyJE01glLNRMjKXBLAr5SAsrnv69BO4WWDWeF7r5w
	 ANVFrTtgSpDTDNGugKLbw+Bs5wp8koUaUg0+YiRp6E3ZkrRdkjc3s6kl3ch+qS3O95orC
	 F90VaOGrYLm/LQ8q7WFWS6HtSn9rRoRVG05nnJJcSXFwl8Azlk6mRR88eFGXI14V3wmMF
	 CC/HB/J0iCBBzApgMu7gjJkpTPuB0Kht4HxaUvL2lJHaUNSMNPydIM9O4MHeqEt9c5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nxyVT71yJJ39uTDbzVGV1GPiP5/ViVIjOJ9mvPoYFeM=;
	b=2KP7/ToDgXEsmR9QBZJ415WtF4mf8vE2emzQnmeiDlXFIye6YWEvOnWPVuoKx630o6dY
	 dYdYqp0uwuVB764pIAYxydLcb5+pQ+H8l7YHDCJtyU6vwWRGy2Ew22RBm4DMPLRukXy57
	 sp3BkXjU2FxrSNs88fVcucCoJzKF9CJvNn6KnKmSAANwPEtEvXMQx4ZKuYtJaUxY44Tpm
	 odYcUSX8PQ2U4NvyXvDUXAI2n2ZykrWPZlMy9CFX/ypjdigTdiF3hk0va+wtIkT0yDdRV
	 Hb0nEEV4S6hNwN0WIPYR9BM5z443tQDo/Dzy/0TEVGeGnXgMYJMUZCikDajP3iXLuDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K8Y0FBE4;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37461606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:10:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37461606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K8Y0FBE4
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2eddafe648aso10045705ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794492627; x=1795097427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nxyVT71yJJ39uTDbzVGV1GPiP5/ViVIjOJ9mvPoYFeM=;
        b=K8Y0FBE4DhhNIqwGaGuO5AFTOMp/htbHRE5tS329ho4N7/MfqqxBmgegsD6lOf0KG+
         HgV85XDx1x+bvSjtlprhzh5MCIJgpHfau0JqPLAJzO5jGAN3RUvydN6GBNiNl0ixh/My
         TB/xxX7DnIV3jMs+S3DaswsAD/VwXCIaYEITK3Wg7GMjKOYzWTkoIKCB96BzDNZaPrCg
         axJiZde1qwmo8j6LneZxyYNjSbdtNKPYsgDOnVRhLF6QdBCXE7mj63K1a3YL36Cq77xE
         YZfLFZadVy/OIXy+baVXbj/449OtDMI6quDxcfuWzatuLq0csO5nRcZ1rJRAe4vErmjb
         +hFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492627; x=1795097427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nxyVT71yJJ39uTDbzVGV1GPiP5/ViVIjOJ9mvPoYFeM=;
        b=kuWSKMjMx2y1BxSwYNM/J94s+Gw18P8Uc0N/P2Gci26uKkBcI+ZJz/VzKtkDS3/f+H
         AX8oMBXi8DnMZmUmXfE2eJv/Z+E+YO9mlzaeaoRMcXx6XIKgURFgI1K0hK/DT06uQ8sV
         iiT6Q9td535vTcFFUH0GuslCyhU6iDKgzGJ+L/hzjD6lTLlm9bayWG1OVThkmNNjWWAC
         QLKql7ag3V9zfiuE5o/mofcdPR9ZW1oiSPcLGexBWBZLOG4sRpLb2SoIFlmk4X6OjFlJ
         bBrL3iPndWVSXnCl4tgNDS24hmYh0+vIg8Hgjgd+BytiqeckFvERGYz2ayOWvcRj7l6C
         9IvA==
X-Forwarded-Encrypted: i=1; AL+hErGod3aflXBkbqNx+9v9z7AtTp80O/kUIa8FDJHMNi+h1iPMcNXMYXfxG8F3A3u19JgLCkENbaWC3MfPQvg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fQvZUeRirWPoJ8LBqNlBnQQDzFnMt8MbASeYHuAbcahgTEtZS
	6nWsQsjoAzB4g6byfHaeMirQGHygWBT6UjzghBXroYFLmIRsdCkK8KWd
X-Gm-Gg: AYBFou3JS1wc6oVXHe1aMeJfCIIgpNQExwwLkqJiMkxKyEa7nq7JMKmppQnBjsD5C1m
	e/Qij852Gv94MmHB6J493xkwIaTEqfNYHlafJN+ct+RzJI59JqkDga2rL9+h2l4A3w9FNUw9OsD
	1ced4JCtj75a/8e81PLY97SRdFSjtSZzxIYCWMUvGU6yVdvrkH9hNvSD2m2Su9Ackrd8Ljxp/06
	pVRleFcPhn3d2flEaRO2fyAa60Tz+BYZZzQ9k6EYqJZfC7ve+ep+pwEEwSVRJlQJiYYJsGu8Eg7
	TBFg7JNEAn1s0o3J31wJxYKVqCg54YOFhG3tmOQhoufFrsl/Y2vWz3EGnkdG4BwM97cDePuOH1f
	7aDXwAEaJJintzTw/N/jkXLoutg8wwGiUFq3Inky+sQD1FX9epast1T3SY0PdUqOS41waSw+brt
	VgD3eWlOsjQHIG4tC1dIrA/pJvclw70fjqnN4sMvrHghyjJgJbC9TnGQwFEWYTyPj6b1qmhwISy
	cjTbI6gIZQlH0c0iE4xvfEOtTzrAcHbzS1kWo+q5vDiIm4eo2iUyzpVAKZRJJIy0NxRe+lTHJj+
	2LA0PXjxM05YGw38eVYoq9teU2LbIH0IcL84soMazMDxE8xD/BE0MXDsifFs
X-Received: by 2002:a17:903:3887:b0:2e9:855a:12a1 with SMTP id d9443c01a7336-2edd7a223camr58869855ad.47.1794492627219;
        Thu, 12 Nov 2026 06:10:27 -0800 (PST)
Received: from shaunak ([43.242.208.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4dc3bsm34861925ad.17.2026.11.12.06.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:10:26 -0800 (PST)
From: Shaunak Datar <shaunakkdatar@gmail.com>
To: rafael@kernel.org
Cc: daniel.lezcano@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shaunak Datar <shaunakkdatar@gmail.com>
Subject: [PATCH] dt-bindings: thermal: marvell,dove-thermal: Convert to DT Schema
Date: Thu, 12 Nov 2026 19:40:05 +0530
Message-ID: <20261112141005.229687-1-shaunakkdatar@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Convert the Dove Thermal binding from legacy text format to YAML schema
to enable validation with dtbs_check.

Signed-off-by: Shaunak Datar <shaunakkdatar@gmail.com>
---
 .../bindings/thermal/dove-thermal.txt         | 18 ----------
 .../thermal/marvell,dove-thermal.yaml         | 35 +++++++++++++++++++
 2 files changed, 35 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/thermal/dove-thermal.txt
 create mode 100644 Documentation/devicetree/bindings/thermal/marvell,dove-thermal.yaml

diff --git a/Documentation/devicetree/bindings/thermal/dove-thermal.txt b/Documentation/devicetree/bindings/thermal/dove-thermal.txt
deleted file mode 100644
index 6f474677d472..000000000000
--- a/Documentation/devicetree/bindings/thermal/dove-thermal.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-* Dove Thermal
-
-This driver is for Dove SoCs which contain a thermal sensor.
-
-Required properties:
-- compatible : "marvell,dove-thermal"
-- reg : Address range of the thermal registers
-
-The reg properties should contain two ranges. The first is for the
-three Thermal Manager registers, while the second range contains the
-Thermal Diode Control Registers.
-
-Example:
-
-	thermal@10078 {
-		compatible = "marvell,dove-thermal";
-		reg = <0xd001c 0x0c>, <0xd005c 0x08>;
-	};
diff --git a/Documentation/devicetree/bindings/thermal/marvell,dove-thermal.yaml b/Documentation/devicetree/bindings/thermal/marvell,dove-thermal.yaml
new file mode 100644
index 000000000000..a11611b3c6c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/marvell,dove-thermal.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/marvell,dove-thermal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dove Thermal
+
+maintainers:
+  - Andrew Lunn <andrew@lunn.ch>
+
+description:
+  Thermal sensor present in the Marvell Dove SoCs.
+
+properties:
+  compatible:
+    const: marvell,dove-thermal
+
+  reg:
+    items:
+      - description: Thermal Manager registers
+      - description: Thermal Diode Control registers
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    thermal-diode@1c {
+        compatible = "marvell,dove-thermal";
+        reg = <0x001c 0x0c>, <0x005c 0x08>;
+    };
-- 
2.53.0

