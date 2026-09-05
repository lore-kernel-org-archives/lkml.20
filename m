Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAB23546F3
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 21:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788645168; cv=none; b=N++MnTiC3R9QnPLK0qflnd23it/FkjblL6iia/WaD1DcYC2V6O2XjR+kj9H4fta2WmHYnpKs/lvnO8xq/mMixrrDebDLb7+UtBdf8LaF1EsmIVfdnYaH4hp3pa+1mjSN9LN1b/VD7Rt9rfbHxaltjosuwql3GLtdo64y+i1M6iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788645168; c=relaxed/simple;
	bh=+8fq0VGHmZ+jIIifRhTsmw5nC8PD26zUCtpHZTRIBBE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=JPJr2GH5QRqfISLkftXNMG6NBtsFsMdILpUEgIykLwRfw7Y03OcNmL5/QaiT68rtEBwDt+B7/PJ1aL8QE2gy5SNCXSdFFiufMBEaNoumz/ypu3C55Q1UXGjLwGEpV1qktiUnDb7nrNLDhK3idhPAfMG+nd9wx3/v44hbtnmvBdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HAmXChYh; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HAmXChYh"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48436251906so2488945f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 14:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788645165; x=1789249965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N6JGOcfYrEaC/Ge4obmi2SIi++QOKaMHavxPseBP1/Y=;
        b=HAmXChYhMioYg/CV1qbejZJ8lWV7tfSUDyCfyrxNPQR6h9rRPQUbmUJ2sJE5MCHw4R
         t5DyALwuhH5uO/c7vGURVbKExlKduK9LebdgunzRr95x9AZLtvpRMx6zNczny2Z+lpkX
         8Et5uDV+KR7O769GFAVdfh66GSjHtPgcnMx6qxo8Kf2Z7zkwDkF74VBN7DvQBkS///zh
         YLH9FlJfJspQactO3Fo/z98Y/kLXit+Ilq4XvQjCvCjBA8c4mRs2QFpDlCGnWBFwsGxN
         8+vKB811PeJuxJokjNARsGu87kEHh/LT6diuhjKcbyMZ93QerXnfFNA24aZAXr5vIex+
         KioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788645165; x=1789249965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=N6JGOcfYrEaC/Ge4obmi2SIi++QOKaMHavxPseBP1/Y=;
        b=NT5ifpaGorGknpWP9bS9tPBuN/M8eJyEhsAQP7hiZS2H4yH8VejJtcYBUVaOA+oHVR
         m5SjdslJhop3+0MiKq3GxfNQLy5AvfjnNWYxbtAUkebtM1HvSajnlIECgUQu46hPc+5S
         tlR1RjA+XecbHQSaktbz4VsjS3j9EVSG4dcFeMmPGavLSy6VGlP0cLTSd8oWj2r4TMtz
         G0KfyZq7nr3zCaAaepG2m1IoR8Hg8m/eWhjP64XYIwQgJiv75CtM7HJ7DpFimYe1O6tK
         9+iQoCJhYGIfPOGb31rM7HJRcJsqn2wq7+hZsJwVMjugSlAVildYwTGQIvhOc8GosHZj
         aCAw==
X-Forwarded-Encrypted: i=1; AKwUvBxmO7ADHlW6I79xkfRqMzkq/BjJqSG0CHx8KVx8j0cLHoIebFXZAVTvsu1UKWV5Er2MnkBXdARMcT/vR/M=@vger.kernel.org
X-Gm-Message-State: AFuF++mXQrmtPa9d6Yz1adGxWgGh6sfS24NLkyImry471IySF1p3jmdq
	IuyYgo+UvWjbhl5I9shPuOMAFjYHpfJsWJ9XsIM9tuaP/doA0wpDe6pcrxyBHg==
