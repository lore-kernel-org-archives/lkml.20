Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873009;
	b=HVt0HWO3KrguubXYz9YafZB5LDXPMiwx+oaznldR08pUaGruU1pz5PfLdAldsdimu1vK
	 0IFRAXSB3xKLNOiTujKnCxEtjdqhvo6+/cSPrDAqYHFQHgOZL9eeFzbsAEADHcUrulA7U
	 tA8vb20ZN9Zkj1oMjyFSyUDjWz9hilbo0cWXtzSbbLn4sGbBEvMW71os2PBvGYXGATQ4C
	 skYmB/yiKfUDWBBQ9arFi0pyPZRFvwV20WEbNBS3ohgrZ9Ix+YywYxlLw5SboUz8tD0r+
	 R/AafyDD9aDUycRbUq5b4tvwRc91VyJdTpyeOTvGTTmWWdUgJaorAVe6A5IyxpFKwRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873009;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=riOJeDHnKOl8qZ1I9NldksXV+t7kX6cUU4xrN1nR2eM=;
	b=1SuRBM2lZugTxO5+6KM4ybcdfo35QXQMLFJTGI2lIEI8Dga5Ibom/uOjcJDqi2BPUoqp
	 GBRgto83nVrqAX+T6hAlpED/qXEXY9rChNW0jxv8j/gkROO6smUt1p9icY1ELYWPHuOE9
	 VxrRn7cR1jE0ieJCqUVP13RhZvaIKK11+ragtd6NKbJ52aMGQaijGFtCeL7a9Kyz2LVbJ
	 YK+4KLmKylwWsqhwfF7+kqi4MccigWE5yESQh8U3jeJpD4woHp7EDr09yUFk1P/GNAarZ
	 Js4vSG8KgV7Fnv/v2AxgLRZTqQXsh1sAJRZwRUbDVHgZ+7lUTvC9uVm8g+cue5KtHTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7948E606A331
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7948E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso11069815e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:03:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873008; x=1794477808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=riOJeDHnKOl8qZ1I9NldksXV+t7kX6cUU4xrN1nR2eM=;
        b=bzM1TKyhQW2lZTc1JwG1azk0u5H0hvr2olDo/ylsdrE8O31J0q7L6odfKWyQc58ZIX
         EMv1ohuCJAVobCs6IiWTF4JnH4dmuPsa4nh63W+njTpqIOSvVc+sWPgDBV/FY6EAeOpf
         +T+jvhXnzeXAeIXYZ05wGiomqIuHWxIZkLykSRhR11Y2evXjCuT5XES3erwSJQvvdEHS
         dzah6mmVKOSIdmfDd2HX45e26lx19AWg74qWGPndw2l9MJhOvWyBiGkVCwxkAzqMHR9x
         PMqegPvupuZrpe1OSdFrk4niWj2DI4T8qDN8dcSfGMVrOCJA5gCkat+a8Z1o5MO+ZV7C
         NU4w==
X-Forwarded-Encrypted: i=1; AKwUvBzZzrJYQnqJ/ZXllM0YCov33A0qganpJFB4Igl9yeyWBpEfD2xXHOqcMVWqtf14D25lDeN5alyzWZYgFFI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WoUlN3L1OoG0z6GiqnwKOzTkzdjDQiJF1xrq7x6hfLuiXO2y2
	OBUZNLz3J9nI3htyqE59pkV3feH7zdOKqkYLdp69pSe8dCeh9z+uld7f
X-Gm-Gg: AYBFou2YSptctlK8HIDoYQDglsnXCd2+5g0RzKvbkwW5rcofeD1NxuamEwv15gJfjqJ
	JwwJq9OGvodYt78UDfYUh85rvDlxM73kMC+v3GpbYgXW5U/F5mECsWNd6YkGvOOW9z3MMIU5Do8
	A/hPG6KGWpUa2mBPU2Ffta9j0X/RvaayCDA8VcXns7adhvbiRq+nxJtSvIB/Po7S3ZpR/eKPKSV
	us9qpLHgTQwC4UYpz5sZz1g9Of0cB7AtAUWMOad98dO8VAdbhq2YdVjJ7O0ZBUa20qReztuECSS
	K7kVFk3DmW5EBMrmIZp5NhfkMk6iwKsEqhkXbsAQDJyp1DQAjYwnN9qK3QzKA+n8Q3oAfdyM+HB
	X0lFi/ow//491Mk6FC/gsY1Zx+ltEWkjuaUXuDtxwz1mSY5Z45IIWj0DTVUxq37EbkMcAuVW562
	IhOqTRqHTuM7gndhZ4Y6GUEaVqw2Ndn73TiSWA0t8SVTkZZS5h1zGFMQzb2zrh0huYKDo/kjr32
	7LJMEZG4nNvDsMEYupjbCZ6aoI13UgFJJ3MUPJ+YIyLU3yvP9OceKjxwkn+yszxJCtMajOxiHd/
	EBcvFpowrrJBPENXcZu2a8KHLmrzfMxZrL2jSgCCFrnW16am3VXkSpT5jURTsrViBqg3pbnkIj6
	rv4yLrEUpmz1Latcx8ZsTfK2lxQ==
