Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C32843551C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789381569; cv=none; b=Kruxnx+6Sd1mrTJ5t/mgFrEwykWrYHKMLGZIRbqcfwRcLSXwsZygaL6JlNQHqPUjtbEm5NQyTOl1EKlkMknugOc61yNOXTrWWXelMTIxSegDjo9LFH59ErrPbiepCwGbkckTUi4RklgIB0Hcm7TPBOpVtsLoN3+LljNBFEAeDPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789381569; c=relaxed/simple;
	bh=DV6Zn0e+VrP+2e9y4U3t9IosQ8IG0O1VTEXmpzxD000=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GvtokOZHCUa4kBCSTmE8xyZZhffH2eE/R/K8SqCWLDvMsvbzxY+pCBvykcscrTSoxuXJM5lL2qFcTrZNt140kO0dfe8gXG6M9UIeENvQhDXIxm9kGkgYERk9YlGmQw5pmDXVPuLfVwtIdsmAIRE3sq7A9WBn1JXJ7fzoW8J/lak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=JB9FODKf; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="JB9FODKf"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa663c1so240136666b.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789381565; x=1789986365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPiwZgYTFcdYlBr5Z9nYswZmRS1da/d4K4QKgW9TWRE=;
        b=JB9FODKfcl+9uBSpeyjK8C3ZFZ5qiJay9/1QY8DUqHm/8riaaZll3I2BS6FrNfhlby
         EUUbxBebQWhhz0q+xPMmuPzNoDOn8yWQWiagRiUwntFF6kok0iwRiChhCLYw3sxl3Qx4
         95n1l89EzkE+9jv2ZNBS8nVc+uwULZEw5DL2iPbMZ1ENg0cjN1IRnowFXp08YRHfjzjR
         OZcue1dsWgz7qW1+JJv4d8RV8270P8pKCnzseRdGofxhne33S+HbJo7GDYvuZes5Xn+8
         c/duplU+n4dvZlrE9FqDhgz3cwEeU8P8RQ8SzqlLeLMkheQQ1ocmlKQHrh49zOmkanvn
         9YWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789381565; x=1789986365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oPiwZgYTFcdYlBr5Z9nYswZmRS1da/d4K4QKgW9TWRE=;
        b=SNcxBZDkOlPSUfZGBDYg8nZRM872Q8CfxJ33TsJuCcOR9XyGovfs2VI3TWrC6QjMR1
         XdjtVSBH6f95Qc8aQM3lSgMyJ+fv90fhoCJgDazkg0KDEog5FxaeablMdzAHAt453Ffi
         olz45PrMlN65Fudbpp69hh9oyC+HT1PzlQ8xNyD2j3I3SfASqyviXE2LOZ2XowiO9UsR
         zd19wVdI7HcCspwfB6TEJYprh+TcfEf2w/2t0558kCcR0ve6q5tPGV4orY1kHCoEq9s5
         VH3MUNXCha3zC1hZ1r53K+dLWKtmZro3Emi4XqziOMlTjL6xK3KCzUrNM3hKJpyPVov4
         syTg==
X-Forwarded-Encrypted: i=1; AKwUvByazAmBXhiYBcZIOe/h/YB4Aj467CJpLnZgqpmhU+Dg+tU1yHn7kYWo6toMDFtLk45UBIMY6h3S1jC7wsk=@vger.kernel.org
X-Gm-Message-State: AFuF++mJi+Pjjbf+kYwbQSFcS7SS0TY+BqSQxr/zr5oZ8kZoe6NV0aNP
	R0kctOnTlfsrCUb4DxKQjpB5VvwNaW0hPFRcYksmcWQ2zz4lyRo1XVf9EvHZeg6QxR4=
X-Gm-Gg: AYBFou2F7OfKXb+I9ijmJZiGApubQAxhLFn2OjMb0QelX+zw9tnTGYGz2g3bqBPCQcW
	XyBmjIvW4gkDQW2VoAo5Bx6I4zqstyl/pLnERAqvZtIIr5PeI5nOdLiHq49wNx1jXWenMVyziZJ
	9TQBkHEnZdfboved+X7kjuOm9iJMS4jtR5NbhFmFznjCKBrPYAkEs85gTcptUmIIFlC2WGcPShL
	wMVEySUhL8USWuHeHMNGCFCmOVnuLmxizQbqU77niApfV85orBCs7AABWmq1TrsvoM68xtcjcH/
	AiCntnSiJw8X1dXFDL8BLNr1TIgUQdVtS7iKLQR8aCBmapHSAKnESBWOHtxmr+uecPHv4L5Cf1Y
	I3IdWPAEnCXNz/l5iVjKLZ0y+pZ05IWjRFWlXhMykhrJX7v5mNw9QbCipCGEq6eNccZfSgYu01z
	RrNGySZrzO3D5Z9cYCzrIi/bU3XVqCmwjsHFL3IqF92uDKMRtTSz1AlhsDZV57QREiwrEO8oTyi
	Q6mR/hxu/250hmlIL2H9qMXrY+EUt+ZL9OQaiRiAlkzCRBFXpGBq+FQoFzfW2Ew1sCN
