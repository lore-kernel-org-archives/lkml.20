Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9214AA59E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404263; cv=none; b=iEf1kbiVSHkT/vxgmrB3RkeTCwbijzCh1/6yrTcl54toZ7VgB+X6orTMvnmezyjZCbHGVik0Ha0G1Gn6zmn0gLbA2d+gOvuPBACrkk2S3Ls4FetHzFZXwVNpcqaxVk1vnPZRgpd/uZsOq9BLuEsLDJT58dO+LEKlIo0h4NHVc7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404263; c=relaxed/simple;
	bh=0ir6EEm9FNQCLp9OUbkjQzJH24SRp6mnaINdn/CT2yM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ABu64CoXiBNPPm0ypFjbwM+l1mMojdOSkyu8r3Ta1i/4DQGjLJ3q9qxtf/Z74zDebMrbVeuXiKwA5J/VDKFmp+X3+Xf022cMEd7QlZsJHW23l3mqgvyUV0e/OeO3X8RYr9aJrW7HEg2uV4JBrnvaJVN4gRxoV+g3SlzzdCnFrMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rABZifdL; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rABZifdL"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1d484b4a9so25810945e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792404260; x=1793009060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y460qay5LS+R/33REWXsFlmhxRCfcVfcAqdFzdNEv44=;
        b=rABZifdLa7+QGoQG+sPcmcgRrz5Gg5wUX8ktsRm6gpsNYz6j8d+pDrtoIn1AbCBPMj
         bbTDYf8T3zki1HlGBViNsZiOQ8aabJf6cPuQLhfCIy2sWD8e8acRVh/HB2tA1eOpBSOT
         46WYGlVqKyZ2Zhsdr44+RrUY0x3eua+s13bLdZzm3FLZaGBl+vKIBgd9sDfyLpqwt5lY
         sf864dVMyJu5/mByQyFTtclmtTwOW/tR9DJ53ioEvGAVO2nopYubZU87T6QrCSBVkkHu
         wwFLJss/tCxIqn4Teq4kFtAUTu9O+X+WlPuqG6Efungf9wIwPpJ63Okjyih09dojf9Gl
         SGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792404260; x=1793009060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y460qay5LS+R/33REWXsFlmhxRCfcVfcAqdFzdNEv44=;
        b=CLgCA07ossVIoGZ9OSjsna8kq9d567LdBbU5UmPxy/pRIRgcI6aXYsceaAVTt+vWEi
         IsgcSeagFha/DdhBu2jZuAbLqhU9dwH+jKWfuj85zXDuG2IOJZD+Ha9OI87hIgdXTHEb
         l9aqHRfDz9P2xhOJRXh9X1UyAzAu7flmFV/8PfDghumjHhoQkE0ATOBXqRN7Oc+biUfv
         HBMR1AnSHPMJ8KpUB2rPDhkbAQ+vn3Tog+y3aXMwGmtgchRQo1qLZ+1o9Z0dYGyd1yeR
         4tKFpR9pOqtT9cd5OZAU0TuuGbX77sk46fBMrgNP3TQOiwlx9TZtkwIclwVyfpVXdq3v
         Kouw==
X-Forwarded-Encrypted: i=1; AKwUvBzQX+aOtuWq+tjQmHmD58D46vHQ3VFTeovsKMoYm9Ul8G/mctowEbPruVDuDrWyMFjcixHxldfqFGsVjDI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaMSbXTXuaBnMnN6366wGnTPu4c3u8hHHmMXbv85doKHOZ4kSp
	N5oJEN37jCsV6vsridMGgANHG8k2MIc3qK3PsaKyUQDZFP9uA4LD2UHq
