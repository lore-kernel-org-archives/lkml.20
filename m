Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557963;
	b=koDDy9rP4DmbQ7W5JR4BeD2mGsYexUXBPYvf+o6enb+0bTrjy/ljm+WIkpXOUI7HoQPI
	 Ndb2d6opLkBBKAd3Kb1v+6ATuAcGm35m5UitEhBIgwEvhSOBWeJ72nAyZL2Q9Sz8+9Gtk
	 hFTpCnn3RwAbYS/ztCDpbNM1q6bg4wLuDt+IAyLXHsdLco68s8WYc+oR172qsDne+5dWP
	 k70gW5fL+BkewU2OHrT0C9jM54POdg8VFTlV1pLW+UAro105KjyWSJ25Kj/v1S5PNNY99
	 ggXPQoUJaDY/Z5Qt29LpfHeFS+q7EloxVxqTLFqRhCdr04k4UfK0D8mG1Mhy3klvMvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557963;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=oHc+4wiOP77Y6rdhUER6E6O/YlekIux0worEr8HMXOU=;
	b=Su31jSOFyJqiWSgMXrQmvjfqZAV7tBGFXezVS5/5DZqwXZFRt6SQNyoDMrT5iVr6EFqm
	 y1BIKTKBuFIwVfaV3lbnLnOXIyvkrXGzsnLNAbHFxY/bFYegDnFr1iOBr+lQ0JW9zlBNP
	 9E2xfgzy8mGdwC54n1NsSUoqEq1DrUtFbz2FUFm/PDDRwDZRKItyjE8a/By6vg4RcTNb6
	 XUZu5aBaF5G1RMuOhQ5XmhysHG+sbYzZFCXn3HQJjRSbGfQFl/XMWJTZCu850wcpzzrrg
	 GBOQ1xy6E2T0qeHaytG6nAkyfUPPKSEQmJ8H9nRYN9/8Pmp8CcGZfNg29Tf1zbbqzWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=hVCHP98J;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C307606A323;
	Fri, 13 Nov 2026 08:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C307606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=hVCHP98J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=oHc+4wiOP77Y6rdhUER6E6O/YlekIux0wo
	rEr8HMXOU=; b=hVCHP98JM59qeGHZ21Ry+mCmfeadCjPiRVEMfTINoievTjjtk/
	MvyBQIAsn26FoJKaY0xzx+OfTFr6BlsDW4zQh/O13m8a67RvGaq/J3cfnUlv9oOF
	zyX7cj7ALlnNFg/zM3qlh0FVZLez5mMRrl8m8Rn3J6IlN8PPXmgZ5gp54=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.188.15])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgBX1DgCyPZqlSK4AA--.7571S3;
	Fri, 13 Nov 2026 16:19:18 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v11 1/2] regulator: dt-bindings: willsemi,wl2868c: add the WL2868C camera PMIC
Date: Fri, 13 Nov 2026 16:19:13 +0800
Message-ID: <9ab5e5937264bb408be43986acb8553464e44a49.1794557667.git.xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794557667.git.xiaqinghuan@mail.ustc.edu.cn>
References: <cover.1794557667.git.xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgBX1DgCyPZqlSK4AA--.7571S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCrW5JF45urykZr17WF4kZwb_yoWrZF1kpF
	Z8GrsFkFs5Cr1xGw4xK3W8u3W3KF1rArn5Ar1UC348Kan0qFnaqr9Ikw15Za4Fyw48GFWa
	yryDZF47J3WrZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBSb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
	0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
	IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
	0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
	Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4s2-UUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREJB2r0wlk29gAesF

The WL2868C is an I2C-controlled camera power management IC from Will
Semiconductor. It provides seven programmable LDOs: LDO1 and LDO2 are fed
from a shared VIN12 input and cover 0.496 V to 1.512 V, LDO3 and LDO4 share
VIN34, and LDO5 to LDO7 each have their own input, covering 1.504 V to
3.544 V. All outputs are programmable in 8 mV steps and are gated by
per-output enable bits with a chip-wide SYS_EN master. The chip also
exposes an optional active-low RST_N input.

VIN7 and VSYS are both inputs of the internal control logic, which is
powered from the higher of the two voltages, so a device tree has to
describe at least one of them. The remaining inputs only feed LDOs, so
they stay optional: an input can be left unconnected when the outputs it
feeds are unused on a given board.

The example enables ldo1, which is fed from VIN12, so it also describes
vin12-supply; the binding says an input may only be left out when the
outputs it feeds are unused on a given board.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 .../bindings/regulator/willsemi,wl2868c.yaml  | 99 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml

diff --git a/Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml b/Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
new file mode 100644
index 000000000..972813fbd
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/willsemi,wl2868c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Will Semiconductor WL2868C camera power management IC
+
+maintainers:
+  - Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
+
+description: >
+  The WL2868C is a camera power management IC with seven programmable LDOs.
+  LDO1 and LDO2 share the VIN12 input and cover 0.496 V to 1.512 V; LDO3 and
+  LDO4 share VIN34, and LDO5 to LDO7 have one input each, covering 1.504 V to
+  3.544 V. All outputs are programmable in 8 mV steps.
+
+  VIN7 and VSYS feed the internal control logic, which is powered from the
+  higher of the two, so at least one of them has to be connected. The other
+  inputs only feed LDOs, so an input may be left unconnected on a board that
+  does not use the outputs it feeds, which is why they are not mandatory.
+
+properties:
+  compatible:
+    const: willsemi,wl2868c
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: Active-low RST_N input.
+
+  vin12-supply:
+    description: Input supply for LDO1 and LDO2.
+
+  vin34-supply:
+    description: Input supply for LDO3 and LDO4.
+
+  vin5-supply:
+    description: Input supply for LDO5.
+
+  vin6-supply:
+    description: Input supply for LDO6.
+
+  vin7-supply:
+    description: >
+      Input supply for LDO7 and one of the two supplies of the internal
+      control logic.
+
+  vsys-supply:
+    description: >
+      System supply, the other supply of the internal control logic. The
+      control logic is powered from the higher of VIN7 and VSYS.
+
+  regulators:
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      "^ldo[1-7]$":
+        type: object
+        $ref: regulator.yaml#
+        unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - regulators
+
+anyOf:
+  - required:
+      - vin7-supply
+  - required:
+      - vsys-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@2f {
+            compatible = "willsemi,wl2868c";
+            reg = <0x2f>;
+            vsys-supply = <&vreg_vsys>;
+            vin12-supply = <&vreg_vin12>;
+
+            regulators {
+                ldo1 {
+                    regulator-max-microvolt = <1128000>;
+                    regulator-min-microvolt = <1128000>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 8014b9f82..435beaf95 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29058,6 +29058,12 @@ L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	drivers/hid/hid-wiimote*
 
+WILLSEMI WL2868C CAMERA PMIC
+M:	Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
+
 WILOCITY WIL6210 WIRELESS DRIVER
 L:	linux-wireless@vger.kernel.org
 S:	Orphan
-- 
2.53.0

