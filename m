Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793077856;
	b=fMrOhuQe7cgZezirFIj/TPoe7H6jN1cmseVcu7MGWL828QC6bvdymy0iYZTUvsCHWU5c
	 qw7OPFJsRDUiz0As0ZiEl0n35DmYB6fRnt6N8ZUTwQBW8/p1+vjBlx7k7s8O0wTEP1oC8
	 YmMGd+oNncOgy02ZauP7JZdkv8r/EciR+EJNVd9oTyiHnhOhqRp8ohjarLn6UP33qBq81
	 SdYmJENIz9j6HO7iUWE6hv+TRd8hKmkv4zVQzp61uU4OwhsMsCE7UV8qxLRknXR5TsOfu
	 4VQALJiYXTKooInLMZjLBkeo7wQQ2P3YnfiF20A7JJfFOoT9k9+Swdf/ZpNeXLcJApg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793077856;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=bbdqEEaQcGA4CdapGgLo/j4LzMygWzqzaEGLrtubLq0=;
	b=tcXK6t50nWCltacVcIA/5R0ctIYjtJXizepZM6F0mJ0UPB8kgcBedJqaegeUxi7cHoNy
	 tUldiWMMT+IuOG7Ev3Kz1rkVuLZChxJZZD46+8sipBDqffT9ypIDanxIj3ewqu08rmDOG
	 T1dC6UTRItXXW/PI3pHmY4ms97O8BshcJjBf0J+lYMv/4rhpH9Kg5B/5NI1DijG2k9A7Q
	 1dYES7yaoAVxBoC9CpZ6cpdqHMWDzsHdMu/avsF1Rx675sANjFQmRfYCepUFnFXUGNOl3
	 Pi8S2+jrcDStP9/oxxnjXX8Ivoep4A28wJMHMlgpRYpMZAC4VJrHp7RcdYoqAVb6MCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=I5+EzhYI;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 939D3606A31E;
	Tue, 27 Oct 2026 05:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 939D3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=I5+EzhYI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=bbdqEEaQcGA4CdapGgLo/j4LzMygWzqzaE
	GLrtubLq0=; b=I5+EzhYIqqeMXVJVIoPXNffR3X5SmDgrkQ5fwQ9P5fvDIvrBo6
	6YnRfuA0CxlPDhXc2POqbTGYzW+1zfm5F+zg3eFFB1iybEDXl2q6Bc0R/9JO9Oe+
	a9rIJiFXP/plEwKrh81Pv96MwCrAND7MkYhQEwjIhiw5QRW93fWTV7GYU=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.177.11])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgA3szdYMuBqJIhOAA--.1146S4;
	Tue, 27 Oct 2026 13:10:50 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: media: i2c: add Samsung S5KJNS image sensor
Date: Tue, 27 Oct 2026 13:10:48 +0800
Message-ID: <20261027051048.213177-3-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027051048.213177-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261027051048.213177-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgA3szdYMuBqJIhOAA--.1146S4
X-Coremail-Antispam: 1UD129KBjvJXoWxZF17CFW3Aw4kWr4rAFWkZwb_yoW5KFykp3
	Z5GFZxKFWFgr13Wws3Gw18CF4fXa1vyFWUCr17Xw1Syrs5JF9avw4Yk3s8Zas8CF1kuayf
	XF98Wry3Ga1S9w7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBab7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jVg4fUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARENB2rfqlYHDgA3st

Add DT binding for the Samsung S5KJNS MIPI CSI-2 image sensor.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
 MAINTAINERS                                        |    6 +
 .../bindings/media/i2c/samsung,s5kjns.yaml         |  120 ++++++++++++++++++++
 2 files changed, 126 insertions(+)
---
 .../bindings/media/i2c/samsung,s5kjns.yaml    | 120 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5kjns.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5kjns.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjns.yaml
new file mode 100644
index 000000000..6908c07c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjns.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/samsung,s5kjns.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5KJNS image sensor
+
+maintainers:
+  - Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
+
+description:
+  The s5kjns is a raw image sensor with an MIPI CSI-2 image data
+  interface and CCI (I2C compatible) control bus. The output format
+  is raw Bayer.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: samsung,s5kjns
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: 19.2 MHz input clock.
+
+  dovdd-supply: true
+
+  avdd-supply: true
+
+  dvdd-supply: true
+
+  lens-focus: true
+
+  flash-leds: true
+
+  power-domains:
+    maxItems: 1
+
+  reset-gpios:
+    description: Reference to the GPIO connected to the RESETB pin.
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+    description:
+      Output port node, single endpoint describing the CSI-2 transmitter.
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            items:
+              - const: 1
+              - const: 2
+              - const: 3
+              - const: 4
+
+          link-frequencies:
+            items:
+              - const: 672000000
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - dovdd-supply
+  - avdd-supply
+  - dvdd-supply
+  - reset-gpios
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@56 {
+            compatible = "samsung,s5kjns";
+            reg = <0x56>;
+
+            clocks = <&s5kjns_clk>;
+
+            reset-gpios = <&pio 19 GPIO_ACTIVE_LOW>;
+
+            avdd-supply = <&s5kjns_avdd>;
+            dovdd-supply = <&s5kjns_dovdd>;
+            dvdd-supply = <&s5kjns_dvdd>;
+
+            port {
+                sensor_out: endpoint {
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <672000000>;
+                    remote-endpoint = <&seninf_csi_port_0_in>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 6872ad5fe..620fdef73 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24416,6 +24416,12 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
 F:	drivers/media/i2c/s5kjn1.c
 
+SAMSUNG S5KJNS CAMERA DRIVER
+M:	Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/samsung,s5kjns.yaml
+
 SAMSUNG S5P Security SubSystem (SSS) DRIVER
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Vladimir Zapolskiy <vz@mleia.com>
-- 
2.53.0

