Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193553;
	b=hbfee/45axk5FccL6fgz5m35o71CLUH44NIw5S3QnfgEd6/3cQEx2bLNUR6/KH/feDV/
	 uPMbjqeFr9OxSYwVj+uzCCEYwHgs0mCTWLAG4BYJvYOMxikXmVEx/b+aDQkODqqYTHi3M
	 T3Pbe5btVyuqtcKrR8/FSkPV98BX0hPt851yHe3M5sIg3AVIKT7o9ms8RcqTU0ef78GgM
	 LyvLswyuBjbWxlO2ORwWRTKi8jPFlEw3riBx97bI/nBK2IOE0ydJNgiL+wpYXUqZjeYT8
	 TBiEZpDNM5P298ypE+nrtyH+LiLmcicEpyRzKNEZP57mUkfNbclj7y5jn0DO890icRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=d0Sz3wE6QuJRsVQAlMgQ2PeGgkq4aSJ2LFCV4qd304c=;
	b=H5lwLy8M4jO+LSPY6Gu7frWLw0aHY7gW8eBgIRrEtFaU2gBiCGmVjmk6Gzhe52GDKhCY
	 PahoF1Q2KNZW6mWwSGfKx/gPKB4FpmeI1XXoNjT4/702Nb4caUqsB0frD8rssIhFyzbdW
	 RbHLvTmdBTrQp7ME95Rz8qd47j22CH/p/RDTxApTXkf9RAp1pdA8SB90ztIKJdQYzzFga
	 M5WaXc7S62Jgnl/fhp6CsGStR5ifMw4hx1wRvk7tmogYTwAEHRVGVMzDMw4VWNy/Nm/my
	 88jDLP8wm7rbskom4FePWoJo9Dpb8kEUGC7nlbU+TlAyOclEabT1QpySxWgQTE2637A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HJc0yrtO;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66F4606A325
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D66F4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HJc0yrtO
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so8910425e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793193551; x=1793798351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0Sz3wE6QuJRsVQAlMgQ2PeGgkq4aSJ2LFCV4qd304c=;
        b=HJc0yrtOqjbAhVJPBUbe68xiHKHMVyPjwJWvrg+NEZOLFpaJeUngo/PBOA1K7ON2HG
         oFPSx4moojlAeVt1txdMMJV6jLvVl505T46EqDmNVJsHNvxSjc+XOJwrIkjCe0lH6PjN
         NU1CFiKsHXVeBgkhvGafZf4I9Bg0KJvUnHl9drGWppuWe/aQsRX0QOhSs0Lqm8umemQ9
         l1qDgN24sBTzU/iji5UPLufHdNi/kX8RxXJMoxZlgjG/Y71WGMEuN+Tc5ldsVTV7hhqz
         V0yEXHS+//ciVFEMAxArCIwvkxVxY/Rak1Z/WKBFXCORbY2Ige0jJ46gglet1WUX1Esn
         xRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193551; x=1793798351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0Sz3wE6QuJRsVQAlMgQ2PeGgkq4aSJ2LFCV4qd304c=;
        b=Udi6KT09cHXHbHgdMxLAIDLFGk6/0HEjNd+XhFZxSn8g9DAyf4mV1bBceoLGsaRpHv
         YW9MmlEvcX/fozw7g/4+z00/blZJZWxHM8Z8Drqk+PINH8rgnGvxvexratL6iwXBkrZh
         5nDqe0R4lcQoz8u3ADhMjQBXdcNi2zL9SkID/Pg8SMILiixQmoUobt0RrBEux3oJDELL
         7rvX25aT7XOHZH7NC61eOaHzqZCH56BrcAxDQ9o82IBlvcnnvd9mjNyl9l4HiX0EajIY
         IaLf0fxwMLTr7mnnIScVsuUGGlloPma7aTBgoJ098lWOYWXZKKUhS/09BW3zjsgZK6Dn
         mgqg==
X-Forwarded-Encrypted: i=1; AKwUvBxVyJAbg0MrggIU6QRzyJ4Wz6wJduhudsUF++IrFvjohxMQ1EnuRMswfeJH/RAsva0uyy5vC16Jjn89Icc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEM6DFDe5MCynSRpxqfElgsNdbe4dZ2FJKlN5fu1JYAXbts5np
	xWYk9W17e1nV/ZrWRPg5SCze/ADEy51n24y+MFnewRyXDKeh0pTTOwzYPpjXoB7gViA=
X-Gm-Gg: AYBFou2HP3Z+w6j6IXnK4Wqp0DnPk5Sdh6Mv9+tboOwjsBkNvDGsZTchLYlu5P/1n8J
	91IPESOjwngLdVjGn4p9DyDUK8qeKWWOlybvdl0dwVEPlAeqzIh4NTHPyZEkKwimeRBPpM0obXe
	b1BK9H3tTwsCAuHbxvw/XoLWKS/qgi5LP2o+8F/lTUlKkkCMs6Id6NUmayCqaVE11macDGvWBNF
	QAH+QMi3pxG1uNm2C3jyacyYT2ZTDE1mMdyHHc6kdQN76stA8Ev9s9tIbnUtBlTKrI41uzq8iov
	EiQd1Q1cd1WY9PHGupa6qzqV5PvlzHPDWUBINwIj++HqLzUKDFTbPoOizj5HSkMaHEKkl8OM6pY
	nynUOD292Ir3XmOq4YeZcvhTr2/gTpSfxjLoCNrQfALWf7cq0jJ6vRCUJ/ziidvnBRYSEJmIB8M
	bW4GsJPEHf4WiiMXEpeQyukF0p/8m6pRQ0A/X7VNZ6N0STUT1x5YnlVeFta4sh8DDnLd/ooL3Cs
	P0vNZTYbya184aBLAYhBP1T4ZQRoc8H6c2BiZCwdQD0hWXOIg45VU3+jB3xX8aIa0DyXC02GnpH
	Ap7Fq5eN1PnSfgOdtc0nO74l3up3RlYy6wiXK4bPAf0D7tQ77Y8AY1w55tWwkZHPeA==
