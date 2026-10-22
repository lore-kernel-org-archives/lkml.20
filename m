Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675405;
	b=161EgYDcfmLDYJnfRW4MGbsEoEoxSi4RDY3an6jDFhmYJH4Cn/5uXq6tOP9Z0XTDDm5e
	 A5eo3E6cUeQg/lGMgSQmr2TMTr95Djq7i3QczQjkCkuTRjEjw9d8MQnwGVqlyOOszrAtc
	 5l5kiDTiBUexBmxRzZax8h04Nw2k/dVL1uvSX8AHUTwMvyBj3bAcvqF/CV8xboakZ86e+
	 xQaiNnoz2PYKpgIJc3nsa7neMN3Jsg+m4t66Utl8u10HAiEEJKezGlKpNE5RdhRITAb/b
	 fpGRYdN+0tCDpEdtXgjmc16yPQfCXVi0UyEVizYGz6NYw6P3Q2Hk7DYp7LNYe5N6ziQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6CPvjoYy7BE0WZR1WCFgrzG3A2OCzgKkq+RlO5AEapY=;
	b=01sglJUSu+ThCqG/X7DAIC9JJoVytJuIH0Ct3aNrJwRYhWWdlpR3p689OzB0NL+LLeJN
	 xKzGSHoW+fZnCDakFMk3LnEFwjr22WJweuHgqSCtfbqMFvcSIuWtkzoeHo45zQsjsRqpe
	 nEtN1cTro9geuSN73LDE+tZkCXdvWBzxio4PRYiPSivqQ3vWLnhw9PFggddHaJKxgPCmJ
	 JfV2GdfkD/M00uqtC7xZV85YkvMuh/MqV/OdLOeIN7qHgfldbUMzWPYKHU5L9gcRkvypp
	 ipgc/+B7Y+au+LnifdAlxvOtFh5wFMVzMXAADZc53mA+1c6XOxTbDX86rXzmqakaQjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kxLes4fr;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD21D606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD21D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kxLes4fr
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso2870813a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792675403; x=1793280203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6CPvjoYy7BE0WZR1WCFgrzG3A2OCzgKkq+RlO5AEapY=;
        b=kxLes4frZA1nQUMNbxWsOc+4K9YOsscYvhw/zBnNiif8C4/07HpOicqM1EkFxHZbDo
         Ec1WzxXUW3AYSCI0F6PBluvl9H3csMYIsUnKmyVNY6ySbg8rTyGBu4YdI1Hib281iVHI
         a3Pvl+ceQHY+aXp1KO0Aa45CChYSFkCWaCiMBrZ+AbfBizzIHp3pbn0BU32WtWL/M8Wh
         +CzKM7tbPeQfx1e3hHGFf8RyUavvmHrSZBK3YWFqz/m2lIL5neZwW6OL0fWQw0xcnSIT
         6Euv29SXRXq9SbqJuM+azuCSe4D9Q0PGkQGFQJJsCDFAarcf2yQ7MjIJ+0ImlC85kk2N
         ij3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675403; x=1793280203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6CPvjoYy7BE0WZR1WCFgrzG3A2OCzgKkq+RlO5AEapY=;
        b=VOyRITNy0AhwcPXICTd5j07/V3negOPn1ZuzFBnoQhiK0fqZIowkqw9O4SPgAuUUjy
         Dys+J3lKbSAOg5YXcOdQDUMhFxPR/wp/oJ553B66f5dENRoMOgHU2dyMUuDGNu10mQGo
         76JukfdNBuqc9JJGbo8QL7K2txIlK7xnV26cTpfLYZ51CVMDi0F29kqhHMlEKqInDm0F
         Kpe3GXnSNPVddAZCnGs6I2Wnqk9Kn8yMBQbbEpwdJwWMKW3dZ1tzuSVpWJByNyvg97p1
         VCTy+upWmz0Occk/jLCIq29/TAYvfp9n9XFY/CfelbrresvkZ0n7H2+Wa1eKGbMdkItI
         i42Q==
