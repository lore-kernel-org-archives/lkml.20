Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793350163;
	b=wQ0V9WAL09Tai+BQAH440ziWaA+ABDveA+aotk15xVKPx9uC6izjYm4kaXY5VNDVLrvL
	 zpYXNlsJmrqWPi4jmDobR+/NLTtxBeMJmqDdAnRnSFI9LR+Ir/xmNRhvWAzQgU9F9NzsI
	 b3vPqolFyNmbnn8havwr/7rhM15aF/rD43jkvNUr2SjmDK3Vk3l+i0K9ZAPWgH/NcjeY9
	 gA5ArMd9ceDgXoLFpAFnXznQSXcPgRZMaOUUuI0vI5rhv5/59w3pNbHjdeCzUo6DQcIJP
	 Ka9v0XE1ucl/5Rh1Fu7UMF4MzN+Nuvv8TAR2ZohZ3uWyL8wOZ6TBhTThycdjhC9zbHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793350163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HW7rHhE169McYx8Jxy2QMfjdkASLa9iCRSpVlpE36RA=;
	b=uISdQGJu6xXXGGdton0F4kRZZG/S1tCB+DXd8GC0YIi4brN0kMLBD9WhuPvARG2v6Cnr
	 ORRwvGc56IaqckXfzfg2w+HHLlOFPLqU+hBTE7jqOZqtNHev9s6PiEhRUJUsnmQ2UrYAs
	 kCKSTdXjg5d/qF1YVsK2aAqD9f+rvWjnRGGQfYev/3bunLMSk9QXk1PKXsbnCPxiRQ2/v
	 IJfDc5pMdB7mZi9nCDqjcmB5BZJp4QZpvRAoL0yhgJ6F4oeawh+Qbl5UktBKsn3vhW2VZ
	 MyLxbic89hgcMPbowSiZS+IEahmMjzsSpaS+xhb7hUWcvcMdaPe9NCgbJxd4ZyKTXMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="yqr/MHOZ";
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F53606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2F53606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yqr/MHOZ
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdac52511b3so26719a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793350162; x=1793954962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HW7rHhE169McYx8Jxy2QMfjdkASLa9iCRSpVlpE36RA=;
        b=yqr/MHOZU635Qm43tBKG3XBAy4SyvoymZaW0doJ8A16nYDbyUsLqXv9E49rtF4XfWe
         Ex0Av0Xyo7G5aNd/3m40mrP3mgQjFJKYbQOND4IO2juEQqLlzNqaRekJsqtYzwa61CWb
         rtWIY4wdYRqVv8hgfdlTkxFIIawT/tkSyvlkNMsJoCbCEUDA+YT+NqcZBv1mGFFCQQh6
         VN9R5JO3AbHkH712GiIoTRcgZQtS0uFCVPdBOPaJOpsgZJoPyIB7peL3k4GCuK7zwXC3
         Qk2IdL0jFfBNWwILUV8sp/PcI9kSwz/gpW1Lbq58yJgm/Qv51qdsidZGyRAu4f2Tdjwl
         O0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793350162; x=1793954962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HW7rHhE169McYx8Jxy2QMfjdkASLa9iCRSpVlpE36RA=;
        b=huKlWsqnXgCCyIxHF7lzRwiQBKq7t7RMfdfNyux3Q7EJ3nI83e+xmLRUJt1paQuVJv
         G64nQk4vn1RMnv0Xg2F2H4AL42fF8lm8bWzmafc/cdusL6yfox4lo/qGAvvV5bUmX+iH
         QPDB1tFxVyk6e6Uo5OO2nulv38XP4lqGPUs4RGR4X6budAc7yvTZr4/3dbdMOmbg0nwF
         2m87UILOuJS4m8cBIXQMnbSR0q0Ar0JVWpUGxth/d9Jm3pp0GDmJT4rYnL9vMBjFL37b
         chtnF8P9ATm8MMgnvnLj2ZT4SpMAPibV6IiGsAsbaFm0KR1WEQXq3ZwwbZZEzFIFFOMc
         h+JQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgofACOnpJ/1EyKLoWwlE+z2muOf+7ag5gQMI0eEdNJVtUugZu1IGM67RimDtBAFJgJraRV4edqmX05eA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYBF5E4IQi1nWVZn9QHnZL0aLFrGq8vCZx/IMXXWaAZt6tR3ky
	AWy0TT57slxciAgXGMCGNpo4TJD9KLKXTtj7k8GzYwrn8f0nRglQAufq
X-Gm-Gg: AYBFou0w6S8Chx10YKL5JreVrxMtOPa9N6MokryvIpYc4D2Csq8O4aT39F1eDCIxclw
	Cd2VcsnY5KSxWqsZ029RLKcsFf6duXo0+/vC03/8Cp/HcSj+N08IgbRMo+QKmZmH/39EYjWQlaR
	HgwliFGugIqIxpzibmF/4KgK8NmReBSyP5hFgelwUivVUrwhr3LKdaVQClp5hwebV1zQOj15L65
	ZhNwupRQKp1AatA5Q/HUUR3fbEpuTfkB5pCqMSI1k3M7+eUOw7dUraTI6HSr/vR2PaNU5ANjL0a
	a0vidC9hnxiSrrOjduQF0uB+Q2Kib/9RdiyEsT9Z2JxqQs3xtMX/XYOR9JKrzFQj8e7HOaAvLHT
	rf9/IxTQKSDEbih/GNM9dGY7tvmVGiGCH6B5+HHoq8/LRuF/kWsJu/LQ1u9/ttNaOrdJFPf/2ET
	DX909trRHgEd/rUKIily9eledLxdFuQVNkg1uoEDmd9B0e2CSHHVs7pPxziGDN/+oOSnvqg+F2/
	rmvle/O3au20EI8vZy9kR+wsOLr/OasnLweNMqSRdpx23tofRrw3Ikok+VBxhsyxgU3UCmerr3i
	M+vpnU95CxKVZEtiDHu47Q==
X-Received: by 2002:a17:90b:28c7:b0:3a7:fef3:8561 with SMTP id 98e67ed59e1d1-3ae89822b55mr2355088a91.5.1793350162228;
        Fri, 30 Oct 2026 01:49:22 -0700 (PDT)
Received: from marchy ([211.24.73.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845ae5b9sm3229716a91.12.2026.10.30.01.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:49:21 -0700 (PDT)
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
Subject: [PATCH v5 1/2] dt-bindings: display: panel: Add RAiO RA8875 display controller
Date: Fri, 30 Oct 2026 16:37:35 +0800
Message-ID: <20261030083737.47188-2-azuddinadam@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030083737.47188-1-azuddinadam@gmail.com>
References: <20261030083737.47188-1-azuddinadam@gmail.com>
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

Assisted-by: LLM
Signed-off-by: Adam Azuddin <azuddinadam@gmail.com>
---
 .../bindings/display/panel/raio,ra8875.yaml   | 87 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml b/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
new file mode 100644
index 000000000000..661398bda0ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
@@ -0,0 +1,87 @@
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
+      panel, key scan, DMA, BTE and font access completion. Optional, since
+      the host can poll the interrupt status register instead.
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
index ba2002969373..99d5113fb035 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1395,6 +1395,8 @@ patternProperties:
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

