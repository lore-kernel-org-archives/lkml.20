Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A3749B5D9
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261661; cv=none; b=fLyLa6CzaoJY4ylza+WCc7CGAoM37lh36Uq7ulbi7eQbbL9+DTC9tKQX8OwkP8SMdePa7KBVvBE7ygV4vorSjCGJv38HUXKBDSB89W7xJTydKcfYQgq3rbBYVRHFkr9Qq7G8pjH9i5BFQBNSYbE4fgkhKkhAhE8hcKNhgFyqKbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261661; c=relaxed/simple;
	bh=OYE7WItiWgT7aoTPr9KMoW9EpIjkWYobs8kb1ygjwOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S/yb4rf5zqAw9yufh/F7WJySCi2eh0X4WU7wLV+cFkr6napHcr4XeQBx+9jTYowUPrqZkCCJdzrxqAlnyJEx9Nn0bBhT1+2VH7QZ01TNMXwCtX/RjCP5SDZk9Be6B0H1LRvSdW4p2y/CWsga8xwlTvNd57+UDM4JvsYusdEoYGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GhmK4Imp; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GhmK4Imp"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd4ef687f5so1281515ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790261655; x=1790866455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NeIicMve7ehJE9aOQQanCJG0U7pMjZjhCXnTq3oHqAM=;
        b=GhmK4ImpJetB+rzhG2QeY+lYhzQ/QcxdxwBuj5tjZ7X0e8fDbn22M+tu4nDLEZ+sKq
         z0dnKNMEPZK7v4fx9IzddwBHqFGKl2l4aLDCFuTZVYT7MwEFP4j/YrlNhKwFeJVfDXld
         uLaOuf6N9ENA4+s2AOqaOQm7isALNwIszuRv0ma+W6vBP9myoJ44pvzwiNw7j9vHO2rL
         u+aV9S/tzq/Q0m5X06wsSd3vBKKtHm3wv+RT+yuGZK/r0zyrJPSvUZAzn1IzrMwFg8j8
         QAsCXEMuGGVjm3Ye2RfpKka+9dficNNOov0+vegNeM7uCs+Q3e2fGNPdKzssthnbYel3
         a8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790261655; x=1790866455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NeIicMve7ehJE9aOQQanCJG0U7pMjZjhCXnTq3oHqAM=;
        b=YtbGkV0GfDQy6Gr+1nzv/p2AQep2iww+rkGEU/DtjVQWVRjsAQbvp6qXQrK6LdoJ8r
         yWAkXq/3H/M7OCEeKw0StIaf6zNxZL0kLl/P/XaY8+obpeT5n7tjNeC1trB2rBEHcWTH
         R+vTRhdHt33hF1vUHhHu0XVLDcDogxdlEYdLJkcLMe9bfnl8m3OU7E4gV0H4Z8IIb5h+
         hohpE5dBMUvtnWjdVSL4c9CW6jpUb22ANTSI2iTKtq0hSe/8ebpW4ul2EvTRNgGO37Gp
         DslZoDWjnAOyQNpUoVj3AY4ZofUYfKlmWk1P+UVRM0r3E1L+tMuEm5+0ZBPk+Qd7zu9E
         J0gg==
X-Forwarded-Encrypted: i=1; AKwUvByvMW7zog6yAAoTPl09SJHHomAfq8oZ6wJ/WceA2DxC0eXg5A0Y6SfHBo148bKtd9P6xJhTQUyxWgxPkv0=@vger.kernel.org
X-Gm-Message-State: AFuF++knfV/y2RzqyYHD2CpbBLUtHDNkPdBD+/TumoMGFAcnBzv3hxtZ
	Vdq9TtBXLwfxSIx8MJ5wTcueTm9nX0qX59p4hsZC4Owz55E+QWhKzrCP
X-Gm-Gg: AYBFou2AIUuYQiGv/HgsprjqhF6no7KEJa+bx+/K3844rwxeE3gEQymWgjDRkLzgxCV
	0xRpIwcmH4f+THhOXliWbkFKydnv7qnidIc1/0maVqeKFbdRuHbO+Vy4Je7JCje4NY49QrlLcwm
	9ShGiPrZ/Be2fonDmIl+hIstwgpbbcXBufB74Os9PzocSG4PliA1FylHvvn3BBearPRqH7swd46
	Guqc9QtqmHFD5byxAKoPYJwoS7rBJ5gOOrXxN+/nTPgw3RbxrXHYXkKwSQvMR82/fuK0EfLpvwE
	IfaRZ7juBLdKEsGxuXxPACqcnLofdI9c01gGdDB2ozGiWINHj0j87eIqbrdGyMtd0/LUGm+i1SA
	VajpV1Sm1ua3WYe4KQMEjQWiS5EKyDudqa1Dn6oijTl+59svkbdSDPQDI4qHgiK775E8ZIef/+g
	Xb7/bBESmerezMJ3SwTthpw7tULYwDPoO+AJorukNmWFlp3q5O/BOobVj+UtpOUhBiJDKMdg==
X-Received: by 2002:a17:902:cf4a:b0:2dd:8b95:d8f6 with SMTP id d9443c01a7336-2df8e574a97mr1721755ad.1.1790261654451;
        Thu, 24 Sep 2026 07:54:14 -0700 (PDT)
Received: from marchy ([2405:3800:9cc:defe:ee8e:77ff:fed4:d18b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5c2f3bsm28750015ad.39.2026.09.24.07.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 07:54:13 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: display: panel: Add RAiO RA8875 display controller
Date: Thu, 24 Sep 2026 22:53:55 +0800
Message-ID: <20260924145400.1385815-2-azuddinadam@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924145400.1385815-1-azuddinadam@gmail.com>
References: <20260924145400.1385815-1-azuddinadam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RA8875 is an SPI-connected TFT display controller by RAiO
Technology Inc. It supports display resolutions of up to 800x480.

Assisted-by: LLM
Signed-off-by: Adam Azuddin <azuddinadam@gmail.com>
---
 .../bindings/display/panel/raio,ra8875.yaml   | 78 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml b/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
new file mode 100644
index 000000000000..b50fd95c5753
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
@@ -0,0 +1,78 @@
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
+  SPI or I2C. This binding describes the SPI-connected device.
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
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel: display@0 {
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

