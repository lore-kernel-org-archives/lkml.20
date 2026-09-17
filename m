Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D9F3FFABF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678963; cv=none; b=eZkqRlqS/DCh18nqtm4ic9jmasY1oACaN53iZpff16T1go1+EgG+Ieb+p1Ay5xP0O6XWEYr+/Mn8y6RdZ41GRpWX/hsh9Hk3oeOUAjeyLvwhC8+7qSIPhCDj8oymGlQali4nUFNe/gzdE0Ef7fcU3JrUQzF1mP+IX2LgTgD4IM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678963; c=relaxed/simple;
	bh=8xj7kUdGgsVPCmxBLgs3dFbkoQPLuPzp6csuOKCL82I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HwpArOnsLM6nOJyvYcqfE7zUssAbGGz37gy/8DjNMUAGzA5Ck8QZ1y076wdSpnVNNF8E4zNfVk0pN8/7PioZxPOHDirvk9sp0Vu6ve7p+q+eoMu96YTtV+6PsjfA7E3zewmmDQ3kr+AT2Z6rM4z1nZq7SILy5v99w3eVY3d4mMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=a7VWaH2Y; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="a7VWaH2Y"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so969235e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789678960; x=1790283760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9AZ0+eI++/PlX83+JWP2Cs841uENpnsQxPBRefFFlIk=;
        b=a7VWaH2YtBBOzNNg9O5oBuirnKPuT9q6Shtnl2c25hnivyG8HheSxYJbAXjYhkrZ1d
         45Gc8+wVZn6xM7tyiErDO41hQgAwK5C8165JpuGJITkVn/U09koKoLdIc/aOIaFWClHp
         LL5Ka3JlqHpPsIGJcsp/dyXW65Pel5RlukokTd++VpcL22weOaHzr9MX1VE8y99249rr
         8ewTl6CUsBIFXpVy5CmymXNpgYU19SW3ggF/AzJ1/zTxGN01yBCKiOU6dRwcWA8TtD80
         xqJAv2JIgHq66wKJRwZA1k1lwgXxTNiW8E5i2LM1ymC4urYEH2cp4tpMAehjg6bdAZ53
         UXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678960; x=1790283760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9AZ0+eI++/PlX83+JWP2Cs841uENpnsQxPBRefFFlIk=;
        b=ADgVsRQI2NdVyBqDanbDECmLYb/Jh+o7hn5AH82BS9Pn6QHwmvnVxCDF6YijUi2g8f
         FBEGr5sX0DL4svHQbeWuGQlR5GlW7NdwHxahYqGPz4PVm0uxTpTNVEl5RdvoztlqxWKE
         JAEDIhXG+FWrZn+zu9jukPusNGH/gGk5lLLvmA6yhDGujGbMm8No7K+log2d+m1M5oxG
         Gat6NunSglVUXF2MoUmGTE7oIM02+zCAPMuWZN5gSI+zForWsNNFoHTTTYPg3WzuVLBI
         hpwvODn0JqXGbkmvkR3FFrml0+AvDtZS9XxMsaX4MBBXx6XagBvzcw821IrQSX5eeuBH
         8EAw==
X-Forwarded-Encrypted: i=1; AKwUvBw/cOZJah85ecClxXQpaLF9aTgbDg0rOXGKE9bWbyFUuBqzqPgwk0dfm3hboqJCBTiziz/+MkBtyw8hdkM=@vger.kernel.org
X-Gm-Message-State: AFuF++k/UP2rm2JGNUcTdF0eMqzxz2GdmuyCrFFEqY1qBKip1W6F9wnq
	vNc9aFPpRAPD9cDb1qky9UClG64o35HDNV5bncWfvtl6Ty0hxU/4VnyZlYEWnbqC1jA=
