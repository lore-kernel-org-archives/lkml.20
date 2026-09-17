Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA704E020D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789680496; cv=none; b=CLeeaml+GghURUjZCDb2dywB8ttK9VfMKp746sR1iTsgWFl9v14CN8e3NBaxNhZvtj1Tj4XEHEWr53n0sRutpI4WCw1KVJBRJlRCxe2Tkb0edPtxzXpY5/GhLsbUA2Gp3TEbBfwxe1BIQvgG/kU5SEi+QIxH939hrUiUJyuFEe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789680496; c=relaxed/simple;
	bh=18SRVwnsAR28xSVXqGmgLVILEzIjVLYd+f+ZrUfMrEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RLzJWv5mxgpGaEhC4OujUGqQ0xrbN2w0AZ5T1u9mAkC37Z/q1GfgrpvwH/U5Eva99/4LmZonv49890UJsysdzsPAJf5M/3J4J4TMhqVsH+B3xQhgYsLeqj88X/FHDnwqFeYRLdE6J8o2wHgHCUwKi9zSiSa7RHONXh/Tgw14a70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=grZ9Jx7Q; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="grZ9Jx7Q"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso820525e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789680492; x=1790285292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UdNOXmL6pOGJYRNkQffneuXoPJ9jf1AzKM8aZVFlRK8=;
        b=grZ9Jx7Q2kYf/LkFmHvifUFMh+EjKYdvuXaLdmFyPPh2PXCtZcbgJXT3NFXTSrTWg+
         BECA5+6ssn/XJ+0FxnLpo05cSKsnVxT+atsyE+PtZiYMDjjl8QN2q02ZYNWFofrgxvDq
         m5Bx85hnQDID76ZQ0lKaSRpdsoiaz3FOaba42eVin6rYeRGeWlfHee8g8iBe5JlnAd5g
         aOrLKMLUSEJjDFinLfjqnDWVCw8C5Ojx3HlOEC8gQWndsPq6LVMsncuWTUGflRDeqKdp
         RySLVYioK/Ws3/O0ZRpJcY8Wm+C1hGw+bYqNP8lugKVz6Z/BkUOVHS0Qcw01vfuT85ON
         E6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789680492; x=1790285292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UdNOXmL6pOGJYRNkQffneuXoPJ9jf1AzKM8aZVFlRK8=;
        b=q/+jVRncVT1ZhPULIy5reogivZg3QAmXsCzERnxHji/+LcPlkuVRkNdRVwIOeFl7Vp
         q1cxL6bUqSiJuR6AGLxTx/WRIpbjy9Sy/vgrf/2McFVqmieOG6+Ftu/F+FxXPMAYTlWp
         HWeeKnJk8oR7/42NnuEEQ6oe9fly1gKw2JVK23ZMOPVTmV82WW1Xily5ymt6zPO+mVj7
         gCM4Gg5e+BNq+PHh4t0ODVk3UFnk/M3Bp9bThKdEMzWLcnt1J3CRbTEVq47UuUeF3qZ6
         SjU1KTB6tOhlCDjEiFXsDJu+I9AGDimMcpy7PyLM2D+8SqFkbx9rHIcPvnA9I0Z5COSo
         cPZg==
X-Forwarded-Encrypted: i=1; AKwUvBz4jAP8l2jq+7gH5iKfeceA+23Gtc1OR+VU2hgQ16Z4Ve0SMkT+6p/7MJ77606dmMAC4yEjH2JSOYUHv3Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lapHD6nmpfEKU60TY7ePj2q86wISZTNGPXz5vipyGKfDZmf2NJ
	NjKmJiNTW1GlgdKnVBwYa+Lx92sF3SNs0lUxMajWnVQh/TjrW7TzGJPu
X-Gm-Gg: AYBFou3z0f+1Vu0UZhOj4AOAC9obtjcv+gXZzd8wod2HyIaIUkZE5c9/KIg5d+/m8pO
	kWF7+ADCoXCk3KhfjwrMWcj9PmHGXG9h8mMWNTypzLFqIvzYq9+8F3tJvrvyqVzpt6z7vZ5ojuQ
	ARy4Zx1hEQEIl1+pNGzog/hIVX5lc1HT+8kfFJ1AvnMC5nHmWif6O3De22z28PRa1Uli452xdOR
	FN/CEsFLia4hwbErev+upeRV/SZ5BsbYl+N6LbufkIRMNHKKXo/HHCCdLUkUq4/sR0yhr/cU42a
	V7MGhWPtZpuxmKhivXS6GeqJagWEyPN6wy/VHkKHvT+LfcVqPhseJQbCp+qbnH9Z5kfKEViJQLL
	7YnqB+i8cXiSzBsHTY4dVUl9Vu6YrwJsf3/fMLJXF+fYEGPcgeZJgSRJEGp3vnFiqL8Q8JGCfVU
	PJMZub4xokpnxc6J4VWPaQFLons+5+agkbiylk2oLT+Rti9Kw9as9fg+k4lJIVyXtE77Iihlcf2
	qywn1X0PwzLc8Y=
X-Received: by 2002:a05:600c:19c6:b0:49c:f4e1:4c2d with SMTP id 5b1f17b1804b1-49fc5741239mr2248305e9.16.1789680491683;
        Thu, 17 Sep 2026 14:28:11 -0700 (PDT)
Received: from localhost.localdomain ([176.220.99.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf37e69sm18148838f8f.29.2026.09.17.14.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:28:11 -0700 (PDT)
From: Omer PALA <palaomer100@gmail.com>
To: nuno.sa@analog.com,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	dlechner@baylibre.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux@analog.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: iio: adc: Add AD7816 binding
Date: Fri, 18 Sep 2026 00:27:51 +0300
Message-ID: <20260917212751.16729-1-palaomer100@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a DeviceTree binding schema for the Analog Devices AD7816
digital temperature sensor. The same schema also covers the
compatible AD7817 and AD7818 variants.

The driver currently lives under drivers/staging/iio/adc/ad7816.c.

Signed-off-by: Omer PALA <palaomer100@gmail.com>
---
 .../bindings/iio/adc/adi,ad7816.yaml          | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml
new file mode 100644
index 000000000..1ffaa4a68
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/adi,ad7816.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices ADC AD7816
+
+maintainers:
+  - Omer PALA <palaomer100@gmail.com>
+
+description: |
+  This schema defines devicetree rules for
+  Analog Devices ADC AD7816
+
+properties:
+  compatible:
+    enum:
+      - adi,ad7816
+      - adi,ad7817
+      - adi,ad7818
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency: true
+
+  interrupts:
+    maxItems: 1
+    description: Base interrupt pin for AD7816
+
+  rdwr-gpios:
+    maxItems: 1
+    description: I/O control pin
+
+  convert-gpios:
+    maxItems: 1
+    description: Conversion start pin
+
+  busy-gpios:
+    maxItems: 1
+    description: Busy pin
+
+required:
+  - compatible
+  - reg
+  - rdwr-gpios
+  - convert-gpios
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - adi,ad7816
+              - adi,ad7817
+
+    then:
+      required:
+        - busy-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      adc@0 {
+        compatible = "adi,ad7816";
+        reg = <0>;
+        spi-max-frequency = <1000000>;
+
+        rdwr-gpios = <&gpio0 1 0>;
+        convert-gpios = <&gpio0 2 0>;
+        busy-gpios = <&gpio0 3 0>;
+      };
+    };
-- 
2.55.0

