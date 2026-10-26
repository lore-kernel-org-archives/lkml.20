Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793032782;
	b=2wBy3BQOtUyZPMGMNqASrSYi6smBKsdOdfnYLknM2mTu5gP9O1DD+lZ0cKKEMNA1FdtP
	 EJKVdes5Iay0MHOmsWrJSsH36fHTneDZzXURi0nOWhzzDohj4TQRSjGDPWIDA4+9MtMhh
	 MLPW+BPb8a8IojJPfYHnvdK+Jr3lEmdHhvOsKXzVQJLYcneW23ulm7d71BqnXnxX4yUpU
	 wNJG6B4hkOBFVmRs1MnKNVyWMdUfuLXZ6rZ2cKgfwGp3VJAA8sozpKKmJNrwU7dk9bRLY
	 G8K/+SiEgBMCF9uofa73secS1AmX36XcUjzauhYfAROp6X3Mazs0lULsBAWsKaZqHmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032782;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6ZkBhAScJHbNlBExg6+IMlrv8YwSI7QvWiQndN90w5I=;
	b=e80wuZQkd09WhC54SgpPAAS3mQMCyCg3myqpN16EiYMor1+b+V9g8d6Yqz2Z0xQEI+8q
	 wdBLH64AMQsZHBv1E8AJAB0OoL7l9Gfg6MBER54rQE2KMR6nQSekdK8ThmhJJ+NiZ2jev
	 tQ5S30tPLSXSasIr+Vf/NMCKM7sgvXF9wWOHvan0eoxX87GKkubkLZdHsTGuCiFpD3mXJ
	 Tq+Ab+ZsVO1hiVZTW39i6lz+Rmixprz6aXgav1nUrXewgMr6LcdOTjFI0ZoirWmnZvFkA
	 6wEpIbYT37PO2Zyrxp8wOIivp0CIm5g8fWyKd9UDXWJQcOgISxJa9ov/0kHQYiDicGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cxzlt0JI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4201E606A322;
	Mon, 26 Oct 2026 16:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cxzlt0JI
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793032781;
	b=dqipp+MosryA5GOznRJI1BXQNQDXm3PdfJIJlLRH291fAVzkaWcyn9612dm4ylqBYrrg
	 KVP6MHeowQnTqnZju6t8qtvg1YqWwm2i7WPh8m/Gkk0LfKQFCE2jorLQP8Z97Yrjoo/Vf
	 b/VmsK/G8xZObeGzgxitkLeRzS8kXMD24h/8UICm8RG7UwOy7dOS/Xq75JhCT9SzZ6cJu
	 2zpe3NEVljT/0atyOYvSzu51pIBDfRlZ/GVjQOlgNWRargeefVAeWlvuelkEZqOr7tHGX
	 3AGC40/2dZxwSrJ214255ekbv7Yn5XhsGN3aoDb28VWVuTNR77ohMvKKGipPc5jq/0A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793032781;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6ZkBhAScJHbNlBExg6+IMlrv8YwSI7QvWiQndN90w5I=;
	b=FSckQjNwBna3eqzNxDLraLOtqnyNVTyk/mJwc3h0pjeFpSY0Am+45BQh4amSO5CU8Pjv
	 LpyQt0HzRPpdOjCKsMDEi2rLf/l7dwGzRII+N+qJ1K+LEcSiq6gu7ta9jtV3my/RtFW7M
	 WTSIPonUvn5q7uNJ3Nmru50JdVxFehBHJO/wv4eLuvXEfVAMKsJahLL5Sax76XTuPcTD6
	 +pSQLp3QTAzb5FIu8pXqtlZLdu7/BJB0ByG67PlZ1jyDxO71gXbDKtBmJg/A2QCdNhgNN
	 3GLjAfr1dd43WZng6CknphGJerEjaex+fzK4cbuN4NSnq1mQtsDaKJ5YhPuuAoPDFQg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CAF751F01829;
	Mon, 26 Oct 2026 16:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793032781;
	bh=6ZkBhAScJHbNlBExg6+IMlrv8YwSI7QvWiQndN90w5I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cxzlt0JIO9dZs4UP5JXwAC2jccJB3dsxTRSQBIG8gokIG3CSInoIILuqL6Owhuis6
	 v7S7iEUO+kv5OUanv6NMBxlua3w0LsB5RkkkkHLJ36FDWEwF6OgNB01A4MNS8mNhhp
	 DUNAkUbQVvHLrx+9B3DnE4Mr0JLNALsG3e3nsNFK3AkOzI1C8AfCSpY+ZTNxB0+rTs
	 HmgFAfZOALLeoiYOHR+7ViE1HSYSTZkno+Ja4i/cVa3Xfufh04533+hz1MGLJM+TT9
	 rvYChWr18sNuooJu3LHn7qQLWXi6F37CN9CcYgoCiVGUWY9fvu7lohFDiGCe7B/U6Q
	 zNuUUsdLCvShA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 40B1F44DB5;
	Mon, 26 Oct 2026 16:39:40 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Date: Mon, 26 Oct 2026 22:09:32 +0530