X-Received: by 2002:a05:600c:3b2a:b0:4a4:3a2d:15da with SMTP id 5b1f17b1804b1-4ac1709a2c3mr391986775e9.15.1793873007590;
        Thu, 05 Nov 2026 02:03:27 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43342773esm53455775e9.4.2026.11.05.02.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:03:26 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
Date: Thu,  5 Nov 2026 10:03:17 +0000
Message-ID: <20261105100322.37816-3-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105100322.37816-1-tanure@linux.com>
References: <20261105100322.37816-1-tanure@linux.com>
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

The T7 has the same ethernet glue as the G12A but needs two clocks of
its own. The controller reaches memory through a pipeline stage with
its own gate; nothing else claims it, so it is switched off as unused
and transfers never finish. The glue registers sit in a block clocked
together with the MDIO multiplexer, which probes after the controller
has programmed them: the writes are lost and the port keeps the
bootloader's delays.

So the T7 gets its own clock list, without the timing adjustment clock
it never uses. Its delays follow ethernet-controller.yaml: the PHY adds
the 2ns, and only the receive delay line offers fine tuning, so only
rx-internal-delay-ps is valid here.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index e769c9bb70d8..ff5e50f65114 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -23,6 +23,7 @@ select:
           - amlogic,meson-gxbb-dwmac
           - amlogic,meson-axg-dwmac
           - amlogic,meson-g12a-dwmac
+          - amlogic,t7-dwmac
   required:
     - compatible
 
@@ -84,6 +85,49 @@ allOf:
         rx-internal-delay-ps:
           default: 0
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: amlogic,t7-dwmac
+    then:
+      properties:
+        clocks:
+          items:
+            - description: GMAC main clock
+            - description: First parent clock of the internal mux
+            - description: Second parent clock of the internal mux
+            - description:
+                clock of the pipeline stage inserted in the bus path between
+                the controller and the DRAM. Without it, the controller cannot
+                complete DMA transfers.
+            - description:
+                clock of the register block holding PRG_ETH0 and PRG_ETH1.
+                Without it, the block reads as zero and ignores writes.
+
+        clock-names:
+          items:
+            - const: stmmaceth
+            - const: clkin0
+            - const: clkin1
+            - const: pipeline
+            - const: pclk
+
+        # The PHY adds the 2ns RGMII delays, see ethernet-controller.yaml.
+        # The RX delay line of this glue is fine tuning in 200ps steps,
+        # added on top of what phy-mode describes. The TX side has no fine
+        # tuning: its only step is a quarter of the clock period, the full
+        # 2ns at 1Gbit/s, so the TX property is not accepted.
+        rx-internal-delay-ps:
+          default: 0
+
+        tx-internal-delay-ps: false
+
+        # Deprecated: new SoCs use the standard *-internal-delay-ps
+        # properties instead.
+        amlogic,tx-delay-ns: false
+        amlogic,rx-delay-ns: false
+
   - if:
       properties:
         compatible:
@@ -106,6 +150,7 @@ allOf:
           contains:
             enum:
               - amlogic,meson-g12a-dwmac
+              - amlogic,t7-dwmac
     then:
       properties:
         rx-internal-delay-ps:
@@ -142,6 +187,10 @@ properties:
       - items:
           - const: amlogic,meson6-dwmac
           - const: snps,dwmac
+      - items:
+          - const: amlogic,t7-dwmac
+          - const: snps,dwmac-5.10a
+          - const: snps,dwmac
 
   reg:
     items:
-- 
2.56.0

