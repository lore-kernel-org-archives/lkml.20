Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794202151;
	b=UyVyKY2BbSQw1/NDWZHPWsbDSFKPfMnwTCUHHVZNwHZm3w911gyvi3m41kcJBM32QX18
	 pyuKnFFtn85m6eTZoXcEly6ZAPpgPxu3saDKM0+B+8Mpr/MudJYrRUE/KHNgBhToKymSh
	 bsD/q7F0LkHVpnk8bEHuvRgSHDT/gQHr149Nd0Bof9XTi3EXgvuplsMhcKjfsk3ONWzFj
	 m7Bk7MdWbJyNuRxdWv8khF/Ifhyh2pGswknk2JL1EvKdCenQV2xGQazH4k0iSArlpLTxB
	 jeLvKdJjJXCZ15aCKEmKgORRI+nkrneZDFnsCz0q8gDLzndfATqnN+v2ka79sjMgddQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+2wCtwxXKIDkxHcE0WIbk0DNcnVd4qsfVLWBnePcPdM=;
	b=RSLaoe6DYKWW6Yn6wNtHwfXcVc+7MQSGqpZOviS8ktz6G9arMm+Hq341EhQja4ByiZ7f
	 BpGf/6ytm16t3cXAwhzU3ndmenwVw5LmN5xybyud3GNM0k0cueuytMERgG9Z08DZZsKlU
	 ZbN0G2XunygYc4hwdBg/UGNyLXiCTt/7fGOkO8gl3gFyo2quG4D90+ToBnsj7s0Hd90Ut
	 +MB8agcYH+KUp3tR2eecnM2onBcZrC7kuiZ3r3rwHwjOaPDwHgMQX1bR9jsaIvzDTyQ4+
	 u2+5xovv1Jmnv4w3vge5/BY4YQDnFo284+DFzXW/b4lehHrJGHudDuxX8EDbpBtAc5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LX/HvpaV";
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A34606A331
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2A34606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LX/HvpaV
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a594d313a3so244506b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794202150; x=1794806950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2wCtwxXKIDkxHcE0WIbk0DNcnVd4qsfVLWBnePcPdM=;
        b=LX/HvpaVQDBWsfT2+0kqohS3rHoUvbJMJyHIyGTYM75vhqzY44mOOPLBOQOMGmRZMc
         fdSEenpF6UfrQx6rMyoOVZ4GED/c28nfS4NqAjp3hbg2HovMPvtZjFz89gtZh148mf3q
         3LbDIHsqHCVgGuemSPtTR4l/uaQUQKEtq0wP7k9NeoNPGOGNlwoBDFEE7xuLGjbXZihb
         IOewJOuL/zQ4bPoCjl4ncxrMrrKtn+izP4xIzIMs7bhPHeTn3ke2Ilc7N+d8OB6zPb2v
         G/+1KoKBborVG/JHGQzrZDgAmhdxsS5R/i6Bv7+cuGec4aS6QcdutHHFAz/GUUpNrum/
         9mjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794202150; x=1794806950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+2wCtwxXKIDkxHcE0WIbk0DNcnVd4qsfVLWBnePcPdM=;
        b=dRnDNHGTmGJbWfUpHy2b5SSe2j/rXFWCDl2s3x5E2R08sJZuGEEwU2GItnTTqsGuCF
         vAwxPzVfok9cAcWOXsoFdR6wt+NxkSCX9eh7DGSegO6l/41pj9yfEdheifEdOG8Qm1M4
         wCwiHBUhEXY1HzeY0GVVQXt8NDWTPdFedUlywUceWTFVAWOqn+dukcsE8ghW4W/mVmcG
         ZIfu3UkPc/f9fgXbOrhNhqdDWQLP3fjRD0hmyLNamQ9kEZYYcUt6HZiwz70JGuJg+nrA
         I2QQ1ZTu0oK+FKJGL1YWjNnOWxiDst+UX7vm1+Kj8gPH2sAMxTr2jGn9BiII/uzJrJQV
         +7eQ==
