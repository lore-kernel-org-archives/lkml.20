Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794892982;
	b=nT5LWYih0BNefgdZuI8wkXrSRCrsP3VwwvTjj+v0N8SphnMZF8+j7n5kIIzte6Kt6p8f
	 OY3LjhLVgK3SacbJwova8KTHZm5gfnQEz+bxuYNy74geaq1mxDsAj5FCeRTTohRUTfVNI
	 BTeA50kt7wLL/kJ8Aq/+CiDVW38BX9xfVNcIBgp1FPgQfC+9/IYBRaQGnEJRfAaiAk9n0
	 yYkwUbHuf4M6//gZFGGm49r/XDLw8zy5s5hqISeeuJZBTiLaFH8lY+h2UO2Asn9/JiC1J
	 /lZE9CB+5MSvgElsg5tSk3DtwGA2GIesRGm0BvqYFxBOA0SjON2n/bKubtvfxx1Npig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794892982;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=31b9JNt65Yxrug1LN8vG9BjZbzLc7SOgE34Mxiobvik=;
	b=PcPMVponCZyzZ1EHLQIMxa1cbR5XbxE3Sm0UDOKfqqw/ELFEMoHALbDcrntoOk6735mw
	 tjzwWlJQhez9BmvVGBfZNCmkss0eOgVOnhAxHLIqp62OSKBmWKB0Kf3NoESqM2vsLsanM
	 8lXXDdCq1rYWaMw4b3pRsIX9Wc7oJpOZMJTVNqoO6BfVmkPvRXLJ509MhRtRISxpHFIA7
	 MyTvks9dI4UHfplv2/JIITbuNgWemNho/+ipGQfSs6/9Cnqdva9YEb0kBq1loAg9lcAsH
	 8SmQtGaJVIRWesg5YDUey/rJKMS8uhcHVizZEbNW/wQW+6kfH3nmYNI9pxaz5so8O0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=Wos2GmYz;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7875A606A31C;
	Tue, 17 Nov 2026 05:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7875A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=Wos2GmYz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=31b9JNt65Yxrug1LN8vG9BjZbzLc7SOgE3
	4Mxiobvik=; b=Wos2GmYz4wT1yqHDfX3UepwLqNl69xsD2isOLA16G34OFlX14l
	nl3qjvh+0WC9wz3UHoG7bNNeO5WP25JxVUEf3kwUYoDDJWvhoZ4dsqiuZ0xtSF24
	XJYgzxjVwj+6cQNkJU9p5E4XE908OWhozXhhJv4g6RHvSPXlhkjlHSI0k=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.190.181])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgBHxTmx5PtqLkTLAA--.216S3;
	Tue, 17 Nov 2026 13:22:58 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v12 1/2] regulator: dt-bindings: willsemi,wl2868c: add the WL2868C camera PMIC
Date: Tue, 17 Nov 2026 13:22:56 +0800
Message-ID: <20261117052257.34849-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117052257.34849-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261117052257.34849-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgBHxTmx5PtqLkTLAA--.216S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCrW5JF45urykZr17WF4kZwb_yoWrZw4rpF
	Z8GrsFkFs5Cr1xG3yxK3W8u3W3KF1rArn5Ar1UC348Kan0qFnaqr9Iyw15Za4Yyw48GFW2
	yryqvF47J3WrZrJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPSb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4
	AK67AK6r4rMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	W8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7I
	U5l2MUUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREOB2r7WdojVwAvsQ

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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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

