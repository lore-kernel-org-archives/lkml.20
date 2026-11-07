Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794080850;
	b=0ib5UYfpw0CdtYmnbAs0jei+e0/asD3E9+jCKnrrqxOFaCeRVtod75G1qBkM7L5j2RfF
	 bd6fiRg+JEmNIKq8mtyakh7Ahc36xQ3Jzmpd++RPGE7yW550u2KVJNHx3SCUR6EHOmNey
	 t7v7w22iPszqQ//6cqi4Eft28c8gXX2g0h6m8Lp0fwjkucQMrIQh13fKbSskdj4wCoaff
	 y9poXFFP+LVWJit9LgeyI0iTqn6EbZeM57SKV0n/cNiOiY5XliXKPxOVOQQhhp3OKbjc3
	 2hN9+twAZRfFGAXEazQkikCi6u40JiHaW4OEs6ubjSKXbGkXQRC8G2FlVYoJ8S1E73w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794080850;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Mm6FIiwJQQCndC3cHs05InERrJW0T02Fhn9HKeKIGn4=;
	b=gLsaxuQT1houuwdtOpU0eCYv1+NVpRMXRY6C/fnrCY3cdodicfBoHcQlgBEzFHxCpSBQ
	 gWP89QRtXTHsoEtGWD8bGM9wU0XM8IaagXpQ7l2EGZQ9tgu6jAdNd3BDwkQGYwt0PrPyi
	 3KXS9qX7nSZ8n0FAgvdIHNX7Dn2nHVDb7faNtLEyGGuSidcK94RGw6drbNTnP/vibR0z2
	 KW1Kn1Tzu5RVw+TIeoUlGuASmpFQY8DqYp0AInZda3LX+i9R9/N6UK5HgBPalRGAPVnGF
	 4OoVDx+c8euDPLbnpTTQkqIh9nBUL3XmWkOOuTQqTbJHR/fIqvcu9UmKDvLBy/m/t3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PiMlLn7S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5700606A331;
	Sat,  7 Nov 2026 19:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PiMlLn7S
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794080849;
	b=fJU/qx7gYUKsO2qQxoteYYpitiCLkuFN3ML+os3VyWawYzDIXYAFpAjhEl7TJYnH7Ud2
	 QmwPItx72tfXMMfVfq8NkiCdEOvXAI5vO6ZJetGLwj7TkveNWHXGr5MGD5TuLSi7EUvMZ
	 W8PCwmvm2Gc1IBPDWmnXk/oQkrXn13rHtLmcbl8pHLSw7eoW7ApF3CZKjdIwClZ7CIoku
	 eWn+a8fiE+omOrSU7YDWXIfK8aQ0iFRvv2iJRglsR+y7TSK8Fzfr9h6W2xod1Ip9NTFJl
	 rhoUd7pyBy+2/FL5Bhpx9JdlsgaHmWpsfXCd1Oy4HKsFTp7eSv5xV68oYHo71KjZoxw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794080849;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Mm6FIiwJQQCndC3cHs05InERrJW0T02Fhn9HKeKIGn4=;
	b=jPp65YVtsrkwDYFCFbi/pg+mzwSy4mukKOT9DSaTkqpWvmVkykVbjMybFN76t8K1hqe9
	 w2Ss6TLaKwYn4/YiZgAL7uaF8YqhzrG3TE4PykY+ZP1yQeAGHry0Yrrytruab34PgbM2a
	 TFQdeXOKVy3qx2jM0TLt42elQJkxQOoCPogZV75NVw3u1X1ljiX50GgoBReQkbK4gEeTt
	 cKjU7lIALRmxegTv/NgGZgU0Hqo5vpTJvhYuX43QtnvSBOPvo6uFisPbZvdATxuPN9rz2
	 9yNqIXNpVvve53bvfFNzGkpzwkiP3EKPZoDkJBxuIl9LyzhhzVJLV6rwpfR07T1oO3g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 778641F008A2;
	Sat,  7 Nov 2026 19:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794080849;
	bh=Mm6FIiwJQQCndC3cHs05InERrJW0T02Fhn9HKeKIGn4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=PiMlLn7SR1qMrwrJ2iIH96bJTBAULws+ol8W/w9TprTFKqWfsmaXoRfZff8kz8YTr
	 eBCu+DpNW6e/W0KVGK+1R+3scksoLBlVteg6ubbyl6QPooeKxDJZVRRZJ38YEg7udL
	 oy6lYBmgHWvdtydGACuV1XSfAFKDYsPX4FDblwV1lkIt2pyRdxQQXwL/9IT4v+SFzc
	 Mef/YRHq7Gzax048I4+ixnWdt5QP3+cK0jRTeA3VnwAu3Wv1K2DD2cs7Oz7BpSdvDk
	 lGfbnFbiiOLvCxblWcTPivdUdxla6BoAGpJEw6qFGzcIQtDIs7OcLyLrBpQJIcdJHZ
	 cytofMWt/maSQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EA1E247CD4;
	Sat,  7 Nov 2026 19:47:27 +0000 (UTC)
