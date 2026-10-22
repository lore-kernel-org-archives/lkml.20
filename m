Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792699609;
	b=Wj5hQsKjhcGdVQPYitmOAtZZ/DuaISEM4IMKGgqANANmhMo/W3eTyg8P1lQGI0jwUv9A
	 FtThNxUtmp+rI1swhgptfdSq8BIH+S4TkZ5NHPBPHtx7dLz95RjqP5WMRBSqsRptE9pbS
	 Ll38OQ8l6MspmPVh+ey71WdWuJVYb+JE6F05RAoofk8mn3ClwKVjBu4zdvDgSolHpVmxZ
	 tDx04rV79n7e/imh+rFJq9grwg0jqcHIeRQJMRy065EGQh9BO36M62bp8JfTzkFhUM2+r
	 QRbbdCXfQc+XfRvhbJcSpYzjgTX/k4sDj8tnB+hhgrZtd/9bK4zqgSPkbws6q2UjS+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699609;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QqXWTwTTRqCzzF0bQdyuAykpcOnACxEXXIFplcbdvJY=;
	b=IAxYSJ414fIyDSUE+NWEkGjTltwA6dEEeUpIQQ3JjoDTDr5enjHQ8371GKFUC/D4lc9H
	 PxaZgSPxTSysZDjr0uRSUDGYUTDCJ3mVSJh8YQNuyyauEfMWoPt6ofV/zSGx4zG6Od70c
	 As41swCatrKBkd6kF8jhDE96n3aEzRDbPaQYX8mnTNQWqc0qSZjsVMLT843dd0CAlUgqK
	 zPDEPJctdh9yRbj+EYyQ5ut6rXMn+ypOYUmjdDjRDYW9z8bUROepTkn6JMNQ8PYU38jky
	 bqRdjgbTUW2NTc5u9DHDVI+6dcf+OvwWxnoaVGV5qjYG0o2RNF48suVMc6IrxRETwkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D7A606A322
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6D7A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso1932065e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:06:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699607; x=1793304407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QqXWTwTTRqCzzF0bQdyuAykpcOnACxEXXIFplcbdvJY=;
        b=vhUIb6NOHwI08l9euttExiVBtrNU1nSXB9uRlY075WeVgHDF3Kruex4BJyJMH6vcOH
         PC+Tq/yNiGrgiKKkfFHewHgfltssEjgZVRMGLhkK7tytWYIG/IhC7MqwlC+CrbBeUMIe
         GXlm+o11FWkh37gwbqmtSLbswMj5LuzIMK/BOM+0dp9gB6gerbewQwG7d2l5yPNs0/NA
         EIWbEp3FuyNuQqvRVZemCbERrXRzPxiHM1jLVa/5E9YyBkhJM6/hpbSyZCqtn5uU0X7o
         PdpH5EMNyPenh4UeOTmHbWM3vSYIX5JFRGD7VGAi+GNTL2GImkknR239WJS/EWh0KmcD
         66Kw==
X-Forwarded-Encrypted: i=1; AKwUvBzKg0SFlxipPWc+i3XBnJeU3OljF9x8/nTVSlxd4kG0aACDH2euXjZymcsMYRpSmxRa+nLz26ydwYY4FZ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiNxLyrqt0fnZiUKLRnRjkjqAi+hDKFTH6fV0FxVZWeoLXKfKP
	o9dxzx02vO97BTYoi0PXr86QN1FiSgER3Olk/PoxUOhnfCPMFaMJVudy
