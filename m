Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887574;
	b=bIKdcyRM6/N1wj7H29k4wRRruDdBK0r53BRpT+as0OnmH6g59wJ2b2o4VcO+9/F6D8y7
	 Zo9FoWkFMhRAVaS0zJVo1FHLEA4qOkkv8koGXdDsyW25RXJ0woViLiw1QujWErUjRENew
	 +nS7ruEg93PqiruPjIRq/8rU8VmyexobMfcTVz7kffreHHfhE24w1XHKNw6mHzBAFDdAd
	 qoO/8FqPG5RN/ibqqvWs4ixgJSuLdU+icd5YxtnUXOJibkTZU3WjFbqsNdq00nRKtVmGm
	 pCcRxHwax6piXQ7tfscK/RVtph33+XuXhv1XP/4yR0BC2SDasvdj3zGTQNm3L4gseHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3S01xD4JAgzzx2hQLx/xQm0YodbZuGxyyLtCeJj7JK4=;
	b=EcL6FWo/GZ5T/XJ7rpNU4+MMIt/MlRnUj/hcR78oAqF8US6ZKrbL9uFU9h9LH8bTJuha
	 9h8yrnnigSjMqQD3wK+L7iJau4nXVILGttSfJOxB46HtAC5qk1Wm/66ezu2KGG6fkI1cG
	 rhY7jwkTmiIYCpDKETWZykM5J7zxBQF7f6T1QUj4QrUfWWWZhhiAM2dGbz6Y48r9CKZuy
	 K0VmLW51DSHUPHvso6cdBKr3ntNSj7IqEI4aur9vWIQG6a3vsGV4wca8LPgpO+TL/rdso
	 a+Yv5kWmfyNgi9mlosefa0AFNS7PYg4+Id6dpnelP38X7WCcj3MTudekAC9537cCYEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BF7EnJZW;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD38E606A331
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD38E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BF7EnJZW
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso422379f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887572; x=1794492372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3S01xD4JAgzzx2hQLx/xQm0YodbZuGxyyLtCeJj7JK4=;
        b=BF7EnJZWrDDMVMnvLvvW9/COpFbIB5VTaQZysOkiaudeopmGXy+tvSljlUNx5lDBHT
         +pqBPFzc7BqsAjj/CPhZZh7mRx7thAe4DiAAVJWReMuCIXgyrplxT3N4q6kCUuN6isgN
         XPmxG3PAUfpJ/IHTbWH6+5WNonERMZ12AVbRVYBby9PEho4Jvr6fuJ/UWdMIxiyJ6lHT
         p+aRHaIpJzR/d5/0ucQTQLYGAvlg8nkQCHM7rsbZEZFxoqbjKLQLMfNlK3RF7+99hjDo
         u6iga+s5+r00nCi6LQBiVy7fhbgpmP5K/OvNkZQlO8XB210pckUK+VP3r68Tz9vxHseh
         8OWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887572; x=1794492372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3S01xD4JAgzzx2hQLx/xQm0YodbZuGxyyLtCeJj7JK4=;
        b=LqYdpBuF9rNUiXQT/Kyv/uHoG0pg+rDPFASBsYI9ooZIhCvGuAgi8KFSxAUtwvtILn
         tmQI59LIKycU9Q8q0NTRasmXsdo3BYbigBpGIH9bhncqznMBkZ3HBDDHfYN0AyeO7DZD
         oqP+4xD60k4t1H/GLAXSc4aRXVm9CTGWuW6tcGD3Ax+4CLyW+/CfvQE4QveEy1O0ZPdX
         b20kC3MnNykijL030As9VNcp0ij8LvIGLxWtU0sglRIjchvgBm1d2y3UeCl9JeO0qBZZ
         f0R04mzyGzNicjTZYxS16dF5Zya7i1dEi1cNiATxz8CqEnrFSbwpmSZpjsGNSZ+OctMS
         A7KA==
X-Forwarded-Encrypted: i=1; AKwUvBwdpbOQ0obguaPyRdmGD2SInmzJlm0mNv8CjkY3KDbEvUaWiPaZNaUDqQp9759TSe4rnto0yN/JYM9F52s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9K1SuSELQ8pz09UHwyJItSeGFoPZy1E6VImsK3g6X5gaoxUL8c
	KnZ2dDeGTv982lkvDBnUJlt4thTkBt5mkVZKRJWcnQETHJPuszAVdBCU0t6nqQ==