From: Nizat Mikayilli via B4 Relay <devnull+nacht.dxdmail.cc@kernel.org>
Date: Sat, 07 Nov 2026 20:47:25 +0100
Subject: [PATCH 2/3] dt-bindings: display: panel: Document Anapass ANA38407
 DDIC
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
Message-Id: <20261107-b4-ana38407-v1-2-c8b33147110a@dxdmail.cc>
References: <20261107-b4-ana38407-v1-0-c8b33147110a@dxdmail.cc>
In-Reply-To: <20261107-b4-ana38407-v1-0-c8b33147110a@dxdmail.cc>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Nizat Mikayilli <nacht@dxdmail.cc>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794080847; l=2697;
 i=nacht@dxdmail.cc; s=20261004; h=from:subject:message-id;
 bh=IsNCu5Dme3lIS4oio6hRleTjSweAdbDj0hJ3QVorX+I=;
 b=eUCnVTxbEIZxTZK2ThW3X7Dabrxqg6d2vaBq/a1h//bK4+PJgUMZeocJwmknJIcyVwUN6CVRN
 Q2i/778WbJ+BGmKBiGA1mcNCXR7cSHYSoyV8MquG9TVNFKYLFmGqrkd
X-Developer-Key: i=nacht@dxdmail.cc; a=ed25519;
 pk=Kay3P3pOJq5klUD+0/I8QX8JGOh0CeQXEwRVv7CMm4k=
X-Endpoint-Received: by B4 Relay for nacht@dxdmail.cc/20261004 with
 auth_id=1111
X-Original-From: Nizat Mikayilli <nacht@dxdmail.cc>
Reply-To: nacht@dxdmail.cc
Content-Transfer-Encoding: 7bit

From: Nizat Mikayilli <nacht@dxdmail.cc>

Document the Anapass ANA38407 DDIC and the Samsung AMSA10FA01 panel
found in the Samsung Galaxy Tab S9 Wi-Fi.

Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
---
 .../bindings/display/panel/anapass,ana38407.yaml   | 69 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 74 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/anapass,ana38407.yaml b/Documentation/devicetree/bindings/display/panel/anapass,ana38407.yaml
new file mode 100644
index 000000000000..5dd221d0bd9f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/anapass,ana38407.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/anapass,ana38407.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Anapass ANA38407 based MIPI-DSI panels
+
+maintainers:
+  - Nizat Mikayilli <nacht@dxdmail.cc>
+
+description:
+  The Anapass ANA38407 is a DSI panel controller used to drive AMOLED
+  panels.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - samsung,amsa10fa01
+      - const: anapass,ana38407
+
+  reg:
+    maxItems: 1
+
+  vci-supply:
+    description: Analog voltage rail
+
+  vddio-supply:
+    description: I/O voltage rail
+
+required:
+  - compatible
+  - reg
+  - vci-supply
+  - vddio-supply
+  - reset-gpios
+  - port
+
+unevaluatedProperties: false
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
+            compatible = "samsung,amsa10fa01", "anapass,ana38407";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 125 GPIO_ACTIVE_LOW>;
+            vci-supply = <&panel_vci>;
+            vddio-supply = <&vreg_l12b_1p8>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..e282fbb04e6e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8228,6 +8228,11 @@ S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/sun4i/sun8i*
 
+DRM DRIVER FOR ANAPASS ANA38407 PANELS
+M:	Nizat Mikayilli <nacht@dxdmail.cc>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/anapass,ana38407.yaml
+
 DRM DRIVER FOR APPLE TOUCH BARS
 M:	Aun-Ali Zaidi <admin@kodeit.net>
 M:	Aditya Garg <aditya.garg@linux.dev>

-- 
2.56.0


