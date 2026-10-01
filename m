Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36C13DDB09
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 11:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790855069; cv=none; b=EzVi2a6Yg/UDh/QQxyV7EKOVQ+ENalXNTDKYt7QquNsemTAUwHem0DkrKbdMdjInly7D15paru13xP/ItzEsTd49fmRSncijMImCCDP9B2ap00T2xgunx5/bBqV5vbH7KrmQifO59WoiaE3k9Z4FxrSFqQuj14Zn8HIpnzKp6pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790855069; c=relaxed/simple;
	bh=t59HA6ckivCe/4YnKmDvJmeL7B0/skKgvWKi9ud/Zg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PFk5to572lXNNY4vUNTe86H9fDTKXyFno4co3u2IhjzS2V4DmvxY2UC5IdrifuGH4TCwYIowPAdeodeKOfF5elNttbvexCx3CJebK5J0Y1c8oAEoBKBFfbf2UqIKNDUOZ8DbsYibDLIbt4u+FMJ6SAgtmFwMv4OVoLZgfyZuiZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YuQ6c9Wk; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YuQ6c9Wk"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b08452cafso609662f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 04:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790855058; x=1791459858; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HmnXElFSJd4KcBqGRqP1X7uyQN8BRiiAkPdqtLDtOZY=;
        b=YuQ6c9Wkfszs5kBKe3E3ne2Hz7SVDCls8buFtHdFVhgvkQ6nko0JelkQU7LoSwNQ+S
         HYzUROJUT9UIH547ebuT/1O/MgEdrvDruwpd9xHHNOcAx8EK4kD3P5Ck/oEjNBmBBBG9
         AdfJhNZJb8VW+U0fYU1hoVo7RcxU3Zpg5QOaryd079HUvrlYEkeNJzSPa80WjbjueMsQ
         X5QLg0P1WDdxWHUVpcpCME5R2CQXP2vO1P6r29oWXT1ApQdlX37X7+ZORUskVCL5pl+8
         oNfwKwm/c5cRv7y/iqNFnnWvb7Vy09Ut4B9jeG4nqlI/3LZMAOp9B2l6y2ELRRftNhhC
         e0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790855058; x=1791459858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HmnXElFSJd4KcBqGRqP1X7uyQN8BRiiAkPdqtLDtOZY=;
        b=PwcZF3TkiUt/qZaDIJ68sonNqSoiMIAf0oPRcpUPj6yb1IqOe/G3x2zUvLHOTm5ZUi
         4tYb0G3uHIj8fPVnmSdz0rIx9KRzqAZVO2m4vJ1Q3gdD16d5T8eblBam2NgsW0qIYfSZ
         mrlN00LJD+Ks8tzXkJPbirgCWHB6MHpm2mXasCsPP11VoE4FjIvuquEikJZT13jSRTMx
         qPkF32O7uLf6D0KG2CEKUCthZyFeWDtsqLUAEP4qjIad6oygEjN+mq5F2WlI+aHif53X
         1nnv4QDOfvn2XcDmnhO9i2DYWS+BewO6s46oj4IWO44Yi8nKroVMnKLs15xFOvijsuXB
         wxaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzX8fJSmsE8jN2JmnAiXpwvqyhfZY5sUX7yarM3dDucaIiwk1Ge2iw3BD8Jf3BQXgZm2ZBUscKL33ikz64=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcHrTbp/9Rwg2TwAzGKlWKU2YWs7s3Jvx6Ty6q3lD7AybruxB+
	54oVsYWzicM2hL/Npixps1AOakw6Wgg/ldj0O9Jt1OsMFF+lJVI4X/GL
X-Gm-Gg: AYBFou15qEGMuMsudWWXxZqBE5C39wwlE6G/dM6s9mrl2Kg9HSzpkog44fxUl3iIApL
	nhWGQ5QLVeZnz2dFV4linLvrwbtUcCTKXYC0xSiNvcD7rI6Si/CfPPsCgTZ14L5AS3mNF3/El6G
	7h2+1FzcDYKYsbVpg6769m4cyAtXx488coL0sfMdmBLvW9JhQBmudBbMHQAayXjgN90SXJ2jZyj
	QLZ44iXgGZKvxAgH5akIkV07HoBKGxqyITfNylSzYZBgDY36Plb8B76uYuAbmtq8PAnmRlbdwgc
	ZM3eHLSNT0E/4u54XerG3GXvNG1DQx5kVj0Wgsu2JKOHrnGOY9tE2aHN2jvPSs1OYtY4QDdMZHJ
	XqmpyEtmqGej6nDkM83kjviYCLpVHg+RYv7zuY0jKTEkfVAZ3/zGIJqHENoedBgx33s0s3OdXz0
	gqjxd29UnblQTX/YMxAp8rGBpFdxX6l1yIaz/LuwQxX5sGioWVl5yNmjWRya7ur9zTZBrqKHSgn
	QcJJtGpY9dGqzlvMdJxfVoheb0i349eUcDxeBctGYRNOivkmSRBCKFnteLQpUfOL9Lh7/Ns6Jey
	kloanUNe
