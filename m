Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315927;
	b=spinjCt2PdK6pa/TKXGdcFSbMWKwxa+8O6/4UYJ+VN2aqzGq6/sP6vQG1rYljMVo9guo
	 fSWhj94TLrVCgE00YvTeV8AwBspfa5tFobe5CXhbj8ovPzgjtL5HAvrnKbKxYN00e2ctx
	 BsVy/uRm1vMpFeS2E3H7tPi1A43BjXX10OXDfZMMlSmpg7SDU4T57oE1TLexT1EKZimpH
	 A3EGORKQZsWvwokYQUYf3dzjgQ9y9AcyFSIgPtKeb0PBq1Dsg4MzOEcH0AOSjx/CpNRyH
	 B8uyUpqVuOCXU+Ng8mkzQ9Fe4LBmHrSgfNVMrHro7K4Y6Rq3D1+Se3edwPlZtSyqSPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PxKXA0tpiiR3QW65ttMlpI5LiL6zJ2kSzmT6W+PdFjA=;
	b=2wT19rGtTMf6NKfcn59gRDyn3m6YjTq8SJPeig5rbToNuAY9J1ZR6yJ9vs2TYRMXan13
	 JFEugGm2ChAvyAYO7vWOsQe95EVgN2NbzjO3kCd7i/viEMxq6YXQ+x1aSmM6heSjoARWp
	 LpwIO5dhtImPMTUDJqccoHU5C8dDRvcttQW9K9dikKcYZNDBt/YQnZy3B/R1cZtynSnZA
	 iowl2uCfj9T7PmvpCyD+Mw4O3/bTDTVbDWYzCnSKjxohFfIdzWTfPIWlvodkt8DF1zARy
	 XkI2qwUdYWGITVzvNpUbwjfJNDLoAb+Ggs2hy5HqbF6twPSoc1JiQJ/9nRshi5cQJVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wISASz4C;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA0B606E454
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EA0B606E454
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wISASz4C
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2edcf6c3a57so5815ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794315927; x=1794920727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PxKXA0tpiiR3QW65ttMlpI5LiL6zJ2kSzmT6W+PdFjA=;
        b=wISASz4COTVofCUkhM3yL1mCWB8hBzMqYjnp4oqIghOzMIO2G6x77vhKeA59vHa89s
         zGvpF/YcwEtddBmzHgR/f3MyVsdpxtLsgHGHHvOpE8YKs3HECSkws/kNodAsmGLtyncp
         i5rL+wYPs9VD017urS4gH06FUhelfaHJh0xJ2ldZ7vJvywQyc2FysUc2us+s7hW1hbPo
         sNQelvxoQiFR+HfacAK7V/zTiCAlE4DZaDTKDMJ+FMSOF+jecuTkR4y+3bxfKzT+onyP
         7JPs9QxLdoUsORSayYNK3PAoZEL3jMzjhp2eJDkTAwYkYfzpvw3hwvIFpNTzfpXsUoGN
         PxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315927; x=1794920727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PxKXA0tpiiR3QW65ttMlpI5LiL6zJ2kSzmT6W+PdFjA=;
        b=xDdHy/brsPHQxDlnD7ZWpfdlt545kYpjm+6a8Kp5T0sDOyWur5eD6/7Hd3zzfVRb9Z
         17HleP7nqLl/gUIXqYkFnfSPL8SvMM1BUx71zrm0AIrNas2Nn33rRaTuzI/kYuci9PLf
         1hn+TbCUPys3n4Chb9TSYa6r84qMop1eqFlLL92DY0px3ThZ+ABJ6GhtArNebS4oCLEQ
         2iGow+XgK2MEMy8hGmfvEYUcMYukoi5KJ5fVBwr9HYrWyzOKu+RYOe4x+Bi09RqoecjA
         rXQ3Jbz2Jr5R7UDUUOfZJ3hE4fEOKtbGwtQwo/pJAbAdi17ci+lgvx1g7mOV7hOpZaGW
         NGaQ==
X-Forwarded-Encrypted: i=1; AL+hErFnUanLQmei9QsSLzTisDIyQtVbYrJYwUGE+9DUms7lxokrdhvWSb6/eh7NUZXX+016ggSjVPL7ms8AnwA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8e6GGH19xw2LKNifGsirOnBy4PTG96gP3dHlyv2j/gyy1cnlZ7
	PP0gsC4c9ssEy6B0KzOVEXqlX5QGVWBUfDUz6ta65ILwMPiPZIBSXxv9
