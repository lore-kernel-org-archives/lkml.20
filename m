Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579955;
	b=lO+OIePTHQCQ+JMeYqZhF21RXcnPG8w1VnABxB/RW2Qn0O+a+vWRxN6LHQdyq2PFHK2h
	 nBOHohWuDFoCx0rss3BhpysQ1jM+Gnm4vToOdmJzFJSII3KG4JrqJLKbCDRShcaREqPSP
	 v8anHMmoD+n2wDuwzl2IiZUIxVzt7+HAzJRRBdn4NzJhjDATWe8cBk32dQHJOh6kjkuxl
	 8bW794ZflAYRCFltOrm8Q3I4Fi0giylipBIV2uiGBfn9zrPl+XChDgSPS7UzwM4ed5T23
	 unzGbZJk5NKrvgRp2sTffqUkruEe3t1NzY2+klOhx0OM+WWg19S0zo5IkaFQyEnzhRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=F23t8iLTcn/LXqN2lEEgBTUnPAkeyO0taUnuYVGHe48=;
	b=PVPlQ2mejsmrNGrITc+GYPEbxW8WEGKv/1Ix3Fb8Hr6vjOncRstrebZ1ZzEsh3vxSn5a
	 MfnlJ/bMSjBVgGeF3KNxRYL1fihy+eB8LdwJ7sEBoc3Ce0c+kPLW4hXSmvY+p3ved/O1L
	 xd12Dl6jo/gyBaWl4DHoXS20UV4aTjLZMF/MLrrQfNtrW/iVNkWUP1GWCCGhK1bnhlroW
	 zJROx4H/tDvSiYBJYcY6p5ZOYAV97hmVNu0nAdAcwV3JEBUg4dzMo/HQTZBrRryNPnrX/
	 MOdfuNScb/Yv8twpvyeG41GSc484MLCcuxnZ8gkET40KWdH3WW72jmrUQi3kFwgb7qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nX+PjTC5;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B753606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B753606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nX+PjTC5
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so4657395e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792579954; x=1793184754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F23t8iLTcn/LXqN2lEEgBTUnPAkeyO0taUnuYVGHe48=;
        b=nX+PjTC5jHfYJsVcXvO9LOnSZYyez+lVXs26FswZTaVGXIuu/TwFtgR9pCqMFUPjdG
         h5spDniIddEWqbf3kq9JqYHhhpnrpNNwp5A1IADZ0T0x96Q4jc3slOu4TUdCFSuX3nRA
         ls5Mcqwg9zlFHDLLjaPJvx4a1QTjn/9jfaQpKdZUTLGPXY7m1xDHZ1IiNlpN0SwWUV6n
         vyPE428bFjdXlQXNMxS3labCT9Zz80X0p+dJkuVw0P3eght+SMYDIK8w2k04VFoEHzn/
         SUy2oRVvPupxh5Cs1RDLCDRxpVsMeAgaHN+itBWiLKxXaP4HSJ8VH1Anuy5yWFqxgrn2
         nwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579954; x=1793184754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F23t8iLTcn/LXqN2lEEgBTUnPAkeyO0taUnuYVGHe48=;
        b=FfSpnhEtTDQO7puCKqECL6ucSFdX5sBEsx4jYFzO5pFq4c6OfE/LH0hsYwcadigIoh
         mYGf3w6mCImygS7SQlJ66hR9uUHfX4irL0xude6K+09WRWqIAwaA4Q+ejKK4HkiCLiQx
         OJhYZtuBEy6CUpvP/Z2M7Fuxn4Ax96jP+PIgs3jqNeEaUeK8IbVFY17A+SbRJFpwgm89
         nJkrAfsQYp+zbNQN7UisakYrdFyBSPEaBrKAeZnHm1xyOexGHEwafPewes+Q31vILMcK
         Vo1DbnSg2d+3Y7UkW5ja+ubUZv2a7IdqtTt5t88LGXy8/a0sNhv8r9Apw7UPADlXRjYC
         WJ9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzxXhM/9BhpA1yXi/cnZsIAyU1PSwf3/YKp4YS6h3IHF1B8UQZO1xPdVpMSDyQEmE8wK1tY0JP6it6NRqc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYRp8mHBYO/QMPDwYXptHY4kT997zLkLkNWELmEK7hFQM+3IwP
	LhDIDem5T7L2bEpDfR/r+ZxWFPL9IgMpvXXOyXXcgt097dQi/BWGq/bR
X-Gm-Gg: AYBFou08yuIxHvdBnL/DXYnvOV3O+TM9l0K4fTdk3SZUn+aLnl42+ydMrdeA73Ku1KY
	Utn9UTrM7BCPhMJXeMnLX+2eqODI8teudjAtqZKSsjVcq5acw5HfZHC1tx2c/iWVN2l6R3y2FGw
	Yr9R1T73MGHStljB+EQrM6hj8YBNIFmicjIZmKIMU9bFDYXF2pKsM8q2Swk49XrLDgk/3fXMCOy
	c1d/DX+h7XY6pUEBlfbIlDpDSo/J/v6o/+6cPKQGTRGVVNuZosr7nIo+R9HsNnVUPMdFBoyxFuE
	uLbrC4qORtDsAXOipi4n0P1BbRppD0zlPZicZXy2c3FoK0RiOCJm0p3RmAZzHc8lCdrIm6h3Bsz
	/O8pWR0u1cKhJh1bgm4Mc8MOmiktNDunakH26N/X2r3XTFW0UKqiBB3v2hTsxhqfKIqQsF4Zjj5
	fNBu8R2XxsXOEGVFi7y837q9c/nJvAnfytfLxikPZddaXwx/wuEgVDdG42QcLJbkPYD1mjX5ABX
	7v9tV8JSJEma2hho4rHgt5tl7AU8WCesahtWwgJMzRz5+3e3Nw=
