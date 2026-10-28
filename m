Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793189087;
	b=HGnrO5+QHUbabymbWRlfl4vJoUtjngZQOALEP7hpDry8ql6bdi7j51+LIrxds60x8q+t
	 GQ9IUdhDGYxxs1WkPeOKzgaf0CIhA2j9W08AdphTngH0e/Qr0VlSvSYA7mfuZsnPeqHYc
	 v6jgRprxMN+tYswbX28An7tldKKw7SDeWUb4ZjXf8gXoZl41ZBef+4Y5uLkgC4sLXVhVa
	 W3lgf4FVpq2gt9eGGm8pELBcOacPuL0QCVzWdGeo4Asyyn6aM0QLIds1fR6YlLzPVCCqZ
	 mAXNuibLzyssO8jX4Oot5lMIxy9a8jH6L+7Mb8pWnJOQLOhCsTZq1LAAFQTYi9rhR6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793189087;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=NpUDO29bN7DsBNoG1utxSe3fpPv2KWrE9Pv0OY5SUTY=;
	b=KLhv3+Tv4T6PZORjw2vRiGjLLacLLRf8UciyOqbocFoxtkbv+aGfGCIHRpYeOctwnTbU
	 m1MRXGHfnLbnIuTV4kLyMC0KLdac87kMkJZ72Lfu5VYRDzrnG5Wfyy7jtVUM0hjgCsys7
	 ydcmYzIvEPbobn6dk0qg40nnH8XovoP321ivqgeI8AHlLFNeL3dQ8r+w7olC36nbXUiL3
	 G6FZ6kG5ArT3Ws1L3mDq/ub+CONfVcQa0oDH+5/dRe+vK/xXo8J3bAm2gSCQiFAYJAT7P
	 /muE21/mLFtCTz9DhanqEG2MsGkJvBTBY2d8LRX1Tqhze5cSVbbWf8n5lJTEvjgKR9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b="axIcbnk/";
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52BF2606A325;
	Wed, 28 Oct 2026 12:04:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52BF2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=axIcbnk/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=NpUDO29bN7
	DsBNoG1utxSe3fpPv2KWrE9Pv0OY5SUTY=; b=axIcbnk/WhemhkRq78pq8UnzpP
	bq++u6npuhHLzEo7Efa3K+732h2a2DTHSN0MVagcFIsOI0ksmcdz8t0EufYp0B5O
	TquaAoSAvjVHggNB2WJfqNwgTLMm3ozJ9AB9f144wH1Qf+yhNb0VeKKtPw7Ahxjt
	HIQ3+f3VFlDMvS8g0=
Received: from xuqianhui.tail7a2807.ts.net (unknown [114.214.180.23])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgBn1ira5OFqM9dYAA--.3602S2;
	Wed, 28 Oct 2026 20:04:42 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] regulator: dt-bindings: willsemi,wl2868c: add the WL2868C camera PMIC
Date: Wed, 28 Oct 2026 20:04:42 +0800
Message-ID: <20261028120442.99375-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgBn1ira5OFqM9dYAA--.3602S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWF18tFy3KryDKFWxAFWfuFg_yoWrurWfpF
	Z8ursFkryrKF1xG3yxGa4xZ3WY9as5Jwnayr12y34rKay5tFnYvwnIyw1Yv3WrAry8Gay2
	yFyqkr42yF18Z3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1D
	MxkIecxEwVAFwVW5JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
	026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
	JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
	vEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE
	14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyT
	uYvjxUgM7NUUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREOB2rg+9ZksQAKsh

The WL2868C is a camera power management IC with seven programmable LDOs.
LDO1 and LDO2 share the VIN12 input, LDO3 and LDO4 share VIN34, and LDO5 to
LDO7 have one input each. LDO1 and LDO2 cover 0.496 V to 1.512 V, the other
five cover 1.504 V to 3.544 V, all in 8 mV steps.

It is used on the Lenovo Legion Tab (TB322FC, SM8750), where the two camera
sensors take their DVDD, AVDD and DOVDD rails from LDO1 to LDO5 and LDO7.
Without this binding those supply references cannot be described, so the
camera stack on that board cannot be brought up.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
Changes in v2:
 - Regenerated with git format-patch from a real commit on pristine
   7.3-rc7.  v1 was sent with a diffstat typed into the commit message, so
   the mail carried two of them; that is what Krzysztof called a broken
   patch.
 - Subject rewritten to the regulator tree style:
   "regulator: dt-bindings: willsemi,wl2868c: ..." (was
   "dt-bindings: regulator: ...").
 - MAINTAINERS: the entry was in the V section while its name starts with
   W.  Moved between WIIMOTE and WILOCITY, and renamed from "WILLSEMI
   WL2868C CAMERA PMIC DRIVER" to "WILLSEMI WL2868C CAMERA PMIC" since
   there is no driver in this patch.
 - MAINTAINERS: dropped L: linux-media@vger.kernel.org, using
   L: linux-kernel@vger.kernel.org like the other single-file regulator
   bindings.  The device registers as a regulator, so the regulator tree
   is where it belongs.
 - Commit message now says who uses the binding: the camera PMIC on the
   Lenovo Legion Tab (TB322FC, SM8750), supplying DVDD/AVDD/DOVDD of both
   camera sensors.
 - Binding: gave the five input supplies descriptions, grouped the
   regulators patternProperties, used the real board voltage in the
   example, and added the closing "..." marker.
 .../bindings/regulator/willsemi,wl2868c.yaml  | 79 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml

diff --git a/Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml b/Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
new file mode 100644
index 000000000..7abbd53fd
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
+                    regulator-min-microvolt = <1128000>;
+                    regulator-max-microvolt = <1128000>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8..632b17b3e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29413,6 +29413,12 @@ L:	linux-input@vger.kernel.org
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

