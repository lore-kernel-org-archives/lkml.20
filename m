Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5077A4A7CB9
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789581714; cv=none; b=UA51CI2TF0p3OzyzEw10bgL8UtBCpV3wGTY1ECsWhdDCsrDTBDkpmpfN065Rla+Zdof/XeLUEeRVf1oArt4w9uPJBQ4zm7NYQISqV5s2uzFiTYjK1YGYA6R530VK5nyt0aaJQ4gaRWHg6jAQ3dqW39+R4BRgCHQCy8+s5Jbp0WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789581714; c=relaxed/simple;
	bh=FvXp/TdGwtWrHVCk18WSssgM7XRcJZQ54RrQTn3GOvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=szohDAnSaaHtbObbfpWjrisefafhiaQNgKmghax6OQiwFiRwni5CrNdhLT1vbgqkS1PqU//zaQ6W1nIvPNmceB6ac6J9b1MhglOBecEXcjVk4Nlz8K4zosLnQ1EMwjUfZ3Qjb5Auerh0RdJM5cg+Yw4Lg9sZ3X54KGhUQsgN/aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QlGzSugZ; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QlGzSugZ"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39dec5de01eso218161a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789581688; x=1790186488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ruVPTz3hTy5PAMDzs0VSzntCrCNW8xKkYo6sPASahL0=;
        b=QlGzSugZtFYgwiwgeVxyTCxXFvrcP70ofdleg0jvaVtMW4EVTXIamGB4ggwQwqy8xA
         MhNh9ig6IBURkNd5Di4HywX06FpAQpdK+waW5zQrVS9fIziRW9cBhQ2fLW/cAcyEaea6
         Dqg3qIxth/uG/Bp79LZyz2uPZoCmQMna7Hef1gL6DpfJwbilFUcAQr3f3WvYNp9dDj8R
         jX+t3QsEu4swNmRXF9ofgxj8rbOh0rzAjLF5+O+0Gyq4HoC6gdAMM1qto6aJTeMc62Ad
         5NFPnLra58ybv4t9kauLstTpY54ZXkZgZw9HU67Nv2oiLAUahuDqt6vnXpqb49NexdHH
         ks6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789581688; x=1790186488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ruVPTz3hTy5PAMDzs0VSzntCrCNW8xKkYo6sPASahL0=;
        b=C8dmJx8+3H6HOptFdpLBVVxMgBP+jxcB9lVoE4/2jhTDvQZ1s+1QWmT5RkIiITO0hJ
         8+Zh9F1hgmEEH7AHHwhbm6A7se1jP2Jo0TLe63JQQTEn5UjnRVP5hxWW7hTwZbSQYaXI
         gPPaam5+0wfHg7Dqx2+JF9eGIx01MOEayQOq4J3Nug21UqMT13ltZW1oxcCw5znFvQkm
         qr3iWF85Jzi1ZhUYkvDN2iy3knIhTVYG04FhCNju7xWjZX4bsdZEoO9uOFCf7ZJTHqLJ
         Rz47Z1qH4Pgb4vYgW3CsFZ3voPbwcPtUDcBzzwHVHQsa/CSdnG2s+mC0Mg/+6ohiWAca
         iK6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzKse9yWkqZhQcU9WePCSUEk9qm6kEkxfYOh/mRop9B7vQs/joL3VQmLB+Xhuf0CbMoXSIOqCQyFI7e5Wc=@vger.kernel.org
X-Gm-Message-State: AFuF++kjQNF3J2nPSA+bDZRF3/TefhFXjS2BLoayHK1Yx6HyszUDm2RN
	cigudyoGiiIPzyGpHS/nW9CMoNDqWPOoAyAOuplhhjquI58974ZrEC4r
