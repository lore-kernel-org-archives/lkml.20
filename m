Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B7D40F75C
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791629948; cv=none; b=o/0GmpCXRDFt+DmMUeLU7wE/FZu2nt8Lae2/holuyj4kPjDO0lvHnoDRB6C6W6eTP50Et01jhVhsOuUC/b/gsSflOjL2r2dYKo++sV2ylOfGk98tl4W2mia6Awvk7vAjnKYmamHPN1rVH37CbUq8+EJhLAwMh0CCJkG2D+Cr6ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791629948; c=relaxed/simple;
	bh=5hwn9dmZm2lL4gEzMv7nMKFRmoByFyt7ooc5m5FQqRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sLH1yuzaIJv/28pukFI2OVdc1tVX3kqmGKkwwKwT/M2MYBo+SQTExMTVrEuvsIvQXPaQJGORuiixnQBkY5CcebmyVQ7Bi3HuQamEmgWVBufbx2PgmwwzTfBl+MeGkk3JbF1IUa058vObIeVtvlRsd8ORT2P6hwhVaP5yULY11K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so3196115e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629945; x=1792234745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9iDEeSRYepWdUPmgZSkaxaPn0y4xYgwY4k/M0MT4wvc=;
        b=tytBmIUHU73f/bLhjPw6hIK15rPYGk1tHR2rapFI1vliXTqIrqntZlrAarG+rQpnPE
         9OzDwht0vdD8rXQvhG5gkXkJGg2viQm/KeNO/+mAwgqcrmFvwjG8Quck9gfTAemsrAq1
         JErkcWoaDoyuQGP1IoGbR83CvKb4WB5VJbgX3axJT9yM4esSHYqOzkuSc1yX6yF8JdnZ
         rAG5ulD5o7P5unHXWhAIDaa9eW3au3I0VPOFG8A1limPGLNsEClm1YmMEa7xXz/yxGzj
         ayHvMdkQJfI2m6KBn7jbkFwuF5J8Opksze9HI1ceztWBOya+C6yaXwCSJPE3wmMNjsoj
         eKDA==
X-Forwarded-Encrypted: i=1; AKwUvByORQww5GHzIcMb3NXsUSJ1pCHpU2fliwQXNjdrjSr+DndVhhBwPg8osfm/McE2PLRmiQ62H7+A96R7h5k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIH7YO+7RUpR70aSZZODaTJZb81WRubxFVbmWEdauzBIOzN+JCA
	KLk3h9aUU1t3BuLhWEyhs52S+ShVtkOe/lfEPA0X8ttblKQj9pa46vOs
X-Gm-Gg: AYBFou11z7lbPcs21vWRVeV5Yz+OOLWgOREBcM9Y4LTt9LdzGYtJ/FPpZgLVSn143kW
	QhZX/G7LurkweCwVyGsSektOt5p2MzulIF9Bm4CBm4RtqqJV3QN45iJ40Vn+mQiveSYYhbB8zog
	MtaHl51DWuut5Lb1G0gojqB/iMyjfIzTp50VctfJs4awtRj3KgI6U5RqChO6KELymXA2VJZ14Oq
	558SVxxtmGs6LD0tDQvY/zIHwpaufTYr6iGEU8cMBqJ5B4Bu0P28KqTE+ePVhwWx1fheEJxyafG
	Z2makAA2r3GrFQ80NYS/yGIRuz9+QphPA7ihHPtZY+Uuos5Z25d3jH6j/ZFQDEYyB1pEPuou5CV
	/ffiby51QHeyNnEchEtNw9wGR+pwRUAl4ghcERHOWNd8U4vJZydubakY1euPEz0Uw9vkKd6CssA
	QEeC693JpKiGVPtK1wdrVh1Yoz2jSTcyToxzfBQAmgaUApsm/15M10SFrrrWTXAh1SBFiZArZCC
	Y7UBjLT9IL4jNJOf5DpXW1ec6Pd08dx+1t+qzgVRS7LCQk=
X-Received: by 2002:a05:600c:3e14:b0:49e:6c11:c4fc with SMTP id 5b1f17b1804b1-4a18e49316dmr71091115e9.7.1791629944857;
        Sat, 10 Oct 2026 03:59:04 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae17e9sm8709526f8f.57.2026.10.10.03.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:59:03 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
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
Subject: [PATCH v3 1/8] dt-bindings: net: amlogic,meson-dwmac: list the compatible combinations
Date: Sat, 10 Oct 2026 11:58:53 +0100
Message-ID: <20261010105900.247342-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010105900.247342-1-tanure@linux.com>
References: <20261010105900.247342-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The compatible property only checks that the first entry is an Amlogic
name and that "snps,dwmac" or "snps,dwmac-3.70a" appears somewhere in
the list. It cannot express which fallbacks each SoC takes, so a SoC
built on a different Synopsys core cannot be added without loosening
the check for every other one.

List the combinations the device trees actually use: Meson6 and
Meson8m2 fall back to "snps,dwmac" alone, the others also name the
3.70a core. The example used a two-entry form no device tree has, so
give it the Meson GXBB combination.

Assisted-by: LLM
Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 5c91716d1f21..90ef79161ab1 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -129,20 +129,20 @@ allOf:
 
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
+              - amlogic,meson-gxbb-dwmac
+              - amlogic,meson-axg-dwmac
+              - amlogic,meson-g12a-dwmac
+          - const: snps,dwmac-3.70a
+          - const: snps,dwmac
+      - items:
+          - enum:
+              - amlogic,meson6-dwmac
+              - amlogic,meson8m2-dwmac
+          - const: snps,dwmac
 
   reg:
     items:
@@ -172,7 +172,7 @@ unevaluatedProperties: false
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

