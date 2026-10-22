Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792679491;
	b=4AZqf56AeXAELb0Gnf3O1sdjibMoOoU/MYYRj1fpMbltmCS/PDTnqH+8LluXY5J+ttX6
	 HAO9p2K6O5rgWoDhlkJFeKzIgYI16klw9+jMO8B7YxiF4EV3EKtSksxATLjje8XSksril
	 XvaFrJMod4oC8DMCbozQXmR/5l//fhFsYLIBLWg83j4ncWBvCWNna3Z/hY+y7XbOKcmSa
	 DNVfPo67OtwTssTCv9QxSjOYrWMv3b+HHare/eIgWICKj1KfVhC5ps7WomjH/XuTfFqEe
	 e49is63OlmB0j1n18+EAUFSx0wxMvxtvkEcQFqidpmKj+LumlDoDJ+FxvfGsPQkYZ4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792679491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=VSDmw3zZL4GwSBLGTgTs+YZpiiLncoXUqRyZW9au3hs=;
	b=DKpj8plYO2R/NcpNiM4Q8iHorm7vapb6wkBLZyTt1DZAFMec6cswJ8xzm+398lwXkd26
	 1G4t3rzt7tOERAuqtbiSb3Gp64PKXz4ZaHzCMiXTWIU24QXyedEmK1QxVBLLvyzJbV8+M
	 5ys6PRFTq3SRX0CJy5KVTYWw5U8OcpIz4xXDti3BWzoNTbA5EQC3F0s8wvLnkk+ZY6wR+
	 LFaKzSe2qiOZYSbUwmLsYHAzeNJ3jqM8BmpLbJfBoIu37VMuyEmgG9LSMDcP8RihVrYpz
	 X8Oogbxt/A8wFKBvGxLjO4mO3EWDyaonw0bzjlwJQjYtdUWpfGZyNInN7rIFVqIIyAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ccs2YyI3;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0CC606A325
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD0CC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ccs2YyI3
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso5785005e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792679489; x=1793284289; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSDmw3zZL4GwSBLGTgTs+YZpiiLncoXUqRyZW9au3hs=;
        b=Ccs2YyI3pKNIsHdD0mUTS2bMDQIyNKPZFT4TFnbkKlcB7oacL+VC8UO99fzT1ImjGx
         1fPRCQq3moIx5EQTJS6VtkL3bFwzkNI7fsZuLqG4OJ9Yq8xzEwN3nKGNvKuza5dGqZQ5
         aj8BX/chL+VPLTKLTYLsrzINmpEpTlGL19G5RwZLDT3eHRfz5jB3usL1aB/I3zaRHzjC
         PoapEziYHT9png3XE+fUF08zCqlcBNiEJzAaIlqlgJalKdoH/VU9/ly2OyQE41xHleIC
         0U0yvhLVddL484CLyuSVB2eQZM9HJiIrupsej9msssNOY9Ap1wcX3vM65THPxkzlNdD2
         fqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792679489; x=1793284289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSDmw3zZL4GwSBLGTgTs+YZpiiLncoXUqRyZW9au3hs=;
        b=2nEKANLjDZdpCAeVCJ137LtK/ci/HYS0sco5NR8jYeS+JHIseKB4KLP1bTQEG+bpDy
         nLQRxiVZwaowE84/YQvSUYv390rzs9kkd8mCAz2Pi4mbNUAUdFNNvZlNhLSxu6qz5Tjb
         1HIpWYOHqhf9aSvV3gk0qfeAIMDxlP/BikWN9Ib5kYAXJ0QdkxCfrYb+e5XYm81GNdAm
         Vm/CquQtPcKjksdSu9x4Xxp8iR4DZFHoJvHK0LFDN5182Mr77+lX9PWXK7H1DjSZsY63
         m6Bb0AWOQ4LKa9cX7GGXDDNCjlA9gaMTeB06uugiU9jOIERD8erGkL5orsaky68cFGeB
         W7Og==
X-Forwarded-Encrypted: i=1; AKwUvBxfpKAZcHbkaUyKc2Vcg6hmTkDaRh8Ajc0DEnJS5L8P53mZB4yzyLQarDLzIBb20CmADp/fXhDQGZbFXRU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK44cQPIyFMEnNH/sJHlfPKlMhQz7qrG8oI4d4JQacSv9x1rX7L
	guK476zSkSahxC5kHWzk2LEArP0kgMQgBqoVIQLtAcBFaRJ45w9pJln/
X-Gm-Gg: AYBFou1dzDtuJX8rCvyCAbsdA1y3VqSD1B1ga3AKxXigqaDg40guKCFTeMvlpY+c33U
	DbKKZ7zQ+tQ4jIzuNGraq1y7ZuGJwlQGfPfDp3mxhmNI79TZSUWQTBwfrGjaa3uc4l0YPQfCXtl
	uKYpW7hjiisQXwkPZ8ObD8w2DhxllrQvvoQfMVM2UxqZYBhAp1sswMmWc7hI6jHZXd79qpX/qxS
	BdNJ3xlvxjCTj9gpaJZbZ3l9X8NbZ2R85QTPN7khbz2NaEJFOHicZdDOfHsWCwBn7q+lKoA1leW
	Ac9j5uYpEr5bBrk/+E2TBUl3RONRuGej6x1QwRlLplVmh74wjGHDdIctBBS5qtWOatiGUSnaj2D
	Z4/kzB9W9XNZU1802V8PMrdv+6LqiHCLGshYczmsYNx1mLztBx3kZq7SeB4LgGM8z4EOscBanHt
	U1NJ+qbuIHmecJLQtjInv2eT+b7ANeOmR6nlvgGAtydLjkNJzknOQhqdWQVy0DXoDNPoYYTCnQs
	AAZO4lAGiknTKE2xLuWsJYNMh8ho0VbpeiA17ItTFODe3w9lR+nqce8wnH7RS/0z/nn4GJ2d6B0
	Gp4i4cuYtiSSYN42NuiamLDCMwNZI/L5fLSuV/NyzKBxMlTFaxoLriL5
X-Received: by 2002:a05:600c:4fd4:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4a1fdd53c8cmr107350405e9.27.1792679488862;
        Thu, 22 Oct 2026 07:31:28 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a200f4d16bsm85693745e9.2.2026.10.22.07.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:31:28 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:31:25 +0200
Subject: [PATCH v3 1/4] dt-bindings: connector: Add Toradex camera
 connector
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-verdin-imx8mp-hmp-camera-ready-v3-1-90a30b0b0d55@toradex.com>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
In-Reply-To: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
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

Reviewed-by: Frank Li <Frank.Li@nxp.com>
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