X-Forwarded-Encrypted: i=1; AKwUvBxe45Sxzni5AOqFP9pdORmuilg5TJhfnfZLkqim3iduyzKg1p+jMftBlENxUHTMezj6DPNi7TFWaVYyjcw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLquWX2nFRQWyPK7GD1QTi/SzXUzptWZ8h2iJ7TMWtLLV5L08XS
	MzRUifNOKUAQMNhMI76mGxvkfZ9E4NXTJs8sxcc9TS+B52MFBMWuiBbz
X-Gm-Gg: AYBFou1fv1DlnDeI9JWk5OyOVv6B4/QCy2LQo+ESyksO3fs+zAhUygpQaNnlmwKPC3K
	B6IGi0fTmvcLfZJsideG5Sp7FLjjtCMj4Th8embideJZAwTdMzQ3pE1jUgb4/3hXT+oWVLxDmqm
	/xaTRM+qWApLagBvF+VuM+Cng05IqgndeJiWRiB8F0QRjo82g4LDdSgjls74kRF+NsSjZlgJwkk
	oLO9SueO+nnSC1JDWdiPQ3y1s0/dwVtdLcvZA5jgOqY9eRmtAPYXLg+UGAA8nae6YkpLXnT7e2l
	TlbPYVSkvaD7jP2y6Vwg+kkEWxODWvLEcAa1l7KXdSh3uFWcK4d+VW7MbRKtMw3G15dKwWWzJxD
	8K4Sujyk1nDiRuW9C9B/nmk493cT5rXDfl92eQyMht/cFQcN37toVKq4zZlRQPRxwV/TnUf4TpN
	EGj+bgUPqRghn4O4lQlPijeim4TkkZiqmPFGF7Klmb/E4h63LcLyMc0C3j1KyljLI+yoTGWAdEc
	Gi47hA4LtAAot+Gq4RU/zMnDyHPiqXREKq9BCri0CQXpxX+YtYAmg7rMvZWuDK8RuuZE09mnmAL
X-Received: by 2002:a05:6402:1951:b0:6ac:afa3:6f72 with SMTP id 4fb4d7f45d1cf-6b408dc32d5mr5323394a12.5.1792675402834;
        Thu, 22 Oct 2026 06:23:22 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40313074esm1818061a12.27.2026.10.22.06.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:23:22 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
Subject: [PATCH v4 1/7] dt-bindings: display: panel: Document Hitachi TX10D07VM0BAA and LG LH400WV3 panels
Date: Thu, 22 Oct 2026 16:22:53 +0300
Message-ID: <20261022132259.240717-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022132259.240717-1-clamor95@gmail.com>
References: <20261022132259.240717-1-clamor95@gmail.com>
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

Document Hitachi TX10D07VM0BAA and LG LH400WV3 MIPI DBI 4" WVGA panels
found in LG Optimus 2X P990.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/panel/hit,tx10d07vm0baa.yaml      | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml b/Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml
new file mode 100644
index 0000000000000..4642dc14c42eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/hit,tx10d07vm0baa.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hitachi/LG 4" WVGA TFT LCD panel
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - hit,tx10d07vm0baa
+          - lg,lh400wv3-sd04
+
+  avci-supply:
+    description: Panel power supply
+
+  iovcc-supply:
+    description: I/O voltage supply
+
+  reset-gpios: true
+
+  backlight: true
+  port: true
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    panel {
+        compatible = "lg,lh400wv3-sd04";
+
+        reset-gpios = <&gpio 175 GPIO_ACTIVE_LOW>;
+
+        avci-supply = <&vcc_2v8_lcd>;
+        iovcc-supply = <&iovcc_1v8_lcd>;
+
+        backlight = <&backlight>;
+
+        port {
+            endpoint {
+                remote-endpoint = <&dbi_out>;
+            };
+        };
+    };
+...
-- 
2.53.0

