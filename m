Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8165C446C0B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791361594; cv=none; b=IOUo+K4GKL/BnnGSWkAoiR4L0UhxBZHgpPsXQhZVjvpGllwYTLrWP9DrnwMYowhL4qHmiDsCfa2/GFgwZnufjYn4euLemW7b5IYxv/L8r9nFtfugcEH6e9RqnSqjo3llsumBu1I+8kDcWG0lI1Byxf2RqFpwmSretSwdUp3zvTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791361594; c=relaxed/simple;
	bh=5hwn9dmZm2lL4gEzMv7nMKFRmoByFyt7ooc5m5FQqRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pI0rqiW1ZJ6p5UlhFlW3Pb3GP3Iu+IelFS5HclLkQtqVaQGRHJxKnqlqJrNNN5DxJmdcWLGwcONAPopyhUrms+oy7Dtiy21vFH21VXY+94LKyA2jvGjROdc+Hb/yYuyVL9/yohO42WIaK9TeG4Grm8fVU35q83ST9yzuxaAgAjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c4207ac26so1094678f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791361591; x=1791966391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9iDEeSRYepWdUPmgZSkaxaPn0y4xYgwY4k/M0MT4wvc=;
        b=hXPtgQylbm2kcwIka0ma/5JBnXYogvLpwL5PA/q5NcycH/ewh0TzPWT/vs2oI0wg68
         uf4KqoE1z4SGOHYXYARE7sEP7I7s+XjhDc7u5UsLDASt5PDknUh88oB9LyJi974cEvX7
         noz4jT+xfiJrtBLyJXb7Lybc9Egopil0RaS3ntQ+LeliAPbwV2lKYT8DKICLRwYaEOhI
         +EEMWWONkBLsbQUY3uMwer+M8prhQRPuFme/CslDCP0fYnxYUxRmP1rJfTI2bipFlRwV
         vrRunF2QTfDKyQ+2mkd/bG01QQ9YfamQjOmTAp+9qtC3KmAhbnIjm6tRyL7BHplaKJZ0
         aeGA==
X-Forwarded-Encrypted: i=1; AKwUvByjmuV1MiTv7zJXjCF72Wa6QxiR6GFZfc7+MBOpQmxHHgdY/u5Peksy2WOba4QmNm7Ye2OwUqmWS0gTH6A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJefZdU35Z//wHOQcjF+UEizsmeGejKrqh7i9hyzuVZoOwgGMAR
	N2L3qUOghCrqAq0P8yGBxuPHVoxGuLH8sUvW1hQ7Jhpn4gkvn0eegbWD
X-Gm-Gg: AYBFou0c/NFLuDviRDj3KwWaRgZBhItGPz1pXNU49+zn9k+GRDW8ERm0iHkRBV1Z7VC
	hbl50Okg85cjgSVDTE0rpohLE92n6fPghynr/RO/YMRj0Ufge0tRTwxgwrJ5nZBpl6f8ApGtoJw
	pHU+e0OW1Ip43I/Umkg8bqHEk3dMmZQjAH5IDomOa+WqeNPHRuGnIuqSpLFmMN9qqvpYhltHpBN
	BGlE5nrP+R3Ftu9rdgA/zSQFmIhnutUplTpRMtTZakZzvIiqn2CpI7kBtUmzsF8FiznzAXQwL6F
	ZhcUODihhyhfQNG89qopqmi0yzKTkMyEjFRGOFoghH74SSAR1w8NMo2TLrOyuZsBZf1ReAHMxsh
	/xuU5IruJaIsVTTJlPHdxeQAxamY29mvvZg2F1CtJHZC3AZUCZe1TXDYmC5TYh2nMMrCQ1PE94V
	wqBdB35RBhgksgsQsDu/FmIyOZYqGzXRARCQn59T7+m5o7sLQX4sHwMz2f6+Ui5Q24tn3IzCQqp
	R0A8tm/+o2s6pgLvpp0WZ/Q9cxk1RQ7+OA=
X-Received: by 2002:a05:6000:2dc9:b0:48b:123e:2f5c with SMTP id ffacd0b85a97d-48c7278ef3fmr3047018f8f.29.1791361590762;
        Wed, 07 Oct 2026 01:26:30 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3b502sm4251370f8f.52.2026.10.07.01.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:26:30 -0700 (PDT)
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
Subject: [RFC PATCH v2 2/7] dt-bindings: net: amlogic,meson-dwmac: list the compatible combinations
Date: Wed,  7 Oct 2026 09:26:22 +0100
Message-ID: <20261007082627.63807-3-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007082627.63807-1-tanure@linux.com>
References: <20261007082627.63807-1-tanure@linux.com>
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

