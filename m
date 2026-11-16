Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841857;
	b=Gd71UDpTRrucj2vcP0PDNpBh9NvylCffimC7VYzFnfCYheeCCrWENZHzivbwTakrBaA0
	 InzxPjOQgMd/k2F7jSOLAXTiCrAIZy94rltUksUrM5VSDd3+vQ7v0yRHA1dpWp9wqKmc8
	 ZPuU50XzUgj7D3MI2WLqJvS2fZMVLZmSUgQtcUPqzQ2zZXQWoDYsoB5AT8YFJ5Si2GSxC
	 YNYWGIbuLslD7zIwfMUsybymCIP/BTY10pIT0vQms1xZyx1Iunv4/pNddv1DXQD7WSmgs
	 uYeuVTSdIm5InQ2zIKW6tj0ti/OinRRD7dlz2eC6loxdD381jFzXTgPOpb6ylxzsGQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1z7RmYK1NjDMEO9+xJDI+w73bgLEkLKZ4jmIOyAvUDw=;
	b=VxZ8wFI/DZsSXXJEmVpEtHcfK33QO5rtSDw88aYZxDVTYAi9VX9XP0TDwk4aXw4KSZeG
	 zfi11qY5H2Za4DY3c1OD9ew7E9aN8Xfkv0kEecU+84ah5uv8I79G5/7kTwrdPbtUHhEUI
	 Y/iAJ24FujbsQZoE95ONHdabK+Ea0oO7qxluCHssdM1hZfPs6h73iQVJEsiES3fYA+mTi
	 apjFErAlXngVY37oaG0JASsPRJrlJrHJqfa5F4HOCwpPkP29BBMCI+kE91ByNCRjT61Yq
	 tq55QJYEjkWziw6hSpdQ8FsjMVEno67fqy4L8qoCn6lK9V+g8OJ1BSXdIQWJQszq85g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mwkv+RtD;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37C5606A894
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F37C5606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mwkv+RtD
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c50604721c8so578675866b.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841855; x=1795446655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1z7RmYK1NjDMEO9+xJDI+w73bgLEkLKZ4jmIOyAvUDw=;
        b=mwkv+RtDSuotE+NF47KVp3efHuF3DBRZQPS6kPQjSTVJbutdaYNFOo8NgD5HzA4hiy
         5+AFm3LX0856KhyzdO45jVxPhwN7dbxMkQh3QyH6+8QYRC+FWIW3Y3g1yLJ5kkEy14sP
         eN+a2v5E/SRrYIHrRZbkRSGf0TRiqnjm+KkJPheXy6czfoBoXlLtFnzxae+OmgprZ6ZA
         7xRoQiQIUIPCPmiOUv5jmDJcKgGezKiFZWVoJfbmLhUCjGuhRoCDfnnaRIcAvwAbHDOu
         Hgk9oXEPT0WJPE2VusOJr9b0ElrpcPAeUSBB1/46HOyKL59oGtuoo9tRg3azXvbj2Cju
         LUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841855; x=1795446655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1z7RmYK1NjDMEO9+xJDI+w73bgLEkLKZ4jmIOyAvUDw=;
        b=FiTQfdXF+IUm4qmV9HhJc6w4ejspyee29ekhlYMzmJCX5Wn8Nu+Us/mwQ4/hc4YhLD
         buSD8ce5C6jeP80rDVPV9lybYICsfvL9LCYVqq4RwT9Jk4DaU4zx08scyk6y9M6sDqLj
         T70O2rNAojTQXCHGdF7zekCD2JazULvQy3nM5OBXFTmQC2aoOtkXaOCRYaF+JLRriFb2
         7zyIK8bDAfCKoelL1AWjpzlW8l0bC5LH7gJ8At3xff50LyRWx6o0lvMa0JJGg9GTgV2V
         fri3AA8nzoiwmWQTZUvj9KtM4h5Ip/oP+H/TbNIjP1eElHgjCqsTHSLULz6RYGTkO6tR
         sJCQ==
X-Forwarded-Encrypted: i=1; AL+hErFU/AdNgfATfrBgOkWZvdY7dBRryasl4SmXI03KQW9UL7mLtNPNu8J4BDjnlusCAQiBN3sE6Z+zQ0pKv3I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+FMcdCZst9Yj+6G2xm7kpUESAoJbSjcGKaXS3uQFw7cuDdaUq
	zpHd13mp1kfIbjk7nHMxHXKA4GV5L832jYyv9dHlGRk9iV0KEQUzTuYw
