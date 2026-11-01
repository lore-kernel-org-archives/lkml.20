Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.224.81.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793508128;
	b=Vy0wCqPB/6x2USiIpjRLWmUO6N6C4J6kqgJJBLAKy2emqjYJ7QAYr4pxHn/tINlh4AAm
	 vXRatMMb7FOKLg5hE3CDXwkcuptIahnXkDTHS4HNNYCpkNiQ/3n2Dz7fn/Vpk+WXewX6D
	 3RTPiIVi2C5StCcu9Ph6NKw7mCLSgOlmqtOg0JoqopjAY5Z4rlp84IFRppbNeB5zOvVEU
	 30kQYJZzj11BDbCrRyIzmsNKYzAf12VZXkH8ROP41+iQgg9lE5dMWFq35OZCA+uvm9EYH
	 R1ww4ycF72FzZ3Jh0WjbfT1jRNCcOEcFnyjQWYoGnlBvfKD3rPDQCPZGGpZnd3NRw9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793508128;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=1mF7Lz7IBagatGyxODZlzpHu7wr/RsOzyw+BwhJT0/k=;
	b=RzAyu8dKQZaln9OQDlXLuwyvDxDxI+ePRpdpPWlf4ClnNyysUkxZbpBOuksXc5WHh1XW
	 kD57MycvpiMy1gkHHaGH6NMciPBIetO8dHFS2eVjjiILQU66nCl6XXR5HxKSMuZLY6DI6
	 Vtoc50jQCY+WhFEvr+PijWx/UAU5Q9Nr030iTC5PtrDG8UMJKIQnQ1xSH/cfYkrSEhFZj
	 +h0z46gA/6D96syh1mZAAcYHrB5BoL2lKar2vJxAECONRy5FQtrdpe7pfoXTYxEkscusN
	 9sFyjjH1E3HrtfVkZX7R/NJI6zZ49varvN66MDC/GHI6Pr+H3HbC2c2TxQH8j8ex2uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=DZYz7dae;
	arc=none smtp.remote-ip=156.224.81.21
Received: from mail-m8121.xmail.ntesmail.com (mail-m8121.xmail.ntesmail.com [156.224.81.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ED6606A324;
	Sun,  1 Nov 2026 04:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99ED6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=DZYz7dae
Received: from 5950x.tail741d0a.ts.net (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 530dcc2cb;
	Sun, 1 Nov 2026 12:41:55 +0800 (GMT+08:00)
From: Xing Zheng <zhengxing@rock-chips.com>
To: broonie@kernel.org,
	heiko@sntech.de,
	linux-sound@vger.kernel.org
Cc: luca.ceresoli@bootlin.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	huangtao@rock-chips.com,
	sugar.zhang@rock-chips.com,
	lxt@rock-chips.com,
	xing.zheng@rock-chips.com
Subject: [PATCH v2 1/3] ASoC: dt-bindings: rk3308-codec: describe detection and ADC routing
Date: Sun,  1 Nov 2026 12:41:47 +0800
Message-Id: <20261101044149.2018744-2-zhengxing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261101044149.2018744-1-zhengxing@rock-chips.com>
References: <20261101040125.1864141-1-zhengxing@rock-chips.com>
 <20261101044149.2018744-1-zhengxing@rock-chips.com>
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
X-HM-Tid: 0aa1956a037103a8kunmda3ed7c817160b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSkIdVkIZTRoeGRkfSkpDS1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=DZYz7dae+TXlq1ldUaqpW2cEH5GfABvLiIGYNIy1MGEno4FbMWU1a0tJGI2pb/PSsI9hUx2r3OOU8cXxCATWLlHBnAAhVER2huRAHK5Oc9DXkR8b2OOSjvbAJuA7TNvoQjb2JVWImUb70GNE+zydg0X+Dee1WOOntiXZ8rYX3rA=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=1mF7Lz7IBagatGyxODZlzpHu7wr/RsOzyw+BwhJT0/k=;
	h=date:mime-version:subject:message-id:from;

Describe the optional detect-GRF phandle and named interrupt resources
used by the B/C headphone detector. Retain the legacy interrupt order
and index-based lookup when names are absent. Document the detector
disable and reversed-jack properties and their resource dependencies.

Describe the ADC stereo-group routing consumed by the codec driver.
Require four unique group IDs in the range 0-3, in I2S2 SDI order,
matching the driver's validation. Leave GRF routing unchanged when
the property is absent.

Extend the example with headphone-detection resources and ADC routing.
Keep machine-driver amplifier GPIOs and debug interfaces outside this
codec binding.

Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
---
Changes in v2:
- Retain the original detection descriptions and legacy IRQ ordering.
- Keep the binding change in its own patch before the codec change.

 .../bindings/sound/rockchip,rk3308-codec.yaml | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml b/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
index 2cf229a076f0..60c6140dc5df 100644
--- a/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
@@ -36,6 +36,49 @@ properties:
     description:
       Phandle to the General Register Files (GRF)
 
+  rockchip,detect-grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the detection GRF used for headphone insertion and
+      removal interrupts on codec revisions B and C.
+
+  interrupts:
+    description:
+      Keep the legacy interrupt order. If interrupt-names is omitted,
+      the driver uses the second interrupt for B/C headphone detection.
+    items:
+      - description: Legacy codec headphone detection interrupt
+      - description: Detection GRF headphone interrupt for revisions B and C
+
+  interrupt-names:
+    items:
+      - const: codec
+      - const: hpdet
+
+  rockchip,no-hp-det:
+    type: boolean
+    description: Disable the internal headphone detector.
+
+  rockchip,hp-jack-reversed:
+    type: boolean
+    description: Reverse the headphone detection polarity.
+
+  rockchip,adc-grps-route:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+      ADC stereo-group mapping to the four I2S2 SDI inputs. Each entry
+      selects the ADC group connected to the corresponding SDI input,
+      in SDI0 through SDI3 order. Group IDs 0 through 3 represent
+      MIC1/MIC2, MIC3/MIC4, MIC5/MIC6 and MIC7/MIC8 respectively.
+      All four groups must appear exactly once. For example, <1 2 3 0>
+      connects groups 1, 2, 3 and 0 to SDI0, SDI1, SDI2 and SDI3.
+      If omitted, the GRF routing is left unchanged.
+    minItems: 4
+    maxItems: 4
+    uniqueItems: true
+    items:
+      enum: [ 0, 1, 2, 3 ]
+
   clocks:
     items:
       - description: clock for TX
@@ -72,6 +115,12 @@ properties:
 
     enum: [ 50, 55, 60, 65, 70, 75, 80, 85 ]
 
+dependentRequired:
+  rockchip,detect-grf:
+    - interrupts
+  interrupt-names:
+    - interrupts
+
 required:
   - compatible
   - reg
@@ -85,11 +134,17 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/rk3308-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     audio_codec: audio-codec@ff560000 {
         compatible = "rockchip,rk3308-codec";
         reg = <0xff560000 0x10000>;
         rockchip,grf = <&grf>;
+        rockchip,detect-grf = <&detect_grf>;
+        interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "codec", "hpdet";
+        rockchip,adc-grps-route = <1 2 3 0>;
         clock-names = "mclk_tx", "mclk_rx", "hclk";
         clocks = <&cru SCLK_I2S2_8CH_TX_OUT>,
                  <&cru SCLK_I2S2_8CH_RX_OUT>,