X-Gm-Gg: AYBFou1KS/oXfCGFZHZ/DBZ+sRJlFCGLOf/jYAhpcVWX9PLQGO4WGHYeWRXFm93fBnX
	wiMSZZkRC2xO5ivdFKm4Jg92ayoJG0VxU1BphytQd+5H0Kh0k31eR7yZxXeSrtHKwOjofZy1xB7
	4h/tjN+pPIjUEKEFL2L8/m5KtEeI7yb9bQ8c4Up/4WqPKtbIHcTD1rW9Ov0IMYy8BYnsH25/4m/
	23YErW5/2RcJuptpRz8mh5HL+4qtQKLFd2ABH8RDzwk2aCNN0A6nIWZLGZC18OQ5y84LI1UyP8P
	sRuTBLk1CKu4IXhQuPJUZeHErpQgcIQtlkCHlUL0UbSPY1PexKiCc51JfrPcV1f4QFTDB76ncAK
	7ePk7LM0/jY/wH6CNvYS5zFZWTQaigGDZ9nz1/6EFjvTO/SqHi8KszszVsgtumdMpd2a0CL4vn9
	Y6+/22FMnulEqJdntZAPod9NCF1pyqTsr2c5NuHk+UdXFGqIvogcLO26rPwZHBwMb25UI66H77z
	AkjGx0kA8/93qyI4WG0+TkRg+l5VQX7zg9lIH/8OS+sV5HNGfLikmbJ7nu6wEOQb303D3llYYCN
	oqUkRmNsG/+mONJi1UTaQr+/TFLIzfHSEFx9
X-Received: by 2002:a05:600c:5247:b0:4a0:263c:704f with SMTP id 5b1f17b1804b1-4a211caf3a5mr2595685e9.16.1792699607284;
        Thu, 22 Oct 2026 13:06:47 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2123a1797sm35965e9.1.2026.10.22.13.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:06:46 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/7] dt-bindings: net: amlogic,meson-dwmac: list the compatible combinations
Date: Thu, 22 Oct 2026 21:06:34 +0100
Message-ID: <20261022200640.3101932-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022200640.3101932-1-tanure@linux.com>
References: <20261022200640.3101932-1-tanure@linux.com>
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

The compatible property only checks that the first entry is an Amlogic
name and that "snps,dwmac" or "snps,dwmac-3.70a" appears somewhere in
the list. It cannot express which fallbacks each SoC takes, so a SoC
built on a different Synopsys core cannot be added without loosening
the check for every other one.

List the combinations the device trees use: Meson6 falls back to
"snps,dwmac" alone, the others also name the 3.70a core. The Meson8m2
reports a 3.70a core too, so it joins that list; its dtsi gets the
missing entry in a separate patch. The example used a two-entry form no
device tree has, so give it the Meson GXBB combination.

Assisted-by: LLM
Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 29 +++++++++----------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 5c91716d1f21..69244afc4ff8 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -129,20 +129,19 @@ allOf:
 
 properties:
   compatible:
-    additionalItems: true
-    maxItems: 3
-    items:
-      - enum:
-          - amlogic,meson6-dwmac
-          - amlogic,meson8b-dwmac
-          - amlogic,meson8m2-dwmac
-          - amlogic,meson-gxbb-dwmac
-          - amlogic,meson-axg-dwmac
-          - amlogic,meson-g12a-dwmac
-    contains:
-      enum:
-        - snps,dwmac-3.70a
-        - snps,dwmac
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,meson8b-dwmac
+              - amlogic,meson8m2-dwmac
+              - amlogic,meson-gxbb-dwmac
+              - amlogic,meson-axg-dwmac
+              - amlogic,meson-g12a-dwmac
+          - const: snps,dwmac-3.70a
+          - const: snps,dwmac
+      - items:
+          - const: amlogic,meson6-dwmac
+          - const: snps,dwmac
 
   reg:
     items:
@@ -172,7 +171,7 @@ unevaluatedProperties: false
 examples:
   - |
     ethmac: ethernet@c9410000 {
-        compatible = "amlogic,meson-gxbb-dwmac", "snps,dwmac";
+        compatible = "amlogic,meson-gxbb-dwmac", "snps,dwmac-3.70a", "snps,dwmac";
         reg = <0xc9410000 0x10000>, <0xc8834540 0x8>;
         interrupts = <8>;
         interrupt-names = "macirq";
-- 
2.56.0

