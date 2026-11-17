Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919195;
	b=0h9Qlur0jrW3FRFWCYDfbNwmEM7elY3g2hkbCfTO59FN/JsLn16mXLMnARE7pTDSYuMF
	 8P4RomOhyqGDTq7E/5Ny+hta5KfMcPQWdgXPS8EqmMJ3yy2StNsmIH6gloLSOOWPOK6MJ
	 RqrhGv/ePjb4jnnNkp+050xyD/FpBzuXw4if5NpNHjxwnuIBjlUUjnkkuowoz3CMfHrkY
	 f3zgPJJa2NOa4RkurXpIUcRhMo04vW/Ohi22d4Ug28iL9MV1Acjr9yEzljKqpM+F8rGkK
	 nVhlUgJqcjmUPhaxKGvhInIf/dAldtvScvXqE1HAlYQJCHMlmK402LOdQrmqhDR1T5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T5qIDqJW1HylN9V1krTTvvmwCzdpLearj6f6TGS/cFE=;
	b=vppnaosoOkcn7N4mAJM1EwUpuD8WdAtl0t6+KZKABOAMHQlLa1ir7yxC1Nt3n6enyRW1
	 QimIaiPIvEyPCzweVTh97Co02TXdGfHK0oyTfb7E/zIgTgqnk0l5IXjCbApNq2/LxexPz
	 rZx1D07jCUW464RoyF4K8R/xtfAyDLEqKoVRegyzTJrD2AiBQ/8q9Amf5EO/f2qe3VG/c
	 OXfLTK7+ytRIkb91OHOH+xnp9S5CPNvI5fjqPOWaSnP3jZw+oJJ1jqAsJfgMoSRyQ4e+M
	 XfqMpPaJ429H6bba9nBOeWbELRxjDcbccUI4MVAdaPk4sAbgIc5YGbPBoncxHcQ00EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gKqmelpS;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83BC60A2611
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A83BC60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gKqmelpS
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so32234915e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919193; x=1795523993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T5qIDqJW1HylN9V1krTTvvmwCzdpLearj6f6TGS/cFE=;
        b=gKqmelpSihWWG/SBPNWiup0TtC/pZsi60X7mAIi+TAQYFt7+0MgqlU2IIuIunAogkw
         a6LBtOHF+5Axo0gsL0Q8UtGMP3PE5yvnyE4naACIO3TQgR1mJZkAjQ9H9fCdYHWMF7at
         OIV6MH3ix5xMyDw26/RHwNQt8F1lYEXEpM5gZfn+6R3opTm/PuzNERQufwkd0RpEEB6Y
         pHp7Jv7hrkK4qCoouK2+6aXkteZIpikR36SiwLUg6ev4S44x98ON4EPlPfpYhEQHszhE
         Xj2sA7CeWqo8bciqV7gr/OSJXSlDgHrg7zblmIwxvct8C3ooV7y+OPknTctlMMHlT3qs
         mNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919193; x=1795523993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T5qIDqJW1HylN9V1krTTvvmwCzdpLearj6f6TGS/cFE=;
        b=txE0Kwv4NR/XBoBWu3ECYMmrUEnerqu0PfkRU11SVCo2v5OoUTKSNYlTU3mofz8XgU
         u9HVSCaR9uLHWWXymlLabbHR4bDf94nrFh+NEhee0uiHaJudc1tiFnuMAaqjctOMZTKa
         xtnNj0ViJH3Zlu48kLIeC2vfy33vwaS5RogDFpD+RafO/HqHG1g59wnI9ogQdJzBEhss
         7XhO6ZMqVi+3r7SFGbC08mkf9LOucB/niXlqp9ymFjCPDQqd6Iuv59aGGeIg0bnm8nY2
         AOQcnGeFrC8C+VhgMFa5Afqi7FT1eNiTieB1CaHliDksQxhisxYhedAn16qcu9g4RQXP
         IxHw==
X-Forwarded-Encrypted: i=1; AL+hErGYtA4nVpO5WahEjpwIbMKTbsLMTdQpauYiGSYVZ71ewetuGTJZA/VOzYXY1bU7YZSUREw95F/niAvsa7w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AyNDJ70vy5crFxO+fiT3uDBtje3WqMXtik8CzNzLymI2eyIVt
	c/KAqh2CD97crMXvf5mrd9e+ZMbvJWRbSyXLxupWO/CJJvvmGxEMhRUa
