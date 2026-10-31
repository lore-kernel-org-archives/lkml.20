Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793429742;
	b=O/LoDaJAqnqtrM9zjlqpkd8OvSxXT0XjhXJ/woXM0VdkgToZqC+GWNlid8VgfQ57hog2
	 MqJ2cqGejTy0umqbpHDwEGjZSJuIm7GTa1DyRe8TTGJ2AvldLR5p00hEPIeoHQcPsJvwb
	 fSKeAbW0x3suM3TE2JKMuO1TvwK5eEtu0wTYyfwdzUcSaISS66ONAYB3jATnuPJ6kYzD/
	 8N+gp0yCao3g2LQwUXtMYm4aW2Ubl4zbpUDvqt9qs5azYW2vNdOwgY2+J8PwMDzpnNBUD
	 2l4L4LupOcQyAXKjwHsbMwmFFnN01+n+UlAGa6b2+Nfnx1Y3ioacfwdw7d+9nxK/drg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793429742;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=a7jemQyT7LfB3Ed1PQqf5uO2W5QbjRHcY2qO+/5nEMM=;
	b=GxA3iPCXfhrlA+ZseAKXSvqyPKqS+S6wEKEuOtceDmCjLUlFU4mGU3xAS3IH40V96ns3
	 pUQ3GJHTEmN1m36N+ScG6CjIRaxyCBOPWTm546FTDoIMpnc6VtMpcBlI1XR8k9hYuxMg+
	 GUYIu8+gdngz53YTXLovEAeAt9teSKUNQmsK6HCqST3rzOFmPbsnBOBedMXqlGCld072T
	 jK8li8x/V/vTKwImRzJWIxdLWZ8hEfbpSVt7RZB7RZ4NRG2f2OOmkJv87T6wjrceGJmO8
	 dNyI+VPhOnmoeoikGhLUn+sJtGR78HZ0ii6Z26jCJzxsfrFSnY40FH+Tc88MxaphRwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=ka6ZeFwT;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12CCB606A31A;
	Sat, 31 Oct 2026 06:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12CCB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=ka6ZeFwT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=a7jemQyT7LfB3Ed1PQqf5uO2W5QbjRHcY2
	qO+/5nEMM=; b=ka6ZeFwTyHOI0RYLN+0QxDvNtm8Dcm7evdbfY3AW9FGYe1JmP/
	3wh1UKkP6nm7COSLgMesqPNQ03prnaxrSl6E+QHgpXXp7vT1gq82ncY8biYwX7LS
	LCb0/ZmA4j3ODVGzRIhDN6ESxPNNdIx3BHShxEYfBs884NYuGrH1mNK4Y=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.177.113])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCH_THmkOVqQXFtAA--.295S3;
	Sat, 31 Oct 2026 14:55:34 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/4] regulator: dt-bindings: willsemi,wl2868c: add the WL2868C camera PMIC
Date: Sat, 31 Oct 2026 14:55:31 +0800
Message-ID: <7f2062a377f701fbaa649f31c954edcce15b4d12.1793427040.git.xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793427040.git.xiaqinghuan@mail.ustc.edu.cn>
References: <cover.1793427040.git.xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgCH_THmkOVqQXFtAA--.295S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCrW5JF45urykZr17WF4kZwb_yoWrJFW5pa
	98uFsrKr4FgF1xW3yxKa48uw1agF9Yyr9Yyr1UAry8Ka98Jasaq3sIkwn8Z3W5AFy8JFZF
	kF9F9r47tF1ru3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPIb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4
	AK67AK6r47MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr
	0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07j3
	nYrUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREQB2rk8FYCLwA6s4

The WL2868C is an I2C-controlled camera power management IC from Will
Semiconductor. It provides seven programmable LDOs: LDO1 and LDO2 are
fed from a shared VIN12 input and cover 0.496 V to 1.512 V, LDO3 and
LDO4 share VIN34, and LDO5 to LDO7 each have their own input, covering
1.504 V to 3.544 V. All outputs are programmable in 8 mV steps and are
gated by per-output enable bits with a chip-wide SYS_EN master. The
chip also exposes an optional active-low RST_N input.

Its user on the Lenovo Legion Tab (TB322FC, SM8750) is the camera
subsystem: the rear samsung,s5kjns sensor takes DVDD from LDO1, AVDD
from LDO4 and DOVDD from LDO7, and the rear giantec,gt9764 voice coil
motor takes VDD from LDO5 and VDDIO from LDO7. The front sensor is
powered from LDO2, LDO3 and LDO7, but its binding is still pending, so
its supply wiring follows with that series. The board DTS patch of this
series describes the supply wiring that is documented; LDO6 is the only
output with no user on this board.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 .../devicetree/bindings/arm/qcom.yaml         |  1 +
 .../bindings/regulator/willsemi,wl2868c.yaml  | 79 +++++++++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df78..41d5e65c4e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1168,6 +1168,7 @@ properties:
 
       - items:
           - enum:
+              - lenovo,elden
               - qcom,sm8750-mtp
               - qcom,sm8750-qrd
           - const: qcom,sm8750
diff --git a/Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml b/Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
new file mode 100644
index 0000000000..96541870cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
@@ -0,0 +1,79 @@
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
+    description: Input supply for LDO7.
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
-- 
2.53.0

