Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128E24AB1BD
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054694; cv=none; b=VQJNx90hWUjjxBJz23NqQ8Ju+dZ4huEF5/gzZY4h6IbuzqXJlVsa+0GYmYRXlKjXHjwD/DkaTnXD8T8gGsP5zpf8QqA9fBXukXD6S5JhvR7RsF9Eq8kr4/k6hK+/CzBtgVcCipKODRHQyXvV+gy+Q8ToPsom7lNzsatSw1sHhFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054694; c=relaxed/simple;
	bh=n+VvfaxRRJUSeWj0E6gWMuoSXmp4pUY5fpFqR2Pl2rg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HQDR8AilFhEFAl2+liBroM98gXu3KJefCKWFWBm8iOOB7QzZY6jAcXUasZHoBszvypjlTLLSaONIBFAqB+GIVi62NIZLOOpRb0u4AC4ne+RY+YJGaRgIjFo3HDtDDdai4XS2XwyYv7bcshhLbnjUsTmsRiS/jVqmaY7i43Xg7PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MR1hLZCA; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MR1hLZCA"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so8306375e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789054688; x=1789659488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sq6kdCRd09J8/wwZWCzwogvcDt1j5IWHfbvfSux7KiE=;
        b=MR1hLZCAIuX3DAxAiOMorWlIf6qywMkQ0fTMQXmCcagftSbH6bx2Nu2KrSnrC51/tG
         J1gLZddu3SFfBKLZrl97cfxMLw7/VJtPxaJYq15U276E9sip5yAMFDuxqdP2FEk/l4WC
         Gy1IGUTNwN00X5zr1KrFu2r/+G0eSaTNdUsXKzmKKu0iIdSLATTMfYmIdSjl/EBewNPD
         oE2tfp5jDeWFzBif/DEindD7nsSfLsa83OyoOV34uUJ18rutqOu/q90psMHgkdqC+v4Z
         dDYLInwlhid0Ggaz54kWaUlbigonIEJ7VzrdgjtPpp3LjLgV2AZdCBg7aM0Z/GK2XVdL
         cmbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054688; x=1789659488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sq6kdCRd09J8/wwZWCzwogvcDt1j5IWHfbvfSux7KiE=;
        b=rjdVxfPyQqo8lfxdedC6bxhIyg3n1iVNnOv7NE6Nnad0QBojFcyWt7/hYME6ObNR56
         jl5ZWaqHtz8+A6p5TvdI+7bzxWv+xs34saSydcD6Yvx3+LiWK0Y7/wNniNse0nym/8E3
         QFQ32+YetQ6XaOYnIqMyS293ri5eZrLnLL61Bcdzx/bmQlC+O4Z1h0xEWUpX7+Vbxrq3
         9k1VzeJKzDDJHDSUoEZVdlbjrXc8mMAIPw9RuDpq2DAxe1oiAEjF3rEiweLbuvGxOEpE
         YLmQWTydoc7y8qtfBN/sewCVqWrVERM2XlOVydwHjy/C5AGKpkLy3dqmdaWrRo1z8Kn4
         qd8w==
X-Forwarded-Encrypted: i=1; AKwUvBy7xw/JoE1lmueU1cKMibqnMfVaTP1ll75QtwzXkJwVT1MGcaTYFk9byiBemlTMIfHFq/zqdQ0o0tWI9xU=@vger.kernel.org
X-Gm-Message-State: AFuF++mhaPy1U5d+4gFiPRPxH+SizzLg5imbrs0TrxyEqjpEYC4PVcHr
	v9v9SW+qrKiSG/G84wbbo8SVMc6FcddcIvmGyN+sZw5M3NG8EE7FBv/P
X-Gm-Gg: AYBFou00ytN9gO5pXQFBc8BrO8D0am031rKgEbGRUW/dmgr2QaFl8d0HH6lXlLM6mk3
	0qwIBJyGSpjtTTjRD5uruvPXkDPO332ixSFbIvBk6wY/z8XlFpwyXc4QpEYTvZiDX0hMJhyfJK0
	URDPNnSkJ1G6w3oulvqxJzfdP/hKhZTCsIsft1CM6vTWcpQ7v2ZFOZ9ILmTa6lmcIh9anO6NTaV
	O0zeU9t5VlmcyOu6NxAtldTarK4fT6ZmNG9Nxhc3BQHiUc/WFOf4LAxwgdsun+D53Z5K2sqoc3K
	VZFIleWIlTzt7W8Q1FQDP5iWj9VGdLVDZwAzN4M8H/ZvLaQqd7UlQVtKGoEBb0fxilmllwCeJWl
	x2KehQjvt5dRCU9GabFUnVvb/oOJw11/X56hv5b5hk2z8ylN+73yWadObqe6iYlmxF0VeZRUdTO
	nXfm9Aur6xC6MXvVGczp6gnG2iakkXMQLWoMq8UF7C4xlBepITQ56Iv7Gj+WcNeko2a0bDMOLCZ
	X9D5r57RGy1xuS1o5ksYUJON6Y6PDIHd7cy0GtXugXnrCjqtUidVP2Xp9s870aT5hox+u2VMA==
X-Received: by 2002:a05:600c:8b43:b0:49d:1f32:c911 with SMTP id 5b1f17b1804b1-49d258cda6bmr82799305e9.3.1789054688174;
        Thu, 10 Sep 2026 08:38:08 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm3390545e9.14.2026.09.10.08.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:38:07 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 10 Sep 2026 17:37:59 +0200
Subject: [PATCH 3/6] dt-bindings: connector: Add Toradex camera connector
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-verdin-imx8mp-hmp-camera-ready-v1-3-3c9349ecdb9f@toradex.com>
References: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
In-Reply-To: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
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
 .../connector/toradex,camera-connector.yaml        | 86 ++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
new file mode 100644
index 000000000000..06e6836e1aa6
--- /dev/null
+++ b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
@@ -0,0 +1,86 @@
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
+  Toradex boards provide 24-pin camera connectors carrying MIPI CSI-2, I2C,
+  clock, power, and sideband GPIO signals. This binding describes the sideband
+  signals as a GPIO nexus. The other connector resources remain described by
+  the surrounding board device tree.
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
+    gpio1: gpio-controller {
+        #gpio-cells = <2>;
+        gpio-controller;
+    };
+
+...

-- 
2.43.0

