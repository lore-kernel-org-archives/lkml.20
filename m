Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793077859;
	b=cCbxr1w3sPNxOvdgj4Tzq4mY3DkHnIuDxjn/oMZr8I1pofkfI6kuDvvSPsHztRo33N+l
	 C23bIu/r5p+jUnzsGUsKjD0vmqjotQj3U5rd3o9dam9N2wAGKOeQEos4TnONFn1i17uYy
	 YjmuRfOkqtZNC2uNri3Lnrg/cOGWVIu6pGa/e1v1gv+asyiV/v66oNbGDISMkWg3MiPgB
	 vlW5krI0iZNHvdc4JzSg9yBiohjGo5POmHWs8yvVnCBLeFoh8cf61Q/cygmM/wzDxdDGN
	 sA9vUj00SO6K3pAf3RKeWam0FwPdDDFBrqwr8XFiz1/HQX/XCEKDqCEFLfLxPPR18Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793077859;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=QjHBbcufilOtvd9YgPfia52EB/wzirTIBTpLeY0LtBs=;
	b=MrBoCMUIneabM7QRbExrnAYQxToFemWSaKmSuhfI07wMVZXNGcLz2Lp6xn0iraBJxFNl
	 oyjL7oLb+s4TFg3NmNfbJgapGmvpwc5JxRhKbi6d8ThCIcnqaJVZpIF23hRfIyflS6ozH
	 EIjL6g7cVvIEgo4v8m6pomGQVHHs49n6Mzw22k7eSpG9kqpmii6KUSYrqGtKx/qJajoux
	 6DXwx1ECAZOpgAx6qBaf9vb0U/c6cXjgAeVEKHE1vfUbB78YYov4vPMJn362mBupkQcvF
	 r6Zktp2wCYcwvR0SZU1OKmWAOrlHTInFYcVfd4hLgxldxNkVzD6kRj9cSlG60OvrADw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=uvZF2bnE;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE5F606A31B;
	Tue, 27 Oct 2026 05:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BE5F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=uvZF2bnE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=QjHBbcufil
	Otvd9YgPfia52EB/wzirTIBTpLeY0LtBs=; b=uvZF2bnE5b/vqipt5ggVlZcCSu
	77flH0Rb3aG99VgLzao7VVpNfDjcVR5XZDPNqtNalRF8lnaj1qvtmBeun6Y7CxhI
	MHFFU5zi1r+vWQ/f0MVKnt6PFPHTqlsw9961awLx9CSEhOUN7nVedqpJwQac/Sne
	vG266jvyrRY6/Z8+U=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.177.11])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgBn5DhgMuBqVYhOAA--.275S2;
	Tue, 27 Oct 2026 13:10:56 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: regulator: add Will Semiconductor WL2868C PMIC
Date: Tue, 27 Oct 2026 13:10:55 +0800
Message-ID: <20261027051055.213301-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
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
X-CM-TRANSID:3pYKCgBn5DhgMuBqVYhOAA--.275S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXr1xAw15tF4DJFyUAFykuFg_yoW5Wr13pF
	4kurZxCry09FyxGw4fGa4S9w15WryrCw1vyr9Fyw18tFy5JFnav34akw15Z3WrArWkGFWI
	yFyDZF17KF18Z3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkSb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l
	42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
	6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2FksUUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARENB2rfqlYHDgA4si

Add DT binding for the Will Semiconductor WL2868C camera PMIC with
seven programmable LDOs.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
 MAINTAINERS                                        |    6 ++
 .../bindings/regulator/willsemi,wl2868c.yaml       |   67 ++++++++++++++++++++
 2 files changed, 73 insertions(+)
---
 .../bindings/regulator/willsemi,wl2868c.yaml  | 67 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml

diff --git a/Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml b/Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
new file mode 100644
index 000000000..8dc729c90
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
@@ -0,0 +1,67 @@
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
+  Seven programmable LDOs with separate inputs for LDO1/2, LDO3/4,
+  LDO5, LDO6 and LDO7. LDO1/2 support 0.496 to 1.512 V and LDO3-7
+  support 1.504 to 3.544 V, in 8 mV steps.
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
+  vin12-supply: true
+  vin34-supply: true
+  vin5-supply: true
+  vin6-supply: true
+  vin7-supply: true
+
+  regulators:
+    type: object
+    additionalProperties: false
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
+                    regulator-min-microvolt = <1200000>;
+                    regulator-max-microvolt = <1200000>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 620fdef73..f598dcf4e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29285,6 +29285,12 @@ F:	include/linux/regulator/
 F:	include/uapi/regulator/
 K:	regulator_get_optional
 
+WILLSEMI WL2868C CAMERA PMIC DRIVER
+M:	Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
+
 VOLTAGE AND CURRENT REGULATOR IRQ HELPERS
 R:	Matti Vaittinen <mazziesaccount@gmail.com>
 F:	drivers/regulator/irq_helpers.c
-- 
2.53.0