X-Gm-Gg: AYBFou3g0hJ0G08zIQ0aEuChcIx1VIPQ4CSh5Wt3a2yRyNp70hXNnSC04+Psap15X0D
	kLSD+JWMy/E2OvJqENyEcsGUC1YYj/OozNmgV8wOxyyb87/LXT/G75gSZ2eAtfhaxzd/9elPg4R
	fHDK+EqqwYvhPNPC6BhZGLGLkcfXBglHRotvd84OKdCe6gRkOsQJsIyC97P+JA94zYsrjs3wrTy
	drGoZnUGZbUFao6V/eBbCsY0MhOz5ADnbO4X2MKtK0JXvFoKk6kjXVXn/978vJlTlX3EWlFFGcK
	QKVKNcHrEDnlPQnWN9F8xHjbjsod66xC20Y9lUqueDNiqPD3b8J7QrV6mNinD+J5INjAlXW97sk
	REDLd3UJvoi9/BQ6VMwQbR7Dk6/PhVW485MIpzgrsx2Pyd1zX0Tz5DgFHuC0/NVIITeOM7oF5fh
	3fhN3pYumQTkn5KnpMiNvCs+6K2DjpJ5lK21KlQntoy/+mLaxncbt5+etcW+0OF1qGnITmJijnd
	D+SSqpQD6k48JfdsKM=
X-Received: by 2002:a05:600c:8b28:b0:4a1:6c0c:ab93 with SMTP id 5b1f17b1804b1-4a1d7634d5dmr157311995e9.28.1792404259520;
        Mon, 19 Oct 2026 03:04:19 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1df164777sm177811485e9.5.2026.10.19.03.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:04:18 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
	Florian Krischer <florian.krischer@fkr.dev>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v12 1/7] dt-bindings: embedded-controller: document ASUS Transformer EC
Date: Mon, 19 Oct 2026 13:04:00 +0300
Message-ID: <20261019100406.103687-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019100406.103687-1-clamor95@gmail.com>
References: <20261019100406.103687-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document embedded controller used in ASUS Transformer device series.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../asus,tf201-ec-pad.yaml                    | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml

diff --git a/Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml b/Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml
new file mode 100644
index 0000000000000..60b6375864aaf
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/asus,tf201-ec-pad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASUS Transformer's Embedded Controller
+
+description:
+  Several Nuvoton based Embedded Controllers attached to an I2C bus,
+  running a custom ASUS firmware, specific to the ASUS Transformer
+  device series.
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    description:
+      The 'pad' suffix is used for the controller within the tablet, while
+      the 'dock' suffix refers to the controller in the mobile dock keyboard.
+    oneOf:
+      - enum:
+          - asus,sl101-ec-dock
+          - asus,tf101-ec-dock
+          - asus,tf201-ec-pad
+          - asus,tf600t-ec-dock
+          - asus,tf600t-ec-pad
+
+      - items:
+          - enum:
+              - asus,tf101g-ec-dock
+              - asus,tf201-ec-dock
+              - asus,tf300t-ec-dock
+              - asus,tf300tg-ec-dock
+              - asus,tf300tl-ec-dock
+              - asus,tf700t-ec-dock
+          - const: asus,tf101-ec-dock
+
+      - items:
+          - enum:
+              - asus,tf300t-ec-pad
+              - asus,tf300tg-ec-pad
+              - asus,tf300tl-ec-pad
+              - asus,tf700t-ec-pad
+          - const: asus,tf201-ec-pad
+
+      - items:
+          - enum:
+              - asus,tf701t-ec-dock
+          - const: asus,tf600t-ec-dock
+
+      - items:
+          - enum:
+              - asus,p1801-t-ec-pad
+              - asus,tf701t-ec-pad
+          - const: asus,tf600t-ec-pad
+
+  reg:
+    description:
+      The ASUS Transformer EC has a main I2C address and an associated
+      DockRAM device, which provides power-related functions for the
+      embedded controller. Both addresses are required for operation.
+    minItems: 2
+
+  reg-names:
+    items:
+      - const: ec
+      - const: dockram
+
+  interrupts:
+    maxItems: 1
+
+  request-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+allOf:
+  - $ref: /schemas/power/supply/power-supply.yaml
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: asus,tf600t-ec-dock
+    then:
+      required:
+        - interrupts
+        - request-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      embedded-controller@19 {
+        compatible = "asus,tf201-ec-dock", "asus,tf101-ec-dock";
+        reg = <0x19>, <0x1b>;
+        reg-names = "ec", "dockram";
+
+        interrupt-parent = <&gpio>;
+        interrupts = <151 IRQ_TYPE_LEVEL_LOW>;
+
+        request-gpios = <&gpio 134 GPIO_ACTIVE_LOW>;
+
+        monitored-battery = <&dock_battery>;
+      };
+    };
+...
-- 
2.53.0

