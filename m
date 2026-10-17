Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6E0364EB8
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 08:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792226201; cv=none; b=oOdXoC15nRNB/8cBAl20GXhtgA0mH+ALhdYcerUqtzIGy4l+yQr4e+OxPNI1OLfHPlusPMOgwlLtl6bW/SgXe2mIpVJJOX3ioRtwo2MtWcsX0MOKeMeQTh7N7anEOm+M7MW0H7FttYlnv6owEER78T1HlKOYjKghui2JkZH5g/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792226201; c=relaxed/simple;
	bh=PvDSXZucXaSQBYsgOB6O1YnNZF9tLIEju+7FEeS6PX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iXhVlsP+fF4DiJhVtW4YqMpZfSBe2iFRmjWokj1ZYZZLkVBvbeUmJptQ6xBtaTOna35EyotfRwu/FWK6OnR+fUC96mGS78QRe+Un6JOmLPgdqQoYfnJjbydW4hSJvHCAe1zO7tlItv+fChUT1YhZiSFf3n71/rezV+FomnuXLw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sqh021vg; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sqh021vg"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-3a0aa5e2b20so187395a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792226199; x=1792830999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v7htvYaNC/HedOMza/ALRWxx354TzmGzWUI+IoOlx4c=;
        b=Sqh021vgFA636fYg8JqMYMMurqv4db3QrtPjW9LpYi/T+/a0FWZAAEOS/5Ofatue6T
         KX9l57tel26Qdpp1uLJudr1WnpXhPhC1JS2OJbj2biQNXNNmsW/2ZQeihmHMjZqBfi4v
         KTBNNSo2xRbCt5fuPv9UdYNTuDdmjX1cJO53GP//4bm+UdS8uHBrMf6E+zu6uNqWlsil
         6vsdTCXwk9G5N2joOd1ZkIj5IME5Gx6P/rGijXcpcEk0Q0roLB7TnRlmr/KoT+ktCCvQ
         CV59st8+m2M0Oiz4Cg1u49qBkmm5k0oAzi0aEOXdiezANCHofHORO6mulj/eH9fKs28I
         CS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792226199; x=1792830999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v7htvYaNC/HedOMza/ALRWxx354TzmGzWUI+IoOlx4c=;
        b=vSRosS10oq0kI4nh8HNDlNHeEX2/J1pqWZ+DO9IC9wgIQckxbUfTf0rWsIUe2NVmuE
         JiXKvtO34RDpwrc45lltV5XHmuFqF4OoE2N+etNVXFhJsXwhPJDUdxIRaK7ZN7+/hz4H
         XQMCD9e6O6IyEERiLsW8hFjEeOmxV0+Oq2pFYm6HudgHFLm3mKIvRldYm2gVIb0wuPER
         2qYccAR6mZI0DlkWzrJ5K7UtzYzGsY2Eca5RODye+JiM5TAK9aGP+NAs1yrQn2QwWh+P
         cykL+EOmlFKgSWil2lscGP/MGWHZm7R5ksqAxdpfB1q5SGH2Oj0Ef7F5F5I5yCRmY4z0
         NU/A==
X-Forwarded-Encrypted: i=1; AKwUvBylBx7z8tQzxl8bLWg58V9bca9Ge2UtiHSMVQxvZfoKEXZMigG/HD7v2OC23O+xonxqXxj4b5svXCmAbdw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/6I6kg0VEqUCS/QBkaLNtudnhts2qsdRGOYu4/Wl90K16M+s8
	w5p44JKTZn5WYK63xkNojTHJV4sXfUbdyqvM4WmGFyh1R5GuF2IvFcEF
X-Gm-Gg: AYBFou2UjQJDZcakQ8nKETh8SpDmUFWnrv8+zyDx8mT+9VrVOnEXMGCOtk4Xe23IQRe
	tL3UsjJa89VEoUSQcwobWbJE3MntnFQ2Yis1ndiqLsMqckbmktto4+tEMhQKJ6zZC5INT3iPdz6
	GNplrk0CFafSh2yNne8/Gpkoix9iBP0oz8+hh6G14jncEZl+Vrc0SLWWQKjOexTeBINZM9z6b2q
	lBJlcwAPzeLrgQv0VFP6V5JnKYAozbnTPPZeEfh4zOsBdPUXUs2O79DNg7bxYnOw5tLoILvHWsE
	lO7L/olyiBcvHY6Mf7IxTJic5R/DEaYSxsjX+Oi6OaQQgciZnNvf6DK56zXkdnbUN5XEcb9iczg
	VV1mmI6vNibZZ291hJHaj/REmIdARJr1mqIopGQyxh74urMAUn/mwdh32ZxhX8ZTzub4we6dsqC
	AJRUKgmobFH3O2nPxYyVNuU/BJWN5mB097bT3pFIe5DY8Kq5wBC1+DkBE=
X-Received: by 2002:a17:90b:574b:b0:3ac:9717:afd1 with SMTP id 98e67ed59e1d1-3acef589989mr1825660a91.63.1792226199581;
        Sat, 17 Oct 2026 01:36:39 -0700 (PDT)
Received: from Linux-PC ([2a09:bac5:1f0f:3141::4e8:8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9461d71esm12548544a91.7.2026.10.17.01.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 01:36:38 -0700 (PDT)
From: tianshi12127 <tianshi12127@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Lu Chen <tianshi12127@gmail.com>
Subject: [PATCH 2/3] dt-bindings: display: panel: add Smartisan TD4362
Date: Sat, 17 Oct 2026 16:35:30 +0800
Message-ID: <20261017083531.766557-3-tianshi12127@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261017083531.766557-1-tianshi12127@gmail.com>
References: <20261017083531.766557-1-tianshi12127@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lu Chen <tianshi12127@gmail.com>

Document the Smartisan TD4362, a 1080x2242 command mode panel
found in the Smartisan R1 (trident) smartphone.

Signed-off-by: Lu Chen <tianshi12127@gmail.com>
---
 .../display/panel/smartisan,td4362.yaml       | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/smartisan,td4362.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/smartisan,td4362.yaml b/Documentation/devicetree/bindings/display/panel/smartisan,td4362.yaml
new file mode 100644
index 000000000000..a46bc2f53030
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/smartisan,td4362.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/smartisan,td4362.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Smartisan TD4362 MIPI-DSI panel
+
+maintainers:
+  - Lu Chen <tianshi12127@gmail.com>
+
+description:
+  The Smartisan TD4362 is a 1080x2242 command mode panel found in the
+  Smartisan R1 (trident) smartphone.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: smartisan,td4362
+
+  reg:
+    maxItems: 1
+
+  vddio-supply:
+    description: I/O voltage rail
+
+  lab-supply:
+    description: Positive source voltage rail
+
+  ibb-supply:
+    description: Negative source voltage rail
+
+  reset-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - vddio-supply
+  - lab-supply
+  - ibb-supply
+  - reset-gpios
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "smartisan,td4362";
+            reg = <0>;
+            vddio-supply = <&vreg_l14a_1p88>;
+            lab-supply = <&lab>;
+            ibb-supply = <&ibb>;
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+            backlight = <&backlight>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.56.0

