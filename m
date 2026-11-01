Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.236.53.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793505725;
	b=TMne07Vmzk5JnMiK6W0eZR1rn4Wq5KyohiW3gDh0sU3h/TAyHBUT4Q7AsW3zjsmi8KMq
	 9QWTajF2vRQUzwkPcjLbDj7XHPCBDS53vvEnNJnxtry7AHjF+wq4aozlIoC3/ELI+EM0F
	 10zigYUnH9g/SanJKnH3mtO2ZK9xukKVVm01Ogi/PqbAf75f7BTz3SL+Mg8g5oDWYWcwv
	 IizvU6S8/2NNHavH8uj/H6tesVsP/ba95+h52OxIY45CX7YC36/i+KKGz+sSDJ8uFArrE
	 6rvDaOpQEVs8RWGNhkDrizRzwAyIR9PA/VuMhhtGpu/jg9RT/cfBjAaKAqZnqpJOPtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793505725;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=5wKNpBs2J26ByKRc9aOZS7O7R2Kjv3Zvh9P1Rri0a20=;
	b=BTzpfo2E6rkRkYMZpSqjRSgIlNYesqsMn/rj0Krk7osNcL1LMZHIruDvjC5v0oiyBTLN
	 edjsycssZwdVmRLACHHwffnDK1TnKZa/kP+UY50uvd5Ub3rWypaaGg2RIzjM8ERV8QoOM
	 74QjYfXRbB1OE1XqXKeMfXOpi4Lciy5R6kV+23XUMu4eSQ8Jylms4fQLhgBagV42saxR4
	 vEOOe3Jt/wnuTjntKXG9b9i5tt6lohOpQXN6J1Aj8AOqpIqUi9skw5feFPAKpefFiLR82
	 eeuysWoKdNCZwunNXnDpnXpMgfAAZG0hOUAHxUu+CagBWSjNo70H6Whxx9607mNtszw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=PjO9korU;
	arc=none smtp.remote-ip=160.236.53.104
Received: from mail-m16023653104.xmail.ntesmail.com (mail-m16023653104.xmail.ntesmail.com [160.236.53.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E72606A331;
	Sun,  1 Nov 2026 04:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74E72606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=PjO9korU
Received: from 5950x.tail741d0a.ts.net (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 530d84144;
	Sun, 1 Nov 2026 12:01:52 +0800 (GMT+08:00)
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
Subject: [PATCH v1 3/6] ASoC: dt-bindings: rk3308-codec: describe ADC routing and jack detection
Date: Sun,  1 Nov 2026 12:01:22 +0800
Message-Id: <20261101040125.1864141-4-zhengxing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261101040125.1864141-1-zhengxing@rock-chips.com>
References: <20261101040125.1864141-1-zhengxing@rock-chips.com>
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
X-HM-Tid: 0aa195455a8603a8kunm8fccdc7416d2aa
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQk5IVh9MTU1CQkhKTxhKTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=PjO9korUbULQWdWwMJtqpHHF5S0BM6IRU4dLNro65Hf++GRScd+vgPOd0/cPrjqS6e9nbldhKRkElzgHmnIDMOCP81pw3Ty0RHmyw93Z4yFH+62bC/wag+wB+1IdaEddK0O3/1n28qfkbiysCgvLq6Yl/Fcfr85lzwQkgMCHYRE=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=5wKNpBs2J26ByKRc9aOZS7O7R2Kjv3Zvh9P1Rri0a20=;
	h=date:mime-version:subject:message-id:from;

Describe the internal ADC stereo-group mapping to I2S2 SDI inputs and
constrain it to a permutation of the four hardware groups.

Document the detection GRF, codec and headphone interrupts, and the
board-specific detection wiring for codec revisions B and C. Keep these
resources optional for existing device trees.

Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
---
 .../bindings/sound/rockchip,rk3308-codec.yaml | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml b/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
index 2cf229a076f0..68859c64b72b 100644
--- a/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
@@ -36,6 +36,46 @@ properties:
     description:
       Phandle to the General Register Files (GRF)
 
+  rockchip,detect-grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the detection GRF used for headphone insertion and
+      removal interrupts on codec revisions B and C.
+
+  interrupts:
+    items:
+      - description: Codec interrupt
+      - description: Detection GRF headphone interrupt for revisions B and C
+
+  interrupt-names:
+    items:
+      - const: codec
+      - const: hpdet
+
+  rockchip,no-hp-det:
+    type: boolean
+    description: The internal headphone detection input is not connected.
+
+  rockchip,hp-jack-reversed:
+    type: boolean
+    description: The headphone detection input has inverted insertion polarity.
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
@@ -72,6 +112,14 @@ properties:
 
     enum: [ 50, 55, 60, 65, 70, 75, 80, 85 ]
 
+dependentRequired:
+  rockchip,detect-grf:
+    - interrupts
+  interrupt-names:
+    - interrupts
+  rockchip,hp-jack-reversed:
+    - rockchip,detect-grf
+
 required:
   - compatible
   - reg
@@ -85,11 +133,17 @@ additionalProperties: false
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
