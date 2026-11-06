Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964615;
	b=anXAXffob9kv5AljaS3C/BRjrT+hM8tgOWhNUh+btc1Ya9sfpjLYGKjiu5WsPkxhQ6Ga
	 Q7aGVRtEeoLYTLoeVPA5WAltXccGp603oy29YjtC5f5u33r1kdL4qqFkN8LaQB/C8tnuh
	 eFwz+p7gdS6EfTyybAL36wTkUV3KKGhgvSNPWQbHoxmG/2H5dUSktUYKpvY+8LpH/aSzd
	 7xLr0qWaoWBsisizvmzXoXGoFL6GowuS3BtqowA6SDqLzZkH1VLwv3w2A9uJmAnxHGB2/
	 X2kJYn+fKKheK0y1y7LCkqoS5SMfNGNmJ4qaI0RaRzXmxCyQfeo5jLFhHT6H8Wzo0Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964615;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=9q3QyFQZwiKpfJPvHT/cCB0sso+MEjau6PRiMe61Luc=;
	b=T07ci/mPRZAIyagYgiJ0xSHNmv+ycehFHIxPOJewLlX7XSa2LgmAWDeG3NU0vxbBAk2v
	 2qTB9obZpAfpcFvgnkLZKuEpm2Qp0QfV9FYK72NZHIWkhD8C8GQkQ0Yuq6AZM7OmjKT1r
	 nisRMr0Wrg2f+J20H2KkqLQwB5vICqlRIyzmDFnvmRb/Dg1do5qv6yRXpLVqrHpoVNJHh
	 aVXmjNYcGmf/XkgJavJdJIc77zK0fOtCjamEAPalzWp7rcELhV+DejceBBO5Mb/57UvAb
	 HfIKMVVTRKLblY8Ix+SOoMnKRUl9linjQ5JPRWifb0MbCnnuaXAr6w65iLIJ/EDdDGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=nltZjf20;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E57606D80D;
	Fri,  6 Nov 2026 11:30:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7E57606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=nltZjf20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=9q3QyFQZwiKpfJPvHT/cCB0sso+MEjau6P
	RiMe61Luc=; b=nltZjf20vl9qLyrkxrEufUiMd7acxTCY6FmsSVL6ss4em3JC6f
	PIfN3KNt4PQaB18YlQMGJXGBy+gu+YOT6Yo85FVLX52Bep0e5uQ8gDe26JaXo4DO
	+Jk408Rc7iiw2i7xY8S/9L85Fowu8iECuh80AVFSmV7FYUmOhPh9uDuJY=
Received: from xuqianhui.tail7a2807.ts.net (unknown [114.214.184.75])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgBn2S09uu1qwTCPAA--.854S3;
	Fri, 06 Nov 2026 19:30:08 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/2] regulator: dt-bindings: willsemi,wl2868c: add the WL2868C camera PMIC
Date: Fri,  6 Nov 2026 19:30:04 +0800
Message-ID: <20261106113005.970822-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106113005.970822-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261106113005.970822-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgBn2S09uu1qwTCPAA--.854S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCrW5JF45urykZr17WF4kZwb_yoWrCw17pa
	98GrsFkFsYkF1xG3yxK3Wfu3W3KF1rArn5Ar1UC34rGan0qFnaqwnIkw15Z3WFyrW8GFW2
	yFyDZF47JF1rZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBqb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
	0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
	IF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI
	42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
	80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5vL9UUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREDB2rs2VhhrAAqs0

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

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 .../bindings/regulator/willsemi,wl2868c.yaml  | 104 ++++++++++++++++++
 MAINTAINERS                                   |   7 ++
 2 files changed, 111 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml

diff --git a/Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml b/Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
new file mode 100644
index 0000000000..df7990d0d8
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
@@ -0,0 +1,104 @@
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
+description:
+  The WL2868C is a camera power management IC with seven programmable LDOs.
+  LDO1 and LDO2 share the VIN12 input and cover 0.496 V to 1.512 V; LDO3 and
+  LDO4 share VIN34, and LDO5 to LDO7 have one input each, covering 1.504 V to
+  3.544 V. All outputs are programmable in 8 mV steps.
+
+  VIN7 and VSYS feed the internal control logic, which is powered from the
+  higher of the two, so at least one of them has to be connected. The other
+  inputs only feed LDOs, so an input may be left unconnected on a board
+  that does not use the outputs it feeds, which is why they are not
+  mandatory.
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
+    description:
+      Input supply for LDO7 and one of the two supplies of the internal
+      control logic.
+
+  vsys-supply:
+    description:
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
+            vsys-supply = <&vsys_reg>;
+
+            regulators {
+                ldo1 {
+                    regulator-max-microvolt = <1128000>;
+                    regulator-min-microvolt = <1128000>;
+                };
+            };
+        };
+    };
+
+    vsys_reg: regulator-vsys {
+        compatible = "regulator-fixed";
+        regulator-name = "vsys";
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index fe23913b1e..08cfa3db0e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -30180,6 +30180,13 @@ L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	drivers/hid/hid-wiimote*
 
+WILLSEMI WL2868C CAMERA PMIC
+M:	Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
+F:	drivers/regulator/wl2868c-regulator.c
+
 WILOCITY WIL6210 WIRELESS DRIVER
 L:	linux-wireless@vger.kernel.org
 S:	Orphan

