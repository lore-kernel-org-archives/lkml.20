Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630957;
	b=i1En8tRPKoXk6aJOZHt6s/8/y6ta9j0xwROUV5N00QetNQu3eFul+hFhxJYz1b3h/TXa
	 jrseqDT25wz2Mrj3aU3AG4Qsr9d+/eht5NupJS+oXa8NJrPgEyjO9RZ4bZNqg0Dwp1pDC
	 ITPRe3YcBbunH8cyQTWa88RCd9dYzOioXuBarCFMo7UU9DBd7gLddqwF5UBKyWoGKzoKz
	 FvnpAgbplAlhibUSrRKdIr9j1VWSDxNfZ0f716llYiQcLpswL/ZArC+qyAjAMXo8Xf0yZ
	 WYI0azAzOgq5xwChFM6Mzjor5e5h0GdNdbYU02Fve+Hxni4Hoi5xeZdTrEAtXMBjL6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Kr/0/zrG6UtXc5ZgGRqIaFx8aSpMlyDXE+9uU4A5XaM=;
	b=aIXVB0fbsYNFXQ+s6x6sxfFDBtfxZ3W7LEBQxprb3jWKXOVqwVVN2AWyTFmF+IjXfVC/
	 pz0IP2Rke2Oe/ofGxHfKhghqhrVA6tz9Tl9fGnY8G4t/ZJtl7yuIj9t77VkRI4KWVtHyW
	 ThL6hT1mgIoNTYtZJisEurJYclNucyZ+GKSxyX+SGTQxOXTG99IBiA/uu4EeP0PoXXLFd
	 AFd+MH8afiSDIEIxPKXIh6hL2hmVAvVsZ79J3D1SrOs6N+J0VnYmJaKJZ1WndHm62F8D3
	 OA9jcblj+eBHtTSOoOBTw7IQUGye8GL0BGlEMvGdpG30ZsA6y7iQ7r8xiMOv7rSLvnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oREFOxJO;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C349606A923
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C349606A923
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oREFOxJO
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so19349825e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793630955; x=1794235755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kr/0/zrG6UtXc5ZgGRqIaFx8aSpMlyDXE+9uU4A5XaM=;
        b=oREFOxJOqklkzH+3vsxfw87Oag2aN3ZulJY6EFhiAI1e2G4CH7fVZ2CT5w0EuEcyPO
         VJq//JRpfAfO6Ye4G4TLPYY4mwh3C+KxBeUgxloH8gbdF4h4gId44mape603XCa+XNxq
         Sg2RsFRYH34nTy5gifsU6sUiFyzpT3vircieAJvF7jIAF1HJfRHBDIYUCkCd5IIjB2de
         wAmtpmpo+3vIrfarfdIfW9m4N/u8KYjlmFTRbp7EcTPmIy3HLqMneUnuYYc/lT4GxM9V
         MUW+6EyHSVts8zmHSipHCTFz4zLNplrZ0vfyMSce3WbXkqovVcY2PDHjfF7teCgkOzrP
         eErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630955; x=1794235755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kr/0/zrG6UtXc5ZgGRqIaFx8aSpMlyDXE+9uU4A5XaM=;
        b=lBf7CLG60NSLuc7Mlwmuyado73HBcRnQZAyMZgHDaslQuBljeHQkA/lek+VwiRRFtm
         j5AfsR4z0kAC6aUNy0RPrVrYGppAxH9zT9mqZ1ABWINEGBVCK7sASLattI4rso1W2AWG
         oiei0C6kMxBGcyQ9HOF/aZfnLVEMugDb87Ju41VFhlbAMNyO9q2U0Z1JWTmyhxfwbBJo
         6Nuw05VdTMfbtCq5BCf+UN6cveANsTRvUPgK5LwfmmeZRF32NGY4NTTiiH0r8X7AJtxQ
         hwSnQBVdtdy5Pf09wwBIXGlkU0/SB8obojuqd5DWzyNpjUcBcgV8MFIf40td4y+/mbK0
         qBeg==
X-Forwarded-Encrypted: i=1; AKwUvBzAR0qtStudnHhwC6/CWn3nWJc/QSIrHNAYz6l+nK4M/8BAAlkPnXM4ZkRp83mEhswJLBAsUQRuKGogDzM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTf8Tet6s3mc5+rRykZLfyIHmgjdvyCtZYu4IFzgzSoeEIyuQu
	ZSm+9mqYpzsSVsG9NrgoK1K/FV15V2br+5WgT6jSCxbh/uLRPrquZCR6JQOmM3eQkeE=