X-Received: by 2002:a05:600c:628d:b0:4a1:f377:5c6e with SMTP id 5b1f17b1804b1-4a1fdd20a24mr31171585e9.7.1792579953510;
        Wed, 21 Oct 2026 03:52:33 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d6e2dbsm153388305e9.13.2026.10.21.03.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:52:33 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v11 3/9] regulator: dt-bindings: Add MediaTek MT6392 PMIC
Date: Wed, 21 Oct 2026 12:47:21 +0200
Message-ID: <20261021105109.199886-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021105109.199886-1-l.scorcia@gmail.com>
References: <20261021105109.199886-1-l.scorcia@gmail.com>
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

Add bindings for the regulators found in the MediaTek MT6392 PMIC,
usually found in board designs using the MediaTek MT8516/MT8167 SoCs.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../regulator/mediatek,mt6392-regulator.yaml  | 112 ++++++++++++++++++
 .../regulator/mediatek,mt6392-regulator.h     |  23 ++++
 2 files changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
 create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
new file mode 100644
index 000000000000..d74721d8f2ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6392-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6392 regulator
+
+maintainers:
+  - Luca Leonardo Scorcia <l.scorcia@gmail.com>
+
+description:
+  MT6392 is a power management system chip containing three buck converters and
+  23 LDOs. All voltage regulators provided by the PMIC are described as
+  sub-nodes of this node.
+
+properties:
+  compatible:
+    items:
+      - const: mediatek,mt6392-regulator
+
+  vproc-supply:
+    description: Supply for buck regulator vproc
+  vcore-supply:
+    description: Supply for buck regulator vcore
+  vsys-supply:
+    description: Supply for buck regulator vsys
+  avddldo-supply:
+    description:
+      Supply for AVDD LDOs (vm, vio18, vcn18, vcamd, vcamio). According to the data sheet
+      this is an internal supply derived from vsys.
+  ldo1-supply:
+    description: Supply for LDOs group 1 (vaud28, vxo22, vaud22, vadc18, vcama, vrtc)
+  ldo2-supply:
+    description: Supply for LDOs group 2 (vcn35, vio28, vmc, vmch, vefuse, vdig18)
+  ldo3-supply:
+    description: Supply for LDOs group 3 (vusb, vemc3v3, vcamaf, vgp1, vgp2, vm25)
+
+patternProperties:
+  "^v(core|proc|sys)$":
+    description: Buck regulators
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes:
+        description:
+          BUCK regulators can set regulator-allowed-modes to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 1]
+        minItems: 1
+        maxItems: 2
+      regulator-initial-mode:
+        description:
+          BUCK regulators can set regulator-initial-mode to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        enum: [0, 1]
+
+  "^v(adc18|camio|cn18|io18|xo22|m25|aud28|io28|usb)$":
+    description: LDOs with fixed output and mode setting
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes:
+        description:
+          LDO regulators can set regulator-allowed-modes to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 2]
+        minItems: 1
+        maxItems: 2
+      regulator-initial-mode:
+        description:
+          LDO regulators can set regulator-initial-mode to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        enum: [0, 2]
+
+  "^v(cama|dig18|rtc)$":
+    description: LDOs with fixed output without mode setting
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes: false
+      regulator-initial-mode: false
+
+  "^v(aud22|camaf|camd|cn35|efuse|emc3v3|gp1|gp2|m|mc|mch)$":
+    description: LDOs with adjustable output and mode setting
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes:
+        description:
+          LDO regulators can set regulator-allowed-modes to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 2]
+        minItems: 1
+        maxItems: 2
+      regulator-initial-mode:
+        description:
+          LDO regulators can set regulator-initial-mode to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        enum: [0, 2]
+
+required:
+  - compatible
+
+additionalProperties: false
diff --git a/include/dt-bindings/regulator/mediatek,mt6392-regulator.h b/include/dt-bindings/regulator/mediatek,mt6392-regulator.h
new file mode 100644
index 000000000000..2e1f41e0ebfe
--- /dev/null
+++ b/include/dt-bindings/regulator/mediatek,mt6392-regulator.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_REGULATOR_MEDIATEK_MT6392_H_
+#define _DT_BINDINGS_REGULATOR_MEDIATEK_MT6392_H_
+
+/*
+ * Buck mode constants which may be used in devicetree properties (eg.
+ * regulator-initial-mode, regulator-allowed-modes).
+ * See the manufacturer's datasheet for more information on these modes.
+ */
+
+#define MT6392_REGULATOR_MODE_NORMAL	0
+#define MT6392_BUCK_MODE_FORCE_PWM	1
+
+/*
+ * LDO mode constants which may be used in devicetree properties (eg.
+ * regulator-initial-mode, regulator-allowed-modes).
+ * See the manufacturer's datasheet for more information on these modes.
+ */
+
+#define MT6392_LDO_MODE_LP		2
+
+#endif
-- 
2.43.0