X-Gm-Gg: AYBFou2vqzewzNW7V5K7SeaZC1NPi1lMgF/xqDIb8oOBl4o+ZJlx3TBEGGBPS8jOs6r
	1x2YzmoaAcKtqnh9CapbrrtbCXTw41EVbj6YFsuNnkTZ1Cr8m9FzUPuwOyV83T+dGDSjW0um/Cg
	U8uq9o5s1siFxB05x1OemznVZ6cwa+OQzNSUfEqb+u+xEQErFVsCQUFLgsDwXjWOmQ3GNLeFn74
	lJdlYv5Qw4zkB6jv87g5dlScQflr0WgGLOHUAtd0D7DJoZYkBfCUObXGgj7paOBAqaoErTcqtOJ
	ipv11KHuDV2VUN1KL/pqLRXgu3ELan2TJpi9kQ8rF3cjdz24wuhoHSYSOlAjNec+UrIkZd8Dj2L
	0DEBHRq1BDrQfNaZrhABmHNn/Vzv512sIQ8hjd/ukARnlEREfqcG/cjPvUTfjUpZKSHKM3H2GDP
	Q8C0cte8hnVI1xCPgHytz6/HtH4zOZpzXVSCmTMKk7eR1PwrGa5QuqveXmj7ktu+1A/z0IYPvZZ
	MwT9KrPlmAdlxYMPYbBL3AgfX4vauK1g+aE97WxCLeRm04yF8Ys+8WdZ28M572CW7iXsdT1vfxG
	b3Etd9ZRyrD2UV0wc5iEDYwQaB4UkPDVhnjUNl0gcusyUfIJKzNMrMKTlPD1KQVPnXGR9K8=
X-Received: by 2002:a05:6000:3c7:b0:48e:7475:fe7b with SMTP id ffacd0b85a97d-4911906d185mr4750001f8f.6.1793887572221;
        Thu, 05 Nov 2026 06:06:12 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed92a753sm11454111f8f.45.2026.11.05.06.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:06:10 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 09/10] dt-bindings: display: tegra: Document 8-bit CPU parallel interface
Date: Thu,  5 Nov 2026 16:05:09 +0200
Message-ID: <20261105140510.165165-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105140510.165165-1-clamor95@gmail.com>
References: <20261105140510.165165-1-clamor95@gmail.com>
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

Document 8-bit CPU parallel MIPI DBI Type B interface provided by
Tegra20/30 SoCs display controller.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra20-dbi.yaml     | 113 ++++++++++++++++++
 .../display/tegra/nvidia,tegra20-dc.yaml      |  22 ++++
 2 files changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml
new file mode 100644
index 0000000000000..cd568d19c363a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-dbi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nvidia Tegra Display Controller based MIPI DBI Type B interface
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description: The display controller in Tegra20/30 SoCs features an
+  8-bit SPI interface that closely resembles the MIPI DBI Type B
+  protocol and is referred to as '8-bit CPU'. Each display controller
+  provides two such interfaces, which can be used to send MIPI DCS
+  commands to initialize and control the panel while image data is
+  transmitted via 16/18/24-line RGB.
+
+properties:
+  reg:
+    maximum: 1
+    description: DBI interface used 0 - primary, 1 - secondary.
+
+  panel:
+    type: object
+    description: Node of supported panel driven by the bridge.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Video port for RGB input.
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+            properties:
+              bus-width:
+                enum: [ 16, 18, 24 ]
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for DBI output (panel or connector).
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - reg
+  - panel
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dc@54200000 {
+        reg = <0x54200000 0x00040000>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dbi@0 {
+            reg = <0>;
+
+            panel {
+                compatible = "hit,tx10d07vm0baa";
+
+                reset-gpios = <&gpio 175 GPIO_ACTIVE_LOW>;
+
+                avci-supply = <&vcc_2v8_lcd>;
+                iovcc-supply = <&iovcc_1v8_lcd>;
+
+                backlight = <&backlight>;
+
+                port {
+                    panel_input: endpoint {
+                        remote-endpoint = <&bridge_output>;
+                    };
+                };
+            };
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    bridge_input: endpoint {
+                        remote-endpoint = <&dpi_output>;
+                        bus-width = <24>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    bridge_output: endpoint {
+                        remote-endpoint = <&panel_input>;
+                    };
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
index 69be95afd5627..ffeb124905dbf 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
@@ -79,6 +79,16 @@ properties:
   rgb:
     type: object
 
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^dbi@[0-1]$":
+    $ref: /schemas/display/tegra/nvidia,tegra20-dbi.yaml#
+
 allOf:
   - if:
       properties:
@@ -155,6 +165,18 @@ allOf:
             - const: wind
             - const: wint
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra114-dc
+              - nvidia,tegra124-dc
+              - nvidia,tegra210-dc
+    then:
+      patternProperties:
+        "^dbi@[0-1]$": false
+
 additionalProperties: false
 
 required:
-- 
2.53.0

