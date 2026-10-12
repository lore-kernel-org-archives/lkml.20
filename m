Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F3643CEF7
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787537; cv=none; b=jDJYgzuTCnLP20zY2FK5Shl//Azgz+/mXsgOMcE7sINMlOv4BveAz8H10LJEDH9x9IqsGqPg04m/XcmyDdSe3ceGue3VS7sXYVi3D8+09K38VSZ2x4dgHgWvqZ/1jILbOfN/kFgB5mYHtxkZychB/mUkJUPiq5ecCr6FlUH5x6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787537; c=relaxed/simple;
	bh=PmvQc68Z/dISRF+he/+mFZ4P8H3prDncQ8jHX64rQJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q/HuEETyNB75U2EoWC2mqYFdnXsSyPViDYpMjCwHGInSz1JHaPcuy53BTwPyFyvZSi8xPO6vra2w96/PBml9AG41KdkwmbYUpUwuZH9zbPjC8kmzsps5RYBiLBx5GajZaIMF+augUTAUGpMArKu6cpSEaAeCh6oIWfYUrsrV/LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbQ+afdV; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbQ+afdV"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3a47d4fb7feso85848a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791787533; x=1792392333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kUR3aroC7QKMpKgOnRgDOdhqgqz4M+XtodQ65N8R+f4=;
        b=dbQ+afdVRZLblrhpPv81kRnOAh7sfRtXEb0kJrD2/GMDimwXbUpZTao67RrSK/cO/K
         4WBiBqOEpwz5STqGBk9ctRX9hU7F079HRsEovSIP6tiSYilwXtWtyskVlWRobcToO8wi
         OWnflcERf3Rx8/CE/GYXsw3ck4w9T202Bq9F8gvWzQlZ87Dgj28U6BGaV52EFIEzeqLR
         +kL6ryBsIvDT9imQGd5oWG/qA0NHeAxQk0r/kjgXiETh52gHhZ5LuzKkxJN3YyqauqXZ
         Tp2ImoX10cgb1Nv7oRlYPd6ov8HW63HP+2nLbFNYp6WA3UwR4fgIMAdggMGmpCCR+A7U
         l4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787533; x=1792392333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kUR3aroC7QKMpKgOnRgDOdhqgqz4M+XtodQ65N8R+f4=;
        b=yuMMMUU2HxFpPtocHv3K61RpIAGj1FLHmss+01Pmo3NpKeRyK60cf3g3i8vjP1n1uv
         nIB5TL4cZJktRcEOJHUo1DKiBaJZ0Ke6q2qXDDvxjLX4C1Io3mW81I2mv4BlEbSI4sJK
         SAIeoGDit6scjpAS/Im6bRh72/XuDGLKk79xSF10OP8Kz3q5EIw4K2xs0HApD69t8seb
         Uj/DFsME47PFLTUUfNBx7J9FSaUPwGphwCKIW546e1AwswD2B2w+OPD0c5Uf7HymTUTB
         JY4RkAjrsAgnS1MGRzR5rqHA6qdKq+qyscUw23uPtic/O+lvW4SB67BPDkMiKxhHTkKx
         F8TQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDr/RE50Ij+YiJJ4RqafazJj6UapUIJ6Ao6REoFeqYRONkpZrYa7llLeKA8z48e1/G1RHLvNg1WD2lcTg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWOf71s2kF2RPRs8bLQ81ZDZy6RcPwHGyD3MJIkve8wXES0JJP
	u0P5hIknRSbYPVQvu2vbWC2Tv4BMWG3LwNQmVtviePGf3QOfkQARcmjU
X-Gm-Gg: AYBFou0A6DpgzG94VnD5B12ojYHRkKXtFadG61OODDxns8pcXdTSIWzw6GbQ5C2sukS
	XwUzZzq1Z9mpfiiUif15OkPCG6GALhL3ag68aexLhnMzvclAUTUMgnkTZnt2JlSavPl+M5eZjHv
	m9DUYhLHQvY4J0qg7R9NhbzL8Mg8ecjO0fvJ0PFP1Us8bzhQkr6ZGbugFNlQul3xpCFJ77voNKh
	CgTg5ChPQMs+WXFRqakLb/VpfUCndkwKYRu1Usnq2JUhV9rs2Cok7hdfk+z80udySlprYeBLfho
	Uq0qgIP53FaEyMhKB27pmLdW02Z3Xvp9H0aodspAZ9IvPG8rZrjmmxvAPdftqvQHYVVz13SZi5s
	ENhJx8Zyg2usiw2PhIdsZqJDWRIeNsX9t68aSrsJ5zvXKEE3+VvfShqWF/oZDTx6L20ql87DCPd
	cSuWUTSlbwncvl+H1OIOiCziP0wWP2xuREGz9R6YkpudNniOrcRRN7laefnS7TllgWDompkS1hG
	E3JnO8=
X-Received: by 2002:a17:90a:d49:b0:3ab:be66:ddc5 with SMTP id 98e67ed59e1d1-3abbe66df3bmr3052672a91.6.1791787533505;
        Sun, 11 Oct 2026 23:45:33 -0700 (PDT)
Received: from marchy ([2405:3800:8a8:86f0:ee8e:77ff:fed4:d18b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd5fe84dc3dsm870713a12.13.2026.10.11.23.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:45:33 -0700 (PDT)
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
	azuddinadam@gmail.com
Subject: [PATCH v4 1/2] dt-bindings: display: panel: Add RAiO RA8875 display controller
Date: Mon, 12 Oct 2026 14:45:04 +0800
Message-ID: <20261012064518.3497285-2-azuddinadam@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012064518.3497285-1-azuddinadam@gmail.com>
References: <20261012064518.3497285-1-azuddinadam@gmail.com>
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
 .../bindings/display/panel/raio,ra8875.yaml   | 77 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml b/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
new file mode 100644
index 000000000000..86777e2cec57
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
@@ -0,0 +1,77 @@
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
+description:
+  The RA8875 is a TFT LCD controller for panels up to 800x480 pixels.
+  It can be connected to the controller via 8080/6800 parallel interface,
+  SPI or I2C.
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
+  vdd-supply:
+    description:
+      3.3 V supply for the IO pins, the oscillator IO pins, the ADC pins
+      and the internal LDO. The 1.8 V core rail is generated internally.
+
+  reset-gpios:
+    description:
+      GPIO connected to the active-low RST# pin. Optional, since the board
+      may instead use an RC reset circuit.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - display-timings
+  - vdd-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@0 {
+            compatible = "raio,ra8875";
+            reg = <0>;
+            spi-max-frequency = <16000000>;
+            vdd-supply = <&vcc_3v3>;
+            reset-gpios = <&gpio 25 GPIO_ACTIVE_LOW>;
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