X-Gm-Gg: AYBFou1AuRB3y21GSQacJSUbeR0M6vfsna0fVxO3TOnVmohNupIefvoFl5l8GqIfmhr
	RWpgTBnx1cjuaDNUKhMYs933PuHgJv4i2W+VC1QOleuN8y9I5XbjlXKrfJUjxPN5CJtaK1lkH1c
	S638Y5iDb+BPQWpGFyzk9Qk68osONZ8OgcnjjfVJ4KJT0Xc5knblJfdGbex74sxOgSNjuVruTji
	KgoEmzz0kNnJ3FULcCOvyweIrRPMNqHNO8GjLVsoS433IeJVQ8If6hnwSkoLVGFOgjMZ/fww2c5
	damVhP/Px+FdD8iyVjP3yrNtOSa8xztIEcbaLGB/UpjmP/85CS/Uq9P2rCJw09CVd8h0RwmTKe7
	HkWwdgXWXnTgP4IGGYOZoP6p0iUOjqtSANy3ySV99IbOV9HQSJOb9IY3WyrdkANogT2vtnqOGiO
	1Bk5MhkELgWpO3U8Le8Y7o7yTauyOTVSAx8cNJ+cfCGs/5OrmCj3EWuK900FkGvKDDQ+0MwcM0P
	lxYoOf7P1YeqQ7URimS5TPfsezMlJ9KcPVXqdPDlpcXPSug0XFDPdR0vCXr1CVRyy7MyQp75G86
	wgYZHC91CUvMkd1dCWOU9eElMqth8iWLtldzV5swY4mIf8eWLd0=
X-Received: by 2002:a05:600d:6508:b0:4b0:b9ff:1e7c with SMTP id 5b1f17b1804b1-4b0b9ff2129mr72260095e9.15.1793630954642;
        Mon, 02 Nov 2026 06:49:14 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm447287005e9.3.2026.11.02.06.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:49:14 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 02 Nov 2026 15:49:04 +0100
Subject: [PATCH v5 1/3] dt-bindings: iio: add: document the MAX34417
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
Message-Id: <20261102-topic-sm8x50-iio-max34417-adc-v5-1-0ffa5e5f2d5c@linaro.org>
References: <20261102-topic-sm8x50-iio-max34417-adc-v5-0-0ffa5e5f2d5c@linaro.org>
In-Reply-To: <20261102-topic-sm8x50-iio-max34417-adc-v5-0-0ffa5e5f2d5c@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux@analog.com, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3288;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=9BXhA5fFfLSYVL59KMpAhM28HVLuZn6XWhT8shL3zk8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq6KLntnaZAlA6G0Uo0gZRQkgCqCbNiJaIkMAFRN3L
 v+1aqDeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCauii5wAKCRB33NvayMhJ0cVgD/
 0aZEOzuqhWfVbr/90Pax+VotAkaurQFIqA7IF1pCj7woeV6T9AxCU3sTqQGQ0uP43sHltKBK6rr/3C
 J5ZYBCxfXMphwOqh6eHhG7qk9kkzOoGiCUS9fbxTFRhu4ovUA6rfXttUsVIBYsQhNDVC56GHXUBhAf
 hynTs4R/iyfQKj/P45IvVkS9kODZ8DRn/QwMRqz4GVit1k2X6H847V3vLXZZe4NvWvNQSN9D3u/VwC
 R3pdnkHl44hp4m39DhHCEUKXaBby2WxU6GwCa1CRkiaJceDZsuVC85pAoWyG5NIz6+upyIW6lb2usl
 u2TQ9YYd4a/z3pRuFxvHp7NhOZooSSEJDzXbG42ExT8/u9b8CeNmtjq0IeJ9vRuqjD0GoW7R/8GzUB
 Rpo2LNG10tqy8+zwQpIc3XalsKFGc4JWZvajQB2fPvwZVlON6BH7Ol3IRmaFbN1qTOHYSFc66LBWYY
 CLdC5rg+D+MCOMagxsmZLtfvRZq27Rnc/APTBfLeOO9mG4jUXbmX5R0PCSAaArUD5Z9R1f8v6dplfK
 koajRRTy4h2+S2A9Y3WzT/qmHe64lXF4wYpBJtiI1zhxRta/1AFJDQ+TqMe/fBxgJ6eLdF9jxYAuk2
 iKQXvFblkJ7+SM2uqP7cVlmL8E34i3ObCKnSKYWLGUw6Zfd+mTe0cprjxJWQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Analog Devices MAX34417 Four-Channel High Dynamic Range Power
Accumulator used to monitor power consumption of portable systems.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
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

