Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CB136E470
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792318723; cv=none; b=Y4NJrxbbI9a1/RCj+8EOH0W/FvHv3EowiEgh9A/nfeA2qFVq7ElQlNfamaMf9JRx4iGbbP6OjEx4b4V96Kw76ms0FjEthL5zLNR8p5qFs4Vh1eKSET6p9O/A2k3DJgI/a2WHrdW1AT2u9PwCT3sqG7Z0C6rI7Q0ERPw0QV+uBzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792318723; c=relaxed/simple;
	bh=I0qFUjuYkK/Jb+743ojJali2uxhCIRzSMoeKWGXcjcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lMJ61aevqZXBsrrhwSm4j4wBxg0m5SRpvkxltP9eb6JZk0CLaBTaSTpakofMqf3GrKmU8h9uZRuPXCNiDixNQ3JPejcg+MVXFfg4Wx5TbI5s74+HI/4Vmjoj5asKHbE5NWtjCEyksIhbiHVQIV9ZkqeWS7M7eveC3ufciC4MN2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=AyDg33gS; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="AyDg33gS"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1dfd49525so4701725e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792318719; x=1792923519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bXUbYakFpTeYzMKXIFxmT3MjUgNH4qUmML0VWV6BI+U=;
        b=AyDg33gSRoqFZCXskkgZkl+5VraOIxcNwz6x2XV790rq3FH6zH91colSbQUCNMjSq9
         CoIr1MKSgQ+0aLqk8eOSnkRCAo9PR0KOILhVfQ2QmJVm2puxlAfIuy7nPHNj1AcTZiqw
         zxKYxFeIx32t57OJiyXTPPwjVWMkDTHl/m9xEUj65yRj9FKH+DvlmJRCFHpz8As5HTPA
         E3jERQWX+VBtSLvqEIerRywgXQ8Kr96JlQmvQGVO5TgE/0MfPlzDGtTG/u2CWp68aL6l
         nQ/MJrbCugUJ8bXzQ3BzfRfIv8vGsyFYKXXz2sYtnQsiu28AlvlNY8Km+BsUVNpSKU4v
         JbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792318719; x=1792923519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXUbYakFpTeYzMKXIFxmT3MjUgNH4qUmML0VWV6BI+U=;
        b=W96e8gO3obK+rvqoXeBWjj5gVm2vsXqnH3caNrbePuMOcuPO+j3lQNXlYUdZVHfY5z
         9dp3GZD4DSMGLvvY+ql2XlZRuD4ikmwY0hVg2lg3edlpvR0OOVVBtVl9dxErMAf7bthw
         /mUmkmaGGJK1ibGhBBpYmcQEKcl9xIkFHrFmnDC94jPdQiflvkHLNeA6bBRocCRcgaqO
         DsZ289z5gDY0am7UCQLGx8G8vrrdqDWs+de6Htl5MJCwhINs47WlgyUsQZnO9e514TO0
         Jc8P60HWWCGraUQrmG8HWlNRgYmABmlxYwXZ4OwsHGozdHdNxZiIXctwxOqolxqdgfM8
         0MZg==
X-Forwarded-Encrypted: i=1; AKwUvBzrQ73sbnFUlAOCC3mBg3oLaUQ3FhDa9o3cY6OKsR9ePSfz3JzqROROgirb2It3EW41DUrmg5zZ7o6aF/U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIG06oVhoVKeUGOFnuq378ZcqK25cRxzvE/cfwQyrNqsbAtC76i
	psVVEZpX9cX0hWLwNSDMUVSSKEhG7WCyo4mx3J/CiLbURze5yC7qSujZpIj/LYOorrI=
X-Gm-Gg: AYBFou397auvCzhDqD06rKzJ42w97O5Qe8a7znPdv/orcabXlqJJwwuc8G8ot3l0hUH
	3Hya9Z9xlHO9p4f78n2CTAkKgtq/TtCzCtyCuJxTCUipNR5Zb/I/PTOe3nKMaEjiN9ibbeR6r+M
	8WRnvUlZpfqebw0Pz+jBHB7cV5hksD4JJGBVz/368TGmgqX1L5olUVMTJ6yw4I2tZ6rN7GU3Gfw
	mnNwJdh+bRnUW2doYPL48cr3kLsUjAOeC/psK2xqruEpSRNTu/Xb+AG7PBVn0nFOGNQzkUAtqEB
	qIs4K7QsVdQYZvgb8aKsMzwh5YUrayznJ4XCsNHNDCNtqCyff70fJENZdB6wvqlhjNj3XHkTilL
	o6YLL7ZRmdqBQUyAZmoPAcqkeXntQIqbe180/AOlf9uUXdYpA2vF0OBdc6tdohQdBnROuwCVWg/
	28sEWkfpsZjGseGu0ewsykuS1TXltPgMwjAE4fs5jpTLnlYijNnePj8N1/EniIVGnMOgMF
X-Received: by 2002:a05:600d:848e:20b0:4a1:e00b:a0ea with SMTP id 5b1f17b1804b1-4a1e00ba2cfmr31307475e9.1.1792318719335;
        Sun, 18 Oct 2026 03:18:39 -0700 (PDT)
Received: from [127.0.1.1] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4d4978sm14911507f8f.21.2026.10.18.03.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:18:38 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sun, 18 Oct 2026 12:17:58 +0200
Subject: [PATCH v5 1/7] ASoC: dt-bindings: add amlogic,gxbb-audin
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-audin-v5-1-4b8cc13a1b22@baylibre.com>
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
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
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2572; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=I0qFUjuYkK/Jb+743ojJali2uxhCIRzSMoeKWGXcjcQ=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlX5vzeZOqjHL1cNE+007OJeYXVo+vrj3hZMBj8s0qwM
 qhi/x7RUcrCIMbFICumyMIy/d7vglK1h8YJJwtg5rAygQxh4OIUgIkU9TL8lTBYekKvh//v5yMa
 eirsB7YxJz/eMyle6uSMFqPzIgGLgxkZ3q6189Y6burd1ncrbaWc0uRl/MKfn9lejFB68Y1zmno
 lNwA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

AUDIN provides I2S audio input support to the Meson GXBB and GXL SoCs.

The AUDIN block on GXL is identical to the GXBB one, so "amlogic,gxl-audin"
uses "amlogic,gxbb-audin" as fallback; the SoC-specific compatible is
added so that differences can be handled later if any are found.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 .../bindings/sound/amlogic,gxbb-audin.yaml         | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,gxbb-audin.yaml b/Documentation/devicetree/bindings/sound/amlogic,gxbb-audin.yaml
new file mode 100644
index 000000000000..4df4796623ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,gxbb-audin.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,gxbb-audin.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic GXBB AUDIN audio input controller
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
+    oneOf:
+      - const: amlogic,gxbb-audin
+      - items:
+          - const: amlogic,gxl-audin
+          - const: amlogic,gxbb-audin
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
+  "#sound-dai-cells":
+    const: 1
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
+      compatible = "amlogic,gxbb-audin";
+      reg = <0xa000 0x148>;
+      resets = <&reset RESET_AUDIN>;
+      interrupts = <GIC_SPI 7 IRQ_TYPE_EDGE_RISING>;
+      sound-name-prefix = "AUDIN";
+      #sound-dai-cells = <1>;
+      clocks = <&clkc CLKID_I2S_SPDIF>;
+    };

-- 
2.47.3