X-Gm-Gg: AYBFou03wlQrbCgZj8KQ6+fmZsvoZi3ktjUGH4vSX4ox715EFfZ41NSyJRIZTgnU0/x
	MYpD4Kk9wvxRPRX2ahxQ60+G9vp/fX5j1H5uUVFOylOKYYbbk9IiR8r/BnU705NRPCBAbCmfmWb
	JNiChGG8bzPcK2emwVnq81xMEPDrI5OyeXTIQAbrpPAUtwT050jURvD893e2ih0QNroPTj3+xdd
	hahaS+5S34JF7BTYa6t3/Y7uhzD+3pHRJGsUFG3yGl9/Tf8hyPmFRl+/Uoi80bZso91WgZYaLGU
	UOy7EenQ2u5Hss4LULGAuQbrRGpG57cWCd43A72xOHNYZ8f6D+x1R/UTq1bKgzg+xNnQ8C0Dwcq
	aTgXFiNVa1BmP6uXdMhW91HX1NQv8U5LtcHUqLqFPF1v6PUUwpdHIT7pTex6pQDm/W1DOqsmLPR
	UE/4uk4tqm0wnCJkWnu/ZTTvVwiypcL+PlVQwmLXpm3Vbr/Xe1D81TcYA0vLU1AW2Elg==
X-Received: by 2002:a05:600c:354e:b0:49e:6bc7:4e1b with SMTP id 5b1f17b1804b1-49fc56ef4fcmr2059135e9.15.1789678960500;
        Thu, 17 Sep 2026 14:02:40 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm3106095e9.3.2026.09.17.14.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:02:40 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 17 Sep 2026 23:02:31 +0200
Subject: [PATCH v2 1/6] ASoC: dt-bindings: amlogic,gx-audin: add schema
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-audin-v2-1-38de4bc1de34@baylibre.com>
References: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
In-Reply-To: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2321; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=8xj7kUdGgsVPCmxBLgs3dFbkoQPLuPzp6csuOKCL82I=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlrQnP/iLUayjLtvv3w1WaL+o6/q3gtS730b2x5bv4nd
 NEio0nXOkpZGMS4GGTFFFlYpt/7XVCq9tA44WQBzBxWJpAhDFycAjCR1lBGhhv/lF3Dql31FD5P
 951y7UhLXb9bXqdBKoNG8RaevrMxhQx/5e75/EuWX26jUxHwt4L/5y1eLaYPe2wDn4ooN2QzxW/
 hAgA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

AUDIN provides I2S audio input support to the Meson GX platforms
(GXBB/GXL).

Note: GXBB and GXL are not known to differ so the driver binds on the
'amlogic,gx-audin' fallback.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 .../bindings/sound/amlogic,gx-audin.yaml           | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-audin.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-audin.yaml
new file mode 100644
index 000000000000..76e6a6ddef36
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,gx-audin.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,gx-audin.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic GX AUDIN
+
+maintainers:
+  - Valerio Setti <vsetti@baylibre.com>
+
+description:
+  AUDIN is the audio input block of the Amlogic GXBB/GXL SoCs. It supports
+  various input formatters (I2S, SPDIF, PCM, HDMI) feeding three FIFOs that
+  transfer captured samples to memory. The sound-dai cell selects the FIFO.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - amlogic,gxbb-audin
+          - amlogic,gxl-audin
+      - const: amlogic,gx-audin
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: AUDIN peripheral clock
+
+required:
+  - compatible
+  - reg
+  - resets
+  - interrupts
+  - clocks
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/gxbb-clkc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/amlogic,meson-gxbb-reset.h>
+
+    audio-controller@a000 {
+      compatible = "amlogic,gxbb-audin", "amlogic,gx-audin";
+      reg = <0xa000 0x148>;
+      resets = <&reset RESET_AUDIN>;
+      interrupts = <GIC_SPI 7 IRQ_TYPE_EDGE_RISING>;
+      sound-name-prefix = "AUDIN";
+      #sound-dai-cells = <1>;
+      clocks = <&clkc CLKID_I2S_SPDIF>;
+    };

-- 
2.47.3

