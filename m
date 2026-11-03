Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693712;
	b=aP2RBMi+sgSExI1RcexxErSy8jcVHCCdTbc87jR6bG+MUqJOT7NyW3Flv8MaTgWYzlyU
	 G/Cs+rFH7rNPMLI1j2MkQAMRWjGsH60V+P8juU8Jipue9uCjTPbxFhtAKTh71ZdL3Bnm+
	 0M2b27Jt8dyUxpa3Oz8k59I4dzVNugKnAhnAPUSPzZ+K3D+jAeRmhl8S4OdeWsgsKtNSK
	 lD++3Xg8e9aqxg4QYABiq3fvoBwJ3TNqVniH3bZvoFdEDhdQP2qvDeJKx8L1bgr8ezunM
	 XCiOLVUY3YMP+q0fr2YDAB+Fz8CvxN15wT1lmDTAjAa3CyhbgLuRiHIpKtGni+GXmAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693712;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=BliLsDRj4BVefHY0apAlXatRGt/1Hw6rKHjbEQ5OtPA=;
	b=gA6SrxDm3eNNoU2RZoi0t6mZqvKm8fJEkleHVflTvJqVp5IUQEYeFJ2qM6SGsTdgHMdm
	 QtMsM4JBPdeSqi5bkf3r3UFz0K1SVSSIUXjvoXmgLgjnK4HvX4VRlyC4od1SnAzrMkqvw
	 x8X6D3Vv2SaiHaJfNYa7CkIP6o1xxKPOVK/OOOAldYNnimQybRKIRzhbD3hhsAIBP6Yrt
	 DipWAbOj97ZSxa9DMPUc+2TrWHD7XfB21VsMQyvK3/BjlGMx1ww0fGXz94WoSVsNHtwAk
	 QXTk7fuHaqdecXrw7wUp4S2ZcEBSUNJTGqyh4UYxJQGf378GH6KWotgEuSI4t6wXYfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.25
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7509C606A332;
	Tue,  3 Nov 2026 08:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7509C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.98])
	by APP-05 (Coremail) with SMTP id zQCowABH4LX3l+lq3fQ9AA--.19826S3;
	Tue, 03 Nov 2026 16:14:52 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wei Fu <wefu@redhat.com>,
	Drew Fustini <dfustini@tenstorrent.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Han Gao <rabenda.cn@gmail.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/2] dt-bindings: phy: add binding for T-Head TH1520 USB PHY
Date: Tue,  3 Nov 2026 16:14:43 +0800
Message-ID: <20261103081444.1983071-2-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103081444.1983071-1-zhengxingda@iscas.ac.cn>
References: <20261103081444.1983071-1-zhengxingda@iscas.ac.cn>
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
X-CM-TRANSID:zQCowABH4LX3l+lq3fQ9AA--.19826S3
X-Coremail-Antispam: 1UD129KBjvJXoWxurWfuryDGFykJry8tFWUJwb_yoW5XFyUpa
	yfGr1ftwnagrna9w4fJF10kF1fKrs5ZF1Fqr17Ww18Xws0g3WFq3sFkr15ZF48Jr48ZFW7
	uFs09Fy2kF17Cw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQYb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4
	IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8aiiDUUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

The TH1520 SoC features a Synopsys USB 3.0 FemtoPHY with some custom
glue logic configuring PHY parameters.

Add a binding for it.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
Changes in v4:
- Finally added Conor's R-b.
Changes in v3:
- Re-add avdd33-usb3-supply to the required properties list.
- Add reg to the required properties list, as this is a MMIO peripheral.
Changes in v2:
- Lifted avdd33-usb3-supply from required properties list. Because of
  this the R-b from Conor isn't added yet for reconfirmation. (The
  related regulator isn't yet controllable because no driver is
  available.)

 .../bindings/phy/thead,th1520-usb-phy.yaml    | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/thead,th1520-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/thead,th1520-usb-phy.yaml b/Documentation/devicetree/bindings/phy/thead,th1520-usb-phy.yaml
new file mode 100644
index 0000000000000..0d2494a71b2bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/thead,th1520-usb-phy.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/thead,th1520-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-Head TH1520 USB PHY
+
+description: |
+  The T-HEAD TH1520 USB PHY is a Synopsys USB 3.0 FemtoPHY glued with some
+  custom logic to configure PHY parameters.
+
+maintainers:
+  - Icenowy Zheng <zhengxingda@iscas.ac.cn>
+  - Wei Fu <wefu@redhat.com>
+  - Drew Fustini <dfustini@tenstorrent.com>
+
+properties:
+  compatible:
+    const: thead,th1520-usb-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: PHY bus clock
+      - description: PHY reference clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: ref
+
+  resets:
+    items:
+      - description: PHY bus reset
+      - description: PHY reset
+
+  reset-names:
+    items:
+      - const: bus
+      - const: phy
+
+  avdd33-usb3-supply:
+    description: |
+      3.3V power supply for the PHY, named AVDD33_USB3 in the SoC pin list.
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - avdd33-usb3-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@ec030000 {
+      compatible = "thead,th1520-usb-phy";
+      reg = <0xec030000 0x10000>;
+      #phy-cells = <0>;
+      clocks = <&clk_misc 1>, <&clk_misc 3>;
+      clock-names = "bus", "ref";
+      resets = <&rst_misc 6>, <&rst_misc 7>;
+      reset-names = "bus", "phy";
+      avdd33-usb3-supply = <&avdd33_usb3>;
+    };
-- 
2.56.0