X-Gm-Gg: AYBFou2Wraov/f6qlqN+k1SqlRKBtWu0PNAUhpGvdJ+Kwvs2zZ53XVMglD36oO4Ws6X
	MRozm8SXTpAR5VsprzDPYJm2AJvT+USuJQi1zrzlmGD2iMrKtNkGxd3RqVR88nnxlMom9Wf0O/T
	kMyauOy4INy665iqFjrF7JWzKyN22f3tnSKeO4u/yCfuWUbpRzMQqgdhF58zHfxeoAPGZHP8FT7
	k+Ry7PBGfWfAjmJpQ9iTS3ZtVkFEUWSiFe9k+M27XMkZ7yvg0KkqLmp3ScCsAsP8fFC+eflAv7g
	1Pad8XolV1PcXxrifPLAPhBa1uf2JuFJuojfQWW9/MM56CQKk7VW33wTGPxRam6ZcAFk5ptCTny
	hJK5Cooo5DJZDqIlvpE3mWTLJQGCdCbBHXG1Jm19n6yj6lUn6RmovEr5WxOh1PvWp6wkyA3rAFx
	kr25SEX9moRHySpgWIGKNUQ3zu6Ej44YDcwivU8B5ym7fDVvpZrdtsoF4t2DESjXS/MVWPZ50S+
	peyiJS0mb9XbjvufJ5yCasWhwIQUH/AIFtSGiHjUH6h5paoDA4W6VugFWTmfySEE17jX1SYvnOZ
	+s/AmAxBKrzLqOeIIuPpK4Ay5NshdHnhZRIzvagHrO9DjADQjfFT/O1jAchTN9Cg6N8DsmliND9
	nzXp8NLQA2A==
X-Received: by 2002:a17:907:9612:b0:c29:f5d8:9c75 with SMTP id a640c23a62f3a-c50963fe3dcmr895394166b.36.1794841855283;
        Mon, 16 Nov 2026 07:10:55 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b93a85sm420868466b.84.2026.11.16.07.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:10:53 -0800 (PST)
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
Subject: [PATCH v7 11/12] dt-bindings: display: tegra: Document 8-bit CPU parallel interface
Date: Mon, 16 Nov 2026 17:10:16 +0200
Message-ID: <20261116151017.274764-12-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116151017.274764-1-clamor95@gmail.com>
References: <20261116151017.274764-1-clamor95@gmail.com>
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
 .../display/tegra/nvidia,tegra20-dbi.yaml     | 108 ++++++++++++++++++
 .../display/tegra/nvidia,tegra20-dc.yaml      |  15 +++
 2 files changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml
new file mode 100644
index 0000000000000..6a34202f80765
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml
@@ -0,0 +1,108 @@
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
+  nvidia,interface:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of DBI interface used, 0 - primary, 1 - secondary. If
+      property is not set, primary will be used.
+    enum: [ 0, 1 ]
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
+  - panel
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dbi {
+        nvidia,interface = <0>;
+
+        panel {
+            compatible = "hit,tx10d07vm0baa";
+
+            reset-gpios = <&gpio 175 GPIO_ACTIVE_LOW>;
+
+            avci-supply = <&vcc_2v8_lcd>;
+            iovcc-supply = <&iovcc_1v8_lcd>;
+
+            backlight = <&backlight>;
+
+            port {
+                panel_input: endpoint {
+                    remote-endpoint = <&bridge_output>;
+                };
+            };
+        };
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                bridge_input: endpoint {
+                    remote-endpoint = <&dpi_output>;
+                    bus-width = <24>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                bridge_output: endpoint {
+                    remote-endpoint = <&panel_input>;
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
index 69be95afd5627..a014bf0dd508d 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
@@ -76,6 +76,9 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: A list of phandles of outputs that this display controller can drive.
 
+  dbi:
+    $ref: /schemas/display/tegra/nvidia,tegra20-dbi.yaml#
+
   rgb:
     type: object
 
@@ -155,6 +158,18 @@ allOf:
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
+      properties:
+        dbi: false
+
 additionalProperties: false
 
 required:
-- 
2.53.0

