Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242FB377ABF
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 21:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788643739; cv=none; b=iwar44lNlke1mydqaAiY311Lvpc+t8QbDxes6xfIcCrQFbmkMRWZ+/pJ6lmMi+VGNGnGSahIgcAGt6BeXFSuNWbbohNxk2X2mZtjQHjmgSGYKmgJA3UrTkM1A+4MJ0B/XGnvg08nWgDbLZzBITiLE/LMsa8RBzsw++71IVaVaYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788643739; c=relaxed/simple;
	bh=zZcooq33uZAZQsOxsxxaLl9Ssx8OZWzyF/mi8o6rC90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jF9jHm43gOeR4G3jnZO80DJeWcJkn0CoOZb20pYciY1woldbxqEz1KdA+qbwF1TvHdLoVCzEjPnJRpheFuYF/7HbEXaBaQCIdrVtClHxpJnbQXDWsjCeFysj7eabyQLLeI56x98NDjozO3qbkq/HOM7ocaTBZXFa/X59C0l9YbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJ12gHru; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJ12gHru"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666bed443so536770a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 14:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788643736; x=1789248536; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nP3HrG62D1qDUWuEvN890ASEF32RGoYVJYmZpTUHaXc=;
        b=TJ12gHruvRc/Dh/HlM+wfamVV7KX0hMj9sEWn6hRXoIyDkAAZ28dGhgt1ekvXWrAP3
         ROkOOFOt8pJ2a7vneqEPXsNRRJrDDUYLaiu7PQFlKIO/XKKwmlpRrdVumKFX3h5NQvvH
         Wr5mRxh3m0G2noNw4fekong5Ba1ug59tvu9Xh7IAot1QGR/CULsks1XU3rs4FoaH2U+l
         kvi/zF9lQyEo731KmNFcErlQvCRueu1hFfhDzsLy53sscL4afRlZOUU5zbColZJ23vAz
         mL3NqSLgVbOT+whvOCFRrc1F8WJESjjpo1BxyvQ7R89k/RDBU62lDHfTQHYgxPVuWwm0
         2fCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788643736; x=1789248536;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nP3HrG62D1qDUWuEvN890ASEF32RGoYVJYmZpTUHaXc=;
        b=XyP8iaDfenk5EEUTpuKo7Gde1F8eWkYGGSd9jn/SOKroFI4Ct2a6XpME8T7TwCYyHn
         E/32FIzG7MOuFF0nXIAVII+dwG6lVCBlaKLZcOy6IhpY24x5VnPXRrOAAwbTEIe3OrOo
         vAJI5Iu0tAMSa+wNNcVUyNYLIBMDn2PZJt1Z6GIH4GlzCTsNaEKrmD7wzxOq0nepdJBj
         4BepNQww/jUWKUk3YDsiNoYA4DGosnguVXJzbHbA4doBor7rO7o87REOQT65vc3DQMiA
         Fj2FeSfbg/gStrWg7+6Bi47uIDfgCPQjQvLAS9wRsc2Uuu1BY0sYfVRN2osRTC7UUr4P
         vAjw==
X-Forwarded-Encrypted: i=1; AKwUvByGHQ5dqtcXvFQzuvAHyU/Z0iUGDVHquK4qDWPZ02gIyrZcsxlyd1LHLifyq51Ciqo3a+E8Jm6tCSPH3oI=@vger.kernel.org
X-Gm-Message-State: AFuF++kQqmtl3Uu0h0g7URiUlDGq0gG1FFlq6vNTfHG+tuKvKJfBv2TG
	uCKIKHGFAdHDFMyGZq5OE5D7X7LFYtG39EQ0r2qSLW6uRbn2aZSm1uzb3gUldA==