X-Gm-Gg: AYBFou3rLV2Z6t/AuZJE4JXrsC8k+I2+d6r3/D3S5vboibhqwtOt8mrdB4pvoWnvYXV
	DzR71+oV7QcUj1CyedWxS3IZo8SiGsXOiC930H+JEzDHF9gvJWKbucsq9xLuAROrCfgVsjcw/pG
	zD+N3S4qO02fRawWBp9635LYtF3mVIR0PWMPPfOYlxETwJOzYBtQbDqsiS/Joz6Uq1gHF7dOXJQ
	o0QsIaUxAfr2FZog1ssXQ9hSa0o+WcFVtqN8hO4JvsgnOYvKeiJTfdzAmnPfKNaDaOTNlsqOYGf
	xs/xeTypiOKcsrFR+JC17ylSB3S4CXS6VMo+sy/UU2nbvL4Q2P3AnGfiyBknSLEqlE624Q/QPzf
	V6t4ZOEp6tVixr5BAjppkUMcwBqBeAxqSIGRRK7E4FEVsK1+NPhYscgIOOO+NRAJK/gY3Hyxf2P
	oJrtZUpzCC1yodctzkE7/GRFnmY1c+WySuYvtUWrEgUlSar6+/4Iv2rSqC34VxNFjpJMSpq+2iT
	aNWek5Xj+3TL/1lcSE23pI/0m0HIM9lxyusm21BpWoJStW2Bj4ux4d3qil9XftA/Ca8yFaov7W/
	ha6C8qpSEyFds3CDePsycyImJLGFakNP3nd26W23ekymVSV2B3Bqntan7yCIJuMd8Vsucg==
X-Received: by 2002:a05:600c:3152:b0:4a2:677:ad8e with SMTP id 5b1f17b1804b1-4bb55aac0bfmr303633355e9.34.1794919192859;
        Tue, 17 Nov 2026 04:39:52 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (94-21-223-203.pool.digikabel.hu. [94.21.223.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm71474905e9.4.2026.11.17.04.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:39:52 -0800 (PST)
From: rofikkerneldev <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	rofikkerneldev <rofikcoga@gmail.com>
Subject: [PATCH v1 04/11] dt-bindings: display: panel: add LG SW43103
Date: Tue, 17 Nov 2026 13:39:39 +0100
Message-Id: <20261117123946.668557-5-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261117123946.668557-1-rofikcoga@gmail.com>
References: <20261117123946.668557-1-rofikcoga@gmail.com>
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

Document the SW43103 FHD+ AMOLED panel used by the LG V60. The panel
uses DSI command mode with DSC and DCS backlight control.

Signed-off-by: rofikkerneldev <rofikcoga@gmail.com>
---
 .../bindings/display/panel/lg,sw43103.yaml    | 70 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml b/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
new file mode 100644
index 0000000000000..edd007e2c0d76
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lg,sw43103.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG / BOE SW43103 1080x2460 DSI cmd mode panel
+
+maintainers:
+  - rofikkerneldev <rofikcoga@gmail.com>
+
+description:
+  This panel is used on the LG V60 ThinQ 5G (timelm). It is a 60 Hz FHD+ AMOLED
+  panel driven by a Silicon Works SW43103 DDIC, operating in DSI Command Mode
+  with DSC (Display Stream Compression).
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - lg,sw43103
+      - boe,sw43103
+
+  reg:
+    maxItems: 1
+
+  port: true
+  vddi-supply: true
+  vpnl-supply: true
+  reset-gpios: true
+  enable-gpios: true
+
+required:
+  - compatible
+  - reg
+  - vddi-supply
+  - vpnl-supply
+  - reset-gpios
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "lg,sw43103";
+            reg = <0>;
+
+            vddi-supply = <&vreg_l14a_1p8>;
+            vpnl-supply = <&vreg_l11c_3p0>;
+
+            reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
+            enable-gpios = <&pm8150l_gpios 4 GPIO_ACTIVE_HIGH>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 315a4a000b405..bca5065166c25 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15231,6 +15231,11 @@ Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 T:	git git://linuxtv.org/mkrufky/tuners.git
 F:	drivers/media/dvb-frontends/lgdt3305.*
 
+LG SW43103 PANEL DRIVER
+M:	rofikkerneldev <rofikcoga@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
+
 LG V60 THINQ 5G (TIMELM) SUPPORT
 M:	rofikkerneldev <rofikcoga@gmail.com>
 L:	linux-arm-msm@vger.kernel.org
-- 
2.39.5