X-Received: by 2002:a05:600c:870f:b0:4a1:fcfa:2a07 with SMTP id 5b1f17b1804b1-4a967f84822mr55295305e9.30.1793193551156;
        Wed, 28 Oct 2026 06:19:11 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a996aa0ff3sm19869395e9.1.2026.10.28.06.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:19:10 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 28 Oct 2026 14:19:04 +0100
Subject: [PATCH v4 1/3] dt-bindings: iio: add: document the MAX34417
 Four-Channel High Dynamic Range Power Accumulator
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
Message-Id: <20261028-topic-sm8x50-iio-max34417-adc-v4-1-d4baaf3ee903@linaro.org>
References: <20261028-topic-sm8x50-iio-max34417-adc-v4-0-d4baaf3ee903@linaro.org>
In-Reply-To: <20261028-topic-sm8x50-iio-max34417-adc-v4-0-d4baaf3ee903@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux@analog.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3235;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=HnCShVki22tZbqn46h/iPHVXxPadylCsM2+tjvBCgiQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq4fZKRr6JwY/iebIoucSTFldZ3DdxsAChjXroki8b
 gzEYQHWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCauH2SgAKCRB33NvayMhJ0TI6D/
 91xB3UKBAZq/XHax44a6GmhnSkgTvPW2KdvhExSgE3/JMSRo8U5cpfscUo4l7cZuc5gfJRnGy1Z2P6
 z53UJtXg7+yU4JRHSabvXrrqAniLrdpq0izvrGal37xWtMfJcY4eVWVKGeCnK/XzJo3ovwOZhwTUtY
 DGcA1NpxGls0xBEvUeC1uZ8Qd5dYHl/nNXmWWuIEqM02wZwyYa3F9dKcjFOy+83gG5fwU8Jj+qtaKp
 ZgkyDIZhWhsAi3EB4bpGu3PA7BFXlqMlJ4Hm9doyCTpWhWSBZj3R2SsbiK2p40x317cEymQl3tsx92
 OvumhoIMMPRcAQRqa7+udpdtvR9UuS6cKq80uKHcFVIvD4JjL/Xgk5NbmpN0XkLFc6sC7pJe10oShn
 hhDJAa+z3zJcRDj7zwf3Hu4LBoaCAqLDr/xueeWLx2SraAl6R8YL+J9I2HhrjiUS1cde7G8G1cjsxz
 PzaLr4rYcMThg2zcDVN3ICIG1j1NX7Y2gmh6A1wdRVCCKBUM+z9cgj6df9D2Lwu/BEOSwQKSidP7xg
 cLGvVRbJ8EF8gUPPQ3mBOal76wccdkeBLCppyMpQzvnAQK1WdYzRst0bPwLmKLhgw1/CyzHcFwebXp
 oq4xfz6w5POzO32DNiH2DBI8TSCVLAp3j58xeZmqgWBNwlh/krYrYnk7tBRw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Analog Devices MAX34417 Four-Channel High Dynamic Range Power
Accumulator used to monitor power consumption of portable systems.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/iio/adc/adi,max34417.yaml  | 103 +++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,max34417.yaml b/Documentation/devicetree/bindings/iio/adc/adi,max34417.yaml
new file mode 100644
index 000000000000..700bc3ca7d7c
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/adi,max34417.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/adi,max34417.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices MAX34417 Four-Channel High Dynamic Range Power Accumulator
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description: |
+  The MAX34417 is a specialized current and voltage monitor used to determine
+  power consumption of portable systems. The device has a very wide dynamic
+  range (20,000:1) that allows for the accurate measurement of power in such
+  systems. The device is configured and monitored with a standard I2C/SMBus
+  serial interface. The unidirectional current sensor offers precision
+  high-side operation with a low full-scale sense voltage.
+
+  Specifications about the device can be found at:
+  https://www.analog.com/media/en/technical-documentation/data-sheets/max34417.pdf
+
+properties:
+  compatible:
+    const: adi,max34417
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  vdd-supply: true
+  vio-supply: true
+
+patternProperties:
+  "^channel@[0-3]$":
+    $ref: adc.yaml
+    type: object
+    description:
+      Represents the internal channels of the sensor.
+
+    properties:
+      reg:
+        items:
+          - minimum: 0
+            maximum: 3
+
+      shunt-resistor-micro-ohms:
+        description:
+          Value in micro Ohms of the shunt resistor connected between the RS+ and RS- inputs.
+        minimum: 1000
+        maximum: 100000
+        default: 1000
+
+    required:
+      - reg
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+  - vio-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@10 {
+              compatible = "adi,max34417";
+              reg = <0x10>;
+
+              vdd-supply = <&max34417_vdd>;
+              vio-supply = <&max34417_vio>;
+
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              channel@0 {
+                  reg = <0>;
+                  label = "ch0";
+                  shunt-resistor-micro-ohms = <5000>;
+              };
+
+              channel@1 {
+                  reg = <1>;
+                  label = "ch1";
+             };
+
+              channel@2 {
+                  reg = <2>;
+             };
+        };
+    };

-- 
2.34.1