Subject: [PATCH v2 1/2] dt-bindings: display: panel: Add Samsung AMS644VK04
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
Message-Id: <20261026-panel-ams644vk04-v2-1-e88cafb3e577@brar.si>
References: <20261026-panel-ams644vk04-v2-0-e88cafb3e577@brar.si>
In-Reply-To: <20261026-panel-ams644vk04-v2-0-e88cafb3e577@brar.si>
To: Ishu Brar <patches@brar.si>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793032778; l=3110;
 i=patches@brar.si; h=from:subject:message-id;
 bh=bfWhdhE0MSOyY1CD4dr6wKMiNS0UDbr+4+1vQmvpmkw=;
 b=IcYMly2iqkavOeF+yvnHNLM9kuo1bIZVyMfMCs9+EBmsOxJMS3y9nJMxOYjZJm0PJ7JbO/iKF
 2T7FKRSqD9XDUfPsbkg8jQDq9Z6G/SPN60WxgaIDdIrvSrfgQoWdZht
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Reply-To: patches@brar.si
Content-Transfer-Encoding: 7bit

From: Ishu Brar <patches@brar.si>

Document the Samsung AMS644VK04, a 6.44 inch 1080x2400 MIPI DSI command
mode AMOLED panel with DSC that supports 60 Hz and 90 Hz. It is used in
the OnePlus Nord (SM7250). The panel is powered by three supplies and
has a reset GPIO.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ishu Brar <patches@brar.si>
---
 .../bindings/display/panel/samsung,ams644vk04.yaml | 76 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 81 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ams644vk04.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ams644vk04.yaml
new file mode 100644
index 000000000000..fcc720daff11
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,ams644vk04.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,ams644vk04.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung AMS644VK04 1080x2400 MIPI-DSI Panel
+
+maintainers:
+  - Ishu Brar <patches@brar.si>
+
+description:
+  The Samsung AMS644VK04 is a 6.44 inch 1080x2400 MIPI-DSI command mode AMOLED
+  panel with DSC, supporting 60 Hz and 90 Hz refresh rates. It is used in the
+  OnePlus Nord.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,ams644vk04
+
+  reg:
+    maxItems: 1
+
+  vddio-supply:
+    description: I/O voltage rail (1.8 V)
+
+  vdd-supply:
+    description: Panel logic voltage rail (3.0 V)
+
+  vout-supply:
+    description: Panel supply rail (1.28 V)
+
+  reset-gpios: true
+  port: true
+
+required:
+  - compatible
+  - reg
+  - vddio-supply
+  - vdd-supply
+  - vout-supply
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
+            compatible = "samsung,ams644vk04";
+            reg = <0>;
+
+            reset-gpios = <&pm8150l_gpios 3 GPIO_ACTIVE_LOW>;
+
+            vdd-supply = <&vreg_l18a_3p0>;
+            vddio-supply = <&vreg_l13a_1p8>;
+            vout-supply = <&vreg_l7a_1p28>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index a08087fb6e67..19ec9f8b522f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8462,6 +8462,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/raydium,rm69220.yaml
 F:	drivers/gpu/drm/panel/panel-raydium-rm69220.c
 
+DRM DRIVER FOR SAMSUNG AMS644VK04 PANEL
+M:	Ishu Brar <patches@brar.si>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/samsung,ams644vk04.yaml
+
 DRM DRIVER FOR SAMSUNG DB7430 PANELS
 M:	Linus Walleij <linusw@kernel.org>
 S:	Maintained

-- 
2.56.0