X-Gm-Gg: AYBFou0FE42hR8JrzRRTnFwN5+LdUxzWW6rfJS60NPFP75ighHfA1xT4nIuUoe3I6oy
	sLElggecjC57E8RzzvKMHEn5/AI4zByWGIk0vDiUNoBoUZz20EYgB1AWpGNEH27KQdrCML41yxF
	FsQorEjXuEK2otnguwjt+Wp8XkdftYImJgTdJhUkH0RgkHzm5P7nJF2yRL4dr99kGpVn62RH6d6
	AufMnB9yIJwjsfUtNLLMP6sEbuWRtRC7zxdhTBimjyllHcNWho96gQ2AtRWaBrzbOOicN0eyIWn
	FJitIA/xZffgDazUMfuAd2C/BpxzAYE8JlplY+UWRkbilYL2+F26Tm2xsi7UTVd/7d+TR4ouz5Q
	pxsVC4vP+/g6g8Wr6pMOJmRMkX0nPAFYnpon2/mnTB17DU+qTUxPlIfSkOSlO/y2655ZoZlZyxI
	/MklUDr+H8fAVm6XvviFlWipMfVFfCs0iwrd7A+AcpYIuQ6ztxWlKYK4r8kBpx5JOWt28pUr5zC
	o4I/badmR4+wL0961S8aBNH7iYE3oeRxBQ0nEh7WQ==
X-Received: by 2002:a05:6000:4b11:b0:484:3310:c4fe with SMTP id ffacd0b85a97d-4858709b13amr30736305f8f.25.1788645164635;
        Sat, 05 Sep 2026 14:52:44 -0700 (PDT)
Received: from localhost.localdomain ([82.137.32.184])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485883acd33sm15700165f8f.18.2026.09.05.14.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 14:52:43 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Eduard Bostina <egbostina@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4] dt-bindings: mfd: Convert TI TWL6040 to DT schema
Date: Sat,  5 Sep 2026 21:52:34 +0000
Message-ID: <20260905215234.454266-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments TWL6040 audio codecs family bindings to DT
schema.

During the conversion, the following updates were made:
- Changed 'twl6040,audpwron-gpio' to 'ti,audpwron-gpio', which was
  misnamed in the old txt binding.
- Made 'gpio-controller', '#gpio-cells', and 'ti,audpwron-gpio' optional
  because modern platforms do not require them.
- Renamed the vibra 'vddvibl_uV'/'vddvibr_uV' properties to
  'ti,vddvibl-uV'/'ti,vddvibr-uV', the names actually read by the
  twl6040-vibra driver.
- Required 'vddvibl-supply' and 'vddvibr-supply' when the 'vibra' child
  node is present, since the twl6040-vibra driver unconditionally
  requests both.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes in v4:
- Add blank lines between the vibra child node's properties for
  readability, as requested in review. No functional change.

Link to v3: https://lore.kernel.org/all/20260817100207.2970303-1-egbostina@gmail.com/
Link to v2: https://lore.kernel.org/all/20260816092847.2522994-1-egbostina@gmail.com/
Link to v1: https://lore.kernel.org/all/20260815083451.2147129-1-egbostina@gmail.com/

 .../devicetree/bindings/mfd/ti,twl6040.yaml   | 156 ++++++++++++++++++
 .../devicetree/bindings/mfd/twl6040.txt       |  67 --------
 2 files changed, 156 insertions(+), 67 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,twl6040.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/twl6040.txt