X-Received: by 2002:a17:907:a089:b0:c25:c7a9:7b8a with SMTP id a640c23a62f3a-c29b86b80b0mr186518066b.12.1789381559601;
        Mon, 14 Sep 2026 03:25:59 -0700 (PDT)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660654f2sm399985666b.28.2026.09.14.03.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:25:59 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Mon, 14 Sep 2026 12:25:56 +0200
Subject: [PATCH v2 1/3] dt-bindings: media: i2c: dw9800: Redocument DW9800K
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-dw9800k_cleanup-v2-1-6553273aaa33@fairphone.com>
References: <20260914-b4-dw9800k_cleanup-v2-0-6553273aaa33@fairphone.com>
In-Reply-To: <20260914-b4-dw9800k_cleanup-v2-0-6553273aaa33@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789381558; l=4483;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=DV6Zn0e+VrP+2e9y4U3t9IosQ8IG0O1VTEXmpzxD000=;
 b=yh+rEjyA08btbufejXfbAwYT4R0mgYG3G5u/7zXWn2QCgxPTBGFYBcMS+MJQjCqE3lc7hZyUs
 GwM0RJF3zFUBlw+GnScf7au1um8uXHhoncbp0ucJVy0Uj728UDxi384
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

The DW9800K's properties are too different to justify sharing the same
bindings file as the dw9719, Create a separate bindings documentation
for the Dongwoon Anatech DW9800K with it's updated properties.

More specifically:

The DW9800K did not share the SAC1 and SAC6 modes
that the DW9719 used.

The DW9800K does not actually have a register that matches the property
description of vcm-prescale, instead the description of the clock-presc
in the DW9768 is much more applicable to the functionality required
according to the DW9800K datasheet.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 .../bindings/media/i2c/dongwoon,dw9719.yaml        |  1 -
 .../bindings/media/i2c/dongwoon,dw9800k.yaml       | 91 ++++++++++++++++++++++
 2 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
index 8e8d62436e0d0c4f9af9e52262b23881abd37cec..38db0764c0f70ad49295dcddc182b7e100a68b29 100644
--- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
@@ -21,7 +21,6 @@ properties:
       - dongwoon,dw9718s
       - dongwoon,dw9719
       - dongwoon,dw9761
-      - dongwoon,dw9800k
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9800k.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9800k.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..046c0a88bcefd403d9637dccf03b516db880d22e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9800k.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9800k.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dongwoon Anatech DW9800K Bi-Direction Voice Coil Motor (Bi-VCM) Controller
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+  - Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
+
+description:
+  The Dongwoon DW9800K is a single 10-bit digital-to-analog converter with
+  +-130 mA output current sink capability, designed for linear control of
+  bi-directional voice coil motors (Bi-VCM) in camera lenses. This chip
+  provides a Smart Actuator Control (SAC) mode intended for minimizing
+  mechanical vibration.
+
+properties:
+  compatible:
+    enum:
+      - dongwoon,dw9800k
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: VDD power supply, can range from 2.3V to 4.8V
+
+  dongwoon,sac-mode:
+    description: >
+      Slew Rate Control mode to use: direct, LSC (Linear Slope Control) or
+      SAC2-SAC5 (Smart Actuator Control).
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 # Direct mode
+      - 1 # LSC mode
+      - 2 # SAC2 mode (operation time# 0.48 x Tvib)
+      - 3 # SAC3 mode (operation time# 0.72 x Tvib)
+      - 4 # SAC4 mode (operation time# 1.20 x Tvib)
+      - 5 # SAC5 mode (operation time# 1.64 x Tvib)
+    default: 3
+
+  dongwoon,clock-presc:
+    description:
+      Indication of VCM internal clock dividing rate select, as one multiple
+      factor to calculate VCM ring periodic time Tvib.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 #  Dividing Rate -  2
+      - 1 #  Dividing Rate -  1
+      - 2 #  Dividing Rate -  1/2
+      - 3 #  Dividing Rate -  1/4
+      - 4 #  Dividing Rate -  8
+      - 5 #  Dividing Rate -  4
+    default: 1
+
+  dongwoon,timing-control:
+    description:
+      In LSC mode (252 + value * 4) * divider value in microseconds
+      In SAC mode (6.3 + value * 0.1) * divider value in milliseconds
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0x00
+    maximum: 0x3f
+    default: 0x20
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        actuator@c {
+            compatible = "dongwoon,dw9800k";
+            reg = <0x0c>;
+
+            vdd-supply = <&pm8937_l17>;
+
+            dongwoon,sac-mode = <4>;
+            dongwoon,clock-presc = <0>;
+            dongwoon,timing-control = <16>;
+        };
+    };

-- 
2.43.0

