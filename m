Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532F8330B3F
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311370; cv=none; b=g7qsBBl0YKC2gri0u5WG6NQafF+d3XPfg1JrhBkf60WZGKnSlPjoKA/Lltk9r/Ffi8xfmynv80D3F8aZPhO7y1Mf0gtKeDoXNAoO8NVTlEYA+Ae1vNa/6w4KvzREoatQ8K5PqNDXS4AlwvExBIhzRAiBC69pNeFMpHVZ2QTYNLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311370; c=relaxed/simple;
	bh=c0FwilGJH257Vmi4WBaFoyoKQXfgT/wqYU4kh/brsPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EsFh2FV33hDWpY7rdO6ATEZpHW1xm6PA5wh/YR/mr7ygOF9vFQPTtS+KPyZUOvg4CpsJvuFaBtcDgS5M9WuTe77YSb/j8s6FOgx2E28MUcH/4W4/G9CC6y76213oQhkFX1Pw4wRKNCldGkt3WcxtrJvAQWzfake/TbxRpDbRozU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MLIX36Kt; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLIX36Kt"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4dbcf2b85so713613a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311368; x=1789916168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z/z4QNBtUdI4E15ZNXPZtkbjaHvGmUhKoMr+O5uGaIE=;
        b=MLIX36KtvIrguZxHl4EIN4ZYIT5d/rtKSSQDUPsisRKi+NQnTebcXHH+K3HunAlv7a
         2bocY7STE+TrXzmT2T7v09GLH2t5A7O3YPZ9c/dBr3oZlmKcArlNJn+BnUp71k1nH46y
         7ur6zghuzwFXN/uHcYKeny6LR/AbP53U+fLtEa2ZBnqZCCiTEhTm8+HwVv3rJykr2caW
         cgDq/DfNdwaOcPjlGbMZXm5/XeTV/7yWJGbESGuk7hT4E0bQzE0VyTPzyB0nJz6yo6nc
         qWJ9FRlH6xnDT+B8Vxg9woD3B7bNxp4JVoJqvTqCu22YYAPL+ui++kZPfv9LWQDyqQFg
         aBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311368; x=1789916168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z/z4QNBtUdI4E15ZNXPZtkbjaHvGmUhKoMr+O5uGaIE=;
        b=rQd8JkMZDwmNi6BHQJ3YG1W0t++yw1LgftqIO6rfSNwr3OnWV3EGl5+U9/kGeUVFJD
         Z5eF/qx0slc68smnCXiyDgK6zUxNtyi7LgNfxGEwpaOvrAU4bTPi9qwnj826Zm0N10dF
         MvRVq8MU6czT22fLkK7+g/3XlDrs9s4u4PAx24Y88Pai8NPONGQmZaI3gF+7Jf45Af2H
         fnD7ugBMjoGGYcxnc+u/eMbqyoX3bYUsn0ukPsXIKbGMQ0ABbFl4hNZPZSMX/ui4RCqQ
         8+JXc849pMWpVhjwDqvFdMfcXQA4Xk37r3xFEmskDUjRBRA4SCz3ohFuk8fgHJnlo+G2
         o8Pw==
X-Forwarded-Encrypted: i=1; AKwUvByzY+WT/CZs0cces40pA9NVlEqsF6GASELXgClSuiviwPvbdidZTve1DmsAekt1Tw0YUonzJgNPG2eJdaM=@vger.kernel.org
X-Gm-Message-State: AFuF++nbyKCJm5ZxwGqTktP9xaduSmkayevjpmngwLx6VufuWcwr8Xhx
	iOAiKeo4Q0o/dPx5OobL6LzPoQN/ngrZmzVCTGN+9rVfowHS+q0b4UJt
X-Gm-Gg: AYBFou2E4xunsbTrlQpADjFLq5uzrpx7o1Icv6rg0Sd8DlFuxwPDLQiZxp8R8p2odIK
	y/DjM4eEoP5m09FEG4TAKpCA1S63JIHRO++cyRICV0KIx94vXOEVcfOB1sHI1PhBID6f8459Fhk
	kX1OvoLexKIzDA9AL7qisUjO7K7qY76aXNeig9xYkHPqJ3GpDNc34GiB485ls3AZkiZkkc0oAFr
	2UkZdBAkuzodHq+7phBnWaDIZnouMwGYTbg3YUVqWHTVfU8RdwSxiahQGBSGEZcaPqPApoVr9tp
	doNtuIZfRKFTSXEmBQ+yYWYumvwX7NISlVOSNTtmd0cDEkJdyHKzrsTv1CxRqS2VHoDbLu02orx
	UmRHCO36tnF85wUxgsP11XqhQuedbt2ibg1F5AHu8v/yC8jsQswJRB0zcKWNZvIuKWwgSrmm2Rd
	LlejtCoDOLs9R7F/ufNswGLx4yuz2Yv6e+C3Nq/CUUUhQL+J3J14gXHpYOAFX3IzOQ
X-Received: by 2002:a05:6a21:46c5:b0:3d1:60d3:99f8 with SMTP id adf61e73a8af0-3daed46ad42mr25849990637.5.1789311368455;
        Sun, 13 Sep 2026 07:56:08 -0700 (PDT)
Received: from archlinux ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba7a9bb56sm21467366eec.31.2026.09.13.07.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:56:08 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v6 1/5] dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
Date: Sun, 13 Sep 2026 22:55:23 +0800
Message-ID: <20260913145527.18148-2-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913145527.18148-1-iuncuim@gmail.com>
References: <20260913145527.18148-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

Add dt-bindings description of the thermal sensors in the A523 processor.

The calibration data for both thermal controllers (THS0, THS1) is split
across two nvmem cells at different offsets, requiring the two cells
to be read and merged. To maintain backward compatibility, the name of
the old cell remains "calibration" and the new cell is named
"calibration-second-part".

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 .../thermal/allwinner,sun8i-a83t-ths.yaml     | 34 +++++++++++++++++--
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
index 3e61689f6..792081af5 100644
--- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
+++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
@@ -24,6 +24,8 @@ properties:
       - allwinner,sun50i-h5-ths
       - allwinner,sun50i-h6-ths
       - allwinner,sun50i-h616-ths
+      - allwinner,sun55i-a523-ths0
+      - allwinner,sun55i-a523-ths1
 
   clocks:
     minItems: 1
@@ -47,11 +49,16 @@ properties:
     maxItems: 1
 
   nvmem-cells:
-    maxItems: 1
-    description: Calibration data for thermal sensors
+    minItems: 1
+    items:
+      - description: Calibration data for thermal sensors
+      - description: Additional cell in case of separate calibration data
 
   nvmem-cell-names:
-    const: calibration
+    minItems: 1
+    items:
+      - const: calibration
+      - const: calibration-second-part
 
   allwinner,sram:
     maxItems: 1
@@ -107,6 +114,7 @@ allOf:
             enum:
               - allwinner,sun8i-h3-ths
               - allwinner,sun20i-d1-ths
+              - allwinner,sun55i-a523-ths0
 
     then:
       properties:
@@ -132,6 +140,26 @@ allOf:
         - clock-names
         - resets
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun55i-a523-ths0
+              - allwinner,sun55i-a523-ths1
+    then:
+      properties:
+        nvmem-cells:
+          minItems: 2
+        nvmem-cell-names:
+          minItems: 2
+    else:
+      properties:
+        nvmem-cells:
+          maxItems: 1
+        nvmem-cell-names:
+          maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.55.0

