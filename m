Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870012;
	b=3whtxBg8rN4C3p4V9PpezSUxUzhQW1r0SctyBRsImeS0SfGfb4j+I5wwkq5FeST7q+s3
	 VZWt3XwQcvAULFbducyeBaLuVc7SB6fshc4GPZnc0UaH4xRwTvLzbruNk/Ut1PghTlJUA
	 FZ2ksGYX0EPKmXumDnLdGrnpebFfy+67dq2Jmo8Lf4UGcA0wDEDaQey+YJTkPW+OQJuxt
	 Q76t7KtNZ0QLiX2ooUnMI3jzCeq9bqRP2oIdGmf179WTRL4REcY/RK84UXZ/ayfANJPHt
	 2aTZKYoVkxkcadiE9MQ9iC3dv+iaIsO8BvyzbwFsi+xkCqTp/6i0a6n8pExBN2lC4hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870012;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=PH0YrpSlGVv9qt33Z4Z9rb018oWWfWEr7PktdA631oM=;
	b=byW4WCtCiHp4Vu/6/qWCN9I6eUWNxdFBIoudG3e9VE/BXlPoMJvH3sFgDXLtUl2I0pLm
	 r71ouxMlJmkVmRa5AUe1DD7w3Unfu6yW3h2Omt5AcoSKMLsNecphK9mb1bWoZ76/PxJQZ
	 EVZRKUwkSuhJ8Sy5xs+eYyrU3InoviYAb+uTpFR0SrfUbySCs7456H53jdIKVwK8/1BGE
	 FY/vpLZmGXnhXweVE130c7zirjukMnnJ/lyJeZimitN+C4wKsQZV3mQdjSshR7pEFJS64
	 3xbzQ9OzVeoqDHRkhuX2yCY3dXQQ+ha9D6hEPz7PRXhn1pgjQdaxGFdfkwBSB6J6aXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283DD606A8AC
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 283DD606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b0dba37a7fso37854267b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:00:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870011; x=1795474811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PH0YrpSlGVv9qt33Z4Z9rb018oWWfWEr7PktdA631oM=;
        b=PivCRV9HgN7JpxXiaQpXXzt0wx+32ojA4TA7WmVXGeflAHddtLJWbT3mHYKvGEhq7c
         YJxtGdvzhTy8j8BBw8ovEUv8OYX2OjqEdtJXwkWkAqhEfiJM/kqGAPwxfEg9GyEesTEv
         +h+wsrRXRdT+WXnaj5P3Z2E0fuHFTiKoKX/+LFOYF2RMTDuh974Gk3VutKJl6H2q+/x4
         da9d/SF+1rsbfjnmx892dgGbXQbfLJNntFU359qlyrwQuvkBYwfvzn+Ux1o3VbY8r5mK
         bXWyIZs36NQmof40QphulW897no6aG4M09KLOgGu/k9O8OqmtkAAtIZcFOdBfCG0kn0+
         YN9g==
X-Forwarded-Encrypted: i=1; AL+hErE2PF8MMwVNyprqgEiFXVoPXtyC2nz2NFUQqfaFWpOj654+/lgYHS3JcQtppstOGUYVzEKChGMdKkQttBc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NT5JSWZeEr+PzKxslQXFZl14NRw+KoADLKtLCzkR6TwepFvtT
	FLMswlaH+Fy6X2UpOR8xiJbJHkeONasEefbb6v1bpRM1rL65FPZti7us