X-Gm-Gg: AYBFou2qkQou73ABryEwOrc/MF8UqzOPrN0KyXEshoAW8fW4wmlxoXj8v93Rs/hAzQz
	bycpQ+s2ahDPBDQ22BddmSA00SNPUNRWSrVYDcwZzsyYaKynJteObSB833N7fxKL4SBoGy85ciw
	xJdb9hXo7Y1fqHYDf9nKIrXBaRq+/IcWLhkNDcPhvjZPDUl9sW8XSlnQVorqLGPYLuMxA7gDMpQ
	opDzJxC1xvxt/X6ghdWjMj0pix9m1OKLj4jraceNF38NUouyrEmrCdM8XHfrQ0tbeKdzq23HVpZ
	ZiJGqapYzrggb48wYukKRZrNWJGMDnOsdWA5WQg09lTuPGoYuDYbsbmdG2P7k2t04TsHSNBwZrr
	CbKN9G/iamjoRKD/oS92nUxbtwGDlWghcLeVNc3FzP0pUWSoVfn50E2ZBOBkXAuA72guT3Gr/Ka
	mmuFTvm3LFZbFJ36f9T71WlVRRAvCvtpqpNKwYW1wFxm5GW1odMfjHYHdF4jXrHE2geSBO2Y8E6
	Kmc1pdBoW8=
X-Received: by 2002:a17:90b:3bcf:b0:396:d27c:8696 with SMTP id 98e67ed59e1d1-39b2693597emr14294880a91.4.1788643736428;
        Sat, 05 Sep 2026 14:28:56 -0700 (PDT)
