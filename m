Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793735063;
	b=HfCwH5y2dqPsBEuK9ENn6jjVzqtuyeygDNJraqqEfPCsRExO9YFl9wc4DdcM5fJAPlTp
	 QMPKjiKJKBsi3+dIBganRK/HqZq7AlmYZ0UJNY1jHcG3eMq4MWQni6g9ioyzNSkncjBpI
	 GmlClEO1UxRfrGaeSbQlRtK60T8blPxVS6ylcdlrvULrTtnxHrUiH6wXoqX3vNAoK/TtY
	 xQ3tJIESe/iM1R7d9bRLbYEqiCw7qc7qpbQN9yZMkLgnxM3r8O9PnBXkgd9B/8d0svL9v
	 2k6AvgqnxwaLCLsxU5XA3Yij/FAFB49JUvC5YWLBS/FivcjMW/9ph+oVZcfjW8IgKfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8jpkCkqc5hTdS5axI8qi6Lbo/rJIC7+WdDh/yv3kaPI=;
	b=cKBHEHcA18dyOt23WNW8G/smjeLVpLwhPrQUUWVg6tvXGeDFaEXdWt2oSwJLSXOQQW5p
	 48cMi2yZWkynoPd3M91cWeBP+GRJyfY6JvfG0qrH5br0JThNECKjywK8ZgHPI42SK032j
	 VGKLm6W+hEpSGKya6pncCmjISRV2bc3bvUWl4c3JLMMTochtHtZbfQo0q0X3FA8uKVsyv
	 YUU5BeuXJnB0Ah2H/UyvFgcmyNKb5HucHViIdX76Oc4wrb5h8xXQgs8FWLReY40hzRJZ8
	 Jqgjxrq7m8nU9WJjprJOFmcCBKkJHx1ykSE3UT4aO8ucwgRz22+GfgzAOBB1sAzrS1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lHQMUZSO;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07110606A337
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07110606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lHQMUZSO
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so41586925e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793735061; x=1794339861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8jpkCkqc5hTdS5axI8qi6Lbo/rJIC7+WdDh/yv3kaPI=;
        b=lHQMUZSOhKdGVdbrzFOPzs8jy+HGwmA04DoqjzjWjYDUBnS2e245zZJkKtbuNaR1E4
         hQ1lmfoVmZXrGuwp16eF3fKqsHyiSOT4eLFVeqcI5OPceaCwqY6pLoz7TsAFwDQZpBX1
         /ggQ5mL1J294ldi8bRqXI5vCvJzN0AbWI5TUX0KqUgEp9hW4iYjJQO4z4DqGmaE60Q5y
         xHxo6LURPAi4zy9sYQh8WkSZDCQS6NkmY5Cg3jJKXqmFZ8YXu/LXlYlTNd/eKv4AjA4f
         aleQySxVnLc5WWuz6gKrmBeByJdiH4V9g+CobLjR1/H2zxKR1ZPQ/sC33aUucj0tBWlb
         9LSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793735061; x=1794339861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8jpkCkqc5hTdS5axI8qi6Lbo/rJIC7+WdDh/yv3kaPI=;
        b=sh45W+Q1/wcnh6HtWmWO38dYRPJO7FVyyLzdrXjT7af0FVgXscyuUlt/qwYLHTXfs0
         cCZng/I9ypf0MrmOIRYM9/DQ/yz+dmz+nSuL+1CD2HkRoz6q4cTp1qu4EpgcTa1mcpas
         sP2BaVaofO8N+Hc9abINonYvfAxcnoeBpNPl5UxVR9xn4zFCWbVAJxKNf43FQj1xYgwE
         GozSgolVbbs+N9ua8wRJ8IImPt0kUnWnLWZb+W46pyQU0+YfCgQ763jylEWnTIrpbB+d
         gyqQxlbTRammO4SPXlqJ3kOGBGPlsl2TcVExq6q9XNizvUoiLUV3yJ+SRLZTXd2BsdRf
         acAw==
X-Forwarded-Encrypted: i=1; AKwUvBxTmVIt1rbdCZKroQniiKsGB+8frcR56bNWWXfVG9n7ZjK0PwTqCJniLCIBttqK3U0F2cgXk/ykTNwGRSs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hic6WKxzXkb+UF61SSlGEVVYAM1DnSWeBWBI42z94U+sfTlJ+
	sEkKhLi+ZA/DBCTg0dQgNT8ZZDE4G8u2YU+yxjR+2Z8l44P3fzHT/5f7