X-Gm-Gg: AYBFou1a7YSMYTkitGBmnm9SWgPPsqKUGXXIFEufeD7nMQkt2tewwRyh+83be5bMD/h
	tKt5HP6xIVoo/tKyRR9Ka3xC221p4MoWFjgRkLKSRfYhdmukxYjK7WJbj0z4P5SUGYtwjDEL1JV
	cmYxW0QbUwU+hQ0P0tP4jisOiwhpraAVv6IOTJZHOvy36eCexjaB6MULWd6e4Yw6Pp8ua/7tEHk
	o/tbzITxEjbZ6iceQYU922z1Z3NNugK4C2XXhKgK6amIaTv3XZoHOalDrTqARC8CDDowCD+XI0n
	dKa+EFifGkYTUWkF0APSKtJmgShQ7E0mtfeiEkpvh0AKEah/TicT+hY/9yYioSXvM/0rxSv/79R
	VmK4ODy6C2AiqzlpBMq5OjnMO7nEe9p7tdLV95NEbRFcaISlclAKJNUrk5UXaXBxq00Qsc/JgpS
	VeIidZBxhjBa+MM7xl3Ma+Jcl4jvw1B/DzPsW1XUtk4SMOwia7gP0OTrYnzz+2X75JJN5HuBKw7
	dHbdDXbGQ==
X-Received: by 2002:a17:90b:2250:b0:39d:e1f2:3400 with SMTP id 98e67ed59e1d1-39e1e5285d8mr5311132a91.5.1789581687601;
        Wed, 16 Sep 2026 11:01:27 -0700 (PDT)
Received: from marchy ([2402:1980:e96:7839:ee8e:77ff:fed4:d18b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35df479fsm569972a91.6.2026.09.16.11.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 11:01:25 -0700 (PDT)
From: Adam Azuddin <azuddinadam@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de
Cc: jesszhan0024@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	andersson@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adam Azuddin <azuddinadam@gmail.com>
Subject: [PATCH 1/2] dt-bindings: display: panel: Add RAiO RA8875 display controller
Date: Thu, 17 Sep 2026 01:59:41 +0800
Message-ID: <20260916175942.3186804-2-azuddinadam@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916175942.3186804-1-azuddinadam@gmail.com>
References: <20260916175942.3186804-1-azuddinadam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RA8875 is an SPI-connected TFT display controller by RAiO
Technology Inc. It supports display resolutions of up to 800x480.

Add YAML binding schema for the RA8875 controller, along with
the raio vendor prefix for RAiO Technology Inc.

Assisted-by: LLM
Signed-off-by: Adam Azuddin <azuddinadam@gmail.com>
---
 .../bindings/display/panel/raio,ra8875.yaml   | 66 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml b/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
new file mode 100644
index 000000000000..f6f4867495dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/raio,ra8875.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RAiO RA8875 Display Controller
+
+maintainers:
+  - Adam Azuddin <azuddinadam@gmail.com>
+
+description: |
+  This binding is for display panels using an RAiO RA8875 controller
+  connected via SPI.
+
+allOf:
+  - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: raio,ra8875
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency:
+    maximum: 25000000
+
+  display-timings:
+    $ref: /schemas/display/panel/display-timings.yaml#
+
+required:
+  - compatible
+  - reg
+  - display-timings
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ra8875: ra8875@0 {
+            compatible = "raio,ra8875";
+            reg = <0>;
+            spi-max-frequency = <16000000>;
+
+            display-timings {
+                native-mode = <&timing0>;
+                timing0: timing0 {
+                    clock-frequency = <25000000>;
+                    hactive = <800>;
+                    vactive = <480>;
+                    hfront-porch = <40>;
+                    hsync-len = <40>;
+                    hback-porch = <40>;
+                    vfront-porch = <10>;
+                    vsync-len = <10>;
+                    vback-porch = <20>;
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..99d5113fb035 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1395,6 +1395,8 @@ patternProperties:
     description: Radxa
   "^raidsonic,.*":
     description: RaidSonic Technology GmbH
+  "^raio,.*":
+    description: RAiO Technology Inc.
   "^ralink,.*":
     description: Mediatek/Ralink Technology Corp.
   "^ramtron,.*":
-- 
2.55.0