Received: from [10.63.138.252] ([2409:40c2:5007:4aea:63cc:914c:1243:e03c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae8f1cf6dsm7028669a91.3.2026.09.05.14.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 14:28:54 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sun, 06 Sep 2026 02:58:32 +0530
Subject: [PATCH v3] dt-bindings: clock: ti,DM814x-ADPLL: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-ti-adpll-v3-1-1f1ccda49c62@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02Nyw6CMBQFf4V0bQ0ttFRX/odxAfQWruGVFhsN4
 d9tMQaWk5yZsxAHFsGRa7IQCx4djkOA7JSQui2HBijqwISnXKYFF3RGWuqp66jWRqsccjBMkTC
 fLBh8b6n748fuVT2hnqMfFy26ebSf7cuzuPtn5Z71jDKqpJGmvmRSpMWt6UvszvXYk5j1fBcVY
 weRB9GIQlVcZJUGcRTXdf0CI0weyusAAAA=
X-Change-ID: 20260725-ti-adpll-ddfd84e4ef18
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788643722; l=5036;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=zZcooq33uZAZQsOxsxxaLl9Ssx8OZWzyF/mi8o6rC90=;
 b=ABSepY0yrQ1i0yIt0aFrqAzx26CB/JyxPcbgByEbXeNiB1EsMzg+TxMxDkHcbRcDYroyEcVW0
 gL5SGYN62cSAQ/3rmKpUF4p6hcqz2Uhvoa6b3vecgoDpZ3zTep8O7aO
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the Texas Instruments DM814x ADPLL clock binding to DT schema
format. Add 'clock-output-names' as required which was missing in
legacy binding, as the driver (clk-adpll.c) mandates it and fails
probing if it is missing.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v3:
- Rebased to latest mainline rc.
- Collected tag.
- Link to v2: https://lore.kernel.org/r/20260811-ti-adpll-v2-1-f578b253bde5@gmail.com

Changes in v2:
- Droped description for items clock-output-names
- Dropped extra example
- Link to v1: https://lore.kernel.org/r/20260726-ti-adpll-v1-1-86f6fc936507@gmail.com
---
 .../devicetree/bindings/clock/ti/adpll.txt         | 39 ----------
 .../bindings/clock/ti/ti,dm814-adpll-clock.yaml    | 88 ++++++++++++++++++++++
 2 files changed, 88 insertions(+), 39 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti/adpll.txt b/Documentation/devicetree/bindings/clock/ti/adpll.txt
deleted file mode 100644
index 3122360adcf3..000000000000
--- a/Documentation/devicetree/bindings/clock/ti/adpll.txt
+++ /dev/null
@@ -1,39 +0,0 @@
-Binding for Texas Instruments ADPLL clock.
-
-This binding uses the common clock binding[1]. It assumes a
-register-mapped ADPLL with two to three selectable input clocks
-and three to four children.
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Required properties:
-- compatible : shall be one of "ti,dm814-adpll-s-clock" or
-  "ti,dm814-adpll-lj-clock" depending on the type of the ADPLL
-- #clock-cells : from common clock binding; shall be set to 1.
-- clocks : link phandles of parent clocks clkinp and clkinpulow, note
-  that the adpll-s-clock also has an optional clkinphif
-- reg : address and length of the register set for controlling the ADPLL.
-
-Examples:
-	adpll_mpu_ck: adpll@40 {
-		#clock-cells = <1>;
-		compatible = "ti,dm814-adpll-s-clock";
-		reg = <0x40 0x40>;
-		clocks = <&devosc_ck &devosc_ck &devosc_ck>;
-		clock-names = "clkinp", "clkinpulow", "clkinphif";
-		clock-output-names = "481c5040.adpll.dcoclkldo",
-				     "481c5040.adpll.clkout",
-				     "481c5040.adpll.clkoutx2",
-				     "481c5040.adpll.clkouthif";
-	};
-
-	adpll_dsp_ck: adpll@80 {
-		#clock-cells = <1>;
-		compatible = "ti,dm814-adpll-lj-clock";
-		reg = <0x80 0x30>;
-		clocks = <&devosc_ck &devosc_ck>;
-		clock-names = "clkinp", "clkinpulow";
-		clock-output-names = "481c5080.adpll.dcoclkldo",
-				     "481c5080.adpll.clkout",
-				     "481c5080.adpll.clkoutldo";
-	};
diff --git a/Documentation/devicetree/bindings/clock/ti/ti,dm814-adpll-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,dm814-adpll-clock.yaml
new file mode 100644
index 000000000000..9676ab2d8705
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/ti,dm814-adpll-clock.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti/ti,dm814-adpll-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DM814x ADPLL Clock
+
+maintainers:
+  - Tony Lindgren <tony@atomide.com>
+
+description:
+  The ADPLL is a register-mapped clock generator found on TI DM814x SoCs. It
+  provides multiple output clocks from two or three selectable input clocks and
+  three to four children.
+
+properties:
+  compatible:
+    enum:
+      - ti,dm814-adpll-s-clock
+      - ti,dm814-adpll-lj-clock
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 3
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: clkinp
+      - const: clkinpulow
+      - const: clkinphif
+
+  clock-output-names:
+    minItems: 3
+    maxItems: 4
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - clocks
+  - clock-output-names
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: ti,dm814-adpll-s-clock
+then:
+  properties:
+    clocks:
+      minItems: 3
+    clock-names:
+      minItems: 3
+    clock-output-names:
+      minItems: 4
+
+else:
+  properties:
+    clocks:
+      maxItems: 2
+    clock-names:
+      maxItems: 2
+    clock-output-names:
+      maxItems: 3
+
+additionalProperties: false
+
+examples:
+  - |
+    adpll@40 {
+        compatible = "ti,dm814-adpll-s-clock";
+        reg = <0x40 0x40>;
+        #clock-cells = <1>;
+        clocks = <&devosc_ck &devosc_ck &devosc_ck>;
+        clock-names = "clkinp", "clkinpulow", "clkinphif";
+        clock-output-names = "481c5040.adpll.dcoclkldo",
+                             "481c5040.adpll.clkout",
+                             "481c5040.adpll.clkoutx2",
+                             "481c5040.adpll.clkouthif";
+    };

---
base-commit: 9f0346dcbea363787186c94ef94dd01aaa215afa
change-id: 20260725-ti-adpll-ddfd84e4ef18

Best regards,
--  
Bhargav

