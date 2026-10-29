Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287795;
	b=1z0U1yhP5V55fFJUS25k8tLRHKvQg7dhXIaQiV4H9F5igZb1g1fm3/hgugAoxjQqVX48
	 xkyFS26Cy2Pv8WhNFRtYDOXvyhIlVDZ691aPKR9Aqcwq69oKx7I967kCVHPa4ZC4dk67J
	 +48W+y6HKXITKHCLW7e+ltvj3Mgb/tRF2G6aMoJVCHr2U7q96vsleGKWwT4gVOtp3Cd/m
	 asraJfqKkA40yYViWhOpsthUNmTlVaswsc2T+Krcu1UN7Bgr1Bbvg1KHeL5nfgttnE8P4
	 xFVlU/r0BRJ6elSywXGhZf1BERMYKan8UOhbQ+3m10Xw3cMLtkeN3L1RBNMXgW/yeqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287795;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3S01xD4JAgzzx2hQLx/xQm0YodbZuGxyyLtCeJj7JK4=;
	b=r/wJStWBqGn62eea4M08995e1XlW3Eil277+yXVpGRf8lfMZEgxZbiHY4AxDxIsqeB7U
	 PvgjEiN8pyB3fbDe/+NvkT508p0haLeskm4LIFM4XQRHxtjiKAIGWPxhEWcBbLpZ12zQK
	 th8jI4DUYIGbAV3by6wfkIiIxJdW6Skx9HEHtYQS3mA5JbJuj3OoegTVpDoPl7a9aE3Wm
	 14F7GX6Zn5u0KZ/G2N/37dQCT0O0OmTU/jcsbCp4558zmCeXEj+FV0XVsAvzZKrR1ZRwV
	 q3XgjVM7Q/KUNhhu7zNl2TVf3NoK8dToAi0SJIfdCYoQwmlGAWPF2hkgIBMnjUr3cNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mhCygOQo;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED3560A2606
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CED3560A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mhCygOQo
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c43373ae89aso364495666b.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793287788; x=1793892588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3S01xD4JAgzzx2hQLx/xQm0YodbZuGxyyLtCeJj7JK4=;
        b=mhCygOQo8ONwwE/XCjbgqK5IYpd0WEW1GFUOz5phqWZjC/gDC/8oNVWH+oHiBKPft8
         CTxuJXsZwC5aNl2PRtJSslkrJE/mpuRGRs8dxMhPREMNrAON68+RC4J0I/fXcj4Cr3xS
         iHR0CwVcmvU4tcYIbLqFeqQSKmqNXrywkfUB3HV643Pj/TAUSh1nHNPGzLkDB4zUMhpN
         rhFcgOZnB6bcLl0PY9wPgkh1kA8djpO5CYR1fEwAxYT0vYQ7MQ7VWB2+SkFNxTNyNMZI
         DIClPrizv0RijoP8vBFYI7AMGhQnbcyNRncq+d90OLzPKxBuREiJuv63WmQp0zGL8+Z4
         XLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793287788; x=1793892588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3S01xD4JAgzzx2hQLx/xQm0YodbZuGxyyLtCeJj7JK4=;
        b=JfRGciQAUyJCI/UoOUDja0+tUGP1UQH5stOmXIvIOBEIxeexSghWYajmfeBcatjvG7
         18fgRWy8ZftqP2KLZPYiarYd3oit73nJzO/me6YimhL6hqx2VlKEhE0YtJEC4ceZfMOt
         1yNW+Jgy8BX7Y/SfzTfrtt1/tC/XEkixu9MrpLJ6LWwV6TfVJbXxSG+YUxcd0TrbVDu7
         56KaVplllJCC42Y/uQ87ZOpWtVVe4xOUNCGT5NRQ9G6bdJC1v+pbKcHz+6ncJvsXOBz+
         NmSu0eNXW/HadYxSk9RrzJZb3RZMjKPoyge26l+dPpXRxFrpYCA8d7vx2JAVEJL/icrS
         cGNQ==
X-Forwarded-Encrypted: i=1; AKwUvByJJI4VGqXV31SMqiGY5VRf9vswmi+or/XDsWUBNqd05P2V9CB7S4bDGRm5no7qnZ7feSXCF9t0cJZEVXk=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6NmX2fnPCsYr3kS7O0fVAfByDGJ3EBTEQQ0P3TY87idwuOdYL
	kcEnsp/v/KAiv4T4yMfjHypK97mIl1jIio9BT5njd4ti6HDoxLvdp6am
X-Gm-Gg: AYBFou0PeQOf3QJ9u92MahngapHCxJLd1B8qWeoGsI41SimtrEoIdKAUOJ+BrQJKJ4P
	ra3F2zIS9h4kBr1OSz1IP+C6RHmNuRynTUlZUfLZid6ijmBR4ORP3pYCxKREm2RvZ+HgRvbK5n2
	qml/v2+G0kpb0BQrlLIhDEwh1vbqlbUnWAJGwCeLGt7Or6VzSXqoxhzgnbPEO0M5Qi0SH6GHaOD
	RAPYjKDk02NH/vFHG2y9LRQ9cNo5t1On4ws0pS9vvYI84zfRqBFOb4bqgH2pN4hr4BzQ24QtCsH
	qS6EBplQ6shH7QE5dIP9WQmm2rrZemQW64uCVUelMlA51scC6BXlJtiTYWq6kUXKyk7ZdhPPRVx
	B/PGrCKyDoQAQ6OughLZDQXX42mmF2J7qNn67N/CWMUGrqzobQmXKk75/WOB2WcdaJbKOsChjng
	Z8+8OP5uQ7Fo3NlUzw48Vpwzqak1PCLyn2c102pEWvnLuVReC3RiZSXcZpMwXR9Hb0nLavI2g0E
	HLi3Lc7fJ4VrHNTUaI6dPgv1VnYuBQ5C0RHSiGqP4KZIxOALAx63nZcGgzfX9l3lcjrCCPbyeSa
	nIFuTwd2Nc/ojVdUt1EMqKmxt/eLCCP6v/Xf3XZHInMSh05A4w==
X-Received: by 2002:a17:906:97c5:b0:c49:cfcd:69e5 with SMTP id a640c23a62f3a-c49cfcd6a52mr239044866b.32.1793287788116;
        Thu, 29 Oct 2026 08:29:48 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4ca27984f8sm1252166b.80.2026.10.29.08.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:29:47 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v5 10/11] dt-bindings: display: tegra: Document 8-bit CPU parallel interface
Date: Thu, 29 Oct 2026 17:29:08 +0200
Message-ID: <20261029152909.234584-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029152909.234584-1-clamor95@gmail.com>
References: <20261029152909.234584-1-clamor95@gmail.com>
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