X-Gm-Gg: AZFdTZfOX1RKjSG11gCun44MJcmykYLWr7Fd+GC4Qocys73rJET1EWvAeEO0aa0k2VT
	EqZKziq1VckhKsFE/uiywxKeRKZHIZ2bLGJojgyEqtKSnulnvvG787q0OsLt3TjXoF9HLzOqAPv
	qTF2lznWNLqQUrS2/YzvoJt7SL+QF1zFJzhVgY1BBYubLvc7zeEU+/w+S/ro6E5XHzFUK5suycR
	dt4eTT+ns+gRZ3ajNvlGYvG0v18fy46b8WFrNydJmxgRfeS/aFSn2YgXHb1+SbjikDYnoN6T5g1
	6WepzU3f1PXtVUpjlcjLQmZMWlfk+B7mu4IvmjTBqH05ejQBAVqXQnDA9db6XwMIePPtzI1XMus
	B6DyiYYMiY28tzYsV6kPVhKqwIanzurlo8I1l4QPuAPDj/c4PGv9dLYyYzQESt0JfCpPdQDe9or
	IsSEaPi/tamM080QXB4uv89FUzfHodk6DpYKCZF0ZOM3/19QXTtqCWxqqeLpXr94VFEBDzb0inC
	N/Bp5mqco5RHkdxic8NGwkr3hTn2vK/iQi/pDLt4GfK1YH54QeuJ8qmpvEYMSvAsLJvgc2hH6lT
	7pft044DynLCBaPmAOnHPTR3oQ4FVKf7kgKoiKF32MfTOJkH69Gi7Tj3eS6Py2FScUQ0j0se/gL
	Hxsv7o66nj2bZ0V1H7uFCredqauzIFmdbDGrbRHKHeh1PepU9/Y/63g==
X-Received: by 2002:a05:690c:7003:b0:8b4:e2be:7a67 with SMTP id 00721157ae682-8b4e2be8127mr15335447b3.34.1794870011265;
        Mon, 16 Nov 2026 15:00:11 -0800 (PST)
Received: from 1.0.0.127.in-addr.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ebc50e40sm10721347b3.17.2026.11.16.15.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:00:11 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Mon, 16 Nov 2026 17:59:52 -0500
Subject: [PATCH 3/5] dt-bindings: iio: potentiometer: Add Analog Devices
 AD5246
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-iio-ad5246-v1-3-ef6b7c06d4b0@telaak.dev>
References: <20261116-iio-ad5246-v1-0-ef6b7c06d4b0@telaak.dev>
In-Reply-To: <20261116-iio-ad5246-v1-0-ef6b7c06d4b0@telaak.dev>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joseph Telaak <joseph@telaak.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@analog.com, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

The AD5246 is a 128-position digital rheostat on I2C, in 5, 10, 50 and
100 kOhm versions. The compatible names the resistance in kOhm, as for
the AD5272. It uses the same protocol as the MCP4017/18/19, and the
mcp4018 driver supports it, so list the binding with that driver in
MAINTAINERS.

It gets its own binding rather than a trivial-devices entry so that it
can describe its supply and be an IIO channel provider
(#io-channel-cells) for a consumer such as dpot-dac. There is no
fallback to the MCP4017 compatibles: its resistance step is 1/128 of
the end-to-end value, not 1/127.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 .../bindings/iio/potentiometer/adi,ad5246.yaml     | 54 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/potentiometer/adi,ad5246.yaml b/Documentation/devicetree/bindings/iio/potentiometer/adi,ad5246.yaml
new file mode 100644
index 000000000000..a6642746f002
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/potentiometer/adi,ad5246.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/potentiometer/adi,ad5246.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices AD5246 digital rheostat
+
+maintainers:
+  - Joseph Telaak <joseph@telaak.dev>
+
+description: |
+  128-position digital rheostat with an I2C interface. The compatible
+  names the end-to-end resistance in kOhm.
+
+  Datasheet: https://www.analog.com/en/products/ad5246.html
+
+properties:
+  compatible:
+    enum:
+      - adi,ad5246-005
+      - adi,ad5246-010
+      - adi,ad5246-050
+      - adi,ad5246-100
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+
+  "#io-channel-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        potentiometer@2e {
+            compatible = "adi,ad5246-010";
+            reg = <0x2e>;
+            vdd-supply = <&reg_3v3>;
+            #io-channel-cells = <0>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 9cb91ee8a56d..81069fdbd778 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16680,6 +16680,7 @@ MCP4018 AND MCP4531 MICROCHIP DIGITAL POTENTIOMETER DRIVERS
 M:	Peter Rosin <peda@lysator.liu.se>
 L:	linux-iio@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/iio/potentiometer/adi,ad5246.yaml
 F:	drivers/iio/potentiometer/mcp4018.c
 F:	drivers/iio/potentiometer/mcp4531.c
 

-- 
Git-155)