X-Forwarded-Encrypted: i=1; AL+hErGX/hfavPN/7rpmsP9jHCHTAYqN8Lt9XN1rLwbT196G+wPVl34AWg+AaZ1ld98c0cObLTa64EeWNFbO/Ic=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OnltfX39oPgNX8Gvl2JruzSOTfncW0qaZGKuhKeojzsi50yr/
	V/441zdcoumxIsovFmKkWNWHzXjmc44z8tW729CnNFR/eFr1R60s1vQ5
X-Gm-Gg: AYBFou0weFazXO5bFsIdgUt1xGBm5/7qJb9hacJlbqkFG8FfrcUBYf9ye3yv3HuI7LY
	hs5LpR0vBm3j4CTT12N3Cn3zbnUh5R99GZVwdotnjOvhh1RBu6Jchai067a2hqgLkgDPvZ02D79
	6lcfYW2ualDCefAnmbfgx7f6a5/1OFV/OFCmY1kCNyV14dhQwXjVCQ3bYpaA/B0jCgEAkxl3gB7
	1Fl86DaQP4z3sxOTUCFDshWkZ4mO9my4SJX1QZ+pWRp3WqEIbQJ1NUI+cV2xQzLp2CtHkYYbve1
	tTet2W5KskRXC86lQ9veouVbyX6C1NLLuK3H9HS9Rqo1gFhnb3pw6OHZwNZzKq4XXAhVdvCsHkI
	gmadS76snL1xMzGZ4SeCptU5ck98WNPdU3AvZhT68PPkj+qgdOGh+4gEpO8gOqM2NGZlT5FB8sz
	Sf5R3ODv7XCyXZVZ0syXtYGhmgZVqiyZD+8NYMqt6zJOkjhehTnqgzQez1wEq4lm4wTlYzZQaSw
	ZGWdejQKEueIRumPL80ATbXmanfKaPYR6IuKu3aMNxcXJgQM1qpUy4BI9klyVOqLS0qfklrK5Bb
	XM92p/sbTIQ+OTU1qYT+anIhZ5GKzpUlQ5GZH+RGQbXX16ZKHvttEvU0T4Sry+yoE+lBI2ja5qY
	lI40W5R/pR/cuFwM=
X-Received: by 2002:a05:6a20:ef1a:b0:3e5:904c:78d3 with SMTP id adf61e73a8af0-3eed5ce2668mr2545295637.69.1794202149963;
        Sun, 08 Nov 2026 21:29:09 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb9681385fsm1180899a12.6.2026.11.08.21.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:29:09 -0800 (PST)
From: Shan-Chun Hung <shanchun1218@gmail.com>
To: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Shan-Chun Hung <shanchun1218@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: dma: nuvoton,ma35d1-pdma: Document MA35D1 PDMA controller
Date: Mon,  9 Nov 2026 13:28:59 +0800
Message-Id: <20261109052900.2960473-2-shanchun1218@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261109052900.2960473-1-shanchun1218@gmail.com>
References: <20261109052900.2960473-1-shanchun1218@gmail.com>
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

Add binding for Nuvoton MA35D1 PDMA controller.

Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>
---
 .../bindings/dma/nuvoton,ma35d1-pdma.yaml     | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml

diff --git a/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
new file mode 100644
index 000000000000..d05971662a5d
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/nuvoton,ma35d1-pdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 PDMA controller
+
+description:
+  The MA35D1 SoC has four Peripheral DMA (PDMA) controllers. Each controller
+  has 10 channels and performs memory-to-memory, memory-to-peripheral and
+  peripheral-to-memory transfers.
+
+maintainers:
+  - Shan-Chun Hung <shanchun1218@gmail.com>
+
+allOf:
+  - $ref: dma-controller.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-pdma
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  "#dma-cells":
+    const: 2
+    description:
+      The first cell is the PDMA channel number. The second cell is the
+      peripheral request source number, as listed in the reference manual.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - "#dma-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dma-controller@40080000 {
+            compatible = "nuvoton,ma35d1-pdma";
+            reg = <0x0 0x40080000 0x0 0x2000>;
+            interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk PDMA0_GATE>;
+            resets = <&sys MA35D1_RESET_PDMA0>;
+            #dma-cells = <2>;
+        };
+    };
+
+...
-- 
2.25.1