X-Received: by 2002:a05:6000:230a:b0:48b:515:f94 with SMTP id ffacd0b85a97d-48b05151156mr5639332f8f.51.1790855057900;
        Thu, 01 Oct 2026 04:44:17 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b1035eff8sm1243705f8f.7.2026.10.01.04.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:44:17 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 01 Oct 2026 13:44:11 +0200
Subject: [PATCH v2 3/6] dt-bindings: connector: Add Toradex camera
 connector
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-verdin-imx8mp-hmp-camera-ready-v2-3-7d1343ecd3ec@toradex.com>
References: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
In-Reply-To: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Toradex boards route the sideband signals of their 24-pin camera
connectors to different GPIO controllers. Camera overlays which name
those controllers directly must therefore be duplicated for each host
board.

Describe reset, power-down, detection and power-control as
connector-local GPIO functions. This lets an accessory overlay remain
independent of the host wiring. MIPI CSI-2, I2C, clocks and supplies
remain described separately because the GPIO nexus does not abstract
them.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 .../connector/toradex,camera-connector.yaml        | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
new file mode 100644
index 000000000000..27fee3defde7
--- /dev/null
+++ b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/connector/toradex,camera-connector.yaml#
+$schema: http://devicetree.org/meta-schemas/base.yaml#
+
+title: Toradex camera connector GPIO nexus
+
+maintainers:
+  - Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
+  - Toradex Linux BSP Team <linux-bsp@toradex.com>
+
+description: |
+  Toradex carrier boards share a common 24-pin, 0.5 mm pitch FFC/FPC camera
+  connector carrying MIPI CSI-2, I2C, clock, power, and sideband GPIO signals.
+  This binding describes the sideband signals as a GPIO nexus. The other
+  connector resources remain described by the surrounding board device tree.
+
+  The nexus exposes connector-local GPIO function numbers to camera overlays
+  and maps the functions wired by a carrier board to their GPIO controllers.
+  GPIO specifiers contain a function number followed by standard GPIO flags.
+  A board may omit functions which it does not wire.
+
+  The function numbers are:
+    - 0: Camera reset, connector pin 11
+    - 1: Camera power-down, connector pin 22
+    - 2: Camera identification, connector pin 23
+    - 3: Camera power control, connector pin 24
+
+properties:
+  compatible:
+    const: toradex,camera-connector
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-map:
+    minItems: 1
+    maxItems: 4
+
+  gpio-map-mask:
+    items:
+      - const: 0xffffffff
+      - const: 0
+
+  gpio-map-pass-thru:
+    items:
+      - const: 0
+      - const: 0xffffffff
+
+required:
+  - compatible
+  - "#gpio-cells"
+  - gpio-map
+  - gpio-map-mask
+  - gpio-map-pass-thru
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    camera-connector {
+        compatible = "toradex,camera-connector";
+        #gpio-cells = <2>;
+        /*
+         * 0: Camera reset, connector pin 11
+         * 1: Camera power-down, connector pin 22
+         * 2: Camera identification, connector pin 23
+         * 3: Camera power control, connector pin 24
+         */
+        gpio-map = <0 0 &gpio1 0 GPIO_ACTIVE_HIGH>,
+                   <1 0 &gpio1 1 GPIO_ACTIVE_HIGH>,
+                   <2 0 &gpio1 2 GPIO_ACTIVE_HIGH>,
+                   <3 0 &gpio1 3 GPIO_ACTIVE_HIGH>;
+        gpio-map-mask = <0xffffffff 0x0>;
+        gpio-map-pass-thru = <0x0 0xffffffff>;
+    };
+
+...

-- 
2.43.0

