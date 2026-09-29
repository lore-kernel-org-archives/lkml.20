Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BE1503904
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685777; cv=none; b=azU4+F15xAJh0729EvCzGA5XluS1gLfz4CjuNWci6MbYRLIlEsqvhRQTWq6YvDSsdjOGU3OKBHKhIBTKXBL78se7vkqQhruXQbFsND5Pzzr7c79vQQN+4F0bA0Zt8aj+vr2XLM/RP7YVcx8PrDgyOCGRT8gnpat4+HkBTso15yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685777; c=relaxed/simple;
	bh=6Sy6vgSYukgx1flhb82E53r8hjS6KeohuIzJbCR1Vj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IiegvZvzuC/E2/CDZKX4s5Ib+qit+hOizBJXvGwauTLYta42FQEnglpUE8jR7pAQ/VF6owoMvTm+huexYS6HfunqIzmlpbvNtXYUyjRBTPKPD/efRU9xGR1DdKPu8ekJ1Rx7JhVlsG1zM5ir2v6WCd5R2R90Bp+7g/d6MMBy9gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RM7nQ0Ky; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RM7nQ0Ky"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso44154455e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790685773; x=1791290573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4J1veNvmysC8QT8osypByF4KUi97wR8R1soWK43MPcE=;
        b=RM7nQ0Kyd/I8SjIqCOnMNn+bgE2V+19fWDEl1TZSO87meezXkSFYLMXb6IWucAX/XB
         y9mS6G2sjZ0oK/JJNsNr1httHAZjCRB4/nwvAmVlNI3frS0daLpMuCvf+dQgCDFCXtRk
         9O3NBLdZ3xABQSRfehSFdc3rf/Ha5HJayHWSTDb8YqmrX1UDlxVqsgiiOKT66Ne8kkO2
         oN4OfjAK0uuFGcFABnt55O77bKbZFGv7xjj8kpZvuxjAQZyXGVY4cOAYBDCrmAIjeZ+4
         jgFnzrQTa4RyxhvGKL7Lppn5mYktO8hcy1AHX+IRMbG6cqC2VVWa/52LhrMUkUeKp38N
         PGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790685773; x=1791290573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4J1veNvmysC8QT8osypByF4KUi97wR8R1soWK43MPcE=;
        b=Hno9Z+uVsbIwdNrLrz5+doCd5Gg7Qfvp/VrLur1z2zWETFeDAiFJjtZgE6FhmH7636
         BnimZNDmMjSvgmZLDh9hI2xSyxcr/sabbWYYY8THO4QwZDJWdWVFm5kCSqO1KbATMSeg
         H0EujWhS5Ftr3jKtZkgbZblzLSyF8eOtlowH/vmxi1VU4GfvHqTCRjfzNr9hvQV8Tayz
         DvpR2FaXImqACTbI9HOGvUwOxycs4hke1okrjCMm2qUV5et0UnISaj2RlBVejzKL6XdB
         YXg7aBtTdEljQcc+aDiU5vRP+8SXeYWB4xltDRN0+XFyUwD5X+oYSqRusDgez+mUwx0S
         jwcw==
X-Forwarded-Encrypted: i=1; AKwUvBx9aW3vEm6dLp9cg7mDmOSr+LJhXkaOqb7mkojtkZo5Mtxwg9EHueuY41ythrkSG/MjK3LIytkXWreZ6xg=@vger.kernel.org
X-Gm-Message-State: AFuF++mlaHzMW6TZIIAI+vtG7OaMGqacHJaGgPfrMCPIZOIgpF0v71Iw
	0u8vFs1gCRrL+XztatBkTB7gsJ9OGG6kLgfwsn0irKLvC6ppHHFsOTd4inZB0rZN
