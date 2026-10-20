Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506710;
	b=UikQ4Lqd+mCk/AEXprg1KI3192IHCjR/HII6VCJRJrgHnVfRifXzbNymE6wBf2uyBm8N
	 B56kBzooT1BseLwhrqVGK3dw2qzpg6ocqagjd6RHcpw9rRXfUTfN8uvdaDuijHzL16mG4
	 OXDGs/5C2AAQ0/8um2RXsQgoMyen6wCw9itkj2s+GgrVPEzcl2wV/Eeuj6QlafYH3fdWu
	 MEfkRqYMvcY+QdjZ8+owG37fouP20eUoSSw5H6lw/pDBEUArz8ciLUv9njV//3OOq5S47
	 FZLb+H7TuXtH/qtkZ1vX+1zPbowyZ6pnnXhdoLoX2z8BXjmK/7ajGnybRhrfdv/Js2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506710;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WwZtUrdYtW8MtDYG2yC3ydbDQlF/r6XHSO1vV5BkgeA=;
	b=I1rp0GyHmzWnkK/C4XjuOdoA5U9x5MrvSem9qZBX2bPVJmcWxVRB29+sWIfU39m05xEC
	 sf7iJWXZyMgiGYY/WPvPk3vcoZ+CEI5KVdqXL8s2J7ki0WqfNZ0oRb64q3k/4yluunE+i
	 bdqlg6cRo0HNPGXyWVNL41U/YZUbeCy2JvjE9dYynMNPFVIgd1FgEb6a6vikYTolBzQ6i
	 aLTUJcvJ2fmfsDb44UbO89MaTnIqJkL8rvTCQz0LDwmKHaemlPOQDBJv8Lo1kXJxvI7VQ
	 pjC9JBS27rkGp2WbHNQlt+YXF6Lfn/6e9o72AjWE21LAz6V4leyjW5a4Gx3lkhHz6sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M4tx2k2x;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0361606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0361606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M4tx2k2x
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a06b27bf9bso791716b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792506709; x=1793111509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WwZtUrdYtW8MtDYG2yC3ydbDQlF/r6XHSO1vV5BkgeA=;
        b=M4tx2k2xmNZJMm8m6vMwhs1IRwIr+yzNrp2rpQ+Em5MLK4HkH+geJySjymeetl+A8c
         dlNgIFZW78l8bFnBJ0tkA+lnZhuFzWlXW5f/yC/Z90+f2Sa1eFUDE4xcpNmnS1whNvu2
         jitzNnOWqx8aY30hBu2gQFIo8wTJDrPDExBHFqosVnrVWJmKmRLr/JJjoQSzllu3ofb/
         3UphdECxSAaKqt8pas2w+NmZebFW3zKU/8i+Jv/b6d+YfhxeGCv840GBWLSyHhjRqKEP
         TLw1s4X6zKPkc348Q+a+fHtSViHAsm6a8QE4k5JXnM/gr7XZ6KYW9fvAXGbFjy9S7iHL
         +SEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506709; x=1793111509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WwZtUrdYtW8MtDYG2yC3ydbDQlF/r6XHSO1vV5BkgeA=;
        b=CA3yH4JQS0rCO6sbzgBfqWg2Dv/le8usmKdJxRsjpCum9/TNRU3Wl38VimTATUrcD4
         RHe9XNst84KvhPkXvwtE8rSU76+6Ar1bzS2xEAF1k729vqiBhkFwwhp+p8QTYwIuQHhh
         k7dUcbsuGL4mquGZiiVbNnINROyJQ5Um5GG54IU+A7YI7WsZcjJdfizh8QI6kb1Zkz8f
         qjd54KUsvqDKS5I3nTdSqJ9+XiPPKQqTgMGW8PAi9+lBOCFW+vjJfHsGT1GW+ULdXx+p
         Jst40Treucs2NhWQ8ToesitrWJSzWR+VR3USG0u0khfjNsSyhIISsh+K+miqmJsqzQtz
         bX4g==
X-Forwarded-Encrypted: i=1; AKwUvBxQXOSOHzyEtJF/dKcS2Ovj6q6smydR3xriM/O7Gp0otZUAsGIdQqC0ivdTCCioHbxx0wJ3OHDMeQBBvQ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYILP59/i8DRNJSfYagPJxwbaGie+Gpo/weUmQBJp3U1pYrLgIkk
	XXMWyqBHjKjp/krVYpRXhwup0RqBWWuL2ypgzC6EDBCqPYJ9Gi/XILyd
X-Gm-Gg: AYBFou0KNUXU+cS1AuyiCAhTPq0Qrmd4dfuvfmwhEAGZ1Rg3ZxjNU/0Abqj/1gUnIf8
	mxvzoBnGlYGCTIh9p5GL8LB6kuwEqLGKjgKOdF3zSVv7vgfvcsY+jakr6tnewL5wcmQUxacz4Xn
	ETiKQF+eYwJHgDikMCuq0JVj7lUvU7giBnbZBd1Ul1lqt6GM6hPsarjxklczDss2IEceS+aSJll
	O32kOu2aUyeHDzCKVECL/aWQIH3y9gUK5LCNhkvcdYUygS2CBFMqAyNoClfmPIGa/CpnyVQgsig
	xBGhDNIwOC1W+zEwiDmjIkuZYAXEXwoxsShzYmfKQKssLPG/QDo90Y5GumfRvj7cdDt31oQAdpZ
	FMM1rh53hLGgDlavxCqz4ocp0ES0Qalo7ggmptuDTxgfpcHd2oooq+lmYDuM//Elnp1jqKWyAqe
	KSITF1IMSDoTVgkF8YK+eDvXyHFpMrUCeilkDs49ZQU/edInfubW2y2fE/VBiovwVRdwlVMOfvM
	xBFaAQ/9N9sCzEw8DILhCHggPzAwJMQzQ==
X-Received: by 2002:a05:6a00:4f91:b0:874:705d:f63e with SMTP id d2e1a72fcca58-8a04be20ccfmr8218788b3a.32.1792506709197;
        Tue, 20 Oct 2026 07:31:49 -0700 (PDT)
Received: from arch.localdomain (123202092053.ctinets.com. [123.202.92.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f580173efsm4789001b3a.50.2026.10.20.07.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:31:48 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de,
	Jun Yan <jerrysteve1101@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: sound: add Everest ES7202
Date: Tue, 20 Oct 2026 22:31:31 +0800
Message-ID: <20261020143135.623897-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020143135.623897-1-jerrysteve1101@gmail.com>
References: <20261020143135.623897-1-jerrysteve1101@gmail.com>
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

Add the device-tree bindings for the Everest ES7202, a 2-channel PDM
analog-to-digital converter controlled over I2C.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../bindings/sound/everest,es7202.yaml        | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es7202.yaml

diff --git a/Documentation/devicetree/bindings/sound/everest,es7202.yaml b/Documentation/devicetree/bindings/sound/everest,es7202.yaml
new file mode 100644
index 000000000000..ce98d2d600d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/everest,es7202.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/everest,es7202.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Everest ES7202 2 channel PDM analog to digital converter
+
+maintainers:
+  - Jun Yan <jerrysteve1101@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - everest,es7202
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to the reset pin (active low)
+
+  vdd-supply:
+    description: Main power supply, 1.8 V or 3.3 V. Optional; defaults to 3.3 V
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+allOf:
+  - $ref: dai-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        es7202: codec@30 {
+            compatible = "everest,es7202";
+            reg = <0x30>;
+            #sound-dai-cells = <0>;
+            reset-gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&vcc3v3_sys>;
+        };
+    };
+...
-- 
2.56.0