X-Gm-Gg: AYBFou1KnxaNu0BePDO6kAPePths2BlCTVdH5jfLRpi0YGPXJZ/jj2KuHmw9TKM9/XA
	AIMJPoFMYHCrP6sws0Si9bU29P0jTmErzPk5kXl+PMbyMoy1z+P5EMkuBgZbACPAT/OY8LDtkNa
	mUDmTitfdi58C6A86WhxJmm2NN8ZrfFBYE0BuDbdThuMy0uf1pDL78jv7asEcukB8zNJbPonoMF
	aClTIHldvJ9BPXuhzu0hgRotQQSWcTRsj5gvhUe8Lub6SDJLi+3ZTqe0e79phwt8VFnFrVovo7a
	oeQ30htcilTbSYmpImNSOG9vJ7txwUEZBRkx1Lg+QX4/3Wq7rJYfncTeU8hY9ZDfmz0kMkB0KP/
	oj8aykQPWwEo9mmu6ciIIxvKHSgtFIH8U1P/5+sXQmGr/3k2hgnnanr7vq1xLiR82bED7/lZHpu
	t/PBYI50cpSdmIQjGacsTkU8XBTt3eSMFpsRU6gm62YwGiNEipHhQ2j2k4qaaRcvZbJs4o5Pt06
	r2pm6HoWm1hqekiqa3dK2YkF9rqm1lVCt9Paj2iWY22YWNVTn+UaHiXhuMmgXDs21czDZsq4oBM
	EJLLbntlz7geVi3Ko0ewUb3hnBEp
X-Received: by 2002:a17:902:d502:b0:2dd:b95a:e1db with SMTP id d9443c01a7336-2edb91382eemr40097465ad.3.1794315926694;
        Tue, 10 Nov 2026 05:05:26 -0800 (PST)
Received: from marchy ([2405:3800:918:486f:ee8e:77ff:fed4:d18b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edbc1b81f3sm6274425ad.26.2026.11.10.05.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:05:26 -0800 (PST)
From: Adam Azuddin <azuddinadam@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de
Cc: jesszhan0024@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	andersson@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	azuddinadam@gmail.com
Subject: [PATCH v6 1/2] dt-bindings: display: panel: Add RAiO RA8875 display controller
Date: Tue, 10 Nov 2026 21:05:13 +0800
Message-ID: <20261110130515.45819-2-azuddinadam@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110130515.45819-1-azuddinadam@gmail.com>
References: <20261110130515.45819-1-azuddinadam@gmail.com>
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

The RA8875 is an SPI-connected TFT display controller by RAiO
Technology Inc. It supports display resolutions of up to 800x480.

Signed-off-by: Adam Azuddin <azuddinadam@gmail.com>
---
 .../bindings/display/panel/raio,ra8875.yaml   | 86 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml b/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
new file mode 100644
index 000000000000..4c72130f0dbe
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/raio,ra8875.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RAiO RA8875 Display Controller
+
+maintainers:
+  - Adam Azuddin <azuddinadam@gmail.com>
+
+description:
+  The RA8875 is a TFT LCD controller for panels up to 800x480 pixels.
+  It can be connected to the host via 8080/6800 parallel interface,
+  SPI or I2C.
+
+allOf:
+  - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: raio,ra8875
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description:
+      3.3 V supply for the IO pins, the oscillator IO pins, the ADC pins
+      and the internal LDO. The 1.8 V core rail is generated internally.
+
+  reset-gpios:
+    description:
+      GPIO connected to the active-low RST# pin. Optional, since the board
+      may instead use an RC reset circuit.
+    maxItems: 1
+
+  interrupts:
+    description:
+      INT# pin, active low. Signals RA8875 interrupt events such as touch
+      panel, key scan, DMA, BTE and font access completion.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - display-timings
+  - vdd-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@0 {
+            compatible = "raio,ra8875";
+            reg = <0>;
+            spi-max-frequency = <16000000>;
+            vdd-supply = <&vcc_3v3>;
+            reset-gpios = <&gpio 25 GPIO_ACTIVE_LOW>;
+            interrupt-parent = <&gpio>;
+            interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+
+            display-timings {
+                native-mode = <&timing0>;
+                timing0: timing0 {
+                    clock-frequency = <25000000>;
+                    hactive = <800>;
+                    vactive = <480>;
+                    hfront-porch = <40>;
+                    hsync-len = <40>;
+                    hback-porch = <40>;
+                    vfront-porch = <10>;
+                    vsync-len = <10>;
+                    vback-porch = <20>;
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 7602034374d7..c834ad2eb582 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1411,6 +1411,8 @@ patternProperties:
     description: Radxa
   "^raidsonic,.*":
     description: RaidSonic Technology GmbH
+  "^raio,.*":
+    description: RAiO Technology Inc.
   "^ralink,.*":
     description: Mediatek/Ralink Technology Corp.
   "^ramtron,.*":
-- 
2.55.0

