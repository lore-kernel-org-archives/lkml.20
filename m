Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783523;
	b=27owB41R3zGPdw17TGOHEUgqLjdBTLvyzLXbn7ERPuoEXg7RW/AJ2VFsartNiVM5XHSk
	 iUqCfRdDyMs+3kWbl7eLlmh0JqXGVglFq9fExL2px1pKMzgeP9mZo0bh3mxNdbwlPzZ0T
	 OxbqRUl9QRQpqIJmdA6VECqActK8858MacLAEzFHjAXGfeUMaDxaDHLlp7ORBfaWiZEy9
	 jGMkVvjk9XcAo3s16Ar5hSMmV2BK1Z7Clsq6/wunPe3Syd5BD6VoiIXbOdYBqhb1IdGfF
	 Z2+QHRl/JAPTNmaC7OSEvDS791fiCpdgf9SQeh59tFttsv1Eh1Ht3R2VQJ+BnTmLY/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZRQErjs2YgeDf8s5xj884w9gADjkocnjTDloPkEx5rw=;
	b=5TcAq0SqYGxCPjQ9T37aqFmX933qCu7EMjw7vJbfwxRpSUsaOS7pOr2gIekC0fROkwBy
	 l7jqlyQqHiU+TThODv1O7bZgBMjdAWTTrmjnj9c8Y1icvwQwIf6GEVr2ht11HzJI54FVd
	 zv6VpqjGwRHf2ZD3RSev6oO+zor69MCfJ0A3nO9U7bZwYuVJUa24u7m3YVgvy7qIK3ApH
	 Sc0qhISv+OaHUseuGkqM5EJtBO2zYsPzlbmr3QdCU0zKvhs0nA1+7w2Xu8qro4pYIUIVC
	 q8JfMYSCnJq+L+lcEdjoCHAZ7Xyf9gVJ+ci0vKiL7I0ZtfoCOFbT6tC8fKhyrTz0haQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NPx0TTzM;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF7F606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DF7F606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NPx0TTzM
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ad787b79ffso367052a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793783523; x=1794388323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZRQErjs2YgeDf8s5xj884w9gADjkocnjTDloPkEx5rw=;
        b=NPx0TTzME4v9IhTPB7tIMVNxniMALp6xCidYN5AwnJycBTkqqFjJZOyibn/MMvqNMe
         9VLCc6txK/ECFU3RWxPwWWAAuhbvZ6GJbDM0DCKSLiFpPwZ2xyji6n7epw9h6qF9jYif
         0p3UYCqYy1pvFwmicFXGl20fLdsMJl3BQ8ZJDZvIsASOzvaf/eZCeujx2ShvvRPh/5uC
         7NmKz8ZzowyVPkt3Os1YUKW9VhCxZpaVHHtr2IK+4nAbRyboE0UmswCsG0b3sMyY1Gvd
         Gf3JTPAQb1GpwnxMbzOCAdeoWNnXJq7p2YOL9+TKpvdN1/NxG9Q2hFDi0ZY5iqm9eDy/
         QQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783523; x=1794388323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZRQErjs2YgeDf8s5xj884w9gADjkocnjTDloPkEx5rw=;
        b=0Cf6Xt22kZ9KY05ywYsIZsh7ds9OWfyP2VoOSS6qLkDyFSrsyK7yIGdSETL3F3w1wp
         d4L9Fy/eekyKEe2PgrpvaewHIgw+G7b07mr+V0qJjG0GSzSyshxAYPtAh7qL47DNugcI
         fjeKMoB2+IrTm+MQID6WNpa+YpESc8flFTejoAT7zZ68IBYPB82u6mBOvmBxSfK8H3F5
         iiJlEDP6GdRhkx21t2FTIbpvNe7L7CsNW7mKgUhwDYNLoxXe+gK25UUUF+k9AZIzOGg0
         juKW7qVkOKi+4hXNpHOFj5YVOb+WTqj/lk/xNKN1HM7H4UO+ZFUNi6nSro9Nk7sU7Wq4
         tbmQ==
X-Forwarded-Encrypted: i=1; AKwUvByXu5WcyMEOGAb7RWNe/7oARSMt1hMy13ybSmQkOFayuyZi91FeDjbJ8MFcLhZzOBR+Ib+fZsGIUCBi6uw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/klyMP3r6qjGBueyQRqIgeEPhhQkGgAlm+Mb2IXllQ7MM9LGma
	sfUQj/BkPjNQsqc4pfcmS3N4KZtlIyXtcjf2K8nMlHpU3PbgUUgB8AFp