diff --git a/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml b/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml
new file mode 100644
index 000000000000..5efcd79b527c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml
@@ -0,0 +1,156 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/ti,twl6040.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TWL6040 family audio codec
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+description:
+  The TWL6040s are 8-channel high quality low-power audio codecs providing
+  audio, vibra and GPO functionality on OMAP4+ platforms. They are connected
+  to the host processor via i2c for commands, McPDM for audio data and
+  commands.
+
+properties:
+  compatible:
+    enum:
+      - ti,twl6040
+      - ti,twl6041
+
+  reg:
+    const: 0x4b
+
+  interrupts:
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 1
+
+  "#clock-cells":
+    const: 0
+
+  ti,audpwron-gpio:
+    maxItems: 1
+    description: Power on GPIO line for the twl6040
+
+  vio-supply:
+    description: Regulator for the twl6040 VIO supply
+
+  v2v1-supply:
+    description: Regulator for the twl6040 V2V1 supply
+
+  enable-active-high:
+    type: boolean
+    description: To power on the twl6040 during boot.
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      enum:
+        - clk32k
+        - mclk
+
+  vddvibl-supply:
+    description: Regulator for the left vibra motor
+
+  vddvibr-supply:
+    description: Regulator for the right vibra motor
+
+  vibra:
+    type: object
+    additionalProperties: false
+    properties:
+      ti,vibldrv-res:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Resistance parameter for left driver
+
+      ti,vibrdrv-res:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Resistance parameter for right driver
+
+      ti,viblmotor-res:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Resistance parameter for left motor
+
+      ti,vibrmotor-res:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Resistance parameter for right motor
+
+      ti,vddvibl-uV:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: vddvibl default voltage if it needs to be changed
+
+      ti,vddvibr-uV:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: vddvibr default voltage if it needs to be changed
+
+    required:
+      - ti,vibldrv-res
+      - ti,vibrdrv-res
+      - ti,viblmotor-res
+      - ti,vibrmotor-res
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#clock-cells"
+  - vio-supply
+  - v2v1-supply
+
+allOf:
+  - if:
+      required:
+        - vibra
+    then:
+      required:
+        - vddvibl-supply
+        - vddvibr-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        audio-codec@4b {
+            compatible = "ti,twl6040";
+            reg = <0x4b>;
+            interrupts = <0 119 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-parent = <&gic>;
+            gpio-controller;
+            #gpio-cells = <1>;
+            #clock-cells = <0>;
+            ti,audpwron-gpio = <&gpio4 31 0>;
+
+            vio-supply = <&v1v8>;
+            v2v1-supply = <&v2v1>;
+            enable-active-high;
+
+            /* regulators for vibra motor */
+            vddvibl-supply = <&vbat>;
+            vddvibr-supply = <&vbat>;
+
+            vibra {
+                ti,vibldrv-res = <8>;
+                ti,vibrdrv-res = <3>;
+                ti,viblmotor-res = <10>;
+                ti,vibrmotor-res = <10>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/twl6040.txt b/Documentation/devicetree/bindings/mfd/twl6040.txt
deleted file mode 100644
index dfd8683ede0c..000000000000
--- a/Documentation/devicetree/bindings/mfd/twl6040.txt
+++ /dev/null
@@ -1,67 +0,0 @@
-Texas Instruments TWL6040 family
-
-The TWL6040s are 8-channel high quality low-power audio codecs providing audio,
-vibra and GPO functionality on OMAP4+ platforms.
-They are connected to the host processor via i2c for commands, McPDM for audio
-data and commands.
-
-Required properties:
-- compatible : "ti,twl6040" for twl6040, "ti,twl6041" for twl6041
-- reg: must be 0x4b for i2c address
-- interrupts: twl6040 has one interrupt line connecteded to the main SoC
-- gpio-controller:
-- #gpio-cells = <1>: twl6040 provides GPO lines.
-- #clock-cells = <0>; twl6040 is a provider of pdmclk which is used by McPDM
-- twl6040,audpwron-gpio: Power on GPIO line for the twl6040
-
-- vio-supply: Regulator for the twl6040 VIO supply
-- v2v1-supply: Regulator for the twl6040 V2V1 supply
-
-Optional properties, nodes:
-- enable-active-high: To power on the twl6040 during boot.
-- clocks: phandle to the clk32k and/or to mclk clock provider
-- clock-names: Must be "clk32k" for the 32K clock and "mclk" for the MCLK.
-
-Vibra functionality
-Required properties:
-- vddvibl-supply: Regulator for the left vibra motor
-- vddvibr-supply: Regulator for the right vibra motor
-- vibra { }: Configuration section for vibra parameters containing the following
-	     properties:
-- ti,vibldrv-res: Resistance parameter for left driver
-- ti,vibrdrv-res: Resistance parameter for right driver
-- ti,viblmotor-res: Resistance parameter for left motor
-- ti,viblmotor-res: Resistance parameter for right motor
-
-Optional properties within vibra { } section:
-- vddvibl_uV: If the vddvibl default voltage need to be changed
-- vddvibr_uV: If the vddvibr default voltage need to be changed
-
-Example:
-&i2c1 {
-	twl6040: twl@4b {
-		compatible = "ti,twl6040";
-
-		interrupts = <0 119 4>;
-		interrupt-parent = <&gic>;
-		twl6040,audpwron-gpio = <&gpio4 31 0>;
-
-		vio-supply = <&v1v8>;
-		v2v1-supply = <&v2v1>;
-		enable-active-high;
-
-		/* regulators for vibra motor */
-		vddvibl-supply = <&vbat>;
-		vddvibr-supply = <&vbat>;
-
-		vibra {
-			/* Vibra driver, motor resistance parameters */
-			ti,vibldrv-res = <8>;
-			ti,vibrdrv-res = <3>;
-			ti,viblmotor-res = <10>;
-			ti,vibrmotor-res = <10>;
-		};
-	};
-};
-
-/include/ "twl6040.dtsi"
-- 
2.43.0

