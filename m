Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793762822;
	b=wR9HR2hkS0wrbKqdwRr7oTNG0Vh/vzd4qujmF/3uMLmeOUuvFHo6hUDQeTqaGUFc3ant
	 gCXryvn63TFiGs0uN/PTCFSJ062Gpp7pE4DBcz4BiG0+6MIgD9ygTlh2lE0Yp/KK8fiB8
	 QlXTFcqLpurGgmylGvCHXOIyqnb0m92skhMJYdJnpQ9BWBkOMzd9GnKZfZ1IkETEQOmZ6
	 MCYdyYM/7Rs/cftaEd4hgj0pmq4UwEqvwupN/6oF818GnICfeh3m7DuO8jRiNT6NtZVz6
	 XNNisG/0SOPX3JRfCFGGVXZX0m0HYlUM4bWDkaGf+lt5U3Q7cy6aTr7eign1WEUIalw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793762822;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=NdKCWXl+yLesowfamEvJc82Z0Hf22fbt296uiZ84u/s=;
	b=JCPkqfpKABD5QPVONiricd/XbLm8DG7c71LZ7ZycDfm4YIIMWntCi0ZKzjdiYaKeHPbT
	 Tg3s3zm92XeRdJJfHE8C+NOKpG3FUKpuGj6gaVYjQD83WwS7+iWRcD2fPEzg0KqQyXb5C
	 pLm1t4gjgRrE5K7HVYXuhA5AT57q0W1VNbBlJf7VXn64rLarECa0BZhka8lbm2zRAMrGr
	 rmGwN2VH1bh4P2D184gnI/Y0X6pHsyGy3CKkhwvXDGV4ZQKmOFBpcVVZv/KH2m+Net8QK
	 MXoMtpmnVF9Otv4JSZZcuUerAzuZ073pix1eahOqSKmHydXl3jmCtwmguLaH+CeINaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=I6Lfz5I4;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD91606A31B;
	Wed,  4 Nov 2026 03:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BD91606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=I6Lfz5I4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=NdKCWXl+yLesowfamEvJc82Z0Hf22fbt29
	6uiZ84u/s=; b=I6Lfz5I4VILn0L6LKgMBPx8HJmgvqdbBS8Qw8pFanaKhNU1tRt
	ule6j19HW0Oxs1Q1YGK+0f7Bx2XeBrJXLr+suodj6wpNjCddatlh+YS8IA0kpAs8
	iv0D8WHtNFCwwarL1nLeNJho4KcWDG00hZhO483pXnbU+6QTcO3MoLf5k=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.194.56])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAXnUH4pepqKzSAAA--.3770S3;
	Wed, 04 Nov 2026 11:26:49 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v6 1/5] regulator: dt-bindings: willsemi,wl2868c: add the WL2868C camera PMIC
Date: Wed,  4 Nov 2026 11:26:44 +0800
Message-ID: <20261104032648.209747-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104032648.209747-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261104032648.209747-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgAXnUH4pepqKzSAAA--.3770S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCrW5JF45urykZr17WF4kZwb_yoWrJw4Dpa
	98WrsrKFsYk3WxWa1Ig3Wru3W3KFs5Arn5Ar1UCryrGa1DWFnaq3sIkw15Aa4rAry8GFW2
	yFyDZF47JFn5u3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7
	CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCa
	FVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
	Wlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j
	6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr
	0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
	cSsGvfC2KfnxnUUI43ZEXa7IU5_-PUUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREBB2rqNlcjBwAdsO

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
 1 file changed, 104 insertions(+)
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
-- 
2.53.0

