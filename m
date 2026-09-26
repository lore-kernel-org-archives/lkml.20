Received: from outbound.mr.icloud.com (mr-2001f-snip4-2.eps.apple.com [57.103.68.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D28343BDA4
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.68.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790428571; cv=none; b=guJtHdZQpfTSRmCQEQ9hlPgMRXVsU8UkU8HjwupR4dn72UAecw4TlS2tbWrGm5s26pZXASlhTqkb512Q/IcoqEAndZTnVsZYmN5eqgv32uKADLtPPjLAKvciYmA3al2a5sPGdKDAf1vi2fcceQkop+OJvDDGfoR1AGHtj4VS/4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790428571; c=relaxed/simple;
	bh=qdOrtnCE/B55w8AT9/TM1IvO5YsVdzx1xD6k1APekT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JAFVTke6k1LshbfNffhx6E9GsHUpgZCXEf9mw76GqK3soqfzA6a56JzHC0D9kYpEXHqEDmib+1hk+gBTQGDDejEooBFefAR+8tlLkO3vJ1jm94C3cDTffnN51wjU/lmLpmX9DVusTjHmWCV3SGkrOqTGXsUIb/eEgTj/lY2dZGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=UQQqwPhw; arc=none smtp.client-ip=57.103.68.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="UQQqwPhw"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPS id 143F21800176;
	Sat, 26 Sep 2026 13:16:03 +0000 (UTC)
X-ICL-RepId: 01a0dddb-ca17-7952-a455-5d561ad04297
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGQZAXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOA1QFXR8RTxweGwVGA11cG1YPUl1TQw9MCwh3AlEcVg1XQ1QEX04ZDEodUlZbE1UXRgk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1790428568; x=1793020568; bh=4tQrqFmskGMxOqrEHJkoZAQL7YVs5Ut8I4pEsgnJ0F4=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=UQQqwPhwtVwJbcvywoiaqyoEqJQyva4V4mzzFcJk8g4gDOhOzxMbMNaIaKghAQG8SqhQsJ3EBZhiyQB/P0GN4waxvzniCXp+AGZaymEHT+WODJBY/ZDvlbQe+7rkiPLArp2PD6GYJWpgTZaKSfgOl3L7eQ0Tl68aYJEIjF76aMD9SRuYHGL+Xi0Wob2a9GY06u0xWkwT0zgmFdF41blxpf3Cm0S26Qrjr/UrZ2UKhjP4e63Fcd6Tnmo18xM4SusGCvl9xNc1eexNEaWpf0SHoDneS/ZJ2iOz/SEAKtH6oh76eBEORXNHIzxtz6r3Vho4pFnNoQTzhAQPqhcb+bvngQ==
Received: from [127.0.0.1] (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPSA id B56A118019E9;
	Sat, 26 Sep 2026 13:16:00 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Sat, 26 Sep 2026 15:14:40 +0200
Subject: [PATCH v2 01/17] dt-bindings: media: add apple,avd
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-avd-v2-1-ecebe6a3648e@icloud.com>
References: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
In-Reply-To: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sofus Forstreuter <sofus.c@icloud.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: _lP8MCVoO0kmLsDWJo_473_ojsJwn96U
X-Proofpoint-ORIG-GUID: _lP8MCVoO0kmLsDWJo_473_ojsJwn96U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA1MiBTYWx0ZWRfX9EUcw8xUk4rZ
 HUFThdmfChzT2aNZ/obkbECU36PIcpU9X+ikMZmsBCx3EiOwolegMLeEnvbT3YzYK7vcHO6akU5
 6vBT8cLedoUAT+QpBJHKny5ILbtFZOAKzl2QvmSu/+GTf17INl8iWDVg2wVZ+2xpqzmYz/ViLBc
 LEEF20r7/RALfbXI/dGieLi5/dlYVw8HpGp4HSFfS2+goXD/xa1kv0IGbRVcD3+mAVC7ADsI3lG
 j6niSQREo+1mukmubP9j8vpxuN5Qu9FqkZhdP2YitJFqLdRug85Z/NleQfWpwHX0ZSRLcIQNdSu
 uFueIHuJmHesmpZszGRmfcdldVmV0kALweDlIRIQFfkIUPXkhY07a9YYZxUGNo=
X-Authority-Info-Out: v=2.4 cv=JLM2csKb c=1 sm=1 tr=0 ts=6ab7c595
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=v3ZZPjhaAAAA:8 a=8V0BG8AgQ9fJwKtalr0A:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22
X-JNJ: AAAAAAABf9uCoICivkxEzGY+g/e21yv2FZv8RZIX6rLqFdY0G/H11m5nsmfuYf1FZhV7Eb1hKZlXH/0hSB61UCzr9h/Ju9pg4NFb/hXDKvilEL91kBT/Qrq7OhYJ7ME54duPgjilfm7m/+TVSxN3trP3JobNFJe1WS6NcLZaQfR8R3SUsGXimV735clWTpZ1T67dqLgx+Pn54+HlO0au8hmq44qeB4mU5hNrjZBGuX+pBtDDPzZmv4SbqWHal1V4Jy9ihvF/iyNjrLwRSPBTbmAk09AxOIWJVt9PBwI4yvPH2YPloLCkZBDE+rB0Bzd5kX5JjbK5Bc7X2cr6/EnfQH85WnWIZz97lp4PPVYnZESnQ41DCsrxljpeuAAbESKCqBdignmHeNHgD8AgPaJglZjwfVlJzNHUJ84GGojIyl/U91u+pjkq8n3XZnO9k5mJSaaTd5eu1/Kx7ZpMQTvucXd+EeuIz6/qKKEC66dGbiSmaJMb6b4NOGpkvMnJ6QbK+pwoGAL6HG8XZ/gaLrvtLHopG5NJqhhb51QI/m9xLR324rFhtf2lmdoAJvHIkGuBJMjl15BbI+XSycZzmOTxJmGl/7PFkSQaql88Y/gE4GAp/f4t9pwI7Kkq9kjaVA0fdQzd0W6wa3lsR5sxZ5UDpoYPpunPeg/qsmkb68erBcurlIMRW2jWh52rr4N0E1hrqjGI2O/Rsnc4r2smW0zsvFMDdD7r7F1eRh4b+yA1ct0xPs/2+eG5LMJOi/ivdnUFC1nUYwrwn5i0JzA0PkG88grIBsNKizlFH4XkSPpPuZniODn8Xiu+1V91pBxConxNaUa6vioJPFRSQwqbhzitzFZp7pDJpSwArspqgdyQQByEEIpQlX+mC0IBIBQwrFRmkO7umYr4pwWiAZgv1SlgvBYT+VM=

Document the Apple Video Decoder. A hardware video decoder present on
Apple hardware.

Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 .../devicetree/bindings/media/apple,avd.yaml       | 127 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 128 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/apple,avd.yaml b/Documentation/devicetree/bindings/media/apple,avd.yaml
new file mode 100644
index 000000000000..0aa2cffae50f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/apple,avd.yaml
@@ -0,0 +1,127 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/apple,avd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple Video Decoder (AVD)
+
+description: |
+  AVD is a stateless video decode IP block present on Apple devices.
+  Notably it includes an ARM Cortex-M3 and associated DMA controller.
+  AVD is capable of decoding H264, H265, VP9 and AV1 on newer SoCs.
+
+  The IP does not change much, with changes being mostly the CM3 having more
+  memory and interrupts.
+
+maintainers:
+  - Sofus Forstreuter <sofus.c@icloud.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - apple,t6030-avd
+              - apple,t6031-avd
+          - const: apple,t8122-avd
+      - enum:
+          - apple,t8103-avd
+          - apple,t8112-avd
+          - apple,t8122-avd
+          - apple,t6000-avd
+          - apple,t6020-avd
+
+  reg:
+    items:
+      - description: DMA control
+      - description: Cortex-M3 code (unsigned)
+      - description: Cortex-M3 sram
+      - description: Mailbox
+      - description: Video decode control
+
+  reg-names:
+    items:
+      - const: piodma
+      - const: code
+      - const: sram
+      - const: mbox
+      - const: ctrl
+
+  iommus:
+    items:
+      - description: Decode related
+      - description: DMA controller
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: mailbox 0
+      - description: mailbox 1
+      - description: mailbox 2
+      - description: mailbox 3
+      - description: flag 0
+      - description: flag 1
+      - description: DMA status
+    description: |
+      Notably there are no decode related interrupts. All decode related
+      interrupts are sent to the CM3.
+
+  interrupt-names:
+    items:
+      - const: mbox0
+      - const: mbox1
+      - const: mbox2
+      - const: mbox3
+      - const: flag0
+      - const: flag1
+      - const: piodma
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reg-names
+  - iommus
+  - power-domains
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/apple-aic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        video-codec@289070000 {
+            compatible = "apple,t8122-avd";
+            reg = <0x2 0x89070000 0x0 0x4000>,
+                  <0x2 0x89080000 0x0 0x10000>,
+                  <0x2 0x89092000 0x0 0x14000>,
+                  <0x2 0x890a4000 0x0 0x4000>,
+                  <0x2 0x89100000 0x0 0x10000>;
+            reg-names = "piodma", "code", "sram", "mbox", "ctrl";
+            interrupt-parent = <&aic>;
+            interrupts = <AIC_IRQ 679 IRQ_TYPE_LEVEL_HIGH>,
+                         <AIC_IRQ 680 IRQ_TYPE_LEVEL_HIGH>,
+                         <AIC_IRQ 681 IRQ_TYPE_LEVEL_HIGH>,
+                         <AIC_IRQ 682 IRQ_TYPE_LEVEL_HIGH>,
+                         <AIC_IRQ 683 IRQ_TYPE_LEVEL_HIGH>,
+                         <AIC_IRQ 684 IRQ_TYPE_LEVEL_HIGH>,
+                         <AIC_IRQ 685 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "mbox0", "mbox1", "mbox2", "mbox3",
+                              "flag0", "flag1", "piodma";
+            power-domains = <&ps_avd_sys>;
+            resets = <&ps_avd_sys>;
+            iommus = <&avd_dart 0>, <&avd_dart 1>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 4cc4a2dc6d30..3c7c5fe3f0bc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2643,6 +2643,7 @@ F:	Documentation/devicetree/bindings/iommu/apple,dart.yaml
 F:	Documentation/devicetree/bindings/iommu/apple,sart.yaml
 F:	Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 F:	Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
+F:	Documentation/devicetree/bindings/media/apple,avd.yaml
 F:	Documentation/devicetree/bindings/mfd/apple,smc.yaml
 F:	Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml
 F:	Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml

-- 
2.55.0