X-Gm-Gg: AYBFou2ctxGspeUx+c9VkqKm+yst0xP0j4K5wgbD0vJ8IoZEJ8bFoomNZc9KtBjyCWY
	191zewrd+BrZMGQa9J1s9cgButlv7A16MWOsf2amEMCLW/hTxAuOGT+iv+w9OgG6xoXfnqVNzYx
	s/YcjEpo08poz7YFJ+tah3c2nMEVYyrMp+gBwuJ2pPLmcrC17RIBp7N8U+Sgz5RbVu303fOQUIu
	vVFmFedhz5CRzphDxZDCE5CpMkFaLib6itQyrymLTbfoqPGHmhhqy4FhSDfBWDFvZv+E0E7Nnwm
	kaS97A/MXuRertqUh3rWXgGFLnZzL9xyv6wG/W38MjEL28I7z0ySHhsy75DslAHT+Y1F50HpU/r
	MJSMXoaqRQniQE6DsWvvnZG1OByW3reFuNIqD6q59bECvUDNtdc5AXqhAcTjXlrVEtErsIt349I
	cvtcp3ZKnF2gFoL43dun9czUOBcumnXDsloVIOJb67WRsiUsTzbuoE5bW8l27Klkf7Vj78JRfNU
	JNKLQVFhjNRicvBrtgc+rhlLiyB74XdgizUwg+/b+bn1Dt8UMTjpr5nVkL9goIH8iU911nQxs68
	yPZwR/daudNLgDLbHA==
X-Received: by 2002:a05:600c:19d1:b0:49c:d818:8764 with SMTP id 5b1f17b1804b1-49fe7b62c5bmr277276605e9.11.1790685773162;
        Tue, 29 Sep 2026 05:42:53 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af502da06sm4436630f8f.11.2026.09.29.05.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:42:52 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-iio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/8] dt-bindings: iio: adc: renesas,r9a09g077-adc: Add RZ/V2H(P) and RZ/V2N support
Date: Tue, 29 Sep 2026 13:42:41 +0100
Message-ID: <20260929124248.237032-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Extend the ADC binding for the RZ/V2H(P) and RZ/V2N SoCs to describe the
ADC variant used by these SoCs and its differences from RZ/T2H.

The RZ/V2H(P) ADC provides 8 channels, has a fixed conversion time of
20 ADCLK cycles, does not support calibration, and supports selectable
12-bit and 8-bit conversion resolution.

Add RZ/V2N with RZ/V2H(P) as its fallback compatible, as the ADC IP is
identical between the two SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../iio/adc/renesas,r9a09g077-adc.yaml        | 38 +++++++++++++++++--
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml b/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml
index 5b496729022e..a0fed2f31370 100644
--- a/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml
@@ -18,10 +18,14 @@ description: |
 properties:
   compatible:
     oneOf:
+      - enum:
+          - renesas,r9a09g057-adc # RZ/V2H(P)
+          - renesas,r9a09g077-adc # RZ/T2H
       - items:
-          - const: renesas,r9a09g087-adc # RZ/N2H
-          - const: renesas,r9a09g077-adc # RZ/T2H
+          - const: renesas,r9a09g056-adc # RZ/V2N
+          - const: renesas,r9a09g057-adc # RZ/V2H(P)
       - items:
+          - const: renesas,r9a09g087-adc # RZ/N2H
           - const: renesas,r9a09g077-adc # RZ/T2H
 
   reg:
@@ -55,19 +59,22 @@ properties:
 
   dmas:
     minItems: 1
-    maxItems: 3
+    maxItems: 5
     description:
       Must contain a list of references to DMA RX specifiers.
 
   dma-names:
     minItems: 1
-    maxItems: 3
+    maxItems: 5
     items:
       const: rx
 
   power-domains:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
   '#address-cells':
     const: 1
 
@@ -101,6 +108,29 @@ required:
   - clock-names
   - power-domains
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g057-adc
+    then:
+      required:
+        - resets
+      patternProperties:
+        "^channel@[8-f]$": false
+        "^channel@[0-7]$":
+          properties:
+            reg:
+              maximum: 7
+    else:
+      properties:
+        dmas:
+          maxItems: 3
+        dma-names:
+          maxItems: 3
+        resets: false
+
 additionalProperties: false
 
 examples:
-- 
2.55.0