X-Gm-Gg: AYBFou3Hx+zBifbOMViX7m1N6JhqhwWpLD1X+W9GixE+kJF6+O8uaTv3QGs0tIOuwv3
	y4UobN10i/FggScruvMTB0FAcf/VbMe5hG3qbES/C3QAFFCbuYMppmrmzrk/ZCg0F/P+zkLF6J8
	HLoYhXVEK09tHdepu+aPQm8mcwTlNKWpTjH+KedXscu1L5hex08pVnLEHo0WDc13uDZnEbQS/mZ
	74EnSEBKFcC/Ik2oQFqyJjCamW+WIq8iVWueuZop41Bqd3BPLcdJwNqH3nUWemXHlDhgZySzs65
	ZsGKB12GMrT7zIDA16LQTQSecm3iV2NbnbsMD57wqy31SI4qY8lzox+lZGKdrLItqnQftDZMk/K
	VVqxCgUJHslLt/S7spHJvcY2EctJaML1pcRW5iF6WfrlgHef+7ThTh3H96pV+VqmBvq2r2TvABI
	VoQCXuhRVVgYHJ27gcaR/QwaXYULca6phuR9eqr0Chiw5cXfNdpJ1Rc+cxsAiYwqwzbzQn24DYo
	WUO6o8QrUcBICRTdC4U1LEOyXBxUdHKvlifB4vZPBOyMIjptSANiSdPdaR1dZ9mHTHZXib6nRf0
	cH003oqVab7Meb4PmHV+X4fKk+qpMF56an9j7pVu2E7/NqnfVAA4f/7PeIj+mhKl6XaDFB8QmCh
	ECnIXV24EkhvRCFE/SJZLwSq0DycBdRfb6g==
X-Received: by 2002:a05:600c:a4c:b0:4a1:fba8:b13d with SMTP id 5b1f17b1804b1-4ac17d16ba4mr320226935e9.9.1793735061345;
        Tue, 03 Nov 2026 11:44:21 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b2a93232f0sm82557885e9.10.2026.11.03.11.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:44:20 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v15 1/3] dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
Date: Tue,  3 Nov 2026 20:44:06 +0100
Message-ID: <20261103194410.6632-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103194410.6632-1-ansuelsmth@gmail.com>
References: <20261103194410.6632-1-ansuelsmth@gmail.com>
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

Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
for the USB controller.

Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
always supported. The USB 3.0 mode is optional and depends on the Serdes
mode currently configured on the system for the relevant USB port.

To correctly calibrate, the USB 2.0 port require correct value in
"airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
selecting one of the 4 monitor clock for calibration (internal clock not
exposed to the system) but each port have only one of the 4 actually
connected in HW hence the correct value needs to be specified in DT
based on board and the physical port. Normally it's monitor clock 1 for
USB1 and monitor clock 2 for USB2.

To correctly setup the Serdes mode attached to the USB 3.0 mode, a phys
property is required with the phandle pointing to the correct Serdes port
provided by the SCU node. Providing the phys property is optional if USB
3.0 is not used.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/phy/airoha,an7581-usb-phy.yaml   | 61 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
new file mode 100644
index 000000000000..61a8d773f207
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/airoha,an7581-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7581 SoC USB PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  The Airoha AN7581 SoC USB PHY describes the USB PHY for the USB controller.
+
+  Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
+  always supported. The USB 3.0 mode is optional and depends on the Serdes
+  mode currently configured on the system for the relevant USB port.
+
+properties:
+  compatible:
+    const: airoha,an7581-usb-phy
+
+  reg:
+    maxItems: 1
+
+  airoha,usb2-monitor-clk-sel:
+    description: Describe what oscillator across the available 4
+      should be selected for USB 2.0 Slew Rate calibration.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+
+  phys:
+    items:
+      - description: phandle to Serdes PHY. Optional if USB 3.0 is not used.
+
+  '#phy-cells':
+    description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
+      as defined in dt-bindings/phy/phy.h.
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - airoha,usb2-monitor-clk-sel
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/airoha,scu-ssr.h>
+
+    phy@1fac0000 {
+        compatible = "airoha,an7581-usb-phy";
+        reg = <0x1fac0000 0x10000>;
+
+        airoha,usb2-monitor-clk-sel = <1>;
+        phys = <&scu AIROHA_SCU_SERDES_USB1>;
+
+        #phy-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..a9c78e635764 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -805,6 +805,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
 F:	drivers/spi/spi-airoha-snfi.c
 
+AIROHA USB PHY DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
+
 AIRSPY MEDIA DRIVER
 L:	linux-media@vger.kernel.org
 S:	Orphan
-- 
2.55.0