X-Gm-Gg: AYBFou0aeUCWhqzTkVrKRsXE9RsgEAlLoQfXWtKyZaUIN/BagaxXpAw082cBW3ve1KD
	ELrTI7RDJyR53tzj+75kSBJ/MclSDPOc7+/njEgt5WDvpFMsr85lkpXqZRb7vcD2cXxjNhZ2wI1
	N0gJmBqkaaxaKGrwyg/X/tQpRpaMwgp85vraa1F5Jp6lqwz6ASTUinrm9Hv84AU3p/RLGjvX4q4
	K0kOlDKxWDFBfWG2aaoVQ4Z4UDl8+g45AWRpP0q8nOzojWspMyr8k4pcANu6m9mYil6o90gB7w6
	JcVj03UXv2vt9xYloqwv5ma7izW1mGYocYHCsmJgTPNNlft15VTZpbApvBahtq4ep5f9oX1Z0Xr
	7pKr6fwX+nbZr8CUKFNBCBmrQfefULQKKYF8nTL88x0yVxgncPxW/dg3YZ2FtVIYiN9/A0eEHji
	i3NYdaaVovY0OaD0y0X0wjSdxt3FAGGh7VbuW9svk4s/7/V8pWtl9YA2oNCCgCt1sGhqu2kmL1Q
	hviskynaZmr33UgwjSPdfN27ALAysSwiqACvmVL3RdEjHNIqJvmQVwBKHCPvVmYaiSKKYD6BCsJ
	e6QbSXwEWi4RK5kTVoNN2RyHO/YJxWl1kUkjIpuLtetmQuUc/d8qg9XC4GckHE5dEnEW2nmtOjd
	hoqNjAwtvxXXYFvE=
X-Received: by 2002:a17:90b:33cb:b0:3a0:ace4:d2b4 with SMTP id 98e67ed59e1d1-3ae8973643cmr10988729a91.23.1793783522643;
        Wed, 04 Nov 2026 01:12:02 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b09369c638sm3167257a91.0.2026.11.04.01.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:12:02 -0800 (PST)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v4 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
Date: Wed,  4 Nov 2026 17:11:35 +0800
Message-Id: <20261104091136.151269-2-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261104091136.151269-1-cwweng.linux@gmail.com>
References: <20261104091136.151269-1-cwweng.linux@gmail.com>
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

Add a binding for the Enhanced Analog-to-Digital Converter found on
Nuvoton MA35D1 SoCs.

The controller has eight external analog inputs. They can be used as
single-ended inputs or as the four fixed differential pairs 0-4, 1-5,
2-6 and 3-7.

Use the common ADC channel properties to describe the physical input
independently of the logical channel index.

Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 .../bindings/iio/adc/nuvoton,ma35d1-eadc.yaml | 163 ++++++++++++++++++
 1 file changed, 163 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
new file mode 100644
index 000000000000..85b0feac0236
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
@@ -0,0 +1,163 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/nuvoton,ma35d1-eadc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 Enhanced Analog-to-Digital Converter
+
+maintainers:
+  - Chi-Wen Weng <cwweng@nuvoton.com>
+
+description: |
+  The Nuvoton MA35D1 Enhanced Analog-to-Digital Converter (EADC) is a
+  12-bit successive approximation converter with eight external analog
+  inputs and one internally connected VBAT input.
+
+  The external inputs can be used as eight single-ended channels or as
+  four fixed differential pairs: 0-4, 1-5, 2-6 and 3-7. The internally
+  connected VBAT input is not described by a channel child node.
+
+  The controller provides four interrupt outputs, ADINT0 through ADINT3.
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-eadc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: ADINT0
+      - description: ADINT1
+      - description: ADINT2
+      - description: ADINT3
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  vref-supply:
+    description:
+      Optional external reference voltage connected to the VREF pin. If this
+      supply is absent, the controller uses its internal 1.6 V reference.
+
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    const: rx
+
+  '#io-channel-cells':
+    const: 1
+    description:
+      The cell selects the logical EADC channel identified by the reg value
+      of the corresponding channel child node.
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^channel@[0-7]$':
+    type: object
+    $ref: /schemas/iio/adc/adc.yaml#
+    description: |
+      External EADC channel description. The reg property identifies the
+      logical IIO channel index.
+
+      A single-ended channel may use single-channel to select an external
+      analog input independently of reg. If single-channel and diff-channels
+      are both absent, the external analog input is selected by reg.
+
+      A differential channel uses diff-channels to select one of the fixed
+      hardware input pairs: 0-4, 1-5, 2-6 or 3-7. Each single-ended input
+      and each differential input pair may be described at most once.
+
+    properties:
+      reg:
+        maximum: 7
+
+      single-channel:
+        maximum: 7
+
+      diff-channels:
+        oneOf:
+          - items:
+              - const: 0
+              - const: 4
+          - items:
+              - const: 1
+              - const: 5
+          - items:
+              - const: 2
+              - const: 6
+          - items:
+              - const: 3
+              - const: 7
+
+    allOf:
+      - not:
+          required:
+            - single-channel
+            - diff-channels
+
+    required:
+      - reg
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - '#io-channel-cells'
+  - '#address-cells'
+  - '#size-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        adc@40430000 {
+            compatible = "nuvoton,ma35d1-eadc";
+            reg = <0x0 0x40430000 0x0 0x10000>;
+            interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk EADC_GATE>;
+            resets = <&sys MA35D1_RESET_EADC0>;
+
+            #io-channel-cells = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            channel@0 {
+                reg = <0>;
+                single-channel = <2>;
+            };
+
+            channel@1 {
+                reg = <1>;
+                diff-channels = <0 4>;
+            };
+        };
+    };
+
+...
-- 
2.25.1

